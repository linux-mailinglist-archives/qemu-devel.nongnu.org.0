Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDC72D59FA
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 13:07:11 +0100 (CET)
Received: from localhost ([::1]:46452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knKj0-0002Cb-NF
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 07:07:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKQu-0001Pr-MK
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:28 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:46664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKQc-00071L-3v
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:27 -0500
Received: by mail-wr1-x436.google.com with SMTP id l9so5135608wrt.13
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 03:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=yQr23rJKjSZ4qtoRCxWVAb/FFzkFzM6tNSyE6y7hzSI=;
 b=Gk1j1m8s93UkA5WkEGnqBCK18ZwyFOArotLYgBA82I0Wg5oNxATSFFTtfjen3nE/H7
 Xfw4YclY1+hxZ4LSdKfbVDbfIGnjnYuKaR/BBR14jxje451+BlB+EqMsugn7VIG58DP4
 +MU9IuRb1zqhXja+yN8nJITLQObHUoIqRlEs4+WROFvhSGLKbCwgDg4MLQu/bhCfRGne
 3jRljLsd1hLERVxNBCB+l6AahrkDTNqO+X8/MRqG+ND+23u1BM6SgSuYPGySVzD9j2Vj
 xjLuX9G90IJPgchmjlFBwJ0YmZnSF5t0pKzoBTfMNElpvJ4RReju8nZEeY1aZnz2JIia
 MQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yQr23rJKjSZ4qtoRCxWVAb/FFzkFzM6tNSyE6y7hzSI=;
 b=YTjJnslxqLocSglRQleNrBsEfIP/IglppCEf+Y3yQDih613Sc9pYeFoVhT5qVPYsXD
 euHdevb7vRRPx6p7lepSpIuIpb2do1DBjl9KoAegz3792EjWdpjEbyzeGB3p8n/GR44C
 QUwfuYK7f1sfmzsbDl8PO+GHDxlQzHD2TMRN56RiC6QYSrp9eZQ8y6Ou/Qs0M/i/kc02
 78XAWO5mVxFuUSIAtISDhg888L4FbK+jd28zdhXa5Wv9COEhOe4m5yHzvAQCUVm8nncP
 vutE9iMs1hh1PXfELR8c0UhAua9Ma7+hAzmnCwOIXsjaDqFH2w8rVxMIDhiGwaWFFQET
 Qvpw==
X-Gm-Message-State: AOAM530ttRhhtjSaiLgIdfZ/9xTqwEzfP3Xv9BqNdSVcBFd5ysqNEy8H
 wCokSlQGscIjn/a/895H4gFBUxVbtQa4dg==
X-Google-Smtp-Source: ABdhPJyqEeO+RJ8igs0eM42HGB1pkVoboLdowVBL0NhC70BhLM36juBa9Kc4Tfs7r2TMo+Kyi1pW7w==
X-Received: by 2002:a5d:42cf:: with SMTP id t15mr7721095wrr.267.1607600888659; 
 Thu, 10 Dec 2020 03:48:08 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g192sm9304725wme.48.2020.12.10.03.48.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 03:48:08 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/36] i.MX25: Fix bad printf format specifiers
Date: Thu, 10 Dec 2020 11:47:28 +0000
Message-Id: <20201210114756.16501-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210114756.16501-1-peter.maydell@linaro.org>
References: <20201210114756.16501-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Message-id: 20201126111109.112238-2-alex.chen@huawei.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/imx25_ccm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/misc/imx25_ccm.c b/hw/misc/imx25_ccm.c
index d3107e5ca29..ff996e2f2ca 100644
--- a/hw/misc/imx25_ccm.c
+++ b/hw/misc/imx25_ccm.c
@@ -91,7 +91,7 @@ static const char *imx25_ccm_reg_name(uint32_t reg)
     case IMX25_CCM_LPIMR1_REG:
         return "lpimr1";
     default:
-        sprintf(unknown, "[%d ?]", reg);
+        sprintf(unknown, "[%u ?]", reg);
         return unknown;
     }
 }
@@ -118,7 +118,7 @@ static uint32_t imx25_ccm_get_mpll_clk(IMXCCMState *dev)
         freq = imx_ccm_calc_pll(s->reg[IMX25_CCM_MPCTL_REG], CKIH_FREQ);
     }
 
-    DPRINTF("freq = %d\n", freq);
+    DPRINTF("freq = %u\n", freq);
 
     return freq;
 }
@@ -136,7 +136,7 @@ static uint32_t imx25_ccm_get_mcu_clk(IMXCCMState *dev)
 
     freq = freq / (1 + EXTRACT(s->reg[IMX25_CCM_CCTL_REG], ARM_CLK_DIV));
 
-    DPRINTF("freq = %d\n", freq);
+    DPRINTF("freq = %u\n", freq);
 
     return freq;
 }
@@ -149,7 +149,7 @@ static uint32_t imx25_ccm_get_ahb_clk(IMXCCMState *dev)
     freq = imx25_ccm_get_mcu_clk(dev)
            / (1 + EXTRACT(s->reg[IMX25_CCM_CCTL_REG], AHB_CLK_DIV));
 
-    DPRINTF("freq = %d\n", freq);
+    DPRINTF("freq = %u\n", freq);
 
     return freq;
 }
@@ -160,7 +160,7 @@ static uint32_t imx25_ccm_get_ipg_clk(IMXCCMState *dev)
 
     freq = imx25_ccm_get_ahb_clk(dev) / 2;
 
-    DPRINTF("freq = %d\n", freq);
+    DPRINTF("freq = %u\n", freq);
 
     return freq;
 }
@@ -186,7 +186,7 @@ static uint32_t imx25_ccm_get_clock_frequency(IMXCCMState *dev, IMXClk clock)
         break;
     }
 
-    DPRINTF("Clock = %d) = %d\n", clock, freq);
+    DPRINTF("Clock = %d) = %u\n", clock, freq);
 
     return freq;
 }
-- 
2.20.1


