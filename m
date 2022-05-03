Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFD2517E16
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 09:09:47 +0200 (CEST)
Received: from localhost ([::1]:46408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlmfK-0007nl-Dw
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 03:09:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=XF6a=VL=kaod.org=clg@ozlabs.org>)
 id 1nlmUx-0002yO-AL; Tue, 03 May 2022 02:59:03 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:35489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=XF6a=VL=kaod.org=clg@ozlabs.org>)
 id 1nlmUv-0007Rt-8M; Tue, 03 May 2022 02:59:03 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KsrR33qRnz4xXh;
 Tue,  3 May 2022 16:58:55 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KsrR15K3fz4yST;
 Tue,  3 May 2022 16:58:53 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 01/19] hw: aspeed_scu: Add AST2600 apb_freq and hpll
 calculation function
Date: Tue,  3 May 2022 08:58:30 +0200
Message-Id: <20220503065848.125215-2-clg@kaod.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503065848.125215-1-clg@kaod.org>
References: <20220503065848.125215-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=XF6a=VL=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Steven Lee <steven_lee@aspeedtech.com>

AST2600's HPLL register offset and bit definition are different from
AST2500. Add a hpll calculation function and an apb frequency calculation
function based on SCU200 register description in ast2600v11.pdf.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
[ clg: checkpatch fixes ]
Message-Id: <20220315075753.8591-2-steven_lee@aspeedtech.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/misc/aspeed_scu.h | 19 ++++++++++++++++++
 hw/misc/aspeed_scu.c         | 39 +++++++++++++++++++++++++++++++++++-
 2 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
index c14aff2bcbb5..8c4c8c8d5cbb 100644
--- a/include/hw/misc/aspeed_scu.h
+++ b/include/hw/misc/aspeed_scu.h
@@ -56,6 +56,7 @@ struct AspeedSCUClass {
 
     const uint32_t *resets;
     uint32_t (*calc_hpll)(AspeedSCUState *s, uint32_t hpll_reg);
+    uint32_t (*get_apb)(AspeedSCUState *s);
     uint32_t apb_divider;
     uint32_t nr_regs;
     const MemoryRegionOps *ops;
@@ -316,4 +317,22 @@ uint32_t aspeed_scu_get_apb_freq(AspeedSCUState *s);
         SCU_HW_STRAP_VGA_SIZE_SET(VGA_16M_DRAM) |                       \
         SCU_AST2500_HW_STRAP_RESERVED1)
 
+/*
+ * SCU200   H-PLL Parameter Register (for Aspeed AST2600 SOC)
+ *
+ *  28:26  H-PLL Parameters
+ *  25     Enable H-PLL reset
+ *  24     Enable H-PLL bypass mode
+ *  23     Turn off H-PLL
+ *  22:19  H-PLL Post Divider (P)
+ *  18:13  H-PLL Numerator (M)
+ *  12:0   H-PLL Denumerator (N)
+ *
+ *  (Output frequency) = CLKIN(25MHz) * [(M+1) / (N+1)] / (P+1)
+ *
+ * The default frequency is 1200Mhz when CLKIN = 25MHz
+ */
+#define SCU_AST2600_H_PLL_BYPASS_EN                        (0x1 << 24)
+#define SCU_AST2600_H_PLL_OFF                              (0x1 << 23)
+
 #endif /* ASPEED_SCU_H */
diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index d06e179a6e65..d65f86df3d12 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -213,6 +213,11 @@ static uint32_t aspeed_scu_get_random(void)
 }
 
 uint32_t aspeed_scu_get_apb_freq(AspeedSCUState *s)
+{
+    return ASPEED_SCU_GET_CLASS(s)->get_apb(s);
+}
+
+static uint32_t aspeed_2400_scu_get_apb_freq(AspeedSCUState *s)
 {
     AspeedSCUClass *asc = ASPEED_SCU_GET_CLASS(s);
     uint32_t hpll = asc->calc_hpll(s, s->regs[HPLL_PARAM]);
@@ -221,6 +226,15 @@ uint32_t aspeed_scu_get_apb_freq(AspeedSCUState *s)
         / asc->apb_divider;
 }
 
