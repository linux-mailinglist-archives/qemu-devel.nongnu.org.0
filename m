Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FE93A95FC
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 11:22:37 +0200 (CEST)
Received: from localhost ([::1]:43332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltRkq-0007mV-Kz
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 05:22:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ysato@users.sourceforge.jp>)
 id 1ltRbX-0004iq-G0
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 05:12:59 -0400
Received: from mail02.asahi-net.or.jp ([202.224.55.14]:57991)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ysato@users.sourceforge.jp>) id 1ltRbS-00048h-Nv
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 05:12:59 -0400
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23]) (Authenticated sender: PQ4Y-STU)
 by mail02.asahi-net.or.jp (Postfix) with ESMTPA id BC00844A4D;
 Wed, 16 Jun 2021 18:12:50 +0900 (JST)
Received: from yo-satoh-debian.localdomain
 (z215167.dynamic.ppp.asahi-net.or.jp [110.4.215.167])
 by sakura.ysato.name (Postfix) with ESMTPSA id 2D89F1C05E1;
 Wed, 16 Jun 2021 18:12:50 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] hw/char: renesas_sci: Refactor for merge all SCI variant..
Date: Wed, 16 Jun 2021 18:12:42 +0900
Message-Id: <20210616091244.33049-2-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210616091244.33049-1-ysato@users.sourceforge.jp>
References: <20210616091244.33049-1-ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=202.224.55.14;
 envelope-from=ysato@users.sourceforge.jp; helo=mail02.asahi-net.or.jp
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_VALIDITY_RPBL=1.31, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In order to handle unified all of the SCI, SCIa and SCIF in one part,
to separate the transmission and reception portion and a register portion.

RenesasSCIBase - common registers operation and event handling.
RenesasSCIA - SCIa specific reigisters / functions.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 include/hw/char/renesas_sci.h |  80 ++++-
 include/hw/rx/rx62n.h         |   2 +-
 hw/char/renesas_sci.c         | 568 +++++++++++++++++++++++-----------
 hw/rx/rx62n.c                 |   2 +-
 4 files changed, 457 insertions(+), 195 deletions(-)

diff --git a/include/hw/char/renesas_sci.h b/include/hw/char/renesas_sci.h
index a4764e3eee..c666cf81d1 100644
--- a/include/hw/char/renesas_sci.h
+++ b/include/hw/char/renesas_sci.h
@@ -1,7 +1,7 @@
 /*
  * Renesas Serial Communication Interface
  *
- * Copyright (c) 2018 Yoshinori Sato
+ * Copyright (c) 2020 Yoshinori Sato
  *
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
@@ -10,45 +10,91 @@
 #define HW_CHAR_RENESAS_SCI_H
 
 #include "chardev/char-fe.h"
+#include "qemu/timer.h"
+#include "qemu/fifo8.h"
 #include "hw/sysbus.h"
 #include "qom/object.h"
 
-#define TYPE_RENESAS_SCI "renesas-sci"
-typedef struct RSCIState RSCIState;
-DECLARE_INSTANCE_CHECKER(RSCIState, RSCI,
-                         TYPE_RENESAS_SCI)
+#define TYPE_RENESAS_SCI_BASE "renesas-sci-base"
+#define TYPE_RENESAS_SCIA "renesas-scia"
+
+OBJECT_DECLARE_TYPE(RenesasSCIBaseState, RenesasSCIBaseClass,
+                    RENESAS_SCI_BASE)
+OBJECT_DECLARE_TYPE(RenesasSCIAState, RenesasSCIAClass,
+                    RENESAS_SCIA)
 
 enum {
     ERI = 0,
     RXI = 1,
     TXI = 2,
-    TEI = 3,
-    SCI_NR_IRQ = 4
+    BRI_TEI = 3,
+    SCI_NR_IRQ = 4,
+};
+
+enum {
+    RXNEXT,
+    TXEMPTY,
+    TXEND,
+    NR_SCI_EVENT,
 };
 
-struct RSCIState {
+enum {
+    SCI_REGWIDTH_8 = 8,
+    SCI_REGWIDTH_16 = 16,
+    SCI_REGWIDTH_32 = 32,
+};
+
+typedef struct RenesasSCIBaseState {
     /*< private >*/
     SysBusDevice parent_obj;
-    /*< public >*/
 
     MemoryRegion memory;
-    QEMUTimer timer;
+    QEMUTimer *event_timer;
+
+    /*< public >*/
+    uint64_t input_freq;
+    int64_t etu;
+    int64_t trtime;
+    int64_t tx_start_time;
+    Fifo8 rxfifo;
+    int regshift;
+    uint32_t unit;
     CharBackend chr;
     qemu_irq irq[SCI_NR_IRQ];
