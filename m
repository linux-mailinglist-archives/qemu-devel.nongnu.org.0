Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 737244A3F7E
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 10:45:39 +0100 (CET)
Received: from localhost ([::1]:59048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nETFi-0004CQ-Hq
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 04:45:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ysato@users.sourceforge.jp>)
 id 1nETD5-0001i7-SF
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 04:42:55 -0500
Received: from mail02.asahi-net.or.jp ([202.224.55.14]:60748)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ysato@users.sourceforge.jp>) id 1nETD3-0000zT-SE
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 04:42:55 -0500
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23]) (Authenticated sender: PQ4Y-STU)
 by mail02.asahi-net.or.jp (Postfix) with ESMTPA id 77CCE206C5;
 Mon, 31 Jan 2022 18:42:51 +0900 (JST)
Received: from SIOS1075.ysato.name (ZM005235.ppp.dion.ne.jp [222.8.5.235])
 by sakura.ysato.name (Postfix) with ESMTPSA id 24E661C0023;
 Mon, 31 Jan 2022 18:42:51 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/char/renesas_sci: Add fifo buffer to backend interface.
Date: Mon, 31 Jan 2022 18:42:45 +0900
Message-Id: <20220131094246.772550-1-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=202.224.55.14;
 envelope-from=ysato@users.sourceforge.jp; helo=mail02.asahi-net.or.jp
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SCI does not have a fifo, it is necessary to send and receive
 at a bit rate speed.
But, qemu's chardev backend does not have a buffer,
 so it sends received data continuously.
By buffering the received data with the FIFO, continuous
 received data can be received.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 include/hw/char/renesas_sci.h |  11 ++-
 hw/char/renesas_sci.c         | 124 +++++++++++++++++++++++++---------
 2 files changed, 101 insertions(+), 34 deletions(-)

diff --git a/include/hw/char/renesas_sci.h b/include/hw/char/renesas_sci.h
index a4764e3eee..017711867a 100644
--- a/include/hw/char/renesas_sci.h
+++ b/include/hw/char/renesas_sci.h
@@ -12,6 +12,7 @@
 #include "chardev/char-fe.h"
 #include "hw/sysbus.h"
 #include "qom/object.h"
+#include "qemu/fifo8.h"
 
 #define TYPE_RENESAS_SCI "renesas-sci"
 typedef struct RSCIState RSCIState;
@@ -26,13 +27,18 @@ enum {
     SCI_NR_IRQ = 4
 };
 
+enum {
+    TXTIMER = 0,
+    RXTIMER = 1,
+    NR_TIMER = 2,
+};
+
 struct RSCIState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
 
     MemoryRegion memory;
-    QEMUTimer timer;
     CharBackend chr;
     qemu_irq irq[SCI_NR_IRQ];
 
@@ -47,8 +53,9 @@ struct RSCIState {
 
     uint8_t read_ssr;
     int64_t trtime;
-    int64_t rx_next;
     uint64_t input_freq;
+    Fifo8 rxfifo;
+    QEMUTimer timer[NR_TIMER];
 };
 
 #endif
diff --git a/hw/char/renesas_sci.c b/hw/char/renesas_sci.c
index 1c63467290..e6513a24b6 100644
--- a/hw/char/renesas_sci.c
+++ b/hw/char/renesas_sci.c
@@ -69,32 +69,63 @@ REG8(SEMR, 7)
   FIELD(SEMR, ACS0, 0, 1)
   FIELD(SEMR, ABCS, 4, 1)
 
-static int can_receive(void *opaque)
+enum {
+    RXFIFO_DEPTH = 16,
+};
+
+static void set_next_event(RSCIState *sci, int evt, int64_t expire)
 {
-    RSCIState *sci = RSCI(opaque);
-    if (sci->rx_next > qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)) {
-        return 0;
+    int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+
+    if (expire > 0) {
+        timer_mod(&sci->timer[evt], now + expire);
     } else {
-        return FIELD_EX8(sci->scr, SCR, RE);
+        timer_del(&sci->timer[evt]);
     }
 }
 
