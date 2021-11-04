Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD61444FA8
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 08:24:57 +0100 (CET)
Received: from localhost ([::1]:33074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miX7I-0001or-LC
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 03:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1miWyj-0004mT-S7
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 03:16:05 -0400
Received: from mga17.intel.com ([192.55.52.151]:65418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1miWyh-0000hX-BA
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 03:16:05 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="212405223"
X-IronPort-AV: E=Sophos;i="5.87,208,1631602800"; d="scan'208";a="212405223"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 00:15:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,208,1631602800"; d="scan'208";a="639171369"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by fmsmga001.fm.intel.com with ESMTP; 04 Nov 2021 00:15:51 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/6] virtio-gpu: splitting one extended mode guest fb into
 n-scanouts
Date: Wed,  3 Nov 2021 23:51:52 -0700
Message-Id: <20211104065153.28897-5-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211104065153.28897-1-dongwon.kim@intel.com>
References: <20211103053937.on4dg37wmkx2f2t5@sirius.home.kraxel.org>
 <20211104065153.28897-1-dongwon.kim@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=dongwon.kim@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

When guest is running Linux/X11 with extended multiple displays mode enabled,
the guest shares one scanout resource each time containing whole surface
rather than sharing individual display output separately. This extended frame
is properly splited and rendered on the corresponding scanout surfaces but
not in case of blob-resource (zero copy).

This code change lets the qemu split this one large surface data into multiple
in case of blob-resource as well so that each sub frame then can be blitted
properly to each scanout.

v2: resizing qemu console in virtio_gpu_update_dmabuf to scanout's width and
    height

v3: updating stub function of virtio_gpu_update_dmabuf to match the type

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 hw/display/virtio-gpu-udmabuf-stubs.c |  3 ++-
 hw/display/virtio-gpu-udmabuf.c       | 22 ++++++++++++++--------
 hw/display/virtio-gpu.c               |  4 ++--
 include/hw/virtio/virtio-gpu.h        |  5 +++--
 include/ui/console.h                  |  4 ++++
 5 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/hw/display/virtio-gpu-udmabuf-stubs.c b/hw/display/virtio-gpu-udmabuf-stubs.c
index 81f661441a..f692e13510 100644
--- a/hw/display/virtio-gpu-udmabuf-stubs.c
+++ b/hw/display/virtio-gpu-udmabuf-stubs.c
@@ -20,7 +20,8 @@ void virtio_gpu_fini_udmabuf(struct virtio_gpu_simple_resource *res)
 int virtio_gpu_update_dmabuf(VirtIOGPU *g,
                              uint32_t scanout_id,
                              struct virtio_gpu_simple_resource *res,
-                             struct virtio_gpu_framebuffer *fb)
+                             struct virtio_gpu_framebuffer *fb,
+                             struct virtio_gpu_rect *r)
 {
     /* nothing (stub) */
     return 0;
diff --git a/hw/display/virtio-gpu-udmabuf.c b/hw/display/virtio-gpu-udmabuf.c
index 60ea7f8f49..1597921c51 100644
--- a/hw/display/virtio-gpu-udmabuf.c
+++ b/hw/display/virtio-gpu-udmabuf.c
@@ -171,7 +171,8 @@ static VGPUDMABuf
 *virtio_gpu_create_dmabuf(VirtIOGPU *g,
                           uint32_t scanout_id,
                           struct virtio_gpu_simple_resource *res,
-                          struct virtio_gpu_framebuffer *fb)
+                          struct virtio_gpu_framebuffer *fb,
+                          struct virtio_gpu_rect *r)
 {
     VGPUDMABuf *dmabuf;
 
@@ -183,6 +184,10 @@ static VGPUDMABuf
     dmabuf->buf.width = fb->width;
     dmabuf->buf.height = fb->height;
     dmabuf->buf.stride = fb->stride;
+    dmabuf->buf.x = r->x;
+    dmabuf->buf.y = r->y;
+    dmabuf->buf.scanout_width = r->width;
+    dmabuf->buf.scanout_height = r->height;
     dmabuf->buf.fourcc = qemu_pixman_to_drm_format(fb->format);
     dmabuf->buf.fd = res->dmabuf_fd;
     dmabuf->buf.allow_fences = true;
@@ -196,24 +201,25 @@ static VGPUDMABuf
 int virtio_gpu_update_dmabuf(VirtIOGPU *g,
                              uint32_t scanout_id,
                              struct virtio_gpu_simple_resource *res,
-                             struct virtio_gpu_framebuffer *fb)
+                             struct virtio_gpu_framebuffer *fb,
+                             struct virtio_gpu_rect *r)
 {
     struct virtio_gpu_scanout *scanout = &g->parent_obj.scanout[scanout_id];
     VGPUDMABuf *new_primary, *old_primary = NULL;
 
-    new_primary = virtio_gpu_create_dmabuf(g, scanout_id, res, fb);
+    new_primary = virtio_gpu_create_dmabuf(g, scanout_id, res, fb, r);
     if (!new_primary) {
         return -EINVAL;
     }
 
-    if (g->dmabuf.primary) {
-        old_primary = g->dmabuf.primary;
+    if (g->dmabuf.primary[scanout_id]) {
+        old_primary = g->dmabuf.primary[scanout_id];
     }
 
-    g->dmabuf.primary = new_primary;
+    g->dmabuf.primary[scanout_id] = new_primary;
     qemu_console_resize(scanout->con,
-                        new_primary->buf.width,
-                        new_primary->buf.height);
+                        new_primary->buf.scanout_width,
+                        new_primary->buf.scanout_height);
     dpy_gl_scanout_dmabuf(scanout->con, &new_primary->buf);
 
     if (old_primary) {
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 182e0868b0..d78b9700c7 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -517,9 +517,9 @@ static void virtio_gpu_resource_flush(VirtIOGPU *g,
                 console_has_gl(scanout->con)) {
                 dpy_gl_update(scanout->con, 0, 0, scanout->width,
                               scanout->height);
-                return;
             }
         }
+        return;
     }
 
     if (!res->blob &&
@@ -627,7 +627,7 @@ static void virtio_gpu_do_set_scanout(VirtIOGPU *g,
 
     if (res->blob) {
         if (console_has_gl(scanout->con)) {
-            if (!virtio_gpu_update_dmabuf(g, scanout_id, res, fb)) {
+            if (!virtio_gpu_update_dmabuf(g, scanout_id, res, fb, r)) {
                 virtio_gpu_update_scanout(g, scanout_id, res, r);
                 return;
             }
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 24c6628944..acfba7c76c 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -187,7 +187,7 @@ struct VirtIOGPU {
 
     struct {
         QTAILQ_HEAD(, VGPUDMABuf) bufs;
-        VGPUDMABuf *primary;
+        VGPUDMABuf *primary[VIRTIO_GPU_MAX_SCANOUTS];
     } dmabuf;
 };
 
@@ -273,7 +273,8 @@ void virtio_gpu_fini_udmabuf(struct virtio_gpu_simple_resource *res);
 int virtio_gpu_update_dmabuf(VirtIOGPU *g,
                              uint32_t scanout_id,
                              struct virtio_gpu_simple_resource *res,
-                             struct virtio_gpu_framebuffer *fb);
+                             struct virtio_gpu_framebuffer *fb,
+                             struct virtio_gpu_rect *r);
 
 /* virtio-gpu-3d.c */
 void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
diff --git a/include/ui/console.h b/include/ui/console.h
index b6bedc5f41..6d678924f6 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -167,6 +167,10 @@ typedef struct QemuDmaBuf {
     uint32_t  fourcc;
     uint64_t  modifier;
     uint32_t  texture;
+    uint32_t  x;
+    uint32_t  y;
+    uint32_t  scanout_width;
+    uint32_t  scanout_height;
     bool      y0_top;
     void      *sync;
     int       fence_fd;
-- 
2.30.2


