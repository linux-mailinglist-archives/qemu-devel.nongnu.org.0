Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C2D37A33E
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 11:15:57 +0200 (CEST)
Received: from localhost ([::1]:38186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgOUe-0007op-6K
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 05:15:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lgNeK-0000yz-OP
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:21:52 -0400
Received: from mga17.intel.com ([192.55.52.151]:32215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lgNeG-0004r8-9q
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:21:52 -0400
IronPort-SDR: IEmpkwsbSrSb18g8ljOlptJs//DcJTFljcC7XMNYA8zGFhSSGSRaue7O8L3Lj8uh/cCx5aDkbF
 JIT4I7YjR/Pw==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="179649398"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="179649398"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 01:20:49 -0700
IronPort-SDR: gM9ZwpS+GcUMT6z8g3TQ6YDo3MieX0GfCbiE5v+fpXv9RvASD036S9wxe4VSWb9qC2a/KEVl0z
 j1oWq/MxIw9w==
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="536892224"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 01:20:49 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 17/20] ui: Add egl helpers for synchronization
Date: Tue, 11 May 2021 01:08:15 -0700
Message-Id: <20210511080818.366985-18-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210511080818.366985-1-vivek.kasireddy@intel.com>
References: <20210511080818.366985-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=vivek.kasireddy@intel.com; helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These egl helpers will be useful for creating a sync object
and waiting on it when called from the virtio-gpu wait_flush
API.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 include/ui/console.h     |  2 ++
 include/ui/egl-helpers.h |  4 ++++
 ui/egl-helpers.c         | 44 ++++++++++++++++++++++++++++++++++++++++
 ui/gtk-egl.c             | 10 +++++++++
 ui/gtk-gl-area.c         |  8 ++++++++
 ui/gtk.c                 | 15 ++++++++++++++
 6 files changed, 83 insertions(+)

diff --git a/include/ui/console.h b/include/ui/console.h
index 3b0e377923..15a92dd87a 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -169,6 +169,8 @@ typedef struct QemuDmaBuf {
     uint32_t  texture;
     bool      y0_top;
     void      *sync;
+    bool      blob;
+    int       fence_fd;
 } QemuDmaBuf;
 
 typedef struct DisplayState DisplayState;
diff --git a/include/ui/egl-helpers.h b/include/ui/egl-helpers.h
index f1bf8f97fc..1bc0e31b03 100644
--- a/include/ui/egl-helpers.h
+++ b/include/ui/egl-helpers.h
@@ -19,6 +19,7 @@ typedef struct egl_fb {
     GLuint texture;
     GLuint framebuffer;
     bool delete_texture;
+    QemuDmaBuf *dmabuf;
 } egl_fb;
 
 void egl_fb_destroy(egl_fb *fb);
@@ -45,6 +46,9 @@ int egl_get_fd_for_texture(uint32_t tex_id, EGLint *stride, EGLint *fourcc,
 
 void egl_dmabuf_import_texture(QemuDmaBuf *dmabuf);
 void egl_dmabuf_release_texture(QemuDmaBuf *dmabuf);
+void egl_dmabuf_create_sync(QemuDmaBuf *dmabuf);
+void egl_dmabuf_create_fence(QemuDmaBuf *dmabuf);
+void egl_dmabuf_wait_sync(QemuDmaBuf *dmabuf);
 
 #endif
 
diff --git a/ui/egl-helpers.c b/ui/egl-helpers.c
index 6d0cb2b5cb..47220b66e0 100644
--- a/ui/egl-helpers.c
+++ b/ui/egl-helpers.c
@@ -76,6 +76,50 @@ void egl_fb_setup_for_tex(egl_fb *fb, int width, int height,
                               GL_TEXTURE_2D, fb->texture, 0);
 }
 
+void egl_dmabuf_create_sync(QemuDmaBuf *dmabuf)
+{
+    EGLSyncKHR sync;
+
+    if (epoxy_has_egl_extension(qemu_egl_display,
+                                "EGL_KHR_fence_sync") &&
+        epoxy_has_egl_extension(qemu_egl_display,
+                                "EGL_ANDROID_native_fence_sync")) {
+        sync = eglCreateSyncKHR(qemu_egl_display,
+				EGL_SYNC_NATIVE_FENCE_ANDROID, NULL);
+        if (sync != EGL_NO_SYNC_KHR) {
+            dmabuf->sync = sync;
+        }
+    }
+}
+
+void egl_dmabuf_create_fence(QemuDmaBuf *dmabuf)
+{
+    if (dmabuf->sync) {
+        dmabuf->fence_fd = eglDupNativeFenceFDANDROID(qemu_egl_display,
+                                                      dmabuf->sync);
+        eglDestroySyncKHR(qemu_egl_display, dmabuf->sync);
+        dmabuf->sync = NULL;
+    }
+}
+
+void egl_dmabuf_wait_sync(QemuDmaBuf *dmabuf)
+{
+    EGLSyncKHR sync;
+    EGLint attrib_list[] = {
+        EGL_SYNC_NATIVE_FENCE_FD_ANDROID, dmabuf->fence_fd,
+        EGL_NONE,
+    };
+
+    sync = eglCreateSyncKHR(qemu_egl_display,
+                            EGL_SYNC_NATIVE_FENCE_ANDROID, attrib_list);
+    if (sync != EGL_NO_SYNC_KHR) {
+        eglClientWaitSyncKHR(qemu_egl_display, sync,
+                             0, EGL_FOREVER_KHR);
+        eglDestroySyncKHR(qemu_egl_display, sync);
+        dmabuf->fence_fd = -1;
+    }
+}
+
 void egl_fb_setup_new_tex(egl_fb *fb, int width, int height)
 {
     GLuint texture;
diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index 2a2e6d3a17..e7117695f0 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -209,6 +209,8 @@ void gd_egl_scanout_dmabuf(DisplayChangeListener *dcl,
                            QemuDmaBuf *dmabuf)
 {
 #ifdef CONFIG_GBM
+    VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
+
     egl_dmabuf_import_texture(dmabuf);
     if (!dmabuf->texture) {
         return;
@@ -217,6 +219,10 @@ void gd_egl_scanout_dmabuf(DisplayChangeListener *dcl,
     gd_egl_scanout_texture(dcl, dmabuf->texture,
                            false, dmabuf->width, dmabuf->height,
                            0, 0, dmabuf->width, dmabuf->height);
+
+    if (dmabuf->blob) {
+        vc->gfx.guest_fb.dmabuf = dmabuf;
+    }
 #endif
 }
 
@@ -289,6 +295,10 @@ void gd_egl_scanout_flush(DisplayChangeListener *dcl,
         egl_fb_blit(&vc->gfx.win_fb, &vc->gfx.guest_fb, !vc->gfx.y0_top);
     }
 
+    if (vc->gfx.guest_fb.dmabuf) {
+        egl_dmabuf_create_sync(vc->gfx.guest_fb.dmabuf);
+    }
+
     eglSwapBuffers(qemu_egl_display, vc->gfx.esurface);
 }
 
diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c
index dd5783fec7..94f3b87c42 100644
--- a/ui/gtk-gl-area.c
+++ b/ui/gtk-gl-area.c
@@ -71,6 +71,10 @@ void gd_gl_area_draw(VirtualConsole *vc)
         surface_gl_render_texture(vc->gfx.gls, vc->gfx.ds);
     }
 
+    if (vc->gfx.guest_fb.dmabuf) {
+        egl_dmabuf_create_sync(vc->gfx.guest_fb.dmabuf);
+    }
+
     glFlush();
     graphic_hw_gl_flushed(vc->gfx.dcl.con);
 }
@@ -231,6 +235,10 @@ void gd_gl_area_scanout_dmabuf(DisplayChangeListener *dcl,
     gd_gl_area_scanout_texture(dcl, dmabuf->texture,
                                false, dmabuf->width, dmabuf->height,
                                0, 0, dmabuf->width, dmabuf->height);
+
+    if (dmabuf->blob) {
+        vc->gfx.guest_fb.dmabuf = dmabuf;
+    }
 #endif
 }
 
diff --git a/ui/gtk.c b/ui/gtk.c
index 1ea1253528..7465aa7552 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -630,6 +630,19 @@ static bool gd_has_dmabuf(DisplayChangeListener *dcl)
     return vc->gfx.has_dmabuf;
 }
 
