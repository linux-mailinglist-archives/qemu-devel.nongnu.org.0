Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 496743FEC14
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 12:24:13 +0200 (CEST)
Received: from localhost ([::1]:50782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLjtE-000871-B5
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 06:24:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mLjrX-0005aG-Rr
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 06:22:27 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57624
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mLjrV-0001Jo-AU
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 06:22:27 -0400
Received: from host86-133-17-27.range86-133.btcentralplus.com ([86.133.17.27]
 helo=kentang.home) by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mLjr2-0000t5-9T; Thu, 02 Sep 2021 11:22:01 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Thu,  2 Sep 2021 11:21:57 +0100
Message-Id: <20210902102205.7554-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210902102205.7554-1-mark.cave-ayland@ilande.co.uk>
References: <20210902102205.7554-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.133.17.27
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 1/9] escc: checkpatch fixes
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

Also fix a couple of spelling mistakes in comments.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/char/escc.c | 162 +++++++++++++++++++++++++++++--------------------
 1 file changed, 97 insertions(+), 65 deletions(-)

diff --git a/hw/char/escc.c b/hw/char/escc.c
index 52e7978287..c87ecd59d8 100644
--- a/hw/char/escc.c
+++ b/hw/char/escc.c
@@ -230,20 +230,23 @@ static uint32_t get_queue(void *opaque)
         q->count--;
     }
     trace_escc_get_queue(CHN_C(s), val);
-    if (q->count > 0)
+    if (q->count > 0) {
         serial_receive_byte(s, 0);
+    }
     return val;
 }
 
 static int escc_update_irq_chn(ESCCChannelState *s)
 {
     if ((((s->wregs[W_INTR] & INTR_TXINT) && (s->txint == 1)) ||
-         // tx ints enabled, pending
-         ((((s->wregs[W_INTR] & INTR_RXMODEMSK) == INTR_RXINT1ST) ||
-           ((s->wregs[W_INTR] & INTR_RXMODEMSK) == INTR_RXINTALL)) &&
-          s->rxint == 1) || // rx ints enabled, pending
-         ((s->wregs[W_EXTINT] & EXTINT_BRKINT) &&
-          (s->rregs[R_STATUS] & STATUS_BRK)))) { // break int e&p
+        /* tx ints enabled, pending */
+        ((((s->wregs[W_INTR] & INTR_RXMODEMSK) == INTR_RXINT1ST) ||
+        ((s->wregs[W_INTR] & INTR_RXMODEMSK) == INTR_RXINTALL)) &&
+            s->rxint == 1) ||
+        /* rx ints enabled, pending */
+        ((s->wregs[W_EXTINT] & EXTINT_BRKINT) &&
+            (s->rregs[R_STATUS] & STATUS_BRK)))) {
+        /* break int e&p */
         return 1;
     }
     return 0;
@@ -269,17 +272,22 @@ static void escc_reset_chn(ESCCChannelState *s)
         s->rregs[i] = 0;
         s->wregs[i] = 0;
     }
-    s->wregs[W_TXCTRL1] = TXCTRL1_1STOP; // 1X divisor, 1 stop bit, no parity
+    /* 1X divisor, 1 stop bit, no parity */
+    s->wregs[W_TXCTRL1] = TXCTRL1_1STOP;
     s->wregs[W_MINTR] = MINTR_RST_ALL;
-    s->wregs[W_CLOCK] = CLOCK_TRXC; // Synch mode tx clock = TRxC
-    s->wregs[W_MISC2] = MISC2_PLLDIS; // PLL disabled
+    /* Synch mode tx clock = TRxC */
+    s->wregs[W_CLOCK] = CLOCK_TRXC;
+    /* PLL disabled */
+    s->wregs[W_MISC2] = MISC2_PLLDIS;
+    /* Enable most interrupts */
     s->wregs[W_EXTINT] = EXTINT_DCD | EXTINT_SYNCINT | EXTINT_CTSINT |
