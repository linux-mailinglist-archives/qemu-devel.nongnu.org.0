Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF7B35B442
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Apr 2021 14:34:29 +0200 (CEST)
Received: from localhost ([::1]:43658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVZIK-0003Xc-Tx
	for lists+qemu-devel@lfdr.de; Sun, 11 Apr 2021 08:34:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVYxI-00023V-2H
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 08:12:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVYxG-0003Wm-8O
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 08:12:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618143161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GDTlG94/5W3zXoZt5+RZCfA2TEEr/bKBPYEifiAzHS8=;
 b=DOdIJnyFprhBf7agJIwcbI/aNRkclxyawiV/tlg9qLARtqeap7I+DORRDN4zXWqc5UkEHO
 h7roEtQV85NJOlwM93s+PaM83RXxgTSqesc2kKydZG5POBoQ0zFztzwxmabanpE2n8wddu
 LRqXLyLAs1Y4IBHrndsegbq3t3V7twg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-G69ay5oTMYum1i6ULeMgvg-1; Sun, 11 Apr 2021 08:12:37 -0400
X-MC-Unique: G69ay5oTMYum1i6ULeMgvg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77252107ACCA;
 Sun, 11 Apr 2021 12:12:35 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-22.ams2.redhat.com [10.36.112.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5017E10023B2;
 Sun, 11 Apr 2021 12:12:17 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com
Subject: [RFC v9 16/29] vfio: Pass stage 1 MSI bindings to the host
Date: Sun, 11 Apr 2021 14:08:59 +0200
Message-Id: <20210411120912.15770-17-eric.auger@redhat.com>
In-Reply-To: <20210411120912.15770-1-eric.auger@redhat.com>
References: <20210411120912.15770-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 jean-philippe@linaro.org, tn@semihalf.com, chenxiang66@hisilicon.com,
 jiangkunkun@huawei.com, shameerali.kolothum.thodi@huawei.com,
 nicoleotsuka@gmail.com, vivek.gautam@arm.com, vdumpa@nvidia.com,
 yi.l.liu@intel.com, peterx@redhat.com, zhangfei.gao@gmail.com,
 yuzenghui@huawei.com, zhukeqian1@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We register the stage1 MSI bindings when enabling the vectors
and we unregister them on msi disable.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v7 -> v8:
- add unregistration on msix_diable
- remove vfio_container_unbind_msis()

v4 -> v5:
- use VFIO_IOMMU_SET_MSI_BINDING

v2 -> v3:
- only register the notifier if the IOMMU translates MSIs
- record the msi bindings in a container list and unregister on
  container release
---
 include/hw/vfio/vfio-common.h | 12 ++++++
 hw/vfio/common.c              | 59 +++++++++++++++++++++++++++
 hw/vfio/pci.c                 | 76 ++++++++++++++++++++++++++++++++++-
 hw/vfio/trace-events          |  2 +
 4 files changed, 147 insertions(+), 2 deletions(-)

diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 6141162d7a..f30133b2a3 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -74,6 +74,14 @@ typedef struct VFIOAddressSpace {
     QLIST_ENTRY(VFIOAddressSpace) list;
 } VFIOAddressSpace;
 
+typedef struct VFIOMSIBinding {
+    int index;
+    hwaddr iova;
+    hwaddr gpa;
+    hwaddr size;
+    QLIST_ENTRY(VFIOMSIBinding) next;
+} VFIOMSIBinding;
+
 struct VFIOGroup;
 
 typedef struct VFIOContainer {
@@ -91,6 +99,7 @@ typedef struct VFIOContainer {
     QLIST_HEAD(, VFIOGuestIOMMU) giommu_list;
     QLIST_HEAD(, VFIOHostDMAWindow) hostwin_list;
     QLIST_HEAD(, VFIOGroup) group_list;
+    QLIST_HEAD(, VFIOMSIBinding) msibinding_list;
     QLIST_ENTRY(VFIOContainer) next;
 } VFIOContainer;
 
@@ -200,6 +209,9 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp);
 void vfio_put_group(VFIOGroup *group);
 int vfio_get_device(VFIOGroup *group, const char *name,
                     VFIODevice *vbasedev, Error **errp);
+int vfio_iommu_set_msi_binding(VFIOContainer *container, int n,
+                               IOMMUTLBEntry *entry);
+int vfio_iommu_unset_msi_binding(VFIOContainer *container, int n);
 
 extern const MemoryRegionOps vfio_region_ops;
 typedef QLIST_HEAD(VFIOGroupList, VFIOGroup) VFIOGroupList;
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index e369d451e7..970a5a7be7 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -662,6 +662,65 @@ static void vfio_iommu_unmap_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
     }
 }
 
