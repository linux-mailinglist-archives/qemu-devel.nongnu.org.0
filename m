Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 226534987FE
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 19:14:05 +0100 (CET)
Received: from localhost ([::1]:53474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC3qu-0003TD-6y
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 13:14:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nC390-00039L-00
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 12:28:43 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nC38u-0000wD-Q9
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 12:28:40 -0500
Received: from fraeml714-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4JjH061Fgqz6FGLl;
 Tue, 25 Jan 2022 01:24:06 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml714-chm.china.huawei.com (10.206.15.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 24 Jan 2022 18:28:19 +0100
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 24 Jan 2022 17:28:19 +0000
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
Subject: [PATCH v4 22/42] acpi/cxl: Add _OSC implementation (9.14.2)
Date: Mon, 24 Jan 2022 17:16:45 +0000
Message-ID: <20220124171705.10432-23-Jonathan.Cameron@huawei.com>
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

From: Ben Widawsky <ben.widawsky@intel.com>

CXL 2.0 specification adds 2 new dwords to the existing _OSC definition
from PCIe. The new dwords are accessed with a new uuid. This
implementation supports what is in the specification.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/acpi/Kconfig       |   5 ++
 hw/acpi/cxl.c         | 104 ++++++++++++++++++++++++++++++++++++++++++
 hw/acpi/meson.build   |   1 +
 hw/i386/acpi-build.c  |  14 +++++-
 include/hw/acpi/cxl.h |  23 ++++++++++
 5 files changed, 146 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
index 622b0b50b7..76cafca652 100644
--- a/hw/acpi/Kconfig
+++ b/hw/acpi/Kconfig
@@ -5,6 +5,7 @@ config ACPI_X86
     bool
     select ACPI
     select ACPI_NVDIMM
+    select ACPI_CXL
     select ACPI_CPU_HOTPLUG
     select ACPI_MEMORY_HOTPLUG
     select ACPI_HMAT
@@ -60,3 +61,7 @@ config ACPI_HW_REDUCED
     select ACPI
     select ACPI_MEMORY_HOTPLUG
     select ACPI_NVDIMM
+
+config ACPI_CXL
+    bool
+    depends on ACPI
diff --git a/hw/acpi/cxl.c b/hw/acpi/cxl.c
new file mode 100644
index 0000000000..7124d5a1a3
--- /dev/null
+++ b/hw/acpi/cxl.c
@@ -0,0 +1,104 @@
+/*
+ * CXL ACPI Implementation
+ *
+ * Copyright(C) 2020 Intel Corporation.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>
+ */
+
+#include "qemu/osdep.h"
+#include "hw/cxl/cxl.h"
+#include "hw/acpi/acpi.h"
+#include "hw/acpi/aml-build.h"
+#include "hw/acpi/bios-linker-loader.h"
+#include "hw/acpi/cxl.h"
+#include "qapi/error.h"
+#include "qemu/uuid.h"
+
+static Aml *__build_cxl_osc_method(void)
+{
+    Aml *method, *if_uuid, *else_uuid, *if_arg1_not_1, *if_cxl, *if_caps_masked;
+    Aml *a_ctrl = aml_local(0);
+    Aml *a_cdw1 = aml_name("CDW1");
+
+    method = aml_method("_OSC", 4, AML_NOTSERIALIZED);
+    aml_append(method, aml_create_dword_field(aml_arg(3), aml_int(0), "CDW1"));
+
+    /* 9.14.2.1.4 */
+    if_uuid = aml_if(
+        aml_lor(aml_equal(aml_arg(0),
+                          aml_touuid("33DB4D5B-1FF7-401C-9657-7441C03DD766")),
+                aml_equal(aml_arg(0),
+                          aml_touuid("68F2D50B-C469-4D8A-BD3D-941A103FD3FC"))));
+    aml_append(if_uuid, aml_create_dword_field(aml_arg(3), aml_int(4), "CDW2"));
+    aml_append(if_uuid, aml_create_dword_field(aml_arg(3), aml_int(8), "CDW3"));
+
+    aml_append(if_uuid, aml_store(aml_name("CDW3"), a_ctrl));
+
+    /* This is all the same as what's used for PCIe */
+    aml_append(if_uuid,
+               aml_and(aml_name("CTRL"), aml_int(0x1F), aml_name("CTRL")));
+
+    if_arg1_not_1 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(0x1))));
+    /* Unknown revision */
+    aml_append(if_arg1_not_1, aml_or(a_cdw1, aml_int(0x08), a_cdw1));
+    aml_append(if_uuid, if_arg1_not_1);
+
+    if_caps_masked = aml_if(aml_lnot(aml_equal(aml_name("CDW3"), a_ctrl)));
+    /* Capability bits were masked */
+    aml_append(if_caps_masked, aml_or(a_cdw1, aml_int(0x10), a_cdw1));
+    aml_append(if_uuid, if_caps_masked);
+
+    aml_append(if_uuid, aml_store(aml_name("CDW2"), aml_name("SUPP")));
+    aml_append(if_uuid, aml_store(aml_name("CDW3"), aml_name("CTRL")));
+
+    if_cxl = aml_if(aml_equal(
+        aml_arg(0), aml_touuid("68F2D50B-C469-4D8A-BD3D-941A103FD3FC")));
+    /* CXL support field */
+    aml_append(if_cxl, aml_create_dword_field(aml_arg(3), aml_int(12), "CDW4"));
+    /* CXL capabilities */
+    aml_append(if_cxl, aml_create_dword_field(aml_arg(3), aml_int(16), "CDW5"));
+    aml_append(if_cxl, aml_store(aml_name("CDW4"), aml_name("SUPC")));
+    aml_append(if_cxl, aml_store(aml_name("CDW5"), aml_name("CTRC")));
+
+    /* CXL 2.0 Port/Device Register access */
+    aml_append(if_cxl,
+               aml_or(aml_name("CDW5"), aml_int(0x1), aml_name("CDW5")));
+    aml_append(if_uuid, if_cxl);
+
+    /* Update DWORD3 (the return value) */
+    aml_append(if_uuid, aml_store(a_ctrl, aml_name("CDW3")));
+
+    aml_append(if_uuid, aml_return(aml_arg(3)));
+    aml_append(method, if_uuid);
+
+    else_uuid = aml_else();
+
+    /* unrecognized uuid */
+    aml_append(else_uuid,
+               aml_or(aml_name("CDW1"), aml_int(0x4), aml_name("CDW1")));
+    aml_append(else_uuid, aml_return(aml_arg(3)));
+    aml_append(method, else_uuid);
+
+    return method;
+}
+
+void build_cxl_osc_method(Aml *dev)
+{
+    aml_append(dev, aml_name_decl("SUPP", aml_int(0)));
+    aml_append(dev, aml_name_decl("CTRL", aml_int(0)));
+    aml_append(dev, aml_name_decl("SUPC", aml_int(0)));
+    aml_append(dev, aml_name_decl("CTRC", aml_int(0)));
+    aml_append(dev, __build_cxl_osc_method());
+}
diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
index adf6347bc4..76b7b85d34 100644
--- a/hw/acpi/meson.build
+++ b/hw/acpi/meson.build
@@ -13,6 +13,7 @@ acpi_ss.add(when: 'CONFIG_ACPI_MEMORY_HOTPLUG', if_false: files('acpi-mem-hotplu
 acpi_ss.add(when: 'CONFIG_ACPI_NVDIMM', if_true: files('nvdimm.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_NVDIMM', if_false: files('acpi-nvdimm-stub.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_PCI', if_true: files('pci.c'))
+acpi_ss.add(when: 'CONFIG_ACPI_CXL', if_true: files('cxl.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_VMGENID', if_true: files('vmgenid.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_HW_REDUCED', if_true: files('generic_event_device.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_HMAT', if_true: files('hmat.c'))
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index ad4f8eb22a..c90126a2e1 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -65,6 +65,7 @@
 #include "hw/acpi/aml-build.h"
 #include "hw/acpi/utils.h"
 #include "hw/acpi/pci.h"
+#include "hw/acpi/cxl.h"
 
 #include "qom/qom-qobject.h"
 #include "hw/i386/amd_iommu.h"
@@ -1406,13 +1407,24 @@ static void init_pci_acpi(Aml *dev, int uid, int type, bool native_pcie_hp)
         aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
         aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
         aml_append(dev, aml_name_decl("_UID", aml_int(uid)));
-    } else {
+    } else if (type == PCIE) {
         aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
         aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
         aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
         aml_append(dev, aml_name_decl("_UID", aml_int(uid)));
+
         /* Expander bridges do not have ACPI PCI Hot-plug enabled */
         aml_append(dev, build_q35_osc_method(native_pcie_hp));
+    } else { /* CXL */
+        struct Aml *pkg = aml_package(2);
+
+        aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0016")));
+        aml_append(pkg, aml_eisaid("PNP0A08"));
+        aml_append(pkg, aml_eisaid("PNP0A03"));
+        aml_append(dev, aml_name_decl("_CID", pkg));
+        aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
+        aml_append(dev, aml_name_decl("_UID", aml_int(uid)));
+        build_cxl_osc_method(dev);
     }
 }
 
diff --git a/include/hw/acpi/cxl.h b/include/hw/acpi/cxl.h
new file mode 100644
index 0000000000..7b8f3b8a2e
--- /dev/null
+++ b/include/hw/acpi/cxl.h
@@ -0,0 +1,23 @@
+/*
+ * Copyright (C) 2020 Intel Corporation
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HW_ACPI_CXL_H
+#define HW_ACPI_CXL_H
+
+void build_cxl_osc_method(Aml *dev);
+
+#endif
-- 
2.32.0


