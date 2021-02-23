Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7C93224EA
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 05:33:08 +0100 (CET)
Received: from localhost ([::1]:43434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEPNg-0007U6-RJ
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 23:33:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lEPMV-00074A-Ar
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 23:31:51 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:40427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lEPMT-0007EK-0M
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 23:31:51 -0500
Received: by mail-pl1-x633.google.com with SMTP id z7so9069059plk.7
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 20:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3jMLspybSbaVZIObB6x2dZfnzh7vWBWyXpmcUAL9F6s=;
 b=ic3LsUhgnpGDIV3h0aAg/ADhHIC519Kj/uLkoEUBwGHiLIW+suXXgc2PWcat5jCVmO
 kQsso7wnAXBeZl9bLLaRj/lKoqY131GtrI3jxf6vJImjGD23Y1TZrsy3Cg+CNycpZGnn
 UCA+lJCwIf3BDQrUi5Z8A2zXHVubm7jczQoAy4QPYhxmsnIt7UCnRb59RJUcFfnuxXZS
 wQu7KbNwFrrLyZ41RrfFVIbeWPoK47Lqfa0/yZQiDWg9wdECsxbvXFMTTp9kuutPyG3n
 M4ja8hExEUfSbHnmee1qHb47FPFR8JevZ98LSC1zEQNKaiKNPLbNDMCJzqCjQCyCgspJ
 2cJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3jMLspybSbaVZIObB6x2dZfnzh7vWBWyXpmcUAL9F6s=;
 b=o7t7NcWJuZEZm6TqtKhVTzFoZD94FxFdtUb8sKyoTDuFP2XC7jseNY1TCuVdIYX0wh
 GJcMvQWk0N5ge3+I6za4yOE6Di3ESBcTyrzRZs7d3yckIoIYXj2yOo9H1rDUX0gmRnoD
 5A27FyRqjGtk95C9w/td6hVcucSv05fbYBKY4aYsyz5c0jznmA1IvY1iKhqb5iA+2h1c
 vyyhUCuK8yWRJ3jzf6QdOGhHuMng+zUYFkSvnzfjEDLpOqpISPt3Ae+C99Y/J0TD3quB
 fbexuWMiwoCWt0Jc4J7dnkRcFuWN6X2r6gFiLlCRk1JNh4UW0RUR/FamGfeMMyNcZ0D2
 gw9g==
X-Gm-Message-State: AOAM530L1CkZrac2fLsw6KhpACHkzoXSG/qJ21fKpITklaDmjn2kyoor
 qWqqzl8pAb+0Rlse2OqXGM7ojbbYj4DA4g==
X-Google-Smtp-Source: ABdhPJwPPfp6aKLsHYu3fmST5XGkNEQK8RRqNDZKmWGXgW48AjuTUjZvsTUprwud3DrdAO593WCpQg==
X-Received: by 2002:a17:902:ed8d:b029:e2:b3fb:ca95 with SMTP id
 e13-20020a170902ed8db02900e2b3fbca95mr25053939plj.17.1614054706777; 
 Mon, 22 Feb 2021 20:31:46 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:ddae:5d18:94c8:4549])
 by smtp.gmail.com with ESMTPSA id u31sm20291253pgl.9.2021.02.22.20.31.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Feb 2021 20:31:46 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v2] configure: Improve OpenGL dependency detections
Date: Tue, 23 Feb 2021 13:31:37 +0900
Message-Id: <20210223043137.44709-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210222102818.x65fnhmvelhm2v35@sirius.home.kraxel.org>
References: <20210222102818.x65fnhmvelhm2v35@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x633.google.com
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

This has the following visible changes:

- GBM is required only for OpenGL dma-buf.
- X11 is explicitly required by gtk-egl.
- EGL is now mandatory for the OpenGL displays.

The last one needs some detailed description. Before this change,
EGL was tested only for OpenGL dma-buf with the check of
EGL_MESA_image_dma_buf_export. However, all of the OpenGL
displays depend on EGL and EGL_MESA_image_dma_buf_export is always
defined by epoxy's EGL interface.
Therefore, it makes more sense to always check the presence of EGL
and say the OpenGL displays are available along with OpenGL dma-buf
if it is present.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 configure                    | 36 +++++++++++++++---------------------
 docs/interop/vhost-user.json |  3 ++-
 include/ui/egl-helpers.h     |  9 ++++++++-
 include/ui/spice-display.h   |  2 +-
 meson.build                  |  2 +-
 ui/egl-helpers.c             |  8 ++++++--
 ui/gtk-egl.c                 |  6 +++---
 ui/gtk.c                     | 14 ++++++++++++++
 ui/meson.build               |  8 +++++---
 9 files changed, 55 insertions(+), 33 deletions(-)

