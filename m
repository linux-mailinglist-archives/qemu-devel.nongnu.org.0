Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5888F4F1899
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 17:39:12 +0200 (CEST)
Received: from localhost ([::1]:40686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbOnP-0002td-DZ
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 11:39:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nbOl4-00008c-63
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:36:46 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nbOl1-0007LM-O8
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:36:45 -0400
Received: from fraeml740-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4KXFFw1b6qz67kM8;
 Mon,  4 Apr 2022 23:35:00 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml740-chm.china.huawei.com (10.206.15.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 4 Apr 2022 17:36:41 +0200
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 4 Apr 2022 16:36:41 +0100
To: <linuxarm@huawei.com>, <qemu-devel@nongnu.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, Marcel Apfelbaum
 <marcel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>, "Mark
 Cave-Ayland" <mark.cave-ayland@ilande.co.uk>, Adam Manzanares
 <a.manzanares@samsung.com>
CC: <linux-cxl@vger.kernel.org>, Ben Widawsky <ben.widawsky@intel.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, Shameerali Kolothum Thodi
 <shameerali.kolothum.thodi@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Peter Xu
 <peterx@redhat.com>, David Hildenbrand <david@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Saransh Gupta1 <saransh@ibm.com>, Shreyas Shah
 <shreyas.shah@elastics.cloud>, Chris Browy <cbrowy@avery-design.com>,
 "Samarth Saxena" <samarths@cadence.com>, Dan Williams
 <dan.j.williams@intel.com>, "k . jensen @ samsung . com"
 <k.jensen@samsung.com>, Tong Zhang <t.zhang2@samsung.com>,
 <dave@stgolabs.net>, Alison Schofield <alison.schofield@intel.com>
Subject: [PATCH v9 43/45] pci-bridge/cxl_upstream: Add a CXL switch upstream
 port
Date: Mon, 4 Apr 2022 16:14:43 +0100
Message-ID: <20220404151445.10955-44-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220404151445.10955-1-Jonathan.Cameron@huawei.com>
References: <20220404151445.10955-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml717-chm.china.huawei.com (10.201.108.68) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
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

An initial simple upstream port emulation to allow the creation
of CXL switches. The Device ID has been allocated for this use.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/pci-bridge/cxl_upstream.c | 211 +++++++++++++++++++++++++++++++++++
 hw/pci-bridge/meson.build    |   2 +-
 include/hw/cxl/cxl.h         |   4 +
 3 files changed, 216 insertions(+), 1 deletion(-)

diff --git a/hw/pci-bridge/cxl_upstream.c b/hw/pci-bridge/cxl_upstream.c
new file mode 100644
index 0000000000..5a06aeef67
--- /dev/null
+++ b/hw/pci-bridge/cxl_upstream.c
@@ -0,0 +1,211 @@
+/*
+ * Emulated CXL Switch Upstream Port
+ *
+ * Copyright (c) 2022 Huawei Technologies.
+ *
+ * Based on xio31130_upstream.c
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "hw/pci/msi.h"
+#include "hw/pci/pcie.h"
+#include "hw/pci/pcie_port.h"
+
+#define CXL_UPSTREAM_PORT_MSI_NR_VECTOR 1
+
+#define CXL_UPSTREAM_PORT_MSI_OFFSET 0x70
+#define CXL_UPSTREAM_PORT_PCIE_CAP_OFFSET 0x90
+#define CXL_UPSTREAM_PORT_AER_OFFSET 0x100
+#define CXL_UPSTREAM_PORT_DVSEC_OFFSET \
+    (CXL_UPSTREAM_PORT_AER_OFFSET + PCI_ERR_SIZEOF)
+
+typedef struct CXLUpstreamPort {
+    /*< private >*/
+    PCIEPort parent_obj;
+
+    /*< public >*/
+    CXLComponentState cxl_cstate;
+} CXLUpstreamPort;
+
+CXLComponentState *cxl_usp_to_cstate(CXLUpstreamPort *usp)
+{
+    return &usp->cxl_cstate;
+}
+
+static void cxl_usp_dvsec_write_config(PCIDevice *dev, uint32_t addr,
+                                       uint32_t val, int len)
+{
+    CXLUpstreamPort *usp = CXL_USP(dev);
+
+    if (range_contains(&usp->cxl_cstate.dvsecs[EXTENSIONS_PORT_DVSEC], addr)) {
+        uint8_t *reg = &dev->config[addr];
+        addr -= usp->cxl_cstate.dvsecs[EXTENSIONS_PORT_DVSEC].lob;
+        if (addr == PORT_CONTROL_OFFSET) {
+            if (pci_get_word(reg) & PORT_CONTROL_UNMASK_SBR) {
+                /* unmask SBR */
+                qemu_log_mask(LOG_UNIMP, "SBR mask control is not supported\n");
+            }
+            if (pci_get_word(reg) & PORT_CONTROL_ALT_MEMID_EN) {
+                /* Alt Memory & ID Space Enable */
+                qemu_log_mask(LOG_UNIMP,
+                              "Alt Memory & ID space is not supported\n");
+            }
+        }
+    }
+}
+
+static void cxl_usp_write_config(PCIDevice *d, uint32_t address,
+                                 uint32_t val, int len)
+{
+    pci_bridge_write_config(d, address, val, len);
+    pcie_cap_flr_write_config(d, address, val, len);
+    pcie_aer_write_config(d, address, val, len);
+
+    cxl_usp_dvsec_write_config(d, address, val, len);
+}
+
+static void latch_registers(CXLUpstreamPort *usp)
+{
+    uint32_t *reg_state = usp->cxl_cstate.crb.cache_mem_registers;
+
+    cxl_component_register_init_common(reg_state, CXL2_UPSTREAM_PORT);
+    ARRAY_FIELD_DP32(reg_state, CXL_HDM_DECODER_CAPABILITY, TARGET_COUNT, 8);
+}
+
+static void cxl_usp_reset(DeviceState *qdev)
+{
+    PCIDevice *d = PCI_DEVICE(qdev);
+    CXLUpstreamPort *usp = CXL_USP(qdev);
+
+    pci_bridge_reset(qdev);
+    pcie_cap_deverr_reset(d);
+    latch_registers(usp);
+}
+
+static void build_dvsecs(CXLComponentState *cxl)
+{
+    uint8_t *dvsec;
+
+    dvsec = (uint8_t *)&(CXLDVSECPortExtensions){
+        .status = 0x1, /* Port Power Management Init Complete */
+    };
+    cxl_component_create_dvsec(cxl, EXTENSIONS_PORT_DVSEC_LENGTH,
+                               EXTENSIONS_PORT_DVSEC,
+                               EXTENSIONS_PORT_DVSEC_REVID, dvsec);
+    dvsec = (uint8_t *)&(CXLDVSECPortFlexBus){
+        .cap                     = 0x27, /* Cache, IO, Mem, non-MLD */
+        .ctrl                    = 0x27, /* Cache, IO, Mem */
+        .status                  = 0x26, /* same */
+        .rcvd_mod_ts_data_phase1 = 0xef, /* WTF? */
+    };
+    cxl_component_create_dvsec(cxl, PCIE_FLEXBUS_PORT_DVSEC_LENGTH_2_0,
+                               PCIE_FLEXBUS_PORT_DVSEC,
+                               PCIE_FLEXBUS_PORT_DVSEC_REVID_2_0, dvsec);
+
+    dvsec = (uint8_t *)&(CXLDVSECRegisterLocator){
+        .rsvd         = 0,
+        .reg0_base_lo = RBI_COMPONENT_REG | CXL_COMPONENT_REG_BAR_IDX,
+        .reg0_base_hi = 0,
+    };
+    cxl_component_create_dvsec(cxl, REG_LOC_DVSEC_LENGTH, REG_LOC_DVSEC,
+                               REG_LOC_DVSEC_REVID, dvsec);
+}
+
+static void cxl_usp_realize(PCIDevice *d, Error **errp)
+{
+    PCIEPort *p = PCIE_PORT(d);
+    CXLUpstreamPort *usp = CXL_USP(d);
+    CXLComponentState *cxl_cstate = &usp->cxl_cstate;
+    ComponentRegisters *cregs = &cxl_cstate->crb;
+    MemoryRegion *component_bar = &cregs->component_registers;
+    int rc;
+
+    pci_bridge_initfn(d, TYPE_PCIE_BUS);
+    pcie_port_init_reg(d);
+
+    rc = msi_init(d, CXL_UPSTREAM_PORT_MSI_OFFSET,
+                  CXL_UPSTREAM_PORT_MSI_NR_VECTOR, true, true, errp);
+    if (rc) {
+        assert(rc == -ENOTSUP);
+        goto err_bridge;
+    }
+
+    rc = pcie_cap_init(d, CXL_UPSTREAM_PORT_PCIE_CAP_OFFSET,
+                       PCI_EXP_TYPE_UPSTREAM, p->port, errp);
+    if (rc < 0) {
+        goto err_msi;
+    }
+
+    pcie_cap_flr_init(d);
+    pcie_cap_deverr_init(d);
+    rc = pcie_aer_init(d, PCI_ERR_VER, CXL_UPSTREAM_PORT_AER_OFFSET,
+                       PCI_ERR_SIZEOF, errp);
+    if (rc) {
+        goto err_cap;
+    }
+
+    cxl_cstate->dvsec_offset = CXL_UPSTREAM_PORT_DVSEC_OFFSET;
+    cxl_cstate->pdev = d;
+    build_dvsecs(cxl_cstate);
+    cxl_component_register_block_init(OBJECT(d), cxl_cstate, TYPE_CXL_USP);
+    pci_register_bar(d, CXL_COMPONENT_REG_BAR_IDX,
+                     PCI_BASE_ADDRESS_SPACE_MEMORY |
+                     PCI_BASE_ADDRESS_MEM_TYPE_64,
+                     component_bar);
+
+    return;
+
+err_cap:
+    pcie_cap_exit(d);
+err_msi:
+    msi_uninit(d);
+err_bridge:
+    pci_bridge_exitfn(d);
+}
+
+static void cxl_usp_exitfn(PCIDevice *d)
+{
+    pcie_aer_exit(d);
+    pcie_cap_exit(d);
+    msi_uninit(d);
+    pci_bridge_exitfn(d);
+}
+
+static void cxl_upstream_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(oc);
+
+    k->is_bridge = true;
+    k->config_write = cxl_usp_write_config;
+    k->realize = cxl_usp_realize;
+    k->exit = cxl_usp_exitfn;
+    k->vendor_id = 0x19e5; /* Huawei */
+    k->device_id = 0xa128; /* Emulated CXL Switch Upstream Port */
+    k->revision = 0;
+    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
+    dc->desc = "CXL Switch Upstream Port";
+    dc->reset = cxl_usp_reset;
+}
+
+static const TypeInfo cxl_usp_info = {
+    .name = TYPE_CXL_USP,
+    .parent = TYPE_PCIE_PORT,
+    .instance_size = sizeof(CXLUpstreamPort),
+    .class_init = cxl_upstream_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { INTERFACE_PCIE_DEVICE },
+        { INTERFACE_CXL_DEVICE },
+        { }
+    },
+};
+
+static void cxl_usp_register_type(void)
+{
+    type_register_static(&cxl_usp_info);
+}
+
+type_init(cxl_usp_register_type);
diff --git a/hw/pci-bridge/meson.build b/hw/pci-bridge/meson.build
index b6d26a03d5..4a8c26b5a1 100644
--- a/hw/pci-bridge/meson.build
+++ b/hw/pci-bridge/meson.build
@@ -5,7 +5,7 @@ pci_ss.add(when: 'CONFIG_IOH3420', if_true: files('ioh3420.c'))
 pci_ss.add(when: 'CONFIG_PCIE_PORT', if_true: files('pcie_root_port.c', 'gen_pcie_root_port.c', 'pcie_pci_bridge.c'))
 pci_ss.add(when: 'CONFIG_PXB', if_true: files('pci_expander_bridge.c'))
 pci_ss.add(when: 'CONFIG_XIO3130', if_true: files('xio3130_upstream.c', 'xio3130_downstream.c'))
-pci_ss.add(when: 'CONFIG_CXL', if_true: files('cxl_root_port.c'))
+pci_ss.add(when: 'CONFIG_CXL', if_true: files('cxl_root_port.c', 'cxl_upstream.c'))
 
 # NewWorld PowerMac
 pci_ss.add(when: 'CONFIG_DEC_PCI', if_true: files('dec.c'))
diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
index 21d28ca110..ff7b296b9f 100644
--- a/include/hw/cxl/cxl.h
+++ b/include/hw/cxl/cxl.h
@@ -57,5 +57,9 @@ void cxl_fixed_memory_window_config(MachineState *ms,
 void cxl_fixed_memory_window_link_targets(Error **errp);
 
 extern const MemoryRegionOps cfmws_ops;
+#define TYPE_CXL_USP "cxl-upstream"
 
+typedef struct CXLUpstreamPort CXLUpstreamPort;
+DECLARE_INSTANCE_CHECKER(CXLUpstreamPort, CXL_USP, TYPE_CXL_USP)
+CXLComponentState *cxl_usp_to_cstate(CXLUpstreamPort *usp);
 #endif
-- 
2.32.0


