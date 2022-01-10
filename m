Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 235FC489BE7
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 16:11:17 +0100 (CET)
Received: from localhost ([::1]:56114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6wKK-00082W-87
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 10:11:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n6vqw-000278-H0
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:40:54 -0500
Received: from [2a00:1450:4864:20::52f] (port=33570
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n6vqt-0000Uv-TP
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:40:54 -0500
Received: by mail-ed1-x52f.google.com with SMTP id b13so1094886edn.0
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 06:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aXyUMyG7vbgaYYighFikjZCBWMIv2oSr8qV4nvQV9c0=;
 b=Yg7Lxsig+MbizAYxL43/K2tAjqeiAqxXkm7LVZUiNkvz+OcGFDfH9hwNLchs14d2Td
 6L4QLs17vWYXgZRAKWirQMGzqeqwVLTpPhZhZ7orpzVKc1WdBI9rHC5C0fFBTtmCp9Rh
 0445Q7B0Y3lug81OEI3RnTcXdz/PYK51fIn3a/BAQnpvD1fHLAstTuIxEKvL5j5dQkav
 xQ+myY/kKcsQMYGHqtk4hMbW1CkFchIe5vpyGyaNYX8yI/csSzJnWsGAwcP50eSLA+cG
 lPUavKvRHPHC39RJHlzmlr/L4rMlKd/RJLP55VfstS+NoSFhLI4sfdvmzyG8a3stkFZM
 rI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=aXyUMyG7vbgaYYighFikjZCBWMIv2oSr8qV4nvQV9c0=;
 b=gEi2va1V50vzKeZzTyRT4p9dEz94BeKS/wkA32qzcmP+4peygq8ZC1CV1t8b1xJFGX
 mHuQDZrynSVQYjvvVYfhIloPGGMC9fpWTVo9Z4w3Owx7SWIfq3rszaDbiS8yKcVDLTOx
 iwaM3L5xDi+lqAQovaf6EgRPzGnp/kmrfqIMHf25GWwqHYy/0OPPkC0J+XkF240ZriL/
 HGsN3BNtdoVfUSQh0V1R2usXgwOhtwN6x6LytZFQ+fZWnSbpgB1qog8WXq7xmOi22bFW
 gL6l/g0xHOpLDruiMXKbqAWZFdhnhh+MgzS+pp2PKAWBLueVuPIUoe8lw2AZnK5S0JG7
 2s2Q==
X-Gm-Message-State: AOAM530B7Stbwk+MQisAOvyx5KGBNdju5gfSwMfuq/mZlt1OK674I9NN
 fqkB+tN8UoBveT6U29WoXdZYzimRgOs=
X-Google-Smtp-Source: ABdhPJw719bIeDKK4WrbQCw8zUFgOhSOghzqEXXWPv7l61K0ILc7n3S6j2JRxjr3N594NrAlgsJgIA==
X-Received: by 2002:a17:906:58cc:: with SMTP id
 e12mr19421ejs.755.1641825650505; 
 Mon, 10 Jan 2022 06:40:50 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k25sm2549498ejk.179.2022.01.10.06.40.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 06:40:49 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/18] configure: parse --enable/--disable-strip automatically,
 flip default
Date: Mon, 10 Jan 2022 15:40:24 +0100
Message-Id: <20220110144034.67410-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110144034.67410-1-pbonzini@redhat.com>
References: <20220110144034.67410-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Always include the STRIP variable in config-host.mak (it's only used
by the s390-ccw firmware build, and it adds a default if configure
omitted it), and use meson-buildoptions.sh to turn
--enable/--disable-strip into -Dstrip.

The default is now not to strip the binaries like for almost every other
package that has a configure script.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     | 10 +---------
 pc-bios/s390-ccw/Makefile     |  2 --
 scripts/meson-buildoptions.py | 21 ++++++++++++++-------
 scripts/meson-buildoptions.sh |  3 +++
 4 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/configure b/configure
index a02febe09c..be05bcf856 100755
--- a/configure
+++ b/configure
@@ -307,7 +307,6 @@ debug="no"
 sanitizers="no"
 tsan="no"
 fortify_source="$default_feature"
-strip_opt="yes"
 mingw32="no"
 gcov="no"
 EXESUF=""
@@ -892,7 +891,6 @@ for opt do
       debug_tcg="yes"
       debug_mutex="yes"
       debug="yes"
-      strip_opt="no"
       fortify_source="no"
   ;;
   --enable-sanitizers) sanitizers="yes"
@@ -903,8 +901,6 @@ for opt do
   ;;
   --disable-tsan) tsan="no"
   ;;
-  --disable-strip) strip_opt="no"
-  ;;
   --disable-slirp) slirp="disabled"
   ;;
   --enable-slirp) slirp="enabled"
@@ -1367,7 +1363,6 @@ Advanced options (experts only):
   --enable-debug           enable common debug build options
   --enable-sanitizers      enable default sanitizers
   --enable-tsan            enable thread sanitizer
-  --disable-strip          disable stripping binaries
   --disable-werror         disable compilation abort on warning
   --disable-stack-protector disable compiler-provided stack protection
   --audio-drv-list=LIST    set audio drivers to try if -audiodev is not used
