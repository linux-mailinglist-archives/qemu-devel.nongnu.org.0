Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EC53B865E
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 17:38:34 +0200 (CEST)
Received: from localhost ([::1]:37312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lycIL-0005Y9-6w
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 11:38:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lycCG-0004sq-H1
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 11:32:16 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:47080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lycC4-00057H-Jf
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 11:32:16 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id u2so1272253qvp.13
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 08:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uXOmtuafwF16Ob1befAUGTc4zkqQTuHmJgvYXgCx/w4=;
 b=Ly49KkBB+rIXuLCntQ74wyl1P2zG+e1V9SM/4aHIVaDstHK2R59bcZ9vXc9Qp9psuT
 Qgg7rzmfEfPNKbaA4I9seQXX8Ba/5Doic5nYtGZ+P3nwI44n3NTiNZYx+XCxVQDHPuWg
 9GU3uORKNHcX2ZCm1P16asKwfy7oeBY2nO2SJQZrP5t6EpMd8yg/PF8k57zsT6VlWFWK
 k6H5i1R+ByBSbGi2UIfmVtX7EZftLyawhNJ/4xRmzRGvb7u+uIGodVqiYz/+9wSydF47
 C2n945h06fKcwr/+e81594720BpUXdDkqvkf+bIrvdzZdjvjY/GbKT7rb9ahHnKMew7I
 LtcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uXOmtuafwF16Ob1befAUGTc4zkqQTuHmJgvYXgCx/w4=;
 b=q9ptEPyWwEM3L+OAsVUzT6SNHJr95RyWL00lgS/TR/mj3bnFjJsvxIP33t/jkNOmq3
 SDUORdhwyp8P48+v4jKgRRYKV0jtift3XoFooQxWeEE2FGAE0KC6AZ738ktZ8QqUd+Yf
 umkHXJRGCthQAcet/PGLrOhS7L3Mppr3U1SJ8Cy/Qi4co8lnPqkBGvIVH/kZMWPwqao9
 R5k41dM2rBvxWyZNtD2RxID/iUGZnbJCA51ivHuZD4BQ6Vu5JZzYLXVSLTj5Br7vUBc4
 vUzetgcvUlRaT8pkDOO0IgPOa6MZB/sMbocckjgVG4kgejTklICgUMCikuyKa5OEGInh
 2Nuw==
X-Gm-Message-State: AOAM533zOXSmJdZ/X61AnFWXMhW4HafHJ4pSVErNBODY6trLy96hE24L
 0QHenkLL1PAF0ULWet9zIhVBUw==
X-Google-Smtp-Source: ABdhPJx92JmNPTcVSahBqTNe4b0/xB+WHDaABdd5OeckIe+xxUBHQTRlDpQk9dcPlgQgIZGTZvQfWA==
X-Received: by 2002:a05:6214:931:: with SMTP id
 dk17mr7532378qvb.4.1625067123643; 
 Wed, 30 Jun 2021 08:32:03 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.googlemail.com with ESMTPSA id 4sm836131qkm.100.2021.06.30.08.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 08:32:03 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v5 06/10] hw/intc: GICv3 redistributor ITS processing
Date: Wed, 30 Jun 2021 11:31:52 -0400
Message-Id: <20210630153156.9421-7-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210630153156.9421-1-shashi.mallela@linaro.org>
References: <20210630153156.9421-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qv1-xf2e.google.com
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
 hw/intc/arm_gicv3.c                |  14 +++
 hw/intc/arm_gicv3_common.c         |   1 +
 hw/intc/arm_gicv3_cpuif.c          |   7 +-
 hw/intc/arm_gicv3_its.c            |  24 ++++-
 hw/intc/arm_gicv3_redist.c         | 142 +++++++++++++++++++++++++++++
 hw/intc/gicv3_internal.h           |   8 ++
 include/hw/intc/arm_gicv3_common.h |   7 ++
 7 files changed, 197 insertions(+), 6 deletions(-)

diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
index d63f8af604..3f24707838 100644
--- a/hw/intc/arm_gicv3.c
+++ b/hw/intc/arm_gicv3.c
@@ -165,6 +165,16 @@ static void gicv3_redist_update_noirqset(GICv3CPUState *cs)
         cs->hppi.grp = gicv3_irq_group(cs->gic, cs, cs->hppi.irq);
     }
 
