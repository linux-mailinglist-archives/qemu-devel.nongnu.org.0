Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DBB30AB8D
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 16:37:06 +0100 (CET)
Received: from localhost ([::1]:44972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6bGD-0005Nn-7H
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 10:37:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1l6bB8-0000Xf-Qh
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:31:51 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1l6bB4-0008Lg-TT
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:31:50 -0500
Received: from fraeml702-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4DTsG643vhz67Wp8;
 Mon,  1 Feb 2021 23:25:34 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml702-chm.china.huawei.com (10.206.15.51) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Mon, 1 Feb 2021 16:31:42 +0100
Received: from lhrphicprd00229.huawei.com (10.123.41.22) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 1 Feb 2021 15:31:41 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH 2/3] hw/arm/virt: Basic CXL enablement on
 pci_expander_bridge instances pxb-cxl
Date: Mon, 1 Feb 2021 23:26:54 +0800
Message-ID: <20210201152655.31027-3-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20210201152655.31027-1-Jonathan.Cameron@huawei.com>
References: <20210201152655.31027-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.123.41.22]
X-ClientProxiedBy: lhreml751-chm.china.huawei.com (10.201.108.201) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Ben Widawsky <ben.widawsky@intel.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, Vishal
 Verma <vishal.l.verma@intel.com>, f.fangjian@huawei.com,
 Chris Browy <cbrowy@avery-design.com>, f4bug@amsat.org, linuxarm@openeuler.org,
 jcm@redhat.com, Prashant V Agarwal <agpr123@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Code based on i386/pc enablement.
There is a small amount of directly cut and paste code so it may
make sense to unify that at some stage.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/arm/Kconfig           |  1 +
 hw/arm/virt-acpi-build.c | 27 +++++++++++++++++++++++++++
 hw/arm/virt.c            |  3 ++-
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 0a242e4c5d..c43862bb23 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -27,6 +27,7 @@ config ARM_VIRT
     select ACPI_HW_REDUCED
     select ACPI_NVDIMM
     select ACPI_APEI
+    select ACPI_CXL
 
 config CHEETAH
     bool
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 9d9ee24053..ce7fd908d2 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -39,11 +39,13 @@
 #include "hw/acpi/aml-build.h"
 #include "hw/acpi/utils.h"
 #include "hw/acpi/pci.h"
+#include "hw/acpi/cxl.h"
 #include "hw/acpi/memory_hotplug.h"
 #include "hw/acpi/generic_event_device.h"
 #include "hw/acpi/tpm.h"
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pci.h"
+#include "hw/pci/pci_bus.h"
 #include "hw/pci-host/gpex.h"
 #include "hw/arm/virt.h"
 #include "hw/mem/nvdimm.h"
@@ -155,11 +157,27 @@ static void acpi_dsdt_add_virtio(Aml *scope,
     }
 }
 
+/* Move the i386 definition somewhere common? */
+static void build_acpi0017(Aml *table)
+{
+    Aml *dev;
+    Aml *scope;
+
+    scope =  aml_scope("_SB");
+    dev = aml_device("CXLM");
+    aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0017")));
+
+    aml_append(scope, dev);
+    aml_append(table, scope);
+}
+
 static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
                               uint32_t irq, bool use_highmem, bool highmem_ecam,
                               VirtMachineState *vms)
 {
     int ecam_id = VIRT_ECAM_ID(highmem_ecam);
+    bool cxl_present = false;
+    PCIBus *bus = vms->bus;
     struct GPEXConfig cfg = {
         .mmio32 = memmap[VIRT_PCIE_MMIO],
         .pio    = memmap[VIRT_PCIE_PIO],
@@ -173,6 +191,14 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
     }
 
     acpi_dsdt_add_gpex(scope, &cfg);
+    QLIST_FOREACH(bus, &vms->bus->child, sibling) {
+        if (pci_bus_is_cxl(bus)) {
+            cxl_present = true;
+        }
+    }
+    if (cxl_present) {
+        build_acpi0017(scope);
+    }
 }
 
 static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
@@ -724,6 +750,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
             build_slit(tables_blob, tables->linker, ms);
         }
     }
+    cxl_build_cedt(table_offsets, tables_blob, tables->linker);
 
     if (ms->nvdimms_state->is_enabled) {
         nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a3ac20744b..4d760beea9 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -78,6 +78,7 @@
 #include "hw/acpi/generic_event_device.h"
 #include "hw/virtio/virtio-iommu.h"
 #include "hw/char/pl011.h"
+#include "hw/cxl/cxl.h"
 #include "qemu/guest-random.h"
 
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
@@ -2481,7 +2482,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     hc->unplug_request = virt_machine_device_unplug_request_cb;
     hc->unplug = virt_machine_device_unplug_cb;
     mc->nvdimm_supported = true;
-    mc->cxl_supported = false;
+    mc->cxl_supported = true;
     mc->auto_enable_numa_with_memhp = true;
     mc->auto_enable_numa_with_memdev = true;
     mc->default_ram_id = "mach-virt.ram";
-- 
2.19.1


