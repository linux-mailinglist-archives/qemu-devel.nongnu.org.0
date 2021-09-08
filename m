Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D14403952
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 13:59:59 +0200 (CEST)
Received: from localhost ([::1]:40402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNwFC-00064l-Ng
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 07:59:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mNwAy-0006BD-3X
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 07:55:36 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:59056
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mNwAv-0005YQ-I3
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 07:55:35 -0400
Received: from host86-140-11-91.range86-140.btcentralplus.com ([86.140.11.91]
 helo=kentang.home) by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mNwAt-0009u6-Mv; Wed, 08 Sep 2021 12:55:32 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Wed,  8 Sep 2021 12:54:47 +0100
Message-Id: <20210908115451.9821-9-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210908115451.9821-1-mark.cave-ayland@ilande.co.uk>
References: <20210908115451.9821-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.140.11.91
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 08/12] escc: implement soft reset as described in the datasheet
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

The software reset differs from a device reset in that it only changes the contents
of specific registers. Remove the code that resets all the registers to zero during
soft reset and implement the default values listed in the table in the "Z85C30 Reset"
section.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210903113223.19551-6-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/char/escc.c | 48 +++++++++++++++++++++++++++++++-----------------
 1 file changed, 31 insertions(+), 17 deletions(-)

diff --git a/hw/char/escc.c b/hw/char/escc.c
index 806f593738..d5c7136e97 100644
--- a/hw/char/escc.c
+++ b/hw/char/escc.c
@@ -86,9 +86,11 @@
 #define W_INTR    1
 #define INTR_INTALL    0x01
 #define INTR_TXINT     0x02
+#define INTR_PAR_SPEC  0x04
 #define INTR_RXMODEMSK 0x18
 #define INTR_RXINT1ST  0x08
 #define INTR_RXINTALL  0x10
+#define INTR_WTRQ_TXRX 0x20
 #define W_IVEC    2
 #define W_RXCTRL  3
 #define RXCTRL_RXEN    0x01
@@ -105,6 +107,7 @@
 #define TXCTRL1_CLK64X 0xc0
 #define TXCTRL1_CLKMSK 0xc0
 #define W_TXCTRL2 5
+#define TXCTRL2_TXCRC  0x01
 #define TXCTRL2_TXEN   0x08
 #define TXCTRL2_BITMSK 0x60
 #define TXCTRL2_5BITS  0x00
@@ -116,16 +119,24 @@
 #define W_TXBUF   8
 #define W_MINTR   9
 #define MINTR_STATUSHI 0x10
+#define MINTR_SOFTIACK 0x20
 #define MINTR_RST_MASK 0xc0
 #define MINTR_RST_B    0x40
 #define MINTR_RST_A    0x80
 #define MINTR_RST_ALL  0xc0
 #define W_MISC1  10
+#define MISC1_ENC_MASK 0x60
 #define W_CLOCK  11
 #define CLOCK_TRXC     0x08
 #define W_BRGLO  12
 #define W_BRGHI  13
 #define W_MISC2  14
+#define MISC2_BRG_EN   0x01
+#define MISC2_BRG_SRC  0x02
+#define MISC2_LCL_LOOP 0x10
+#define MISC2_PLLCMD0  0x20
+#define MISC2_PLLCMD1  0x40
+#define MISC2_PLLCMD2  0x80
 #define MISC2_PLLDIS   0x30
 #define W_EXTINT 15
 #define EXTINT_DCD     0x08
@@ -170,6 +181,7 @@
 #define R_RXBUF   8
 #define R_RXCTRL  9
 #define R_MISC   10
+#define MISC_2CLKMISS  0x40
 #define R_MISC1  11
 #define R_BRGLO  12
 #define R_BRGHI  13
@@ -299,30 +311,32 @@ static void escc_reset_chn(ESCCChannelState *s)
 
 static void escc_soft_reset_chn(ESCCChannelState *s)
 {
-    int i;
-
     s->reg = 0;
-    for (i = 0; i < ESCC_SERIAL_REGS; i++) {
-        s->rregs[i] = 0;
-        s->wregs[i] = 0;
-    }
-    /* 1X divisor, 1 stop bit, no parity */
-    s->wregs[W_TXCTRL1] = TXCTRL1_1STOP;
-    s->wregs[W_MINTR] = MINTR_RST_ALL;
-    /* Synch mode tx clock = TRxC */
-    s->wregs[W_CLOCK] = CLOCK_TRXC;
+    s->wregs[W_CMD] = 0;
+    s->wregs[W_INTR] &= INTR_PAR_SPEC | INTR_WTRQ_TXRX;
+    s->wregs[W_RXCTRL] &= ~RXCTRL_RXEN;
+    /* 1 stop bit */
+    s->wregs[W_TXCTRL1] |= TXCTRL1_1STOP;
+    s->wregs[W_TXCTRL2] &= TXCTRL2_TXCRC | TXCTRL2_8BITS;
+    s->wregs[W_MINTR] &= ~MINTR_SOFTIACK;
+    s->wregs[W_MISC1] &= MISC1_ENC_MASK;
     /* PLL disabled */
-    s->wregs[W_MISC2] = MISC2_PLLDIS;
+    s->wregs[W_MISC2] &= MISC2_BRG_EN | MISC2_BRG_SRC |
+                         MISC2_PLLCMD1 | MISC2_PLLCMD2;
+    s->wregs[W_MISC2] |= MISC2_PLLCMD0;
     /* Enable most interrupts */
     s->wregs[W_EXTINT] = EXTINT_DCD | EXTINT_SYNCINT | EXTINT_CTSINT |
                          EXTINT_TXUNDRN | EXTINT_BRKINT;
+
+    s->rregs[R_STATUS] &= STATUS_DCD | STATUS_SYNC | STATUS_CTS | STATUS_BRK;
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
+    s->rregs[R_MISC] &= MISC_2CLKMISS;
 
     s->rx = s->tx = 0;
     s->rxint = s->txint = 0;
-- 
2.20.1


