Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 936A54A74EF
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 16:50:10 +0100 (CET)
Received: from localhost ([::1]:55122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFHtZ-0007ai-8M
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 10:50:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nFGVJ-0003fA-JE
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 09:21:03 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nFGUf-00006x-TR
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 09:21:01 -0500
Received: from fraeml744-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4JpkNV2R7yz67bVs;
 Wed,  2 Feb 2022 22:15:38 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml744-chm.china.huawei.com (10.206.15.225) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 2 Feb 2022 15:20:19 +0100
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 2 Feb 2022 14:20:18 +0000
To: <qemu-devel@nongnu.org>, =?UTF-8?q?Alex=20Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Marcel Apfelbaum <marcel@redhat.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
CC: <linux-cxl@vger.kernel.org>, Ben Widawsky <ben.widawsky@intel.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, <linuxarm@huawei.com>, "Shameerali
 Kolothum Thodi" <shameerali.kolothum.thodi@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Saransh Gupta1
 <saransh@ibm.com>, Shreyas Shah <shreyas.shah@elastics.cloud>, Chris Browy
 <cbrowy@avery-design.com>, Samarth Saxena <samarths@cadence.com>, "Dan
 Williams" <dan.j.williams@intel.com>
Subject: [PATCH v5 19/43] hw/cxl/rp: Add a root port
Date: Wed, 2 Feb 2022 14:10:13 +0000
Message-ID: <20220202141037.17352-20-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220202141037.17352-1-Jonathan.Cameron@huawei.com>
References: <20220202141037.17352-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml743-chm.china.huawei.com (10.201.108.193) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

From: Ben Widawsky <ben.widawsky@intel.com>

This adds just enough of a root port implementation to be able to
enumerate root ports (creating the required DVSEC entries). What's not
here yet is the MMIO nor the ability to write some of the DVSEC entries.

This can be added with the qemu commandline by adding a rootport to a
specific CXL host bridge. For example:
  -device cxl-rp,id=rp0,bus="cxl.0",addr=0.0,chassis=4

Like the host bridge patch, the ACPI tables aren't generated at this
point and so system software cannot use it.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/pci-bridge/Kconfig          |   5 +
 hw/pci-bridge/cxl_root_port.c  | 231 +++++++++++++++++++++++++++++++++
 hw/pci-bridge/meson.build      |   1 +
 hw/pci-bridge/pcie_root_port.c |   6 +-
 hw/pci/pci.c                   |   4 +-
 5 files changed, 245 insertions(+), 2 deletions(-)
 create mode 100644 hw/pci-bridge/cxl_root_port.c

diff --git a/hw/pci-bridge/Kconfig b/hw/pci-bridge/Kconfig
index f8df4315ba..02614f49aa 100644
--- a/hw/pci-bridge/Kconfig
+++ b/hw/pci-bridge/Kconfig
@@ -27,3 +27,8 @@ config DEC_PCI
 
 config SIMBA
     bool
+
+config CXL
+    bool
+    default y if PCI_EXPRESS && PXB
+    depends on PCI_EXPRESS && MSI_NONBROKEN && PXB
diff --git a/hw/pci-bridge/cxl_root_port.c b/hw/pci-bridge/cxl_root_port.c
new file mode 100644
index 0000000000..dd714db836
--- /dev/null
+++ b/hw/pci-bridge/cxl_root_port.c
@@ -0,0 +1,231 @@
+/*
+ * CXL 2.0 Root Port Implementation
+ *
+ * Copyright(C) 2020 Intel Corporation.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/range.h"
+#include "hw/pci/pci_bridge.h"
+#include "hw/pci/pcie_port.h"
+#include "hw/qdev-properties.h"
+#include "hw/sysbus.h"
+#include "qapi/error.h"
+#include "hw/cxl/cxl.h"
+
+#define CXL_ROOT_PORT_DID 0x7075
+
+/* Copied from the gen root port which we derive */
+#define GEN_PCIE_ROOT_PORT_AER_OFFSET 0x100
+#define GEN_PCIE_ROOT_PORT_ACS_OFFSET \
+    (GEN_PCIE_ROOT_PORT_AER_OFFSET + PCI_ERR_SIZEOF)
+#define CXL_ROOT_PORT_DVSEC_OFFSET \
+    (GEN_PCIE_ROOT_PORT_ACS_OFFSET + PCI_ACS_SIZEOF)
+
+typedef struct CXLRootPort {
+    /*< private >*/
+    PCIESlot parent_obj;
+
+    CXLComponentState cxl_cstate;
+    PCIResReserve res_reserve;
+} CXLRootPort;
+
+#define TYPE_CXL_ROOT_PORT "cxl-rp"
+DECLARE_INSTANCE_CHECKER(CXLRootPort, CXL_ROOT_PORT, TYPE_CXL_ROOT_PORT)
+
+static void latch_registers(CXLRootPort *crp)
+{
+    uint32_t *reg_state = crp->cxl_cstate.crb.cache_mem_registers;
+
+    cxl_component_register_init_common(reg_state, CXL2_ROOT_PORT);
+}
+
+static void build_dvsecs(CXLComponentState *cxl)
+{
+    uint8_t *dvsec;
+
+    dvsec = (uint8_t *)&(struct cxl_dvsec_port_extensions){ 0 };
+    cxl_component_create_dvsec(cxl, EXTENSIONS_PORT_DVSEC_LENGTH,
+                               EXTENSIONS_PORT_DVSEC,
+                               EXTENSIONS_PORT_DVSEC_REVID, dvsec);
+
+    dvsec = (uint8_t *)&(struct cxl_dvsec_port_gpf){
+        .rsvd        = 0,
+        .phase1_ctrl = 1, /* 1μs timeout */
+        .phase2_ctrl = 1, /* 1μs timeout */
+    };
+    cxl_component_create_dvsec(cxl, GPF_PORT_DVSEC_LENGTH, GPF_PORT_DVSEC,
+                               GPF_PORT_DVSEC_REVID, dvsec);
+
+    dvsec = (uint8_t *)&(struct cxl_dvsec_port_flexbus){
+        .cap                     = 0x26, /* IO, Mem, non-MLD */
+        .ctrl                    = 0,
+        .status                  = 0x26, /* same */
+        .rcvd_mod_ts_data_phase1 = 0xef, /* WTF? */
+    };
+    cxl_component_create_dvsec(cxl, PCIE_FLEXBUS_PORT_DVSEC_LENGTH_2_0,
+                               PCIE_FLEXBUS_PORT_DVSEC,
+                               PCIE_FLEXBUS_PORT_DVSEC_REVID_2_0, dvsec);
+
+    dvsec = (uint8_t *)&(struct cxl_dvsec_register_locator){
+        .rsvd         = 0,
+        .reg0_base_lo = RBI_COMPONENT_REG | CXL_COMPONENT_REG_BAR_IDX,
+        .reg0_base_hi = 0,
+    };
+    cxl_component_create_dvsec(cxl, REG_LOC_DVSEC_LENGTH, REG_LOC_DVSEC,
+                               REG_LOC_DVSEC_REVID, dvsec);
+}
+
+static void cxl_rp_realize(DeviceState *dev, Error **errp)
+{
+    PCIDevice *pci_dev     = PCI_DEVICE(dev);
+    PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
+    CXLRootPort *crp       = CXL_ROOT_PORT(dev);
+    CXLComponentState *cxl_cstate = &crp->cxl_cstate;
+    ComponentRegisters *cregs = &cxl_cstate->crb;
+    MemoryRegion *component_bar = &cregs->component_registers;
+    Error *local_err = NULL;
+
+    rpc->parent_realize(dev, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    int rc =
+        pci_bridge_qemu_reserve_cap_init(pci_dev, 0, crp->res_reserve, errp);
+    if (rc < 0) {
+        rpc->parent_class.exit(pci_dev);
+        return;
+    }
+
+    if (!crp->res_reserve.io || crp->res_reserve.io == -1) {
+        pci_word_test_and_clear_mask(pci_dev->wmask + PCI_COMMAND,
+                                     PCI_COMMAND_IO);
+        pci_dev->wmask[PCI_IO_BASE]  = 0;
+        pci_dev->wmask[PCI_IO_LIMIT] = 0;
+    }
+
+    cxl_cstate->dvsec_offset = CXL_ROOT_PORT_DVSEC_OFFSET;
+    cxl_cstate->pdev = pci_dev;
+    build_dvsecs(&crp->cxl_cstate);
+
+    cxl_component_register_block_init(OBJECT(pci_dev), cxl_cstate,
+                                      TYPE_CXL_ROOT_PORT);
+
+    pci_register_bar(pci_dev, CXL_COMPONENT_REG_BAR_IDX,
+                     PCI_BASE_ADDRESS_SPACE_MEMORY |
+                         PCI_BASE_ADDRESS_MEM_TYPE_64,
+                     component_bar);
+}
+
+static void cxl_rp_reset(DeviceState *dev)
+{
+    PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
+    CXLRootPort *crp = CXL_ROOT_PORT(dev);
+
+    rpc->parent_reset(dev);
+
+    latch_registers(crp);
+}
+
+static Property gen_rp_props[] = {
+    DEFINE_PROP_UINT32("bus-reserve", CXLRootPort, res_reserve.bus, -1),
+    DEFINE_PROP_SIZE("io-reserve", CXLRootPort, res_reserve.io, -1),
+    DEFINE_PROP_SIZE("mem-reserve", CXLRootPort, res_reserve.mem_non_pref, -1),
+    DEFINE_PROP_SIZE("pref32-reserve", CXLRootPort, res_reserve.mem_pref_32,
+                     -1),
+    DEFINE_PROP_SIZE("pref64-reserve", CXLRootPort, res_reserve.mem_pref_64,
+                     -1),
+    DEFINE_PROP_END_OF_LIST()
+};
+
+static void cxl_rp_dvsec_write_config(PCIDevice *dev, uint32_t addr,
+                                      uint32_t val, int len)
+{
+    CXLRootPort *crp = CXL_ROOT_PORT(dev);
+
+    if (range_contains(&crp->cxl_cstate.dvsecs[EXTENSIONS_PORT_DVSEC], addr)) {
+        uint8_t *reg = &dev->config[addr];
+        addr -= crp->cxl_cstate.dvsecs[EXTENSIONS_PORT_DVSEC].lob;
+        if (addr == PORT_CONTROL_OFFSET) {
+            if (pci_get_word(reg) & PORT_CONTROL_UNMASK_SBR) {
+                /* unmask SBR */
+            }
+            if (pci_get_word(reg) & PORT_CONTROL_ALT_MEMID_EN) {
+                /* Alt Memory & ID Space Enable */
+            }
+        }
+    }
+}
+
+static void cxl_rp_write_config(PCIDevice *d, uint32_t address, uint32_t val,
+                                int len)
+{
+    uint16_t slt_ctl, slt_sta;
+
+    pcie_cap_slot_get(d, &slt_ctl, &slt_sta);
+    pci_bridge_write_config(d, address, val, len);
+    pcie_cap_flr_write_config(d, address, val, len);
+    pcie_cap_slot_write_config(d, slt_ctl, slt_sta, address, val, len);
+    pcie_aer_write_config(d, address, val, len);
+
+    cxl_rp_dvsec_write_config(d, address, val, len);
+}
+
+static void cxl_root_port_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc        = DEVICE_CLASS(oc);
+    PCIDeviceClass *k      = PCI_DEVICE_CLASS(oc);
+    PCIERootPortClass *rpc = PCIE_ROOT_PORT_CLASS(oc);
+
+    k->vendor_id = PCI_VENDOR_ID_INTEL;
+    k->device_id = CXL_ROOT_PORT_DID;
+    dc->desc     = "CXL Root Port";
+    k->revision  = 0;
+    device_class_set_props(dc, gen_rp_props);
+    k->config_write = cxl_rp_write_config;
+
+    device_class_set_parent_realize(dc, cxl_rp_realize, &rpc->parent_realize);
+    device_class_set_parent_reset(dc, cxl_rp_reset, &rpc->parent_reset);
+
+    rpc->aer_offset = GEN_PCIE_ROOT_PORT_AER_OFFSET;
+    rpc->acs_offset = GEN_PCIE_ROOT_PORT_ACS_OFFSET;
+
+    /*
+     * Explain
+     */
+    dc->hotpluggable = false;
+}
+
+static const TypeInfo cxl_root_port_info = {
+    .name = TYPE_CXL_ROOT_PORT,
+    .parent = TYPE_PCIE_ROOT_PORT,
+    .instance_size = sizeof(CXLRootPort),
+    .class_init = cxl_root_port_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { INTERFACE_CXL_DEVICE },
+        { }
+    },
+};
+
+static void cxl_register(void)
+{
+    type_register_static(&cxl_root_port_info);
+}
+
+type_init(cxl_register);
diff --git a/hw/pci-bridge/meson.build b/hw/pci-bridge/meson.build
index daab8acf2a..b6d26a03d5 100644
--- a/hw/pci-bridge/meson.build
+++ b/hw/pci-bridge/meson.build
@@ -5,6 +5,7 @@ pci_ss.add(when: 'CONFIG_IOH3420', if_true: files('ioh3420.c'))
 pci_ss.add(when: 'CONFIG_PCIE_PORT', if_true: files('pcie_root_port.c', 'gen_pcie_root_port.c', 'pcie_pci_bridge.c'))
 pci_ss.add(when: 'CONFIG_PXB', if_true: files('pci_expander_bridge.c'))
 pci_ss.add(when: 'CONFIG_XIO3130', if_true: files('xio3130_upstream.c', 'xio3130_downstream.c'))
