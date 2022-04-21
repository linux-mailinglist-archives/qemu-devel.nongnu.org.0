Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C2850A955
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 21:37:56 +0200 (CEST)
Received: from localhost ([::1]:46476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhccl-00044Z-AY
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 15:37:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhcWa-0006AZ-BX
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:31:32 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:33422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhcWV-0005bf-Lc
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:31:32 -0400
Received: from [2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhcVf-000Caf-Ln; Thu, 21 Apr 2022 20:30:35 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	deller@gmx.de,
	qemu-devel@nongnu.org
Date: Thu, 21 Apr 2022 20:30:17 +0100
Message-Id: <20220421193100.5098-8-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220421193100.5098-1-mark.cave-ayland@ilande.co.uk>
References: <20220421193100.5098-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 07/50] dino: move PCI bus master address space setup to
 dino_pcihost_realize()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Add a new dino_pcihost_unrealize() function to remove the address space when the
device is unrealized.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/hppa/dino.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c
index dcebb9f98f..ae79ddbf5c 100644
--- a/hw/hppa/dino.c
+++ b/hw/hppa/dino.c
@@ -536,17 +536,27 @@ PCIBus *dino_init(MemoryRegion *addr_space,
     memory_region_add_subregion(addr_space, DINO_HPA,
                                 sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0));
 
+    *p_rtc_irq = qemu_allocate_irq(dino_set_timer_irq, s, 0);
+    *p_ser_irq = qemu_allocate_irq(dino_set_serial_irq, s, 0);
+
+    return b;
+}
+
+static void dino_pcihost_realize(DeviceState *dev, Error **errp)
+{
+    DinoState *s = DINO_PCI_HOST_BRIDGE(dev);
+
     /* Set up PCI view of memory: Bus master address space.  */
     memory_region_init(&s->bm, OBJECT(s), "bm-dino", 4 * GiB);
     memory_region_init_alias(&s->bm_ram_alias, OBJECT(s),
-                             "bm-system", addr_space, 0,
+                             "bm-system", s->memory_as, 0,
                              0xf0000000 + DINO_MEM_CHUNK_SIZE);
     memory_region_init_alias(&s->bm_pci_alias, OBJECT(s),
                              "bm-pci", &s->pci_mem,
                              0xf0000000 + DINO_MEM_CHUNK_SIZE,
                              30 * DINO_MEM_CHUNK_SIZE);
     memory_region_init_alias(&s->bm_cpu_alias, OBJECT(s),
-                             "bm-cpu", addr_space, 0xfff00000,
+                             "bm-cpu", s->memory_as, 0xfff00000,
                              0xfffff);
     memory_region_add_subregion(&s->bm, 0,
                                 &s->bm_ram_alias);
@@ -555,12 +565,15 @@ PCIBus *dino_init(MemoryRegion *addr_space,
                                 &s->bm_pci_alias);
     memory_region_add_subregion(&s->bm, 0xfff00000,
                                 &s->bm_cpu_alias);
+
     address_space_init(&s->bm_as, &s->bm, "pci-bm");
+}
 
-    *p_rtc_irq = qemu_allocate_irq(dino_set_timer_irq, s, 0);
-    *p_ser_irq = qemu_allocate_irq(dino_set_serial_irq, s, 0);
+static void dino_pcihost_unrealize(DeviceState *dev)
+{
+    DinoState *s = DINO_PCI_HOST_BRIDGE(dev);
 
-    return b;
+    address_space_destroy(&s->bm_as);
 }
 
 static void dino_pcihost_init(Object *obj)
@@ -619,6 +632,8 @@ static void dino_pcihost_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
+    dc->realize = dino_pcihost_realize;
+    dc->unrealize = dino_pcihost_unrealize;
     device_class_set_props(dc, dino_pcihost_properties);
     dc->vmsd = &vmstate_dino;
 }
-- 
2.20.1


