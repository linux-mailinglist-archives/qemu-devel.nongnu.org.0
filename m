Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8929C534257
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 19:44:11 +0200 (CEST)
Received: from localhost ([::1]:42256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntv3K-00004x-Lz
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 13:44:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ntusQ-0005Ob-Fu
 for qemu-devel@nongnu.org; Wed, 25 May 2022 13:32:55 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:52680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ntusN-0002Gn-DK
 for qemu-devel@nongnu.org; Wed, 25 May 2022 13:32:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1AlXwSipa/QydQbhCNvAwQqBiE+wqLc0gwT8RKCGB+o=; b=LECDagfIxujjqgEaGHqDQJk+uL
 BuCpimx+5s8JW5N264NnlmTXSgUZ91zYlyL/z0Q+eYSTlT0ZnnBlTPdxS9SaIuM6RygRK0oaIBI3B
 a24+UIgmAwEAFmJjEpWFTFtvS/wuPotw16TRDQgTE/wEqC1qwpQqSW9kttYL2tL12koUCHrXCm7T+
 0inf3fkb+a8wfBcMWVNHe1XjYVPTzkbMJ3l6RaY7OjRy1nAA1OWV+Ynnn2QOlkC3ycjZ8tdiwQ1/N
 rCtgWH5wYDBm69u/cjUcfuzAbtgLtnHKaUNs/k1tIPcaZukVSh+0wmq4SGBAzGk5azqGGROxmnteO
 tVhaVBgTM5ueI1N7UbplJW9RwEhJ5InQTIKkD7jM0VuA7d6ftUxlgSIMjTjGqiiDyLb7I2MJyRo/I
 Ey/RbTUmSDLWpIK+aSGeGIBSmTbTL47fnPg4eRlmZAGDphzPA3TQABix3k+GTuHGNUzCerZ6Wq6KS
 2g6xOi+gv5p1/i0bDof4p5UwMSCYF3PaMKuAddYr0sIUwYDVwt1lp2KZer7Bc/Wn11EDcbabPZTOU
 EBHGee/AE5w47VPcNZYXlEtO2loDcBl3iN3OoCOw39ENyJ3zSI0N2QqLrE5sHMEKMd/4yWSu8Pw9R
 6L2PKW3HwL44oNIOmPOo/KVxnaCskPvQzZLGN0WUY=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nturH-0006Pu-Ui; Wed, 25 May 2022 18:31:48 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 jean-philippe@linaro.org, qemu-devel@nongnu.org
Date: Wed, 25 May 2022 18:32:28 +0100
Message-Id: <20220525173232.31429-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220525173232.31429-1-mark.cave-ayland@ilande.co.uk>
References: <20220525173232.31429-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 2/6] hw/acpi/viot: move the individual PCI host bridge
 entry generation to a new function
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

Instead of generating each table entry inline, move the individual PCI host bridge
table entry generation to a separate build_pci_host_range() function.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/acpi/viot.c | 48 +++++++++++++++++++++++++++---------------------
 1 file changed, 27 insertions(+), 21 deletions(-)

diff --git a/hw/acpi/viot.c b/hw/acpi/viot.c
index a41daded71..5dafcbf5ef 100644
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
 static int enumerate_pci_host_bridges(Object *obj, void *opaque)
 {
@@ -30,27 +55,8 @@ static int enumerate_pci_host_bridges(Object *obj, void *opaque)
 
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