-        EXTINT_TXUNDRN | EXTINT_BRKINT; // Enable most interrupts
-    if (s->disabled)
+                         EXTINT_TXUNDRN | EXTINT_BRKINT;
+    if (s->disabled) {
         s->rregs[R_STATUS] = STATUS_TXEMPTY | STATUS_DCD | STATUS_SYNC |
-            STATUS_CTS | STATUS_TXUNDRN;
-    else
+                             STATUS_CTS | STATUS_TXUNDRN;
+    } else {
         s->rregs[R_STATUS] = STATUS_TXEMPTY | STATUS_TXUNDRN;
+    }
     s->rregs[R_SPEC] = SPEC_BITS8 | SPEC_ALLSENT;
 
     s->rx = s->tx = 0;
@@ -300,21 +308,25 @@ static void escc_reset(DeviceState *d)
 static inline void set_rxint(ESCCChannelState *s)
 {
     s->rxint = 1;
-    /* XXX: missing daisy chainnig: escc_chn_b rx should have a lower priority
-       than chn_a rx/tx/special_condition service*/
+    /*
+     * XXX: missing daisy chaining: escc_chn_b rx should have a lower priority
+     * than chn_a rx/tx/special_condition service
+     */
     s->rxint_under_svc = 1;
     if (s->chn == escc_chn_a) {
         s->rregs[R_INTR] |= INTR_RXINTA;
-        if (s->wregs[W_MINTR] & MINTR_STATUSHI)
+        if (s->wregs[W_MINTR] & MINTR_STATUSHI) {
             s->otherchn->rregs[R_IVEC] = IVEC_HIRXINTA;
-        else
+        } else {
             s->otherchn->rregs[R_IVEC] = IVEC_LORXINTA;
+        }
     } else {
         s->otherchn->rregs[R_INTR] |= INTR_RXINTB;
-        if (s->wregs[W_MINTR] & MINTR_STATUSHI)
+        if (s->wregs[W_MINTR] & MINTR_STATUSHI) {
             s->rregs[R_IVEC] = IVEC_HIRXINTB;
-        else
+        } else {
             s->rregs[R_IVEC] = IVEC_LORXINTB;
+        }
     }
     escc_update_irq(s);
 }
@@ -328,17 +340,18 @@ static inline void set_txint(ESCCChannelState *s)
             if (s->wregs[W_INTR] & INTR_TXINT) {
                 s->rregs[R_INTR] |= INTR_TXINTA;
             }
-            if (s->wregs[W_MINTR] & MINTR_STATUSHI)
+            if (s->wregs[W_MINTR] & MINTR_STATUSHI) {
                 s->otherchn->rregs[R_IVEC] = IVEC_HITXINTA;
-            else
+            } else {
                 s->otherchn->rregs[R_IVEC] = IVEC_LOTXINTA;
+            }
         } else {
             s->rregs[R_IVEC] = IVEC_TXINTB;
             if (s->wregs[W_INTR] & INTR_TXINT) {
                 s->otherchn->rregs[R_INTR] |= INTR_TXINTB;
             }
         }
-    escc_update_irq(s);
+        escc_update_irq(s);
     }
 }
 
@@ -347,20 +360,23 @@ static inline void clr_rxint(ESCCChannelState *s)
     s->rxint = 0;
     s->rxint_under_svc = 0;
     if (s->chn == escc_chn_a) {
-        if (s->wregs[W_MINTR] & MINTR_STATUSHI)
+        if (s->wregs[W_MINTR] & MINTR_STATUSHI) {
             s->otherchn->rregs[R_IVEC] = IVEC_HINOINT;
-        else
+        } else {
             s->otherchn->rregs[R_IVEC] = IVEC_LONOINT;
+        }
         s->rregs[R_INTR] &= ~INTR_RXINTA;
     } else {
-        if (s->wregs[W_MINTR] & MINTR_STATUSHI)
+        if (s->wregs[W_MINTR] & MINTR_STATUSHI) {
             s->rregs[R_IVEC] = IVEC_HINOINT;
-        else
+        } else {
             s->rregs[R_IVEC] = IVEC_LONOINT;
+        }
         s->otherchn->rregs[R_INTR] &= ~INTR_RXINTB;
     }
-    if (s->txint)
+    if (s->txint) {
         set_txint(s);
+    }
     escc_update_irq(s);
 }
 
