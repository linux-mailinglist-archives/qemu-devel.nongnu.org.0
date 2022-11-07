Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6696202C2
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 23:55:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAw9-0000IL-FP; Mon, 07 Nov 2022 17:49:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAw7-0000Du-HQ
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:49:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAw5-0003Ts-HO
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:49:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ETyx33uCkrggVRTo3HiD7Tje2UJXCck/b2Qi00flxlo=;
 b=Rp/yxI9g7L8MwRIwBI6LAtpW8mCepJX8aLilIYth7bL3N8e7aszKecBHjYUgc+5h+pVkjf
 cHMGmvaJjkqIRZuWTmnO/kWDW3sPdne5A0Us7clFf6LbURMrxPGEYDJF4uERpwwFW5k/0q
 SWZcIo5c/KPUkaKjLmej/nThQO2hz5o=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-327-7PGR_X8tO82y-Ff2WiMZlQ-1; Mon, 07 Nov 2022 17:49:44 -0500
X-MC-Unique: 7PGR_X8tO82y-Ff2WiMZlQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 d8-20020a0cfe88000000b004bb65193fdcso8555902qvs.12
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:49:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ETyx33uCkrggVRTo3HiD7Tje2UJXCck/b2Qi00flxlo=;
 b=U8j6qnugiJGeaawT8/0Nn32p3xRJfpB9CinPHGGXgtRLWILEPWo4Kh8wm5oWeaM42A
 RAbj010eOIzN6580pclmIXTyQe9uHFO0cwkLuePgI5K+QntF3rpoRz1HvSNYi4iD1jiT
 CiEzvZc8+gzDzuAcfMPwLA/XGiJOAnTKfTdmCZNMvpwMIKPyHq6egPXGbZEesYNHfTWn
 2fZBiDofMsKPvPlxHUs0jfq4WK7mphI42uiYyVJfHbqF8rWP59FYF6rqb6y9ksxzHi23
 AmSBNyGbKlQVm87x4CoQRTf3KC9xuOBiW4fo0DUXFiVzVuOKWCNsPU0zvcV6Wj4YXCHJ
 VF6w==
X-Gm-Message-State: ACrzQf1drJRIxieXrUQr/lhii9wyq51EOYbvTOR9pG34F8QsqRwYsMZu
 AWq2mbJEFg2xBGbsxXLy6mCyapQBzI30deHAbeA5gbf0KS6+fuPvcROjdvNaog+/xHcd03yLJky
 r4W6m7NgvQnYoYSK5duujowoF5E4YOyt8iNlj4ptQeZ7IDBlEoUfimhEpdWvO
X-Received: by 2002:a05:622a:5a0c:b0:3a5:3bfc:3fcb with SMTP id
 fy12-20020a05622a5a0c00b003a53bfc3fcbmr27946687qtb.349.1667861383398; 
 Mon, 07 Nov 2022 14:49:43 -0800 (PST)
X-Google-Smtp-Source: AMsMyM75oPgScqCbuoFtmBIGKNQT0TRwoZ1INOivMqc+bCjvoCrZuInIetgf8oq6NDBT+Et2xuOrDg==
X-Received: by 2002:a05:622a:5a0c:b0:3a5:3bfc:3fcb with SMTP id
 fy12-20020a05622a5a0c00b003a53bfc3fcbmr27946658qtb.349.1667861383014; 
 Mon, 07 Nov 2022 14:49:43 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 fe6-20020a05622a4d4600b0039a08c0a594sm6894337qtb.82.2022.11.07.14.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:49:42 -0800 (PST)
Date: Mon, 7 Nov 2022 17:49:38 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ben Widawsky <ben.widawsky@intel.com>
Subject: [PULL v4 25/83] hw/pci-bridge/cxl-upstream: Add a CDAT table access
 DOE
Message-ID: <20221107224600.934080-26-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

