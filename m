Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F07A23225A5
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 07:04:44 +0100 (CET)
Received: from localhost ([::1]:43606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEQoO-00024h-1w
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 01:04:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lEQn0-0001IE-Hs
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 01:03:18 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:37355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lEQmw-0001Hf-Ms
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 01:03:18 -0500
Received: by mail-pj1-x1030.google.com with SMTP id ds5so1165416pjb.2
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 22:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1OKYuhSsdxJ7LkH5So87d8oZA/Q8hmLpyPvW6t3Z0NA=;
 b=gXYZzw6PljpiYJFSAbdqDoXrhTKvmTWHhzhQutkP2zHl93gPE8RkXFGubAq7mS1iF3
 9LQqLlOgIOxo7RTNt7E60F74P1oclgUaRET/McJZbS33W6GOYk7Hp5d/JI7ZIEYqlnd5
 JJERSfo0QfVbhELVUBzzfcoGlcUliBewIonaSA76hoiJfnv3QNi5UnZi64PyskeHMLEx
 EVQbYMqqEut1nwMJs8FJIJaJows1tpBCk1xxGYTKRUQ2JPsWthwsBeem71lufU7zOy2Q
 A1F3PT2gUGsPwVWMbKe+76EvCbs2cPgSV3fLFC0CWfaOEY1/qqUQ9YdLUWDzOslMxinj
 htYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1OKYuhSsdxJ7LkH5So87d8oZA/Q8hmLpyPvW6t3Z0NA=;
 b=mw6PAAVkWKCKkRdXT+MZxMz/0vhannp3SrgG3OLl1viGTID4E+26hV0lnbMNdYXVeW
 /TmMIUJLI4WM0wdG1tZLZoviEyVSI5XMtuQc/QBSJTt3tBsaKkzDGUa5oyjlwmgWZMGI
 66sk/wveZUf4l4xJSayWZDBfBgFAS+pAU5cN5SVQPRcWEwuSWVua3YVYuOJ6xfoGi5gp
 W5mTTQZYNFSOb5d0L3cNM6/++X0f1LC3iJ6xKexACIOAhb0my3sVCO2TMbxVoo8+cZiS
 EyK58/lWOG1Bed77VsmeGKnju/yw+tkRbnfKqSOzN8RZpGyUro+YmNt+SV3o1hwKczST
 lxaQ==
X-Gm-Message-State: AOAM530Hkl1YncQ840b1wtt1ntdmI4YxS1ckNVQpNjinHKtbiJwLxYkB
 0LXyhlRvou9L93i6J4P2/YB/MytPJn9Shg==
X-Google-Smtp-Source: ABdhPJwZQXvlfkYAOt26DkHVsaPI1dfXvzBLK2ho1aeEUzq88RWRZoay9RAFq5HzZZPRMz68XXECwQ==
X-Received: by 2002:a17:90a:7e8f:: with SMTP id
 j15mr26416635pjl.223.1614060192158; 
 Mon, 22 Feb 2021 22:03:12 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:ddae:5d18:94c8:4549])
 by smtp.gmail.com with ESMTPSA id w188sm21630693pfw.177.2021.02.22.22.03.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Feb 2021 22:03:11 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v4] configure: Improve OpenGL dependency detections
Date: Tue, 23 Feb 2021 15:03:07 +0900
Message-Id: <20210223060307.87736-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210223055800.87324-1-akihiko.odaki@gmail.com>
References: <20210223055800.87324-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1030.google.com
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
 configure                    | 37 +++++++++++++++---------------------
 docs/interop/vhost-user.json |  3 ++-
 include/ui/egl-helpers.h     |  9 ++++++++-
 include/ui/spice-display.h   |  2 +-
 meson.build                  |  2 +-
 ui/egl-helpers.c             |  8 ++++++--
 ui/gtk-egl.c                 |  6 +++---
 ui/gtk-gl-area.c             |  2 +-
 ui/gtk.c                     | 14 ++++++++++++++
 ui/meson.build               |  8 +++++---
 10 files changed, 56 insertions(+), 35 deletions(-)

diff --git a/configure b/configure
index a79b3746d4c..b922d1ea260 100755
--- a/configure
+++ b/configure
@@ -394,7 +394,6 @@ u2f="auto"
 libusb="$default_feature"
 usb_redir="$default_feature"
 opengl="$default_feature"
-opengl_dmabuf="no"
 cpuid_h="no"
 avx2_opt="$default_feature"
 capstone="auto"
