Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D57F336B825
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 19:38:04 +0200 (CEST)
Received: from localhost ([::1]:41254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb5BL-0000af-V7
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 13:38:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@server4.localdomain>)
 id 1lb59Y-0007nD-MW
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 13:36:12 -0400
Received: from static-71-162-116-19.bstnma.fios.verizon.net
 ([71.162.116.19]:39832 helo=server4.localdomain)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chris@server4.localdomain>) id 1lb59W-000398-6M
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 13:36:12 -0400
Received: by server4.localdomain (Postfix, from userid 503)
 id 65FE760311111; Mon, 26 Apr 2021 13:36:07 -0400 (EDT)
From: Chris Browy <cbrowy@avery-design.com>
To: mst@redhat.com
Subject: [PATCH v5 cxl2.0-v3-doe 5/6] cxl/cdat: CXL CDAT Data Object Exchange
 implementation
Date: Mon, 26 Apr 2021 13:36:02 -0400
Message-Id: <1619458562-14431-1-git-send-email-cbrowy@avery-design.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1619454964-10190-1-git-send-email-cbrowy@avery-design.com>
References: <1619454964-10190-1-git-send-email-cbrowy@avery-design.com>
Received-SPF: none client-ip=71.162.116.19;
 envelope-from=chris@server4.localdomain; helo=server4.localdomain
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, KHOP_HELO_FCRDNS=0.399,
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
 Chris Browy <cbrowy@avery-design.com>, armbru@redhat.com,
 linux-cxl@vger.kernel.org, f4bug@amsat.org, hchkuo@avery-design.com.tw,
 tyshao@avery-design.com.tw, jonathan.cameron@huawei.com, imammedo@redhat.com,
 dan.j.williams@intel.com, ira.weiny@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: hchkuo <hchkuo@avery-design.com.tw>

The Data Object Exchange implementation of CXL Coherent Device Attribute
Table (CDAT). This implementation is referring to "Coherent Device
Attribute Table Specification, Rev. 1.02, Oct. 2020" and "Compute
Express Link Specification, Rev. 2.0, Oct. 2020"

The CDAT can be specified in two ways. One is to add ",cdat=<filename>"
in "-device cxl-type3"'s command option. The file is required to provide
the whole CDAT table in binary mode. The other is to use the default
CDAT value created by build_cdat_table in hw/cxl/cxl-cdat.c.

A DOE capability of CDAT is added to hw/mem/cxl_type3.c with capability
offset 0x190. The config read/write to this capability range can be
generated in the OS to request the CDAT data.

Signed-off-by: Chris Browy <cbrowy@avery-design.com>
---
 hw/cxl/cxl-cdat.c              | 228 +++++++++++++++++++++++++++++++++
 hw/cxl/meson.build             |   1 +
 hw/mem/cxl_type3.c             |  57 ++++++++-
 include/hw/cxl/cxl_cdat.h      | 149 +++++++++++++++++++++
 include/hw/cxl/cxl_component.h |   4 +
 include/hw/cxl/cxl_device.h    |   1 +
 include/hw/cxl/cxl_pci.h       |   1 +
 7 files changed, 440 insertions(+), 1 deletion(-)
 create mode 100644 hw/cxl/cxl-cdat.c
 create mode 100644 include/hw/cxl/cxl_cdat.h

