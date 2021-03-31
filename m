Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAF234F782
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 05:30:28 +0200 (CEST)
Received: from localhost ([::1]:33788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRRYp-0004Wa-JZ
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 23:30:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lRRQi-0002qd-6j
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 23:22:04 -0400
Received: from mga18.intel.com ([134.134.136.126]:53064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lRRQg-00055o-9M
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 23:22:03 -0400
IronPort-SDR: Tb2iRZWzLOhqHvH8E2f0xTo8cSXdjXmP2Log/2aZy3kmWlil2gq9DZOKlTWggP0zjQpvTja4oa
 vF/WGFKSmM7w==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="179449781"
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; d="scan'208";a="179449781"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 20:21:36 -0700
IronPort-SDR: EGgA1ubdtishb0GZ7v6MUl8GamlmyRRai5rQy+PAyRyCrlN3esGvSS/fLQDKbyT4T61m1ihwp4
 dh/Bc4F2jOYA==
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; d="scan'208";a="418454150"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 20:21:35 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/11] virtio-gpu: Update cursor data using blob
Date: Tue, 30 Mar 2021 20:10:01 -0700
Message-Id: <20210331031001.1564125-12-vivek.kasireddy@intel.com>
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

If a blob is available for the cursor, copy the data from the blob.

Based-on-patch-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 hw/display/virtio-gpu.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 642f95a269..c2f5290ffe 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -67,6 +67,7 @@ static void update_cursor_data_simple(VirtIOGPU *g,
 {
     struct virtio_gpu_simple_resource *res;
     uint32_t pixels;
+    void *data;
 
     res = virtio_gpu_find_check_resource(g, resource_id, false,
                                          __func__, NULL);
@@ -74,14 +75,22 @@ static void update_cursor_data_simple(VirtIOGPU *g,
         return;
     }
 
-    if (pixman_image_get_width(res->image)  != s->current_cursor->width ||
-        pixman_image_get_height(res->image) != s->current_cursor->height) {
-        return;
+    if (res->blob_size) {
+        if (res->blob_size < (s->current_cursor->width *
+                              s->current_cursor->height * 4)) {
+            return;
+        }
+        data = res->blob;
+    } else {
+        if (pixman_image_get_width(res->image)  != s->current_cursor->width ||
+            pixman_image_get_height(res->image) != s->current_cursor->height) {
+            return;
+        }
+        data = pixman_image_get_data(res->image);
     }
 
     pixels = s->current_cursor->width * s->current_cursor->height;
-    memcpy(s->current_cursor->data,
-           pixman_image_get_data(res->image),
+    memcpy(s->current_cursor->data, data,
            pixels * sizeof(uint32_t));
 }
 
-- 
2.26.2