+    if ((cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) && cs->gic->lpi_enable &&
+        (cs->hpplpi.prio != 0xff)) {
+        if (irqbetter(cs, cs->hpplpi.irq, cs->hpplpi.prio)) {
+            cs->hppi.irq = cs->hpplpi.irq;
+            cs->hppi.prio = cs->hpplpi.prio;
+            cs->hppi.grp = cs->hpplpi.grp;
+            seenbetter = true;
+        }
+    }
+
     /* If the best interrupt we just found would preempt whatever
      * was the previous best interrupt before this update, then
      * we know it's definitely the best one now.
@@ -339,9 +349,13 @@ static void gicv3_set_irq(void *opaque, int irq, int level)
 
 static void arm_gicv3_post_load(GICv3State *s)
 {
+    int i;
     /* Recalculate our cached idea of the current highest priority
      * pending interrupt, but don't set IRQ or FIQ lines.
      */
+    for (i = 0; i < s->num_cpu; i++) {
+        gicv3_redist_update_lpi(&s->cpu[i]);
+    }
     gicv3_full_update_noirqset(s);
     /* Repopulate the cache of GICv3CPUState pointers for target CPUs */
     gicv3_cache_all_target_cpustates(s);
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 53dea2a775..223db16fec 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -435,6 +435,7 @@ static void arm_gicv3_common_reset(DeviceState *dev)
         memset(cs->gicr_ipriorityr, 0, sizeof(cs->gicr_ipriorityr));
 
         cs->hppi.prio = 0xff;