+    struct {
+        int64_t time;
+        int64_t (*handler)(struct RenesasSCIBaseState *sci);
+    } event[NR_SCI_EVENT];
 
+    /* common SCI register */
     uint8_t smr;
     uint8_t brr;
     uint8_t scr;
     uint8_t tdr;
-    uint8_t ssr;
-    uint8_t rdr;
+    uint16_t Xsr;
+} RenesasSCIBaseState;
+
+struct RenesasSCIAState {
+    RenesasSCIBaseState parent_obj;
+
+    /* SCIa specific register */
     uint8_t scmr;
     uint8_t semr;
-
-    uint8_t read_ssr;
-    int64_t trtime;
-    int64_t rx_next;
-    uint64_t input_freq;
 };
 
+typedef struct RenesasSCIBaseClass {
+    SysBusDeviceClass parent;
+
+    const struct MemoryRegionOps *ops;
+    void (*irq_fn)(struct RenesasSCIBaseState *sci, int request);
+    int (*divrate)(struct RenesasSCIBaseState *sci);
+} RenesasSCIBaseClass;
+
+typedef struct RenesasSCIAClass {
+    RenesasSCIBaseClass parent;
+
+    void (*p_irq_fn)(struct RenesasSCIBaseState *sci, int request);
+    int (*p_divrate)(struct RenesasSCIBaseState *sci);
+} RenesasSCIAClass;
+
 #endif
