Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D1E50B5AF
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 12:55:07 +0200 (CEST)
Received: from localhost ([::1]:48268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhqwM-0004UF-LB
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 06:55:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9u-0004hX-Te
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:03 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:34692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9s-0002eF-Ui
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:02 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 ay36-20020a05600c1e2400b0038ebc885115so4691868wmb.1
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3ilgvfjObbIjUWYmzt8kRu+jcO5Jk2GypxqucG8W5ao=;
 b=oI2VE+9SoLKn5lT76R7giAMeW53NuDdAaIa62ciMUa3Be901JalZYC6ukOyAjw0kk6
 OnnEQdtDylfXhKdEyd4a4ByYwqdwXgujmQrk/Vj7eOVoFifxSZQB/aC1TfFmp6uNdEbC
 wj/11hOzAkYzEc85q4o8Qlnz3ItfND6RYMcIIJRP1IgQEUlv6QaVhdb4k9/ekSUmB2HI
 6aL9hKxg1oKptZawFRHlESLy0RjNLw2t54n0iAvpGkslxI6IzeK+KXrtd9K3sfIRLn/Y
 SdgeMR3Js5XS0z9Lf9oN/uqz9M14qdW7BkjhKlkxCZlce59LC+s6rRAnSVt2a9O8VeIu
 2rMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3ilgvfjObbIjUWYmzt8kRu+jcO5Jk2GypxqucG8W5ao=;
 b=Yup2ry/X0AQK9AlsinqhShBw291uN5MC0u5WsrFIBbWA3QA3yuXOEqwOk3+c/BejaM
 a9mr6pEQXZNhhuMCJ8SY7xFGhJE/D7hsDpbIwYTBi5FXfOlTZqluH54A32aA39+e7w0I
 gjhssfZG8R2D3bCfO5Q2XIAk7OkllHyp7MdpAOOnxGmyzouLFPLxJsTNB9KvFU+kL7/n
 VW2NQz789S/KQmCiH0f/wFmvfet7uQi3mwP5NN/n3u7lWr6U/fQOWAYpekama8KtPbVb
 OnlHCx5XFREPAbqxSxjFoBapkDcctWqcL7yhuUwCPrhzl18kBFrTdk1dq3YHGEWF78Qq
 zHOA==
X-Gm-Message-State: AOAM532q712IOoAzk4XNpl+OXsmQlAJ44eSmeexDKeqkqbGrNIvflwMg
 1kRu+fWEMWKQOtkowFsCGok0ZqLkgcLsnw==
X-Google-Smtp-Source: ABdhPJy/KaNed8cU7269DrLo3F2i9eykTQKMjiIadK4+G0Zvsebxv8WfgFrkYMOBPnZ33dLOOKva3A==
X-Received: by 2002:a05:600c:4f53:b0:392:e99:3002 with SMTP id
 m19-20020a05600c4f5300b003920e993002mr3432196wmq.35.1650621899294; 
 Fri, 22 Apr 2022 03:04:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.04.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:04:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/61] hw/intc/arm_gicv3_redist: Factor out "update hpplpi for
 one LPI" logic
Date: Fri, 22 Apr 2022 11:03:58 +0100
Message-Id: <20220422100432.2288247-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

Currently the functions which update the highest priority pending LPI
information by looking at the LPI Pending and Configuration tables
are hard-coded to use the physical LPI tables addressed by
GICR_PENDBASER and GICR_PROPBASER.  To support virtual LPIs we will
need to do essentially the same job, but looking at the current
virtual LPI Pending and Configuration tables and updating cs->hppvlpi
instead of cs->hpplpi.

Factor out the common part of the gicv3_redist_check_lpi_priority()
function into a new update_for_one_lpi() function, which updates
a PendingIrq struct if the specified LPI is higher priority than
what is currently recorded there.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220408141550.1271295-28-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_redist.c | 74 ++++++++++++++++++++++++--------------
 1 file changed, 47 insertions(+), 27 deletions(-)

diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 3464972c139..571e0fa8309 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -60,6 +60,49 @@ static uint32_t gicr_read_bitmap_reg(GICv3CPUState *cs, MemTxAttrs attrs,
     return reg;
 }
 
+/**
+ * update_for_one_lpi: Update pending information if this LPI is better
+ *
+ * @cs: GICv3CPUState
+ * @irq: interrupt to look up in the LPI Configuration table
+ * @ctbase: physical address of the LPI Configuration table to use
+ * @ds: true if priority value should not be shifted
+ * @hpp: points to pending information to update
+ *
+ * Look up @irq in the Configuration table specified by @ctbase
+ * to see if it is enabled and what its priority is. If it is an
+ * enabled interrupt with a higher priority than that currently
+ * recorded in @hpp, update @hpp.
+ */
+static void update_for_one_lpi(GICv3CPUState *cs, int irq,
+                               uint64_t ctbase, bool ds, PendingIrq *hpp)
+{
+    uint8_t lpite;
+    uint8_t prio;
+
+    address_space_read(&cs->gic->dma_as,
+                       ctbase + ((irq - GICV3_LPI_INTID_START) * sizeof(lpite)),
+                       MEMTXATTRS_UNSPECIFIED, &lpite, sizeof(lpite));
+
+    if (!(lpite & LPI_CTE_ENABLED)) {
+        return;
+    }
+
+    if (ds) {
+        prio = lpite & LPI_PRIORITY_MASK;
+    } else {
+        prio = ((lpite & LPI_PRIORITY_MASK) >> 1) | 0x80;
+    }
+
+    if ((prio < hpp->prio) ||
+        ((prio == hpp->prio) && (irq <= hpp->irq))) {
+        hpp->irq = irq;
+        hpp->prio = prio;
+        /* LPIs and vLPIs are always non-secure Grp1 interrupts */
+        hpp->grp = GICV3_G1NS;
+    }
+}
+
 static uint8_t gicr_read_ipriorityr(GICv3CPUState *cs, MemTxAttrs attrs,
                                     int irq)
 {
@@ -598,34 +641,11 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
 
 static void gicv3_redist_check_lpi_priority(GICv3CPUState *cs, int irq)
 {
-    AddressSpace *as = &cs->gic->dma_as;
-    uint64_t lpict_baddr;
-    uint8_t lpite;
-    uint8_t prio;
+    uint64_t lpict_baddr = cs->gicr_propbaser & R_GICR_PROPBASER_PHYADDR_MASK;
 
-    lpict_baddr = cs->gicr_propbaser & R_GICR_PROPBASER_PHYADDR_MASK;
-
-    address_space_read(as, lpict_baddr + ((irq - GICV3_LPI_INTID_START) *
-                       sizeof(lpite)), MEMTXATTRS_UNSPECIFIED, &lpite,
-                       sizeof(lpite));
-
-    if (!(lpite & LPI_CTE_ENABLED)) {
-        return;
-    }
-
-    if (cs->gic->gicd_ctlr & GICD_CTLR_DS) {
-        prio = lpite & LPI_PRIORITY_MASK;
-    } else {
-        prio = ((lpite & LPI_PRIORITY_MASK) >> 1) | 0x80;
-    }
-
-    if ((prio < cs->hpplpi.prio) ||
-        ((prio == cs->hpplpi.prio) && (irq <= cs->hpplpi.irq))) {
-        cs->hpplpi.irq = irq;
-        cs->hpplpi.prio = prio;
-        /* LPIs are always non-secure Grp1 interrupts */
-        cs->hpplpi.grp = GICV3_G1NS;
-    }
+    update_for_one_lpi(cs, irq, lpict_baddr,
+                       cs->gic->gicd_ctlr & GICD_CTLR_DS,
+                       &cs->hpplpi);
 }
 
 void gicv3_redist_update_lpi_only(GICv3CPUState *cs)
-- 
2.25.1


