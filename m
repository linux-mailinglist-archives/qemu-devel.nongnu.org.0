Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E24A83FEC18
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 12:24:35 +0200 (CEST)
Received: from localhost ([::1]:52040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLjta-0000W0-Ul
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 06:24:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mLjrs-0006C8-Pt
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 06:22:48 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57656
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mLjrr-0001ca-7S
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 06:22:48 -0400
Received: from host86-133-17-27.range86-133.btcentralplus.com ([86.133.17.27]
 helo=kentang.home) by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mLjrQ-0000t5-DB; Thu, 02 Sep 2021 11:22:24 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Thu,  2 Sep 2021 11:22:02 +0100
Message-Id: <20210902102205.7554-7-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210902102205.7554-1-mark.cave-ayland@ilande.co.uk>
References: <20210902102205.7554-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.133.17.27
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 6/9] escc: implement hard reset as described in the
 datasheet
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The hardware reset differs from a device reset in that it only changes the contents
of specific registers. Remove the code that resets all the registers to zero during
hardware reset and implement the default values listed in the table in the "Z85C30
Reset" section.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/char/escc.c | 36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/hw/char/escc.c b/hw/char/escc.c
index 9a4e5ae20d..1d90e77db7 100644
--- a/hw/char/escc.c
+++ b/hw/char/escc.c
@@ -121,6 +121,8 @@
 #define W_SYNC2   7
 #define W_TXBUF   8
 #define W_MINTR   9
+#define MINTR_VIS      0x01
+#define MINTR_NV       0x02
 #define MINTR_STATUSHI 0x10
 #define MINTR_SOFTIACK 0x20
 #define MINTR_RST_MASK 0xc0
@@ -139,6 +141,7 @@
 #define MISC2_LCL_LOOP 0x10
 #define MISC2_PLLCMD0  0x20
 #define MISC2_PLLCMD1  0x40
+#define MISC2_PLLCMD2  0x80
 #define MISC2_PLLDIS   0x30
 #define W_EXTINT 15
 #define EXTINT_DCD     0x08
@@ -350,30 +353,35 @@ static void escc_soft_reset_chn(ESCCChannelState *s)
 
 static void escc_hard_reset_chn(ESCCChannelState *s)
 {
-    int i;
-
     s->reg = 0;
-    for (i = 0; i < ESCC_SERIAL_REGS; i++) {
-        s->rregs[i] = 0;
-        s->wregs[i] = 0;
-    }
+    s->wregs[W_CMD] = 0;
+    s->wregs[W_INTR] &= ~(INTR_INTALL | INTR_TXINT | INTR_RXINT1ST |
+                          INTR_RXINTALL | INTR_WTDMA_EN | INTR_WTDMA_RQ);
+    s->wregs[W_RXCTRL] &= ~RXCTRL_RXEN;
     /* 1X divisor, 1 stop bit, no parity */
     s->wregs[W_TXCTRL1] = TXCTRL1_1STOP;
-    s->wregs[W_MINTR] = MINTR_RST_ALL;
-    /* Synch mode tx clock = TRxC */
+    s->wregs[W_TXCTRL2] &= ~(TXCTRL2_RTS | TXCTRL2_CRCPLY | TXCTRL2_TXEN |
+                             TXCTRL2_SNDBRK | TXCTRL2_DTR);
+    s->wregs[W_MINTR] &= MINTR_VIS | MINTR_NV;
+    s->wregs[W_MINTR] |= MINTR_RST_B | MINTR_RST_A;
+    s->wregs[W_MISC1] = 0;
     s->wregs[W_CLOCK] = CLOCK_TRXC;
     /* PLL disabled */
-    s->wregs[W_MISC2] = MISC2_PLLDIS;
+    s->wregs[W_MISC2] &= MISC2_PLLCMD1 | MISC2_PLLCMD2;
+    s->wregs[W_MISC2] |= MISC2_LCL_LOOP | MISC2_PLLCMD0;
     /* Enable most interrupts */
     s->wregs[W_EXTINT] = EXTINT_DCD | EXTINT_SYNCINT | EXTINT_CTSINT |
                          EXTINT_TXUNDRN | EXTINT_BRKINT;
+
+    s->rregs[R_STATUS] &= ~(STATUS_RXAV | STATUS_ZERO);
+    s->rregs[R_STATUS] |= STATUS_TXEMPTY | STATUS_TXUNDRN;
     if (s->disabled) {
-        s->rregs[R_STATUS] = STATUS_TXEMPTY | STATUS_DCD | STATUS_SYNC |
-                             STATUS_CTS | STATUS_TXUNDRN;
-    } else {
-        s->rregs[R_STATUS] = STATUS_TXEMPTY | STATUS_TXUNDRN;
+        s->rregs[R_STATUS] |= STATUS_DCD | STATUS_SYNC | STATUS_CTS;
     }
-    s->rregs[R_SPEC] = SPEC_BITS8 | SPEC_ALLSENT;
+    s->rregs[R_SPEC] &= SPEC_ALLSENT;
+    s->rregs[R_SPEC] |= SPEC_BITS8;
+    s->rregs[R_INTR] = 0;
+    s->rregs[R_MISC] &= ~MISC_2CLKMISS;
 
     s->rx = s->tx = 0;
     s->rxint = s->txint = 0;
-- 
2.20.1


