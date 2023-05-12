Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B95AF700985
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 15:52:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxTBh-0003CR-2b; Fri, 12 May 2023 09:52:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1pxTBc-000389-Hl
 for qemu-devel@nongnu.org; Fri, 12 May 2023 09:51:56 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1pxTBa-0006Sk-1d
 for qemu-devel@nongnu.org; Fri, 12 May 2023 09:51:56 -0400
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ac82b07eb3so101117691fa.1
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 06:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1683899512; x=1686491512;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IksVQBM2UDb2f/oZ2W8mYBornY1QQeR85JYcDBnnKbg=;
 b=zZW/DtTV9XIU4GoTyFQnCotMI78+RKsoFpNcS8hnhZqRnxIjdT73KEKRCaBz/V6gbx
 kfmBT/zt/YqJglK5mBeJiMV+35VbS12TBkO6JCFmsk1eMIYi56wR3nT0EZDebWkYW21z
 64z4Q+2Hdv/WU/grssrVEY6h9U9gwI3xOPXAwByL0+e25v8YlzNCN5jxBxoj/UiqWPZM
 2m7+Xt6Wgeor9Sd017KCLZ+pn3Xs6JuojodU5L63uWAlPn8EgrfsWif9Xr4BzX//GeiO
 RIQAnOOunr/oy+KQlYhlD76G+GBidGIn8t1jc0faqkL2JMMqlWzmBYVogqrVOurKyYSn
 0UaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683899512; x=1686491512;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IksVQBM2UDb2f/oZ2W8mYBornY1QQeR85JYcDBnnKbg=;
 b=gSIQu0afpGhQxc0bSPbuEKJfuLsNS8MxAghn9ywqCdqSltB8V5XgihvxpxIuzfLkoS
 XQ/RvRNRyCGqvkIjHRV90rHMRLe//BMhmKi2G4fekjweX7Uh5qEGILdB7jvKk9Ke+FXo
 4ZBjvcabTAAf5g6UGQHV2gVBKNxx1vdjimpiNPvHHq2h05Chjgm+W7bMD8W2e5w32AwZ
 pt42MhbRNZr/RZkVQ3WqzlENLAIycQouyNEWYylIGqTcOr46zc3gtk6YlN/Z9GfWz0jE
 X+sGthiOB9XwoJNFoPPF3TiJjv7Y+BT1bAXwHMinKE6Ou0WWiSpkUZfvk8koE3KWp9Pv
 fK1A==
X-Gm-Message-State: AC+VfDwJHzFpo0K/zur/fFyBXVPqEH8IPRFS564/V2TXMkE9NxUCD8uo
 e+YdbZv5Z3zpP4oIJfToqedA+A==
X-Google-Smtp-Source: ACHHUZ4hm69LXBoSvIiz1kqUNrk2S2ZmdPLGQvUNv81LITB9LQaXUAUXtJsn3axLysIE7fgVKCNhnw==
X-Received: by 2002:a2e:894c:0:b0:2ad:d6cd:efe0 with SMTP id
 b12-20020a2e894c000000b002add6cdefe0mr756638ljk.37.1683899512502; 
 Fri, 12 May 2023 06:51:52 -0700 (PDT)
Received: from vp-pc.. (109-252-115-147.nat.spd-mgts.ru. [109.252.115.147])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a2e90c7000000b002ad994b0b51sm1744283ljg.16.2023.05.12.06.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 06:51:52 -0700 (PDT)
From: Viktor Prutyanov <viktor@daynix.com>
To: mst@redhat.com,
	jasowang@redhat.com
Cc: qemu-devel@nongnu.org, viktor@daynix.com, yan@daynix.com,
 yuri.benditovich@daynix.com
Subject: [PATCH v3 2/3] vhost: register and change IOMMU flag depending on
 Device-TLB state
Date: Fri, 12 May 2023 16:51:21 +0300
Message-Id: <20230512135122.70403-3-viktor@daynix.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230512135122.70403-1-viktor@daynix.com>
References: <20230512135122.70403-1-viktor@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::235;
 envelope-from=viktor@daynix.com; helo=mail-lj1-x235.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 hw/virtio/vhost.c                 | 30 ++++++++++++++++++------------
 include/hw/virtio/vhost-backend.h |  3 +++
 include/hw/virtio/vhost.h         |  1 +
 4 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
