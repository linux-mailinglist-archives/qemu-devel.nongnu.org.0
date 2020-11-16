Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0FA2B4F37
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 19:27:44 +0100 (CET)
Received: from localhost ([::1]:35080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kejE7-00061V-QI
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 13:27:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kej3M-0001Od-ME
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:16:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kej3K-0001Rb-9k
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:16:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605550593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6pV4yTGkHVDTiG/pwxeAcscIcbojJ6xTTgjSRh43Z24=;
 b=YIrsQmWlrmvz5BlfxXAZewB1/BlMeKIFyy/GFvzdE6UQaue+475vrtr09pwmlheO+FUGfZ
 BqzeaF5t8dcRaADg8lfaqz9li4ELMRDGCieXBwIaSf1JpUnZBw7Wx6mNJ/4uzUA9HbgARz
 vZrd75opMjeppoydIQAr0kfNDQng38M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-UeDmeMitPxifRXtl_0HKtw-1; Mon, 16 Nov 2020 13:16:31 -0500
X-MC-Unique: UeDmeMitPxifRXtl_0HKtw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C42A8018A9;
 Mon, 16 Nov 2020 18:16:29 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-230.ams2.redhat.com [10.36.113.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16C535C1CF;
 Mon, 16 Nov 2020 18:16:18 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com
Subject: [RFC v7 13/26] vfio: Pass stage 1 MSI bindings to the host
Date: Mon, 16 Nov 2020 19:13:36 +0100
Message-Id: <20201116181349.11908-14-eric.auger@redhat.com>
In-Reply-To: <20201116181349.11908-1-eric.auger@redhat.com>
References: <20201116181349.11908-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, jacob.jun.pan@linux.intel.com,
 jean-philippe@linaro.org, tn@semihalf.com,
 shameerali.kolothum.thodi@huawei.com, nicoleotsuka@gmail.com,
 vivek.gautam@arm.com, yi.l.liu@intel.com, peterx@redhat.com,
 zhangfei.gao@gmail.com, yuzenghui@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We register the stage1 MSI bindings when enabling the vectors
and we unregister them on container disconnection.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v4 -> v5:
- use VFIO_IOMMU_SET_MSI_BINDING

v2 -> v3:
- only register the notifier if the IOMMU translates MSIs
- record the msi bindings in a container list and unregister on
  container release
---
 include/hw/vfio/vfio-common.h |  9 ++++++
 hw/vfio/common.c              | 52 +++++++++++++++++++++++++++++++++++
 hw/vfio/pci.c                 | 51 +++++++++++++++++++++++++++++++++-
 hw/vfio/trace-events          |  2 ++
 4 files changed, 113 insertions(+), 1 deletion(-)

diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index baeb4dcff1..c61720ccf9 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -74,6 +74,13 @@ typedef struct VFIOAddressSpace {
     QLIST_ENTRY(VFIOAddressSpace) list;
 } VFIOAddressSpace;
 
+typedef struct VFIOMSIBinding {
+    hwaddr iova;
+    hwaddr gpa;
+    hwaddr size;
+    QLIST_ENTRY(VFIOMSIBinding) next;
+} VFIOMSIBinding;
+
 struct VFIOGroup;
 
 typedef struct VFIOContainer {
@@ -91,6 +98,7 @@ typedef struct VFIOContainer {
     QLIST_HEAD(, VFIOGuestIOMMU) giommu_list;
     QLIST_HEAD(, VFIOHostDMAWindow) hostwin_list;
     QLIST_HEAD(, VFIOGroup) group_list;
+    QLIST_HEAD(, VFIOMSIBinding) msibinding_list;
     QLIST_ENTRY(VFIOContainer) next;
 } VFIOContainer;
 
@@ -198,6 +206,7 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp);
 void vfio_put_group(VFIOGroup *group);
 int vfio_get_device(VFIOGroup *group, const char *name,
                     VFIODevice *vbasedev, Error **errp);
+int vfio_iommu_set_msi_binding(VFIOContainer *container, IOMMUTLBEntry *entry);
 
 extern const MemoryRegionOps vfio_region_ops;
 typedef QLIST_HEAD(VFIOGroupList, VFIOGroup) VFIOGroupList;
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 6b3bba7ff9..ab7dd36ead 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -636,6 +636,56 @@ static void vfio_iommu_unmap_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
     }
 }
 
