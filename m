Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AB03E8E08
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 12:07:09 +0200 (CEST)
Received: from localhost ([::1]:58414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDl8e-0000A3-TA
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 06:07:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mDl7T-00073r-4T
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 06:05:55 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:46969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mDl7R-0008BT-Hu
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 06:05:54 -0400
Received: by mail-ej1-x62c.google.com with SMTP id gs8so3102477ejc.13
 for <qemu-devel@nongnu.org>; Wed, 11 Aug 2021 03:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nXWs3dl0w7pobiUZAStyR9GAGI2sZUhBp6kloPdQbIg=;
 b=f4rbEMLd/KiAyMWQrqbq793xUxghNrgm3zAHga6CgMS+gLhJlbb74nWTSfPAdRsKuf
 K33P2jdEWT5Rw4UeR0q7v7bQQzlcHVSGqgT0NZYARX2KqrEAg07vfBMeYuP4SlUQQTjd
 giQ9zBoLxVOGAi/tTepTQnUqM/ktyfLuYOnqgLTeYK61gBUTZC6s+BbOy2oiO5Kd6vUP
 qbHYLxGemaI2NOaX34mtgL0/BZmG05+OjRbu6nehKBjYGQkKiMGfAhVZIgGNzmkYO+Qr
 7DHpQwCUrYQuEHh14IJ5yaLtPapPSTGd4NrEMtpUceKdw2Z0TXVCC22iSoQqNV6o9afR
 fJHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=nXWs3dl0w7pobiUZAStyR9GAGI2sZUhBp6kloPdQbIg=;
 b=PuztCA8Hm2RSxZ5WxKv0uTUAdzlgLNIwvvzmWjOVb5zW950cdjhYVGAVuDKPiXPHek
 LcRFcBgeOdy0WeZ9g4VvrAcVap95hlkNaZ9y5dqjcxtztV7ALHau4u0B1qR58nIgsAIJ
 xcsE+09sR3uegyB7bkdFq3oQss/1YpOc1TTw05fy4GEiAbm3BrCR+qyWi8LGktWRRHXu
 K+ZspTEyjpEKCh9iw/inemOHl4OlprHdxx6dhmmlMGqt5XHA2xe+2JB9GPLlFyOF5m28
 /MtXlZV7V8nk0vOY2ocsp/U2HG943z0fM4rCk/4MSVflXunYJH/8ISvI6neYjQliP0op
 U3Bw==
X-Gm-Message-State: AOAM532aTCl7j9QDFTzbd+sOucGUxmbXqC2ENTFX/JucsLcUX1OGhknt
 pL20Ltdq2dEdgzbix2O75tqSPzePRcIAbQ==
X-Google-Smtp-Source: ABdhPJwfgoVts9cd+sy1xufOCwbB3uQIyfTJSvCtecIAeK7EkZMToMXlehbC4T9vv6BiKsqTWE5jrw==
X-Received: by 2002:a17:906:368e:: with SMTP id
 a14mr2938985ejc.60.1628676351886; 
 Wed, 11 Aug 2021 03:05:51 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id kk14sm2537693ejc.29.2021.08.11.03.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 03:05:51 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.1] plugins: do not limit exported symbols if modules are
 active
Date: Wed, 11 Aug 2021 12:05:50 +0200
Message-Id: <20210811100550.54714-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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


