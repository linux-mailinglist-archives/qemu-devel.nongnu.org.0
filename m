Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D16DC30C268
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 15:51:04 +0100 (CET)
Received: from localhost ([::1]:60628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6x1D-00011F-TG
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 09:51:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l6whg-00059p-J5
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:30:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l6whe-0004Y8-Fk
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:30:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612276249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eFvI+HYDT/uNmb9gv/g+8Wj2/+by2z6yvIFI5ecFucY=;
 b=b1QHAo39XRzXNcp7Km9kAagLOd8+8qV4Y/pKybTVFb60oNI3LSdYgXB4gkIjuOSbTKOAXg
 bbkiJ+x5xBTJAcKM18zwaPAfKn7UZnfodb4ryvzZRdfZIeH6MaH/x1qufBQm9ylYyQr4XP
 DhzVKkLtmfvp8ixuS/VX0KS0C9Q7AsY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-_WVTgapfOHWfBkRHP6l0BQ-1; Tue, 02 Feb 2021 09:30:47 -0500
X-MC-Unique: _WVTgapfOHWfBkRHP6l0BQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3993C7424
 for <qemu-devel@nongnu.org>; Tue,  2 Feb 2021 14:30:25 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A25562A02;
 Tue,  2 Feb 2021 14:30:24 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 18/20] display/ui: add a callback to indicate GL state is
 flushed
Date: Tue,  2 Feb 2021 18:26:23 +0400
Message-Id: <20210202142625.609070-19-marcandre.lureau@redhat.com>
In-Reply-To: <20210202142625.609070-1-marcandre.lureau@redhat.com>
References: <20210202142625.609070-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Displaying rendered resources requires blocking qemu GPU to avoid extra
framebuffer copies. For an external display, via Spice currently, there
is a callback to block/unblock the rendering in the same thread.

But with the vhost-user-gpu backend, the qemu process doesn't handle
the rendering itself, and the blocking callback isn't effective.
Instead, the backend must be notified when the display code is done.

Fix this by adding a new GraphicHwOps callback to indicate the GL state
is flushed, and we are done manipulating the shared GL resources. Call
it from gtk and spice display.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/hw/virtio/virtio-gpu.h |  2 +-
 include/ui/console.h           |  2 ++
 hw/display/vhost-user-gpu.c    |  4 ++--
 hw/display/virtio-gpu-base.c   | 17 ++++++++++++-----
 hw/display/virtio-gpu.c        |  4 ++--
 hw/display/virtio-vga.c        | 11 +++++++++++
 ui/console.c                   |  9 +++++++++
 ui/gtk-egl.c                   |  3 +++
 ui/gtk-gl-area.c               |  3 +++
 ui/sdl2-gl.c                   |  2 ++
 ui/spice-display.c             |  1 +
 11 files changed, 48 insertions(+), 10 deletions(-)

diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 0043268e90..fae149235c 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -121,7 +121,7 @@ struct VirtIOGPUBase {
 struct VirtIOGPUBaseClass {
     VirtioDeviceClass parent;
 
-    void (*gl_unblock)(VirtIOGPUBase *g);
+    void (*gl_flushed)(VirtIOGPUBase *g);
 };
 
 #define VIRTIO_GPU_BASE_PROPERTIES(_state, _conf)                       \
diff --git a/include/ui/console.h b/include/ui/console.h
index 875885d9c7..d30e972d0b 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -387,6 +387,7 @@ typedef struct GraphicHwOps {
     void (*update_interval)(void *opaque, uint64_t interval);
     int (*ui_info)(void *opaque, uint32_t head, QemuUIInfo *info);
     void (*gl_block)(void *opaque, bool block);
+    void (*gl_flushed)(void *opaque);
 } GraphicHwOps;
 
 QemuConsole *graphic_console_init(DeviceState *dev, uint32_t head,
@@ -402,6 +403,7 @@ void graphic_hw_update_done(QemuConsole *con);
 void graphic_hw_invalidate(QemuConsole *con);
 void graphic_hw_text_update(QemuConsole *con, console_ch_t *chardata);
 void graphic_hw_gl_block(QemuConsole *con, bool block);
+void graphic_hw_gl_flushed(QemuConsole *con);
 
 void qemu_console_early_init(void);
 
diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
index b7bde9feb6..4d8cb3525b 100644
--- a/hw/display/vhost-user-gpu.c
+++ b/hw/display/vhost-user-gpu.c
@@ -360,7 +360,7 @@ vhost_user_gpu_update_blocked(VhostUserGPU *g, bool blocked)
 }
 
 static void
-vhost_user_gpu_gl_unblock(VirtIOGPUBase *b)
+vhost_user_gpu_gl_flushed(VirtIOGPUBase *b)
 {
     VhostUserGPU *g = VHOST_USER_GPU(b);
 
@@ -578,7 +578,7 @@ vhost_user_gpu_class_init(ObjectClass *klass, void *data)
     VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
     VirtIOGPUBaseClass *vgc = VIRTIO_GPU_BASE_CLASS(klass);
 
-    vgc->gl_unblock = vhost_user_gpu_gl_unblock;
+    vgc->gl_flushed = vhost_user_gpu_gl_flushed;
 
     vdc->realize = vhost_user_gpu_device_realize;
     vdc->reset = vhost_user_gpu_reset;
diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index 82c37aac62..6d6b5eed63 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -97,21 +97,27 @@ static int virtio_gpu_ui_info(void *opaque, uint32_t idx, QemuUIInfo *info)
 }
 
 static void
-virtio_gpu_gl_block(void *opaque, bool block)
+virtio_gpu_gl_flushed(void *opaque)
 {
     VirtIOGPUBase *g = opaque;
     VirtIOGPUBaseClass *vgc = VIRTIO_GPU_BASE_GET_CLASS(g);
 
+    if (vgc->gl_flushed) {
+        vgc->gl_flushed(g);
+    }
+}
+
+static void
+virtio_gpu_gl_block(void *opaque, bool block)
+{
+    VirtIOGPUBase *g = opaque;
+
     if (block) {
         g->renderer_blocked++;
     } else {
         g->renderer_blocked--;
     }
     assert(g->renderer_blocked >= 0);
-
-    if (g->renderer_blocked == 0) {
-        vgc->gl_unblock(g);
-    }
 }
 
 static int
@@ -136,6 +142,7 @@ static const GraphicHwOps virtio_gpu_ops = {
     .text_update = virtio_gpu_text_update,
     .ui_info = virtio_gpu_ui_info,
     .gl_block = virtio_gpu_gl_block,
+    .gl_flushed = virtio_gpu_gl_flushed,
 };
 
 bool
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 7eb4265a6d..2e4a9822b6 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -850,7 +850,7 @@ void virtio_gpu_process_cmdq(VirtIOGPU *g)
     g->processing_cmdq = false;
 }
 
-static void virtio_gpu_gl_unblock(VirtIOGPUBase *b)
+static void virtio_gpu_gl_flushed(VirtIOGPUBase *b)
 {
     VirtIOGPU *g = VIRTIO_GPU(b);
 
@@ -1257,7 +1257,7 @@ static void virtio_gpu_class_init(ObjectClass *klass, void *data)
     VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
     VirtIOGPUBaseClass *vgc = VIRTIO_GPU_BASE_CLASS(klass);
 
-    vgc->gl_unblock = virtio_gpu_gl_unblock;
+    vgc->gl_flushed = virtio_gpu_gl_flushed;
     vdc->realize = virtio_gpu_device_realize;
     vdc->reset = virtio_gpu_reset;
     vdc->get_config = virtio_gpu_get_config;
diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
index b071909b68..d3c6404061 100644
--- a/hw/display/virtio-vga.c
+++ b/hw/display/virtio-vga.c
@@ -68,6 +68,16 @@ static void virtio_vga_base_gl_block(void *opaque, bool block)
     }
 }
 
