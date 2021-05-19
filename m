Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E42DA3883D5
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 02:38:36 +0200 (CEST)
Received: from localhost ([::1]:50668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljAEO-0004FT-0U
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 20:38:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1ljA3L-0003DO-09
 for qemu-devel@nongnu.org; Tue, 18 May 2021 20:27:11 -0400
Received: from mga09.intel.com ([134.134.136.24]:43020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1ljA3C-0006ZW-Jm
 for qemu-devel@nongnu.org; Tue, 18 May 2021 20:27:10 -0400
IronPort-SDR: ed5vjj7t9wRDWO8pTpGJVxDBsOF6bZ88C29xhUTWwZ7tIWFcQOJwQYJxROORX/75LxFZVlQ2Db
 OUe51F1eb3tw==
X-IronPort-AV: E=McAfee;i="6200,9189,9988"; a="200902436"
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="200902436"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 17:26:41 -0700
IronPort-SDR: IZKrItn32xIpwHDLU8YylqQE3U/5v23GzqDK3TQsbpzZESYwD1fJ73of1Ja3hnI/W5bNC5+4HG
 YAjghjuEnSIA==
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="394177363"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 17:26:41 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 06/13] virtio-gpu: Refactor virtio_gpu_create_mapping_iov
Date: Tue, 18 May 2021 17:14:07 -0700
Message-Id: <20210519001414.786439-7-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210519001414.786439-1-vivek.kasireddy@intel.com>
References: <20210519001414.786439-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.24;
 envelope-from=vivek.kasireddy@intel.com; helo=mga09.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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

Instead of passing the attach_backing object to extract nr_entries
and offset, explicitly pass these as arguments to this function.
This will be helpful when adding create_blob API.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 hw/display/virtio-gpu-virgl.c  |  3 ++-
 hw/display/virtio-gpu.c        | 19 +++++++++----------
 include/hw/virtio/virtio-gpu.h |  2 +-
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index 72c14d9132..092c6dc380 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -289,7 +289,8 @@ static void virgl_resource_attach_backing(VirtIOGPU *g,
     VIRTIO_GPU_FILL_CMD(att_rb);
     trace_virtio_gpu_cmd_res_back_attach(att_rb.resource_id);
 
-    ret = virtio_gpu_create_mapping_iov(g, &att_rb, cmd, NULL, &res_iovs, &res_niov);
+    ret = virtio_gpu_create_mapping_iov(g, att_rb.nr_entries, sizeof(att_rb),
+                                        cmd, NULL, &res_iovs, &res_niov);
     if (ret != 0) {
         cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
         return;
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index fdcedfc61e..7a0db3a860 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -615,7 +615,7 @@ static void virtio_gpu_set_scanout(VirtIOGPU *g,
 }
 
 int virtio_gpu_create_mapping_iov(VirtIOGPU *g,
-                                  struct virtio_gpu_resource_attach_backing *ab,
+                                  uint32_t nr_entries, uint32_t offset,
                                   struct virtio_gpu_ctrl_command *cmd,
                                   uint64_t **addr, struct iovec **iov,
                                   uint32_t *niov)
@@ -624,17 +624,17 @@ int virtio_gpu_create_mapping_iov(VirtIOGPU *g,
     size_t esize, s;
     int e, v;
 
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
@@ -647,7 +647,7 @@ int virtio_gpu_create_mapping_iov(VirtIOGPU *g,
     if (addr) {
         *addr = NULL;
     }
-    for (e = 0, v = 0; e < ab->nr_entries; e++) {
+    for (e = 0, v = 0; e < nr_entries; e++) {
         uint64_t a = le64_to_cpu(ents[e].addr);
         uint32_t l = le32_to_cpu(ents[e].length);
         hwaddr len;
@@ -659,8 +659,7 @@ int virtio_gpu_create_mapping_iov(VirtIOGPU *g,
                                  a, &len, DMA_DIRECTION_TO_DEVICE);
             if (!map) {
                 qemu_log_mask(LOG_GUEST_ERROR, "%s: failed to map MMIO memory for"
-                              " resource %d element %d\n",
-                              __func__, ab->resource_id, e);
+                              " element %d\n", __func__, e);
                 virtio_gpu_cleanup_mapping_iov(g, *iov, v);
                 g_free(ents);
                 *iov = NULL;
@@ -743,8 +742,8 @@ virtio_gpu_resource_attach_backing(VirtIOGPU *g,
         return;
     }
 
-    ret = virtio_gpu_create_mapping_iov(g, &ab, cmd, &res->addrs,
-                                        &res->iov, &res->iov_cnt);
+    ret = virtio_gpu_create_mapping_iov(g, ab.nr_entries, sizeof(ab), cmd,
+                                        &res->addrs, &res->iov, &res->iov_cnt);
     if (ret != 0) {
         cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
         return;
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index b83a91a67f..dad9a1d221 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -238,7 +238,7 @@ void virtio_gpu_get_display_info(VirtIOGPU *g,
 void virtio_gpu_get_edid(VirtIOGPU *g,
                          struct virtio_gpu_ctrl_command *cmd);
 int virtio_gpu_create_mapping_iov(VirtIOGPU *g,
-                                  struct virtio_gpu_resource_attach_backing *ab,
+                                  uint32_t nr_entries, uint32_t offset,
                                   struct virtio_gpu_ctrl_command *cmd,
                                   uint64_t **addr, struct iovec **iov,
                                   uint32_t *niov);
-- 
2.30.2


