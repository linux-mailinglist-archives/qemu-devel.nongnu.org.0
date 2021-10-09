Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE692427D9B
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 23:21:24 +0200 (CEST)
Received: from localhost ([::1]:37504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZJmV-0007m5-QY
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 17:21:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJdv-0002x5-2r
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:12:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJds-0000Ge-Hf
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:12:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633813948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NrZIqxWKSm+hxMI4Mo5BWcaqQx/ewz20BFFbLNHm73w=;
 b=SwDAXUvAQ4CwHN3ks9MesNIaFOHb4LbvNMya0mOpVSbr8YOeYqObn5FVXnOfP0mjm/kjh/
 h+ElH7O5hxcyQ3GsHc6sIZdzFbcHYyLQCiMvvld8m1xsseGuOlvhiMDr7zyoI6JvAkRNHA
 fPEhRrFuGZ0X/J4yZJgiTN3p/KkSmkg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-FZ8Zj6h9PNaShzQYeDVfiw-1; Sat, 09 Oct 2021 17:12:26 -0400
X-MC-Unique: FZ8Zj6h9PNaShzQYeDVfiw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A40D610A8E00
 for <qemu-devel@nongnu.org>; Sat,  9 Oct 2021 21:12:25 +0000 (UTC)
Received: from localhost (unknown [10.39.208.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 81ECA5D9D3;
 Sat,  9 Oct 2021 21:12:19 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/37] ui: simplify gl unblock & flush
Date: Sun, 10 Oct 2021 01:08:16 +0400
Message-Id: <20211009210838.2219430-16-marcandre.lureau@redhat.com>
In-Reply-To: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
References: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

GraphicHw.gl_flushed was introduced to notify the
device (vhost-user-gpu) that the GL resources (the display scanout) are
no longer needed.

It was decoupled from QEMU own gl-blocking mechanism, but that
difference isn't helping. Instead, we can reuse QEMU gl-blocking and
notify virtio_gpu_gl_flushed() when unblocking (to unlock
vhost-user-gpu).

An extra block/unblock is added arount dpy_gl_update() so existing
backends that don't block will have the flush event handled. It will
also help when there are no backends associated.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/ui/console.h         |  2 --
 hw/display/vhost-user-gpu.c  |  2 +-
 hw/display/virtio-gpu-base.c |  5 ++++-
 hw/display/virtio-vga.c      | 11 -----------
 ui/console.c                 | 12 +++---------
 ui/gtk-egl.c                 |  1 -
 ui/gtk-gl-area.c             |  1 -
 ui/gtk.c                     |  1 -
 ui/sdl2-gl.c                 |  2 --
 ui/spice-display.c           |  1 -
 10 files changed, 8 insertions(+), 30 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index 1617b4c59a..cd6f103bd9 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -386,7 +386,6 @@ typedef struct GraphicHwOps {
     void (*update_interval)(void *opaque, uint64_t interval);
     int (*ui_info)(void *opaque, uint32_t head, QemuUIInfo *info);
     void (*gl_block)(void *opaque, bool block);
-    void (*gl_flushed)(void *opaque);
 } GraphicHwOps;
 
 QemuConsole *graphic_console_init(DeviceState *dev, uint32_t head,
@@ -402,7 +401,6 @@ void graphic_hw_update_done(QemuConsole *con);
 void graphic_hw_invalidate(QemuConsole *con);
 void graphic_hw_text_update(QemuConsole *con, console_ch_t *chardata);
 void graphic_hw_gl_block(QemuConsole *con, bool block);
-void graphic_hw_gl_flushed(QemuConsole *con);
 
 void qemu_console_early_init(void);
 
diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
index 49df56cd14..09818231bd 100644
--- a/hw/display/vhost-user-gpu.c
+++ b/hw/display/vhost-user-gpu.c
@@ -254,8 +254,8 @@ vhost_user_gpu_handle_display(VhostUserGPU *g, VhostUserGpuMsg *msg)
             vhost_user_gpu_unblock(g);
             break;
         }
-        dpy_gl_update(con, m->x, m->y, m->width, m->height);
         g->backend_blocked = true;
+        dpy_gl_update(con, m->x, m->y, m->width, m->height);
         break;
     }
     case VHOST_USER_GPU_UPDATE: {
diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index c8da4806e0..fff0fb4a82 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -117,6 +117,10 @@ virtio_gpu_gl_block(void *opaque, bool block)
         g->renderer_blocked--;
     }
     assert(g->renderer_blocked >= 0);
+
+    if (!block && g->renderer_blocked == 0) {
+        virtio_gpu_gl_flushed(g);
+    }
 }
 
 static int
@@ -143,7 +147,6 @@ static const GraphicHwOps virtio_gpu_ops = {
     .text_update = virtio_gpu_text_update,
     .ui_info = virtio_gpu_ui_info,
     .gl_block = virtio_gpu_gl_block,
-    .gl_flushed = virtio_gpu_gl_flushed,
 };
 
 bool
diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
index 9e57f61e9e..b23a75a04b 100644
--- a/hw/display/virtio-vga.c
+++ b/hw/display/virtio-vga.c
@@ -68,16 +68,6 @@ static void virtio_vga_base_gl_block(void *opaque, bool block)
     }
 }
 
-static void virtio_vga_base_gl_flushed(void *opaque)
-{
-    VirtIOVGABase *vvga = opaque;
-    VirtIOGPUBase *g = vvga->vgpu;
-
-    if (g->hw_ops->gl_flushed) {
-        g->hw_ops->gl_flushed(g);
-    }
-}
-
 static int virtio_vga_base_get_flags(void *opaque)
 {
     VirtIOVGABase *vvga = opaque;
@@ -93,7 +83,6 @@ static const GraphicHwOps virtio_vga_base_ops = {
     .text_update = virtio_vga_base_text_update,
     .ui_info = virtio_vga_base_ui_info,
     .gl_block = virtio_vga_base_gl_block,
-    .gl_flushed = virtio_vga_base_gl_flushed,
 };
 
 static const VMStateDescription vmstate_virtio_vga_base = {
diff --git a/ui/console.c b/ui/console.c
index c62a33b1ec..016ace5029 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -318,15 +318,6 @@ void graphic_hw_gl_block(QemuConsole *con, bool block)
     }
 }
 
-void graphic_hw_gl_flushed(QemuConsole *con)
-{
-    assert(con != NULL);
-
-    if (con->hw_ops->gl_flushed) {
-        con->hw_ops->gl_flushed(con->hw);
-    }
-}
-
 int qemu_console_get_window_id(QemuConsole *con)
 {
     return con->window_id;
@@ -1952,7 +1943,10 @@ void dpy_gl_update(QemuConsole *con,
                    uint32_t x, uint32_t y, uint32_t w, uint32_t h)
 {
     assert(con->gl);
+
+    graphic_hw_gl_block(con, true);
     con->gl->ops->dpy_gl_update(con->gl, x, y, w, h);
+    graphic_hw_gl_block(con, false);
 }
 
 /***********************************************************/
diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index 72ce5e1f8f..0f64baee63 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -107,7 +107,6 @@ void gd_egl_draw(VirtualConsole *vc)
         graphic_hw_gl_block(vc->gfx.dcl.con, false);
     }
 #endif
-    graphic_hw_gl_flushed(vc->gfx.dcl.con);
 }
 
 void gd_egl_update(DisplayChangeListener *dcl,
diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c
index b23523748e..5e79505291 100644
--- a/ui/gtk-gl-area.c
+++ b/ui/gtk-gl-area.c
@@ -91,7 +91,6 @@ void gd_gl_area_draw(VirtualConsole *vc)
         graphic_hw_gl_block(vc->gfx.dcl.con, false);
     }
 #endif
-    graphic_hw_gl_flushed(vc->gfx.dcl.con);
 }
 
 void gd_gl_area_update(DisplayChangeListener *dcl,
diff --git a/ui/gtk.c b/ui/gtk.c
index f8beddbb91..71bfe29793 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -590,7 +590,6 @@ void gd_hw_gl_flushed(void *vcon)
     QemuDmaBuf *dmabuf = vc->gfx.guest_fb.dmabuf;
 
     graphic_hw_gl_block(vc->gfx.dcl.con, false);
-    graphic_hw_gl_flushed(vc->gfx.dcl.con);
     qemu_set_fd_handler(dmabuf->fence_fd, NULL, NULL, NULL);
     close(dmabuf->fence_fd);
     dmabuf->fence_fd = -1;
diff --git a/ui/sdl2-gl.c b/ui/sdl2-gl.c
index a21d2deed9..5b950fbbea 100644
--- a/ui/sdl2-gl.c
+++ b/ui/sdl2-gl.c
@@ -58,7 +58,6 @@ static void sdl2_gl_render_surface(struct sdl2_console *scon)
 
     surface_gl_render_texture(scon->gls, scon->surface);
     SDL_GL_SwapWindow(scon->real_window);
-    graphic_hw_gl_flushed(scon->dcl.con);
 }
 
 void sdl2_gl_update(DisplayChangeListener *dcl,
@@ -241,5 +240,4 @@ void sdl2_gl_scanout_flush(DisplayChangeListener *dcl,
     egl_fb_blit(&scon->win_fb, &scon->guest_fb, !scon->y0_top);
 
     SDL_GL_SwapWindow(scon->real_window);
-    graphic_hw_gl_flushed(dcl->con);
 }
diff --git a/ui/spice-display.c b/ui/spice-display.c
index 2c204bceee..ec501f129f 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -830,7 +830,6 @@ static void qemu_spice_gl_unblock_bh(void *opaque)
     SimpleSpiceDisplay *ssd = opaque;
 
     qemu_spice_gl_block(ssd, false);
-    graphic_hw_gl_flushed(ssd->dcl.con);
 }
 
 static void qemu_spice_gl_block_timer(void *opaque)
-- 
2.33.0.721.g106298f7f9


