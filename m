Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A54F13E8E07
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 12:06:36 +0200 (CEST)
Received: from localhost ([::1]:57194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDl87-0007mZ-De
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 06:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mDl7E-0006hn-Jb
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 06:05:40 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:44873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mDl7B-0007zw-Qv
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 06:05:40 -0400
Received: by mail-ej1-x62e.google.com with SMTP id yk17so3124802ejb.11
 for <qemu-devel@nongnu.org>; Wed, 11 Aug 2021 03:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nXWs3dl0w7pobiUZAStyR9GAGI2sZUhBp6kloPdQbIg=;
 b=DWgh13wp72UkrhvCNXdguOKdtis/iV+HqZS2h9fdpkx61ibu+8bSDBdndo/EV0akuT
 Uh/fJcutYxC4CQ3vWYQJlRAxXYKfd0JpllX/LqJxQbzAgpyCaOitQ+PossVtrED9X3G8
 DZZC4SNCmbzUHBvDaNQ00z6lb0B3dkj8VtYy74zQSsJjGie9wq5Il68xm/AVxd8ksa08
 o1IEOLER4tAu+2BzN187cIHJ59ZzhVZ+UWWgPLPLEOY7qL4wdPCvEW0+jjTBOidae3qd
 teeVzJtMId3YVIDFPqx+EqSzhIf9WqG1GkRmnVB6xR/mfRje4LIfSIPfar6duoIG3rtk
 NRNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=nXWs3dl0w7pobiUZAStyR9GAGI2sZUhBp6kloPdQbIg=;
 b=bBEKIATQRVQOr+sGqZiZt/FTWdW2OPMRUoNrjHKECowTMk2sVrUkMRR5NzIJmkhvDS
 BBPg01quhjab2nIlegFyZh72xL8J0FMRwWPGpRV2RF/DhHiijaG05yT7J1EVaun6NXIf
 NgC2J/IfxsU3C7cWGihYdjMKMlx4itABVWuu0XKoRQYBLHvfv93M2ReuwUhpK+obnveb
 ZWu7bF9NFibWlnRh6Ir/nUNUlYypqZJsDppBFrS4clz+rwIzqxn/GLbVfNRgaILyolCF
 SnANtDaS4jBeKDyoJQU4tRSDZ2MH7yV0ljlM/9+SqNWKDrabM91XN0Sam2u919wHrDVP
 tX3w==
X-Gm-Message-State: AOAM530/vDuA9OUXleHFTDo2gISTMwNcDSgIRbB6Y1hW12pPtut/CN8z
 IAyQqWFNLLCTwxGfEvkLeamgHelD/XqJFA==
X-Google-Smtp-Source: ABdhPJyP/X+yPg/IcwBddfcK1QSH0HbRX5vDZAeO1gy3vc78zRz3cR168XG3FHbUUzZGx6dzvMdCng==
X-Received: by 2002:a17:907:2083:: with SMTP id
 pv3mr2935107ejb.86.1628676335688; 
 Wed, 11 Aug 2021 03:05:35 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id f20sm7905275ejz.30.2021.08.11.03.05.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 03:05:35 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.1] plugins: do not limit exported symbols if modules are
 active
Date: Wed, 11 Aug 2021 12:05:33 +0200
Message-Id: <20210811100533.54608-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mac --enable-modules and --enable-plugins are currently incompatible, because the
Apple -Wl,-exported_symbols_list command line options prevents the export of any
symbols needed by the modules.  On x86 -Wl,--dynamic-list does not have this effect,
but only because the -Wl,--export-dynamic option provided by gmodule-2.0.pc overrides
it.  On Apple there is no -Wl,--export-dynamic, because it is the default, and thus
no override.

Either way, when modules are active there is no reason to include the plugin_ldflags.
While at it, avoid the useless -Wl,--export-dynamic when --enable-plugins is
specified but --enable-modules is not; this way, the GNU and Apple configurations
are more similar.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/516
Cc: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure           |  5 ++---
 plugins/meson.build | 14 ++++++++------
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/configure b/configure
index 9a79a004d7..a8721601ea 100755
--- a/configure
+++ b/configure
@@ -3187,9 +3187,8 @@ glib_req_ver=2.56
 glib_modules=gthread-2.0
 if test "$modules" = yes; then
     glib_modules="$glib_modules gmodule-export-2.0"
-fi
-if test "$plugins" = "yes"; then
-    glib_modules="$glib_modules gmodule-2.0"
+elif test "$plugins" = "yes"; then
+    glib_modules="$glib_modules gmodule-noexport-2.0"
 fi
 
 for i in $glib_modules; do
diff --git a/plugins/meson.build b/plugins/meson.build
index e77723010e..bfd5c9822a 100644
--- a/plugins/meson.build
+++ b/plugins/meson.build
@@ -1,9 +1,11 @@
-if 'CONFIG_HAS_LD_DYNAMIC_LIST' in config_host
-  plugin_ldflags = ['-Wl,--dynamic-list=' + (meson.build_root() / 'qemu-plugins-ld.symbols')]
-elif 'CONFIG_HAS_LD_EXPORTED_SYMBOLS_LIST' in config_host
-  plugin_ldflags = ['-Wl,-exported_symbols_list,' + (meson.build_root() / 'qemu-plugins-ld64.symbols')]
-else
-  plugin_ldflags = []
+plugin_ldflags = []
+# Modules need more symbols than just those in plugins/qemu-plugins.symbols
+if not enable_modules
+  if 'CONFIG_HAS_LD_DYNAMIC_LIST' in config_host
+    plugin_ldflags = ['-Wl,--dynamic-list=' + (meson.build_root() / 'qemu-plugins-ld.symbols')]
+  elif 'CONFIG_HAS_LD_EXPORTED_SYMBOLS_LIST' in config_host
+    plugin_ldflags = ['-Wl,-exported_symbols_list,' + (meson.build_root() / 'qemu-plugins-ld64.symbols')]
+  endif
 endif
 
 specific_ss.add(when: 'CONFIG_PLUGIN', if_true: [files(
-- 
2.31.1


