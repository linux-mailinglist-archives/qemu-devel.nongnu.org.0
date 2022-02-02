Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6745C4A743B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 16:08:28 +0100 (CET)
Received: from localhost ([::1]:35524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFHFD-0005ZJ-H1
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 10:08:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nFGRf-0000vV-74
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 09:17:17 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nFGRY-0006wS-6G
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 09:17:14 -0500
Received: from fraeml712-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4JpkP73v07z67nP6;
 Wed,  2 Feb 2022 22:16:11 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml712-chm.china.huawei.com (10.206.15.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 2 Feb 2022 15:16:44 +0100
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 2 Feb 2022 14:16:44 +0000
To: <qemu-devel@nongnu.org>, =?UTF-8?q?Alex=20Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Marcel Apfelbaum <marcel@redhat.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
CC: <linux-cxl@vger.kernel.org>, Ben Widawsky <ben.widawsky@intel.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, <linuxarm@huawei.com>, "Shameerali
 Kolothum Thodi" <shameerali.kolothum.thodi@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Saransh Gupta1
 <saransh@ibm.com>, Shreyas Shah <shreyas.shah@elastics.cloud>, Chris Browy
 <cbrowy@avery-design.com>, Samarth Saxena <samarths@cadence.com>, "Dan
 Williams" <dan.j.williams@intel.com>
Subject: [PATCH v5 12/43] hw/pci/cxl: Create a CXL bus type
Date: Wed, 2 Feb 2022 14:10:06 +0000
Message-ID: <20220202141037.17352-13-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220202141037.17352-1-Jonathan.Cameron@huawei.com>
References: <20220202141037.17352-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml743-chm.china.huawei.com (10.201.108.193) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Ben Widawsky <ben.widawsky@intel.com>

The easiest way to differentiate a CXL bus, and a PCIE bus is using a
flag. A CXL bus, in hardware, is backward compatible with PCIE, and
therefore the code tries pretty hard to keep them in sync as much as
possible.

The other way to implement this would be to try to cast the bus to the
correct type. This is less code and useful for debugging via simply
looking at the flags.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/pci-bridge/pci_expander_bridge.c | 9 ++++++++-
 include/hw/pci/pci_bus.h            | 7 +++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index d4514227a8..a6caa1e7b5 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -24,7 +24,7 @@
 #include "hw/boards.h"
 #include "qom/object.h"
 
-enum BusType { PCI, PCIE };
+enum BusType { PCI, PCIE, CXL };
 
 #define TYPE_PXB_BUS "pxb-bus"
 typedef struct PXBBus PXBBus;
@@ -35,6 +35,10 @@ DECLARE_INSTANCE_CHECKER(PXBBus, PXB_BUS,
 DECLARE_INSTANCE_CHECKER(PXBBus, PXB_PCIE_BUS,
                          TYPE_PXB_PCIE_BUS)
 
+#define TYPE_PXB_CXL_BUS "pxb-cxl-bus"
+DECLARE_INSTANCE_CHECKER(PXBBus, PXB_CXL_BUS,
+                         TYPE_PXB_CXL_BUS)
+
 struct PXBBus {
     /*< private >*/
     PCIBus parent_obj;
@@ -251,6 +255,9 @@ static void pxb_dev_realize_common(PCIDevice *dev, enum BusType type,
     ds = qdev_new(TYPE_PXB_HOST);
     if (type == PCIE) {
         bus = pci_root_bus_new(ds, dev_name, NULL, NULL, 0, TYPE_PXB_PCIE_BUS);
+    } else if (type == CXL) {
+        bus = pci_root_bus_new(ds, dev_name, NULL, NULL, 0, TYPE_PXB_CXL_BUS);
+        bus->flags |= PCI_BUS_CXL;
     } else {
         bus = pci_root_bus_new(ds, "pxb-internal", NULL, NULL, 0, TYPE_PXB_BUS);
         bds = qdev_new("pci-bridge");
diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
index 347440d42c..eb94e7e85c 100644
--- a/include/hw/pci/pci_bus.h
+++ b/include/hw/pci/pci_bus.h
@@ -24,6 +24,8 @@ enum PCIBusFlags {
     PCI_BUS_IS_ROOT                                         = 0x0001,
     /* PCIe extended configuration space is accessible on this bus */
     PCI_BUS_EXTENDED_CONFIG_SPACE                           = 0x0002,
+    /* This is a CXL Type BUS */
+    PCI_BUS_CXL                                             = 0x0004,
 };
 
 struct PCIBus {
@@ -53,6 +55,11 @@ struct PCIBus {
     Notifier machine_done;
 };
 
+static inline bool pci_bus_is_cxl(PCIBus *bus)
+{
+    return !!(bus->flags & PCI_BUS_CXL);
+}
+
 static inline bool pci_bus_is_root(PCIBus *bus)
 {
     return !!(bus->flags & PCI_BUS_IS_ROOT);
-- 
2.32.0


