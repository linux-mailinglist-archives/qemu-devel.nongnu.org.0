Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D39751F0FE
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 22:11:43 +0200 (CEST)
Received: from localhost ([::1]:57670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnnFm-0004jq-C8
	for lists+qemu-devel@lfdr.de; Sun, 08 May 2022 16:11:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nnn34-0006mp-Ta
 for qemu-devel@nongnu.org; Sun, 08 May 2022 15:58:35 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:55254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nnn32-00071r-Li
 for qemu-devel@nongnu.org; Sun, 08 May 2022 15:58:34 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nnn1u-0000yR-El; Sun, 08 May 2022 20:57:25 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	deller@gmx.de,
	qemu-devel@nongnu.org
Date: Sun,  8 May 2022 20:56:15 +0100
Message-Id: <20220508195650.28590-19-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220508195650.28590-1-mark.cave-ayland@ilande.co.uk>
References: <20220508195650.28590-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 18/53] dino: remove unused dino_set_timer_irq() IRQ handler
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

According to the comments in dino.c the timer IRQ is unused, so remove the empty
dino_set_timer_irq() handler function and simply pass NULL to mc146818_rtc_init()
in machine.c instead.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
Message-Id: <20220504092600.10048-19-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/hppa/dino.c     | 10 +---------
 hw/hppa/hppa_sys.h |  2 +-
 hw/hppa/machine.c  |  5 ++---
 3 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c
index 80ffe27188..d8baf139d6 100644
--- a/hw/hppa/dino.c
+++ b/hw/hppa/dino.c
@@ -399,13 +399,7 @@ static int dino_pci_map_irq(PCIDevice *d, int irq_num)
     return slot & 0x03;
 }
 
-static void dino_set_timer_irq(void *opaque, int irq, int level)
-{
-    /* ??? Not connected.  */
-}
-
-DinoState *dino_init(MemoryRegion *addr_space,
-                     qemu_irq *p_rtc_irq)
+DinoState *dino_init(MemoryRegion *addr_space)
 {
     DeviceState *dev;
     DinoState *s;
@@ -416,8 +410,6 @@ DinoState *dino_init(MemoryRegion *addr_space,
     s = DINO_PCI_HOST_BRIDGE(dev);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
-    *p_rtc_irq = qemu_allocate_irq(dino_set_timer_irq, s, 0);
-
     return s;
 }
 
diff --git a/hw/hppa/hppa_sys.h b/hw/hppa/hppa_sys.h
index c238e7ebc8..ebedecf1c8 100644
--- a/hw/hppa/hppa_sys.h
+++ b/hw/hppa/hppa_sys.h
@@ -11,7 +11,7 @@
 #include "hppa_hardware.h"
 #include "dino.h"
 
-DinoState *dino_init(MemoryRegion *, qemu_irq *);
+DinoState *dino_init(MemoryRegion *);
 DeviceState *lasi_init(MemoryRegion *);
 #define enable_lasi_lan()       0
 
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index f757aecda0..49ecb971be 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -130,7 +130,6 @@ static void machine_hppa_init(MachineState *machine)
     DeviceState *dev, *dino_dev;
     PCIBus *pci_bus;
     ISABus *isa_bus;
-    qemu_irq rtc_irq;
     char *firmware_filename;
     uint64_t firmware_low, firmware_high;
     long size;
@@ -167,7 +166,7 @@ static void machine_hppa_init(MachineState *machine)
     lasi_init(addr_space);
 
     /* Init Dino (PCI host bus chip).  */
-    dino_dev = DEVICE(dino_init(addr_space, &rtc_irq));
+    dino_dev = DEVICE(dino_init(addr_space));
     memory_region_add_subregion(addr_space, DINO_HPA,
                                 sysbus_mmio_get_region(
                                     SYS_BUS_DEVICE(dino_dev), 0));
@@ -179,7 +178,7 @@ static void machine_hppa_init(MachineState *machine)
     assert(isa_bus);
 
     /* Realtime clock, used by firmware for PDC_TOD call. */
-    mc146818_rtc_init(isa_bus, 2000, rtc_irq);
+    mc146818_rtc_init(isa_bus, 2000, NULL);
 
     /* Serial code setup.  */
     if (serial_hd(0)) {
-- 
2.20.1


