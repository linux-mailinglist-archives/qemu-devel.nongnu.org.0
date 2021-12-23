Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 166C547E2D8
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 13:03:54 +0100 (CET)
Received: from localhost ([::1]:39090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Mp7-0008MQ-5Q
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 07:03:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n0MdO-0004JZ-J5
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:51:47 -0500
Received: from [2a00:1450:4864:20::42d] (port=43934
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n0MdK-0008Po-A1
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:51:46 -0500
Received: by mail-wr1-x42d.google.com with SMTP id v11so10923064wrw.10
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 03:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iAU1ngD4aYy4uaSpPfG3FjFmheg2vIvaOe2PUU21OPw=;
 b=kuk9LX/miNNOhPtQRj8sOGthofaxdPosRvliA8I7j9/na9+bNfTKNSXP2fzfxo5hX8
 /NSWy/ju34N0ZUyn9Gzh/4Zbpd6Vn0JoDqcOfvy1j6aXbpuOdCSN/DYCXZbs5/+CAeZm
 tVk6ON72qlI9tIb8bik+N61hMOZpvjyuOezBY8RQkITGpgzcFaX5C50am5h64lPZrt00
 lBk5VSX2h2DLJXOt29gDsjR5eWyjhAtemVcwhGv3hMju7hkHV5wYV+AY6QbcrXXcRcyR
 1nfPq+qyK3ftvGxTYp8fyJH5u2iyh/rBVWtkTjfWJgzUhBbMS75HOw0VcFoaj7FibV+z
 gVLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iAU1ngD4aYy4uaSpPfG3FjFmheg2vIvaOe2PUU21OPw=;
 b=3TVm12S6gNIN15jpBY/cCZZJWKqlIDollXSUZN2ZGQx/XFoY1+uUipSyMrGDTruFv+
 ypjOdbORYEqme9NuDL20fgzDKlZZnTi9C2gzyIHCbzrTHDgwo143+dCqERPuvTXenMZ8
 Hkw/h2low0zTndQ5AOBt7745sdihVTOv9CUEC3t3P2Jar7XwQGXuiuTKXCj5U8IWZCP4
 8rDNlY4FhsTJmDSwlKV+OIh6S4BVkRf3K/bA+CdftQ0dyv1ikPHdPW3N1h7cwp6hW5b8
 Rld0Ds2jPjxww3jBef86h/P+Uo9V6cNAzhlo/k1J2Je3mqnAya7/r9dYsLwtnkvItTsr
 IHYQ==
X-Gm-Message-State: AOAM5307J0x0KYMh0QXJaZ5teBoIyMvWpmLeuKe6IZ05pyvEtS0T3QxW
 4+sCde958uiPcqBPIIXD/52Tsc8tpkk=
X-Google-Smtp-Source: ABdhPJyakzrVTVjH2PQBdDO+VRFGLIKCAzyFkPLVfs+n0FrSPmj2v70wKjegDo6ayvUleRgd5OdBng==
X-Received: by 2002:a5d:64a7:: with SMTP id m7mr1465474wrp.687.1640260301177; 
 Thu, 23 Dec 2021 03:51:41 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o2sm4537106wru.109.2021.12.23.03.51.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 03:51:40 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/15] configure: parse --enable/--disable-strip automatically,
 flip default
Date: Thu, 23 Dec 2021 12:51:28 +0100
Message-Id: <20211223115134.579235-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211223115134.579235-1-pbonzini@redhat.com>
References: <20211223115134.579235-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
index c8b32e7277..302d58102b 100755
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
@@ -890,7 +889,6 @@ for opt do
       debug_tcg="yes"
       debug_mutex="yes"
       debug="yes"
-      strip_opt="no"
       fortify_source="no"
   ;;
   --enable-sanitizers) sanitizers="yes"
@@ -901,8 +899,6 @@ for opt do
   ;;
   --disable-tsan) tsan="no"
   ;;
-  --disable-strip) strip_opt="no"
-  ;;
   --disable-slirp) slirp="disabled"
   ;;
   --enable-slirp) slirp="enabled"
@@ -1365,7 +1361,6 @@ Advanced options (experts only):
   --enable-debug           enable common debug build options
   --enable-sanitizers      enable default sanitizers
   --enable-tsan            enable thread sanitizer
-  --disable-strip          disable stripping binaries
   --disable-werror         disable compilation abort on warning
   --disable-stack-protector disable compiler-provided stack protection
   --audio-drv-list=LIST    set audio drivers to try if -audiodev is not used
@@ -3312,9 +3307,6 @@ echo "GIT_SUBMODULES_ACTION=$git_submodules_action" >> $config_host_mak
 if test "$debug_tcg" = "yes" ; then
   echo "CONFIG_DEBUG_TCG=y" >> $config_host_mak
 fi
-if test "$strip_opt" = "yes" ; then
-  echo "STRIP=${strip}" >> $config_host_mak
-fi
 if test "$mingw32" = "yes" ; then
   echo "CONFIG_WIN32=y" >> $config_host_mak
   if test "$guest_agent_with_vss" = "yes" ; then
@@ -3591,6 +3583,7 @@ echo "GLIB_CFLAGS=$glib_cflags" >> $config_host_mak
 echo "GLIB_LIBS=$glib_libs" >> $config_host_mak
 echo "QEMU_LDFLAGS=$QEMU_LDFLAGS" >> $config_host_mak
 echo "LD_I386_EMULATION=$ld_i386_emulation" >> $config_host_mak
+echo "STRIP=$strip" >> $config_host_mak
 echo "EXESUF=$EXESUF" >> $config_host_mak
 echo "LIBS_QGA=$libs_qga" >> $config_host_mak
 
@@ -3805,7 +3798,6 @@ if test "$skip_meson" = no; then
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
index ae8f18edc2..46360e541d 100644
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
@@ -234,6 +235,8 @@ _meson_option_parse() {
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



