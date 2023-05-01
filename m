Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E06766F2BE9
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 04:03:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptIsM-0003rJ-1V; Sun, 30 Apr 2023 22:02:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1ptIsK-0003rB-Np
 for qemu-devel@nongnu.org; Sun, 30 Apr 2023 22:02:48 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1ptIs4-0003F2-TN
 for qemu-devel@nongnu.org; Sun, 30 Apr 2023 22:02:48 -0400
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f00d3f98deso20385450e87.0
 for <qemu-devel@nongnu.org>; Sun, 30 Apr 2023 19:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682906551; x=1685498551;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KuoPIrbz1UnCVJ8I8IFQYEA36M+uyHB848AT63FYSIs=;
 b=ZdCwltOjv/kuXG00GxuWlDXQ8GLJCD91tv09ilFXZt2ojpAQBvTIYXyxSIdsKGlk2N
 y5ZB4SIYSNU/tx3uQ5JOMXDH6bYCVUe6MxnZwPlGRyXj70QcehMLu5C85FvD8Yxv81Sw
 cLt+eLeIu0roGPib/EOUuvCnJc/99NGF1Z/7Evs3KreS5zDYk3dQ/Z8WG72OtHiVhIaW
 v7kF5Ebbdz0zyLRpV52ranf2KuGogau/tbAai0yMWVtQ5+yPqDRbp04QJRqq9lKXmc50
 ZoUKn5b7puG6G+z2TE9RZEuGqzx6omRoICyzTIENNa9BOwcJ8Y/yIE0i+Iyl80Exh5kS
 VLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682906551; x=1685498551;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KuoPIrbz1UnCVJ8I8IFQYEA36M+uyHB848AT63FYSIs=;
 b=gzApO2/Sv40Q540TGAu9YFUXV0DiYk2hicC6wPAT7s7hGTHGBPWrgHof+pGaQ+WLZE
 FdEZHB8OSzEFeJTQ/T0+vgu82+jnjGHkPED+tK3JXdzA340yMsdRiw0QgrbzVanRbOrk
 vCxLQi9zJcUSkZx47ze4VrBiHSFidggP3Ois9HjioUHQX+McXyc75K+AF/M6RATuvAtm
 FSyLoUaVizsiAJlImB7m0n2Dre8JiiUf+187v4DuPR18YgB702aOljiAZqz+dPnEyyRt
 mG+r7RWuWPuk5TYzrlKnG6MWpxaEiM2EW2vURfigborq5eMp6+7OS+/iC7OrpP5PiOmf
 coqQ==
X-Gm-Message-State: AC+VfDzoJ2NI6fABzYkUn/8hoElAn30DFNJb4iFh8++m/MBNt888fWKF
 TsgJbs6lqZYHkK/m1ZuzKNDIVA==
X-Google-Smtp-Source: ACHHUZ5PpOTuCEJTCVxyN8+K+je0fKZWw4xFI9F/zssk9yXYq619muLQwMgQRP8zOa5JuYQuxaSEXA==
X-Received: by 2002:a05:6512:3906:b0:4ed:c6d5:bd0 with SMTP id
 a6-20020a056512390600b004edc6d50bd0mr3119134lfu.3.1682906551279; 
 Sun, 30 Apr 2023 19:02:31 -0700 (PDT)
Received: from vp-pc.. (109-252-127-135.nat.spd-mgts.ru. [109.252.127.135])
 by smtp.gmail.com with ESMTPSA id
 w7-20020ac254a7000000b004efe73ee01fsm3783271lfk.306.2023.04.30.19.02.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Apr 2023 19:02:31 -0700 (PDT)
From: Viktor Prutyanov <viktor@daynix.com>
To: mst@redhat.com, jasowang@redhat.com, peterx@redhat.com,
 marcel.apfelbaum@gmail.com
Cc: qemu-devel@nongnu.org, viktor@daynix.com, yan@daynix.com,
 yuri.benditovich@daynix.com
Subject: [RFC PATCH v2 3/4] vhost: register and change IOMMU flag depending on
 Device-TLB state
Date: Mon,  1 May 2023 05:02:20 +0300
Message-Id: <20230501020221.188376-4-viktor@daynix.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230501020221.188376-1-viktor@daynix.com>
References: <20230501020221.188376-1-viktor@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::132;
 envelope-from=viktor@daynix.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The guest can disable or never enable Device-TLB. In these cases,
it can't be used even if enabled in QEMU. So, check Device-TLB state
before registering IOMMU notifier and select unmap flag depending on
that. Also, implement a way to change IOMMU notifier flag if Device-TLB
state is changed.

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2001312
Signed-off-by: Viktor Prutyanov <viktor@daynix.com>
---
 hw/virtio/vhost-backend.c         |  6 ++++++
 hw/virtio/vhost.c                 | 26 ++++++++++++++++++++++++--
 include/hw/virtio/vhost-backend.h |  4 ++++
 include/hw/virtio/vhost.h         |  1 +
 4 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
