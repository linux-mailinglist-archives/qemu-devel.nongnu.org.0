Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 820B237A2AE
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 10:55:17 +0200 (CEST)
Received: from localhost ([::1]:43356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgOAe-00065p-H5
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 04:55:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lgNe8-0000HT-Se
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:21:40 -0400
Received: from mga17.intel.com ([192.55.52.151]:32226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lgNe5-0004x4-3O
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:21:40 -0400
IronPort-SDR: W5/uZQ/U0zApG3u+S71Bzo427f0WP9KvMTF285YEYE7lKi+FsAYrw28nCyX/FZQttfaNgyvwCK
 8Z9X8RLJaMAQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="179649397"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="179649397"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 01:20:49 -0700
IronPort-SDR: YF2i2PBW8U/INCtP9KjeT8gNVblw0pL8Syks74MXoyzOr8CEHOfYGseuC+zeIqmMTXZD0vEZGa
 MaAbM2J1+J9g==
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="536892221"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 01:20:49 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/20] virtio-gpu: Add virtio_gpu_wait_flush API
Date: Tue, 11 May 2021 01:08:14 -0700
Message-Id: <20210511080818.366985-17-vivek.kasireddy@intel.com>
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

This new command can be used by the Guest Compositor as a way to
synchronize its updates (repaint/redraw) with Host UI buffer
submissions (redraw). In other words, the Guest can wait until
the buffer it has submitted has been used by the Host before it
starts it new repaint cycle.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 hw/display/virtio-gpu.c                     | 31 +++++++++++++++++++++
 include/standard-headers/linux/virtio_gpu.h | 10 +++++++
 2 files changed, 41 insertions(+)

diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 694d8f550c..59cbc2b1df 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -933,6 +933,30 @@ virtio_gpu_resource_detach_backing(VirtIOGPU *g,
     virtio_gpu_cleanup_mapping(g, res);
 }
 
+static void virtio_gpu_wait_flush(VirtIOGPU *g,
+                                  struct virtio_gpu_ctrl_command *cmd)
+{
+    struct virtio_gpu_simple_resource *res;
+    struct virtio_gpu_wait_flush wf;
+
+    VIRTIO_GPU_FILL_CMD(wf);
+    virtio_gpu_bswap_32(&wf, sizeof(wf));
+
+    res = virtio_gpu_find_check_resource(g, wf.resource_id, true,
+                                         __func__, &cmd->error);
+    if (!res) {
+        return;
+    }
+
+    if (res->blob) {
+        if (cmd->cmd_hdr.flags & VIRTIO_GPU_FLAG_FENCE &&
+            virtio_gpu_resource_has_sync(g, res)) {
+            virtio_gpu_resource_wait_sync(g, res);
+            cmd->finished = true;
+        }
+    }
+}
+
 void virtio_gpu_simple_process_cmd(VirtIOGPU *g,
                                    struct virtio_gpu_ctrl_command *cmd)
 {
@@ -981,6 +1005,13 @@ void virtio_gpu_simple_process_cmd(VirtIOGPU *g,
     case VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING:
         virtio_gpu_resource_detach_backing(g, cmd);
         break;
+    case VIRTIO_GPU_CMD_WAIT_FLUSH:
+        if (!virtio_gpu_expflush_enabled(g->parent_obj.conf)) {
+            cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
+            break;
+        }
+        virtio_gpu_wait_flush(g, cmd);
+        break;
     default:
         cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
         break;
diff --git a/include/standard-headers/linux/virtio_gpu.h b/include/standard-headers/linux/virtio_gpu.h
index d015741f0b..f9aba84174 100644
--- a/include/standard-headers/linux/virtio_gpu.h
+++ b/include/standard-headers/linux/virtio_gpu.h
@@ -60,6 +60,9 @@
  */
 #define VIRTIO_GPU_F_RESOURCE_BLOB       3
 
+/*
+ * VIRTIO_GPU_CMD_WAIT_FLUSH
+ */
 #define VIRTIO_GPU_F_EXPLICIT_FLUSH      4
 
 enum virtio_gpu_ctrl_type {
@@ -80,6 +83,7 @@ enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID,
 	VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB,
 	VIRTIO_GPU_CMD_SET_SCANOUT_BLOB,
+	VIRTIO_GPU_CMD_WAIT_FLUSH,
 
 	/* 3d commands */
 	VIRTIO_GPU_CMD_CTX_CREATE = 0x0200,
@@ -443,4 +447,10 @@ struct virtio_gpu_resource_unmap_blob {
 	uint32_t padding;
 };
 
+/* VIRTIO_GPU_CMD_WAIT_FLUSH */
+struct virtio_gpu_wait_flush {
+	struct virtio_gpu_ctrl_hdr hdr;
+	uint32_t resource_id;
+};
+
 #endif
-- 
2.30.2


