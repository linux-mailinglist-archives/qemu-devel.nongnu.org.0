Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CFE6FEF68
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 11:54:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px2x0-0000V8-HA; Thu, 11 May 2023 05:51:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px2wu-0000Rz-MY
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:51:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px2ws-0006j1-NI
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:51:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683798657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KfwSnT6XAlYyRvPBFxKnMpDe+ydmdwEjkuqhEC5Ju7M=;
 b=ZgOFVG4RcRsnCJUDHghDwyKZ1776mCpKFNOqskweXTl3NulAgGivFXbZpygC9RperMs6T+
 XlgShm+xDgafP8D0r2Mqz6ZGqJCgufUWVzlLUFeCwX5jjcsUVzFJcb3iX2LuY1kz5i8y8n
 BvwYIeo8uncfoOIq8VaY4zxWqxBCGoo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-hMWQXJ81M4moe8GGnj36hw-1; Thu, 11 May 2023 05:50:56 -0400
X-MC-Unique: hMWQXJ81M4moe8GGnj36hw-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-50de0e31eebso1759969a12.3
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 02:50:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683798655; x=1686390655;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KfwSnT6XAlYyRvPBFxKnMpDe+ydmdwEjkuqhEC5Ju7M=;
 b=I93Kkyi8omv0eYHmXn0Ms0nLzJSA/5id1ylF/Z0RJjDG+50hP0vkWfqHrB3do/3u5x
 dKXLtakJKLGHDa6m8N7NmtaXKiiVOFCFZPt5STe7ozDlv3W4iYL3E6u6W1vNgPZWJf5d
 lNoS3gFdYPESKoaDznRt3SbFVc/0FryfrpD4216XlM8/Iyd39JHbQCJcmeMnzc80pF2C
 RbDaSa8A3Etm2spOtz6bs1rBrnIJLUU9nB6vE3qTljLm5wY9LIBgis+kmris/+tFMfE9
 kJXkP2xSPkq7dmHSxsPoAUWd6ORJyWbNhAL5bgRlcWIlsfWHl0J10ieWJkvzMoPHuKSf
 f7dw==
X-Gm-Message-State: AC+VfDwPq96qpfiv4X2DPj73uJSsMF5p7YmE8EkAzVz+JPX4D+47AuWn
 94YMQrLwidcZFNFqUpSq9DkGbecKiudezZhH9LGDsqegOVajSURdqm22p69RSKwj++iXTludKRM
 YWwjhCZyn/xzJrpll5L45rdxnIU8bdtf3bu2E2nTL8/Yd++UYt2Fr11szIp3eqeQT84i/gxFJ8Z
 0=
X-Received: by 2002:aa7:c747:0:b0:50b:fb49:c4a8 with SMTP id
 c7-20020aa7c747000000b0050bfb49c4a8mr16295158eds.27.1683798654945; 
 Thu, 11 May 2023 02:50:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ74dwZgObhKNONamtXW8TEfTSCOWpnPhjlOOIXjPLWlOJRkG+Rx6Gwu7PpAtLLwekJIuVw8Gg==
X-Received: by 2002:aa7:c747:0:b0:50b:fb49:c4a8 with SMTP id
 c7-20020aa7c747000000b0050bfb49c4a8mr16295150eds.27.1683798654634; 
 Thu, 11 May 2023 02:50:54 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a05640203c500b0050d82f96860sm2795605edw.59.2023.05.11.02.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 02:50:53 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 13/24] build: move coroutine backend selection to meson
Date: Thu, 11 May 2023 11:50:10 +0200
Message-Id: <20230511095021.1397802-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230511095021.1397802-1-pbonzini@redhat.com>
References: <20230511095021.1397802-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

To simplify the code, rename coroutine-win32.c to match the option
passed to configure.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                                     | 62 -------------------
 meson.build                                   | 32 +++++++++-
 meson_options.txt                             |  3 +
 scripts/meson-buildoptions.py                 |  1 +
 scripts/meson-buildoptions.sh                 |  3 +
 ...{coroutine-win32.c => coroutine-windows.c} |  0
 util/meson.build                              |  2 +-
 7 files changed, 38 insertions(+), 65 deletions(-)
 rename util/{coroutine-win32.c => coroutine-windows.c} (100%)

diff --git a/configure b/configure
index 3989d2660e47..c264bf4cadee 100755
--- a/configure
+++ b/configure
@@ -282,7 +282,6 @@ softmmu="yes"
 linux_user=""
 bsd_user=""
 pie=""
-coroutine=""
 plugins="$default_feature"
 meson=""
 ninja=""
