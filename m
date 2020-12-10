Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1492D59A2
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 12:51:17 +0100 (CET)
Received: from localhost ([::1]:37204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knKTc-0003BS-3e
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 06:51:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKQw-0001Qz-IL
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:32 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:41479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKQe-00071X-64
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:29 -0500
Received: by mail-wr1-x42f.google.com with SMTP id a12so5151938wrv.8
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 03:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=wf1XuqV8Ky+w4DmMBlqPnGd/R9XRzh/8oQR8ynsnFpk=;
 b=Ap6Qg2xElTbN205uZ09enxrYZgJRlDu5lB9OVCOssMbklAYUGg/zFVCQZeyZgoaqS9
 aJzg/NU3HGxo3mAVXQJh9o67qUZ5hWsNW/5XiL0qqfxOrRo4abazHuu6reBUH/AcArdA
 xDe5g1XKCwBiko8WXez6v86KKrtrbEqLi9KMEhUMYqLHDNpXzNQEekYENuO6L+vc/BDV
 2Ma2cysm4S46b4KEI12/gfq4c97CgRdqYuimb+ltIgj86gjG4XmCG2IBWK2Dl4Ed0k+8
 TKSAT9/yXWBGwFml/nuNJr+LMEHaueIbyaoiXTMtAhGjDApaHZ0ge+DJt28MoltXlR9O
 Z3Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wf1XuqV8Ky+w4DmMBlqPnGd/R9XRzh/8oQR8ynsnFpk=;
 b=c1/VFQcj4HElt5zQJtaQS05QezIkWWHZ8Ry68rmf6r8VY5xMCiwHsk29GZnd/bpyEM
 wsXT9bn6VZ3cEb5wliv/s87A6Mc/z/9Tjzsmbz+kpiAOEoQ708MQZ+OsldqPyXS6ZF8n
 nLegvTD5YRIjLPCJyVbKBas27QoKWL/e8zmxpLjQEkWSbwShpTSv9ypeTxa1sDYHMiYS
 +RubvLYOoSGPWgfFUcefMq1gZYMX60fJGy+2tbUaRepJ6wC87ErFjah4UxkXVk1tTtAK
 B5+nQcBLS69fYpGRO5z/u9f8iSEBPMO1iczGHhaR/lFvNsDycL/h9AvoxPwTot4klxVm
 Y7Dw==
X-Gm-Message-State: AOAM531I8h5eMPhHxdjrHLFZorGVS2YGMv1xtxmi35JLoEfOt9eUVLGa
 YLH96qbrXWeftLWf0/5vn5YKohKm3+MWOA==
X-Google-Smtp-Source: ABdhPJyL3qsX7xi8w7/39g+bDZZ6PMHV4CQhoS9IAWIXGJbVKwJjr5ObImNEK4Tc0u+mZGjMHp+M9g==
X-Received: by 2002:adf:e710:: with SMTP id c16mr7846842wrm.295.1607600890646; 
 Thu, 10 Dec 2020 03:48:10 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g192sm9304725wme.48.2020.12.10.03.48.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 03:48:10 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/36] i.MX6: Fix bad printf format specifiers
Date: Thu, 10 Dec 2020 11:47:30 +0000
Message-Id: <20201210114756.16501-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210114756.16501-1-peter.maydell@linaro.org>
References: <20201210114756.16501-1-peter.maydell@linaro.org>
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

From: Alex Chen <alex.chen@huawei.com>

We should use printf format specifier "%u" instead of "%d" for
argument of type "unsigned int".

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
Message-id: 20201126111109.112238-4-alex.chen@huawei.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/imx6_ccm.c | 20 ++++++++++----------
 hw/misc/imx6_src.c |  2 +-
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/misc/imx6_ccm.c b/hw/misc/imx6_ccm.c
index 7fec8f0a476..cb740427eca 100644
--- a/hw/misc/imx6_ccm.c
+++ b/hw/misc/imx6_ccm.c
@@ -96,7 +96,7 @@ static const char *imx6_ccm_reg_name(uint32_t reg)
     case CCM_CMEOR:
         return "CMEOR";
     default:
-        sprintf(unknown, "%d ?", reg);
+        sprintf(unknown, "%u ?", reg);
         return unknown;
     }
 }
