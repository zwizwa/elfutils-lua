#!/bin/sh
# Note that currently development is done in uc_tools.
# This repository is just a wrapper for convenient packaging.
set -e
UC_TOOLS=/i/exo/uc_tools
for file in \
uc_tools_config.h \
macros.h \
gensym.h \
os_linux.h \
linux/elfutils_lua51.c \
linux/elfutils_tags.h \
lua/lib/elfutils.lua; do
    here_file=$(basename $file)
    echo $here_file
    cp -a $UC_TOOLS/$file .
    git add $here_file
done
# try to build it
gcc -c elfutils_lua51.c -I/usr/include/lua5.1
