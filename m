Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 004E94F987C
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 16:45:35 +0200 (CEST)
Received: from localhost ([::1]:37804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncprj-0006GA-2q
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 10:45:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPW-0007AO-R3
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:26 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:39781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPS-0002Nn-2J
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:25 -0400
Received: by mail-wr1-x435.google.com with SMTP id q19so13052545wrc.6
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 07:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/SF58xglVqb/RRANG/yGXyzTNT64YvBR8SylTgH6uh4=;
 b=fVjw8TJcGg+WmZF3ZC4Bzojik6NEsZjFvJhi1EbseEdeRbjMk3sOzaULlgea83CBBe
 Q0mK2E8NvX+K9QHud9v+5JM/7fMG4KekQotHup6mC6zv2AkXd86lVabBYQCsmjYYZ6gy
 2Sm6rlJBKq+hf2pNgQIWT/GKeTN7eWKO4MEjbiq8Nh5lg0vxjZXpraHFN8/2XPkoDNOL
 EJTkUGImNHjpeAjfEWZDIRnNICRwJ5j6N2ID6at2vT3hDYPLwq+6opIqXeBMbUZoxu7K
 Afh4Osanvvzv8YCzU5zN7gerII327jUl5VksNysDNLH7344ty0+tBtK8nuy+AUkV1IMU
 hu+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/SF58xglVqb/RRANG/yGXyzTNT64YvBR8SylTgH6uh4=;
 b=AF759cfQ+ujRroxdlcmDXVBWlP1rtzU56IPuU1FMucApKnVUl3VGqdA2+kTpNdK2RS
 /l4lwum4gytNkjbg3Kr1/YxRG/K/14LkDeUKl60V0Aqlo5BavTX5rqoHs4ShdaakGYDR
 I8oW79jW60JsWiVmuS7QMEjeIK5J7cEv3YIg1s0H69jhDsNmKtA2RlUq1RkpZRNyxil4
 RmfsBT/BF6GDwCz328DFa1f0znQrmI0JAHsfNzyEt0KOzKmjw/1X+wzxLYF7ahKLrDrI
 sJx6l5fDuLQcALV4WRvvTwesTnLzhkoM8yx7SEPwuEIup4YX7rH9O27YlB/FDeZdTlC5
 vUtQ==
X-Gm-Message-State: AOAM533lkeN3fa5oUdOYP+7UGbBPxMnbE2lvtZkAphjFr1h4bC8ev64E
 B5H9Ib01EabGtYw4tT3T/XDgAg==
X-Google-Smtp-Source: ABdhPJzz2cswZ8kq7/9uxqQKkXU2h8PTyWLeTPb9lgZARYn9f4GmJ4o7McBc3CtrqR6ih3a619zD3A==
X-Received: by 2002:adf:82ee:0:b0:207:9bec:ee5d with SMTP id
 101-20020adf82ee000000b002079becee5dmr76300wrc.634.1649427379423; 
 Fri, 08 Apr 2022 07:16:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:16:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 28/41] hw/intc/arm_gicv3_redist: Factor out "update hpplpi for
 all LPIs" logic
Date: Fri,  8 Apr 2022 15:15:37 +0100
Message-Id: <20220408141550.1271295-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Factor out the common part of gicv3_redist_update_lpi_only() into
a new function update_for_all_lpis(), which does a full rescan
of an LPI Pending table and sets the specified PendingIrq struct
with the highest priority pending enabled LPI it finds.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_redist.c | 66 ++++++++++++++++++++++++++------------
 1 file changed, 46 insertions(+), 20 deletions(-)

diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 571e0fa8309..2379389d14e 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -103,6 +103,48 @@ static void update_for_one_lpi(GICv3CPUState *cs, int irq,
     }
 }
 
+/**
+ * update_for_all_lpis: Fully scan LPI tables and find best pending LPI
+ *
+ * @cs: GICv3CPUState
+ * @ptbase: physical address of LPI Pending table
+ * @ctbase: physical address of LPI Configuration table
+ * @ptsizebits: size of tables, specified as number of interrupt ID bits minus 1
+ * @ds: true if priority value should not be shifted
+ * @hpp: points to pending information to set
+ *
+ * Recalculate the highest priority pending enabled LPI from scratch,
+ * and set @hpp accordingly.
+ *
+ * We scan the LPI pending table @ptbase; for each pending LPI, we read the
+ * corresponding entry in the LPI configuration table @ctbase to extract
+ * the priority and enabled information.
+ *
+ * We take @ptsizebits in the form idbits-1 because this is the way that
+ * LPI table sizes are architecturally specified in GICR_PROPBASER.IDBits
+ * and in the VMAPP command's VPT_size field.
+ */
+static void update_for_all_lpis(GICv3CPUState *cs, uint64_t ptbase,
+                                uint64_t ctbase, unsigned ptsizebits,
+                                bool ds, PendingIrq *hpp)
+{
+    AddressSpace *as = &cs->gic->dma_as;
+    uint8_t pend;
+    uint32_t pendt_size = (1ULL << (ptsizebits + 1));
+    int i, bit;
+
+    hpp->prio = 0xff;
+
+    for (i = GICV3_LPI_INTID_START / 8; i < pendt_size / 8; i++) {
+        address_space_read(as, ptbase + i, MEMTXATTRS_UNSPECIFIED, &pend, 1);
+        while (pend) {
+            bit = ctz32(pend);
+            update_for_one_lpi(cs, i * 8 + bit, ctbase, ds, hpp);
+            pend &= ~(1 << bit);
+        }
+    }
+}
+
 static uint8_t gicr_read_ipriorityr(GICv3CPUState *cs, MemTxAttrs attrs,
                                     int irq)
 {
@@ -657,11 +699,7 @@ void gicv3_redist_update_lpi_only(GICv3CPUState *cs)
      * priority is lower than the last computed high priority lpi interrupt.
      * If yes, replace current LPI as the new high priority lpi interrupt.
      */
-    AddressSpace *as = &cs->gic->dma_as;
-    uint64_t lpipt_baddr;
-    uint32_t pendt_size = 0;
-    uint8_t pend;
-    int i, bit;
+    uint64_t lpipt_baddr, lpict_baddr;
     uint64_t idbits;
 
     idbits = MIN(FIELD_EX64(cs->gicr_propbaser, GICR_PROPBASER, IDBITS),
@@ -671,23 +709,11 @@ void gicv3_redist_update_lpi_only(GICv3CPUState *cs)
         return;
     }
 
-    cs->hpplpi.prio = 0xff;
-
     lpipt_baddr = cs->gicr_pendbaser & R_GICR_PENDBASER_PHYADDR_MASK;
+    lpict_baddr = cs->gicr_propbaser & R_GICR_PROPBASER_PHYADDR_MASK;
 
-    /* Determine the highest priority pending interrupt among LPIs */
-    pendt_size = (1ULL << (idbits + 1));
-
-    for (i = GICV3_LPI_INTID_START / 8; i < pendt_size / 8; i++) {
-        address_space_read(as, lpipt_baddr + i, MEMTXATTRS_UNSPECIFIED, &pend,
-                           sizeof(pend));
-
-        while (pend) {
-            bit = ctz32(pend);
-            gicv3_redist_check_lpi_priority(cs, i * 8 + bit);
-            pend &= ~(1 << bit);
-        }
-    }
+    update_for_all_lpis(cs, lpipt_baddr, lpict_baddr, idbits,
+                        cs->gic->gicd_ctlr & GICD_CTLR_DS, &cs->hpplpi);
 }
 
 void gicv3_redist_update_lpi(GICv3CPUState *cs)
-- 
2.25.1


