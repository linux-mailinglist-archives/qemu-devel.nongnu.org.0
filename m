Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2835A291289
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Oct 2020 16:51:52 +0200 (CEST)
Received: from localhost ([::1]:43386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTnYl-0006ax-65
	for lists+qemu-devel@lfdr.de; Sat, 17 Oct 2020 10:51:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kTnVJ-0004LB-JE
 for qemu-devel@nongnu.org; Sat, 17 Oct 2020 10:48:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kTnVF-0000Ni-Fv
 for qemu-devel@nongnu.org; Sat, 17 Oct 2020 10:48:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602946092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RjK6EZL8tj4zHuJfdBmv1lnCRJIne5SsBCuf9edRiEY=;
 b=NxVRl5uryIsje4coYH51/61Cqk/9Ro2HhBtX+VkKt3/i9hJzCsuBfeCW2aR8nRNAk/3ULX
 vi+2ky85XWCGbB9J3DVsydagwd1smt0KVPYF7YB/u/O6qIOZEE7E8D2Qq8xA2PxLbD/IC2
 j0g+fFxAn5blGVYAjL+zfV1t4aQ0T1s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-cbE3XXPUNfydjzO5JNTukw-1; Sat, 17 Oct 2020 10:48:09 -0400
X-MC-Unique: cbE3XXPUNfydjzO5JNTukw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 102D5801A9D
 for <qemu-devel@nongnu.org>; Sat, 17 Oct 2020 14:48:08 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C680C6EF52
 for <qemu-devel@nongnu.org>; Sat, 17 Oct 2020 14:48:07 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/22] build: replace ninjatool with ninja
Date: Sat, 17 Oct 2020 10:48:05 -0400
Message-Id: <20201017144805.1641371-3-pbonzini@redhat.com>
In-Reply-To: <20201017144805.1641371-1-pbonzini@redhat.com>
References: <20201017144805.1641371-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/17 05:57:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_OTHER_BAD_TLD=1.999, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that the build is done entirely by Meson, there is no need
to keep the Makefile conversion.  Instead, we can ask Ninja about
the targets it exposes and forward them.

The main advantages are, from smallest to largest:

- reducing the possible namespace pollution within the Makefile

- removal of a relatively large Python program

- faster build because parsing Makefile.ninja is slower than
parsing build.ninja; and faster build after Meson runs because
we do not have to generate Makefile.ninja.

- tracking of command lines, which provides more accurate rebuilds

In addition the change removes the requirement for GNU make 3.82, which
was annoying on Mac, and avoids bugs on Windows due to ninjatool not
knowing how to convert Windows escapes to POSIX escapes.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile                    |   80 +--
 configure                   |    9 +-
 docs/devel/build-system.rst |    6 +-
 meson.build                 |    4 -
 scripts/mtest2make.py       |    3 +-
 scripts/ninjatool.py        | 1008 -----------------------------------
 tests/Makefile.include      |    2 +-
 7 files changed, 59 insertions(+), 1053 deletions(-)
 delete mode 100755 scripts/ninjatool.py

diff --git a/Makefile b/Makefile
index 53d624a0be..18f026eac3 100644
--- a/Makefile
+++ b/Makefile
@@ -72,27 +72,8 @@ git-submodule-update:
 endif
 endif
 
-export NINJA=./ninjatool
+# 0. ensure the build tree is okay
 
-# Running meson regenerates both build.ninja and ninjatool, and that is
-# enough to prime the rest of the build.
-ninjatool: build.ninja
-
-Makefile.ninja: build.ninja ninjatool
-	./ninjatool -t ninja2make --omit clean dist uninstall cscope TAGS ctags < $< > $@
--include Makefile.ninja
-
-${ninja-targets-c_COMPILER} ${ninja-targets-cpp_COMPILER}: .var.command += -MP
-
-# If MESON is empty, the rule will be re-evaluated after Makefiles are
-# reread (and MESON won't be empty anymore).
-ifneq ($(MESON),)
-Makefile.mtest: build.ninja scripts/mtest2make.py
-	$(MESON) introspect --targets --tests --benchmarks | $(PYTHON) scripts/mtest2make.py > $@
--include Makefile.mtest
-endif
-
-# Ensure the build tree is okay.
 # Check that we're not trying to do an out-of-tree build from
 # a tree that's been used for an in-tree build.
 ifneq ($(realpath $(SRC_PATH)),$(realpath .))
@@ -117,6 +98,7 @@ ifeq ($(wildcard build.ninja),)
 x := $(shell rm -rf meson-private meson-info meson-logs)
 endif
 
+# 1. ensure config-host.mak is up-to-date
 config-host.mak: $(SRC_PATH)/configure $(SRC_PATH)/pc-bios $(SRC_PATH)/VERSION
 	@echo $@ is out-of-date, running configure
 	@if test -f meson-private/coredata.dat; then \
@@ -125,6 +107,46 @@ config-host.mak: $(SRC_PATH)/configure $(SRC_PATH)/pc-bios $(SRC_PATH)/VERSION
 	  ./config.status; \
 	fi
 
