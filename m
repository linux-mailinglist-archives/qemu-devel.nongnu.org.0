Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E133C2B4F36
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 19:27:01 +0100 (CET)
Received: from localhost ([::1]:33552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kejDQ-0005MJ-SJ
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 13:27:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kej3Z-0001dz-RZ
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:16:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kej3W-0001VJ-0x
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:16:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605550605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zy0q95rvxeD3CSLwQZbyqQ6ramPa7aKb7qy3Fl7J3oI=;
 b=Vvxn5KH/Ie6xsWEjSPMzczR007khTE+MWpYSAzHFAM5ob6WzxPLWfwUjAt7hBgqqGQo+fh
 Mkzh1sPcMhEmMGYGyIJyix2lQw29TWb+T3R2uPG7TYcppL4zV+PfG75yP2Dbdh1dy1h5f/
 G8g68LysHztKgYPv86umDRet78RmTG0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-VzJw7RHXOP-UHu8mw4FJlA-1; Mon, 16 Nov 2020 13:16:43 -0500
X-MC-Unique: VzJw7RHXOP-UHu8mw4FJlA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE28B1017DCC;
 Mon, 16 Nov 2020 18:16:41 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-230.ams2.redhat.com [10.36.113.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7DE65C1CF;
 Mon, 16 Nov 2020 18:16:37 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com
Subject: [RFC v7 15/26] vfio/pci: Register handler for iommu fault
Date: Mon, 16 Nov 2020 19:13:38 +0100
Message-Id: <20201116181349.11908-16-eric.auger@redhat.com>
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

We use the new extended IRQ VFIO_IRQ_TYPE_NESTED type and
VFIO_IRQ_SUBTYPE_DMA_FAULT subtype to set/unset
a notifier for physical DMA faults. The associated eventfd is
triggered, in nested mode, whenever a fault is detected at IOMMU
physical level.

The actual handler will be implemented in subsequent patches.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v4 -> v5:
- index_to_str now returns the index name, ie. DMA_FAULT
- use the extended IRQ

v3 -> v4:
- check VFIO_PCI_DMA_FAULT_IRQ_INDEX is supported at kernel level
  before attempting to set signaling for it.
---
 hw/vfio/pci.h |  7 +++++
 hw/vfio/pci.c | 81 ++++++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 87 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index 1574ef983f..c5f06f4ae4 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -114,6 +114,12 @@ typedef struct VFIOMSIXInfo {
     unsigned long *pending;
 } VFIOMSIXInfo;
 
+typedef struct VFIOPCIExtIRQ {
+    struct VFIOPCIDevice *vdev;
+    EventNotifier notifier;
+    uint32_t index;
+} VFIOPCIExtIRQ;
+
 #define TYPE_VFIO_PCI "vfio-pci"
 OBJECT_DECLARE_SIMPLE_TYPE(VFIOPCIDevice, VFIO_PCI)
 
@@ -138,6 +144,7 @@ struct VFIOPCIDevice {
     PCIHostDeviceAddress host;
     EventNotifier err_notifier;
     EventNotifier req_notifier;
+    VFIOPCIExtIRQ *ext_irqs;
     int (*resetfn)(struct VFIOPCIDevice *);
     uint32_t vendor_id;
     uint32_t device_id;
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 14f160e9c4..d7ab7a1525 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2826,6 +2826,76 @@ static PCIPASIDOps vfio_pci_pasid_ops = {
     .set_pasid_table = vfio_iommu_set_pasid_table,
 };
 
+static void vfio_dma_fault_notifier_handler(void *opaque)
+{
+    VFIOPCIExtIRQ *ext_irq = opaque;
+
+    if (!event_notifier_test_and_clear(&ext_irq->notifier)) {
+        return;
+    }
+}
+
+static int vfio_register_ext_irq_handler(VFIOPCIDevice *vdev,
+                                         uint32_t type, uint32_t subtype,
+                                         IOHandler *handler)
+{
+    int32_t fd, ext_irq_index, index;
+    struct vfio_irq_info *irq_info;
+    Error *err = NULL;
+    EventNotifier *n;
+    int ret;
+
+    ret = vfio_get_dev_irq_info(&vdev->vbasedev, type, subtype, &irq_info);
+    if (ret) {
+        return ret;
+    }
+    index = irq_info->index;
+    ext_irq_index = irq_info->index - VFIO_PCI_NUM_IRQS;
+    g_free(irq_info);
+
+    vdev->ext_irqs[ext_irq_index].vdev = vdev;
+    vdev->ext_irqs[ext_irq_index].index = index;
+    n = &vdev->ext_irqs[ext_irq_index].notifier;
+
+    ret = event_notifier_init(n, 0);
+    if (ret) {
+        error_report("vfio: Unable to init event notifier for ext irq %d(%d)",
+                     ext_irq_index, ret);
+        return ret;
+    }
+
+    fd = event_notifier_get_fd(n);
+    qemu_set_fd_handler(fd, vfio_dma_fault_notifier_handler, NULL,
+                        &vdev->ext_irqs[ext_irq_index]);
+
+    ret = vfio_set_irq_signaling(&vdev->vbasedev, index, 0,
+                                 VFIO_IRQ_SET_ACTION_TRIGGER, fd, &err);
+    if (ret) {
+        error_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
+        qemu_set_fd_handler(fd, NULL, NULL, vdev);
+        event_notifier_cleanup(n);
+    }
+    return ret;
+}
+
+static void vfio_unregister_ext_irq_notifiers(VFIOPCIDevice *vdev)
+{
+    VFIODevice *vbasedev = &vdev->vbasedev;
+    Error *err = NULL;
+    int i;
+
+    for (i = 0; i < vbasedev->num_irqs - VFIO_PCI_NUM_IRQS; i++) {
+        if (vfio_set_irq_signaling(vbasedev, i + VFIO_PCI_NUM_IRQS , 0,
+                                   VFIO_IRQ_SET_ACTION_TRIGGER, -1, &err)) {
+            error_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
+        }
+        qemu_set_fd_handler(event_notifier_get_fd(&vdev->ext_irqs[i].notifier),
+                            NULL, NULL, vdev);
+        event_notifier_cleanup(&vdev->ext_irqs[i].notifier);
+    }
+    g_free(vdev->ext_irqs);
+}
+
 static void vfio_realize(PCIDevice *pdev, Error **errp)
 {
     VFIOPCIDevice *vdev = VFIO_PCI(pdev);
@@ -2836,7 +2906,7 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
     ssize_t len;
     struct stat st;
     int groupid;
-    int i, ret;
+    int i, ret, nb_ext_irqs;
     bool is_mdev;
 
     if (!vdev->vbasedev.sysfsdev) {
@@ -2924,6 +2994,11 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
         goto error;
     }
 
+    nb_ext_irqs = vdev->vbasedev.num_irqs - VFIO_PCI_NUM_IRQS;
+    if (nb_ext_irqs > 0) {
+        vdev->ext_irqs = g_new0(VFIOPCIExtIRQ, nb_ext_irqs);
+    }
+
     vfio_populate_device(vdev, &err);
     if (err) {
         error_propagate(errp, err);
@@ -3135,6 +3210,9 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
 
     vfio_register_err_notifier(vdev);
     vfio_register_req_notifier(vdev);
+    vfio_register_ext_irq_handler(vdev, VFIO_IRQ_TYPE_NESTED,
+                                  VFIO_IRQ_SUBTYPE_DMA_FAULT,
+                                  vfio_dma_fault_notifier_handler);
     vfio_setup_resetfn_quirk(vdev);
 
     pci_setup_pasid_ops(pdev, &vfio_pci_pasid_ops);
@@ -3177,6 +3255,7 @@ static void vfio_exitfn(PCIDevice *pdev)
 
     vfio_unregister_req_notifier(vdev);
     vfio_unregister_err_notifier(vdev);
+    vfio_unregister_ext_irq_notifiers(vdev);
     pci_device_set_intx_routing_notifier(&vdev->pdev, NULL);
     if (vdev->irqchip_change_notifier.notify) {
         kvm_irqchip_remove_change_notifier(&vdev->irqchip_change_notifier);
-- 
2.21.3


