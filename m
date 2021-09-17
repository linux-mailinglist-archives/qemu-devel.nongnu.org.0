Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 607BC40FF2D
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 20:23:07 +0200 (CEST)
Received: from localhost ([::1]:42146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRIVu-0004z4-Fj
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 14:23:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1mRIS3-00034r-IX
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 14:19:11 -0400
Received: from mga01.intel.com ([192.55.52.88]:20485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1mRIS0-0005n3-HM
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 14:19:07 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10110"; a="245248093"
X-IronPort-AV: E=Sophos;i="5.85,302,1624345200"; d="scan'208";a="245248093"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2021 11:18:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,302,1624345200"; d="scan'208";a="699614335"
Received: from dw-tiger-lake-client-platform.fm.intel.com ([10.105.205.202])
 by fmsmga006.fm.intel.com with ESMTP; 17 Sep 2021 11:18:59 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] virtio-gpu: splitting one extended mode guest fb into
 n-scanouts
Date: Fri, 17 Sep 2021 11:16:52 -0700
Message-Id: <20210917181653.25487-1-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=192.55.52.88; envelope-from=dongwon.kim@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 hw/display/virtio-gpu-udmabuf.c | 22 ++++++++++++++--------
 hw/display/virtio-gpu.c         |  4 ++--
 include/hw/virtio/virtio-gpu.h  |  5 +++--
 include/ui/console.h            |  4 ++++
 4 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/hw/display/virtio-gpu-udmabuf.c b/hw/display/virtio-gpu-udmabuf.c
index c6f7f58784..e3a75971d5 100644
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
index 244664d727..01bc6cdc82 100644
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
2.17.1


