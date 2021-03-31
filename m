Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE3F3504CF
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 18:40:59 +0200 (CEST)
Received: from localhost ([::1]:48686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRdtr-0001yV-0G
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 12:40:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@server4.localdomain>)
 id 1lRdq9-0007Qq-St
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 12:37:09 -0400
Received: from static-71-162-116-19.bstnma.fios.verizon.net
 ([71.162.116.19]:37740 helo=server4.localdomain)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chris@server4.localdomain>) id 1lRdq3-0005vH-D2
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 12:37:08 -0400
Received: by server4.localdomain (Postfix, from userid 503)
 id 702F060311111; Wed, 31 Mar 2021 12:37:00 -0400 (EDT)
From: Chris Browy <cbrowy@avery-design.com>
To: mst@redhat.com
Subject: [PATCH v4 cxl-2.0-doe 2/3] CXL Data Object Exchange implementation
Date: Wed, 31 Mar 2021 12:36:58 -0400
Message-Id: <1617208618-3549-1-git-send-email-cbrowy@avery-design.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1617207125-1138-1-git-send-email-cbrowy@avery-design.com>
References: <1617207125-1138-1-git-send-email-cbrowy@avery-design.com>
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
 vishal.l.verma@intel.com, jgroves@micron.com, armbru@redhat.com,
 linux-cxl@vger.kernel.org, f4bug@amsat.org, hchkuo@avery-design.com.tw,
 tyshao@avery-design.com.tw, jonathan.cameron@huawei.com, imammedo@redhat.com,
 dan.j.williams@intel.com, ira.weiny@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: hchkuo <hchkuo@avery-design.com.tw>

Signed-off-by: hchkuo <hchkuo@avery-design.com.tw>
---
 hw/cxl/cxl-cdat.c               | 220 +++++++++++++++++++++++++++++
 hw/cxl/meson.build              |   1 +
 hw/mem/cxl_type3.c              | 200 +++++++++++++++++++++++++++
 include/hw/cxl/cxl_cdat.h       | 149 ++++++++++++++++++++
 include/hw/cxl/cxl_compliance.h | 297 ++++++++++++++++++++++++++++++++++++++++
 include/hw/cxl/cxl_component.h  |   7 +
 include/hw/cxl/cxl_device.h     |   4 +
 include/hw/cxl/cxl_pci.h        |   2 +
 tests/data/cdat/cdat.dat        | Bin 0 -> 148 bytes
 9 files changed, 880 insertions(+)
 create mode 100644 hw/cxl/cxl-cdat.c
 create mode 100644 include/hw/cxl/cxl_cdat.h
 create mode 100644 include/hw/cxl/cxl_compliance.h
 create mode 100644 tests/data/cdat/cdat.dat

