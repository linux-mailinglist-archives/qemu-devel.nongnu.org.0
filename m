Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CA848A1FD
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 22:35:22 +0100 (CET)
Received: from localhost ([::1]:37434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n72K0-0005uQ-Ac
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 16:35:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n726A-0005q5-Ln
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 16:21:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n7268-0006vO-8D
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 16:21:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641849659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TZb2VsF62mI0M1Q9ahfJZ0AlbNFKBIaYPyokRyFEQ58=;
 b=QB0j0GZH94hUpCocKGXUfHNi/m+fOAWR+/egLJjUSzy3ynE4cwqmOio63uYCQ/Jt8leQ2D
 hp1bQnOI3ZXMvqsNlWlaDnAbGc5lSt6N/N44zo8Nko8K5AE2E5E7TZfh/7Ybuo+m+UewJW
 CCUAXeIlkNQSNiG4uBLMT1EceOEBohY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-gtXP8IYlNBW10U78FE2DoA-1; Mon, 10 Jan 2022 16:20:55 -0500
X-MC-Unique: gtXP8IYlNBW10U78FE2DoA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 628442F25;
 Mon, 10 Jan 2022 21:20:54 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.194.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A451EA18BF;
 Mon, 10 Jan 2022 21:20:51 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, thuth@redhat.com,
 pbonzini@redhat.com, lvivier@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 david@gibson.dropbear.id.au, clg@kaod.org
Subject: [PATCH 6/6] tests/qtest/libqos: Add pci-arm and add a pci-arm
 producer in arm-virt machine
Date: Mon, 10 Jan 2022 22:19:15 +0100
Message-Id: <20220110211915.2749082-7-eric.auger@redhat.com>
In-Reply-To: <20220110211915.2749082-1-eric.auger@redhat.com>
References: <20220110211915.2749082-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: jean-philippe@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Up to now the virt-machine node contains a virtio-mmio node.
However no driver produces any PCI interface node. Hence, PCI
tests cannot be run with aarch64 binary.

Add a GPEX driver node that produces a pci interface node. This latter
then can be consumed by all the pci tests. One of the first motivation
was to be able to run the virtio-iommu-pci tests.

We still face an issue with pci hotplug tests as hotplug cannot happen
on the pcie root bus and require a generic root port. This will be
addressed later on.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 tests/qtest/libqos/arm-virt-machine.c |  47 +++++-
 tests/qtest/libqos/meson.build        |   3 +
 tests/qtest/libqos/pci-arm.c          | 219 ++++++++++++++++++++++++++
 tests/qtest/libqos/pci-arm.h          |  56 +++++++
 tests/qtest/libqos/pci.h              |   1 +
 tests/qtest/libqos/qgraph.c           |   7 +
 tests/qtest/libqos/qgraph.h           |  15 ++
 7 files changed, 344 insertions(+), 4 deletions(-)
 create mode 100644 tests/qtest/libqos/pci-arm.c
 create mode 100644 tests/qtest/libqos/pci-arm.h

diff --git a/tests/qtest/libqos/arm-virt-machine.c b/tests/qtest/libqos/arm-virt-machine.c
index e0f59322845..130c45c51e2 100644
--- a/tests/qtest/libqos/arm-virt-machine.c
+++ b/tests/qtest/libqos/arm-virt-machine.c
@@ -22,6 +22,8 @@
 #include "malloc.h"
 #include "qgraph.h"
 #include "virtio-mmio.h"
+#include "pci-arm.h"
+#include "hw/pci/pci_regs.h"
 
 #define ARM_PAGE_SIZE               4096
 #define VIRTIO_MMIO_BASE_ADDR       0x0A003E00
@@ -30,13 +32,40 @@
 #define VIRTIO_MMIO_SIZE            0x00000200
 
 typedef struct QVirtMachine QVirtMachine;
+typedef struct QGenericPCIHost QGenericPCIHost;
+
+struct QGenericPCIHost {
+    QOSGraphObject obj;
+    QPCIBusARM pci;
+};
 
 struct QVirtMachine {
     QOSGraphObject obj;
     QGuestAllocator alloc;
     QVirtioMMIODevice virtio_mmio;
+    QGenericPCIHost bridge;
 };
 
+/* QGenericPCIHost */
+
+static QOSGraphObject *generic_pcihost_get_device(void *obj, const char *device)
+{
+    QGenericPCIHost *host = obj;
+    if (!g_strcmp0(device, "pci-bus-arm")) {
+        return &host->pci.obj;
+    }
+    fprintf(stderr, "%s not present in generic-pcihost\n", device);
+    g_assert_not_reached();
+}
+
+static void qos_create_generic_pcihost(QGenericPCIHost *host,
+                                       QTestState *qts,
+                                       QGuestAllocator *alloc)
+{
+    host->obj.get_device = generic_pcihost_get_device;
+    qpci_init_arm(&host->pci, qts, alloc, false);
+}
+
 static void virt_destructor(QOSGraphObject *obj)
 {
     QVirtMachine *machine = (QVirtMachine *) obj;
@@ -57,11 +86,13 @@ static void *virt_get_driver(void *object, const char *interface)
 static QOSGraphObject *virt_get_device(void *obj, const char *device)
 {
     QVirtMachine *machine = obj;
-    if (!g_strcmp0(device, "virtio-mmio")) {
+    if (!g_strcmp0(device, "generic-pcihost")) {
+        return &machine->bridge.obj;
+    } else if (!g_strcmp0(device, "virtio-mmio")) {
         return &machine->virtio_mmio.obj;
     }
 
-    fprintf(stderr, "%s not present in arm/virtio\n", device);
+    fprintf(stderr, "%s not present in arm/virt\n", device);
     g_assert_not_reached();
 }
 
@@ -76,16 +107,24 @@ static void *qos_create_machine_arm_virt(QTestState *qts)
     qvirtio_mmio_init_device(&machine->virtio_mmio, qts, VIRTIO_MMIO_BASE_ADDR,
                              VIRTIO_MMIO_SIZE);
 
+    qos_create_generic_pcihost(&machine->bridge, qts, &machine->alloc);
+
     machine->obj.get_device = virt_get_device;
     machine->obj.get_driver = virt_get_driver;
     machine->obj.destructor = virt_destructor;
     return machine;
 }
 
-static void virtio_mmio_register_nodes(void)
+static void virt_machine_register_nodes(void)
 {
     qos_node_create_machine("arm/virt", qos_create_machine_arm_virt);
     qos_node_contains("arm/virt", "virtio-mmio", NULL);
+
+    qos_node_create_machine("aarch64/virt", qos_create_machine_arm_virt);
+    qos_node_contains("aarch64/virt", "generic-pcihost", NULL);
+
+    qos_node_create_driver("generic-pcihost", NULL);
+    qos_node_contains("generic-pcihost", "pci-bus-arm", NULL);
 }
 
-libqos_init(virtio_mmio_register_nodes);
+libqos_init(virt_machine_register_nodes);
diff --git a/tests/qtest/libqos/meson.build b/tests/qtest/libqos/meson.build
index e988d157917..af1bc723737 100644
--- a/tests/qtest/libqos/meson.build
+++ b/tests/qtest/libqos/meson.build
@@ -19,6 +19,9 @@ libqos_srcs = files('../libqtest.c',
         'libqos-pc.c',
         'ahci.c',
 
+        # arm
+        'pci-arm.c',
+
         # usb
         'usb.c',
 
diff --git a/tests/qtest/libqos/pci-arm.c b/tests/qtest/libqos/pci-arm.c
new file mode 100644
index 00000000000..64d826bb3c7
--- /dev/null
+++ b/tests/qtest/libqos/pci-arm.c
@@ -0,0 +1,219 @@
+/*
+ * libqos PCI bindings for ARM
+ *
+ * Copyright Red Hat Inc., 2021
+ *
+ * Authors:
+ *  Eric Auger   <eric.auger@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest.h"
+#include "pci-arm.h"
+#include "qapi/qmp/qdict.h"
+#include "hw/pci/pci_regs.h"
+
+#include "qemu/module.h"
+
+static uint8_t qpci_arm_pio_readb(QPCIBus *bus, uint32_t addr)
+{
+    QPCIBusARM *s = container_of(bus, QPCIBusARM, bus);
+
+    return qtest_readb(bus->qts, s->gpex_pio_base + addr);
+}
+
+static void qpci_arm_pio_writeb(QPCIBus *bus, uint32_t addr, uint8_t val)
+{
+    QPCIBusARM *s = container_of(bus, QPCIBusARM, bus);
+
+    qtest_writeb(bus->qts, s->gpex_pio_base + addr,  val);
+}
+
+static uint16_t qpci_arm_pio_readw(QPCIBus *bus, uint32_t addr)
+{
+    QPCIBusARM *s = container_of(bus, QPCIBusARM, bus);
+
+    return qtest_readw(bus->qts, s->gpex_pio_base + addr);
+}
+
+static void qpci_arm_pio_writew(QPCIBus *bus, uint32_t addr, uint16_t val)
+{
+    QPCIBusARM *s = container_of(bus, QPCIBusARM, bus);
+
+    qtest_writew(bus->qts, s->gpex_pio_base + addr, val);
+}
+
+static uint32_t qpci_arm_pio_readl(QPCIBus *bus, uint32_t addr)
+{
+    QPCIBusARM *s = container_of(bus, QPCIBusARM, bus);
+
+    return qtest_readl(bus->qts, s->gpex_pio_base + addr);
+}
+
+static void qpci_arm_pio_writel(QPCIBus *bus, uint32_t addr, uint32_t val)
+{
+    QPCIBusARM *s = container_of(bus, QPCIBusARM, bus);
+
+    qtest_writel(bus->qts, s->gpex_pio_base + addr, val);
+}
+
+static uint64_t qpci_arm_pio_readq(QPCIBus *bus, uint32_t addr)
+{
+    QPCIBusARM *s = container_of(bus, QPCIBusARM, bus);
+
+    return qtest_readq(bus->qts, s->gpex_pio_base + addr);
+}
+
+static void qpci_arm_pio_writeq(QPCIBus *bus, uint32_t addr, uint64_t val)
+{
+    QPCIBusARM *s = container_of(bus, QPCIBusARM, bus);
+
+    qtest_writeq(bus->qts, s->gpex_pio_base + addr, val);
+}
+
+static void qpci_arm_memread(QPCIBus *bus, uint32_t addr, void *buf, size_t len)
+{
+    qtest_memread(bus->qts, addr, buf, len);
+}
+
+static void qpci_arm_memwrite(QPCIBus *bus, uint32_t addr,
+                             const void *buf, size_t len)
+{
+    qtest_memwrite(bus->qts, addr, buf, len);
+}
+
+static uint8_t qpci_arm_config_readb(QPCIBus *bus, int devfn, uint8_t offset)
+{
+    uint64_t addr = bus->ecam_alloc_ptr + ((0 << 20) | (devfn << 12) | offset);
+    uint8_t val;
+
+    qtest_memread(bus->qts, addr, &val, 1);
+    return val;
+}
+
+static uint16_t qpci_arm_config_readw(QPCIBus *bus, int devfn, uint8_t offset)
+{
+    uint64_t addr = bus->ecam_alloc_ptr + ((0 << 20) | (devfn << 12) | offset);
+    uint16_t val;
+
+    qtest_memread(bus->qts, addr, &val, 2);
+    return val;
+}
+
+static uint32_t qpci_arm_config_readl(QPCIBus *bus, int devfn, uint8_t offset)
+{
+    uint64_t addr = bus->ecam_alloc_ptr + ((0 << 20) | (devfn << 12) | offset);
+    uint32_t val;
+
+    qtest_memread(bus->qts, addr, &val, 4);
+    return val;
+}
+
+static void
+qpci_arm_config_writeb(QPCIBus *bus, int devfn, uint8_t offset, uint8_t value)
+{
+    uint64_t addr = bus->ecam_alloc_ptr + ((0 << 20) | (devfn << 12) | offset);
+    uint32_t val = value;
+
+    qtest_memwrite(bus->qts, addr, &val, 1);
+}
+
+static void
+qpci_arm_config_writew(QPCIBus *bus, int devfn, uint8_t offset, uint16_t value)
+{
+    uint64_t addr = bus->ecam_alloc_ptr + ((0 << 20) | (devfn << 12) | offset);
+    uint32_t val = value;
+
+    qtest_memwrite(bus->qts, addr, &val, 2);
+}
+
+static void
+qpci_arm_config_writel(QPCIBus *bus, int devfn, uint8_t offset, uint32_t value)
+{
+    uint64_t addr = bus->ecam_alloc_ptr + ((0 << 20) | (devfn << 12) | offset);
+    uint32_t val = value;
+
+    qtest_memwrite(bus->qts, addr, &val, 4);
+}
+
+static void *qpci_arm_get_driver(void *obj, const char *interface)
+{
+    QPCIBusARM *qpci = obj;
+    if (!g_strcmp0(interface, "pci-bus")) {
+        return &qpci->bus;
+    }
+    fprintf(stderr, "%s not present in pci-bus-arm\n", interface);
+    g_assert_not_reached();
+}
+
+void qpci_init_arm(QPCIBusARM *qpci, QTestState *qts,
+                   QGuestAllocator *alloc, bool hotpluggable)
+{
+    assert(qts);
+
+    qpci->gpex_pio_base = 0x3eff0000;
+    qpci->bus.not_hotpluggable = !hotpluggable;
+    qpci->bus.has_buggy_msi = false;
+
+    qpci->bus.pio_readb = qpci_arm_pio_readb;
+    qpci->bus.pio_readw = qpci_arm_pio_readw;
+    qpci->bus.pio_readl = qpci_arm_pio_readl;
+    qpci->bus.pio_readq = qpci_arm_pio_readq;
+
+    qpci->bus.pio_writeb = qpci_arm_pio_writeb;
+    qpci->bus.pio_writew = qpci_arm_pio_writew;
+    qpci->bus.pio_writel = qpci_arm_pio_writel;
+    qpci->bus.pio_writeq = qpci_arm_pio_writeq;
+
+    qpci->bus.memread = qpci_arm_memread;
+    qpci->bus.memwrite = qpci_arm_memwrite;
+
+    qpci->bus.config_readb = qpci_arm_config_readb;
+    qpci->bus.config_readw = qpci_arm_config_readw;
+    qpci->bus.config_readl = qpci_arm_config_readl;
+
+    qpci->bus.config_writeb = qpci_arm_config_writeb;
+    qpci->bus.config_writew = qpci_arm_config_writew;
+    qpci->bus.config_writel = qpci_arm_config_writel;
+
+    qpci->bus.qts = qts;
+    qpci->bus.pio_alloc_ptr = 0x0000;
+    qpci->bus.pio_limit = 0x10000;
+    qpci->bus.mmio_alloc_ptr = 0x10000000;
+    qpci->bus.mmio_limit = 0x2eff0000;
+    qpci->bus.ecam_alloc_ptr = 0x4010000000;
+
+    qpci->obj.get_driver = qpci_arm_get_driver;
+}
+
+QPCIBus *qpci_new_arm(QTestState *qts, QGuestAllocator *alloc,
+                      bool hotpluggable)
+{
+    QPCIBusARM *qpci = g_new0(QPCIBusARM, 1);
+    qpci_init_arm(qpci, qts, alloc, hotpluggable);
+
+    return &qpci->bus;
+}
+
+void qpci_free_arm(QPCIBus *bus)
+{
+    QPCIBusARM *s;
+
+    if (!bus) {
+        return;
+    }
+    s = container_of(bus, QPCIBusARM, bus);
+
+    g_free(s);
+}
+
+static void qpci_arm_register_nodes(void)
+{
+    qos_node_create_driver("pci-bus-arm", NULL);
+    qos_node_produces_opts("pci-bus-arm", "pci-bus", NULL);
+}
+
+libqos_init(qpci_arm_register_nodes);
diff --git a/tests/qtest/libqos/pci-arm.h b/tests/qtest/libqos/pci-arm.h
new file mode 100644
index 00000000000..8cd49ec2969
--- /dev/null
+++ b/tests/qtest/libqos/pci-arm.h
@@ -0,0 +1,56 @@
+/*
+ * libqos PCI bindings for ARM
+ *
+ * Copyright Red Hat Inc., 2021
+ *
+ * Authors:
+ *  Eric Auger   <eric.auger@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef LIBQOS_PCI_ARM_H
+#define LIBQOS_PCI_ARM_H
+
+#include "pci.h"
+#include "malloc.h"
+#include "qgraph.h"
+
+typedef struct QPCIBusARM {
+    QOSGraphObject obj;
+    QPCIBus bus;
+    uint64_t gpex_pio_base;
+} QPCIBusARM;
+
+/*
+ * qpci_init_arm():
+ * @ret: A valid QPCIBusARM * pointer
+ * @qts: The %QTestState for this ARM machine
+ * @alloc: A previously initialized @alloc providing memory for @qts
+ * @bool: devices can be hotplugged on this bus
+ *
+ * This function initializes an already allocated
+ * QPCIBusARM object.
+ */
+void qpci_init_arm(QPCIBusARM *ret, QTestState *qts,
+                   QGuestAllocator *alloc, bool hotpluggable);
+
+/*
+ * qpci_arm_new():
+ * @qts: The %QTestState for this ARM machine
+ * @alloc: A previously initialized @alloc providing memory for @qts
+ * @hotpluggable: the pci bus is hotpluggable
+ *
+ * This function creates a new QPCIBusARM object,
+ * and properly initialize its fields.
+ *
+ * Returns the QPCIBus *bus field of a newly
+ * allocated QPCIBusARM.
+ */
+QPCIBus *qpci_new_arm(QTestState *qts, QGuestAllocator *alloc,
+                      bool hotpluggable);
+
+void qpci_free_arm(QPCIBus *bus);
+
+#endif
diff --git a/tests/qtest/libqos/pci.h b/tests/qtest/libqos/pci.h
index 6a28b405221..07393dda4ec 100644
--- a/tests/qtest/libqos/pci.h
+++ b/tests/qtest/libqos/pci.h
@@ -51,6 +51,7 @@ struct QPCIBus {
     QTestState *qts;
     uint64_t pio_alloc_ptr, pio_limit;
     uint64_t mmio_alloc_ptr, mmio_limit;
+    uint64_t ecam_alloc_ptr;
     bool has_buggy_msi; /* TRUE for spapr, FALSE for pci */
     bool not_hotpluggable; /* TRUE if devices cannot be hotplugged */
 
diff --git a/tests/qtest/libqos/qgraph.c b/tests/qtest/libqos/qgraph.c
index 109ff04e1e8..e03fad35241 100644
--- a/tests/qtest/libqos/qgraph.c
+++ b/tests/qtest/libqos/qgraph.c
@@ -667,6 +667,13 @@ void qos_node_produces(const char *producer, const char *interface)
     add_edge(producer, interface, QEDGE_PRODUCES, NULL);
 }
 
+void qos_node_produces_opts(const char *producer, const char *interface,
+                            QOSGraphEdgeOptions *opts)
+{
+    create_interface(interface);
+    add_edge(producer, interface, QEDGE_PRODUCES, opts);
+}
+
 void qos_node_consumes(const char *consumer, const char *interface,
                        QOSGraphEdgeOptions *opts)
 {
diff --git a/tests/qtest/libqos/qgraph.h b/tests/qtest/libqos/qgraph.h
index 871740c0dc8..9879af118d4 100644
--- a/tests/qtest/libqos/qgraph.h
+++ b/tests/qtest/libqos/qgraph.h
@@ -284,6 +284,21 @@ void qos_node_contains(const char *container, const char *contained,
  */
 void qos_node_produces(const char *producer, const char *interface);
 
+/**
+ * qos_node_produces(): creates an edge of type QEDGE_PRODUCES and
+ * adds it to the edge list mapped to @producer in the
+ * edge hash table.
+ * @producer: Source node that "produces"
+ * @interface: Interface node that "is produced"
+ * @ops: Facultative options (see %QOSGraphEdgeOptions
+ *
+ * This edge will have @producer as source and @interface as destination.
+ * It also has the possibility to add an optional @opts
+ * (see %QOSGraphEdgeOptions)
+ */
+void qos_node_produces_opts(const char *producer, const char *interface,
+                            QOSGraphEdgeOptions *opts);
+
 /**
  * qos_node_consumes():  creates an edge of type QEDGE_CONSUMED_BY and
  * adds it to the edge list mapped to @interface in the
-- 
2.26.3


