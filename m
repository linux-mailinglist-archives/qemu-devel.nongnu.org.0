Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2864352B8A4
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 13:23:36 +0200 (CEST)
Received: from localhost ([::1]:60840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrHmA-0002cM-T3
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 07:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nrHY9-0004aD-6W
 for qemu-devel@nongnu.org; Wed, 18 May 2022 07:09:05 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:40902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nrHY7-0007Ep-Fj
 for qemu-devel@nongnu.org; Wed, 18 May 2022 07:09:04 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nrHX3-000AVy-6Q; Wed, 18 May 2022 12:08:01 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 jean-philippe@linaro.org, qemu-devel@nongnu.org
Date: Wed, 18 May 2022 12:08:36 +0100
Message-Id: <20220518110839.8681-4-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220518110839.8681-1-mark.cave-ayland@ilande.co.uk>
References: <20220518110839.8681-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 3/6] hw/acpi/viot: build array of PCI host bridges before
 generating VIOT ACPI table
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

Perform the generation of the VIOT ACPI table in 2 separate passes: the first pass
enumerates all of the PCI host bridges and adds the min_bus and max_bus information
to an array.

Once this is done the VIOT table header is generated using the size of the array
to calculate the node count, which means it is no longer necessary to use a
sub-array to hold the PCI host bridge range information along with viommu_off.

Finally the PCI host bridge array is iterated again to add the required entries
to the final VIOT ACPI table.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/acpi/viot.c | 42 ++++++++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/hw/acpi/viot.c b/hw/acpi/viot.c
index 662124812f..ce3b7b8c75 100644
--- a/hw/acpi/viot.c
+++ b/hw/acpi/viot.c
@@ -10,10 +10,9 @@
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_host.h"
 
-struct viot_pci_ranges {
-    GArray *blob;
-    size_t count;
-    uint16_t output_node;
+struct viot_pci_host_range {
+    int min_bus;
+    int max_bus;
 };
 
 static void build_pci_host_range(GArray *table_data, int min_bus, int max_bus,
@@ -44,8 +43,7 @@ static void build_pci_host_range(GArray *table_data, int min_bus, int max_bus,
 /* Build PCI range for a given PCI host bridge */
 static int pci_host_bridges(Object *obj, void *opaque)
 {
-    struct viot_pci_ranges *pci_ranges = opaque;
-    GArray *blob = pci_ranges->blob;
+    GArray *pci_host_ranges = opaque;
 
     if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
         PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
@@ -55,9 +53,11 @@ static int pci_host_bridges(Object *obj, void *opaque)
 
             pci_bus_range(bus, &min_bus, &max_bus);
 
-            build_pci_host_range(blob, min_bus, max_bus,
-                                 pci_ranges->output_node);
-            pci_ranges->count++;
+            struct viot_pci_host_range pci_host_range = {
+                .min_bus = min_bus,
+                .max_bus = max_bus,
+            };
+            g_array_append_val(pci_host_ranges, pci_host_range);
         }
     }
 
@@ -78,19 +78,19 @@ void build_viot(MachineState *ms, GArray *table_data, BIOSLinker *linker,
     int viommu_off = 48;
     AcpiTable table = { .sig = "VIOT", .rev = 0,
                         .oem_id = oem_id, .oem_table_id = oem_table_id };
-    struct viot_pci_ranges pci_ranges = {
-        .output_node = viommu_off,
-        .blob = g_array_new(false, true /* clear */, 1),
-    };
+    GArray *pci_host_ranges =  g_array_new(false, true,
+                                           sizeof(struct viot_pci_host_range));
+    struct viot_pci_host_range *pci_host_range;
+    int i;
 
     /* Build the list of PCI ranges that this viommu manages */
     object_child_foreach_recursive(OBJECT(ms), pci_host_bridges,
-                                   &pci_ranges);
+                                   pci_host_ranges);
 
     /* ACPI table header */
     acpi_table_begin(&table, table_data);
     /* Node count */
-    build_append_int_noprefix(table_data, pci_ranges.count + 1, 2);
+    build_append_int_noprefix(table_data, pci_host_ranges->len + 1, 2);
     /* Node offset */
     build_append_int_noprefix(table_data, viommu_off, 2);
     /* Reserved */
@@ -111,9 +111,15 @@ void build_viot(MachineState *ms, GArray *table_data, BIOSLinker *linker,
     build_append_int_noprefix(table_data, 0, 8);
 
     /* PCI ranges found above */
-    g_array_append_vals(table_data, pci_ranges.blob->data,
-                        pci_ranges.blob->len);
-    g_array_free(pci_ranges.blob, true);
+    for (i = 0; i < pci_host_ranges->len; i++) {
+        pci_host_range = &g_array_index(pci_host_ranges,
+                                        struct viot_pci_host_range, i);
+
+        build_pci_host_range(table_data, pci_host_range->min_bus,
+                             pci_host_range->max_bus, viommu_off);
+    }
+
+    g_array_free(pci_host_ranges, true);
 
     acpi_table_end(linker, &table);
 }
-- 
2.20.1


