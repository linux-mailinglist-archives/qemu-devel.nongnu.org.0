Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 505E03A2CD0
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 15:20:27 +0200 (CEST)
Received: from localhost ([::1]:46420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrKbi-0007dH-B1
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 09:20:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@server4.localdomain>)
 id 1lrKXr-0008Sj-DN
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:16:27 -0400
Received: from static-71-162-116-19.bstnma.fios.verizon.net
 ([71.162.116.19]:57808 helo=server4.localdomain)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chris@server4.localdomain>) id 1lrKXo-00010q-D8
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:16:26 -0400
Received: by server4.localdomain (Postfix, from userid 503)
 id 535186031112B; Thu, 10 Jun 2021 09:16:22 -0400 (EDT)
From: Chris Browy <cbrowy@avery-design.com>
To: mst@redhat.com
Subject: [PATCH v6 cxl2.0-v6-doe 4/6] cxl/compliance: CXL Compliance Data
 Object Exchange implementation
Date: Thu, 10 Jun 2021 09:16:20 -0400
Message-Id: <1623330980-18464-1-git-send-email-cbrowy@avery-design.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1623329999-15662-1-git-send-email-cbrowy@avery-design.com>
References: <1623329999-15662-1-git-send-email-cbrowy@avery-design.com>
Received-SPF: none client-ip=71.162.116.19;
 envelope-from=chris@server4.localdomain; helo=server4.localdomain
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, KHOP_HELO_FCRDNS=0.398,
 NO_DNS_FOR_FROM=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: ben.widawsky@intel.com, david@redhat.com, qemu-devel@nongnu.org,
 vishal.l.verma@intel.com, jgroves@micron.com,
 Chris Browy <cbrowy@avery-design.com>, armbru@redhat.com, f4bug@amsat.org,
 hchkuo@avery-design.com.tw, tyshao@avery-design.com.tw,
 jonathan.cameron@huawei.com, imammedo@redhat.com, dan.j.williams@intel.com,
 ira.weiny@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: hchkuo <hchkuo@avery-design.com.tw>

The Data Object Exchange implementation of CXL Compliance Mode is
referring to "Compute Express Link (CXL) Specification, Rev. 2.0, Oct.
2020".

The data structure of CXL compliance request and response is added to
the header. Due to the scope limitation of QEMU, most of the compliance
response is limited to returning corresponding length.

A DOE capability of CXL Compliance is added to hw/mem/cxl_type3.c with
capability offset 0x160. The config read/write to this capability range
can be generated in the OS to request the Compliance info.

Signed-off-by: hchkuo <hchkuo@avery-design.com.tw>
Signed-off-by: Chris Browy <cbrowy@avery-design.com>
---
 hw/mem/cxl_type3.c              | 147 ++++++++++++++++
 include/hw/cxl/cxl_compliance.h | 293 ++++++++++++++++++++++++++++++++
 include/hw/cxl/cxl_component.h  |   3 +
 include/hw/cxl/cxl_device.h     |   3 +
 include/hw/cxl/cxl_pci.h        |   1 +
 5 files changed, 447 insertions(+)
 create mode 100644 include/hw/cxl/cxl_compliance.h

diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index bf33ddb915..569872eb36 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -13,6 +13,134 @@
 #include "qemu/rcu.h"
 #include "sysemu/hostmem.h"
 #include "hw/cxl/cxl.h"
