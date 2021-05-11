Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB26937A2D9
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 11:00:41 +0200 (CEST)
Received: from localhost ([::1]:60180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgOFs-0000Z5-Lj
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 05:00:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lgNeW-0001Rk-51
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:22:04 -0400
Received: from mga17.intel.com ([192.55.52.151]:32223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lgNeU-0004ul-9p
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:22:03 -0400
IronPort-SDR: bGBq1JvLE6mqEvHtBwY111K8ed2CoBGjjEbjAKXqjXujVimuTvZgsl03VzX5JXL5EUR2kSguhK
 NKrYrP7NIvLA==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="179649401"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="179649401"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 01:20:49 -0700
IronPort-SDR: Ud7JgZJfXX7wL12rlWNgFXb4SHQ2sI693pSYdwhI38jdKewAVUSv1hZaFNzW5+v2TFpiOww+lz
 pxVlSEWMQEZA==
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="536892232"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 01:20:49 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 20/20] virtio-gpu: Add gl_flushed callback
Date: Tue, 11 May 2021 01:08:18 -0700
Message-Id: <20210511080818.366985-21-vivek.kasireddy@intel.com>
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

Adding this callback provides a way to determine when the UI
has submitted the buffer to the Host windowing system. Making
the guest wait for this event will ensure that the dmabuf/buffer
updates are synchronized.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 hw/display/virtio-gpu.c        | 47 +++++++++++++++++++++++++++++++++-
 include/hw/virtio/virtio-gpu.h |  1 +
 2 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 59cbc2b1df..47b3b2b244 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1016,7 +1016,8 @@ void virtio_gpu_simple_process_cmd(VirtIOGPU *g,
         cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
         break;
     }
-    if (!cmd->finished) {
+    if ((!cmd->finished && !(cmd->cmd_hdr.flags & VIRTIO_GPU_FLAG_FENCE)) ||
+        (cmd->finished && (cmd->cmd_hdr.flags & VIRTIO_GPU_FLAG_FENCE))) {
         virtio_gpu_ctrl_response_nodata(g, cmd, cmd->error ? cmd->error :
                                         VIRTIO_GPU_RESP_OK_NODATA);
     }
@@ -1074,6 +1075,49 @@ void virtio_gpu_process_cmdq(VirtIOGPU *g)
     g->processing_cmdq = false;
 }
 
+static void virtio_gpu_signal_fence(VirtIOGPU *g,
+                                    struct virtio_gpu_ctrl_command *cmd,
+                                    enum virtio_gpu_ctrl_type type)
+{
+    struct virtio_gpu_simple_resource *res;
+    struct virtio_gpu_wait_flush wf;
+
+    VIRTIO_GPU_FILL_CMD(wf);
+    virtio_gpu_bswap_32(&wf, sizeof(wf));
+
+    res = virtio_gpu_find_check_resource(g, wf.resource_id, true,
+                                         __func__, &cmd->error);
+    if (res && virtio_gpu_resource_has_sync(g, res)) {
+        virtio_gpu_resource_wait_sync(g, res);
+    }
+
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
+
+        g_free(cmd);
+        g->inflight--;
+        if (virtio_gpu_stats_enabled(g->parent_obj.conf)) {
+            fprintf(stderr, "inflight: %3d (-)\r", g->inflight);
+        }
+    }
+}
+
+static void virtio_gpu_gl_flushed(VirtIOGPU *g)
+{
+    if (virtio_gpu_expflush_enabled(g->parent_obj.conf)) {
+        virtio_gpu_process_fenceq(g);
+    }
+}
+
 static void virtio_gpu_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
 {
     VirtIOGPU *g = VIRTIO_GPU(vdev);
@@ -1445,6 +1489,7 @@ static void virtio_gpu_class_init(ObjectClass *klass, void *data)
     vgc->handle_ctrl = virtio_gpu_handle_ctrl;
     vgc->process_cmd = virtio_gpu_simple_process_cmd;
     vgc->update_cursor_data = virtio_gpu_update_cursor_data;
+    vgc->gl_flushed = virtio_gpu_gl_flushed;
 
     vdc->realize = virtio_gpu_device_realize;
     vdc->reset = virtio_gpu_reset;
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 41f74e9286..59edd6da7f 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -202,6 +202,7 @@ struct VirtIOGPUClass {
     void (*update_cursor_data)(VirtIOGPU *g,
                                struct virtio_gpu_scanout *s,
                                uint32_t resource_id);
+    void (*gl_flushed)(VirtIOGPU *g);
 };
 
 struct VirtIOGPUGL {
-- 
2.30.2


