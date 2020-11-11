Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E662AE883
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 06:55:50 +0100 (CET)
Received: from localhost ([::1]:40464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcj6j-0007a5-CA
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 00:55:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kciyv-00047i-Nv
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 00:47:45 -0500
Received: from mga14.intel.com ([192.55.52.115]:60776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kciyt-0008P1-HR
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 00:47:45 -0500
IronPort-SDR: /p31c9RwAu0I3keoQ+0V7ITJyGV9dVf6ewjyFZLoygJ0f/LO4A12DCK7TXOsBin/5FM7ArJvFm
 rtus0nw84gtw==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="169314669"
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; d="scan'208";a="169314669"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 21:47:32 -0800
IronPort-SDR: DIS5xXMb2H4BMYVieMOZubr6MOpWXQ0G9UgZAC/V43bRGhdDhs60YOaUUIXhMiIkn9XPtbjMLd
 fKcEdZT0rrOA==
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; d="scan'208";a="308710416"
Received: from hccoutan-mobl1.amr.corp.intel.com (HELO bwidawsk-mobl5.local)
 ([10.252.131.159])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 21:47:31 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 09/25] hw/pxb: Use a type for realizing expanders
Date: Tue, 10 Nov 2020 21:47:08 -0800
Message-Id: <20201111054724.794888-10-ben.widawsky@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201111054724.794888-1-ben.widawsky@intel.com>
References: <20201111054724.794888-1-ben.widawsky@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115;
 envelope-from=ben.widawsky@intel.com; helo=mga14.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 00:47:28
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
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
Cc: Vishal Verma <vishal.l.verma@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Ben Widawsky <ben.widawsky@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
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
2.29.2


