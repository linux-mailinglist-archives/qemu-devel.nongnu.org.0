Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 277483330C5
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 22:19:16 +0100 (CET)
Received: from localhost ([::1]:45392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJjl5-00089l-4f
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 16:19:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@server4.localdomain>)
 id 1lJjX3-0005GQ-FE
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 16:04:46 -0500
Received: from static-71-162-116-19.bstnma.fios.verizon.net
 ([71.162.116.19]:42790 helo=server4.localdomain)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chris@server4.localdomain>) id 1lJjWz-0007sk-4k
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 16:04:45 -0500
Received: by server4.localdomain (Postfix, from userid 503)
 id E99C660311111; Tue,  9 Mar 2021 16:04:39 -0500 (EST)
From: Chris Browy <cbrowy@avery-design.com>
To: qemu-devel@nongnu.org,
	linux-cxl@vger.kernel.org
Subject: [RFC PATCH v3 cxl-2.0-doe 2/2] CXL DOE support for CDAT and
 Compliance Mode
Date: Tue,  9 Mar 2021 16:04:36 -0500
Message-Id: <1615323876-17716-1-git-send-email-cbrowy@avery-design.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1615322029-13038-1-git-send-email-cbrowy@avery-design.com>
References: <1615322029-13038-1-git-send-email-cbrowy@avery-design.com>
Received-SPF: none client-ip=71.162.116.19;
 envelope-from=chris@server4.localdomain; helo=server4.localdomain
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, KHOP_HELO_FCRDNS=0.116,
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
Cc: ben.widawsky@intel.com, david@redhat.com, vishal.l.verma@intel.com,
 jgroves@micron.com, cbrowy@avery-design.com, armbru@redhat.com,
 f4bug@amsat.org, mst@redhat.com, tyshao@avery-design.com.tw,
 hchkuo@avery-design.com.tw, Jonathan.Cameron@Huawei.com, imammedo@redhat.com,
 dan.j.williams@intel.com, ira.weiny@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

---
 hw/cxl/cxl-component-utils.c   |  93 ++++++++++++
 hw/mem/cxl_type3.c             | 184 ++++++++++++++++++++++++
 include/hw/cxl/cxl_cdat.h      | 127 +++++++++++++++++
 include/hw/cxl/cxl_compl.h     | 252 +++++++++++++++++++++++++++++++++
 include/hw/cxl/cxl_component.h |  74 ++++++++++
 include/hw/cxl/cxl_device.h    |   4 +
 include/hw/cxl/cxl_pci.h       |   2 +
 7 files changed, 736 insertions(+)
 create mode 100644 include/hw/cxl/cxl_cdat.h
 create mode 100644 include/hw/cxl/cxl_compl.h

diff --git a/hw/cxl/cxl-component-utils.c b/hw/cxl/cxl-component-utils.c
index 41d36f802a..1a2408dc76 100644
--- a/hw/cxl/cxl-component-utils.c
+++ b/hw/cxl/cxl-component-utils.c
@@ -11,6 +11,7 @@
 #include "qemu/log.h"
 #include "hw/pci/pci.h"
 #include "hw/cxl/cxl.h"
+#include "qapi/error.h"
 
 static uint64_t cxl_cache_mem_read_reg(void *opaque, hwaddr offset,
                                        unsigned size)
@@ -206,3 +207,95 @@ void cxl_component_create_dvsec(CXLComponentState *cxl, uint16_t length,
     range_init_nofail(&cxl->dvsecs[type], cxl->dvsec_offset, length);
     cxl->dvsec_offset += length;
 }
