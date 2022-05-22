Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A33355303ED
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 17:54:00 +0200 (CEST)
Received: from localhost ([::1]:52966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsnu3-0001eW-IZ
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 11:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsnqe-0007Ct-MU
 for qemu-devel@nongnu.org; Sun, 22 May 2022 11:50:28 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsnqd-00080Z-1f
 for qemu-devel@nongnu.org; Sun, 22 May 2022 11:50:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Bc/VAudqIr1GwivhlLt77+4T8Jdd4YY2naMJX3sS0Hk=; b=Jy9nv0gXuEAxsvH5OBoloZRc9R
 CdzgvVTAumYja6K7Nosp1YZxOWYWQCnNmcLqT2+82dGjT5/4XoMP2fR8sGq1J6/NSpVogZ+8QWDW9
 aubGsPsFq0dmofaSXuHdnrUNecCXV50K8yeB0wmI5RZ2nOy1OSKvBYeZdaNsOQUU/NbTM5Rp/ZVLv
 tsnWTRo1Fc8105BV5pIzPeqwuMKlc5xmR2cd6kWDSuMsEgUdLtYok6SRXZroAoHNrxIQ4Fnw7O6+4
 2hCDKAR1j+8LBNMouyBZQWCoPyE0LkNAbAqnciJfq/m4yGwIzhly4BhIWP1zpnUpussTgAGkWO3yB
 vwyLJY0ZmwOECo+89VDKxbUKUin7N5aVLFoOzDIzTgLFE3Dhnzz6M+F9UrsQ87QgV590SyuNADk+0
 A+wS0Xap/XXpjQLJqy4OFwTQqlw+aUhz5rQoP4lGikFh1Q1TpDrwKiLPtmzAkM3JUs0lxPTxtTAhe
 4iaorNUMd00brBR9Osgb0Llq4MaGlbS4H88cV+RFsb9NkPxkACCl2HGpTe8C1kdJeZSpEcJaYvsNH
 yT6uLrExS9uqM+NzEJete6igAfJSuFakf5x06FMfzWYIVijipp36a3TFpXoOmkQh9iy3SPh0S0N6v
 PcaYeeb3LZTvcQK6+sSAJNv7GjqowOtRVHg8qm9zs=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsnpZ-0006zJ-9e; Sun, 22 May 2022 16:49:25 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 jean-philippe@linaro.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 16:50:05 +0100
Message-Id: <20220522155008.21832-4-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522155008.21832-1-mark.cave-ayland@ilande.co.uk>
References: <20220522155008.21832-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 3/6] hw/acpi/viot: build array of PCI host bridges before
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
---
 hw/acpi/viot.c | 42 ++++++++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/hw/acpi/viot.c b/hw/acpi/viot.c
index 5dafcbf5ef..6ca041d18e 100644
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


