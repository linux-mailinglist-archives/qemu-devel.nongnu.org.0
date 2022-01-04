Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6F248443E
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 16:08:33 +0100 (CET)
Received: from localhost ([::1]:52946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4lQO-0002mP-8n
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 10:08:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n4lGU-00077O-Kh
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 09:58:18 -0500
Received: from [2a00:1450:4864:20::534] (port=36563
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n4lGS-0004Sv-EQ
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 09:58:17 -0500
Received: by mail-ed1-x534.google.com with SMTP id q14so141736008edi.3
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 06:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6PcERMUghxJSRl5rwd0mke+3ok8bkde8T6lIuSD9j10=;
 b=nuxxUjBdmfzMJ+W0KE5rNZ5KuS8MTeZ9uRLUX+/ed0mDgkJLVM6zf2ddnka/T6h9V2
 PpAqkjezbCuGvcJWxqWPuPUjhvitydId8CtD9ubD+qJHWrJkPEZswWnAw+CE2GUEjv2z
 J1bcG+CQT2PIw5s/QuOdckA7MLKzYCrd7+3G9yIEc4LlPdCkcTi3Ckb6irMLI8A5SGGX
 HEhlK+RPe1d4B4dileG+rKDCzxU2/Qnu0mHP0Kc5lgDEFo/0MK1CwkEl73Xcu5Xtcrzi
 uSbRhzaEyVqdORYKySgz+6uG0kPbFrdaYbxwPMJ3ZUIrt1MY6WpQxZThb7JpaXjwwmJs
 ZL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6PcERMUghxJSRl5rwd0mke+3ok8bkde8T6lIuSD9j10=;
 b=e8d0+bLnoN7O14rsQll99kSViEDufn3SwMpVB8DEWwNwZzJbYdFF8MMkvYCaXjeTcn
 yAMo1+mxrQKZGJWzd6PtiDxdwfIycEcLi09hxkiK4Z8odNi4gD6CYFNN2BS6jhKWoRIT
 zfuigmFGG5n7F5gZ+aBd8TYpZJjtPVU8+o65huWwdaUn2vcOvVnbTW6kMsrd9FDFGxWN
 1nAHevJgwYjoKyxGFNRJBR8ztIVcANPVIbGJqv5pJ7zVa4YIzprOKEBneMtURNVVkuCc
 /dhr/G1oAe0s7Brc/H7qbFtBP6F6eHUpnuyV3JHpwGPtlTvNfhvIQaadSZdcZS/Be0En
 O0Tg==
X-Gm-Message-State: AOAM532RBbG9PZvaGayJkXylPdr6mFLuvMBdcYq7uRTJekqG/QENCOml
 gN3MZzLEnV3c1drC6Ofo5i/9lVgwBKk=
X-Google-Smtp-Source: ABdhPJzlQn8ey6R29zSRnfxw8hw7SOqoS616/H6JaSW+UD65/rTEeGLzKuPRXiowMvKuE+fb4V/HPg==
X-Received: by 2002:a17:906:5d15:: with SMTP id
 g21mr38702432ejt.350.1641308294449; 
 Tue, 04 Jan 2022 06:58:14 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id j21sm11475964ejj.133.2022.01.04.06.58.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 06:58:14 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/15] configure: parse --enable/--disable-strip automatically,
 flip default
Date: Tue,  4 Jan 2022 15:57:42 +0100
Message-Id: <20220104145749.417387-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220104145749.417387-1-pbonzini@redhat.com>
References: <20220104145749.417387-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
index 851eb35dbe..9e01b2278e 100755
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
@@ -3314,9 +3309,6 @@ echo "GIT_SUBMODULES_ACTION=$git_submodules_action" >> $config_host_mak
 if test "$debug_tcg" = "yes" ; then
   echo "CONFIG_DEBUG_TCG=y" >> $config_host_mak
 fi
-if test "$strip_opt" = "yes" ; then
-  echo "STRIP=${strip}" >> $config_host_mak
-fi
 if test "$mingw32" = "yes" ; then
   echo "CONFIG_WIN32=y" >> $config_host_mak
   if test "$guest_agent_with_vss" = "yes" ; then
@@ -3594,6 +3586,7 @@ echo "GLIB_LIBS=$glib_libs" >> $config_host_mak
 echo "GLIB_VERSION=$(pkg-config --modversion glib-2.0)" >> $config_host_mak
 echo "QEMU_LDFLAGS=$QEMU_LDFLAGS" >> $config_host_mak
 echo "LD_I386_EMULATION=$ld_i386_emulation" >> $config_host_mak
+echo "STRIP=$strip" >> $config_host_mak
 echo "EXESUF=$EXESUF" >> $config_host_mak
 echo "LIBS_QGA=$libs_qga" >> $config_host_mak
 
@@ -3811,7 +3804,6 @@ if test "$skip_meson" = no; then
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



