Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C92C42DF7C
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 18:48:14 +0200 (CEST)
Received: from localhost ([::1]:38164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb3tt-0001Y7-HQ
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 12:48:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mb3cN-0003uN-0N
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:30:07 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:37756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mb3cJ-0000nc-QP
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:30:06 -0400
Received: by mail-ed1-x533.google.com with SMTP id y12so27680991eda.4
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 09:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZR12s/8/FdEGVacS0g5r0FyAnbXeOeyVgE4QTLyfZ7k=;
 b=YhpMgJeUUXbl10N0XtIkYpGqVSQ5EKPidSGexwQBue69GffLKzv0U0XS9331eyzPP8
 WhLsao4D/GEK6+whl2z/d6MCji+/y+ohCoOTBEJPKaJFvzmPaSh46fD1hg14Zlp3NgZE
 6K3PqMNE7db9MxT0+iAhtCMifoZjY9OaMBNlvy3ZVVYc4UyItMPf7UoBg0lT5Q78PQi8
 PKJzd9AcZNZxI9zYN3E8riyvKfA+w6NpEQjrPwO678Ft8erYRen8E8QVZq/uAcy4/bsE
 Nv1wk6Za7rtiqpUdTAzSxxrRvBHzdO5wMzxKepegeM7e/AS1k9/Q1CnDBz4W/ag2HAz0
 YUFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZR12s/8/FdEGVacS0g5r0FyAnbXeOeyVgE4QTLyfZ7k=;
 b=YTDr+iqJNlt/PMh8U1xW7bgFjj9ZhIk/zOJthVG6uXo/8Ksl/Zi31KdmJVuUaAfR1q
 Jpn2Ruxy4LebJzP/79PjzfeGfRIKULUhiGU8X23ZkSlc9zcUsOf/ixfYHUAtLxMmmRoY
 uWosJLfR7dLXZymBd4k/sqcH+u/nz4+pmugKH4ngTPwbFpvghRbzQecxnoqvb/c9UO4G
 0XT+qPn4U6pO4NmgBOpwPOMNEG86ufIGTbN0osN8aUjCmu05gS471wtra8maYxVGiuke
 0TXRnKgi8jfgbB8oC/3aAX+MI1RJ6pPjHim1YzdtKGS6VkP36Kgf113JUJCtX71sPmQW
 T8sA==
X-Gm-Message-State: AOAM533hru2kjXI6s2ZCuoTC/PAULdPxCe6Fa+sVeKTzO0A8D9UsMddF
 Edmb+l2kFHxrORZVwK2YuYQV3bnOUL0=
X-Google-Smtp-Source: ABdhPJz5pWF+8Q7s0V783YGjkAfMo4ehTAkRYMmX8MYf6g8kxu2rI1hV7CgdKKj8/zK2PxTUQVoHyA==
X-Received: by 2002:a17:907:7212:: with SMTP id
 dr18mr4989391ejc.298.1634229002319; 
 Thu, 14 Oct 2021 09:30:02 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x22sm2658404edv.14.2021.10.14.09.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 09:30:01 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/26] configure: prepare for auto-generated option parsing
Date: Thu, 14 Oct 2021 18:29:36 +0200
Message-Id: <20211014162938.430211-25-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211014162938.430211-1-pbonzini@redhat.com>
References: <20211014162938.430211-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Prepare the configure script and Makefile for automatically generated
help and parsing.

Because we need to run the script to generate the full help, we
cannot rely on the user supplying the path to a Python interpreter
with --python; therefore, the introspection output is parsed into
shell functions and stored in scripts/.  The converter is written
in Python as standard for QEMU, and this commit contains a stub.

Tested-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20211007130829.632254-18-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile                      |  8 ++++-
 configure                     | 31 ++++++++++++-----
 scripts/meson-buildoptions.py | 64 +++++++++++++++++++++++++++++++++++
 scripts/meson-buildoptions.sh | 13 +++++++
 4 files changed, 106 insertions(+), 10 deletions(-)
 create mode 100755 scripts/meson-buildoptions.py
 create mode 100644 scripts/meson-buildoptions.sh

diff --git a/Makefile b/Makefile
index 401c623a65..fe9415ac64 100644
--- a/Makefile
+++ b/Makefile
@@ -87,7 +87,7 @@ x := $(shell rm -rf meson-private meson-info meson-logs)
 endif
 
 # 1. ensure config-host.mak is up-to-date
-config-host.mak: $(SRC_PATH)/configure $(SRC_PATH)/pc-bios $(SRC_PATH)/VERSION
+config-host.mak: $(SRC_PATH)/configure $(SRC_PATH)/scripts/meson-buildoptions.sh $(SRC_PATH)/pc-bios $(SRC_PATH)/VERSION
 	@echo config-host.mak is out-of-date, running configure
 	@if test -f meson-private/coredata.dat; then \
 	  ./config.status --skip-meson; \
@@ -124,6 +124,12 @@ ifneq ($(MESON),)
 Makefile.mtest: build.ninja scripts/mtest2make.py
 	$(MESON) introspect --targets --tests --benchmarks | $(PYTHON) scripts/mtest2make.py > $@
 -include Makefile.mtest
