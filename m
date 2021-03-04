Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE18032D3DB
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 14:06:17 +0100 (CET)
Received: from localhost ([::1]:51798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHngG-0004Kf-QR
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 08:06:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lHnT0-0007eN-Qf
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 07:52:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lHnSy-00059z-CW
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 07:52:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614862351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=efapKU6pAR+Z7Mfw0rmiyFAzBcoc8Syahg7YGlvwaoU=;
 b=CuYT8rPtvhUibIUZ1+jjZJ9XPJ/Z91OdFyvaxzgf6+3PLZ//rNMkZ/b3klKqHsUIoqRMBL
 Nb7VRBm8b9d2NrSIaZ7hmryk8wEjWWG1U7pntvggJBZomQCFCbLjPL4/pNJKJPWFQ8IWo8
 Aqg8u7Z8puNzx8Ka32pYMnembywhkuo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-8sJGlB5uPXKS7jZsJpOQMg-1; Thu, 04 Mar 2021 07:52:29 -0500
X-MC-Unique: 8sJGlB5uPXKS7jZsJpOQMg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B75B640A0;
 Thu,  4 Mar 2021 12:52:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-129.ams2.redhat.com
 [10.36.115.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A59B5FCC8;
 Thu,  4 Mar 2021 12:52:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 60B0B18003B1; Thu,  4 Mar 2021 09:37:05 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/8] configure: Improve OpenGL dependency detections
Date: Thu,  4 Mar 2021 09:37:01 +0100
Message-Id: <20210304083705.1046645-5-kraxel@redhat.com>
In-Reply-To: <20210304083705.1046645-1-kraxel@redhat.com>
References: <20210304083705.1046645-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

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
Message-Id: <20210223060307.87736-1-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 configure                    | 37 +++++++++++++++---------------------
 include/ui/egl-helpers.h     |  9 ++++++++-
 include/ui/spice-display.h   |  2 +-
 ui/egl-helpers.c             |  8 ++++++--
 ui/gtk-egl.c                 |  6 +++---
 ui/gtk-gl-area.c             |  2 +-
 ui/gtk.c                     | 14 ++++++++++++++
 docs/interop/vhost-user.json |  3 ++-
 meson.build                  |  2 +-
 ui/meson.build               |  8 +++++---
 10 files changed, 56 insertions(+), 35 deletions(-)

diff --git a/configure b/configure
index a79b3746d4c5..b922d1ea2604 100755
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
diff --git a/include/ui/egl-helpers.h b/include/ui/egl-helpers.h
index 5b1f7fafe0bc..f1bf8f97fc33 100644
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
index 4a47ffdd4c82..ed298d58f06c 100644
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
diff --git a/ui/egl-helpers.c b/ui/egl-helpers.c
index 73fe61f87819..6d0cb2b5cb93 100644
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
index 588e7b1bb199..2a2e6d3a17d4 100644
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
index 4e8ee88b9b39..dd5783fec784 100644
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
index bad716f136ea..c32ee34edcaf 100644
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
@@ -2031,6 +2039,7 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s, VirtualConsole *vc,
                              G_CALLBACK(gl_area_realize), vc);
             vc->gfx.dcl.ops = &dcl_gl_area_ops;
         } else {
+#ifdef CONFIG_X11
             vc->gfx.drawing_area = gtk_drawing_area_new();
             /*
              * gtk_widget_set_double_buffered() was deprecated in 3.14.
@@ -2044,6 +2053,9 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s, VirtualConsole *vc,
 #pragma GCC diagnostic pop
             vc->gfx.dcl.ops = &dcl_egl_ops;
             vc->gfx.has_dmabuf = qemu_egl_has_dmabuf();
+#else
+            abort();
+#endif
         }
     } else
 #endif
@@ -2354,8 +2366,10 @@ static void early_gtk_display_init(DisplayOptions *opts)
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
diff --git a/docs/interop/vhost-user.json b/docs/interop/vhost-user.json
index feb5fe58cad2..b6ade9e49315 100644
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
diff --git a/meson.build b/meson.build
index f3db83e974fd..095f627edfd3 100644
--- a/meson.build
+++ b/meson.build
@@ -2648,7 +2648,7 @@ summary_info += {'U2F support':       u2f.found()}
 summary_info += {'libusb':            config_host.has_key('CONFIG_USB_LIBUSB')}
 summary_info += {'usb net redir':     config_host.has_key('CONFIG_USB_REDIR')}
 summary_info += {'OpenGL support':    config_host.has_key('CONFIG_OPENGL')}
-summary_info += {'OpenGL dmabufs':    config_host.has_key('CONFIG_OPENGL_DMABUF')}
+summary_info += {'GBM':               config_host.has_key('CONFIG_GBM')}
 summary_info += {'libiscsi support':  libiscsi.found()}
 summary_info += {'libnfs support':    libnfs.found()}
 if targetos == 'windows'
diff --git a/ui/meson.build b/ui/meson.build
index 156b600a9998..e8d3ff41b905 100644
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
2.29.2


