Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B8449F236
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 05:05:54 +0100 (CET)
Received: from localhost ([::1]:53238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDIWH-0003g0-Qp
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 23:05:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nDIBt-000869-Fj
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:44:49 -0500
Received: from mail.loongson.cn ([114.242.206.163]:40540 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nDIBq-0002M9-Ou
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:44:49 -0500
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxGuCMZvNhWCkFAA--.15604S16; 
 Fri, 28 Jan 2022 11:44:32 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v5 14/30] hw/pci-host: Add ls7a1000 PCIe Host bridge
 support for Loongson3 Platform
Date: Thu, 27 Jan 2022 22:43:56 -0500
Message-Id: <20220128034412.1262452-15-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220128034412.1262452-1-yangxiaojuan@loongson.cn>
References: <20220128034412.1262452-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxGuCMZvNhWCkFAA--.15604S16
X-Coremail-Antispam: 1UD129KBjvJXoW3Xr1xZFW3ZF43WF4xGr4DJwb_yoWfAF13pF
 98C3ZakF48Jay7J393tr9rGF15JFsaka4UAF47uw1IyFZ7C34jyrsF9FWjvrWxGrWqq3W5
 WFWkG3ZrKF4UJw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, richard.henderson@linaro.org,
 Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a model of the PCIe Host Bridge found on a Loongson-5000
processor. It includes a interrupt controller, some interface for
pci and nonpci devices. Mainly emulate part of it that is not
exactly the same as the host and only use part devices for
tcg mode. It support for MSI and MSIX interrupt sources.

For more detailed info about ls7a1000 you can see the doc at
https://github.com/loongson/LoongArch-Documentation/releases/latest/
download/Loongson-7A1000-usermanual-2.00-EN.pdf

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/pci-host/Kconfig        |   4 +
 hw/pci-host/ls7a.c         | 178 +++++++++++++++++++++++++++++++++++++
 hw/pci-host/meson.build    |   1 +
 include/hw/pci-host/ls7a.h |  52 +++++++++++
 include/hw/pci/pci_ids.h   |   3 +
 5 files changed, 238 insertions(+)
 create mode 100644 hw/pci-host/ls7a.c
 create mode 100644 include/hw/pci-host/ls7a.h

diff --git a/hw/pci-host/Kconfig b/hw/pci-host/Kconfig
index 2b5f7d58cc..b02a9d1454 100644
--- a/hw/pci-host/Kconfig
+++ b/hw/pci-host/Kconfig
@@ -77,3 +77,7 @@ config MV64361
     bool
     select PCI
     select I8259
+
+config PCI_EXPRESS_7A
+    bool
+    select PCI_EXPRESS
diff --git a/hw/pci-host/ls7a.c b/hw/pci-host/ls7a.c
new file mode 100644
index 0000000000..eb16b669bb
--- /dev/null
+++ b/hw/pci-host/ls7a.c
@@ -0,0 +1,178 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * QEMU Loongson 7A1000 North Bridge Emulation
+ *
+ * Copyright (C) 2021 Loongson Technology Corporation Limited
+ */
+
+#include "qemu/osdep.h"
+
+#include "hw/pci/pci.h"
+#include "hw/pci/pcie_host.h"
+#include "hw/qdev-properties.h"
+#include "qapi/error.h"
+#include "hw/irq.h"
+#include "hw/pci/pci_bridge.h"
+#include "hw/pci/pci_bus.h"
+#include "sysemu/reset.h"
+#include "hw/pci-host/ls7a.h"
+#include "migration/vmstate.h"
+
+static const VMStateDescription vmstate_ls7a_pcie = {
+    .name = "LS7A_PCI_DEVICE",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_PCI_DEVICE(parent_obj, LS7APCIState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void pci_ls7a_config_write(void *opaque, hwaddr addr,
+                                  uint64_t val, unsigned size)
+{
+    pci_data_write(opaque, addr, val, size);
+}
+
+static uint64_t pci_ls7a_config_read(void *opaque,
+                                     hwaddr addr, unsigned size)
+{
+    uint64_t val;
+
+    val = pci_data_read(opaque, addr, size);
+
+    return val;
+}
+
+static const MemoryRegionOps pci_ls7a_config_ops = {
+    .read = pci_ls7a_config_read,
+    .write = pci_ls7a_config_write,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 4,
+    },
+    .impl = {
+        .min_access_size = 1,
+        .max_access_size = 4,
+    },
+    .endianness = DEVICE_LITTLE_ENDIAN,
+};
+
+static void ls7a_pciehost_realize(DeviceState *dev, Error **errp)
+{
+    PCIHostState *pci = PCI_HOST_BRIDGE(dev);
+    LS7APCIEHost *s = LS7A_HOST_DEVICE(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    PCIExpressHost *pex = PCIE_HOST_BRIDGE(dev);
+
+    pcie_host_mmcfg_init(pex, LS_PCIECFG_SIZE);
+    sysbus_init_mmio(sbd, &pex->mmio);
+
+    /* Add ls7a pci-io/pci-mmio */
+    memory_region_init(&s->pci_io, OBJECT(s), "io", LS7A_PCI_IO_SIZE);
+    memory_region_init(&s->pci_mmio, OBJECT(s), "ls7a_mmio", UINT64_MAX);
+    sysbus_init_mmio(sbd, &s->pci_io);
+    sysbus_init_mmio(sbd, &s->pci_mmio);
+
+    pci->bus = pci_register_root_bus(dev, "pcie.0", NULL, NULL, s,
+                                     &s->pci_mmio, &s->pci_io,
+                                     PCI_DEVFN(1, 0), 128, TYPE_PCIE_BUS);
+
+    memory_region_init_io(&s->pci_conf, OBJECT(dev),
+                          &pci_ls7a_config_ops, pci->bus,
+                          "ls7a_pci_conf", HT1LO_PCICFG_SIZE);
+    sysbus_init_mmio(sbd, &s->pci_conf);
+
+    qdev_realize(DEVICE(&s->pci_dev), BUS(pci->bus), &error_fatal);
+}
+
+static void ls7a_reset(DeviceState *qdev)
+{
+    PCIDevice *d = PCI_DEVICE(qdev);
+
+    /* pci status */
+    d->config[0x6] = 0x01;
+    /* base class code */
+    d->config[0xb] = 0x06;
+    /* header type */
+    d->config[0xe] = 0x80;
+    /* capabilities pointer */
+    d->config[0x34] = 0x40;
+    /* link status and control register 0 */
+    d->config[0x44] = 0x20;
+}
+
+static void ls7a_pcie_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+
+    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
+    dc->desc = "LS7A1000 PCIE Host bridge";
+    dc->vmsd = &vmstate_ls7a_pcie;
+    k->vendor_id = PCI_VENDOR_ID_LOONGSON;
+    k->device_id = PCI_DEVICE_ID_LOONGSON_HOST;
+    k->revision = 0x0;
+    k->class_id = PCI_CLASS_BRIDGE_HOST;
+    dc->reset = ls7a_reset;
+    /*
+     * PCI-facing part of the host bridge, not usable without the
+     * host-facing part, which can't be device_add'ed, yet.
+     */
+    dc->user_creatable = false;
+}
+
+static const TypeInfo ls7a_pcie_device_info = {
+    .name          = TYPE_LS7A_PCI_DEVICE,
+    .parent        = TYPE_PCI_DEVICE,
+    .instance_size = sizeof(LS7APCIState),
+    .class_init    = ls7a_pcie_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+        { },
+    },
+};
+
+static void ls7a_pciehost_initfn(Object *obj)
+{
+    LS7APCIEHost *s = LS7A_HOST_DEVICE(obj);
+    LS7APCIState *ls7a_pci = &s->pci_dev;
+
+    object_initialize_child(obj, "ls7a_pci", ls7a_pci, TYPE_LS7A_PCI_DEVICE);
+    qdev_prop_set_int32(DEVICE(ls7a_pci), "addr", PCI_DEVFN(0, 0));
+    qdev_prop_set_bit(DEVICE(ls7a_pci), "multifunction", false);
+}
+
+static const char *ls7a_pciehost_root_bus_path(PCIHostState *host_bridge,
+                                          PCIBus *rootbus)
+{
+    return "0000:00";
+}
+
+static void ls7a_pciehost_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIHostBridgeClass *hc = PCI_HOST_BRIDGE_CLASS(klass);
+
+    hc->root_bus_path = ls7a_pciehost_root_bus_path;
+    dc->realize = ls7a_pciehost_realize;
+    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
+    dc->fw_name = "pci";
+    dc->user_creatable = false;
+}
+
+static const TypeInfo ls7a_pciehost_info = {
+    .name          = TYPE_LS7A_HOST_DEVICE,
+    .parent        = TYPE_PCIE_HOST_BRIDGE,
+    .instance_size = sizeof(LS7APCIEHost),
+    .instance_init = ls7a_pciehost_initfn,
+    .class_init    = ls7a_pciehost_class_init,
+};
+
+static void ls7a_register_types(void)
+{
+    type_register_static(&ls7a_pciehost_info);
+    type_register_static(&ls7a_pcie_device_info);
+}
+
+type_init(ls7a_register_types)
diff --git a/hw/pci-host/meson.build b/hw/pci-host/meson.build
index 4c4f39c15c..c4955455fd 100644
--- a/hw/pci-host/meson.build
+++ b/hw/pci-host/meson.build
@@ -11,6 +11,7 @@ pci_ss.add(when: 'CONFIG_PCI_SABRE', if_true: files('sabre.c'))
 pci_ss.add(when: 'CONFIG_XEN_IGD_PASSTHROUGH', if_true: files('xen_igd_pt.c'))
 pci_ss.add(when: 'CONFIG_REMOTE_PCIHOST', if_true: files('remote.c'))
 pci_ss.add(when: 'CONFIG_SH_PCI', if_true: files('sh_pci.c'))
