Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 780E535B453
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Apr 2021 14:42:02 +0200 (CEST)
Received: from localhost ([::1]:37454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVZPd-0004Gv-G5
	for lists+qemu-devel@lfdr.de; Sun, 11 Apr 2021 08:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVYzj-0003wE-Nu
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 08:15:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVYzY-0004Ww-MD
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 08:15:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618143302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9gPeTrep+WmeRqbZSJKhzwl3qhbkBxLLOMWRI+1q+e4=;
 b=Q8GagOCwDPgNOot/+GrpOE5eQd4NFoLYtHBdfP7S+73h0LyDqZS44V20cjGghJJ0X/FfMm
 2/wwEpuOeDaUofe2a/o9asPum3MU7p3osf3FbqbtIM4RMEp7AkjMalW9+dFfKjTDmn9qpy
 BRU2BdTL4WR7jUDE8+H/y1p417pgFnM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97--YtV1UX0Om-VKje3Sg8QbQ-1; Sun, 11 Apr 2021 08:15:00 -0400
X-MC-Unique: -YtV1UX0Om-VKje3Sg8QbQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E1B6107ACCD;
 Sun, 11 Apr 2021 12:14:58 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-22.ams2.redhat.com [10.36.112.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A60210023B2;
 Sun, 11 Apr 2021 12:14:46 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com
Subject: [RFC v9 29/29] vfio/pci: Implement return_page_response page response
 callback
Date: Sun, 11 Apr 2021 14:09:12 +0200
Message-Id: <20210411120912.15770-30-eric.auger@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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

This patch implements the page response path. The
response is written into the page response ring buffer and then
update header's head index is updated. This path is not used
by this series. It is introduced here as a POC for vSVA/ARM
integration.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v11 -> v12:
- use VFIO_REGION_INFO_CAP_DMA_FAULT_RESPONSE [Shameer]
- fix hot del regression reported and fixed by Shameer
---
 hw/vfio/pci.h |   2 +
 hw/vfio/pci.c | 123 ++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 125 insertions(+)

diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index 03ac8919ef..61b3bf1303 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -147,6 +147,8 @@ struct VFIOPCIDevice {
     VFIOPCIExtIRQ *ext_irqs;
     VFIORegion dma_fault_region;
     uint32_t fault_tail_index;
+    VFIORegion dma_fault_response_region;
+    uint32_t fault_response_head_index;
     int (*resetfn)(struct VFIOPCIDevice *);
     uint32_t vendor_id;
     uint32_t device_id;
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index d7e563859f..0f23c8f343 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2669,6 +2669,61 @@ out:
     g_free(fault_region_info);
 }
 
+static void vfio_init_fault_response_regions(VFIOPCIDevice *vdev, Error **errp)
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
+                                   VFIO_REGION_SUBTYPE_NESTED_DMA_FAULT_RESPONSE,
+                                   &fault_region_info);
+    if (ret) {
+        goto out;
+    }
+
+    hdr = vfio_get_region_info_cap(fault_region_info,
+                                   VFIO_REGION_INFO_CAP_DMA_FAULT_RESPONSE);
+    if (!hdr) {
+        error_setg(errp, "failed to retrieve DMA FAULT RESPONSE capability");
+        goto out;
+    }
+    cap_fault = container_of(hdr, struct vfio_region_info_cap_fault,
+                             header);
+    if (cap_fault->version != 1) {
+        error_setg(errp, "Unsupported DMA FAULT RESPONSE API version %d",
+                   cap_fault->version);
+        goto out;
+    }
+
+    fault_region_name = g_strdup_printf("%s DMA FAULT RESPONSE %d",
+                                        vbasedev->name,
+                                        fault_region_info->index);
+
+    ret = vfio_region_setup(OBJECT(vdev), vbasedev,
+                            &vdev->dma_fault_response_region,
+                            fault_region_info->index,
+                            fault_region_name);
+    g_free(fault_region_name);
+    if (ret) {
+        error_setg_errno(errp, -ret,
+                         "failed to set up the DMA FAULT RESPONSE region %d",
+                         fault_region_info->index);
+        goto out;
+    }
+
+    ret = vfio_region_mmap(&vdev->dma_fault_response_region);
+    if (ret) {
+        error_setg_errno(errp, -ret, "Failed to mmap the DMA FAULT RESPONSE queue");
+    }
+out:
+    g_free(fault_region_info);
+}
+
 static void vfio_populate_device(VFIOPCIDevice *vdev, Error **errp)
 {
     VFIODevice *vbasedev = &vdev->vbasedev;
@@ -2744,6 +2799,12 @@ static void vfio_populate_device(VFIOPCIDevice *vdev, Error **errp)
         return;
     }
 
