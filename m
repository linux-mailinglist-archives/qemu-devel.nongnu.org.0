Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB7C2B473
	for <lists+qemu-devel@lfdr.de>; Mon, 27 May 2019 14:09:14 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44586 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVERF-0006Kb-J3
	for lists+qemu-devel@lfdr.de; Mon, 27 May 2019 08:09:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38856)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE4Y-0005V6-Is
	for qemu-devel@nongnu.org; Mon, 27 May 2019 07:45:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE4V-0005Xf-Qi
	for qemu-devel@nongnu.org; Mon, 27 May 2019 07:45:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43078)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1hVE4F-0005Hr-Pp; Mon, 27 May 2019 07:45:30 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 08FB8BDD1;
	Mon, 27 May 2019 11:45:23 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B5E325D962;
	Mon, 27 May 2019 11:45:13 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Mon, 27 May 2019 13:42:02 +0200
Message-Id: <20190527114203.2762-27-eric.auger@redhat.com>
In-Reply-To: <20190527114203.2762-1-eric.auger@redhat.com>
References: <20190527114203.2762-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 27 May 2019 11:45:23 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v4 26/27] vfio-pci: Set up fault regions
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

We setup two fault regions: the producer fault is read-only from the
user space perspective. It is composed of the fault queue (mmappable)
and a header written by the kernel, located in a separate page.

The consumer fault is write-only from the user-space perspective.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
---
 hw/vfio/pci.c | 99 +++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/vfio/pci.h |  2 ++
 2 files changed, 101 insertions(+)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 29d4f633b0..8208171f92 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2505,11 +2505,100 @@ int vfio_populate_vga(VFIOPCIDevice *vdev, Error=
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
+    char *fault_region_name =3D NULL;
+    uint32_t max_version;
+    ssize_t bytes;
+    int ret;
+
+    /* Producer Fault Region */
+    ret =3D vfio_get_dev_region_info(&vdev->vbasedev,
+                                   VFIO_REGION_TYPE_NESTED,
+                                   VFIO_REGION_SUBTYPE_NESTED_FAULT_PROD=
,
+                                   &fault_region_info);
+    if (!ret) {
+        hdr =3D vfio_get_region_info_cap(fault_region_info,
+                                       VFIO_REGION_INFO_CAP_PRODUCER_FAU=
LT);
+        if (!hdr) {
+            error_setg(errp, "failed to retrieve fault ABI max version")=
;
+            g_free(fault_region_info);
+            return;
+        }
+        cap_fault =3D container_of(hdr, struct vfio_region_info_cap_faul=
t,
+                                 header);
+        max_version =3D cap_fault->version;
+
+        fault_region_name =3D g_strdup_printf("%s FAULT PROD %d",
+                                            vbasedev->name,
+                                            fault_region_info->index);
+
+        ret =3D vfio_region_setup(OBJECT(vdev), vbasedev,
+                                &vdev->fault_prod_region,
+                                fault_region_info->index,
+                                fault_region_name);
+        if (ret) {
+            error_setg_errno(errp, -ret,
+                             "failed to setup the fault prod region %d",
+                             fault_region_info->index);
+            goto out;
+        }
+
+        ret =3D vfio_region_mmap(&vdev->fault_prod_region);
+        if (ret) {
+            error_report("Failed to mmap fault queue(%d)", ret);
+        }
+
+        g_free(fault_region_info);
+        g_free(fault_region_name);
+    } else {
+        goto out;
+    }
+
+    /* Consumer Fault Region */
+    ret =3D vfio_get_dev_region_info(&vdev->vbasedev,
+                                   VFIO_REGION_TYPE_NESTED,
+                                   VFIO_REGION_SUBTYPE_NESTED_FAULT_CONS=
,
+                                   &fault_region_info);
+    if (!ret) {
+        fault_region_name =3D g_strdup_printf("%s FAULT CONS %d",
+                                            vbasedev->name,
+                                            fault_region_info->index);
+
+        ret =3D vfio_region_setup(OBJECT(vdev), vbasedev,
+                                &vdev->fault_cons_region,
+                                fault_region_info->index,
+                                fault_region_name);
+        if (ret) {
+            error_setg_errno(errp, -ret,
+                             "failed to setup the fault cons region %d",
+                             fault_region_info->index);
+        }
+
+        /* Set the chosen fault ABI version in the consume header*/
+        bytes =3D pwrite(vdev->vbasedev.fd, &max_version, 4,
+                       vdev->fault_cons_region.fd_offset);
+        if (bytes !=3D 4) {
+            error_setg(errp,
+                       "Unable to set the chosen fault ABI version (%d)"=
,
+                       max_version);
+        }
+    }
+out:
+    g_free(fault_region_name);
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
@@ -2573,6 +2662,12 @@ static void vfio_populate_device(VFIOPCIDevice *vd=
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
@@ -3105,6 +3200,8 @@ static void vfio_instance_finalize(Object *obj)
=20
     vfio_display_finalize(vdev);
     vfio_bars_finalize(vdev);
+    vfio_region_finalize(&vdev->fault_prod_region);
+    vfio_region_finalize(&vdev->fault_cons_region);
     g_free(vdev->emulated_config_bits);
     g_free(vdev->rom);
     /*
@@ -3125,6 +3222,8 @@ static void vfio_exitfn(PCIDevice *pdev)
     vfio_unregister_req_notifier(vdev);
     vfio_unregister_err_notifier(vdev);
     vfio_unregister_dma_fault_notifier(vdev);
+    vfio_region_exit(&vdev->fault_prod_region);
+    vfio_region_exit(&vdev->fault_cons_region);
     pci_device_set_intx_routing_notifier(&vdev->pdev, NULL);
     vfio_disable_interrupts(vdev);
     if (vdev->intx.mmap_timer) {
diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index 96d29d667b..ee64081b47 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -136,6 +136,8 @@ typedef struct VFIOPCIDevice {
     EventNotifier err_notifier;
     EventNotifier req_notifier;
     EventNotifier dma_fault_notifier;
+    VFIORegion fault_prod_region;
+    VFIORegion fault_cons_region;
     int (*resetfn)(struct VFIOPCIDevice *);
     uint32_t vendor_id;
     uint32_t device_id;
--=20
2.20.1