-static void receive(void *opaque, const uint8_t *buf, int size)
+static int can_receive(void *opaque)
 {
     RSCIState *sci = RSCI(opaque);
-    sci->rx_next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + sci->trtime;
-    if (FIELD_EX8(sci->ssr, SSR, RDRF) || size > 1) {
+    return FIELD_EX8(sci->scr, SCR, RE) ? fifo8_num_free(&sci->rxfifo) : 0;
+}
+
+static void sci_rx_event(void *opaque)
+{
+    RSCIState *sci = RSCI(opaque);
+    uint32_t rd;
+
+    if (fifo8_is_empty(&sci->rxfifo)) {
+        /* receiver idle state */
+        set_next_event(sci, RXTIMER, 0);
+        return;
+    }
+    rd = fifo8_pop(&sci->rxfifo);
+    if (FIELD_EX8(sci->ssr, SSR, RDRF)) {
+        /* Don't receive last byte */
         sci->ssr = FIELD_DP8(sci->ssr, SSR, ORER, 1);
         if (FIELD_EX8(sci->scr, SCR, RIE)) {
             qemu_set_irq(sci->irq[ERI], 1);
         }
     } else {
-        sci->rdr = buf[0];
+        sci->rdr = rd;
         sci->ssr = FIELD_DP8(sci->ssr, SSR, RDRF, 1);
         if (FIELD_EX8(sci->scr, SCR, RIE)) {
             qemu_irq_pulse(sci->irq[RXI]);
         }
     }
+    set_next_event(sci, RXTIMER, sci->trtime);
+}
+
+static void receive(void *opaque, const uint8_t *buf, int size)
+{
+    RSCIState *sci = RSCI(opaque);
+    fifo8_push_all(&sci->rxfifo, buf, size);
+
+    if (!timer_pending(&sci->timer[RXTIMER])) {
+        /* reciever idle state, start rx */
+        sci_rx_event(sci);
+    }
 }
 
 static void send_byte(RSCIState *sci)
@@ -102,22 +133,26 @@ static void send_byte(RSCIState *sci)
     if (qemu_chr_fe_backend_connected(&sci->chr)) {
         qemu_chr_fe_write_all(&sci->chr, &sci->tdr, 1);
     }
-    timer_mod(&sci->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + sci->trtime);
+    set_next_event(sci, TXTIMER, sci->trtime);
     sci->ssr = FIELD_DP8(sci->ssr, SSR, TEND, 0);
     sci->ssr = FIELD_DP8(sci->ssr, SSR, TDRE, 1);
     qemu_set_irq(sci->irq[TEI], 0);
-    if (FIELD_EX8(sci->scr, SCR, TIE)) {
+    if (FIELD_EX8(sci->scr, SCR, TE) && FIELD_EX8(sci->scr, SCR, TIE)) {
         qemu_irq_pulse(sci->irq[TXI]);
     }
 }
 
-static void txend(void *opaque)
+static void sci_tx_event(void *opaque)
 {
     RSCIState *sci = RSCI(opaque);
-    if (!FIELD_EX8(sci->ssr, SSR, TDRE)) {
+
+    if (FIELD_EX8(sci->ssr, SSR, TDRE) == 0) {
+        /* next tx ready */
         send_byte(sci);
     } else {
+        /* no next tx */
         sci->ssr = FIELD_DP8(sci->ssr, SSR, TEND, 1);
+        set_next_event(sci, TXTIMER, 0);
         if (FIELD_EX8(sci->scr, SCR, TEIE)) {
             qemu_set_irq(sci->irq[TEI], 1);
         }
@@ -126,15 +161,15 @@ static void txend(void *opaque)
 
 static void update_trtime(RSCIState *sci)
 {
+    int64_t baseclk = NANOSECONDS_PER_SECOND / sci->input_freq;
+    baseclk *= 64 - 32 * FIELD_EX8(sci->semr, SEMR, ABCS);
+    baseclk *= 1 << (2 * FIELD_EX8(sci->smr, SMR, CKS));
+    baseclk *= sci->brr + 1;
     /* char per bits */
     sci->trtime = 8 - FIELD_EX8(sci->smr, SMR, CHR);
     sci->trtime += FIELD_EX8(sci->smr, SMR, PE);
     sci->trtime += FIELD_EX8(sci->smr, SMR, STOP) + 1;
-    /* x bit transmit time (32 * divrate * brr) / base freq */
-    sci->trtime *= 32 * sci->brr;
-    sci->trtime *= 1 << (2 * FIELD_EX8(sci->smr, SMR, CKS));
-    sci->trtime *= NANOSECONDS_PER_SECOND;
-    sci->trtime /= sci->input_freq;
+    sci->trtime *= baseclk;
 }
 
 static bool sci_is_tr_enabled(RSCIState *sci)
@@ -151,23 +186,37 @@ static void sci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
         if (!sci_is_tr_enabled(sci)) {
             sci->smr = val;
             update_trtime(sci);
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR, "reneas_sci: Register 0x%"
+                          HWADDR_PRIX " write protected.\n", offset);
         }
         break;
     case A_BRR:
         if (!sci_is_tr_enabled(sci)) {
             sci->brr = val;
             update_trtime(sci);
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR, "reneas_sci: Register 0x%"
+                          HWADDR_PRIX " write protected.\n", offset);
         }
         break;
     case A_SCR:
-        sci->scr = val;
-        if (FIELD_EX8(sci->scr, SCR, TE)) {
-            sci->ssr = FIELD_DP8(sci->ssr, SSR, TDRE, 1);
-            sci->ssr = FIELD_DP8(sci->ssr, SSR, TEND, 1);
-            if (FIELD_EX8(sci->scr, SCR, TIE)) {
-                qemu_irq_pulse(sci->irq[TXI]);
+        if (FIELD_EX8(sci->scr, SCR, TE) != FIELD_EX8(val, SCR, TE)) {
+            if (FIELD_EX8(val, SCR, TE)) {
+                /* Disable -> Enable to reset TX*/
+                sci->ssr = FIELD_DP8(sci->ssr, SSR, TDRE, 1);
+                sci->ssr = FIELD_DP8(sci->ssr, SSR, TEND, 1);
+                if (FIELD_EX8(val, SCR, TIE)) {
+                    qemu_irq_pulse(sci->irq[TXI]);
+                }
+            } else {
+                /* disable TX clock */
+                set_next_event(sci, TXTIMER, 0);
+                sci->ssr = FIELD_DP8(sci->ssr, SSR, TDRE, 0);
+                sci->ssr = FIELD_DP8(sci->ssr, SSR, TEND, 1);
             }
         }
+        sci->scr = val;
         if (!FIELD_EX8(sci->scr, SCR, TEIE)) {
             qemu_set_irq(sci->irq[TEI], 0);
         }
@@ -177,10 +226,14 @@ static void sci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
         break;
     case A_TDR:
         sci->tdr = val;
-        if (FIELD_EX8(sci->ssr, SSR, TEND)) {
-            send_byte(sci);
+        if (FIELD_EX8(sci->scr, SCR, TE)) {
+            if (FIELD_EX8(sci->ssr, SSR, TEND)) {
+                send_byte(sci);
+            } else {
+                sci->ssr = FIELD_DP8(sci->ssr, SSR, TDRE, 0);
+            }
         } else {
-            sci->ssr = FIELD_DP8(sci->ssr, SSR, TDRE, 0);
+            qemu_log_mask(LOG_GUEST_ERROR, "reneas_sci: Transmit disabled.\n");
         }
         break;
     case A_SSR:
@@ -224,6 +277,9 @@ static uint64_t sci_read(void *opaque, hwaddr offset, unsigned size)
         sci->read_ssr = sci->ssr;
         return sci->ssr;
     case A_RDR:
+        if (!FIELD_EX8(sci->scr, SCR, RE)) {
+            qemu_log_mask(LOG_GUEST_ERROR, "reneas_sci: Receive disabled.\n");
+        }
         sci->ssr = FIELD_DP8(sci->ssr, SSR, RDRF, 0);
         return sci->rdr;
     case A_SCMR:
@@ -255,7 +311,7 @@ static void rsci_reset(DeviceState *dev)
     sci->ssr = 0x84;
     sci->scmr = 0x00;
     sci->semr = 0x00;
-    sci->rx_next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    update_trtime(sci);
 }
 
 static void sci_event(void *opaque, QEMUChrEvent event)
@@ -263,6 +319,7 @@ static void sci_event(void *opaque, QEMUChrEvent event)
     RSCIState *sci = RSCI(opaque);
     if (event == CHR_EVENT_BREAK) {
         sci->ssr = FIELD_DP8(sci->ssr, SSR, FER, 1);
+        sci->rdr = 0;
         if (FIELD_EX8(sci->scr, SCR, RIE)) {
             qemu_set_irq(sci->irq[ERI], 1);
         }
@@ -295,16 +352,19 @@ static void rsci_init(Object *obj)
     for (i = 0; i < SCI_NR_IRQ; i++) {
         sysbus_init_irq(d, &sci->irq[i]);
     }
-    timer_init_ns(&sci->timer, QEMU_CLOCK_VIRTUAL, txend, sci);
+    timer_init_ns(&sci->timer[TXTIMER],
+                  QEMU_CLOCK_VIRTUAL, sci_tx_event, sci);
+    timer_init_ns(&sci->timer[RXTIMER],
+                  QEMU_CLOCK_VIRTUAL, sci_rx_event, sci);
+    fifo8_create(&sci->rxfifo, RXFIFO_DEPTH);
 }
 
 static const VMStateDescription vmstate_rsci = {
     .name = "renesas-sci",
-    .version_id = 1,
+    .version_id = 2,
     .minimum_version_id = 1,
     .fields = (VMStateField[]) {
         VMSTATE_INT64(trtime, RSCIState),
-        VMSTATE_INT64(rx_next, RSCIState),
         VMSTATE_UINT8(smr, RSCIState),
         VMSTATE_UINT8(brr, RSCIState),
         VMSTATE_UINT8(scr, RSCIState),
@@ -314,7 +374,7 @@ static const VMStateDescription vmstate_rsci = {
         VMSTATE_UINT8(scmr, RSCIState),
         VMSTATE_UINT8(semr, RSCIState),
         VMSTATE_UINT8(read_ssr, RSCIState),
-        VMSTATE_TIMER(timer, RSCIState),
+        VMSTATE_TIMER_ARRAY(timer, RSCIState, NR_TIMER),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.30.2


