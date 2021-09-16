Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C14E640EE39
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 01:46:20 +0200 (CEST)
Received: from localhost ([::1]:51784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR159-0004py-GF
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 19:46:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1mR13D-0003qF-KZ
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 19:44:19 -0400
Received: from mga12.intel.com ([192.55.52.136]:2841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1mR137-0006QV-IZ
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 19:44:19 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10109"; a="202183642"
X-IronPort-AV: E=Sophos;i="5.85,299,1624345200"; d="scan'208";a="202183642"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 16:44:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,299,1624345200"; d="scan'208";a="699181126"
Received: from dw-tiger-lake-client-platform.fm.intel.com ([10.105.205.202])
 by fmsmga006.fm.intel.com with ESMTP; 16 Sep 2021 16:44:04 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] ui/gtk: skip any extra draw of same guest scanout blob res
Date: Thu, 16 Sep 2021 16:41:56 -0700
Message-Id: <20210916234156.5505-1-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=192.55.52.136; envelope-from=dongwon.kim@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Dongwon Kim <dongwon.kim@intel.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Any extra draw call for the same blob resource representing guest scanout
before the previous drawing is not finished can break synchronous draw
sequence. To prevent this, drawing is now done only once for each draw
submission (when draw_submitted == true). Mutex is added to protect this
draw iteration and the flag.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 hw/display/virtio-gpu-udmabuf.c |  3 ++
 include/ui/console.h            |  3 ++
 ui/gtk-egl.c                    | 44 +++++++++++++++++++--------
 ui/gtk-gl-area.c                | 53 +++++++++++++++++++++------------
 4 files changed, 71 insertions(+), 32 deletions(-)

diff --git a/hw/display/virtio-gpu-udmabuf.c b/hw/display/virtio-gpu-udmabuf.c
index c6f7f58784..aabc7b81b5 100644
--- a/hw/display/virtio-gpu-udmabuf.c
+++ b/hw/display/virtio-gpu-udmabuf.c
@@ -186,6 +186,9 @@ static VGPUDMABuf
     dmabuf->buf.fourcc = qemu_pixman_to_drm_format(fb->format);
     dmabuf->buf.fd = res->dmabuf_fd;
     dmabuf->buf.allow_fences = true;
+    dmabuf->buf.draw_submitted = false;
+
+    qemu_mutex_init(&dmabuf->buf.mutex);
 
     dmabuf->scanout_id = scanout_id;
     QTAILQ_INSERT_HEAD(&g->dmabuf.bufs, dmabuf, next);
diff --git a/include/ui/console.h b/include/ui/console.h
index 244664d727..0f931c3696 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -5,6 +5,7 @@
 #include "qom/object.h"
 #include "qemu/notify.h"
 #include "qemu/error-report.h"
+#include "qemu/lockable.h"
 #include "qapi/qapi-types-ui.h"
 
 #ifdef CONFIG_OPENGL
@@ -171,6 +172,8 @@ typedef struct QemuDmaBuf {
     void      *sync;
     int       fence_fd;
     bool      allow_fences;
+    bool      draw_submitted;
+    QemuMutex mutex;
 } QemuDmaBuf;
 
 typedef struct DisplayState DisplayState;
diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index 72ce5e1f8f..17727d040b 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -63,6 +63,9 @@ void gd_egl_init(VirtualConsole *vc)
 void gd_egl_draw(VirtualConsole *vc)
 {
     GdkWindow *window;
+#ifdef CONFIG_GBM
+    QemuDmaBuf *dmabuf = vc->gfx.guest_fb.dmabuf;
+#endif
     int ww, wh;
 
     if (!vc->gfx.gls) {
@@ -74,10 +77,35 @@ void gd_egl_draw(VirtualConsole *vc)
     wh = gdk_window_get_height(window);
 
     if (vc->gfx.scanout_mode) {
+#ifdef CONFIG_GBM
+        if (dmabuf) {
+            qemu_mutex_lock(&dmabuf->mutex);
+            if (!dmabuf->draw_submitted) {
+                qemu_mutex_unlock(&dmabuf->mutex);
+                return;
+            } else {
+                dmabuf->draw_submitted = false;
+            }
+        }
+#endif
         gd_egl_scanout_flush(&vc->gfx.dcl, 0, 0, vc->gfx.w, vc->gfx.h);
 
         vc->gfx.scale_x = (double)ww / vc->gfx.w;
         vc->gfx.scale_y = (double)wh / vc->gfx.h;
+
+        glFlush();
+#ifdef CONFIG_GBM
+        if (dmabuf) {
+            egl_dmabuf_create_fence(dmabuf);
+            if (dmabuf->fence_fd > 0) {
+                qemu_set_fd_handler(dmabuf->fence_fd, gd_hw_gl_flushed, NULL, vc);
+                qemu_mutex_unlock(&dmabuf->mutex);
+                return;
+            }
+            graphic_hw_gl_block(vc->gfx.dcl.con, false);
+            qemu_mutex_unlock(&dmabuf->mutex);
+        }
+#endif
     } else {
         if (!vc->gfx.ds) {
             return;
@@ -92,21 +120,10 @@ void gd_egl_draw(VirtualConsole *vc)
 
         vc->gfx.scale_x = (double)ww / surface_width(vc->gfx.ds);
         vc->gfx.scale_y = (double)wh / surface_height(vc->gfx.ds);
-    }
-
-    glFlush();
-#ifdef CONFIG_GBM
-    if (vc->gfx.guest_fb.dmabuf) {
-        QemuDmaBuf *dmabuf = vc->gfx.guest_fb.dmabuf;
 
-        egl_dmabuf_create_fence(dmabuf);
-        if (dmabuf->fence_fd > 0) {
-            qemu_set_fd_handler(dmabuf->fence_fd, gd_hw_gl_flushed, NULL, vc);
-            return;
-        }
-        graphic_hw_gl_block(vc->gfx.dcl.con, false);
+        glFlush();
     }
-#endif
+
     graphic_hw_gl_flushed(vc->gfx.dcl.con);
 }
 
@@ -317,6 +334,7 @@ void gd_egl_flush(DisplayChangeListener *dcl,
 
     if (vc->gfx.guest_fb.dmabuf) {
         graphic_hw_gl_block(vc->gfx.dcl.con, true);
+        vc->gfx.guest_fb.dmabuf->draw_submitted = true;
         gtk_widget_queue_draw_area(area, x, y, w, h);
         return;
     }
diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c
index b23523748e..7b432ad7f4 100644
--- a/ui/gtk-gl-area.c
+++ b/ui/gtk-gl-area.c
@@ -38,6 +38,9 @@ static void gtk_gl_area_set_scanout_mode(VirtualConsole *vc, bool scanout)
 
 void gd_gl_area_draw(VirtualConsole *vc)
 {
+#ifdef CONFIG_GBM
+    QemuDmaBuf *dmabuf = vc->gfx.guest_fb.dmabuf;
+#endif
     int ww, wh, y1, y2;
 
     if (!vc->gfx.gls) {
@@ -53,6 +56,18 @@ void gd_gl_area_draw(VirtualConsole *vc)
             return;
         }
 
+#ifdef CONFIG_GBM
+        if (dmabuf) {
+            qemu_mutex_lock(&dmabuf->mutex);
+            if (!dmabuf->draw_submitted) {
+                qemu_mutex_unlock(&dmabuf->mutex);
+                return;
+            } else {
+                dmabuf->draw_submitted = false;
+            }
+        }
+#endif
+
         glBindFramebuffer(GL_READ_FRAMEBUFFER, vc->gfx.guest_fb.framebuffer);
         /* GtkGLArea sets GL_DRAW_FRAMEBUFFER for us */
 
@@ -62,6 +77,24 @@ void gd_gl_area_draw(VirtualConsole *vc)
         glBlitFramebuffer(0, y1, vc->gfx.w, y2,
                           0, 0, ww, wh,
                           GL_COLOR_BUFFER_BIT, GL_NEAREST);
+#ifdef CONFIG_GBM
+        if (dmabuf) {
+            egl_dmabuf_create_sync(dmabuf);
+        }
+#endif
+        glFlush();
+#ifdef CONFIG_GBM
+        if (dmabuf) {
+            egl_dmabuf_create_fence(dmabuf);
+            if (dmabuf->fence_fd > 0) {
+                qemu_set_fd_handler(dmabuf->fence_fd, gd_hw_gl_flushed, NULL, vc);
+                qemu_mutex_unlock(&dmabuf->mutex);
+                return;
+            }
+            qemu_mutex_unlock(&dmabuf->mutex);
+            graphic_hw_gl_block(vc->gfx.dcl.con, false);
+        }
+#endif
     } else {
         if (!vc->gfx.ds) {
             return;
@@ -72,25 +105,6 @@ void gd_gl_area_draw(VirtualConsole *vc)
         surface_gl_render_texture(vc->gfx.gls, vc->gfx.ds);
     }
 
-#ifdef CONFIG_GBM
-    if (vc->gfx.guest_fb.dmabuf) {
-        egl_dmabuf_create_sync(vc->gfx.guest_fb.dmabuf);
-    }
-#endif
-
-    glFlush();
-#ifdef CONFIG_GBM
-    if (vc->gfx.guest_fb.dmabuf) {
-        QemuDmaBuf *dmabuf = vc->gfx.guest_fb.dmabuf;
-
-        egl_dmabuf_create_fence(dmabuf);
-        if (dmabuf->fence_fd > 0) {
-            qemu_set_fd_handler(dmabuf->fence_fd, gd_hw_gl_flushed, NULL, vc);
-            return;
-        }
-        graphic_hw_gl_block(vc->gfx.dcl.con, false);
-    }
-#endif
     graphic_hw_gl_flushed(vc->gfx.dcl.con);
 }
 
@@ -234,6 +248,7 @@ void gd_gl_area_scanout_flush(DisplayChangeListener *dcl,
 
     if (vc->gfx.guest_fb.dmabuf) {
         graphic_hw_gl_block(vc->gfx.dcl.con, true);
+        vc->gfx.guest_fb.dmabuf->draw_submitted = true;
     }
     gtk_gl_area_queue_render(GTK_GL_AREA(vc->gfx.drawing_area));
 }
-- 
2.17.1


