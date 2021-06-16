Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB153A95F4
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 11:20:17 +0200 (CEST)
Received: from localhost ([::1]:40074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltRib-0005Sb-1n
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 05:20:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ysato@users.sourceforge.jp>)
 id 1ltRbX-0004iI-8x
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 05:12:59 -0400
Received: from mail02.asahi-net.or.jp ([202.224.55.14]:57993)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ysato@users.sourceforge.jp>) id 1ltRbS-00048j-OS
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 05:12:59 -0400
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23]) (Authenticated sender: PQ4Y-STU)
 by mail02.asahi-net.or.jp (Postfix) with ESMTPA id DBD1544A53;
 Wed, 16 Jun 2021 18:12:50 +0900 (JST)
Received: from yo-satoh-debian.localdomain
 (z215167.dynamic.ppp.asahi-net.or.jp [110.4.215.167])
 by sakura.ysato.name (Postfix) with ESMTPSA id 748C21C06CF;
 Wed, 16 Jun 2021 18:12:50 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/char: renesas_sci Add SCI and SCIF support.
Date: Wed, 16 Jun 2021 18:12:43 +0900
Message-Id: <20210616091244.33049-3-ysato@users.sourceforge.jp>
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

This peripheral using SH7750.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 include/hw/char/renesas_sci.h |  43 ++-
 hw/char/renesas_sci.c         | 489 ++++++++++++++++++++++++++++++++++
 2 files changed, 531 insertions(+), 1 deletion(-)

diff --git a/include/hw/char/renesas_sci.h b/include/hw/char/renesas_sci.h
index c666cf81d1..aa6be53628 100644
--- a/include/hw/char/renesas_sci.h
+++ b/include/hw/char/renesas_sci.h
@@ -16,12 +16,18 @@
 #include "qom/object.h"
 
 #define TYPE_RENESAS_SCI_BASE "renesas-sci-base"
+#define TYPE_RENESAS_SCI "renesas-sci"
 #define TYPE_RENESAS_SCIA "renesas-scia"
+#define TYPE_RENESAS_SCIF "renesas-scif"
 
 OBJECT_DECLARE_TYPE(RenesasSCIBaseState, RenesasSCIBaseClass,
                     RENESAS_SCI_BASE)
+OBJECT_DECLARE_TYPE(RenesasSCIState, RenesasSCIClass,
+                    RENESAS_SCI)
 OBJECT_DECLARE_TYPE(RenesasSCIAState, RenesasSCIAClass,
                     RENESAS_SCIA)
