Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0B161DCDB
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:56:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMox-0007d9-VW; Sat, 05 Nov 2022 13:19:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMmz-0006jB-8k
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:17:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMmx-0007PV-Ae
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:17:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AUNROwimy56ru7jUnT8XzU0OHxs3NUEEOApuJES962g=;
 b=Q/2YbNPHD/KhEYVTusCzMu1l4GxoNxnRh08O/FhQJrpiFwUFW87vWhSMQllotPOvOnCZaK
 ccQsMf5S4eberjtWPnbHvUrDK36KSkeFDOacrq31g8/2C1te+u9t5/X06rqLmeGHCsVb24
 U/7hF282rDr8m6GCWgevetD2nuONfzw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-488-8NuMPSgQP-6jpyCzCPfxIg-1; Sat, 05 Nov 2022 13:16:57 -0400
X-MC-Unique: 8NuMPSgQP-6jpyCzCPfxIg-1
Received: by mail-wm1-f71.google.com with SMTP id
 c10-20020a7bc84a000000b003cf81c2d3efso2454198wml.7
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:16:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AUNROwimy56ru7jUnT8XzU0OHxs3NUEEOApuJES962g=;
 b=TpJCjE5j6mgcOpw9GgvGveWP7JQe2aGx8uYHF/JMkTAev3W6PDyNVc6WLxWm9xg7db
 t7cpv9BmG1ge1a8/9WcklmXLtyYytUbArFmboUw6fjKrfYtLk71jRIbVCAc/dlw1yj0i
 RIILqheIBriYIh4CeqZUzcmz1+UNs481KF3dUlJx/q/9bS+DiZXs6FYABAjwtSkYUhP3
 BjidqGdmezuDVM7i9JD0kPd8HnAsi883cDOxlLKiclWXI4D3xAquXhm4l5Ks9zdBMo3J
 e2PQJvZa1k9G7AOSwryrSaAayVRm+YdB0fKY4+I8nrtBPUZud5BrwFBz+fVrtfzazHQT
 wuxg==
X-Gm-Message-State: ACrzQf16KOcHGdKHuXlOSnfFu+Xlj3yatA7FzP8uQKJzWookfEUPWF+b
 13SVOBcqkNt1gvM39Ph6TQNDlel6zDmhC2LAXGxCpKSgsvZiCkEpedXaLmwCWfD6+0rBE9WTCCJ
 hYdpiEEM+8YeLH3g3FtaCD9s/fonm9o8arI1vHX4y7BqWv4PMteYkNMlqe1u2
X-Received: by 2002:a5d:5f04:0:b0:236:cae9:2991 with SMTP id
 cl4-20020a5d5f04000000b00236cae92991mr20910941wrb.120.1667668616021; 
 Sat, 05 Nov 2022 10:16:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6ZdhLGKSFpmtRZTGXXoRCSbRJuw2gvBYmpL8RGs3Om9qQ+a29dFn3OhJ3Zm0N0GF88Cjxn1w==
X-Received: by 2002:a5d:5f04:0:b0:236:cae9:2991 with SMTP id
 cl4-20020a5d5f04000000b00236cae92991mr20910926wrb.120.1667668615705; 
 Sat, 05 Nov 2022 10:16:55 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 r9-20020adfdc89000000b002258235bda3sm2613416wrj.61.2022.11.05.10.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:16:55 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:16:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Huai-Cheng Kuo <hchkuo@avery-design.com.tw>,
 Chris Browy <cbrowy@avery-design.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ben Widawsky <ben.widawsky@intel.com>
Subject: [PULL v3 29/81] hw/mem/cxl-type3: Add CXL CDAT Data Object Exchange
Message-ID: <20221105171116.432921-30-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Huai-Cheng Kuo <hchkuo@avery-design.com.tw>

The CDAT can be specified in two ways. One is to add ",cdat=<filename>"
in "-device cxl-type3"'s command option. The file is required to provide
the whole CDAT table in binary mode. The other is to use the default
that provides some 'reasonable' numbers based on type of memory and
size.

