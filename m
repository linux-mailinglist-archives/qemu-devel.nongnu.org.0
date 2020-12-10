Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D57862D59EE
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 13:03:45 +0100 (CET)
Received: from localhost ([::1]:38196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knKfg-00079j-MN
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 07:03:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKQu-0001QA-N3
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:28 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:38645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKQe-00071S-KV
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:28 -0500
Received: by mail-wr1-x432.google.com with SMTP id r7so5150961wrc.5
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 03:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=XQsrNMirMBP/WD1WlqfVCpC5aj7zOTNhm+B7VyZuN1Y=;
 b=KR4Yo6FgIvY9YNPabC8wEqMtc95vv0XRLSGfaJVACJo3RpFM37+k14u5fOZ1CxXMpy
 B5d0y3AmJin04DZzLdoOQU+D7CJtxWpH2+hTVW4EPqUs8rrAypDTL74dmR8s5DSV3KwB
 Dwg9/tjkjp6V1Fe5EYQ5FfyvxflQAJm7wlYeog4bamQ8pdGV3E5ED/uLpUq9pwm91rtm
 6IAtOwKXdlrUo8pkhBeWP2wi+vaVVuFB8d7eWmqUg+z5m7u7g5Fc5GY6HHXNqujAU5Mu
 QV8TRfp+j+mweZfcqdfnZPnSM3vffe0is7FphuzAtSwfozCKEZsEcblinltJblRS0gmA
 pMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XQsrNMirMBP/WD1WlqfVCpC5aj7zOTNhm+B7VyZuN1Y=;
 b=daFmHUTPlJoZSXHZLbd25AYCmx3tsRJykp7M3LAYC90/COlucCwgK/cVqEhTBQr7Im
 yddDF8guBak86OWnPbVsTFatiKYDaVm+2JY5ltWVVBkx3/2WoZyUCu283M1CeCeI1A67
 7FG+HrdpsPh9hT9mjJatu59fFwxTO1jFDKKXzohw14DS80iFjmPlcxhn+HHq0wI+jCgb
 FouB0+gPgU5TTAOeDSA4qqujk7hF4t64uZFyHF14pvtqUXGE4imK541NZ09x2/W0ad3q
 PEL6XlZQn/cAc38sDBrygIIdlR+dePiarYcxWzdu5Tcrw7bHicnV+TEQMDX/cb7nz3J8
 xKkg==
X-Gm-Message-State: AOAM530HqlL3dlKtdvOss8H1wTRjDEUgp2bYue0rCzprZohI+gzqHTEl
 VODYdROhb3EzGA8+MOzamsAH7orQ4bNe5g==
X-Google-Smtp-Source: ABdhPJyba+nAZ4eYkh5JYRNjdsBedRwi5njhhP0u+O0ThWkTVM/shzkHEDKxPLPFPwODtEc9Ex1B7A==
X-Received: by 2002:a5d:6ccb:: with SMTP id c11mr7848188wrc.224.1607600889778; 
 Thu, 10 Dec 2020 03:48:09 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g192sm9304725wme.48.2020.12.10.03.48.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 03:48:09 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/36] i.MX31: Fix bad printf format specifiers
Date: Thu, 10 Dec 2020 11:47:29 +0000
Message-Id: <20201210114756.16501-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210114756.16501-1-peter.maydell@linaro.org>
References: <20201210114756.16501-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

From: Alex Chen <alex.chen@huawei.com>

We should use printf format specifier "%u" instead of "%d" for
argument of type "unsigned int".

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
Message-id: 20201126111109.112238-3-alex.chen@huawei.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/imx31_ccm.c | 14 +++++++-------
 hw/misc/imx_ccm.c   |  4 ++--
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/misc/imx31_ccm.c b/hw/misc/imx31_ccm.c
index 6e246827ab6..ad30a4b2c0c 100644
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
index 52882071d3b..08a50ee4c8a 100644
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
2.20.1


