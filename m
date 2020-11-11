Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DB72AE86F
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 06:51:38 +0100 (CET)
Received: from localhost ([::1]:52168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcj2f-0000m7-RQ
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 00:51:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kciyr-0003x6-Eq
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 00:47:41 -0500
Received: from mga14.intel.com ([192.55.52.115]:60780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kciyn-0008P5-6C
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 00:47:41 -0500
IronPort-SDR: LKPm4htbYuZENCU/q2WixzbiHOwp32Y6GVvssKPayMvcP4yjca+4EjjT3gngPVU66dsJRVkNHn
 m2ETTeJWbYDw==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="169314662"
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; d="scan'208";a="169314662"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 21:47:29 -0800
IronPort-SDR: KkI/jBiq3XExyHMBJnzN8sQOyVqB8Lnqtmdnm+56sw83SVSQdSzXayjUmVuNLLdoBsAh4SBBYm
 aided59aXU/A==
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; d="scan'208";a="308710393"
Received: from hccoutan-mobl1.amr.corp.intel.com (HELO bwidawsk-mobl5.local)
 ([10.252.131.159])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 21:47:28 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 03/25] hw/cxl/component: Introduce CXL components (8.1.x,
 8.2.5)
Date: Tue, 10 Nov 2020 21:47:02 -0800
Message-Id: <20201111054724.794888-4-ben.widawsky@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201111054724.794888-1-ben.widawsky@intel.com>
References: <20201111054724.794888-1-ben.widawsky@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115;
 envelope-from=ben.widawsky@intel.com; helo=mga14.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 00:47:28
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Vishal Verma <vishal.l.verma@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Ben Widawsky <ben.widawsky@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A CXL 2.0 component is any entity in the CXL topology. All components
have a analogous function in PCIe. Except for the CXL host bridge, all
have a PCIe config space that is accessible via the common PCIe
mechanisms. CXL components are enumerated via DVSEC fields in the
extended PCIe header space. CXL components will minimally implement some
subset of CXL.mem and CXL.cache registers defined in 8.2.5 of the CXL
2.0 specification. Two headers and a utility library are introduced to
support the minimum functionality needed to enumerate components.

The cxl_pci header manages bits associated with PCI, specifically the
DVSEC and related fields. The cxl_component.h variant has data
structures and APIs that are useful for drivers implementing any of the
CXL 2.0 components. The library takes care of making use of the DVSEC
bits and the CXL.[mem|cache] regisetrs.

None of the mechanisms required to enumerate a CXL capable hostbridge
are introduced at this point.

Note that the CXL.mem and CXL.cache registers used are always 4B wide.
It's possible in the future that this constraint will not hold.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>

--
It's tempting to have a more generalized DVSEC infrastructure. As far as
I can tell, the amount this would actually save in terms of code is
minimal because most of DVESC is vendor specific.
---
 MAINTAINERS                    |   6 ++
 hw/Kconfig                     |   1 +
 hw/cxl/Kconfig                 |   3 +
 hw/cxl/cxl-component-utils.c   | 192 +++++++++++++++++++++++++++++++++
 hw/cxl/cxl-device-utils.c      |   0
 hw/cxl/meson.build             |   3 +
 hw/meson.build                 |   1 +
 include/hw/cxl/cxl.h           |  17 +++
 include/hw/cxl/cxl_component.h | 181 +++++++++++++++++++++++++++++++
 include/hw/cxl/cxl_pci.h       | 133 +++++++++++++++++++++++
 10 files changed, 537 insertions(+)
 create mode 100644 hw/cxl/Kconfig
 create mode 100644 hw/cxl/cxl-component-utils.c
 create mode 100644 hw/cxl/cxl-device-utils.c
 create mode 100644 hw/cxl/meson.build
 create mode 100644 include/hw/cxl/cxl.h
 create mode 100644 include/hw/cxl/cxl_component.h
 create mode 100644 include/hw/cxl/cxl_pci.h

diff --git a/MAINTAINERS b/MAINTAINERS
index c1d16026ba..02b8e2274d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2184,6 +2184,12 @@ F: qapi/block*.json
 F: qapi/transaction.json
 T: git https://repo.or.cz/qemu/armbru.git block-next
 
+Compute Express Link
+M: Ben Widawsky <ben.widawsky@intel.com>
+S: Supported
+F: hw/cxl/
+F: include/hw/cxl/
+
 Dirty Bitmaps
 M: Eric Blake <eblake@redhat.com>
 M: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
diff --git a/hw/Kconfig b/hw/Kconfig
index 4de1797ffd..efed27805a 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -6,6 +6,7 @@ source audio/Kconfig
 source block/Kconfig
 source char/Kconfig
 source core/Kconfig
+source cxl/Kconfig
 source display/Kconfig
 source dma/Kconfig
 source gpio/Kconfig
diff --git a/hw/cxl/Kconfig b/hw/cxl/Kconfig
new file mode 100644
index 0000000000..8e67519b16
--- /dev/null
+++ b/hw/cxl/Kconfig
@@ -0,0 +1,3 @@
+config CXL
+    bool
+    default y if PCI_EXPRESS
diff --git a/hw/cxl/cxl-component-utils.c b/hw/cxl/cxl-component-utils.c
new file mode 100644
index 0000000000..c52bd5bfc7
--- /dev/null
+++ b/hw/cxl/cxl-component-utils.c
@@ -0,0 +1,192 @@
+/*
+ * CXL Utility library for components
+ *
+ * Copyright(C) 2020 Intel Corporation.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2. See the
+ * COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "hw/pci/pci.h"
+#include "hw/cxl/cxl.h"
+
+static uint64_t cxl_cache_mem_read_reg(void *opaque, hwaddr offset,
+                                       unsigned size)
+{
+    CXLComponentState *cxl_cstate = opaque;
+    ComponentRegisters *cregs = &cxl_cstate->crb;
+    uint32_t *cache_mem = cregs->cache_mem_registers;
+
+    if (size != 4) {
+        qemu_log_mask(LOG_UNIMP, "%uB component register read (RAZ)\n", size);
+        return 0;
+    }
+
+    if (cregs->special_ops && cregs->special_ops->read) {
+        return cregs->special_ops->read(cxl_cstate, offset, size);
+    } else {
+        return cache_mem[offset >> 2];
+    }
+}
+
+static void cxl_cache_mem_write_reg(void *opaque, hwaddr offset, uint64_t value,
+                                    unsigned size)
+{
+    CXLComponentState *cxl_cstate = opaque;
+    ComponentRegisters *cregs = &cxl_cstate->crb;
+
+    if (size != 4) {
+        qemu_log_mask(LOG_UNIMP, "%uB component register write (WI)\n", size);
+        return;
+    }
+
+    if (cregs->special_ops && cregs->special_ops->write) {
+        cregs->special_ops->write(cxl_cstate, offset, value, size);
+    }
+}
+
+static const MemoryRegionOps cache_mem_ops = {
+    .read = cxl_cache_mem_read_reg,
+    .write = cxl_cache_mem_write_reg,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+};
+
+void cxl_component_register_block_init(Object *obj,
+                                       CXLComponentState *cxl_cstate,
+                                       const char *type)
+{
+    ComponentRegisters *cregs = &cxl_cstate->crb;
+
+    memory_region_init(&cregs->component_registers, obj, type, 0x10000);
+    memory_region_init_io(&cregs->io, obj, NULL, cregs, ".io", 0x1000);
+    memory_region_init_io(&cregs->cache_mem, obj, &cache_mem_ops, cregs,
+                          ".cache_mem", 0x1000);
+
+    memory_region_add_subregion(&cregs->component_registers, 0, &cregs->io);
+    memory_region_add_subregion(&cregs->component_registers, 0x1000,
+                                &cregs->cache_mem);
+}
+
+static void ras_init_common(uint32_t *reg_state)
+{
+    reg_state[R_CXL_RAS_UNC_ERR_STATUS] = 0;
+    reg_state[R_CXL_RAS_UNC_ERR_MASK] = 0x1efff;
+    reg_state[R_CXL_RAS_UNC_ERR_SEVERITY] = 0x1efff;
+    reg_state[R_CXL_RAS_COR_ERR_STATUS] = 0;
+    reg_state[R_CXL_RAS_COR_ERR_MASK] = 0x3f;
+    reg_state[R_CXL_RAS_ERR_CAP_CTRL] = 0; /* CXL switches and devices must set */
+}
+
+static void hdm_init_common(uint32_t *reg_state)
+{
+    ARRAY_FIELD_DP32(reg_state, CXL_HDM_DECODER_CAPABILITY, DECODER_COUNT, 0);
+    ARRAY_FIELD_DP32(reg_state, CXL_HDM_DECODER_GLOBAL_CONTROL, HDM_DECODER_ENABLE, 0);
+}
+
+void cxl_component_register_init_common(uint32_t *reg_state, enum reg_type type)
+{
+    int caps = 0;
+    switch (type) {
+    case CXL2_DOWNSTREAM_PORT:
+    case CXL2_DEVICE:
+        /* CAP, RAS, Link */
+        caps = 3;
+        break;
+    case CXL2_UPSTREAM_PORT:
+    case CXL2_TYPE3_DEVICE:
+    case CXL2_LOGICAL_DEVICE:
+        /* + HDM */
+        caps = 4;
+        break;
+    case CXL2_ROOT_PORT:
+        /* + Extended Security, + Snoop */
+        caps = 6;
+        break;
+    default:
+        abort();
+    }
+
+    memset(reg_state, 0, 0x1000);
+
+    /* CXL Capability Header Register */
+    ARRAY_FIELD_DP32(reg_state, CXL_CAPABILITY_HEADER, ID, 1);
+    ARRAY_FIELD_DP32(reg_state, CXL_CAPABILITY_HEADER, VERSION, 1);
+    ARRAY_FIELD_DP32(reg_state, CXL_CAPABILITY_HEADER, CACHE_MEM_VERSION, 1);
+    ARRAY_FIELD_DP32(reg_state, CXL_CAPABILITY_HEADER, ARRAY_SIZE, caps);
+
+
+#define init_cap_reg(reg, id, version)                                        \
+    do {                                                                      \
+        int which = R_CXL_##reg##_CAPABILITY_HEADER;                          \
+        reg_state[which] = FIELD_DP32(reg_state[which],                       \
+                                      CXL_##reg##_CAPABILITY_HEADER, ID, id); \
+        reg_state[which] =                                                    \
+            FIELD_DP32(reg_state[which], CXL_##reg##_CAPABILITY_HEADER,       \
+                       VERSION, version);                                     \
+        reg_state[which] =                                                    \
+            FIELD_DP32(reg_state[which], CXL_##reg##_CAPABILITY_HEADER, PTR,  \
+                       CXL_##reg##_REGISTERS_OFFSET);                         \
+    } while (0)
+
+    init_cap_reg(RAS, 2, 1);
+    ras_init_common(reg_state);
+
+    init_cap_reg(LINK, 4, 2);
+
+    if (caps < 4) {
+        return;
+    }
+
+    init_cap_reg(HDM, 5, 1);
+    hdm_init_common(reg_state);
+
+    if (caps < 6) {
+        return;
+    }
+
+    init_cap_reg(EXTSEC, 6, 1);
+    init_cap_reg(SNOOP, 8, 1);
+
+#undef init_cap_reg
+}
+
+/*
+ * Helper to creates a DVSEC header for a CXL entity. The caller is responsible
+ * for tracking the valid offset.
+ *
+ * This function will build the DVSEC header on behalf of the caller and then
+ * copy in the remaining data for the vendor specific bits.
+ */
+void cxl_component_create_dvsec(CXLComponentState *cxl, uint16_t length,
+                                uint16_t type, uint8_t rev, uint8_t *body)
+{
+    PCIDevice *pdev = cxl->pdev;
+    uint16_t offset = cxl->dvsec_offset;
+
+    assert(offset >= PCI_CFG_SPACE_SIZE && offset < PCI_CFG_SPACE_EXP_SIZE);
+    assert((length & 0xf000) == 0);
+    assert((rev & 0xf0) == 0);
+
+    /* Create the DVSEC in the MCFG space */
+    pcie_add_capability(pdev, PCI_EXT_CAP_ID_DVSEC, 1, offset, length);
+    pci_set_long(pdev->config + offset + PCIE_DVSEC_HEADER_OFFSET,
+                 (length << 20) | (rev << 16) | CXL_VENDOR_ID);
+    pci_set_word(pdev->config + offset + PCIE_DVSEC_ID_OFFSET, type);
+    memcpy(pdev->config + offset + sizeof(struct dvsec_header),
+           body + sizeof(struct dvsec_header),
+           length - sizeof(struct dvsec_header));
+
+    /* Update state for future DVSEC additions */
+    range_init_nofail(&cxl->dvsecs[type], cxl->dvsec_offset, length);
+    cxl->dvsec_offset += length;
+}
diff --git a/hw/cxl/cxl-device-utils.c b/hw/cxl/cxl-device-utils.c
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/hw/cxl/meson.build b/hw/cxl/meson.build
new file mode 100644
index 0000000000..00c3876a0f
--- /dev/null
+++ b/hw/cxl/meson.build
@@ -0,0 +1,3 @@
+softmmu_ss.add(when: 'CONFIG_CXL', if_true: files(
+  'cxl-component-utils.c',
+))
diff --git a/hw/meson.build b/hw/meson.build
index 010de7219c..3e440c341a 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -6,6 +6,7 @@ subdir('block')
 subdir('char')
 subdir('core')
 subdir('cpu')
+subdir('cxl')
 subdir('display')
 subdir('dma')
 subdir('gpio')
diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
new file mode 100644
index 0000000000..55f6cc30a5
--- /dev/null
+++ b/include/hw/cxl/cxl.h
@@ -0,0 +1,17 @@
+/*
+ * QEMU CXL Support
+ *
+ * Copyright (c) 2020 Intel
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2. See the
+ * COPYING file in the top-level directory.
+ */
+
+#ifndef CXL_H
+#define CXL_H
+
+#include "cxl_pci.h"
+#include "cxl_component.h"
+
+#endif
+
diff --git a/include/hw/cxl/cxl_component.h b/include/hw/cxl/cxl_component.h
new file mode 100644
index 0000000000..014d9d10d3
--- /dev/null
+++ b/include/hw/cxl/cxl_component.h
@@ -0,0 +1,181 @@
+/*
+ * QEMU CXL Component
+ *
+ * Copyright (c) 2020 Intel
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2. See the
+ * COPYING file in the top-level directory.
+ */
+
+#ifndef CXL_COMPONENT_H
+#define CXL_COMPONENT_H
+
+/* CXL 2.0 - 8.2.4 */
+#define CXL2_COMPONENT_IO_REGION_SIZE 0x1000
+#define CXL2_COMPONENT_CM_REGION_SIZE 0x1000
+#define CXL2_COMPONENT_BLOCK_SIZE 0x10000
+
+#include "qemu/range.h"
+#include "qemu/typedefs.h"
+#include "hw/register.h"
+
+enum reg_type {
+    CXL2_DEVICE,
+    CXL2_TYPE3_DEVICE,
+    CXL2_LOGICAL_DEVICE,
+    CXL2_ROOT_PORT,
+    CXL2_UPSTREAM_PORT,
+    CXL2_DOWNSTREAM_PORT
+};
+
+/*
+ * Capability registers are defined at the top of the CXL.cache/mem region and
+ * are packed. For our purposes we will always define the caps in the same
+ * order.
+ * CXL 2.0 - 8.2.5 Table 142 for details.
+ */
+
+/* CXL 2.0 - 8.2.5.1 */
+REG32(CXL_CAPABILITY_HEADER, 0)
+    FIELD(CXL_CAPABILITY_HEADER, ID, 0, 16)
+    FIELD(CXL_CAPABILITY_HEADER, VERSION, 16, 4)
+    FIELD(CXL_CAPABILITY_HEADER, CACHE_MEM_VERSION, 20, 4)
+    FIELD(CXL_CAPABILITY_HEADER, ARRAY_SIZE, 24, 8)
+
+#define CXLx_CAPABILITY_HEADER(type, offset)                  \
+    REG32(CXL_##type##_CAPABILITY_HEADER, offset)             \
+        FIELD(CXL_##type##_CAPABILITY_HEADER, ID, 0, 16)      \
+        FIELD(CXL_##type##_CAPABILITY_HEADER, VERSION, 16, 4) \
+        FIELD(CXL_##type##_CAPABILITY_HEADER, PTR, 20, 12)
+CXLx_CAPABILITY_HEADER(RAS, 0x4)
+CXLx_CAPABILITY_HEADER(LINK, 0x8)
+CXLx_CAPABILITY_HEADER(HDM, 0xc)
+CXLx_CAPABILITY_HEADER(EXTSEC, 0x10)
+CXLx_CAPABILITY_HEADER(SNOOP, 0x14)
+
+/*
+ * Capability structures contain the actual registers that the CXL component
+ * implements. Some of these are specific to certain types of components, but
+ * this implementation leaves enough space regardless.
+ */
+/* 8.2.5.9 - CXL RAS Capability Structure */
+#define CXL_RAS_REGISTERS_OFFSET 0x80 /* Give ample space for caps before this */
+#define CXL_RAS_REGISTERS_SIZE   0x58
+REG32(CXL_RAS_UNC_ERR_STATUS, CXL_RAS_REGISTERS_OFFSET)
+REG32(CXL_RAS_UNC_ERR_MASK, CXL_RAS_REGISTERS_OFFSET + 0x4)
+REG32(CXL_RAS_UNC_ERR_SEVERITY, CXL_RAS_REGISTERS_OFFSET + 0x8)
+REG32(CXL_RAS_COR_ERR_STATUS, CXL_RAS_REGISTERS_OFFSET + 0xc)
+REG32(CXL_RAS_COR_ERR_MASK, CXL_RAS_REGISTERS_OFFSET + 0x10)
+REG32(CXL_RAS_ERR_CAP_CTRL, CXL_RAS_REGISTERS_OFFSET + 0x14)
+
+/* 8.2.5.10 - CXL Security Capability Structure */
+#define CXL_SEC_REGISTERS_OFFSET (CXL_RAS_REGISTERS_OFFSET + CXL_RAS_REGISTERS_SIZE)
+#define CXL_SEC_REGISTERS_SIZE   0 /* We don't implement 1.1 downstream ports */
+
+/* 8.2.5.11 - CXL Link Capability Structure */
+#define CXL_LINK_REGISTERS_OFFSET (CXL_SEC_REGISTERS_OFFSET + CXL_SEC_REGISTERS_SIZE)
+#define CXL_LINK_REGISTERS_SIZE   0x38
+
+/* 8.2.5.12 - CXL HDM Decoder Capability Structure */
+#define HDM_DECODE_MAX 10 /* 8.2.5.12.1 */
+#define CXL_HDM_REGISTERS_OFFSET \
+    (CXL_LINK_REGISTERS_OFFSET + CXL_LINK_REGISTERS_SIZE) /* 8.2.5.12 */
+#define CXL_HDM_REGISTERS_SIZE (0x20 + HDM_DECODE_MAX * 10)
+#define HDM_DECODER_INIT(n, base)                          \
+    REG32(CXL_HDM_DECODER##n##_BASE_LO, base + 0x10)       \
+        FIELD(CXL_HDM_DECODER##n##_BASE_LO, L, 28, 4)      \
+    REG32(CXL_HDM_DECODER##n##_BASE_HI, base + 0x14)       \
+        FIELD(CXL_HDM_DECODER##n##_BASE_HI, H, 0, 32)      \
+    REG32(CXL_HDM_DECODER##n##_SIZE_LO, base + 0x18)       \
+    REG32(CXL_HDM_DECODER##n##_SIZE_HI, base + 0x1C)       \
+    REG32(CXL_HDM_DECODER##n##_CTRL, base + 0x20)          \
+        FIELD(CXL_HDM_DECODER##n##_CTRL, IG, 0, 4)         \
+        FIELD(CXL_HDM_DECODER##n##_CTRL, IW, 4, 4)         \
+        FIELD(CXL_HDM_DECODER##n##_CTRL, LOCK, 8, 1)       \
+        FIELD(CXL_HDM_DECODER##n##_CTRL, COMMIT, 9, 1)     \
+        FIELD(CXL_HDM_DECODER##n##_CTRL, COMMITTED, 10, 1) \
+        FIELD(CXL_HDM_DECODER##n##_CTRL, ERROR, 11, 1)     \
+        FIELD(CXL_HDM_DECODER##n##_CTRL, TYPE, 12, 1)      \
+    REG32(CXL_HDM_DECODER##n##_TARGET_LIST_LO, 0x24)       \
+    REG32(CXL_HDM_DECODER##n##_TARGET_LIST_HI, 0x28)
+REG32(CXL_HDM_DECODER_CAPABILITY, 0)
+    FIELD(CXL_HDM_DECODER_CAPABILITY, DECODER_COUNT, 0, 4)
+    FIELD(CXL_HDM_DECODER_CAPABILITY, TARGET_COUNT, 4, 4)
+    FIELD(CXL_HDM_DECODER_CAPABILITY, INTERLEAVE_256B, 8, 1)
+    FIELD(CXL_HDM_DECODER_CAPABILITY, INTELEAVE_4K, 9, 1)
+    FIELD(CXL_HDM_DECODER_CAPABILITY, POISON_ON_ERR_CAP, 10, 1)
+REG32(CXL_HDM_DECODER_GLOBAL_CONTROL, 0)
+    FIELD(CXL_HDM_DECODER_GLOBAL_CONTROL, POISON_ON_ERR_EN, 0, 1)
+    FIELD(CXL_HDM_DECODER_GLOBAL_CONTROL, HDM_DECODER_ENABLE, 1, 1)
+
+HDM_DECODER_INIT(0, CXL_HDM_REGISTERS_OFFSET);
+
+/* 8.2.5.13 - CXL Extended Security Capability Structure (Root complex only) */
+#define EXTSEC_ENTRY_MAX        256
+#define CXL_EXTSEC_REGISTERS_OFFSET (CXL_HDM_REGISTERS_OFFSET + CXL_HDM_REGISTERS_SIZE)
+#define CXL_EXTSEC_REGISTERS_SIZE   (8 * EXTSEC_ENTRY_MAX + 4)
+
+/* 8.2.5.14 - CXL IDE Capability Structure */
+#define CXL_IDE_REGISTERS_OFFSET (CXL_EXTSEC_REGISTERS_OFFSET + CXL_EXTSEC_REGISTERS_SIZE)
+#define CXL_IDE_REGISTERS_SIZE   0
+
+/* 8.2.5.15 - CXL Snoop Filter Capability Structure */
+#define CXL_SNOOP_REGISTERS_OFFSET (CXL_IDE_REGISTERS_OFFSET + CXL_IDE_REGISTERS_SIZE)
+#define CXL_SNOOP_REGISTERS_SIZE   0x8
+
+_Static_assert((CXL_SNOOP_REGISTERS_OFFSET + CXL_SNOOP_REGISTERS_SIZE) < 0x1000,
+               "No space for registers");
+
+typedef struct component_registers {
+    /*
+     * Main memory region to be registered with QEMU core.
+     */
+    MemoryRegion component_registers;
+
+    /*
+     * 8.2.4 Table 141:
+     *   0x0000 - 0x0fff CXL.io registers
+     *   0x1000 - 0x1fff CXL.cache and CXL.mem
+     *   0x2000 - 0xdfff Implementation specific
+     *   0xe000 - 0xe3ff CXL ARB/MUX registers
+     *   0xe400 - 0xffff RSVD
+     */
+    uint32_t io_registers[CXL2_COMPONENT_IO_REGION_SIZE >> 2];
+    MemoryRegion io;
+
+    uint32_t cache_mem_registers[CXL2_COMPONENT_CM_REGION_SIZE >> 2];
+    MemoryRegion cache_mem;
+
+    MemoryRegion impl_specific;
+    MemoryRegion arb_mux;
+    MemoryRegion rsvd;
+
+    /* special_ops is used for any component that needs any specific handling */
+    MemoryRegionOps *special_ops;
+} ComponentRegisters;
+
+/*
+ * A CXL component represents all entities in a CXL hierarchy. This includes,
+ * host bridges, root ports, upstream/downstream ports, and devices
+ */
+typedef struct cxl_component {
+    ComponentRegisters crb;
+    union {
+        struct {
+            Range dvsecs[CXL20_MAX_DVSEC];
+            uint16_t dvsec_offset;
+            struct PCIDevice *pdev;
+        };
+    };
+} CXLComponentState;
+
+void cxl_component_register_block_init(Object *obj,
+                                       CXLComponentState *cxl_cstate,
+                                       const char *type);
+void cxl_component_register_init_common(uint32_t *reg_state,
+                                        enum reg_type type);
+
+void cxl_component_create_dvsec(CXLComponentState *cxl_cstate, uint16_t length,
+                                uint16_t type, uint8_t rev, uint8_t *body);
+
+#endif
diff --git a/include/hw/cxl/cxl_pci.h b/include/hw/cxl/cxl_pci.h
new file mode 100644
index 0000000000..b403770424
--- /dev/null
+++ b/include/hw/cxl/cxl_pci.h
@@ -0,0 +1,133 @@
+/*
+ * QEMU CXL PCI interfaces
+ *
+ * Copyright (c) 2020 Intel
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2. See the
+ * COPYING file in the top-level directory.
+ */
+
+#ifndef CXL_PCI_H
+#define CXL_PCI_H
+
+#include "hw/pci/pci.h"
+#include "hw/pci/pcie.h"
+
+#define CXL_VENDOR_ID 0x1e98
+
+#define PCIE_DVSEC_HEADER_OFFSET 0x4 /* Offset from start of extend cap */
+#define PCIE_DVSEC_ID_OFFSET     0x8
+
+#define PCIE_CXL_DEVICE_DVSEC_LENGTH 0x38
+#define PCIE_CXL_DEVICE_DVSEC_REVID  1
+
+#define EXTENSIONS_PORT_DVSEC_LENGTH 0x28
+#define EXTENSIONS_PORT_DVSEC_REVID  1
+
+#define GPF_PORT_DVSEC_LENGTH 0x10
+#define GPF_PORT_DVSEC_REVID  0
+
+#define PCIE_FLEXBUS_PORT_DVSEC_LENGTH_2_0 0x14
+#define PCIE_FLEXBUS_PORT_DVSEC_REVID_2_0  1
+
+#define REG_LOC_DVSEC_LENGTH 0x24
+#define REG_LOC_DVSEC_REVID  0
+
+enum {
+    PCIE_CXL_DEVICE_DVSEC      = 0,
+    NON_CXL_FUNCTION_MAP_DVSEC = 2,
+    EXTENSIONS_PORT_DVSEC      = 3,
+    GPF_PORT_DVSEC             = 4,
+    GPF_DEVICE_DVSEC           = 5,
+    PCIE_FLEXBUS_PORT_DVSEC    = 7,
+    REG_LOC_DVSEC              = 8,
+    MLD_DVSEC                  = 9,
+    CXL20_MAX_DVSEC
+};
+
+struct dvsec_header {
+    uint32_t cap_hdr;
+    uint32_t dv_hdr1;
+    uint16_t dv_hdr2;
+} __attribute__((__packed__));
+_Static_assert(sizeof(struct dvsec_header) == 10,
+               "dvsec header size incorrect");
+
+/*
+ * CXL 2.0 devices must implement certain DVSEC IDs, and can [optionally]
+ * implement others.
+ *
+ * CXL 2.0 Device: 0, [2], 5, 8
+ * CXL 2.0 RP: 3, 4, 7, 8
+ * CXL 2.0 Upstream Port: [2], 7, 8
+ * CXL 2.0 Downstream Port: 3, 4, 7, 8
+ */
+
+/* CXL 2.0 - 8.1.5 (ID 0003) */
+struct dvsec_port {
+    struct dvsec_header hdr;
+    uint16_t status;
+    uint16_t control;
+    uint8_t alt_bus_base;
+    uint8_t alt_bus_limit;
+    uint16_t alt_memory_base;
+    uint16_t alt_memory_limit;
+    uint16_t alt_prefetch_base;
+    uint16_t alt_prefetch_limit;
+    uint32_t alt_prefetch_base_high;
+    uint32_t alt_prefetch_base_low;
+    uint32_t rcrb_base;
+    uint32_t rcrb_base_high;
+};
+_Static_assert(sizeof(struct dvsec_port) == 0x28, "dvsec port size incorrect");
+#define PORT_CONTROL_OVERRIDE_OFFSET 0xc
+#define PORT_CONTROL_UNMASK_SBR      1
+#define PORT_CONTROL_ALT_MEMID_EN    4
+
+/* CXL 2.0 - 8.1.6 GPF DVSEC (ID 0004) */
+struct dvsec_port_gpf {
+    struct dvsec_header hdr;
+    uint16_t rsvd;
+    uint16_t phase1_ctrl;
+    uint16_t phase2_ctrl;
+};
+_Static_assert(sizeof(struct dvsec_port_gpf) == 0x10,
+               "dvsec port GPF size incorrect");
+
+/* CXL 2.0 - 8.1.8/8.2.1.3 Flexbus DVSEC (ID 0007) */
+struct dvsec_port_flexbus {
+    struct dvsec_header hdr;
+    uint16_t cap;
+    uint16_t ctrl;
+    uint16_t status;
+    uint32_t rcvd_mod_ts_data;
+};
+_Static_assert(sizeof(struct dvsec_port_flexbus) == 0x14,
+               "dvsec port flexbus size incorrect");
+
+/* CXL 2.0 - 8.1.9 Register Locator DVSEC (ID 0008) */
+struct dvsec_register_locator {
+    struct dvsec_header hdr;
+    uint16_t rsvd;
+    uint32_t reg0_base_lo;
+    uint32_t reg0_base_hi;
+    uint32_t reg1_base_lo;
+    uint32_t reg1_base_hi;
+    uint32_t reg2_base_lo;
+    uint32_t reg2_base_hi;
+};
+_Static_assert(sizeof(struct dvsec_register_locator) == 0x24,
+               "dvsec register locator size incorrect");
+#define BEI_BAR_10H 0
+#define BEI_BAR_14H 1
+#define BEI_BAR_18H 2
+#define BEI_BAR_1cH 3
+#define BEI_BAR_20H 4
+#define BEI_BAR_24H 5
+
+#define RBI_EMPTY          0
+#define RBI_COMPONENT_REG  (1 << 8)
+#define RBI_BAR_VIRT_ACL   (2 << 8)
+#define RBI_CXL_DEVICE_REG (3 << 8)
+
+#endif
-- 
2.29.2


