Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E67FF37B225
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 01:06:35 +0200 (CEST)
Received: from localhost ([::1]:32976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgbSV-0002mL-0a
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 19:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lgbM5-0007VI-0w
 for qemu-devel@nongnu.org; Tue, 11 May 2021 18:59:57 -0400
Received: from mga05.intel.com ([192.55.52.43]:2837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lgbM2-0006DO-Vn
 for qemu-devel@nongnu.org; Tue, 11 May 2021 18:59:56 -0400
IronPort-SDR: k1fg8oReY1eUCBODqnGspGcGVKA/Qk5QBhra3Q4fIL6d//J8mnNuEn5tFHMysqM1ynpUakM7ZF
 TYo2LO3wLXbA==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="285065719"
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="285065719"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 15:59:41 -0700
IronPort-SDR: dxsdmlWBDiZcVsTSjj15/n6jb3CU/Ey89hpgIuMwHHrNqHo91VpLvJ/dTDfIQUrEdZiZxMEKXv
 FoMHowPUNrMw==
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="436883294"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 15:59:41 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/13] virtio-gpu: Refactor virtio_gpu_set_scanout
Date: Tue, 11 May 2021 15:47:11 -0700
Message-Id: <20210511224719.387443-6-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210511224719.387443-1-vivek.kasireddy@intel.com>
References: <20210511224719.387443-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43;
 envelope-from=vivek.kasireddy@intel.com; helo=mga05.intel.com
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

Store the meta-data associated with a FB in a new object
(struct virtio_gpu_framebuffer) and pass the object to set_scanout.
Also move code in set_scanout into a do_set_scanout function.
This will be helpful when adding set_scanout_blob API.

Based-on-patch-by: Gerd Hoffmann <kraxel@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 hw/display/virtio-gpu.c        | 151 +++++++++++++++++++--------------
 include/hw/virtio/virtio-gpu.h |   8 ++
 2 files changed, 95 insertions(+), 64 deletions(-)

diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index fec0bcf5c5..6c27d8f42e 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -500,95 +500,118 @@ static void virtio_unref_resource(pixman_image_t *image, void *data)
     pixman_image_unref(data);
 }
 
-static void virtio_gpu_set_scanout(VirtIOGPU *g,
-                                   struct virtio_gpu_ctrl_command *cmd)
+static void virtio_gpu_do_set_scanout(VirtIOGPU *g,
+                                      uint32_t scanout_id,
+                                      struct virtio_gpu_framebuffer *fb,
+                                      struct virtio_gpu_simple_resource *res,
+                                      struct virtio_gpu_rect *r,
+                                      uint32_t *error)
 {
-    struct virtio_gpu_simple_resource *res, *ores;
+    struct virtio_gpu_simple_resource *ores;
     struct virtio_gpu_scanout *scanout;
-    pixman_format_code_t format;
-    uint32_t offset;
-    int bpp;
-    struct virtio_gpu_set_scanout ss;
+    uint8_t *data;
 
-    VIRTIO_GPU_FILL_CMD(ss);
-    virtio_gpu_bswap_32(&ss, sizeof(ss));
-    trace_virtio_gpu_cmd_set_scanout(ss.scanout_id, ss.resource_id,
-                                     ss.r.width, ss.r.height, ss.r.x, ss.r.y);
-
-    if (ss.scanout_id >= g->parent_obj.conf.max_outputs) {
+    if (scanout_id >= g->parent_obj.conf.max_outputs) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: illegal scanout id specified %d",
-                      __func__, ss.scanout_id);
-        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_SCANOUT_ID;
+                      __func__, scanout_id);
+        *error = VIRTIO_GPU_RESP_ERR_INVALID_SCANOUT_ID;
         return;
     }
-
-    g->parent_obj.enable = 1;
-    if (ss.resource_id == 0) {
-        virtio_gpu_disable_scanout(g, ss.scanout_id);
-        return;
-    }
-
-    /* create a surface for this scanout */
-    res = virtio_gpu_find_check_resource(g, ss.resource_id, true,
-                                         __func__, &cmd->error);
-    if (!res) {
-        return;
-    }
-
-    if (ss.r.x > res->width ||
-        ss.r.y > res->height ||
-        ss.r.width < 16 ||
-        ss.r.height < 16 ||
-        ss.r.width > res->width ||
-        ss.r.height > res->height ||
-        ss.r.x + ss.r.width > res->width ||
-        ss.r.y + ss.r.height > res->height) {
+    scanout = &g->parent_obj.scanout[scanout_id];
+
+    if (r->x > fb->width ||
+        r->y > fb->height ||
+        r->width < 16 ||
+        r->height < 16 ||
+        r->width > fb->width ||
+        r->height > fb->height ||
+        r->x + r->width > fb->width ||
+        r->y + r->height > fb->height) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: illegal scanout %d bounds for"
-                      " resource %d, (%d,%d)+%d,%d vs %d %d\n",
-                      __func__, ss.scanout_id, ss.resource_id, ss.r.x, ss.r.y,
-                      ss.r.width, ss.r.height, res->width, res->height);
-        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
+                      " resource %d, rect (%d,%d)+%d,%d, fb %d %d\n",
+                      __func__, scanout_id, res->resource_id,
+                      r->x, r->y, r->width, r->height,
+                      fb->width, fb->height);
+        *error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
         return;
     }
 
