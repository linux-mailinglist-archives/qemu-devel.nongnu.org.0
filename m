Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C834DDC70
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 16:08:45 +0100 (CET)
Received: from localhost ([::1]:36108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVEDc-00068a-Er
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 11:08:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nVEBs-0004UD-Pd
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 11:06:56 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nVEBq-00030Z-Uc
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 11:06:56 -0400
Received: from fraeml739-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4KKnPT1KDdz67xNS;
 Fri, 18 Mar 2022 23:05:17 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml739-chm.china.huawei.com (10.206.15.220) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 18 Mar 2022 16:06:52 +0100
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 18 Mar 2022 15:06:52 +0000
To: <linuxarm@huawei.com>, <qemu-devel@nongnu.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, Marcel Apfelbaum
 <marcel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>
CC: <linux-cxl@vger.kernel.org>, Ben Widawsky <ben.widawsky@intel.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, Shameerali Kolothum Thodi
 <shameerali.kolothum.thodi@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Peter Xu
 <peterx@redhat.com>, David Hildenbrand <david@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Saransh Gupta1 <saransh@ibm.com>, Shreyas Shah
 <shreyas.shah@elastics.cloud>, Chris Browy <cbrowy@avery-design.com>,
 "Samarth Saxena" <samarths@cadence.com>, Dan Williams
 <dan.j.williams@intel.com>, "Mark Cave-Ayland"
 <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v8 01/46] hw/pci/cxl: Add a CXL component type (interface)
Date: Fri, 18 Mar 2022 15:05:50 +0000
Message-ID: <20220318150635.24600-2-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220318150635.24600-1-Jonathan.Cameron@huawei.com>
References: <20220318150635.24600-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml732-chm.china.huawei.com (10.201.108.83) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
core PCI code to treat these devices as special where appropriate.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/pci/pci.c         | 10 ++++++++++
 include/hw/pci/pci.h |  8 ++++++++
 2 files changed, 18 insertions(+)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 5cb1232e27..7883778a99 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -201,6 +201,11 @@ static const TypeInfo pci_bus_info = {
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
@@ -2182,6 +2187,10 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
         pci_dev->cap_present |= QEMU_PCI_CAP_EXPRESS;
     }
 
+    if (object_class_dynamic_cast(klass, INTERFACE_CXL_DEVICE)) {
+        pci_dev->cap_present |= QEMU_PCIE_CAP_CXL;
+    }
+
     pci_dev = do_pci_register_device(pci_dev,
                                      object_get_typename(OBJECT(qdev)),
                                      pci_dev->devfn, errp);
@@ -2938,6 +2947,7 @@ static void pci_register_types(void)
     type_register_static(&pci_bus_info);
     type_register_static(&pcie_bus_info);
     type_register_static(&conventional_pci_interface_info);
+    type_register_static(&cxl_interface_info);
     type_register_static(&pcie_interface_info);
     type_register_static(&pci_device_type_info);
 }
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 3a32b8dd40..98f0d1b844 100644
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
2.32.0