+OBJECT_DECLARE_TYPE(RenesasSCIFState, RenesasSCIFClass,
+                    RENESAS_SCIF)
 
 enum {
     ERI = 0,
@@ -32,6 +38,7 @@ enum {
 };
 
 enum {
+    RXTOUT,
     RXNEXT,
     TXEMPTY,
     TXEND,
@@ -49,13 +56,14 @@ typedef struct RenesasSCIBaseState {
     SysBusDevice parent_obj;
 
     MemoryRegion memory;
+    MemoryRegion memory_p4;
+    MemoryRegion memory_a7;
     QEMUTimer *event_timer;
 
     /*< public >*/
     uint64_t input_freq;
     int64_t etu;
     int64_t trtime;
-    int64_t tx_start_time;
     Fifo8 rxfifo;
     int regshift;
     uint32_t unit;
@@ -65,6 +73,7 @@ typedef struct RenesasSCIBaseState {
         int64_t time;
         int64_t (*handler)(struct RenesasSCIBaseState *sci);
     } event[NR_SCI_EVENT];
+    uint16_t read_Xsr;
 
     /* common SCI register */
     uint8_t smr;
@@ -74,6 +83,13 @@ typedef struct RenesasSCIBaseState {
     uint16_t Xsr;
 } RenesasSCIBaseState;
 
+struct RenesasSCIState {
+    RenesasSCIBaseState parent_obj;
+
+    /* SCI specific register */
+    uint8_t sptr;
+};
+
 struct RenesasSCIAState {
     RenesasSCIBaseState parent_obj;
 
@@ -82,6 +98,19 @@ struct RenesasSCIAState {
     uint8_t semr;
 };
 
+struct RenesasSCIFState {
+    RenesasSCIBaseState parent_obj;
+
+    /* SCIF specific register */
+    uint16_t fcr;
+    uint16_t sptr;
+    uint16_t lsr;
+
+    /* private */
+    int64_t tx_fifo_top_t;
+    int txremain;
+};
+
 typedef struct RenesasSCIBaseClass {
     SysBusDeviceClass parent;
 
@@ -90,6 +119,12 @@ typedef struct RenesasSCIBaseClass {
     int (*divrate)(struct RenesasSCIBaseState *sci);
 } RenesasSCIBaseClass;
 
+typedef struct RenesasSCIClass {
+    RenesasSCIBaseClass parent;
+
+    void (*p_irq_fn)(struct RenesasSCIBaseState *sci, int request);
+} RenesasSCIClass;
+
 typedef struct RenesasSCIAClass {
     RenesasSCIBaseClass parent;
 
@@ -97,4 +132,10 @@ typedef struct RenesasSCIAClass {
     int (*p_divrate)(struct RenesasSCIBaseState *sci);
 } RenesasSCIAClass;
 
+typedef struct RenesasSCIFClass {
+    RenesasSCIBaseClass parent;
+
+    void (*p_irq_fn)(struct RenesasSCIBaseState *sci, int request);
+} RenesasSCIFClass;
+
 #endif
diff --git a/hw/char/renesas_sci.c b/hw/char/renesas_sci.c
index c1126b7817..ba304fa1fa 100644
--- a/hw/char/renesas_sci.c
+++ b/hw/char/renesas_sci.c
@@ -3,6 +3,8 @@
  *
  * Datasheet: RX62N Group, RX621 Group User's Manual: Hardware
  *            (Rev.1.40 R01UH0033EJ0140)
+ *        And SH7751 Group, SH7751R Group User's Manual: Hardware
+ *            (Rev.4.01 R01UH0457EJ0401)
  *
  * Copyright (c) 2020 Yoshinori Sato
  *
@@ -67,17 +69,58 @@ REG32(SSR, 16) /* 8bit */
     FIELD(SSR, ORER, 5, 1)
   FIELD(SSR, RDRF, 6, 1)
   FIELD(SSR, TDRE, 7, 1)
+REG32(FSR, 16)
+  FIELD(FSR, DR, 0, 1)
+  FIELD(FSR, RDF, 1, 1)
+  FIELD(FSR, RDF_DR, 0, 2)
+  FIELD(FSR, PER, 2, 1)
+  FIELD(FSR, FER, 3, 1)
+  FIELD(FSR, BRK, 4, 1)
+  FIELD(FSR, TDFE, 5, 1)
+  FIELD(FSR, TEND, 6, 1)
+  FIELD(FSR, ER, 7, 1)
+  FIELD(FSR, FERn, 8, 4)
+  FIELD(FSR, PERn, 12, 4)
 REG32(RDR, 20) /* 8bit */
 REG32(SCMR, 24) /* 8bit */
   FIELD(SCMR, SMIF, 0, 1)
   FIELD(SCMR, SINV, 2, 1)
   FIELD(SCMR, SDIR, 3, 1)
   FIELD(SCMR, BCP2, 7, 1)
+REG32(FCR, 24)
+  FIELD(FCR, LOOP, 0, 1)
+  FIELD(FCR, RFRST, 1, 1)
+  FIELD(FCR, TFRST, 2, 1)
+  FIELD(FCR, MCE, 3, 1)
+  FIELD(FCR, TTRG, 4, 2)
+  FIELD(FCR, RTRG, 6, 2)
+  FIELD(FCR, RSTRG, 8, 3)
 REG8(SEMR, 28)
   FIELD(SEMR, ACS0, 0, 1)
   FIELD(SEMR, ABCS, 4, 1)
+REG32(FDR, 28)
+  FIELD(FDR, Rn, 0, 4)
+  FIELD(FDR, Tn, 8, 4)
+REG32(SPTR, 32)
+  FIELD(SPTR, SPB2DT, 0, 1)
+  FIELD(SPTR, SPB2IO, 1, 1)
+  FIELD(SPTR, SCKDT, 2, 1)
+  FIELD(SPTR, SCKIO, 3, 1)
+  FIELD(SPTR, CTSDT, 4, 1)
+  FIELD(SPTR, CTSIO, 5, 1)
+  FIELD(SPTR, RTSDT, 6, 1)
+  FIELD(SPTR, RTSIO, 7, 1)
+  FIELD(SPTR, EIO, 7, 1)
+REG32(LSR, 36)
+  FIELD(LSR, ORER, 0, 1)
 
 #define SCIF_FIFO_DEPTH 16
+static const int scif_rtrg[] = {1, 4, 8, 14};
+/* TTRG = 0 - 8byte */
+/* TTRG = 1 - 4byte */
+/* TTRG = 2 - 2byte */
+/* TTRG = 3 - 1byte */
+#define scif_ttrg(scif) (1 << (3 - FIELD_EX16(scif->fcr, FCR, TTRG)))
 
 static int sci_can_receive(void *opaque)
 {
@@ -134,6 +177,71 @@ static void sci_receive(void *opaque, const uint8_t *buf, int size)
     }
 }
 
+static int scif_can_receive(void *opaque)
+{
+    RenesasSCIFState *scif = RENESAS_SCIF(opaque);
+    RenesasSCIBaseState *sci = RENESAS_SCI_BASE(opaque);
+    RenesasSCIBaseClass *rc = RENESAS_SCI_BASE_GET_CLASS(sci);
+    int fifo_free = 0;
+    if (FIELD_EX16(sci->scr, SCR, RE)) {
+        /* Receiver enabled */
+        fifo_free = fifo8_num_free(&sci->rxfifo);
+        if (fifo_free == 0) {
+            /* FIFO overrun */
+            scif->lsr = FIELD_DP16(scif->lsr, LSR, ORER, 1);
+            rc->irq_fn(sci, ERI);
+        }
+    }
+    return fifo_free;
+}
+
+static void scif_receive(void *opaque, const uint8_t *buf, int size)
+{
+    RenesasSCIFState *scif = RENESAS_SCIF(opaque);
+    RenesasSCIBaseState *sci = RENESAS_SCI_BASE(opaque);
+    RenesasSCIBaseClass *rc = RENESAS_SCI_BASE_GET_CLASS(sci);
+    int rtrg;
+
+    fifo8_push_all(&sci->rxfifo, buf, size);
+    if (sci->event[RXNEXT].time == 0) {
+        rtrg = scif_rtrg[FIELD_EX16(scif->fcr, FCR, RTRG)];
+        if (fifo8_num_used(&sci->rxfifo) >= rtrg) {
+            sci->Xsr = FIELD_DP16(sci->Xsr, FSR, RDF, 1);
+            rc->irq_fn(sci, RXI);
+        } else {
+            update_event_time(sci, RXTOUT, 15 * sci->etu);
+        }
+    }
+}
+
+static void sci_irq(RenesasSCIBaseState *sci_common, int req)
+{
+    int irq = 0;
+    int rie;
+    int tie;
+    RenesasSCIState *sci = RENESAS_SCI(sci_common);
+
+    rie = FIELD_EX16(sci_common->scr, SCR, RIE);
+    tie = FIELD_EX16(sci_common->scr, SCR, TIE);
+    switch (req) {
+    case ERI:
+        irq = rie && (FIELD_EX16(sci_common->Xsr, SSR, ERR) != 0);
+        break;
+    case RXI:
+        irq = FIELD_EX16(sci_common->Xsr, SSR, RDRF) && rie  &&
+            !FIELD_EX16(sci->sptr, SPTR, EIO);
+        break;
+    case TXI:
+        irq = FIELD_EX16(sci_common->Xsr, SSR, TDRE) && tie;
+        break;
+    case BRI_TEI:
+        irq = FIELD_EX16(sci_common->Xsr, SSR, TEND) &&
+            FIELD_EX16(sci_common->scr, SCR, TEIE);
+        break;
+    }
+    qemu_set_irq(sci_common->irq[req], irq);
+}
+
 static void scia_irq(RenesasSCIBaseState *sci, int req)
 {
     int irq = 0;
@@ -166,6 +274,33 @@ static void scia_irq(RenesasSCIBaseState *sci, int req)
     }
 }
 
+static void scif_irq(RenesasSCIBaseState *sci, int req)
+{
+    int irq = 0;
+    int rie;
+    int reie;
+    int tie;
+
+    rie = FIELD_EX16(sci->scr, SCR, RIE);
+    reie = FIELD_EX16(sci->scr, SCR, REIE);
+    tie = FIELD_EX16(sci->scr, SCR, TIE);
+    switch (req) {
+    case ERI:
+        irq = (rie || reie) && FIELD_EX16(sci->Xsr, FSR, ER);
+        break;
+    case RXI:
+        irq = (FIELD_EX16(sci->Xsr, FSR, RDF_DR) != 0) && rie;
+        break;
+    case TXI:
+        irq = FIELD_EX16(sci->Xsr, FSR, TDFE) & tie;
+        break;
+    case BRI_TEI:
+        irq = (rie || reie) && FIELD_EX16(sci->Xsr, FSR, BRK);
+        break;
+    }
+    qemu_set_irq(sci->irq[req], irq);
+}
+
 static void sci_send_byte(RenesasSCIBaseState *sci)
 {
     if (qemu_chr_fe_backend_connected(&sci->chr)) {
@@ -211,6 +346,46 @@ static int64_t sci_tx_empty(RenesasSCIBaseState *sci)
     return ret;
 }
 
+static int scif_txremain_byte(RenesasSCIFState *scif)
+{
+    RenesasSCIBaseState *sci = RENESAS_SCI_BASE(scif);
+    int64_t now, elapsed;
+    int byte = 0;
+    if (scif->tx_fifo_top_t > 0) {
+        now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        elapsed = now - scif->tx_fifo_top_t;
+        scif->tx_fifo_top_t = now;
+        byte = elapsed / sci->trtime + 1;
+        byte = MIN(scif->txremain, byte);
+    }
+    scif->txremain -= byte;
+    return scif->txremain;
+}
+
+static int64_t scif_rx_timeout(RenesasSCIBaseState *sci)
+{
+    sci->Xsr = FIELD_DP16(sci->Xsr, FSR, DR, 1);
+    scif_irq(sci, RXI);
+    return 0;
+}
+
+static int64_t scif_tx_empty(RenesasSCIBaseState *sci)
+{
+    RenesasSCIFState *scif = RENESAS_SCIF(sci);
+    scif_txremain_byte(scif);
+    sci->Xsr = FIELD_DP16(sci->Xsr, FSR, TDFE, 1);
+    scif_irq(sci, TXI);
+    return 0;
+}
+
+static int64_t scif_tx_end(RenesasSCIBaseState *sci)
+{
+    RenesasSCIFState *scif = RENESAS_SCIF(sci);
+    scif->txremain = 0;
+    sci->Xsr = FIELD_DP16(sci->Xsr, FSR, TEND, 1);
+    return 0;
+}
+
 static void sci_timer_event(void *opaque)
 {
     RenesasSCIBaseState *sci = RENESAS_SCI_BASE(opaque);
@@ -232,6 +407,12 @@ static void sci_timer_event(void *opaque)
     update_expire_time(sci);
 }
 
+static int sci_divrate(RenesasSCIBaseState *sci)
+{
+    /* SCI / SCIF have static divide rate */
+    return 32;
+}
+
 static int scia_divrate(RenesasSCIBaseState *sci)
 {
     /*
@@ -303,6 +484,45 @@ static void sci_common_write(void *opaque, hwaddr addr,
     }
 }
 
+static void sci_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
+{
+    RenesasSCIBaseState *sci = RENESAS_SCI_BASE(opaque);
+    RenesasSCIBaseClass *rc = RENESAS_SCI_BASE_GET_CLASS(sci);
+    bool tdre_reset;
+
+    addr = map_address(sci, addr);
+    switch (addr) {
+    case A_TDR:
+        sci->tdr = val;
+        break;
+    case A_SSR:
+        /* SSR.MBP and SSR.TEND is read only */
+        val = FIELD_DP16(val, SSR, MPB, 1);
+        val = FIELD_DP16(val, SSR, TEND, 1);
+        /* SSR can write only 0 */
+        sci->Xsr &= val;
+        /* SSR.MPBT can write any value */
+        sci->Xsr = FIELD_DP16(RENESAS_SCI_BASE(sci)->Xsr, SSR, MPBT,
+                              FIELD_EX16(val, SSR, MPBT));
+        /* Clear ERI */
+        rc->irq_fn(sci, ERI);
+        /* Is TX start operation ? */
+        tdre_reset = FIELD_EX16(sci->read_Xsr, SSR, TDRE) &&
+            !FIELD_EX16(sci->Xsr, SSR, TDRE);
+        if (tdre_reset && FIELD_EX16(sci->Xsr, SSR, ERR) == 0) {
+            sci_send_byte(sci);
+            update_event_time(sci, TXEMPTY, sci->trtime);
+            rc->irq_fn(sci, TXI);
+        }
+        break;
+    case A_SPTR:
+        RENESAS_SCI(sci)->sptr = val;
+        break;
+    default:
+        sci_common_write(sci, addr, val, size);
+    }
+}
+
 static void scia_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
 {
     RenesasSCIBaseState *sci = RENESAS_SCI_BASE(opaque);
@@ -374,6 +594,120 @@ static void scia_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
     }
 }
 
+static void scif_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
+{
+    RenesasSCIBaseState *sci = RENESAS_SCI_BASE(opaque);
+    RenesasSCIFState *scif = RENESAS_SCIF(opaque);
+    int txtrg;
+    int rxtrg;
+    uint8_t txd;
+
+    addr = map_address(sci, addr);
+    switch (addr) {
+    case A_SCR:
+        sci->scr = val;
+        if (FIELD_EX16(sci->scr, SCR, TE)) {
+            /* Transmiter enable */
+            sci->Xsr = FIELD_DP16(sci->Xsr, FSR, TEND, 1);
+            sci->Xsr = FIELD_DP16(sci->Xsr, FSR, TDFE, 1);
+            scif->tx_fifo_top_t = 0;
+            scif_irq(sci, TXI);
+        } else {
+            /* Transmiter disable  */
+            update_event_time(sci, TXEND, 0);
+            update_event_time(sci, TXEMPTY, 0);
+        }
+        break;
+    case A_TDR:
+        if (scif->tx_fifo_top_t > 0) {
+            if (scif_txremain_byte(scif) >= SCIF_FIFO_DEPTH) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "reneas_sci: Tx FIFO is full.");
+                break;
+            }
+        } else {
+            scif->tx_fifo_top_t = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        }
+        txd = val;
+        if (qemu_chr_fe_backend_connected(&sci->chr)) {
+            qemu_chr_fe_write_all(&sci->chr, &txd, 1);
+        }
+        if (FIELD_EX16(scif->fcr, FCR, LOOP) && scif_can_receive(sci) > 0) {
+            /* Loopback mode */
+            scif_receive(sci, &txd, 1);
+        }
+        scif->txremain++;
+        sci->Xsr = FIELD_DP16(sci->Xsr, FSR, TEND, 0);
+        update_event_time(sci, TXEND, scif->txremain * sci->trtime);
+        txtrg = scif_ttrg(scif);
+        if (scif->txremain > txtrg) {
+            sci->Xsr = FIELD_DP16(sci->Xsr, FSR, TDFE, 0);
+            update_event_time(sci, TXEMPTY,
+                              (scif->txremain - txtrg) * sci->trtime);
+            scif_irq(sci, TXI);
+        }
+        break;
+    case A_FSR:
+        rxtrg = scif_rtrg[FIELD_EX16(scif->fcr, FCR, RTRG)];
+        txtrg = scif_ttrg(scif);
+        /* FSR.FER and FSR.PER read only. Keep old value. */
+        val = FIELD_DP16(val, FSR, FER, 1);
+        val = FIELD_DP16(val, FSR, PER, 1);
+        val = FIELD_DP16(val, FSR, FERn, 15);
+        val = FIELD_DP16(val, FSR, PERn, 15);
+        if (scif_txremain_byte(scif) <= txtrg) {
+            /* It cannot be cleared when FIFO is free. */
+            val = FIELD_DP16(val, FSR, TDFE, 1);
+        }
+        if (fifo8_num_used(&sci->rxfifo) >= rxtrg) {
+            /* It cannot be cleared when FIFO is full. */
+            val = FIELD_DP16(val, FSR, TDFE, 1);
+        }
+        if (scif->txremain == 0) {
+            /* It cannot be cleared when FIFO is not empty. */
+            val = FIELD_DP16(val, FSR, TEND, 1);
+        }
+        sci->Xsr &= val;
+        scif_irq(sci, ERI);
+        scif_irq(sci, RXI);
+        scif_irq(sci, TXI);
+        break;
+    case A_FCR:
+        scif->fcr = val;
+        if (FIELD_EX16(scif->fcr, FCR, RFRST)) {
+            fifo8_reset(&sci->rxfifo);
+            update_event_time(sci, RXTOUT, 0);
+            update_event_time(sci, RXNEXT, 0);
+            sci->Xsr = FIELD_DP16(sci->Xsr, FSR, ER, 0);
+            sci->Xsr = FIELD_DP16(sci->Xsr, FSR, BRK, 0);
+            sci->Xsr = FIELD_DP16(sci->Xsr, FSR, FER, 0);
+            sci->Xsr = FIELD_DP16(sci->Xsr, FSR, PER, 0);
+            sci->Xsr = FIELD_DP16(sci->Xsr, FSR, RDF_DR, 0);
+        }
+        if (FIELD_EX16(scif->fcr, FCR, TFRST)) {
+            scif->txremain = 0;
+            update_event_time(sci, TXEMPTY, 0);
+            update_event_time(sci, TXEND, 0);
+            sci->Xsr = FIELD_DP16(sci->Xsr, FSR, TEND, 1);
+            sci->Xsr = FIELD_DP16(sci->Xsr, FSR, TDFE, 1);
+        }
+        break;
+    case A_FDR:
+        qemu_log_mask(LOG_GUEST_ERROR, "reneas_sci: FDR is read only.\n");
+        break;
+    case A_SPTR:
+        scif->sptr = val;
+        break;
+    case A_LSR:
+        scif->lsr &= val;
+        scif_irq(sci, ERI);
+        break;
+    default:
+        sci_common_write(sci, addr, val, size);
+        break;
+    }
+}
+
 static uint64_t sci_common_read(void *opaque, hwaddr addr, unsigned size)
 {
     RenesasSCIBaseState *sci = RENESAS_SCI_BASE(opaque);
@@ -385,6 +719,7 @@ static uint64_t sci_common_read(void *opaque, hwaddr addr, unsigned size)
     case A_SCR:
         return sci->scr;
     case A_SSR:
+        sci->read_Xsr = sci->Xsr;
         return sci->Xsr;
     case A_TDR:
         return sci->tdr;
@@ -403,6 +738,20 @@ static uint64_t sci_common_read(void *opaque, hwaddr addr, unsigned size)
     return UINT64_MAX;
 }
 
+static uint64_t sci_read(void *opaque, hwaddr addr, unsigned size)
+{
+    RenesasSCIBaseState *sci = RENESAS_SCI_BASE(opaque);
+    addr = map_address(sci, addr);
+
+    switch (addr) {
+    case A_SPTR:
+        return RENESAS_SCI(sci)->sptr;
+    default:
+        return sci_common_read(sci, addr, size);
+    }
+    return UINT64_MAX;
+}
+
 static uint64_t scia_read(void *opaque, hwaddr addr, unsigned size)
 {
     RenesasSCIBaseState *sci = RENESAS_SCI_BASE(opaque);
@@ -421,6 +770,34 @@ static uint64_t scia_read(void *opaque, hwaddr addr, unsigned size)
     return UINT64_MAX;
 }
 
+static uint64_t scif_read(void *opaque, hwaddr addr, unsigned size)
+{
+    RenesasSCIFState *scif = RENESAS_SCIF(opaque);
+    RenesasSCIBaseState *sci = RENESAS_SCI_BASE(opaque);
+    uint64_t ret;
+
+    addr = map_address(sci, addr);
+    switch (addr) {
+    case A_TDR:
+        qemu_log_mask(LOG_GUEST_ERROR, "reneas_sci: TDR is write only.\n");
+        return UINT64_MAX;
+    case A_FCR:
+        return scif->fcr & 0x7ff;
+    case A_FDR:
+        ret = 0;
+        ret = FIELD_DP16(ret, FDR, Rn, fifo8_num_used(&sci->rxfifo));
+        ret = FIELD_DP16(ret, FDR, Tn, scif_txremain_byte(scif));
+        return ret;
+    case A_SPTR:
+        return scif->sptr;
+    case A_LSR:
+        return scif->lsr;
+    default:
+        return sci_common_read(sci, addr, size);
+    }
+    return UINT64_MAX;
+}
+
 static void rsci_common_init(Object *obj)
 {
     RenesasSCIBaseState *sci = RENESAS_SCI_BASE(obj);
@@ -444,6 +821,15 @@ static void sci_event(void *opaque, QEMUChrEvent event)
     }
 }
 
