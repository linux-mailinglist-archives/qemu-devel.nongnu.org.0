Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B82436F310
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 01:50:39 +0200 (CEST)
Received: from localhost ([::1]:44552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcGQY-0006fs-9m
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 19:50:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lcGIU-0005kZ-Ee
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 19:42:19 -0400
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:43565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lcGIJ-0004Lc-VS
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 19:42:17 -0400
Received: by mail-qv1-xf2a.google.com with SMTP id t14so3463064qvl.10
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 16:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YaOdwiS8QcUQAMhViY5sMkq8KyX2xhqLxk47bdZoEsA=;
 b=MbH2FJNJNdhrpE4OBBnFLkkQq4vMICKDLfLLhYnhbP05g+oFbPqvSEk/hADpW6fS0D
 0dXCjKtqz2n97C03g/k2thAtkG0aj/j03eu1jXMuvYNLm2x3PaVuGwdm7Fk5+LZoQ9/F
 aG/7199/DyQntznaRzuEWKctgAMd0DVjb6DLKh7KkJir1uQDBcTlCFWRvWctCwSb3TVl
 YqnWdqRQacGBFA/vBOneMp6PuQiffZKlvRTFcf64fAuXuf5zStT6SZNnyz7o3oovD7cX
 6k1Bnrc8L7sXYr2CN6amxWrwBwmzUnqa2PqXW+Ow+yedUzba7U4m+z10Rj7X0xaCnuv8
 Z2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YaOdwiS8QcUQAMhViY5sMkq8KyX2xhqLxk47bdZoEsA=;
 b=SYpKXnDRior0/5KkBVxSfxCaYBYZs++V+qg6tIQgnox8E2iwDEjQFQPzzsFdtwcikF
 AiGCABA6u9A/z3zoapCfLylFCc3l+BxqYRK60ri687qeIVtuqLfBJEnHRzUMgi4Da19Y
 BFqjW9I63EcoARtJ3K8Ujmc18v8cBreYLZo4TXNqoAkEGycLazdrdLZ8X5ahxvDoFIjY
 f9pp3VhWiqZIXe1Zf9xJDd4RZQTJrX4CuCEbWH2grUIDgZ3GgVxyizcsFxMei8uQihWq
 vZkZKM3pgvLneuIX/P9h/IbH3BbSvc4aW/S66Nx22E/uNxYAW37EK1DZ1nfYN9/DaDhl
 Szpg==
X-Gm-Message-State: AOAM530Qrbmk++u+kkOhOLa1gTR23LyvXw2/nlsFhlgUi48kJzx1At4d
 9v4+yn79y0eJu8Khra+IRByvtw==
X-Google-Smtp-Source: ABdhPJyZWLyld6GA2BmJlrdqu2hPnaixAZ4Taq0KOAxX1Pbd109y8FmyL4tIu0PRnQECG77buQxwdA==
X-Received: by 2002:a0c:c18c:: with SMTP id n12mr2415572qvh.43.1619739726475; 
 Thu, 29 Apr 2021 16:42:06 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-23-174-92-28-28.dsl.bell.ca. [174.92.28.28])
 by smtp.googlemail.com with ESMTPSA id i2sm1093229qtg.0.2021.04.29.16.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 16:42:06 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v3 6/8] hw/intc: GICv3 redistributor ITS processing
Date: Thu, 29 Apr 2021 19:41:59 -0400
Message-Id: <20210429234201.125565-7-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210429234201.125565-1-shashi.mallela@linaro.org>
References: <20210429234201.125565-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qv1-xf2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
 hw/intc/arm_gicv3.c        |   6 ++
 hw/intc/arm_gicv3_cpuif.c  |  20 ++++--
 hw/intc/arm_gicv3_its.c    |  12 ++--
 hw/intc/arm_gicv3_redist.c | 133 +++++++++++++++++++++++++++++++++++++
 hw/intc/gicv3_internal.h   |   9 +++
 5 files changed, 171 insertions(+), 9 deletions(-)

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
index 43ef1d7a84..11b1df5b6b 100644
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
 
@@ -1328,7 +1333,8 @@ static void icc_eoir_write(CPUARMState *env, const ARMCPRegInfo *ri,
         }
     }
 
