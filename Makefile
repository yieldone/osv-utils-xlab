CFLAGS = -Wall -Wextra
CXXFLAGS = $(CFLAGS)

GCC=gcc $(CFLAGS) -ggdb -pthread
GCCSO=$(GCC) -fPIC -shared
CPP=g++ $(CXXFLAGS) -ggdb -pthread -std=c++0x
CPPSO=$(CPP) -fPIC -shared

EXEC=cd cd.so
EXEC+=sleep sleep.so
EXEC+=cat cat.so
EXEC+=echo echo.so
EXEC+=template template.so
EXEC+=showenv showenv.so

all: $(EXEC)

.PHONY: module
module: all

clean:
	/bin/rm -f $(EXEC)

%: %.c
	$(CPP) -o $@ $<
%.so: %.c
	$(CPPSO) -o $@ $<
