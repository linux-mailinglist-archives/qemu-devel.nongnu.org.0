Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A11B3A37A4
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 01:06:21 +0200 (CEST)
Received: from localhost ([::1]:36732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrTki-0001hI-GQ
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 19:06:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lrTg8-0007hD-67
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 19:01:36 -0400
Received: from mga17.intel.com ([192.55.52.151]:52951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lrTg4-0006zL-Rl
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 19:01:35 -0400
IronPort-SDR: PUa9xPidmsk468mSKC5O+5FTzp2t1cFrgUM/eEOdlIt3U0VA0EDOjWLk/jAEHYNYZoMJgXfJn8
 hTzLdTK8EPGA==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="185796184"
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; d="scan'208";a="185796184"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 16:01:08 -0700
IronPort-SDR: g/KtDbhqiSzowI6khzEHpdwPdKj8M10aHPYgGNIENjp4WGDKc8nCKbkR21WNiupyEC+JlZBz7q
 2GsM/0Ccvp0g==
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; d="scan'208";a="419888363"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 16:01:08 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/8] ui: Create sync objects only for blobs
Date: Thu, 10 Jun 2021 15:48:34 -0700
Message-Id: <20210610224837.670192-6-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210610224837.670192-1-vivek.kasireddy@intel.com>
References: <20210610224837.670192-1-vivek.kasireddy@intel.com>
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

For now, create sync objects only for dmabufs that are blobs.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 hw/display/virtio-gpu-udmabuf.c |  2 ++
 include/ui/console.h            |  1 +
 include/ui/egl-helpers.h        |  1 +
 ui/gtk-egl.c                    | 10 ++++++++++
 ui/gtk-gl-area.c                |  8 ++++++++
 5 files changed, 22 insertions(+)

diff --git a/hw/display/virtio-gpu-udmabuf.c b/hw/display/virtio-gpu-udmabuf.c
index 3c01a415e7..33e329e8aa 100644
--- a/hw/display/virtio-gpu-udmabuf.c
+++ b/hw/display/virtio-gpu-udmabuf.c
@@ -185,6 +185,8 @@ static VGPUDMABuf
     dmabuf->buf.stride = fb->stride;
     dmabuf->buf.fourcc = qemu_pixman_to_drm_format(fb->format);
     dmabuf->buf.fd = res->dmabuf_fd;
+    dmabuf->buf.blob = true;
+    dmabuf->buf.sync = NULL;
 
     dmabuf->scanout_id = scanout_id;
     QTAILQ_INSERT_HEAD(&g->dmabuf.bufs, dmabuf, next);
diff --git a/include/ui/console.h b/include/ui/console.h
index a89f739f10..310d34c67a 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -170,6 +170,7 @@ typedef struct QemuDmaBuf {
     bool      y0_top;
     void      *sync;
     int       fence_fd;
+    bool      blob;
 } QemuDmaBuf;
 
 typedef struct DisplayState DisplayState;
diff --git a/include/ui/egl-helpers.h b/include/ui/egl-helpers.h
index 5a7575dc13..1bc0e31b03 100644
--- a/include/ui/egl-helpers.h
+++ b/include/ui/egl-helpers.h
@@ -19,6 +19,7 @@ typedef struct egl_fb {
     GLuint texture;
     GLuint framebuffer;
     bool delete_texture;
+    QemuDmaBuf *dmabuf;
 } egl_fb;
 
 void egl_fb_destroy(egl_fb *fb);
diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index b671181272..b748f51b0b 100644
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
 
@@ -281,6 +287,10 @@ void gd_egl_scanout_flush(DisplayChangeListener *dcl,
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
 
-- 
2.30.2