+int vfio_iommu_set_msi_binding(VFIOContainer *container,
+                               IOMMUTLBEntry *iotlb)
+{
+    struct vfio_iommu_type1_set_msi_binding ustruct;
+    VFIOMSIBinding *binding;
+    int ret;
+
+    QLIST_FOREACH(binding, &container->msibinding_list, next) {
+        if (binding->iova == iotlb->iova) {
+            return 0;
+        }
+    }
+
+    ustruct.argsz = sizeof(struct vfio_iommu_type1_set_msi_binding);
+    ustruct.iova = iotlb->iova;
+    ustruct.flags = VFIO_IOMMU_BIND_MSI;
+    ustruct.gpa = iotlb->translated_addr;
+    ustruct.size = iotlb->addr_mask + 1;
+    ret = ioctl(container->fd, VFIO_IOMMU_SET_MSI_BINDING , &ustruct);
+    if (ret) {
+        error_report("%s: failed to register the stage1 MSI binding (%m)",
+                     __func__);
+        return ret;
+    }
+    binding =  g_new0(VFIOMSIBinding, 1);
+    binding->iova = ustruct.iova;
+    binding->gpa = ustruct.gpa;
+    binding->size = ustruct.size;
+
+    QLIST_INSERT_HEAD(&container->msibinding_list, binding, next);
+    return 0;
+}
+
+static void vfio_container_unbind_msis(VFIOContainer *container)
+{
+    VFIOMSIBinding *binding, *tmp;
+
+    QLIST_FOREACH_SAFE(binding, &container->msibinding_list, next, tmp) {
+        struct vfio_iommu_type1_set_msi_binding ustruct;
+
+        /* the MSI doorbell is not used anymore, unregister it */
+        ustruct.argsz = sizeof(struct vfio_iommu_type1_set_msi_binding);
+        ustruct.flags = VFIO_IOMMU_UNBIND_MSI;
+        ustruct.iova = binding->iova;
+        ioctl(container->fd, VFIO_IOMMU_SET_MSI_BINDING , &ustruct);
+        QLIST_REMOVE(binding, next);
+        g_free(binding);
+    }
+}
+
 static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
 {
     VFIOGuestIOMMU *giommu = container_of(n, VFIOGuestIOMMU, n);
@@ -2066,6 +2116,8 @@ static void vfio_disconnect_container(VFIOGroup *group)
             g_free(giommu);
         }
 
+        vfio_container_unbind_msis(container);
+
         trace_vfio_disconnect_container(container->fd);
         close(container->fd);
         g_free(container);
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 720720e187..14f160e9c4 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -365,6 +365,49 @@ static void vfio_msi_interrupt(void *opaque)
     notify(&vdev->pdev, nr);
 }
 
+static int vfio_register_msi_binding(VFIOPCIDevice *vdev, int vector_n)
+{
+    VFIOContainer *container = vdev->vbasedev.group->container;
+    PCIDevice *dev = &vdev->pdev;
+    AddressSpace *as = pci_device_iommu_address_space(dev);
+    MSIMessage msg = pci_get_msi_message(dev, vector_n);
+    IOMMUMemoryRegionClass *imrc;
+    IOMMUMemoryRegion *iommu_mr;
+    bool msi_translate = false, nested = false;
+    IOMMUTLBEntry entry;
+
+    if (as == &address_space_memory) {
+        return 0;
+    }
+
+    iommu_mr = IOMMU_MEMORY_REGION(as->root);
+    memory_region_iommu_get_attr(iommu_mr, IOMMU_ATTR_MSI_TRANSLATE,
+                                 (void *)&msi_translate);
+    memory_region_iommu_get_attr(iommu_mr, IOMMU_ATTR_VFIO_NESTED,
+                                 (void *)&nested);
+    imrc = memory_region_get_iommu_class_nocheck(iommu_mr);
+
+    if (!nested || !msi_translate) {
+        return 0;
+    }
+
+    /* MSI doorbell address is translated by an IOMMU */
+
+    rcu_read_lock();
+    entry = imrc->translate(iommu_mr, msg.address, IOMMU_WO, 0);
+    rcu_read_unlock();
+
+    if (entry.perm == IOMMU_NONE) {
+        return -ENOENT;
+    }
+
+    trace_vfio_register_msi_binding(vdev->vbasedev.name, vector_n,
+                                    msg.address, entry.translated_addr);
+
+    vfio_iommu_set_msi_binding(container, &entry);
+    return 0;
+}
+
 static int vfio_enable_vectors(VFIOPCIDevice *vdev, bool msix)
 {
     struct vfio_irq_set *irq_set;
@@ -382,7 +425,7 @@ static int vfio_enable_vectors(VFIOPCIDevice *vdev, bool msix)
     fds = (int32_t *)&irq_set->data;
 
     for (i = 0; i < vdev->nr_vectors; i++) {
-        int fd = -1;
+        int ret, fd = -1;
 
         /*
          * MSI vs MSI-X - The guest has direct access to MSI mask and pending
@@ -397,6 +440,12 @@ static int vfio_enable_vectors(VFIOPCIDevice *vdev, bool msix)
             } else {
                 fd = event_notifier_get_fd(&vdev->msi_vectors[i].kvm_interrupt);
             }
+            ret = vfio_register_msi_binding(vdev, i);
+            if (ret) {
+                error_report("%s failed to register S1 MSI binding "
+                             "for vector %d(%d)", __func__, i, ret);
+                return ret;
+            }
         }
 
         fds[i] = fd;
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 347090cfb4..63c3e08725 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -120,6 +120,8 @@ vfio_get_dev_region(const char *name, int index, uint32_t type, uint32_t subtype
 vfio_dma_unmap_overflow_workaround(void) ""
 vfio_iommu_addr_inv_iotlb(int asid, uint64_t addr, uint64_t size, uint64_t nb_granules, bool leaf) "nested IOTLB invalidate asid=%d, addr=0x%"PRIx64" granule_size=0x%"PRIx64" nb_granules=0x%"PRIx64" leaf=%d"
 vfio_iommu_asid_inv_iotlb(int asid) "nested IOTLB invalidate asid=%d"
+vfio_register_msi_binding(const char *name, int vector, uint64_t giova, uint64_t gdb) "%s: register vector %d gIOVA=0x%"PRIx64 "-> gDB=0x%"PRIx64" stage 1 mapping"
+vfio_unregister_msi_binding(const char *name, int vector, uint64_t giova) "%s: unregister vector %d gIOVA=0x%"PRIx64 " stage 1 mapping"
 
 # platform.c
 vfio_platform_base_device_init(char *name, int groupid) "%s belongs to group #%d"
-- 
2.21.3