@@ -3607,14 +3606,24 @@ if $pkg_config gbm; then
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
@@ -3622,19 +3631,6 @@ if test "$opengl" != "no" ; then
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
@@ -5837,9 +5833,6 @@ if test "$opengl" = "yes" ; then
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
index 5b1f7fafe0b..f1bf8f97fc3 100644
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
 bool qemu_egl_has_dmabuf(void);
 
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
index 58321a0ea25..1f09e31bfbf 100644
--- a/meson.build
+++ b/meson.build
@@ -2639,7 +2639,7 @@ summary_info += {'U2F support':       u2f.found()}
 summary_info += {'libusb':            config_host.has_key('CONFIG_USB_LIBUSB')}
 summary_info += {'usb net redir':     config_host.has_key('CONFIG_USB_REDIR')}
 summary_info += {'OpenGL support':    config_host.has_key('CONFIG_OPENGL')}
-summary_info += {'OpenGL dmabufs':    config_host.has_key('CONFIG_OPENGL_DMABUF')}
+summary_info += {'GBM':               config_host.has_key('CONFIG_GBM')}
 summary_info += {'libiscsi support':  libiscsi.found()}
 summary_info += {'libnfs support':    libnfs.found()}
 if targetos == 'windows'
diff --git a/ui/egl-helpers.c b/ui/egl-helpers.c
index 73fe61f8781..6d0cb2b5cb9 100644
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
 bool qemu_egl_has_dmabuf(void)
 {
     if (qemu_egl_display == EGL_NO_DISPLAY) {
diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index 588e7b1bb19..2a2e6d3a17d 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -208,7 +208,7 @@ void gd_egl_scanout_texture(DisplayChangeListener *dcl,
 void gd_egl_scanout_dmabuf(DisplayChangeListener *dcl,
                            QemuDmaBuf *dmabuf)
 {
-#ifdef CONFIG_OPENGL_DMABUF
+#ifdef CONFIG_GBM
     egl_dmabuf_import_texture(dmabuf);
     if (!dmabuf->texture) {
         return;
@@ -224,7 +224,7 @@ void gd_egl_cursor_dmabuf(DisplayChangeListener *dcl,
                           QemuDmaBuf *dmabuf, bool have_hot,
                           uint32_t hot_x, uint32_t hot_y)
 {
-#ifdef CONFIG_OPENGL_DMABUF
+#ifdef CONFIG_GBM
     VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
 
     if (dmabuf) {
@@ -252,7 +252,7 @@ void gd_egl_cursor_position(DisplayChangeListener *dcl,
 void gd_egl_release_dmabuf(DisplayChangeListener *dcl,
                            QemuDmaBuf *dmabuf)
 {
-#ifdef CONFIG_OPENGL_DMABUF
+#ifdef CONFIG_GBM
     egl_dmabuf_release_texture(dmabuf);
 #endif
 }
diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c
index 4e8ee88b9b3..dd5783fec78 100644
--- a/ui/gtk-gl-area.c
+++ b/ui/gtk-gl-area.c
@@ -219,7 +219,7 @@ void gd_gl_area_scanout_flush(DisplayChangeListener *dcl,
 void gd_gl_area_scanout_dmabuf(DisplayChangeListener *dcl,
                                QemuDmaBuf *dmabuf)
 {
-#ifdef CONFIG_OPENGL_DMABUF
+#ifdef CONFIG_GBM
     VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
 
     gtk_gl_area_make_current(GTK_GL_AREA(vc->gfx.drawing_area));
diff --git a/ui/gtk.c b/ui/gtk.c
index 79dc2401203..ab5ae94fc92 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -657,6 +657,8 @@ static const DisplayChangeListenerOps dcl_gl_area_ops = {
     .dpy_has_dmabuf          = gd_has_dmabuf,
 };
 
+#ifdef CONFIG_X11
+
 static const DisplayChangeListenerOps dcl_egl_ops = {
     .dpy_name             = "gtk-egl",
     .dpy_gfx_update       = gd_egl_update,
@@ -679,6 +681,8 @@ static const DisplayChangeListenerOps dcl_egl_ops = {
     .dpy_has_dmabuf          = gd_has_dmabuf,
 };
 
+#endif
+
 #endif /* CONFIG_OPENGL */
 
 /** QEMU Events **/
@@ -797,8 +801,12 @@ static gboolean gd_draw_event(GtkWidget *widget, cairo_t *cr, void *opaque)
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
@@ -2022,6 +2030,7 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s, VirtualConsole *vc,
                              G_CALLBACK(gl_area_realize), vc);
             vc->gfx.dcl.ops = &dcl_gl_area_ops;
         } else {
+#ifdef CONFIG_X11
             vc->gfx.drawing_area = gtk_drawing_area_new();
             /*
              * gtk_widget_set_double_buffered() was deprecated in 3.14.
@@ -2035,6 +2044,9 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s, VirtualConsole *vc,
 #pragma GCC diagnostic pop
             vc->gfx.dcl.ops = &dcl_egl_ops;
             vc->gfx.has_dmabuf = qemu_egl_has_dmabuf();
+#else
+            abort();
+#endif
         }
     } else
 #endif
@@ -2345,8 +2357,10 @@ static void early_gtk_display_init(DisplayOptions *opts)
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
index 156b600a999..e8d3ff41b90 100644
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


