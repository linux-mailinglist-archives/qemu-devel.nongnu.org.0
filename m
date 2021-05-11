Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8735937A2A5
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 10:53:07 +0200 (CEST)
Received: from localhost ([::1]:34688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgO8Y-0000La-Ie
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 04:53:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lgNdt-00086D-9u
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:21:25 -0400
Received: from mga17.intel.com ([192.55.52.151]:32223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lgNdm-0004ul-HH
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:21:24 -0400
IronPort-SDR: mLnWeMOHUHk8metnA56VEm9GfuGmmgOmsu3ErqJ8/ajUyhR9in81eK9w8M8FeW/ERV3q/ps6ug
 HkYn82PrjzcA==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="179649392"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="179649392"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 01:20:49 -0700
IronPort-SDR: gDyZNHvPJFKnUGdxn3V6IZfCdAPjBxo8LIhqacmle/JJN7rjRqDZYOKKw+Dan5V4INw9O+esgy
 q0ucMeDOieJw==
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="536892206"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 01:20:49 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/20] virtio-gpu: Factor out update scanout
Date: Tue, 11 May 2021 01:08:09 -0700
Message-Id: <20210511080818.366985-12-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210511080818.366985-1-vivek.kasireddy@intel.com>
References: <20210511080818.366985-1-vivek.kasireddy@intel.com>
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

Creating a small helper function for updating the scanout
will be useful in the next patch where this needs to be
done early in do_set_scanout before returning.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 hw/display/virtio-gpu.c | 35 +++++++++++++++++++++++------------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 1b6e586f94..f96f7590b1 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -558,6 +558,28 @@ static void virtio_unref_resource(pixman_image_t *image, void *data)
     pixman_image_unref(data);
 }
 
+static void virtio_gpu_update_scanout(VirtIOGPU *g,
+                                      uint32_t scanout_id,
+                                      struct virtio_gpu_simple_resource *res,
+                                      struct virtio_gpu_rect *r)
+{
+    struct virtio_gpu_simple_resource *ores;
+    struct virtio_gpu_scanout *scanout;
+
+    scanout = &g->parent_obj.scanout[scanout_id];
+    ores = virtio_gpu_find_resource(g, scanout->resource_id);
+    if (ores) {
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
 static void virtio_gpu_do_set_scanout(VirtIOGPU *g,
                                       uint32_t scanout_id,
                                       struct virtio_gpu_framebuffer *fb,
@@ -565,7 +587,6 @@ static void virtio_gpu_do_set_scanout(VirtIOGPU *g,
                                       struct virtio_gpu_rect *r,
                                       uint32_t *error)
 {
-    struct virtio_gpu_simple_resource *ores;
     struct virtio_gpu_scanout *scanout;
     uint8_t *data;
 
@@ -625,17 +646,7 @@ static void virtio_gpu_do_set_scanout(VirtIOGPU *g,
                                 scanout->ds);
     }
 
-    ores = virtio_gpu_find_resource(g, scanout->resource_id);
-    if (ores) {
-        ores->scanout_bitmask &= ~(1 << scanout_id);
-    }
-
-    res->scanout_bitmask |= (1 << scanout_id);
-    scanout->resource_id = res->resource_id;
-    scanout->x = r->x;
-    scanout->y = r->y;
-    scanout->width = r->width;
-    scanout->height = r->height;
+    virtio_gpu_update_scanout(g, scanout_id, res, r);
 }
 
 static void virtio_gpu_set_scanout(VirtIOGPU *g,
-- 
2.30.2


