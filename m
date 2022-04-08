Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DC74F982B
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 16:37:41 +0200 (CEST)
Received: from localhost ([::1]:39912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncpk4-0005iw-Cw
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 10:37:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPU-00078E-Su
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:26 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:40867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPR-0002NS-Nq
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:23 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 v64-20020a1cac43000000b0038cfd1b3a6dso7660863wme.5
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 07:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L6tbfFm8N5ZoKDybbZ+JmSH4TaIf15FtacXwnPlIlf8=;
 b=r2ovS9d9NPUC7mc2yrUMQ4wALjId0p5vJMh2BoTIY1iXNIMEmA6AOBwqct/BS70YiZ
 653a85ofd2k3cI3ipa3hZ3USPaoYRBZvRCG//5+mLaHeXmK7EgfonNVfZf3dG5h46w73
 0eO/eMVxFoqXPBfOBRD21fxp9pH9rBZ7CQfN07aUFItMp25sALvk27kEPsZoVcSL3HX8
 PwxjjhSKxZb+vzhK3sOL9H5yPk2vgyEKQUWcwbuCeg4rIJ9HxyGaxZGgOt4z4N1F3wma
 Zg/ZMWCppOfuZwbqSEOhpuPKoxeU62i4p79ylGZqwRmzaM7kspbh3hRvWRy09eBtI+ek
 AJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L6tbfFm8N5ZoKDybbZ+JmSH4TaIf15FtacXwnPlIlf8=;
 b=fanXaRS9pgCQ0u2fgd05f0gZ4WgknyRK2Rcv3+CM4D5hqdKvCw0LKg3U6v+f8HzS2k
 gQYrhaKHXr6KgYiRBNZ5J9EcSh4ghhi+GJieHsCGpUW4e0pBCwyJr1Rv9Wf1zAtT46tM
 Z8KNoobtHJb4hMJsUnKWtfGTlxjCGMIKNhFSNfJT6meJCcxRCMHtsPZA1K6Gl3vF1yug
 hfBEyCAKKy48qw/aXDAsv7k5xu5jxCllCYOEUWjiw651BiH+kIsVrytBBI5irWAynqZs
 zRE2AJTBuXc8/VIf33/fjXkoxn8l7JsetL74sUU9CSqnCFTZDitAWmqwEPxo6PGzHHL8
 3snw==
X-Gm-Message-State: AOAM532yJMNaWl8RUwAs5kI7bf1cmGXTYMsppgLxgtQkp413nWKaOZSp
 Sdrw1FmB+w8n/VVPgdSo138SIA==
X-Google-Smtp-Source: ABdhPJwpRj0sAIR+2ureLyECkrpSITwmdkTl4j90YQ14NPHLv8SfhPOAQ8AKg1ClD15CmUGfYrqzmQ==
X-Received: by 2002:a05:600c:5106:b0:38e:38f8:858 with SMTP id
 o6-20020a05600c510600b0038e38f80858mr16953652wms.109.1649427378601; 
 Fri, 08 Apr 2022 07:16:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.16.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:16:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 27/41] hw/intc/arm_gicv3_redist: Factor out "update hpplpi for
 one LPI" logic
Date: Fri,  8 Apr 2022 15:15:36 +0100
Message-Id: <20220408141550.1271295-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: Marc Zyngier <maz@kernel.org>
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


