Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B18324ED5
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 12:10:33 +0100 (CET)
Received: from localhost ([::1]:57268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFEXP-0005g4-Ky
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 06:10:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFEK0-0001f5-1S
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:56:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFEJy-0006Lj-Ef
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:56:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614250597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kdUlRYKn8QtCf9o06jS8ggImvedVgOHZP3O9+rhuWtU=;
 b=S1Mx1UQbX7RvlGRpmuLI7BSn+cR6Nu2tV028DoNJ9PzSQlvTNWI9FUFoKJVq0SivsL5g+S
 KOGicxXRtVU9QUJvFKingA9A0ed5E6rWGC9HJYg/GhLbgWzcXvBsg4HZzu5Sr+p+DQXG5z
 cjQYu7YJ+lIw/amSFZw1br+mnBxk1XM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-n0PJlCpbPYOrkS4dAZBMIg-1; Thu, 25 Feb 2021 05:56:35 -0500
X-MC-Unique: n0PJlCpbPYOrkS4dAZBMIg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA60D18B613D;
 Thu, 25 Feb 2021 10:56:33 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-150.ams2.redhat.com [10.36.112.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8BC945D9D7;
 Thu, 25 Feb 2021 10:56:28 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
 yi.l.liu@intel.com
Subject: [RFC v8 19/28] vfio/pci: Implement the DMA fault handler
Date: Thu, 25 Feb 2021 11:52:24 +0100
Message-Id: <20210225105233.650545-20-eric.auger@redhat.com>
In-Reply-To: <20210225105233.650545-1-eric.auger@redhat.com>
References: <20210225105233.650545-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: jean-philippe@linaro.org, tnowicki@marvell.com, maz@kernel.org,
 jiangkunkun@huawei.com, zhangfei.gao@foxmail.com, peterx@redhat.com,
 shameerali.kolothum.thodi@huawei.com, yuzenghui@huawei.com,
 zhangfei.gao@linaro.org, will@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Whenever the eventfd is triggered, we retrieve the DMA fault(s)
from the mmapped fault region and inject them in the iommu
memory region.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/pci.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/vfio/pci.h |  1 +
 2 files changed, 51 insertions(+)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 9fbbf88673..cb46288512 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2915,10 +2915,60 @@ static PCIPASIDOps vfio_pci_pasid_ops = {
 static void vfio_dma_fault_notifier_handler(void *opaque)
 {
     VFIOPCIExtIRQ *ext_irq = opaque;
+    VFIOPCIDevice *vdev = ext_irq->vdev;
+    PCIDevice *pdev = &vdev->pdev;
+    AddressSpace *as = pci_device_iommu_address_space(pdev);
+    IOMMUMemoryRegion *iommu_mr = IOMMU_MEMORY_REGION(as->root);
+    struct vfio_region_dma_fault header;
+    struct iommu_fault *queue;
+    char *queue_buffer = NULL;
+    ssize_t bytes;
 
     if (!event_notifier_test_and_clear(&ext_irq->notifier)) {
         return;
     }
+
+    bytes = pread(vdev->vbasedev.fd, &header, sizeof(header),
+                  vdev->dma_fault_region.fd_offset);
+    if (bytes != sizeof(header)) {
+        error_report("%s unable to read the fault region header (0x%lx)",
+                     __func__, bytes);
+        return;
+    }
+
+    /* Normally the fault queue is mmapped */
+    queue = (struct iommu_fault *)vdev->dma_fault_region.mmaps[0].mmap;
+    if (!queue) {
+        size_t queue_size = header.nb_entries * header.entry_size;
+
+        error_report("%s: fault queue not mmapped: slower fault handling",
+                     vdev->vbasedev.name);
+
+        queue_buffer = g_malloc(queue_size);
+        bytes =  pread(vdev->vbasedev.fd, queue_buffer, queue_size,
+                       vdev->dma_fault_region.fd_offset + header.offset);
+        if (bytes != queue_size) {
+            error_report("%s unable to read the fault queue (0x%lx)",
+                         __func__, bytes);
+            return;
+        }
+
+        queue = (struct iommu_fault *)queue_buffer;
+    }
+
+    while (vdev->fault_tail_index != header.head) {
+        memory_region_inject_faults(iommu_mr, 1,
+                                    &queue[vdev->fault_tail_index]);
+        vdev->fault_tail_index =
+            (vdev->fault_tail_index + 1) % header.nb_entries;
+    }
+    bytes = pwrite(vdev->vbasedev.fd, &vdev->fault_tail_index, 4,
+                   vdev->dma_fault_region.fd_offset);
+    if (bytes != 4) {
+        error_report("%s unable to write the fault region tail index (0x%lx)",
+                     __func__, bytes);
+    }
+    g_free(queue_buffer);
 }
 
 static int vfio_register_ext_irq_handler(VFIOPCIDevice *vdev,
diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index d6cc689f5e..350e9e9005 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -146,6 +146,7 @@ struct VFIOPCIDevice {
     EventNotifier req_notifier;
     VFIOPCIExtIRQ *ext_irqs;
     VFIORegion dma_fault_region;
+    uint32_t fault_tail_index;
     int (*resetfn)(struct VFIOPCIDevice *);
     uint32_t vendor_id;
     uint32_t device_id;
-- 
2.26.2


