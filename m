Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DE12B9D89
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 23:21:14 +0100 (CET)
Received: from localhost ([::1]:53490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfsIj-0003va-Tz
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 17:21:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrvJ-00015E-2r
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:57:01 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:38626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrv4-0004F5-Ty
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:57:00 -0500
Received: by mail-wm1-x343.google.com with SMTP id 1so8077326wme.3
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 13:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=IYl49JEXLJ4NfyGT6TJwXfRcF2SPUTrLyQsnI7fa5Vo=;
 b=RW65dYVUokAroAYmmJpkqUnENT9sMP0nallQRhd0kU0t/hoFmbuIswAHFv2fMl+/GA
 Ik8qLEPuDJ7lv+b22tytoetx7VCDoDaKy1v6gbaGd2qnhCs4g1V5ays4E0z5fi/27ki3
 NCAFhWgC5OttC5+cPeXCCn1JR1bIsPi2TxpH68MnTT9666ftSfMpiB49p1TQofN2/Kxs
 k9Y3NMeMLjo/ihCrWIPALS4dk76ZxK4UN28iRsInnpcyIFWe4/NkOLtOTemac7C/YquQ
 Fc0nkr3gp/kKGEXheQadq+1GXz9jUqrOWI95vZOGOmdc3D9a11SBAc4X0ge2nyhmctzK
 RqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IYl49JEXLJ4NfyGT6TJwXfRcF2SPUTrLyQsnI7fa5Vo=;
 b=eQCDiSlOeSkI3gPlmX9+1mH3VeciwIYZ8EGAZa/9+jbCalFx7Zl+UdzAMRNkkIqfKv
 iCU5G00gNFmOVh1RUMqPphOujshoqmM6igC1RUpgvbpRNlyAejzjzBmvtbpnV9riAkW/
 LDFrLJ7CH+3+Itqhi73Xg2+U5fbEe7stb8eyZCmYxiLswPJE1N0CX2gP9lxbdMtYtTu7
 FaaefStSAQEZlvo2AxW2KCGM3AyNua9qdsZmCQbmxkuZfm5y6YeWnHI/pqpTAKz4Yt3k
 zIL/oW9gwMKa6q5DJG8tzRWOIYd0B6R154tUgCrQ2TIVMJxC4A5BV0gMvRAIe9CsMJ2q
 OYog==
X-Gm-Message-State: AOAM532eJGltYtFe3X2Dx16Zdp13lB6dJUAJgnGHqRsXLPwX0NckM18C
 smCv2rzEjkmO9uSxSpixzxtNPrV9VjURDA==
X-Google-Smtp-Source: ABdhPJxvVI/1BYdgnRBy3xNUFt3qZgRraeg6gk3AiE8hGzTnuq6+JpDzafrmWg6FA+Nh2K3Ziylakg==
X-Received: by 2002:a1c:a5d8:: with SMTP id o207mr6629056wme.0.1605823004064; 
 Thu, 19 Nov 2020 13:56:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j15sm1934851wrm.62.2020.11.19.13.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 13:56:43 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 21/28] hw/intc/armv7m_nvic: Correct handling of
 CCR.BFHFNMIGN
Date: Thu, 19 Nov 2020 21:56:10 +0000
Message-Id: <20201119215617.29887-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201119215617.29887-1-peter.maydell@linaro.org>
References: <20201119215617.29887-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x343.google.com
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

The CCR is a register most of whose bits are banked between security
states but where BFHFNMIGN is not, and we keep it in the non-secure
entry of the v7m.ccr[] array.  The logic which tries to handle this
bit fails to implement the "RAZ/WI from Nonsecure if AIRCR.BFHFNMINS
is zero" requirement; correct the omission.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index effc4a784ca..deb4bd56c95 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -1100,6 +1100,12 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
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
@@ -1662,6 +1668,11 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
                 (cpu->env.v7m.ccr[M_REG_NS] & ~R_V7M_CCR_BFHFNMIGN_MASK)
                 | (value & R_V7M_CCR_BFHFNMIGN_MASK);
             value &= ~R_V7M_CCR_BFHFNMIGN_MASK;
+        } else {
+            /* BFHFNMIGN is RAZ/WI from NS if AIRCR.BFHFNMINS is 0 */
+            if (!(cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK)) {
+                value &= ~R_V7M_CCR_BFHFNMIGN_MASK;
+            }
         }
 
         cpu->env.v7m.ccr[attrs.secure] = value;
-- 
2.20.1