+
+static void cdat_len_check(struct cdat_sub_header *hdr, Error **errp)
+{
+    assert(hdr->length);
+    assert(hdr->reserved == 0);
+
+    switch (hdr->type) {
+    case CDAT_TYPE_DSMAS:
+        assert(hdr->length == sizeof(struct cdat_dsmas));
+        break;
+    case CDAT_TYPE_DSLBIS:
+        assert(hdr->length == sizeof(struct cdat_dslbis));
+        break;
+    case CDAT_TYPE_DSMSCIS:
+        assert(hdr->length == sizeof(struct cdat_dsmscis));
+        break;
+    case CDAT_TYPE_DSIS:
+        assert(hdr->length == sizeof(struct cdat_dsis));
+        break;
+    case CDAT_TYPE_DSEMTS:
+        assert(hdr->length == sizeof(struct cdat_dsemts));
+        break;
+    case CDAT_TYPE_SSLBIS:
+        assert(hdr->length >= sizeof(struct cdat_sslbis_header));
+        assert((hdr->length - sizeof(struct cdat_sslbis_header)) %
+               sizeof(struct cdat_sslbe) == 0);
+        break;
+    default:
+        error_setg(errp, "Type %d is reserved", hdr->type);
+    }
+}
+
+#define IASL_HEADER_LEN 0x24
+void cxl_doe_cdat_init(CXLComponentState *cxl_cstate, Error **errp)
+{
+    uint8_t sum = 0;
+    int i, curr = 0, ent = 0;
+    CDATStruct cdat_st[1024];
+    struct cdat_sub_header hdr;
+    FILE *fp;
+    uint8_t iasl_hdr[IASL_HEADER_LEN];
+    size_t rcount;
+
+    fp = fopen(cxl_cstate->cdat_filename, "r");
+
+    if (fp) {
+        /* Read iASL header */
+        rcount= fread(&iasl_hdr, sizeof(iasl_hdr), 1, fp);
+	if (rcount == 0)
+            error_setg(errp, "File read failed");
+	    
+
+        for (i = 0; i < IASL_HEADER_LEN; i++) {
+            sum += iasl_hdr[i];
+        }
+        sum = (~sum + 1) & 0xFF;
+
+        curr = ftell(fp);
+
+        /* Read CDAT structures */
+        while (fread(&hdr, sizeof(hdr), 1, fp)) {
+            cdat_len_check(&hdr, errp);
+
+            cdat_st[ent].base2 = curr;
+            cdat_st[ent].length = hdr.length;
+            ent++;
+
+            fseek(fp, curr + hdr.length, SEEK_SET);
+            curr = ftell(fp);
+        }
+        /* Check the last structure */
+        fseek(fp, 0, SEEK_END);
+        assert(curr == ftell(fp));
+    } else {
+        error_setg(errp, "Please specify the CDAT file by using ',cdat='");
+    }
+    cxl_cstate->cdat_file = fp;
+
+    cxl_cstate->cdat_ent_len = ent;
+    cxl_cstate->cdat_ent = g_malloc0(sizeof(CDATStruct) * ent);
+    memcpy(cxl_cstate->cdat_ent, cdat_st, sizeof(CDATStruct) * ent);
+
+    /* Set CDAT header, ent = 0 */
+    cxl_cstate->cdat_header.revision = CXL_CDAT_REV;
+    cxl_cstate->cdat_header.sequence = 0;
+    cxl_cstate->cdat_header.length += curr + sizeof(cxl_cstate->cdat_header);
+
+    sum += cxl_cstate->cdat_header.revision +
+           cxl_cstate->cdat_header.sequence + cxl_cstate->cdat_header.length;
+
+    cxl_cstate->cdat_header.checksum = ~sum + 1;
+}
diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index bf33ddb915..33f571e1a5 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -13,6 +13,156 @@
 #include "qemu/rcu.h"
 #include "sysemu/hostmem.h"
 #include "hw/cxl/cxl.h"
