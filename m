Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6476750A9AE
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 22:05:10 +0200 (CEST)
Received: from localhost ([::1]:37230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhd37-00030r-Gc
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 16:05:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhcXe-0008Ou-HJ
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:32:38 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:33626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhcXT-0005jf-LL
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:32:38 -0400
Received: from [2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhcWT-000Caf-Ig; Thu, 21 Apr 2022 20:31:25 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	deller@gmx.de,
	qemu-devel@nongnu.org
Date: Thu, 21 Apr 2022 20:30:43 +0100
Message-Id: <20220421193100.5098-34-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220421193100.5098-1-mark.cave-ayland@ilande.co.uk>
References: <20220421193100.5098-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 33/50] lasi: move LAN initialisation to machine.c
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
 hw/hppa/lasi.c    | 7 -------
 hw/hppa/machine.c | 5 +++++
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/hw/hppa/lasi.c b/hw/hppa/lasi.c
index 65139bb29b..88ff9141e4 100644
--- a/hw/hppa/lasi.c
+++ b/hw/hppa/lasi.c
@@ -18,7 +18,6 @@
 #include "sysemu/sysemu.h"
 #include "sysemu/runstate.h"
 #include "hppa_sys.h"
-#include "hw/net/lasi_82596.h"
 #include "hw/char/parallel.h"
 #include "hw/char/serial.h"
 #include "hw/input/lasips2.h"
@@ -238,12 +237,6 @@ LasiState *lasi_initfn(MemoryRegion *address_space)
     dev = qdev_new(TYPE_LASI_CHIP);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
-    /* LAN */
-    if (enable_lasi_lan()) {
-        lasi_82596_init(address_space, LASI_LAN_HPA,
-                        qdev_get_gpio_in(dev, LASI_IRQ_LAN_HPA));
-    }
-
     /* Parallel port */
     parallel_mm_init(address_space, LASI_LPT_HPA + 0x800, 0,
                      qdev_get_gpio_in(dev, LASI_IRQ_LAN_HPA),
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index be311294a8..c29528d03b 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -221,6 +221,11 @@ static void machine_hppa_init(MachineState *machine)
     }
 
     /* Network setup. */
+    if (enable_lasi_lan()) {
+        lasi_82596_init(addr_space, LASI_LAN_HPA,
+                        qdev_get_gpio_in(lasi_dev, LASI_IRQ_LAN_HPA));
+    }
+
     for (i = 0; i < nb_nics; i++) {
         if (!enable_lasi_lan()) {
             pci_nic_init_nofail(&nd_table[i], pci_bus, "tulip", NULL);
-- 
2.20.1