+pci_ss.add(when: 'CONFIG_PCI_EXPRESS_7A', if_true: files('ls7a.c'))
 
 # PPC devices
 pci_ss.add(when: 'CONFIG_RAVEN_PCI', if_true: files('raven.c'))
diff --git a/include/hw/pci-host/ls7a.h b/include/hw/pci-host/ls7a.h
new file mode 100644
index 0000000000..6adbfbe443
--- /dev/null
+++ b/include/hw/pci-host/ls7a.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * QEMU LoongArch CPU
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#ifndef HW_LS7A_H
+#define HW_LS7A_H
+
+#include "hw/pci/pci.h"
+#include "hw/pci/pcie_host.h"
+#include "hw/pci-host/pam.h"
+#include "qemu/units.h"
+#include "qemu/range.h"
+#include "qom/object.h"
+
+#define HT1LO_PCICFG_BASE        0x1a000000
+#define HT1LO_PCICFG_SIZE        0x02000000
+
+#define LS_PCIECFG_BASE          0x20000000
+#define LS_PCIECFG_SIZE          0x08000000
+
+#define LS7A_PCI_IO_BASE         0x18004000UL
+#define LS7A_PCI_IO_SIZE         0xC000
+
+struct LS7APCIState {
+    /*< private >*/
+    PCIDevice parent_obj;
+    /*< public >*/
+};
+
+typedef struct LS7APCIState LS7APCIState;
+typedef struct LS7APCIEHost {
+    /*< private >*/
+    PCIExpressHost parent_obj;
+    /*< public >*/
+
+    LS7APCIState pci_dev;
+
+    MemoryRegion pci_conf;
+    MemoryRegion pci_mmio;
+    MemoryRegion pci_io;
+} LS7APCIEHost;
+
+#define TYPE_LS7A_HOST_DEVICE "ls7a1000-pciehost"
+OBJECT_DECLARE_SIMPLE_TYPE(LS7APCIEHost, LS7A_HOST_DEVICE)
+
+#define TYPE_LS7A_PCI_DEVICE "ls7a1000_pci"
+OBJECT_DECLARE_SIMPLE_TYPE(LS7APCIState, LS7A_PCI_DEVICE)
+
+#endif /* HW_LS7A_H */
diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
index 11abe22d46..f3cdf7a912 100644
--- a/include/hw/pci/pci_ids.h
+++ b/include/hw/pci/pci_ids.h
@@ -283,4 +283,7 @@
 
 #define PCI_VENDOR_ID_NVIDIA             0x10de
 
+#define PCI_VENDOR_ID_LOONGSON           0x0014
+#define PCI_DEVICE_ID_LOONGSON_HOST      0x7a00
+
 #endif
-- 
2.27.0


