Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1981634569F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 05:17:28 +0100 (CET)
Received: from localhost ([::1]:57090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOYTv-0003Oq-3F
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 00:17:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lOYPn-0000lp-Uk
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 00:13:11 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:35459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lOYPN-0006by-LQ
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 00:13:11 -0400
Received: by mail-qk1-x733.google.com with SMTP id i9so13090919qka.2
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 21:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9MAisyPgu751vN4QCK9P9GO8fD3yVG7ho3//jskpRqU=;
 b=VeaIuyCDDDOJU0Wk2BBI0m42/iabL8V+vgwprA5rRztfsPhj0DHaM+x7UJwa26s/z7
 u7vfic+gbDjMxigQmJ7eTxboEgqQ21uUGjqUWp4GPhMvnIAeJGnEzRipa5Y2H8cjFTSG
 9XLGgzPxC+Bb4wA8QQigZJA1I/M7p60eRlAhzbduUNX0sUuHwtq7prSXjVcwWHn39atq
 Qehl7JoD5j5K0QhwSFxLX0NBGOE5K8gDnVgJciQtmqP4h0kJYKWvf6dJcHs0Sl9vHTQX
 iWeiTRpWSIqdoNNFRcZ2S4OU2UuGqo2QovnflW+BU1BzU2YX67d6ic7naDB5kdLvPAAi
 VPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9MAisyPgu751vN4QCK9P9GO8fD3yVG7ho3//jskpRqU=;
 b=VQLDR6+FBFkb/Bmo0d8a5frlljCi5MMzI2qJjvExpcKgQntmHyqL8e1JloVt0lR+5o
 WBy0TqcQ6/pkVWwkr2wQ4rnNnVSX0yiF0H9lNxVv3/1HB8X5IxGX9JPItu8Cy24Vng8A
 Msot4ebJapvEYZgr68q4w/fd9k1JJRTBZhoHma6W6YNZMeIxV7SMc0PfqwYprMbHRABu
 F3hEypbJDh4eC27gYhAU6L5MrrP6vA3RjLyvKD15TzuTKRlvjO68nPHYTCnKRnegYF36
 sW8O/Mx+GH4Freds4jPFEe4H+B5dAAGBJjrfq7WLdknCiGXLe9eco7Ixagd3ctiioot9
 c6yg==
X-Gm-Message-State: AOAM53208sl0iQd0imZry/nicsm/qirPgx6BDk2lS+ATo3q8Pt0GrOd7
 mhocmQMRsP5QQT+tCm/nXfPdVg==
X-Google-Smtp-Source: ABdhPJww/yXnIrmw4dV6nYBUX9LaBGEi0Lku01mI/ZMa1EI2U6o7P5Iwk+L/poIxhMXJUMx+lSt0bQ==
X-Received: by 2002:a37:6453:: with SMTP id y80mr3501697qkb.291.1616472764662; 
 Mon, 22 Mar 2021 21:12:44 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-23-174-92-28-28.dsl.bell.ca. [174.92.28.28])
 by smtp.googlemail.com with ESMTPSA id m21sm12601181qka.28.2021.03.22.21.12.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 21:12:44 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v1 6/8] hw/intc: GICv3 redistributor ITS processing
Date: Tue, 23 Mar 2021 00:12:36 -0400
Message-Id: <20210323041238.133835-7-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210323041238.133835-1-shashi.mallela@linaro.org>
References: <20210323041238.133835-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x733.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implemented lpi processing at redistributor to get lpi config info
from lpi configuration table,determine priority,set pending state in
lpi pending table and forward the lpi to cpuif.Added logic to invoke
redistributor lpi processing with translated LPI which set/clear LPI
from ITS device as part of ITS INT,CLEAR,DISCARD command and
GITS_TRANSLATER processing.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 hw/intc/arm_gicv3.c        |   6 +
 hw/intc/arm_gicv3_cpuif.c  |  15 ++-
 hw/intc/arm_gicv3_its.c    |   9 +-
 hw/intc/arm_gicv3_redist.c | 126 ++++++++++++++++++++
 hw/intc/gicv3_internal.h   |   3 +
 5 files changed, 154 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
index 66eaa97198..618fa1af95 100644
--- a/hw/intc/arm_gicv3.c
+++ b/hw/intc/arm_gicv3.c
@@ -166,6 +166,12 @@ static void gicv3_redist_update_noirqset(GICv3CPUState *cs)
         cs->hppi.grp = gicv3_irq_group(cs->gic, cs, cs->hppi.irq);
     }
 