index 8e581575c9..30eb71fb83 100644
--- a/hw/virtio/vhost-backend.c
+++ b/hw/virtio/vhost-backend.c
@@ -297,6 +297,11 @@ static void vhost_kernel_set_iotlb_callback(struct vhost_dev *dev,
         qemu_set_fd_handler((uintptr_t)dev->opaque, NULL, NULL, NULL);
 }
 
+static void vhost_kernel_toggle_device_iotlb(struct vhost_dev *dev, int enable)
+{
+    vhost_toggle_device_iotlb(dev, enable);
+}
+
 const VhostOps kernel_ops = {
         .backend_type = VHOST_BACKEND_TYPE_KERNEL,
         .vhost_backend_init = vhost_kernel_init,
@@ -328,6 +333,7 @@ const VhostOps kernel_ops = {
         .vhost_vsock_set_running = vhost_kernel_vsock_set_running,
         .vhost_set_iotlb_callback = vhost_kernel_set_iotlb_callback,
         .vhost_send_device_iotlb_msg = vhost_kernel_send_device_iotlb_msg,
+        .vhost_toggle_device_iotlb = vhost_kernel_toggle_device_iotlb,
 };
 #endif
 
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index a266396576..1bfcc6d263 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -796,7 +796,9 @@ static void vhost_iommu_region_add(MemoryListener *listener,
     iommu_idx = memory_region_iommu_attrs_to_index(iommu_mr,
                                                    MEMTXATTRS_UNSPECIFIED);
     iommu_notifier_init(&iommu->n, vhost_iommu_unmap_notify,
-                        IOMMU_NOTIFIER_DEVIOTLB_UNMAP,
+                        dev->vdev->device_iotlb_enabled ?
+                            IOMMU_NOTIFIER_DEVIOTLB_UNMAP :
+                            IOMMU_NOTIFIER_UNMAP,
                         section->offset_within_region,
                         int128_get64(end),
                         iommu_idx);
@@ -804,7 +806,8 @@ static void vhost_iommu_region_add(MemoryListener *listener,
     iommu->iommu_offset = section->offset_within_address_space -
                           section->offset_within_region;
     iommu->hdev = dev;
-    ret = memory_region_register_iommu_notifier(section->mr, &iommu->n, NULL);
+    ret = memory_region_register_iommu_notifier(section->mr, &iommu->n,
+            dev->vdev->device_iotlb_enabled ? NULL : &error_fatal);
     if (ret) {
         /*
          * Some vIOMMUs do not support dev-iotlb yet.  If so, try to use the
@@ -841,6 +844,25 @@ static void vhost_iommu_region_del(MemoryListener *listener,
     }
 }
 
+void vhost_toggle_device_iotlb(struct vhost_dev *dev, bool enable)
+{
+    struct vhost_iommu *iommu;
+    int ret;
+
+    QLIST_FOREACH(iommu, &dev->iommu_list, iommu_next) {
+        memory_region_unregister_iommu_notifier(iommu->mr, &iommu->n);
+        iommu->n.notifier_flags = enable ?
+                IOMMU_NOTIFIER_DEVIOTLB_UNMAP : IOMMU_NOTIFIER_UNMAP;
+        ret = memory_region_register_iommu_notifier(iommu->mr, &iommu->n,
+                enable ? NULL : &error_fatal);
+        if (ret) {
+            iommu->n.notifier_flags = IOMMU_NOTIFIER_UNMAP;
+            memory_region_register_iommu_notifier(iommu->mr, &iommu->n,
+                                                  &error_fatal);
+        }
+    }
+}
+
 static int vhost_virtqueue_set_addr(struct vhost_dev *dev,
                                     struct vhost_virtqueue *vq,
                                     unsigned idx, bool enable_log)
diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
index ec3fbae58d..f8e9660a96 100644
--- a/include/hw/virtio/vhost-backend.h
+++ b/include/hw/virtio/vhost-backend.h
@@ -133,6 +133,9 @@ typedef int (*vhost_set_config_call_op)(struct vhost_dev *dev,
 
 typedef void (*vhost_reset_status_op)(struct vhost_dev *dev);
 
+typedef void (*vhost_toggle_device_iotlb_op)(struct vhost_dev *dev,
+                                             int enabled);
+
 typedef struct VhostOps {
     VhostBackendType backend_type;
     vhost_backend_init vhost_backend_init;
@@ -181,6 +184,7 @@ typedef struct VhostOps {
     vhost_force_iommu_op vhost_force_iommu;
     vhost_set_config_call_op vhost_set_config_call;
     vhost_reset_status_op vhost_reset_status;
+    vhost_toggle_device_iotlb_op vhost_toggle_device_iotlb;
 } VhostOps;
 
 int vhost_backend_update_device_iotlb(struct vhost_dev *dev,
diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index a52f273347..b3f585c6cd 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -320,6 +320,7 @@ bool vhost_has_free_slot(void);
 int vhost_net_set_backend(struct vhost_dev *hdev,
                           struct vhost_vring_file *file);
 
+void vhost_toggle_device_iotlb(struct vhost_dev *dev, bool enable);
 int vhost_device_iotlb_miss(struct vhost_dev *dev, uint64_t iova, int write);
 
 int vhost_virtqueue_start(struct vhost_dev *dev, struct VirtIODevice *vdev,
-- 
2.35.1


