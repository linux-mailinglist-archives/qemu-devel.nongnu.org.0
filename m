Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2488C47BE92
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 12:07:52 +0100 (CET)
Received: from localhost ([::1]:56848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzczm-0008Hs-T8
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 06:07:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mzcxc-0005KE-OE
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 06:05:36 -0500
Received: from [2a00:1450:4864:20::334] (port=38866
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mzcxZ-0004z2-W1
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 06:05:36 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 203-20020a1c01d4000000b00345bf98da86so148476wmb.3
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 03:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zZnWpUrFsd4X6ucpppSrhV5R5jyds34wDHKY5lrugqk=;
 b=aW3bgTZYvnj+yP+8oLv5O+e7dG/A0CTVXHbO3c1Wxx9ewQLVqn1ij4z+h9ljTZpPrB
 5dfAWmyna4qg8W/+hz8t1EXm48lNJdp5Tm1jwL4B4ZK7aBzKq0tGZog1MUlhx8dFDp6G
 DT35Q1HQylHWV6Wfq/raqJgWmAQbHZuxcCaxq04CzLwE5sdQoFLnIM1g70o6+Ftwoiy8
 24eSPVNa6n8cEnUiWhRT2qfFyqlUQbusNDTEVVpyMMLxHlDBhw4Zbxa3OqvoMcVHKag0
 o9dbQnaAKp2CYPJ8EwHyu8dhSlIWn7zs66r8rUJ02fr0qjtLDkTwYwhfcDr13ZF8Zw38
 A0Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zZnWpUrFsd4X6ucpppSrhV5R5jyds34wDHKY5lrugqk=;
 b=AcPNdRj5/nQIFuaxTNMNeaxO45J5aT8ceji+COszzX/cL7xd1TpsaKNJS324HDW9UQ
 6sPZ6j1FmGxXkRNLqz4KQAkyRL9O5Akfw1xclca1whDR5Nf+JM+Kk0X/zv+b9UvWxS9+
 jwDuvj9oNlnFYyU/7KWNHSsV+U8VWrorXF3aCuniV+0L+1GovBZLY0UcYUKEMOajOWB/
 Y2efYjxCSc/6Xm+EHC0fDNCwkm8J+3uyo75pbNz5ywr/m3Muk6Mh5WQQoDBwwjfOL9jD
 2MfkvXHPwYOyMEecx2/cJtMZL5mCA8MxcPGa3ZS44VvsRHzvQqYQ157AlFc34F8Vni4r
 k51w==
X-Gm-Message-State: AOAM531Ywl7gGJmzl6Fgl7ZQQltA0Hau4sK3wpQC4TWGTcudmfGZ+9bs
 YkaQWX6PBLqEMbBQAIXHevSk3FN5cn0=
X-Google-Smtp-Source: ABdhPJxn6nHevGV1lSSk4q2up8Xh7aN/YImI4GWYFT8CdDYT1vSkpZaaZOfl7tcitJsya/3o0MxkAQ==
X-Received: by 2002:a1c:a98f:: with SMTP id s137mr2190013wme.5.1640084732470; 
 Tue, 21 Dec 2021 03:05:32 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id az11sm1949444wmb.30.2021.12.21.03.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 03:05:32 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/8] configure: parse --enable/--disable-strip automatically,
 flip default
Date: Tue, 21 Dec 2021 12:05:22 +0100
Message-Id: <20211221110526.351709-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211221110526.351709-1-pbonzini@redhat.com>
References: <20211221110526.351709-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: richard.henderson@linaro.org
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
index e09e5bb58f..40dd6e8d1b 100755
--- a/configure
+++ b/configure
@@ -308,7 +308,6 @@ debug="no"
 sanitizers="no"
 tsan="no"
 fortify_source="$default_feature"
-strip_opt="yes"
 mingw32="no"
 gcov="no"
 EXESUF=""
@@ -891,7 +890,6 @@ for opt do
       debug_tcg="yes"
       debug_mutex="yes"
       debug="yes"
-      strip_opt="no"
       fortify_source="no"
   ;;
   --enable-sanitizers) sanitizers="yes"
@@ -902,8 +900,6 @@ for opt do
   ;;
   --disable-tsan) tsan="no"
   ;;
-  --disable-strip) strip_opt="no"
-  ;;
   --disable-slirp) slirp="disabled"
   ;;
   --enable-slirp) slirp="enabled"
@@ -1370,7 +1366,6 @@ Advanced options (experts only):
   --enable-debug           enable common debug build options
   --enable-sanitizers      enable default sanitizers
   --enable-tsan            enable thread sanitizer
-  --disable-strip          disable stripping binaries
   --disable-werror         disable compilation abort on warning
   --disable-stack-protector disable compiler-provided stack protection
   --audio-drv-list=LIST    set audio drivers to try if -audiodev is not used
@@ -3340,9 +3335,6 @@ echo "GIT_SUBMODULES_ACTION=$git_submodules_action" >> $config_host_mak
 if test "$debug_tcg" = "yes" ; then
   echo "CONFIG_DEBUG_TCG=y" >> $config_host_mak
 fi
-if test "$strip_opt" = "yes" ; then
-  echo "STRIP=${strip}" >> $config_host_mak
-fi
 if test "$mingw32" = "yes" ; then
   echo "CONFIG_WIN32=y" >> $config_host_mak
   if test "$guest_agent_with_vss" = "yes" ; then
@@ -3622,6 +3614,7 @@ echo "GLIB_CFLAGS=$glib_cflags" >> $config_host_mak
 echo "GLIB_LIBS=$glib_libs" >> $config_host_mak
 echo "QEMU_LDFLAGS=$QEMU_LDFLAGS" >> $config_host_mak
 echo "LD_I386_EMULATION=$ld_i386_emulation" >> $config_host_mak
+echo "STRIP=$strip" >> $config_host_mak
 echo "EXESUF=$EXESUF" >> $config_host_mak
 echo "LIBS_QGA=$libs_qga" >> $config_host_mak
 
@@ -3836,7 +3829,6 @@ if test "$skip_meson" = no; then
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



