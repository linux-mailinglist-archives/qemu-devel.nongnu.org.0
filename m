Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4889677AA2
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 13:18:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJvlm-0007Oe-BH; Mon, 23 Jan 2023 07:17:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pJvli-0007MW-BD
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 07:17:46 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pJvlg-0004Y3-Ot
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 07:17:46 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4P0ptt0RDLz6J68f;
 Mon, 23 Jan 2023 20:14:30 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Mon, 23 Jan 2023 12:17:42 +0000
To: <qemu-devel@nongnu.org>
CC: Ben Widawsky <bwidawsk@kernel.org>, <linux-cxl@vger.kernel.org>,
 <linuxarm@huawei.com>, Ira Weiny <ira.weiny@intel.com>, Dave Jiang
 <dave.jiang@intel.com>, <alison.schofield@intel.com>, Fan Ni
 <fan.ni@samsung.com>
Subject: [RFC PATCH 1/2] hw/pci: Add pcie_count_ds_port() and
 pcie_find_port_first() helpers
Date: Mon, 23 Jan 2023 12:17:11 +0000
Message-ID: <20230123121712.29892-2-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230123121712.29892-1-Jonathan.Cameron@huawei.com>
References: <20230123121712.29892-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

These two helpers enable host bridges to operate differently depending on
the number of downstream ports, in particular if there is only a single
port.

Useful for CXL where HDM address decoders are allowed to be implicit in
the host bridge if there is only a single root port.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/pci/pcie_port.c         | 38 ++++++++++++++++++++++++++++++++++++++
 include/hw/pci/pcie_port.h |  2 ++
 2 files changed, 40 insertions(+)

diff --git a/hw/pci/pcie_port.c b/hw/pci/pcie_port.c
index 687e4e763a..b709777e0c 100644
--- a/hw/pci/pcie_port.c
+++ b/hw/pci/pcie_port.c
@@ -161,6 +161,44 @@ PCIDevice *pcie_find_port_by_pn(PCIBus *bus, uint8_t pn)
     return NULL;
 }
 
+/* Find first port in devfn number */
+PCIDevice *pcie_find_port_first(PCIBus *bus)
+{
+    int devfn;
+
+    for (devfn = 0; devfn < ARRAY_SIZE(bus->devices); devfn++) {
+        PCIDevice *d = bus->devices[devfn];
+
+        if (!d || !pci_is_express(d) || !d->exp.exp_cap) {
+            continue;
+        }
+
+        if (object_dynamic_cast(OBJECT(d), TYPE_PCIE_PORT)) {
+            return d;
+        }
+    }
+
+    return NULL;
+}
+
+int pcie_count_ds_ports(PCIBus *bus)
+{
+    int dsp_count = 0;
+    int devfn;
+    
+    for (devfn = 0; devfn < ARRAY_SIZE(bus->devices); devfn++) {
+        PCIDevice *d = bus->devices[devfn];
+
+        if (!d || !pci_is_express(d) || !d->exp.exp_cap) {
+            continue;
+        }
+        if (object_dynamic_cast(OBJECT(d), TYPE_PCIE_PORT)) {
+            dsp_count++;
+        }
+    }
+    return dsp_count;
+}
+
 static const TypeInfo pcie_port_type_info = {
     .name = TYPE_PCIE_PORT,
     .parent = TYPE_PCI_BRIDGE,
diff --git a/include/hw/pci/pcie_port.h b/include/hw/pci/pcie_port.h
index fd484afb30..2cbad72555 100644
--- a/include/hw/pci/pcie_port.h
+++ b/include/hw/pci/pcie_port.h
@@ -41,6 +41,8 @@ struct PCIEPort {
 void pcie_port_init_reg(PCIDevice *d);
 
 PCIDevice *pcie_find_port_by_pn(PCIBus *bus, uint8_t pn);
+PCIDevice *pcie_find_port_first(PCIBus *bus);
+int pcie_count_ds_ports(PCIBus *bus);
 
 #define TYPE_PCIE_SLOT "pcie-slot"
 OBJECT_DECLARE_SIMPLE_TYPE(PCIESlot, PCIE_SLOT)
-- 
2.37.2


