Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D2C52B866
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 13:18:25 +0200 (CEST)
Received: from localhost ([::1]:53352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrHhA-0005ha-Dj
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 07:18:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nrHY3-0004XO-LR
 for qemu-devel@nongnu.org; Wed, 18 May 2022 07:08:59 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:40892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nrHY2-0007EP-2G
 for qemu-devel@nongnu.org; Wed, 18 May 2022 07:08:59 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nrHWy-000AVy-Vd; Wed, 18 May 2022 12:07:57 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 jean-philippe@linaro.org, qemu-devel@nongnu.org
Date: Wed, 18 May 2022 12:08:35 +0100
Message-Id: <20220518110839.8681-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220518110839.8681-1-mark.cave-ayland@ilande.co.uk>
References: <20220518110839.8681-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 2/6] hw/acpi/viot: move the individual PCI host bridge entry
 generation to a new function
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

Instead of generating each table entry inline, move the individual PCI host bridge
table entry generation to a separate build_pci_host_range() function.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/acpi/viot.c | 48 +++++++++++++++++++++++++++---------------------
 1 file changed, 27 insertions(+), 21 deletions(-)

diff --git a/hw/acpi/viot.c b/hw/acpi/viot.c
index 2897aa8c88..662124812f 100644
--- a/hw/acpi/viot.c
+++ b/hw/acpi/viot.c
@@ -16,6 +16,31 @@ struct viot_pci_ranges {
     uint16_t output_node;
 };
 
+static void build_pci_host_range(GArray *table_data, int min_bus, int max_bus,
+                                 uint16_t output_node)
+{
+    /* Type */
+    build_append_int_noprefix(table_data, 1 /* PCI range */, 1);
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0, 1);
+    /* Length */
+    build_append_int_noprefix(table_data, 24, 2);
+    /* Endpoint start */
+    build_append_int_noprefix(table_data, PCI_BUILD_BDF(min_bus, 0), 4);
+    /* PCI Segment start */
+    build_append_int_noprefix(table_data, 0, 2);
+    /* PCI Segment end */
+    build_append_int_noprefix(table_data, 0, 2);
+    /* PCI BDF start */
+    build_append_int_noprefix(table_data, PCI_BUILD_BDF(min_bus, 0), 2);
+    /* PCI BDF end */
+    build_append_int_noprefix(table_data, PCI_BUILD_BDF(max_bus, 0xff), 2);
+    /* Output node */
+    build_append_int_noprefix(table_data, output_node, 2);
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0, 6);
+}
+
 /* Build PCI range for a given PCI host bridge */
 static int pci_host_bridges(Object *obj, void *opaque)
 {
@@ -30,27 +55,8 @@ static int pci_host_bridges(Object *obj, void *opaque)
 
             pci_bus_range(bus, &min_bus, &max_bus);
 
-            /* Type */
-            build_append_int_noprefix(blob, 1 /* PCI range */, 1);
-            /* Reserved */
-            build_append_int_noprefix(blob, 0, 1);
-            /* Length */
-            build_append_int_noprefix(blob, 24, 2);
-            /* Endpoint start */
-            build_append_int_noprefix(blob, PCI_BUILD_BDF(min_bus, 0), 4);
-            /* PCI Segment start */
-            build_append_int_noprefix(blob, 0, 2);
-            /* PCI Segment end */
-            build_append_int_noprefix(blob, 0, 2);
-            /* PCI BDF start */
-            build_append_int_noprefix(blob, PCI_BUILD_BDF(min_bus, 0), 2);
-            /* PCI BDF end */
-            build_append_int_noprefix(blob, PCI_BUILD_BDF(max_bus, 0xff), 2);
-            /* Output node */
-            build_append_int_noprefix(blob, pci_ranges->output_node, 2);
-            /* Reserved */
-            build_append_int_noprefix(blob, 0, 6);
-
+            build_pci_host_range(blob, min_bus, max_bus,
+                                 pci_ranges->output_node);
             pci_ranges->count++;
         }
     }
-- 
2.20.1


