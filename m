Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 864BA3BFAD4
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 15:00:37 +0200 (CEST)
Received: from localhost ([::1]:34404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Tdq-0004Wo-W3
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 09:00:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1m1TZJ-0004LY-AV; Thu, 08 Jul 2021 08:55:53 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1m1TZE-0005eO-R0; Thu, 08 Jul 2021 08:55:53 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GLGQt3jrmzcb9v;
 Thu,  8 Jul 2021 20:52:22 +0800 (CST)
Received: from dggpemm500009.china.huawei.com (7.185.36.225) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 8 Jul 2021 20:55:31 +0800
Received: from huawei.com (10.174.185.226) by dggpemm500009.china.huawei.com
 (7.185.36.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 8 Jul 2021
 20:55:30 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <peter.maydell@linaro.org>,
 <ehabkost@redhat.com>, <richard.henderson@linaro.org>, <pbonzini@redhat.com>
Subject: [PATCH v5 6/9] hw/arm/virt-acpi-build: Add IORT support to bypass
 SMMUv3
Date: Thu, 8 Jul 2021 12:55:16 +0000
Message-ID: <1625748919-52456-7-git-send-email-wangxingang5@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
In-Reply-To: <1625748919-52456-1-git-send-email-wangxingang5@huawei.com>
References: <1625748919-52456-1-git-send-email-wangxingang5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.185.226]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangxingang5@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

When we build IORT table with SMMUv3 and bypass iommu feature enabled,
we can no longer setup one map from RC to SMMUv3 covering the whole RIDs.
We need to walk the PCI bus and check whether the root bus will bypass
iommu, setup RC -> SMMUv3 -> ITS map for RC which will not bypass iommu.

When a SMMUv3 node exist, we setup the idmap from SMMUv3 to ITS
covering the whole RIDs, and only modify the map from RC to SMMUv3.
We build RC -> SMMUv3 -> ITS map for root bus with bypass_iommu
disabled, and build idmap from RC to ITS directly for the rest of
the whole RID space.

For example we run qemu with command line:

qemu/build/aarch64-softmmu/qemu-system-aarch64 \
 -kernel arch/arm64/boot/Image \
 -enable-kvm \
 -cpu host \
 -m 8G \
 -smp 8,sockets=2,cores=4,threads=1 \
 -machine virt,kernel_irqchip=on,gic-version=3,iommu=smmuv3,default_bus_bypass_iommu=true \
 -drive file=./QEMU_EFI-pflash.raw,if=pflash,format=raw,unit=0,readonly=on \
 -device pxb-pcie,bus_nr=0x10,id=pci.10,bus=pcie.0,addr=0x3.0x1 \
 -device pxb-pcie,bus_nr=0x20,id=pci.20,bus=pcie.0,addr=0x3.0x2,bypass_iommu=true \
 -device pcie-root-port,port=0x20,chassis=1,id=pci.1,bus=pcie.0,addr=0x2 \
 -device pcie-root-port,port=0x20,chassis=11,id=pci.11,bus=pci.10,addr=0x1 \
 -device pcie-root-port,port=0x20,chassis=21,id=pci.21,bus=pci.20,addr=0x1 \
 -device virtio-scsi-pci,id=scsi0,bus=pci.1,addr=0x1 \
 -device virtio-scsi-pci,id=scsi1,bus=pci.11,addr=0x1 \
 -device virtio-scsi-pci,id=scsi2,bus=pci.21,addr=0x1 \
 -initrd /mnt/davinci/wxg/kill-linux/rootfs/mfs.cpio.gz \
 -nographic \
 -append "rdinit=init console=ttyAMA0 earlycon=pl011,0x9000000 nokaslr" \

And we get guest configuration:

-+-[0000:20]---01.0-[21]--
 +-[0000:10]---01.0-[11]--
 \-[0000:00]-+-00.0  Device 1b36:0008
             +-01.0  Device 1af4:1000
             \-02.0-[01]--

With bypass_iommu enabled, the attached devices will bypass iommu.

/sys/class/iommu/smmu3.0x0000000009050000/
|-- device -> ../../../arm-smmu-v3.0.auto
|-- devices
|   `-- 0000:10:01.0 -> ../../../../../pci0000:10/0000:10:01.0

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
---
 hw/arm/virt-acpi-build.c | 114 +++++++++++++++++++++++++++++++++++----
 1 file changed, 103 insertions(+), 11 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index f1024843dd..037cc1fd82 100644
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
@@ -239,23 +240,89 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
 }
 #endif
 
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
+
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
+    int i, nb_nodes, rc_mapping_count, iort_start = table_data->len;
     AcpiIortIdMapping *idmap;
     AcpiIortItsGroup *its;
     AcpiIortTable *iort;
     AcpiIortSmmu3 *smmu;
     size_t node_size, iort_node_offset, iort_length, smmu_offset = 0;
     AcpiIortRC *rc;
+    GArray *smmu_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
+    GArray *its_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
 
     iort = acpi_data_push(table_data, sizeof(*iort));
 
     if (vms->iommu == VIRT_IOMMU_SMMUV3) {
+        AcpiIortIdMapping next_range = {0};
+
+        object_child_foreach_recursive(object_get_root(),
+                                       iort_host_bridges, smmu_idmaps);
+
+        /* Sort the smmu idmap by input_base */
+        g_array_sort(smmu_idmaps, iort_idmap_compare);
+
+        /*
+         * Split the whole RIDs by mapping from RC to SMMU,
+         * build the ID mapping from RC to ITS directly.
+         */
+        for (i = 0; i < smmu_idmaps->len; i++) {
+            idmap = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
+
+            if (next_range.input_base < idmap->input_base) {
+                next_range.id_count = idmap->input_base - next_range.input_base;
+                g_array_append_val(its_idmaps, next_range);
+            }
+
+            next_range.input_base = idmap->input_base + idmap->id_count;
+        }
+
+        /* Append the last RC -> ITS ID mapping */
+        if (next_range.input_base < 0xFFFF) {
+            next_range.id_count = 0xFFFF - next_range.input_base;
+            g_array_append_val(its_idmaps, next_range);
+        }
+
         nb_nodes = 3; /* RC, ITS, SMMUv3 */
+        rc_mapping_count = smmu_idmaps->len + its_idmaps->len;
     } else {
         nb_nodes = 2; /* RC, ITS */
+        rc_mapping_count = 1;
     }
 
     iort_length = sizeof(*iort);
@@ -307,13 +374,13 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     }
 
     /* Root Complex Node */
-    node_size = sizeof(*rc) + sizeof(*idmap);
+    node_size = sizeof(*rc) + sizeof(*idmap) * rc_mapping_count;
     iort_length += node_size;
     rc = acpi_data_push(table_data, node_size);
 
     rc->type = ACPI_IORT_NODE_PCI_ROOT_COMPLEX;
     rc->length = cpu_to_le16(node_size);
-    rc->mapping_count = cpu_to_le32(1);
+    rc->mapping_count = cpu_to_le32(rc_mapping_count);
     rc->mapping_offset = cpu_to_le32(sizeof(*rc));
 
     /* fully coherent device */
@@ -321,20 +388,45 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     rc->memory_properties.memory_flags = 0x3; /* CCA = CPM = DCAS = 1 */
     rc->pci_segment_number = 0; /* MCFG pci_segment */
 
-    /* Identity RID mapping covering the whole input RID range */
-    idmap = &rc->id_mapping_array[0];
-    idmap->input_base = 0;
-    idmap->id_count = cpu_to_le32(0xFFFF);
-    idmap->output_base = 0;
-
     if (vms->iommu == VIRT_IOMMU_SMMUV3) {
-        /* output IORT node is the smmuv3 node */
-        idmap->output_reference = cpu_to_le32(smmu_offset);
+        AcpiIortIdMapping *range;
+
+        /* translated RIDs connect to SMMUv3 node: RC -> SMMUv3 -> ITS */
+        for (i = 0; i < smmu_idmaps->len; i++) {
+            idmap = &rc->id_mapping_array[i];
+            range = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
+
+            idmap->input_base = cpu_to_le32(range->input_base);
+            idmap->id_count = cpu_to_le32(range->id_count);
+            idmap->output_base = cpu_to_le32(range->input_base);
+            /* output IORT node is the smmuv3 node */
+            idmap->output_reference = cpu_to_le32(smmu_offset);
+        }
+
+        /* bypassed RIDs connect to ITS group node directly: RC -> ITS */
+        for (i = 0; i < its_idmaps->len; i++) {
+            idmap = &rc->id_mapping_array[smmu_idmaps->len + i];
+            range = &g_array_index(its_idmaps, AcpiIortIdMapping, i);
+
+            idmap->input_base = cpu_to_le32(range->input_base);
+            idmap->id_count = cpu_to_le32(range->id_count);
+            idmap->output_base = cpu_to_le32(range->input_base);
+            /* output IORT node is the ITS group node (the first node) */
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
 
+    g_array_free(smmu_idmaps, true);
+    g_array_free(its_idmaps, true);
+
     /*
      * Update the pointer address in case table_data->data moves during above
      * acpi_data_push operations.
-- 
2.19.1


