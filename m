Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8240251F0FA
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 22:09:16 +0200 (CEST)
Received: from localhost ([::1]:51426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnnDP-0000WG-KM
	for lists+qemu-devel@lfdr.de; Sun, 08 May 2022 16:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nnn3Z-0006zz-T1
 for qemu-devel@nongnu.org; Sun, 08 May 2022 15:59:05 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:55310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nnn3Y-00073i-EA
 for qemu-devel@nongnu.org; Sun, 08 May 2022 15:59:05 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nnn2M-0000yR-7q; Sun, 08 May 2022 20:57:54 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	deller@gmx.de,
	qemu-devel@nongnu.org
Date: Sun,  8 May 2022 20:56:22 +0100
Message-Id: <20220508195650.28590-26-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220508195650.28590-1-mark.cave-ayland@ilande.co.uk>
References: <20220508195650.28590-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 25/53] lasi: move register memory mapping from lasi.c to
 machine.c
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

The device register should be mapped directly by the board code.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
Message-Id: <20220504092600.10048-26-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/hppa/lasi.c    | 7 +++----
 hw/hppa/machine.c | 7 +++++--
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/hppa/lasi.c b/hw/hppa/lasi.c
index c028b7786e..08ebe7c6d9 100644
--- a/hw/hppa/lasi.c
+++ b/hw/hppa/lasi.c
@@ -304,10 +304,6 @@ DeviceState *lasi_initfn(MemoryRegion *address_space)
     dev = qdev_new(TYPE_LASI_CHIP);
     s = LASI_CHIP(dev);
     s->iar = CPU_HPA + 3;
-
-    /* Lasi access from main memory.  */
-    memory_region_add_subregion(address_space, LASI_HPA, &s->this_mem);
-
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     /* LAN */
@@ -348,9 +344,12 @@ DeviceState *lasi_initfn(MemoryRegion *address_space)
 static void lasi_init(Object *obj)
 {
     LasiState *s = LASI_CHIP(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
     memory_region_init_io(&s->this_mem, OBJECT(s), &lasi_chip_ops,
                           s, "lasi", 0x100000);
+
+    sysbus_init_mmio(sbd, &s->this_mem);
 }
 
 static void lasi_class_init(ObjectClass *klass, void *data)
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 2fa55de549..6618bce435 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -139,7 +139,7 @@ static void machine_hppa_init(MachineState *machine)
     const char *kernel_filename = machine->kernel_filename;
     const char *kernel_cmdline = machine->kernel_cmdline;
     const char *initrd_filename = machine->initrd_filename;
-    DeviceState *dev, *dino_dev;
+    DeviceState *dev, *dino_dev, *lasi_dev;
     PCIBus *pci_bus;
     ISABus *isa_bus;
     char *firmware_filename;
@@ -175,7 +175,10 @@ static void machine_hppa_init(MachineState *machine)
 
 
     /* Init Lasi chip */
-    lasi_initfn(addr_space);
+    lasi_dev = lasi_initfn(addr_space);
+    memory_region_add_subregion(addr_space, LASI_HPA,
+                                sysbus_mmio_get_region(
+                                    SYS_BUS_DEVICE(lasi_dev), 0));
 
     /* Init Dino (PCI host bus chip).  */
     dino_dev = DEVICE(dino_init(addr_space));
-- 
2.20.1