diff --git a/hw/cxl/cxl-cdat.c b/hw/cxl/cxl-cdat.c
new file mode 100644
index 0000000000..3b86ecaddf
--- /dev/null
+++ b/hw/cxl/cxl-cdat.c
@@ -0,0 +1,228 @@
+/*
+ * CXL CDAT Structure
+ *
+ * Copyright (C) 2021 Avery Design Systems, Inc.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/pci/pci.h"
+#include "hw/cxl/cxl.h"
+#include "qapi/error.h"
+#include "qemu/error-report.h"
+
+static void build_cdat_table(void ***cdat_table, int *len) {
+    struct cdat_dsmas *dsmas = g_malloc(sizeof(struct cdat_dsmas));
+    struct cdat_dslbis *dslbis = g_malloc(sizeof(struct cdat_dslbis));
+    struct cdat_dsmscis *dsmscis = g_malloc(sizeof(struct cdat_dsmscis));
+    struct cdat_dsis *dsis = g_malloc(sizeof(struct cdat_dsis));
+    struct cdat_dsemts *dsemts = g_malloc(sizeof(struct cdat_dsemts));
+    struct cdat_sslbis {
+        struct cdat_sslbis_header sslbis_header;
+        struct cdat_sslbe sslbe[2];
+    };
+    struct cdat_sslbis *sslbis = g_malloc(sizeof(struct cdat_sslbis));
+    void *__cdat_table[] = {
+        dsmas,
+        dslbis,
+        dsmscis,
+        dsis,
+        dsemts,
+        sslbis,
+    };
+
+    *dsmas = (struct cdat_dsmas){
+        .header = {
+            .type = CDAT_TYPE_DSMAS,
+            .length = sizeof(struct cdat_dsmas),
+        },
+        .DSMADhandle = 0,
+        .flags = 0,
+        .DPA_base = 0,
+        .DPA_length = 0,
+    };
+    *dslbis = (struct cdat_dslbis){
+        .header = {
+            .type = CDAT_TYPE_DSLBIS,
+            .length = sizeof(struct cdat_dslbis),
+        },
+        .handle = 0,
+        .flags = 0,
+        .data_type = 0,
+        .entry_base_unit = 0,
+    };
+    *dsmscis = (struct cdat_dsmscis){
+        .header = {
+            .type = CDAT_TYPE_DSMSCIS,
+            .length = sizeof(struct cdat_dsmscis),
+        },
+        .DSMAS_handle = 0,
+        .memory_side_cache_size = 0,
+        .cache_attributes = 0,
+    };
+    *dsis = (struct cdat_dsis){
+        .header = {
+            .type = CDAT_TYPE_DSIS,
+            .length = sizeof(struct cdat_dsis),
+        },
+        .flags = 0,
+        .handle = 0,
+    };
+    *dsemts = (struct cdat_dsemts){
+        .header = {
+            .type = CDAT_TYPE_DSEMTS,
+            .length = sizeof(struct cdat_dsemts),
+        },
+        .DSMAS_handle = 0,
+        .EFI_memory_type_attr = 0,
+        .DPA_offset = 0,
+        .DPA_length = 0,
+    };
+    *sslbis = (struct cdat_sslbis){
+        .sslbis_header = {
+            .header = {
+                .type = CDAT_TYPE_SSLBIS,
+                .length = sizeof(sslbis->sslbis_header) +
+                          sizeof(struct cdat_sslbe) * 2,
+            },
+            .data_type = 0,
+            .entry_base_unit = 0,
+        },
+        .sslbe[0] = {
+            .port_x_id = 0,
+            .port_y_id = 0,
+            .latency_bandwidth = 0,
+        },
+        .sslbe[1] = {
+            .port_x_id = 0,
+            .port_y_id = 0,
+            .latency_bandwidth = 0,
+        },
+    };
+
+    *len = ARRAY_SIZE(__cdat_table);
+    *cdat_table = g_malloc0((*len) * sizeof(void *));
+    memcpy(*cdat_table, __cdat_table, (*len) * sizeof(void *));
+}
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
+void cxl_doe_cdat_init(CXLComponentState *cxl_cstate, Error **errp)
+{
+    CDATObject *cdat = &cxl_cstate->cdat;
+    CDATEntry cdat_st[1024];
+    uint8_t sum = 0, *buf;
+    int i = 0, ent = 1, file_size = 0, cdat_table_len = 0;
+    struct cdat_sub_header *hdr;
+    struct cdat_table_header *cdat_header;
+    FILE *fp;
+    void **cdat_table = NULL;
+
+    fp = fopen(cdat->filename, "r");
+
+    if (fp) {
+        /* Read CDAT file and create its cache */
+        fseek(fp, 0, SEEK_END);
+        file_size = ftell(fp);
+        fseek(fp, 0, SEEK_SET);
+        cdat->buf = g_malloc0(file_size);
+
+        if (fread(cdat->buf, file_size, 1, fp) == 0) {
+            error_setg(errp, "File read failed");
+        }
+
+        fclose(fp);
+
+        /* Set CDAT header, Entry = 0 */
+        cdat_st[0].base = cdat->buf;
+        cdat_st[0].length = sizeof(struct cdat_table_header);
+        while (i < cdat_st[0].length) {
+            sum += cdat->buf[i++];
+        }
+
+        /* Read CDAT structures */
+        while (i < file_size) {
+            hdr = (struct cdat_sub_header *)(cdat->buf + i);
+            cdat_len_check(hdr, errp);
+
+            cdat_st[ent].base = hdr;
+            cdat_st[ent].length = hdr->length;
+
+            while (cdat->buf + i < (char *)cdat_st[ent].base + cdat_st[ent].length) {
+                assert(i < file_size);
+                sum += cdat->buf[i++];
+            }
+
+            ent++;
+        }
+
+        if (sum != 0) {
+            warn_report("Found checksum mismatch in %s\n", cdat->filename);
+        }
+    } else {
+        /* Use default table if fopen == NULL */
+        cdat_header = g_malloc0(sizeof(struct cdat_table_header));
+        build_cdat_table(&cdat_table, &cdat_table_len);
+
+        /* Entry 0 for CDAT header, starts with Entry 1 */
+        for (; ent < cdat_table_len + 1; ent++) {
+            hdr = cdat_table[ent - 1];
+            buf = cdat_table[ent - 1];
+
+            cdat_st[ent].base = hdr;
+            cdat_st[ent].length = hdr->length;
+
+            cdat_header->length += hdr->length;
+            for (i = 0; i < hdr->length; i++) {
+                sum += buf[i];
+            }
+        }
+
+        /* Generate CDAT header */
+        cdat_header->revision = CXL_CDAT_REV;
+        cdat_header->sequence = 0;
+        cdat_header->length += sizeof(struct cdat_table_header);
+        sum += cdat_header->revision + cdat_header->sequence +
+               cdat_header->length;
+        cdat_header->checksum = ~sum + 1;
+
+        cdat_st[0].base = cdat_header;
+        cdat_st[0].length = sizeof(struct cdat_table_header);
+    }
+
+    /* Copy from temp struct */
+    cdat->entry_len = ent;
+    cdat->entry = g_malloc0(sizeof(CDATEntry) * ent);
+    memcpy(cdat->entry, cdat_st, sizeof(CDATEntry) * ent);
+}
diff --git a/hw/cxl/meson.build b/hw/cxl/meson.build
index 0eca715d10..9e2e5f4094 100644
--- a/hw/cxl/meson.build
+++ b/hw/cxl/meson.build
@@ -2,4 +2,5 @@ softmmu_ss.add(when: 'CONFIG_CXL', if_true: files(
   'cxl-component-utils.c',
   'cxl-device-utils.c',
   'cxl-mailbox-utils.c',
+  'cxl-cdat.c',
 ))
diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index 569872eb36..c6ebeb1bb2 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -121,6 +121,49 @@ bool cxl_doe_compliance_rsp(DOECap *doe_cap)
     return true;
 }
 
+bool cxl_doe_cdat_rsp(DOECap *doe_cap)
+{
+    CDATObject *cdat = &CT3(doe_cap->pdev)->cxl_cstate.cdat;
+    uint16_t ent;
+    void *base;
+    uint32_t len;
+    struct cxl_cdat_req *req = pcie_doe_get_write_mbox_ptr(doe_cap);
+    struct cxl_cdat_rsp rsp;
+
+    assert(cdat->entry_len);
+
+    /* Discard if request length mismatched */
+    if (pcie_doe_get_obj_len(req) <
+        DIV_ROUND_UP(sizeof(struct cxl_cdat_req), DWORD_BYTE)) {
+        return false;
+    }
+
+    ent = req->entry_handle;
+    base = cdat->entry[ent].base;
+    len = cdat->entry[ent].length;
+
+    rsp = (struct cxl_cdat_rsp) {
+        .header = {
+            .vendor_id = CXL_VENDOR_ID,
+            .data_obj_type = CXL_DOE_TABLE_ACCESS,
+            .reserved = 0x0,
+            .length = DIV_ROUND_UP((sizeof(rsp) + len), DWORD_BYTE),
+        },
+        .rsp_code = CXL_DOE_TAB_RSP,
+        .table_type = CXL_DOE_TAB_TYPE_CDAT,
+        .entry_handle = (ent < cdat->entry_len - 1) ?
+                        ent + 1 : CXL_DOE_TAB_ENT_MAX,
+    };
+
+    memcpy(doe_cap->read_mbox, &rsp, sizeof(rsp));
+    memcpy(doe_cap->read_mbox + DIV_ROUND_UP(sizeof(rsp), DWORD_BYTE),
+           base, len);
+
+    doe_cap->read_mbox_len += rsp.header.length;
+
+    return true;
+}
+
 static uint32_t ct3d_config_read(PCIDevice *pci_dev, uint32_t addr, int size)
 {
     CXLType3Dev *ct3d = CT3(pci_dev);
@@ -128,6 +171,8 @@ static uint32_t ct3d_config_read(PCIDevice *pci_dev, uint32_t addr, int size)
 
     if (pcie_doe_read_config(&ct3d->doe_comp, addr, size, &val)) {
         return val;
+    } else if (pcie_doe_read_config(&ct3d->doe_cdat, addr, size, &val)) {
+        return val;
     }
 
     return pci_default_read_config(pci_dev, addr, size);
@@ -139,6 +184,7 @@ static void ct3d_config_write(PCIDevice *pci_dev, uint32_t addr, uint32_t val,
     CXLType3Dev *ct3d = CT3(pci_dev);
 
     pcie_doe_write_config(&ct3d->doe_comp, addr, val, size);
+    pcie_doe_write_config(&ct3d->doe_cdat, addr, val, size);
     pci_default_write_config(pci_dev, addr, val, size);
 }
 
@@ -336,6 +382,11 @@ static DOEProtocol doe_comp_prot[] = {
     {},
 };
 
+static DOEProtocol doe_cdat_prot[] = {
+    {CXL_VENDOR_ID, CXL_DOE_TABLE_ACCESS, cxl_doe_cdat_rsp},
+    {},
+};
+
 static void ct3_realize(PCIDevice *pci_dev, Error **errp)
 {
     CXLType3Dev *ct3d = CT3(pci_dev);
@@ -343,7 +394,7 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
     ComponentRegisters *regs = &cxl_cstate->crb;
     MemoryRegion *mr = &regs->component_registers;
     uint8_t *pci_conf = pci_dev->config;
-    unsigned short msix_num = 1;
+    unsigned short msix_num = 2;
     int i;
 
     if (!ct3d->cxl_dstate.pmem) {
@@ -383,6 +434,9 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
 
     /* DOE Initailization */
     pcie_doe_init(pci_dev, &ct3d->doe_comp, 0x160, doe_comp_prot, true, 0);
+    pcie_doe_init(pci_dev, &ct3d->doe_cdat, 0x190, doe_cdat_prot, true, 1);
+
+    cxl_doe_cdat_init(cxl_cstate, errp);
 }
 
 static uint64_t cxl_md_get_addr(const MemoryDeviceState *md)
@@ -419,6 +473,7 @@ static Property ct3_props[] = {
                      HostMemoryBackend *),
     DEFINE_PROP_LINK("lsa", CXLType3Dev, lsa, TYPE_MEMORY_BACKEND,
                      HostMemoryBackend *),
+    DEFINE_PROP_STRING("cdat", CXLType3Dev, cxl_cstate.cdat.filename),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/cxl/cxl_cdat.h b/include/hw/cxl/cxl_cdat.h
new file mode 100644
index 0000000000..f97b9db870
--- /dev/null
+++ b/include/hw/cxl/cxl_cdat.h
@@ -0,0 +1,149 @@
+/*
+ * CXL CDAT Structure
+ *
+ * Copyright (C) 2021 Avery Design Systems, Inc.
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
+/*
+ * Reference:
+ *   Coherent Device Attribute Table (CDAT) Specification, Rev. 1.02, Oct. 2020
+ *   Compute Express Link (CXL) Specification, Rev. 2.0, Oct. 2020
+ */
+/* Table Access DOE - CXL 8.1.11 */
+#define CXL_DOE_TABLE_ACCESS      2
+#define CXL_DOE_PROTOCOL_CDAT     ((CXL_DOE_TABLE_ACCESS << 16) | CXL_VENDOR_ID)
+
+/* Read Entry - CXL 8.1.11.1 */
+#define CXL_DOE_TAB_TYPE_CDAT 0
+#define CXL_DOE_TAB_ENT_MAX 0xFFFF
+
+/* Read Entry Request - CXL 8.1.11.1 Table 134 */
+#define CXL_DOE_TAB_REQ 0
+struct cxl_cdat_req {
+    DOEHeader header;
+    uint8_t req_code;
+    uint8_t table_type;
+    uint16_t entry_handle;
+} QEMU_PACKED;
+
+/* Read Entry Response - CXL 8.1.11.1 Table 135 */
+#define CXL_DOE_TAB_RSP 0
+struct cxl_cdat_rsp {
+    DOEHeader header;
+    uint8_t rsp_code;
+    uint8_t table_type;
+    uint16_t entry_handle;
+} QEMU_PACKED;
+
+/* CDAT Table Format - CDAT Table 1 */
+#define CXL_CDAT_REV 1
+struct cdat_table_header {
+    uint32_t length;
+    uint8_t revision;
+    uint8_t checksum;
+    uint8_t reserved[6];
+    uint32_t sequence;
+} QEMU_PACKED;
+
+/* CDAT Structure Types - CDAT Table 2 */
+enum cdat_type {
+    CDAT_TYPE_DSMAS = 0,
+    CDAT_TYPE_DSLBIS = 1,
+    CDAT_TYPE_DSMSCIS = 2,
+    CDAT_TYPE_DSIS = 3,
+    CDAT_TYPE_DSEMTS = 4,
+    CDAT_TYPE_SSLBIS = 5,
+};
+
+struct cdat_sub_header {
+    uint8_t type;
+    uint8_t reserved;
+    uint16_t length;
+};
+
+/* Device Scoped Memory Affinity Structure - CDAT Table 3 */
+struct cdat_dsmas {
+    struct cdat_sub_header header;
+    uint8_t DSMADhandle;
+    uint8_t flags;
+    uint16_t reserved;
+    uint64_t DPA_base;
+    uint64_t DPA_length;
+} QEMU_PACKED;
+
+/* Device Scoped Latency and Bandwidth Information Structure - CDAT Table 5 */
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
+/* Device Scoped Memory Side Cache Information Structure - CDAT Table 6 */
+struct cdat_dsmscis {
+    struct cdat_sub_header header;
+    uint8_t DSMAS_handle;
+    uint8_t reserved[3];
+    uint64_t memory_side_cache_size;
+    uint32_t cache_attributes;
+} QEMU_PACKED;
+
+/* Device Scoped Initiator Structure - CDAT Table 7 */
+struct cdat_dsis {
+    struct cdat_sub_header header;
+    uint8_t flags;
+    uint8_t handle;
+    uint16_t reserved;
+} QEMU_PACKED;
+
+/* Device Scoped EFI Memory Type Structure - CDAT Table 8 */
+struct cdat_dsemts {
+    struct cdat_sub_header header;
+    uint8_t DSMAS_handle;
+    uint8_t EFI_memory_type_attr;
+    uint16_t reserved;
+    uint64_t DPA_offset;
+    uint64_t DPA_length;
+} QEMU_PACKED;
+
+/* Switch Scoped Latency and Bandwidth Information Structure - CDAT Table 9 */
+struct cdat_sslbis_header {
+    struct cdat_sub_header header;
+    uint8_t data_type;
+    uint8_t reserved[3];
+    uint64_t entry_base_unit;
+} QEMU_PACKED;
+
+/* Switch Scoped Latency and Bandwidth Entry - CDAT Table 10 */
+struct cdat_sslbe {
+    uint16_t port_x_id;
+    uint16_t port_y_id;
+    uint16_t latency_bandwidth;
+    uint16_t reserved;
+} QEMU_PACKED;
+
+typedef struct CDATEntry {
+    void *base;
+    uint32_t length;
+} CDATEntry;
+
+typedef struct CDATObject {
+    CDATEntry *entry;
+    int entry_len;
+
+    char *filename;
+    char *buf;
+} CDATObject;
+#endif /* CXL_CDAT_H */
diff --git a/include/hw/cxl/cxl_component.h b/include/hw/cxl/cxl_component.h
index d299c77ae3..a156803f51 100644
--- a/include/hw/cxl/cxl_component.h
+++ b/include/hw/cxl/cxl_component.h
@@ -18,6 +18,7 @@
 #include "qemu/range.h"
 #include "qemu/typedefs.h"
 #include "hw/register.h"
+#include "qapi/error.h"
 
 enum reg_type {
     CXL2_DEVICE,
@@ -175,6 +176,7 @@ typedef struct cxl_component {
     };
 
     ComplianceObject compliance;
+    CDATObject cdat;
 } CXLComponentState;
 
 void cxl_component_register_block_init(Object *obj,
@@ -187,4 +189,6 @@ void cxl_component_create_dvsec(CXLComponentState *cxl_cstate, uint16_t length,
                                 uint16_t type, uint8_t rev, uint8_t *body);
 
 bool cxl_doe_compliance_rsp(DOECap *doe_cap);
+void cxl_doe_cdat_init(CXLComponentState *cxl_cstate, Error **errp);
+bool cxl_doe_cdat_rsp(DOECap *doe_cap);
 #endif
diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index f0cb7de795..de006ff463 100644
--- a/include/hw/cxl/cxl_device.h
+++ b/include/hw/cxl/cxl_device.h
@@ -239,6 +239,7 @@ typedef struct cxl_type3_dev {
 
     /* DOE */
     DOECap doe_comp;
+    DOECap doe_cdat;
 } CXLType3Dev;
 
 #ifndef TYPE_CXL_TYPE3_DEV
diff --git a/include/hw/cxl/cxl_pci.h b/include/hw/cxl/cxl_pci.h
index 129bdf3238..c4516d3403 100644
--- a/include/hw/cxl/cxl_pci.h
+++ b/include/hw/cxl/cxl_pci.h
@@ -12,6 +12,7 @@
 
 #include "hw/pci/pci.h"
 #include "hw/pci/pcie.h"
+#include "hw/cxl/cxl_cdat.h"
 #include "hw/cxl/cxl_compliance.h"
 
 #define CXL_VENDOR_ID 0x1e98
-- 
2.17.1


