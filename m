Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A9265F397
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 19:17:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDUmS-0002Nh-GS; Thu, 05 Jan 2023 13:15:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDUmO-0002MA-MO
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 13:15:54 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDUmM-0005JU-Qq
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 13:15:52 -0500
Received: by mail-wr1-x431.google.com with SMTP id w1so24834925wrt.8
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 10:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wcrqyrQ3/20U99j8RiijWfBKgmENpjf5207jzj/VFJQ=;
 b=AF2gQy7Kwl3PdNynaCHMuNWN8FtEare1SkA/tw8KDPSCYrY0W1TkkETn18wJ9UkMw9
 sdv1rKQGqWwZYCjNV8o3h92aWE7ioCqjfIEFDUMjhX4fkqAb1GYzdMye5eUiEV6ejaON
 3O2BReK+TnHozMwzFY1rm0Y6mQqyTcM+MLHxx/hCj4QwVLUNnPnKLH42ecFtF7AJtaoS
 prQje83GqH3NOwe0NyVH+gE9KCj+0rLwLXWYQYDF2LYXwdnWB4IUm4iEDCvWQe/8rcrk
 QLUEujBgcRgRllRL8fSG2wRbji+mCDXV6XLJCeewP23CJfR7n4RsLbL1ZGQTMndIfLqz
 +o4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wcrqyrQ3/20U99j8RiijWfBKgmENpjf5207jzj/VFJQ=;
 b=ZwDIxTs20rZvaFQ2ff/zgpfYxoTIdhSbaav1o2SASpbydy/g2n5VLVnRj29urajJWp
 3EF8SpZWR1EggaRngzJ/SqR8X6lBlRSaNmYos+A0eZbDPa4VSFmz0cGoX0EJeKXDrIvE
 JUOrqSOgh49ffXxh+TLfXnQ3q6grmyYSDKtPvjVW/LUNWPKDR39PMlBsyQ4bbV4/3/AN
 sLSsKMO5lD7CEyHBxv5y61zIG7zrtwGkxbxduhbAxC/sJeT34kre2Y/6TbD7wImVr7b1
 i2nkzX3CEJKuv1cz9WDOGaBgP1qLtIEkQo6WnP3k1yyvxP38/ZaqlhMy4wkQlT0gL6u+
 aIJA==
X-Gm-Message-State: AFqh2kqqTmdN6IhawHp4M4Lhd+kAKUp/3lTMZarFX8PhLGk1bXKOko9t
 xiSYMAW6lNwOlvhuFVrLtCOVKA==
X-Google-Smtp-Source: AMrXdXtuw50PR+J7OeGdMYUEhgxxu07GkQQzZaB9AAranlKHpV0pWRYKTrzKFwE7mtrsDhDJY+tilQ==
X-Received: by 2002:adf:dfc3:0:b0:294:c208:c921 with SMTP id
 q3-20020adfdfc3000000b00294c208c921mr10371492wrn.42.1672942549288; 
 Thu, 05 Jan 2023 10:15:49 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a5d49c5000000b0028cf987d944sm20215380wrs.33.2023.01.05.10.15.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 10:15:48 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8B4CA1FFB7;
 Thu,  5 Jan 2023 18:15:48 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [RFC PATCH] testing: probe gdb for supported architectures ahead of
 time
Date: Thu,  5 Jan 2023 18:15:33 +0000
Message-Id: <20230105181533.2235792-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

[AJB: we still miss some arches, for example gdb uses s390 which fails
when we look for s390x. Not sure what the best way to deal with that
is? Maybe define a gdb_arch as we probe each target?]

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                                     |  8 +++++
 scripts/probe-gdb-support.sh                  | 36 +++++++++++++++++++
 tests/tcg/aarch64/Makefile.target             |  2 +-
 tests/tcg/multiarch/Makefile.target           |  5 +++
 .../multiarch/system/Makefile.softmmu-target  |  6 +++-
 tests/tcg/s390x/Makefile.target               |  2 +-
 6 files changed, 56 insertions(+), 3 deletions(-)
 create mode 100755 scripts/probe-gdb-support.sh

diff --git a/configure b/configure
index 9f0bc57546..ed3ace4bc7 100755
--- a/configure
+++ b/configure
@@ -230,6 +230,7 @@ stack_protector=""
 safe_stack=""
 use_containers="yes"
 gdb_bin=$(command -v "gdb-multiarch" || command -v "gdb")
+gdb_arches=""
 
 if test -e "$source_path/.git"
 then
@@ -2396,6 +2397,7 @@ if test -n "$gdb_bin"; then
     gdb_version=$($gdb_bin --version | head -n 1)
     if version_ge ${gdb_version##* } 9.1; then
         echo "HAVE_GDB_BIN=$gdb_bin" >> $config_host_mak
+        gdb_arches=$("$source_path/scripts/probe-gdb-support.sh" $gdb_bin)
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
diff --git a/scripts/probe-gdb-support.sh b/scripts/probe-gdb-support.sh
new file mode 100755
index 0000000000..2b09a00a5b
--- /dev/null
+++ b/scripts/probe-gdb-support.sh
@@ -0,0 +1,36 @@
+#!/bin/sh
+
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
+if test -z "$1"; then
+  echo "Usage: $0 /path/to/gdb"
+  exit 1
+fi
+
+# Start gdb with a set-architecture and capture the set of valid
+# options.
+
+valid_args=$($1 -ex "set architecture" -ex "quit" 2>&1 >/dev/null)
+
+# Strip off the preamble
+raw_arches=$(echo "${valid_args}" | sed "s/.*Valid arguments are \(.*\)/\1/")
+
+# Split into lines, strip everything after :foo and return final
+# "clean" list of supported arches.
+final_arches=$(echo "${raw_arches}" | tr ', ' '\n' | sed "s/:.*//" | sort | uniq)
+
+echo "$final_arches"
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index fc8d90ed69..bb8d4f71b2 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -76,7 +76,7 @@ sha512-vector: sha512.c
 
 TESTS += sha512-vector
 
-ifneq ($(HAVE_GDB_BIN),)
+ifeq ($(HOST_GDB_SUPPORTS_ARCH),y)
 GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
 
 run-gdbstub-sysregs: sysregs
diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index 5f0fee1aad..25b15409be 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -52,6 +52,7 @@ run-test-mmap-%: test-mmap
 	$(call run-test, test-mmap-$*, $(QEMU) -p $* $<, $< ($* byte pages))
 
 ifneq ($(HAVE_GDB_BIN),)
+ifeq ($(HOST_GDB_SUPPORTS_ARCH),y)
 GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
 
 run-gdbstub-sha1: sha1
@@ -75,6 +76,10 @@ run-gdbstub-thread-breakpoint: testthread
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
index 07fcc6d0ce..8759314d81 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -44,7 +44,7 @@ $(Z15_TESTS): CFLAGS+=-march=z15 -O2
 TESTS+=$(Z15_TESTS)
 endif
 
-ifneq ($(HAVE_GDB_BIN),)
+ifeq ($(HOST_GDB_SUPPORTS_ARCH),y)
 GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
 
 run-gdbstub-signals-s390x: signals-s390x
-- 
2.34.1


