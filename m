Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B986FEF6B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 11:54:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px2wt-0000Pz-J9; Thu, 11 May 2023 05:50:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px2ws-0000PZ-43
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:50:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px2wq-0006iL-Ai
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:50:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683798655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0D2wJ5DmgR5CzzS6zefwAJwP9qsoNw7m6ombVsmpwSA=;
 b=KLW1kPhrw7bDmy5AA+NzFrn2WRYia4khGjIptuKK5Xn8H8Hrerip3iVSIUkfiqteQIMLN1
 pSCwzXv0Z3KwYiLRAG/ndRtaeZOuCkUlyRlYxrtrzjekpWUQl89QcXkbnqg7/ZNyAr5CWd
 wvPw0VR64Ak7d4KZ9eFO9qc8qNf3AiE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-3wfKBy9oMeCPadRCAU7MDQ-1; Thu, 11 May 2023 05:50:54 -0400
X-MC-Unique: 3wfKBy9oMeCPadRCAU7MDQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-96a0ce9215bso247443166b.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 02:50:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683798653; x=1686390653;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0D2wJ5DmgR5CzzS6zefwAJwP9qsoNw7m6ombVsmpwSA=;
 b=VljjSwgN+mgra/tdiUALCGpy9/Cd+6/OymnaOUZLwq3GFvTogAu1OBRHoTvOt7H4iT
 QvHaK0RxPr8Zm/z8wqSPMeaQM/se/5I5uPnLpGpF3LhyCFBcinUxune2s9xxUt9WnDgM
 2FepPhFSCmbwrM8MRPCvi6d+cUkfo9b7leqqjPZjzfuRorTz7ZajlBkVGdJ+5qXaqOqw
 sC1LyhTD6ju4HW7cpLob0S9VKPKaGQf1PfX25I/xP9JVx84KPkQL2fwgrv+hQZQYNAXA
 AG+WPR0fs+c1+gdCk9QtXqC3A0lYZ15LKRIM1zCCgkfkksi2ll+NeN5eq/0GpfESFFFb
 j7HA==
X-Gm-Message-State: AC+VfDw1v1VC5HU9l4dRqZZVrZA5+r3roX50tI6dYJ1WNETkIt99chI4
 xujSmc2PiCZscVYyrUPpi54qNftenaXc59NiDqXjyF9pCpEUT3NhZ0ZaTM31tycYjYHm1Jvj2WM
 +qtlljE7Cd3wumUB2GADl8NsYs5K6kFs9+LJO6KbqKO3+lAWXdgiH9kQCwSzkuLKBzj8lD1/7aL
 k=
X-Received: by 2002:a17:906:fe01:b0:951:756d:653c with SMTP id
 wy1-20020a170906fe0100b00951756d653cmr17439489ejb.39.1683798652700; 
 Thu, 11 May 2023 02:50:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6EnWusLN5VS12yuUzX+SmrCCzopRK4bIUTOYoWC+eE0KsGMWSgbp7vBzaIhE3yOK9UyN3APg==
X-Received: by 2002:a17:906:fe01:b0:951:756d:653c with SMTP id
 wy1-20020a170906fe0100b00951756d653cmr17439481ejb.39.1683798652406; 
 Thu, 11 May 2023 02:50:52 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 lt14-20020a170906fa8e00b0094efdfe60dcsm3695174ejb.206.2023.05.11.02.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 02:50:51 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 12/24] build: move SafeStack tests to meson
Date: Thu, 11 May 2023 11:50:09 +0200
Message-Id: <20230511095021.1397802-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230511095021.1397802-1-pbonzini@redhat.com>
References: <20230511095021.1397802-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This disables the old behavior of detecting SafeStack from environment
CFLAGS.  SafeStack is now enabled purely based on the configure arguments.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     | 73 -----------------------------------
 meson.build                   | 26 +++++++++++++
 meson_options.txt             |  2 +
 scripts/meson-buildoptions.sh |  4 ++
 4 files changed, 32 insertions(+), 73 deletions(-)

