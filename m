Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DE365EF9
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jul 2019 19:46:56 +0200 (CEST)
Received: from localhost ([::1]:44393 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hld9j-0001s3-1u
	for lists+qemu-devel@lfdr.de; Thu, 11 Jul 2019 13:46:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38999)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hld5U-0001sW-86
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 13:42:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hld5S-0006Au-P0
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 13:42:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51042)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hld5D-0005sB-TZ; Thu, 11 Jul 2019 13:42:18 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5256830C0DD0;
 Thu, 11 Jul 2019 17:42:09 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B223060600;
 Thu, 11 Jul 2019 17:41:56 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Thu, 11 Jul 2019 19:39:25 +0200
Message-Id: <20190711173933.31203-22-eric.auger@redhat.com>
In-Reply-To: <20190711173933.31203-1-eric.auger@redhat.com>
References: <20190711173933.31203-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Thu, 11 Jul 2019 17:42:09 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v5 21/29] vfio/pci: Set up the DMA FAULT region
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
Cc: drjones@redhat.com, yi.l.liu@intel.com, mst@redhat.com,
 jean-philippe.brucker@arm.com, zhangfei.gao@foxmail.com, peterx@redhat.com,
 alex.williamson@redhat.com, vincent.stehle@arm.com
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
 hw/vfio/pci.c | 64 +++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/vfio/pci.h |  1 +
 2 files changed, 65 insertions(+)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 19702cdbbf..8c8647c4b5 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2511,11 +2511,67 @@ int vfio_populate_vga(VFIOPCIDevice *vdev, Error =
**errp)
     return 0;
 }
=20
+static void vfio_init_fault_regions(VFIOPCIDevice *vdev, Error **errp)
+{
+    struct vfio_region_info *fault_region_info =3D NULL;
+    struct vfio_region_info_cap_fault *cap_fault;
+    VFIODevice *vbasedev =3D &vdev->vbasedev;
+    struct vfio_info_cap_header *hdr;
+    char *fault_region_name;
+    int ret;
+
+    ret =3D vfio_get_dev_region_info(&vdev->vbasedev,
+                                   VFIO_REGION_TYPE_NESTED,
+                                   VFIO_REGION_SUBTYPE_NESTED_DMA_FAULT,
+                                   &fault_region_info);
+    if (ret) {
+        goto out;
+    }
+
+    hdr =3D vfio_get_region_info_cap(fault_region_info,
+                                   VFIO_REGION_INFO_CAP_DMA_FAULT);
+    if (!hdr) {
+        error_setg(errp, "failed to retrieve DMA FAULT capability");
+        goto out;
+    }
+    cap_fault =3D container_of(hdr, struct vfio_region_info_cap_fault,
+                             header);
+    if (cap_fault->version !=3D 1) {
+        error_setg(errp, "Unsupported DMA FAULT API version %d",
+                   cap_fault->version);
+        goto out;
+    }
+
+    fault_region_name =3D g_strdup_printf("%s DMA FAULT %d",
+                                        vbasedev->name,
+                                        fault_region_info->index);
+
+    ret =3D vfio_region_setup(OBJECT(vdev), vbasedev,
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
+    ret =3D vfio_region_mmap(&vdev->dma_fault_region);
+    if (ret) {
+        error_setg_errno(errp, -ret, "Failed to mmap the DMA FAULT queue=
");
+    }
+out:
+    g_free(fault_region_info);
+}
+
 static void vfio_populate_device(VFIOPCIDevice *vdev, Error **errp)
 {
     VFIODevice *vbasedev =3D &vdev->vbasedev;
     struct vfio_region_info *reg_info;
     struct vfio_irq_info irq_info =3D { .argsz =3D sizeof(irq_info) };
+    Error *err =3D NULL;
     int i, ret =3D -1;
=20
     /* Sanity check device */
@@ -2579,6 +2635,12 @@ static void vfio_populate_device(VFIOPCIDevice *vd=
ev, Error **errp)
         }
     }
=20
+    vfio_init_fault_regions(vdev, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
     irq_info.index =3D VFIO_PCI_ERR_IRQ_INDEX;
=20
     ret =3D ioctl(vdev->vbasedev.fd, VFIO_DEVICE_GET_IRQ_INFO, &irq_info=
);
@@ -3159,6 +3221,7 @@ static void vfio_instance_finalize(Object *obj)
=20
     vfio_display_finalize(vdev);
     vfio_bars_finalize(vdev);
+    vfio_region_finalize(&vdev->dma_fault_region);
     g_free(vdev->emulated_config_bits);
     g_free(vdev->rom);
     /*
@@ -3179,6 +3242,7 @@ static void vfio_exitfn(PCIDevice *pdev)
     vfio_unregister_req_notifier(vdev);
     vfio_unregister_err_notifier(vdev);
     vfio_unregister_ext_irq_notifiers(vdev);
+    vfio_region_exit(&vdev->dma_fault_region);
     pci_device_set_intx_routing_notifier(&vdev->pdev, NULL);
     vfio_disable_interrupts(vdev);
     if (vdev->intx.mmap_timer) {
diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index 893d074375..815154656c 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -141,6 +141,7 @@ typedef struct VFIOPCIDevice {
     EventNotifier err_notifier;
     EventNotifier req_notifier;
     VFIOPCIExtIRQ *ext_irqs;
+    VFIORegion dma_fault_region;
     int (*resetfn)(struct VFIOPCIDevice *);
     uint32_t vendor_id;
     uint32_t device_id;
--=20
2.20.1