@@ -3315,9 +3310,6 @@ echo "GIT_SUBMODULES_ACTION=$git_submodules_action" >> $config_host_mak
 if test "$debug_tcg" = "yes" ; then
   echo "CONFIG_DEBUG_TCG=y" >> $config_host_mak
 fi
-if test "$strip_opt" = "yes" ; then
-  echo "STRIP=${strip}" >> $config_host_mak
-fi
 if test "$mingw32" = "yes" ; then
   echo "CONFIG_WIN32=y" >> $config_host_mak
   if test "$guest_agent_with_vss" = "yes" ; then
@@ -3595,6 +3587,7 @@ echo "GLIB_LIBS=$glib_libs" >> $config_host_mak
 echo "GLIB_VERSION=$(pkg-config --modversion glib-2.0)" >> $config_host_mak
 echo "QEMU_LDFLAGS=$QEMU_LDFLAGS" >> $config_host_mak
 echo "LD_I386_EMULATION=$ld_i386_emulation" >> $config_host_mak
+echo "STRIP=$strip" >> $config_host_mak
 echo "EXESUF=$EXESUF" >> $config_host_mak
 echo "LIBS_QGA=$libs_qga" >> $config_host_mak
 
@@ -3812,7 +3805,6 @@ if test "$skip_meson" = no; then
         -Doptimization=$(if test "$debug" = yes; then echo 0; else echo 2; fi) \
         -Ddebug=$(if test "$debug_info" = yes; then echo true; else echo false; fi) \
         -Dwerror=$(if test "$werror" = yes; then echo true; else echo false; fi) \
-        -Dstrip=$(if test "$strip_opt" = yes; then echo true; else echo false; fi) \
         -Db_pie=$(if test "$pie" = yes; then echo true; else echo false; fi) \
         -Db_coverage=$(if test "$gcov" = yes; then echo true; else echo false; fi) \
         -Db_lto=$lto -Dcfi=$cfi -Dtcg=$tcg -Dxen=$xen \
diff --git a/pc-bios/s390-ccw/Makefile b/pc-bios/s390-ccw/Makefile
index cee9d2c63b..0eb68efc7b 100644
--- a/pc-bios/s390-ccw/Makefile
+++ b/pc-bios/s390-ccw/Makefile
@@ -44,8 +44,6 @@ build-all: s390-ccw.img s390-netboot.img
 s390-ccw.elf: $(OBJECTS)
 	$(call quiet-command,$(CC) $(LDFLAGS) -o $@ $(OBJECTS),"BUILD","$(TARGET_DIR)$@")
 
-STRIP ?= strip
-
 s390-ccw.img: s390-ccw.elf
 	$(call quiet-command,$(STRIP) --strip-unneeded $< -o $@,"STRIP","$(TARGET_DIR)$@")
 
diff --git a/scripts/meson-buildoptions.py b/scripts/meson-buildoptions.py
index 96969d89ee..98ae944148 100755
--- a/scripts/meson-buildoptions.py
+++ b/scripts/meson-buildoptions.py
@@ -36,6 +36,10 @@
     "trace_file",
 }
 
+BUILTIN_OPTIONS = {
+    "strip",
+}
+
 LINE_WIDTH = 76
 
 
@@ -90,14 +94,17 @@ def allow_arg(opt):
     return not (set(opt["choices"]) <= {"auto", "disabled", "enabled"})
 
 
+def filter_options(json):
+    if ":" in json["name"]:
+        return False
+    if json["section"] == "user":
+        return json["name"] not in SKIP_OPTIONS
+    else:
+        return json["name"] in BUILTIN_OPTIONS
+
+
 def load_options(json):
-    json = [
-        x
-        for x in json
-        if x["section"] == "user"
-        and ":" not in x["name"]
-        and x["name"] not in SKIP_OPTIONS
-    ]
+    json = [x for x in json if filter_options(x)]
     return sorted(json, key=lambda x: x["name"])
 
 
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 50bd7bed4d..a4af02c527 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -13,6 +13,7 @@ meson_options_help() {
   printf "%s\n" '                           jemalloc/system/tcmalloc)'
   printf "%s\n" '  --enable-slirp[=CHOICE]  Whether and how to find the slirp library'
   printf "%s\n" '                           (choices: auto/disabled/enabled/internal/system)'
+  printf "%s\n" '  --enable-strip           Strip targets on install'
   printf "%s\n" '  --enable-tcg-interpreter TCG with bytecode interpreter (slow)'
   printf "%s\n" '  --enable-trace-backends=CHOICE'
   printf "%s\n" '                           Set available tracing backends [log] (choices:'
@@ -237,6 +238,8 @@ _meson_option_parse() {
     --disable-spice) printf "%s" -Dspice=disabled ;;
     --enable-spice-protocol) printf "%s" -Dspice_protocol=enabled ;;
     --disable-spice-protocol) printf "%s" -Dspice_protocol=disabled ;;
+    --enable-strip) printf "%s" -Dstrip=true ;;
+    --disable-strip) printf "%s" -Dstrip=false ;;
     --enable-tcg) printf "%s" -Dtcg=enabled ;;
     --disable-tcg) printf "%s" -Dtcg=disabled ;;
     --enable-tcg-interpreter) printf "%s" -Dtcg_interpreter=true ;;
-- 
2.33.1



