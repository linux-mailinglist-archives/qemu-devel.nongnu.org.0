Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCAB498871
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 19:36:48 +0100 (CET)
Received: from localhost ([::1]:49504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC4Ct-0005V4-OX
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 13:36:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nC3DB-0000i8-Al
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 12:33:06 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nC3D9-0001gZ-Fs
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 12:33:00 -0500
Received: from fraeml703-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4JjH9v3rSxz686wr;
 Tue, 25 Jan 2022 01:32:35 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml703-chm.china.huawei.com (10.206.15.52) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.21; Mon, 24 Jan 2022 18:32:56 +0100
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 24 Jan 2022 17:32:55 +0000
To: <qemu-devel@nongnu.org>, Marcel Apfelbaum <marcel@redhat.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
CC: <linux-cxl@vger.kernel.org>, Ben Widawsky <ben.widawsky@intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>, <linuxarm@huawei.com>, Shameerali Kolothum Thodi
 <shameerali.kolothum.thodi@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Saransh Gupta1
 <saransh@ibm.com>, Shreyas Shah <shreyas.shah@elastics.cloud>, Chris Browy
 <cbrowy@avery-design.com>, Samarth Saxena <samarths@cadence.com>, "Dan
 Williams" <dan.j.williams@intel.com>
Subject: [PATCH v4 31/42] hw/pci-host/gpex-acpi: Add support for dsdt
 construction for pxb-cxl
Date: Mon, 24 Jan 2022 17:16:54 +0000
Message-ID: <20220124171705.10432-32-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
References: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml740-chm.china.huawei.com (10.201.108.190) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

This adds code to instantiate the slightly extended ACPI root port
description in DSDT as per the CXL 2.0 specification.

Basically a cut and paste job from the i386/pc code.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
---
 hw/arm/Kconfig          |  1 +
 hw/pci-host/gpex-acpi.c | 22 +++++++++++++++++++---
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 2e0049196d..3df419fa6d 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -29,6 +29,7 @@ config ARM_VIRT
     select ACPI_APEI
     select ACPI_VIOT
     select VIRTIO_MEM_SUPPORTED
+    select ACPI_CXL
 
 config CHEETAH
     bool
diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
index e7e162a00a..fb60aa517f 100644
--- a/hw/pci-host/gpex-acpi.c
+++ b/hw/pci-host/gpex-acpi.c
@@ -5,6 +5,7 @@
 #include "hw/pci/pci_bus.h"
 #include "hw/pci/pci_bridge.h"
 #include "hw/pci/pcie_host.h"
+#include "hw/acpi/cxl.h"
 
 static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq)
 {
@@ -139,6 +140,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
         QLIST_FOREACH(bus, &bus->child, sibling) {
             uint8_t bus_num = pci_bus_num(bus);
             uint8_t numa_node = pci_bus_numa_node(bus);
+            bool is_cxl;
 
             if (!pci_bus_is_root(bus)) {
                 continue;
@@ -153,9 +155,19 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
                 nr_pcie_buses = bus_num;
             }
 
+            is_cxl = pci_bus_is_cxl(bus);
+
             dev = aml_device("PC%.02X", bus_num);
-            aml_append(dev, aml_name_decl("_HID", aml_string("PNP0A08")));
-            aml_append(dev, aml_name_decl("_CID", aml_string("PNP0A03")));
+            if (is_cxl) {
+                struct Aml *pkg = aml_package(2);
+                aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0016")));
+                aml_append(pkg, aml_eisaid("PNP0A08"));
+                aml_append(pkg, aml_eisaid("PNP0A03"));
+                aml_append(dev, aml_name_decl("_CID", pkg));
+            } else {
+                aml_append(dev, aml_name_decl("_HID", aml_string("PNP0A08")));
+                aml_append(dev, aml_name_decl("_CID", aml_string("PNP0A03")));
+            }
             aml_append(dev, aml_name_decl("_BBN", aml_int(bus_num)));
             aml_append(dev, aml_name_decl("_UID", aml_int(bus_num)));
             aml_append(dev, aml_name_decl("_STR", aml_unicode("pxb Device")));
@@ -175,7 +187,11 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
                             cfg->pio.base, 0, 0, 0);
             aml_append(dev, aml_name_decl("_CRS", crs));
 
-            acpi_dsdt_add_pci_osc(dev);
+            if (is_cxl) {
+                build_cxl_osc_method(dev);
+            } else {
+                acpi_dsdt_add_pci_osc(dev);
+            }
 
             aml_append(scope, dev);
         }
-- 
2.32.0


