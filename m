Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF1B514FE7
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 17:50:15 +0200 (CEST)
Received: from localhost ([::1]:34842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkSso-0002O4-Lh
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 11:50:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkSSv-0002Hd-Dy
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:23:29 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:35624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkSSt-0006A8-Gz
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:23:29 -0400
Received: by mail-ej1-x636.google.com with SMTP id l7so16128958ejn.2
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 08:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TDKgpDUBJFawzQptchyXNMTmHIswdR7OJFhEI4kP5hs=;
 b=CATcjtHnDB3jyLTROmAZCpXxWpz0+YIuOhRr/c6d0VtAcn2pzKGmeV26Gr4Fa3st71
 uZEwjnOjMjGFuRzVncnA9ADhLMpPcYri0vXbpx9htj+qKcu7qFYpP9M7W19UQErFJxJ5
 WEfBajOTqikSgAP4oYyTN72p2NdUMvYv/8O7ezi/HMhUODbuNaswOImzqOmeKVqeheyl
 xRRvb9dSEBjRotdefArKEhupijz2u/8lpqEnB2xf9cLefzlkcPCFniuLuApyqSBUY5wC
 CqCpcH02AIA9+qxRb6aG8PwjqlLS+r/0QAVZRfQWmsJqrirM/pwvfmZxEnIVmyDBEvOT
 +pNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TDKgpDUBJFawzQptchyXNMTmHIswdR7OJFhEI4kP5hs=;
 b=6wQTEb1VhoQgtvhd2wkZuB7umYhOiXavHYeFw6F25oPlLK2B2k7Pr2h2rWIOtVIkyw
 V74JyJqDfMNsuXfek0QV6wVPjYime14YBD2fcfeYXg7k4o23ztPvL5Qhipv1zpwlUh8F
 Ocu/+UJRDDulRj5nX7iZAo0mpGWxJJSVsdYUCm7OUnvZxN3Bz9uqYkSsJdv6CLD3low4
 2Y/nRkMc+4BVJgxQnljS53FzMVrjF3OzRIPNs0kN0/PSs/1tfSNjc0R1ex5awgIOchfR
 5adblrx0nvy2Bm7LhYU/IGuLGARKBQDOVMs6pA9PoHid9QxTwj39AKDkVYrhmY8Tcn53
 CgJg==
X-Gm-Message-State: AOAM530UNNgAYvOxpt/Lh7LiWTxSFmkpb9XQuj6+Yb+fsAQxhAwPzpuY
 4kpSms+jaDoq1d98Ho/pMi395w9A6NaRsA==
X-Google-Smtp-Source: ABdhPJwyp6mf8WDkB/6on1N4oSUKs4vD88UxfkttluJZNpXzNP7ty4m2nAxs/51/Wpxu0gl3vKArGg==
X-Received: by 2002:a17:907:168a:b0:6e8:d125:1d24 with SMTP id
 hc10-20020a170907168a00b006e8d1251d24mr35896942ejc.508.1651245806103; 
 Fri, 29 Apr 2022 08:23:26 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 w25-20020a170907271900b006f3ef214dd6sm736395ejk.60.2022.04.29.08.23.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 08:23:25 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/25] meson: pass more options directly as -D
Date: Fri, 29 Apr 2022 17:23:02 +0200
Message-Id: <20220429152312.335715-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429152312.335715-1-pbonzini@redhat.com>
References: <20220429152312.335715-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If an option is not used anywhere by the configure script, it can be just
added to $meson_options even if it is not parsed by the automatically
generated bits in scripts/meson-buildoptions.sh.

The only slightly tricky case is $debug, where the

  if test "$fortify_source" = "yes" ; then
    QEMU_CFLAGS="-U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 $QEMU_CFLAGS"
    debug=no
  fi

assignment is dead; configure sets fortify_source=no whenever debug=yes.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     | 39 ++++++++++-------------------------
 meson.build                   |  2 +-
 scripts/meson-buildoptions.py |  4 ++++
 scripts/meson-buildoptions.sh |  6 ++++++
 4 files changed, 22 insertions(+), 29 deletions(-)

diff --git a/configure b/configure
index b8e3176808..fc7868948b 100755
--- a/configure
+++ b/configure
@@ -235,7 +235,6 @@ static="no"
 cross_compile="no"
 cross_prefix=""
 host_cc="cc"
-lto="false"
 stack_protector=""
 safe_stack=""
 use_containers="yes"