+static uint32_t aspeed_2600_scu_get_apb_freq(AspeedSCUState *s)
+{
+    AspeedSCUClass *asc = ASPEED_SCU_GET_CLASS(s);
+    uint32_t hpll = asc->calc_hpll(s, s->regs[AST2600_HPLL_PARAM]);
+
+    return hpll / (SCU_CLK_GET_PCLK_DIV(s->regs[AST2600_CLK_SEL]) + 1)
+        / asc->apb_divider;
+}
+
 static uint64_t aspeed_scu_read(void *opaque, hwaddr offset, unsigned size)
 {
     AspeedSCUState *s = ASPEED_SCU(opaque);
@@ -426,6 +440,26 @@ static uint32_t aspeed_2500_scu_calc_hpll(AspeedSCUState *s, uint32_t hpll_reg)
     return clkin * multiplier;
 }
 
+static uint32_t aspeed_2600_scu_calc_hpll(AspeedSCUState *s, uint32_t hpll_reg)
+{
+    uint32_t multiplier = 1;
+    uint32_t clkin = aspeed_scu_get_clkin(s);
+
+    if (hpll_reg & SCU_AST2600_H_PLL_OFF) {
+        return 0;
+    }
+
+    if (!(hpll_reg & SCU_AST2600_H_PLL_BYPASS_EN)) {
+        uint32_t p = (hpll_reg >> 19) & 0xf;
+        uint32_t n = (hpll_reg >> 13) & 0x3f;
+        uint32_t m = hpll_reg & 0x1fff;
+
+        multiplier = ((m + 1) / (n + 1)) / (p + 1);
+    }
+
+    return clkin * multiplier;
+}
+
 static void aspeed_scu_reset(DeviceState *dev)
 {
     AspeedSCUState *s = ASPEED_SCU(dev);
@@ -525,6 +559,7 @@ static void aspeed_2400_scu_class_init(ObjectClass *klass, void *data)
     dc->desc = "ASPEED 2400 System Control Unit";
     asc->resets = ast2400_a0_resets;
     asc->calc_hpll = aspeed_2400_scu_calc_hpll;
+    asc->get_apb = aspeed_2400_scu_get_apb_freq;
     asc->apb_divider = 2;
     asc->nr_regs = ASPEED_SCU_NR_REGS;
     asc->ops = &aspeed_ast2400_scu_ops;
@@ -545,6 +580,7 @@ static void aspeed_2500_scu_class_init(ObjectClass *klass, void *data)
     dc->desc = "ASPEED 2500 System Control Unit";
     asc->resets = ast2500_a1_resets;
     asc->calc_hpll = aspeed_2500_scu_calc_hpll;
+    asc->get_apb = aspeed_2400_scu_get_apb_freq;
     asc->apb_divider = 4;
     asc->nr_regs = ASPEED_SCU_NR_REGS;
     asc->ops = &aspeed_ast2500_scu_ops;
@@ -716,7 +752,8 @@ static void aspeed_2600_scu_class_init(ObjectClass *klass, void *data)
     dc->desc = "ASPEED 2600 System Control Unit";
     dc->reset = aspeed_ast2600_scu_reset;
     asc->resets = ast2600_a3_resets;
-    asc->calc_hpll = aspeed_2500_scu_calc_hpll; /* No change since AST2500 */
+    asc->calc_hpll = aspeed_2600_scu_calc_hpll;
+    asc->get_apb = aspeed_2600_scu_get_apb_freq;
     asc->apb_divider = 4;
     asc->nr_regs = ASPEED_AST2600_SCU_NR_REGS;
     asc->ops = &aspeed_ast2600_scu_ops;
-- 
2.35.1


