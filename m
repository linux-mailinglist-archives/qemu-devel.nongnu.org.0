Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5FF6AF7BA
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 22:32:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZesE-0004kH-H5; Tue, 07 Mar 2023 16:29:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZesB-0004i6-IT
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:29:27 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZes7-0000vR-QO
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:29:27 -0500
Received: by mail-wm1-x332.google.com with SMTP id c18so8689408wmr.3
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 13:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678224562;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qKNDVJuDGo9wx6lw6YhCTPwgUDBkYMtDmEhlMPd9XyY=;
 b=J94k44JfX4u/4DLhAa+g0G5bxlsujSMu7HWpvK9EaC7La4pK+H0cGdo+ZJJZzwopCX
 yMtEp6xC1gq2tXNAHck9BfDiJXaIS0fJkXKpYxAaQ4vrErquAKw9iBnVHnlddWNeN48k
 RGB31S58CTtKheEbT7+ahC7UlSOu6Uz9n/o347RSIiYfOdcrmlU1dZw17UrC6FQjiICV
 UmbQmBqqjzSIV+I1Ak5ciotKPu3/byi05EfifuEcdVYVECIfEtFvmtybw63bncn3Ggoy
 bFPWAFQet4wLCgHLC8kSXubfBz2TOhmZbUbtS0v8gxOsgA/FcKs1qozW+k+dRVulvpP5
 8+6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678224562;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qKNDVJuDGo9wx6lw6YhCTPwgUDBkYMtDmEhlMPd9XyY=;
 b=2ehFDtEHO5t/PhyGNjBAAM7d6eoxwPUoZGLcg1gsstEoaHrDvQLDwldAxwQ3BAk4/m
 5/FV6lRM9esY0X1OXVqjTipjfNVVLG2Bh4rpls6MZOXuFzxe3bXcdVf/HU9q/0V6BWUk
 wI4KJX7FgQerJ+JqgNJomDpZjTewQpZm3cl/nTfG80s2Rav8idCpwvKKvemC9vaJYv/R
 QwJgIhMFVhH1tjq7KAiT5tftnlp9QFtFW5iy8mhAuL2CjxEF7Uk0UF06MNSstaiX5FYP
 SqNB67BTBnvVloU+CQLJ+/Z7SjYw1QqgH4sv14EqeHLXGd6Yhv7s40XoAF0YQrTvSS+w
 S4cA==
X-Gm-Message-State: AO0yUKVHbavU+qYJO+EJwFsMnA7hW4aUAvnUquINXUeq4RN4E8wg/7GQ
 iYRbLWucKFo4wYrRfbxLTuk6iw==
X-Google-Smtp-Source: AK7set+SykIVsKR827bKIj8yrPGMAsFP0u1jxx0iBdf4A6LAc1T9O9p1d+TAOQzaAsdQt5Hj2mZRjw==
X-Received: by 2002:a05:600c:4591:b0:3da:2a78:d7a4 with SMTP id
 r17-20020a05600c459100b003da2a78d7a4mr13482969wmo.21.1678224562220; 
 Tue, 07 Mar 2023 13:29:22 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a05600c00cc00b003e1202744f2sm17454956wmm.31.2023.03.07.13.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 13:29:21 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AFA911FFCA;
 Tue,  7 Mar 2023 21:21:42 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs),
 qemu-s390x@nongnu.org (open list:S390 TCG CPUs)
Subject: [PULL 23/30] testing: probe gdb for supported architectures ahead of
 time
Date: Tue,  7 Mar 2023 21:21:32 +0000
Message-Id: <20230307212139.883112-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307212139.883112-1-alex.bennee@linaro.org>
References: <20230307212139.883112-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Currently when we encounter a gdb that is old or not built with
multiarch in mind we fail rather messily. Try and improve the
situation by probing ahead of time and setting
HOST_GDB_SUPPORTS_ARCH=y in the relevant tcg configs. We can then skip
and give a more meaningful message if we don't run the test.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230302190846.2593720-24-alex.bennee@linaro.org>
Message-Id: <20230303025805.625589-24-richard.henderson@linaro.org>

