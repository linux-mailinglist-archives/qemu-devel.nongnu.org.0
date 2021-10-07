Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 823E1425413
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 15:28:04 +0200 (CEST)
Received: from localhost ([::1]:45818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYTRL-0003Wt-DY
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 09:28:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mYT8g-0005W5-0y
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:08:46 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:42551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mYT8d-0007ro-ON
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:08:45 -0400
Received: by mail-ed1-x535.google.com with SMTP id t16so1026618eds.9
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 06:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wPfZt50AtHvhepq+XFRdcVCgu4skil/qNVKcLVAqJnk=;
 b=UtOMijWA3gAyhkoxwibMozOhSEV4MV4exk67f/CT/b5h5PsoHMoSVT+uQJkY9JvjC3
 qbTNFSnMf+JsXxtO1IfxUBBzT1A0GRWder6EbnblcSPjh1gazHr5K1deRC1afIj+Zhbu
 WcxLyvXK9fM8qSFN0gjdvXdBHNKjk8F9WdNQ+8EKj5zUhNGZg3Uh/BAZFzw7zfzdtDR3
 2hIxebpBe0x13qbCGoz8rDM34WyoxB6+TBv8bHW6Y2t2gDIyp+HK3r9S3rtNqNeLFJSi
 lzK8zXX3iI9QK3glzV20BWXeC/PzcPSYw+tMOkxXTRDw57/JKgxJHV0z3s+UYxbPuV+J
 DjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wPfZt50AtHvhepq+XFRdcVCgu4skil/qNVKcLVAqJnk=;
 b=G9/xNDaaf5blIMq8cF3Y9WgxTTxVemO3OIk5nWudd+pKueLMDtneOv82qhSGBvPG6m
 js52gTi5G7bGj51L5pg/Ej4776d3nTySdQEkoEpVGUQiHRPuoeNgHozOOV4k8hQ8HEc6
 nelH9CmVhZCg0IDHsxXoNBNJBuXqnPh5WZzDbJNrCHCds7h4r96LvUfwFrGYU1AmVOIj
 yCeA8h17Jn8b401yheWYTbP6IbyvYC+lsctx7FA+j/pKU2sNZ3yS8T4Kn5YekaXH3jaq
 nh7o9AWwWRIhBysUrslTufhN2Yr5emi5LBD3UDiI4qULE2NKAsd6FzHMC6V4wRndb7px
 URdw==
X-Gm-Message-State: AOAM532nLLQm6lSKdnwg+EqsNGOo7TX6XiPYG4BSM8Tic+YRY2iEstiE
 H0nZUM5jM6rmeCeESauCYCRGOIxeblU=
X-Google-Smtp-Source: ABdhPJwHsE5023GIrOEu8qzYSiqpbGuwJpspbyAh1v/uPCqAWbgNDLMh/t1W3kAcVRNI1zzQHFj5ZQ==
X-Received: by 2002:a17:906:2a0d:: with SMTP id
 j13mr5271655eje.545.1633612122314; 
 Thu, 07 Oct 2021 06:08:42 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o12sm791254edw.84.2021.10.07.06.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 06:08:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 23/24] configure: prepare for auto-generated option parsing
Date: Thu,  7 Oct 2021 15:08:28 +0200
Message-Id: <20211007130829.632254-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007130630.632028-1-pbonzini@redhat.com>
References: <20211007130630.632028-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile                      |  8 ++++-
 configure                     | 31 ++++++++++++-----
 scripts/meson-buildoptions.py | 63 +++++++++++++++++++++++++++++++++++
 scripts/meson-buildoptions.sh | 12 +++++++
 4 files changed, 104 insertions(+), 10 deletions(-)
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
index d2f754d5d1..d979476e03 100755
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
@@ -1802,11 +1816,9 @@ Advanced options (experts only):
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
@@ -4487,7 +4499,8 @@ if test "$skip_meson" = no; then
   mv $cross config-meson.cross
 
   rm -rf meson-private meson-info meson-logs
-  NINJA=$ninja $meson setup \
+  run_meson() {
+    NINJA=$ninja $meson setup \
         --prefix "$prefix" \
         --libdir "$libdir" \
         --libexecdir "$libexecdir" \
@@ -4532,9 +4545,9 @@ if test "$skip_meson" = no; then
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
index 0000000000..8948c296b7
--- /dev/null
+++ b/scripts/meson-buildoptions.py
@@ -0,0 +1,63 @@
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
+print_help(options)
+print_parse(options)
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
new file mode 100644
index 0000000000..3be3058a6c
--- /dev/null
+++ b/scripts/meson-buildoptions.sh
@@ -0,0 +1,12 @@
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



