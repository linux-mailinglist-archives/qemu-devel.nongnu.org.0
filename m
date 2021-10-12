Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F0442A3BA
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 14:00:02 +0200 (CEST)
Received: from localhost ([::1]:45006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maGRt-0005tr-H3
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 08:00:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maFin-0000zD-Iy
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:13:27 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:39575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maFil-0007b7-Hk
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:13:25 -0400
Received: by mail-ed1-x52b.google.com with SMTP id ec8so29963410edb.6
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 04:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1SB+Zef0GLzpb6lGFeOX5f4gKa33nByd5TY4QhXmE4w=;
 b=jeFqqU11EehqZvDVfy95+MvgG814IxK3HE/nyvm5PZPP77DUX8R4BrQUSRvyvng33w
 Ap3Lcb5aqTcb/WUpXfE+bVZabA5bODndiGQNrErcMw7kj7OabotK5tvJFI9f59Dd5BoJ
 mlig2yxOulae4oC9H6DTuU9rzifxue4IEeXsQM0L+QKuAqc030LrkEEvWNuj300jqmn/
 hnt/4Ux5xcJG/cHHZ6RR4dlJq0zr2oUkQSVXG5D2N3/U5RuXUv7o9gK3IGb79W085PqM
 +kTGAmRHwlKWWc1rXE5r5Ry1HBb8bDvweVFdJz/G5+r1K1Aud5M5o4wNos2x/zxwExrx
 r8fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1SB+Zef0GLzpb6lGFeOX5f4gKa33nByd5TY4QhXmE4w=;
 b=JdR3UYgRVDnjgLzQe1auroazHFTLA9htaOymFEghr+F+N7RAPZABOI3a+w/X8xbCB4
 k4I8BmN2RrE6DN/ELxt3+GXf28rm6r6cRNG3V1MfaYMQgfEKeBSF/A9bp2PXHzXzUBHw
 BcCHNRMaH69Y6KSILKGIdNN72N6orPox1g1fQeOLAUD9ZCjOJq8LeP+DdQro+jquQ4Zo
 oPKYjKcym/fPd77r7Hzj31JcIbRK0IaY+3tiDpkXnhxVumcNX3B60r5s0CMf6nSjRo5L
 bm7/IQxxgWyxHFQJvvHH8BFvZL97e588+EVyTe0pBI+S+uqqGf14tWuuetjt+ooa9pWA
 9BkA==
X-Gm-Message-State: AOAM533VmnFuZP+KlL2OtMtaF1XxKjW+REUy5ToXr0aUNHUqcngP6Eyp
 gYLOET4eZmKjY48jtwaRd8RsKtkp7J8=
X-Google-Smtp-Source: ABdhPJzHuNhsWsEeEGxC4EmwEJEJ515Mpc/0GLj9fVI0jiDrZzNxeuLPzmc1S+H3+uechfE8KDB2+w==
X-Received: by 2002:a17:906:b184:: with SMTP id
 w4mr31251714ejy.418.1634037202177; 
 Tue, 12 Oct 2021 04:13:22 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m23sm4742802eja.6.2021.10.12.04.13.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 04:13:21 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/24] configure: prepare for auto-generated option parsing
Date: Tue, 12 Oct 2021 13:13:01 +0200
Message-Id: <20211012111302.246627-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211012111302.246627-1-pbonzini@redhat.com>
References: <20211012111302.246627-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
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
Cc: marcandre.lureau@redhat.com, thuth@redhat.com
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