diff --git a/MAINTAINERS b/MAINTAINERS
index 42841ac015..04857c71fa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2747,6 +2747,7 @@ F: include/gdbstub/*
 F: gdb-xml/
 F: tests/tcg/multiarch/gdbstub/
 F: scripts/feature_to_c.sh
+F: scripts/probe-gdb-support.py
 
 Memory API
 M: Paolo Bonzini <pbonzini@redhat.com>
diff --git a/configure b/configure
index 219ff13748..fd3c12ff34 100755
--- a/configure
+++ b/configure
@@ -230,6 +230,7 @@ stack_protector=""
 safe_stack=""
 use_containers="yes"
 gdb_bin=$(command -v "gdb-multiarch" || command -v "gdb")
+gdb_arches=""
 
 if test -e "$source_path/.git"
 then
@@ -2395,6 +2396,7 @@ if test -n "$gdb_bin"; then
     gdb_version=$($gdb_bin --version | head -n 1)
     if version_ge ${gdb_version##* } 9.1; then
         echo "HAVE_GDB_BIN=$gdb_bin" >> $config_host_mak
+        gdb_arches=$("$source_path/scripts/probe-gdb-support.py" $gdb_bin)
     else
         gdb_bin=""
     fi
@@ -2519,6 +2521,12 @@ for target in $target_list; do
       write_target_makefile "build-tcg-tests-$target" >> "$config_target_mak"
       echo "BUILD_STATIC=$build_static" >> "$config_target_mak"
       echo "QEMU=$PWD/$qemu" >> "$config_target_mak"
+
+      # will GDB work with these binaries?
+      if test "${gdb_arches#*$arch}" != "$gdb_arches"; then
+          echo "HOST_GDB_SUPPORTS_ARCH=y" >> "$config_target_mak"
+      fi
+
       echo "run-tcg-tests-$target: $qemu\$(EXESUF)" >> Makefile.prereqs
       tcg_tests_targets="$tcg_tests_targets $target"
   fi
diff --git a/scripts/probe-gdb-support.py b/scripts/probe-gdb-support.py
new file mode 100755
index 0000000000..5755255966
--- /dev/null
+++ b/scripts/probe-gdb-support.py
@@ -0,0 +1,88 @@
+#!/usr/bin/env python3
+# coding: utf-8
+#
+# Probe gdb for supported architectures.
+#
+# This is required to support testing of the gdbstub as its hard to
+# handle errors gracefully during the test. Instead this script when
+# passed a GDB binary will probe its architecture support and return a
+# string of supported arches, stripped of guff.
+#
+# Copyright 2023 Linaro Ltd
+#
+# Author: Alex Bennée <alex.bennee@linaro.org>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or later.
+# See the COPYING file in the top-level directory.
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import argparse
+import re
+from subprocess import check_output, STDOUT
+
+# mappings from gdb arch to QEMU target
+mappings = {
+    "alpha" : "alpha",
+    "aarch64" : ["aarch64", "aarch64_be"],
+    "armv7": "arm",
+    "armv8-a" : ["aarch64", "aarch64_be"],
+    "avr" : "avr",
+    "cris" : "cris",
+    # no hexagon in upstream gdb
+    "hppa1.0" : "hppa",
+    "i386" : "i386",
+    "i386:x86-64" : "x86_64",
+    "Loongarch64" : "loongarch64",
+    "m68k" : "m68k",
+    "MicroBlaze" : "microblaze",
+    "mips:isa64" : ["mips64", "mips64el"],
+    "nios2" : "nios2",
+    "or1k" : "or1k",
+    "powerpc:common" : "ppc",
+    "powerpc:common64" : ["ppc64", "ppc64le"],
+    "riscv:rv32" : "riscv32",
+    "riscv:rv64" : "riscv64",
+    "s390:64-bit" : "s390x",
+    "sh4" : ["sh4", "sh4eb"],
+    "sparc": "sparc",
+    "sparc:v8plus": "sparc32plus",
+    "sparc:v9a" : "sparc64",
+    # no tricore in upstream gdb
+    "xtensa" : ["xtensa", "xtensaeb"]
+}
+
+def do_probe(gdb):
+    gdb_out = check_output([gdb,
+                            "-ex", "set architecture",
+                            "-ex", "quit"], stderr=STDOUT)
+
+    m = re.search(r"Valid arguments are (.*)",
+                  gdb_out.decode("utf-8"))
+
+    valid_arches = set()
+
+    if m.group(1):
+        for arch in m.group(1).split(", "):
+            if arch in mappings:
+                mapping = mappings[arch]
+                if isinstance(mapping, str):
+                    valid_arches.add(mapping)
+                else:
+                    for entry in mapping:
+                        valid_arches.add(entry)
+
+    return valid_arches
+
+def main() -> None:
+    parser = argparse.ArgumentParser(description='Probe GDB Architectures')
+    parser.add_argument('gdb', help='Path to GDB binary.')
+
+    args = parser.parse_args()
+
+    supported = do_probe(args.gdb)
+
+    print(" ".join(supported))
+
+if __name__ == '__main__':
+    main()
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index db122ab4ff..9e91a20b0d 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -81,7 +81,7 @@ sha512-vector: sha512.c
 
 TESTS += sha512-vector
 
-ifneq ($(HAVE_GDB_BIN),)
+ifeq ($(HOST_GDB_SUPPORTS_ARCH),y)
 GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
 
 run-gdbstub-sysregs: sysregs
diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index ae8b3d7268..373db69648 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -64,6 +64,7 @@ run-test-mmap-%: test-mmap
 	$(call run-test, test-mmap-$*, $(QEMU) -p $* $<, $< ($* byte pages))
 
 ifneq ($(HAVE_GDB_BIN),)
+ifeq ($(HOST_GDB_SUPPORTS_ARCH),y)
 GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
 
 run-gdbstub-sha1: sha1
@@ -87,6 +88,10 @@ run-gdbstub-thread-breakpoint: testthread
 		--bin $< --test $(MULTIARCH_SRC)/gdbstub/test-thread-breakpoint.py, \
 	hitting a breakpoint on non-main thread)
 
+else
+run-gdbstub-%:
+	$(call skip-test, "gdbstub test $*", "no guest arch support")
+endif
 else
 run-gdbstub-%:
 	$(call skip-test, "gdbstub test $*", "need working gdb")
diff --git a/tests/tcg/multiarch/system/Makefile.softmmu-target b/tests/tcg/multiarch/system/Makefile.softmmu-target
index 368b64d531..5f432c95f3 100644
--- a/tests/tcg/multiarch/system/Makefile.softmmu-target
+++ b/tests/tcg/multiarch/system/Makefile.softmmu-target
@@ -15,6 +15,7 @@ MULTIARCH_TEST_SRCS=$(wildcard $(MULTIARCH_SYSTEM_SRC)/*.c)
 MULTIARCH_TESTS = $(patsubst $(MULTIARCH_SYSTEM_SRC)/%.c, %, $(MULTIARCH_TEST_SRCS))
 
 ifneq ($(HAVE_GDB_BIN),)
+ifeq ($(HOST_GDB_SUPPORTS_ARCH),y)
 GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
 
 run-gdbstub-memory: memory
@@ -26,7 +27,10 @@ run-gdbstub-memory: memory
 		"-monitor none -display none -chardev file$(COMMA)path=$<.out$(COMMA)id=output $(QEMU_OPTS)" \
 		--bin $< --test $(MULTIARCH_SRC)/gdbstub/memory.py, \
 	softmmu gdbstub support)
-
+else
+run-gdbstub-%:
+	$(call skip-test, "gdbstub test $*", "no guest arch support")
+endif
 else
 run-gdbstub-%:
 	$(call skip-test, "gdbstub test $*", "need working gdb")
diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 72ad309b27..b7f576f983 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -51,7 +51,7 @@ $(Z15_TESTS): CFLAGS+=-march=z15 -O2
 TESTS+=$(Z15_TESTS)
 endif
 
-ifneq ($(HAVE_GDB_BIN),)
+ifeq ($(HOST_GDB_SUPPORTS_ARCH),y)
 GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
 
 run-gdbstub-signals-s390x: signals-s390x
-- 
2.39.2


