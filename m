Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF42D5FA04D
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 16:40:17 +0200 (CEST)
Received: from localhost ([::1]:39702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohtx2-0006Dg-Om
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 10:40:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtl1-0006Nl-K4
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:27:53 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:36623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtl0-0005a6-1K
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:27:51 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 c3-20020a1c3503000000b003bd21e3dd7aso8661289wma.1
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 07:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xcqyCitgRrJzyAqXxWJiCb8GgP/3UYAazPshhYBejpI=;
 b=gDRSgXtzSEfjMt8DXjU/RPXqr/LCv29SD1IF18CUvXGfvQQwHhRWEf/1QnuXKEvTP5
 FluTzRv4z/rrmc/QJa6liQbdlQ4oVhErQxDk9u5/VWyvvqVdrK/6E4eCXaQn87kYCIn2
 lhKeSVF1LGxg6aonjsRokY/eE4hZnNryGjuKmmfCSw7n+CJRj3gdHflF52yLDYtd53pH
 oaQPM34C5R85eVss8T+z6qq3dwNpNfcvwQyVAeLQhq77w0w3rW8Qixq6h7a5lVqgvmsG
 5xJkynW55r5OQ4BTraugEeAh1kyCO01h+Hou0L2tJCYKq8um7MX7uYF1jkPObj+ouat6
 83nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xcqyCitgRrJzyAqXxWJiCb8GgP/3UYAazPshhYBejpI=;
 b=YZ/852lpWjR8tFwYM36VIrXNeswNcI2ic9zfDBD6mdryqv0jZfwHLJ1TyLxhsW0Y4G
 7rypwU2OzEQ/uaNr3dQQvLRh5fWAd5sgHZz8bgWmS02rmgazrGrsYeCQQuUOyYxAsiYu
 Vah+hZ1wP7n0AQXZ4elhI9o0vsJAyYHx8x3jm/pMm9Mqx6aHjJRnGcLp9KjMsLnJSXvm
 gz6bY2gRFNtCf2E3Or6mqcB2mA4IuA28Mqyvl/GZ9bsXBsdgzGbafdaiDSEb1eeB2VfG
 pElWVJqCapINYXSzZqgd8zjOt8pCh0RYM6oeefGy1a/NwE/q+XXR0Q6ETk0oc/4odHwD
 W1pw==
X-Gm-Message-State: ACrzQf0QFuWAU8u0GkBaG7Cde7weY8lGTEmzYvZxeBCCeWpgO86Zo8CK
 b/x4gyz9ouIFlO6758FUuC9KLzVsSGBBDw==
X-Google-Smtp-Source: AMsMyM5h62dPLxi8qC6e1LPRZ4L+UI/c67ih6ddggsBNWJbEjpEbysQR/79OnmLn34lFD/BX5HoT+g==
X-Received: by 2002:a05:600c:500d:b0:3b5:234:d7e9 with SMTP id
 n13-20020a05600c500d00b003b50234d7e9mr12993952wmr.57.1665412068655; 
 Mon, 10 Oct 2022 07:27:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adfed46000000b0022e04bfa661sm9037054wro.59.2022.10.10.07.27.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 07:27:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/28] target/arm: Reorg regime_translation_disabled
Date: Mon, 10 Oct 2022 15:27:17 +0100
Message-Id: <20221010142730.502083-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010142730.502083-1-peter.maydell@linaro.org>
References: <20221010142730.502083-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

Use a switch on mmu_idx for the a-profile indexes, instead of
three different if's vs regime_el and arm_mmu_idx_is_stage1_of_2.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221001162318.153420-12-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 2055d684e63..a514a78c924 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -148,21 +148,39 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
 
     hcr_el2 = arm_hcr_el2_eff(env);
 
-    if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
+    switch (mmu_idx) {
+    case ARMMMUIdx_Stage2:
+    case ARMMMUIdx_Stage2_S:
         /* HCR.DC means HCR.VM behaves as 1 */
         return (hcr_el2 & (HCR_DC | HCR_VM)) == 0;
-    }
 
-    if (hcr_el2 & HCR_TGE) {
+    case ARMMMUIdx_E10_0:
+    case ARMMMUIdx_E10_1:
+    case ARMMMUIdx_E10_1_PAN:
         /* TGE means that NS EL0/1 act as if SCTLR_EL1.M is zero */
-        if (!is_secure && regime_el(env, mmu_idx) == 1) {
+        if (!is_secure && (hcr_el2 & HCR_TGE)) {
             return true;
         }
-    }
+        break;
 
-    if ((hcr_el2 & HCR_DC) && arm_mmu_idx_is_stage1_of_2(mmu_idx)) {
+    case ARMMMUIdx_Stage1_E0:
+    case ARMMMUIdx_Stage1_E1:
+    case ARMMMUIdx_Stage1_E1_PAN:
         /* HCR.DC means SCTLR_EL1.M behaves as 0 */
-        return true;
+        if (hcr_el2 & HCR_DC) {
+            return true;
+        }
+        break;
+
+    case ARMMMUIdx_E20_0:
+    case ARMMMUIdx_E20_2:
+    case ARMMMUIdx_E20_2_PAN:
+    case ARMMMUIdx_E2:
+    case ARMMMUIdx_E3:
+        break;
+
+    default:
+        g_assert_not_reached();
     }
 
     return (regime_sctlr(env, mmu_idx) & SCTLR_M) == 0;
-- 
2.25.1