This Data Object Exchange Mailbox allows software to query the
latency and bandwidth between ports on the switch. For now
only provide information on routes between the upstream port and
each downstream port (not p2p).

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

--
Changes since v8: Mostly to match the type 3 equivalent
 - Move enum out of function and give it a more descriptive namespace.
Message-Id: <20221014151045.24781-6-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/cxl/cxl_cdat.h    |   1 +
 hw/pci-bridge/cxl_upstream.c | 195 ++++++++++++++++++++++++++++++++++-
 2 files changed, 195 insertions(+), 1 deletion(-)

diff --git a/include/hw/cxl/cxl_cdat.h b/include/hw/cxl/cxl_cdat.h
index 52c232e912..e9eda00142 100644
--- a/include/hw/cxl/cxl_cdat.h
+++ b/include/hw/cxl/cxl_cdat.h
@@ -131,6 +131,7 @@ typedef struct CDATSslbisHeader {
     uint64_t entry_base_unit;
 } QEMU_PACKED CDATSslbisHeader;
 
+#define CDAT_PORT_ID_USP 0x100
 /* Switch Scoped Latency and Bandwidth Entry - CDAT Table 10 */
 typedef struct CDATSslbe {
     uint16_t port_x_id;
diff --git a/hw/pci-bridge/cxl_upstream.c b/hw/pci-bridge/cxl_upstream.c
index a83a3e81e4..9b8b57df9d 100644
--- a/hw/pci-bridge/cxl_upstream.c
+++ b/hw/pci-bridge/cxl_upstream.c
@@ -10,11 +10,12 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "hw/qdev-properties.h"
 #include "hw/pci/msi.h"
 #include "hw/pci/pcie.h"
 #include "hw/pci/pcie_port.h"
 
-#define CXL_UPSTREAM_PORT_MSI_NR_VECTOR 1
+#define CXL_UPSTREAM_PORT_MSI_NR_VECTOR 2
 
 #define CXL_UPSTREAM_PORT_MSI_OFFSET 0x70
 #define CXL_UPSTREAM_PORT_PCIE_CAP_OFFSET 0x90
@@ -28,6 +29,7 @@ typedef struct CXLUpstreamPort {
 
     /*< public >*/
     CXLComponentState cxl_cstate;
+    DOECap doe_cdat;
 } CXLUpstreamPort;
 
 CXLComponentState *cxl_usp_to_cstate(CXLUpstreamPort *usp)
@@ -60,6 +62,9 @@ static void cxl_usp_dvsec_write_config(PCIDevice *dev, uint32_t addr,
 static void cxl_usp_write_config(PCIDevice *d, uint32_t address,
                                  uint32_t val, int len)
 {
+    CXLUpstreamPort *usp = CXL_USP(d);
+
+    pcie_doe_write_config(&usp->doe_cdat, address, val, len);
     pci_bridge_write_config(d, address, val, len);
     pcie_cap_flr_write_config(d, address, val, len);
     pcie_aer_write_config(d, address, val, len);
@@ -67,6 +72,18 @@ static void cxl_usp_write_config(PCIDevice *d, uint32_t address,
     cxl_usp_dvsec_write_config(d, address, val, len);
 }
 
+static uint32_t cxl_usp_read_config(PCIDevice *d, uint32_t address, int len)
+{
+    CXLUpstreamPort *usp = CXL_USP(d);
+    uint32_t val;
+
+    if (pcie_doe_read_config(&usp->doe_cdat, address, len, &val)) {
+        return val;
+    }
+
+    return pci_default_read_config(d, address, len);
+}
+
 static void latch_registers(CXLUpstreamPort *usp)
 {
     uint32_t *reg_state = usp->cxl_cstate.crb.cache_mem_registers;
@@ -119,6 +136,167 @@ static void build_dvsecs(CXLComponentState *cxl)
                                REG_LOC_DVSEC_REVID, dvsec);
 }
 
+static bool cxl_doe_cdat_rsp(DOECap *doe_cap)
+{
+    CDATObject *cdat = &CXL_USP(doe_cap->pdev)->cxl_cstate.cdat;
+    uint16_t ent;
+    void *base;
+    uint32_t len;
+    CDATReq *req = pcie_doe_get_write_mbox_ptr(doe_cap);
+    CDATRsp rsp;
+
+    cxl_doe_cdat_update(&CXL_USP(doe_cap->pdev)->cxl_cstate, &error_fatal);
+    assert(cdat->entry_len);
+
+    /* Discard if request length mismatched */
+    if (pcie_doe_get_obj_len(req) <
+        DIV_ROUND_UP(sizeof(CDATReq), sizeof(uint32_t))) {
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
+            .length = DIV_ROUND_UP((sizeof(rsp) + len), sizeof(uint32_t)),
+        },
+        .rsp_code = CXL_DOE_TAB_RSP,
+        .table_type = CXL_DOE_TAB_TYPE_CDAT,
+        .entry_handle = (ent < cdat->entry_len - 1) ?
+                        ent + 1 : CXL_DOE_TAB_ENT_MAX,
+    };
+
+    memcpy(doe_cap->read_mbox, &rsp, sizeof(rsp));
+        memcpy(doe_cap->read_mbox + DIV_ROUND_UP(sizeof(rsp), sizeof(uint32_t)),
+           base, len);
+
+    doe_cap->read_mbox_len += rsp.header.length;
+
+    return true;
+}
+
+static DOEProtocol doe_cdat_prot[] = {
+    { CXL_VENDOR_ID, CXL_DOE_TABLE_ACCESS, cxl_doe_cdat_rsp },
+    { }
+};
+
+enum {
+    CXL_USP_CDAT_SSLBIS_LAT,
+    CXL_USP_CDAT_SSLBIS_BW,
+    CXL_USP_CDAT_NUM_ENTRIES
+};
+
+static int build_cdat_table(CDATSubHeader ***cdat_table, void *priv)
+{
+    g_autofree CDATSslbis *sslbis_latency = NULL;
+    g_autofree CDATSslbis *sslbis_bandwidth = NULL;
+    CXLUpstreamPort *us = CXL_USP(priv);
+    PCIBus *bus = &PCI_BRIDGE(us)->sec_bus;
+    int devfn, sslbis_size, i;
+    int count = 0;
+    uint16_t port_ids[256];
+
+    for (devfn = 0; devfn < ARRAY_SIZE(bus->devices); devfn++) {
+        PCIDevice *d = bus->devices[devfn];
+        PCIEPort *port;
+
+        if (!d || !pci_is_express(d) || !d->exp.exp_cap) {
+            continue;
+        }
+
+        /*
+         * Whilst the PCI express spec doesn't allow anything other than
+         * downstream ports on this bus, let us be a little paranoid
+         */
+        if (!object_dynamic_cast(OBJECT(d), TYPE_PCIE_PORT)) {
+            continue;
+        }
+
+        port = PCIE_PORT(d);
+        port_ids[count] = port->port;
+        count++;
+    }
+
+    /* May not yet have any ports - try again later */
+    if (count == 0) {
+        return 0;
+    }
+
+    sslbis_size = sizeof(CDATSslbis) + sizeof(*sslbis_latency->sslbe) * count;
+    sslbis_latency = g_malloc(sslbis_size);
+    if (!sslbis_latency) {
+        return -ENOMEM;
+    }
+    *sslbis_latency = (CDATSslbis) {
+        .sslbis_header = {
+            .header = {
+                .type = CDAT_TYPE_SSLBIS,
+                .length = sslbis_size,
+            },
+            .data_type = HMATLB_DATA_TYPE_ACCESS_LATENCY,
+            .entry_base_unit = 10000,
+        },
+    };
+
+    for (i = 0; i < count; i++) {
+        sslbis_latency->sslbe[i] = (CDATSslbe) {
+            .port_x_id = CDAT_PORT_ID_USP,
+            .port_y_id = port_ids[i],
+            .latency_bandwidth = 15, /* 150ns */
+        };
+    }
+
+    sslbis_bandwidth = g_malloc(sslbis_size);
+    if (!sslbis_bandwidth) {
+        return 0;
+    }
+    *sslbis_bandwidth = (CDATSslbis) {
+        .sslbis_header = {
+            .header = {
+                .type = CDAT_TYPE_SSLBIS,
+                .length = sslbis_size,
+            },
+            .data_type = HMATLB_DATA_TYPE_ACCESS_BANDWIDTH,
+            .entry_base_unit = 1000,
+        },
+    };
+
+    for (i = 0; i < count; i++) {
+        sslbis_bandwidth->sslbe[i] = (CDATSslbe) {
+            .port_x_id = CDAT_PORT_ID_USP,
+            .port_y_id = port_ids[i],
+            .latency_bandwidth = 16, /* 16 GB/s */
+        };
+    }
+
+    *cdat_table = g_malloc0(sizeof(*cdat_table) * CXL_USP_CDAT_NUM_ENTRIES);
+    if (!*cdat_table) {
+        return -ENOMEM;
+    }
+
+    /* Header always at start of structure */
+    (*cdat_table)[CXL_USP_CDAT_SSLBIS_LAT] = g_steal_pointer(&sslbis_latency);
+    (*cdat_table)[CXL_USP_CDAT_SSLBIS_BW] = g_steal_pointer(&sslbis_bandwidth);
+
+    return CXL_USP_CDAT_NUM_ENTRIES;
+}
+
+static void free_default_cdat_table(CDATSubHeader **cdat_table, int num,
+                                    void *priv)
+{
+    int i;
+
+    for (i = 0; i < num; i++) {
+        g_free(cdat_table[i]);
+    }
+    g_free(cdat_table);
+}
+
 static void cxl_usp_realize(PCIDevice *d, Error **errp)
 {
     PCIEPort *p = PCIE_PORT(d);
@@ -161,6 +339,14 @@ static void cxl_usp_realize(PCIDevice *d, Error **errp)
                      PCI_BASE_ADDRESS_MEM_TYPE_64,
                      component_bar);
 
+    pcie_doe_init(d, &usp->doe_cdat, cxl_cstate->dvsec_offset, doe_cdat_prot,
+                  true, 1);
+
+    cxl_cstate->cdat.build_cdat_table = build_cdat_table;
+    cxl_cstate->cdat.free_cdat_table = free_default_cdat_table;
+    cxl_cstate->cdat.private = d;
+    cxl_doe_cdat_init(cxl_cstate, errp);
+
     return;
 
 err_cap:
@@ -179,6 +365,11 @@ static void cxl_usp_exitfn(PCIDevice *d)
     pci_bridge_exitfn(d);
 }
 
+static Property cxl_upstream_props[] = {
+    DEFINE_PROP_STRING("cdat", CXLUpstreamPort, cxl_cstate.cdat.filename),
+    DEFINE_PROP_END_OF_LIST()
+};
+
 static void cxl_upstream_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
@@ -186,6 +377,7 @@ static void cxl_upstream_class_init(ObjectClass *oc, void *data)
 
     k->is_bridge = true;
     k->config_write = cxl_usp_write_config;
+    k->config_read = cxl_usp_read_config;
     k->realize = cxl_usp_realize;
     k->exit = cxl_usp_exitfn;
     k->vendor_id = 0x19e5; /* Huawei */
@@ -194,6 +386,7 @@ static void cxl_upstream_class_init(ObjectClass *oc, void *data)
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
     dc->desc = "CXL Switch Upstream Port";
     dc->reset = cxl_usp_reset;
+    device_class_set_props(dc, cxl_upstream_props);
 }
 
 static const TypeInfo cxl_usp_info = {
-- 
MST


