Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3057406CDB
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 15:24:49 +0200 (CEST)
Received: from localhost ([::1]:43486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOgWP-0002i2-1C
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 09:24:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mOgPT-0007I4-CW
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 09:17:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mOgPP-0004lZ-Bv
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 09:17:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631279854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3LxY6OwShsIWbxMX4xsQy1oic3DjGlAQhjXohywzX6w=;
 b=iWi/c9vM7Xo9SnYUR2+ngnZcPQgSRnFGaFOmeyLA9G5HVXfTmV4VGTL79lJ4GC70vi40EZ
 cyzum2BAAIHOyCVpoDssvjpY+Sw+yryiNqwUF+DjJ2K0VcLV+2azUIwXZW0pVyuv9SCnaL
 kcqWYxhoZn1rvoZHj0MESDSd2dJ+Ilg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-6a3OuYIlOYidYP6osUbmjw-1; Fri, 10 Sep 2021 09:17:28 -0400
X-MC-Unique: 6a3OuYIlOYidYP6osUbmjw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1E031084685;
 Fri, 10 Sep 2021 13:17:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A8C7D1865D;
 Fri, 10 Sep 2021 13:17:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1571218003B6; Fri, 10 Sep 2021 15:17:10 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/6] ui: Create sync objects and fences only for blobs
Date: Fri, 10 Sep 2021 15:17:06 +0200
Message-Id: <20210910131709.3681492-4-kraxel@redhat.com>
In-Reply-To: <20210910131709.3681492-1-kraxel@redhat.com>
References: <20210910131709.3681492-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vivek Kasireddy <vivek.kasireddy@intel.com>

Create sync objects and fences only for dmabufs that are blobs. Once a
fence is created (after glFlush) and is signalled,
graphic_hw_gl_flushed() will be called and virtio-gpu cmd processing
will be resumed.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Message-Id: <20210901211014.2800391-4-vivek.kasireddy@intel.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/console.h            |  1 +
 include/ui/egl-helpers.h        |  1 +
 include/ui/gtk.h                |  1 +
 hw/display/virtio-gpu-udmabuf.c |  1 +
 ui/gtk-egl.c                    | 20 ++++++++++++++++++++
 ui/gtk-gl-area.c                | 20 ++++++++++++++++++++
 ui/gtk.c                        | 13 +++++++++++++
 7 files changed, 57 insertions(+)

diff --git a/include/ui/console.h b/include/ui/console.h
index 45ec1291743b..244664d727a4 100644
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
index 2c3ba92b53e1..2fb6e0dd6b87 100644
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
index 8e98a79ac813..43854f350907 100644
--- a/include/ui/gtk.h
+++ b/include/ui/gtk.h
@@ -155,6 +155,7 @@ extern bool gtk_use_gl_area;
 /* ui/gtk.c */
 void gd_update_windowsize(VirtualConsole *vc);
 int gd_monitor_update_interval(GtkWidget *widget);
+void gd_hw_gl_flushed(void *vc);
 
 /* ui/gtk-egl.c */
 void gd_egl_init(VirtualConsole *vc);
diff --git a/hw/display/virtio-gpu-udmabuf.c b/hw/display/virtio-gpu-udmabuf.c
index 3c01a415e71b..c6f7f587847f 100644
--- a/hw/display/virtio-gpu-udmabuf.c
+++ b/hw/display/virtio-gpu-udmabuf.c
@@ -185,6 +185,7 @@ static VGPUDMABuf
     dmabuf->buf.stride = fb->stride;
     dmabuf->buf.fourcc = qemu_pixman_to_drm_format(fb->format);
     dmabuf->buf.fd = res->dmabuf_fd;
+    dmabuf->buf.allow_fences = true;
 
     dmabuf->scanout_id = scanout_id;
     QTAILQ_INSERT_HEAD(&g->dmabuf.bufs, dmabuf, next);
diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index b671181272d5..2c68696d9fab 100644
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
index dd5783fec784..1654941dc982 100644
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
index 784a2f6c749c..5105c0a33ff1 100644
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
2.31.1