@@ -235,7 +235,7 @@ static const char *imx6_analog_reg_name(uint32_t reg)
     case USB_ANALOG_DIGPROG:
         return "USB_ANALOG_DIGPROG";
     default:
-        sprintf(unknown, "%d ?", reg);
+        sprintf(unknown, "%u ?", reg);
         return unknown;
     }
 }
@@ -263,7 +263,7 @@ static uint64_t imx6_analog_get_pll2_clk(IMX6CCMState *dev)
         freq *= 20;
     }
 
-    DPRINTF("freq = %d\n", (uint32_t)freq);
+    DPRINTF("freq = %u\n", (uint32_t)freq);
 
     return freq;
 }
@@ -275,7 +275,7 @@ static uint64_t imx6_analog_get_pll2_pfd0_clk(IMX6CCMState *dev)
     freq = imx6_analog_get_pll2_clk(dev) * 18
            / EXTRACT(dev->analog[CCM_ANALOG_PFD_528], PFD0_FRAC);
 
-    DPRINTF("freq = %d\n", (uint32_t)freq);
+    DPRINTF("freq = %u\n", (uint32_t)freq);
 
     return freq;
 }
@@ -287,7 +287,7 @@ static uint64_t imx6_analog_get_pll2_pfd2_clk(IMX6CCMState *dev)
     freq = imx6_analog_get_pll2_clk(dev) * 18
            / EXTRACT(dev->analog[CCM_ANALOG_PFD_528], PFD2_FRAC);
 
-    DPRINTF("freq = %d\n", (uint32_t)freq);
+    DPRINTF("freq = %u\n", (uint32_t)freq);
 
     return freq;
 }
@@ -315,7 +315,7 @@ static uint64_t imx6_analog_get_periph_clk(IMX6CCMState *dev)
         break;
     }
 
-    DPRINTF("freq = %d\n", (uint32_t)freq);
+    DPRINTF("freq = %u\n", (uint32_t)freq);
 
     return freq;
 }
@@ -327,7 +327,7 @@ static uint64_t imx6_ccm_get_ahb_clk(IMX6CCMState *dev)
     freq = imx6_analog_get_periph_clk(dev)
            / (1 + EXTRACT(dev->ccm[CCM_CBCDR], AHB_PODF));
 
-    DPRINTF("freq = %d\n", (uint32_t)freq);
+    DPRINTF("freq = %u\n", (uint32_t)freq);
 
     return freq;
 }
@@ -339,7 +339,7 @@ static uint64_t imx6_ccm_get_ipg_clk(IMX6CCMState *dev)
     freq = imx6_ccm_get_ahb_clk(dev)
            / (1 + EXTRACT(dev->ccm[CCM_CBCDR], IPG_PODF));
 
-    DPRINTF("freq = %d\n", (uint32_t)freq);
+    DPRINTF("freq = %u\n", (uint32_t)freq);
 
     return freq;
 }
@@ -351,7 +351,7 @@ static uint64_t imx6_ccm_get_per_clk(IMX6CCMState *dev)
     freq = imx6_ccm_get_ipg_clk(dev)
            / (1 + EXTRACT(dev->ccm[CCM_CSCMR1], PERCLK_PODF));
 
-    DPRINTF("freq = %d\n", (uint32_t)freq);
+    DPRINTF("freq = %u\n", (uint32_t)freq);
 
     return freq;
 }
@@ -385,7 +385,7 @@ static uint32_t imx6_ccm_get_clock_frequency(IMXCCMState *dev, IMXClk clock)
         break;
     }
 
-    DPRINTF("Clock = %d) = %d\n", clock, freq);
+    DPRINTF("Clock = %d) = %u\n", clock, freq);
 
     return freq;
 }
diff --git a/hw/misc/imx6_src.c b/hw/misc/imx6_src.c
index dd99cc7acf0..79f43759113 100644
--- a/hw/misc/imx6_src.c
+++ b/hw/misc/imx6_src.c
@@ -68,7 +68,7 @@ static const char *imx6_src_reg_name(uint32_t reg)
     case SRC_GPR10:
         return "SRC_GPR10";
     default:
-        sprintf(unknown, "%d ?", reg);
+        sprintf(unknown, "%u ?", reg);
         return unknown;
     }
 }
-- 
2.20.1


