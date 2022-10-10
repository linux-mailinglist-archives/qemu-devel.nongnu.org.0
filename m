Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B229C5FA08D
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 16:53:58 +0200 (CEST)
Received: from localhost ([::1]:57950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohuAH-0006o0-PC
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 10:53:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtl4-0006Ox-NM
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:27:54 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtl3-0005aa-4v
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:27:54 -0400
Received: by mail-wr1-x433.google.com with SMTP id n12so17285157wrp.10
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 07:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=I9U26+V5C/CkK7B8UL55/rDbIxkmkXtApVD0MXqZAlI=;
 b=KnFvsa0HE+CDYRZNIPeB5LeupDsanlgw7O/1Q7EpMLvyTs/MEktXQohZlqzVWLZdu+
 gJxv/1TZHTnmHiba+ZLjM0mvR7B3Jn4NAXLl0+Em39gUdw62ZDlo7FIqB3WpDA/0Qt0m
 5oMhQpR61RsmEI5u2slNu2tk/XoQtSogBaOBTkVP0A2i4WpEGLutD9snG0qonQNycD37
 LJUEkwa72WH9DtZP1qIH8irv9rryRvM+S4kFo/0bsKIAYLZMndfM1yBxkpdPdrQn96iL
 HaGAxlu7qE0VHSNr/5EBk56s6nBnjEDVzdyxYBr0Tjb5o3ieL/cBSb+hK4b/fD5L6lJM
 9pVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I9U26+V5C/CkK7B8UL55/rDbIxkmkXtApVD0MXqZAlI=;
 b=fxvvQ/wVmId1Ta73o1rs64Guck5FUrn7RaDaAQ0FeF7RDo9LwzijwHgsFf5jjjBbrF
 dBP57RJ6UJEpIsfOTqgiftbpEfN9n0449bujMeRyUSllfCjkPxkR82cmpiCjmmvi+t5q
 8cHsumw9G6gx3SEi2+3f1Di7i7MP76vl3LPZhLqiGlX/2b5lNFovtZhvUOhZtqcUnFl5
 cYDmjMltAtWkpTr1o/Yg5QWkSxkZjDmIOrNGemNoxoCK3ci8iV5TRJr8mTR59TTEne7b
 a4G2kofn8V3G/2oVm8jHCJcPl1Q4dXcCCnYmYrff9Y42UkM3nvs3qCQslnavzQFoOzGZ
 QBRQ==
X-Gm-Message-State: ACrzQf3coXLbnPHEKb/orVWQ7A2Ub7hYZ5uEnp9tDuvBoMzeH1XPAa7f
 g565229bGfIQSLKrxEMiQLCrtBDQGePJSw==
X-Google-Smtp-Source: AMsMyM7YNd8T6ySGE8XYs011pNiqGreU8rDOHpAsQPeGF/31/bZ26WUjQjiimXFy8E09e/fF4HNkYQ==
X-Received: by 2002:a5d:47a6:0:b0:22e:7c73:feb2 with SMTP id
 6-20020a5d47a6000000b0022e7c73feb2mr11572755wrb.715.1665412071529; 
 Mon, 10 Oct 2022 07:27:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adfed46000000b0022e04bfa661sm9037054wro.59.2022.10.10.07.27.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 07:27:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/28] target/arm: Hoist read of *is_secure in S1_ptw_translate
Date: Mon, 10 Oct 2022 15:27:20 +0100
Message-Id: <20221010142730.502083-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010142730.502083-1-peter.maydell@linaro.org>
References: <20221010142730.502083-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

Rename the argument to is_secure_ptr, and introduce a
local variable is_secure with the value.  We only write
back to the pointer toward the end of the function.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221001162318.153420-15-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index b3e0db19369..b40b4586f87 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -207,24 +207,25 @@ static bool ptw_attrs_are_device(CPUARMState *env, ARMCacheAttrs cacheattrs)
 
 /* Translate a S1 pagetable walk through S2 if needed.  */
 static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
-                               hwaddr addr, bool *is_secure,
+                               hwaddr addr, bool *is_secure_ptr,
                                ARMMMUFaultInfo *fi)
 {
-    ARMMMUIdx s2_mmu_idx = *is_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
+    bool is_secure = *is_secure_ptr;
+    ARMMMUIdx s2_mmu_idx = is_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
 
     if (arm_mmu_idx_is_stage1_of_2(mmu_idx) &&
-        !regime_translation_disabled(env, s2_mmu_idx, *is_secure)) {
+        !regime_translation_disabled(env, s2_mmu_idx, is_secure)) {
         GetPhysAddrResult s2 = {};
         int ret;
 
         ret = get_phys_addr_lpae(env, addr, MMU_DATA_LOAD, s2_mmu_idx,
-                                 *is_secure, false, &s2, fi);
+                                 is_secure, false, &s2, fi);
         if (ret) {
             assert(fi->type != ARMFault_None);
             fi->s2addr = addr;
             fi->stage2 = true;
             fi->s1ptw = true;
-            fi->s1ns = !*is_secure;
+            fi->s1ns = !is_secure;
             return ~0;
         }
         if ((arm_hcr_el2_eff(env) & HCR_PTW) &&
@@ -237,19 +238,20 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
             fi->s2addr = addr;
             fi->stage2 = true;
             fi->s1ptw = true;
-            fi->s1ns = !*is_secure;
+            fi->s1ns = !is_secure;
             return ~0;
         }
 
         if (arm_is_secure_below_el3(env)) {
             /* Check if page table walk is to secure or non-secure PA space. */
-            if (*is_secure) {
-                *is_secure = !(env->cp15.vstcr_el2 & VSTCR_SW);
+            if (is_secure) {
+                is_secure = !(env->cp15.vstcr_el2 & VSTCR_SW);
             } else {
-                *is_secure = !(env->cp15.vtcr_el2 & VTCR_NSW);
+                is_secure = !(env->cp15.vtcr_el2 & VTCR_NSW);
             }
+            *is_secure_ptr = is_secure;
         } else {
-            assert(!*is_secure);
+            assert(!is_secure);
         }
 
         addr = s2.phys;
-- 
2.25.1