+static void scif_event(void *opaque, QEMUChrEvent event)
+{
+    RenesasSCIBaseState *sci = RENESAS_SCI_BASE(opaque);
+    if (event == CHR_EVENT_BREAK) {
+        sci->Xsr = FIELD_DP16(sci->Xsr, FSR, BRK, 1);
+        scif_irq(sci, BRI_TEI);
+    }
+}
+
 static void rsci_common_realize(DeviceState *dev, Error **errp)
 {
     RenesasSCIBaseState *sci = RENESAS_SCI_BASE(dev);
@@ -472,6 +858,26 @@ static void register_mmio(RenesasSCIBaseState *sci, int size)
     memory_region_init_io(&sci->memory, OBJECT(sci), rc->ops,
                           sci, "renesas-sci", size);
     sysbus_init_mmio(d, &sci->memory);
+    memory_region_init_alias(&sci->memory_p4, NULL, "renesas-sci-p4",
+                             &sci->memory, 0, size);
+    sysbus_init_mmio(d, &sci->memory_p4);
+    memory_region_init_alias(&sci->memory_a7, NULL, "renesas-sci-a7",
+                             &sci->memory, 0, size);
+    sysbus_init_mmio(d, &sci->memory_a7);
+}
+
+static void rsci_realize(DeviceState *dev, Error **errp)
+{
+    RenesasSCIState *sci = RENESAS_SCI(dev);
+    RenesasSCIBaseState *common = RENESAS_SCI_BASE(dev);
+
+    rsci_common_realize(dev, errp);
+
+    register_mmio(common, 8 * (1 << common->regshift));
+    qemu_chr_fe_set_handlers(&common->chr, sci_can_receive, sci_receive,
+                             sci_event, NULL, sci, NULL, true);
+
+    sci->sptr = 0x00;
 }
 
 static void rscia_realize(DeviceState *dev, Error **errp)
