Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 426EC347983
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 14:23:41 +0100 (CET)
Received: from localhost ([::1]:52028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP3U4-0005Tf-C4
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 09:23:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lP3No-0006Yl-VH; Wed, 24 Mar 2021 09:17:12 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lP3Nk-0005Y8-CN; Wed, 24 Mar 2021 09:17:12 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F57xt6YWBz19Hqr;
 Wed, 24 Mar 2021 21:14:58 +0800 (CST)
Received: from huawei.com (10.174.185.226) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.498.0; Wed, 24 Mar 2021
 21:16:49 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>
Subject: [PATCH RFC v2 5/6] hw/i386/acpi-build: Add explicit scope in DMAR
 table
Date: Wed, 24 Mar 2021 13:16:34 +0000
Message-ID: <1616591795-2056-6-git-send-email-wangxingang5@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
In-Reply-To: <1616591795-2056-1-git-send-email-wangxingang5@huawei.com>
References: <1616591795-2056-1-git-send-email-wangxingang5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.185.226]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=wangxingang5@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: xieyingtai@huawei.com, peter.maydell@linaro.org, cenjiahui@huawei.com,
 ehabkost@redhat.com, mst@redhat.com, richard.henderson@linaro.org,
 shannon.zhaosl@gmail.com, pbonzini@redhat.com, imammedo@redhat.com,
 wangxingang5@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xingang Wang <wangxingang5@huawei.com>

In DMAR table, the drhd is set to cover all pci devices when intel_iommu
is on. This patch add explicit scope data, including only the pci devices
that go through iommu.

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
---
 hw/i386/acpi-build.c | 68 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 66 insertions(+), 2 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 442b4629a9..7729c96489 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1878,6 +1878,56 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
                  pcms->oem_table_id);
 }
 
+/*
+ * Insert DMAR scope for PCI bridges and endpoint devcie
+ */
+static void
+insert_scope(PCIBus *bus, PCIDevice *dev, void *opaque)
+{
+    GArray *scope_blob = opaque;
+    AcpiDmarDeviceScope *scope = NULL;
+
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_BRIDGE)) {
+        /* Dmar Scope Type: 0x02 for PCI Bridge */
+        build_append_int_noprefix(scope_blob, 0x02, 1);
+    } else {
+        /* Dmar Scope Type: 0x01 for PCI Endpoint Device */
+        build_append_int_noprefix(scope_blob, 0x01, 1);
+    }
+
+    /* length */
+    build_append_int_noprefix(scope_blob,
+                              sizeof(*scope) + sizeof(scope->path[0]), 1);
+    /* reserved */
+    build_append_int_noprefix(scope_blob, 0, 2);
+    /* enumeration_id */
+    build_append_int_noprefix(scope_blob, 0, 1);
+    /* bus */
+    build_append_int_noprefix(scope_blob, pci_bus_num(bus), 1);
+    /* device */
+    build_append_int_noprefix(scope_blob, PCI_SLOT(dev->devfn), 1);
+    /* function */
+    build_append_int_noprefix(scope_blob, PCI_FUNC(dev->devfn), 1);
+}
+
+/* For all PCI host bridges, walk and insert DMAR scope */
+static int
+dmar_host_bridges(Object *obj, void *opaque)
+{
+    GArray *scope_blob = opaque;
+
+    if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
+        PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
+
+        if (bus && pci_root_bus_has_iommu(bus)) {
+            pci_for_each_device(bus, pci_bus_num(bus), insert_scope,
+                                scope_blob);
+        }
+    }
+
+    return 0;
+}
+
 /*
  * VT-d spec 8.1 DMA Remapping Reporting Structure
  * (version Oct. 2014 or later)
@@ -1897,6 +1947,15 @@ build_dmar_q35(GArray *table_data, BIOSLinker *linker, const char *oem_id,
     /* Root complex IOAPIC use one path[0] only */
     size_t ioapic_scope_size = sizeof(*scope) + sizeof(scope->path[0]);
     IntelIOMMUState *intel_iommu = INTEL_IOMMU_DEVICE(iommu);
+    GArray *scope_blob = g_array_new(false, true, 1);
+
+    /*
+     * A PCI bus walk, for each PCI host bridge.
+     * Insert scope for each PCI bridge and endpoint device which
+     * is attached to a bus with iommu enabled.
+     */
+    object_child_foreach_recursive(object_get_root(),
+                                   dmar_host_bridges, scope_blob);
 
     assert(iommu);
     if (x86_iommu_ir_supported(iommu)) {
@@ -1910,8 +1969,9 @@ build_dmar_q35(GArray *table_data, BIOSLinker *linker, const char *oem_id,
     /* DMAR Remapping Hardware Unit Definition structure */
     drhd = acpi_data_push(table_data, sizeof(*drhd) + ioapic_scope_size);
     drhd->type = cpu_to_le16(ACPI_DMAR_TYPE_HARDWARE_UNIT);
-    drhd->length = cpu_to_le16(sizeof(*drhd) + ioapic_scope_size);
-    drhd->flags = ACPI_DMAR_INCLUDE_PCI_ALL;
+    drhd->length =
+        cpu_to_le16(sizeof(*drhd) + ioapic_scope_size + scope_blob->len);
+    drhd->flags = 0;            /* Don't include all pci device */
     drhd->pci_segment = cpu_to_le16(0);
     drhd->address = cpu_to_le64(Q35_HOST_BRIDGE_IOMMU_ADDR);
 
@@ -1925,6 +1985,10 @@ build_dmar_q35(GArray *table_data, BIOSLinker *linker, const char *oem_id,
     scope->path[0].device = PCI_SLOT(Q35_PSEUDO_DEVFN_IOAPIC);
     scope->path[0].function = PCI_FUNC(Q35_PSEUDO_DEVFN_IOAPIC);
 
+    /* Add scope found above */
+    g_array_append_vals(table_data, scope_blob->data, scope_blob->len);
+    g_array_free(scope_blob, true);
+
     if (iommu->dt_supported) {
         atsr = acpi_data_push(table_data, sizeof(*atsr));
         atsr->type = cpu_to_le16(ACPI_DMAR_TYPE_ATSR);
-- 
2.19.1