+static void virtio_vga_base_gl_flushed(void *opaque)
+{
+    VirtIOVGABase *vvga = opaque;
+    VirtIOGPUBase *g = vvga->vgpu;
+
+    if (g->hw_ops->gl_flushed) {
+        g->hw_ops->gl_flushed(g);
+    }
+}
+
 static int virtio_vga_base_get_flags(void *opaque)
 {
     VirtIOVGABase *vvga = opaque;
@@ -83,6 +93,7 @@ static const GraphicHwOps virtio_vga_base_ops = {
     .text_update = virtio_vga_base_text_update,
     .ui_info = virtio_vga_base_ui_info,
     .gl_block = virtio_vga_base_gl_block,
+    .gl_flushed = virtio_vga_base_gl_flushed,
 };
 
 static const VMStateDescription vmstate_virtio_vga_base = {
diff --git a/ui/console.c b/ui/console.c
index 47124e8cad..0de287713f 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -294,6 +294,15 @@ void graphic_hw_gl_block(QemuConsole *con, bool block)
     }
 }
 
+void graphic_hw_gl_flushed(QemuConsole *con)
+{
+    assert(con != NULL);
+
+    if (con->hw_ops->gl_flushed) {
+        con->hw_ops->gl_flushed(con->hw);
+    }
+}
+
 int qemu_console_get_window_id(QemuConsole *con)
 {
     return con->window_id;
diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index 71c3d698b4..588e7b1bb1 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -92,6 +92,9 @@ void gd_egl_draw(VirtualConsole *vc)
         vc->gfx.scale_x = (double)ww / surface_width(vc->gfx.ds);
         vc->gfx.scale_y = (double)wh / surface_height(vc->gfx.ds);
     }
+
+    glFlush();
+    graphic_hw_gl_flushed(vc->gfx.dcl.con);
 }
 
 void gd_egl_update(DisplayChangeListener *dcl,
diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c
index 72bcd94918..e7ca73c7b1 100644
--- a/ui/gtk-gl-area.c
+++ b/ui/gtk-gl-area.c
@@ -70,6 +70,9 @@ void gd_gl_area_draw(VirtualConsole *vc)
         surface_gl_setup_viewport(vc->gfx.gls, vc->gfx.ds, ww, wh);
         surface_gl_render_texture(vc->gfx.gls, vc->gfx.ds);
     }
+
+    glFlush();
+    graphic_hw_gl_flushed(vc->gfx.dcl.con);
 }
 
 void gd_gl_area_update(DisplayChangeListener *dcl,
diff --git a/ui/sdl2-gl.c b/ui/sdl2-gl.c
index 82139ba49e..fd594d7461 100644
--- a/ui/sdl2-gl.c
+++ b/ui/sdl2-gl.c
@@ -58,6 +58,7 @@ static void sdl2_gl_render_surface(struct sdl2_console *scon)
 
     surface_gl_render_texture(scon->gls, scon->surface);
     SDL_GL_SwapWindow(scon->real_window);
+    graphic_hw_gl_flushed(scon->dcl.con);
 }
 
 void sdl2_gl_update(DisplayChangeListener *dcl,
@@ -240,4 +241,5 @@ void sdl2_gl_scanout_flush(DisplayChangeListener *dcl,
     egl_fb_blit(&scon->win_fb, &scon->guest_fb, !scon->y0_top);
 
     SDL_GL_SwapWindow(scon->real_window);
+    graphic_hw_gl_flushed(dcl->con);
 }
diff --git a/ui/spice-display.c b/ui/spice-display.c
index 6a5e189a67..7247a93924 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -826,6 +826,7 @@ static void qemu_spice_gl_unblock_bh(void *opaque)
     SimpleSpiceDisplay *ssd = opaque;
 
     qemu_spice_gl_block(ssd, false);
+    graphic_hw_gl_flushed(ssd->dcl.con);
 }
 
 static void qemu_spice_gl_block_timer(void *opaque)
-- 
2.29.0