diff --git a/configure b/configure
index a99fbaf3e7af..3989d2660e47 100755
--- a/configure
+++ b/configure
@@ -227,7 +227,6 @@ cross_compile="no"
 cross_prefix=""
 host_cc="cc"
 stack_protector=""
-safe_stack=""
 use_containers="yes"
 gdb_bin=$(command -v "gdb-multiarch" || command -v "gdb")
 gdb_arches=""
@@ -830,10 +829,6 @@ for opt do
   ;;
   --disable-stack-protector) stack_protector="no"
   ;;
-  --enable-safe-stack) safe_stack="yes"
-  ;;
-  --disable-safe-stack) safe_stack="no"
-  ;;
   --enable-cfi)
       cfi="true";
       meson_option_add -Db_lto=true
@@ -1024,8 +1019,6 @@ cat << EOF
   pie             Position Independent Executables
   debug-tcg       TCG debugging (default is disabled)
   debug-info      debugging information
-  safe-stack      SafeStack Stack Smash Protection. Depends on
-                  clang/llvm and requires coroutine backend ucontext.
 
 NOTE: The object files are built at the place where configure is launched
 EOF
@@ -1521,68 +1514,6 @@ else
   esac
 fi
 
-##################################################
-# SafeStack
-
-
-if test "$safe_stack" = "yes"; then
-cat > $TMPC << EOF
-int main(void)
-{
-#if ! __has_feature(safe_stack)
-#error SafeStack Disabled
-#endif
-    return 0;
-}
-EOF
-  flag="-fsanitize=safe-stack"
-  # Check that safe-stack is supported and enabled.
-  if compile_prog "-Werror $flag" "$flag"; then
-    # Flag needed both at compilation and at linking
-    QEMU_CFLAGS="$QEMU_CFLAGS $flag"
-    QEMU_LDFLAGS="$QEMU_LDFLAGS $flag"
-  else
-    error_exit "SafeStack not supported by your compiler"
-  fi
-  if test "$coroutine" != "ucontext"; then
-    error_exit "SafeStack is only supported by the coroutine backend ucontext"
-  fi
-else
-cat > $TMPC << EOF
-int main(void)
-{
-#if defined(__has_feature)
-#if __has_feature(safe_stack)
-#error SafeStack Enabled
-#endif
-#endif
-    return 0;
-}
-EOF
-if test "$safe_stack" = "no"; then
-  # Make sure that safe-stack is disabled
-  if ! compile_prog "-Werror" ""; then
-    # SafeStack was already enabled, try to explicitly remove the feature
-    flag="-fno-sanitize=safe-stack"
-    if ! compile_prog "-Werror $flag" "$flag"; then
-      error_exit "Configure cannot disable SafeStack"
-    fi
-    QEMU_CFLAGS="$QEMU_CFLAGS $flag"
-    QEMU_LDFLAGS="$QEMU_LDFLAGS $flag"
-  fi
-else # "$safe_stack" = ""
-  # Set safe_stack to yes or no based on pre-existing flags
-  if compile_prog "-Werror" ""; then
-    safe_stack="no"
-  else
-    safe_stack="yes"
-    if test "$coroutine" != "ucontext"; then
-      error_exit "SafeStack is only supported by the coroutine backend ucontext"
-    fi
-  fi
-fi
-fi
-
 ########################################
 # check if ccache is interfering with
 # semantic analysis of macros
@@ -2242,10 +2173,6 @@ if test "$ccache_cpp2" = "yes"; then
   echo "export CCACHE_CPP2=y" >> $config_host_mak
 fi
 
