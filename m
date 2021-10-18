Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5F8431E14
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 15:55:41 +0200 (CEST)
Received: from localhost ([::1]:38312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcT76-0003Pc-FX
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 09:55:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mcT3W-0004kR-6n
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 09:51:59 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:40667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mcT3T-00041K-Nc
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 09:51:57 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 8F387748F53;
 Mon, 18 Oct 2021 15:51:52 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 6DFEF748F52; Mon, 18 Oct 2021 15:51:52 +0200 (CEST)
Message-Id: <2997b47710914a138223c7b4565dd49204b5b3f0.1634563652.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1634563652.git.balaton@eik.bme.hu>
References: <cover.1634563652.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 1/6] via-ide: Avoid expensive operations in irq handler
Date: Mon, 18 Oct 2021 15:27:32 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Huacai Chen <chenhuacai@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Philippe M-D <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cache the pointer to PCI function 0 (ISA bridge, that this IDE device
has to use for IRQs) in the PCIIDEState and pass that as the opaque
data for the interrupt handler to eliminate both the need to look up
function 0 at every interrupt and also a QOM type cast of the opaque
pointer as that's also expensive (mainly due to qom-debug being
enabled by default).

Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ide/via.c         | 11 ++++++-----
 include/hw/ide/pci.h |  1 +
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/ide/via.c b/hw/ide/via.c
index 82def819c4..30566bc409 100644
--- a/hw/ide/via.c
+++ b/hw/ide/via.c
@@ -104,15 +104,15 @@ static void bmdma_setup_bar(PCIIDEState *d)
 
 static void via_ide_set_irq(void *opaque, int n, int level)
 {
-    PCIDevice *d = PCI_DEVICE(opaque);
+    PCIIDEState *d = opaque;
 
     if (level) {
-        d->config[0x70 + n * 8] |= 0x80;
+        d->parent_obj.config[0x70 + n * 8] |= 0x80;
     } else {
-        d->config[0x70 + n * 8] &= ~0x80;
+        d->parent_obj.config[0x70 + n * 8] &= ~0x80;
     }
 
-    via_isa_set_irq(pci_get_function_0(d), 14 + n, level);
+    via_isa_set_irq(d->func0, 14 + n, level);
 }
 
 static void via_ide_reset(DeviceState *dev)
@@ -188,7 +188,8 @@ static void via_ide_realize(PCIDevice *dev, Error **errp)
     bmdma_setup_bar(d);
     pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
 
-    qdev_init_gpio_in(ds, via_ide_set_irq, 2);
+    d->func0 = pci_get_function_0(dev);
+    qdev_init_gpio_in_named_with_opaque(ds, via_ide_set_irq, d, NULL, 2);
     for (i = 0; i < 2; i++) {
         ide_bus_init(&d->bus[i], sizeof(d->bus[i]), ds, i, 2);
         ide_init2(&d->bus[i], qdev_get_gpio_in(ds, i));
diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
index d8384e1c42..89d14abf95 100644
--- a/include/hw/ide/pci.h
+++ b/include/hw/ide/pci.h
@@ -50,6 +50,7 @@ struct PCIIDEState {
     IDEBus bus[2];
     BMDMAState bmdma[2];
     uint32_t secondary; /* used only for cmd646 */
+    PCIDevice *func0; /* used only by IDE functions of superio chips */
     MemoryRegion bmdma_bar;
     MemoryRegion cmd_bar[2];
     MemoryRegion data_bar[2];
-- 
2.21.4