+# 2. ensure generated build files are up-to-date
+
+ifneq ($(NINJA),)
+# A separate rule is needed for Makefile dependencies to avoid -n
+export NINJA
+Makefile.ninja: build.ninja
+	$(quiet-@){ echo 'ninja-targets = \'; $(NINJA) -t targets all | sed 's/:.*//; $$!s/$$/ \\/'; } > $@
+-include Makefile.ninja
+endif
+
+ifneq ($(MESON),)
+# The dependency on config-host.mak ensures that meson has run
+Makefile.mtest: build.ninja scripts/mtest2make.py config-host.mak
+	$(MESON) introspect --targets --tests --benchmarks | $(PYTHON) scripts/mtest2make.py > $@
+-include Makefile.mtest
+endif
+
+# 3. Rules to bridge to other makefiles
+
+ifneq ($(NINJA),)
+NINJAFLAGS = $(if $V,-v,) \
+        $(filter-out -j, $(lastword -j1 $(filter -l% -j%, $(MAKEFLAGS)))) \
+        $(subst -k, -k0, $(filter -n -k,$(MAKEFLAGS)))
+
+ninja-cmd-goals = $(or $(MAKECMDGOALS), all)
+ninja-cmd-goals += $(foreach t, $(.tests), $(.test.deps.$t))
+
+makefile-targets := build.ninja ctags TAGS cscope dist clean uninstall
+ninja-targets := $(filter-out $(makefile-targets), $(ninja-targets))
+.PHONY: $(ninja-targets) run-ninja
+$(ninja-targets): run-ninja
+
+# Use "| cat" to give Ninja a more "make-y" output.  Use "+" to bypass the
+# --output-sync line.
+run-ninja: config-host.mak
+ifneq ($(filter $(ninja-targets), $(ninja-cmd-goals)),)
+	+@$(NINJA) $(NINJAFLAGS) $(sort $(filter $(ninja-targets), $(ninja-cmd-goals))) | cat
+endif
+endif
+
 # Force configure to re-run if the API symbols are updated
 ifeq ($(CONFIG_PLUGIN),y)
 config-host.mak: $(SRC_PATH)/plugins/qemu-plugins.symbols
@@ -144,13 +166,6 @@ ifneq ($(filter-out $(UNCHECKED_GOALS),$(MAKECMDGOALS)),$(if $(MAKECMDGOALS),,fa
 endif
 endif # config-host.mak does not exist
 
-# Only needed in case Makefile.ninja does not exist.
-.PHONY: ninja-clean ninja-distclean clean-ctlist
-clean-ctlist:
-ninja-clean::
-ninja-distclean::
-build.ninja: config-host.mak
-
 SUBDIR_MAKEFLAGS=$(if $(V),,--no-print-directory --quiet)
 
 include $(SRC_PATH)/tests/Makefile.include
@@ -170,8 +185,9 @@ recurse-clean: $(addsuffix /clean, $(ROM_DIRS))
 
 ######################################################################
 
-clean: recurse-clean ninja-clean clean-ctlist
-	if test -f ninjatool; then ./ninjatool $(if $(V),-v,) -t clean; fi
+clean: recurse-clean
+	-@test -f build.ninja && $(quiet-@)$(NINJA) $(NINJAFLAGS) -t clean || :
+	-@test -f build.ninja && $(NINJA) $(NINJAFLAGS) clean-ctlist || :
 # avoid old build problems by removing potentially incorrect old files
 	rm -f config.mak op-i386.h opc-i386.h gen-op-i386.h op-arm.h opc-arm.h gen-op-arm.h
 	find . \( -name '*.so' -o -name '*.dll' -o -name '*.[oda]' \) -type f \
@@ -188,8 +204,8 @@ dist: qemu-$(VERSION).tar.bz2
 qemu-%.tar.bz2:
 	$(SRC_PATH)/scripts/make-release "$(SRC_PATH)" "$(patsubst qemu-%.tar.bz2,%,$@)"
 
-distclean: clean ninja-distclean
-	-test -f ninjatool && ./ninjatool $(if $(V),-v,) -t clean -g
+distclean: clean
+	-@test -f build.ninja && $(quiet-@)$(NINJA) $(NINJAFLAGS) -t clean -g || :
 	rm -f config-host.mak config-host.h*
 	rm -f tests/tcg/config-*.mak
 	rm -f config-all-disas.mak config.status
@@ -198,7 +214,7 @@ distclean: clean ninja-distclean
 	rm -f qemu-plugins-ld.symbols qemu-plugins-ld64.symbols
 	rm -f *-config-target.h *-config-devices.mak *-config-devices.h
 	rm -rf meson-private meson-logs meson-info compile_commands.json
-	rm -f Makefile.ninja ninjatool ninjatool.stamp Makefile.mtest
+	rm -f Makefile.ninja Makefile.mtest
 	rm -f config.log
 	rm -f linux-headers/asm
 	rm -Rf .sdk
diff --git a/configure b/configure
index 3bb5de40d6..483c9ec322 100755
--- a/configure
+++ b/configure
@@ -1905,7 +1905,7 @@ case "$meson" in
     *) meson=$(command -v "$meson") ;;
 esac
 
-# Probe for ninja (used for compdb)
+# Probe for ninja
 
 if test -z "$ninja"; then
     for c in ninja ninja-build samu; do
@@ -1914,6 +1914,9 @@ if test -z "$ninja"; then
             break
         fi
     done
+    if test -z "$ninja"; then
+      error_exit "Cannot find Ninja"
+    fi
 fi
 
 # Check that the C compiler works. Doing this here before testing
@@ -6779,6 +6782,7 @@ echo "PYTHON=$python" >> $config_host_mak
 echo "SPHINX_BUILD=$sphinx_build" >> $config_host_mak
 echo "GENISOIMAGE=$genisoimage" >> $config_host_mak
 echo "MESON=$meson" >> $config_host_mak
+echo "NINJA=$ninja" >> $config_host_mak
 echo "CC=$cc" >> $config_host_mak
 if $iasl -h > /dev/null 2>&1; then
   echo "CONFIG_IASL=$iasl" >> $config_host_mak
@@ -7030,7 +7034,7 @@ fi
 mv $cross config-meson.cross
 
 rm -rf meson-private meson-info meson-logs
-NINJA=${ninja:-$PWD/ninjatool} $meson setup \
+NINJA=$ninja $meson setup \
         --prefix "$prefix" \
         --libdir "$libdir" \
         --libexecdir "$libexecdir" \
@@ -7063,7 +7067,6 @@ NINJA=${ninja:-$PWD/ninjatool} $meson setup \
 if test "$?" -ne 0 ; then
     error_exit "meson setup failed"
 fi
-touch ninjatool.stamp
 fi
 
 if test -n "${deprecated_features}"; then
diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
index 2ee368fad6..6fcf8854b7 100644
--- a/docs/devel/build-system.rst
+++ b/docs/devel/build-system.rst
@@ -404,10 +404,8 @@ Built by Meson:
 Built by Makefile:
 
 `Makefile.ninja`
-  A Makefile conversion of the build rules in build.ninja.  The conversion
-  is straightforward and, were it necessary to debug the rules produced
-  by Meson, it should be enough to look at build.ninja.  The conversion
-  is performed by scripts/ninjatool.py.
+  A Makefile include that bridges to ninja for the actual build.  The
+  Makefile is mostly a list of targets that Meson included in build.ninja.
 
 `Makefile.mtest`
   The Makefile definitions that let "make check" run tests defined in
diff --git a/meson.build b/meson.build
index 88f757eac9..2c93e22382 100644
--- a/meson.build
+++ b/meson.build
@@ -47,10 +47,6 @@ supported_cpus = ['ppc', 'ppc64', 's390x', 'riscv32', 'riscv64', 'x86', 'x86_64'
 cpu = host_machine.cpu_family()
 targetos = host_machine.system()
 
-configure_file(input: files('scripts/ninjatool.py'),
-               output: 'ninjatool',
-               configuration: config_host)
-
 if cpu in ['x86', 'x86_64']
   kvm_targets = ['i386-softmmu', 'x86_64-softmmu']
 elif cpu == 'aarch64'
diff --git a/scripts/mtest2make.py b/scripts/mtest2make.py
index c3489a4605..25ee6887cf 100644
--- a/scripts/mtest2make.py
+++ b/scripts/mtest2make.py
@@ -70,8 +70,9 @@ def process_tests(test, targets, suites):
     print('.test.driver.%d := %s' % (i, driver))
     print('.test.env.%d := $(.test.env) %s' % (i, env))
     print('.test.cmd.%d := %s' % (i, cmd))
+    print('.test.deps.%d := %s' % (i, ' '.join(deps)))
     print('.PHONY: run-test-%d' % (i,))
-    print('run-test-%d: %s' % (i, ' '.join(deps)))
+    print('run-test-%d: $(.test.deps.%d)' % (i,i))
     print('\t@$(call .test.run,%d,$(.test.output-format))' % (i,))
 
     test_suites = test['suite'] or ['default']
diff --git a/scripts/ninjatool.py b/scripts/ninjatool.py
deleted file mode 100755
index 6f0e35c727..0000000000
--- a/scripts/ninjatool.py
+++ /dev/null
@@ -1,1008 +0,0 @@
-#! /bin/sh
-
-# Python module for parsing and processing .ninja files.
-#
-# Author: Paolo Bonzini
-#
-# Copyright (C) 2019 Red Hat, Inc.
-
-
-# We don't want to put "#! @PYTHON@" as the shebang and
-# make the file executable, so instead we make this a
-# Python/shell polyglot.  The first line below starts a
-# multiline string literal for Python, while it is just
-# ":" for bash.  The closing of the multiline string literal
-# is never parsed by bash since it exits before.
-
-'''':
-case "$0" in
-  /*) me=$0 ;;
-  *) me=$(command -v "$0") ;;
-esac
-python="@PYTHON@"
-case $python in
-  @*) python=python3 ;;
-esac
-exec $python "$me" "$@"
-exit 1
-'''
-
-
-from collections import namedtuple, defaultdict
-import sys
-import os
-import re
-import json
-import argparse
-import hashlib
-import shutil
-
-
-class InvalidArgumentError(Exception):
-    pass
-
-# faster version of os.path.normpath: do nothing unless there is a double
-# slash or a "." or ".." component.  The filter does not have to be super
-# precise, but it has to be fast.  os.path.normpath is the hottest function
-# for ninja2make without this optimization!
-if os.path.sep == '/':
-    def normpath(path, _slow_re=re.compile('/[./]')):
-        return os.path.normpath(path) if _slow_re.search(path) or path[0] == '.' else path
-else:
-    normpath = os.path.normpath
-
-
-def sha1_text(text):
-    return hashlib.sha1(text.encode()).hexdigest()
-
-# ---- lexer and parser ----
-
-PATH_RE = r"[^$\s:|]+|\$[$ :]|\$[a-zA-Z0-9_-]+|\$\{[a-zA-Z0-9_.-]+\}"
-
-SIMPLE_PATH_RE = re.compile(r"^[^$\s:|]+$")
-IDENT_RE = re.compile(r"[a-zA-Z0-9_.-]+$")
-STRING_RE = re.compile(r"(" + PATH_RE + r"|[\s:|])(?:\r?\n)?|.")
-TOPLEVEL_RE = re.compile(r"([=:#]|\|\|?|^ +|(?:" + PATH_RE + r")+)\s*|.")
-VAR_RE=re.compile(r'\$\$|\$\{([^}]*)\}')
-
-BUILD = 1
-POOL = 2
-RULE = 3
-DEFAULT = 4
-EQUALS = 5
-COLON = 6
-PIPE = 7
-PIPE2 = 8
-IDENT = 9
-INCLUDE = 10
-INDENT = 11
-EOL = 12
-
-
-class LexerError(Exception):
-    pass
-
-
-class ParseError(Exception):
-    pass
-
-
-class NinjaParserEvents(object):
-    def __init__(self, parser):
-        self.parser = parser
-
-    def dollar_token(self, word, in_path=False):
-        return '$$' if word == '$' else word
-
-    def variable_expansion_token(self, varname):
-        return '${%s}' % varname
-
-    def variable(self, name, arg):
-        pass
-
-    def begin_file(self):
-        pass
-
-    def end_file(self):
-        pass
-
-    def end_scope(self):
-        pass
-
-    def begin_pool(self, name):
-        pass
-
-    def begin_rule(self, name):
-        pass
-
-    def begin_build(self, out, iout, rule, in_, iin, orderdep):
-        pass
-
-    def default(self, targets):
-        pass
-
-
-class NinjaParser(object):
-
-    InputFile = namedtuple('InputFile', 'filename iter lineno')
-
-    def __init__(self, filename, input):
-        self.stack = []
-        self.top = None
-        self.iter = None
-        self.lineno = None
-        self.match_keyword = False
-        self.push(filename, input)
-
-    def file_changed(self):
-        self.iter = self.top.iter
-        self.lineno = self.top.lineno
-        if self.top.filename is not None:
-            os.chdir(os.path.dirname(self.top.filename) or '.')
-
-    def push(self, filename, input):
-        if self.top:
-            self.top.lineno = self.lineno
-            self.top.iter = self.iter
-            self.stack.append(self.top)
-        self.top = self.InputFile(filename=filename or 'stdin',
-                                  iter=self._tokens(input), lineno=0)
-        self.file_changed()
-
-    def pop(self):
-        if len(self.stack):
-            self.top = self.stack[-1]
-            self.stack.pop()
-            self.file_changed()
-        else:
-            self.top = self.iter = None
-
-    def next_line(self, input):
-        line = next(input).rstrip()
-        self.lineno += 1
-        while len(line) and line[-1] == '$':
-            line = line[0:-1] + next(input).strip()
-            self.lineno += 1
-        return line
-
-    def print_token(self, tok):
-        if tok == EOL:
-            return "end of line"
-        if tok == BUILD:
-            return '"build"'
-        if tok == POOL:
-            return '"pool"'
-        if tok == RULE:
-            return '"rule"'
-        if tok == DEFAULT:
-            return '"default"'
-        if tok == EQUALS:
-            return '"="'
-        if tok == COLON:
-            return '":"'
-        if tok == PIPE:
-            return '"|"'
-        if tok == PIPE2:
-            return '"||"'
-        if tok == INCLUDE:
-            return '"include"'
-        if tok == IDENT:
-            return 'identifier'
-        return '"%s"' % tok
-
-    def error(self, msg):
-        raise LexerError("%s:%d: %s" % (self.stack[-1].filename, self.lineno, msg))
-
-    def parse_error(self, msg):
-        raise ParseError("%s:%d: %s" % (self.stack[-1].filename, self.lineno, msg))
-
-    def expected(self, expected, tok):
-        msg = "found %s, expected " % (self.print_token(tok), )
-        for i, exp_tok in enumerate(expected):
-            if i > 0:
-                msg = msg + (' or ' if i == len(expected) - 1 else ', ')
-            msg = msg + self.print_token(exp_tok)
-        self.parse_error(msg)
-
-    def _variable_tokens(self, value):
-        for m in STRING_RE.finditer(value):
-            match = m.group(1)
-            if not match:
-                self.error("unexpected '%s'" % (m.group(0), ))
-            yield match
-
-    def _tokens(self, input):
-        while True:
-            try:
-                line = self.next_line(input)
-            except StopIteration:
-                return
-            for m in TOPLEVEL_RE.finditer(line):
-                match = m.group(1)
-                if not match:
-                    self.error("unexpected '%s'" % (m.group(0), ))
-                if match == ':':
-                    yield COLON
-                    continue
-                if match == '|':
-                    yield PIPE
-                    continue
-                if match == '||':
-                    yield PIPE2
-                    continue
-                if match[0] == ' ':
-                    yield INDENT
-                    continue
-                if match[0] == '=':
-                    yield EQUALS
-                    value = line[m.start() + 1:].lstrip()
-                    yield from self._variable_tokens(value)
-                    break
-                if match[0] == '#':
-                    break
-
-                # identifier
-                if self.match_keyword:
-                    if match == 'build':
-                        yield BUILD
-                        continue
-                    if match == 'pool':
-                        yield POOL
-                        continue
-                    if match == 'rule':
-                        yield RULE
-                        continue
-                    if match == 'default':
-                        yield DEFAULT
-                        continue
-                    if match == 'include':
-                        filename = line[m.start() + 8:].strip()
-                        self.push(filename, open(filename, 'r'))
-                        break
-                    if match == 'subninja':
-                        self.error('subninja is not supported')
-                yield match
-            yield EOL
-
-    def parse(self, events):
-        global_var = True
-
-        def look_for(*expected):
-            # The last token in the token stream is always EOL.  This
-            # is exploited to avoid catching StopIteration everywhere.
-            tok = next(self.iter)
-            if tok not in expected:
-                self.expected(expected, tok)
-            return tok
-
-        def look_for_ident(*expected):
-            tok = next(self.iter)
-            if isinstance(tok, str):
-                if not IDENT_RE.match(tok):
-                    self.parse_error('variable expansion not allowed')
-            elif tok not in expected:
-                self.expected(expected + (IDENT,), tok)
-            return tok
-
-        def parse_assignment_rhs(gen, expected, in_path):
-            tokens = []
-            for tok in gen:
-                if not isinstance(tok, str):
-                    if tok in expected:
-                        break
-                    self.expected(expected + (IDENT,), tok)
-                if tok[0] != '$':
-                    tokens.append(tok)
-                elif tok == '$ ' or tok == '$$' or tok == '$:':
-                    tokens.append(events.dollar_token(tok[1], in_path))
-                else:
-                    var = tok[2:-1] if tok[1] == '{' else tok[1:]
-                    tokens.append(events.variable_expansion_token(var))
-            else:
-                # gen must have raised StopIteration
-                tok = None
-
-            if tokens:
-                # Fast path avoiding str.join()
-                value = tokens[0] if len(tokens) == 1 else ''.join(tokens)
-            else:
-                value = None
-            return value, tok
-
-        def look_for_path(*expected):
-            # paths in build rules are parsed one space-separated token
-            # at a time and expanded
-            token = next(self.iter)
-            if not isinstance(token, str):
-                return None, token
-            # Fast path if there are no dollar and variable expansion
-            if SIMPLE_PATH_RE.match(token):
-                return token, None
-            gen = self._variable_tokens(token)
-            return parse_assignment_rhs(gen, expected, True)
-
-        def parse_assignment(tok):
-            name = tok
-            assert isinstance(name, str)
-            look_for(EQUALS)
-            value, tok = parse_assignment_rhs(self.iter, (EOL,), False)
-            assert tok == EOL
-            events.variable(name, value)
-
-        def parse_build():
-            # parse outputs
-            out = []
-            iout = []
-            while True:
-                value, tok = look_for_path(COLON, PIPE)
-                if value is None:
-                    break
-                out.append(value)
-            if tok == PIPE:
-                while True:
-                    value, tok = look_for_path(COLON)
-                    if value is None:
-                        break
-                    iout.append(value)
-
-            # parse rule
-            assert tok == COLON
-            rule = look_for_ident()
-
-            # parse inputs and dependencies
-            in_ = []
-            iin = []
-            orderdep = []
-            while True:
-                value, tok = look_for_path(PIPE, PIPE2, EOL)
-                if value is None:
-                    break
-                in_.append(value)
-            if tok == PIPE:
-                while True:
-                    value, tok = look_for_path(PIPE2, EOL)
-                    if value is None:
-                        break
-                    iin.append(value)
-            if tok == PIPE2:
-                while True:
-                    value, tok = look_for_path(EOL)
-                    if value is None:
-                        break
-                    orderdep.append(value)
-            assert tok == EOL
-            events.begin_build(out, iout, rule, in_, iin, orderdep)
-            nonlocal global_var
-            global_var = False
-
-        def parse_pool():
-            # pool declarations are ignored.  Just gobble all the variables
-            ident = look_for_ident()
-            look_for(EOL)
-            events.begin_pool(ident)
-            nonlocal global_var
-            global_var = False
-
-        def parse_rule():
-            ident = look_for_ident()
-            look_for(EOL)
-            events.begin_rule(ident)
-            nonlocal global_var
-            global_var = False
-
-        def parse_default():
-            idents = []
-            while True:
-                ident = look_for_ident(EOL)
-                if ident == EOL:
-                    break
-                idents.append(ident)
-            events.default(idents)
-
-        def parse_declaration(tok):
-            if tok == EOL:
-                return
-
-            nonlocal global_var
-            if tok == INDENT:
-                if global_var:
-                    self.parse_error('indented line outside rule or edge')
-                tok = look_for_ident(EOL)
-                if tok == EOL:
-                    return
-                parse_assignment(tok)
-                return
-
-            if not global_var:
-                events.end_scope()
-                global_var = True
-            if tok == POOL:
-                parse_pool()
-            elif tok == BUILD:
-                parse_build()
-            elif tok == RULE:
-                parse_rule()
-            elif tok == DEFAULT:
-                parse_default()
-            elif isinstance(tok, str):
-                parse_assignment(tok)
-            else:
-                self.expected((POOL, BUILD, RULE, INCLUDE, DEFAULT, IDENT), tok)
-
-        events.begin_file()
-        while self.iter:
-            try:
-                self.match_keyword = True
-                token = next(self.iter)
-                self.match_keyword = False
-                parse_declaration(token)
-            except StopIteration:
-                self.pop()
-        events.end_file()
-
-
-# ---- variable handling ----
-
-def expand(x, rule_vars=None, build_vars=None, global_vars=None):
-    if x is None:
-        return None
-    changed = True
-    have_dollar_replacement = False
-    while changed:
-        changed = False
-        matches = list(VAR_RE.finditer(x))
-        if not matches:
-            break
-
-        # Reverse the match so that expanding later matches does not
-        # invalidate m.start()/m.end() for earlier ones.  Do not reduce $$ to $
-        # until all variables are dealt with.
-        for m in reversed(matches):
-            name = m.group(1)
-            if not name:
-                have_dollar_replacement = True
-                continue
-            changed = True
-            if build_vars and name in build_vars:
-                value = build_vars[name]
-            elif rule_vars and name in rule_vars:
-                value = rule_vars[name]
-            elif name in global_vars:
-                value = global_vars[name]
-            else:
-                value = ''
-            x = x[:m.start()] + value + x[m.end():]
-    return x.replace('$$', '$') if have_dollar_replacement else x
-
-
-class Scope(object):
-    def __init__(self, events):
-        self.events = events
-
-    def on_left_scope(self):
-        pass
-
-    def on_variable(self, key, value):
-        pass
-
-
-class BuildScope(Scope):
-    def __init__(self, events, out, iout, rule, in_, iin, orderdep, rule_vars):
-        super().__init__(events)
-        self.rule = rule
-        self.out = [events.expand_and_normalize(x) for x in out]
-        self.in_ = [events.expand_and_normalize(x) for x in in_]
-        self.iin = [events.expand_and_normalize(x) for x in iin]
-        self.orderdep = [events.expand_and_normalize(x) for x in orderdep]
-        self.iout = [events.expand_and_normalize(x) for x in iout]
-        self.rule_vars = rule_vars
-        self.build_vars = dict()
-        self._define_variable('out', ' '.join(self.out))
-        self._define_variable('in', ' '.join(self.in_))
-
-    def expand(self, x):
-        return self.events.expand(x, self.rule_vars, self.build_vars)
-
-    def on_left_scope(self):
-        self.events.variable('out', self.build_vars['out'])
-        self.events.variable('in', self.build_vars['in'])
-        self.events.end_build(self, self.out, self.iout, self.rule, self.in_,
-                              self.iin, self.orderdep)
-
-    def _define_variable(self, key, value):
-        # The value has been expanded already, quote it for further
-        # expansion from rule variables
-        value = value.replace('$', '$$')
-        self.build_vars[key] = value
-
-    def on_variable(self, key, value):
-        # in and out are at the top of the lookup order and cannot
-        # be overridden.  Also, unlike what the manual says, build
-        # variables only lookup global variables.  They never lookup
-        # rule variables, earlier build variables, or in/out.
-        if key not in ('in', 'in_newline', 'out'):
-            self._define_variable(key, self.events.expand(value))
-
-
-class RuleScope(Scope):
-    def __init__(self, events, name, vars_dict):
-        super().__init__(events)
-        self.name = name
-        self.vars_dict = vars_dict
-        self.generator = False
-
-    def on_left_scope(self):
-        self.events.end_rule(self, self.name)
-
-    def on_variable(self, key, value):
-        self.vars_dict[key] = value
-        if key == 'generator':
-            self.generator = True
-
-
-class NinjaParserEventsWithVars(NinjaParserEvents):
-    def __init__(self, parser):
-        super().__init__(parser)
-        self.rule_vars = defaultdict(lambda: dict())
-        self.global_vars = dict()
-        self.scope = None
-
-    def variable(self, name, value):
-        if self.scope:
-            self.scope.on_variable(name, value)
-        else:
-            self.global_vars[name] = self.expand(value)
-
-    def begin_build(self, out, iout, rule, in_, iin, orderdep):
-        if rule != 'phony' and rule not in self.rule_vars:
-            self.parser.parse_error("undefined rule '%s'" % rule)
-
-        self.scope = BuildScope(self, out, iout, rule, in_, iin, orderdep, self.rule_vars[rule])
-
-    def begin_pool(self, name):
-        # pool declarations are ignored.  Just gobble all the variables
-        self.scope = Scope(self)
-
-    def begin_rule(self, name):
-        if name in self.rule_vars:
-            self.parser.parse_error("duplicate rule '%s'" % name)
-        self.scope = RuleScope(self, name, self.rule_vars[name])
-
-    def end_scope(self):
-        self.scope.on_left_scope()
-        self.scope = None
-
-    # utility functions:
-
-    def expand(self, x, rule_vars=None, build_vars=None):
-        return expand(x, rule_vars, build_vars, self.global_vars)
-
-    def expand_and_normalize(self, x):
-        return normpath(self.expand(x))
-
-    # extra events not present in the superclass:
-
-    def end_build(self, scope, out, iout, rule, in_, iin, orderdep):
-        pass
-
-    def end_rule(self, scope, name):
-        pass
-
-
-# ---- test client that just prints back whatever it parsed  ----
-
-class Writer(NinjaParserEvents):
-    ARGS = argparse.ArgumentParser(description='Rewrite input build.ninja to stdout.')
-
-    def __init__(self, output, parser, args):
-        super().__init__(parser)
-        self.output = output
-        self.indent = ''
-        self.had_vars = False
-
-    def dollar_token(self, word, in_path=False):
-        return '$' + word
-
-    def print(self, *args, **kwargs):
-        if len(args):
-            self.output.write(self.indent)
-        print(*args, **kwargs, file=self.output)
-
-    def variable(self, name, value):
-        self.print('%s = %s' % (name, value))
-        self.had_vars = True
-
-    def begin_scope(self):
-        self.indent = '  '
-        self.had_vars = False
-
-    def end_scope(self):
-        if self.had_vars:
-            self.print()
-        self.indent = ''
-        self.had_vars = False
-
-    def begin_pool(self, name):
-        self.print('pool %s' % name)
-        self.begin_scope()
-
-    def begin_rule(self, name):
-        self.print('rule %s' % name)
-        self.begin_scope()
-
-    def begin_build(self, outputs, implicit_outputs, rule, inputs, implicit, order_only):
-        all_outputs = list(outputs)
-        all_inputs = list(inputs)
-
-        if implicit:
-            all_inputs.append('|')
-            all_inputs.extend(implicit)
-        if order_only:
-            all_inputs.append('||')
-            all_inputs.extend(order_only)
-        if implicit_outputs:
-            all_outputs.append('|')
-            all_outputs.extend(implicit_outputs)
-
-        self.print('build %s: %s' % (' '.join(all_outputs),
-                                     ' '.join([rule] + all_inputs)))
-        self.begin_scope()
-
-    def default(self, targets):
-        self.print('default %s' % ' '.join(targets))
-
-
-# ---- emit compile_commands.json ----
-
-class Compdb(NinjaParserEventsWithVars):
-    ARGS = argparse.ArgumentParser(description='Emit compile_commands.json.')
-    ARGS.add_argument('rules', nargs='*',
-                      help='The ninja rules to emit compilation commands for.')
-
-    def __init__(self, output, parser, args):
-        super().__init__(parser)
-        self.output = output
-        self.rules = args.rules
-        self.sep = ''
-
-    def begin_file(self):
-        self.output.write('[')
-        self.directory = os.getcwd()
-
-    def print_entry(self, **entry):
-        entry['directory'] = self.directory
-        self.output.write(self.sep + json.dumps(entry))
-        self.sep = ',\n'
-
-    def begin_build(self, out, iout, rule, in_, iin, orderdep):
-        if in_ and rule in self.rules:
-            super().begin_build(out, iout, rule, in_, iin, orderdep)
-        else:
-            self.scope = Scope(self)
-
-    def end_build(self, scope, out, iout, rule, in_, iin, orderdep):
-        self.print_entry(command=scope.expand('${command}'), file=in_[0])
-
-    def end_file(self):
-        self.output.write(']\n')
-
-
-# ---- clean output files ----
-
-class Clean(NinjaParserEventsWithVars):
-    ARGS = argparse.ArgumentParser(description='Remove output build files.')
-    ARGS.add_argument('-g', dest='generator', action='store_true',
-                      help='clean generated files too')
-
-    def __init__(self, output, parser, args):
-        super().__init__(parser)
-        self.dry_run = args.dry_run
-        self.verbose = args.verbose or args.dry_run
-        self.generator = args.generator
-
-    def begin_file(self):
-        print('Cleaning... ', end=(None if self.verbose else ''), flush=True)
-        self.cnt = 0
-
-    def end_file(self):
-        print('%d files' % self.cnt)
-
-    def do_clean(self, *files):
-        for f in files:
-            if self.dry_run:
-                if os.path.exists(f):
-                    self.cnt += 1
-                    print('Would remove ' + f)
-                    continue
-            else:
-                try:
-                    if os.path.isdir(f):
-                        shutil.rmtree(f)
-                    else:
-                        os.unlink(f)
-                    self.cnt += 1
-                    if self.verbose:
-                        print('Removed ' + f)
-                except FileNotFoundError:
-                    pass
-
-    def end_build(self, scope, out, iout, rule, in_, iin, orderdep):
-        if rule == 'phony':
-            return
-        if self.generator:
-            rspfile = scope.expand('${rspfile}')
-            if rspfile:
-                self.do_clean(rspfile)
-        if self.generator or not scope.expand('${generator}'):
-            self.do_clean(*out, *iout)
-            depfile = scope.expand('${depfile}')
-            if depfile:
-                self.do_clean(depfile)
-
-
-# ---- convert build.ninja to makefile ----
-
-class Ninja2Make(NinjaParserEventsWithVars):
-    ARGS = argparse.ArgumentParser(description='Convert build.ninja to a Makefile.')
-    ARGS.add_argument('--clean', dest='emit_clean', action='store_true',
-                      help='Emit clean/distclean rules.')
-    ARGS.add_argument('--doublecolon', action='store_true',
-                      help='Emit double-colon rules for phony targets.')
-    ARGS.add_argument('--omit', metavar='TARGET', nargs='+',
-                      help='Targets to omit.')
-
-    def __init__(self, output, parser, args):
-        super().__init__(parser)
-        self.output = output
-
-        self.emit_clean = args.emit_clean
-        self.doublecolon = args.doublecolon
-        self.omit = set(args.omit)
-
-        if self.emit_clean:
-            self.omit.update(['clean', 'distclean'])
-
-        # Lists of targets are kept in memory and emitted only at the
-        # end because appending is really inefficient in GNU make.
-        # We only do it when it's O(#rules) or O(#variables), but
-        # never when it could be O(#targets).
-        self.depfiles = list()
-        self.rspfiles = list()
-        self.build_vars = defaultdict(lambda: dict())
-        self.rule_targets = defaultdict(lambda: list())
-        self.stamp_targets = defaultdict(lambda: list())
-        self.all_outs = set()
-        self.all_ins = set()
-        self.all_phony = set()
-        self.seen_default = False
-
-    def print(self, *args, **kwargs):
-        print(*args, **kwargs, file=self.output)
-
-    def dollar_token(self, word, in_path=False):
-        if in_path and word == ' ':
-            self.parser.parse_error('Make does not support spaces in filenames')
-        return '$$' if word == '$' else word
-
-    def print_phony(self, outs, ins):
-        targets = ' '.join(outs).replace('$', '$$')
-        deps = ' '.join(ins).replace('$', '$$')
-        deps = deps.strip()
-        if self.doublecolon:
-            self.print(targets + '::' + (' ' if deps else '') + deps + ';@:')
-        else:
-            self.print(targets + ':' + (' ' if deps else '') + deps)
-        self.all_phony.update(outs)
-
-    def begin_file(self):
-        self.print(r'# This is an automatically generated file, and it shows.')
-        self.print(r'ninja-default:')
-        self.print(r'.PHONY: ninja-default ninja-clean ninja-distclean')
-        if self.emit_clean:
-            self.print(r'ninja-clean:: ninja-clean-start; $(if $V,,@)rm -f ${ninja-depfiles}')
-            self.print(r'ninja-clean-start:; $(if $V,,@echo Cleaning...)')
-            self.print(r'ninja-distclean:: clean; $(if $V,,@)rm -f ${ninja-rspfiles}')
-            self.print(r'.PHONY: ninja-clean-start')
-            self.print_phony(['clean'], ['ninja-clean'])
-            self.print_phony(['distclean'], ['ninja-distclean'])
-        self.print(r'vpath')
-        self.print(r'NULL :=')
-        self.print(r'SPACE := ${NULL} #')
-        self.print(r'MAKEFLAGS += -rR')
-        self.print(r'define NEWLINE')
-        self.print(r'')
-        self.print(r'endef')
-        self.print(r'.var.in_newline = $(subst $(SPACE),$(NEWLINE),${.var.in})')
-        self.print(r"ninja-command = $(if $V,,$(if ${.var.description},@printf '%s\n' '$(subst ','\'',${.var.description})' && ))${.var.command}")
-        self.print(r"ninja-command-restat = $(if $V,,$(if ${.var.description},@printf '%s\n' '$(subst ','\'',${.var.description})' && ))${.var.command} && if test -e $(firstword ${.var.out}); then printf '%s\n' ${.var.out} > $@; fi")
-
-    def end_file(self):
-        def natural_sort_key(s, _nsre=re.compile('([0-9]+)')):
-            return [int(text) if text.isdigit() else text.lower()
-                    for text in _nsre.split(s)]
-
-        self.print()
-        self.print('ninja-outputdirs :=')
-        for rule in self.rule_vars:
-            if rule == 'phony':
-                continue
-            self.print('ninja-targets-%s := %s' % (rule, ' '.join(self.rule_targets[rule])))
-            self.print('ninja-stamp-%s := %s' % (rule, ' '.join(self.stamp_targets[rule])))
-            self.print('ninja-outputdirs += $(sort $(dir ${ninja-targets-%s}))' % rule)
-            self.print()
-        self.print('dummy := $(shell mkdir -p . $(sort $(ninja-outputdirs)))')
-        self.print('ninja-depfiles :=' + ' '.join(self.depfiles))
-        self.print('ninja-rspfiles :=' + ' '.join(self.rspfiles))
-        self.print('-include ${ninja-depfiles}')
-        self.print()
-        for targets in self.build_vars:
-            for name, value in self.build_vars[targets].items():
-                self.print('%s: private .var.%s := %s' %
-                           (targets, name, value.replace('$', '$$')))
-            self.print()
-        if not self.seen_default:
-            default_targets = sorted(self.all_outs - self.all_ins, key=natural_sort_key)
-            self.print('ninja-default: ' + ' '.join(default_targets))
-
-        # This is a hack...  Meson declares input meson.build files as
-        # phony, because Ninja does not have an equivalent of Make's
-        # "path/to/file:" declaration that ignores "path/to/file" even
-        # if it is absent.  However, Makefile.ninja wants to depend on
-        # build.ninja, which in turn depends on these phony targets which
-        # would cause Makefile.ninja to be rebuilt in a loop.
-        phony_targets = sorted(self.all_phony - self.all_ins, key=natural_sort_key)
-        self.print('.PHONY: ' + ' '.join(phony_targets))
-
-    def variable(self, name, value):
-        super().variable(name, value)
-        if self.scope is None:
-            self.global_vars[name] = self.expand(value)
-            self.print('.var.%s := %s' % (name, self.global_vars[name]))
-
-    def begin_build(self, out, iout, rule, in_, iin, orderdep):
-        if any(x in self.omit for x in out):
-            self.scope = Scope(self)
-            return
-
-        super().begin_build(out, iout, rule, in_, iin, orderdep)
-        self.current_targets = ' '.join(self.scope.out + self.scope.iout).replace('$', '$$')
-
-    def end_build(self, scope, out, iout, rule, in_, iin, orderdep):
-        self.rule_targets[rule] += self.scope.out
-        self.rule_targets[rule] += self.scope.iout
-
-        self.all_outs.update(self.scope.iout)
-        self.all_outs.update(self.scope.out)
-        self.all_ins.update(self.scope.in_)
-        self.all_ins.update(self.scope.iin)
-
-        targets = self.current_targets
-        self.current_targets = None
-        if rule == 'phony':
-            # Phony rules treat order-only dependencies as normal deps
-            self.print_phony(out + iout, in_ + iin + orderdep)
-            return
-
-        inputs = ' '.join(in_ + iin).replace('$', '$$')
-        orderonly = ' '.join(orderdep).replace('$', '$$')
-
-        rspfile = scope.expand('${rspfile}')
-        if rspfile:
-            rspfile_content = scope.expand('${rspfile_content}')
-            with open(rspfile, 'w') as f:
-                f.write(rspfile_content)
-            inputs += ' ' + rspfile
-            self.rspfiles.append(rspfile)
-
-        restat = 'restat' in self.scope.build_vars or 'restat' in self.rule_vars[rule]
-        depfile = scope.expand('${depfile}')
-        build_vars = {
-            'command': scope.expand('${command}'),
-            'description': scope.expand('${description}'),
-            'out': scope.expand('${out}')
-        }
-
-        if restat and not depfile:
-            if len(out) == 1:
-                stamp = out[0] + '.stamp'
-            else:
-                stamp = '%s@%s.stamp' % (rule, sha1_text(targets)[0:11])
-            self.print('%s: %s; @:' % (targets, stamp))
-            self.print('ifneq (%s, $(wildcard %s))' % (targets, targets))
-            self.print('.PHONY: %s' % (stamp, ))
-            self.print('endif')
-            self.print('%s: %s | %s; ${ninja-command-restat}' % (stamp, inputs, orderonly))
-            self.rule_targets[rule].append(stamp)
-            self.stamp_targets[rule].append(stamp)
-            self.build_vars[stamp] = build_vars
-        else:
-            self.print('%s: %s | %s; ${ninja-command}' % (targets, inputs, orderonly))
-            self.build_vars[targets] = build_vars
-            if depfile:
-                self.depfiles.append(depfile)
-
-    def end_rule(self, scope, name):
-        # Note that the generator pseudo-variable could also be attached
-        # to a build block rather than a rule.  This is not handled here
-        # in order to reduce the number of "rm" invocations.  However,
-        # "ninjatool.py -t clean" does that correctly.
-        target = 'distclean' if scope.generator else 'clean'
-        self.print('ninja-%s:: ; $(if $V,,@)rm -f ${ninja-stamp-%s}' % (target, name))
-        if self.emit_clean:
-            self.print('ninja-%s:: ; $(if $V,,@)rm -rf ${ninja-targets-%s}' % (target, name))
-
-    def default(self, targets):
-        self.print("ninja-default: " + ' '.join(targets))
-        self.seen_default = True
-
-
-# ---- command line parsing ----
-
-# we cannot use subparsers because tools are chosen through the "-t"
-# option.
-
-class ToolAction(argparse.Action):
-    def __init__(self, option_strings, dest, choices, metavar='TOOL', nargs=None, **kwargs):
-        if nargs is not None:
-            raise ValueError("nargs not allowed")
-        super().__init__(option_strings, dest, required=True, choices=choices,
-                         metavar=metavar, **kwargs)
-
-    def __call__(self, parser, namespace, value, option_string):
-        tool = self.choices[value]
-        setattr(namespace, self.dest, tool)
-        tool.ARGS.prog = '%s %s %s' % (parser.prog, option_string, value)
-
-
-class ToolHelpAction(argparse.Action):
-    def __init__(self, option_strings, dest, nargs=None, **kwargs):
-        if nargs is not None:
-            raise ValueError("nargs not allowed")
-        super().__init__(option_strings, dest, nargs=0, **kwargs)
-
-    def __call__(self, parser, namespace, values, option_string=None):
-        if namespace.tool:
-            namespace.tool.ARGS.print_help()
-        else:
-            parser.print_help()
-        parser.exit()
-
-
-tools = {
-    'test': Writer,
-    'ninja2make': Ninja2Make,
-    'compdb': Compdb,
-    'clean': Clean,
-}
-
-parser = argparse.ArgumentParser(description='Process and transform build.ninja files.',
-                                 add_help=False)
-parser.add_argument('-C', metavar='DIR', dest='dir', default='.',
-                    help='change to DIR before doing anything else')
-parser.add_argument('-f', metavar='FILE', dest='file', default='build.ninja',
-                    help='specify input build file [default=build.ninja]')
-parser.add_argument('-n', dest='dry_run', action='store_true',
-                    help='do not actually do anything')
-parser.add_argument('-v', dest='verbose', action='store_true',
-                    help='be more verbose')
-
-parser.add_argument('-t', dest='tool', choices=tools, action=ToolAction,
-                    help='choose the tool to run')
-parser.add_argument('-h', '--help', action=ToolHelpAction,
-                    help='show this help message and exit')
-
-if len(sys.argv) >= 2 and sys.argv[1] == '--version':
-    print('1.8')
-    sys.exit(0)
-
-args, tool_args = parser.parse_known_args()
-args.tool.ARGS.parse_args(tool_args, args)
-
-os.chdir(args.dir)
-with open(args.file, 'r') as f:
-    parser = NinjaParser(args.file, f)
-    try:
-        events = args.tool(sys.stdout, parser, args)
-    except InvalidArgumentError as e:
-        parser.error(str(e))
-    parser.parse(events)
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 4037490b69..3a0524ce74 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -140,7 +140,7 @@ QEMU_IOTESTS_HELPERS-$(CONFIG_LINUX) = tests/qemu-iotests/socket_scm_helper$(EXE
 check: check-block
 check-block: $(SRC_PATH)/tests/check-block.sh qemu-img$(EXESUF) \
 		qemu-io$(EXESUF) qemu-nbd$(EXESUF) $(QEMU_IOTESTS_HELPERS-y) \
-		$(filter qemu-system-%, $(ninja-targets-c_LINKER) $(ninja-targets-cpp_LINKER))
+		$(filter qemu-system-%, $(ninja-targets))
 	@$<
 endif
 
-- 
2.26.2


