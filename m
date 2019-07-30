Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 574797B00B
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jul 2019 19:32:39 +0200 (CEST)
Received: from localhost ([::1]:35004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsVzK-0003tb-Hx
	for lists+qemu-devel@lfdr.de; Tue, 30 Jul 2019 13:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33030)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hsVqs-0002y8-Rf
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 13:23:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hsVqr-0001Xv-HY
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 13:23:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45132)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hsVqi-0001Sr-Tw; Tue, 30 Jul 2019 13:23:45 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9C67C3C93;
 Tue, 30 Jul 2019 17:23:43 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-49.ams2.redhat.com [10.36.116.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 99F7A60BE5;
 Tue, 30 Jul 2019 17:23:38 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, peter.maydell@linaro.org,
 alex.williamson@redhat.com, jean-philippe@linaro.org, kevin.tian@intel.com
Date: Tue, 30 Jul 2019 19:21:36 +0200
Message-Id: <20190730172137.23114-15-eric.auger@redhat.com>
In-Reply-To: <20190730172137.23114-1-eric.auger@redhat.com>
References: <20190730172137.23114-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Tue, 30 Jul 2019 17:23:43 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH for-4.2 v10 14/15] virtio-iommu-pci: Add virtio
 iommu pci support
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
Cc: tn@semihalf.com, bharat.bhushan@nxp.com, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds virtio-iommu-pci, which is the pci proxy for
the virtio-iommu device.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v8 -> v9:
- add the msi-bypass property
- create virtio-iommu-pci.c
---
 hw/virtio/Makefile.objs          |  1 +
 hw/virtio/virtio-iommu-pci.c     | 88 ++++++++++++++++++++++++++++++++
 include/hw/pci/pci.h             |  1 +
 include/hw/virtio/virtio-iommu.h |  1 +
 qdev-monitor.c                   |  1 +
 5 files changed, 92 insertions(+)
 create mode 100644 hw/virtio/virtio-iommu-pci.c

diff --git a/hw/virtio/Makefile.objs b/hw/virtio/Makefile.objs
index f42e4dd94f..80ca719f1c 100644
--- a/hw/virtio/Makefile.objs
+++ b/hw/virtio/Makefile.objs
@@ -27,6 +27,7 @@ obj-$(CONFIG_VIRTIO_INPUT_HOST) +=3D virtio-input-host-=
pci.o
 obj-$(CONFIG_VIRTIO_INPUT) +=3D virtio-input-pci.o
 obj-$(CONFIG_VIRTIO_RNG) +=3D virtio-rng-pci.o
 obj-$(CONFIG_VIRTIO_BALLOON) +=3D virtio-balloon-pci.o
+obj-$(CONFIG_VIRTIO_IOMMU) +=3D virtio-iommu-pci.o
 obj-$(CONFIG_VIRTIO_9P) +=3D virtio-9p-pci.o
 obj-$(CONFIG_VIRTIO_SCSI) +=3D virtio-scsi-pci.o
 obj-$(CONFIG_VIRTIO_BLK) +=3D virtio-blk-pci.o
diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
new file mode 100644
index 0000000000..f9977096bd
--- /dev/null
+++ b/hw/virtio/virtio-iommu-pci.c
@@ -0,0 +1,88 @@
+/*
+ * Virtio IOMMU PCI Bindings
+ *
+ * Copyright (c) 2019 Red Hat, Inc.
+ * Written by Eric Auger
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License version 2 or
+ *  (at your option) any later version.
+ */
+
+#include "qemu/osdep.h"
+
+#include "virtio-pci.h"
+#include "hw/virtio/virtio-iommu.h"
+
+typedef struct VirtIOIOMMUPCI VirtIOIOMMUPCI;
+
+/*
+ * virtio-iommu-pci: This extends VirtioPCIProxy.
+ *
+ */
+#define VIRTIO_IOMMU_PCI(obj) \
+        OBJECT_CHECK(VirtIOIOMMUPCI, (obj), TYPE_VIRTIO_IOMMU_PCI)
+
+struct VirtIOIOMMUPCI {
+    VirtIOPCIProxy parent_obj;
+    VirtIOIOMMU vdev;
+};
+
+static Property virtio_iommu_pci_properties[] =3D {
+    DEFINE_PROP_UINT32("class", VirtIOPCIProxy, class_code, 0),
+    DEFINE_PROP_BOOL("msi-bypass", VirtIOIOMMUPCI, vdev.msi_bypass, true=
),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **e=
rrp)
+{
+    VirtIOIOMMUPCI *dev =3D VIRTIO_IOMMU_PCI(vpci_dev);
+    DeviceState *vdev =3D DEVICE(&dev->vdev);
+
+    qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus));
+    object_property_set_link(OBJECT(dev),
+                             OBJECT(pci_get_bus(&vpci_dev->pci_dev)),
+                             "primary-bus", errp);
+    object_property_set_bool(OBJECT(vdev), true, "realized", errp);
+}
+
+static void virtio_iommu_pci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    VirtioPCIClass *k =3D VIRTIO_PCI_CLASS(klass);
+    PCIDeviceClass *pcidev_k =3D PCI_DEVICE_CLASS(klass);
+    k->realize =3D virtio_iommu_pci_realize;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    dc->props =3D virtio_iommu_pci_properties;
+    pcidev_k->vendor_id =3D PCI_VENDOR_ID_REDHAT_QUMRANET;
+    pcidev_k->device_id =3D PCI_DEVICE_ID_VIRTIO_IOMMU;
+    pcidev_k->revision =3D VIRTIO_PCI_ABI_VERSION;
+    pcidev_k->class_id =3D PCI_CLASS_OTHERS;
+}
+
+static void virtio_iommu_pci_instance_init(Object *obj)
+{
+    VirtIOIOMMUPCI *dev =3D VIRTIO_IOMMU_PCI(obj);
+
+    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
+                                TYPE_VIRTIO_IOMMU);
+}
+
+static const VirtioPCIDeviceTypeInfo virtio_iommu_pci_info =3D {
+    .base_name             =3D TYPE_VIRTIO_IOMMU_PCI,
+    .generic_name          =3D "virtio-iommu-pci",
+    .transitional_name     =3D "virtio-iommu-pci-transitional",
+    .non_transitional_name =3D "virtio-iommu-pci-non-transitional",
+    .instance_size =3D sizeof(VirtIOIOMMUPCI),
+    .instance_init =3D virtio_iommu_pci_instance_init,
+    .class_init    =3D virtio_iommu_pci_class_init,
+};
+
+static void virtio_iommu_pci_register(void)
+{
+    virtio_pci_types_register(&virtio_iommu_pci_info);
+}
+
+type_init(virtio_iommu_pci_register)
+
+
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index aaf1b9f70d..492ea7e68d 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -86,6 +86,7 @@ extern bool pci_available;
 #define PCI_DEVICE_ID_VIRTIO_9P          0x1009
 #define PCI_DEVICE_ID_VIRTIO_VSOCK       0x1012
 #define PCI_DEVICE_ID_VIRTIO_PMEM        0x1013
+#define PCI_DEVICE_ID_VIRTIO_IOMMU       0x1014
=20
 #define PCI_VENDOR_ID_REDHAT             0x1b36
 #define PCI_DEVICE_ID_REDHAT_BRIDGE      0x0001
diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-=
iommu.h
index 56c8b4e57f..893ac65c0b 100644
--- a/include/hw/virtio/virtio-iommu.h
+++ b/include/hw/virtio/virtio-iommu.h
@@ -25,6 +25,7 @@
 #include "hw/pci/pci.h"
=20
 #define TYPE_VIRTIO_IOMMU "virtio-iommu-device"
+#define TYPE_VIRTIO_IOMMU_PCI "virtio-iommu-device-base"
 #define VIRTIO_IOMMU(obj) \
         OBJECT_CHECK(VirtIOIOMMU, (obj), TYPE_VIRTIO_IOMMU)
=20
diff --git a/qdev-monitor.c b/qdev-monitor.c
index 58222c2211..74cf090c61 100644
--- a/qdev-monitor.c
+++ b/qdev-monitor.c
@@ -63,6 +63,7 @@ static const QDevAlias qdev_alias_table[] =3D {
     { "virtio-input-host-ccw", "virtio-input-host", QEMU_ARCH_S390X },
     { "virtio-input-host-pci", "virtio-input-host",
             QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
+    { "virtio-iommu-pci", "virtio-iommu", QEMU_ARCH_ALL & ~QEMU_ARCH_S39=
0X },
     { "virtio-keyboard-ccw", "virtio-keyboard", QEMU_ARCH_S390X },
     { "virtio-keyboard-pci", "virtio-keyboard",
             QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
--=20
2.20.1


