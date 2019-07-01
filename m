Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BC027B0F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 12:50:25 +0200 (CEST)
Received: from localhost ([127.0.0.1]:33467 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTlIm-0000cm-UE
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 06:50:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49996)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pagupta@redhat.com>) id 1hTkwI-0006ks-BP
	for qemu-devel@nongnu.org; Thu, 23 May 2019 06:27:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pagupta@redhat.com>) id 1hTkwG-0002Np-WB
	for qemu-devel@nongnu.org; Thu, 23 May 2019 06:27:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36350)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pagupta@redhat.com>) id 1hTkwG-0002Na-Pk
	for qemu-devel@nongnu.org; Thu, 23 May 2019 06:27:08 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0382B307D960;
	Thu, 23 May 2019 10:27:08 +0000 (UTC)
Received: from dhcp201-121.englab.pnq.redhat.com (ovpn-116-162.sin2.redhat.com
	[10.67.116.162])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 241AC6606C;
	Thu, 23 May 2019 10:26:46 +0000 (UTC)
From: Pankaj Gupta <pagupta@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 23 May 2019 15:54:46 +0530
Message-Id: <20190523102449.2642-5-pagupta@redhat.com>
In-Reply-To: <20190523102449.2642-1-pagupta@redhat.com>
References: <20190523102449.2642-1-pagupta@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Thu, 23 May 2019 10:27:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 4/7] virtio-pci: Proxy for virtio-pmem
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
Cc: kwolf@redhat.com, aarcange@redhat.com, cohuck@redhat.com,
	xiaoguangrong.eric@gmail.com, mst@redhat.com, pagupta@redhat.com,
	riel@surriel.com, david@redhat.com, armbru@redhat.com,
	ehabkost@redhat.com, lcapitulino@redhat.com, stefanha@redhat.com,
	pbonzini@redhat.com, imammedo@redhat.com,
	dan.j.williams@intel.com, nilal@redhat.com, dgilbert@redhat.com,
	rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We need a proxy device for virtio-pmem, and this device has to be the
actual memory device so we can cleanly hotplug it.

Forward memory device class functions either to the actual device or use
properties of the virtio-pmem device to implement these in the proxy.

virtio-pmem will only be compiled for selected, supported architectures
(that can deal with virtio/pci devices being memory devices). An
architecture that is prepared for that can simply enable
CONFIG_VIRTIO_PMEM to make it work.

As not all architectures support memory devices (and CONFIG_VIRTIO_PMEM
will be enabled per supported architecture), we have to move the PCI proxy
to a separate file.

Signed-off-by: Pankaj Gupta <pagupta@redhat.com>
[ split up patches, memory-device changes, move pci proxy]
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/virtio/Makefile.objs     |   1 +
 hw/virtio/virtio-pmem-pci.c | 131 ++++++++++++++++++++++++++++++++++++++++++++
 hw/virtio/virtio-pmem-pci.h |  34 ++++++++++++
 include/hw/pci/pci.h        |   1 +
 4 files changed, 167 insertions(+)
 create mode 100644 hw/virtio/virtio-pmem-pci.c
 create mode 100644 hw/virtio/virtio-pmem-pci.h

diff --git a/hw/virtio/Makefile.objs b/hw/virtio/Makefile.objs
index 5857e3b8e1..964ce78607 100644
--- a/hw/virtio/Makefile.objs
+++ b/hw/virtio/Makefile.objs
@@ -13,6 +13,7 @@ obj-$(CONFIG_VIRTIO_BALLOON) += virtio-balloon.o
 obj-$(CONFIG_VIRTIO_CRYPTO) += virtio-crypto.o
 obj-$(call land,$(CONFIG_VIRTIO_CRYPTO),$(CONFIG_VIRTIO_PCI)) += virtio-crypto-pci.o
 obj-$(CONFIG_VIRTIO_PMEM) += virtio-pmem.o
+common-obj-$(call land,$(CONFIG_VIRTIO_PMEM),$(CONFIG_VIRTIO_PCI)) += virtio-pmem-pci.o
 obj-$(CONFIG_VHOST_VSOCK) += vhost-vsock.o
 
 ifeq ($(CONFIG_VIRTIO_PCI),y)