The DOE capability supporting CDAT is added to hw/mem/cxl_type3.c with
capability offset 0x190. The config read/write to this capability range
can be generated in the OS to request the CDAT data.

Signed-off-by: Huai-Cheng Kuo <hchkuo@avery-design.com.tw>
Signed-off-by: Chris Browy <cbrowy@avery-design.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Message-Id: <20221014151045.24781-5-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/mem/cxl_type3.c | 255 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 255 insertions(+)

diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index 568c9d62f5..255590201a 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -12,9 +12,246 @@
 #include "qemu/range.h"
 #include "qemu/rcu.h"
 #include "sysemu/hostmem.h"
+#include "sysemu/numa.h"
 #include "hw/cxl/cxl.h"
 #include "hw/pci/msix.h"
 
+#define DWORD_BYTE 4
+
+/* Default CDAT entries for a memory region */
+enum {
+    CT3_CDAT_DSMAS,
+    CT3_CDAT_DSLBIS0,
+    CT3_CDAT_DSLBIS1,
+    CT3_CDAT_DSLBIS2,
+    CT3_CDAT_DSLBIS3,
+    CT3_CDAT_DSEMTS,
+    CT3_CDAT_NUM_ENTRIES
+};
+
+static int ct3_build_cdat_entries_for_mr(CDATSubHeader **cdat_table,
+                                         int dsmad_handle, MemoryRegion *mr)
+{
+    g_autofree CDATDsmas *dsmas = NULL;
+    g_autofree CDATDslbis *dslbis0 = NULL;
+    g_autofree CDATDslbis *dslbis1 = NULL;
+    g_autofree CDATDslbis *dslbis2 = NULL;
+    g_autofree CDATDslbis *dslbis3 = NULL;
+    g_autofree CDATDsemts *dsemts = NULL;
+
+    dsmas = g_malloc(sizeof(*dsmas));
+    if (!dsmas) {
+        return -ENOMEM;
+    }
+    *dsmas = (CDATDsmas) {
+        .header = {
+            .type = CDAT_TYPE_DSMAS,
+            .length = sizeof(*dsmas),
+        },
+        .DSMADhandle = dsmad_handle,
+        .flags = CDAT_DSMAS_FLAG_NV,
+        .DPA_base = 0,
+        .DPA_length = int128_get64(mr->size),
+    };
+
+    /* For now, no memory side cache, plausiblish numbers */
+    dslbis0 = g_malloc(sizeof(*dslbis0));
+    if (!dslbis0) {
+        return -ENOMEM;
+    }
+    *dslbis0 = (CDATDslbis) {
+        .header = {
+            .type = CDAT_TYPE_DSLBIS,
+            .length = sizeof(*dslbis0),
+        },
+        .handle = dsmad_handle,
+        .flags = HMAT_LB_MEM_MEMORY,
+        .data_type = HMAT_LB_DATA_READ_LATENCY,
+        .entry_base_unit = 10000, /* 10ns base */
+        .entry[0] = 15, /* 150ns */
+    };
+
+    dslbis1 = g_malloc(sizeof(*dslbis1));
+    if (!dslbis1) {
+        return -ENOMEM;
+    }
+    *dslbis1 = (CDATDslbis) {
+        .header = {
+            .type = CDAT_TYPE_DSLBIS,
+            .length = sizeof(*dslbis1),
+        },
+        .handle = dsmad_handle,
+        .flags = HMAT_LB_MEM_MEMORY,
+        .data_type = HMAT_LB_DATA_WRITE_LATENCY,
+        .entry_base_unit = 10000,
+        .entry[0] = 25, /* 250ns */
+    };
+
+    dslbis2 = g_malloc(sizeof(*dslbis2));
+    if (!dslbis2) {
+        return -ENOMEM;
+    }
+    *dslbis2 = (CDATDslbis) {
+        .header = {
+            .type = CDAT_TYPE_DSLBIS,
+            .length = sizeof(*dslbis2),
+        },
+        .handle = dsmad_handle,
+        .flags = HMAT_LB_MEM_MEMORY,
+        .data_type = HMAT_LB_DATA_READ_BANDWIDTH,
+        .entry_base_unit = 1000, /* GB/s */
+        .entry[0] = 16,
+    };
+
+    dslbis3 = g_malloc(sizeof(*dslbis3));
+    if (!dslbis3) {
+        return -ENOMEM;
+    }
+    *dslbis3 = (CDATDslbis) {
+        .header = {
+            .type = CDAT_TYPE_DSLBIS,
+            .length = sizeof(*dslbis3),
+        },
+        .handle = dsmad_handle,
+        .flags = HMAT_LB_MEM_MEMORY,
+        .data_type = HMAT_LB_DATA_WRITE_BANDWIDTH,
+        .entry_base_unit = 1000, /* GB/s */
+        .entry[0] = 16,
+    };
+
+    dsemts = g_malloc(sizeof(*dsemts));
+    if (!dsemts) {
+        return -ENOMEM;
+    }
+    *dsemts = (CDATDsemts) {
+        .header = {
+            .type = CDAT_TYPE_DSEMTS,
+            .length = sizeof(*dsemts),
+        },
+        .DSMAS_handle = dsmad_handle,
+        /* Reserved - the non volatile from DSMAS matters */
+        .EFI_memory_type_attr = 2,
+        .DPA_offset = 0,
+        .DPA_length = int128_get64(mr->size),
+    };
+
+    /* Header always at start of structure */
+    cdat_table[CT3_CDAT_DSMAS] = g_steal_pointer(&dsmas);
+    cdat_table[CT3_CDAT_DSLBIS0] = g_steal_pointer(&dslbis0);
+    cdat_table[CT3_CDAT_DSLBIS1] = g_steal_pointer(&dslbis1);
+    cdat_table[CT3_CDAT_DSLBIS2] = g_steal_pointer(&dslbis2);
+    cdat_table[CT3_CDAT_DSLBIS3] = g_steal_pointer(&dslbis3);
+    cdat_table[CT3_CDAT_DSEMTS] = g_steal_pointer(&dsemts);
+
+    return 0;
+}
+
+static int ct3_build_cdat_table(CDATSubHeader ***cdat_table, void *priv)
+{
+    g_autofree CDATSubHeader **table = NULL;
+    MemoryRegion *nonvolatile_mr;
+    CXLType3Dev *ct3d = priv;
+    int dsmad_handle = 0;
+    int rc;
+
+    if (!ct3d->hostmem) {
+        return 0;
+    }
+
+    nonvolatile_mr = host_memory_backend_get_memory(ct3d->hostmem);
+    if (!nonvolatile_mr) {
+        return -EINVAL;
+    }
+
+    table = g_malloc0(CT3_CDAT_NUM_ENTRIES * sizeof(*table));
+    if (!table) {
+        return -ENOMEM;
+    }
+
+    rc = ct3_build_cdat_entries_for_mr(table, dsmad_handle++, nonvolatile_mr);
+    if (rc < 0) {
+        return rc;
+    }
+
+    *cdat_table = g_steal_pointer(&table);
+
+    return CT3_CDAT_NUM_ENTRIES;
+}
+
+static void ct3_free_cdat_table(CDATSubHeader **cdat_table, int num, void *priv)
+{
+    int i;
+
+    for (i = 0; i < num; i++) {
+        g_free(cdat_table[i]);
+    }
+    g_free(cdat_table);
+}
+
+static bool cxl_doe_cdat_rsp(DOECap *doe_cap)
+{
+    CDATObject *cdat = &CXL_TYPE3(doe_cap->pdev)->cxl_cstate.cdat;
+    uint16_t ent;
+    void *base;
+    uint32_t len;
+    CDATReq *req = pcie_doe_get_write_mbox_ptr(doe_cap);
+    CDATRsp rsp;
+
+    assert(cdat->entry_len);
+
+    /* Discard if request length mismatched */
+    if (pcie_doe_get_obj_len(req) <
+        DIV_ROUND_UP(sizeof(CDATReq), DWORD_BYTE)) {
+        return false;
+    }
+
+    ent = req->entry_handle;
+    base = cdat->entry[ent].base;
+    len = cdat->entry[ent].length;
+
+    rsp = (CDATRsp) {
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
+static uint32_t ct3d_config_read(PCIDevice *pci_dev, uint32_t addr, int size)
+{
+    CXLType3Dev *ct3d = CXL_TYPE3(pci_dev);
+    uint32_t val;
+
+    if (pcie_doe_read_config(&ct3d->doe_cdat, addr, size, &val)) {
+        return val;
+    }
+
+    return pci_default_read_config(pci_dev, addr, size);
+}
+
+static void ct3d_config_write(PCIDevice *pci_dev, uint32_t addr, uint32_t val,
+                              int size)
+{
+    CXLType3Dev *ct3d = CXL_TYPE3(pci_dev);
+
+    pcie_doe_write_config(&ct3d->doe_cdat, addr, val, size);
+    pci_default_write_config(pci_dev, addr, val, size);
+}
+
 /*
  * Null value of all Fs suggested by IEEE RA guidelines for use of
  * EU, OUI and CID
@@ -140,6 +377,11 @@ static bool cxl_setup_memory(CXLType3Dev *ct3d, Error **errp)
     return true;
 }
 
+static DOEProtocol doe_cdat_prot[] = {
+    { CXL_VENDOR_ID, CXL_DOE_TABLE_ACCESS, cxl_doe_cdat_rsp },
+    { }
+};
+
 static void ct3_realize(PCIDevice *pci_dev, Error **errp)
 {
     CXLType3Dev *ct3d = CXL_TYPE3(pci_dev);
@@ -189,6 +431,14 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
     for (i = 0; i < msix_num; i++) {
         msix_vector_use(pci_dev, i);
     }
+
+    /* DOE Initailization */
+    pcie_doe_init(pci_dev, &ct3d->doe_cdat, 0x190, doe_cdat_prot, true, 0);
+
+    cxl_cstate->cdat.build_cdat_table = ct3_build_cdat_table;
+    cxl_cstate->cdat.free_cdat_table = ct3_free_cdat_table;
+    cxl_cstate->cdat.private = ct3d;
+    cxl_doe_cdat_init(cxl_cstate, errp);
 }
 
 static void ct3_exit(PCIDevice *pci_dev)
@@ -197,6 +447,7 @@ static void ct3_exit(PCIDevice *pci_dev)
     CXLComponentState *cxl_cstate = &ct3d->cxl_cstate;
     ComponentRegisters *regs = &cxl_cstate->crb;
 
+    cxl_doe_cdat_release(cxl_cstate);
     g_free(regs->special_ops);
     address_space_destroy(&ct3d->hostmem_as);
 }
@@ -296,6 +547,7 @@ static Property ct3_props[] = {
     DEFINE_PROP_LINK("lsa", CXLType3Dev, lsa, TYPE_MEMORY_BACKEND,
                      HostMemoryBackend *),
     DEFINE_PROP_UINT64("sn", CXLType3Dev, sn, UI64_NULL),
+    DEFINE_PROP_STRING("cdat", CXLType3Dev, cxl_cstate.cdat.filename),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -361,6 +613,9 @@ static void ct3_class_init(ObjectClass *oc, void *data)
     pc->device_id = 0xd93; /* LVF for now */
     pc->revision = 1;
 
+    pc->config_write = ct3d_config_write;
+    pc->config_read = ct3d_config_read;
+
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
     dc->desc = "CXL PMEM Device (Type 3)";
     dc->reset = ct3d_reset;
-- 
MST


