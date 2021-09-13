Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 965484098CE
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 18:20:06 +0200 (CEST)
Received: from localhost ([::1]:40288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPoge-0002Rn-Fz
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 12:20:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPoYu-00017i-Bk
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:12:04 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:38638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPoYq-0008DG-H0
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:12:03 -0400
Received: by mail-wr1-x42f.google.com with SMTP id u16so15554274wrn.5
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 09:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=GCsDRJBpMn1VTHJToXsg549TDTPGFlHhcVmAwYBrH+Y=;
 b=GODltXlRFejsf7EFM/UR2LzhYd+7EAV6+wsYSynyrsK42xZVJWUp/vgTcJQGb/Svmi
 h0Y3Q9eXu+z7+9v7089hwdL+NSh1Nv850HcKTZE0JLFpOYyyPPQB/Ne97UeACCm+uccR
 FYzqPzxk4SqgL6gg1n3+YJaskQS/V8I6Br+kJo7q6imHRFej6RmDis3XSzhZIRBZjt3q
 NNRBeJPn71hlvhYX38pR5nEtaPujB4EduKOgBqi8h4ZtIVG55bCz6JnE/SkdKDWx3DZC
 YR7OS/Lm8DdCLPrkl+qcizZ445m2gp9SOL0ST14lgRvWcaN4JwGqqvLo77qB5HmK+AuR
 jE+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GCsDRJBpMn1VTHJToXsg549TDTPGFlHhcVmAwYBrH+Y=;
 b=PNF+X7J8/yOyZXOD6MGM+Eyeba3lA/ixv9fG9+WN3aPy4WJg3dZAskqISrLYA8VA3a
 caJXv2iz90KaQfsbe58CiXfw5Hh4P7OxiMqY0h/yeEnasiGgeAj1NS7b1Q0KN53S6tKG
 RSl9t7iHl+LJPAwe4Huu1Pf3mA7vNbq16lf/BW1yOB2veIf9cQ5qdLWGfblZYIDSsuEl
 CQfqXgBOG6M3uOhZhtKRzlA7cS5wt4I9trRPnoB0Rq+7paiCTZeNx2e6Cd8Utm3EPbY2
 2jZb+Va2w6Zuido1KLjzDqimOTQ7h9glUvMvTfEcV3jSSU7E3OhjQOjWmamGtvlk2Wi1
 bfOA==
X-Gm-Message-State: AOAM533I4HFhaCIZOeCD8wOz1qe/0Ajb96Zwsxss/Tdo+OnjurQucZSZ
 Wwl7dk529OcGBUU0leaKHajCR0KQ+n+lNw==
X-Google-Smtp-Source: ABdhPJw1+KqNp5mg9+cZcmMRO96bKneoDHG+4UrnXCsNcVUh0frO+O5DIRuNB0qCTUO4NIRoyKAu4g==
X-Received: by 2002:adf:f683:: with SMTP id v3mr9442373wrp.423.1631549518020; 
 Mon, 13 Sep 2021 09:11:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y1sm7629265wmq.43.2021.09.13.09.11.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 09:11:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/23] hw/intc: GICv3 redistributor ITS processing
Date: Mon, 13 Sep 2021 17:11:35 +0100
Message-Id: <20210913161144.12347-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210913161144.12347-1-peter.maydell@linaro.org>
References: <20210913161144.12347-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Shashi Mallela <shashi.mallela@linaro.org>

Implemented lpi processing at redistributor to get lpi config info
from lpi configuration table,determine priority,set pending state in
lpi pending table and forward the lpi to cpuif.Added logic to invoke
redistributor lpi processing with translated LPI which set/clear LPI
from ITS device as part of ITS INT,CLEAR,DISCARD command and
GITS_TRANSLATER processing.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
Tested-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20210910143951.92242-7-shashi.mallela@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/gicv3_internal.h           |   9 ++
 include/hw/intc/arm_gicv3_common.h |   7 ++
 hw/intc/arm_gicv3.c                |  14 +++
 hw/intc/arm_gicv3_common.c         |   1 +
 hw/intc/arm_gicv3_cpuif.c          |   7 +-
 hw/intc/arm_gicv3_its.c            |  23 +++++
 hw/intc/arm_gicv3_redist.c         | 141 +++++++++++++++++++++++++++++
 7 files changed, 200 insertions(+), 2 deletions(-)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 530d1c17897..a0369dace7b 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -140,6 +140,8 @@ FIELD(GICR_PENDBASER, PHYADDR, 16, 36)
 FIELD(GICR_PENDBASER, OUTERCACHE, 56, 3)
 FIELD(GICR_PENDBASER, PTZ, 62, 1)
 
+#define GICR_PROPBASER_IDBITS_THRESHOLD          0xd
+
 #define ICC_CTLR_EL1_CBPR           (1U << 0)
 #define ICC_CTLR_EL1_EOIMODE        (1U << 1)
 #define ICC_CTLR_EL1_PMHE           (1U << 6)
@@ -305,6 +307,9 @@ FIELD(GITS_TYPER, CIL, 36, 1)
 
 #define L1TABLE_ENTRY_SIZE         8
 
+#define LPI_CTE_ENABLED          TABLE_ENTRY_VALID_MASK
+#define LPI_PRIORITY_MASK         0xfc
+
 #define GITS_CMDQ_ENTRY_SIZE               32
 #define NUM_BYTES_IN_DW                     8
 
