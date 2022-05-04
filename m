Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD58E519BF5
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 11:35:56 +0200 (CEST)
Received: from localhost ([::1]:53692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmBQJ-0007yD-Gv
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 05:35:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBHG-0007fX-TG
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:26:39 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:48982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBHF-0003zl-86
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:26:34 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBGH-0002VG-MC; Wed, 04 May 2022 10:25:37 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	deller@gmx.de,
	qemu-devel@nongnu.org
Date: Wed,  4 May 2022 10:25:14 +0100
Message-Id: <20220504092600.10048-5-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 04/50] dino: move PCI windows initialisation to
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
 hw/hppa/dino.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c
index c6c01ea14c..bc27aad5dc 100644
--- a/hw/hppa/dino.c
+++ b/hw/hppa/dino.c
@@ -519,7 +519,6 @@ PCIBus *dino_init(MemoryRegion *addr_space,
     DeviceState *dev;
     DinoState *s;
     PCIBus *b;
-    int i;
 
     dev = qdev_new(TYPE_DINO_PCI_HOST_BRIDGE);
     s = DINO_PCI_HOST_BRIDGE(dev);
@@ -532,16 +531,6 @@ PCIBus *dino_init(MemoryRegion *addr_space,
     memory_region_add_subregion(addr_space, DINO_HPA,
                                 sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0));
 
-    /* Set up windows into PCI bus memory.  */
-    for (i = 1; i < 31; i++) {
-        uint32_t addr = 0xf0000000 + i * DINO_MEM_CHUNK_SIZE;
-        char *name = g_strdup_printf("PCI Outbound Window %d", i);
-        memory_region_init_alias(&s->pci_mem_alias[i], OBJECT(s),
-                                 name, &s->pci_mem, addr,
-                                 DINO_MEM_CHUNK_SIZE);
-        g_free(name);
-    }
-
     /* Set up PCI view of memory: Bus master address space.  */
     memory_region_init(&s->bm, OBJECT(s), "bm-dino", 4 * GiB);
     memory_region_init_alias(&s->bm_ram_alias, OBJECT(s),
@@ -575,6 +564,7 @@ static void dino_pcihost_init(Object *obj)
     DinoState *s = DINO_PCI_HOST_BRIDGE(obj);
     PCIHostState *phb = PCI_HOST_BRIDGE(obj);
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    int i;
 
     /* Dino PCI access from main memory.  */
     memory_region_init_io(&s->this_mem, OBJECT(s), &dino_chip_ops,
@@ -600,6 +590,16 @@ static void dino_pcihost_init(Object *obj)
                                      &s->pci_mem, get_system_io(),
                                      PCI_DEVFN(0, 0), 32, TYPE_PCI_BUS);
 
+    /* Set up windows into PCI bus memory.  */
+    for (i = 1; i < 31; i++) {
+        uint32_t addr = 0xf0000000 + i * DINO_MEM_CHUNK_SIZE;
+        char *name = g_strdup_printf("PCI Outbound Window %d", i);
+        memory_region_init_alias(&s->pci_mem_alias[i], OBJECT(s),
+                                 name, &s->pci_mem, addr,
+                                 DINO_MEM_CHUNK_SIZE);
+        g_free(name);
+    }
+
     sysbus_init_mmio(sbd, &s->this_mem);
 }
 
-- 
2.20.1