@@ -291,13 +290,10 @@ vhost_vsock="$default_feature"
 vhost_user="no"
 vhost_user_fs="$default_feature"
 vhost_vdpa="$default_feature"
-debug_info="yes"
 debug_tcg="no"
-debug="no"
 sanitizers="no"
 tsan="no"
 fortify_source="yes"
-gcov="no"
 EXESUF=""
 modules="no"
 prefix="/usr/local"
@@ -327,10 +323,7 @@ else
 fi
 fdt="auto"
 
-# 2. Support --with/--without option
-default_devices="true"
-
-# 3. Automatically enable/disable other options
+# 2. Automatically enable/disable other options
 tcg="enabled"
 cfi="false"
 
@@ -680,6 +673,9 @@ werror=""
 . $source_path/scripts/meson-buildoptions.sh
 
 meson_options=
+meson_option_add() {
+  meson_options="$meson_options $(quote_sh "$1")"
+}
 meson_option_parse() {
   meson_options="$meson_options $(_meson_option_parse "$@")"
   if test $? -eq 1; then
@@ -732,9 +728,9 @@ for opt do
   ;;
   --cross-cc-*)
   ;;
-  --enable-debug-info) debug_info="yes"
+  --enable-debug-info) meson_option_add -Ddebug=true
   ;;
-  --disable-debug-info) debug_info="no"
+  --disable-debug-info) meson_option_add -Ddebug=false
   ;;
   --enable-modules)
       modules="yes"
@@ -754,9 +750,9 @@ for opt do
                        error_exit "Can't mix --target-list-exclude with --target-list"
                    fi
   ;;
-  --with-default-devices) default_devices="true"
+  --with-default-devices) meson_option_add -Ddefault_devices=true
   ;;
-  --without-default-devices) default_devices="false"
+  --without-default-devices) meson_option_add -Ddefault_devices=false
   ;;
   --with-devices-*[!a-zA-Z0-9_-]*=*) error_exit "Passed bad --with-devices-FOO option"
   ;;
@@ -772,8 +768,6 @@ for opt do
   ;;
   --without-default-features) # processed above
   ;;
-  --enable-gcov) gcov="yes"
-  ;;
   --static)
     static="yes"
     QEMU_PKG_CONFIG_FLAGS="--static $QEMU_PKG_CONFIG_FLAGS"
@@ -800,7 +794,7 @@ for opt do
       # Enable debugging options that aren't excessively noisy
       debug_tcg="yes"
       meson_option_parse --enable-debug-mutex ""
-      debug="yes"
+      meson_option_add -Doptimization=0
       fortify_source="no"
   ;;
   --enable-sanitizers) sanitizers="yes"
@@ -849,10 +843,6 @@ for opt do
   ;;
   --disable-werror) werror="no"
   ;;
-  --enable-lto) lto="true"
-  ;;
-  --disable-lto) lto="false"
-  ;;
   --enable-stack-protector) stack_protector="yes"
   ;;
   --disable-stack-protector) stack_protector="no"
@@ -863,7 +853,7 @@ for opt do
   ;;
   --enable-cfi)
       cfi="true";
-      lto="true";
+      meson_option_add -Db_lto=true
   ;;
   --disable-cfi) cfi="false"
   ;;
@@ -1101,7 +1091,6 @@ Advanced options (experts only):
   --cpu=CPU                Build for host CPU [$cpu]
   --with-coroutine=BACKEND coroutine backend. Supported options:
                            ucontext, sigaltstack, windows
-  --enable-gcov            enable test coverage analysis with gcov
   --enable-plugins
                            enable plugins via shared library loading
   --disable-containers     don't use containers for cross-building
@@ -1117,7 +1106,6 @@ cat << EOF
   modules         modules support (non-Windows)
   debug-tcg       TCG debugging (default is disabled)
   debug-info      debugging information
-  lto             Enable Link-Time Optimization.
   safe-stack      SafeStack Stack Smash Protection. Depends on
                   clang/llvm >= 3.7 and requires coroutine backend ucontext.
   vhost-net       vhost-net kernel acceleration support
@@ -1938,7 +1926,6 @@ write_c_skeleton
 
 if test "$fortify_source" = "yes" ; then
   QEMU_CFLAGS="-U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 $QEMU_CFLAGS"
-  debug=no
 fi
 
 case "$ARCH" in
@@ -2367,15 +2354,11 @@ if test "$skip_meson" = no; then
     NINJA=$ninja $meson setup \
         --prefix "$prefix" \
         --bindir "$bindir" \