+#include "hw/pci/msi.h"
+#include "hw/pci/msix.h"
+
+#define DWORD_BYTE 4
+
+bool cxl_doe_compliance_rsp(DOECap *doe_cap)
+{
+    CompRsp *rsp = &CT3(doe_cap->pdev)->cxl_cstate.compliance.response;
+    struct compliance_req_header *req = pcie_doe_get_write_mbox_ptr(doe_cap);
+    uint32_t type, req_len = 0, rsp_len = 0;
+
+    type = req->req_code;
+
+    switch (type) {
+    case CXL_COMP_MODE_CAP:
+        req_len = sizeof(struct cxl_compliance_cap_req);
+        rsp_len = sizeof(struct cxl_compliance_cap_rsp);
+        rsp->cap_rsp.status = 0x0;
+        rsp->cap_rsp.available_cap_bitmask = 0;
+        rsp->cap_rsp.enabled_cap_bitmask = 0;
+        break;
+    case CXL_COMP_MODE_STATUS:
+        req_len = sizeof(struct cxl_compliance_status_req);
+        rsp_len = sizeof(struct cxl_compliance_status_rsp);
+        rsp->status_rsp.cap_bitfield = 0;
+        rsp->status_rsp.cache_size = 0;
+        rsp->status_rsp.cache_size_units = 0;
+        break;
+    case CXL_COMP_MODE_HALT:
+        req_len = sizeof(struct cxl_compliance_halt_req);
+        rsp_len = sizeof(struct cxl_compliance_halt_rsp);
+        break;
+    case CXL_COMP_MODE_MULT_WR_STREAM:
+        req_len = sizeof(struct cxl_compliance_multi_write_streaming_req);
+        rsp_len = sizeof(struct cxl_compliance_multi_write_streaming_rsp);
+        break;
+    case CXL_COMP_MODE_PRO_CON:
+        req_len = sizeof(struct cxl_compliance_producer_consumer_req);
+        rsp_len = sizeof(struct cxl_compliance_producer_consumer_rsp);
+        break;
+    case CXL_COMP_MODE_BOGUS:
+        req_len = sizeof(struct cxl_compliance_bogus_writes_req);
+        rsp_len = sizeof(struct cxl_compliance_bogus_writes_rsp);
+        break;
+    case CXL_COMP_MODE_INJ_POISON:
+        req_len = sizeof(struct cxl_compliance_inject_poison_req);
+        rsp_len = sizeof(struct cxl_compliance_inject_poison_rsp);
+        break;
+    case CXL_COMP_MODE_INJ_CRC:
+        req_len = sizeof(struct cxl_compliance_inject_crc_req);
+        rsp_len = sizeof(struct cxl_compliance_inject_crc_rsp);
+        break;
+    case CXL_COMP_MODE_INJ_FC:
+        req_len = sizeof(struct cxl_compliance_inject_flow_ctrl_req);
+        rsp_len = sizeof(struct cxl_compliance_inject_flow_ctrl_rsp);
+        break;
+    case CXL_COMP_MODE_TOGGLE_CACHE:
+        req_len = sizeof(struct cxl_compliance_toggle_cache_flush_req);
+        rsp_len = sizeof(struct cxl_compliance_toggle_cache_flush_rsp);
+        break;
+    case CXL_COMP_MODE_INJ_MAC:
+        req_len = sizeof(struct cxl_compliance_inject_mac_delay_req);
+        rsp_len = sizeof(struct cxl_compliance_inject_mac_delay_rsp);
+        break;
+    case CXL_COMP_MODE_INS_UNEXP_MAC:
+        req_len = sizeof(struct cxl_compliance_insert_unexp_mac_req);
+        rsp_len = sizeof(struct cxl_compliance_insert_unexp_mac_rsp);
+        break;
+    case CXL_COMP_MODE_INJ_VIRAL:
+        req_len = sizeof(struct cxl_compliance_inject_viral_req);
+        rsp_len = sizeof(struct cxl_compliance_inject_viral_rsp);
+        break;
+    case CXL_COMP_MODE_INJ_ALMP:
+        req_len = sizeof(struct cxl_compliance_inject_almp_req);
+        rsp_len = sizeof(struct cxl_compliance_inject_almp_rsp);
+        break;
+    case CXL_COMP_MODE_IGN_ALMP:
+        req_len = sizeof(struct cxl_compliance_ignore_almp_req);
+        rsp_len = sizeof(struct cxl_compliance_ignore_almp_rsp);
+        break;
+    case CXL_COMP_MODE_INJ_BIT_ERR:
+        req_len = sizeof(struct cxl_compliance_inject_bit_err_in_flit_req);
+        rsp_len = sizeof(struct cxl_compliance_inject_bit_err_in_flit_rsp);
+        break;
+    default:
+        break;
+    }
+
+    /* Discard if request length mismatched */
+    if (pcie_doe_get_obj_len(req) < DIV_ROUND_UP(req_len, DWORD_BYTE)) {
+        return false;
+    }
+
+    /* Common fields for each compliance type */
+    rsp->header.doe_header.vendor_id = CXL_VENDOR_ID;
+    rsp->header.doe_header.data_obj_type = CXL_DOE_COMPLIANCE;
+    rsp->header.doe_header.length = DIV_ROUND_UP(rsp_len, DWORD_BYTE);
+    rsp->header.rsp_code = type;
+    rsp->header.version = 0x1;
+    rsp->header.length = rsp_len;
+
+    memcpy(doe_cap->read_mbox, rsp, rsp_len);
+
+    doe_cap->read_mbox_len += rsp->header.doe_header.length;
+
+    return true;
+}
+
+static uint32_t ct3d_config_read(PCIDevice *pci_dev, uint32_t addr, int size)
+{
+    CXLType3Dev *ct3d = CT3(pci_dev);
+    uint32_t val;
+
+    if (pcie_doe_read_config(&ct3d->doe_comp, addr, size, &val)) {
+        return val;
+    }
+
+    return pci_default_read_config(pci_dev, addr, size);
+}
+
+static void ct3d_config_write(PCIDevice *pci_dev, uint32_t addr, uint32_t val,
+                              int size)
+{
+    CXLType3Dev *ct3d = CT3(pci_dev);
+
+    pcie_doe_write_config(&ct3d->doe_comp, addr, val, size);
+    pci_default_write_config(pci_dev, addr, val, size);
+}
 
 static void build_dvsecs(CXLType3Dev *ct3d)
 {
@@ -203,6 +331,11 @@ static MemoryRegion *cxl_md_get_memory_region(MemoryDeviceState *md,
     return ct3d->cxl_dstate.pmem;
 }
 
+static DOEProtocol doe_comp_prot[] = {
+    {CXL_VENDOR_ID, CXL_DOE_COMPLIANCE, cxl_doe_compliance_rsp},
+    {},
+};
+
 static void ct3_realize(PCIDevice *pci_dev, Error **errp)
 {
     CXLType3Dev *ct3d = CT3(pci_dev);
@@ -210,6 +343,8 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
     ComponentRegisters *regs = &cxl_cstate->crb;
     MemoryRegion *mr = &regs->component_registers;
     uint8_t *pci_conf = pci_dev->config;
+    unsigned short msix_num = 1;
+    int i;
 
     if (!ct3d->cxl_dstate.pmem) {
         cxl_setup_memory(ct3d, errp);
@@ -239,6 +374,15 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
                      PCI_BASE_ADDRESS_SPACE_MEMORY |
                          PCI_BASE_ADDRESS_MEM_TYPE_64,
                      &ct3d->cxl_dstate.device_registers);
+
+    /* MSI(-X) Initailization */
+    msix_init_exclusive_bar(pci_dev, msix_num, 4, NULL);
+    for (i = 0; i < msix_num; i++) {
+        msix_vector_use(pci_dev, i);
+    }
+
+    /* DOE Initailization */
+    pcie_doe_init(pci_dev, &ct3d->doe_comp, 0x160, doe_comp_prot, true, 0);
 }
 
 static uint64_t cxl_md_get_addr(const MemoryDeviceState *md)
@@ -357,6 +501,9 @@ static void ct3_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
     PCIDeviceClass *pc = PCI_DEVICE_CLASS(oc);
     MemoryDeviceClass *mdc = MEMORY_DEVICE_CLASS(oc);
+
+    pc->config_write = ct3d_config_write;
+    pc->config_read = ct3d_config_read;
     CXLType3Class *cvc = CXL_TYPE3_DEV_CLASS(oc);
 
     pc->realize = ct3_realize;
diff --git a/include/hw/cxl/cxl_compliance.h b/include/hw/cxl/cxl_compliance.h
new file mode 100644
index 0000000000..d009196475
--- /dev/null
+++ b/include/hw/cxl/cxl_compliance.h
@@ -0,0 +1,293 @@
+/*
+ * CXL Compliance Structure
+ *
+ * Copyright (C) 2021 Avery Design Systems, Inc.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef CXL_COMPL_H
+#define CXL_COMPL_H
+
+#include "hw/cxl/cxl_pci.h"
+
+/*
+ * Reference:
+ *   Compute Express Link (CXL) Specification, Rev. 2.0, Oct. 2020
+ */
+/* Compliance Mode Data Object Header - 14.16.4 Table 275 */
+#define CXL_DOE_COMPLIANCE        0
+#define CXL_DOE_PROTOCOL_COMPLIANCE ((CXL_DOE_COMPLIANCE << 16) | CXL_VENDOR_ID)
+
+/* Compliance Mode Return Values - 14.16.4 Table 276 */
+enum comp_status {
+    CXL_COMP_MODE_RET_SUCC,
+    CXL_COMP_MODE_RET_NOT_AUTH,
+    CXL_COMP_MODE_RET_UNKNOWN_FAIL,
+    CXL_COMP_MODE_RET_UNSUP_INJ_FUNC,
+    CXL_COMP_MODE_RET_INTERNAL_ERR,
+    CXL_COMP_MODE_RET_BUSY,
+    CXL_COMP_MODE_RET_NOT_INIT,
+};
+
+/* Compliance Mode Types - 14.16.4 */
+enum comp_type {
+    CXL_COMP_MODE_CAP,
+    CXL_COMP_MODE_STATUS,
+    CXL_COMP_MODE_HALT,
+    CXL_COMP_MODE_MULT_WR_STREAM,
+    CXL_COMP_MODE_PRO_CON,
+    CXL_COMP_MODE_BOGUS,
+    CXL_COMP_MODE_INJ_POISON,
+    CXL_COMP_MODE_INJ_CRC,
+    CXL_COMP_MODE_INJ_FC,
+    CXL_COMP_MODE_TOGGLE_CACHE,
+    CXL_COMP_MODE_INJ_MAC,
+    CXL_COMP_MODE_INS_UNEXP_MAC,
+    CXL_COMP_MODE_INJ_VIRAL,
+    CXL_COMP_MODE_INJ_ALMP,
+    CXL_COMP_MODE_IGN_ALMP,
+    CXL_COMP_MODE_INJ_BIT_ERR,
+};
+
+typedef struct compliance_req_header CompReqHeader;
+typedef struct compliance_rsp_header CompRspHeader;
+
+struct compliance_req_header {
+    DOEHeader doe_header;
+    uint8_t req_code;
+    uint8_t version;
+    uint16_t reserved;
+} QEMU_PACKED;
+
+struct compliance_rsp_header {
+    DOEHeader doe_header;
+    uint8_t rsp_code;
+    uint8_t version;
+    uint8_t length;
+} QEMU_PACKED;
+
+/* Special Patterns of response */
+struct status_rsp {
+    CompRspHeader header;
+    uint8_t status;
+} QEMU_PACKED;
+
+struct len_rsvd_rsp {
+    /* The length field in header is reserved. */
+    CompRspHeader header;
+    uint8_t reserved[5];
+} QEMU_PACKED;
+
+/* 14.16.4.1 Table 277 */
+struct cxl_compliance_cap_req {
+    CompReqHeader header;
+} QEMU_PACKED;
+
+/* 14.16.4.1 Table 278 */
+struct cxl_compliance_cap_rsp {
+    CompRspHeader header;
+    uint8_t status;
+    uint64_t available_cap_bitmask;
+    uint64_t enabled_cap_bitmask;
+} QEMU_PACKED;
+
+/* 14.16.4.2 Table 279 */
+struct cxl_compliance_status_req {
+    CompReqHeader header;
+} QEMU_PACKED;
+
+/* 14.16.4.2 Table 280 */
+struct cxl_compliance_status_rsp {
+    CompRspHeader header;
+    uint32_t cap_bitfield;
+    uint16_t cache_size;
+    uint8_t cache_size_units;
+} QEMU_PACKED;
+
+/* 14.16.4.3 Table 281 */
+struct cxl_compliance_halt_req {
+    CompReqHeader header;
+} QEMU_PACKED;
+
+/* 14.16.4.3 Table 282 */
+#define cxl_compliance_halt_rsp status_rsp
+
+/* 14.16.4.4 Table 283 */
+struct cxl_compliance_multi_write_streaming_req {
+    CompReqHeader header;
+    uint8_t protocol;
+    uint8_t virtual_addr;
+    uint8_t self_checking;
+    uint8_t verify_read_semantics;
+    uint8_t num_inc;
+    uint8_t num_sets;
+    uint8_t num_loops;
+    uint8_t reserved2;
+    uint64_t start_addr;
+    uint64_t write_addr;
+    uint64_t writeback_addr;
+    uint64_t byte_mask;
+    uint32_t addr_incr;
+    uint32_t set_offset;
+    uint32_t pattern_p;
+    uint32_t inc_pattern_b;
+} QEMU_PACKED;
+
+/* 14.16.4.4 Table 284 */
+#define cxl_compliance_multi_write_streaming_rsp status_rsp
+
+/* 14.16.4.5 Table 285 */
+struct cxl_compliance_producer_consumer_req {
+    CompReqHeader header;
+    uint8_t protocol;
+    uint8_t num_inc;
+    uint8_t num_sets;
+    uint8_t num_loops;
+    uint8_t write_semantics;
+    uint8_t reserved[3];
+    uint64_t start_addr;
+    uint64_t byte_mask;
+    uint32_t addr_incr;
+    uint32_t set_offset;
+    uint32_t pattern;
+} QEMU_PACKED;
+
+/* 14.16.4.5 Table 286 */
+#define cxl_compliance_producer_consumer_rsp status_rsp
+
+/* 14.16.4.6 Table 287 */
+struct cxl_compliance_bogus_writes_req {
+    CompReqHeader header;
+    uint8_t count;
+    uint8_t reserved;
+    uint32_t pattern;
+} QEMU_PACKED;
+
+/* 14.16.4.6 Table 288 */
+#define cxl_compliance_bogus_writes_rsp status_rsp
+
+/* 14.16.4.7 Table 289 */
+struct cxl_compliance_inject_poison_req {
+    CompReqHeader header;
+    uint8_t protocol;
+} QEMU_PACKED;
+
+/* 14.16.4.7 Table 290 */
+#define cxl_compliance_inject_poison_rsp status_rsp
+
+/* 14.16.4.8 Table 291 */
+struct cxl_compliance_inject_crc_req {
+    CompReqHeader header;
+    uint8_t num_bits_flip;
+    uint8_t num_flits_inj;
+} QEMU_PACKED;
+
+/* 14.16.4.8 Table 292 */
+#define cxl_compliance_inject_crc_rsp status_rsp
+
+/* 14.16.4.9 Table 293 */
+struct cxl_compliance_inject_flow_ctrl_req {
+    CompReqHeader header;
+    uint8_t inj_flow_control;
+} QEMU_PACKED;
+
+/* 14.16.4.9 Table 294 */
+#define cxl_compliance_inject_flow_ctrl_rsp status_rsp
+
+/* 14.16.4.10 Table 295 */
+struct cxl_compliance_toggle_cache_flush_req {
+    CompReqHeader header;
+    uint8_t cache_flush_control;
+} QEMU_PACKED;
+
+/* 14.16.4.10 Table 296 */
+#define cxl_compliance_toggle_cache_flush_rsp status_rsp
+
+/* 14.16.4.11 Table 297 */
+struct cxl_compliance_inject_mac_delay_req {
+    CompReqHeader header;
+    uint8_t enable;
+    uint8_t mode;
+    uint8_t delay;
+} QEMU_PACKED;
+
+/* 14.16.4.11 Table 298 */
+#define cxl_compliance_inject_mac_delay_rsp status_rsp
+
+/* 14.16.4.12 Table 299 */
+struct cxl_compliance_insert_unexp_mac_req {
+    CompReqHeader header;
+    uint8_t opcode;
+    uint8_t mode;
+} QEMU_PACKED;
+
+/* 14.16.4.12 Table 300 */
+#define cxl_compliance_insert_unexp_mac_rsp status_rsp
+
+/* 14.16.4.13 Table 301 */
+struct cxl_compliance_inject_viral_req {
+    CompReqHeader header;
+    uint8_t protocol;
+} QEMU_PACKED;
+
+/* 14.16.4.13 Table 302 */
+#define cxl_compliance_inject_viral_rsp status_rsp
+
+/* 14.16.4.14 Table 303 */
+struct cxl_compliance_inject_almp_req {
+    CompReqHeader header;
+    uint8_t opcode;
+    uint8_t reserved2[3];
+} QEMU_PACKED;
+
+/* 14.16.4.14 Table 304 */
+#define cxl_compliance_inject_almp_rsp len_rsvd_rsp
+
+/* 14.16.4.15 Table 305 */
+struct cxl_compliance_ignore_almp_req {
+    CompReqHeader header;
+    uint8_t opcode;
+    uint8_t reserved2[3];
+} QEMU_PACKED;
+
+/* 14.16.4.15 Table 306 */
+#define cxl_compliance_ignore_almp_rsp len_rsvd_rsp
+
+/* 14.16.4.16 Table 307 */
+struct cxl_compliance_inject_bit_err_in_flit_req {
+    CompReqHeader header;
+    uint8_t opcode;
+} QEMU_PACKED;
+
+/* 14.16.4.16 Table 308 */
+#define cxl_compliance_inject_bit_err_in_flit_rsp len_rsvd_rsp
+
+typedef struct ComplianceObject ComplianceObject;
+
+typedef union doe_rsp_u {
+    CompRspHeader header;
+
+    struct cxl_compliance_cap_rsp cap_rsp;
+    struct cxl_compliance_status_rsp status_rsp;
+    struct cxl_compliance_halt_rsp halt_rsp;
+    struct cxl_compliance_multi_write_streaming_rsp multi_write_streaming_rsp;
+    struct cxl_compliance_producer_consumer_rsp producer_consumer_rsp;
+    struct cxl_compliance_bogus_writes_rsp bogus_writes_rsp;
+    struct cxl_compliance_inject_poison_rsp inject_poison_rsp;
+    struct cxl_compliance_inject_crc_rsp inject_crc_rsp;
+    struct cxl_compliance_inject_flow_ctrl_rsp inject_flow_ctrl_rsp;
+    struct cxl_compliance_toggle_cache_flush_rsp toggle_cache_flush_rsp;
+    struct cxl_compliance_inject_mac_delay_rsp inject_mac_delay_rsp;
+    struct cxl_compliance_insert_unexp_mac_rsp insert_unexp_mac_rsp;
+    struct cxl_compliance_inject_viral_rsp inject_viral_rsp;
+    struct cxl_compliance_inject_almp_rsp inject_almp_rsp;
+    struct cxl_compliance_ignore_almp_rsp ignore_almp_rsp;
+    struct cxl_compliance_inject_bit_err_in_flit_rsp inject_bit_err_in_flit_rsp;
+} CompRsp;
+
+struct ComplianceObject {
+    CompRsp response;
+} QEMU_PACKED;
+#endif /* CXL_COMPL_H */
diff --git a/include/hw/cxl/cxl_component.h b/include/hw/cxl/cxl_component.h
index acc0730d96..d299c77ae3 100644
--- a/include/hw/cxl/cxl_component.h
+++ b/include/hw/cxl/cxl_component.h
@@ -173,6 +173,8 @@ typedef struct cxl_component {
             struct PCIDevice *pdev;
         };
     };
