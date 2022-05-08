Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D4151F0F6
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 22:06:42 +0200 (CEST)
Received: from localhost ([::1]:42684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnnAv-00032Q-U4
	for lists+qemu-devel@lfdr.de; Sun, 08 May 2022 16:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nnn3U-0006rk-JN
 for qemu-devel@nongnu.org; Sun, 08 May 2022 15:59:00 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:55302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nnn3Q-00073S-Sp
 for qemu-devel@nongnu.org; Sun, 08 May 2022 15:59:00 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nnn2H-0000yR-Vi; Sun, 08 May 2022 20:57:50 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	deller@gmx.de,
	qemu-devel@nongnu.org
Date: Sun,  8 May 2022 20:56:21 +0100
Message-Id: <20220508195650.28590-25-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220508195650.28590-1-mark.cave-ayland@ilande.co.uk>
References: <20220508195650.28590-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 24/53] lasi: move memory region initialisation to new
 lasi_init() function
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

Create a new lasi_init() instance initialisation function and move the LASI
memory region initialisation into it. Rename the existing lasi_init() function
to lasi_initfn() for now.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
Message-Id: <20220504092600.10048-25-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/hppa/hppa_sys.h |  2 +-
 hw/hppa/lasi.c     | 13 ++++++++++---
 hw/hppa/machine.c  |  2 +-
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/hw/hppa/hppa_sys.h b/hw/hppa/hppa_sys.h
index 7c31dd8396..0929dedded 100644
--- a/hw/hppa/hppa_sys.h
+++ b/hw/hppa/hppa_sys.h
@@ -10,7 +10,7 @@
 
 #include "hppa_hardware.h"
 
-DeviceState *lasi_init(MemoryRegion *);
+DeviceState *lasi_initfn(MemoryRegion *);
 #define enable_lasi_lan()       0
 
 /* hppa_pci.c.  */
diff --git a/hw/hppa/lasi.c b/hw/hppa/lasi.c
index 3b77fba1c6..c028b7786e 100644
--- a/hw/hppa/lasi.c
+++ b/hw/hppa/lasi.c
@@ -296,7 +296,7 @@ static int lasi_get_irq(unsigned long hpa)
     }
 }
 
-DeviceState *lasi_init(MemoryRegion *address_space)
+DeviceState *lasi_initfn(MemoryRegion *address_space)
 {
     DeviceState *dev;
     LasiState *s;
@@ -306,8 +306,6 @@ DeviceState *lasi_init(MemoryRegion *address_space)
     s->iar = CPU_HPA + 3;
 
     /* Lasi access from main memory.  */
-    memory_region_init_io(&s->this_mem, OBJECT(s), &lasi_chip_ops,
-                          s, "lasi", 0x100000);
     memory_region_add_subregion(address_space, LASI_HPA, &s->this_mem);
 
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
@@ -347,6 +345,14 @@ DeviceState *lasi_init(MemoryRegion *address_space)
     return dev;
 }
 
+static void lasi_init(Object *obj)
+{
+    LasiState *s = LASI_CHIP(obj);
+
+    memory_region_init_io(&s->this_mem, OBJECT(s), &lasi_chip_ops,
+                          s, "lasi", 0x100000);
+}
+
 static void lasi_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -357,6 +363,7 @@ static void lasi_class_init(ObjectClass *klass, void *data)
 static const TypeInfo lasi_pcihost_info = {
     .name          = TYPE_LASI_CHIP,
     .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_init = lasi_init,
     .instance_size = sizeof(LasiState),
     .class_init    = lasi_class_init,
 };
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index c847febe5d..2fa55de549 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -175,7 +175,7 @@ static void machine_hppa_init(MachineState *machine)
 
 
     /* Init Lasi chip */
-    lasi_init(addr_space);
+    lasi_initfn(addr_space);
 
     /* Init Dino (PCI host bus chip).  */
     dino_dev = DEVICE(dino_init(addr_space));
-- 
2.20.1


