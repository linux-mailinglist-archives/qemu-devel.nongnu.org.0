Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED546136F7
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:53:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUHg-0006G2-5y; Mon, 31 Oct 2022 08:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUHC-0002ld-Sy
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:52:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUH4-0002ah-Rh
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:52:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ETyx33uCkrggVRTo3HiD7Tje2UJXCck/b2Qi00flxlo=;
 b=YpxQIu4KG6OucQidIFlPw7Js+Boif222W/0zS42stKsZP+++eLAtLQkUOSUNyjAH0PSqzE
 AqDLtyxY9aCzaxI7lYpSsD1XWXgsiU17EdPvqqbIzjbMLKk7e3DkNEafG3HvMExVZmiWNK
 CPReB3gmP3D8Suo6OFBbHlDfa5nrSSg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-178-0fo0s_wkNiCaNZFWlMLYgA-1; Mon, 31 Oct 2022 08:52:16 -0400
X-MC-Unique: 0fo0s_wkNiCaNZFWlMLYgA-1
Received: by mail-wm1-f71.google.com with SMTP id
 s7-20020a1cf207000000b003cf56bad2e2so2212155wmc.9
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:52:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ETyx33uCkrggVRTo3HiD7Tje2UJXCck/b2Qi00flxlo=;
 b=o3fDrsF6qyzgp948ia5Hd1ND8EmEQGBx3+KC9QNFoIdb7PgZNHDnaKWffnQ3AvMaOu
 WOiYBtruQTeKZb3VFlZHhTywjydS2RpNsgh4cDrF3K4iMAc4/cWVGBaXy8D/BPWC62za
 MRYG8Gz2Gav1HUBcK9ID6erGX+NEcRWoiqUuddexvli1Z8SayZdY8sLe0PR2dp4sHo3Q
 HoXvuxPOhvrn1RvB/O4OdKsOejwLZiAMzVnET58HppmddYZIrl64cgmA2VnNZ8HkFc/C
 FFWwDCTR/YLeI31EOIanQpONXtY7+jthrZ2ER1i4fP4C2QTaixHO/c95xeF3WfWqTnGn
 5b4Q==
X-Gm-Message-State: ACrzQf2jtzXG2DphwAqK3gV2Sr7Pt+Hex7ncuZjbn8YrDOU72LaOsTEl
 zNKiKBgFDGWd17pD7zeIErlTrcKNCQ5agMHVHB1G33P+yOeEvtR7wJxreCG5NNXtZasVR0hrtk0
 +/9mRntiwutzykxzSPZEk6ODIQ44T74Qce0uSKihc0C3Fm8rhUZg2ExGs52Yt
X-Received: by 2002:a05:600c:3d13:b0:3cf:4d63:243d with SMTP id
 bh19-20020a05600c3d1300b003cf4d63243dmr8050022wmb.24.1667220734629; 
 Mon, 31 Oct 2022 05:52:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6fYp9GpeO0lOTQUdVR+IGFiC478BGA3OJ8DqwOJ1slI4OB8BikE4llz0/u3ElZ1rhQX5HEeA==
X-Received: by 2002:a05:600c:3d13:b0:3cf:4d63:243d with SMTP id
 bh19-20020a05600c3d1300b003cf4d63243dmr8050002wmb.24.1667220734270; 
 Mon, 31 Oct 2022 05:52:14 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 k18-20020adfe3d2000000b00236705daefesm7012407wrm.39.2022.10.31.05.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:52:13 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:52:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ben Widawsky <ben.widawsky@intel.com>
Subject: [PULL 31/86] hw/pci-bridge/cxl-upstream: Add a CDAT table access DOE
Message-ID: <20221031124928.128475-32-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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


