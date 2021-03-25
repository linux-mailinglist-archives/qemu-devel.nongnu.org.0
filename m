Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA1A348A2A
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 08:28:01 +0100 (CET)
Received: from localhost ([::1]:35534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPKPQ-0001Rt-6x
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 03:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lPKKy-0004Tm-NG; Thu, 25 Mar 2021 03:23:24 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lPKKw-00032j-A8; Thu, 25 Mar 2021 03:23:24 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F5c3L0kwRz19JDy;
 Thu, 25 Mar 2021 15:21:18 +0800 (CST)
Received: from huawei.com (10.174.185.226) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.498.0; Thu, 25 Mar 2021
 15:23:08 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <peter.maydell@linaro.org>,
 <ehabkost@redhat.com>, <richard.henderson@linaro.org>, <pbonzini@redhat.com>
Subject: [PATCH RFC RESEND v2 4/6] hw/arm/virt-acpi-build: Add explicit idmap
 info in IORT table
Date: Thu, 25 Mar 2021 07:22:43 +0000
Message-ID: <1616656965-23328-5-git-send-email-wangxingang5@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
In-Reply-To: <1616656965-23328-1-git-send-email-wangxingang5@huawei.com>
References: <1616656965-23328-1-git-send-email-wangxingang5@huawei.com>
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
Cc: xieyingtai@huawei.com, cenjiahui@huawei.com, wangxingang5@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xingang Wang <wangxingang5@huawei.com>

The idmap of smmuv3 and root complex covers the whole RID space for now,
this patch add explicit idmap info according to root bus number range.
This add smmuv3 idmap for certain bus which has enabled the iommu property.

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
---
 hw/arm/virt-acpi-build.c | 103 ++++++++++++++++++++++++++++++---------
 1 file changed, 81 insertions(+), 22 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index f5a2b2d4cb..5491036c86 100644
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
@@ -237,6 +238,41 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
     aml_append(scope, dev);
 }
 
+typedef
+struct AcpiIortMapping {
+    AcpiIortIdMapping idmap;
+    bool iommu;
+} AcpiIortMapping;
+
+/* For all PCI host bridges, walk and insert DMAR scope */
+static int
+iort_host_bridges(Object *obj, void *opaque)
+{
+    GArray *map_blob = opaque;
+    AcpiIortMapping map;
+    AcpiIortIdMapping *idmap = &map.idmap;
+    int bus_num, max_bus;
+
+    if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
+        PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
+
+        if (bus) {
+            bus_num = pci_bus_num(bus);
+            max_bus = pci_root_bus_max_bus(bus);
+
+            idmap->input_base = cpu_to_le32(bus_num << 8);
+            idmap->id_count = cpu_to_le32((max_bus - bus_num + 1) << 8);
+            idmap->output_base = cpu_to_le32(bus_num << 8);
+            idmap->flags = cpu_to_le32(0);
+
+            map.iommu = pci_root_bus_has_iommu(bus);
+            g_array_append_val(map_blob, map);
+        }
+    }
+
+    return 0;
+}
+
 static void
 build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
@@ -247,6 +283,21 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     AcpiIortSmmu3 *smmu;
     size_t node_size, iort_node_offset, iort_length, smmu_offset = 0;
     AcpiIortRC *rc;
+    int smmu_mapping_count;
+    GArray *map_blob = g_array_new(false, true, sizeof(AcpiIortMapping));
+    AcpiIortMapping *map;
+
+    /* pci_for_each_bus(vms->bus, insert_map, map_blob); */
+    object_child_foreach_recursive(object_get_root(),
+                                   iort_host_bridges, map_blob);
+
+    smmu_mapping_count = 0;
+    for (int i = 0; i < map_blob->len; i++) {
+        map = &g_array_index(map_blob, AcpiIortMapping, i);
+        if (map->iommu) {
+            smmu_mapping_count++;
+        }
+    }
 
     iort = acpi_data_push(table_data, sizeof(*iort));
 
@@ -280,13 +331,13 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
         /* SMMUv3 node */
         smmu_offset = iort_node_offset + node_size;
