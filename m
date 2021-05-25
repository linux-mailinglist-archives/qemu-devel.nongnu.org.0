Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3BB38F914
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 05:56:40 +0200 (CEST)
Received: from localhost ([::1]:33678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llOBL-00054h-Tl
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 23:56:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1llO5N-0006T6-Nf; Mon, 24 May 2021 23:50:29 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1llO5J-0001sg-5j; Mon, 24 May 2021 23:50:29 -0400
Received: from dggems706-chm.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Fq0QW5cZmzwTKc;
 Tue, 25 May 2021 11:47:31 +0800 (CST)
Received: from dggpemm500009.china.huawei.com (7.185.36.225) by
 dggems706-chm.china.huawei.com (10.3.19.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 25 May 2021 11:50:15 +0800
Received: from huawei.com (10.174.185.226) by dggpemm500009.china.huawei.com
 (7.185.36.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 25 May
 2021 11:50:14 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <peter.maydell@linaro.org>,
 <ehabkost@redhat.com>, <richard.henderson@linaro.org>, <pbonzini@redhat.com>
Subject: [PATCH v4 6/8] hw/arm/virt-acpi-build: Add explicit IORT idmap for
 smmuv3 node
Date: Tue, 25 May 2021 03:50:03 +0000
Message-ID: <1621914605-14724-7-git-send-email-wangxingang5@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
In-Reply-To: <1621914605-14724-1-git-send-email-wangxingang5@huawei.com>
References: <1621914605-14724-1-git-send-email-wangxingang5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.185.226]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=wangxingang5@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: xieyingtai@huawei.com, wangxingang5@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xingang Wang <wangxingang5@huawei.com>

This add explicit IORT idmap info according to pci root bus number
range, and only add smmu idmap for those which does not bypass iommu.

For idmap directly to ITS node, this split the whole RID mapping to
smmu idmap and its idmap. So this should cover the whole idmap for
through/bypass SMMUv3 node.

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
---
 hw/arm/virt-acpi-build.c | 135 +++++++++++++++++++++++++++++++++------
 1 file changed, 116 insertions(+), 19 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 60fe2e65a7..f63a57dcfa 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -44,6 +44,7 @@
 #include "hw/acpi/tpm.h"
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pci.h"
+#include "hw/pci/pci_bus.h"
 #include "hw/pci-host/gpex.h"
 #include "hw/arm/virt.h"
 #include "hw/mem/nvdimm.h"
@@ -237,16 +238,82 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
     aml_append(scope, dev);
 }
 
+/* Build the iort ID mapping to SMMUv3 for a given PCI host bridge */
+static int
+iort_host_bridges(Object *obj, void *opaque)
+{
+    GArray *idmap_blob = opaque;
+
+    if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
+        PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
+
+        if (bus && !pci_bus_bypass_iommu(bus)) {
+            int min_bus, max_bus;
+            pci_bus_range(bus, &min_bus, &max_bus);
+
+            AcpiIortIdMapping idmap = {
+                .input_base = min_bus << 8,
+                .id_count = (max_bus - min_bus + 1) << 8,
+            };
+            g_array_append_val(idmap_blob, idmap);
+        }
+    }
+
+    return 0;
+}
+
+static int iort_idmap_compare(gconstpointer a, gconstpointer b)
+{
+    AcpiIortIdMapping *idmap_a = (AcpiIortIdMapping *)a;
+    AcpiIortIdMapping *idmap_b = (AcpiIortIdMapping *)b;
+
+    return idmap_a->input_base - idmap_b->input_base;
+}
+
 static void
 build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
-    int nb_nodes, iort_start = table_data->len;
-    AcpiIortIdMapping *idmap;
+    int i, nb_nodes, rc_map_count, iort_start = table_data->len;
+    AcpiIortIdMapping *idmap, *range;
     AcpiIortItsGroup *its;
     AcpiIortTable *iort;
     AcpiIortSmmu3 *smmu;
     size_t node_size, iort_node_offset, iort_length, smmu_offset = 0;
     AcpiIortRC *rc;
+    GArray *smmu_idmap_ranges =
+        g_array_new(false, true, sizeof(AcpiIortIdMapping));
+    GArray *its_idmap_ranges =
+        g_array_new(false, true, sizeof(AcpiIortIdMapping));
+
+    object_child_foreach_recursive(object_get_root(),
+                                   iort_host_bridges, smmu_idmap_ranges);
+
+    g_array_sort(smmu_idmap_ranges, iort_idmap_compare);
+
+    AcpiIortIdMapping next_range = {
+        .input_base = 0,
+    };
+
+    /*
+     * Build the iort ID mapping to ITS directly,
+     * split the whole RID input range by RID mapping to SMMU node
+     */
+    for (i = 0; i < smmu_idmap_ranges->len; i++) {
+        idmap = &g_array_index(smmu_idmap_ranges, AcpiIortIdMapping, i);
+
+        if (next_range.input_base < idmap->input_base) {
+            next_range.id_count = idmap->input_base - next_range.input_base;
+            g_array_append_val(its_idmap_ranges, next_range);
+        }
+
+        next_range.input_base = idmap->input_base + idmap->id_count;
+    }
+
+    /* Append the last ITS ID mapping */
+    if (next_range.input_base < 0xFFFF) {
+        next_range.id_count = 0xFFFF - next_range.input_base;
+        g_array_append_val(its_idmap_ranges, next_range);
+    }
 
     iort = acpi_data_push(table_data, sizeof(*iort));
 