-        -Ddefault_devices=$default_devices \
         -Dqemu_suffix="$qemu_suffix" \
         -Dsmbd="$smbd" \
-        -Doptimization=$(if test "$debug" = yes; then echo 0; else echo 2; fi) \
-        -Ddebug=$(if test "$debug_info" = yes; then echo true; else echo false; fi) \
         -Dwerror=$(if test "$werror" = yes; then echo true; else echo false; fi) \
         -Db_pie=$(if test "$pie" = yes; then echo true; else echo false; fi) \
-        -Db_coverage=$(if test "$gcov" = yes; then echo true; else echo false; fi) \
-        -Db_lto=$lto -Dcfi=$cfi -Dtcg=$tcg \
+        -Dcfi=$cfi -Dtcg=$tcg \
         -Dcapstone=$capstone -Dfdt=$fdt -Dslirp=$slirp \
         $(test -n "${LIB_FUZZING_ENGINE+xxx}" && echo "-Dfuzzing_engine=$LIB_FUZZING_ENGINE") \
         $(if test "$default_feature" = no; then echo "-Dauto_features=disabled"; fi) \
diff --git a/meson.build b/meson.build
index 21135fbc52..19966e0a5a 100644
--- a/meson.build
+++ b/meson.build
@@ -1,6 +1,6 @@
 project('qemu', ['c'], meson_version: '>=0.59.3',
         default_options: ['warning_level=1', 'c_std=gnu11', 'cpp_std=gnu++11', 'b_colorout=auto',
-                          'b_staticpic=false', 'stdsplit=false'],
+                          'b_staticpic=false', 'stdsplit=false', 'optimization=2'],
         version: files('VERSION'))
 
 add_test_setup('quick', exclude_suites: ['slow', 'thorough'], is_default: true)
diff --git a/scripts/meson-buildoptions.py b/scripts/meson-buildoptions.py
index 45cda8cd84..e624c16b01 100755
--- a/scripts/meson-buildoptions.py
+++ b/scripts/meson-buildoptions.py
@@ -33,6 +33,8 @@
 }
 
 OPTION_NAMES = {
+    "b_coverage": "gcov",
+    "b_lto": "lto",
     "malloc": "enable-malloc",
     "pkgversion": "with-pkgversion",
     "qemu_firmwarepath": "firmwarepath",
@@ -41,6 +43,8 @@
 }
 
 BUILTIN_OPTIONS = {
+    "b_coverage",
+    "b_lto",
     "datadir",
     "includedir",
     "libdir",
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index f6a9b05c40..4b0770a9e0 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -27,7 +27,9 @@ meson_options_help() {
   printf "%s\n" '  --enable-fdt[=CHOICE]    Whether and how to find the libfdt library'
   printf "%s\n" '                           (choices: auto/disabled/enabled/internal/system)'
   printf "%s\n" '  --enable-fuzzing         build fuzzing targets'
+  printf "%s\n" '  --enable-gcov            Enable coverage tracking.'
   printf "%s\n" '  --enable-gprof           QEMU profiling with gprof'
+  printf "%s\n" '  --enable-lto             Use link time optimization'
   printf "%s\n" '  --enable-malloc=CHOICE   choose memory allocator to use [system] (choices:'
   printf "%s\n" '                           jemalloc/system/tcmalloc)'
   printf "%s\n" '  --enable-module-upgrades try to load modules from alternate paths for'
@@ -182,6 +184,10 @@ _meson_option_parse() {
     --disable-avx2) printf "%s" -Davx2=disabled ;;
     --enable-avx512f) printf "%s" -Davx512f=enabled ;;
     --disable-avx512f) printf "%s" -Davx512f=disabled ;;
+    --enable-gcov) printf "%s" -Db_coverage=true ;;
+    --disable-gcov) printf "%s" -Db_coverage=false ;;
+    --enable-lto) printf "%s" -Db_lto=true ;;
+    --disable-lto) printf "%s" -Db_lto=false ;;
     --block-drv-ro-whitelist=*) quote_sh "-Dblock_drv_ro_whitelist=$2" ;;
     --block-drv-rw-whitelist=*) quote_sh "-Dblock_drv_rw_whitelist=$2" ;;
     --enable-block-drv-whitelist-in-tools) printf "%s" -Dblock_drv_whitelist_in_tools=true ;;
-- 
2.35.1



