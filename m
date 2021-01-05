Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C59882EB0F5
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:07:12 +0100 (CET)
Received: from localhost ([::1]:32786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwpnb-0004jR-RX
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:07:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kwpbE-00005k-Vd
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:54:24 -0500
Received: from mga11.intel.com ([192.55.52.93]:21242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kwpb7-00012E-FR
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:54:24 -0500
IronPort-SDR: U0UsRED9aUrlzmag2WxEHNo83FfY9rIS8rOq91wadPmhttO5f9fZxKUfVUKkA3zUMDX9fOoC8o
 Cia80a2y8iFQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9855"; a="173629531"
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="173629531"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 08:53:56 -0800
IronPort-SDR: 5uRSWBtaH/UQh/aoIydictYhSlEZsoFD1jtCn8yeOTr75T7rD3u0cObPbiWkQsS//A0WwNC2dt
 F/SauRaWwbhQ==
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="346337994"
Received: from tgeddam-mobl.amr.corp.intel.com (HELO bwidawsk-mobl5.local)
 ([10.252.140.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 08:53:56 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 13/32] hw/pxb: Use a type for realizing expanders
Date: Tue,  5 Jan 2021 08:53:04 -0800
Message-Id: <20210105165323.783725-14-ben.widawsky@intel.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210105165323.783725-1-ben.widawsky@intel.com>
References: <20210105165323.783725-1-ben.widawsky@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.93; envelope-from=ben.widawsky@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Ben Widawsky <ben.widawsky@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Vishal Verma <vishal.l.verma@intel.com>,
 Chris Browy <cbrowy@avery-design.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Prashant V Agarwal <agpr123@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This opens up the possibility for more types of expanders (other than
PCI and PCIe). We'll need this to create a CXL expander.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
---
 hw/pci-bridge/pci_expander_bridge.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index aedded1064..232b7ce305 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -24,6 +24,8 @@
 #include "hw/boards.h"
 #include "qom/object.h"
 
+enum BusType { PCI, PCIE };
+
 #define TYPE_PXB_BUS "pxb-bus"
 typedef struct PXBBus PXBBus;
 DECLARE_INSTANCE_CHECKER(PXBBus, PXB_BUS,
@@ -214,7 +216,8 @@ static gint pxb_compare(gconstpointer a, gconstpointer b)
            0;
 }
 
-static void pxb_dev_realize_common(PCIDevice *dev, bool pcie, Error **errp)
+static void pxb_dev_realize_common(PCIDevice *dev, enum BusType type,
+                                   Error **errp)
 {
     PXBDev *pxb = convert_to_pxb(dev);
     DeviceState *ds, *bds = NULL;
@@ -239,7 +242,7 @@ static void pxb_dev_realize_common(PCIDevice *dev, bool pcie, Error **errp)
     }
 
     ds = qdev_new(TYPE_PXB_HOST);
-    if (pcie) {
+    if (type == PCIE) {
         bus = pci_root_bus_new(ds, dev_name, NULL, NULL, 0, TYPE_PXB_PCIE_BUS);
     } else {
         bus = pci_root_bus_new(ds, "pxb-internal", NULL, NULL, 0, TYPE_PXB_BUS);
@@ -287,7 +290,7 @@ static void pxb_dev_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
-    pxb_dev_realize_common(dev, false, errp);
+    pxb_dev_realize_common(dev, PCI, errp);
 }
 
 static void pxb_dev_exitfn(PCIDevice *pci_dev)
@@ -339,7 +342,7 @@ static void pxb_pcie_dev_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
-    pxb_dev_realize_common(dev, true, errp);
+    pxb_dev_realize_common(dev, PCIE, errp);
 }
 
 static void pxb_pcie_dev_class_init(ObjectClass *klass, void *data)
-- 
2.30.0