+#include "hw/pci/msi.h"
+#include "hw/pci/msix.h"
+
+uint32_t cxl_doe_compliance_init(DOECap *doe_cap)
+{
+    CXLComponentState *cxl_cstate = &CT3(doe_cap->pdev)->cxl_cstate;
+    uint32_t req;
+    uint32_t byte_cnt = 0;
+
+    DOE_DBG(">> %s\n",  __func__);
+
+    req = ((struct cxl_compliance_mode_cap *)pcie_doe_get_req(doe_cap))
+        ->req_header.req_code;
+    switch (req) {
+    case CXL_COMP_MODE_CAP:
+        byte_cnt = sizeof(struct cxl_compliance_mode_cap_rsp);
+        cxl_cstate->doe_resp.cap_rsp.header.vendor_id = CXL_VENDOR_ID;
+        cxl_cstate->doe_resp.cap_rsp.header.doe_type = CXL_DOE_COMPLIANCE;
+        cxl_cstate->doe_resp.cap_rsp.header.reserved = 0x0;
+        cxl_cstate->doe_resp.cap_rsp.header.length =
+            DIV_ROUND_UP(sizeof(struct cxl_compliance_mode_cap_rsp), 4);
+        cxl_cstate->doe_resp.cap_rsp.rsp_header.rsp_code = 0x0;
+        cxl_cstate->doe_resp.cap_rsp.rsp_header.version = 0x1;
+        cxl_cstate->doe_resp.cap_rsp.rsp_header.length = 0x1c;
+        cxl_cstate->doe_resp.cap_rsp.status = 0x0;
+        cxl_cstate->doe_resp.cap_rsp.available_cap_bitmask = 0x3;
+        cxl_cstate->doe_resp.cap_rsp.enabled_cap_bitmask = 0x3;
+        break;
+    case CXL_COMP_MODE_STATUS:
+        byte_cnt = sizeof(struct cxl_compliance_mode_status_rsp);
+        cxl_cstate->doe_resp.status_rsp.header.vendor_id = CXL_VENDOR_ID;
+        cxl_cstate->doe_resp.status_rsp.header.doe_type = CXL_DOE_COMPLIANCE;
+        cxl_cstate->doe_resp.status_rsp.header.reserved = 0x0;
+        cxl_cstate->doe_resp.status_rsp.header.length =
+            DIV_ROUND_UP(sizeof(struct cxl_compliance_mode_status_rsp), 4);
+        cxl_cstate->doe_resp.status_rsp.rsp_header.rsp_code = 0x1;
+        cxl_cstate->doe_resp.status_rsp.rsp_header.version = 0x1;
+        cxl_cstate->doe_resp.status_rsp.rsp_header.length = 0x14;
+        cxl_cstate->doe_resp.status_rsp.cap_bitfield = 0x3;
+        cxl_cstate->doe_resp.status_rsp.cache_size = 0;
+        cxl_cstate->doe_resp.status_rsp.cache_size_units = 0;
+        break;
+    default:
+        break;
+    }
+
+    DOE_DBG("  REQ=%x, RSP BYTE_CNT=%d\n", req, byte_cnt);
+    DOE_DBG("<< %s\n",  __func__);
+    return byte_cnt;
+}
+
+
+bool cxl_doe_compliance_rsp(DOECap *doe_cap)
+{
+    CXLComponentState *cxl_cstate = &CT3(doe_cap->pdev)->cxl_cstate;
+    uint32_t byte_cnt;
+    uint32_t dw_cnt;
+
+    DOE_DBG(">> %s\n",  __func__);
+
+    byte_cnt = cxl_doe_compliance_init(doe_cap);
+    dw_cnt = byte_cnt / 4;
+    memcpy(doe_cap->read_mbox,
+           cxl_cstate->doe_resp.data_byte, byte_cnt);
+
+    doe_cap->read_mbox_len += dw_cnt;
+
+    DOE_DBG("  LEN=%x, RD MBOX[%d]=%x\n", dw_cnt - 1,
+            doe_cap->read_mbox_len,
+            *(doe_cap->read_mbox + dw_cnt - 1));
+
+    DOE_DBG("<< %s\n",  __func__);
+
+    return true;
+}
+
+bool cxl_doe_cdat_rsp(DOECap *doe_cap)
+{
+    CXLComponentState *cxl_cstate = &CT3(doe_cap->pdev)->cxl_cstate;
+    uint16_t ent;
+    uint32_t base = 0;
+    uint32_t len = 0 ;
+    size_t rcount;
+    struct cxl_cdat *req = pcie_doe_get_req(doe_cap);
+
+    ent = req->entry_handle;
+    if (ent == 0) {
+        len = sizeof(cxl_cstate->cdat_header);
+    } else if (ent <= cxl_cstate->cdat_ent_len) {
+        base = cxl_cstate->cdat_ent[ent - 1].base2;
+        len = cxl_cstate->cdat_ent[ent - 1].length;
+    }
+
+    struct cxl_cdat_rsp rsp = {
+        .header = {
+            .vendor_id = CXL_VENDOR_ID,
+            .doe_type = CXL_DOE_TABLE_ACCESS,
+            .reserved = 0x0,
+            .length = (sizeof(struct cxl_cdat_rsp) + len) / 4,
+        },
+        .req_code = CXL_DOE_TAB_RSP,
+        .table_type = CXL_DOE_TAB_TYPE_CDAT,
+        .entry_handle = (ent < cxl_cstate->cdat_ent_len) ? ent + 1 : CXL_DOE_TAB_ENT_MAX,
+    };
+
+    memcpy(doe_cap->read_mbox, &rsp, sizeof(rsp));
+
+    if (ent == 0) {
+        memcpy(doe_cap->read_mbox + sizeof(rsp) / 4,
+               &cxl_cstate->cdat_header, len);
+    } else if (ent <= cxl_cstate->cdat_ent_len) {
+        fseek(cxl_cstate->cdat_file, base, SEEK_SET);
+        rcount= fread(doe_cap->read_mbox + sizeof(rsp) / 4, len, 1, cxl_cstate->cdat_file);
+	if (rcount == 0)
+	    DOE_DBG("fread returned 0\n");
+    }
+
+    doe_cap->read_mbox_len += rsp.header.length;
+    DOE_DBG("%s: INCR RD_MBOX OFF=%x\n", __func__, doe_cap->read_mbox_len);
+
+    for (int i = 0; i < doe_cap->read_mbox_len; i++) {
+        DOE_DBG("  RD_MBOX[%d]=%08x\n", i, doe_cap->read_mbox[i]);
+    }
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
+    } else if (pcie_doe_read_config(&ct3d->doe_cdat, addr, size, &val)) {
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
+    pcie_doe_write_config(&ct3d->doe_cdat, addr, val, size);
+    pci_default_write_config(pci_dev, addr, val, size);
+}
 
 static void build_dvsecs(CXLType3Dev *ct3d)
 {
@@ -134,6 +284,8 @@ static void ct3_finalize(Object *obj)
 
     g_free((void *)regs->special_ops);
     g_free(ct3d->cxl_dstate.pmem);
+
+    fclose(cxl_cstate->cdat_file);
 }
 
 static void cxl_setup_memory(CXLType3Dev *ct3d, Error **errp)