@@ -489,6 +895,22 @@ static void rscia_realize(DeviceState *dev, Error **errp)
     sci->semr = 0x00;
 }
 
+static void rscif_realize(DeviceState *dev, Error **errp)
+{
+    RenesasSCIFState *sci = RENESAS_SCIF(dev);
+    RenesasSCIBaseState *common = RENESAS_SCI_BASE(sci);
+
+    rsci_common_realize(dev, errp);
+
+    register_mmio(common, 10 * (1 << common->regshift));
+    qemu_chr_fe_set_handlers(&common->chr, scif_can_receive, scif_receive,
+                             scif_event, NULL, sci, NULL, true);
+    common->Xsr = 0x0060;
+    sci->fcr = 0x0000;
+    sci->sptr = 0x0000;
+    sci->lsr = 0x0000;
+}
+
 static const VMStateDescription vmstate_rsci = {
     .name = "renesas-sci",
     .version_id = 1,
@@ -514,6 +936,14 @@ static void rsci_init(Object *obj)
     sci->event[TXEMPTY].handler = sci_tx_empty;
 }
 
+static void rscif_init(Object *obj)
+{
+    RenesasSCIBaseState *sci = RENESAS_SCI_BASE(obj);
+    sci->event[RXTOUT].handler = scif_rx_timeout;
+    sci->event[TXEMPTY].handler = scif_tx_empty;
+    sci->event[TXEND].handler = scif_tx_end;
+}
+
 static void rsci_common_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -522,6 +952,27 @@ static void rsci_common_class_init(ObjectClass *klass, void *data)
     device_class_set_props(dc, rsci_properties);
 }
 
