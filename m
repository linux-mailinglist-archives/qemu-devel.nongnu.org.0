Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5770534F77C
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 05:29:22 +0200 (CEST)
Received: from localhost ([::1]:59872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRRXl-0003eA-FC
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 23:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lRRQh-0002pA-KG
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 23:22:03 -0400
Received: from mga18.intel.com ([134.134.136.126]:53068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lRRQf-000572-8n
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 23:22:03 -0400
IronPort-SDR: lXEndyIJ4uYEZocrSw4RMTHOzeMqvxjZOcXbMcya6GK/GXK3VwyTGejely+Pcgp9Zjgu5uS/1e
 kR3w22sTk8Lg==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="179449780"
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; d="scan'208";a="179449780"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 20:21:35 -0700
IronPort-SDR: lPI01Z4xj3Ugpl10TGuuFE6hBBNuxHIYIKTfMHKrEo9A19A2kn+EX90p7L9ubQYRuaygrbUsBY
 zc0ZQxfTX6vQ==
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; d="scan'208";a="418454145"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 20:21:35 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/11] virtio-gpu: Add virtio_gpu_set_scanout_blob
Date: Tue, 30 Mar 2021 20:10:00 -0700
Message-Id: <20210331031001.1564125-11-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210331031001.1564125-1-vivek.kasireddy@intel.com>
References: <20210331031001.1564125-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=vivek.kasireddy@intel.com; helo=mga18.intel.com
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

This API allows Qemu to set the blob allocated by the Guest as
the scanout buffer. If Opengl support is available, then the
scanout buffer would be submitted as a dmabuf to the UI; if not,
a pixman image is created from the scanout buffer and is
submitted to the UI via the display surface.

Based-on-patch-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 hw/display/trace-events                     |  1 +
 hw/display/virtio-gpu-udmabuf.c             |  1 +
 hw/display/virtio-gpu.c                     | 84 ++++++++++++++++++++-
 include/hw/virtio/virtio-gpu-bswap.h        |  7 ++
 include/hw/virtio/virtio-gpu.h              |  1 +
 include/standard-headers/linux/virtio_gpu.h |  1 +
 6 files changed, 91 insertions(+), 4 deletions(-)

diff --git a/hw/display/trace-events b/hw/display/trace-events
index 99e5256aac..96fe1ea3de 100644
--- a/hw/display/trace-events
+++ b/hw/display/trace-events
@@ -40,6 +40,7 @@ virtio_gpu_features(bool virgl) "virgl %d"
 virtio_gpu_cmd_get_display_info(void) ""
 virtio_gpu_cmd_get_edid(uint32_t scanout) "scanout %d"
 virtio_gpu_cmd_set_scanout(uint32_t id, uint32_t res, uint32_t w, uint32_t h, uint32_t x, uint32_t y) "id %d, res 0x%x, w %d, h %d, x %d, y %d"
+virtio_gpu_cmd_set_scanout_blob(uint32_t id, uint32_t res, uint32_t w, uint32_t h, uint32_t x, uint32_t y) "id %d, res 0x%x, w %d, h %d, x %d, y %d"
 virtio_gpu_cmd_res_create_2d(uint32_t res, uint32_t fmt, uint32_t w, uint32_t h) "res 0x%x, fmt 0x%x, w %d, h %d"
 virtio_gpu_cmd_res_create_3d(uint32_t res, uint32_t fmt, uint32_t w, uint32_t h, uint32_t d) "res 0x%x, fmt 0x%x, w %d, h %d, d %d"
 virtio_gpu_cmd_res_create_blob(uint32_t res, uint64_t size) "res 0x%x, size %" PRId64
diff --git a/hw/display/virtio-gpu-udmabuf.c b/hw/display/virtio-gpu-udmabuf.c
index bda8af5458..6fbe709811 100644
--- a/hw/display/virtio-gpu-udmabuf.c
+++ b/hw/display/virtio-gpu-udmabuf.c
@@ -206,6 +206,7 @@ static VGPUDMABuf *virtio_gpu_create_dmabuf(VirtIOGPU *g,
     dmabuf->buf.height = fb->height;
     dmabuf->buf.stride = fb->stride;
     dmabuf->buf.fourcc = qemu_pixman_to_drm_format(fb->format);
+    dmabuf->buf.modifier = fb->modifier;
     dmabuf->buf.fd = res->dmabuf_fd;
 
     dmabuf->scanout_id = scanout_id;
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 8a8cc7f181..642f95a269 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -449,7 +449,9 @@ static void virtio_gpu_resource_destroy(VirtIOGPU *g,
         }
     }
 
-    pixman_image_unref(res->image);
+    if (res->image) {
+        pixman_image_unref(res->image);
+    }
     virtio_gpu_cleanup_mapping(g, res);
     QTAILQ_REMOVE(&g->reslist, res, next);
     g->hostmem -= res->hostmem;
@@ -639,10 +641,22 @@ static void virtio_gpu_do_set_scanout(VirtIOGPU *g,
     }
 
     g->parent_obj.enable = 1;
-    data = (uint8_t *)pixman_image_get_data(res->image);
+
+    if (res->blob) {
+        if (display_opengl) {
+            if (!virtio_gpu_dmabuf_update(g, scanout_id, res, fb)) {
+                return;
+            }
+        }
+
+        data = res->blob;
+    } else {
+        data = (uint8_t *)pixman_image_get_data(res->image);
+    }
 
     /* create a surface for this scanout */
-    if (!scanout->ds ||
+    if ((res->blob && !display_opengl) ||
+        !scanout->ds ||
         surface_data(scanout->ds) != data + fb->offset ||
         scanout->width != r->width ||
         scanout->height != r->height) {
@@ -716,6 +730,61 @@ static void virtio_gpu_set_scanout(VirtIOGPU *g,
                               &fb, res, &ss.r, &cmd->error);
 }
 
+static void virtio_gpu_set_scanout_blob(VirtIOGPU *g,
+                                        struct virtio_gpu_ctrl_command *cmd)
+{
+    struct virtio_gpu_simple_resource *res;
+    struct virtio_gpu_framebuffer fb = { 0 };
+    struct virtio_gpu_set_scanout_blob ss;
+    uint64_t fbend;
+
+    VIRTIO_GPU_FILL_CMD(ss);
+    virtio_gpu_scanout_blob_bswap(&ss);
+    trace_virtio_gpu_cmd_set_scanout_blob(ss.scanout_id, ss.resource_id,
+                                          ss.r.width, ss.r.height, ss.r.x, ss.r.y);
+
+    if (ss.resource_id == 0) {
+        virtio_gpu_disable_scanout(g, ss.scanout_id);
+        return;
+    }
+
+    res = virtio_gpu_find_check_resource(g, ss.resource_id, true,
+                                         __func__, &cmd->error);
+    if (!res) {
+        return;
+    }
+
+    fb.format = virtio_gpu_get_pixman_format(ss.format);
+    if (!fb.format) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: host couldn't handle guest format %d\n",
+                      __func__, ss.format);
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
+        return;
+    }
+
+    fb.bytes_pp = DIV_ROUND_UP(PIXMAN_FORMAT_BPP(fb.format), 8);
+    fb.width = ss.width;
+    fb.height = ss.height;
+    fb.stride = ss.strides[0];
+    fb.offset = ss.offsets[0] + ss.r.x * fb.bytes_pp + ss.r.y * fb.stride;
+    fb.modifier = ss.modifier;
+
+    fbend = fb.offset;
+    fbend += fb.stride * (ss.r.height - 1);
+    fbend += fb.bytes_pp * ss.r.width;
+    if (fbend > res->blob_size) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: fb end out of range\n",
+                      __func__);
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
+        return;
+    }
+
+    virtio_gpu_do_set_scanout(g, ss.scanout_id,
+                              &fb, res, &ss.r, &cmd->error);
+}
+
 int virtio_gpu_create_mapping_iov(VirtIOGPU *g,
                                   uint32_t nr_entries, uint32_t offset,
                                   struct virtio_gpu_ctrl_command *cmd,
@@ -876,7 +945,7 @@ static void virtio_gpu_simple_process_cmd(VirtIOGPU *g,
     case VIRTIO_GPU_CMD_RESOURCE_CREATE_2D:
         virtio_gpu_resource_create_2d(g, cmd);
         break;
-  case VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB:
+    case VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB:
         if (!virtio_gpu_blob_enabled(g->parent_obj.conf)) {
             cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
             break;
@@ -895,6 +964,13 @@ static void virtio_gpu_simple_process_cmd(VirtIOGPU *g,
     case VIRTIO_GPU_CMD_SET_SCANOUT:
         virtio_gpu_set_scanout(g, cmd);
         break;
+    case VIRTIO_GPU_CMD_SET_SCANOUT_BLOB:
+        if (!virtio_gpu_blob_enabled(g->parent_obj.conf)) {
+            cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
+            break;
+        }
+        virtio_gpu_set_scanout_blob(g, cmd);
+        break;
     case VIRTIO_GPU_CMD_RESOURCE_ATTACH_BACKING:
         virtio_gpu_resource_attach_backing(g, cmd);
         break;
diff --git a/include/hw/virtio/virtio-gpu-bswap.h b/include/hw/virtio/virtio-gpu-bswap.h
index d23ac5cc4a..e2bee8f595 100644
--- a/include/hw/virtio/virtio-gpu-bswap.h
+++ b/include/hw/virtio/virtio-gpu-bswap.h
@@ -68,4 +68,11 @@ virtio_gpu_create_blob_bswap(struct virtio_gpu_resource_create_blob *cblob)
     le64_to_cpus(&cblob->size);
 }
 
+static inline void
+virtio_gpu_scanout_blob_bswap(struct virtio_gpu_set_scanout_blob *ssb)
+{
+    virtio_gpu_bswap_32(ssb, sizeof(*ssb) - sizeof(ssb->offsets[3]));
+    le32_to_cpus(&ssb->offsets[3]);
+}
+
 #endif
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 8b6bf851da..2ad90ae632 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -63,6 +63,7 @@ struct virtio_gpu_framebuffer {
     uint32_t width, height;
     uint32_t stride;
     uint32_t offset;
+    uint64_t modifier;
 };
 
 struct virtio_gpu_scanout {
diff --git a/include/standard-headers/linux/virtio_gpu.h b/include/standard-headers/linux/virtio_gpu.h
index 1357e4774e..87992ca7ee 100644
--- a/include/standard-headers/linux/virtio_gpu.h
+++ b/include/standard-headers/linux/virtio_gpu.h
@@ -409,6 +409,7 @@ struct virtio_gpu_set_scanout_blob {
 	uint32_t width;
 	uint32_t height;
 	uint32_t format;
+	uint64_t modifier;
 	uint32_t padding;
 	uint32_t strides[4];
 	uint32_t offsets[4];
-- 
2.26.2


