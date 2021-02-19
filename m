Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6758031F875
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 12:33:35 +0100 (CET)
Received: from localhost ([::1]:56408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD42Q-0007TP-3B
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 06:33:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lD41I-0006lV-Ft
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 06:32:24 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:47042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lD41C-000574-C0
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 06:32:24 -0500
Received: by mail-pl1-x630.google.com with SMTP id u11so3185980plg.13
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 03:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P1FmO3lep7S1fGWKBwz3qBW3mJhgofZnioadvwC9Jeo=;
 b=dom42DDWxyHAYJ1F7habb85wQR8+GukTBJHNyLPDauS1Nl84ACNTlzH/sZGukc3Lf/
 ctiN3Vg5L/9sKTnWQkGQw/6zCXo/pNO8xqOA2pLb0+0rNxH00hbCKoo9XamtEIy8x+Sa
 g5Etg/5Zqba70PjVZDiJEQ9n8UyKNcZSrGp74ZvEzTTrXv/uZdSiswMaBaR90d5aNM1v
 C8bQWxduuRyJVlNZ0S6wYGsFtNk3aSyeuKXcgBx8YcGa1Lbb2a2/pqMJeH5YDxVAZCrX
 Xkg00JrD3FsgbJAvCKwfdo0/5vxwrfmZvxQYEpYVA9p7coe6zqejAbahUFeaEkhWOhnD
 SnMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P1FmO3lep7S1fGWKBwz3qBW3mJhgofZnioadvwC9Jeo=;
 b=iqo5A1StJ5sVuZSkvUELZHVHh9AUPq/brWsQeZQwMNntX98tWeTkRFxpWLLcVpVXu1
 HzM68MCXP+fzd1YhIC7nZO4mxnsefzIkQUy6978Dy87ZWWd82o/amGigFMIPJ17TkIkF
 GAk8To2RGkUfDD8EY3rAnvZxtzNiYErYcsmZ8MRBVGf3evQOMgq7EcIW/wD3xa2UM5iH
 EvhPOiqDnClb/ENuRcdZJ8DuCOZ4nHHyYQT4wt8FRG7uPP92sFjZGclyBkhOk/0/zL9b
 QfUSlmBzACGCgxBmTtdOz0bk6DbM0roaOZSG39ovQE9Ub7S4O4siAZFJtXxxV+UiYZUx
 SvfQ==
X-Gm-Message-State: AOAM532BYL17CkhFYwtMf4DahRftpXK/RQdc+PQA/2WgZY4UbcHITefl
 DwUe2u77eEwQ+IY0O5kk9BtW6tc8/AOZiw==
X-Google-Smtp-Source: ABdhPJzhYPzI0lZSR4gO2oZIcFz9Y/xcJCIN1ck2eWosuWex4YUwuTG7ukr32Skj0MTPiT368tgLTw==
X-Received: by 2002:a17:902:ea84:b029:e3:bde8:4734 with SMTP id
 x4-20020a170902ea84b02900e3bde84734mr1438169plb.85.1613734335658; 
 Fri, 19 Feb 2021 03:32:15 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:d8f0:71c1:3d6a:4f53])
 by smtp.gmail.com with ESMTPSA id f13sm13122251pjj.1.2021.02.19.03.32.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Feb 2021 03:32:15 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] configure: Do not require GBM for OpenGL
Date: Fri, 19 Feb 2021 20:31:52 +0900
Message-Id: <20210219113152.35384-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 configure                | 11 +++++------
 include/ui/egl-helpers.h |  2 ++
 ui/meson.build           |  1 +
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/configure b/configure
index 9f016b06b54..bd96929d7b4 100755
--- a/configure
+++ b/configure
@@ -3576,14 +3576,13 @@ if $pkg_config gbm; then
 fi
 
 if test "$opengl" != "no" ; then
-  opengl_pkgs="epoxy gbm"
-  if $pkg_config $opengl_pkgs; then
-    opengl_cflags="$($pkg_config --cflags $opengl_pkgs)"
-    opengl_libs="$($pkg_config --libs $opengl_pkgs)"
+  if $pkg_config epoxy; then
+    opengl_cflags="$($pkg_config --cflags epoxy)"
+    opengl_libs="$($pkg_config --libs epoxy)"
     opengl=yes
   else
     if test "$opengl" = "yes" ; then
-      feature_not_found "opengl" "Please install opengl (mesa) devel pkgs: $opengl_pkgs"
+      feature_not_found "opengl" "Please install epoxy"
     fi
     opengl_cflags=""
     opengl_libs=""
@@ -3591,7 +3590,7 @@ if test "$opengl" != "no" ; then
   fi
 fi
 
-if test "$opengl" = "yes"; then
+if test "$gbm" = "yes" && test "$opengl" = "yes"; then
   cat > $TMPC << EOF
 #include <epoxy/egl.h>
 #ifndef EGL_MESA_image_dma_buf_export
diff --git a/include/ui/egl-helpers.h b/include/ui/egl-helpers.h
index 94a4b3e6f3b..cc12761c53b 100644
--- a/include/ui/egl-helpers.h
+++ b/include/ui/egl-helpers.h
@@ -3,7 +3,9 @@
 
 #include <epoxy/gl.h>
 #include <epoxy/egl.h>
+#ifdef CONFIG_OPENGL_DMABUF
 #include <gbm.h>
+#endif
 #include "ui/console.h"
 #include "ui/shader.h"
 
diff --git a/ui/meson.build b/ui/meson.build
index 634fabab0d5..33aa514cad0 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -45,6 +45,7 @@ endif
 
 if config_host.has_key('CONFIG_OPENGL')
   opengl_ss = ss.source_set()
+  opengl_ss.add(gbm)
   opengl_ss.add(when: [opengl, pixman, 'CONFIG_OPENGL'],
                if_true: files('shader.c', 'console-gl.c', 'egl-helpers.c', 'egl-context.c'))
   ui_modules += {'opengl' : opengl_ss}
-- 
2.24.3 (Apple Git-128)


