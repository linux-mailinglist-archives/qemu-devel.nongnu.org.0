Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 110C8619571
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 12:36:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oquyw-0001Ee-6c; Fri, 04 Nov 2022 07:35:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oquyt-0001D8-Ou
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 07:35:27 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oquys-00087F-3F
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 07:35:27 -0400
Received: by mail-wr1-x42e.google.com with SMTP id z14so6655568wrn.7
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 04:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=B0i2dCHDu9lWZFqlFLWm0pVGENdI0RfMEclSaPXpBTU=;
 b=Ilwq2q2nEtKKOaBDN9UJvFQY7Ae5thrM+vvIn1kyQYQimvgo6jigHPqe6xZ34dUXKE
 fDr58CRsVR1ZU/l31dyWEZ4ZrWQOzPj1806Xp1WgJwVhQlb0IBjRZkEcYU03WoEu+1QT
 z6Kxdh/1X5osRfjIfnvK8Czk6gcEsPV9+uxW1+qe0j3gdftB253T+dFEXuKMVeW5SXVx
 fhmEXv65tJdy5e10SkxjOh30tYN3WRmfSvSWlkY6lF2BRN/pm4K74f2NHoeG7AKoUxvr
 yXtr9GsChzMEiYWXLVodWiPaH7ujc3bXilWHryui9HmuH8kvb1vJT5WTyWWMTMy6jK4Q
 4UNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B0i2dCHDu9lWZFqlFLWm0pVGENdI0RfMEclSaPXpBTU=;
 b=PUXpDQd+aouP+s+N8bX7ocE6ZSiaxMpGyY95ByhsdjyrGoB/j045orZFoeFoErgcSE
 a83wRBAJF0ePEoheDStoRUEv5KPbkTpkTVY84aIbjDpimeL/i+BIC8Zpv6bwtqX2si1T
 K80j9OKhBmBL+caBHrCAst6ENtP5JEF1X3jhHUSmz5i09Ibw5Qhqed8ekYQrRz7w6eX1
 /+Ajh+kmQVbRK15PcyjVKoVKGnLILiXiDOehrwKLGw/pqWp8pEFAY5jMAMVmpZjYTb9T
 +pvs5FG+tBK0xMIWJdwEg3TbvJ+8qHCHrmuIW2gq+9vM9dQusxHBLSsk9JPZ1JkeU3tp
 KiQA==
X-Gm-Message-State: ACrzQf2CKFLrpwt50uqie8UyE9pIJL04640XpUBzTKVUerRciH/E3LwH
 yF+jrNRZvI7pS4EYCy164D23ralXmRcyWA==
X-Google-Smtp-Source: AMsMyM5lZ/gqW2jrFRm5Z/UOwk6atRhDKoNsBZUplDjI9uWi5kTS+kLln7F0nmEcDCcFxNKyuPamrA==
X-Received: by 2002:adf:e30f:0:b0:236:d8ef:9ede with SMTP id
 b15-20020adfe30f000000b00236d8ef9edemr15922883wrj.170.1667561724422; 
 Fri, 04 Nov 2022 04:35:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a5d4891000000b0023655e51c33sm3255743wrq.4.2022.11.04.04.35.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 04:35:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 6/7] target/arm: Honor HCR_E2H and HCR_TGE in ats_write64()
Date: Fri,  4 Nov 2022 11:35:14 +0000
Message-Id: <20221104113515.2278508-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104113515.2278508-1-peter.maydell@linaro.org>
References: <20221104113515.2278508-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Ake Koomsin <ake@igel.co.jp>

We need to check HCR_E2H and HCR_TGE to select the right MMU index for
the correct translation regime.

To check for EL2&0 translation regime:
- For S1E0*, S1E1* and S12E* ops, check both HCR_E2H and HCR_TGE
- For S1E2* ops, check only HCR_E2H

Signed-off-by: Ake Koomsin <ake@igel.co.jp>
Message-id: 20221101064250.12444-1-ake@igel.co.jp
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 077581187e7..d8c8223ec38 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3501,19 +3501,22 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
     MMUAccessType access_type = ri->opc2 & 1 ? MMU_DATA_STORE : MMU_DATA_LOAD;
     ARMMMUIdx mmu_idx;
     int secure = arm_is_secure_below_el3(env);
+    uint64_t hcr_el2 = arm_hcr_el2_eff(env);
+    bool regime_e20 = (hcr_el2 & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE);
 
     switch (ri->opc2 & 6) {
     case 0:
         switch (ri->opc1) {
         case 0: /* AT S1E1R, AT S1E1W, AT S1E1RP, AT S1E1WP */
             if (ri->crm == 9 && (env->pstate & PSTATE_PAN)) {
-                mmu_idx = ARMMMUIdx_Stage1_E1_PAN;
+                mmu_idx = regime_e20 ?
+                          ARMMMUIdx_E20_2_PAN : ARMMMUIdx_Stage1_E1_PAN;
             } else {
-                mmu_idx = ARMMMUIdx_Stage1_E1;
+                mmu_idx = regime_e20 ? ARMMMUIdx_E20_2 : ARMMMUIdx_Stage1_E1;
             }
             break;
         case 4: /* AT S1E2R, AT S1E2W */
-            mmu_idx = ARMMMUIdx_E2;
+            mmu_idx = hcr_el2 & HCR_E2H ? ARMMMUIdx_E20_2 : ARMMMUIdx_E2;
             break;
         case 6: /* AT S1E3R, AT S1E3W */
             mmu_idx = ARMMMUIdx_E3;
@@ -3524,13 +3527,13 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
         }
         break;
     case 2: /* AT S1E0R, AT S1E0W */
-        mmu_idx = ARMMMUIdx_Stage1_E0;
+        mmu_idx = regime_e20 ? ARMMMUIdx_E20_0 : ARMMMUIdx_Stage1_E0;
         break;
     case 4: /* AT S12E1R, AT S12E1W */
-        mmu_idx = ARMMMUIdx_E10_1;
+        mmu_idx = regime_e20 ? ARMMMUIdx_E20_2 : ARMMMUIdx_E10_1;
         break;
     case 6: /* AT S12E0R, AT S12E0W */
-        mmu_idx = ARMMMUIdx_E10_0;
+        mmu_idx = regime_e20 ? ARMMMUIdx_E20_0 : ARMMMUIdx_E10_0;
         break;
     default:
         g_assert_not_reached();
-- 
2.25.1


