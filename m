Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D23D738F5C4
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 00:45:25 +0200 (CEST)
Received: from localhost ([::1]:59490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llJK8-0000wG-Jl
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 18:45:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1llJIL-0006tA-Jz
 for qemu-devel@nongnu.org; Mon, 24 May 2021 18:43:33 -0400
Received: from mga05.intel.com ([192.55.52.43]:11775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1llJIJ-0006or-Qr
 for qemu-devel@nongnu.org; Mon, 24 May 2021 18:43:33 -0400
IronPort-SDR: FeJo9vk60XgVQj1F6QdpwVVsSq99v4qIUpMKzy2gKrh3RMPsW/w6DRteIVEfb0gcjncOXy6yYF
 3nzgFOBnu92A==
X-IronPort-AV: E=McAfee;i="6200,9189,9994"; a="287620901"
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="287620901"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 15:43:17 -0700
IronPort-SDR: l0eBsGUaksEngt5i25LMMZ49MYJvhH90KbGUm4aij1YyuVjHIFnbLeG4BpDKlOlJPc2GGD7XaU
 dD45eoadnEMQ==
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="546246750"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 15:43:17 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 04/13] virtio-gpu: Add virtio_gpu_find_check_resource
Date: Mon, 24 May 2021 15:30:54 -0700
Message-Id: <20210524223103.922910-5-vivek.kasireddy@intel.com>
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

Move finding the resource and validating its backing storage into one
function.

Based-on-patch-by: Gerd Hoffmann <kraxel@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 hw/display/virtio-gpu.c | 66 +++++++++++++++++++++++++++++------------
 1 file changed, 47 insertions(+), 19 deletions(-)

diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index db56f0454a..7b5296f0d0 100644
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
@@ -46,7 +50,8 @@ void virtio_gpu_update_cursor_data(VirtIOGPU *g,
     struct virtio_gpu_simple_resource *res;
     uint32_t pixels;
 
-    res = virtio_gpu_find_resource(g, resource_id);
+    res = virtio_gpu_find_check_resource(g, resource_id, false,
+                                         __func__, NULL);
     if (!res) {
         return;
     }
@@ -114,6 +119,37 @@ virtio_gpu_find_resource(VirtIOGPU *g, uint32_t resource_id)
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
@@ -352,11 +388,9 @@ static void virtio_gpu_transfer_to_host_2d(VirtIOGPU *g,
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
 
@@ -410,11 +444,9 @@ static void virtio_gpu_resource_flush(VirtIOGPU *g,
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
 
@@ -497,11 +529,9 @@ static void virtio_gpu_set_scanout(VirtIOGPU *g,
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
 
@@ -709,11 +739,9 @@ virtio_gpu_resource_detach_backing(VirtIOGPU *g,
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
2.30.2


