Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E10850B604
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 13:17:18 +0200 (CEST)
Received: from localhost ([::1]:34700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhrHp-0005gV-CI
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 07:17:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9z-0004pm-0R
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:07 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:36575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9w-0002j9-DC
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:06 -0400
Received: by mail-wr1-x42b.google.com with SMTP id u3so10335960wrg.3
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jiS+itmO7Fo/3fiG/QD88OIh41bUATPpy7hpLVT0VSI=;
 b=uEw3R04ibjWVV7VnQE0HSKR5EsUQzrLFyvDJno1VljzVAUGV4jJaJm3apZiNWjg5fX
 ffXZr8CMfWxdWXJXPd56kNMDHJAER8fsoMjTScIR9BulaMj4toV5xcaupL70RstFLj+w
 A5nr5SwRsSIk94kBTrdy8iDqcjaFlNAe28AagCfNE/6tqI4OZaYXe415FVctniA65OuV
 9uRhLffVHPTSMoh7QL+AV+GVz1IPYt+CZMRndnnE1E9OaIT57/rrR6r3s22k8lFKLt7o
 RmRsTItxvP2Tn1RPPmnEOA9vKF1L04CNhet0SfowJuSdin/jaFuM4oNIxjN+OLgd2ZRi
 j2mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jiS+itmO7Fo/3fiG/QD88OIh41bUATPpy7hpLVT0VSI=;
 b=IrNL+j5P1kxRJWTOECoqonw0nbD24t9UddySRMtOoGpvLKEck7sfjWIkrcTFIzascZ
 UpXy6LRmjFXYOkf7G5w+VKSJYLYixHOUSGIFX/oEZ+uIRPNk4myK0NVp7EnssQJde27S
 WL4tZR19hGKyeyFbZu31xYkD8vhjnLcym/Cr8PMgFKJinFcUTHf8MAtvTtVBlF6N+RES
 Q1Q3cvgLobZfcChJJT9pvo+VhP0e6tra3KhmZfIW8WDSe02k8tCsMMspdnRpw8EWyF2w
 YR6wDqBuz1+GxY4xAsXeWABm1IE8bgYmq6kQYvBkI7QhxYT+ZJTkS1BJn/ncosAbPoV6
 lcoQ==
X-Gm-Message-State: AOAM530apgHc2pzKxCzc3vkyp9RPk1EX1bb5TnnWCxbFnzEtrpuicNRG
 7fOax2Hw0DHoHAyOezAbeUpxNV/chyAduA==
X-Google-Smtp-Source: ABdhPJxr353VHSlPa/6ObdeFo1ESLupmsi37MgYPR+hiOtU11tKo9PWDv2MQSwCszUdk3JttarJryQ==
X-Received: by 2002:a05:6000:8b:b0:207:b80e:c711 with SMTP id
 m11-20020a056000008b00b00207b80ec711mr3122993wrx.178.1650621903017; 
 Fri, 22 Apr 2022 03:05:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.05.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:05:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/61] hw/intc/arm_gicv3_redist: Implement
 gicv3_redist_process_vlpi()
Date: Fri, 22 Apr 2022 11:04:02 +0100
Message-Id: <20220422100432.2288247-32-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

Implement the function gicv3_redist_process_vlpi(), which was left as
just a stub earlier.  This function deals with being handed a VLPI by
the ITS.  It must set the bit in the pending table.  If the vCPU is
currently resident we must recalculate the highest priority pending
vLPI; otherwise we may need to ring a "doorbell" interrupt to let the
hypervisor know it might want to reschedule the vCPU.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220408141550.1271295-32-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_redist.c | 48 ++++++++++++++++++++++++++++++++++----
 1 file changed, 44 insertions(+), 4 deletions(-)

diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index d54ed9a0332..1ed251b87be 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -60,6 +60,19 @@ static uint32_t gicr_read_bitmap_reg(GICv3CPUState *cs, MemTxAttrs attrs,
     return reg;
 }
 
+static bool vcpu_resident(GICv3CPUState *cs, uint64_t vptaddr)
+{
+    /*
+     * Return true if a vCPU is resident, which is defined by
+     * whether the GICR_VPENDBASER register is marked VALID and
+     * has the right virtual pending table address.
+     */
+    if (!FIELD_EX64(cs->gicr_vpendbaser, GICR_VPENDBASER, VALID)) {
+        return false;
+    }
+    return vptaddr == (cs->gicr_vpendbaser & R_GICR_VPENDBASER_PHYADDR_MASK);
+}
+
 /**
  * update_for_one_lpi: Update pending information if this LPI is better
  *
@@ -1004,10 +1017,37 @@ void gicv3_redist_vlpi_pending(GICv3CPUState *cs, int irq, int level)
 void gicv3_redist_process_vlpi(GICv3CPUState *cs, int irq, uint64_t vptaddr,
                                int doorbell, int level)
 {
-    /*
-     * The redistributor handling for being handed a VLPI by the ITS
-     * will be added in a subsequent commit.
-     */
+    bool bit_changed;
+    bool resident = vcpu_resident(cs, vptaddr);
+    uint64_t ctbase;
+
+    if (resident) {
+        uint32_t idbits = FIELD_EX64(cs->gicr_vpropbaser, GICR_VPROPBASER, IDBITS);
+        if (irq >= (1ULL << (idbits + 1))) {
+            return;
+        }
+    }
+
+    bit_changed = set_pending_table_bit(cs, vptaddr, irq, level);
+    if (resident && bit_changed) {
+        if (level) {
+            /* Check whether this vLPI is now the best */
+            ctbase = cs->gicr_vpropbaser & R_GICR_VPROPBASER_PHYADDR_MASK;
+            update_for_one_lpi(cs, irq, ctbase, true, &cs->hppvlpi);
+            gicv3_cpuif_virt_irq_fiq_update(cs);
+        } else {
+            /* Only need to recalculate if this was previously the best vLPI */
+            if (irq == cs->hppvlpi.irq) {
+                gicv3_redist_update_vlpi(cs);
+            }
+        }
+    }
+
+    if (!resident && level && doorbell != INTID_SPURIOUS &&
+        (cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS)) {
+        /* vCPU is not currently resident: ring the doorbell */
+        gicv3_redist_process_lpi(cs, doorbell, 1);
+    }
 }
 
 void gicv3_redist_mov_vlpi(GICv3CPUState *src, uint64_t src_vptaddr,
-- 
2.25.1


