Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DAC3EA8E7
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 19:00:15 +0200 (CEST)
Received: from localhost ([::1]:35446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEE3y-0008OA-49
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 13:00:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mEDxu-0007o5-Id
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 12:53:59 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:46987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mEDxn-00063q-Qz
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 12:53:58 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id e1so3483845qvs.13
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 09:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=su4xCDDUwBVj36ipZPqrC0MRO0vtpZIDqd8JcYIVdOU=;
 b=joQP/cP7XbyC6vFgV1gqLcr6aSMmdgwKJmpSyLE0q+N2/OHJs8s/Pgf+n3F3cDuJqF
 b25sVMuQEXJ1jTjb2U5ft3AHiiiU5+pfCzk7PYRbXV2EmREwx0actqVWbuXAmq9/C0FK
 33a8aHJMjK37dgzvoiBEF1MVOpP8XwXB4WpHdHPGRnmkJGwMUOFeLxE7jpJSkoSh6wxC
 56c9ybJLpN9GaNT/OrSg9NkDRxa0C5YIBndrsu3IhPO6dJ9IKg+CTxWzrsFr7Tc8xAAY
 nLY0anFM5GV0rtlrVHSxStJCj1reHKSHW5aSy5j677X7e11QXjSv3a05GWsXyF1FKb9e
 eAKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=su4xCDDUwBVj36ipZPqrC0MRO0vtpZIDqd8JcYIVdOU=;
 b=oT6bxMKsvNAdDUhxNJFH20QsLoYg5hH2AKMQgq9vWmvYL57JDV7WYSu6arXbOMcsxv
 HrUAUzdd91Q+UFMhm+rJXg/ftV9ytNnWJnSKCggrghlyyxwbwMbccEnZhlayRUY/eNWl
 ApSshmnPByNDXMRJrq8UIlTZXP+O1FC/+hF8a9PH9k0KnTkWDTO53yAfyWIYwtVa85Dw
 txDN/2Xhf4retK6SIAJTPn7uoHxXUzk28T05VJtUyykVU+iLa45w8LERyBUtExq4XlAZ
 79azv1P/oghaAhQj+b/qaj6JbwGxn/Al2epT4GDOITB2MHSs0MAG0SLu2RovJf7vVTep
 D7yQ==
X-Gm-Message-State: AOAM533xIkjpXRVre0/vGQ/QS2OMzGz3LY7dwRFBEkZvT2GA3g72obVU
 7RhaIjnUfD3WOrW022SympREiA==
X-Google-Smtp-Source: ABdhPJxhohGlDg0N5I24HhIi8pQ/slGhujkmwOyDy2mi40roEfIjwZbtOJFtBCXhb8ik20RkTk68TA==
X-Received: by 2002:a05:6214:80a:: with SMTP id
 df10mr4851515qvb.58.1628787230493; 
 Thu, 12 Aug 2021 09:53:50 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.googlemail.com with ESMTPSA id c69sm1714864qkg.1.2021.08.12.09.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 09:53:50 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v8 06/10] hw/intc: GICv3 redistributor ITS processing
Date: Thu, 12 Aug 2021 12:53:37 -0400
Message-Id: <20210812165341.40784-7-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210812165341.40784-1-shashi.mallela@linaro.org>
References: <20210812165341.40784-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qv1-xf2b.google.com
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
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 narmstrong@baylibre.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implemented lpi processing at redistributor to get lpi config info
from lpi configuration table,determine priority,set pending state in
lpi pending table and forward the lpi to cpuif.Added logic to invoke
redistributor lpi processing with translated LPI which set/clear LPI
from ITS device as part of ITS INT,CLEAR,DISCARD command and
GITS_TRANSLATER processing.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
Tested-by: Neil Armstrong <narmstrong@baylibre.com>
---
 hw/intc/arm_gicv3.c                |  14 +++
 hw/intc/arm_gicv3_common.c         |   1 +
 hw/intc/arm_gicv3_cpuif.c          |   7 +-
 hw/intc/arm_gicv3_its.c            |  23 +++++
 hw/intc/arm_gicv3_redist.c         | 141 +++++++++++++++++++++++++++++
 hw/intc/gicv3_internal.h           |   9 ++
 include/hw/intc/arm_gicv3_common.h |   7 ++
 7 files changed, 200 insertions(+), 2 deletions(-)

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
index a032d505f5..462a35f66e 100644
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
index d98b0e0f4c..d09ad6f556 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -228,6 +228,7 @@ static MemTxResult process_its_cmd(GICv3ITSState *s, uint64_t value,
     bool ite_valid = false;
     uint64_t cte = 0;
     bool cte_valid = false;
+    uint64_t rdbase;
 
     if (cmd == NONE) {
         devid = offset;
@@ -288,6 +289,18 @@ static MemTxResult process_its_cmd(GICv3ITSState *s, uint64_t value,
          * Current implementation only supports rdbase == procnum
          * Hence rdbase physical address is ignored
          */
+        rdbase = (cte & GITS_CTE_RDBASE_PROCNUM_MASK) >> 1U;
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
             IteEntry ite = {};
             /* remove mapping from interrupt translation table */
@@ -605,6 +618,7 @@ static void process_cmdq(GICv3ITSState *s)
     AddressSpace *as = &s->gicv3->dma_as;
     MemTxResult res = MEMTX_OK;
     uint8_t cmd;
+    int i;
 
     if (!(s->ctlr & ITS_CTLR_ENABLED)) {
         return;
@@ -666,6 +680,15 @@ static void process_cmdq(GICv3ITSState *s)
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
index 2108abfe9c..7072bfcbb1 100644
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
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 530d1c1789..a0369dace7 100644
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


