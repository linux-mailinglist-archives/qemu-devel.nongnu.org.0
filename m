Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95101519C1C
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 11:43:59 +0200 (CEST)
Received: from localhost ([::1]:37142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmBY6-0000VR-NY
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 05:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBHC-0007cA-KC
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:26:30 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:48974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBHB-0003yI-1q
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:26:30 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBGD-0002VG-Er; Wed, 04 May 2022 10:25:33 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	deller@gmx.de,
	qemu-devel@nongnu.org
Date: Wed,  4 May 2022 10:25:13 +0100
Message-Id: <20220504092600.10048-4-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 03/50] dino: move PCI bus initialisation to
 dino_pcihost_init()
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

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
---
 hw/hppa/dino.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c
index 9401b68ff7..c6c01ea14c 100644
--- a/hw/hppa/dino.c
+++ b/hw/hppa/dino.c
@@ -526,13 +526,7 @@ PCIBus *dino_init(MemoryRegion *addr_space,
     s->iar0 = s->iar1 = CPU_HPA + 3;
     s->toc_addr = 0xFFFA0030; /* IO_COMMAND of CPU */
 
-    /* Dino PCI bus memory.  */
-    memory_region_init(&s->pci_mem, OBJECT(s), "pci-memory", 4 * GiB);
-
-    b = pci_register_root_bus(dev, "pci", dino_set_irq, dino_pci_map_irq, s,
-                              &s->pci_mem, get_system_io(),
-                              PCI_DEVFN(0, 0), 32, TYPE_PCI_BUS);
-    s->parent_obj.bus = b;
+    b = s->parent_obj.bus;
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     memory_region_add_subregion(addr_space, DINO_HPA,
@@ -598,6 +592,14 @@ static void dino_pcihost_init(Object *obj)
     memory_region_add_subregion(&s->this_mem, DINO_CONFIG_DATA,
                                 &phb->data_mem);
 
+    /* Dino PCI bus memory.  */
+    memory_region_init(&s->pci_mem, OBJECT(s), "pci-memory", 4 * GiB);
+
+    phb->bus = pci_register_root_bus(DEVICE(s), "pci",
+                                     dino_set_irq, dino_pci_map_irq, s,
+                                     &s->pci_mem, get_system_io(),
+                                     PCI_DEVFN(0, 0), 32, TYPE_PCI_BUS);
+
     sysbus_init_mmio(sbd, &s->this_mem);
 }
 
-- 
2.20.1


