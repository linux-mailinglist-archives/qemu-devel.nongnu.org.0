Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B6456465B
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 11:16:31 +0200 (CEST)
Received: from localhost ([::1]:37804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7viQ-0005ki-66
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 05:16:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uz2-00087i-KX
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:29:36 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:34500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uz1-0006fB-1r
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:29:36 -0400
Received: by mail-pg1-x533.google.com with SMTP id g4so6276991pgc.1
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vLAvxSHjryBSlV/58LjYjX4bLoTG9g4zcCWg1cB7QP0=;
 b=AoeURa6S8yUYZOi6BuboAwkd6wJ1mXmBBI4tVMt4XJtnfRTzT+qNsYsQUzAC/E5CsO
 rDzRVF5SwSrNmk6UJ1IQ+Ld5SlsWoR8NhqzkPAvO7ZgpVwomWQAzkIZ5FpuyFfuld8dF
 ENnLvcll2XHSLi2COvJc7PCf1iyLA/ZXq7NQlaFOK36yvhAbAc5H070G7rM3+7OKPzWB
 vlWGC6yaG6LIVrXxCTDHLY2DWATdCnPgMXjFUzcx5Qg0PUKO9cBs7wIEIIS5w3ajS8sY
 Ufu/ixFZ6DJDWlKafRSK1wqg4gbnFH9NmmA+AHP5m6GtLKQUoU02aWW3MCjbSMrK1Me4
 4Dbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vLAvxSHjryBSlV/58LjYjX4bLoTG9g4zcCWg1cB7QP0=;
 b=o6Dp/nuNMNSbtTgE4NqKzzn4AynUB5KXDH0EZUSBD9sMZCG7FAAlQo/n9BoIhQ+fva
 is3B65L5Q9sR17jVqVHT82Jc4rgiSr+ezzBQmgLkj4Dv4slBD51gq2VRRR46TONdnPwi
 Yz6mrZNewIOahumJ1S7Mm698nritWSIh5f+y6Q0/2CAcTXL47Ky73/aNIWxm+owdkW/l
 PBRmnlEIVRwv89380OVoJ9ZKPr2g68PYP8i3Ngv5tMW5g6asyd4P2iV2KxMerkxwyxk/
 VwywWxt0JVZ5QyY20oQRXgWl05aXhj6873iMICdzbdqnsBXApWjZwUn8wk2lEcv0hqYA
 GG8w==
X-Gm-Message-State: AJIora++H8rSlBKleIihFQOJV7CUMUxgGEHytTi/LAdKwnCw9VbZxwpC
 80DYQU7YTqvveV8hxiDbTR12GwqHoGrfKSIC
X-Google-Smtp-Source: AGRyM1vCcqeiRPDWep2WyUZ+gaKKEhyGRSUKVEyogJMT5rS7bh9/r1MQp+dYAN0qCtZTinlpDrZytw==
X-Received: by 2002:a05:6a00:4211:b0:525:a57c:25c8 with SMTP id
 cd17-20020a056a00421100b00525a57c25c8mr30006357pfb.85.1656836973759; 
 Sun, 03 Jul 2022 01:29:33 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 g6-20020a1709026b4600b0016788487357sm18574523plt.132.2022.07.03.01.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:29:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 41/62] target/arm: Fix ATS12NSO* from S PL1
Date: Sun,  3 Jul 2022 13:53:58 +0530
Message-Id: <20220703082419.770989-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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

This has been broken since arm_hcr_el2_eff gained a check for
"el2 enabled" for Secure EL2.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index a760ab86c5..43a82c3c7f 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -146,7 +146,7 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
         }
     }
 
-    hcr_el2 = arm_hcr_el2_eff(env);
+    hcr_el2 = arm_hcr_el2_eff_secstate(env, is_secure);
 
     switch (mmu_idx) {
     case ARMMMUIdx_Stage2:
@@ -230,7 +230,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
             return ~0;
         }
 
-        hcr = arm_hcr_el2_eff(env);
+        hcr = arm_hcr_el2_eff_secstate(env, is_secure);
         if ((hcr & HCR_PTW) && ptw_attrs_are_device(hcr, s2.cacheattrs)) {
             /*
              * PTW set and S1 walk touched S2 Device memory:
@@ -2357,7 +2357,7 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
             }
 
             /* Combine the S1 and S2 cache attributes. */
-            hcr = arm_hcr_el2_eff(env);
+            hcr = arm_hcr_el2_eff_secstate(env, is_secure);
             if (hcr & HCR_DC) {
                 /*
                  * HCR.DC forces the first stage attributes to
@@ -2490,7 +2490,7 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
         result->page_size = TARGET_PAGE_SIZE;
 
         /* Fill in cacheattr a-la AArch64.TranslateAddressS1Off. */
-        hcr = arm_hcr_el2_eff(env);
+        hcr = arm_hcr_el2_eff_secstate(env, is_secure);
         result->cacheattrs.shareability = 0;
         result->cacheattrs.is_s2_format = false;
         if (hcr & HCR_DC) {
-- 
2.34.1


