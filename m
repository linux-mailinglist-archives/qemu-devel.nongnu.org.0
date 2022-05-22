Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6759C5303EB
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 17:53:59 +0200 (CEST)
Received: from localhost ([::1]:52830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsnu2-0001ZK-38
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 11:53:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsnqZ-0007Am-73
 for qemu-devel@nongnu.org; Sun, 22 May 2022 11:50:23 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsnqW-0007wY-0z
 for qemu-devel@nongnu.org; Sun, 22 May 2022 11:50:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z1Rzz9Hn/sUPXSWGV/8RA4pIwXK9igEY7gMTM2wHsdM=; b=PO1wItf9g+JFFS3EL5XivfJ9D6
 YkPVZrHUtdR9W2YCYDiosuO5v9iSOEvv41f5jGX8rCfebiZP111GwSRJZLQNuMD2odQsd1IEZJw7D
 mQP0n87Y+s4A5mbOdLrixG6BKWvgGBYDifGRKSiI94Vu09UPlujodztAfQElEDDlYB7NldYy7ZhOe
 PZ2fwQsiPtHoVP8TeYPmGBAGJxXm+Y1k8+KyNQ8hXgDCu6cWtsdMNAIiKcNWdq/fNlP4HG1PvBkCN
 z6RpQuOOb1mC3tR9o4RLSkeH1S7wKw6CrUlt4o+hT5i+tPhVqL4wsZqP0FBXwLvga6xBieLIc9Uwv
 l7nGjWb+yaUE4iZ9VeSXyajBQAoNl2ZhBpumD1J1dc07C4MIVjVknjYtn2Yw2zNx8BA9M69x8Dupj
 ztOutfu0jjBbdC3Jzg418y5+tju5Twumr75tQ82XWByqQw630sU1gtPMwSsaA4h4woKm6SkXzoTxV
 a5YkEsB9r41E8ChpQbSMg6qp9HmxQkcUn2yPke4hLPcXLOEaEGoEYz+iK+FwLDqi44NRG4n5MQNtt
 4fhIEED7IXP3Zms4Q0EEBULps4F42VLPOyWOd/Plp09IMdpy9Or9tU6dDT2vMvjQJSxRIY9BZKBsR
 Kkqs2wS+BXIrPpi7JSyZzp2TFmIz+q8wl5Y8raWzA=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsnpU-0006zJ-KW; Sun, 22 May 2022 16:49:16 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 jean-philippe@linaro.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 16:50:03 +0100
Message-Id: <20220522155008.21832-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522155008.21832-1-mark.cave-ayland@ilande.co.uk>
References: <20220522155008.21832-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 1/6] hw/acpi/viot: rename build_pci_range_node() to
 enumerate_pci_host_bridges()
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

This is in preparation for separating out the VIOT ACPI table build from the
PCI host bridge numeration.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/acpi/viot.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/acpi/viot.c b/hw/acpi/viot.c
index c1af75206e..a41daded71 100644
--- a/hw/acpi/viot.c
+++ b/hw/acpi/viot.c
@@ -17,7 +17,7 @@ struct viot_pci_ranges {
 };
 
 /* Build PCI range for a given PCI host bridge */
-static int build_pci_range_node(Object *obj, void *opaque)
+static int enumerate_pci_host_bridges(Object *obj, void *opaque)
 {
     struct viot_pci_ranges *pci_ranges = opaque;
     GArray *blob = pci_ranges->blob;
@@ -78,7 +78,7 @@ void build_viot(MachineState *ms, GArray *table_data, BIOSLinker *linker,
     };
 
     /* Build the list of PCI ranges that this viommu manages */
-    object_child_foreach_recursive(OBJECT(ms), build_pci_range_node,
+    object_child_foreach_recursive(OBJECT(ms), enumerate_pci_host_bridges,
                                    &pci_ranges);
 
     /* ACPI table header */
-- 
2.20.1


