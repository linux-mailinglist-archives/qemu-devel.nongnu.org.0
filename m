Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9192D326C45
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Feb 2021 09:37:32 +0100 (CET)
Received: from localhost ([::1]:51490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFv6R-0006ns-Jz
	for lists+qemu-devel@lfdr.de; Sat, 27 Feb 2021 03:37:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lFv3P-0004WR-BI; Sat, 27 Feb 2021 03:34:27 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lFv3J-0007vx-Cv; Sat, 27 Feb 2021 03:34:23 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DnfsT3cMxzjQyG;
 Sat, 27 Feb 2021 16:32:29 +0800 (CST)
Received: from huawei.com (10.174.185.226) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.498.0; Sat, 27 Feb 2021
 16:34:00 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC RESEND PATCH 4/4] hw/arm/virt-acpi-build: Add explicit idmap
 info in IORT table
Date: Sat, 27 Feb 2021 08:33:51 +0000
Message-ID: <1614414831-39712-5-git-send-email-wangxingang5@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
In-Reply-To: <1614414831-39712-1-git-send-email-wangxingang5@huawei.com>
References: <1614414831-39712-1-git-send-email-wangxingang5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.185.226]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=wangxingang5@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 wangxingang5@huawei.com, mst@redhat.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xingang Wang <wangxingang5@huawei.com>

The idmap of smmuv3 and root complex covers the whole RID space for now,
this patch add explicit idmap info according to root bus number range.
This add smmuv3 idmap for certain bus which has enabled the iommu property.

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
---
 hw/arm/virt-acpi-build.c | 92 ++++++++++++++++++++++++++++++----------
 1 file changed, 69 insertions(+), 23 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index f9c9df916c..38ab700ad9 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -54,6 +54,7 @@
 #include "kvm_arm.h"
 #include "migration/vmstate.h"
 #include "hw/acpi/ghes.h"
+#include "hw/pci/pci_bus.h"
 
 #define ARM_SPI_BASE 32
 
@@ -247,9 +248,36 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     AcpiIortSmmu3 *smmu;
     size_t node_size, iort_node_offset, iort_length, smmu_offset = 0;
     AcpiIortRC *rc;
+    PCIBus *bus = vms->bus;
+    GArray *root_bus_array;
+    size_t root_bus_count = 0;
+    size_t root_bus_smmu_count = 0;
+    int bus_num, max_bus, index;
+
+    root_bus_array = g_array_new(false, true, sizeof(PCIBus *));
 
     iort = acpi_data_push(table_data, sizeof(*iort));
 
+    g_array_append_val(root_bus_array, bus);
+    root_bus_count++;
+    if (vms->iommu == VIRT_IOMMU_SMMUV3 && pci_bus_has_iommu(bus)) {
+        root_bus_smmu_count++;
+    }
+
+    QLIST_FOREACH(bus, &bus->child, sibling) {
+
+        if (!pci_bus_is_root(bus)) {
+            continue;
+        }
+
+        g_array_append_val(root_bus_array, bus);
+        root_bus_count++;
+
+        if (vms->iommu == VIRT_IOMMU_SMMUV3 && pci_bus_has_iommu(bus)) {
+            root_bus_smmu_count++;
+        }
+    }
+
     if (vms->iommu == VIRT_IOMMU_SMMUV3) {
         nb_nodes = 3; /* RC, ITS, SMMUv3 */
     } else {
@@ -280,13 +308,13 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
         /* SMMUv3 node */
         smmu_offset = iort_node_offset + node_size;
-        node_size = sizeof(*smmu) + sizeof(*idmap);
+        node_size = sizeof(*smmu) + sizeof(*idmap) * root_bus_smmu_count;
         iort_length += node_size;
         smmu = acpi_data_push(table_data, node_size);
 
         smmu->type = ACPI_IORT_NODE_SMMU_V3;
         smmu->length = cpu_to_le16(node_size);
-        smmu->mapping_count = cpu_to_le32(1);
+        smmu->mapping_count = cpu_to_le32(root_bus_smmu_count);
         smmu->mapping_offset = cpu_to_le32(sizeof(*smmu));
         smmu->base_address = cpu_to_le64(vms->memmap[VIRT_SMMU].base);
         smmu->flags = cpu_to_le32(ACPI_IORT_SMMU_V3_COHACC_OVERRIDE);
@@ -295,23 +323,34 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         smmu->gerr_gsiv = cpu_to_le32(irq + 2);
         smmu->sync_gsiv = cpu_to_le32(irq + 3);
 
-        /* Identity RID mapping covering the whole input RID range */
-        idmap = &smmu->id_mapping_array[0];
-        idmap->input_base = 0;
-        idmap->id_count = cpu_to_le32(0xFFFF);
-        idmap->output_base = 0;
-        /* output IORT node is the ITS group node (the first node) */
-        idmap->output_reference = cpu_to_le32(iort_node_offset);
+        index = 0;
+        for (int i = 0; i < root_bus_count; i++) {
+            bus = g_array_index(root_bus_array, PCIBus *, i);
+
+            if (!pci_bus_has_iommu(bus)) {
+                continue;
+            }
+
+            bus_num = pci_bus_num(bus);
+            max_bus = pci_root_bus_max_bus(bus);
+
+            idmap = &smmu->id_mapping_array[index++];
+            idmap->input_base = cpu_to_le32(bus_num << 8);
+            idmap->id_count = cpu_to_le32((max_bus - bus_num + 1) << 8);
+            idmap->output_base = cpu_to_le32(bus_num << 8);
+            /* output IORT node is the ITS group node (the first node) */
+            idmap->output_reference = cpu_to_le32(iort_node_offset);
+        }
     }
 
     /* Root Complex Node */
