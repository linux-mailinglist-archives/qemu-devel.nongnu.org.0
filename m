Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C81B450B55C
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 12:39:48 +0200 (CEST)
Received: from localhost ([::1]:50598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhqhX-0007eq-Sk
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 06:39:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9x-0004m1-HS
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:05 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:38725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9u-0002es-TY
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:05 -0400
Received: by mail-wr1-x430.google.com with SMTP id q7so2680742wrm.5
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PdLMMw5e/CkRPkREdXaW3qct/qWLck3R567GcZMXhrc=;
 b=GUTL6/UzGInFbTI/NIpLFOtDjolpt0Oao0s6MxWGJVoj3zwtYXwc3HbmET22bvOnZY
 fLktZHlKZdmGPSR1C36UE+oT5/r9tatJfCBV8gOGvzLC6VqpXBkV7CJ6MPLIajeHr/Ct
 3VdSsoB8kHISo9F0TN+ZkvN3um7LkcJ4AxXGnb/6bUF9rx/nL/RUiDKlYoB8+5p2wq27
 zHaC5gIny3NPFSJEqOGmYjSTYDq2b+c0pOSQ9XNT/t7MwB9eh+qBMYjqK+93zoMMXjpd
 v411up325xjbON8iFlGdGLwBMY5MqbZugEJUHe2lIaDwpCFuwZX32ZRlRMEKVuPFUQ0m
 qzNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PdLMMw5e/CkRPkREdXaW3qct/qWLck3R567GcZMXhrc=;
 b=4QdqM1sNSs7An2QP+tBhfhEZ+fQ/N9t6MxGZBzaRbV+FV2C6vRNDqxps3d7ffRL0Fh
 Q1c9lE+VcLbHAJSpaj7TYy1nh836Se8U8ihD2R531PnzByWVcUKO266abqPJTWb9xf5y
 53NNBwCHhshJ4CM6n7zIAEAG1lOpuYY5bIxh2THhnn92vZOD4XJx28HAb7SZFbJ2Flpw
 D0+brgbRGL8q4a8/RbmkiPt2dgFu0WySAT0DjWuBRcnhMEDq5gLJOB88ykMpltTVvhoF
 FOFTz7s6w8X9mLvHdM8Dh0JG18efLQdUYDd6t7w55TEBqCIq2SzrgZjCIFNeCrUFUAiv
 sVoA==
X-Gm-Message-State: AOAM530o/oQqBmM/MEuBO+CSKlGpe4ucCGomphzAVFjTRJvPn6hFGRVP
 lt9PWIB85I87PERH4k3Ilsbuqmk7L4DMSA==
X-Google-Smtp-Source: ABdhPJz8xMz9soF9Q5BUfFpv3EsQvdsBA/C585rKd7qJUYoMTGhaUnOZNJFEvmoS6vVOirjy79fbCg==
X-Received: by 2002:a05:6000:1789:b0:20a:9fbc:b1b5 with SMTP id
 e9-20020a056000178900b0020a9fbcb1b5mr3028148wrg.581.1650621901406; 
 Fri, 22 Apr 2022 03:05:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.05.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:05:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/61] hw/intc/arm_gicv3_redist: Recalculate hppvlpi on
 VPENDBASER writes
Date: Fri, 22 Apr 2022 11:04:00 +0100
Message-Id: <20220422100432.2288247-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The guest uses GICR_VPENDBASER to tell the redistributor when it is
scheduling or descheduling a vCPU.  When it writes and changes the
VALID bit from 0 to 1, it is scheduling a vCPU, and we must update
our view of the current highest priority pending vLPI from the new
Pending and Configuration tables.  When it writes and changes the
VALID bit from 1 to 0, it is descheduling, which means that there is
no longer a highest priority pending vLPI.

The specification allows the implementation to use part of the vLPI
Pending table as an IMPDEF area where it can cache information when a
vCPU is descheduled, so that it can avoid having to do a full rescan
of the tables when the vCPU is scheduled again.  For now, we don't
take advantage of this, and simply do a complete rescan.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220408141550.1271295-30-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_redist.c | 87 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 84 insertions(+), 3 deletions(-)

diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 2379389d14e..bfdde36a206 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -185,6 +185,87 @@ static void gicr_write_ipriorityr(GICv3CPUState *cs, MemTxAttrs attrs, int irq,
     cs->gicr_ipriorityr[irq] = value;
 }
 