+        cs->hpplpi.prio = 0xff;
 
         /* State in the CPU interface must *not* be reset here, because it
          * is part of the CPU's reset domain, not the GIC device's.
diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 3e0641aff9..184b92e7de 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -899,10 +899,12 @@ static void icc_activate_irq(GICv3CPUState *cs, int irq)
         cs->gicr_iactiver0 = deposit32(cs->gicr_iactiver0, irq, 1, 1);
         cs->gicr_ipendr0 = deposit32(cs->gicr_ipendr0, irq, 1, 0);
         gicv3_redist_update(cs);
-    } else {
+    } else if (irq < GICV3_LPI_INTID_START) {
         gicv3_gicd_active_set(cs->gic, irq);
         gicv3_gicd_pending_clear(cs->gic, irq);
         gicv3_update(cs->gic, irq, 1);
+    } else {
+        gicv3_redist_lpi_pending(cs, irq, 0);
     }
 }
 
@@ -1318,7 +1320,8 @@ static void icc_eoir_write(CPUARMState *env, const ARMCPRegInfo *ri,
     trace_gicv3_icc_eoir_write(is_eoir0 ? 0 : 1,
                                gicv3_redist_affid(cs), value);
 
-    if (irq >= cs->gic->num_irq) {
+    if ((irq >= cs->gic->num_irq) &&
+        !(cs->gic->lpi_enable && (irq >= GICV3_LPI_INTID_START))) {
         /* This handles two cases:
          * 1. If software writes the ID of a spurious interrupt [ie 1020-1023]
          * to the GICC_EOIR, the GIC ignores that write.
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index adaee72c1f..5adb55a01a 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -225,6 +225,7 @@ static MemTxResult process_its_cmd(GICv3ITSState *s, uint64_t value,
     bool ite_valid = false;
     uint64_t cte = 0;
     bool cte_valid = false;
+    uint64_t rdbase;
     IteEntry ite;
 
     if (cmd == NONE) {
@@ -282,10 +283,18 @@ static MemTxResult process_its_cmd(GICv3ITSState *s, uint64_t value,
          * command in the queue
          */
     } else {
-        /*
-         * Current implementation only supports rdbase == procnum
-         * Hence rdbase physical address is ignored
-         */
+        rdbase = (cte >> 1U) & RDBASE_PROCNUM_MASK;
+
+        if (rdbase > s->gicv3->num_cpu) {
+            return res;
+        }
+
+        if ((cmd == CLEAR) || (cmd == DISCARD)) {
+            gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase], pIntid, 0);
+        } else {
+            gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase], pIntid, 1);
+        }
+
         if (cmd == DISCARD) {
             memset(&ite, 0 , sizeof(ite));
             /* remove mapping from interrupt translation table */
@@ -672,6 +681,13 @@ static void process_cmdq(GICv3ITSState *s)
             break;
         case GITS_CMD_INV:
         case GITS_CMD_INVALL:
+            /*
+             * Current implementation doesn't cache any ITS tables,
+             * but the calculated lpi priority information.We only
+             * need to trigger lpi priority re-calculation to be in
+             * sync with LPI config table or pending table changes.
+             */
+            gicv3_redist_update_lpi(s->gicv3->cpu);
             break;
         default:
             break;
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index fc3d95dcc6..97553e6ada 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -254,6 +254,9 @@ static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
         if (cs->gicr_typer & GICR_TYPER_PLPIS) {
             if (value & GICR_CTLR_ENABLE_LPIS) {
                 cs->gicr_ctlr |= GICR_CTLR_ENABLE_LPIS;
+                /* Check for any pending interr in pending table */
+                gicv3_redist_update_lpi(cs);
+                gicv3_redist_update(cs);
             } else {
                 cs->gicr_ctlr &= ~GICR_CTLR_ENABLE_LPIS;
             }
@@ -532,6 +535,145 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
     return r;
 }
 
+static void gicv3_redist_check_lpi_priority(GICv3CPUState *cs, int irq)
+{
+    AddressSpace *as = &cs->gic->dma_as;
+    uint64_t lpict_baddr;
+    uint8_t lpite;
+    uint8_t prio;
+
+    lpict_baddr = cs->gicr_propbaser & R_GICR_PROPBASER_PHYADDR_MASK;
+
+    address_space_read(as, lpict_baddr + ((irq - GICV3_LPI_INTID_START) *
+                       sizeof(lpite)), MEMTXATTRS_UNSPECIFIED, &lpite,
+                       sizeof(lpite));
+
+    if (!(lpite & LPI_CTE_ENABLED)) {
+        return;
+    }
+
+    if (cs->gic->gicd_ctlr & GICD_CTLR_DS) {
+        prio = lpite & LPI_PRIORITY_MASK;
+    } else {
+        prio = ((lpite & LPI_PRIORITY_MASK) >> 1) & 0x80;
+    }
+
+    if ((prio < cs->hpplpi.prio) ||
+        ((prio == cs->hpplpi.prio) && (irq <= cs->hpplpi.irq))) {
+        cs->hpplpi.irq = irq;
+        cs->hpplpi.prio = prio;
+        /* LPIs are always non-secure Grp1 interrupts */
+        cs->hpplpi.grp = GICV3_G1NS;
+    }
+}
+
+void gicv3_redist_update_lpi(GICv3CPUState *cs)
+{
+    /*
+     * This function scans the LPI pending table and for each pending
+     * LPI, reads the corresponding entry from LPI configuration table
+     * to extract the priority info and determine if the current LPI
+     * priority is lower than the last computed high priority lpi interrupt.
+     * If yes, replace current LPI as the new high priority lpi interrupt.
+     */
+    AddressSpace *as = &cs->gic->dma_as;
+    uint64_t lpipt_baddr;
+    uint32_t pendt_size = 0;
+    uint8_t pend;
+    int i;
+    uint64_t idbits;
+
+    idbits = MIN(FIELD_EX64(cs->gicr_propbaser, GICR_PROPBASER, IDBITS),
+                 GICD_TYPER_IDBITS);
+
+    if (!(cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs->gicr_propbaser ||
+        !cs->gicr_pendbaser || (idbits < GICR_PROPBASER_IDBITS_THRESHOLD)) {
+        return;
+    }
+
+    cs->hpplpi.prio = 0xff;
+
+    lpipt_baddr = cs->gicr_pendbaser & R_GICR_PENDBASER_PHYADDR_MASK;
+
+    /* Determine the highest priority pending interrupt among LPIs */
+    pendt_size = (1ULL << (idbits + 1));
+
+    for (i = 0; i < pendt_size / 8; i++) {
+        address_space_read(as, lpipt_baddr +
+                (((GICV3_LPI_INTID_START + i) / 8) * sizeof(pend)),
+                MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
+
+        if (!((1 << ((GICV3_LPI_INTID_START + i) % 8)) & pend)) {
+            continue;
+        }
+
+        gicv3_redist_check_lpi_priority(cs, GICV3_LPI_INTID_START + i);
+    }
+}
+
+void gicv3_redist_lpi_pending(GICv3CPUState *cs, int irq, int level)
+{
+    /*
+     * This function updates the pending bit in lpi pending table for
+     * the irq being activated or deactivated.
+     */
+    AddressSpace *as = &cs->gic->dma_as;
+    uint64_t lpipt_baddr;
+    bool ispend = false;
+    uint8_t pend;
+
+    /*
+     * get the bit value corresponding to this irq in the
+     * lpi pending table
+     */
+    lpipt_baddr = cs->gicr_pendbaser & R_GICR_PENDBASER_PHYADDR_MASK;
+
+    address_space_read(as, lpipt_baddr + ((irq / 8) * sizeof(pend)),
+                       MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
+
+    /*
+     * check if this LPI is better than the current hpplpi, if yes
+     * just set hpplpi.prio and .irq without doing a full rescan
+     */
+    if (level) {
+        gicv3_redist_check_lpi_priority(cs, irq);
+    }
+
+    ispend = extract32(pend, irq % 8, 1);
+
+    /* no change in the value of pending bit,return */
+    if (ispend == level) {
+        return;
+    }
+    pend = deposit32(pend, irq % 8, 1, level ? 1 : 0);
+
+    address_space_write(as, lpipt_baddr + ((irq / 8) * sizeof(pend)),
+                        MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
+
+    if (!level) {
+        gicv3_redist_update_lpi(cs);
+    }
+}
+
+void gicv3_redist_process_lpi(GICv3CPUState *cs, int irq, int level)
+{
+    uint64_t idbits;
+
+    idbits = MIN(FIELD_EX64(cs->gicr_propbaser, GICR_PROPBASER, IDBITS),
+                 GICD_TYPER_IDBITS);
+
+    if (!(cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs->gicr_propbaser ||
+         !cs->gicr_pendbaser || (idbits < GICR_PROPBASER_IDBITS_THRESHOLD) ||
+         (irq > (1ULL << (idbits + 1)))) {
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
index 43ce4a8a95..c0ec1d9a66 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -308,6 +308,11 @@ FIELD(GITS_TYPER, CIL, 36, 1)
 
 #define L1TABLE_ENTRY_SIZE         8
 
+#define LPI_CTE_ENABLED          TABLE_ENTRY_VALID_MASK
+#define LPI_CTE_PRIORITY_OFFSET    2
+#define LPI_CTE_PRIORITY_MASK     ((1U << 6) - 1)
+#define LPI_PRIORITY_MASK         0xfc
+
 #define GITS_CMDQ_ENTRY_SIZE               32
 #define NUM_BYTES_IN_DW                     8
 
@@ -455,6 +460,9 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
                                unsigned size, MemTxAttrs attrs);
 void gicv3_dist_set_irq(GICv3State *s, int irq, int level);
 void gicv3_redist_set_irq(GICv3CPUState *cs, int irq, int level);
+void gicv3_redist_process_lpi(GICv3CPUState *cs, int irq, int level);
+void gicv3_redist_lpi_pending(GICv3CPUState *cs, int irq, int level);
+void gicv3_redist_update_lpi(GICv3CPUState *cs);
 void gicv3_redist_send_sgi(GICv3CPUState *cs, int grp, int irq, bool ns);
 void gicv3_init_cpuif(GICv3State *s);
 
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index c1348cc60a..aa4f0d6770 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -204,6 +204,13 @@ struct GICv3CPUState {
      * real state above; it doesn't need to be migrated.
      */
     PendingIrq hppi;
+
+    /*
+     * Cached information recalculated from LPI tables
+     * in guest memory
+     */
+    PendingIrq hpplpi;
+
     /* This is temporary working state, to avoid a malloc in gicv3_update() */
     bool seenbetter;
 };
-- 
2.27.0


