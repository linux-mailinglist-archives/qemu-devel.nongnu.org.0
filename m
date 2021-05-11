Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFADD37B214
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 01:03:37 +0200 (CEST)
Received: from localhost ([::1]:54744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgbPc-0006pr-Ug
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 19:03:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lgbM2-0007Pw-R2
 for qemu-devel@nongnu.org; Tue, 11 May 2021 18:59:54 -0400
Received: from mga06.intel.com ([134.134.136.31]:61286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lgbM0-00069W-OT
 for qemu-devel@nongnu.org; Tue, 11 May 2021 18:59:54 -0400
IronPort-SDR: V2iAxlPo8emvsbeSaVxHPo2AulSODW937yy6bmzSX7UN2DsXlc0Nga/Jx+vb4Y8VmsWizuGrkY
 8o2WNASgKIiA==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="260828910"
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="260828910"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 15:59:43 -0700
IronPort-SDR: W0lC6xSJki9Vwe0M7OkN5GtHiHzSKwDFhKiA6pkUnyLM5mCvasZecCu1ZGPaT/dTfNu95Z1hCB
 47867bBH2Oew==
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="436883330"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 15:59:42 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/13] virtio-gpu: Add virtio_gpu_set_scanout_blob
Date: Tue, 11 May 2021 15:47:18 -0700
Message-Id: <20210511224719.387443-13-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210511224719.387443-1-vivek.kasireddy@intel.com>
References: <20210511224719.387443-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31;
 envelope-from=vivek.kasireddy@intel.com; helo=mga06.intel.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 hw/display/trace-events              |   1 +
 hw/display/virtio-gpu.c              | 102 +++++++++++++++++++++++++--
 include/hw/virtio/virtio-gpu-bswap.h |   7 ++
 3 files changed, 103 insertions(+), 7 deletions(-)

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
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 9118924018..8366fa2245 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -405,7 +405,7 @@ static void virtio_gpu_resource_destroy(VirtIOGPU *g,
         }
     }
 
-    pixman_image_unref(res->image);
+    qemu_pixman_image_unref(res->image);
     virtio_gpu_cleanup_mapping(g, res);
     QTAILQ_REMOVE(&g->reslist, res, next);
     g->hostmem -= res->hostmem;
@@ -494,6 +494,7 @@ static void virtio_gpu_resource_flush(VirtIOGPU *g,
 {
     struct virtio_gpu_simple_resource *res;
     struct virtio_gpu_resource_flush rf;
+    struct virtio_gpu_scanout *scanout;
     pixman_region16_t flush_region;
     int i;
 
@@ -504,16 +505,29 @@ static void virtio_gpu_resource_flush(VirtIOGPU *g,
 
     res = virtio_gpu_find_check_resource(g, rf.resource_id, false,
                                          __func__, &cmd->error);
-    if (!res || res->blob) {
+    if (!res) {
         return;
     }
 
-    if (rf.r.x > res->width ||
+    if (res->blob) {
+        for (i = 0; i < g->parent_obj.conf.max_outputs; i++) {
+            scanout = &g->parent_obj.scanout[i];
+            if (scanout->resource_id == res->resource_id &&
+                console_has_gl(scanout->con)) {
+                dpy_gl_update(scanout->con, 0, 0, scanout->width,
+                              scanout->height);
+                return;
+            }
+        }
+    }
+
+    if (!res->blob &&
+        (rf.r.x > res->width ||
         rf.r.y > res->height ||
         rf.r.width > res->width ||
         rf.r.height > res->height ||
         rf.r.x + rf.r.width > res->width ||
-        rf.r.y + rf.r.height > res->height) {
+        rf.r.y + rf.r.height > res->height)) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: flush bounds outside resource"
                       " bounds for resource %d: %d %d %d %d vs %d %d\n",
                       __func__, rf.resource_id, rf.r.x, rf.r.y,
@@ -525,7 +539,6 @@ static void virtio_gpu_resource_flush(VirtIOGPU *g,
     pixman_region_init_rect(&flush_region,
                             rf.r.x, rf.r.y, rf.r.width, rf.r.height);
     for (i = 0; i < g->parent_obj.conf.max_outputs; i++) {
-        struct virtio_gpu_scanout *scanout;
         pixman_region16_t region, finalregion;
         pixman_box16_t *extents;
 
@@ -616,10 +629,23 @@ static void virtio_gpu_do_set_scanout(VirtIOGPU *g,
     }
 
     g->parent_obj.enable = 1;
-    data = (uint8_t *)pixman_image_get_data(res->image);
+
+    if (res->blob) {
+        if (console_has_gl(scanout->con)) {
+            if (!virtio_gpu_update_dmabuf(g, scanout_id, res, fb)) {
+                virtio_gpu_update_scanout(g, scanout_id, res, r);
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
+    if ((res->blob && !console_has_gl(scanout->con)) ||
+        !scanout->ds ||
         surface_data(scanout->ds) != data + fb->offset ||
         scanout->width != r->width ||
         scanout->height != r->height) {
@@ -683,6 +709,61 @@ static void virtio_gpu_set_scanout(VirtIOGPU *g,
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
+                                          ss.r.width, ss.r.height, ss.r.x,
+                                          ss.r.y);
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
@@ -877,6 +958,13 @@ void virtio_gpu_simple_process_cmd(VirtIOGPU *g,
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
-- 
2.30.2