@@ -203,6 +355,19 @@ static MemoryRegion *cxl_md_get_memory_region(MemoryDeviceState *md,
     return ct3d->cxl_dstate.pmem;
 }
 
+static DOEProtocol doe_comp_prot[] = {
+    {PCI_VENDOR_ID_PCI_SIG, PCI_SIG_DOE_CMA, pcie_doe_cma_rsp},
+    {CXL_VENDOR_ID, CXL_DOE_COMPLIANCE, cxl_doe_compliance_rsp},
+    {CXL_VENDOR_ID, CXL_DOE_TABLE_ACCESS, cxl_doe_cdat_rsp},
+    { /* End of array */ },
+};
+
+static DOEProtocol doe_cdat_prot[] = {
+    {PCI_VENDOR_ID_PCI_SIG, PCI_SIG_DOE_CMA, pcie_doe_cma_rsp},
+    {CXL_VENDOR_ID, CXL_DOE_TABLE_ACCESS, cxl_doe_cdat_rsp},
+    { /* End of array */ },
+};
+
 static void ct3_realize(PCIDevice *pci_dev, Error **errp)
 {
     CXLType3Dev *ct3d = CT3(pci_dev);
@@ -210,6 +375,8 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
     ComponentRegisters *regs = &cxl_cstate->crb;
     MemoryRegion *mr = &regs->component_registers;
     uint8_t *pci_conf = pci_dev->config;
+    unsigned short msix_num = 2;
+    int i;
 
     if (!ct3d->cxl_dstate.pmem) {
         cxl_setup_memory(ct3d, errp);
@@ -239,6 +406,19 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
                      PCI_BASE_ADDRESS_SPACE_MEMORY |
                          PCI_BASE_ADDRESS_MEM_TYPE_64,
                      &ct3d->cxl_dstate.device_registers);
+
+    /* MSI(-X) Initailization */
+    msix_init_exclusive_bar(pci_dev, msix_num, 4, NULL);
+    for (i = 0; i < msix_num; i++) {
+        msix_vector_use(pci_dev, i);
+    }
+    /* msi_init(pci_dev, 0x60, 16, true, false, NULL); */
+
+    /* DOE Initailization */
+    pcie_doe_init(pci_dev, &ct3d->doe_comp, 0x160, doe_comp_prot, true, 0);
+    pcie_doe_init(pci_dev, &ct3d->doe_cdat, 0x190, doe_cdat_prot, true, 1);
+
+    cxl_doe_cdat_init(cxl_cstate, errp);
 }
 
 static uint64_t cxl_md_get_addr(const MemoryDeviceState *md)
@@ -275,6 +455,7 @@ static Property ct3_props[] = {
                      HostMemoryBackend *),
     DEFINE_PROP_LINK("lsa", CXLType3Dev, lsa, TYPE_MEMORY_BACKEND,
                      HostMemoryBackend *),
+    DEFINE_PROP_STRING("cdat", CXLType3Dev, cxl_cstate.cdat_filename),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -357,6 +538,9 @@ static void ct3_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
     PCIDeviceClass *pc = PCI_DEVICE_CLASS(oc);
     MemoryDeviceClass *mdc = MEMORY_DEVICE_CLASS(oc);
+
+    pc->config_write = ct3d_config_write;
+    pc->config_read = ct3d_config_read;
     CXLType3Class *cvc = CXL_TYPE3_DEV_CLASS(oc);
 
     pc->realize = ct3_realize;
