Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 246B12B479
	for <lists+qemu-devel@lfdr.de>; Mon, 27 May 2019 14:10:33 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44765 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVESW-0007QF-Ah
	for lists+qemu-devel@lfdr.de; Mon, 27 May 2019 08:10:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38901)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE4Z-0005Vp-On
	for qemu-devel@nongnu.org; Mon, 27 May 2019 07:45:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE4Y-0005aj-Gq
	for qemu-devel@nongnu.org; Mon, 27 May 2019 07:45:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48176)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1hVE4U-0005Kr-NU; Mon, 27 May 2019 07:45:43 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1936A3082B15;
	Mon, 27 May 2019 11:45:28 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5DD055D962;
	Mon, 27 May 2019 11:45:23 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Mon, 27 May 2019 13:42:03 +0200
Message-Id: <20190527114203.2762-28-eric.auger@redhat.com>
In-Reply-To: <20190527114203.2762-1-eric.auger@redhat.com>
References: <20190527114203.2762-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Mon, 27 May 2019 11:45:28 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v4 27/27] vfio-pci: Implement the DMA fault
 handler
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, yi.l.liu@intel.com, mst@redhat.com,
	jean-philippe.brucker@arm.com, zhangfei.gao@foxmail.com,
	peterx@redhat.com, alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Whenever the eventfd is triggered, we retrieve the DMA faults
from the mmapped fault region and inject them in the iommu
memory region.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/pci.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/vfio/pci.h |  1 +
 2 files changed, 54 insertions(+)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 8208171f92..a07acf98c7 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2834,10 +2834,63 @@ static void vfio_unregister_req_notifier(VFIOPCID=
evice *vdev)
 static void vfio_dma_fault_notifier_handler(void *opaque)
 {
     VFIOPCIDevice *vdev =3D opaque;
+    PCIDevice *pdev =3D &vdev->pdev;
+    AddressSpace *as =3D pci_device_iommu_address_space(pdev);
+    IOMMUMemoryRegion *iommu_mr =3D IOMMU_MEMORY_REGION(as->root);
+    struct vfio_region_fault_prod header;
+    struct iommu_fault *queue;
+    char *queue_buffer =3D NULL;
+    ssize_t bytes;
=20
     if (!event_notifier_test_and_clear(&vdev->dma_fault_notifier)) {
         return;
     }
+
+    if (!vdev->fault_prod_region.size || !vdev->fault_cons_region.size) =
{
+        return;
+    }
+
+    bytes =3D pread(vdev->vbasedev.fd, &header, sizeof(header),
+                  vdev->fault_prod_region.fd_offset);
+    if (bytes !=3D sizeof(header)) {
+        error_report("%s unable to read the fault region header (0x%lx)"=
,
+                     __func__, bytes);
+        return;
+    }
+
+    /* Normally the fault queue is mmapped */
+    queue =3D (struct iommu_fault *)vdev->fault_prod_region.mmaps[0].mma=
p;
+    if (!queue) {
+        size_t queue_size =3D header.nb_entries * header.entry_size;
+
+        error_report("%s: fault queue not mmapped: slower fault handling=
",
+                     vdev->vbasedev.name);
+
+        queue_buffer =3D g_malloc(queue_size);
+        bytes =3D  pread(vdev->vbasedev.fd, queue_buffer, queue_size,
+                       vdev->fault_prod_region.fd_offset + header.offset=
);
+        if (bytes !=3D queue_size) {
+            error_report("%s unable to read the fault queue (0x%lx)",
+                         __func__, bytes);
+            return;
+        }
+
+        queue =3D (struct iommu_fault *)queue_buffer;
+    }
+
+    while (vdev->fault_cons_index !=3D header.prod) {
+        memory_region_inject_faults(iommu_mr, 1,
+                                    &queue[vdev->fault_cons_index]);
+        vdev->fault_cons_index =3D
+            (vdev->fault_cons_index + 1) % header.nb_entries;
+    }
+    bytes =3D pwrite(vdev->vbasedev.fd, &vdev->fault_cons_index, 4,
+                   vdev->fault_cons_region.fd_offset + 4);
+    if (bytes !=3D 4) {
+        error_report("%s unable to write the fault region cons index (0x=
%lx)",
+                     __func__, bytes);
+    }
+    g_free(queue_buffer);
 }
=20
 static void vfio_register_dma_fault_notifier(VFIOPCIDevice *vdev)
diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index ee64081b47..01737d9372 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -138,6 +138,7 @@ typedef struct VFIOPCIDevice {
     EventNotifier dma_fault_notifier;
     VFIORegion fault_prod_region;
     VFIORegion fault_cons_region;
+    uint32_t fault_cons_index;
     int (*resetfn)(struct VFIOPCIDevice *);
     uint32_t vendor_id;
     uint32_t device_id;
--=20
2.20.1


