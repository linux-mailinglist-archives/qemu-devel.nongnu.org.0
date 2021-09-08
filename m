Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEC540396E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 14:04:34 +0200 (CEST)
Received: from localhost ([::1]:48610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNwJd-0003El-Cy
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 08:04:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mNwB0-0006Lu-SL
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 07:55:38 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:59062
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mNwAz-0005as-9R
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 07:55:38 -0400
Received: from host86-140-11-91.range86-140.btcentralplus.com ([86.140.11.91]
 helo=kentang.home) by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mNwAu-0009u6-6l; Wed, 08 Sep 2021 12:55:35 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Wed,  8 Sep 2021 12:54:48 +0100
Message-Id: <20210908115451.9821-10-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210908115451.9821-1-mark.cave-ayland@ilande.co.uk>
References: <20210908115451.9821-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.140.11.91
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 09/12] escc: implement hard reset as described in the datasheet
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
hardware reset and implement the default values using the existing soft reset code
with the additional changes listed in the table in the "Z85C30 Reset" section.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210903113223.19551-7-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/char/escc.c | 41 +++++++++++++----------------------------
 1 file changed, 13 insertions(+), 28 deletions(-)

diff --git a/hw/char/escc.c b/hw/char/escc.c
index d5c7136e97..80f1d1b8fc 100644
--- a/hw/char/escc.c
+++ b/hw/char/escc.c
@@ -118,6 +118,8 @@
 #define W_SYNC2   7
 #define W_TXBUF   8
 #define W_MINTR   9
+#define MINTR_VIS      0x01
+#define MINTR_NV       0x02
 #define MINTR_STATUSHI 0x10
 #define MINTR_SOFTIACK 0x20
 #define MINTR_RST_MASK 0xc0
@@ -347,36 +349,19 @@ static void escc_soft_reset_chn(ESCCChannelState *s)
 
 static void escc_hard_reset_chn(ESCCChannelState *s)
 {
-    int i;
+    escc_soft_reset_chn(s);
 
-    s->reg = 0;
-    for (i = 0; i < ESCC_SERIAL_REGS; i++) {
-        s->rregs[i] = 0;
-        s->wregs[i] = 0;
-    }
-    /* 1X divisor, 1 stop bit, no parity */
-    s->wregs[W_TXCTRL1] = TXCTRL1_1STOP;
-    s->wregs[W_MINTR] = MINTR_RST_ALL;
-    /* Synch mode tx clock = TRxC */
+    /*
+     * Hard reset is almost identical to soft reset above, except that the
+     * values of WR9 (W_MINTR), WR10 (W_MISC1), WR11 (W_CLOCK) and WR14
+     * (W_MISC2) have extra bits forced to 0/1
+     */
+    s->wregs[W_MINTR] &= MINTR_VIS | MINTR_NV;
+    s->wregs[W_MINTR] |= MINTR_RST_B | MINTR_RST_A;
+    s->wregs[W_MISC1] = 0;
     s->wregs[W_CLOCK] = CLOCK_TRXC;
-    /* PLL disabled */
-    s->wregs[W_MISC2] = MISC2_PLLDIS;
-    /* Enable most interrupts */
-    s->wregs[W_EXTINT] = EXTINT_DCD | EXTINT_SYNCINT | EXTINT_CTSINT |
-                         EXTINT_TXUNDRN | EXTINT_BRKINT;
-    if (s->disabled) {
-        s->rregs[R_STATUS] = STATUS_TXEMPTY | STATUS_DCD | STATUS_SYNC |
-                             STATUS_CTS | STATUS_TXUNDRN;
-    } else {
-        s->rregs[R_STATUS] = STATUS_TXEMPTY | STATUS_TXUNDRN;
-    }
-    s->rregs[R_SPEC] = SPEC_BITS8 | SPEC_ALLSENT;
-
-    s->rx = s->tx = 0;
-    s->rxint = s->txint = 0;
-    s->rxint_under_svc = s->txint_under_svc = 0;
-    s->e0_mode = s->led_mode = s->caps_lock_mode = s->num_lock_mode = 0;
-    clear_queue(s);
+    s->wregs[W_MISC2] &= MISC2_PLLCMD1 | MISC2_PLLCMD2;
+    s->wregs[W_MISC2] |= MISC2_LCL_LOOP | MISC2_PLLCMD0;
 }
 
 static void escc_reset(DeviceState *d)
-- 
2.20.1


