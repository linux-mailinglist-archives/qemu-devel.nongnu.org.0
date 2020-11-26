Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 653A82C52EA
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 12:29:33 +0100 (CET)
Received: from localhost ([::1]:51388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiFSu-0001oj-EC
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 06:29:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kiFNI-0004V0-Bj; Thu, 26 Nov 2020 06:23:44 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kiFND-0003rA-2z; Thu, 26 Nov 2020 06:23:44 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Chb3L5nMJz73Mk;
 Thu, 26 Nov 2020 19:23:10 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Thu, 26 Nov 2020
 19:23:24 +0800
From: Alex Chen <alex.chen@huawei.com>
To: <peter.maydell@linaro.org>, <jcd@tribudubois.net>,
 <peter.chubb@nicta.com.au>
Subject: [PATCH 2/5] i.MX31: Fix bad printf format specifiers
Date: Thu, 26 Nov 2020 11:11:06 +0000
Message-ID: <20201126111109.112238-3-alex.chen@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20201126111109.112238-1-alex.chen@huawei.com>
References: <20201126111109.112238-1-alex.chen@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=alex.chen@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: alex.chen@huawei.com, qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We should use printf format specifier "%u" instead of "%d" for
argument of type "unsigned int".

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
---
 hw/misc/imx31_ccm.c | 14 +++++++-------
 hw/misc/imx_ccm.c   |  4 ++--
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/misc/imx31_ccm.c b/hw/misc/imx31_ccm.c
index 6e246827ab..ad30a4b2c0 100644
--- a/hw/misc/imx31_ccm.c
+++ b/hw/misc/imx31_ccm.c
@@ -89,7 +89,7 @@ static const char *imx31_ccm_reg_name(uint32_t reg)
     case IMX31_CCM_PDR2_REG:
         return "PDR2";
     default:
-        sprintf(unknown, "[%d ?]", reg);
+        sprintf(unknown, "[%u ?]", reg);
         return unknown;
     }
 }
@@ -120,7 +120,7 @@ static uint32_t imx31_ccm_get_pll_ref_clk(IMXCCMState *dev)
         freq = CKIH_FREQ;
     }
 
-    DPRINTF("freq = %d\n", freq);
+    DPRINTF("freq = %u\n", freq);
 
     return freq;
 }
@@ -133,7 +133,7 @@ static uint32_t imx31_ccm_get_mpll_clk(IMXCCMState *dev)
     freq = imx_ccm_calc_pll(s->reg[IMX31_CCM_MPCTL_REG],
                             imx31_ccm_get_pll_ref_clk(dev));
 
-    DPRINTF("freq = %d\n", freq);
+    DPRINTF("freq = %u\n", freq);
 
     return freq;
 }
@@ -150,7 +150,7 @@ static uint32_t imx31_ccm_get_mcu_main_clk(IMXCCMState *dev)
         freq = imx31_ccm_get_mpll_clk(dev);
     }
 
-    DPRINTF("freq = %d\n", freq);
+    DPRINTF("freq = %u\n", freq);
 
     return freq;
 }
@@ -163,7 +163,7 @@ static uint32_t imx31_ccm_get_hclk_clk(IMXCCMState *dev)
     freq = imx31_ccm_get_mcu_main_clk(dev)
            / (1 + EXTRACT(s->reg[IMX31_CCM_PDR0_REG], MAX));
 
-    DPRINTF("freq = %d\n", freq);
+    DPRINTF("freq = %u\n", freq);
 
     return freq;
 }
@@ -176,7 +176,7 @@ static uint32_t imx31_ccm_get_ipg_clk(IMXCCMState *dev)
     freq = imx31_ccm_get_hclk_clk(dev)
            / (1 + EXTRACT(s->reg[IMX31_CCM_PDR0_REG], IPG));
 
-    DPRINTF("freq = %d\n", freq);
+    DPRINTF("freq = %u\n", freq);
 
     return freq;
 }
@@ -201,7 +201,7 @@ static uint32_t imx31_ccm_get_clock_frequency(IMXCCMState *dev, IMXClk clock)
         break;
     }
 
-    DPRINTF("Clock = %d) = %d\n", clock, freq);
+    DPRINTF("Clock = %d) = %u\n", clock, freq);
 
     return freq;
 }
diff --git a/hw/misc/imx_ccm.c b/hw/misc/imx_ccm.c
index 52882071d3..08a50ee4c8 100644
--- a/hw/misc/imx_ccm.c
+++ b/hw/misc/imx_ccm.c
@@ -38,7 +38,7 @@ uint32_t imx_ccm_get_clock_frequency(IMXCCMState *dev, IMXClk clock)
         freq = klass->get_clock_frequency(dev, clock);
     }
 
-    DPRINTF("(clock = %d) = %d\n", clock, freq);
+    DPRINTF("(clock = %d) = %u\n", clock, freq);
 
     return freq;
 }
@@ -65,7 +65,7 @@ uint32_t imx_ccm_calc_pll(uint32_t pllreg, uint32_t base_freq)
     freq = ((2 * (base_freq >> 10) * (mfi * mfd + mfn)) /
             (mfd * pd)) << 10;
 
-    DPRINTF("(pllreg = 0x%08x, base_freq = %d) = %d\n", pllreg, base_freq,
+    DPRINTF("(pllreg = 0x%08x, base_freq = %u) = %d\n", pllreg, base_freq,
             freq);
 
     return freq;
-- 
2.19.1


