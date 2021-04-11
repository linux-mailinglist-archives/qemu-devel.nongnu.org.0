Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4128C35B449
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Apr 2021 14:36:57 +0200 (CEST)
Received: from localhost ([::1]:52088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVZKi-0006xj-Ax
	for lists+qemu-devel@lfdr.de; Sun, 11 Apr 2021 08:36:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVYxr-0002Hb-IQ
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 08:13:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVYxn-0003hz-TC
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 08:13:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618143195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pdlFhyLlZNxc7kwZLBiiaeop9Tldvte1oFJ6YyOhVds=;
 b=Co5Ku1xNMljr5yPOszaOKeo+udhLzyIIr6Hxclma1mqe2H9dNvxnocMaHaOrDDm8AOl6yv
 CGKZYO2RR7gtaRbW8sQNVk+Sud8vCo7cJbpBrRjQDBxS8Tndjn9s3dBdW/rh6Q10FH3u6h
 BJPDd/82YwuHVfgFQNLBcTVMQ5J37wY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-xskim7HzPhe1Rw35r5eMUg-1; Sun, 11 Apr 2021 08:13:11 -0400
X-MC-Unique: xskim7HzPhe1Rw35r5eMUg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12480107ACCA;
 Sun, 11 Apr 2021 12:13:09 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-22.ams2.redhat.com [10.36.112.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0BA1410023B2;
 Sun, 11 Apr 2021 12:12:56 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com
Subject: [RFC v9 19/29] vfio/pci: Set up the DMA FAULT region
Date: Sun, 11 Apr 2021 14:09:02 +0200
Message-Id: <20210411120912.15770-20-eric.auger@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 jean-philippe@linaro.org, tn@semihalf.com, chenxiang66@hisilicon.com,
 jiangkunkun@huawei.com, shameerali.kolothum.thodi@huawei.com,
 nicoleotsuka@gmail.com, vivek.gautam@arm.com, vdumpa@nvidia.com,
 yi.l.liu@intel.com, peterx@redhat.com, zhangfei.gao@gmail.com,
 yuzenghui@huawei.com, zhukeqian1@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Set up the fault region which is composed of the actual fault
queue (mmappable) and a header used to handle it. The fault
queue is mmapped.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v4 -> v5:
- use a single DMA FAULT region. No version selection anymore
---
 hw/vfio/pci.h |  1 +
 hw/vfio/pci.c | 64 +++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index a8b06737fb..eef91065f1 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -145,6 +145,7 @@ struct VFIOPCIDevice {
     EventNotifier err_notifier;
     EventNotifier req_notifier;
     VFIOPCIExtIRQ *ext_irqs;
+    VFIORegion dma_fault_region;
     int (*resetfn)(struct VFIOPCIDevice *);
     uint32_t vendor_id;
     uint32_t device_id;
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 71b411b61c..9d4e020b97 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2614,11 +2614,67 @@ int vfio_populate_vga(VFIOPCIDevice *vdev, Error **errp)
     return 0;
 }
 
+static void vfio_init_fault_regions(VFIOPCIDevice *vdev, Error **errp)
+{
+    struct vfio_region_info *fault_region_info = NULL;
+    struct vfio_region_info_cap_fault *cap_fault;
+    VFIODevice *vbasedev = &vdev->vbasedev;
+    struct vfio_info_cap_header *hdr;
+    char *fault_region_name;
+    int ret;
+
+    ret = vfio_get_dev_region_info(&vdev->vbasedev,
+                                   VFIO_REGION_TYPE_NESTED,
+                                   VFIO_REGION_SUBTYPE_NESTED_DMA_FAULT,
+                                   &fault_region_info);
+    if (ret) {
+        goto out;
+    }
+
+    hdr = vfio_get_region_info_cap(fault_region_info,
+                                   VFIO_REGION_INFO_CAP_DMA_FAULT);
+    if (!hdr) {
+        error_setg(errp, "failed to retrieve DMA FAULT capability");
+        goto out;
+    }
+    cap_fault = container_of(hdr, struct vfio_region_info_cap_fault,
+                             header);
+    if (cap_fault->version != 1) {
+        error_setg(errp, "Unsupported DMA FAULT API version %d",
+                   cap_fault->version);
+        goto out;
+    }
+
+    fault_region_name = g_strdup_printf("%s DMA FAULT %d",
+                                        vbasedev->name,
+                                        fault_region_info->index);
+
+    ret = vfio_region_setup(OBJECT(vdev), vbasedev,
+                            &vdev->dma_fault_region,
+                            fault_region_info->index,
+                            fault_region_name);
+    g_free(fault_region_name);
+    if (ret) {
+        error_setg_errno(errp, -ret,
+                         "failed to set up the DMA FAULT region %d",
+                         fault_region_info->index);
+        goto out;
+    }
+
+    ret = vfio_region_mmap(&vdev->dma_fault_region);
+    if (ret) {
+        error_setg_errno(errp, -ret, "Failed to mmap the DMA FAULT queue");
+    }
+out:
+    g_free(fault_region_info);
+}
+
 static void vfio_populate_device(VFIOPCIDevice *vdev, Error **errp)
 {
     VFIODevice *vbasedev = &vdev->vbasedev;
     struct vfio_region_info *reg_info;
     struct vfio_irq_info irq_info = { .argsz = sizeof(irq_info) };
+    Error *err = NULL;
     int i, ret = -1;
 
     /* Sanity check device */
@@ -2682,6 +2738,12 @@ static void vfio_populate_device(VFIOPCIDevice *vdev, Error **errp)
         }
     }
 
+    vfio_init_fault_regions(vdev, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
     irq_info.index = VFIO_PCI_ERR_IRQ_INDEX;
 
     ret = ioctl(vdev->vbasedev.fd, VFIO_DEVICE_GET_IRQ_INFO, &irq_info);
@@ -3274,6 +3336,7 @@ static void vfio_instance_finalize(Object *obj)
 
     vfio_display_finalize(vdev);
     vfio_bars_finalize(vdev);
+    vfio_region_finalize(&vdev->dma_fault_region);
     g_free(vdev->emulated_config_bits);
     g_free(vdev->rom);
     /*
@@ -3294,6 +3357,7 @@ static void vfio_exitfn(PCIDevice *pdev)
     vfio_unregister_req_notifier(vdev);
     vfio_unregister_err_notifier(vdev);
     vfio_unregister_ext_irq_notifiers(vdev);
+    vfio_region_exit(&vdev->dma_fault_region);
     pci_device_set_intx_routing_notifier(&vdev->pdev, NULL);
     if (vdev->irqchip_change_notifier.notify) {
         kvm_irqchip_remove_change_notifier(&vdev->irqchip_change_notifier);
-- 
2.26.3


