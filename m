Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB595FD905
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 14:14:30 +0200 (CEST)
Received: from localhost ([::1]:54058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oix6b-0006TM-VD
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 08:14:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oiwvC-0006lT-La
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:02:42 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oiwvA-00072K-Jg
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:02:42 -0400
Received: from fraeml745-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Mp7RM13bkz682kB;
 Thu, 13 Oct 2022 20:01:51 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml745-chm.china.huawei.com (10.206.15.226) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 13 Oct 2022 14:02:38 +0200
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 13 Oct 2022 13:02:38 +0100
To: <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>, Ben Widawsky
 <bwidawsk@kernel.org>, <linux-cxl@vger.kernel.org>, Huai-Cheng Kuo
 <hchkuo@avery-design.com.tw>, Chris Browy <cbrowy@avery-design.com>, "Gregory
 Price" <gregory.price@memverge.com>, <ira.weiny@intel.com>
CC: <linuxarm@huawei.com>
Subject: [PATCH v8 5/5] hw/pci-bridge/cxl-upstream: Add a CDAT table access DOE
Date: Thu, 13 Oct 2022 13:00:09 +0100
Message-ID: <20221013120009.15541-6-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221013120009.15541-1-Jonathan.Cameron@huawei.com>
References: <20221013120009.15541-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

This Data Object Exchange Mailbox allows software to query the
latency and bandwidth between ports on the switch. For now
only provide information on routes between the upstream port and
each downstream port (not p2p).

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

--
Changes since v7:
- Moved to enum for cdat_table elements to make sizing explicit.
- Handle memory allocation failures that would have been ignored
  previously.
---
 hw/pci-bridge/cxl_upstream.c | 194 ++++++++++++++++++++++++++++++++++-
 include/hw/cxl/cxl_cdat.h    |   1 +
 2 files changed, 194 insertions(+), 1 deletion(-)

diff --git a/hw/pci-bridge/cxl_upstream.c b/hw/pci-bridge/cxl_upstream.c
index a83a3e81e4..f2fc22388f 100644
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
@@ -119,6 +136,166 @@ static void build_dvsecs(CXLComponentState *cxl)
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
+static int build_cdat_table(CDATSubHeader ***cdat_table, void *priv)
+{
+    enum {
+        SSLBIS_LATENCY,
+        SSLBIS_BANDWIDTH,
+        NUM_ENTRIES
+    };
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
+    *cdat_table = g_malloc0(sizeof(*cdat_table) * NUM_ENTRIES);
+    if (!*cdat_table) {
+        return -ENOMEM;
+    }
+
+    /* Header always at start of structure */
+    (*cdat_table)[SSLBIS_LATENCY] = g_steal_pointer(&sslbis_latency);
+    (*cdat_table)[SSLBIS_BANDWIDTH] = g_steal_pointer(&sslbis_bandwidth);
+
+    return NUM_ENTRIES;
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
@@ -161,6 +338,14 @@ static void cxl_usp_realize(PCIDevice *d, Error **errp)
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
@@ -179,6 +364,11 @@ static void cxl_usp_exitfn(PCIDevice *d)
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
@@ -186,6 +376,7 @@ static void cxl_upstream_class_init(ObjectClass *oc, void *data)
 
     k->is_bridge = true;
     k->config_write = cxl_usp_write_config;
+    k->config_read = cxl_usp_read_config;
     k->realize = cxl_usp_realize;
     k->exit = cxl_usp_exitfn;
     k->vendor_id = 0x19e5; /* Huawei */
@@ -194,6 +385,7 @@ static void cxl_upstream_class_init(ObjectClass *oc, void *data)
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
     dc->desc = "CXL Switch Upstream Port";
     dc->reset = cxl_usp_reset;
+    device_class_set_props(dc, cxl_upstream_props);
 }
 
 static const TypeInfo cxl_usp_info = {
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
-- 
2.37.2