+
+    ComplianceObject compliance;
 } CXLComponentState;
 
 void cxl_component_register_block_init(Object *obj,
@@ -184,4 +186,5 @@ void cxl_component_register_init_common(uint32_t *reg_state,
 void cxl_component_create_dvsec(CXLComponentState *cxl_cstate, uint16_t length,
                                 uint16_t type, uint8_t rev, uint8_t *body);
 
+bool cxl_doe_compliance_rsp(DOECap *doe_cap);
 #endif
diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index 057c5b85c6..f0cb7de795 100644
--- a/include/hw/cxl/cxl_device.h
+++ b/include/hw/cxl/cxl_device.h
@@ -236,6 +236,9 @@ typedef struct cxl_type3_dev {
     /* State */
     CXLComponentState cxl_cstate;
     CXLDeviceState cxl_dstate;
+
+    /* DOE */
+    DOECap doe_comp;
 } CXLType3Dev;
 
 #ifndef TYPE_CXL_TYPE3_DEV
diff --git a/include/hw/cxl/cxl_pci.h b/include/hw/cxl/cxl_pci.h
index e8235b10cc..129bdf3238 100644
--- a/include/hw/cxl/cxl_pci.h
+++ b/include/hw/cxl/cxl_pci.h
@@ -12,6 +12,7 @@
 
 #include "hw/pci/pci.h"
 #include "hw/pci/pcie.h"
+#include "hw/cxl/cxl_compliance.h"
 
 #define CXL_VENDOR_ID 0x1e98
 
-- 
2.17.1


