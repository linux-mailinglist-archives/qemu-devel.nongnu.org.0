Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6138A51F11E
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 22:26:40 +0200 (CEST)
Received: from localhost ([::1]:46994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnnUF-0001pq-Ga
	for lists+qemu-devel@lfdr.de; Sun, 08 May 2022 16:26:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nnn4C-0007Dk-QN
 for qemu-devel@nongnu.org; Sun, 08 May 2022 15:59:48 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:55366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nnn49-00076l-Tz
 for qemu-devel@nongnu.org; Sun, 08 May 2022 15:59:44 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nnn2n-0000yR-VO; Sun, 08 May 2022 20:58:22 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	deller@gmx.de,
	qemu-devel@nongnu.org
Date: Sun,  8 May 2022 20:56:29 +0100
Message-Id: <20220508195650.28590-33-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220508195650.28590-1-mark.cave-ayland@ilande.co.uk>
References: <20220508195650.28590-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 32/53] lasi: update lasi_initfn() to return LASIState
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
Message-Id: <20220504092600.10048-33-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/hppa/hppa_sys.h | 3 ++-
 hw/hppa/lasi.c     | 4 ++--
 hw/hppa/machine.c  | 3 ++-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/hppa/hppa_sys.h b/hw/hppa/hppa_sys.h
index 0929dedded..3832b787d1 100644
--- a/hw/hppa/hppa_sys.h
+++ b/hw/hppa/hppa_sys.h
@@ -7,10 +7,11 @@
 #include "hw/pci/pci_host.h"
 #include "hw/boards.h"
 #include "hw/intc/i8259.h"
+#include "lasi.h"
 
 #include "hppa_hardware.h"
 
-DeviceState *lasi_initfn(MemoryRegion *);
+LasiState *lasi_initfn(MemoryRegion *);
 #define enable_lasi_lan()       0
 
 /* hppa_pci.c.  */
diff --git a/hw/hppa/lasi.c b/hw/hppa/lasi.c
index 219eb779f3..65139bb29b 100644
--- a/hw/hppa/lasi.c
+++ b/hw/hppa/lasi.c
@@ -231,7 +231,7 @@ static void lasi_set_irq(void *opaque, int irq, int level)
     }
 }
 
-DeviceState *lasi_initfn(MemoryRegion *address_space)
+LasiState *lasi_initfn(MemoryRegion *address_space)
 {
     DeviceState *dev;
 
@@ -260,7 +260,7 @@ DeviceState *lasi_initfn(MemoryRegion *address_space)
     lasips2_init(address_space, LASI_PS2KBD_HPA,
                  qdev_get_gpio_in(dev, LASI_IRQ_PS2KBD_HPA));
 
-    return dev;
+    return LASI_CHIP(dev);
 }
 
 static void lasi_reset(DeviceState *dev)
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 6618bce435..c815dde305 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -18,6 +18,7 @@
 #include "hw/net/lasi_82596.h"
 #include "hw/nmi.h"
 #include "hw/pci-host/dino.h"
+#include "lasi.h"
 #include "hppa_sys.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
@@ -175,7 +176,7 @@ static void machine_hppa_init(MachineState *machine)
 
 
     /* Init Lasi chip */
-    lasi_dev = lasi_initfn(addr_space);
+    lasi_dev = DEVICE(lasi_initfn(addr_space));
     memory_region_add_subregion(addr_space, LASI_HPA,
                                 sysbus_mmio_get_region(
                                     SYS_BUS_DEVICE(lasi_dev), 0));
-- 
2.20.1


