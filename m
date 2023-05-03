Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BC96F5465
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:17:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8am-0007Ic-V2; Wed, 03 May 2023 05:16:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1pu8ah-0007FW-RD
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:16:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1pu8af-00084N-Rm
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:16:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683105361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tv9zdnzFPYflddWP3Ob5IxNNR8Pzq02z+BOdGTsuewc=;
 b=atIn5OuG8G1dz5Uyshh+Xllqxi1nA4NhVEDHs9cdWXw2BR0lTiB7Mg5XxPCQTM61wp7Fre
 UtBcDjNMTZYNv9bPUNYVgXYFpDbFlxMoLV+KLbzNpd0WuqQFhAlNeqvNtfmUvJLoSaAXLR
 PaYVGViBvGsNsvB4FOcSDJoVB98Hxec=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299-vlTftgrgOLWKHvgTux1ZCg-1; Wed, 03 May 2023 05:14:16 -0400
X-MC-Unique: vlTftgrgOLWKHvgTux1ZCg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A36EF1C0A580
 for <qemu-devel@nongnu.org>; Wed,  3 May 2023 09:14:16 +0000 (UTC)
Received: from server.redhat.com (ovpn-12-29.pek2.redhat.com [10.72.12.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B2DE91121331;
 Wed,  3 May 2023 09:14:14 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org
Subject: [RFC 5/7] vhost-vdpa: Add the iommufd support in the map/unmap
 function
Date: Wed,  3 May 2023 17:13:35 +0800
Message-Id: <20230503091337.2130631-6-lulu@redhat.com>
In-Reply-To: <20230503091337.2130631-1-lulu@redhat.com>
References: <20230503091337.2130631-1-lulu@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

1.Change the map/umap function to legacy_map/unmap

2. Add the check for iommufd support,
   a>If support iommufd, call the iommufd-related function
   b>In order to use kernel's iotlb process. Still need to call
     the legacy mode iotlb message, Kernel will check and
     skip the legacy iotlb message if iommufd enable

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/virtio/vhost-vdpa.c         | 56 ++++++++++++++++++++++++++++++----
 include/hw/virtio/vhost-vdpa.h | 24 +++++++++++++++
 2 files changed, 74 insertions(+), 6 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 542e003101..85240926b2 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -26,6 +26,7 @@
 #include "cpu.h"
 #include "trace.h"
 #include "qapi/error.h"
+#include "sysemu/iommufd.h"
 
 /*
  * Return one past the end of the end of section. Be careful with uint64_t
@@ -76,8 +77,9 @@ static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section,
  * The caller must set asid = 0 if the device does not support asid.
  * This is not an ABI break since it is set to 0 by the initializer anyway.
  */
-int vhost_vdpa_dma_map(struct vhost_vdpa *v, uint32_t asid, hwaddr iova,
-                       hwaddr size, void *vaddr, bool readonly)
+
+int vhost_vdpa_leagcy_dma_map(struct vhost_vdpa *v, uint32_t asid, hwaddr iova,
+                              hwaddr size, void *vaddr, bool readonly)
 {
     struct vhost_msg_v2 msg = {};
     int fd = v->device_fd;
@@ -103,13 +105,32 @@ int vhost_vdpa_dma_map(struct vhost_vdpa *v, uint32_t asid, hwaddr iova,
 
     return ret;
 }
+int vhost_vdpa_dma_map(struct vhost_vdpa *v, uint32_t asid, hwaddr iova,
+                       hwaddr size, void *vaddr, bool readonly)
+{
+    struct vhost_dev *dev = v->dev;
+
+    if ((v->enable_iommufd) && (v->ops == NULL)) {
+        vdpa_backend_iommufd_ops_class_init(v);
+    }
+
+    struct vdpa_iommu_backend_ops *ops = v->ops;
+    /* inoder to reuse the iotlb prcess to in kernel, still need to call leagcy
+    mode mapping but in kernel , the leagcy mode mapping was replace by
+    iommufd*/
+    if (v->enable_iommufd) {
+        ops->dma_map(dev, asid, iova, size, vaddr, readonly);
+    }
+    return vhost_vdpa_leagcy_dma_map(v, asid, iova, size, vaddr, readonly);
+}
 
 /*
  * The caller must set asid = 0 if the device does not support asid.
  * This is not an ABI break since it is set to 0 by the initializer anyway.
  */
-int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, uint32_t asid, hwaddr iova,
-                         hwaddr size)
+
+int vhost_vdpa_leagcy_dma_unmap(struct vhost_vdpa *v, uint32_t asid,
+                                hwaddr iova, hwaddr size)
 {
     struct vhost_msg_v2 msg = {};
     int fd = v->device_fd;
@@ -132,6 +153,26 @@ int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, uint32_t asid, hwaddr iova,
 
     return ret;
 }
+int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, uint32_t asid, hwaddr iova,
+                         hwaddr size)
+{
+    struct vhost_dev *dev = v->dev;
+
+    if ((v->enable_iommufd) && (v->ops == NULL)) {
+        vdpa_backend_iommufd_ops_class_init(v);
+    }
+
+
+    /* inoder to reuse the iotlb prcess to in kernel, still need to call leagcy
+    mode mapping but in kernel , the leagcy mode mapping was replace by
+    iommufd*/
+    if (v->enable_iommufd) {
+        struct vdpa_iommu_backend_ops *ops = v->ops;
+
+        ops->dma_unmap(dev, asid, iova, size);
+    }
+    return vhost_vdpa_leagcy_dma_unmap(v, asid, iova, size);
+}
 
 static void vhost_vdpa_listener_begin_batch(struct vhost_vdpa *v)
 {
@@ -423,13 +464,14 @@ static void vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v)
 
     v->shadow_vqs = g_steal_pointer(&shadow_vqs);
 }
