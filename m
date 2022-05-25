Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4FD534240
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 19:35:46 +0200 (CEST)
Received: from localhost ([::1]:57892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntuvB-0007ue-B2
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 13:35:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ntusT-0005Pi-Lg
 for qemu-devel@nongnu.org; Wed, 25 May 2022 13:32:57 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:52690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ntusR-0002HC-H7
 for qemu-devel@nongnu.org; Wed, 25 May 2022 13:32:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DCbE5pO9eTCFvrQ72Q+rerHjd3AdfK5v4mgVoKVeQG8=; b=LpP9+rjXVTTfns7fXgqsMe6ECu
 /m1MZGLRgnD+op4eI6KV3hvo1QdtT08PjQsry6umuxuAvHbgJYwWBGnjCnyGz7wILoLom2jnTMJFN
 WTE6pETnjP0wrJyNuYU2Ynol8h5ty5NqU7jlZ5RDWGQiRWGswtPP29cDKXOsR3wbAfY81gZ+K8uK3
 u41ohS7TaiGbKFtvTTwIiLkWk1pG7hb9hsz/dtilH6EuS9+myqgYnSySuTlsrDSB33k2O0egDLblV
 9zje9hbTA6zWDOjm1RipB8tRLmeEIryVIUUP7fjCgApftZK/0+SzLGazLsgsSYrYOy60Ik7PTVORv
 vLB2HzXU4784MF4I8M/040G9egHI82P6x1kyIJXpBKgW2YB85Qq+TJom9N2of2+rkeI4u2S95n9Oz
 ciE13busv8HuZ9bL2xNHqhtvq131QIQ7wyKkrtV/4xRx1mAj/6wmT+ZfvhQHXSg/5nFRNA3/Db7Qr
 oWTwE8W4y1mdjfiTunsFhdiMK30FybWqqq+6gGqpih87EnTF1LRXh/wklQ5gfKmOh2Du5N/BBOlcv
 xTyRqkV105J5lcBFTRXmYsIAImVCqxiRV1nwI9k8PtTReWPVketRGAORQys5tTpWMBUDET18O6s0L
 8UUnnwjNkuJaJpAbKzEHOfkHgA5f1R9qm7DvzMQPU=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nturM-0006Pu-6c; Wed, 25 May 2022 18:31:52 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 jean-philippe@linaro.org, qemu-devel@nongnu.org
Date: Wed, 25 May 2022 18:32:29 +0100
Message-Id: <20220525173232.31429-4-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220525173232.31429-1-mark.cave-ayland@ilande.co.uk>
References: <20220525173232.31429-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 3/6] hw/acpi/viot: build array of PCI host bridges before
 generating VIOT ACPI table
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Reviewed-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/acpi/viot.c | 42 ++++++++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/hw/acpi/viot.c b/hw/acpi/viot.c
index 5dafcbf5ef..c32bbdd180 100644
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
 static int enumerate_pci_host_bridges(Object *obj, void *opaque)
 {
-    struct viot_pci_ranges *pci_ranges = opaque;
-    GArray *blob = pci_ranges->blob;
+    GArray *pci_host_ranges = opaque;
 
     if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
         PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
@@ -55,9 +53,11 @@ static int enumerate_pci_host_bridges(Object *obj, void *opaque)
 
             pci_bus_range(bus, &min_bus, &max_bus);
 
-            build_pci_host_range(blob, min_bus, max_bus,
-                                 pci_ranges->output_node);
-            pci_ranges->count++;
+            const struct viot_pci_host_range pci_host_range = {
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
     object_child_foreach_recursive(OBJECT(ms), enumerate_pci_host_bridges,
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


