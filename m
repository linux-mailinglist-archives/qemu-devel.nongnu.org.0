Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF98519C65
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 11:54:14 +0200 (CEST)
Received: from localhost ([::1]:58432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmBi1-0006vl-GX
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 05:54:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBIS-0008Vs-2K
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:27:48 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBIQ-00047B-BJ
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:27:47 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBHI-0002VG-HT; Wed, 04 May 2022 10:26:40 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	deller@gmx.de,
	qemu-devel@nongnu.org
Date: Wed,  4 May 2022 10:25:38 +0100
Message-Id: <20220504092600.10048-29-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 28/50] lasi: replace lasi_get_irq() with defined constants
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
 hw/hppa/lasi.c | 31 ++++---------------------------
 hw/hppa/lasi.h |  9 +++++++++
 2 files changed, 13 insertions(+), 27 deletions(-)

diff --git a/hw/hppa/lasi.c b/hw/hppa/lasi.c
index c1dfd5310f..ec079601a1 100644
--- a/hw/hppa/lasi.c
+++ b/hw/hppa/lasi.c
@@ -231,29 +231,6 @@ static void lasi_set_irq(void *opaque, int irq, int level)
     }
 }
 
-static int lasi_get_irq(unsigned long hpa)
-{
-    switch (hpa) {
-    case LASI_HPA:
-        return 14;
-    case LASI_UART_HPA:
-        return 5;
-    case LASI_LPT_HPA:
-        return 7;
-    case LASI_LAN_HPA:
-        return 8;
-    case LASI_SCSI_HPA:
-        return 9;
-    case LASI_AUDIO_HPA:
-        return 13;
-    case LASI_PS2KBD_HPA:
-    case LASI_PS2MOU_HPA:
-        return 26;
-    default:
-        g_assert_not_reached();
-    }
-}
-
 DeviceState *lasi_initfn(MemoryRegion *address_space)
 {
     DeviceState *dev;
@@ -266,20 +243,20 @@ DeviceState *lasi_initfn(MemoryRegion *address_space)
     /* LAN */
     if (enable_lasi_lan()) {
         qemu_irq lan_irq = qemu_allocate_irq(lasi_set_irq, s,
-                lasi_get_irq(LASI_LAN_HPA));
+                                             LASI_IRQ_LAN_HPA);
         lasi_82596_init(address_space, LASI_LAN_HPA, lan_irq);
     }
 
     /* Parallel port */
     qemu_irq lpt_irq = qemu_allocate_irq(lasi_set_irq, s,
-            lasi_get_irq(LASI_LPT_HPA));
+                                         LASI_IRQ_LPT_HPA);
     parallel_mm_init(address_space, LASI_LPT_HPA + 0x800, 0,
                      lpt_irq, parallel_hds[0]);
 
     if (serial_hd(1)) {
         /* Serial port */
         qemu_irq serial_irq = qemu_allocate_irq(lasi_set_irq, s,
-                lasi_get_irq(LASI_UART_HPA));
+                                                LASI_IRQ_UART_HPA);
         serial_mm_init(address_space, LASI_UART_HPA + 0x800, 0,
                 serial_irq, 8000000 / 16,
                 serial_hd(0), DEVICE_NATIVE_ENDIAN);
@@ -287,7 +264,7 @@ DeviceState *lasi_initfn(MemoryRegion *address_space)
 
     /* PS/2 Keyboard/Mouse */
     qemu_irq ps2kbd_irq = qemu_allocate_irq(lasi_set_irq, s,
-            lasi_get_irq(LASI_PS2KBD_HPA));
+                                            LASI_IRQ_PS2KBD_HPA);
     lasips2_init(address_space, LASI_PS2KBD_HPA,  ps2kbd_irq);
 
     return dev;
diff --git a/hw/hppa/lasi.h b/hw/hppa/lasi.h
index 559aae2560..f40546da6e 100644
--- a/hw/hppa/lasi.h
+++ b/hw/hppa/lasi.h
@@ -38,6 +38,15 @@ OBJECT_DECLARE_SIMPLE_TYPE(LasiState, LASI_CHIP)
 #define ICR_BUS_ERROR_BIT  LASI_BIT(8)  /* bit 8 in ICR */
 #define ICR_TOC_BIT        LASI_BIT(1)  /* bit 1 in ICR */
 
+#define LASI_IRQ_HPA        14
+#define LASI_IRQ_UART_HPA   5
+#define LASI_IRQ_LPT_HPA    7
+#define LASI_IRQ_LAN_HPA    8
+#define LASI_IRQ_SCSI_HPA   9
+#define LASI_IRQ_AUDIO_HPA  13
+#define LASI_IRQ_PS2KBD_HPA 26
+#define LASI_IRQ_PS2MOU_HPA 26
+
 struct LasiState {
     PCIHostState parent_obj;
 
-- 
2.20.1