+    if (cs->gic->lpi_enable) {
+        if (gicv3_redist_update_lpi(cs)) {
+            seenbetter = true;
+        }
+    }
+
     /* If the best interrupt we just found would preempt whatever
      * was the previous best interrupt before this update, then
      * we know it's definitely the best one now.
diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 43ef1d7a84..c225b80f66 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -899,9 +899,14 @@ static void icc_activate_irq(GICv3CPUState *cs, int irq)
         cs->gicr_ipendr0 = deposit32(cs->gicr_ipendr0, irq, 1, 0);
         gicv3_redist_update(cs);
     } else {
-        gicv3_gicd_active_set(cs->gic, irq);
-        gicv3_gicd_pending_clear(cs->gic, irq);
-        gicv3_update(cs->gic, irq, 1);
+        if (irq >= GICV3_LPI_INTID_START) {
+            gicv3_redist_lpi_pending(cs, irq, 0);
+            gicv3_redist_update(cs);
+        } else {
+            gicv3_gicd_active_set(cs->gic, irq);
+            gicv3_gicd_pending_clear(cs->gic, irq);
+            gicv3_update(cs->gic, irq, 1);
+        }
     }
 }
 
@@ -1337,7 +1342,9 @@ static void icc_eoir_write(CPUARMState *env, const ARMCPRegInfo *ri,
          * valid interrupt value read from the Interrupt Acknowledge
          * register" and so this is UNPREDICTABLE. We choose to ignore it.
          */
-        return;
+        if (!(cs->gic->lpi_enable && (irq >= GICV3_LPI_INTID_START))) {
+            return;
+        }
     }
 
     if (icc_highest_active_group(cs) != grp) {
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index de2d179b5e..bb46af92a3 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -262,6 +262,7 @@ static MemTxResult process_int(GICv3ITSState *s, uint64_t value,
     bool ite_valid = false;
     uint64_t cte = 0;
     bool cte_valid = false;
+    uint64_t rdbase;
     uint8_t buff[GITS_TYPER_ITT_ENTRY_SIZE];
     uint64_t itt_addr;
 
@@ -315,12 +316,18 @@ static MemTxResult process_int(GICv3ITSState *s, uint64_t value,
              * since with a physical address the target address must be
              * 64KB aligned
              */
-
+            rdbase = (cte >> 1U) & RDBASE_MASK;
             /*
              * Current implementation only supports rdbase == procnum
              * Hence rdbase physical address is ignored
              */
         } else {
+            rdbase = (cte >> 1U) & RDBASE_PROCNUM_MASK;
+            if ((cmd == CLEAR) || (cmd == DISCARD)) {
+                gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase], pIntid, 0);
+            } else {
+                gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase], pIntid, 1);
+            }
 
             if (cmd == DISCARD) {
                 /* remove mapping from interrupt translation table */
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index f4d14811ec..dc47ed42d2 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -549,6 +549,132 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
     return r;
 }
 