@@ -843,8 +842,6 @@ for opt do
   ;;
   --enable-fdt=*) fdt="$optarg"
   ;;
-  --with-coroutine=*) coroutine="$optarg"
-  ;;
   --with-git=*) git="$optarg"
   ;;
   --with-git-submodules=*)
@@ -1003,8 +1000,6 @@ Advanced options (experts only):
   --disable-werror         disable compilation abort on warning
   --disable-stack-protector disable compiler-provided stack protection
   --cpu=CPU                Build for host CPU [$cpu]
-  --with-coroutine=BACKEND coroutine backend. Supported options:
-                           ucontext, sigaltstack, windows
   --enable-plugins
                            enable plugins via shared library loading
   --disable-containers     don't use containers for cross-building
@@ -1459,61 +1454,6 @@ case "$fdt" in
     ;;
 esac
 
-##########################################
-# check and set a backend for coroutine
-
-# We prefer ucontext, but it's not always possible. The fallback
-# is sigcontext. On Windows the only valid backend is the Windows
-# specific one.
-
-ucontext_works=no
-if test "$darwin" != "yes"; then
-  cat > $TMPC << EOF
-#include <ucontext.h>
-#ifdef __stub_makecontext
-#error Ignoring glibc stub makecontext which will always fail
-#endif
-int main(void) { makecontext(0, 0, 0); return 0; }
-EOF
-  if compile_prog "" "" ; then
-    ucontext_works=yes
-  fi
-fi
-
-if test "$coroutine" = ""; then
-  if test "$mingw32" = "yes"; then
-    coroutine=win32
-  elif test "$ucontext_works" = "yes"; then
-    coroutine=ucontext
-  else
-    coroutine=sigaltstack
-  fi
-else
-  case $coroutine in
-  windows)
-    if test "$mingw32" != "yes"; then
-      error_exit "'windows' coroutine backend only valid for Windows"
-    fi
-    # Unfortunately the user visible backend name doesn't match the
-    # coroutine-*.c filename for this case, so we have to adjust it here.
-    coroutine=win32
-    ;;
-  ucontext)
-    if test "$ucontext_works" != "yes"; then
-      error_exit "'ucontext' backend requested but makecontext not available"
-    fi
-    ;;
-  sigaltstack)
-    if test "$mingw32" = "yes"; then
-      error_exit "only the 'windows' coroutine backend is valid for Windows"
-    fi
-    ;;
-  *)
-    error_exit "unknown coroutine backend $coroutine"
-    ;;
-  esac
-fi
-
 ########################################
 # check if ccache is interfering with
 # semantic analysis of macros
@@ -2089,8 +2029,6 @@ if [ "$bsd" = "yes" ] ; then
   echo "CONFIG_BSD=y" >> $config_host_mak
 fi
 
-echo "CONFIG_COROUTINE_BACKEND=$coroutine" >> $config_host_mak
-
 if test "$plugins" = "yes" ; then
     echo "CONFIG_PLUGIN=y" >> $config_host_mak
 fi
diff --git a/meson.build b/meson.build
index 31151f240ad8..2d34ff8a61ec 100644
--- a/meson.build
+++ b/meson.build
@@ -211,6 +211,34 @@ if get_option('prefer_static')
   qemu_ldflags += get_option('b_pie') ? '-static-pie' : '-static'
 endif
 