-    node_size = sizeof(*rc) + sizeof(*idmap);
+    node_size = sizeof(*rc) + sizeof(*idmap) * root_bus_count;
     iort_length += node_size;
     rc = acpi_data_push(table_data, node_size);
 
     rc->type = ACPI_IORT_NODE_PCI_ROOT_COMPLEX;
     rc->length = cpu_to_le16(node_size);
-    rc->mapping_count = cpu_to_le32(1);
+    rc->mapping_count = cpu_to_le32(root_bus_count);
     rc->mapping_offset = cpu_to_le32(sizeof(*rc));
 
     /* fully coherent device */
@@ -319,18 +358,23 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     rc->memory_properties.memory_flags = 0x3; /* CCA = CPM = DCAS = 1 */
     rc->pci_segment_number = 0; /* MCFG pci_segment */
 
-    /* Identity RID mapping covering the whole input RID range */
-    idmap = &rc->id_mapping_array[0];
-    idmap->input_base = 0;
-    idmap->id_count = cpu_to_le32(0xFFFF);
-    idmap->output_base = 0;
-
-    if (vms->iommu == VIRT_IOMMU_SMMUV3) {
-        /* output IORT node is the smmuv3 node */
-        idmap->output_reference = cpu_to_le32(smmu_offset);
-    } else {
-        /* output IORT node is the ITS group node (the first node) */
-        idmap->output_reference = cpu_to_le32(iort_node_offset);
+    for (int i = 0; i < root_bus_count; i++) {
+        bus = g_array_index(root_bus_array, PCIBus *, i);
+        bus_num = pci_bus_num(bus);
+        max_bus = pci_root_bus_max_bus(bus);
+
+        idmap = &rc->id_mapping_array[i];
+        idmap->input_base = cpu_to_le32(bus_num << 8);
+        idmap->id_count = cpu_to_le32((max_bus - bus_num + 1) << 8);
+        idmap->output_base = cpu_to_le32(bus_num << 8);
+
+        if (vms->iommu == VIRT_IOMMU_SMMUV3 && pci_bus_has_iommu(bus)) {
+            /* output IORT node is the smmuv3 node */
+            idmap->output_reference = cpu_to_le32(smmu_offset);
+        } else {
+            /* output IORT node is the ITS group node (the first node) */
+            idmap->output_reference = cpu_to_le32(iort_node_offset);
+        }
     }
 
     /*
@@ -343,6 +387,8 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     build_header(linker, table_data, (void *)(table_data->data + iort_start),
                  "IORT", table_data->len - iort_start, 0, vms->oem_id,
                  vms->oem_table_id);
+
+    g_array_free(root_bus_array, true);
 }
 
 static void
-- 
2.19.1