+static const MemoryRegionOps sci_ops = {
+    .read = sci_read,
+    .write = sci_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 4,
+    },
+};
+
+static void rsci_class_init(ObjectClass *klass, void *data)
+{
+    RenesasSCIBaseClass *comm_rc = RENESAS_SCI_BASE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    comm_rc->ops = &sci_ops;
+    comm_rc->irq_fn = sci_irq;
+    comm_rc->divrate = sci_divrate;
+    dc->realize = rsci_realize;
+}
+
 static const MemoryRegionOps scia_ops = {
     .read = scia_read,
     .write = scia_write,
@@ -544,6 +995,28 @@ static void rscia_class_init(ObjectClass *klass, void *data)
     dc->realize = rscia_realize;
 }
 
+static const MemoryRegionOps scif_ops = {
+    .read = scif_read,
+    .write = scif_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 4,
+    },
+};
+
+static void rscif_class_init(ObjectClass *klass, void *data)
+{
+    RenesasSCIBaseClass *comm_rc = RENESAS_SCI_BASE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    comm_rc->ops = &scif_ops;
+    comm_rc->irq_fn = scif_irq;
+    comm_rc->divrate = sci_divrate;
+
+    dc->realize = rscif_realize;
+}
+
 static const TypeInfo renesas_sci_info[] = {
     {
         .name       = TYPE_RENESAS_SCI_BASE,
@@ -554,6 +1027,14 @@ static const TypeInfo renesas_sci_info[] = {
         .class_size = sizeof(RenesasSCIBaseClass),
         .abstract = true,
     },
+    {
+        .name       = TYPE_RENESAS_SCI,
+        .parent     = TYPE_RENESAS_SCI_BASE,
+        .instance_size = sizeof(RenesasSCIState),
+        .instance_init = rsci_init,
+        .class_init = rsci_class_init,
+        .class_size = sizeof(RenesasSCIClass),
+    },
     {
         .name       = TYPE_RENESAS_SCIA,
         .parent     = TYPE_RENESAS_SCI_BASE,
@@ -562,6 +1043,14 @@ static const TypeInfo renesas_sci_info[] = {
         .class_init = rscia_class_init,
         .class_size = sizeof(RenesasSCIAClass),
     },
+    {
+        .name       = TYPE_RENESAS_SCIF,
+        .parent     = TYPE_RENESAS_SCI_BASE,
+        .instance_size = sizeof(RenesasSCIFState),
+        .instance_init = rscif_init,
+        .class_init = rscif_class_init,
+        .class_size = sizeof(RenesasSCIFClass),
+    },
 };
 
 DEFINE_TYPES(renesas_sci_info)
-- 
2.20.1