+bool gicv3_redist_update_lpi(GICv3CPUState *cs)
+{
+    AddressSpace *as = &cs->gic->sysmem_as;
+    uint64_t lpict_baddr, lpipt_baddr;
+    uint32_t pendt_size = 0;
+    uint8_t lpite;
+    uint8_t prio, pend;
+    int i;
+    bool seenbetter = false;
+
+    if ((!cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs->gicr_propbaser ||
+        !cs->gicr_pendbaser || cs->lpi_outofrange) {
+        return seenbetter;
+    }
+
+    lpict_baddr = (cs->gicr_propbaser >> GICR_PROPBASER_ADDR_OFFSET) &
+                       GICR_PROPBASER_ADDR_MASK;
+    lpict_baddr <<= GICR_PROPBASER_ADDR_OFFSET;
+
+    lpipt_baddr = (cs->gicr_pendbaser >> GICR_PENDBASER_ADDR_OFFSET) &
+                       GICR_PENDBASER_ADDR_MASK;
+    lpipt_baddr <<= GICR_PENDBASER_ADDR_OFFSET;
+
+    /* Determine the highest priority pending interrupt among LPIs */
+    pendt_size = (1UL << ((cs->gicr_propbaser &
+                            GICR_PROPBASER_IDBITS_MASK) - 1));
+
+    for (i = 0; i < pendt_size; i++) {
+        address_space_read(as, lpipt_baddr +
+                (((GICV3_LPI_INTID_START + i) / 8) * sizeof(pend)),
+                MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
+
+        if ((1 << ((GICV3_LPI_INTID_START + i) % 8)) & pend) {
+            address_space_read(as, lpict_baddr + (i * sizeof(lpite)),
+                      MEMTXATTRS_UNSPECIFIED, &lpite, sizeof(lpite));
+
+            prio = ((lpite >> LPI_CTE_PRIORITY_OFFSET) &
+                     LPI_CTE_PRIORITY_MASK);
+            prio &= LPI_PRIORITY_MASK;
+
+            if (prio < cs->hppi.prio) {
+                cs->hppi.irq = GICV3_LPI_INTID_START + i;
+                cs->hppi.prio = prio;
+                /* LPIs are always non-secure Grp1 interrupts */
+                cs->hppi.grp = GICV3_G1NS;
+                seenbetter = true;
+            }
+        }
+    }
+    return seenbetter;
+}
+
+void gicv3_redist_lpi_pending(GICv3CPUState *cs, int irq, int level)
+{
+    AddressSpace *as = &cs->gic->sysmem_as;
+    uint64_t lpipt_baddr;
+    bool ispend = false;
+    uint8_t pend;
+
+    /*
+     * get the bit value corresponding to this irq in the
+     * lpi pending table
+     */
+    lpipt_baddr = (cs->gicr_pendbaser >> GICR_PENDBASER_ADDR_OFFSET) &
+                      GICR_PENDBASER_ADDR_MASK;
+    lpipt_baddr <<= GICR_PENDBASER_ADDR_OFFSET;
+
+    address_space_read(as, lpipt_baddr + ((irq / 8) * sizeof(pend)),
+                         MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
+    ispend = ((pend >> (irq % 8)) & 0x1);
+
+    if (ispend) {
+        if (!level) {
+            /*
+             * clear the pending bit and update the lpi pending table
+             */
+            pend &= ~(1 << (irq % 8));
+
+            address_space_write(as, lpipt_baddr + ((irq / 8) * sizeof(pend)),
+                                 MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
+        }
+    } else {
+        if (level) {
+            /*
+             * if pending bit is not already set for this irq,turn-on the
+             * pending bit and update the lpi pending table
+             */
+            pend |= (1 << (irq % 8));
+
+            address_space_write(as, lpipt_baddr + ((irq / 8) * sizeof(pend)),
+                                 MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
+        }
+    }
+}
+
+void gicv3_redist_process_lpi(GICv3CPUState *cs, int irq, int level)
+{
+    AddressSpace *as = &cs->gic->sysmem_as;
+    uint64_t lpict_baddr;
+    uint8_t lpite;
+
+    if ((!cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs->gicr_propbaser ||
+         !cs->gicr_pendbaser || cs->lpi_outofrange) {
+        return;
+    }
+
+    lpict_baddr = (cs->gicr_propbaser >> GICR_PROPBASER_ADDR_OFFSET) &
+                      GICR_PROPBASER_ADDR_MASK;
+    lpict_baddr <<= GICR_PROPBASER_ADDR_OFFSET;
+
+    /* get the lpi config table entry corresponding to this irq */
+    address_space_read(as, lpict_baddr + ((irq - GICV3_LPI_INTID_START) *
+                        sizeof(lpite)), MEMTXATTRS_UNSPECIFIED,
+                        &lpite, sizeof(lpite));
+
+    /* check if this irq is enabled before proceeding further */
+    if (!(lpite & LPI_CTE_ENABLED)) {
+        return;
+    }
+
+    /* set/clear the pending bit for this irq */
+    gicv3_redist_lpi_pending(cs, irq, level);
+
+    gicv3_redist_update(cs);
+}
+
 void gicv3_redist_set_irq(GICv3CPUState *cs, int irq, int level)
 {
     /* Update redistributor state for a change in an external PPI input line */
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 7c6bc33e97..cbb7810ec8 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -465,6 +465,9 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
                                unsigned size, MemTxAttrs attrs);
 void gicv3_dist_set_irq(GICv3State *s, int irq, int level);
 void gicv3_redist_set_irq(GICv3CPUState *cs, int irq, int level);
+void gicv3_redist_process_lpi(GICv3CPUState *cs, int irq, int level);
+void gicv3_redist_lpi_pending(GICv3CPUState *cs, int irq, int level);
+bool gicv3_redist_update_lpi(GICv3CPUState *cs);
 void gicv3_redist_send_sgi(GICv3CPUState *cs, int grp, int irq, bool ns);
 void gicv3_init_cpuif(GICv3State *s);
 
-- 
2.27.0