@@ -280,13 +347,13 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
         /* SMMUv3 node */
         smmu_offset = iort_node_offset + node_size;
-        node_size = sizeof(*smmu) + sizeof(*idmap);
+        node_size = sizeof(*smmu) + sizeof(*idmap) * smmu_idmap_ranges->len;
         iort_length += node_size;
         smmu = acpi_data_push(table_data, node_size);
 
         smmu->type = ACPI_IORT_NODE_SMMU_V3;
         smmu->length = cpu_to_le16(node_size);
-        smmu->mapping_count = cpu_to_le32(1);
+        smmu->mapping_count = cpu_to_le32(smmu_idmap_ranges->len);
         smmu->mapping_offset = cpu_to_le32(sizeof(*smmu));
         smmu->base_address = cpu_to_le64(vms->memmap[VIRT_SMMU].base);
         smmu->flags = cpu_to_le32(ACPI_IORT_SMMU_V3_COHACC_OVERRIDE);
@@ -295,23 +362,32 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         smmu->sync_gsiv = cpu_to_le32(irq + 2);
         smmu->gerr_gsiv = cpu_to_le32(irq + 3);
 
-        /* Identity RID mapping covering the whole input RID range */
-        idmap = &smmu->id_mapping_array[0];
-        idmap->input_base = 0;
-        idmap->id_count = cpu_to_le32(0xFFFF);
-        idmap->output_base = 0;
         /* output IORT node is the ITS group node (the first node) */
-        idmap->output_reference = cpu_to_le32(iort_node_offset);
+        for (i = 0; i < smmu_idmap_ranges->len; i++) {
+            idmap = &smmu->id_mapping_array[i];
+            range = &g_array_index(smmu_idmap_ranges, AcpiIortIdMapping, i);
+
+            idmap->input_base = cpu_to_le32(range->input_base);
+            idmap->id_count = cpu_to_le32(range->id_count);
+            idmap->output_base = cpu_to_le32(range->input_base);
+            idmap->output_reference = cpu_to_le32(iort_node_offset);
+        }
     }
 
     /* Root Complex Node */
-    node_size = sizeof(*rc) + sizeof(*idmap);
+    if (vms->iommu == VIRT_IOMMU_SMMUV3) {
+        rc_map_count = smmu_idmap_ranges->len + its_idmap_ranges->len;
+    } else {
+        rc_map_count = 1;
+    }
+
+    node_size = sizeof(*rc) + sizeof(*idmap) * rc_map_count;
     iort_length += node_size;
     rc = acpi_data_push(table_data, node_size);
 
     rc->type = ACPI_IORT_NODE_PCI_ROOT_COMPLEX;
     rc->length = cpu_to_le16(node_size);
-    rc->mapping_count = cpu_to_le32(1);
+    rc->mapping_count = cpu_to_le32(rc_map_count);
     rc->mapping_offset = cpu_to_le32(sizeof(*rc));
 
     /* fully coherent device */
@@ -319,20 +395,41 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     rc->memory_properties.memory_flags = 0x3; /* CCA = CPM = DCAS = 1 */
     rc->pci_segment_number = 0; /* MCFG pci_segment */
 
-    /* Identity RID mapping covering the whole input RID range */
-    idmap = &rc->id_mapping_array[0];
-    idmap->input_base = 0;
-    idmap->id_count = cpu_to_le32(0xFFFF);
-    idmap->output_base = 0;
-
     if (vms->iommu == VIRT_IOMMU_SMMUV3) {
         /* output IORT node is the smmuv3 node */
-        idmap->output_reference = cpu_to_le32(smmu_offset);
+        for (i = 0; i < smmu_idmap_ranges->len; i++) {
+            idmap = &rc->id_mapping_array[i];
+            range = &g_array_index(smmu_idmap_ranges, AcpiIortIdMapping, i);
+
+            idmap->input_base = cpu_to_le32(range->input_base);
+            idmap->id_count = cpu_to_le32(range->id_count);
+            idmap->output_base = cpu_to_le32(range->input_base);
+            idmap->output_reference = cpu_to_le32(smmu_offset);
+        }
+
+        /* output IORT node is the ITS group node (the first node) */
+        for (i = 0; i < its_idmap_ranges->len; i++) {
+            idmap = &rc->id_mapping_array[smmu_idmap_ranges->len + i];
+            range = &g_array_index(its_idmap_ranges, AcpiIortIdMapping, i);
+
+            idmap->input_base = cpu_to_le32(range->input_base);
+            idmap->id_count = cpu_to_le32(range->id_count);
+            idmap->output_base = cpu_to_le32(range->input_base);
+            idmap->output_reference = cpu_to_le32(iort_node_offset);
+        }
     } else {
+        /* Identity RID mapping covering the whole input RID range */
+        idmap = &rc->id_mapping_array[0];
+        idmap->input_base = cpu_to_le32(0);
+        idmap->id_count = cpu_to_le32(0xFFFF);
+        idmap->output_base = cpu_to_le32(0);
         /* output IORT node is the ITS group node (the first node) */
         idmap->output_reference = cpu_to_le32(iort_node_offset);
     }
 
+    g_array_free(smmu_idmap_ranges, true);
+    g_array_free(its_idmap_ranges, true);
+
     /*
      * Update the pointer address in case table_data->data moves during above
      * acpi_data_push operations.
-- 
2.19.1