diff --git a/hw/virtio/virtio-pmem-pci.c b/hw/virtio/virtio-pmem-pci.c
new file mode 100644
index 0000000000..8b2d0dbccc
--- /dev/null
+++ b/hw/virtio/virtio-pmem-pci.c
@@ -0,0 +1,131 @@
+/*
+ * Virtio PMEM PCI device
+ *
+ * Copyright (C) 2018-2019 Red Hat, Inc.
+ *
+ * Authors:
+ *  Pankaj Gupta <pagupta@redhat.com>
+ *  David Hildenbrand <david@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+
+#include "virtio-pmem-pci.h"
+#include "hw/mem/memory-device.h"
+#include "qapi/error.h"
+
+static void virtio_pmem_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
+{
+    VirtIOPMEMPCI *pmem_pci = VIRTIO_PMEM_PCI(vpci_dev);
+    DeviceState *vdev = DEVICE(&pmem_pci->vdev);
+
+    qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus));
+    object_property_set_bool(OBJECT(vdev), true, "realized", errp);
+}
+
+static void virtio_pmem_pci_set_addr(MemoryDeviceState *md, uint64_t addr,
+                                     Error **errp)
+{
+    object_property_set_uint(OBJECT(md), addr, VIRTIO_PMEM_ADDR_PROP, errp);
+}
+
+static uint64_t virtio_pmem_pci_get_addr(const MemoryDeviceState *md)
+{
+    return object_property_get_uint(OBJECT(md), VIRTIO_PMEM_ADDR_PROP,
+                                    &error_abort);
+}
+
+static MemoryRegion *virtio_pmem_pci_get_memory_region(MemoryDeviceState *md,
+                                                       Error **errp)
+{
+    VirtIOPMEMPCI *pci_pmem = VIRTIO_PMEM_PCI(md);
+    VirtIOPMEM *pmem = VIRTIO_PMEM(&pci_pmem->vdev);
+    VirtIOPMEMClass *vpc = VIRTIO_PMEM_GET_CLASS(pmem);
+
+    return vpc->get_memory_region(pmem, errp);
+}
+
+static uint64_t virtio_pmem_pci_get_plugged_size(const MemoryDeviceState *md,
+                                                 Error **errp)
+{
+    VirtIOPMEMPCI *pci_pmem = VIRTIO_PMEM_PCI(md);
+    VirtIOPMEM *pmem = VIRTIO_PMEM(&pci_pmem->vdev);
+    VirtIOPMEMClass *vpc = VIRTIO_PMEM_GET_CLASS(pmem);
+    MemoryRegion *mr = vpc->get_memory_region(pmem, errp);
+
+    /* the plugged size corresponds to the region size */
+    return mr ? 0 : memory_region_size(mr);
+}
+
+static void virtio_pmem_pci_fill_device_info(const MemoryDeviceState *md,
+                                             MemoryDeviceInfo *info)
+{
+    VirtioPMEMDeviceInfo *vi = g_new0(VirtioPMEMDeviceInfo, 1);
+    VirtIOPMEMPCI *pci_pmem = VIRTIO_PMEM_PCI(md);
+    VirtIOPMEM *pmem = VIRTIO_PMEM(&pci_pmem->vdev);
+    VirtIOPMEMClass *vpc = VIRTIO_PMEM_GET_CLASS(pmem);
+    DeviceState *dev = DEVICE(md);
+
+    if (dev->id) {
+        vi->has_id = true;
+        vi->id = g_strdup(dev->id);
+    }
+
+    /* let the real device handle everything else */
+    vpc->fill_device_info(pmem, vi);
+
+    info->u.virtio_pmem.data = vi;
+    info->type = MEMORY_DEVICE_INFO_KIND_VIRTIO_PMEM;
+}
+
+static void virtio_pmem_pci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    VirtioPCIClass *k = VIRTIO_PCI_CLASS(klass);
+    PCIDeviceClass *pcidev_k = PCI_DEVICE_CLASS(klass);
+    MemoryDeviceClass *mdc = MEMORY_DEVICE_CLASS(klass);
+
+    k->realize = virtio_pmem_pci_realize;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    pcidev_k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
+    pcidev_k->device_id = PCI_DEVICE_ID_VIRTIO_PMEM;
+    pcidev_k->revision = VIRTIO_PCI_ABI_VERSION;
+    pcidev_k->class_id = PCI_CLASS_OTHERS;
+
+    mdc->get_addr = virtio_pmem_pci_get_addr;
+    mdc->set_addr = virtio_pmem_pci_set_addr;
+    mdc->get_plugged_size = virtio_pmem_pci_get_plugged_size;
+    mdc->get_memory_region = virtio_pmem_pci_get_memory_region;
+    mdc->fill_device_info = virtio_pmem_pci_fill_device_info;
+}
+
+static void virtio_pmem_pci_instance_init(Object *obj)
+{
+    VirtIOPMEMPCI *dev = VIRTIO_PMEM_PCI(obj);
+
+    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
+                                TYPE_VIRTIO_PMEM);
+}
+
+static const VirtioPCIDeviceTypeInfo virtio_pmem_pci_info = {
+    .base_name             = TYPE_VIRTIO_PMEM_PCI,
+    .generic_name          = "virtio-pmem-pci",
+    .transitional_name     = "virtio-pmem-pci-transitional",
+    .non_transitional_name = "virtio-pmem-pci-non-transitional",
+    .instance_size = sizeof(VirtIOPMEMPCI),
+    .instance_init = virtio_pmem_pci_instance_init,
+    .class_init    = virtio_pmem_pci_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_MEMORY_DEVICE },
+        { }
+    },
+};
+
+static void virtio_pmem_pci_register_types(void)
+{
+    virtio_pci_types_register(&virtio_pmem_pci_info);
+}
+type_init(virtio_pmem_pci_register_types)
diff --git a/hw/virtio/virtio-pmem-pci.h b/hw/virtio/virtio-pmem-pci.h
new file mode 100644
index 0000000000..616abef093
--- /dev/null
+++ b/hw/virtio/virtio-pmem-pci.h
@@ -0,0 +1,34 @@
+/*
+ * Virtio PMEM PCI device
+ *
+ * Copyright (C) 2018-2019 Red Hat, Inc.
+ *
+ * Authors:
+ *  Pankaj Gupta <pagupta@redhat.com>
+ *  David Hildenbrand <david@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef QEMU_VIRTIO_PMEM_PCI_H
+#define QEMU_VIRTIO_PMEM_PCI_H
+
+#include "hw/virtio/virtio-pci.h"
+#include "hw/virtio/virtio-pmem.h"
+
+typedef struct VirtIOPMEMPCI VirtIOPMEMPCI;
+
+/*
+ * virtio-pmem-pci: This extends VirtioPCIProxy.
+ */
+#define TYPE_VIRTIO_PMEM_PCI "virtio-pmem-pci-base"
+#define VIRTIO_PMEM_PCI(obj) \
+        OBJECT_CHECK(VirtIOPMEMPCI, (obj), TYPE_VIRTIO_PMEM_PCI)
+
+struct VirtIOPMEMPCI {
+    VirtIOPCIProxy parent_obj;
+    VirtIOPMEM vdev;
+};
+
+#endif /* QEMU_VIRTIO_PMEM_PCI_H */
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index edf44de21d..097feb2cb7 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -85,6 +85,7 @@ extern bool pci_available;
 #define PCI_DEVICE_ID_VIRTIO_RNG         0x1005
 #define PCI_DEVICE_ID_VIRTIO_9P          0x1009
 #define PCI_DEVICE_ID_VIRTIO_VSOCK       0x1012
+#define PCI_DEVICE_ID_VIRTIO_PMEM        0x1013
 
 #define PCI_VENDOR_ID_REDHAT             0x1b36
 #define PCI_DEVICE_ID_REDHAT_BRIDGE      0x0001
-- 
2.14.5


