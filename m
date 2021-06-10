Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D43153A379F
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 01:04:57 +0200 (CEST)
Received: from localhost ([::1]:60866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrTjM-0007Q2-HC
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 19:04:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lrTg9-0007jt-1C
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 19:01:37 -0400
Received: from mga17.intel.com ([192.55.52.151]:52994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lrTg7-00079b-3w
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 19:01:36 -0400
IronPort-SDR: 2nMJbFDp29bUxSYeHtodzWdkrSZIGbcIY71rENAVfgbp0OmHkSPeSXdx0WvPweRKrTQ/mBEIo8
 AyZ11coo8o9A==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="185796187"
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; d="scan'208";a="185796187"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 16:01:08 -0700
IronPort-SDR: J+Qs3t6Qi51b7E8y1zLFWGbfWk4P6AD/BMvr30u8vx33k6WsSZcH9ND1xZfHVwNMbz7BVQYncd
 xjlOdM1SlHYQ==
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; d="scan'208";a="419888380"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 16:01:08 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 8/8] virtio-gpu: Add gl_flushed callback
Date: Thu, 10 Jun 2021 15:48:37 -0700
Message-Id: <20210610224837.670192-9-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210610224837.670192-1-vivek.kasireddy@intel.com>
References: <20210610224837.670192-1-vivek.kasireddy@intel.com>
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

Adding this callback provides a way to determine when the UI
has submitted the buffer to the Host windowing system. Making
the guest wait for this event will ensure that the dmabuf/buffer
updates are synchronized.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 hw/display/virtio-gpu.c | 44 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 4d549377cb..bd96332973 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -982,7 +982,7 @@ void virtio_gpu_simple_process_cmd(VirtIOGPU *g,
         cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
         break;
     }
-    if (!cmd->finished) {
+    if (!cmd->finished && !(cmd->cmd_hdr.flags & VIRTIO_GPU_FLAG_FENCE)) {
         virtio_gpu_ctrl_response_nodata(g, cmd, cmd->error ? cmd->error :
                                         VIRTIO_GPU_RESP_OK_NODATA);
     }
@@ -1040,6 +1040,46 @@ void virtio_gpu_process_cmdq(VirtIOGPU *g)
     g->processing_cmdq = false;
 }
 
+static void virtio_gpu_signal_fence(VirtIOGPU *g,
+                                    struct virtio_gpu_ctrl_command *cmd,
+                                    enum virtio_gpu_ctrl_type type)
+{
+    struct virtio_gpu_simple_resource *res;
+    struct virtio_gpu_resource_flush rf;
+
+    VIRTIO_GPU_FILL_CMD(rf);
+    virtio_gpu_bswap_32(&rf, sizeof(rf));
+    res = virtio_gpu_find_check_resource(g, rf.resource_id, true,
+                                         __func__, &cmd->error);
+    if (res) {
+        virtio_gpu_resource_wait_sync(g, res);
+    }
+    virtio_gpu_ctrl_response_nodata(g, cmd, VIRTIO_GPU_RESP_OK_NODATA);
+}
+
+static void virtio_gpu_process_fenceq(VirtIOGPU *g)
+{
+    struct virtio_gpu_ctrl_command *cmd, *tmp;
+
+    QTAILQ_FOREACH_SAFE(cmd, &g->fenceq, next, tmp) {
+        trace_virtio_gpu_fence_resp(cmd->cmd_hdr.fence_id);
+        virtio_gpu_signal_fence(g, cmd, VIRTIO_GPU_RESP_OK_NODATA);
+        QTAILQ_REMOVE(&g->fenceq, cmd, next);
+        g_free(cmd);
+        g->inflight--;
+        if (virtio_gpu_stats_enabled(g->parent_obj.conf)) {
+            fprintf(stderr, "inflight: %3d (-)\r", g->inflight);
+        }
+    }
+}
+
+static void virtio_gpu_handle_gl_flushed(VirtIOGPUBase *b)
+{
+    VirtIOGPU *g = container_of(b, VirtIOGPU, parent_obj);
+
+    virtio_gpu_process_fenceq(g);
+}
+
 static void virtio_gpu_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
 {
     VirtIOGPU *g = VIRTIO_GPU(vdev);
@@ -1398,10 +1438,12 @@ static void virtio_gpu_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
     VirtIOGPUClass *vgc = VIRTIO_GPU_CLASS(klass);
+    VirtIOGPUBaseClass *vgbc = &vgc->parent;
 
     vgc->handle_ctrl = virtio_gpu_handle_ctrl;
     vgc->process_cmd = virtio_gpu_simple_process_cmd;
     vgc->update_cursor_data = virtio_gpu_update_cursor_data;
+    vgbc->gl_flushed = virtio_gpu_handle_gl_flushed;
 
     vdc->realize = virtio_gpu_device_realize;
     vdc->reset = virtio_gpu_reset;
-- 
2.30.2