+int vfio_iommu_set_msi_binding(VFIOContainer *container, int n,
+                               IOMMUTLBEntry *iotlb)
+{
+    struct vfio_iommu_type1_set_msi_binding ustruct;
+    VFIOMSIBinding *binding;
+    int ret;
+
+    QLIST_FOREACH(binding, &container->msibinding_list, next) {
+        if (binding->index == n) {
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
+    binding->index = n;
+
+    QLIST_INSERT_HEAD(&container->msibinding_list, binding, next);
+    return 0;
+}
+
+int vfio_iommu_unset_msi_binding(VFIOContainer *container, int n)
+{
+    struct vfio_iommu_type1_set_msi_binding ustruct;
+    VFIOMSIBinding *binding, *tmp;
+    int ret;
+
+    ustruct.argsz = sizeof(struct vfio_iommu_type1_set_msi_binding);
+    QLIST_FOREACH_SAFE(binding, &container->msibinding_list, next, tmp) {
+        if (binding->index != n) {
+            continue;
+        }
+        ustruct.flags = VFIO_IOMMU_UNBIND_MSI;
+        ustruct.iova = binding->iova;
+        ret = ioctl(container->fd, VFIO_IOMMU_SET_MSI_BINDING , &ustruct);
+        if (ret) {
+            error_report("Failed to unregister the stage1 MSI binding "
+                         "for iova=0x%"PRIx64" (%m)", binding->iova);
+        }
+        QLIST_REMOVE(binding, next);
+        g_free(binding);
+        return ret;
+    }
+    return 0;
+}
+
 static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
 {
     VFIOGuestIOMMU *giommu = container_of(n, VFIOGuestIOMMU, n);
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index cad7deec71..a49029dfa4 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -366,6 +366,65 @@ static void vfio_msi_interrupt(void *opaque)
     notify(&vdev->pdev, nr);
 }
 
+static bool vfio_iommu_require_msi_binding(IOMMUMemoryRegion *iommu_mr)
+{
+    bool msi_translate = false, nested = false;
+
+    memory_region_iommu_get_attr(iommu_mr, IOMMU_ATTR_MSI_TRANSLATE,
+                                 (void *)&msi_translate);
+    memory_region_iommu_get_attr(iommu_mr, IOMMU_ATTR_VFIO_NESTED,
+                                 (void *)&nested);
+    if (!nested || !msi_translate) {
+        return false;
+    }
+   return true;
+}
+
+static int vfio_register_msi_binding(VFIOPCIDevice *vdev,
+                                     int vector_n, bool set)
+{
+    VFIOContainer *container = vdev->vbasedev.group->container;
+    PCIDevice *dev = &vdev->pdev;
+    AddressSpace *as = pci_device_iommu_address_space(dev);
+    IOMMUMemoryRegionClass *imrc;
+    IOMMUMemoryRegion *iommu_mr;
+    IOMMUTLBEntry entry;
+    MSIMessage msg;
+
+    if (as == &address_space_memory) {
+        return 0;
+    }
+
+    iommu_mr = IOMMU_MEMORY_REGION(as->root);
+    if (!vfio_iommu_require_msi_binding(iommu_mr)) {
+        return 0;
+    }
+
+    /* MSI doorbell address is translated by an IOMMU */
+
+    if (!set) { /* unregister */
+        trace_vfio_unregister_msi_binding(vdev->vbasedev.name, vector_n);
+
+        return vfio_iommu_unset_msi_binding(container, vector_n);
+    }
+
+    msg = pci_get_msi_message(dev, vector_n);
+    imrc = memory_region_get_iommu_class_nocheck(iommu_mr);
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
+    return vfio_iommu_set_msi_binding(container, vector_n, &entry);
+}
+
 static int vfio_enable_vectors(VFIOPCIDevice *vdev, bool msix)
 {
     struct vfio_irq_set *irq_set;
@@ -383,7 +442,7 @@ static int vfio_enable_vectors(VFIOPCIDevice *vdev, bool msix)
     fds = (int32_t *)&irq_set->data;
 
     for (i = 0; i < vdev->nr_vectors; i++) {
-        int fd = -1;
+        int ret, fd = -1;
 
         /*
          * MSI vs MSI-X - The guest has direct access to MSI mask and pending
@@ -392,6 +451,12 @@ static int vfio_enable_vectors(VFIOPCIDevice *vdev, bool msix)
          * KVM signaling path only when configured and unmasked.
          */
         if (vdev->msi_vectors[i].use) {
+            ret = vfio_register_msi_binding(vdev, i, true);
+            if (ret) {
+                error_report("%s failed to register S1 MSI binding "
+                             "for vector %d(%d)", vdev->vbasedev.name, i, ret);
+                goto out;
+            }
             if (vdev->msi_vectors[i].virq < 0 ||
                 (msix && msix_is_masked(&vdev->pdev, i))) {
                 fd = event_notifier_get_fd(&vdev->msi_vectors[i].interrupt);
@@ -405,6 +470,7 @@ static int vfio_enable_vectors(VFIOPCIDevice *vdev, bool msix)
 
     ret = ioctl(vdev->vbasedev.fd, VFIO_DEVICE_SET_IRQS, irq_set);
 
+out:
     g_free(irq_set);
 
     return ret;
@@ -719,7 +785,8 @@ static void vfio_msi_disable_common(VFIOPCIDevice *vdev)
 
 static void vfio_msix_disable(VFIOPCIDevice *vdev)
 {
-    int i;
+    int ret, i;
+
 
     msix_unset_vector_notifiers(&vdev->pdev);
 
@@ -731,6 +798,11 @@ static void vfio_msix_disable(VFIOPCIDevice *vdev)
         if (vdev->msi_vectors[i].use) {
             vfio_msix_vector_release(&vdev->pdev, i);
             msix_vector_unuse(&vdev->pdev, i);
+            ret = vfio_register_msi_binding(vdev, i, false);
+            if (ret) {
+                error_report("%s: failed to unregister S1 MSI binding "
+                             "for vector %d(%d)", vdev->vbasedev.name, i, ret);
+            }
         }
     }
 
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 43696afc15..5c1b28d0d4 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -122,6 +122,8 @@ vfio_get_dev_region(const char *name, int index, uint32_t type, uint32_t subtype
 vfio_dma_unmap_overflow_workaround(void) ""
 vfio_iommu_addr_inv_iotlb(int asid, uint64_t addr, uint64_t size, uint64_t nb_granules, bool leaf) "nested IOTLB invalidate asid=%d, addr=0x%"PRIx64" granule_size=0x%"PRIx64" nb_granules=0x%"PRIx64" leaf=%d"
 vfio_iommu_asid_inv_iotlb(int asid) "nested IOTLB invalidate asid=%d"
+vfio_register_msi_binding(const char *name, int vector, uint64_t giova, uint64_t gdb) "%s: register vector %d gIOVA=0x%"PRIx64 "-> gDB=0x%"PRIx64" stage 1 mapping"
+vfio_unregister_msi_binding(const char *name, int vector) "%s: unregister vector %d stage 1 mapping"
 
 # platform.c
 vfio_platform_base_device_init(char *name, int groupid) "%s belongs to group #%d"
-- 
2.26.3


