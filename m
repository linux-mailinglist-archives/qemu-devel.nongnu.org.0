Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B715B3652DF
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 09:08:40 +0200 (CEST)
Received: from localhost ([::1]:36182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYkUx-0006yZ-Ig
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 03:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lYkSE-00037n-6G
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 03:05:50 -0400
Received: from mga17.intel.com ([192.55.52.151]:17757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lYkSC-0002nI-95
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 03:05:49 -0400
IronPort-SDR: d/W0tJ+dk+zJOVTUGIYEZZCOx3nNAo0rh6tYmDzZrrZNGUUNmazAyYxS0KPVsIsc7IcK+UtN8h
 DzzoVj7hITKg==
X-IronPort-AV: E=McAfee;i="6200,9189,9959"; a="175563725"
X-IronPort-AV: E=Sophos;i="5.82,236,1613462400"; d="scan'208";a="175563725"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 00:05:37 -0700
IronPort-SDR: mnHR2dqWKjE1Hp0w+TKAI/VVxSIGpIjMcm7btsoaf2pUYXbb4AkGmOiSdM0pqWLY1GfPju3190
 s1D3MtACyp5w==
X-IronPort-AV: E=Sophos;i="5.82,236,1613462400"; d="scan'208";a="420293120"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 00:05:36 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/12] virtio-gpu: Add virtio_gpu_find_check_resource
Date: Mon, 19 Apr 2021 23:53:38 -0700
Message-Id: <20210420065347.2685768-4-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210420065347.2685768-1-vivek.kasireddy@intel.com>
References: <20210420065347.2685768-1-vivek.kasireddy@intel.com>
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

Move finding the resource and validating its backing storage into one
function.

Based-on-patch-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 hw/display/virtio-gpu.c | 66 +++++++++++++++++++++++++++++------------
 1 file changed, 47 insertions(+), 19 deletions(-)

diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index c9f5e36fd0..de7462a515 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -35,6 +35,10 @@
 
 static struct virtio_gpu_simple_resource*
 virtio_gpu_find_resource(VirtIOGPU *g, uint32_t resource_id);
+static struct virtio_gpu_simple_resource *
+virtio_gpu_find_check_resource(VirtIOGPU *g, uint32_t resource_id,
+                               bool require_backing,
+                               const char *caller, uint32_t *error);
 
 static void virtio_gpu_cleanup_mapping(VirtIOGPU *g,
                                        struct virtio_gpu_simple_resource *res);
@@ -63,7 +67,8 @@ static void update_cursor_data_simple(VirtIOGPU *g,
     struct virtio_gpu_simple_resource *res;
     uint32_t pixels;
 
-    res = virtio_gpu_find_resource(g, resource_id);
+    res = virtio_gpu_find_check_resource(g, resource_id, false,
+                                         __func__, NULL);
     if (!res) {
         return;
     }
@@ -158,6 +163,37 @@ virtio_gpu_find_resource(VirtIOGPU *g, uint32_t resource_id)
     return NULL;
 }
 
+static struct virtio_gpu_simple_resource *
+virtio_gpu_find_check_resource(VirtIOGPU *g, uint32_t resource_id,
+                               bool require_backing,
+                               const char *caller, uint32_t *error)
+{
+    struct virtio_gpu_simple_resource *res;
+
+    res = virtio_gpu_find_resource(g, resource_id);
+    if (!res) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid resource specified %d\n",
+                      caller, resource_id);
+        if (error) {
+            *error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
+        }
+        return NULL;
+    }
+
+    if (require_backing) {
+        if (!res->iov || !res->image) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: no backing storage %d\n",
+                          caller, resource_id);
+            if (error) {
+                *error = VIRTIO_GPU_RESP_ERR_UNSPEC;
+            }
+            return NULL;
+        }
+    }
+
+    return res;
+}
+
 void virtio_gpu_ctrl_response(VirtIOGPU *g,
                               struct virtio_gpu_ctrl_command *cmd,
                               struct virtio_gpu_ctrl_hdr *resp,
@@ -396,11 +432,9 @@ static void virtio_gpu_transfer_to_host_2d(VirtIOGPU *g,
     virtio_gpu_t2d_bswap(&t2d);
     trace_virtio_gpu_cmd_res_xfer_toh_2d(t2d.resource_id);
 
-    res = virtio_gpu_find_resource(g, t2d.resource_id);
-    if (!res || !res->iov) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: illegal resource specified %d\n",
-                      __func__, t2d.resource_id);
-        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
+    res = virtio_gpu_find_check_resource(g, t2d.resource_id, true,
+                                         __func__, &cmd->error);
+    if (!res) {
         return;
     }
 
@@ -454,11 +488,9 @@ static void virtio_gpu_resource_flush(VirtIOGPU *g,
     trace_virtio_gpu_cmd_res_flush(rf.resource_id,
                                    rf.r.width, rf.r.height, rf.r.x, rf.r.y);
 
-    res = virtio_gpu_find_resource(g, rf.resource_id);
+    res = virtio_gpu_find_check_resource(g, rf.resource_id, false,
+                                         __func__, &cmd->error);
     if (!res) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: illegal resource specified %d\n",
-                      __func__, rf.resource_id);
-        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
         return;
     }
 
@@ -541,11 +573,9 @@ static void virtio_gpu_set_scanout(VirtIOGPU *g,
     }
 
     /* create a surface for this scanout */
-    res = virtio_gpu_find_resource(g, ss.resource_id);
+    res = virtio_gpu_find_check_resource(g, ss.resource_id, true,
+                                         __func__, &cmd->error);
     if (!res) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: illegal resource specified %d\n",
-                      __func__, ss.resource_id);
-        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
         return;
     }
 
@@ -737,11 +767,9 @@ virtio_gpu_resource_detach_backing(VirtIOGPU *g,
     virtio_gpu_bswap_32(&detach, sizeof(detach));
     trace_virtio_gpu_cmd_res_back_detach(detach.resource_id);
 
-    res = virtio_gpu_find_resource(g, detach.resource_id);
-    if (!res || !res->iov) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: illegal resource specified %d\n",
-                      __func__, detach.resource_id);
-        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
+    res = virtio_gpu_find_check_resource(g, detach.resource_id, true,
+                                         __func__, &cmd->error);
+    if (!res) {
         return;
     }
     virtio_gpu_cleanup_mapping(g, res);
-- 
2.26.2