diff --git a/hw/cxl/cxl-cdat.c b/hw/cxl/cxl-cdat.c
new file mode 100644
index 0000000..fa54506
--- /dev/null
+++ b/hw/cxl/cxl-cdat.c
@@ -0,0 +1,220 @@
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
+
+static struct cdat_dsmas dsmas = {
+    .header = {
+        .type = CDAT_TYPE_DSMAS,
+        .length = sizeof(dsmas),
+    },
+    .DSMADhandle = 0,
+    .flags = 0,
+    .DPA_base = 0,
+    .DPA_length = 0,
+};
+
+static struct cdat_dslbis dslbis = {
+    .header = {
+        .type = CDAT_TYPE_DSLBIS,
+        .length = sizeof(dslbis),
+    },
+    .handle = 0,
+    .flags = 0,
+    .data_type = 0,
+    .entry_base_unit = 0,
+};
+
+static struct cdat_dsmscis dsmscis = {
+    .header = {
+        .type = CDAT_TYPE_DSMSCIS,
+        .length = sizeof(dsmscis),
+    },
+    .DSMAS_handle = 0,
+    .memory_side_cache_size = 0,
+    .cache_attributes = 0,
+};
+
+static struct cdat_dsis dsis = {
+    .header = {
+        .type = CDAT_TYPE_DSIS,
+        .length = sizeof(dsis),
+    },
+    .flags = 0,
+    .handle = 0,
+};
+
+static struct cdat_dsemts dsemts = {
+    .header = {
+        .type = CDAT_TYPE_DSEMTS,
+        .length = sizeof(dsemts),
+    },
+    .DSMAS_handle = 0,
+    .EFI_memory_type_attr = 0,
+    .DPA_offset = 0,
+    .DPA_length = 0,
+};
+
+struct cdat_sslbis {
+    struct cdat_sslbis_header sslbis_header;
+    struct cdat_sslbe sslbe[];
+};
+
+static struct cdat_sslbis sslbis = {
+    .sslbis_header = {
+        .header = {
+            .type = CDAT_TYPE_SSLBIS,
+            .length = sizeof(sslbis.sslbis_header) +
+                      sizeof(struct cdat_sslbe) * 2,
+        },
+        .data_type = 0,
+        .entry_base_unit = 0,
+    },
+    .sslbe[0] = {
+        .port_x_id = 0,
+        .port_y_id = 0,
+        .latency_bandwidth = 0,
+    },
+    .sslbe[1] = {
+        .port_x_id = 0,
+        .port_y_id = 0,
+        .latency_bandwidth = 0,
+    },
+};
+
+static void *cdat_table[] = {
+    (void *) &dsmas,
+    (void *) &dslbis,
+    (void *) &dsmscis,
+    (void *) &dsis,
+    (void *) &dsemts,
+    (void *) &sslbis,
+};
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
+    int i = 0, ent = 0, file_size = 0;
+    struct cdat_sub_header *hdr;
+    struct cdat_table_header *cdat_header;
+    FILE *fp;
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
+        /* Set CDAT header, ent = 0 */
+        cdat_st[ent].base = cdat->buf;
+        cdat_st[ent].length = sizeof(struct cdat_table_header);
+        ent++;
+        while (i < cdat_st[0].length) {
+            sum += cdat->buf[i++];
+        }
+
+        /* Read CDAT structures */
+        while (i < file_size) {
+            hdr = (void *)(cdat->buf + i);
+            cdat_len_check(hdr, errp);
+
+            cdat_st[ent].base = hdr;
+            cdat_st[ent].length = hdr->length;
+
+            while ((void *)(cdat->buf + i) <
+                   cdat_st[ent].base + cdat_st[ent].length) {
+                assert(i < file_size);
+                sum += cdat->buf[i++];
+            }
+
+            ent++;
+        }
+
+        /* Check checksum */
+        assert(sum == 0);
+    } else {
+        /* Fail to open, use the default settings instead of extern cdat file */
+        cdat_header = g_malloc0(sizeof(struct cdat_table_header));
+
+        /* Spare entry 0 for CDAT header */
+        for (ent = 1; ent < ARRAY_SIZE(cdat_table) + 1; ent++) {
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
index 0eca715..9e2e5f4 100644
--- a/hw/cxl/meson.build
+++ b/hw/cxl/meson.build
@@ -2,4 +2,5 @@ softmmu_ss.add(when: 'CONFIG_CXL', if_true: files(
   'cxl-component-utils.c',
   'cxl-device-utils.c',
   'cxl-mailbox-utils.c',
+  'cxl-cdat.c',
 ))
diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index bf33ddb..e4b513f 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -13,6 +13,178 @@
 #include "qemu/rcu.h"
 #include "sysemu/hostmem.h"
 #include "hw/cxl/cxl.h"
+#include "hw/pci/msi.h"
+#include "hw/pci/msix.h"
+
+bool cxl_doe_compliance_rsp(DOECap *doe_cap)
+{
+    CompRsp *rsp = &CT3(doe_cap->pdev)->cxl_cstate.compliance.response;
+    struct compliance_req_header *req = pcie_doe_get_req(doe_cap);
+    uint32_t type, req_len, rsp_len = 0;
+
+    type = req->req_code;
+
+    switch (type) {
+    case CXL_COMP_MODE_CAP:
+        req_len = sizeof(struct cxl_compliance_mode_cap);
+        rsp_len = sizeof(struct cxl_compliance_mode_cap_rsp);
+        rsp->cap_rsp.status = 0x0;
+        rsp->cap_rsp.available_cap_bitmask = 0;
+        rsp->cap_rsp.enabled_cap_bitmask = 0;
+        break;
+    case CXL_COMP_MODE_STATUS:
+        req_len = sizeof(struct cxl_compliance_mode_status);
+        rsp_len = sizeof(struct cxl_compliance_mode_status_rsp);
+        rsp->status_rsp.cap_bitfield = 0;
+        rsp->status_rsp.cache_size = 0;
+        rsp->status_rsp.cache_size_units = 0;
+        break;
+    case CXL_COMP_MODE_HALT:
+        req_len = sizeof(struct cxl_compliance_mode_halt);
+        rsp_len = sizeof(struct cxl_compliance_mode_halt_rsp);
+        break;
+    case CXL_COMP_MODE_MULT_WR_STREAM:
+        req_len = sizeof(struct cxl_compliance_mode_multiple_write_streaming);
+        rsp_len = sizeof(
+                  struct cxl_compliance_mode_multiple_write_streaming_rsp);
+        break;
+    case CXL_COMP_MODE_PRO_CON:
+        req_len = sizeof(struct cxl_compliance_mode_producer_consumer);
+        rsp_len = sizeof(struct cxl_compliance_mode_producer_consumer_rsp);
+        break;
+    case CXL_COMP_MODE_BOGUS:
+        req_len = sizeof(struct cxl_compliance_mode_inject_bogus_writes);
+        rsp_len = sizeof(struct cxl_compliance_mode_inject_bogus_writes_rsp);
+        break;
+    case CXL_COMP_MODE_INJ_POISON:
+        req_len = sizeof(struct cxl_compliance_mode_inject_poison);
+        rsp_len = sizeof(struct cxl_compliance_mode_inject_poison_rsp);
+        break;
+    case CXL_COMP_MODE_INJ_CRC:
+        req_len = sizeof(struct cxl_compliance_mode_inject_crc);
+        rsp_len = sizeof(struct cxl_compliance_mode_inject_crc_rsp);
+        break;
+    case CXL_COMP_MODE_INJ_FC:
+        req_len = sizeof(struct cxl_compliance_mode_inject_flow_control);
+        rsp_len = sizeof(struct cxl_compliance_mode_inject_flow_control_rsp);
+        break;
+    case CXL_COMP_MODE_TOGGLE_CACHE:
+        req_len = sizeof(struct cxl_compliance_mode_toggle_cache_flush);
+        rsp_len = sizeof(struct cxl_compliance_mode_toggle_cache_flush_rsp);
+        break;
+    case CXL_COMP_MODE_INJ_MAC:
+        req_len = sizeof(struct cxl_compliance_mode_inject_mac_delay);
+        rsp_len = sizeof(struct cxl_compliance_mode_inject_mac_delay_rsp);
+        break;
+    case CXL_COMP_MODE_INS_UNEXP_MAC:
+        req_len = sizeof(struct cxl_compliance_mode_insert_unexp_mac);
+        rsp_len = sizeof(struct cxl_compliance_mode_insert_unexp_mac_rsp);
+        break;
+    case CXL_COMP_MODE_INJ_VIRAL:
+        req_len = sizeof(struct cxl_compliance_mode_inject_viral);
+        rsp_len = sizeof(struct cxl_compliance_mode_inject_viral_rsp);
+        break;
+    case CXL_COMP_MODE_INJ_ALMP:
+        req_len = sizeof(struct cxl_compliance_mode_inject_almp);
+        rsp_len = sizeof(struct cxl_compliance_mode_inject_almp_rsp);
+        break;
+    case CXL_COMP_MODE_IGN_ALMP:
+        req_len = sizeof(struct cxl_compliance_mode_ignore_almp);
+        rsp_len = sizeof(struct cxl_compliance_mode_ignore_almp_rsp);
+        break;
+    case CXL_COMP_MODE_INJ_BIT_ERR:
+        req_len = sizeof(struct cxl_compliance_mode_inject_bit_error);
+        rsp_len = sizeof(struct cxl_compliance_mode_inject_bit_error_rsp);
+        break;
+    default:
+        break;
+    }
+
+    /* Request length mismatch, discard */
+    if (pcie_doe_get_obj_len(req) < DIV_ROUND_UP(req_len, 4)) {
+        return false;
+    }
+
+    /* Common fields of each compliance type */
+    rsp->header.doe_header.vendor_id = CXL_VENDOR_ID;
+    rsp->header.doe_header.data_obj_type = CXL_DOE_COMPLIANCE;
+    rsp->header.doe_header.length = DIV_ROUND_UP(rsp_len, 4);
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
+bool cxl_doe_cdat_rsp(DOECap *doe_cap)
+{
+    CDATObject *cdat = &CT3(doe_cap->pdev)->cxl_cstate.cdat;
+    uint16_t ent;
+    void *base;
+    uint32_t len;
+    struct cxl_cdat *req = pcie_doe_get_req(doe_cap);
+    struct cxl_cdat_rsp rsp;
+
+    assert(cdat->entry_len);
+
+    /* Request length mismatch, discard */
+    if (pcie_doe_get_obj_len(req) <
+        DIV_ROUND_UP(sizeof(struct cxl_cdat), 4)) {
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
+            .length = DIV_ROUND_UP((sizeof(rsp) + len), 4),
+        },
+        .rsp_code = CXL_DOE_TAB_RSP,
+        .table_type = CXL_DOE_TAB_TYPE_CDAT,
+        .entry_handle = (ent < cdat->entry_len - 1) ?
+                        ent + 1 : CXL_DOE_TAB_ENT_MAX,
+    };
+
+    memcpy(doe_cap->read_mbox, &rsp, sizeof(rsp));
+    memcpy(doe_cap->read_mbox + DIV_ROUND_UP(sizeof(rsp), 4), base, len);
+
+    doe_cap->read_mbox_len += rsp.header.length;
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
@@ -203,6 +375,16 @@ static MemoryRegion *cxl_md_get_memory_region(MemoryDeviceState *md,
     return ct3d->cxl_dstate.pmem;
 }
 
+static DOEProtocol doe_comp_prot[] = {
+    {CXL_VENDOR_ID, CXL_DOE_COMPLIANCE, cxl_doe_compliance_rsp},
+    {},
+};
+
+static DOEProtocol doe_cdat_prot[] = {
+    {CXL_VENDOR_ID, CXL_DOE_TABLE_ACCESS, cxl_doe_cdat_rsp},
+    {},
+};
+
 static void ct3_realize(PCIDevice *pci_dev, Error **errp)
 {
     CXLType3Dev *ct3d = CT3(pci_dev);
@@ -210,6 +392,8 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
     ComponentRegisters *regs = &cxl_cstate->crb;
     MemoryRegion *mr = &regs->component_registers;
     uint8_t *pci_conf = pci_dev->config;
+    unsigned short msix_num = 2;
+    int i;
 
     if (!ct3d->cxl_dstate.pmem) {
         cxl_setup_memory(ct3d, errp);
@@ -239,6 +423,18 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
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
+    pcie_doe_init(pci_dev, &ct3d->doe_cdat, 0x190, doe_cdat_prot, true, 1);
+
+    cxl_doe_cdat_init(cxl_cstate, errp);
 }
 
 static uint64_t cxl_md_get_addr(const MemoryDeviceState *md)
@@ -275,6 +471,7 @@ static Property ct3_props[] = {
                      HostMemoryBackend *),
     DEFINE_PROP_LINK("lsa", CXLType3Dev, lsa, TYPE_MEMORY_BACKEND,
                      HostMemoryBackend *),
+    DEFINE_PROP_STRING("cdat", CXLType3Dev, cxl_cstate.cdat.filename),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -357,6 +554,9 @@ static void ct3_class_init(ObjectClass *oc, void *data)
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
index 0000000..1e46ee9
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
+struct cxl_cdat {
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
+/* Device scoped Latency and Bandwidth Information Structure - CDAT Table 5 */
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
diff --git a/include/hw/cxl/cxl_compliance.h b/include/hw/cxl/cxl_compliance.h
new file mode 100644
index 0000000..0de56a1
--- /dev/null
+++ b/include/hw/cxl/cxl_compliance.h
@@ -0,0 +1,297 @@
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
+struct cxl_compliance_mode_cap {
+    CompReqHeader header;
+} QEMU_PACKED;
+
+/* 14.16.4.1 Table 278 */
+struct cxl_compliance_mode_cap_rsp {
+    CompRspHeader header;
+    uint8_t status;
+    uint64_t available_cap_bitmask;
+    uint64_t enabled_cap_bitmask;
+} QEMU_PACKED;
+
+/* 14.16.4.2 Table 279 */
+struct cxl_compliance_mode_status {
+    CompReqHeader header;
+} QEMU_PACKED;
+
+/* 14.16.4.2 Table 280 */
+struct cxl_compliance_mode_status_rsp {
+    CompRspHeader header;
+    uint32_t cap_bitfield;
+    uint16_t cache_size;
+    uint8_t cache_size_units;
+} QEMU_PACKED;
+
+/* 14.16.4.3 Table 281 */
+struct cxl_compliance_mode_halt {
+    CompReqHeader header;
+} QEMU_PACKED;
+
+/* 14.16.4.3 Table 282 */
+#define cxl_compliance_mode_halt_rsp status_rsp
+
+/* 14.16.4.4 Table 283 */
+struct cxl_compliance_mode_multiple_write_streaming {
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
+#define cxl_compliance_mode_multiple_write_streaming_rsp status_rsp
+
+/* 14.16.4.5 Table 285 */
+struct cxl_compliance_mode_producer_consumer {
+    CompReqHeader header;
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
+/* 14.16.4.5 Table 286 */
+#define cxl_compliance_mode_producer_consumer_rsp status_rsp
+
+/* 14.16.4.6 Table 287 */
+struct cxl_compliance_mode_inject_bogus_writes {
+    CompReqHeader header;
+    uint8_t count;
+    uint8_t reserved;
+    uint32_t pattern;
+} QEMU_PACKED;
+
+/* 14.16.4.6 Table 288 */
+#define cxl_compliance_mode_inject_bogus_writes_rsp status_rsp
+
+/* 14.16.4.7 Table 289 */
+struct cxl_compliance_mode_inject_poison {
+    CompReqHeader header;
+    uint8_t protocol;
+} QEMU_PACKED;
+
+/* 14.16.4.7 Table 290 */
+#define cxl_compliance_mode_inject_poison_rsp status_rsp
+
+/* 14.16.4.8 Table 291 */
+struct cxl_compliance_mode_inject_crc {
+    CompReqHeader header;
+    uint8_t num_bits_flip;
+    uint8_t num_flits_inj;
+} QEMU_PACKED;
+
+/* 14.16.4.8 Table 292 */
+#define cxl_compliance_mode_inject_crc_rsp status_rsp
+
+/* 14.16.4.9 Table 293 */
+struct cxl_compliance_mode_inject_flow_control {
+    CompReqHeader header;
+    uint8_t inj_flow_control;
+} QEMU_PACKED;
+
+/* 14.16.4.9 Table 294 */
+#define cxl_compliance_mode_inject_flow_control_rsp status_rsp
+
+/* 14.16.4.10 Table 295 */
+struct cxl_compliance_mode_toggle_cache_flush {
+    CompReqHeader header;
+    uint8_t cache_flush_control;
+} QEMU_PACKED;
+
+/* 14.16.4.10 Table 296 */
+#define cxl_compliance_mode_toggle_cache_flush_rsp status_rsp
+
+/* 14.16.4.11 Table 297 */
+struct cxl_compliance_mode_inject_mac_delay {
+    CompReqHeader header;
+    uint8_t enable;
+    uint8_t mode;
+    uint8_t delay;
+} QEMU_PACKED;
+
+/* 14.16.4.11 Table 298 */
+#define cxl_compliance_mode_inject_mac_delay_rsp status_rsp
+
+/* 14.16.4.12 Table 299 */
+struct cxl_compliance_mode_insert_unexp_mac {
+    CompReqHeader header;
+    uint8_t opcode;
+    uint8_t mode;
+} QEMU_PACKED;
+
+/* 14.16.4.12 Table 300 */
+#define cxl_compliance_mode_insert_unexp_mac_rsp status_rsp
+
+/* 14.16.4.13 Table 301 */
+struct cxl_compliance_mode_inject_viral {
+    CompReqHeader header;
+    uint8_t protocol;
+} QEMU_PACKED;
+
+/* 14.16.4.13 Table 302 */
+#define cxl_compliance_mode_inject_viral_rsp status_rsp
+
+/* 14.16.4.14 Table 303 */
+struct cxl_compliance_mode_inject_almp {
+    CompReqHeader header;
+    uint8_t opcode;
+    uint8_t reserved2[3];
+} QEMU_PACKED;
+
+/* 14.16.4.14 Table 304 */
+#define cxl_compliance_mode_inject_almp_rsp len_rsvd_rsp
+
+/* 14.16.4.15 Table 305 */
+struct cxl_compliance_mode_ignore_almp {
+    CompReqHeader header;
+    uint8_t opcode;
+    uint8_t reserved2[3];
+} QEMU_PACKED;
+
+/* 14.16.4.15 Table 306 */
+#define cxl_compliance_mode_ignore_almp_rsp len_rsvd_rsp
+
+/* 14.16.4.16 Table 307 */
+struct cxl_compliance_mode_inject_bit_error {
+    CompReqHeader header;
+    uint8_t opcode;
+} QEMU_PACKED;
+
+/* 14.16.4.16 Table 308 */
+#define cxl_compliance_mode_inject_bit_error_rsp len_rsvd_rsp
+
+typedef struct ComplianceObject ComplianceObject;
+
+typedef union doe_rsp_u {
+    CompRspHeader header;
+
+    struct cxl_compliance_mode_cap_rsp cap_rsp;
+    struct cxl_compliance_mode_status_rsp status_rsp;
+    struct cxl_compliance_mode_halt_rsp halt_rsp;
+    struct cxl_compliance_mode_multiple_write_streaming_rsp
+        multiple_write_streaming_rsp;
+    struct cxl_compliance_mode_producer_consumer_rsp producer_consumer_rsp;
+    struct cxl_compliance_mode_inject_bogus_writes_rsp
+        inject_bogus_writes_rsp;
+    struct cxl_compliance_mode_inject_poison_rsp inject_poison_rsp;
+    struct cxl_compliance_mode_inject_crc_rsp inject_crc_rsp;
+    struct cxl_compliance_mode_inject_flow_control_rsp
+        inject_flow_control_rsp;
+    struct cxl_compliance_mode_toggle_cache_flush_rsp
+        toggle_cache_flush_rsp;
+    struct cxl_compliance_mode_inject_mac_delay_rsp inject_mac_delay_rsp;
+    struct cxl_compliance_mode_insert_unexp_mac_rsp insert_unexp_mac_rsp;
+    struct cxl_compliance_mode_inject_viral inject_viral_rsp;
+    struct cxl_compliance_mode_inject_almp_rsp inject_almp_rsp;
+    struct cxl_compliance_mode_ignore_almp_rsp ignore_almp_rsp;
+    struct cxl_compliance_mode_inject_bit_error_rsp ignore_bit_error_rsp;
+} CompRsp;
+
+struct ComplianceObject {
+    CompRsp response;
+} QEMU_PACKED;
+#endif /* CXL_COMPL_H */
diff --git a/include/hw/cxl/cxl_component.h b/include/hw/cxl/cxl_component.h
index acc0730..a156803 100644
--- a/include/hw/cxl/cxl_component.h
+++ b/include/hw/cxl/cxl_component.h
@@ -18,6 +18,7 @@
 #include "qemu/range.h"
 #include "qemu/typedefs.h"
 #include "hw/register.h"
+#include "qapi/error.h"
 
 enum reg_type {
     CXL2_DEVICE,
@@ -173,6 +174,9 @@ typedef struct cxl_component {
             struct PCIDevice *pdev;
         };
     };
+
+    ComplianceObject compliance;
+    CDATObject cdat;
 } CXLComponentState;
 
 void cxl_component_register_block_init(Object *obj,
@@ -184,4 +188,7 @@ void cxl_component_register_init_common(uint32_t *reg_state,
 void cxl_component_create_dvsec(CXLComponentState *cxl_cstate, uint16_t length,
                                 uint16_t type, uint8_t rev, uint8_t *body);
 
+bool cxl_doe_compliance_rsp(DOECap *doe_cap);
+void cxl_doe_cdat_init(CXLComponentState *cxl_cstate, Error **errp);
+bool cxl_doe_cdat_rsp(DOECap *doe_cap);
 #endif
diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index 057c5b8..de006ff 100644
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
index e8235b1..c4516d3 100644
--- a/include/hw/cxl/cxl_pci.h
+++ b/include/hw/cxl/cxl_pci.h
@@ -12,6 +12,8 @@
 
 #include "hw/pci/pci.h"
 #include "hw/pci/pcie.h"
+#include "hw/cxl/cxl_cdat.h"
+#include "hw/cxl/cxl_compliance.h"
 
 #define CXL_VENDOR_ID 0x1e98
 
diff --git a/tests/data/cdat/cdat.dat b/tests/data/cdat/cdat.dat
new file mode 100644
index 0000000000000000000000000000000000000000..b66c5d5836bcce7490e698f9ab5071c623425c48
GIT binary patch
literal 148
ycmbQjz`($`14zJu1e^tBD1c~21`KhqG!ugem_{a;892aP794t585EF}W3U1CI069x

literal 0
HcmV?d00001

-- 
1.8.3.1