diff --git a/include/hw/rx/rx62n.h b/include/hw/rx/rx62n.h
index 3ed80dba0d..d6e6e168f9 100644
--- a/include/hw/rx/rx62n.h
+++ b/include/hw/rx/rx62n.h
@@ -57,7 +57,7 @@ struct RX62NState {
     RXICUState icu;
     RTMRState tmr[RX62N_NR_TMR];
     RCMTState cmt[RX62N_NR_CMT];
-    RSCIState sci[RX62N_NR_SCI];
+    RenesasSCIAState sci[RX62N_NR_SCI];
 
     MemoryRegion *sysmem;
     bool kernel;
diff --git a/hw/char/renesas_sci.c b/hw/char/renesas_sci.c
index 1c63467290..c1126b7817 100644
--- a/hw/char/renesas_sci.c
+++ b/hw/char/renesas_sci.c
@@ -4,7 +4,7 @@
  * Datasheet: RX62N Group, RX621 Group User's Manual: Hardware
  *            (Rev.1.40 R01UH0033EJ0140)
  *
- * Copyright (c) 2019 Yoshinori Sato
+ * Copyright (c) 2020 Yoshinori Sato
  *
  * SPDX-License-Identifier: GPL-2.0-or-later
  *
@@ -23,15 +23,22 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "qapi/error.h"
+#include "qemu-common.h"
+#include "hw/hw.h"
 #include "hw/irq.h"
+#include "hw/sysbus.h"
 #include "hw/registerfields.h"
-#include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
 #include "hw/char/renesas_sci.h"
 #include "migration/vmstate.h"
+#include "qemu/error-report.h"
 
-/* SCI register map */
-REG8(SMR, 0)
+/*
+ * SCI register map
+ * SCI(a) register size all 8bit.
+ */
+REG32(SMR, 0) /* 8bit */
   FIELD(SMR, CKS,  0, 2)
   FIELD(SMR, MP,   2, 1)
   FIELD(SMR, STOP, 3, 1)
@@ -39,263 +46,447 @@ REG8(SMR, 0)
   FIELD(SMR, PE,   5, 1)
   FIELD(SMR, CHR,  6, 1)
   FIELD(SMR, CM,   7, 1)
-REG8(BRR, 1)
-REG8(SCR, 2)
-  FIELD(SCR, CKE,  0, 2)
+REG32(BRR, 4) /* 8bit */
+REG32(SCR, 8)
+  FIELD(SCR, CKE, 0, 2)
   FIELD(SCR, TEIE, 2, 1)
   FIELD(SCR, MPIE, 3, 1)
+  FIELD(SCR, REIE, 3, 1)
   FIELD(SCR, RE,   4, 1)
   FIELD(SCR, TE,   5, 1)
   FIELD(SCR, RIE,  6, 1)
   FIELD(SCR, TIE,  7, 1)
-REG8(TDR, 3)
-REG8(SSR, 4)
+REG32(TDR, 12) /* 8bit */
+REG32(SSR, 16) /* 8bit */
   FIELD(SSR, MPBT, 0, 1)
   FIELD(SSR, MPB,  1, 1)
   FIELD(SSR, TEND, 2, 1)
-  FIELD(SSR, ERR,  3, 3)
+  FIELD(SSR, ERR, 3, 3)
     FIELD(SSR, PER,  3, 1)
     FIELD(SSR, FER,  4, 1)
     FIELD(SSR, ORER, 5, 1)
   FIELD(SSR, RDRF, 6, 1)
   FIELD(SSR, TDRE, 7, 1)
-REG8(RDR, 5)
-REG8(SCMR, 6)
+REG32(RDR, 20) /* 8bit */
+REG32(SCMR, 24) /* 8bit */
   FIELD(SCMR, SMIF, 0, 1)
   FIELD(SCMR, SINV, 2, 1)
   FIELD(SCMR, SDIR, 3, 1)
   FIELD(SCMR, BCP2, 7, 1)
-REG8(SEMR, 7)
+REG8(SEMR, 28)
   FIELD(SEMR, ACS0, 0, 1)
   FIELD(SEMR, ABCS, 4, 1)
 
-static int can_receive(void *opaque)
+#define SCIF_FIFO_DEPTH 16
+
+static int sci_can_receive(void *opaque)
 {
-    RSCIState *sci = RSCI(opaque);
-    if (sci->rx_next > qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)) {
-        return 0;
+    RenesasSCIBaseState *sci = RENESAS_SCI_BASE(opaque);
+    if (FIELD_EX16(sci->scr, SCR, RE)) {
+        return fifo8_num_free(&sci->rxfifo);
     } else {
-        return FIELD_EX8(sci->scr, SCR, RE);
+        /* Receiver disabled. can't receive. */
+        return 0;
     }
 }
 
-static void receive(void *opaque, const uint8_t *buf, int size)
+static void update_expire_time(RenesasSCIBaseState *sci)
 {
-    RSCIState *sci = RSCI(opaque);
-    sci->rx_next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + sci->trtime;
-    if (FIELD_EX8(sci->ssr, SSR, RDRF) || size > 1) {
-        sci->ssr = FIELD_DP8(sci->ssr, SSR, ORER, 1);
-        if (FIELD_EX8(sci->scr, SCR, RIE)) {
-            qemu_set_irq(sci->irq[ERI], 1);
+    int64_t next;
+    int i;
+
+    next = INT64_MAX;
+    for (i = 0; i < NR_SCI_EVENT; i++) {
+        if (sci->event[i].time > 0) {
+            next = MIN(next, sci->event[i].time);
         }
+    }
+    if (next < INT64_MAX) {
+        timer_mod(sci->event_timer, next);
     } else {
-        sci->rdr = buf[0];
-        sci->ssr = FIELD_DP8(sci->ssr, SSR, RDRF, 1);
-        if (FIELD_EX8(sci->scr, SCR, RIE)) {
-            qemu_irq_pulse(sci->irq[RXI]);
+        timer_del(sci->event_timer);
+    }
+}
+
+static void update_event_time(RenesasSCIBaseState *sci, int evt, int64_t t)
+{
+    if (t > 0) {
+        t +=  qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        sci->event[evt].time = t;
+    } else {
+        sci->event[evt].time = 0;
+    }
+    update_expire_time(sci);
+}
+
+static void sci_receive(void *opaque, const uint8_t *buf, int size)
+{
+    RenesasSCIBaseState *sci = RENESAS_SCI_BASE(opaque);
+    RenesasSCIBaseClass *rc = RENESAS_SCI_BASE_GET_CLASS(sci);
+    fifo8_push_all(&sci->rxfifo, buf, size);
+    if (FIELD_EX16(sci->scr, SCR, RE)) {
+        if (sci->event[RXNEXT].time == 0) {
+            /* Receiver wake up */
+            sci->Xsr = FIELD_DP16(sci->Xsr, SSR, RDRF, 1);
+            rc->irq_fn(sci, RXI);
+            update_event_time(sci, RXNEXT, sci->trtime);
         }
     }
 }
 
-static void send_byte(RSCIState *sci)
+static void scia_irq(RenesasSCIBaseState *sci, int req)
+{
+    int irq = 0;
+    int rie;
+    int tie;
+
+    rie = FIELD_EX16(sci->scr, SCR, RIE);
+    tie = FIELD_EX16(sci->scr, SCR, TIE);
+    switch (req) {
+    case ERI:
+        irq = (FIELD_EX16(sci->Xsr, SSR, ERR) != 0) && rie;
+        break;
+    case RXI:
+        irq = FIELD_EX16(sci->Xsr, SSR, RDRF) && rie;
+        break;
+    case TXI:
+        irq = FIELD_EX16(sci->Xsr, SSR, TDRE) && tie;
+        break;
+    case BRI_TEI:
+        irq = FIELD_EX16(sci->Xsr, SSR, TEND) &&
+            FIELD_EX16(sci->scr, SCR, TEIE);
+        break;
+    }
+    if (req == RXI || req == TXI) {
+        if (irq) {
+            qemu_irq_pulse(sci->irq[req]);
+        }
+    } else {
+        qemu_set_irq(sci->irq[req], irq);
+    }
+}
+
+static void sci_send_byte(RenesasSCIBaseState *sci)
 {
     if (qemu_chr_fe_backend_connected(&sci->chr)) {
         qemu_chr_fe_write_all(&sci->chr, &sci->tdr, 1);
     }
-    timer_mod(&sci->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + sci->trtime);
-    sci->ssr = FIELD_DP8(sci->ssr, SSR, TEND, 0);
-    sci->ssr = FIELD_DP8(sci->ssr, SSR, TDRE, 1);
-    qemu_set_irq(sci->irq[TEI], 0);
-    if (FIELD_EX8(sci->scr, SCR, TIE)) {
-        qemu_irq_pulse(sci->irq[TXI]);
+    sci->Xsr = FIELD_DP16(sci->Xsr, SSR, TEND, 0);
+    sci->Xsr = FIELD_DP16(sci->Xsr, SSR, TDRE, 1);
+}
+
+static int64_t sci_rx_next(RenesasSCIBaseState *sci)
+{
+    RenesasSCIBaseClass *rc = RENESAS_SCI_BASE_GET_CLASS(sci);
+    if (!fifo8_is_empty(&sci->rxfifo)) {
+        /* have receive charactor */
+        if (FIELD_EX16(sci->Xsr, SSR, RDRF)) {
+            /* Receiver overrun */
+            sci->Xsr = FIELD_DP16(sci->Xsr, SSR, ORER, 1);
+            rc->irq_fn(sci, ERI);
+            return 0;
+        }
+        sci->Xsr = FIELD_DP16(sci->Xsr, SSR, RDRF, 1);
+        rc->irq_fn(sci, RXI);
+        /* next receive time */
+        return sci->trtime;
+    } else {
+        /* No receive charactor. move to idle state */
+        return 0;
     }
 }
 
-static void txend(void *opaque)
+static int64_t sci_tx_empty(RenesasSCIBaseState *sci)
 {
-    RSCIState *sci = RSCI(opaque);
-    if (!FIELD_EX8(sci->ssr, SSR, TDRE)) {
-        send_byte(sci);
+    int64_t ret = 0;
+    RenesasSCIBaseClass *rc = RENESAS_SCI_BASE_GET_CLASS(sci);
+    if (!FIELD_EX16(sci->Xsr, SSR, TDRE)) {
+        sci_send_byte(sci);
+        ret = sci->trtime;
+        rc->irq_fn(sci, TXI);
     } else {
-        sci->ssr = FIELD_DP8(sci->ssr, SSR, TEND, 1);
-        if (FIELD_EX8(sci->scr, SCR, TEIE)) {
-            qemu_set_irq(sci->irq[TEI], 1);
+        sci->Xsr = FIELD_DP16(sci->Xsr, SSR, TEND, 1);
+        rc->irq_fn(sci, BRI_TEI);
+    }
+    return ret;
+}
+
+static void sci_timer_event(void *opaque)
+{
+    RenesasSCIBaseState *sci = RENESAS_SCI_BASE(opaque);
+    int64_t now, t;
+    int i;
+
+    now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    for (i = 0; i < NR_SCI_EVENT; i++) {
+        if (sci->event[i].time > 0 && sci->event[i].time <= now) {
+            t = sci->event[i].handler(sci);
+            if (t > 0) {
+                sci->event[i].time = now + t;
+            } else {
+                /* No next event */
+                sci->event[i].time = 0;
+            }
         }
     }
+    update_expire_time(sci);
 }
 
-static void update_trtime(RSCIState *sci)
+static int scia_divrate(RenesasSCIBaseState *sci)
 {
-    /* char per bits */
-    sci->trtime = 8 - FIELD_EX8(sci->smr, SMR, CHR);
-    sci->trtime += FIELD_EX8(sci->smr, SMR, PE);
-    sci->trtime += FIELD_EX8(sci->smr, SMR, STOP) + 1;
-    /* x bit transmit time (32 * divrate * brr) / base freq */
-    sci->trtime *= 32 * sci->brr;
-    sci->trtime *= 1 << (2 * FIELD_EX8(sci->smr, SMR, CKS));
-    sci->trtime *= NANOSECONDS_PER_SECOND;
-    sci->trtime /= sci->input_freq;
+    /*
+     * SEMR.ABCS = 0 -> 32
+     * SEMR.ABCS = 1 -> 16
+     */
+    RenesasSCIAState *scia = RENESAS_SCIA(sci);
+    return 16 * (2 - FIELD_EX8(scia->semr, SEMR, ABCS));
 }
 
-static bool sci_is_tr_enabled(RSCIState *sci)
+static void update_trtime(RenesasSCIBaseState *sci)
 {
-    return FIELD_EX8(sci->scr, SCR, TE) || FIELD_EX8(sci->scr, SCR, RE);
+    RenesasSCIBaseClass *rc = RENESAS_SCI_BASE_GET_CLASS(sci);
+    int cks = 1 << (2 * FIELD_EX16(sci->smr, SMR, CKS));
+    if (sci->input_freq > 0) {
+        /* x bit transmit time (divrate * brr) / base freq */
+        sci->etu = rc->divrate(sci) * cks;
+        sci->etu *= sci->brr + 1;
+        sci->etu *= NANOSECONDS_PER_SECOND;
+        sci->etu /= sci->input_freq;
+
+        /* char per bits */
+        sci->trtime = 8 - FIELD_EX16(sci->smr, SMR, CHR);
+        sci->trtime += FIELD_EX16(sci->smr, SMR, PE);
+        sci->trtime += FIELD_EX16(sci->smr, SMR, STOP) + 1 + 1;
+        sci->trtime *= sci->etu;
+    }
 }
 
-static void sci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
+#define IS_TR_ENABLED(scr) \
+    (FIELD_EX16(scr, SCR, TE) || FIELD_EX16(scr, SCR, RE))
+
+static hwaddr map_address(RenesasSCIBaseState *sci, hwaddr addr)
 {
-    RSCIState *sci = RSCI(opaque);
+    return addr << (2 - sci->regshift);
+}
 
-    switch (offset) {
-    case A_SMR:
-        if (!sci_is_tr_enabled(sci)) {
-            sci->smr = val;
-            update_trtime(sci);
+static void sci_common_write(void *opaque, hwaddr addr,
+                             uint64_t val, unsigned size)
+{
+    RenesasSCIBaseState *sci = RENESAS_SCI_BASE(opaque);
+    RenesasSCIBaseClass *rc = RENESAS_SCI_BASE_GET_CLASS(opaque);
+    switch (addr) {
+    case A_SCR:
+        sci->scr = val;
+        if (FIELD_EX16(sci->scr, SCR, TE)) {
+            /* Transmitter enable */
+            sci->Xsr = FIELD_DP16(sci->Xsr, SSR, TDRE, 1);
+            sci->Xsr = FIELD_DP16(sci->Xsr, SSR, TEND, 1);
+            rc->irq_fn(sci, TXI);
+            rc->irq_fn(sci, BRI_TEI);
+        } else {
+            /* Transmitter disable  */
+            update_event_time(sci, TXEND, 0);
+            update_event_time(sci, TXEMPTY, 0);
         }
         break;
+    case A_SMR:
+        sci->smr = val;
+        update_trtime(sci);
+        break;
     case A_BRR:
-        if (!sci_is_tr_enabled(sci)) {
-            sci->brr = val;
-            update_trtime(sci);
-        }
+        sci->brr = val;
+        update_trtime(sci);
         break;
-    case A_SCR:
-        sci->scr = val;
-        if (FIELD_EX8(sci->scr, SCR, TE)) {
-            sci->ssr = FIELD_DP8(sci->ssr, SSR, TDRE, 1);
-            sci->ssr = FIELD_DP8(sci->ssr, SSR, TEND, 1);
-            if (FIELD_EX8(sci->scr, SCR, TIE)) {
-                qemu_irq_pulse(sci->irq[TXI]);
-            }
-        }
-        if (!FIELD_EX8(sci->scr, SCR, TEIE)) {
-            qemu_set_irq(sci->irq[TEI], 0);
+    default:
+        qemu_log_mask(LOG_UNIMP, "renesas_sci: Register 0x%" HWADDR_PRIX
+                      " not implemented\n", addr);
+    }
+}
+
+static void scia_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
+{
+    RenesasSCIBaseState *sci = RENESAS_SCI_BASE(opaque);
+    RenesasSCIAState *scia = RENESAS_SCIA(opaque);
+
+    addr = map_address(sci, addr);
+    switch (addr) {
+    case A_SMR:
+        if (IS_TR_ENABLED(sci->scr)) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "reneas_sci: SMR write protected.\n");
+        } else {
+            sci_common_write(sci, addr, val, size);
         }
-        if (!FIELD_EX8(sci->scr, SCR, RIE)) {
-            qemu_set_irq(sci->irq[ERI], 0);
+        break;
+    case A_BRR:
+        if (IS_TR_ENABLED(sci->scr)) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "reneas_sci: BRR write protected.\n");
+            break;
+        } else {
+            sci_common_write(sci, addr, val, size);
         }
         break;
     case A_TDR:
         sci->tdr = val;
-        if (FIELD_EX8(sci->ssr, SSR, TEND)) {
-            send_byte(sci);
+        if (FIELD_EX16(sci->Xsr, SSR, TEND)) {
+            /* Transmitter wakeup */
+            update_event_time(sci, TXEMPTY, sci->trtime);
+            sci_send_byte(sci);
         } else {
-            sci->ssr = FIELD_DP8(sci->ssr, SSR, TDRE, 0);
+            sci->Xsr = FIELD_DP16(sci->Xsr, SSR, TDRE, 0);
         }
+        /* Clear TEI */
+        scia_irq(sci, BRI_TEI);
         break;
     case A_SSR:
-        sci->ssr = FIELD_DP8(sci->ssr, SSR, MPBT,
-                             FIELD_EX8(val, SSR, MPBT));
-        sci->ssr = FIELD_DP8(sci->ssr, SSR, ERR,
-                             FIELD_EX8(val, SSR, ERR) & 0x07);
-        if (FIELD_EX8(sci->read_ssr, SSR, ERR) &&
-            FIELD_EX8(sci->ssr, SSR, ERR) == 0) {
-            qemu_set_irq(sci->irq[ERI], 0);
+        /* SSR.MBP and SSR.TEND is read only */
+        val = FIELD_DP16(val, SSR, MPB, 1);
+        val = FIELD_DP16(val, SSR, TEND, 1);
+        /* SSR.RDRF and SSR.TDRE can write 1 */
+        if (FIELD_EX16(val, SSR, RDRF) == 0 ||
+            FIELD_EX16(val, SSR, TDRE) == 0) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "reneas_sci: SSR invalid write value %02lux.\n", val);
         }
-        break;
-    case A_RDR:
-        qemu_log_mask(LOG_GUEST_ERROR, "reneas_sci: RDR is read only.\n");
+        val = FIELD_DP16(val, SSR, RDRF, 1);
+        val = FIELD_DP16(val, SSR, TDRE, 1);
+        /* SSR.MBP and SSR.TEND is read only */
+        val = FIELD_DP16(val, SSR, MPB, 1);
+        val = FIELD_DP16(val, SSR, TEND, 1);
+        /* SSR.PER, SSR.FER and SSR.ORER can write only 0 */
+        sci->Xsr &= val;
+        /* SSR.MPBT can write any value */
+        sci->Xsr = FIELD_DP16(RENESAS_SCI_BASE(sci)->Xsr, SSR, MPBT,
+                              FIELD_EX16(val, SSR, MPBT));
+        /* Clear ERI */
+        scia_irq(sci, ERI);
         break;
     case A_SCMR:
-        sci->scmr = val; break;
-    case A_SEMR: /* SEMR */
-        sci->semr = val; break;
+        scia->scmr = val;
+        break;
+    case A_SEMR:
+        scia->semr = val;
+        break;
     default:
-        qemu_log_mask(LOG_UNIMP, "renesas_sci: Register 0x%" HWADDR_PRIX " "
-                                 "not implemented\n",
-                      offset);
+        sci_common_write(sci, addr, val, size);
+        break;
     }
 }
 
-static uint64_t sci_read(void *opaque, hwaddr offset, unsigned size)
+static uint64_t sci_common_read(void *opaque, hwaddr addr, unsigned size)
 {
-    RSCIState *sci = RSCI(opaque);
-
-    switch (offset) {
+    RenesasSCIBaseState *sci = RENESAS_SCI_BASE(opaque);
+    switch (addr) {
     case A_SMR:
         return sci->smr;
     case A_BRR:
         return sci->brr;
     case A_SCR:
         return sci->scr;
+    case A_SSR:
+        return sci->Xsr;
     case A_TDR:
         return sci->tdr;
-    case A_SSR:
-        sci->read_ssr = sci->ssr;
-        return sci->ssr;
     case A_RDR:
-        sci->ssr = FIELD_DP8(sci->ssr, SSR, RDRF, 0);
-        return sci->rdr;
-    case A_SCMR:
-        return sci->scmr;
-    case A_SEMR:
-        return sci->semr;
+        if (fifo8_num_used(&sci->rxfifo) > 0) {
+            return fifo8_pop(&sci->rxfifo);
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "renesas_sci: Receiver underrun.");
+            return 0xff;
+        }
     default:
         qemu_log_mask(LOG_UNIMP, "renesas_sci: Register 0x%" HWADDR_PRIX
-                      " not implemented.\n", offset);
+                      " not implemented.\n", addr);
     }
     return UINT64_MAX;
 }
 
-static const MemoryRegionOps sci_ops = {
-    .write = sci_write,
-    .read  = sci_read,
-    .endianness = DEVICE_NATIVE_ENDIAN,
-    .impl.max_access_size = 1,
-    .valid.max_access_size = 1,
-};
+static uint64_t scia_read(void *opaque, hwaddr addr, unsigned size)
+{
+    RenesasSCIBaseState *sci = RENESAS_SCI_BASE(opaque);
+    RenesasSCIAState *scia = RENESAS_SCIA(opaque);
+
+    addr = map_address(sci, addr);
+    switch (addr) {
+    case A_RDR:
+        sci->Xsr = FIELD_DP16(sci->Xsr, SSR, RDRF, 0);
+        return sci_common_read(sci, addr, size);
+    case A_SCMR:
+        return scia->scmr;
+    default:
+        return sci_common_read(sci, addr, size);
+    }
+    return UINT64_MAX;
+}
 
-static void rsci_reset(DeviceState *dev)
+static void rsci_common_init(Object *obj)
 {
-    RSCIState *sci = RSCI(dev);
-    sci->smr = sci->scr = 0x00;
-    sci->brr = 0xff;
-    sci->tdr = 0xff;
-    sci->rdr = 0x00;
-    sci->ssr = 0x84;
-    sci->scmr = 0x00;
-    sci->semr = 0x00;
-    sci->rx_next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    RenesasSCIBaseState *sci = RENESAS_SCI_BASE(obj);
+    SysBusDevice *d = SYS_BUS_DEVICE(obj);
+    int i;
+
+    for (i = 0; i < SCI_NR_IRQ; i++) {
+        sysbus_init_irq(d, &sci->irq[i]);
+    }
+    fifo8_create(&sci->rxfifo, SCIF_FIFO_DEPTH);
+    sci->event_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sci_timer_event, sci);
 }
 
 static void sci_event(void *opaque, QEMUChrEvent event)
 {
-    RSCIState *sci = RSCI(opaque);
+    RenesasSCIBaseState *sci = RENESAS_SCI_BASE(opaque);
+    RenesasSCIBaseClass *rc = RENESAS_SCI_BASE_GET_CLASS(sci);
     if (event == CHR_EVENT_BREAK) {
-        sci->ssr = FIELD_DP8(sci->ssr, SSR, FER, 1);
-        if (FIELD_EX8(sci->scr, SCR, RIE)) {
-            qemu_set_irq(sci->irq[ERI], 1);
-        }
+        sci->Xsr = FIELD_DP16(sci->Xsr, SSR, FER, 1);
+        rc->irq_fn(sci, BRI_TEI);
     }
 }
 
-static void rsci_realize(DeviceState *dev, Error **errp)
+static void rsci_common_realize(DeviceState *dev, Error **errp)
 {
-    RSCIState *sci = RSCI(dev);
+    RenesasSCIBaseState *sci = RENESAS_SCI_BASE(dev);
+    int r;
 
-    if (sci->input_freq == 0) {
+    r = sci->regshift;
+    if ((r % 8) != 0 || ((r / 8) >> 1) > 2) {
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "renesas_sci: input-freq property must be set.");
+                      "renesas_sci: Invalid register size.");
         return;
     }
-    qemu_chr_fe_set_handlers(&sci->chr, can_receive, receive,
-                             sci_event, NULL, sci, NULL, true);
+    sci->regshift = (r / 8) >> 1;
+    sci->smr = sci->scr = 0x00;
+    sci->brr = 0xff;
+    sci->tdr = 0xff;
+    sci->Xsr = 0x84;
+    update_trtime(sci);
+
 }
 
-static void rsci_init(Object *obj)
+static void register_mmio(RenesasSCIBaseState *sci, int size)
 {
-    SysBusDevice *d = SYS_BUS_DEVICE(obj);
-    RSCIState *sci = RSCI(obj);
-    int i;
+    SysBusDevice *d = SYS_BUS_DEVICE(sci);
+    RenesasSCIBaseClass *rc = RENESAS_SCI_BASE_GET_CLASS(sci);
 
-    memory_region_init_io(&sci->memory, OBJECT(sci), &sci_ops,
-                          sci, "renesas-sci", 0x8);
+    memory_region_init_io(&sci->memory, OBJECT(sci), rc->ops,
+                          sci, "renesas-sci", size);
     sysbus_init_mmio(d, &sci->memory);
+}
 
-    for (i = 0; i < SCI_NR_IRQ; i++) {
-        sysbus_init_irq(d, &sci->irq[i]);
-    }
-    timer_init_ns(&sci->timer, QEMU_CLOCK_VIRTUAL, txend, sci);
+static void rscia_realize(DeviceState *dev, Error **errp)
+{
+    RenesasSCIAState *sci = RENESAS_SCIA(dev);
+    RenesasSCIBaseState *common = RENESAS_SCI_BASE(dev);
+
+    rsci_common_realize(dev, errp);
+
+    register_mmio(common, 8 * (1 << common->regshift));
+    qemu_chr_fe_set_handlers(&common->chr, sci_can_receive, sci_receive,
+                             sci_event, NULL, sci, NULL, true);
+
+    sci->scmr = 0x00;
+    sci->semr = 0x00;
 }
 
 static const VMStateDescription vmstate_rsci = {
@@ -303,49 +494,74 @@ static const VMStateDescription vmstate_rsci = {
     .version_id = 1,
     .minimum_version_id = 1,
     .fields = (VMStateField[]) {
-        VMSTATE_INT64(trtime, RSCIState),
-        VMSTATE_INT64(rx_next, RSCIState),
-        VMSTATE_UINT8(smr, RSCIState),
-        VMSTATE_UINT8(brr, RSCIState),
-        VMSTATE_UINT8(scr, RSCIState),
-        VMSTATE_UINT8(tdr, RSCIState),
-        VMSTATE_UINT8(ssr, RSCIState),
-        VMSTATE_UINT8(rdr, RSCIState),
-        VMSTATE_UINT8(scmr, RSCIState),
-        VMSTATE_UINT8(semr, RSCIState),
-        VMSTATE_UINT8(read_ssr, RSCIState),
-        VMSTATE_TIMER(timer, RSCIState),
         VMSTATE_END_OF_LIST()
     }
 };
 
 static Property rsci_properties[] = {
-    DEFINE_PROP_UINT64("input-freq", RSCIState, input_freq, 0),
-    DEFINE_PROP_CHR("chardev", RSCIState, chr),
+    DEFINE_PROP_UINT64("input-freq", RenesasSCIBaseState, input_freq, 0),
+    DEFINE_PROP_INT32("register-size", RenesasSCIBaseState,
+                      regshift, 0),
+    DEFINE_PROP_UINT32("unit", RenesasSCIBaseState, unit, 0),
+    DEFINE_PROP_CHR("chardev", RenesasSCIBaseState, chr),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-static void rsci_class_init(ObjectClass *klass, void *data)
+static void rsci_init(Object *obj)
+{
+    RenesasSCIBaseState *sci = RENESAS_SCI_BASE(obj);
+    sci->event[RXNEXT].handler = sci_rx_next;
+    sci->event[TXEMPTY].handler = sci_tx_empty;
+}
+
+static void rsci_common_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
-    dc->realize = rsci_realize;
     dc->vmsd = &vmstate_rsci;
-    dc->reset = rsci_reset;
     device_class_set_props(dc, rsci_properties);
 }
 
-static const TypeInfo rsci_info = {
-    .name = TYPE_RENESAS_SCI,
-    .parent = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(RSCIState),
-    .instance_init = rsci_init,
-    .class_init = rsci_class_init,
+static const MemoryRegionOps scia_ops = {
+    .read = scia_read,
+    .write = scia_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 1,
+    },
 };
 
-static void rsci_register_types(void)
+static void rscia_class_init(ObjectClass *klass, void *data)
 {
-    type_register_static(&rsci_info);
+    RenesasSCIBaseClass *comm_rc = RENESAS_SCI_BASE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    comm_rc->ops = &scia_ops;
+    comm_rc->irq_fn = scia_irq;
+    comm_rc->divrate = scia_divrate;
+
+    dc->realize = rscia_realize;
 }
 
-type_init(rsci_register_types)
+static const TypeInfo renesas_sci_info[] = {
+    {
+        .name       = TYPE_RENESAS_SCI_BASE,
+        .parent     = TYPE_SYS_BUS_DEVICE,
+        .instance_size = sizeof(RenesasSCIBaseState),
+        .instance_init = rsci_common_init,
+        .class_init = rsci_common_class_init,
+        .class_size = sizeof(RenesasSCIBaseClass),
+        .abstract = true,
+    },
+    {
+        .name       = TYPE_RENESAS_SCIA,
+        .parent     = TYPE_RENESAS_SCI_BASE,
+        .instance_size = sizeof(RenesasSCIAState),
+        .instance_init = rsci_init,
+        .class_init = rscia_class_init,
+        .class_size = sizeof(RenesasSCIAClass),
+    },
+};
+
+DEFINE_TYPES(renesas_sci_info)
diff --git a/hw/rx/rx62n.c b/hw/rx/rx62n.c
index fa5add9f9d..32c44ead1f 100644
--- a/hw/rx/rx62n.c
+++ b/hw/rx/rx62n.c
@@ -199,7 +199,7 @@ static void register_sci(RX62NState *s, int unit)
     int i, irqbase;
 
     object_initialize_child(OBJECT(s), "sci[*]",
-                            &s->sci[unit], TYPE_RENESAS_SCI);
+                            &s->sci[unit], TYPE_RENESAS_SCIA);
     sci = SYS_BUS_DEVICE(&s->sci[unit]);
     qdev_prop_set_chr(DEVICE(sci), "chardev", serial_hd(unit));
     qdev_prop_set_uint64(DEVICE(sci), "input-freq", s->pclk_freq_hz);
-- 
2.20.1


