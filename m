Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4F6514FA6
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 17:37:31 +0200 (CEST)
Received: from localhost ([::1]:50576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkSgU-00009p-Do
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 11:37:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nkSA6-0007Da-EF
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:04:02 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nkSA3-0003IR-IR
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:04:02 -0400
Received: from fraeml737-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4KqbKQ3SF1z67Ppf;
 Fri, 29 Apr 2022 23:01:14 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml737-chm.china.huawei.com (10.206.15.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 29 Apr 2022 17:03:49 +0200
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 29 Apr 2022 16:03:49 +0100
To: <linuxarm@huawei.com>, <qemu-devel@nongnu.org>, <alex.bennee@linaro.org>, 
 Marcel Apfelbaum <marcel@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Adam Manzanares
 <a.manzanares@samsung.com>, Tong Zhang <ztong0001@gmail.com>
CC: <linux-cxl@vger.kernel.org>, Ben Widawsky <ben.widawsky@intel.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, Shameerali Kolothum Thodi
 <shameerali.kolothum.thodi@huawei.com>, <f4bug@amsat.org>, Peter Xu
 <peterx@redhat.com>, David Hildenbrand <david@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Saransh Gupta1 <saransh@ibm.com>, Shreyas Shah
 <shreyas.shah@elastics.cloud>, Chris Browy <cbrowy@avery-design.com>,
 "Samarth Saxena" <samarths@cadence.com>, Dan Williams
 <dan.j.williams@intel.com>, <k.jensen@samsung.com>, <dave@stgolabs.net>,
 Alison Schofield <alison.schofield@intel.com>
Subject: [PATCH v10 44/45] pci-bridge/cxl_downstream: Add a CXL switch
 downstream port
Date: Fri, 29 Apr 2022 15:41:09 +0100
Message-ID: <20220429144110.25167-45-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220429144110.25167-1-Jonathan.Cameron@huawei.com>
References: <20220429144110.25167-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml727-chm.china.huawei.com (10.201.108.78) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Emulation of a simple CXL Switch downstream port.
The Device ID has been allocated for this use.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/cxl/cxl-host.c              |  43 +++++-
 hw/pci-bridge/cxl_downstream.c | 249 +++++++++++++++++++++++++++++++++
 hw/pci-bridge/meson.build      |   2 +-
 3 files changed, 291 insertions(+), 3 deletions(-)

diff --git a/hw/cxl/cxl-host.c b/hw/cxl/cxl-host.c
index 469b3c4ced..317f5a37ca 100644
--- a/hw/cxl/cxl-host.c
+++ b/hw/cxl/cxl-host.c
@@ -130,8 +130,9 @@ static bool cxl_hdm_find_target(uint32_t *cache_mem, hwaddr addr,
 
 static PCIDevice *cxl_cfmws_find_device(CXLFixedWindow *fw, hwaddr addr)
 {
-    CXLComponentState *hb_cstate;
+    CXLComponentState *hb_cstate, *usp_cstate;
     PCIHostState *hb;
+    CXLUpstreamPort *usp;
     int rb_index;
     uint32_t *cache_mem;
     uint8_t target;
@@ -165,8 +166,46 @@ static PCIDevice *cxl_cfmws_find_device(CXLFixedWindow *fw, hwaddr addr)
     }
 
     d = pci_bridge_get_sec_bus(PCI_BRIDGE(rp))->devices[0];
+    if (!d) {
+        return NULL;
+    }
+
+    if (object_dynamic_cast(OBJECT(d), TYPE_CXL_TYPE3)) {
+        return d;
+    }
+
+    /*
+     * Could also be a switch.  Note only one level of switching currently
+     * supported.
+     */
+    if (!object_dynamic_cast(OBJECT(d), TYPE_CXL_USP)) {
+        return NULL;
+    }
+    usp = CXL_USP(d);
+
+    usp_cstate = cxl_usp_to_cstate(usp);
+    if (!usp_cstate) {
+        return NULL;
+    }
+
+    cache_mem = usp_cstate->crb.cache_mem_registers;
+
+    target_found = cxl_hdm_find_target(cache_mem, addr, &target);
+    if (!target_found) {
+        return NULL;
+    }
+
+    d = pcie_find_port_by_pn(&PCI_BRIDGE(d)->sec_bus, target);
+    if (!d) {
+        return NULL;
+    }
+
+    d = pci_bridge_get_sec_bus(PCI_BRIDGE(d))->devices[0];
+    if (!d) {
+        return NULL;
+    }
 
-    if (!d || !object_dynamic_cast(OBJECT(d), TYPE_CXL_TYPE3)) {
+    if (!object_dynamic_cast(OBJECT(d), TYPE_CXL_TYPE3)) {
         return NULL;
     }
 
diff --git a/hw/pci-bridge/cxl_downstream.c b/hw/pci-bridge/cxl_downstream.c
new file mode 100644
index 0000000000..f181960d5e
--- /dev/null
+++ b/hw/pci-bridge/cxl_downstream.c
@@ -0,0 +1,249 @@
+/*
+ * Emulated CXL Switch Downstream Port
+ *
+ * Copyright (c) 2022 Huawei Technologies.
+ *
+ * Based on xio31130_downstream.c
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "hw/pci/msi.h"
+#include "hw/pci/pcie.h"
+#include "hw/pci/pcie_port.h"
+#include "qapi/error.h"
+
+typedef struct CXLDownStreamPort {
+    /*< private >*/
+    PCIESlot parent_obj;
+
+    /*< public >*/
+    CXLComponentState cxl_cstate;
+} CXLDownstreamPort;
+
+#define TYPE_CXL_DSP "cxl-downstream"
+DECLARE_INSTANCE_CHECKER(CXLDownstreamPort, CXL_DSP, TYPE_CXL_DSP)
+
+#define CXL_DOWNSTREAM_PORT_MSI_OFFSET 0x70
+#define CXL_DOWNSTREAM_PORT_MSI_NR_VECTOR 1
+#define CXL_DOWNSTREAM_PORT_EXP_OFFSET 0x90
+#define CXL_DOWNSTREAM_PORT_AER_OFFSET 0x100
+#define CXL_DOWNSTREAM_PORT_DVSEC_OFFSET        \
+    (CXL_DOWNSTREAM_PORT_AER_OFFSET + PCI_ERR_SIZEOF)
+
+static void latch_registers(CXLDownstreamPort *dsp)
+{
+    uint32_t *reg_state = dsp->cxl_cstate.crb.cache_mem_registers;
+    uint32_t *write_msk = dsp->cxl_cstate.crb.cache_mem_regs_write_mask;
+
+    cxl_component_register_init_common(reg_state, write_msk,
+                                       CXL2_DOWNSTREAM_PORT);
+}
+
+/* TODO: Look at sharing this code acorss all CXL port types */
+static void cxl_dsp_dvsec_write_config(PCIDevice *dev, uint32_t addr,
+                                      uint32_t val, int len)
+{
+    CXLDownstreamPort *dsp = CXL_DSP(dev);
+    CXLComponentState *cxl_cstate = &dsp->cxl_cstate;
+
+    if (range_contains(&cxl_cstate->dvsecs[EXTENSIONS_PORT_DVSEC], addr)) {
+        uint8_t *reg = &dev->config[addr];
+        addr -= cxl_cstate->dvsecs[EXTENSIONS_PORT_DVSEC].lob;
+        if (addr == PORT_CONTROL_OFFSET) {
+            if (pci_get_word(reg) & PORT_CONTROL_UNMASK_SBR) {
+                /* unmask SBR */
+                qemu_log_mask(LOG_UNIMP, "SBR mask control is not supported\n");
+            }
+            if (pci_get_word(reg) & PORT_CONTROL_ALT_MEMID_EN) {
+                /* Alt Memory & ID Space Enable */
+                qemu_log_mask(LOG_UNIMP,
+                              "Alt Memory & ID space is not supported\n");
+
+            }
+        }
+    }
+}
+
+static void cxl_dsp_config_write(PCIDevice *d, uint32_t address,
+                                 uint32_t val, int len)
+{
+    uint16_t slt_ctl, slt_sta;
+
+    pcie_cap_slot_get(d, &slt_ctl, &slt_sta);
+    pci_bridge_write_config(d, address, val, len);
+    pcie_cap_flr_write_config(d, address, val, len);
+    pcie_cap_slot_write_config(d, slt_ctl, slt_sta, address, val, len);
+    pcie_aer_write_config(d, address, val, len);
+
+    cxl_dsp_dvsec_write_config(d, address, val, len);
+}
+
+static void cxl_dsp_reset(DeviceState *qdev)
+{
+    PCIDevice *d = PCI_DEVICE(qdev);
+    CXLDownstreamPort *dsp = CXL_DSP(qdev);
+
+    pcie_cap_deverr_reset(d);
+    pcie_cap_slot_reset(d);
+    pcie_cap_arifwd_reset(d);
+    pci_bridge_reset(qdev);
+
+    latch_registers(dsp);
+}
+
+static void build_dvsecs(CXLComponentState *cxl)
+{
+    uint8_t *dvsec;
+
+    dvsec = (uint8_t *)&(CXLDVSECPortExtensions){ 0 };
+    cxl_component_create_dvsec(cxl, CXL2_DOWNSTREAM_PORT,
+                               EXTENSIONS_PORT_DVSEC_LENGTH,
+                               EXTENSIONS_PORT_DVSEC,
+                               EXTENSIONS_PORT_DVSEC_REVID, dvsec);
+
+    dvsec = (uint8_t *)&(CXLDVSECPortFlexBus){
+        .cap                     = 0x27, /* Cache, IO, Mem, non-MLD */
+        .ctrl                    = 0x02, /* IO always enabled */
+        .status                  = 0x26, /* same */
+        .rcvd_mod_ts_data_phase1 = 0xef, /* WTF? */
+    };
+    cxl_component_create_dvsec(cxl, CXL2_DOWNSTREAM_PORT,
+                               PCIE_FLEXBUS_PORT_DVSEC_LENGTH_2_0,
+                               PCIE_FLEXBUS_PORT_DVSEC,
+                               PCIE_FLEXBUS_PORT_DVSEC_REVID_2_0, dvsec);
+
+    dvsec = (uint8_t *)&(CXLDVSECPortGPF){
+        .rsvd        = 0,
+        .phase1_ctrl = 1, /* 1μs timeout */
+        .phase2_ctrl = 1, /* 1μs timeout */
+    };
+    cxl_component_create_dvsec(cxl, CXL2_DOWNSTREAM_PORT,
+                               GPF_PORT_DVSEC_LENGTH, GPF_PORT_DVSEC,
+                               GPF_PORT_DVSEC_REVID, dvsec);
+
+    dvsec = (uint8_t *)&(CXLDVSECRegisterLocator){
+        .rsvd         = 0,
+        .reg0_base_lo = RBI_COMPONENT_REG | CXL_COMPONENT_REG_BAR_IDX,
+        .reg0_base_hi = 0,
+    };
+    cxl_component_create_dvsec(cxl, CXL2_DOWNSTREAM_PORT,
+                               REG_LOC_DVSEC_LENGTH, REG_LOC_DVSEC,
+                               REG_LOC_DVSEC_REVID, dvsec);
+}
+
+static void cxl_dsp_realize(PCIDevice *d, Error **errp)
+{
+    PCIEPort *p = PCIE_PORT(d);
+    PCIESlot *s = PCIE_SLOT(d);
+    CXLDownstreamPort *dsp = CXL_DSP(d);
+    CXLComponentState *cxl_cstate = &dsp->cxl_cstate;
+    ComponentRegisters *cregs = &cxl_cstate->crb;
+    MemoryRegion *component_bar = &cregs->component_registers;
+    int rc;
+
+    pci_bridge_initfn(d, TYPE_PCIE_BUS);
+    pcie_port_init_reg(d);
+
+    rc = msi_init(d, CXL_DOWNSTREAM_PORT_MSI_OFFSET,
+                  CXL_DOWNSTREAM_PORT_MSI_NR_VECTOR,
+                  true, true, errp);
+    if (rc) {
+        assert(rc == -ENOTSUP);
+        goto err_bridge;
+    }
+
+    rc = pcie_cap_init(d, CXL_DOWNSTREAM_PORT_EXP_OFFSET,
+                       PCI_EXP_TYPE_DOWNSTREAM, p->port,
+                       errp);
+    if (rc < 0) {
+        goto err_msi;
+    }
+
+    pcie_cap_flr_init(d);
+    pcie_cap_deverr_init(d);
+    pcie_cap_slot_init(d, s);
+    pcie_cap_arifwd_init(d);
+
+    pcie_chassis_create(s->chassis);
+    rc = pcie_chassis_add_slot(s);
+    if (rc < 0) {
+        error_setg(errp, "Can't add chassis slot, error %d", rc);
+        goto err_pcie_cap;
+    }
+
+    rc = pcie_aer_init(d, PCI_ERR_VER, CXL_DOWNSTREAM_PORT_AER_OFFSET,
+                       PCI_ERR_SIZEOF, errp);
+    if (rc < 0) {
+        goto err_chassis;
+    }
+
+    cxl_cstate->dvsec_offset = CXL_DOWNSTREAM_PORT_DVSEC_OFFSET;
+    cxl_cstate->pdev = d;
+    build_dvsecs(cxl_cstate);
+    cxl_component_register_block_init(OBJECT(d), cxl_cstate, TYPE_CXL_DSP);
+    pci_register_bar(d, CXL_COMPONENT_REG_BAR_IDX,
+                     PCI_BASE_ADDRESS_SPACE_MEMORY |
+                         PCI_BASE_ADDRESS_MEM_TYPE_64,
+                     component_bar);
+
+    return;
+
+ err_chassis:
+    pcie_chassis_del_slot(s);
+ err_pcie_cap:
+    pcie_cap_exit(d);
+ err_msi:
+    msi_uninit(d);
+ err_bridge:
+    pci_bridge_exitfn(d);
+}
+
+static void cxl_dsp_exitfn(PCIDevice *d)
+{
+    PCIESlot *s = PCIE_SLOT(d);
+
+    pcie_aer_exit(d);
+    pcie_chassis_del_slot(s);
+    pcie_cap_exit(d);
+    msi_uninit(d);
+    pci_bridge_exitfn(d);
+}
+
+static void cxl_dsp_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(oc);
+
+    k->is_bridge = true;
+    k->config_write = cxl_dsp_config_write;
+    k->realize = cxl_dsp_realize;
+    k->exit = cxl_dsp_exitfn;
+    k->vendor_id = 0x19e5; /* Huawei */
+    k->device_id = 0xa129; /* Emulated CXL Switch Downstream Port */
+    k->revision = 0;
+    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
+    dc->desc = "CXL Switch Downstream Port";
+    dc->reset = cxl_dsp_reset;
+}
+
+static const TypeInfo cxl_dsp_info = {
+    .name = TYPE_CXL_DSP,
+    .instance_size = sizeof(CXLDownstreamPort),
+    .parent = TYPE_PCIE_SLOT,
+    .class_init = cxl_dsp_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { INTERFACE_PCIE_DEVICE },
+        { INTERFACE_CXL_DEVICE },
+        { }
+    },
+};
+
+static void cxl_dsp_register_type(void)
+{
+    type_register_static(&cxl_dsp_info);
+}
+
+type_init(cxl_dsp_register_type);
diff --git a/hw/pci-bridge/meson.build b/hw/pci-bridge/meson.build
index 4a8c26b5a1..53cc53314a 100644
--- a/hw/pci-bridge/meson.build
+++ b/hw/pci-bridge/meson.build
@@ -5,7 +5,7 @@ pci_ss.add(when: 'CONFIG_IOH3420', if_true: files('ioh3420.c'))
 pci_ss.add(when: 'CONFIG_PCIE_PORT', if_true: files('pcie_root_port.c', 'gen_pcie_root_port.c', 'pcie_pci_bridge.c'))
 pci_ss.add(when: 'CONFIG_PXB', if_true: files('pci_expander_bridge.c'))
 pci_ss.add(when: 'CONFIG_XIO3130', if_true: files('xio3130_upstream.c', 'xio3130_downstream.c'))
-pci_ss.add(when: 'CONFIG_CXL', if_true: files('cxl_root_port.c', 'cxl_upstream.c'))
+pci_ss.add(when: 'CONFIG_CXL', if_true: files('cxl_root_port.c', 'cxl_upstream.c', 'cxl_downstream.c'))
 
 # NewWorld PowerMac
 pci_ss.add(when: 'CONFIG_DEC_PCI', if_true: files('dec.c'))
-- 
2.32.0