+static void gicv3_redist_update_vlpi_only(GICv3CPUState *cs)
+{
+    uint64_t ptbase, ctbase, idbits;
+
+    if (!FIELD_EX64(cs->gicr_vpendbaser, GICR_VPENDBASER, VALID)) {
+        cs->hppvlpi.prio = 0xff;
+        return;
+    }
+
+    ptbase = cs->gicr_vpendbaser & R_GICR_VPENDBASER_PHYADDR_MASK;
+    ctbase = cs->gicr_vpropbaser & R_GICR_VPROPBASER_PHYADDR_MASK;
+    idbits = FIELD_EX64(cs->gicr_vpropbaser, GICR_VPROPBASER, IDBITS);
+
+    update_for_all_lpis(cs, ptbase, ctbase, idbits, true, &cs->hppvlpi);
+}
+
+static void gicv3_redist_update_vlpi(GICv3CPUState *cs)
+{
+    gicv3_redist_update_vlpi_only(cs);
+    gicv3_cpuif_virt_irq_fiq_update(cs);
+}
+
+static void gicr_write_vpendbaser(GICv3CPUState *cs, uint64_t newval)
+{
+    /* Write @newval to GICR_VPENDBASER, handling its effects */
+    bool oldvalid = FIELD_EX64(cs->gicr_vpendbaser, GICR_VPENDBASER, VALID);
+    bool newvalid = FIELD_EX64(newval, GICR_VPENDBASER, VALID);
+    bool pendinglast;
+
+    /*
+     * The DIRTY bit is read-only and for us is always zero;
+     * other fields are writeable.
+     */
+    newval &= R_GICR_VPENDBASER_INNERCACHE_MASK |
+        R_GICR_VPENDBASER_SHAREABILITY_MASK |
+        R_GICR_VPENDBASER_PHYADDR_MASK |
+        R_GICR_VPENDBASER_OUTERCACHE_MASK |
+        R_GICR_VPENDBASER_PENDINGLAST_MASK |
+        R_GICR_VPENDBASER_IDAI_MASK |
+        R_GICR_VPENDBASER_VALID_MASK;
+
+    if (oldvalid && newvalid) {
+        /*
+         * Changing other fields while VALID is 1 is UNPREDICTABLE;
+         * we choose to log and ignore the write.
+         */
+        if (cs->gicr_vpendbaser ^ newval) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Changing GICR_VPENDBASER when VALID=1 "
+                          "is UNPREDICTABLE\n", __func__);
+        }
+        return;
+    }
+    if (!oldvalid && !newvalid) {
+        cs->gicr_vpendbaser = newval;
+        return;
+    }
+
+    if (newvalid) {
+        /*
+         * Valid going from 0 to 1: update hppvlpi from tables.
+         * If IDAI is 0 we are allowed to use the info we cached in
+         * the IMPDEF area of the table.
+         * PendingLast is RES1 when we make this transition.
+         */
+        pendinglast = true;
+    } else {
+        /*
+         * Valid going from 1 to 0:
+         * Set PendingLast if there was a pending enabled interrupt
+         * for the vPE that was just descheduled.
+         * If we cache info in the IMPDEF area, write it out here.
+         */
+        pendinglast = cs->hppvlpi.prio != 0xff;
+    }
+
+    newval = FIELD_DP64(newval, GICR_VPENDBASER, PENDINGLAST, pendinglast);
+    cs->gicr_vpendbaser = newval;
+    gicv3_redist_update_vlpi(cs);
+}
+
 static MemTxResult gicr_readb(GICv3CPUState *cs, hwaddr offset,
                               uint64_t *data, MemTxAttrs attrs)
 {
@@ -493,10 +574,10 @@ static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
         cs->gicr_vpropbaser = deposit64(cs->gicr_vpropbaser, 32, 32, value);
         return MEMTX_OK;
     case GICR_VPENDBASER:
-        cs->gicr_vpendbaser = deposit64(cs->gicr_vpendbaser, 0, 32, value);
+        gicr_write_vpendbaser(cs, deposit64(cs->gicr_vpendbaser, 0, 32, value));
         return MEMTX_OK;
     case GICR_VPENDBASER + 4:
-        cs->gicr_vpendbaser = deposit64(cs->gicr_vpendbaser, 32, 32, value);
+        gicr_write_vpendbaser(cs, deposit64(cs->gicr_vpendbaser, 32, 32, value));
         return MEMTX_OK;
     default:
         return MEMTX_ERROR;
@@ -557,7 +638,7 @@ static MemTxResult gicr_writell(GICv3CPUState *cs, hwaddr offset,
         cs->gicr_vpropbaser = value;
         return MEMTX_OK;
     case GICR_VPENDBASER:
-        cs->gicr_vpendbaser = value;
+        gicr_write_vpendbaser(cs, value);
         return MEMTX_OK;
     default:
         return MEMTX_ERROR;
-- 
2.25.1


