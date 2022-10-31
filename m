Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE9C6137AE
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:18:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUHd-0005ld-Bz; Mon, 31 Oct 2022 08:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUH7-0002gb-HY
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:52:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUGy-0002a1-Mj
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:52:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ERzEI18Yr0lNIjwRz1p2jXmUs5Nmir9DxqjwcH2xiP0=;
 b=PsshcXPqkRExvRY2K5toDPx4NrFkgpHO2BayrZ6ByTrEpM308JGrUW25W/dwhDud56+oWg
 ON5DHDZ7dyrOtHVxUjb8Jk7TrvquQ1dZsFYzNvTc+Bm8GMOBuTcP3ZBhEJcUSU++gTBj9c
 BfBS8c47vrJU7+CzuuOY98ESDsutQjc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-497-j-7D7uGMOBay9uwyAb0sgQ-1; Mon, 31 Oct 2022 08:52:10 -0400
X-MC-Unique: j-7D7uGMOBay9uwyAb0sgQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 d23-20020adfa417000000b002364a31b7c9so3017953wra.15
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:52:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ERzEI18Yr0lNIjwRz1p2jXmUs5Nmir9DxqjwcH2xiP0=;
 b=oeicPjQZ8uvysCj7KjxX+CW/2HtXtIWS6AqxLmV0mdasP9JL/DwFLskbtlNpXXFVup
 Mak5V7QLOGih1U+frSgj2CEv2yFqPg7nEpHQjmubM0YA1LTBimLvgSxZ33ZcbNyagsqB
 5FbMi6Z6zgMNNeza416VziN4uWXVdGS6nelr9YBzjigRVJ7D+1ZbPBjGl9je8QYB5/R3
 4NnrYnRDLr6DkHeT1lDO+/wTRAPg24as6t0pg+MOE4k7SZ8Oueyp1KY37SRcN+zv9oTg
 jyvF7S6B/J5b7wyjPGqZytKXdB0BIXtxICGf2Jz4NUmdzJMiGp+fObRr2LS68KHiGtjg
 JUnQ==
X-Gm-Message-State: ACrzQf3nCxuq0/tLtVglvo8Avs/dOjiJjh91mOAgE1y9p/ZG3lctjWVI
 w/LrwBKVZH2hEOOEt869YEzuXKYebx5FKKAhjT6MJW9ZquuyoJXVxndiqQd7bWP09bNi2O/3axa
 eLvDAW1oP0Py2bkuCr3ahhHAzF/Q3woFUPPgO4jCfWxcTX21y9Y3qNk8/Csix
X-Received: by 2002:a05:600c:4fcf:b0:3c6:cdb9:b68f with SMTP id
 o15-20020a05600c4fcf00b003c6cdb9b68fmr18582048wmq.73.1667220729235; 
 Mon, 31 Oct 2022 05:52:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM75k9Z36xbjdcWgxfrgwy/qzC9HOkFjq1IwtSXhrzQMrOb960pI9rJfhtPrP/frFeJgyN8xNg==
X-Received: by 2002:a05:600c:4fcf:b0:3c6:cdb9:b68f with SMTP id
 o15-20020a05600c4fcf00b003c6cdb9b68fmr18582025wmq.73.1667220728754; 
 Mon, 31 Oct 2022 05:52:08 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 l13-20020a05600c2ccd00b003a2f2bb72d5sm8138590wmc.45.2022.10.31.05.52.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:52:08 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:52:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Huai-Cheng Kuo <hchkuo@avery-design.com.tw>,
 Chris Browy <cbrowy@avery-design.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ben Widawsky <ben.widawsky@intel.com>
Subject: [PULL 29/86] hw/cxl/cdat: CXL CDAT Data Object Exchange implementation
Message-ID: <20221031124928.128475-30-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: Huai-Cheng Kuo <hchkuo@avery-design.com.tw>

The Data Object Exchange implementation of CXL Coherent Device Attribute
Table (CDAT). This implementation is referring to "Coherent Device
Attribute Table Specification, Rev. 1.03, July. 2022" and "Compute
Express Link Specification, Rev. 3.0, July. 2022"

This patch adds core support that will be shared by both
end-points and switch port emulation.