diff --git a/configure b/configure
index 9f016b06b54..bbcb9436827 100755
--- a/configure
+++ b/configure
@@ -3576,14 +3576,24 @@ if $pkg_config gbm; then
 fi
 
 if test "$opengl" != "no" ; then
-  opengl_pkgs="epoxy gbm"
-  if $pkg_config $opengl_pkgs; then
-    opengl_cflags="$($pkg_config --cflags $opengl_pkgs)"
-    opengl_libs="$($pkg_config --libs $opengl_pkgs)"
+  epoxy=no
+  if $pkg_config epoxy; then
+    cat > $TMPC << EOF
+#include <epoxy/egl.h>
+int main(void) { return 0; }
+EOF
+    if compile_prog "" "" ; then
+      epoxy=yes
+    fi
+  fi
+
+  if test "$epoxy" = "yes" ; then
+    opengl_cflags="$($pkg_config --cflags epoxy)"
+    opengl_libs="$($pkg_config --libs epoxy)"
     opengl=yes
   else
     if test "$opengl" = "yes" ; then
-      feature_not_found "opengl" "Please install opengl (mesa) devel pkgs: $opengl_pkgs"
+      feature_not_found "opengl" "Please install epoxy with EGL"
     fi
     opengl_cflags=""
     opengl_libs=""
@@ -3591,19 +3601,6 @@ if test "$opengl" != "no" ; then
   fi
 fi
 
-if test "$opengl" = "yes"; then
-  cat > $TMPC << EOF
-#include <epoxy/egl.h>
-#ifndef EGL_MESA_image_dma_buf_export
-# error mesa/epoxy lacks support for dmabufs (mesa 10.6+)
-#endif
-int main(void) { return 0; }
-EOF
-  if compile_prog "" "" ; then
-    opengl_dmabuf=yes
-  fi
-fi
-
 ##########################################
 # libxml2 probe
 if test "$libxml2" != "no" ; then
@@ -5883,9 +5880,6 @@ if test "$opengl" = "yes" ; then
   echo "CONFIG_OPENGL=y" >> $config_host_mak
   echo "OPENGL_CFLAGS=$opengl_cflags" >> $config_host_mak
   echo "OPENGL_LIBS=$opengl_libs" >> $config_host_mak
-  if test "$opengl_dmabuf" = "yes" ; then
-    echo "CONFIG_OPENGL_DMABUF=y" >> $config_host_mak
-  fi
 fi
 
 if test "$gbm" = "yes" ; then
diff --git a/docs/interop/vhost-user.json b/docs/interop/vhost-user.json
index feb5fe58cad..b6ade9e4931 100644
--- a/docs/interop/vhost-user.json
+++ b/docs/interop/vhost-user.json
@@ -250,7 +250,8 @@
 #   "type": "gpu",
 #   "binary": "/usr/libexec/qemu/vhost-user-gpu",
 #   "tags": [
-#     "CONFIG_OPENGL_DMABUF=y"
+#     "CONFIG_OPENGL=y",
+#     "CONFIG_GBM=y"
 #   ]
 # }
 #
diff --git a/include/ui/egl-helpers.h b/include/ui/egl-helpers.h
index 94a4b3e6f3b..c64e048eb54 100644
--- a/include/ui/egl-helpers.h
+++ b/include/ui/egl-helpers.h
@@ -3,7 +3,9 @@
 
 #include <epoxy/gl.h>
 #include <epoxy/egl.h>
+#ifdef CONFIG_GBM
 #include <gbm.h>
+#endif
 #include "ui/console.h"
 #include "ui/shader.h"
 
@@ -31,7 +33,7 @@ void egl_texture_blit(QemuGLShader *gls, egl_fb *dst, egl_fb *src, bool flip);
 void egl_texture_blend(QemuGLShader *gls, egl_fb *dst, egl_fb *src, bool flip,
                        int x, int y, double scale_x, double scale_y);
 
-#ifdef CONFIG_OPENGL_DMABUF
+#ifdef CONFIG_GBM
 
 extern int qemu_egl_rn_fd;
 extern struct gbm_device *qemu_egl_rn_gbm_dev;
@@ -48,8 +50,13 @@ void egl_dmabuf_release_texture(QemuDmaBuf *dmabuf);
 
 EGLSurface qemu_egl_init_surface_x11(EGLContext ectx, EGLNativeWindowType win);
 