+static void gd_gl_wait_dmabuf(DisplayChangeListener *dcl,
+                              QemuDmaBuf *dmabuf)
+{
+#ifdef CONFIG_GBM
+    egl_dmabuf_create_fence(dmabuf);
+    if (dmabuf->fence_fd <= 0) {
+        return;
+    }
+
+    egl_dmabuf_wait_sync(dmabuf);
+#endif
+}
+
 /** DisplayState Callbacks (opengl version) **/
 
 static const DisplayChangeListenerOps dcl_gl_area_ops = {
@@ -648,6 +661,7 @@ static const DisplayChangeListenerOps dcl_gl_area_ops = {
     .dpy_gl_scanout_disable  = gd_gl_area_scanout_disable,
     .dpy_gl_update           = gd_gl_area_scanout_flush,
     .dpy_gl_scanout_dmabuf   = gd_gl_area_scanout_dmabuf,
+    .dpy_gl_wait_dmabuf      = gd_gl_wait_dmabuf,
     .dpy_has_dmabuf          = gd_has_dmabuf,
 };
 
@@ -672,6 +686,7 @@ static const DisplayChangeListenerOps dcl_egl_ops = {
     .dpy_gl_cursor_position  = gd_egl_cursor_position,
     .dpy_gl_release_dmabuf   = gd_egl_release_dmabuf,
     .dpy_gl_update           = gd_egl_scanout_flush,
+    .dpy_gl_wait_dmabuf      = gd_gl_wait_dmabuf,
     .dpy_has_dmabuf          = gd_has_dmabuf,
 };
 
-- 
2.30.2