Signed-off-by: Huai-Cheng Kuo <hchkuo@avery-design.com.tw>
Signed-off-by: Chris Browy <cbrowy@avery-design.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20221014151045.24781-4-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/cxl/cxl_cdat.h      | 165 ++++++++++++++++++++++++
 include/hw/cxl/cxl_component.h |   7 ++
 include/hw/cxl/cxl_device.h    |   3 +
 include/hw/cxl/cxl_pci.h       |   1 +
 hw/cxl/cxl-cdat.c              | 224 +++++++++++++++++++++++++++++++++
 hw/cxl/meson.build             |   1 +
 6 files changed, 401 insertions(+)
 create mode 100644 include/hw/cxl/cxl_cdat.h
 create mode 100644 hw/cxl/cxl-cdat.c

diff --git a/include/hw/cxl/cxl_cdat.h b/include/hw/cxl/cxl_cdat.h
new file mode 100644
index 0000000000..52c232e912
--- /dev/null
+++ b/include/hw/cxl/cxl_cdat.h
@@ -0,0 +1,165 @@
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
+ *   Coherent Device Attribute Table (CDAT) Specification, Rev. 1.03, July. 2022
+ *   Compute Express Link (CXL) Specification, Rev. 3.0, Aug. 2022
+ */
+/* Table Access DOE - CXL r3.0 8.1.11 */
+#define CXL_DOE_TABLE_ACCESS      2
+#define CXL_DOE_PROTOCOL_CDAT     ((CXL_DOE_TABLE_ACCESS << 16) | CXL_VENDOR_ID)
+
+/* Read Entry - CXL r3.0 8.1.11.1 */
+#define CXL_DOE_TAB_TYPE_CDAT 0
+#define CXL_DOE_TAB_ENT_MAX 0xFFFF
+
+/* Read Entry Request - CXL r3.0 8.1.11.1 Table 8-13 */
+#define CXL_DOE_TAB_REQ 0
+typedef struct CDATReq {
+    DOEHeader header;
+    uint8_t req_code;
+    uint8_t table_type;
+    uint16_t entry_handle;
+} QEMU_PACKED CDATReq;
+
+/* Read Entry Response - CXL r3.0 8.1.11.1 Table 8-14 */
+#define CXL_DOE_TAB_RSP 0
+typedef struct CDATRsp {
+    DOEHeader header;
+    uint8_t rsp_code;
+    uint8_t table_type;
+    uint16_t entry_handle;
+} QEMU_PACKED CDATRsp;
+
+/* CDAT Table Format - CDAT Table 1 */
+#define CXL_CDAT_REV 2
+typedef struct CDATTableHeader {
+    uint32_t length;
+    uint8_t revision;
+    uint8_t checksum;
+    uint8_t reserved[6];
+    uint32_t sequence;
+} QEMU_PACKED CDATTableHeader;
+
+/* CDAT Structure Types - CDAT Table 2 */
+typedef enum {
+    CDAT_TYPE_DSMAS = 0,
+    CDAT_TYPE_DSLBIS = 1,
+    CDAT_TYPE_DSMSCIS = 2,
+    CDAT_TYPE_DSIS = 3,
+    CDAT_TYPE_DSEMTS = 4,
+    CDAT_TYPE_SSLBIS = 5,
+} CDATType;
+
+typedef struct CDATSubHeader {
+    uint8_t type;
+    uint8_t reserved;
+    uint16_t length;
+} CDATSubHeader;
+
+/* Device Scoped Memory Affinity Structure - CDAT Table 3 */
+typedef struct CDATDsmas {
+    CDATSubHeader header;
+    uint8_t DSMADhandle;
+    uint8_t flags;
+#define CDAT_DSMAS_FLAG_NV              (1 << 2)
+#define CDAT_DSMAS_FLAG_SHAREABLE       (1 << 3)
+#define CDAT_DSMAS_FLAG_HW_COHERENT     (1 << 4)
+#define CDAT_DSMAS_FLAG_DYNAMIC_CAP     (1 << 5)
+    uint16_t reserved;
+    uint64_t DPA_base;
+    uint64_t DPA_length;
+} QEMU_PACKED CDATDsmas;
+
+/* Device Scoped Latency and Bandwidth Information Structure - CDAT Table 5 */
+typedef struct CDATDslbis {
+    CDATSubHeader header;
+    uint8_t handle;
+    /* Definitions of these fields refer directly to HMAT fields */
+    uint8_t flags;
+    uint8_t data_type;
+    uint8_t reserved;
+    uint64_t entry_base_unit;
+    uint16_t entry[3];
+    uint16_t reserved2;
+} QEMU_PACKED CDATDslbis;
+
+/* Device Scoped Memory Side Cache Information Structure - CDAT Table 6 */
+typedef struct CDATDsmscis {
+    CDATSubHeader header;
+    uint8_t DSMAS_handle;
+    uint8_t reserved[3];
+    uint64_t memory_side_cache_size;
+    uint32_t cache_attributes;
+} QEMU_PACKED CDATDsmscis;
+
+/* Device Scoped Initiator Structure - CDAT Table 7 */
+typedef struct CDATDsis {
+    CDATSubHeader header;
+    uint8_t flags;
+    uint8_t handle;
+    uint16_t reserved;
+} QEMU_PACKED CDATDsis;
+
+/* Device Scoped EFI Memory Type Structure - CDAT Table 8 */
+typedef struct CDATDsemts {
+    CDATSubHeader header;
+    uint8_t DSMAS_handle;
+    uint8_t EFI_memory_type_attr;
+    uint16_t reserved;
+    uint64_t DPA_offset;
+    uint64_t DPA_length;
+} QEMU_PACKED CDATDsemts;
+
+/* Switch Scoped Latency and Bandwidth Information Structure - CDAT Table 9 */
+typedef struct CDATSslbisHeader {
+    CDATSubHeader header;
+    uint8_t data_type;
+    uint8_t reserved[3];
+    uint64_t entry_base_unit;
+} QEMU_PACKED CDATSslbisHeader;
+
+/* Switch Scoped Latency and Bandwidth Entry - CDAT Table 10 */
+typedef struct CDATSslbe {
+    uint16_t port_x_id;
+    uint16_t port_y_id;
+    uint16_t latency_bandwidth;
+    uint16_t reserved;
+} QEMU_PACKED CDATSslbe;
+
+typedef struct CDATSslbis {
+    CDATSslbisHeader sslbis_header;
+    CDATSslbe sslbe[];
+} QEMU_PACKED CDATSslbis;
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
+    int (*build_cdat_table)(CDATSubHeader ***cdat_table, void *priv);
+    void (*free_cdat_table)(CDATSubHeader **cdat_table, int num, void *priv);
+    bool to_update;
+    void *private;
+    char *filename;
+    uint8_t *buf;
+    struct CDATSubHeader **built_buf;
+    int built_buf_len;
+} CDATObject;
+#endif /* CXL_CDAT_H */
diff --git a/include/hw/cxl/cxl_component.h b/include/hw/cxl/cxl_component.h
index 94ec2f07d7..34075cfb72 100644
--- a/include/hw/cxl/cxl_component.h
+++ b/include/hw/cxl/cxl_component.h
@@ -19,6 +19,7 @@
 #include "qemu/range.h"
 #include "qemu/typedefs.h"
 #include "hw/register.h"