-        node_size = sizeof(*smmu) + sizeof(*idmap);
+        node_size = sizeof(*smmu) + sizeof(*idmap) * smmu_mapping_count;
         iort_length += node_size;
         smmu = acpi_data_push(table_data, node_size);
 
         smmu->type = ACPI_IORT_NODE_SMMU_V3;
         smmu->length = cpu_to_le16(node_size);
-        smmu->mapping_count = cpu_to_le32(1);
+        smmu->mapping_count = cpu_to_le32(smmu_mapping_count);
         smmu->mapping_offset = cpu_to_le32(sizeof(*smmu));
         smmu->base_address = cpu_to_le64(vms->memmap[VIRT_SMMU].base);
         smmu->flags = cpu_to_le32(ACPI_IORT_SMMU_V3_COHACC_OVERRIDE);
@@ -295,23 +346,28 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         smmu->gerr_gsiv = cpu_to_le32(irq + 2);
         smmu->sync_gsiv = cpu_to_le32(irq + 3);
 
-        /* Identity RID mapping covering the whole input RID range */
-        idmap = &smmu->id_mapping_array[0];
-        idmap->input_base = 0;
-        idmap->id_count = cpu_to_le32(0xFFFF);
-        idmap->output_base = 0;
-        /* output IORT node is the ITS group node (the first node) */
-        idmap->output_reference = cpu_to_le32(iort_node_offset);
+        for (int i = 0, j = 0; i < map_blob->len; i++) {
+            map = &g_array_index(map_blob, AcpiIortMapping, i);
+
+            if (!map->iommu) {
+                continue;
+            }
+
+            idmap = &smmu->id_mapping_array[j++];
+            *idmap = map->idmap;
+            /* output IORT node is the ITS group node (the first node) */
+            idmap->output_reference = cpu_to_le32(iort_node_offset);
+        }
     }
 
     /* Root Complex Node */
-    node_size = sizeof(*rc) + sizeof(*idmap);
+    node_size = sizeof(*rc) + sizeof(*idmap) * map_blob->len;
     iort_length += node_size;
     rc = acpi_data_push(table_data, node_size);
 
     rc->type = ACPI_IORT_NODE_PCI_ROOT_COMPLEX;
     rc->length = cpu_to_le16(node_size);
-    rc->mapping_count = cpu_to_le32(1);
+    rc->mapping_count = cpu_to_le32(map_blob->len);
     rc->mapping_offset = cpu_to_le32(sizeof(*rc));
 
     /* fully coherent device */
@@ -319,20 +375,23 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     rc->memory_properties.memory_flags = 0x3; /* CCA = CPM = DCAS = 1 */
     rc->pci_segment_number = 0; /* MCFG pci_segment */
 
-    /* Identity RID mapping covering the whole input RID range */
-    idmap = &rc->id_mapping_array[0];
-    idmap->input_base = 0;
-    idmap->id_count = cpu_to_le32(0xFFFF);
-    idmap->output_base = 0;
+    for (int i = 0; i < map_blob->len; i++) {
+        map = &g_array_index(map_blob, AcpiIortMapping, i);
+        idmap = &rc->id_mapping_array[i];
 
-    if (vms->iommu == VIRT_IOMMU_SMMUV3) {
-        /* output IORT node is the smmuv3 node */
-        idmap->output_reference = cpu_to_le32(smmu_offset);
-    } else {
-        /* output IORT node is the ITS group node (the first node) */
-        idmap->output_reference = cpu_to_le32(iort_node_offset);
+        *idmap = map->idmap;
+
+        if (vms->iommu == VIRT_IOMMU_SMMUV3 && map->iommu) {
+            /* output IORT node is the smmuv3 node */
+            idmap->output_reference = cpu_to_le32(smmu_offset);
+        } else {
+            /* output IORT node is the ITS group node (the first node) */
+            idmap->output_reference = cpu_to_le32(iort_node_offset);
+        }
     }
 
+    g_array_free(map_blob, true);
+
     /*
      * Update the pointer address in case table_data->data moves during above
      * acpi_data_push operations.
-- 
2.19.1