index 8e581575c9..d39bfefd2d 100644
--- a/hw/virtio/vhost-backend.c
+++ b/hw/virtio/vhost-backend.c
@@ -297,6 +297,11 @@ static void vhost_kernel_set_iotlb_callback(struct vhost_dev *dev,
         qemu_set_fd_handler((uintptr_t)dev->opaque, NULL, NULL, NULL);
 }
 
+static void vhost_kernel_toggle_device_iotlb(struct vhost_dev *dev)
+{
+    vhost_toggle_device_iotlb(dev);
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
index 746d130c74..41c9fbf286 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -781,7 +781,6 @@ static void vhost_iommu_region_add(MemoryListener *listener,
     Int128 end;
     int iommu_idx;
     IOMMUMemoryRegion *iommu_mr;
-    int ret;
 
     if (!memory_region_is_iommu(section->mr)) {
         return;
@@ -796,7 +795,9 @@ static void vhost_iommu_region_add(MemoryListener *listener,
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
@@ -804,16 +805,8 @@ static void vhost_iommu_region_add(MemoryListener *listener,
     iommu->iommu_offset = section->offset_within_address_space -
                           section->offset_within_region;
     iommu->hdev = dev;
-    ret = memory_region_register_iommu_notifier(section->mr, &iommu->n, NULL);
-    if (ret) {
-        /*
-         * Some vIOMMUs do not support dev-iotlb yet.  If so, try to use the
-         * UNMAP legacy message
-         */
-        iommu->n.notifier_flags = IOMMU_NOTIFIER_UNMAP;
-        memory_region_register_iommu_notifier(section->mr, &iommu->n,
-                                              &error_fatal);
-    }
+    memory_region_register_iommu_notifier(section->mr, &iommu->n,
+                                          &error_fatal);
     QLIST_INSERT_HEAD(&dev->iommu_list, iommu, iommu_next);
     /* TODO: can replay help performance here? */
 }
@@ -841,6 +834,19 @@ static void vhost_iommu_region_del(MemoryListener *listener,
     }
 }
 
+void vhost_toggle_device_iotlb(struct vhost_dev *dev)
+{
+    struct vhost_iommu *iommu;
+
+    QLIST_FOREACH(iommu, &dev->iommu_list, iommu_next) {
+        memory_region_unregister_iommu_notifier(iommu->mr, &iommu->n);
+        iommu->n.notifier_flags = dev->vdev->device_iotlb_enabled ?
+                IOMMU_NOTIFIER_DEVIOTLB_UNMAP : IOMMU_NOTIFIER_UNMAP;
+        memory_region_register_iommu_notifier(iommu->mr, &iommu->n,
+                                              &error_fatal);
+    }
+}
+
 static int vhost_virtqueue_set_addr(struct vhost_dev *dev,
                                     struct vhost_virtqueue *vq,
                                     unsigned idx, bool enable_log)
diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
index ec3fbae58d..10a3c36b4b 100644
--- a/include/hw/virtio/vhost-backend.h
+++ b/include/hw/virtio/vhost-backend.h
@@ -133,6 +133,8 @@ typedef int (*vhost_set_config_call_op)(struct vhost_dev *dev,
 
 typedef void (*vhost_reset_status_op)(struct vhost_dev *dev);
 
+typedef void (*vhost_toggle_device_iotlb_op)(struct vhost_dev *dev);
+
 typedef struct VhostOps {
     VhostBackendType backend_type;
     vhost_backend_init vhost_backend_init;
@@ -181,6 +183,7 @@ typedef struct VhostOps {
     vhost_force_iommu_op vhost_force_iommu;
     vhost_set_config_call_op vhost_set_config_call;
     vhost_reset_status_op vhost_reset_status;
+    vhost_toggle_device_iotlb_op vhost_toggle_device_iotlb;
 } VhostOps;
 
 int vhost_backend_update_device_iotlb(struct vhost_dev *dev,
diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index a52f273347..785832ed46 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -320,6 +320,7 @@ bool vhost_has_free_slot(void);
 int vhost_net_set_backend(struct vhost_dev *hdev,
                           struct vhost_vring_file *file);
 
+void vhost_toggle_device_iotlb(struct vhost_dev *dev);
 int vhost_device_iotlb_miss(struct vhost_dev *dev, uint64_t iova, int write);
 
 int vhost_virtqueue_start(struct vhost_dev *dev, struct VirtIODevice *vdev,
-- 
2.35.1