+    vfio_init_fault_response_regions(vdev, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
     irq_info.index = VFIO_PCI_ERR_IRQ_INDEX;
 
     ret = ioctl(vdev->vbasedev.fd, VFIO_DEVICE_GET_IRQ_INFO, &irq_info);
@@ -2922,8 +2983,68 @@ static int vfio_iommu_set_pasid_table(PCIBus *bus, int32_t devfn,
     return ioctl(container->fd, VFIO_IOMMU_SET_PASID_TABLE, &info);
 }
 
+static int vfio_iommu_return_page_response(PCIBus *bus, int32_t devfn,
+                                           IOMMUPageResponse *resp)
+{
+    PCIDevice *pdev = bus->devices[devfn];
+    VFIOPCIDevice *vdev = DO_UPCAST(VFIOPCIDevice, pdev, pdev);
+    struct iommu_page_response *response = &resp->resp;
+    struct vfio_region_dma_fault_response header;
+    struct iommu_page_response *queue;
+    char *queue_buffer = NULL;
+    ssize_t bytes;
+
+    if (!vdev->dma_fault_response_region.mem) {
+        return -EINVAL;
+    }
+
+    /* read the header */
+    bytes = pread(vdev->vbasedev.fd, &header, sizeof(header),
+                  vdev->dma_fault_response_region.fd_offset);
+    if (bytes != sizeof(header)) {
+        error_report("%s unable to read the fault region header (0x%lx)",
+                     __func__, bytes);
+        return -1;
+    }
+
+    /* Normally the fault queue is mmapped */
+    queue = (struct iommu_page_response *)vdev->dma_fault_response_region.mmaps[0].mmap;
+    if (!queue) {
+        size_t queue_size = header.nb_entries * header.entry_size;
+
+        error_report("%s: fault queue not mmapped: slower fault handling",
+                     vdev->vbasedev.name);
+
+        queue_buffer = g_malloc(queue_size);
+        bytes = pread(vdev->vbasedev.fd, queue_buffer, queue_size,
+                      vdev->dma_fault_response_region.fd_offset + header.offset);
+        if (bytes != queue_size) {
+            error_report("%s unable to read the fault queue (0x%lx)",
+                         __func__, bytes);
+            return -1;
+        }
+
+        queue = (struct iommu_page_response *)queue_buffer;
+    }
+    /* deposit the new response in the queue and increment the head */
+    memcpy(queue + header.head, response, header.entry_size);
+
+    vdev->fault_response_head_index =
+        (vdev->fault_response_head_index + 1) % header.nb_entries;
+    bytes = pwrite(vdev->vbasedev.fd, &vdev->fault_response_head_index, 4,
+                   vdev->dma_fault_response_region.fd_offset);
+    if (bytes != 4) {
+        error_report("%s unable to write the fault response region head index (0x%lx)",
+                     __func__, bytes);
+    }
+    g_free(queue_buffer);
+
+    return 0;
+}
+
 static PCIPASIDOps vfio_pci_pasid_ops = {
     .set_pasid_table = vfio_iommu_set_pasid_table,
+    .return_page_response = vfio_iommu_return_page_response,
 };
 
 static void vfio_dma_fault_notifier_handler(void *opaque)
@@ -3387,6 +3508,7 @@ static void vfio_instance_finalize(Object *obj)
     vfio_display_finalize(vdev);
     vfio_bars_finalize(vdev);
     vfio_region_finalize(&vdev->dma_fault_region);
+    vfio_region_finalize(&vdev->dma_fault_response_region);
     g_free(vdev->emulated_config_bits);
     g_free(vdev->rom);
     /*
@@ -3408,6 +3530,7 @@ static void vfio_exitfn(PCIDevice *pdev)
     vfio_unregister_err_notifier(vdev);
     vfio_unregister_ext_irq_notifiers(vdev);
     vfio_region_exit(&vdev->dma_fault_region);
+    vfio_region_exit(&vdev->dma_fault_response_region);
     pci_device_set_intx_routing_notifier(&vdev->pdev, NULL);
     if (vdev->irqchip_change_notifier.notify) {
         kvm_irqchip_remove_change_notifier(&vdev->irqchip_change_notifier);
-- 
2.26.3