@@ -369,21 +385,24 @@ static inline void clr_txint(ESCCChannelState *s)
     s->txint = 0;
     s->txint_under_svc = 0;
     if (s->chn == escc_chn_a) {
-        if (s->wregs[W_MINTR] & MINTR_STATUSHI)
+        if (s->wregs[W_MINTR] & MINTR_STATUSHI) {
             s->otherchn->rregs[R_IVEC] = IVEC_HINOINT;
-        else
+        } else {
             s->otherchn->rregs[R_IVEC] = IVEC_LONOINT;
+        }
         s->rregs[R_INTR] &= ~INTR_TXINTA;
     } else {
         s->otherchn->rregs[R_INTR] &= ~INTR_TXINTB;
-        if (s->wregs[W_MINTR] & MINTR_STATUSHI)
+        if (s->wregs[W_MINTR] & MINTR_STATUSHI) {
             s->rregs[R_IVEC] = IVEC_HINOINT;
-        else
+        } else {
             s->rregs[R_IVEC] = IVEC_LONOINT;
+        }
         s->otherchn->rregs[R_INTR] &= ~INTR_TXINTB;
     }
-    if (s->rxint)
+    if (s->rxint) {
         set_rxint(s);
+    }
     escc_update_irq(s);
 }
 
@@ -392,21 +411,24 @@ static void escc_update_parameters(ESCCChannelState *s)
     int speed, parity, data_bits, stop_bits;
     QEMUSerialSetParams ssp;
 
-    if (!qemu_chr_fe_backend_connected(&s->chr) || s->type != escc_serial)
+    if (!qemu_chr_fe_backend_connected(&s->chr) || s->type != escc_serial) {
         return;
+    }
 
     if (s->wregs[W_TXCTRL1] & TXCTRL1_PAREN) {
-        if (s->wregs[W_TXCTRL1] & TXCTRL1_PAREV)
+        if (s->wregs[W_TXCTRL1] & TXCTRL1_PAREV) {
             parity = 'E';
-        else
+        } else {
             parity = 'O';
+        }
     } else {
         parity = 'N';
     }