-if test "$safe_stack" = "yes"; then
-  echo "CONFIG_SAFESTACK=y" >> $config_host_mak
-fi
-
 # tests/tcg configuration
 (config_host_mak=tests/tcg/config-host.mak
 mkdir -p tests/tcg
diff --git a/meson.build b/meson.build
index 4a52c870813b..31151f240ad8 100644
--- a/meson.build
+++ b/meson.build
@@ -211,6 +211,31 @@ if get_option('prefer_static')
   qemu_ldflags += get_option('b_pie') ? '-static-pie' : '-static'
 endif
 
+# Compiles if SafeStack *not* enabled
+safe_stack_probe = '''
+  int main(void)
+  {
+  #if defined(__has_feature)
+  #if __has_feature(safe_stack)
+  #error SafeStack Enabled
+  #endif
+  #endif
+      return 0;
+  }'''
+if get_option('safe_stack') != not cc.compiles(safe_stack_probe)
+  safe_stack_arg = get_option('safe_stack') ? '-fsanitize=safe-stack' : '-fno-sanitize=safe-stack'
+  if get_option('safe_stack') != not cc.compiles(safe_stack_probe, args: safe_stack_arg)
+    error(get_option('safe_stack') \
+          ? 'SafeStack not supported by your compiler' \
+          : 'Cannot disable SafeStack')
+  endif
+  qemu_cflags += safe_stack_arg
+  qemu_ldflags += safe_stack_arg
+endif
+if get_option('safe_stack') and config_host['CONFIG_COROUTINE_BACKEND'] != 'ucontext'
+  error('SafeStack is only supported with the ucontext coroutine backend')
+endif
+
 if get_option('sanitizers')
   if cc.has_argument('-fsanitize=address')
     qemu_cflags = ['-fsanitize=address'] + qemu_cflags
@@ -1946,6 +1971,7 @@ config_host_data.set('CONFIG_OPENGL', opengl.found())
 config_host_data.set('CONFIG_PROFILER', get_option('profiler'))
 config_host_data.set('CONFIG_RBD', rbd.found())
 config_host_data.set('CONFIG_RDMA', rdma.found())
+config_host_data.set('CONFIG_SAFESTACK', get_option('safe_stack'))
 config_host_data.set('CONFIG_SDL', sdl.found())
 config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
 config_host_data.set('CONFIG_SECCOMP', seccomp.found())
diff --git a/meson_options.txt b/meson_options.txt
index 71cc9c85703f..f04b12ca0783 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -82,6 +82,8 @@ option('tcg', type: 'feature', value: 'enabled',
        description: 'TCG support')
 option('tcg_interpreter', type: 'boolean', value: false,
        description: 'TCG with bytecode interpreter (slow)')
+option('safe_stack', type: 'boolean', value: false,
+       description: 'SafeStack Stack Smash Protection (requires clang/llvm and coroutine backend ucontext)')
 option('sanitizers', type: 'boolean', value: false,
        description: 'enable default sanitizers')
 option('tsan', type: 'boolean', value: false,
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 7485012d4634..5ea787deb89e 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -39,6 +39,8 @@ meson_options_help() {
   printf "%s\n" '  --enable-profiler        profiler support'
   printf "%s\n" '  --enable-rng-none        dummy RNG, avoid using /dev/(u)random and'
   printf "%s\n" '                           getrandom()'
+  printf "%s\n" '  --enable-safe-stack      SafeStack Stack Smash Protection (requires'
+  printf "%s\n" '                           clang/llvm and coroutine backend ucontext)'
   printf "%s\n" '  --enable-sanitizers      enable default sanitizers'
   printf "%s\n" '  --enable-strip           Strip targets on install'
   printf "%s\n" '  --enable-tcg-interpreter TCG with bytecode interpreter (slow)'
@@ -401,6 +403,8 @@ _meson_option_parse() {
     --disable-replication) printf "%s" -Dreplication=disabled ;;
     --enable-rng-none) printf "%s" -Drng_none=true ;;
     --disable-rng-none) printf "%s" -Drng_none=false ;;
+    --enable-safe-stack) printf "%s" -Dsafe_stack=true ;;
+    --disable-safe-stack) printf "%s" -Dsafe_stack=false ;;
     --enable-sanitizers) printf "%s" -Dsanitizers=true ;;
     --disable-sanitizers) printf "%s" -Dsanitizers=false ;;
     --enable-sdl) printf "%s" -Dsdl=enabled ;;
-- 
2.40.1


