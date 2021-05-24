Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B0338F5E4
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 00:54:04 +0200 (CEST)
Received: from localhost ([::1]:55428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llJSV-0000q3-2w
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 18:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1llJIm-00087c-BZ
 for qemu-devel@nongnu.org; Mon, 24 May 2021 18:44:00 -0400
Received: from mga05.intel.com ([192.55.52.43]:11755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1llJIk-0006he-KV
 for qemu-devel@nongnu.org; Mon, 24 May 2021 18:44:00 -0400
IronPort-SDR: 5UdlZ8Ctad0rDPAZxxqAuJh4sJ3TuxJdTHw37cFBWw5018ScRdVza2SsCQuDEvtfKCzwNJzCju
 wRg++5BDq27g==
X-IronPort-AV: E=McAfee;i="6200,9189,9994"; a="287620913"
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="287620913"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 15:43:18 -0700
IronPort-SDR: i0BzIeXo711uxuaKDHNU3FCkG/K1BeRN+W7FTmdApXrzTHbrgND+7WwypX3EudYSxyOrKbBFIB
 gsK7nRu79Oug==
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="546246779"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 15:43:18 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 13/13] virtio-gpu: Update cursor data using blob
Date: Mon, 24 May 2021 15:31:03 -0700
Message-Id: <20210524223103.922910-14-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210524223103.922910-1-vivek.kasireddy@intel.com>
References: <20210524223103.922910-1-vivek.kasireddy@intel.com>
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

If a blob is available for the cursor, copy the data from the blob.

Based-on-patch-by: Gerd Hoffmann <kraxel@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 hw/display/virtio-gpu.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 8cee6cb3e5..4d549377cb 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -49,6 +49,7 @@ void virtio_gpu_update_cursor_data(VirtIOGPU *g,
 {
     struct virtio_gpu_simple_resource *res;
     uint32_t pixels;
+    void *data;
 
     res = virtio_gpu_find_check_resource(g, resource_id, false,
                                          __func__, NULL);
@@ -56,14 +57,22 @@ void virtio_gpu_update_cursor_data(VirtIOGPU *g,
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
2.30.2