-
+int g_iommufd;
 static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
 {
     struct vhost_vdpa *v;
     assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA);
     trace_vhost_vdpa_init(dev, opaque);
     int ret;
+    printf("[%s] %d called\n", __func__, __LINE__);
 
     /*
      * Similar to VFIO, we end up pinning all guest memory and have to
@@ -580,7 +622,9 @@ static int vhost_vdpa_cleanup(struct vhost_dev *dev)
     vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
     memory_listener_unregister(&v->listener);
     vhost_vdpa_svq_cleanup(dev);
-
+    if (vhost_vdpa_first_dev(dev)) {
+        v->ops->detach_device(v);
+    }
     dev->opaque = NULL;
     ram_block_discard_disable(false);
 
diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index 309d4ffc70..aa0e3ed65b 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -55,6 +55,10 @@ typedef struct vhost_vdpa {
     void *shadow_vq_ops_opaque;
     struct vhost_dev *dev;
     VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
+    /*iommufd related*/
+    struct vdpa_iommu_backend_ops *ops;
+    bool enable_iommufd;
+
 } VhostVDPA;
 
 
@@ -76,9 +80,29 @@ typedef struct vdpa_iommufd {
 
 int vhost_vdpa_get_iova_range(int fd, struct vhost_vdpa_iova_range *iova_range);
 
+int vhost_vdpa_leagcy_dma_map(struct vhost_vdpa *v, uint32_t asid, hwaddr iova,
+                              hwaddr size, void *vaddr, bool readonly);
+int vhost_vdpa_leagcy_dma_unmap(struct vhost_vdpa *v, uint32_t asid,
+                                hwaddr iova, hwaddr size);
+
 int vhost_vdpa_dma_map(struct vhost_vdpa *v, uint32_t asid, hwaddr iova,
                        hwaddr size, void *vaddr, bool readonly);
 int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, uint32_t asid, hwaddr iova,
                          hwaddr size);
 
+struct vdpa_iommu_backend_ops {
+    /*< private >*/
+    ObjectClass parent_class;
+    int (*dma_map)(struct vhost_dev *dev, uint32_t asid, hwaddr iova,
+                   hwaddr size, void *vaddr, bool readonly);
+    int (*dma_unmap)(struct vhost_dev *dev, uint32_t asid, hwaddr iova,
+                     hwaddr size);
+    int (*attach_device)(struct vhost_vdpa *dev, AddressSpace *as,
+                         Error **errp);
+    void (*detach_device)(struct vhost_vdpa *dev);
+    int (*reset)(VDPAIOMMUFDState *vdpa_iommufd);
+};
+
+void vdpa_backend_iommufd_ops_class_init(struct vhost_vdpa *v);
+
 #endif
-- 
2.34.3