diff --git a/include/hw/cxl/cxl_cdat.h b/include/hw/cxl/cxl_cdat.h
new file mode 100644
index 0000000000..edd994d410
--- /dev/null
+++ b/include/hw/cxl/cxl_cdat.h
@@ -0,0 +1,127 @@
+/*
+ * CXL CDAT Structure
+ *
+ * Copyright (C) 2020 Avery Design Systems, Inc.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef CXL_CDAT_H
+#define CXL_CDAT_H
+
+#include "hw/cxl/cxl_pci.h"
+
+#define CXL_DOE_TABLE_ACCESS      2
+#define CXL_DOE_PROTOCOL_CDAT     ((CXL_DOE_TABLE_ACCESS << 16) | CXL_VENDOR_ID)
+
+/*
+ * DOE CDAT Table Protocol (CXL Spec)
+ */
+#define CXL_DOE_TAB_REQ 0
+#define CXL_DOE_TAB_RSP 0
+#define CXL_DOE_TAB_TYPE_CDAT 0
+#define CXL_DOE_TAB_ENT_MAX 0xFFFF
+
+/* Read Entry Request, 8.1.11.1 Table 134 */
+struct cxl_cdat {
+    DOEHeader header;
+    uint8_t req_code;
+    uint8_t table_type;
+    uint16_t entry_handle;
+} QEMU_PACKED;
+
+/* Read Entry Response, 8.1.11.1 Table 135 */
+#define cxl_cdat_rsp    cxl_cdat    /* Same as request */
+
+/*
+ * CDAT Table Structure (CDAT Spec)
+ */
+#define CXL_CDAT_REV 1
+
+/* Data object header */
+struct cdat_table_header {
+    uint32_t length;    /* Length of table in bytes, including this header */
+    uint8_t revision;   /* ACPI Specification minor version number */
+    uint8_t checksum;   /* To make sum of entire table == 0 */
+    uint8_t reserved[6];
+    uint32_t sequence;  /* ASCII table signature */
+} QEMU_PACKED;
+
+/* Values for subtable type in CDAT structures */
+enum cdat_type {
+    CDAT_TYPE_DSMAS = 0,
+    CDAT_TYPE_DSLBIS = 1,
+    CDAT_TYPE_DSMSCIS = 2,
+    CDAT_TYPE_DSIS = 3,
+    CDAT_TYPE_DSEMTS = 4,
+    CDAT_TYPE_SSLBIS = 5,
+    CDAT_TYPE_MAX
+};
+
+struct cdat_sub_header {
+    uint8_t type;
+    uint8_t reserved;
+    uint16_t length;
+};
+
+/* CDAT Structure Subtables */
+struct cdat_dsmas {
+    struct cdat_sub_header header;
+    uint8_t DSMADhandle;
+    uint8_t flags;
+    uint16_t reserved;
+    uint64_t DPA_base;
+    uint64_t DPA_length;
+} QEMU_PACKED;
+
+struct cdat_dslbis {
+    struct cdat_sub_header header;
+    uint8_t handle;
+    uint8_t flags;
+    uint8_t data_type;
+    uint8_t reserved;
+    uint64_t entry_base_unit;
+    uint16_t entry[3];
+    uint16_t reserved2;
+} QEMU_PACKED;
+
+struct cdat_dsmscis {
+    struct cdat_sub_header header;
+    uint8_t DSMAS_handle;
+    uint8_t reserved[3];
+    uint64_t memory_side_cache_size;
+    uint32_t cache_attributes;
+} QEMU_PACKED;
+
+struct cdat_dsis {
+    struct cdat_sub_header header;
+    uint8_t flags;
+    uint8_t handle;
+    uint16_t reserved;
+} QEMU_PACKED;
+
+struct cdat_dsemts {
+    struct cdat_sub_header header;
+    uint8_t DSMAS_handle;
+    uint8_t EFI_memory_type_attr;
+    uint16_t reserved;
+    uint64_t DPA_offset;
+    uint64_t DPA_length;
+} QEMU_PACKED;
+
+struct cdat_sslbe {
+    uint16_t port_x_id;
+    uint16_t port_y_id;
+    uint16_t latency_bandwidth;
+    uint16_t reserved;
+} QEMU_PACKED;
+
+struct cdat_sslbis_header {
+    struct cdat_sub_header header;
+    uint8_t data_type;
+    uint8_t reserved[3];
+    uint64_t entry_base_unit;
+} QEMU_PACKED;
+
+#endif /* CXL_CDAT_H */
diff --git a/include/hw/cxl/cxl_compl.h b/include/hw/cxl/cxl_compl.h
new file mode 100644
index 0000000000..5edeaa5f27
--- /dev/null
+++ b/include/hw/cxl/cxl_compl.h
@@ -0,0 +1,252 @@
+/*
+ * CXL Compliance Structure
+ *
+ * Copyright (C) 2020 Avery Design Systems, Inc.
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
+#define CXL_DOE_COMPLIANCE        0
+#define CXL_DOE_PROTOCOL_COMPLIANCE ((CXL_DOE_COMPLIANCE << 16) | CXL_VENDOR_ID)
+
+/* 14.16.4 - Compliance Mode */
+#define CXL_COMP_MODE_CAP               0x0
+#define CXL_COMP_MODE_STATUS            0x1
+#define CXL_COMP_MODE_HALT              0x2
+#define CXL_COMP_MODE_MULT_WR_STREAM    0x3
+#define CXL_COMP_MODE_PRO_CON           0x4
+#define CXL_COMP_MODE_BOGUS             0x5
+#define CXL_COMP_MODE_INJ_POISON        0x6
+#define CXL_COMP_MODE_INJ_CRC           0x7
+#define CXL_COMP_MODE_INJ_FC            0x8
+#define CXL_COMP_MODE_TOGGLE_CACHE      0x9
+#define CXL_COMP_MODE_INJ_MAC           0xa
+#define CXL_COMP_MODE_INS_UNEXP_MAC     0xb
+#define CXL_COMP_MODE_INJ_VIRAL         0xc
+#define CXL_COMP_MODE_INJ_ALMP          0xd
+#define CXL_COMP_MODE_IGN_ALMP          0xe
+
+typedef struct compliance_req_header CompReqHeader;
+typedef struct compliance_rsp_header CompRspHeader;
+
+struct compliance_req_header {
+    uint8_t req_code;
+    uint8_t version;
+    uint16_t reserved;
+} QEMU_PACKED;
+
+struct compliance_rsp_header {
+    uint8_t rsp_code;
+    uint8_t version;
+    uint8_t length;
+} QEMU_PACKED;
+
+struct status_rsp {
+    DOEHeader header;
+    CompRspHeader rsp_header;
+    uint8_t status;
+} QEMU_PACKED;
+
+struct len_rsvd_rsp {
+    DOEHeader header;
+    /* The length field in rsp_header is reserved. */
+    CompRspHeader rsp_header;
+    uint8_t reserved[5];
+} QEMU_PACKED;
+
+/*
+ * CXL Compliance Mode Protocol 14.16.4
+ */
+/* 14.16.4.1 */
+struct cxl_compliance_mode_cap {
+    DOEHeader header;
+    CompReqHeader req_header;
+} QEMU_PACKED;
+
+struct cxl_compliance_mode_cap_rsp {
+    DOEHeader header;
+    CompRspHeader rsp_header;
+    uint8_t status;
+    uint64_t available_cap_bitmask;
+    uint64_t enabled_cap_bitmask;
+} QEMU_PACKED;
+
+/* 14.16.4.2 */
+struct cxl_compliance_mode_status {
+    DOEHeader header;
+    CompReqHeader req_header;
+} QEMU_PACKED;
+
+struct cxl_compliance_mode_status_rsp {
+    DOEHeader header;
+    CompRspHeader rsp_header;
+    uint32_t cap_bitfield;
+    uint16_t cache_size;
+    uint8_t cache_size_units;
+} QEMU_PACKED;
+
+/* 14.16.4.3 */
+struct cxl_compliance_mode_halt {
+    DOEHeader header;
+    CompReqHeader req_header;
+} QEMU_PACKED;
+
+#define cxl_compliance_mode_halt_rsp status_rsp
+
+/* 14.16.4.4 */
+struct cxl_compliance_mode_multiple_write_streaming {
+    DOEHeader header;
+    CompReqHeader req_header;
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
+#define cxl_compliance_mode_multiple_write_streaming_rsp status_rsp
+
+/* 14.16.4.5 */
+struct cxl_compliance_mode_producer_consumer {
+    DOEHeader header;
+    CompReqHeader req_header;
+    uint8_t protocol;
+    uint8_t num_inc;
+    uint8_t num_sets;
+    uint8_t num_loops;
+    uint8_t write_semantics;
+    uint8_t reserved2[3];
+    uint64_t start_addr;
+    uint64_t byte_mask;
+    uint32_t addr_incr;
+    uint32_t set_offset;
+    uint32_t pattern;
+} QEMU_PACKED;
+
+#define cxl_compliance_mode_producer_consumer_rsp status_rsp
+
+/* 14.16.4.6 */
+struct cxl_compliance_mode_inject_bogus_writes {
+    DOEHeader header;
+    CompReqHeader req_header;
+    uint8_t count;
+    uint8_t reserved;
+    uint32_t pattern;
+} QEMU_PACKED;
+
+#define cxl_compliance_mode_inject_bogus_writes_rsp status_rsp
+
+/* 14.16.4.7 */
+struct cxl_compliance_mode_inject_poison {
+    DOEHeader header;
+    CompReqHeader req_header;
+    uint8_t protocol;
+} QEMU_PACKED;
+
+#define cxl_compliance_mode_inject_poison_rsp status_rsp
+
+/* 14.16.4.8 */
+struct cxl_compliance_mode_inject_crc {
+    DOEHeader header;
+    CompReqHeader req_header;
+    uint8_t num_bits_flip;
+    uint8_t num_flits_inj;
+} QEMU_PACKED;
+
+#define cxl_compliance_mode_inject_crc_rsp status_rsp
+
+/* 14.16.4.9 */
+struct cxl_compliance_mode_inject_flow_control {
+    DOEHeader header;
+    CompReqHeader req_header;
+    uint8_t inj_flow_control;
+} QEMU_PACKED;
+
+#define cxl_compliance_mode_inject_flow_control_rsp status_rsp
+
+/* 14.16.4.10 */
+struct cxl_compliance_mode_toggle_cache_flush {
+    DOEHeader header;
+    CompReqHeader req_header;
+    uint8_t inj_flow_control;
+} QEMU_PACKED;
+
+#define cxl_compliance_mode_toggle_cache_flush_rsp status_rsp
+
+/* 14.16.4.11 */
+struct cxl_compliance_mode_inject_mac_delay {
+    DOEHeader header;
+    CompReqHeader req_header;
+    uint8_t enable;
+    uint8_t mode;
+    uint8_t delay;
+} QEMU_PACKED;
+
+#define cxl_compliance_mode_inject_mac_delay_rsp status_rsp
+
+/* 14.16.4.12 */
+struct cxl_compliance_mode_insert_unexp_mac {
+    DOEHeader header;
+    CompReqHeader req_header;
+    uint8_t opcode;
+    uint8_t mode;
+} QEMU_PACKED;
+
+#define cxl_compliance_mode_insert_unexp_mac_rsp status_rsp
+
+/* 14.16.4.13 */
+struct cxl_compliance_mode_inject_viral {
+    DOEHeader header;
+    CompReqHeader req_header;
+    uint8_t protocol;
+} QEMU_PACKED;
+
+#define cxl_compliance_mode_inject_viral_rsp status_rsp
+
+/* 14.16.4.14 */
+struct cxl_compliance_mode_inject_almp {
+    DOEHeader header;
+    CompReqHeader req_header;
+    uint8_t opcode;
+    uint8_t reserved2[3];
+} QEMU_PACKED;
+
+#define cxl_compliance_mode_inject_almp_rsp len_rsvd_rsp
+
+/* 14.16.4.15 */
+struct cxl_compliance_mode_ignore_almp {
+    DOEHeader header;
+    CompReqHeader req_header;
+    uint8_t opcode;
+    uint8_t reserved2[3];
+} QEMU_PACKED;
+
+#define cxl_compliance_mode_ignore_almp_rsp len_rsvd_rsp
+
+/* 14.16.4.16 */
+struct cxl_compliance_mode_inject_bit_error {
+    DOEHeader header;
+    CompReqHeader req_header;
+    uint8_t opcode;
+} QEMU_PACKED;
+
+#define cxl_compliance_mode_inject_bit_error_rsp len_rsvd_rsp
+
+#endif /* CXL_COMPL_H */
diff --git a/include/hw/cxl/cxl_component.h b/include/hw/cxl/cxl_component.h
index acc0730d96..1294d74d78 100644
--- a/include/hw/cxl/cxl_component.h
+++ b/include/hw/cxl/cxl_component.h
@@ -18,6 +18,7 @@
 #include "qemu/range.h"
 #include "qemu/typedefs.h"
 #include "hw/register.h"
+#include "qapi/error.h"
 
 enum reg_type {
     CXL2_DEVICE,
@@ -160,6 +161,11 @@ typedef struct component_registers {
     MemoryRegionOps *special_ops;
 } ComponentRegisters;
 
+typedef struct cdat_struct {
+    void *base;
+    uint32_t base2;
+    uint32_t length;
+} CDATStruct;
 /*
  * A CXL component represents all entities in a CXL hierarchy. This includes,
  * host bridges, root ports, upstream/downstream switch ports, and devices
@@ -173,6 +179,70 @@ typedef struct cxl_component {
             struct PCIDevice *pdev;
         };
     };
+
+    /*
+     * SW write write mailbox and GO on last DW
+     * device sets READY of offset DW in DO types to copy
+     * to read mailbox register on subsequent cfg_read
+     * of read mailbox register and then on cfg_write to
+     * denote success read increments offset to next DW
+     */
+
+    union doe_request_u {
+        /* Compliance DOE Data Objects Type=0*/
+        struct cxl_compliance_mode_cap mode_cap;
+        struct cxl_compliance_mode_status mode_status;
+        struct cxl_compliance_mode_halt mode_halt;
+        struct cxl_compliance_mode_multiple_write_streaming
+            multiple_write_streaming;
+        struct cxl_compliance_mode_producer_consumer producer_consumer;
+        struct cxl_compliance_mode_inject_bogus_writes inject_bogus_writes;
+        struct cxl_compliance_mode_inject_poison inject_poison;
+        struct cxl_compliance_mode_inject_crc inject_crc;
+        struct cxl_compliance_mode_inject_flow_control inject_flow_control;
+        struct cxl_compliance_mode_toggle_cache_flush toggle_cache_flush;
+        struct cxl_compliance_mode_inject_mac_delay inject_mac_delay;
+        struct cxl_compliance_mode_insert_unexp_mac insert_unexp_mac;
+        struct cxl_compliance_mode_inject_viral inject_viral;
+        struct cxl_compliance_mode_inject_almp inject_almp;
+        struct cxl_compliance_mode_ignore_almp ignore_almp;
+        struct cxl_compliance_mode_inject_bit_error ignore_bit_error;
+        char data_byte[128];
+    } doe_request;
+
+    union doe_resp_u {
+        /* Compliance DOE Data Objects Type=0*/
+        struct cxl_compliance_mode_cap_rsp cap_rsp;
+        struct cxl_compliance_mode_status_rsp status_rsp;
+        struct cxl_compliance_mode_halt_rsp halt_rsp;
+        struct cxl_compliance_mode_multiple_write_streaming_rsp
+            multiple_write_streaming_rsp;
+        struct cxl_compliance_mode_producer_consumer_rsp producer_consumer_rsp;
+        struct cxl_compliance_mode_inject_bogus_writes_rsp
+            inject_bogus_writes_rsp;
+        struct cxl_compliance_mode_inject_poison_rsp inject_poison_rsp;
+        struct cxl_compliance_mode_inject_crc_rsp inject_crc_rsp;
+        struct cxl_compliance_mode_inject_flow_control_rsp
+            inject_flow_control_rsp;
+        struct cxl_compliance_mode_toggle_cache_flush_rsp
+            toggle_cache_flush_rsp;
+        struct cxl_compliance_mode_inject_mac_delay_rsp inject_mac_delay_rsp;
+        struct cxl_compliance_mode_insert_unexp_mac_rsp insert_unexp_mac_rsp;
+        struct cxl_compliance_mode_inject_viral inject_viral_rsp;
+        struct cxl_compliance_mode_inject_almp_rsp inject_almp_rsp;
+        struct cxl_compliance_mode_ignore_almp_rsp ignore_almp_rsp;
+        struct cxl_compliance_mode_inject_bit_error_rsp ignore_bit_error_rsp;
+        char data_byte[520 * 4];
+    } doe_resp;
+
+    /* Table entry types */
+    struct cdat_table_header cdat_header;
+
+    CDATStruct *cdat_ent;
+    int cdat_ent_len;
+
+    char *cdat_filename;
+    FILE *cdat_file;
 } CXLComponentState;
 
 void cxl_component_register_block_init(Object *obj,
@@ -184,4 +254,8 @@ void cxl_component_register_init_common(uint32_t *reg_state,
 void cxl_component_create_dvsec(CXLComponentState *cxl_cstate, uint16_t length,
                                 uint16_t type, uint8_t rev, uint8_t *body);
 
+uint32_t cxl_doe_compliance_init(DOECap *doe_cap);
+bool cxl_doe_compliance_rsp(DOECap *doe_cap);
+void cxl_doe_cdat_init(CXLComponentState *cxl_cstate, Error **errp);
+bool cxl_doe_cdat_rsp(DOECap *doe_cap);
 #endif
diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index 057c5b85c6..de006ff463 100644
--- a/include/hw/cxl/cxl_device.h
+++ b/include/hw/cxl/cxl_device.h
@@ -236,6 +236,10 @@ typedef struct cxl_type3_dev {
     /* State */
     CXLComponentState cxl_cstate;
     CXLDeviceState cxl_dstate;
+
+    /* DOE */
+    DOECap doe_comp;
+    DOECap doe_cdat;
 } CXLType3Dev;
 
 #ifndef TYPE_CXL_TYPE3_DEV
diff --git a/include/hw/cxl/cxl_pci.h b/include/hw/cxl/cxl_pci.h
index e8235b10cc..a0df324a1f 100644
--- a/include/hw/cxl/cxl_pci.h
+++ b/include/hw/cxl/cxl_pci.h
@@ -12,6 +12,8 @@
 
 #include "hw/pci/pci.h"
 #include "hw/pci/pcie.h"
+#include "hw/cxl/cxl_cdat.h"
+#include "hw/cxl/cxl_compl.h"
 
 #define CXL_VENDOR_ID 0x1e98
 
-- 
2.17.1