+
+.PHONY: update-buildoptions
+all update-buildoptions: $(SRC_PATH)/scripts/meson-buildoptions.sh
+$(SRC_PATH)/scripts/meson-buildoptions.sh: $(SRC_PATH)/meson_options.txt
+	$(MESON) introspect --buildoptions $(SRC_PATH)/meson.build | $(PYTHON) \
+	  scripts/meson-buildoptions.py > $@.tmp && mv $@.tmp $@
 endif
 
 # 4. Rules to bridge to other makefiles
diff --git a/configure b/configure
index 2ec410378e..8eb0ef160f 100755
--- a/configure
+++ b/configure
@@ -789,6 +789,18 @@ fi
 
 werror=""
 
+. $source_path/scripts/meson-buildoptions.sh
+
+meson_options=
+meson_option_parse() {
+  meson_options="$meson_options $(_meson_option_parse "$@")"
+  if test $? -eq 1; then
+    echo "ERROR: unknown option $1"
+    echo "Try '$0 --help' for more information"
+    exit 1
+  fi
+}
+
 for opt do
   optarg=$(expr "x$opt" : 'x[^=]*=\(.*\)')
   case "$opt" in
@@ -1548,6 +1560,8 @@ for opt do
   ;;
   --disable-slirp-smbd) slirp_smbd=no
   ;;
+  --enable-* | --disable-*) meson_option_parse "$opt" "$optarg"
+  ;;
   *)
       echo "ERROR: unknown option $opt"
       echo "Try '$0 --help' for more information"
@@ -1804,11 +1818,9 @@ Advanced options (experts only):
                            enable plugins via shared library loading
   --disable-containers     don't use containers for cross-building
   --gdb=GDB-path           gdb to use for gdbstub tests [$gdb_bin]
-
-Optional features, enabled with --enable-FEATURE and
-disabled with --disable-FEATURE, default is enabled if available
-(unless built with --without-default-features):
-
+EOF
+  meson_options_help
+cat << EOF
   system          all system emulation targets
   user            supported user emulation targets
   linux-user      all linux usermode emulation targets
@@ -4489,7 +4501,8 @@ if test "$skip_meson" = no; then
   mv $cross config-meson.cross
 
   rm -rf meson-private meson-info meson-logs
-  NINJA=$ninja $meson setup \
+  run_meson() {
+    NINJA=$ninja $meson setup \
         --prefix "$prefix" \
         --libdir "$libdir" \
         --libexecdir "$libexecdir" \
@@ -4534,9 +4547,9 @@ if test "$skip_meson" = no; then
         -Dpa=$pa -Daudio_drv_list=$audio_drv_list -Dtcg_interpreter=$tcg_interpreter \
         -Dtrace_backends=$trace_backends -Dtrace_file=$trace_file -Dlinux_aio=$linux_aio \
         -Dnetmap=$netmap -Dvde=$vde \
-        $cross_arg \
-        "$PWD" "$source_path"
-
+        "$@" $cross_arg "$PWD" "$source_path"
+  }
+  eval run_meson $meson_options
   if test "$?" -ne 0 ; then
       error_exit "meson setup failed"
   fi
diff --git a/scripts/meson-buildoptions.py b/scripts/meson-buildoptions.py
new file mode 100755
index 0000000000..71ee56bd22
--- /dev/null
+++ b/scripts/meson-buildoptions.py
@@ -0,0 +1,64 @@
+#! /usr/bin/env python3
+
+# Generate configure command line options handling code, based on Meson's
+# user build options introspection data
+#
+# Copyright (C) 2021 Red Hat, Inc.
+#
+# Author: Paolo Bonzini <pbonzini@redhat.com>
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2, or (at your option)
+# any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program.  If not, see <https://www.gnu.org/licenses/>.
+
+import json
+import textwrap
+import shlex
+import sys
+
+def sh_print(line=""):
+    print('  printf "%s\\n"', shlex.quote(line))
+
+
+def load_options(json):
+    json = [
+        x
+        for x in json
+        if x["section"] == "user"
+        and ":" not in x["name"]
+        and x["name"] not in SKIP_OPTIONS
+    ]
+    return sorted(json, key=lambda x: x["name"])
+
+
+def print_help(options):
+    print("meson_options_help() {")
+    sh_print()
+    sh_print("Optional features, enabled with --enable-FEATURE and")
+    sh_print("disabled with --disable-FEATURE, default is enabled if available")
+    sh_print("(unless built with --without-default-features):")
+    sh_print()
+    print("}")
+
+
+def print_parse(options):
+    print("_meson_option_parse() {")
+    print("  case $1 in")
+    print("    *) return 1 ;;")
+    print("  esac")
+    print("}")
+
+
+options = load_options(json.load(sys.stdin))
+print("# This file is generated by meson-buildoptions.py, do not edit!")
+print_help(options)
+print_parse(options)
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
new file mode 100644
index 0000000000..c8ae205601
--- /dev/null
+++ b/scripts/meson-buildoptions.sh
@@ -0,0 +1,13 @@
+# This file is generated by meson-buildoptions.py, do not edit!
+meson_options_help() {
+  printf "%s\n" ''
+  printf "%s\n" 'Optional features, enabled with --enable-FEATURE and'
+  printf "%s\n" 'disabled with --disable-FEATURE, default is enabled if available'
+  printf "%s\n" '(unless built with --without-default-features):'
+  printf "%s\n" ''
+}
+_meson_option_parse() {
+  case $1 in
+    *) return 1 ;;
+  esac
+}
-- 
2.31.1



