Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFA53FEC1E
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 12:27:43 +0200 (CEST)
Received: from localhost ([::1]:59382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLjwc-0005W4-35
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 06:27:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mLjrg-0005ja-3r
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 06:22:36 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57638
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mLjrd-0001Rr-Jh
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 06:22:34 -0400
Received: from host86-133-17-27.range86-133.btcentralplus.com ([86.133.17.27]
 helo=kentang.home) by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mLjrC-0000t5-MI; Thu, 02 Sep 2021 11:22:11 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Thu,  2 Sep 2021 11:21:59 +0100
Message-Id: <20210902102205.7554-4-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210902102205.7554-1-mark.cave-ayland@ilande.co.uk>
References: <20210902102205.7554-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.133.17.27
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 3/9] escc: introduce escc_soft_reset_chn() for software
 reset
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

This new software reset function is to be called when the appropriate channel
software reset bit is written to register WR9. Its initial implementation is
the same as the existing escc_reset_chn() function used for device reset.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/char/escc.c | 38 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/hw/char/escc.c b/hw/char/escc.c
index b0d3b92dc1..935ec1aef6 100644
--- a/hw/char/escc.c
+++ b/hw/char/escc.c
@@ -297,6 +297,40 @@ static void escc_reset_chn(ESCCChannelState *s)
     clear_queue(s);
 }
 
+static void escc_soft_reset_chn(ESCCChannelState *s)
+{
+    int i;
+
+    s->reg = 0;
+    for (i = 0; i < ESCC_SERIAL_REGS; i++) {
+        s->rregs[i] = 0;
+        s->wregs[i] = 0;
+    }
+    /* 1X divisor, 1 stop bit, no parity */
+    s->wregs[W_TXCTRL1] = TXCTRL1_1STOP;
+    s->wregs[W_MINTR] = MINTR_RST_ALL;
+    /* Synch mode tx clock = TRxC */
+    s->wregs[W_CLOCK] = CLOCK_TRXC;
+    /* PLL disabled */
+    s->wregs[W_MISC2] = MISC2_PLLDIS;
+    /* Enable most interrupts */
+    s->wregs[W_EXTINT] = EXTINT_DCD | EXTINT_SYNCINT | EXTINT_CTSINT |
+                         EXTINT_TXUNDRN | EXTINT_BRKINT;
+    if (s->disabled) {
+        s->rregs[R_STATUS] = STATUS_TXEMPTY | STATUS_DCD | STATUS_SYNC |
+                             STATUS_CTS | STATUS_TXUNDRN;
+    } else {
+        s->rregs[R_STATUS] = STATUS_TXEMPTY | STATUS_TXUNDRN;
+    }
+    s->rregs[R_SPEC] = SPEC_BITS8 | SPEC_ALLSENT;
+
+    s->rx = s->tx = 0;
+    s->rxint = s->txint = 0;
+    s->rxint_under_svc = s->txint_under_svc = 0;
+    s->e0_mode = s->led_mode = s->caps_lock_mode = s->num_lock_mode = 0;
+    clear_queue(s);
+}
+
 static void escc_reset(DeviceState *d)
 {
     ESCCState *s = ESCC(d);
@@ -547,10 +581,10 @@ static void escc_mem_write(void *opaque, hwaddr addr,
             default:
                 break;
             case MINTR_RST_B:
-                escc_reset_chn(&serial->chn[0]);
+                escc_soft_reset_chn(&serial->chn[0]);
                 return;
             case MINTR_RST_A:
-                escc_reset_chn(&serial->chn[1]);
+                escc_soft_reset_chn(&serial->chn[1]);
                 return;
             case MINTR_RST_ALL:
                 escc_reset(DEVICE(serial));
-- 
2.20.1


