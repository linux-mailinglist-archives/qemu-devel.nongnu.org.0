Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F7A50A9BC
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 22:08:56 +0200 (CEST)
Received: from localhost ([::1]:43080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhd6l-00088k-Bi
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 16:08:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhcXh-00005k-8z
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:32:41 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:33642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhcXZ-0005k3-Be
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:32:40 -0400
Received: from [2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhcWY-000Caf-6g; Thu, 21 Apr 2022 20:31:30 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	deller@gmx.de,
	qemu-devel@nongnu.org
Date: Thu, 21 Apr 2022 20:30:45 +0100
Message-Id: <20220421193100.5098-36-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220421193100.5098-1-mark.cave-ayland@ilande.co.uk>
References: <20220421193100.5098-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 35/50] lasi: move second serial port initialisation to
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

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/hppa/lasi.c    | 8 --------
 hw/hppa/machine.c | 7 +++++++
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/hw/hppa/lasi.c b/hw/hppa/lasi.c
index 6faa98dca5..753a08d454 100644
--- a/hw/hppa/lasi.c
+++ b/hw/hppa/lasi.c
@@ -18,7 +18,6 @@
 #include "sysemu/sysemu.h"
 #include "sysemu/runstate.h"
 #include "hppa_sys.h"
-#include "hw/char/serial.h"
 #include "hw/input/lasips2.h"
 #include "migration/vmstate.h"
 #include "qom/object.h"
@@ -236,13 +235,6 @@ LasiState *lasi_initfn(MemoryRegion *address_space)
     dev = qdev_new(TYPE_LASI_CHIP);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
-    if (serial_hd(1)) {
-        /* Serial port */
-        serial_mm_init(address_space, LASI_UART_HPA + 0x800, 0,
-                qdev_get_gpio_in(dev, LASI_IRQ_UART_HPA), 8000000 / 16,
-                serial_hd(1), DEVICE_BIG_ENDIAN);
-    }
-
     /* PS/2 Keyboard/Mouse */
     lasips2_init(address_space, LASI_PS2KBD_HPA,
                  qdev_get_gpio_in(dev, LASI_IRQ_PS2KBD_HPA));
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index c03312c301..1ef9ac5d8f 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -205,6 +205,13 @@ static void machine_hppa_init(MachineState *machine)
                        115200, serial_hd(0), DEVICE_BIG_ENDIAN);
     }
 
+    if (serial_hd(1)) {
+        /* Serial port */
+        serial_mm_init(addr_space, LASI_UART_HPA + 0x800, 0,
+                qdev_get_gpio_in(lasi_dev, LASI_IRQ_UART_HPA), 8000000 / 16,
+                serial_hd(1), DEVICE_BIG_ENDIAN);
+    }
+
     /* Parallel port */
     parallel_mm_init(addr_space, LASI_LPT_HPA + 0x800, 0,
                      qdev_get_gpio_in(lasi_dev, LASI_IRQ_LAN_HPA),
-- 
2.20.1


