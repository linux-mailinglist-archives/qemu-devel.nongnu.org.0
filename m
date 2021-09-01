Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D37FC3FDDF9
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 16:47:52 +0200 (CEST)
Received: from localhost ([::1]:57978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLRWp-0003o6-TD
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 10:47:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.davydov@virtuozzo.com>)
 id 1mLMEC-0003Wa-8d
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 05:08:16 -0400
Received: from relay.sw.ru ([185.231.240.75]:35414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.davydov@virtuozzo.com>)
 id 1mLME6-0005OT-5Q
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 05:08:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=p7exzmm+x0dT94zKEcY/RTOBFrg0MFsOXkdGUbZDuoI=; b=eMo+Y337j3QN
 QeDi44tre3U4UtiBFZYxKWfxKFu+nkEBBCJ6j8jC6mK+DdjvrFdlWd/2aEZwUZRIwoNIbmiJcvnud
 6z5yZNRa5SbvjIvbvoi4APqPljszXDf/Ma7ndxU2ufr3zupAoQ+YD+hCO2FI1rMu54ljysRRULUyl
 KsTR0=;
Received: from [192.168.15.100] (helo=max-Swift-SF314-57.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94.2)
 (envelope-from <maxim.davydov@virtuozzo.com>)
 id 1mLME0-000RwD-Lv; Wed, 01 Sep 2021 12:08:04 +0300
From: Maxim Davydov <maxim.davydov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@openvz.org, mst@redhat.com, stefanha@redhat.com, fam@euphon.net,
 amit@kernel.org, kraxel@redhat.com, berrange@redhat.com,
 Maxim Davydov <maxim.davydov@virtuozzo.com>
Subject: [PATCH v1 3/8] virtio-gpu: Add tracking of the virtio guest feature
 bits
Date: Wed,  1 Sep 2021 12:07:59 +0300
Message-Id: <20210901090804.7139-4-maxim.davydov@virtuozzo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210901090804.7139-1-maxim.davydov@virtuozzo.com>
References: <20210901090804.7139-1-maxim.davydov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=maxim.davydov@virtuozzo.com; helo=relay.sw.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 01 Sep 2021 10:43:12 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add tracking of the bits acknowledged by the guest

Signed-off-by: Maxim Davydov <maxim.davydov@virtuozzo.com>
---
 hw/display/vhost-user-gpu.c    |  3 ++-
 hw/display/virtio-gpu.c        |  8 +++++---
 include/hw/virtio/virtio-gpu.h | 10 +++++-----
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
index 49df56c..8248a70 100644
--- a/hw/display/vhost-user-gpu.c
+++ b/hw/display/vhost-user-gpu.c
@@ -566,7 +566,8 @@ vhost_user_gpu_device_realize(DeviceState *qdev, Error **errp)
 }
 
 static Property vhost_user_gpu_properties[] = {
-    VIRTIO_GPU_BASE_PROPERTIES(VhostUserGPU, parent_obj.conf),
+    VIRTIO_GPU_BASE_PROPERTIES(VhostUserGPU, parent_obj.conf,
+                               parent_obj.parent_obj.guest_features),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 990e71f..a1c52ac 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1387,11 +1387,13 @@ static const VMStateDescription vmstate_virtio_gpu = {
 };
 
 static Property virtio_gpu_properties[] = {
-    VIRTIO_GPU_BASE_PROPERTIES(VirtIOGPU, parent_obj.conf),
+    VIRTIO_GPU_BASE_PROPERTIES(VirtIOGPU, parent_obj.conf,
+                               parent_obj.parent_obj.guest_features),
     DEFINE_PROP_SIZE("max_hostmem", VirtIOGPU, conf_max_hostmem,
                      256 * MiB),
-    DEFINE_PROP_BIT("blob", VirtIOGPU, parent_obj.conf.flags,
-                    VIRTIO_GPU_FLAG_BLOB_ENABLED, false),
+    DEFINE_VIRTIO_FEATURE_BIT("blob", VirtIOGPU, parent_obj.conf.flags,
+                              parent_obj.parent_obj.guest_features,
+                              VIRTIO_GPU_FLAG_BLOB_ENABLED, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 24c6628..948ef69 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -143,11 +143,11 @@ struct VirtIOGPUBaseClass {
     void (*gl_flushed)(VirtIOGPUBase *g);
 };
 
-#define VIRTIO_GPU_BASE_PROPERTIES(_state, _conf)                       \
-    DEFINE_PROP_UINT32("max_outputs", _state, _conf.max_outputs, 1),    \
-    DEFINE_PROP_BIT("edid", _state, _conf.flags, \
-                    VIRTIO_GPU_FLAG_EDID_ENABLED, true), \
-    DEFINE_PROP_UINT32("xres", _state, _conf.xres, 1024), \
+#define VIRTIO_GPU_BASE_PROPERTIES(_state, _conf, _guest_field)           \
+    DEFINE_PROP_UINT32("max_outputs", _state, _conf.max_outputs, 1),      \
+    DEFINE_VIRTIO_FEATURE_BIT("edid", _state, _conf.flags, _guest_field,  \
+                              VIRTIO_GPU_FLAG_EDID_ENABLED, true),        \
+    DEFINE_PROP_UINT32("xres", _state, _conf.xres, 1024),                 \
     DEFINE_PROP_UINT32("yres", _state, _conf.yres, 768)
 
 typedef struct VGPUDMABuf {
-- 
1.8.3.1


