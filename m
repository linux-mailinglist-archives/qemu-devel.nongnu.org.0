Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A316FEF40
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 11:51:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px2wf-0000H1-Dk; Thu, 11 May 2023 05:50:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px2wd-0000FC-CZ
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:50:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px2wa-0006f3-W0
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:50:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683798639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y0b69543yYXNu9ablT4wHeu1Wb+TDvY83CeRZCJVIyw=;
 b=Z2jRDbtmpbN1xjElnT6+oHxZgoERYK9+/NGcZu6f/iF4/FvMHm8yiBDbFoqbybEoIU8IsL
 v8yCaHYRKBCD/xZhxLtHFgWg0ZfG3QZ3+uNO67BG8IPgcxbnBVhb6cBih2nAsfOucxUfPn
 QRDOpCBjJ12K5RMAM9M823Hnf+JxwUs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-60-ivl1O7zDNvW5pPrZlImCRw-1; Thu, 11 May 2023 05:50:37 -0400
X-MC-Unique: ivl1O7zDNvW5pPrZlImCRw-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-50a16ab50e6so7862902a12.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 02:50:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683798636; x=1686390636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y0b69543yYXNu9ablT4wHeu1Wb+TDvY83CeRZCJVIyw=;
 b=f+SOYGTUVEqDJxyeQFOoWBL+i0Q53rbXTcSeg/P54T/lkVJ0MATRJGSGOT5qSGOJ2u
 iBtkRGZOXHQ97DlW/uZ4ILM76eq8xg/kQ36YruxD5aawn2TY8ZhiHJxhxZbtIPRaE2jr
 Eavfo4xtdww6Mv89hZ7J73bn/wsjnn82Cmc0VwEggVTgsVrw3Sjni9Bh6Ms76/cN56pM
 sasRqDVpo+2whr24OCmt+ZqMl5Ty9eoost+seraz1iv/Vx/hRiEqxBrt8aKtrdzt8A5c
 C7Ndv9H40Bk98aQojlvhkXU/ZNB1SntBB4jo752caLHCVfyAnF0c1poLvGuZtKKqpHR3
 r48g==
X-Gm-Message-State: AC+VfDy0ZUdmrhKJo2CkyCaeilJpincDwr+6MznIWncafvzZThi7lpiY
 BudUfrKx/CoI0OHAYuvvHLgiC3L+V/BRWK8aNN4zlZXe+BKms9PIBfojkpebqsK5D+34fsHRPjR
 jjeMhMTfOoQKDuJ5C0S6gdUJpa0WofVzOOtbT1KOyNak7TFCu1vkXf8sDUOnU4DlHqkXTnvtPYv
 c=
X-Received: by 2002:a05:6402:74e:b0:508:3b1f:e6b5 with SMTP id
 p14-20020a056402074e00b005083b1fe6b5mr16553606edy.15.1683798636138; 
 Thu, 11 May 2023 02:50:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7YEdtLHTPAseVVBAm3ORA135Sxp3XdUlKpbNXhNvsuqjez54NzIGP3ynNb+ha3bxPI9/LxVg==
X-Received: by 2002:a05:6402:74e:b0:508:3b1f:e6b5 with SMTP id
 p14-20020a056402074e00b005083b1fe6b5mr16553594edy.15.1683798635730; 
 Thu, 11 May 2023 02:50:35 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a056402128500b0050c03520f68sm2754021edv.71.2023.05.11.02.50.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 02:50:35 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 03/24] meson: use prefer_static option
Date: Thu, 11 May 2023 11:50:00 +0200
Message-Id: <20230511095021.1397802-4-pbonzini@redhat.com>
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

The option is new in Meson 0.63 and removes the need to pass "static:
true" to all dependency and find_library invocation.  Actually cleaning
up the invocations is left for a separate patch.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                   |  4 +---
 docs/devel/build-system.rst |  3 +--
 meson.build                 | 13 +++++--------
 qga/meson.build             |  2 +-
 4 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/configure b/configure
index a656c69bf03a..2edc5070cd26 100755
--- a/configure
+++ b/configure
@@ -2409,9 +2409,6 @@ fi
 if test "$solaris" = "yes" ; then
   echo "CONFIG_SOLARIS=y" >> $config_host_mak
 fi
