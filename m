Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AEF4196BD
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 16:51:21 +0200 (CEST)
Received: from localhost ([::1]:53924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUryS-0002HN-Hr
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 10:51:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1mUrw7-000056-Ob
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 10:48:55 -0400
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3]:34474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1mUrw5-0001SC-Nr
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 10:48:55 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: fahien) with ESMTPSA id 67AEA1F42177
From: Antonio Caggiano <antonio.caggiano@collabora.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] virtio-gpu: CONTEXT_INIT feature
Date: Mon, 27 Sep 2021 16:48:40 +0200
Message-Id: <20210927144840.3661593-2-antonio.caggiano@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210927144840.3661593-1-antonio.caggiano@collabora.com>
References: <20210927144840.3661593-1-antonio.caggiano@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1098:0:82:1000:25:2eeb:e3e3;
 envelope-from=antonio.caggiano@collabora.com; helo=bhuna.collabora.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create virgl renderer context with flags using context_id when valid.

Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
---
 hw/display/virtio-gpu-base.c                |  2 ++
 hw/display/virtio-gpu-virgl.c               | 10 ++++++++--
 include/hw/virtio/virtio-gpu-bswap.h        |  2 +-
 include/standard-headers/linux/virtio_gpu.h |  9 +++++++--
 4 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index c8da4806e0..619185a9d2 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -212,6 +212,8 @@ virtio_gpu_base_get_features(VirtIODevice *vdev, uint64_t features,
         features |= (1 << VIRTIO_GPU_F_RESOURCE_BLOB);
     }
 
+    features |= (1 << VIRTIO_GPU_F_CONTEXT_INIT);
+
     return features;
 }
 
diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index 18d054922f..5a184cf445 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -97,8 +97,14 @@ static void virgl_cmd_context_create(VirtIOGPU *g,
     trace_virtio_gpu_cmd_ctx_create(cc.hdr.ctx_id,
                                     cc.debug_name);
 
-    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen,
-                                  cc.debug_name);
+    if (cc.context_init) {
+        virgl_renderer_context_create_with_flags(cc.hdr.ctx_id,
+                                                 cc.context_init,
+                                                 cc.nlen,
+                                                 cc.debug_name);
+    } else {
+        virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen, cc.debug_name);
+    }
 }
 
 static void virgl_cmd_context_destroy(VirtIOGPU *g,
diff --git a/include/hw/virtio/virtio-gpu-bswap.h b/include/hw/virtio/virtio-gpu-bswap.h
index e2bee8f595..6267cb57e5 100644
--- a/include/hw/virtio/virtio-gpu-bswap.h
+++ b/include/hw/virtio/virtio-gpu-bswap.h
@@ -24,7 +24,7 @@ virtio_gpu_ctrl_hdr_bswap(struct virtio_gpu_ctrl_hdr *hdr)
     le32_to_cpus(&hdr->flags);
     le64_to_cpus(&hdr->fence_id);
     le32_to_cpus(&hdr->ctx_id);
-    le32_to_cpus(&hdr->padding);
+    le32_to_cpus(&hdr->info);
 }
 
 static inline void
diff --git a/include/standard-headers/linux/virtio_gpu.h b/include/standard-headers/linux/virtio_gpu.h
index 1357e4774e..c9f9c24d6a 100644
--- a/include/standard-headers/linux/virtio_gpu.h
+++ b/include/standard-headers/linux/virtio_gpu.h
@@ -59,6 +59,11 @@
  * VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB
  */
 #define VIRTIO_GPU_F_RESOURCE_BLOB       3
+/*
+ * VIRTIO_GPU_CMD_CREATE_CONTEXT with
+ * context_init
+ */
+#define VIRTIO_GPU_F_CONTEXT_INIT        4
 
 enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_UNDEFINED = 0,
@@ -129,7 +134,7 @@ struct virtio_gpu_ctrl_hdr {
 	uint32_t flags;
 	uint64_t fence_id;
 	uint32_t ctx_id;
-	uint32_t padding;
+	uint32_t info;
 };
 
 /* data passed in the cursor vq */
@@ -272,7 +277,7 @@ struct virtio_gpu_resource_create_3d {
 struct virtio_gpu_ctx_create {
 	struct virtio_gpu_ctrl_hdr hdr;
 	uint32_t nlen;
-	uint32_t padding;
+	uint32_t context_init;
 	char debug_name[64];
 };
 
-- 
2.30.2


