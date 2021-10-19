Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D36EC433017
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 09:51:18 +0200 (CEST)
Received: from localhost ([::1]:42344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcju1-0001t5-Me
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 03:51:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mcjfE-0001qA-33
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:36:00 -0400
Received: from mail.loongson.cn ([114.242.206.163]:34974 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mcjf8-0004XH-PJ
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:35:59 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP2s1dW5h3HwcAA--.43474S15; 
 Tue, 19 Oct 2021 15:35:37 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/31] hw/pci-host: Add ls7a1000 PCIe Host bridge support for
 Loongson Platform
Date: Tue, 19 Oct 2021 15:34:59 +0800
Message-Id: <1634628917-10031-14-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9DxP2s1dW5h3HwcAA--.43474S15
X-Coremail-Antispam: 1UD129KBjvJXoW3Xr1rKr43GF1xXr1rtrykuFg_yoWfAFW8pF
 n5CasakF4UtFW7J393JFn7WF1rXFs3C34UJrW7uw1Iyayxtw1qvrnrKFWUt3y7GrWqqF45
 XaykG3W2ga18JaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 mst@redhat.com, philmd@redhat.com, richard.henderson@linaro.org,
 laurent@vivier.eu, peterx@redhat.com, f4bug@amsat.org,
 yangxiaojuan@loongson.cn, alistair.francis@wdc.com, maobibo@loongson.cn,
 gaosong@loongson.cn, pbonzini@redhat.com, mark.cave-ayland@ilande.co.uk,
 bmeng.cn@gmail.com, alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a model of the PCIe Host Bridge found on a Loongson-5000
processor. It includes a interrupt controller, some interface for
pci and nonpci devices we only emulate part devices for tcg mode.
It support for MSI and MSIX interrupt sources.

For more detailed info about ls7a1000 you can see the doc at
https://github.com/loongson/LoongArch-Documentation/releases/latest/
download/Loongson-7A1000-usermanual-2.00-EN.pdf

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/pci-host/Kconfig        |   4 +
 hw/pci-host/ls7a.c         | 188 +++++++++++++++++++++++++++++++++++++
 hw/pci-host/meson.build    |   1 +
 include/hw/pci-host/ls7a.h |  48 ++++++++++
 4 files changed, 241 insertions(+)
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
index 0000000000..1d6d5ea35a
--- /dev/null
+++ b/hw/pci-host/ls7a.c
@@ -0,0 +1,188 @@
+/*
+ * QEMU Loongson 7A1000 North Bridge Emulation
+ *
+ * Copyright (C) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+#include "qemu/osdep.h"
+
+#include "hw/pci/pci.h"
+#include "hw/pci/pcie_host.h"
+#include "qapi/error.h"
+#include "hw/irq.h"
+#include "hw/pci/pci_bridge.h"
+#include "hw/pci/pci_bus.h"
+#include "sysemu/reset.h"
+#include "hw/pci-host/ls7a.h"
+#include "migration/vmstate.h"
+
+static const VMStateDescription vmstate_ls7a_pcie = {
+    .name = "LS7A_PCIE",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_PCI_DEVICE(dev, LS7APCIState),
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
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static void ls7a_pciehost_realize(DeviceState *dev, Error **errp)
+{
+    LS7APCIEHost *pciehost = LS7A_PCIE_HOST_BRIDGE(dev);
+    PCIExpressHost *e = PCIE_HOST_BRIDGE(dev);
+    PCIHostState *phb = PCI_HOST_BRIDGE(e);
+
+    phb->bus = pci_register_root_bus(dev, "pcie.0", NULL,
+                                     NULL, pciehost,
+                                     get_system_memory(), get_system_io(),
+                                     PCI_DEVFN(1, 0), 128, TYPE_PCIE_BUS);
+
+    memory_region_init_io(&pciehost->pci_conf, OBJECT(dev),
+                          &pci_ls7a_config_ops, phb->bus,
+                          "ls7a_pci_conf", HT1LO_PCICFG_SIZE);
+    memory_region_add_subregion(get_system_memory(), HT1LO_PCICFG_BASE,
+                                &pciehost->pci_conf);
+
+    /* Add ls7a pci-io */
+    memory_region_init_alias(&pciehost->pci_io, OBJECT(dev), "ls7a-pci-io",
+                             get_system_io(), 0, LS7A_PCI_IO_SIZE);
+    memory_region_add_subregion(get_system_memory(), LS7A_PCI_IO_BASE,
+                                &pciehost->pci_io);
+
+    pcie_host_mmcfg_update(e, true, LS_PCIECFG_BASE, LS_PCIECFG_SIZE);
+}
+
+PCIBus *ls7a_init(MachineState *machine, qemu_irq *pic)
+{
+    DeviceState *dev;
+    PCIHostState *phb;
+    LS7APCIState *pbs;
+    LS7APCIEHost *pciehost;
+    PCIDevice *pci_dev;
+    PCIExpressHost *e;
+
+    dev = qdev_new(TYPE_LS7A_PCIE_HOST_BRIDGE);
+    e = PCIE_HOST_BRIDGE(dev);
+    phb = PCI_HOST_BRIDGE(e);
+    pciehost = LS7A_PCIE_HOST_BRIDGE(dev);
+    pciehost->pic = pic;
+
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+
+    pci_dev = pci_new(PCI_DEVFN(0, 0), TYPE_LS7A_PCIE);
+    pbs = LS7A_PCIE(pci_dev);
+    pbs->pciehost = pciehost;
+    pbs->pciehost->pci_dev = pbs;
+
+    pci_realize_and_unref(pci_dev, phb->bus, &error_fatal);
+
+    return phb->bus;
+}
+
+static void ls7a_reset(DeviceState *qdev)
+{
+    uint64_t wmask;
+    wmask = ~(-1);
+    PCIDevice *dev = PCI_DEVICE(qdev);
+
+    pci_set_word(dev->config + PCI_STATUS, 0x0010);
+    pci_set_word(dev->wmask + PCI_STATUS, wmask & 0xffff);
+    pci_set_word(dev->cmask + PCI_STATUS, 0xffff);
+    pci_set_byte(dev->config + PCI_HEADER_TYPE, 0x1);
+    pci_set_byte(dev->wmask + PCI_HEADER_TYPE, wmask & 0xff);
+    pci_set_byte(dev->cmask + PCI_HEADER_TYPE, 0xff);
+    pci_set_word(dev->config + PCI_SUBSYSTEM_VENDOR_ID, 0x0014);
+    pci_set_word(dev->wmask + PCI_SUBSYSTEM_VENDOR_ID, wmask & 0xffff);
+    pci_set_word(dev->cmask + PCI_SUBSYSTEM_VENDOR_ID, 0xffff);
+    pci_set_word(dev->config + PCI_SUBSYSTEM_ID, 0x7a00);
+    pci_set_word(dev->wmask + PCI_SUBSYSTEM_ID, wmask & 0xffff);
+    pci_set_word(dev->cmask + PCI_SUBSYSTEM_ID, 0xffff);
+    pci_set_byte(dev->config + PCI_CAPABILITY_LIST, 0x40);
+    pci_set_byte(dev->wmask + PCI_CAPABILITY_LIST, wmask & 0xff);
+    pci_set_byte(dev->cmask + PCI_CAPABILITY_LIST, 0xff);
+}
+
+static void ls7a_pcie_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+
+    k->vendor_id = 0x0014;
+    k->device_id = 0x7a00;
+    k->revision = 0x00;
+    k->class_id = PCI_CLASS_BRIDGE_HOST;
+    dc->reset = ls7a_reset;
+    dc->desc = "LS7A1000 PCIE Host bridge";
+    dc->vmsd = &vmstate_ls7a_pcie;
+    /*
+     * PCI-facing part of the host bridge, not usable without the
+     * host-facing part, which can't be device_add'ed, yet.
+     */
+    dc->user_creatable = false;
+}
+
+static const TypeInfo ls7a_pcie_device_info = {
+    .name          = TYPE_LS7A_PCIE,
+    .parent        = TYPE_PCI_DEVICE,
+    .instance_size = sizeof(LS7APCIState),
+    .class_init    = ls7a_pcie_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+        { },
+    },
+};
+
+static void ls7a_pciehost_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    dc->realize = ls7a_pciehost_realize;
+    dc->fw_name = "pci";
+    dc->user_creatable = false;
+}
+
+static const TypeInfo ls7a_pciehost_info = {
+    .name          = TYPE_LS7A_PCIE_HOST_BRIDGE,
+    .parent        = TYPE_PCIE_HOST_BRIDGE,
+    .instance_size = sizeof(LS7APCIEHost),
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
index 0000000000..4c95a11ab8
--- /dev/null
+++ b/include/hw/pci-host/ls7a.h
@@ -0,0 +1,48 @@
+/*
+ * QEMU LoongArch CPU
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
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
+#define LS7A_PCI_IO_BASE        0x18000000UL
+#define LS7A_PCI_IO_SIZE        0x00010000
+typedef struct LS7APCIState LS7APCIState;
+typedef struct LS7APCIEHost {
+    PCIExpressHost parent_obj;
+    LS7APCIState *pci_dev;
+    qemu_irq *pic;
+    MemoryRegion pci_conf;
+    MemoryRegion pci_io;
+} LS7APCIEHost;
+
+struct LS7APCIState {
+    PCIDevice dev;
+    LS7APCIEHost *pciehost;
+};
+
+#define TYPE_LS7A_PCIE_HOST_BRIDGE "ls7a1000-pciehost"
+OBJECT_DECLARE_SIMPLE_TYPE(LS7APCIEHost, LS7A_PCIE_HOST_BRIDGE)
+
+#define TYPE_LS7A_PCIE "ls7a1000_pcie"
+OBJECT_DECLARE_SIMPLE_TYPE(LS7APCIState, LS7A_PCIE)
+
+PCIBus *ls7a_init(MachineState *machine, qemu_irq *irq);
+#endif /* HW_LS7A_H */
-- 
2.27.0


