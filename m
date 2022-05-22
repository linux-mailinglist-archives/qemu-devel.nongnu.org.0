Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DD45303EE
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 17:54:01 +0200 (CEST)
Received: from localhost ([::1]:53016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsnu4-0001hS-Ee
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 11:54:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsnqb-0007BS-OO
 for qemu-devel@nongnu.org; Sun, 22 May 2022 11:50:25 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsnqZ-0007yt-NK
 for qemu-devel@nongnu.org; Sun, 22 May 2022 11:50:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CXd/zN/IKcBEtoTpKcM2kW0cXnnHtzwvxyKth+q7Un4=; b=HtTfFJo7kgOnv8ljotfPrhUsLo
 fWXs0K+ZzRdlf+Sbu3Yltx466NPfKhmJTWMYZLG6opRnmdQXZWbJYsk9V92G7JQF0ahraRS/5ObKz
 WyKYYpeSzr97ZVyFq9tXm2GNY14kC4TEbfRb8LEn4upkU1/6Ljo2et/g/suG4bOOHV1AkJqNOFtmI
 fLd+QhETM6As8iT6FlJE+ZFSkbndOcxt4nHGoDo7oVRZAq41qUCs1A8Iewjs+ABH5dfKRfXidZiTP
 NBVUmGwOJL0XYZEEgjue6f68yr1iTQ/onBf9AeZm4S4SjG8n262z3+WiXHB8DQ5CVSLdZjNvxTAac
 EjnEXSw4E6ABsSF9X7FVnmgZUyWXnan3Cvl+PHD4lKb443C4C7mkvkPL+1n4aMQIH7BDEH5je2Bkq
 9riYnSVLSbnhSKx/pNdWkfHQGi7DIorL0toGVx/QmDTP6YoLCsUB6ZLwEqAL393RLta6J+JsKOnvU
 XROfPoEJTDTReNOSpHR/PAvQ051sjHcrORvlZxFun0TTvzMslhSrt2smiQ8/9uwSs1OGHmWwTvYrI
 X/qEshqEsOr64OzgTvpFAw8RAVZWNMxloQTwGBR/A5Ow/tCTNOuDGTLwhGRa6Md6gx/RQOucl4zlm
 Sxl8b6o908H9QieOxA39NJrwFIh7PU57Z9r/H3GHA=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsnpV-0006zJ-2W; Sun, 22 May 2022 16:49:21 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 jean-philippe@linaro.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 16:50:04 +0100
Message-Id: <20220522155008.21832-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522155008.21832-1-mark.cave-ayland@ilande.co.uk>
References: <20220522155008.21832-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 2/6] hw/acpi/viot: move the individual PCI host bridge
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


