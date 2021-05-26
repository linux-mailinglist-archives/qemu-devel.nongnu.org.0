Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFD3392344
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 01:32:05 +0200 (CEST)
Received: from localhost ([::1]:54860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm30O-0002KK-Pa
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 19:32:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lm2va-0002ex-8G
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:27:06 -0400
Received: from mga01.intel.com ([192.55.52.88]:11252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lm2vY-0001wp-HH
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:27:06 -0400
IronPort-SDR: wCmDD73u4EP1hztl7NLIkzLSI/CGEld9ao/ABjAB3v43DDpmNIloqvmAB/B7pGGVtXG/B6zGi5
 FEPSHO8Dcq7g==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="223801553"
X-IronPort-AV: E=Sophos;i="5.82,333,1613462400"; d="scan'208";a="223801553"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 16:26:58 -0700
IronPort-SDR: Baul7F3ZwT8KSPO60YRkVv/hPZHsKd3p6qFrkdfzwJLzHwo4eTbLgQM/4gkQ2RybV8HiFBC3Mt
 4R/GbrnwWz2Q==
X-IronPort-AV: E=Sophos;i="5.82,333,1613462400"; d="scan'208";a="477188167"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 16:26:58 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 12/14] virtio-gpu: Factor out update scanout
Date: Wed, 26 May 2021 16:14:27 -0700
Message-Id: <20210526231429.1045476-13-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210526231429.1045476-1-vivek.kasireddy@intel.com>
References: <20210526231429.1045476-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.88;
 envelope-from=vivek.kasireddy@intel.com; helo=mga01.intel.com
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
index 788b4540d5..0af08edde8 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -556,6 +556,28 @@ static void virtio_unref_resource(pixman_image_t *image, void *data)
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
@@ -563,7 +585,6 @@ static void virtio_gpu_do_set_scanout(VirtIOGPU *g,
                                       struct virtio_gpu_rect *r,
                                       uint32_t *error)
 {
-    struct virtio_gpu_simple_resource *ores;
     struct virtio_gpu_scanout *scanout;
     uint8_t *data;
 
@@ -623,17 +644,7 @@ static void virtio_gpu_do_set_scanout(VirtIOGPU *g,
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