+#if defined(CONFIG_X11) || defined(CONFIG_GBM)
+
 int qemu_egl_init_dpy_x11(EGLNativeDisplayType dpy, DisplayGLMode mode);
 int qemu_egl_init_dpy_mesa(EGLNativeDisplayType dpy, DisplayGLMode mode);
+
+#endif
+
 EGLContext qemu_egl_init_ctx(void);
 
 #endif /* EGL_HELPERS_H */
diff --git a/include/ui/spice-display.h b/include/ui/spice-display.h
index 4a47ffdd4c8..ed298d58f06 100644
--- a/include/ui/spice-display.h
+++ b/include/ui/spice-display.h
@@ -27,7 +27,7 @@
 #include "ui/qemu-pixman.h"
 #include "ui/console.h"
 
-#if defined(CONFIG_OPENGL_DMABUF)
+#if defined(CONFIG_OPENGL) && defined(CONFIG_GBM)
 # if SPICE_SERVER_VERSION >= 0x000d01 /* release 0.13.1 */
 #  define HAVE_SPICE_GL 1
 #  include "ui/egl-helpers.h"
diff --git a/meson.build b/meson.build
index 8302fcbd903..ae5be44898f 100644
--- a/meson.build
+++ b/meson.build
@@ -2477,7 +2477,7 @@ summary_info += {'U2F support':       u2f.found()}
 summary_info += {'libusb':            config_host.has_key('CONFIG_USB_LIBUSB')}
 summary_info += {'usb net redir':     config_host.has_key('CONFIG_USB_REDIR')}
 summary_info += {'OpenGL support':    config_host.has_key('CONFIG_OPENGL')}
-summary_info += {'OpenGL dmabufs':    config_host.has_key('CONFIG_OPENGL_DMABUF')}
+summary_info += {'GBM':               config_host.has_key('CONFIG_GBM')}
 summary_info += {'libiscsi support':  libiscsi.found()}
 summary_info += {'libnfs support':    libnfs.found()}
 summary_info += {'build guest agent': config_host.has_key('CONFIG_GUEST_AGENT')}
diff --git a/ui/egl-helpers.c b/ui/egl-helpers.c
index 7c530c2825b..dabb5f39c96 100644
--- a/ui/egl-helpers.c
+++ b/ui/egl-helpers.c
@@ -140,7 +140,7 @@ void egl_texture_blend(QemuGLShader *gls, egl_fb *dst, egl_fb *src, bool flip,
 
 /* ---------------------------------------------------------------------- */
 
-#ifdef CONFIG_OPENGL_DMABUF
+#ifdef CONFIG_GBM
 
 int qemu_egl_rn_fd;
 struct gbm_device *qemu_egl_rn_gbm_dev;
@@ -287,7 +287,7 @@ void egl_dmabuf_release_texture(QemuDmaBuf *dmabuf)
     dmabuf->texture = 0;
 }
 
-#endif /* CONFIG_OPENGL_DMABUF */
+#endif /* CONFIG_GBM */
 
 /* ---------------------------------------------------------------------- */
 
@@ -315,6 +315,8 @@ EGLSurface qemu_egl_init_surface_x11(EGLContext ectx, EGLNativeWindowType win)
 
 /* ---------------------------------------------------------------------- */
 
+#if defined(CONFIG_X11) || defined(CONFIG_GBM)
+
 /*
  * Taken from glamor_egl.h from the Xorg xserver, which is MIT licensed
  *
@@ -441,6 +443,8 @@ int qemu_egl_init_dpy_mesa(EGLNativeDisplayType dpy, DisplayGLMode mode)
 #endif
 }
 
+#endif
+
 EGLContext qemu_egl_init_ctx(void)
 {
     static const EGLint ctx_att_core[] = {
diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index 71c3d698b40..aa7cf990331 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -205,7 +205,7 @@ void gd_egl_scanout_texture(DisplayChangeListener *dcl,
 void gd_egl_scanout_dmabuf(DisplayChangeListener *dcl,
                            QemuDmaBuf *dmabuf)
 {
-#ifdef CONFIG_OPENGL_DMABUF
+#ifdef CONFIG_GBM
     egl_dmabuf_import_texture(dmabuf);
     if (!dmabuf->texture) {
         return;
@@ -221,7 +221,7 @@ void gd_egl_cursor_dmabuf(DisplayChangeListener *dcl,
                           QemuDmaBuf *dmabuf, bool have_hot,
                           uint32_t hot_x, uint32_t hot_y)
 {
-#ifdef CONFIG_OPENGL_DMABUF
+#ifdef CONFIG_GBM
     VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
 
     if (dmabuf) {
@@ -249,7 +249,7 @@ void gd_egl_cursor_position(DisplayChangeListener *dcl,
 void gd_egl_release_dmabuf(DisplayChangeListener *dcl,
                            QemuDmaBuf *dmabuf)
 {
-#ifdef CONFIG_OPENGL_DMABUF
+#ifdef CONFIG_GBM
     egl_dmabuf_release_texture(dmabuf);
 #endif
 }
diff --git a/ui/gtk.c b/ui/gtk.c
index 26665cd2e65..1bc7af96750 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -646,6 +646,8 @@ static const DisplayChangeListenerOps dcl_gl_area_ops = {
 
 #endif /* CONFIG_OPENGL */
 
