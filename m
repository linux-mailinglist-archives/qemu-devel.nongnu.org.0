Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 231FF2D687C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 21:17:51 +0100 (CET)
Received: from localhost ([::1]:56460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knSNo-0000Y2-7j
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 15:17:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knSKn-0007Vg-8d
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 15:14:41 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:39346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knSKl-00010y-12
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 15:14:41 -0500
Received: by mail-wm1-x341.google.com with SMTP id 3so6585931wmg.4
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 12:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=DcYO717g+h48zX5CfwBJY1EuyVi+kJp3S/Ky2vihqM0=;
 b=Y3q9nK8ffYQ/yKv53wM3p3wtKw32Lsx62o76ypYd0HVTw0nqvZi9dabU0vDI9E2BDp
 rN6FWmtixGvOnzBVW4Sx1dOeHCH7tzDuFugqpkZ/qJw3yy8SKzWTn6kDgUPEKt+a//jq
 eQSWtZaZh9Xn8/8R83qLRfZMDFUAfY6kzVgbD1IfgIC1nk55u7ch5M4TYXaTJE3t7mxQ
 7jaGVHsqzxcu9VRevhGnbLpfVPWoKY3zcaPYs7X7ZQYkB2WVvY1GEiuREWAbMDSevBk+
 3NRZLY+DR6Y+jvKmjWM9Ya86lqv62lm3P0wQJb2agBQJg4D3XGeihklVdOnTDKfbLbRf
 fbVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DcYO717g+h48zX5CfwBJY1EuyVi+kJp3S/Ky2vihqM0=;
 b=ZqfILSoQ+mLAVDI0zw9grogzLgEJjIUSuV1OLbuc77UXkKSn0b3Z0k56Ndare3Ozvp
 wckwhDVZN6LPO3FbfSwh0cBTRVEBqluCne9UQh7Ze7fpQdcUn/WeJuM3zUt6V3KygBnf
 g21eY8yIPiJ2cZhtaBI6SBBeN700cKGi3B3KvzwZIyOfdkkK+ZvaozqDij9lFToJWbhn
 p4DBViXz8FZV5l1yVJ8GwRsl+wZUUvwOnN9p0HQ3hetCnIKLujivdVwrCJBrUMZWF/vH
 6lxnNcX5CK8UyBX8WB+DauZ0S/QfvGBM8CWtF9taztjt4kuZG6NRq6+I7aTe8kkeZXQG
 VIOg==
X-Gm-Message-State: AOAM530ZpsnxD/7RGZBwB5/kGcMxJhr0Qd8Vv5q9ahj+AOy4S2vPCiHG
 nmt4g14lqDSVQy00PhTAzOujJO5HfGXNHA==
X-Google-Smtp-Source: ABdhPJw283ybtzLmmV2oURlUcoF6AVpkRLZHoBYFRKqeAsDyycEJ2shczsws5XLrbTLstSpQ2R0dmg==
X-Received: by 2002:a05:600c:224b:: with SMTP id
 a11mr9957899wmm.97.1607631277294; 
 Thu, 10 Dec 2020 12:14:37 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y130sm11879591wmc.22.2020.12.10.12.14.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 12:14:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/4] hw/intc/armv7m_nvic: Correct handling of CCR.BFHFNMIGN
Date: Thu, 10 Dec 2020 20:14:30 +0000
Message-Id: <20201210201433.26262-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210201433.26262-1-peter.maydell@linaro.org>
References: <20201210201433.26262-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x341.google.com
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

The CCR is a register most of whose bits are banked between security
states but where BFHFNMIGN is not, and we keep it in the non-secure
entry of the v7m.ccr[] array.  The logic which tries to handle this
bit fails to implement the "RAZ/WI from Nonsecure if AIRCR.BFHFNMINS
is zero" requirement; correct the omission.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Changes since v2: get the "WI" bit right
---
 hw/intc/armv7m_nvic.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index f63aa2d8713..0d8426dafc9 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -1106,6 +1106,12 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
          */
         val = cpu->env.v7m.ccr[attrs.secure];
         val |= cpu->env.v7m.ccr[M_REG_NS] & R_V7M_CCR_BFHFNMIGN_MASK;
+        /* BFHFNMIGN is RAZ/WI from NS if AIRCR.BFHFNMINS is 0 */
+        if (!attrs.secure) {
+            if (!(cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK)) {
+                val &= ~R_V7M_CCR_BFHFNMIGN_MASK;
+            }
+        }
         return val;
     case 0xd24: /* System Handler Control and State (SHCSR) */
         if (!arm_feature(&cpu->env, ARM_FEATURE_V7)) {
@@ -1683,6 +1689,15 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
                 (cpu->env.v7m.ccr[M_REG_NS] & ~R_V7M_CCR_BFHFNMIGN_MASK)
                 | (value & R_V7M_CCR_BFHFNMIGN_MASK);
             value &= ~R_V7M_CCR_BFHFNMIGN_MASK;
+        } else {
+            /*
+             * BFHFNMIGN is RAZ/WI from NS if AIRCR.BFHFNMINS is 0, so
+             * preserve the state currently in the NS element of the array
+             */
+            if (!(cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK)) {
+                value &= ~R_V7M_CCR_BFHFNMIGN_MASK;
+                value |= cpu->env.v7m.ccr[M_REG_NS] & R_V7M_CCR_BFHFNMIGN_MASK;
+            }
         }
 
         cpu->env.v7m.ccr[attrs.secure] = value;
-- 
2.20.1