-    if (irq >= cs->gic->num_irq) {
+    if ((irq >= cs->gic->num_irq) && (!(cs->gic->lpi_enable &&
+        (irq >= GICV3_LPI_INTID_START)))) {
         /* This handles two cases:
          * 1. If software writes the ID of a spurious interrupt [ie 1020-1023]
          * to the GICC_EOIR, the GIC ignores that write.
@@ -1348,7 +1354,11 @@ static void icc_eoir_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
     if (!icc_eoi_split(env, cs)) {
         /* Priority drop and deactivate not split: deactivate irq now */
-        icc_deactivate_irq(cs, irq);
+        if (irq >= GICV3_LPI_INTID_START) {
+            gicv3_update(cs->gic, irq, 1);
+        } else {
+            icc_deactivate_irq(cs, irq);
+        }
     }
 }
 
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 98c984dd22..28da2d1d77 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -219,6 +219,7 @@ static MemTxResult process_int(GICv3ITSState *s, uint64_t value,
     bool ite_valid = false;
     uint64_t cte = 0;
     bool cte_valid = false;
+    uint64_t rdbase;
     uint64_t itel = 0;
     uint32_t iteh = 0;
 
@@ -275,10 +276,13 @@ static MemTxResult process_int(GICv3ITSState *s, uint64_t value,
          * command in the queue
          */
     } else {
-        /*
-         * Current implementation only supports rdbase == procnum
-         * Hence rdbase physical address is ignored
-         */
+        rdbase = (cte >> 1U) & RDBASE_PROCNUM_MASK;
+        if ((cmd == CLEAR) || (cmd == DISCARD)) {
+            gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase], pIntid, 0);
+        } else {
+            gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase], pIntid, 1);
+        }
+
         if (cmd == DISCARD) {
             /* remove mapping from interrupt translation table */
             res = update_ite(s, eventid, dte, itel, iteh);
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 7604ccdc83..82ca9d71e5 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -256,6 +256,8 @@ static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
         if (cs->gicr_typer & GICR_TYPER_PLPIS) {
             if (value & GICR_CTLR_ENABLE_LPIS) {
                 cs->gicr_ctlr |= GICR_CTLR_ENABLE_LPIS;
+                /* Check for any pending interr in pending table */
+                gicv3_redist_update(cs);
             } else {
                 cs->gicr_ctlr &= ~GICR_CTLR_ENABLE_LPIS;
             }
@@ -546,6 +548,137 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
     return r;
 }
 
+bool gicv3_redist_update_lpi(GICv3CPUState *cs)
+{
+    /*
+     * This function scans the LPI pending table and for each pending
+     * LPI, reads the corresponding entry from LPI configuration table
+     * to extract the priority info and determine if the LPI priority
+     * is lower than the current high priority interrupt.If yes, update
+     * high priority pending interrupt to that of LPI.
+     */
+    AddressSpace *as = &cs->gic->dma_as;
+    uint64_t lpict_baddr, lpipt_baddr;
+    uint32_t pendt_size = 0;
+    uint8_t lpite;
+    uint8_t prio, pend;
+    int i;
+    bool seenbetter = false;
+
+    if ((!cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs->gicr_propbaser ||
+        !cs->gicr_pendbaser || (FIELD_EX64(cs->gicr_propbaser, GICR_PROPBASER,
+        IDBITS) < GICR_PROPBASER_IDBITS_THRESHOLD)) {
+        return seenbetter;
+    }
+
+    lpict_baddr = FIELD_EX64(cs->gicr_propbaser, GICR_PROPBASER, PHYADDR);
+    lpict_baddr <<= R_GICR_PROPBASER_PHYADDR_SHIFT;
+
+    lpipt_baddr =  FIELD_EX64(cs->gicr_pendbaser, GICR_PENDBASER, PHYADDR);
+    lpipt_baddr <<= R_GICR_PENDBASER_PHYADDR_SHIFT;
+
+    /* Determine the highest priority pending interrupt among LPIs */
+    pendt_size = (1UL << (FIELD_EX64(cs->gicr_propbaser, GICR_PROPBASER,
+                          IDBITS) - 1));
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
+    AddressSpace *as = &cs->gic->dma_as;
+    uint64_t lpipt_baddr;
+    bool ispend = false;
+    uint8_t pend;
+
+    /*
+     * get the bit value corresponding to this irq in the
+     * lpi pending table
+     */
+    lpipt_baddr = FIELD_EX64(cs->gicr_pendbaser, GICR_PENDBASER, PHYADDR);
+    lpipt_baddr <<= R_GICR_PENDBASER_PHYADDR_SHIFT;
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
+    AddressSpace *as = &cs->gic->dma_as;
+    uint64_t lpict_baddr;
+    uint8_t lpite;
+
+    if ((!cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs->gicr_propbaser ||
+         !cs->gicr_pendbaser || (FIELD_EX64(cs->gicr_propbaser, GICR_PROPBASER,
+         IDBITS) < GICR_PROPBASER_IDBITS_THRESHOLD)) {
+        return;
+    }
+
+    lpict_baddr = FIELD_EX64(cs->gicr_propbaser, GICR_PROPBASER, PHYADDR);
+    lpict_baddr <<= R_GICR_PROPBASER_PHYADDR_SHIFT;
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
index c99a05461e..dcdad8d0af 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -308,6 +308,12 @@ FIELD(GITS_TYPER, CIL, 36, 1)
 
 #define L1TABLE_ENTRY_SIZE         8
 
+#define LPI_CTE_ENABLE_OFFSET      0
+#define LPI_CTE_ENABLED          VALID_MASK
+#define LPI_CTE_PRIORITY_OFFSET    2
+#define LPI_CTE_PRIORITY_MASK     ((1U << 6) - 1)
+#define LPI_PRIORITY_MASK         0xfc
+
 #define GITS_CMDQ_ENTRY_SIZE               32
 #define NUM_BYTES_IN_DW                     8
 
@@ -453,6 +459,9 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
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


