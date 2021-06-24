Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D13273B3663
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 20:58:40 +0200 (CEST)
Received: from localhost ([::1]:35438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwUYh-0003kg-Ra
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 14:58:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lwUW1-0000tS-Nu
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 14:55:53 -0400
Received: from mga11.intel.com ([192.55.52.93]:11038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lwUVz-0006N8-MJ
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 14:55:53 -0400
IronPort-SDR: zro41/gWurEMN4oZizl5a+Hsh2k3YOkqKUoLddotp6oAyGc1calKGLEvIolUO5Bulh2g6WsfBt
 AAiqFDBOtJwg==
X-IronPort-AV: E=McAfee;i="6200,9189,10025"; a="204531442"
X-IronPort-AV: E=Sophos;i="5.83,297,1616482800"; d="scan'208";a="204531442"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 11:55:37 -0700
IronPort-SDR: Vk2+biRA/vui2iKp50YRKL5/Cw1Nk16MxZbtTQBmtNAsJQ5ds5nhNcEEvmfoQhynfDWtXpqK9C
 GDUWmN7uXHsA==
X-IronPort-AV: E=Sophos;i="5.83,297,1616482800"; d="scan'208";a="455176694"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 11:55:35 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 5/5] virtio-gpu: Add gl_flushed callback
Date: Thu, 24 Jun 2021 11:43:12 -0700
Message-Id: <20210624184312.1275843-6-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210624184312.1275843-1-vivek.kasireddy@intel.com>
References: <20210624184312.1275843-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.93;
 envelope-from=vivek.kasireddy@intel.com; helo=mga11.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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

Adding this callback provides a way to resume the processing of
cmds in fenceq and cmdq that were not processed because the UI
was waiting on a fence and blocked cmd processing.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 hw/display/virtio-gpu.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index e183f4ecda..3fcd44ac5e 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -991,8 +991,10 @@ void virtio_gpu_simple_process_cmd(VirtIOGPU *g,
         break;
     }
     if (!cmd->finished) {
-        virtio_gpu_ctrl_response_nodata(g, cmd, cmd->error ? cmd->error :
-                                        VIRTIO_GPU_RESP_OK_NODATA);
+        if (!g->parent_obj.renderer_blocked) {
+            virtio_gpu_ctrl_response_nodata(g, cmd, cmd->error ? cmd->error :
+                                            VIRTIO_GPU_RESP_OK_NODATA);
+        }
     }
 }
 
@@ -1048,6 +1050,30 @@ void virtio_gpu_process_cmdq(VirtIOGPU *g)
     g->processing_cmdq = false;
 }
 
+static void virtio_gpu_process_fenceq(VirtIOGPU *g)
+{
+    struct virtio_gpu_ctrl_command *cmd, *tmp;
+
+    QTAILQ_FOREACH_SAFE(cmd, &g->fenceq, next, tmp) {
+        trace_virtio_gpu_fence_resp(cmd->cmd_hdr.fence_id);
+        virtio_gpu_ctrl_response_nodata(g, cmd, VIRTIO_GPU_RESP_OK_NODATA);
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
+    virtio_gpu_process_cmdq(g);
+}
+
 static void virtio_gpu_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
 {
     VirtIOGPU *g = VIRTIO_GPU(vdev);
@@ -1406,10 +1432,12 @@ static void virtio_gpu_class_init(ObjectClass *klass, void *data)
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


