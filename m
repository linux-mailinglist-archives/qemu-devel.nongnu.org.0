Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B717393113
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 16:39:56 +0200 (CEST)
Received: from localhost ([::1]:49870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmHAx-0004qj-4W
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 10:39:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lmGwy-0000xO-Go
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:25:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lmGwr-000546-P3
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:25:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622125520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LlmpN+ezPbbvbh0veq5klpEiwrK/omsrUtmL1EkjQ68=;
 b=iZflPYH1DdpYuwfj8blcG926y8rwNf/5NKGrT9ucbN6KaJmhobW0QPE83cvlvOEKBQVaFz
 H84Flr/YOIrysYi7KVSeX6xx6xyhfAjwEeGraGXVfuT0jAhipvZjuu+I0i8M4JBhuT0hBl
 VaWXOXSRzz5Co+fPXWCoP8CNplPOqfE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-ivz4k3hyNYypiPvrRjnL9w-1; Thu, 27 May 2021 10:25:18 -0400
X-MC-Unique: ivz4k3hyNYypiPvrRjnL9w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 468C4801817;
 Thu, 27 May 2021 14:25:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F12CD5945E;
 Thu, 27 May 2021 14:24:57 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BC6801800853; Thu, 27 May 2021 16:23:41 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/23] virtio-gpu: Refactor virtio_gpu_set_scanout
Date: Thu, 27 May 2021 16:23:32 +0200
Message-Id: <20210527142340.1352791-16-kraxel@redhat.com>
In-Reply-To: <20210527142340.1352791-1-kraxel@redhat.com>
References: <20210527142340.1352791-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vivek Kasireddy <vivek.kasireddy@intel.com>

Store the meta-data associated with a FB in a new object
(struct virtio_gpu_framebuffer) and pass the object to set_scanout.
Also move code in set_scanout into a do_set_scanout function.
This will be helpful when adding set_scanout_blob API.

Based-on-patch-by: Gerd Hoffmann <kraxel@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Message-Id: <20210526231429.1045476-7-vivek.kasireddy@intel.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/virtio/virtio-gpu.h |   8 ++
 hw/display/virtio-gpu.c        | 153 +++++++++++++++++++--------------
 2 files changed, 96 insertions(+), 65 deletions(-)

diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 265b1c516cd1..b83a91a67f3a 100644
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
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 7b5296f0d088..fdcedfc61e54 100644
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
+        return;
+    }
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
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: illegal scanout %d bounds for"
+                      " resource %d, rect (%d,%d)+%d,%d, fb %d %d\n",
+                      __func__, scanout_id, res->resource_id,
+                      r->x, r->y, r->width, r->height,
+                      fb->width, fb->height);
+        *error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
         return;
     }
 
     g->parent_obj.enable = 1;
-    if (ss.resource_id == 0) {
-        virtio_gpu_disable_scanout(g, ss.scanout_id);
-        return;
-    }
+    data = (uint8_t *)pixman_image_get_data(res->image);
 
     /* create a surface for this scanout */
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
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: illegal scanout %d bounds for"
-                      " resource %d, (%d,%d)+%d,%d vs %d %d\n",
-                      __func__, ss.scanout_id, ss.resource_id, ss.r.x, ss.r.y,
-                      ss.r.width, ss.r.height, res->width, res->height);
-        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
-        return;
-    }
-
-    scanout = &g->parent_obj.scanout[ss.scanout_id];
-
-    format = pixman_image_get_format(res->image);
-    bpp = DIV_ROUND_UP(PIXMAN_FORMAT_BPP(format), 8);
-    offset = (ss.r.x * bpp) + ss.r.y * pixman_image_get_stride(res->image);
-    if (!scanout->ds || surface_data(scanout->ds)
-        != ((uint8_t *)pixman_image_get_data(res->image) + offset) ||
-        scanout->width != ss.r.width ||
-        scanout->height != ss.r.height) {
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
     }
 
-    res->scanout_bitmask |= (1 << ss.scanout_id);
-    scanout->resource_id = ss.resource_id;
-    scanout->x = ss.r.x;
-    scanout->y = ss.r.y;
-    scanout->width = ss.r.width;
-    scanout->height = ss.r.height;
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
+    }
+
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
-- 
2.31.1


