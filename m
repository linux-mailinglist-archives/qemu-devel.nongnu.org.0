Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A4A519C80
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 12:03:59 +0200 (CEST)
Received: from localhost ([::1]:47066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmBrS-0001jZ-PP
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 06:03:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBIX-0000DW-QG
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:27:54 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBIV-00047g-9b
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:27:53 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBHQ-0002VG-Gc; Wed, 04 May 2022 10:26:44 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	deller@gmx.de,
	qemu-devel@nongnu.org
Date: Wed,  4 May 2022 10:25:40 +0100
Message-Id: <20220504092600.10048-31-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 30/50] lasi: use qdev GPIOs to wire up IRQs in lasi_initfn()
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
 hw/hppa/lasi.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/hw/hppa/lasi.c b/hw/hppa/lasi.c
index 9489a80bad..32c7514d3a 100644
--- a/hw/hppa/lasi.c
+++ b/hw/hppa/lasi.c
@@ -234,38 +234,31 @@ static void lasi_set_irq(void *opaque, int irq, int level)
 DeviceState *lasi_initfn(MemoryRegion *address_space)
 {
     DeviceState *dev;
-    LasiState *s;
 
     dev = qdev_new(TYPE_LASI_CHIP);
-    s = LASI_CHIP(dev);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     /* LAN */
     if (enable_lasi_lan()) {
-        qemu_irq lan_irq = qemu_allocate_irq(lasi_set_irq, s,
-                                             LASI_IRQ_LAN_HPA);
-        lasi_82596_init(address_space, LASI_LAN_HPA, lan_irq);
+        lasi_82596_init(address_space, LASI_LAN_HPA,
+                        qdev_get_gpio_in(dev, LASI_IRQ_LAN_HPA));
     }
 
     /* Parallel port */
-    qemu_irq lpt_irq = qemu_allocate_irq(lasi_set_irq, s,
-                                         LASI_IRQ_LPT_HPA);
     parallel_mm_init(address_space, LASI_LPT_HPA + 0x800, 0,
-                     lpt_irq, parallel_hds[0]);
+                     qdev_get_gpio_in(dev, LASI_IRQ_LAN_HPA),
+                     parallel_hds[0]);
 
     if (serial_hd(1)) {
         /* Serial port */
-        qemu_irq serial_irq = qemu_allocate_irq(lasi_set_irq, s,
-                                                LASI_IRQ_UART_HPA);
         serial_mm_init(address_space, LASI_UART_HPA + 0x800, 0,
-                serial_irq, 8000000 / 16,
+                qdev_get_gpio_in(dev, LASI_IRQ_UART_HPA), 8000000 / 16,
                 serial_hd(0), DEVICE_NATIVE_ENDIAN);
     }
 
     /* PS/2 Keyboard/Mouse */
-    qemu_irq ps2kbd_irq = qemu_allocate_irq(lasi_set_irq, s,
-                                            LASI_IRQ_PS2KBD_HPA);
-    lasips2_init(address_space, LASI_PS2KBD_HPA,  ps2kbd_irq);
+    lasips2_init(address_space, LASI_PS2KBD_HPA,
+                 qdev_get_gpio_in(dev, LASI_IRQ_PS2KBD_HPA));
 
     return dev;
 }
-- 
2.20.1