+#ifdef CONFIG_X11
+
 static const DisplayChangeListenerOps dcl_egl_ops = {
     .dpy_name             = "gtk-egl",
     .dpy_gfx_update       = gd_egl_update,
@@ -668,6 +670,8 @@ static const DisplayChangeListenerOps dcl_egl_ops = {
     .dpy_gl_update           = gd_egl_scanout_flush,
 };
 
+#endif
+
 #endif /* CONFIG_OPENGL */
 
 /** QEMU Events **/
@@ -786,8 +790,12 @@ static gboolean gd_draw_event(GtkWidget *widget, cairo_t *cr, void *opaque)
             /* invoke render callback please */
             return FALSE;
         } else {
+#ifdef CONFIG_X11
             gd_egl_draw(vc);
             return TRUE;
+#else
+            abort();
+#endif
         }
     }
 #endif
@@ -2000,6 +2008,7 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s, VirtualConsole *vc,
         } else
 #endif /* CONFIG_OPENGL */
         {
+#ifdef CONFIG_X11
             vc->gfx.drawing_area = gtk_drawing_area_new();
             /*
              * gtk_widget_set_double_buffered() was deprecated in 3.14.
@@ -2012,6 +2021,9 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s, VirtualConsole *vc,
             gtk_widget_set_double_buffered(vc->gfx.drawing_area, FALSE);
 #pragma GCC diagnostic pop
             vc->gfx.dcl.ops = &dcl_egl_ops;
+#else
+            abort();
+#endif
         }
     } else
 #endif
@@ -2322,8 +2334,10 @@ static void early_gtk_display_init(DisplayOptions *opts)
         } else
 #endif
         {
+#ifdef CONFIG_X11
             DisplayGLMode mode = opts->has_gl ? opts->gl : DISPLAYGL_MODE_ON;
             gtk_egl_init(mode);
+#endif
         }
 #endif
     }
diff --git a/ui/meson.build b/ui/meson.build
index 634fabab0d5..cd1d7d21af4 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -45,14 +45,15 @@ endif
 
 if config_host.has_key('CONFIG_OPENGL')
   opengl_ss = ss.source_set()
+  opengl_ss.add(gbm)
   opengl_ss.add(when: [opengl, pixman, 'CONFIG_OPENGL'],
                if_true: files('shader.c', 'console-gl.c', 'egl-helpers.c', 'egl-context.c'))
   ui_modules += {'opengl' : opengl_ss}
 endif
 
-if config_host.has_key('CONFIG_OPENGL_DMABUF')
+if config_host.has_key('CONFIG_OPENGL') and gbm.found()
   egl_headless_ss = ss.source_set()
-  egl_headless_ss.add(when: [opengl, pixman, 'CONFIG_OPENGL_DMABUF'],
+  egl_headless_ss.add(when: [opengl, gbm, pixman, 'CONFIG_OPENGL'],
                       if_true: files('egl-headless.c'))
   ui_modules += {'egl-headless' : egl_headless_ss}
 endif
@@ -63,7 +64,8 @@ if gtk.found()
   gtk_ss = ss.source_set()
   gtk_ss.add(gtk, vte, pixman, files('gtk.c'))
   gtk_ss.add(when: x11, if_true: files('x_keymap.c'))
-  gtk_ss.add(when: [opengl, 'CONFIG_OPENGL'], if_true: files('gtk-egl.c', 'gtk-gl-area.c'))
+  gtk_ss.add(when: [opengl, 'CONFIG_OPENGL'], if_true: files('gtk-gl-area.c'))
+  gtk_ss.add(when: [x11, opengl, 'CONFIG_OPENGL'], if_true: files('gtk-egl.c'))
   ui_modules += {'gtk' : gtk_ss}
 endif
 
-- 
2.24.3 (Apple Git-128)


