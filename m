Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B3A37A327
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 11:12:53 +0200 (CEST)
Received: from localhost ([::1]:58440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgORg-0002At-Gt
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 05:12:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lgNe5-00005Q-Sf
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:21:37 -0400
Received: from mga17.intel.com ([192.55.52.151]:32215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lgNe0-0004r8-ET
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:21:37 -0400
IronPort-SDR: NQq/VNw7it1K0vMLvcXLSJucRFB9bNCgnoOYTpfKUyHGN1BYbNFPAZhgLxxaiCSgTqgl4sRhe+
 8hc/aW0RdVUg==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="179649395"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="179649395"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 01:20:49 -0700
IronPort-SDR: Q7uf276u4hsmh+Jd67d3Z33YtWVfTgHwDVR3/TK/eKNYIo3smR4SQ8TUQE5dn71hS7p0MyymYl
 9r+qtT5+Dk5g==
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="536892215"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 01:20:49 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/20] virtio-gpu: Add initial definitions for explict
 flush feature
Date: Tue, 11 May 2021 01:08:12 -0700
Message-Id: <20210511080818.366985-15-vivek.kasireddy@intel.com>
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

Add the property bit, conf flag and other relevant declarations
associated with this feature.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 hw/display/virtio-gpu-base.c                | 3 +++
 hw/display/virtio-gpu.c                     | 9 +++++++++
 include/hw/virtio/virtio-gpu.h              | 3 +++
 include/standard-headers/linux/virtio_gpu.h | 2 ++
 4 files changed, 17 insertions(+)

diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index dd294276cb..c9af4c6117 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -211,6 +211,9 @@ virtio_gpu_base_get_features(VirtIODevice *vdev, uint64_t features,
     if (virtio_gpu_blob_enabled(g->conf)) {
         features |= (1 << VIRTIO_GPU_F_RESOURCE_BLOB);
     }
+    if (virtio_gpu_expflush_enabled(g->conf)) {
+        features |= (1 << VIRTIO_GPU_F_EXPLICIT_FLUSH);
+    }
 
     return features;
 }
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index cc2a0af21a..694d8f550c 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1298,6 +1298,13 @@ void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
         }
     }
 
+    if (virtio_gpu_expflush_enabled(g->parent_obj.conf)) {
+        if (!virtio_gpu_blob_enabled(g->parent_obj.conf)) {
+            error_setg(errp, "cannot enable expflush without blob resources");
+            return;
+        }
+    }
+
     if (!virtio_gpu_base_device_realize(qdev,
                                         virtio_gpu_handle_ctrl_cb,
                                         virtio_gpu_handle_cursor_cb,
@@ -1393,6 +1400,8 @@ static Property virtio_gpu_properties[] = {
                      256 * MiB),
     DEFINE_PROP_BIT("blob", VirtIOGPU, parent_obj.conf.flags,
                     VIRTIO_GPU_FLAG_BLOB_ENABLED, false),
+    DEFINE_PROP_BIT("expflush", VirtIOGPU, parent_obj.conf.flags,
+                    VIRTIO_GPU_FLAG_EXPFLUSH_ENABLED, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 31b2bcc57b..4a827454f5 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -90,6 +90,7 @@ enum virtio_gpu_base_conf_flags {
     VIRTIO_GPU_FLAG_EDID_ENABLED,
     VIRTIO_GPU_FLAG_DMABUF_ENABLED,
     VIRTIO_GPU_FLAG_BLOB_ENABLED,
+    VIRTIO_GPU_FLAG_EXPFLUSH_ENABLED,
 };
 
 #define virtio_gpu_virgl_enabled(_cfg) \
@@ -102,6 +103,8 @@ enum virtio_gpu_base_conf_flags {
     (_cfg.flags & (1 << VIRTIO_GPU_FLAG_DMABUF_ENABLED))
 #define virtio_gpu_blob_enabled(_cfg) \
     (_cfg.flags & (1 << VIRTIO_GPU_FLAG_BLOB_ENABLED))
+#define virtio_gpu_expflush_enabled(_cfg) \
+    (_cfg.flags & (1 << VIRTIO_GPU_FLAG_EXPFLUSH_ENABLED))
 
 struct virtio_gpu_base_conf {
     uint32_t max_outputs;
diff --git a/include/standard-headers/linux/virtio_gpu.h b/include/standard-headers/linux/virtio_gpu.h
index 1357e4774e..d015741f0b 100644
--- a/include/standard-headers/linux/virtio_gpu.h
+++ b/include/standard-headers/linux/virtio_gpu.h
@@ -60,6 +60,8 @@
  */
 #define VIRTIO_GPU_F_RESOURCE_BLOB       3
 
+#define VIRTIO_GPU_F_EXPLICIT_FLUSH      4
+
 enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_UNDEFINED = 0,
 
-- 
2.30.2


