Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B39DD3652F2
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 09:10:55 +0200 (CEST)
Received: from localhost ([::1]:44582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYkX8-00021b-PC
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 03:10:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lYkSI-0003H5-IY
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 03:05:54 -0400
Received: from mga17.intel.com ([192.55.52.151]:17764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lYkSG-0002pO-1B
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 03:05:54 -0400
IronPort-SDR: FokhEsBFdMYN8DXqb3kGlEo5d592kvdlCd9B6da+V7Vcb7MbmumqVVlYQKL+CqGVTiOhRAWFmC
 ohIMr1yEt23A==
X-IronPort-AV: E=McAfee;i="6200,9189,9959"; a="175563727"
X-IronPort-AV: E=Sophos;i="5.82,236,1613462400"; d="scan'208";a="175563727"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 00:05:37 -0700
IronPort-SDR: byU2hQUPxAfmRN/+XLu19yxe/U758pzvrEvE49Gf/2x15TfiX0w6EBpMwHT0OSenB7MFgLyrKj
 zLm9jhiSJCcw==
X-IronPort-AV: E=Sophos;i="5.82,236,1613462400"; d="scan'208";a="420293129"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 00:05:37 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/12] virtio-gpu: Refactor virtio_gpu_create_mapping_iov
Date: Mon, 19 Apr 2021 23:53:40 -0700
Message-Id: <20210420065347.2685768-6-vivek.kasireddy@intel.com>
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of passing the attach_backing object to extract nr_entries
and offset, explicitly pass these as arguments to this function.
This will be helpful when adding create_blob API.

Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 hw/display/virtio-gpu-3d.c     |  3 ++-
 hw/display/virtio-gpu.c        | 22 +++++++++++-----------
 include/hw/virtio/virtio-gpu.h |  2 +-
 3 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/hw/display/virtio-gpu-3d.c b/hw/display/virtio-gpu-3d.c
index d98964858e..87ca661a26 100644
--- a/hw/display/virtio-gpu-3d.c
+++ b/hw/display/virtio-gpu-3d.c
@@ -288,7 +288,8 @@ static void virgl_resource_attach_backing(VirtIOGPU *g,
     VIRTIO_GPU_FILL_CMD(att_rb);
     trace_virtio_gpu_cmd_res_back_attach(att_rb.resource_id);
 
-    ret = virtio_gpu_create_mapping_iov(g, &att_rb, cmd, NULL, &res_iovs);
+    ret = virtio_gpu_create_mapping_iov(g, att_rb.nr_entries, sizeof(att_rb),
+                                        cmd, NULL, &res_iovs);
     if (ret != 0) {
         cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
         return;
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 5e1152aa2a..85c8eb749d 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -659,7 +659,7 @@ static void virtio_gpu_set_scanout(VirtIOGPU *g,
 }
 
 int virtio_gpu_create_mapping_iov(VirtIOGPU *g,
-                                  struct virtio_gpu_resource_attach_backing *ab,
+                                  uint32_t nr_entries, uint32_t offset,
                                   struct virtio_gpu_ctrl_command *cmd,
                                   uint64_t **addr, struct iovec **iov)
 {
@@ -667,17 +667,17 @@ int virtio_gpu_create_mapping_iov(VirtIOGPU *g,
     size_t esize, s;
     int i;
 
-    if (ab->nr_entries > 16384) {
+    if (nr_entries > 16384) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: nr_entries is too big (%d > 16384)\n",
-                      __func__, ab->nr_entries);
+                      __func__, nr_entries);
         return -1;
     }
 
-    esize = sizeof(*ents) * ab->nr_entries;
+    esize = sizeof(*ents) * nr_entries;
     ents = g_malloc(esize);
     s = iov_to_buf(cmd->elem.out_sg, cmd->elem.out_num,
-                   sizeof(*ab), ents, esize);
+                   offset, ents, esize);
     if (s != esize) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: command data size incorrect %zu vs %zu\n",
@@ -686,11 +686,11 @@ int virtio_gpu_create_mapping_iov(VirtIOGPU *g,
         return -1;
     }
 
-    *iov = g_malloc0(sizeof(struct iovec) * ab->nr_entries);
+    *iov = g_malloc0(sizeof(struct iovec) * nr_entries);
     if (addr) {
-        *addr = g_malloc0(sizeof(uint64_t) * ab->nr_entries);
+        *addr = g_malloc0(sizeof(uint64_t) * nr_entries);
     }
-    for (i = 0; i < ab->nr_entries; i++) {
+    for (i = 0; i < nr_entries; i++) {
         uint64_t a = le64_to_cpu(ents[i].addr);
         uint32_t l = le32_to_cpu(ents[i].length);
         hwaddr len = l;
@@ -702,8 +702,7 @@ int virtio_gpu_create_mapping_iov(VirtIOGPU *g,
         }
         if (!(*iov)[i].iov_base || len != l) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: failed to map MMIO memory for"
-                          " resource %d element %d\n",
-                          __func__, ab->resource_id, i);
+                          " element %d\n", __func__, i);
             if ((*iov)[i].iov_base) {
                 i++; /* cleanup the 'i'th map */
             }
@@ -770,7 +769,8 @@ virtio_gpu_resource_attach_backing(VirtIOGPU *g,
         return;
     }
 
-    ret = virtio_gpu_create_mapping_iov(g, &ab, cmd, &res->addrs, &res->iov);
+    ret = virtio_gpu_create_mapping_iov(g, ab.nr_entries, sizeof(ab),
+                                        cmd, &res->addrs, &res->iov);
     if (ret != 0) {
         cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
         return;
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 6fd86d6b92..879f4cfff6 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -220,7 +220,7 @@ void virtio_gpu_get_display_info(VirtIOGPU *g,
 void virtio_gpu_get_edid(VirtIOGPU *g,
                          struct virtio_gpu_ctrl_command *cmd);
 int virtio_gpu_create_mapping_iov(VirtIOGPU *g,
-                                  struct virtio_gpu_resource_attach_backing *ab,
+                                  uint32_t nr_entries, uint32_t offset,
                                   struct virtio_gpu_ctrl_command *cmd,
                                   uint64_t **addr, struct iovec **iov);
 void virtio_gpu_cleanup_mapping_iov(VirtIOGPU *g,
-- 
2.26.2


