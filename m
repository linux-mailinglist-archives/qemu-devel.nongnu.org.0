Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6663FE4E5
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 23:26:05 +0200 (CEST)
Received: from localhost ([::1]:57014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLXkC-0006vs-Qh
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 17:26:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1mLXhp-0004qv-49
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 17:23:37 -0400
Received: from mga12.intel.com ([192.55.52.136]:37649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1mLXhn-0004Fl-8P
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 17:23:36 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10094"; a="198425769"
X-IronPort-AV: E=Sophos;i="5.84,370,1620716400"; d="scan'208";a="198425769"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 14:23:23 -0700
X-IronPort-AV: E=Sophos;i="5.84,370,1620716400"; d="scan'208";a="467077103"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 14:23:23 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 3/5] ui: Create sync objects and fences only for blobs
Date: Wed,  1 Sep 2021 14:10:12 -0700
Message-Id: <20210901211014.2800391-4-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210901211014.2800391-1-vivek.kasireddy@intel.com>
References: <20210901211014.2800391-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136;
 envelope-from=vivek.kasireddy@intel.com; helo=mga12.intel.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create sync objects and fences only for dmabufs that are blobs. Once a
fence is created (after glFlush) and is signalled,
graphic_hw_gl_flushed() will be called and virtio-gpu cmd processing
will be resumed.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 hw/display/virtio-gpu-udmabuf.c |  1 +
 include/ui/console.h            |  1 +
 include/ui/egl-helpers.h        |  1 +
 include/ui/gtk.h                |  1 +
 ui/gtk-egl.c                    | 20 ++++++++++++++++++++
 ui/gtk-gl-area.c                | 20 ++++++++++++++++++++
 ui/gtk.c                        | 13 +++++++++++++
 7 files changed, 57 insertions(+)

diff --git a/hw/display/virtio-gpu-udmabuf.c b/hw/display/virtio-gpu-udmabuf.c
index 3c01a415e7..c6f7f58784 100644
--- a/hw/display/virtio-gpu-udmabuf.c
+++ b/hw/display/virtio-gpu-udmabuf.c
@@ -185,6 +185,7 @@ static VGPUDMABuf
     dmabuf->buf.stride = fb->stride;
     dmabuf->buf.fourcc = qemu_pixman_to_drm_format(fb->format);
     dmabuf->buf.fd = res->dmabuf_fd;
+    dmabuf->buf.allow_fences = true;
 
     dmabuf->scanout_id = scanout_id;
     QTAILQ_INSERT_HEAD(&g->dmabuf.bufs, dmabuf, next);
diff --git a/include/ui/console.h b/include/ui/console.h
index 45ec129174..244664d727 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -170,6 +170,7 @@ typedef struct QemuDmaBuf {
     bool      y0_top;
     void      *sync;
     int       fence_fd;
+    bool      allow_fences;
 } QemuDmaBuf;
 
 typedef struct DisplayState DisplayState;
diff --git a/include/ui/egl-helpers.h b/include/ui/egl-helpers.h
index 2c3ba92b53..2fb6e0dd6b 100644
--- a/include/ui/egl-helpers.h
+++ b/include/ui/egl-helpers.h
@@ -19,6 +19,7 @@ typedef struct egl_fb {
     GLuint texture;
     GLuint framebuffer;
     bool delete_texture;
+    QemuDmaBuf *dmabuf;
 } egl_fb;
 
 void egl_fb_destroy(egl_fb *fb);
diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index 8e98a79ac8..43854f3509 100644
--- a/include/ui/gtk.h
+++ b/include/ui/gtk.h
@@ -155,6 +155,7 @@ extern bool gtk_use_gl_area;
 /* ui/gtk.c */
 void gd_update_windowsize(VirtualConsole *vc);
 int gd_monitor_update_interval(GtkWidget *widget);
+void gd_hw_gl_flushed(void *vc);
 
 /* ui/gtk-egl.c */
 void gd_egl_init(VirtualConsole *vc);
diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index b671181272..2c68696d9f 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -12,6 +12,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/main-loop.h"
 
 #include "trace.h"
 
@@ -63,6 +64,7 @@ void gd_egl_draw(VirtualConsole *vc)
 {
     GdkWindow *window;
     int ww, wh;
+    QemuDmaBuf *dmabuf = vc->gfx.guest_fb.dmabuf;
 
     if (!vc->gfx.gls) {
         return;
@@ -94,6 +96,14 @@ void gd_egl_draw(VirtualConsole *vc)
     }
 
     glFlush();
+    if (dmabuf) {
+        egl_dmabuf_create_fence(dmabuf);
+        if (dmabuf->fence_fd > 0) {
+            qemu_set_fd_handler(dmabuf->fence_fd, gd_hw_gl_flushed, NULL, vc);
+            return;
+        }
+        graphic_hw_gl_block(vc->gfx.dcl.con, false);
+    }
     graphic_hw_gl_flushed(vc->gfx.dcl.con);
 }
 
@@ -209,6 +219,8 @@ void gd_egl_scanout_dmabuf(DisplayChangeListener *dcl,
                            QemuDmaBuf *dmabuf)
 {
 #ifdef CONFIG_GBM
+    VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
+
     egl_dmabuf_import_texture(dmabuf);
     if (!dmabuf->texture) {
         return;
@@ -217,6 +229,10 @@ void gd_egl_scanout_dmabuf(DisplayChangeListener *dcl,
     gd_egl_scanout_texture(dcl, dmabuf->texture,
                            false, dmabuf->width, dmabuf->height,
                            0, 0, dmabuf->width, dmabuf->height);
+
+    if (dmabuf->allow_fences) {
+        vc->gfx.guest_fb.dmabuf = dmabuf;
+    }
 #endif
 }
 
@@ -281,6 +297,10 @@ void gd_egl_scanout_flush(DisplayChangeListener *dcl,
         egl_fb_blit(&vc->gfx.win_fb, &vc->gfx.guest_fb, !vc->gfx.y0_top);
     }
 
+    if (vc->gfx.guest_fb.dmabuf) {
+        egl_dmabuf_create_sync(vc->gfx.guest_fb.dmabuf);
+    }
+
     eglSwapBuffers(qemu_egl_display, vc->gfx.esurface);
 }
 
diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c
index dd5783fec7..1654941dc9 100644
--- a/ui/gtk-gl-area.c
+++ b/ui/gtk-gl-area.c
@@ -8,6 +8,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/main-loop.h"
 
 #include "trace.h"
 
@@ -38,6 +39,7 @@ static void gtk_gl_area_set_scanout_mode(VirtualConsole *vc, bool scanout)
 void gd_gl_area_draw(VirtualConsole *vc)
 {
     int ww, wh, y1, y2;
+    QemuDmaBuf *dmabuf = vc->gfx.guest_fb.dmabuf;
 
     if (!vc->gfx.gls) {
         return;
@@ -71,7 +73,18 @@ void gd_gl_area_draw(VirtualConsole *vc)
         surface_gl_render_texture(vc->gfx.gls, vc->gfx.ds);
     }
 
+    if (dmabuf) {
+        egl_dmabuf_create_sync(dmabuf);
+    }
     glFlush();
+    if (dmabuf) {
+        egl_dmabuf_create_fence(dmabuf);
+        if (dmabuf->fence_fd > 0) {
+            qemu_set_fd_handler(dmabuf->fence_fd, gd_hw_gl_flushed, NULL, vc);
+            return;
+        }
+        graphic_hw_gl_block(vc->gfx.dcl.con, false);
+    }
     graphic_hw_gl_flushed(vc->gfx.dcl.con);
 }
 
@@ -213,6 +226,9 @@ void gd_gl_area_scanout_flush(DisplayChangeListener *dcl,
 {
     VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
 
+    if (vc->gfx.guest_fb.dmabuf) {
+        graphic_hw_gl_block(vc->gfx.dcl.con, true);
+    }
     gtk_gl_area_queue_render(GTK_GL_AREA(vc->gfx.drawing_area));
 }
 
@@ -231,6 +247,10 @@ void gd_gl_area_scanout_dmabuf(DisplayChangeListener *dcl,
     gd_gl_area_scanout_texture(dcl, dmabuf->texture,
                                false, dmabuf->width, dmabuf->height,
                                0, 0, dmabuf->width, dmabuf->height);
+
+    if (dmabuf->allow_fences) {
+        vc->gfx.guest_fb.dmabuf = dmabuf;
+    }
 #endif
 }
 
diff --git a/ui/gtk.c b/ui/gtk.c
index 784a2f6c74..5105c0a33f 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -36,6 +36,7 @@
 #include "qapi/qapi-commands-machine.h"
 #include "qapi/qapi-commands-misc.h"
 #include "qemu/cutils.h"
+#include "qemu/main-loop.h"
 
 #include "ui/console.h"
 #include "ui/gtk.h"
@@ -583,6 +584,18 @@ static void gd_gl_release_dmabuf(DisplayChangeListener *dcl,
 #endif
 }
 
+void gd_hw_gl_flushed(void *vcon)
+{
+    VirtualConsole *vc = vcon;
+    QemuDmaBuf *dmabuf = vc->gfx.guest_fb.dmabuf;
+
+    graphic_hw_gl_block(vc->gfx.dcl.con, false);
+    graphic_hw_gl_flushed(vc->gfx.dcl.con);
+    qemu_set_fd_handler(dmabuf->fence_fd, NULL, NULL, NULL);
+    close(dmabuf->fence_fd);
+    dmabuf->fence_fd = -1;
+}
+
 /** DisplayState Callbacks (opengl version) **/
 
 static const DisplayChangeListenerOps dcl_gl_area_ops = {
-- 
2.30.2