+#include "qapi/error.h"
 
 enum reg_type {
     CXL2_DEVICE,
@@ -184,6 +185,8 @@ typedef struct cxl_component {
             struct PCIDevice *pdev;
         };
     };
+
+    CDATObject cdat;
 } CXLComponentState;
 
 void cxl_component_register_block_init(Object *obj,
@@ -220,4 +223,8 @@ static inline hwaddr cxl_decode_ig(int ig)
 
 CXLComponentState *cxl_get_hb_cstate(PCIHostState *hb);
 
+void cxl_doe_cdat_init(CXLComponentState *cxl_cstate, Error **errp);
+void cxl_doe_cdat_release(CXLComponentState *cxl_cstate);
+void cxl_doe_cdat_update(CXLComponentState *cxl_cstate, Error **errp);
+
 #endif
diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index e4d221cdb3..449b0edfe9 100644
--- a/include/hw/cxl/cxl_device.h
+++ b/include/hw/cxl/cxl_device.h
@@ -243,6 +243,9 @@ struct CXLType3Dev {
     AddressSpace hostmem_as;
     CXLComponentState cxl_cstate;
     CXLDeviceState cxl_dstate;
+
+    /* DOE */
+    DOECap doe_cdat;
 };
 
 #define TYPE_CXL_TYPE3 "cxl-type3"
diff --git a/include/hw/cxl/cxl_pci.h b/include/hw/cxl/cxl_pci.h
index 01cf002096..3cb79eca1e 100644
--- a/include/hw/cxl/cxl_pci.h
+++ b/include/hw/cxl/cxl_pci.h
@@ -13,6 +13,7 @@
 #include "qemu/compiler.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pcie.h"
+#include "hw/cxl/cxl_cdat.h"
 
 #define CXL_VENDOR_ID 0x1e98
 
diff --git a/hw/cxl/cxl-cdat.c b/hw/cxl/cxl-cdat.c
new file mode 100644
index 0000000000..3653aa56f0
--- /dev/null
+++ b/hw/cxl/cxl-cdat.c
@@ -0,0 +1,224 @@
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
+static void cdat_len_check(CDATSubHeader *hdr, Error **errp)
+{
+    assert(hdr->length);
+    assert(hdr->reserved == 0);
+
+    switch (hdr->type) {
+    case CDAT_TYPE_DSMAS:
+        assert(hdr->length == sizeof(CDATDsmas));
+        break;
+    case CDAT_TYPE_DSLBIS:
+        assert(hdr->length == sizeof(CDATDslbis));
+        break;
+    case CDAT_TYPE_DSMSCIS:
+        assert(hdr->length == sizeof(CDATDsmscis));
+        break;
+    case CDAT_TYPE_DSIS:
+        assert(hdr->length == sizeof(CDATDsis));
+        break;
+    case CDAT_TYPE_DSEMTS:
+        assert(hdr->length == sizeof(CDATDsemts));
+        break;
+    case CDAT_TYPE_SSLBIS:
+        assert(hdr->length >= sizeof(CDATSslbisHeader));
+        assert((hdr->length - sizeof(CDATSslbisHeader)) %
+               sizeof(CDATSslbe) == 0);
+        break;
+    default:
+        error_setg(errp, "Type %d is reserved", hdr->type);
+    }
+}
+
+static void ct3_build_cdat(CDATObject *cdat, Error **errp)
+{
+    g_autofree CDATTableHeader *cdat_header = NULL;
+    g_autofree CDATEntry *cdat_st = NULL;
+    uint8_t sum = 0;
+    int ent, i;
+
+    /* Use default table if fopen == NULL */
+    assert(cdat->build_cdat_table);
+
+    cdat_header = g_malloc0(sizeof(*cdat_header));
+    if (!cdat_header) {
+        error_setg(errp, "Failed to allocate CDAT header");
+        return;
+    }
+
+    cdat->built_buf_len = cdat->build_cdat_table(&cdat->built_buf, cdat->private);
+
+    if (!cdat->built_buf_len) {
+        /* Build later as not all data available yet */
+        cdat->to_update = true;
+        return;
+    }
+    cdat->to_update = false;
+
+    cdat_st = g_malloc0(sizeof(*cdat_st) * (cdat->built_buf_len + 1));
+    if (!cdat_st) {
+        error_setg(errp, "Failed to allocate CDAT entry array");
+        return;
+    }
+
+    /* Entry 0 for CDAT header, starts with Entry 1 */
+    for (ent = 1; ent < cdat->built_buf_len + 1; ent++) {
+        CDATSubHeader *hdr = cdat->built_buf[ent - 1];
+        uint8_t *buf = (uint8_t *)cdat->built_buf[ent - 1];
+
+        cdat_st[ent].base = hdr;
+        cdat_st[ent].length = hdr->length;
+
+        cdat_header->length += hdr->length;
+        for (i = 0; i < hdr->length; i++) {
+            sum += buf[i];
+        }
+    }
+
+    /* CDAT header */
+    cdat_header->revision = CXL_CDAT_REV;
+    /* For now, no runtime updates */
+    cdat_header->sequence = 0;
+    cdat_header->length += sizeof(CDATTableHeader);
+    sum += cdat_header->revision + cdat_header->sequence +
+        cdat_header->length;
+    /* Sum of all bytes including checksum must be 0 */
+    cdat_header->checksum = ~sum + 1;
+
+    cdat_st[0].base = g_steal_pointer(&cdat_header);
+    cdat_st[0].length = sizeof(*cdat_header);
+    cdat->entry_len = 1 + cdat->built_buf_len;
+    cdat->entry = g_steal_pointer(&cdat_st);
+}
+
+static void ct3_load_cdat(CDATObject *cdat, Error **errp)
+{
+    g_autofree CDATEntry *cdat_st = NULL;
+    uint8_t sum = 0;
+    int num_ent;
+    int i = 0, ent = 1, file_size = 0;
+    CDATSubHeader *hdr;
+    FILE *fp = NULL;
+
+    /* Read CDAT file and create its cache */
+    fp = fopen(cdat->filename, "r");
+    if (!fp) {
+        error_setg(errp, "CDAT: Unable to open file");
+        return;
+    }
+
+    fseek(fp, 0, SEEK_END);
+    file_size = ftell(fp);
+    fseek(fp, 0, SEEK_SET);
+    cdat->buf = g_malloc0(file_size);
+
+    if (fread(cdat->buf, file_size, 1, fp) == 0) {
+        error_setg(errp, "CDAT: File read failed");
+        return;
+    }
+
+    fclose(fp);
+
+    if (file_size < sizeof(CDATTableHeader)) {
+        error_setg(errp, "CDAT: File too short");
+        return;
+    }
+    i = sizeof(CDATTableHeader);
+    num_ent = 1;
+    while (i < file_size) {
+        hdr = (CDATSubHeader *)(cdat->buf + i);
+        cdat_len_check(hdr, errp);
+        i += hdr->length;
+        num_ent++;
+    }
+    if (i != file_size) {
+        error_setg(errp, "CDAT: File length missmatch");
+        return;
+    }
+
+    cdat_st = g_malloc0(sizeof(*cdat_st) * num_ent);
+    if (!cdat_st) {
+        error_setg(errp, "CDAT: Failed to allocate entry array");
+        return;
+    }
+
+    /* Set CDAT header, Entry = 0 */
+    cdat_st[0].base = cdat->buf;
+    cdat_st[0].length = sizeof(CDATTableHeader);
+    i = 0;
+
+    while (i < cdat_st[0].length) {
+        sum += cdat->buf[i++];
+    }
+
+    /* Read CDAT structures */
+    while (i < file_size) {
+        hdr = (CDATSubHeader *)(cdat->buf + i);
+        cdat_len_check(hdr, errp);
+
+        cdat_st[ent].base = hdr;
+        cdat_st[ent].length = hdr->length;
+
+        while (cdat->buf + i <
+               (uint8_t *)cdat_st[ent].base + cdat_st[ent].length) {
+            assert(i < file_size);
+            sum += cdat->buf[i++];
+        }
+
+        ent++;
+    }
+
+    if (sum != 0) {
+        warn_report("CDAT: Found checksum mismatch in %s", cdat->filename);
+    }
+    cdat->entry_len = num_ent;
+    cdat->entry = g_steal_pointer(&cdat_st);
+}
+
+void cxl_doe_cdat_init(CXLComponentState *cxl_cstate, Error **errp)
+{
+    CDATObject *cdat = &cxl_cstate->cdat;
+
+    if (cdat->filename) {
+        ct3_load_cdat(cdat, errp);
+    } else {
+        ct3_build_cdat(cdat, errp);
+    }
+}
+
+void cxl_doe_cdat_update(CXLComponentState *cxl_cstate, Error **errp)
+{
+    CDATObject *cdat = &cxl_cstate->cdat;
+
+    if (cdat->to_update) {
+        ct3_build_cdat(cdat, errp);
+    }
+}
+
+void cxl_doe_cdat_release(CXLComponentState *cxl_cstate)
+{
+    CDATObject *cdat = &cxl_cstate->cdat;
+
+    free(cdat->entry);
+    if (cdat->built_buf) {
+        cdat->free_cdat_table(cdat->built_buf, cdat->built_buf_len,
+                              cdat->private);
+    }
+    if (cdat->buf) {
+        free(cdat->buf);
+    }
+}
diff --git a/hw/cxl/meson.build b/hw/cxl/meson.build
index f117b99949..cfa95ffd40 100644
--- a/hw/cxl/meson.build
+++ b/hw/cxl/meson.build
@@ -4,6 +4,7 @@ softmmu_ss.add(when: 'CONFIG_CXL',
                    'cxl-device-utils.c',
                    'cxl-mailbox-utils.c',
                    'cxl-host.c',
+                   'cxl-cdat.c',
                ),
                if_false: files(
                    'cxl-host-stubs.c',
-- 
MST


