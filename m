Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BE22B502F
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 19:51:55 +0100 (CET)
Received: from localhost ([::1]:39174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kejbW-00075X-L1
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 13:51:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kej5G-0003gI-Ax
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:18:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kej5D-000228-As
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:18:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605550710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZUwFunM2bLmRzMACDwdBbvruQcTDs77m1t3RU2/6KJQ=;
 b=BCIexfZ/wrwCQr1gmNgWoe31z+t5xiWmIyZNC1m/djZ38tazAJobz4jJpa2SO8Ymcbmlgc
 kaWCmx+rQkeQcLpxisxZehoFeEGoIyhkak/2SMM/FpfUQwVrRd8fVSQfAAEl/BGrJ48pz3
 Kt4b1UjWVoc7RlHqK1PsM3cK518riXs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-si0OjbJlOEifaXjtxQGu-g-1; Mon, 16 Nov 2020 13:18:28 -0500
X-MC-Unique: si0OjbJlOEifaXjtxQGu-g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41FB51084D6B;
 Mon, 16 Nov 2020 18:18:26 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-230.ams2.redhat.com [10.36.113.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B8185C1CF;
 Mon, 16 Nov 2020 18:18:18 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com
Subject: [RFC v7 26/26] vfio/pci: Implement return_page_response page response
 callback
Date: Mon, 16 Nov 2020 19:13:49 +0100
Message-Id: <20201116181349.11908-27-eric.auger@redhat.com>
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
 jean-philippe@linaro.org, tn@semihalf.com,
 shameerali.kolothum.thodi@huawei.com, nicoleotsuka@gmail.com,
 vivek.gautam@arm.com, yi.l.liu@intel.com, peterx@redhat.com,
 zhangfei.gao@gmail.com, yuzenghui@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch implements the page response path. The
response s written into the page response ring buffer and then
update header's head index is updated. This path is not used
by this series. It is introduced here as a POC for vSVA/ARM
integration.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/pci.h |   2 +
 hw/vfio/pci.c | 121 ++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 123 insertions(+)

diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index 350e9e9005..ce0472611e 100644
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
index 4e3495bb60..797acd9c73 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2631,6 +2631,61 @@ out:
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
+                                   VFIO_REGION_INFO_CAP_DMA_FAULT);
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
@@ -2706,6 +2761,12 @@ static void vfio_populate_device(VFIOPCIDevice *vdev, Error **errp)
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
@@ -2884,8 +2945,68 @@ static int vfio_iommu_set_pasid_table(PCIBus *bus, int32_t devfn,
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
-- 
2.21.3


