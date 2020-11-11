Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B622AE866
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 06:49:37 +0100 (CET)
Received: from localhost ([::1]:43476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcj0i-0005Th-5V
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 00:49:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kciyn-0003qb-AJ
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 00:47:37 -0500
Received: from mga14.intel.com ([192.55.52.115]:60780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kciyk-0008P5-HO
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 00:47:36 -0500
IronPort-SDR: ZiGchOpfCzvqMaBm81Cg6G8oh4wDjtoB8THu6m6/gEXGbzWXfiJoWpueKK4J7PseXa4tMhvUMB
 8Ctc/Be8zneQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="169314660"
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; d="scan'208";a="169314660"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 21:47:28 -0800
IronPort-SDR: j1pqY+fDvAQnxd9Sb0HHo0NIhtEPenFOk1xLUvdApzGGJOanpWt57S94BNqAgrgyyGqzTVUtKF
 61HuNzJopfiA==
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; d="scan'208";a="308710390"
Received: from hccoutan-mobl1.amr.corp.intel.com (HELO bwidawsk-mobl5.local)
 ([10.252.131.159])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 21:47:28 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 02/25] hw/pci/cxl: Add a CXL component type (interface)
Date: Tue, 10 Nov 2020 21:47:01 -0800
Message-Id: <20201111054724.794888-3-ben.widawsky@intel.com>
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

A CXL component is a hardware entity that implements CXL component
registers from the CXL 2.0 spec (8.2.3). Currently these represent 3
general types.
1. Host Bridge
2. Ports (root, upstream, downstream)
3. Devices (memory, other)

A CXL component can be conceptually thought of as a PCIe device with
extra functionality when enumerated and enabled. For this reason, CXL
does here, and will continue to add on to existing PCI code paths.

Host bridges will typically need to be handled specially and so they can
implement this newly introduced interface or not. All other components
should implement this interface. Implementing this interface allows the
core pci code to treat these devices as special where appropriate.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
---
 hw/pci/pci.c         | 10 ++++++++++
 include/hw/pci/pci.h |  8 ++++++++
 2 files changed, 18 insertions(+)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 0131d9d02c..db88788c4b 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -192,6 +192,11 @@ static const TypeInfo pci_bus_info = {
     .class_init = pci_bus_class_init,
 };
 
+static const TypeInfo cxl_interface_info = {
+    .name          = INTERFACE_CXL_DEVICE,
+    .parent        = TYPE_INTERFACE,
+};
+
 static const TypeInfo pcie_interface_info = {
     .name          = INTERFACE_PCIE_DEVICE,
     .parent        = TYPE_INTERFACE,
@@ -2113,6 +2118,10 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
         pci_dev->cap_present |= QEMU_PCI_CAP_EXPRESS;
     }
 
+    if (object_class_dynamic_cast(klass, INTERFACE_CXL_DEVICE)) {
+        pci_dev->cap_present |= QEMU_PCIE_CAP_CXL;
+    }
+
     pci_dev = do_pci_register_device(pci_dev,
                                      object_get_typename(OBJECT(qdev)),
                                      pci_dev->devfn, errp);
@@ -2839,6 +2848,7 @@ static void pci_register_types(void)
     type_register_static(&pci_bus_info);
     type_register_static(&pcie_bus_info);
     type_register_static(&conventional_pci_interface_info);
+    type_register_static(&cxl_interface_info);
     type_register_static(&pcie_interface_info);
     type_register_static(&pci_device_type_info);
 }
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 72ce649eee..4e6fd59fdd 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -194,6 +194,8 @@ enum {
     QEMU_PCIE_LNKSTA_DLLLA = (1 << QEMU_PCIE_LNKSTA_DLLLA_BITNR),
 #define QEMU_PCIE_EXTCAP_INIT_BITNR 9
     QEMU_PCIE_EXTCAP_INIT = (1 << QEMU_PCIE_EXTCAP_INIT_BITNR),
+#define QEMU_PCIE_CXL_BITNR 10
+    QEMU_PCIE_CAP_CXL = (1 << QEMU_PCIE_CXL_BITNR),
 };
 
 #define TYPE_PCI_DEVICE "pci-device"
@@ -201,6 +203,12 @@ typedef struct PCIDeviceClass PCIDeviceClass;
 DECLARE_OBJ_CHECKERS(PCIDevice, PCIDeviceClass,
                      PCI_DEVICE, TYPE_PCI_DEVICE)
 
+/*
+ * Implemented by devices that can be plugged on CXL buses. In the spec, this is
+ * actually a "CXL Component, but we name it device to match the PCI naming.
+ */
+#define INTERFACE_CXL_DEVICE "cxl-device"
+
 /* Implemented by devices that can be plugged on PCI Express buses */
 #define INTERFACE_PCIE_DEVICE "pci-express-device"
 
-- 
2.29.2


