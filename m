Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F4941033E
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 05:29:01 +0200 (CEST)
Received: from localhost ([::1]:38112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRR2C-0003KE-Re
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 23:29:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mRR0T-0001Ia-FD; Fri, 17 Sep 2021 23:27:14 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:39607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mRR0Q-0001JI-5z; Fri, 17 Sep 2021 23:27:13 -0400
Received: by mail-ed1-x532.google.com with SMTP id h17so37221281edj.6;
 Fri, 17 Sep 2021 20:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jiVLdqJr9R5yXZPF2aBObQyAfjgQOEW2PVY3IvSycPM=;
 b=qiqk+MT40dKCd1fEehSG1cEmdyBGJXx42wQLn+0sFBFXb5JdzZJpKiXK1L4DsyXF0W
 6GzWQ0/g0FRd+dm6uXSb9RqdsR1qcsLWxS0UhYipg3aAiRPdwmOHMRNqrlGcOq0zwfh0
 Q+np1TanKcMDAu94/Zx1dhbPiK4r1UxgdM2bHTVWG68NsMUHZ60Xe0zlSuI2cogs70ap
 T5B4Jr66YSkK1RojxHbssk/qQ30vjgXmOhnCTaxiWzTm+ksZg4lfXHnfiI25dvKKPsaO
 0nYqZivxweZAvPKLIlhVXqIkUmiUQtjeTiaxjpGTwk4TgZY19wqvMwYlY28E4foKuH5M
 tBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jiVLdqJr9R5yXZPF2aBObQyAfjgQOEW2PVY3IvSycPM=;
 b=4k1qObUmVTBY6TxujFx3L29erDjofylzZp9cyxIekNLbjubFXfHXqAnS8cLYyjhZqs
 gVc/mB3aUDl9necTq6Qce07Pore4mhufR0s/JF4e+8UbN6mMksFLd4v2ZbQGcQzcDVjq
 2gkYO6lpipJaXTKT3ju4ksP+H/6h+dwiqFR6nTmA6+fUaL+eovcTWro33B2qXgF8+6SP
 32/Gmx/XNYfsDEVZmvcW+qRuPJfIMr1K/oRyY4nQ0fnG/2RBXLs+Nz9TBAV4VRiT9nt6
 vPxIyoeid5AcV7QJClc8i90YOsoBLGEJ8lDris2l7g8H5zLUv5tJMGWkTEO+hxMJrW4H
 lZAw==
X-Gm-Message-State: AOAM532MxXKj38vvPCh43F1aP9wRB4MUSaC9kJDWMUbO6pJ2yEo0HtpP
 LlegGHeWKGF+mD9bxloKx0hdkFqzHaw=
X-Google-Smtp-Source: ABdhPJyt0JaOZ520s+Pa+xgvva+RcF5MJ11K6ZOq0h1+yz9p4yGS04uH92PugPD8Qfy03iIsvei8eg==
X-Received: by 2002:a05:6402:5c2:: with SMTP id
 n2mr16207702edx.239.1631935628321; 
 Fri, 17 Sep 2021 20:27:08 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id k4sm3439693edq.92.2021.09.17.20.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 20:27:07 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
X-Google-Original-From: Bin Meng <bin.meng@windriver.com>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: [RESEND PATCH 3/3] hw/intc: openpic: Clean up the styles
Date: Sat, 18 Sep 2021 11:26:53 +0800
Message-Id: <20210918032653.646370-3-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918032653.646370-1-bin.meng@windriver.com>
References: <20210918032653.646370-1-bin.meng@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Correct the multi-line comment format. No functional changes.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

 include/hw/ppc/openpic.h |  9 ++++---
 hw/intc/openpic.c        | 55 +++++++++++++++++++++++++---------------
 2 files changed, 40 insertions(+), 24 deletions(-)

diff --git a/include/hw/ppc/openpic.h b/include/hw/ppc/openpic.h
index f89802a15c..ebdaf8a493 100644
--- a/include/hw/ppc/openpic.h
+++ b/include/hw/ppc/openpic.h
@@ -51,7 +51,8 @@ typedef enum IRQType {
     IRQ_TYPE_FSLSPECIAL,    /* FSL timer/IPI interrupt, edge, no polarity */
 } IRQType;
 
-/* Round up to the nearest 64 IRQs so that the queue length
+/*
+ * Round up to the nearest 64 IRQs so that the queue length
  * won't change when moving between 32 and 64 bit hosts.
  */
 #define IRQQUEUE_SIZE_BITS ((OPENPIC_MAX_IRQ + 63) & ~63)
@@ -101,8 +102,10 @@ typedef struct OpenPICTimer {
     bool                  qemu_timer_active; /* Is the qemu_timer is running? */
     struct QEMUTimer     *qemu_timer;
     struct OpenPICState  *opp;          /* Device timer is part of. */
-    /* The QEMU_CLOCK_VIRTUAL time (in ns) corresponding to the last
-       current_count written or read, only defined if qemu_timer_active. */
+    /*
+     * The QEMU_CLOCK_VIRTUAL time (in ns) corresponding to the last
+     * current_count written or read, only defined if qemu_timer_active.
+     */
     uint64_t              origin_time;
 } OpenPICTimer;
 
diff --git a/hw/intc/openpic.c b/hw/intc/openpic.c
index 23eafb32bd..49504e740f 100644
--- a/hw/intc/openpic.c
+++ b/hw/intc/openpic.c
@@ -47,7 +47,7 @@
 #include "qemu/timer.h"
 #include "qemu/error-report.h"
 
-//#define DEBUG_OPENPIC
+/* #define DEBUG_OPENPIC */
 
 #ifdef DEBUG_OPENPIC
 static const int debug_openpic = 1;
@@ -118,7 +118,8 @@ static FslMpicInfo fsl_mpic_42 = {
 #define ILR_INTTGT_CINT   0x01 /* critical */
 #define ILR_INTTGT_MCP    0x02 /* machine check */
 
-/* The currently supported INTTGT values happen to be the same as QEMU's
+/*
+ * The currently supported INTTGT values happen to be the same as QEMU's
  * openpic output codes, but don't depend on this.  The output codes
  * could change (unlikely, but...) or support could be added for
  * more INTTGT values.
@@ -177,10 +178,11 @@ static void openpic_cpu_write_internal(void *opaque, hwaddr addr,
                                        uint32_t val, int idx);
 static void openpic_reset(DeviceState *d);
 
-/* Convert between openpic clock ticks and nanosecs.  In the hardware the clock
-   frequency is driven by board inputs to the PIC which the PIC would then
-   divide by 4 or 8.  For now hard code to 25MZ.
-*/
+/*
+ * Convert between openpic clock ticks and nanosecs.  In the hardware the clock
+ * frequency is driven by board inputs to the PIC which the PIC would then
+ * divide by 4 or 8.  For now hard code to 25MZ.
+ */
 #define OPENPIC_TIMER_FREQ_MHZ 25
 #define OPENPIC_TIMER_NS_PER_TICK (1000 / OPENPIC_TIMER_FREQ_MHZ)
 static inline uint64_t ns_to_ticks(uint64_t ns)
@@ -253,7 +255,8 @@ static void IRQ_local_pipe(OpenPICState *opp, int n_CPU, int n_IRQ,
                 __func__, src->output, n_IRQ, active, was_active,
                 dst->outputs_active[src->output]);
 
-        /* On Freescale MPIC, critical interrupts ignore priority,
+        /*
+         * On Freescale MPIC, critical interrupts ignore priority,
          * IACK, EOI, etc.  Before MPIC v4.1 they also ignore
          * masking.
          */
@@ -276,7 +279,8 @@ static void IRQ_local_pipe(OpenPICState *opp, int n_CPU, int n_IRQ,
 
     priority = IVPR_PRIORITY(src->ivpr);
 
-    /* Even if the interrupt doesn't have enough priority,
+    /*
+     * Even if the interrupt doesn't have enough priority,
      * it is still raised, in case ctpr is lowered later.
      */
     if (active) {
@@ -408,7 +412,8 @@ static void openpic_set_irq(void *opaque, int n_IRQ, int level)
         }
 
         if (src->output != OPENPIC_OUTPUT_INT) {
-            /* Edge-triggered interrupts shouldn't be used
+            /*
+             * Edge-triggered interrupts shouldn't be used
              * with non-INT delivery, but just in case,
              * try to make it do something sane rather than
              * cause an interrupt storm.  This is close to
@@ -501,7 +506,8 @@ static inline void write_IRQreg_ivpr(OpenPICState *opp, int n_IRQ, uint32_t val)
 {
     uint32_t mask;
 
-    /* NOTE when implementing newer FSL MPIC models: starting with v4.0,
+    /*
+     * NOTE when implementing newer FSL MPIC models: starting with v4.0,
      * the polarity bit is read-only on internal interrupts.
      */
     mask = IVPR_MASK_MASK | IVPR_PRIORITY_MASK | IVPR_SENSE_MASK |
@@ -511,7 +517,8 @@ static inline void write_IRQreg_ivpr(OpenPICState *opp, int n_IRQ, uint32_t val)
     opp->src[n_IRQ].ivpr =
         (opp->src[n_IRQ].ivpr & IVPR_ACTIVITY_MASK) | (val & mask);
 
-    /* For FSL internal interrupts, The sense bit is reserved and zero,
+    /*
+     * For FSL internal interrupts, The sense bit is reserved and zero,
      * and the interrupt is always level-triggered.  Timers and IPIs
      * have no sense or polarity bits, and are edge-triggered.
      */
@@ -695,16 +702,20 @@ static void qemu_timer_cb(void *opaque)
     openpic_set_irq(opp, n_IRQ, 0);
 }
 
-/* If enabled is true, arranges for an interrupt to be raised val clocks into
-   the future, if enabled is false cancels the timer. */
+/*
+ * If enabled is true, arranges for an interrupt to be raised val clocks into
+ * the future, if enabled is false cancels the timer.
+ */
 static void openpic_tmr_set_tmr(OpenPICTimer *tmr, uint32_t val, bool enabled)
 {
     uint64_t ns = ticks_to_ns(val & ~TCCR_TOG);
-    /* A count of zero causes a timer to be set to expire immediately.  This
-       effectively stops the simulation since the timer is constantly expiring
-       which prevents guest code execution, so we don't honor that
-       configuration.  On real hardware, this situation would generate an
-       interrupt on every clock cycle if the interrupt was unmasked. */
+    /*
+     * A count of zero causes a timer to be set to expire immediately.  This
+     * effectively stops the simulation since the timer is constantly expiring
+     * which prevents guest code execution, so we don't honor that
+     * configuration.  On real hardware, this situation would generate an
+     * interrupt on every clock cycle if the interrupt was unmasked.
+     */
     if ((ns == 0) || !enabled) {
         tmr->qemu_timer_active = false;
         tmr->tccr = tmr->tccr & TCCR_TOG;
@@ -717,8 +728,10 @@ static void openpic_tmr_set_tmr(OpenPICTimer *tmr, uint32_t val, bool enabled)
     }
 }
 
-/* Returns the currrent tccr value, i.e., timer value (in clocks) with
-   appropriate TOG. */
+/*
+ * Returns the currrent tccr value, i.e., timer value (in clocks) with
+ * appropriate TOG.
+ */
 static uint64_t openpic_tmr_get_timer(OpenPICTimer *tmr)
 {
     uint64_t retval;
@@ -1309,7 +1322,7 @@ static void openpic_reset(DeviceState *d)
 typedef struct MemReg {
     const char             *name;
     MemoryRegionOps const  *ops;
-    hwaddr      start_addr;
+    hwaddr                  start_addr;
     ram_addr_t              size;
 } MemReg;
 
-- 
2.25.1