-    if ((s->wregs[W_TXCTRL1] & TXCTRL1_STPMSK) == TXCTRL1_2STOP)
+    if ((s->wregs[W_TXCTRL1] & TXCTRL1_STPMSK) == TXCTRL1_2STOP) {
         stop_bits = 2;
-    else
+    } else {
         stop_bits = 1;
+    }
     switch (s->wregs[W_TXCTRL2] & TXCTRL2_BITMSK) {
     case TXCTRL2_5BITS:
         data_bits = 5;
@@ -523,10 +545,11 @@ static void escc_mem_write(void *opaque, hwaddr addr,
         default:
             break;
         }
-        if (s->reg == 0)
+        if (s->reg == 0) {
             s->reg = newreg;
-        else
+        } else {
             s->reg = 0;
+        }
         break;
     case SERIAL_DATA:
         trace_escc_mem_writeb_data(CHN_C(s), val);
@@ -538,17 +561,19 @@ static void escc_mem_write(void *opaque, hwaddr addr,
         s->txint = 0;
         escc_update_irq(s);
         s->tx = val;
-        if (s->wregs[W_TXCTRL2] & TXCTRL2_TXEN) { // tx enabled
+        if (s->wregs[W_TXCTRL2] & TXCTRL2_TXEN) { /* tx enabled */
             if (qemu_chr_fe_backend_connected(&s->chr)) {
-                /* XXX this blocks entire thread. Rewrite to use
-                 * qemu_chr_fe_write and background I/O callbacks */
+                /*
+                 * XXX this blocks entire thread. Rewrite to use
+                 * qemu_chr_fe_write and background I/O callbacks
+                 */
                 qemu_chr_fe_write_all(&s->chr, &s->tx, 1);
             } else if (s->type == escc_kbd && !s->disabled) {
                 handle_kbd_command(s, val);
             }
         }
-        s->rregs[R_STATUS] |= STATUS_TXEMPTY; // Tx buffer empty
-        s->rregs[R_SPEC] |= SPEC_ALLSENT; // All sent
+        s->rregs[R_STATUS] |= STATUS_TXEMPTY; /* Tx buffer empty */
+        s->rregs[R_SPEC] |= SPEC_ALLSENT; /* All sent */
         set_txint(s);
         break;
     default:
@@ -606,12 +631,13 @@ static int serial_can_receive(void *opaque)
     ESCCChannelState *s = opaque;
     int ret;
 
-    if (((s->wregs[W_RXCTRL] & RXCTRL_RXEN) == 0) // Rx not enabled
-        || ((s->rregs[R_STATUS] & STATUS_RXAV) == STATUS_RXAV))
-        // char already available
+    if (((s->wregs[W_RXCTRL] & RXCTRL_RXEN) == 0) /* Rx not enabled */
+        || ((s->rregs[R_STATUS] & STATUS_RXAV) == STATUS_RXAV)) {
+        /* char already available */
         ret = 0;
-    else
+    } else {
         ret = 1;
+    }
     return ret;
 }
 
@@ -638,12 +664,13 @@ static void serial_receive1(void *opaque, const uint8_t *buf, int size)
 static void serial_event(void *opaque, QEMUChrEvent event)
 {
     ESCCChannelState *s = opaque;
-    if (event == CHR_EVENT_BREAK)
+    if (event == CHR_EVENT_BREAK) {
         serial_receive_break(s);
+    }
 }
 
 static const VMStateDescription vmstate_escc_chn = {
-    .name ="escc_chn",
+    .name = "escc_chn",
     .version_id = 2,
     .minimum_version_id = 1,
     .fields = (VMStateField[]) {
@@ -662,7 +689,7 @@ static const VMStateDescription vmstate_escc_chn = {
 };
 
 static const VMStateDescription vmstate_escc = {
-    .name ="escc",
+    .name = "escc",
     .version_id = 2,
     .minimum_version_id = 1,
     .fields = (VMStateField[]) {
@@ -734,21 +761,21 @@ static QemuInputHandler sunkbd_handler = {
 static void handle_kbd_command(ESCCChannelState *s, int val)
 {
     trace_escc_kbd_command(val);
-    if (s->led_mode) { // Ignore led byte
+    if (s->led_mode) { /* Ignore led byte */
         s->led_mode = 0;
         return;
     }
     switch (val) {
-    case 1: // Reset, return type code
+    case 1: /* Reset, return type code */
         clear_queue(s);
         put_queue(s, 0xff);
-        put_queue(s, 4); // Type 4
+        put_queue(s, 4); /* Type 4 */
         put_queue(s, 0x7f);
         break;
-    case 0xe: // Set leds
+    case 0xe: /* Set leds */
         s->led_mode = 1;
         break;
-    case 7: // Query layout
+    case 7: /* Query layout */
     case 0xf:
         clear_queue(s);
         put_queue(s, 0xfe);
@@ -768,34 +795,39 @@ static void sunmouse_event(void *opaque,
     trace_escc_sunmouse_event(dx, dy, buttons_state);
     ch = 0x80 | 0x7; /* protocol start byte, no buttons pressed */
 
-    if (buttons_state & MOUSE_EVENT_LBUTTON)
+    if (buttons_state & MOUSE_EVENT_LBUTTON) {
         ch ^= 0x4;
-    if (buttons_state & MOUSE_EVENT_MBUTTON)
+    }
+    if (buttons_state & MOUSE_EVENT_MBUTTON) {
         ch ^= 0x2;
-    if (buttons_state & MOUSE_EVENT_RBUTTON)
+    }
+    if (buttons_state & MOUSE_EVENT_RBUTTON) {
         ch ^= 0x1;
+    }
 
     put_queue(s, ch);
 
     ch = dx;
 
-    if (ch > 127)
+    if (ch > 127) {
         ch = 127;
-    else if (ch < -127)
+    } else if (ch < -127) {
         ch = -127;
+    }
 
     put_queue(s, ch & 0xff);
 
     ch = -dy;
 
-    if (ch > 127)
+    if (ch > 127) {
         ch = 127;
-    else if (ch < -127)
+    } else if (ch < -127) {
         ch = -127;
+    }
 
     put_queue(s, ch & 0xff);
 
-    // MSC protocol specify two extra motion bytes
+    /* MSC protocol specifies two extra motion bytes */
 
     put_queue(s, 0);
     put_queue(s, 0);
-- 
2.20.1


