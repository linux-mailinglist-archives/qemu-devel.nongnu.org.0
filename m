Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFBA3BE025
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 02:17:42 +0200 (CEST)
Received: from localhost ([::1]:43164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0vG1-0002YR-9N
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 20:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1m0utp-0004St-U7
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:54:45 -0400
Received: from mga03.intel.com ([134.134.136.65]:40659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1m0utn-0006wB-C3
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:54:45 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="209256417"
X-IronPort-AV: E=Sophos;i="5.83,330,1616482800"; d="scan'208";a="209256417"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2021 16:54:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,330,1616482800"; d="scan'208";a="627838211"
Received: from dw-tiger-lake-client-platform.fm.intel.com ([10.105.205.215])
 by orsmga005.jf.intel.com with ESMTP; 06 Jul 2021 16:54:34 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] virtio-gpu: splitting one extended mode guest fb into
 n-scanouts
Date: Tue,  6 Jul 2021 16:52:54 -0700
Message-Id: <20210706235255.7575-1-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=134.134.136.65;
 envelope-from=dongwon.kim@intel.com; helo=mga03.intel.com
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
Cc: Dongwon Kim <dongwon.kim@intel.com>
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

Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 hw/display/virtio-gpu-udmabuf.c | 19 +++++++++++--------
 hw/display/virtio-gpu.c         |  5 +++--
 include/hw/virtio/virtio-gpu.h  |  5 +++--
 include/ui/console.h            |  4 ++++
 stubs/virtio-gpu-udmabuf.c      |  3 ++-
 5 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/hw/display/virtio-gpu-udmabuf.c b/hw/display/virtio-gpu-udmabuf.c
index 3c01a415e7..a64194c6de 100644
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
+    dmabuf->buf.scanout_width;
+    dmabuf->buf.scanout_height;
     dmabuf->buf.fourcc = qemu_pixman_to_drm_format(fb->format);
     dmabuf->buf.fd = res->dmabuf_fd;
 
@@ -195,24 +200,22 @@ static VGPUDMABuf
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
 
     if (g->dmabuf.primary) {
-        old_primary = g->dmabuf.primary;
+        old_primary = g->dmabuf.primary[scanout_id];
     }
 
-    g->dmabuf.primary = new_primary;
-    qemu_console_resize(scanout->con,
-                        new_primary->buf.width,
-                        new_primary->buf.height);
+    g->dmabuf.primary[scanout_id] = new_primary;
     dpy_gl_scanout_dmabuf(scanout->con, &new_primary->buf);
 
     if (old_primary) {
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index e183f4ecda..11a87dad79 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -523,9 +523,9 @@ static void virtio_gpu_resource_flush(VirtIOGPU *g,
                 console_has_gl(scanout->con)) {
                 dpy_gl_update(scanout->con, 0, 0, scanout->width,
                               scanout->height);
-                return;
             }
         }
+        return;
     }
 
     if (!res->blob &&
@@ -598,6 +598,7 @@ static void virtio_gpu_update_scanout(VirtIOGPU *g,
     scanout->y = r->y;
     scanout->width = r->width;
     scanout->height = r->height;
+    qemu_console_resize(scanout->con, scanout->width, scanout->height);
 }
 
 static void virtio_gpu_do_set_scanout(VirtIOGPU *g,
@@ -633,7 +634,7 @@ static void virtio_gpu_do_set_scanout(VirtIOGPU *g,
 
     if (res->blob) {
         if (console_has_gl(scanout->con)) {
-            if (!virtio_gpu_update_dmabuf(g, scanout_id, res, fb)) {
+            if (!virtio_gpu_update_dmabuf(g, scanout_id, res, fb, r)) {
                 virtio_gpu_update_scanout(g, scanout_id, res, r);
                 return;
             }
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index bcf54d970f..6372f4bbb5 100644
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
index b30b63976a..87316aef83 100644
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
 } QemuDmaBuf;
 
diff --git a/stubs/virtio-gpu-udmabuf.c b/stubs/virtio-gpu-udmabuf.c
index 81f661441a..f692e13510 100644
--- a/stubs/virtio-gpu-udmabuf.c
+++ b/stubs/virtio-gpu-udmabuf.c
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
-- 
2.17.1