@@ -397,6 +402,7 @@ FIELD(MAPC, RDBASE, 16, 32)
  * Valid = 1 bit,RDBase = 36 bits(considering max RDBASE)
  */
 #define GITS_CTE_SIZE                 (0x8ULL)
+#define GITS_CTE_RDBASE_PROCNUM_MASK  MAKE_64BIT_MASK(1, RDBASE_PROCNUM_LENGTH)
 
 /* Special interrupt IDs */
 #define INTID_SECURE 1020
@@ -455,6 +461,9 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
                                unsigned size, MemTxAttrs attrs);
 void gicv3_dist_set_irq(GICv3State *s, int irq, int level);
 void gicv3_redist_set_irq(GICv3CPUState *cs, int irq, int level);
+void gicv3_redist_process_lpi(GICv3CPUState *cs, int irq, int level);
+void gicv3_redist_lpi_pending(GICv3CPUState *cs, int irq, int level);
+void gicv3_redist_update_lpi(GICv3CPUState *cs);
 void gicv3_redist_send_sgi(GICv3CPUState *cs, int grp, int irq, bool ns);
 void gicv3_init_cpuif(GICv3State *s);
 
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index c1348cc60a1..aa4f0d67703 100644
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
diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
index d63f8af604d..3f24707838c 100644
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
index 53dea2a7756..223db16feca 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -435,6 +435,7 @@ static void arm_gicv3_common_reset(DeviceState *dev)
         memset(cs->gicr_ipriorityr, 0, sizeof(cs->gicr_ipriorityr));
 
         cs->hppi.prio = 0xff;
+        cs->hpplpi.prio = 0xff;
 
         /* State in the CPU interface must *not* be reset here, because it
          * is part of the CPU's reset domain, not the GIC device's.
diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index a032d505f53..462a35f66eb 100644
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
index 03c68009978..efb1b5ecab8 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -233,6 +233,7 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
     uint64_t cte = 0;
     bool cte_valid = false;
     bool result = false;
+    uint64_t rdbase;
 
     if (cmd == NONE) {
         devid = offset;
@@ -293,6 +294,18 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
          * Current implementation only supports rdbase == procnum
          * Hence rdbase physical address is ignored
          */
+        rdbase = (cte & GITS_CTE_RDBASE_PROCNUM_MASK) >> 1U;
+
+        if (rdbase > s->gicv3->num_cpu) {
+            return result;
+        }
+
+        if ((cmd == CLEAR) || (cmd == DISCARD)) {
+            gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase], pIntid, 0);
+        } else {
+            gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase], pIntid, 1);
+        }
+
         if (cmd == DISCARD) {
             IteEntry ite = {};
             /* remove mapping from interrupt translation table */
@@ -621,6 +634,7 @@ static void process_cmdq(GICv3ITSState *s)
     MemTxResult res = MEMTX_OK;
     bool result = true;
     uint8_t cmd;
+    int i;
 
     if (!(s->ctlr & ITS_CTLR_ENABLED)) {
         return;
@@ -685,6 +699,15 @@ static void process_cmdq(GICv3ITSState *s)
             break;
         case GITS_CMD_INV:
         case GITS_CMD_INVALL:
+            /*
+             * Current implementation doesn't cache any ITS tables,
+             * but the calculated lpi priority information. We only
+             * need to trigger lpi priority re-calculation to be in
+             * sync with LPI config table or pending table changes.
+             */
+            for (i = 0; i < s->gicv3->num_cpu; i++) {
+                gicv3_redist_update_lpi(&s->gicv3->cpu[i]);
+            }
             break;
         default:
             break;
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 2108abfe9c3..7072bfcbb1d 100644
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
@@ -532,6 +535,144 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
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
+        prio = ((lpite & LPI_PRIORITY_MASK) >> 1) | 0x80;
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
+    int i, bit;
+    uint64_t idbits;
+
+    idbits = MIN(FIELD_EX64(cs->gicr_propbaser, GICR_PROPBASER, IDBITS),
+                 GICD_TYPER_IDBITS);
+
+    if (!(cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) || !cs->gicr_propbaser ||
+        !cs->gicr_pendbaser) {
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
+    for (i = GICV3_LPI_INTID_START / 8; i < pendt_size / 8; i++) {
+        address_space_read(as, lpipt_baddr + i, MEMTXATTRS_UNSPECIFIED, &pend,
+                           sizeof(pend));
+
+        while (pend) {
+            bit = ctz32(pend);
+            gicv3_redist_check_lpi_priority(cs, i * 8 + bit);
+            pend &= ~(1 << bit);
+        }
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
+    ispend = extract32(pend, irq % 8, 1);
+
+    /* no change in the value of pending bit, return */
+    if (ispend == level) {
+        return;
+    }
+    pend = deposit32(pend, irq % 8, 1, level ? 1 : 0);
+
+    address_space_write(as, lpipt_baddr + ((irq / 8) * sizeof(pend)),
+                        MEMTXATTRS_UNSPECIFIED, &pend, sizeof(pend));
+
+    /*
+     * check if this LPI is better than the current hpplpi, if yes
+     * just set hpplpi.prio and .irq without doing a full rescan
+     */
+    if (level) {
+        gicv3_redist_check_lpi_priority(cs, irq);
+    } else {
+        if (irq == cs->hpplpi.irq) {
+            gicv3_redist_update_lpi(cs);
+        }
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
+         !cs->gicr_pendbaser || (irq > (1ULL << (idbits + 1)) - 1) ||
+         irq < GICV3_LPI_INTID_START) {
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
-- 
2.20.1