+pci_ss.add(when: 'CONFIG_CXL', if_true: files('cxl_root_port.c'))
 
 # NewWorld PowerMac
 pci_ss.add(when: 'CONFIG_DEC_PCI', if_true: files('dec.c'))
diff --git a/hw/pci-bridge/pcie_root_port.c b/hw/pci-bridge/pcie_root_port.c
index f1cfe9d14a..460e48269d 100644
--- a/hw/pci-bridge/pcie_root_port.c
+++ b/hw/pci-bridge/pcie_root_port.c
@@ -67,7 +67,11 @@ static void rp_realize(PCIDevice *d, Error **errp)
     int rc;
 
     pci_config_set_interrupt_pin(d->config, 1);
-    pci_bridge_initfn(d, TYPE_PCIE_BUS);
+    if (d->cap_present & QEMU_PCIE_CAP_CXL) {
+        pci_bridge_initfn(d, TYPE_CXL_BUS);
+    } else {
+        pci_bridge_initfn(d, TYPE_PCIE_BUS);
+    }
     pcie_port_init_reg(d);
 
     rc = pci_bridge_ssvid_init(d, rpc->ssvid_offset, dc->vendor_id,
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index cafebf6f59..cc4f06937d 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2708,7 +2708,9 @@ static void pci_device_class_base_init(ObjectClass *klass, void *data)
             object_class_dynamic_cast(klass, INTERFACE_CONVENTIONAL_PCI_DEVICE);
         ObjectClass *pcie =
             object_class_dynamic_cast(klass, INTERFACE_PCIE_DEVICE);
-        assert(conventional || pcie);
+        ObjectClass *cxl =
+            object_class_dynamic_cast(klass, INTERFACE_CXL_DEVICE);
+        assert(conventional || pcie || cxl);
     }
 }
 
-- 
2.32.0


