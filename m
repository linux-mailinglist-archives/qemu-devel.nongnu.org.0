Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F17D52B864
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 13:17:10 +0200 (CEST)
Received: from localhost ([::1]:51252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrHfx-00046R-08
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 07:17:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nrHYF-0004hc-JE
 for qemu-devel@nongnu.org; Wed, 18 May 2022 07:09:20 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:40922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nrHYE-0007H4-2H
 for qemu-devel@nongnu.org; Wed, 18 May 2022 07:09:11 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nrHXB-000AVy-LT; Wed, 18 May 2022 12:08:09 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 jean-philippe@linaro.org, qemu-devel@nongnu.org
Date: Wed, 18 May 2022 12:08:38 +0100
Message-Id: <20220518110839.8681-6-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220518110839.8681-1-mark.cave-ayland@ilande.co.uk>
References: <20220518110839.8681-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 5/6] hw/acpi/viot: sort VIOT ACPI table entries by PCI host
 bus min_bus
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

This ensures that the VIOT ACPI table output is always stable for a given PCI
topology by ensuring that entries are ordered according to min_bus.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/acpi/viot.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/hw/acpi/viot.c b/hw/acpi/viot.c
index ce3b7b8c75..f5714b95bd 100644
--- a/hw/acpi/viot.c
+++ b/hw/acpi/viot.c
@@ -64,6 +64,20 @@ static int pci_host_bridges(Object *obj, void *opaque)
     return 0;
 }
 
+static int pci_host_range_compare(gconstpointer a, gconstpointer b)
+{
+    struct viot_pci_host_range *range_a = (struct viot_pci_host_range *)a;
+    struct viot_pci_host_range *range_b = (struct viot_pci_host_range *)b;
+
+    if (range_a->min_bus < range_b->min_bus) {
+        return -1;
+    } else if (range_a->min_bus > range_b->min_bus) {
+        return 1;
+    } else {
+        return 0;
+    }
+}
+
 /*
  * Generate a VIOT table with one PCI-based virtio-iommu that manages PCI
  * endpoints.
@@ -87,6 +101,9 @@ void build_viot(MachineState *ms, GArray *table_data, BIOSLinker *linker,
     object_child_foreach_recursive(OBJECT(ms), pci_host_bridges,
                                    pci_host_ranges);
 
+    /* Sort the pci host ranges by min_bus */
+    g_array_sort(pci_host_ranges, pci_host_range_compare);
+
     /* ACPI table header */
     acpi_table_begin(&table, table_data);
     /* Node count */
-- 
2.20.1