-if test "$static" = "yes" ; then
-  echo "CONFIG_STATIC=y" >> $config_host_mak
-fi
 echo "SRC_PATH=$source_path" >> $config_host_mak
 echo "TARGET_DIRS=$target_list" >> $config_host_mak
 if test "$modules" = "yes"; then
@@ -2654,6 +2651,7 @@ if test "$skip_meson" = no; then
   # Built-in options
   test "$bindir" != "bin" && meson_option_add "-Dbindir=$bindir"
   test "$default_feature" = no && meson_option_add -Dauto_features=disabled
+  test "$static" = yes && meson_option_add -Dprefer_static=true
   test "$pie" = no && meson_option_add -Db_pie=false
   test "$werror" = yes && meson_option_add -Dwerror=true
 
diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
index 189472174340..9db18aff159e 100644
--- a/docs/devel/build-system.rst
+++ b/docs/devel/build-system.rst
@@ -311,8 +311,7 @@ dependency will be used::
   sdl_image = not_found
   if not get_option('sdl_image').auto() or have_system
     sdl_image = dependency('SDL2_image', required: get_option('sdl_image'),
-                           method: 'pkg-config',
-                           static: enable_static)
+                           method: 'pkg-config')
   endif
 
 This avoids warnings on static builds of user-mode emulators, for example.
diff --git a/meson.build b/meson.build
index e4c21326b196..4b72ffd465d9 100644
--- a/meson.build
+++ b/meson.build
@@ -18,10 +18,7 @@ targetos = host_machine.system()
 sh = find_program('sh')
 config_host = keyval.load(meson.current_build_dir() / 'config-host.mak')
 enable_modules = 'CONFIG_MODULES' in config_host
-enable_static = 'CONFIG_STATIC' in config_host
-
-# Allow both shared and static libraries unless --enable-static
-static_kwargs = enable_static ? {'static': true} : {}
+static_kwargs = {}
 
 cc = meson.get_compiler('c')
 all_languages = ['c']
@@ -193,7 +190,7 @@ qemu_cflags = config_host['QEMU_CFLAGS'].split()
 qemu_objcflags = config_host['QEMU_OBJCFLAGS'].split()
 qemu_ldflags = config_host['QEMU_LDFLAGS'].split()
 
-if enable_static
+if get_option('prefer_static')
   qemu_ldflags += get_option('b_pie') ? '-static-pie' : '-static'
 endif
 
@@ -841,7 +838,7 @@ if targetos == 'linux' and have_tools and get_option('mpath').allowed()
                                     kwargs: static_kwargs)
   if libmpathpersist.found()
     mpathlibs += libmpathpersist
-    if enable_static
+    if get_option('prefer_static')
       mpathlibs += cc.find_library('devmapper',
                                      required: get_option('mpath'),
                                      kwargs: static_kwargs)
@@ -1225,7 +1222,7 @@ if not gnutls_crypto.found()
     # Debian has removed -lgpg-error from libgcrypt-config
     # as it "spreads unnecessary dependencies" which in
     # turn breaks static builds...
-    if gcrypt.found() and enable_static
+    if gcrypt.found() and get_option('prefer_static')
       gcrypt = declare_dependency(dependencies: [
         gcrypt,
         cc.find_library('gpg-error', required: true, kwargs: static_kwargs)])
@@ -1657,7 +1654,7 @@ endif
 # libdw
 libdw = not_found
 if not get_option('libdw').auto() or \
-        (not enable_static and (have_system or have_user))
+        (not get_option('prefer_static') and (have_system or have_user))
     libdw = dependency('libdw',
                        method: 'pkg-config',
                        kwargs: static_kwargs,
diff --git a/qga/meson.build b/qga/meson.build
index ad17dc7dca13..622b5f94a232 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -22,7 +22,7 @@ have_qga_vss = get_option('qga_vss') \
     Then run configure with: --extra-cxxflags="-isystem /path/to/vss/inc/win2003"''') \
   .require(midl.found() or widl.found(),
            error_message: 'VSS support requires midl or widl') \
-  .require(not enable_static,
+  .require(not get_option('prefer_static'),
            error_message: 'VSS support requires dynamic linking with GLib') \
   .allowed()
 
-- 
2.40.1


