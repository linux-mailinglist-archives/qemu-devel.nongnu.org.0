Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 310E2403940
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 13:59:42 +0200 (CEST)
Received: from localhost ([::1]:39598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNwEv-0005XO-8t
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 07:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mNwAw-00066k-Kd
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 07:55:34 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:59050
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mNwAv-0005Y3-1f
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 07:55:34 -0400
Received: from host86-140-11-91.range86-140.btcentralplus.com ([86.140.11.91]
 helo=kentang.home) by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mNwAp-0009u6-VU; Wed, 08 Sep 2021 12:55:31 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Wed,  8 Sep 2021 12:54:46 +0100
Message-Id: <20210908115451.9821-8-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210908115451.9821-1-mark.cave-ayland@ilande.co.uk>
References: <20210908115451.9821-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.140.11.91
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 07/12] escc: introduce escc_hard_reset_chn() for hardware reset
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

This new hardware reset function is to be called for both channels when the
hardware reset bit is written to register WR9. Its initial implementation is
the same as the existing escc_reset_chn() function used for device reset.

Add a new trace event when the guest initiates a hard reset via the WR9 register
to help diagnose guest reset issues.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210903113223.19551-5-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/char/escc.c       | 38 +++++++++++++++++++++++++++++++++++++-
 hw/char/trace-events |  1 +
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/hw/char/escc.c b/hw/char/escc.c
index 697f15f383..806f593738 100644
--- a/hw/char/escc.c
+++ b/hw/char/escc.c
@@ -331,6 +331,40 @@ static void escc_soft_reset_chn(ESCCChannelState *s)
     clear_queue(s);
 }
 
+static void escc_hard_reset_chn(ESCCChannelState *s)
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
@@ -589,7 +623,9 @@ static void escc_mem_write(void *opaque, hwaddr addr,
                 escc_soft_reset_chn(&serial->chn[1]);
                 return;
             case MINTR_RST_ALL:
-                escc_reset(DEVICE(serial));
+                trace_escc_hard_reset();
+                escc_hard_reset_chn(&serial->chn[0]);
+                escc_hard_reset_chn(&serial->chn[1]);
                 return;
             }
             break;
diff --git a/hw/char/trace-events b/hw/char/trace-events
index 073f98ebe8..b774832af4 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -36,6 +36,7 @@ grlib_apbuart_writel_unknown(uint64_t addr, uint32_t value) "addr 0x%"PRIx64" va
 grlib_apbuart_readl_unknown(uint64_t addr) "addr 0x%"PRIx64
 
 # escc.c
+escc_hard_reset(void) "hard reset"
 escc_soft_reset_chn(char channel) "soft reset channel %c"
 escc_put_queue(char channel, int b) "channel %c put: 0x%02x"
 escc_get_queue(char channel, int val) "channel %c get 0x%02x"
-- 
2.20.1