+coroutine_backend = get_option('coroutine_backend')
+ucontext_probe = '''
+  #include <ucontext.h>
+  #ifdef __stub_makecontext
+  #error Ignoring glibc stub makecontext which will always fail
+  #endif
+  int main(void) { makecontext(0, 0, 0); return 0; }'''
+
+# On Windows the only valid backend is the Windows specific one.
+# For POSIX prefer ucontext, but it's not always possible. The fallback
+# is sigcontext.
+supported_backends = []
+if targetos == 'windows'
+  supported_backends += ['windows']
+else
+  if targetos != 'darwin' and cc.links(ucontext_probe)
+    supported_backends += ['ucontext']
+  endif
+  supported_backends += ['sigaltstack']
+endif
+
+if coroutine_backend == 'auto'
+  coroutine_backend = supported_backends[0]
+elif coroutine_backend not in supported_backends
+  error('"@0@" backend requested but not available.  Available backends: @1@' \
+        .format(coroutine_backend, ', '.join(supported_backends)))
+endif
+
 # Compiles if SafeStack *not* enabled
 safe_stack_probe = '''
   int main(void)
@@ -232,7 +260,7 @@ if get_option('safe_stack') != not cc.compiles(safe_stack_probe)
   qemu_cflags += safe_stack_arg
   qemu_ldflags += safe_stack_arg
 endif
-if get_option('safe_stack') and config_host['CONFIG_COROUTINE_BACKEND'] != 'ucontext'
+if get_option('safe_stack') and coroutine_backend != 'ucontext'
   error('SafeStack is only supported with the ucontext coroutine backend')
 endif
 
@@ -4012,7 +4040,7 @@ summary(summary_info, bool_yn: true, section: 'Targets and accelerators')
 
 # Block layer
 summary_info = {}
-summary_info += {'coroutine backend': config_host['CONFIG_COROUTINE_BACKEND']}
+summary_info += {'coroutine backend': coroutine_backend}
 summary_info += {'coroutine pool':    have_coroutine_pool}
 if have_block
   summary_info += {'Block whitelist (rw)': get_option('block_drv_rw_whitelist')}
diff --git a/meson_options.txt b/meson_options.txt
index f04b12ca0783..9ddd500f8998 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -31,6 +31,9 @@ option('fuzzing_engine', type : 'string', value : '',
        description: 'fuzzing engine library for OSS-Fuzz')
 option('trace_file', type: 'string', value: 'trace',
        description: 'Trace file prefix for simple backend')
+option('coroutine_backend', type: 'combo',
+       choices: ['ucontext', 'sigaltstack', 'windows', 'auto'],
+       value: 'auto', description: 'coroutine backend to use')
 
 # Everything else can be set via --enable/--disable-* option
 # on the configure script command line.  After adding an option
diff --git a/scripts/meson-buildoptions.py b/scripts/meson-buildoptions.py
index a04dcc70a5b7..4c7f13fdfc40 100755
--- a/scripts/meson-buildoptions.py
+++ b/scripts/meson-buildoptions.py
@@ -35,6 +35,7 @@
 OPTION_NAMES = {
     "b_coverage": "gcov",
     "b_lto": "lto",
+    "coroutine_backend": "with-coroutine",
     "malloc": "enable-malloc",
     "pkgversion": "with-pkgversion",
     "qemu_firmwarepath": "firmwarepath",
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 5ea787deb89e..1d14390d972c 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -62,6 +62,8 @@ meson_options_help() {
   printf "%s\n" '  --sysconfdir=VALUE       Sysconf data directory [etc]'
   printf "%s\n" '  --tls-priority=VALUE     Default TLS protocol/cipher priority string'
   printf "%s\n" '                           [NORMAL]'
+  printf "%s\n" '  --with-coroutine=CHOICE  coroutine backend to use (choices:'
+  printf "%s\n" '                           auto/sigaltstack/ucontext/windows)'
   printf "%s\n" '  --with-pkgversion=VALUE  use specified string as sub-version of the'
   printf "%s\n" '                           package'
   printf "%s\n" '  --with-trace-file=VALUE  Trace file prefix for simple backend [trace]'
@@ -243,6 +245,7 @@ _meson_option_parse() {
     --disable-cocoa) printf "%s" -Dcocoa=disabled ;;
     --enable-coreaudio) printf "%s" -Dcoreaudio=enabled ;;
     --disable-coreaudio) printf "%s" -Dcoreaudio=disabled ;;
+    --with-coroutine=*) quote_sh "-Dcoroutine_backend=$2" ;;
     --enable-coroutine-pool) printf "%s" -Dcoroutine_pool=true ;;
     --disable-coroutine-pool) printf "%s" -Dcoroutine_pool=false ;;
     --enable-crypto-afalg) printf "%s" -Dcrypto_afalg=enabled ;;
diff --git a/util/coroutine-win32.c b/util/coroutine-windows.c
similarity index 100%
rename from util/coroutine-win32.c
rename to util/coroutine-windows.c
diff --git a/util/meson.build b/util/meson.build
index 2cb103fc727e..e1f1c39e1081 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -78,7 +78,7 @@ if have_block or have_ga
   util_ss.add(files('base64.c'))
   util_ss.add(files('main-loop.c'))
   util_ss.add(files('qemu-coroutine.c', 'qemu-coroutine-lock.c', 'qemu-coroutine-io.c'))
-  util_ss.add(files('coroutine-@0@.c'.format(config_host['CONFIG_COROUTINE_BACKEND'])))
+  util_ss.add(files(f'coroutine-@coroutine_backend@.c'))
   util_ss.add(files('thread-pool.c', 'qemu-timer.c'))
   util_ss.add(files('qemu-sockets.c'))
 endif
-- 
2.40.1