-    scanout = &g->parent_obj.scanout[ss.scanout_id];
+    g->parent_obj.enable = 1;
+    data = (uint8_t *)pixman_image_get_data(res->image);
 
-    format = pixman_image_get_format(res->image);
-    bpp = DIV_ROUND_UP(PIXMAN_FORMAT_BPP(format), 8);
-    offset = (ss.r.x * bpp) + ss.r.y * pixman_image_get_stride(res->image);
-    if (!scanout->ds || surface_data(scanout->ds)
-        != ((uint8_t *)pixman_image_get_data(res->image) + offset) ||
-        scanout->width != ss.r.width ||
-        scanout->height != ss.r.height) {
+    /* create a surface for this scanout */
+    if (!scanout->ds ||
+        surface_data(scanout->ds) != data + fb->offset ||
+        scanout->width != r->width ||
+        scanout->height != r->height) {
         pixman_image_t *rect;
-        void *ptr = (uint8_t *)pixman_image_get_data(res->image) + offset;
-        rect = pixman_image_create_bits(format, ss.r.width, ss.r.height, ptr,
-                                        pixman_image_get_stride(res->image));
-        pixman_image_ref(res->image);
-        pixman_image_set_destroy_function(rect, virtio_unref_resource,
-                                          res->image);
+        void *ptr = data + fb->offset;
+        rect = pixman_image_create_bits(fb->format, r->width, r->height,
+                                        ptr, fb->stride);
+
+        if (res->image) {
+            pixman_image_ref(res->image);
+            pixman_image_set_destroy_function(rect, virtio_unref_resource,
+                                              res->image);
+        }
+
         /* realloc the surface ptr */
         scanout->ds = qemu_create_displaysurface_pixman(rect);
         if (!scanout->ds) {
-            cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
+            *error = VIRTIO_GPU_RESP_ERR_UNSPEC;
             return;
         }
+
         pixman_image_unref(rect);
-        dpy_gfx_replace_surface(g->parent_obj.scanout[ss.scanout_id].con,
+        dpy_gfx_replace_surface(g->parent_obj.scanout[scanout_id].con,
                                 scanout->ds);
     }
 
     ores = virtio_gpu_find_resource(g, scanout->resource_id);
     if (ores) {
-        ores->scanout_bitmask &= ~(1 << ss.scanout_id);
+        ores->scanout_bitmask &= ~(1 << scanout_id);
+    }
+
+    res->scanout_bitmask |= (1 << scanout_id);
+    scanout->resource_id = res->resource_id;
+    scanout->x = r->x;
+    scanout->y = r->y;
+    scanout->width = r->width;
+    scanout->height = r->height;
+}
+
+static void virtio_gpu_set_scanout(VirtIOGPU *g,
+                                   struct virtio_gpu_ctrl_command *cmd)
+{
+    struct virtio_gpu_simple_resource *res;
+    struct virtio_gpu_framebuffer fb = { 0 };
+    struct virtio_gpu_set_scanout ss;
+
+    VIRTIO_GPU_FILL_CMD(ss);
+    virtio_gpu_bswap_32(&ss, sizeof(ss));
+    trace_virtio_gpu_cmd_set_scanout(ss.scanout_id, ss.resource_id,
+                                     ss.r.width, ss.r.height, ss.r.x, ss.r.y);
+
+    if (ss.resource_id == 0) {
+        virtio_gpu_disable_scanout(g, ss.scanout_id);
+        return;
     }
 
-    res->scanout_bitmask |= (1 << ss.scanout_id);
-    scanout->resource_id = ss.resource_id;
-    scanout->x = ss.r.x;
-    scanout->y = ss.r.y;
-    scanout->width = ss.r.width;
-    scanout->height = ss.r.height;
+    res = virtio_gpu_find_check_resource(g, ss.resource_id, true,
+                                         __func__, &cmd->error);
+    if (!res) {
+        return;
+    }
+
+    fb.format = pixman_image_get_format(res->image);
+    fb.bytes_pp = DIV_ROUND_UP(PIXMAN_FORMAT_BPP(fb.format), 8);
+    fb.width  = pixman_image_get_width(res->image);
+    fb.height = pixman_image_get_height(res->image);
+    fb.stride = pixman_image_get_stride(res->image);
+    fb.offset = ss.r.x * fb.bytes_pp + ss.r.y * fb.stride;
+
+    virtio_gpu_do_set_scanout(g, ss.scanout_id,
+                              &fb, res, &ss.r, &cmd->error);
 }
 
 int virtio_gpu_create_mapping_iov(VirtIOGPU *g,
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 265b1c516c..b83a91a67f 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -59,6 +59,14 @@ struct virtio_gpu_simple_resource {
     QTAILQ_ENTRY(virtio_gpu_simple_resource) next;
 };
 
+struct virtio_gpu_framebuffer {
+    pixman_format_code_t format;
+    uint32_t bytes_pp;
+    uint32_t width, height;
+    uint32_t stride;
+    uint32_t offset;
+};
+
 struct virtio_gpu_scanout {
     QemuConsole *con;
     DisplaySurface *ds;
-- 
2.30.2


