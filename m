Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6802FBAD1
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:14:16 +0100 (CET)
Received: from localhost ([::1]:55370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1shz-0001qf-N9
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:14:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sfA-0007TN-Qa
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:20 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:35996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sf4-0001Aj-Lt
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:20 -0500
Received: by mail-wr1-x42a.google.com with SMTP id 6so12801107wri.3
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+l1Hr42KLGkcuB8b1jbZ674E0CfvV0ncDX4HR0bqxqk=;
 b=OdubFu0Z+vwjgUNG3yoUzxsVy7JLZIKpJdxiWCE9Hqa5LMlgNEWL4kSufn+6KYbf3w
 V0QTbIqOmsaWzIRZp/fipquC5NQEZnGUidHq2V5e6JmQCqn/LQdVKvfpYBdFJCcqT9We
 ISh+Q+jlzgwwRozUiAkoCFe3LXk2u4vg8K4pFv3jyFZpRU0Et2qkLT7pvdo1u0EmYR4H
 Klltkzk52XhYH582YJM7jf3KWqxqgz4GLyxVmG1/JSp6XBV+PnXKQEy9721s8qSiI52n
 qgpnoHi5h00zU4DnOKw1mBuPDNY8fjo9hiJq86S7RENcTwgRUzlcgiNyaAEz6TLPRrx9
 8MWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+l1Hr42KLGkcuB8b1jbZ674E0CfvV0ncDX4HR0bqxqk=;
 b=h7Jo1CLqplV5j5mj+ji5gqQCY/SJowygiVTP10bIiq2wql1PdyyecUwQOqmkCnwr0h
 G8XRStzc93TS9KF+t9JEXglnkVMH7bLPBlGqoTi8feBUbi08BGlpAXM3O+fyx4h2JmR0
 GLftZV2kkJYgGwUq7xisJHzQ0+tOW7hMtAz1Jn1AAFWa1MsJ5mM3MiQZh5U5uv40yYAi
 MMrKbS/qHpQOAHHS57O5qafwu2zJgZYdBBz8e1B9vzsFVaMeOWt7jEjxKxWQ0/6dQyZV
 IGNG2VwNtSrP2qds0heerwBnac+eOjZdXDUbWG+vqwQQ+x7JyKFqZ66x/fc41QkKp4vK
 kNgg==
X-Gm-Message-State: AOAM533jsw55N80MVmYUgLJ7HYGWmoEi9suzp5lPj9uvScm6U/01xTOf
 g1Fg6dICqExC0yrD4qQ81pcLBupJ0RquyA==
X-Google-Smtp-Source: ABdhPJzybagJ9mxyn6oiyJiJ3W3wAViW0NrAF/CCGg9IQ9hBWOae6F3w3b7XUML2ISUsA8c3TtV0yA==
X-Received: by 2002:a05:6000:1565:: with SMTP id
 5mr4940543wrz.109.1611069072429; 
 Tue, 19 Jan 2021 07:11:12 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a184sm4843699wme.35.2021.01.19.07.11.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 07:11:11 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/33] target/arm: use arm_hcr_el2_eff() where applicable
Date: Tue, 19 Jan 2021 15:10:38 +0000
Message-Id: <20210119151104.16264-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210119151104.16264-1-peter.maydell@linaro.org>
References: <20210119151104.16264-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

This will simplify accessing HCR conditionally in secure state.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210112104511.36576-4-remi.denis.courmont@huawei.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index ae208ab00fa..30b4dde6ddf 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4433,16 +4433,16 @@ static CPAccessResult aa64_cacheop_pou_access(CPUARMState *env,
 
 static int vae1_tlbmask(CPUARMState *env)
 {
-    /* Since we exclude secure first, we may read HCR_EL2 directly. */
-    if (arm_is_secure_below_el3(env)) {
-        return ARMMMUIdxBit_SE10_1 |
-               ARMMMUIdxBit_SE10_1_PAN |
-               ARMMMUIdxBit_SE10_0;
-    } else if ((env->cp15.hcr_el2 & (HCR_E2H | HCR_TGE))
-               == (HCR_E2H | HCR_TGE)) {
+    uint64_t hcr = arm_hcr_el2_eff(env);
+
+    if ((hcr & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE)) {
         return ARMMMUIdxBit_E20_2 |
                ARMMMUIdxBit_E20_2_PAN |
                ARMMMUIdxBit_E20_0;
+    } else if (arm_is_secure_below_el3(env)) {
+        return ARMMMUIdxBit_SE10_1 |
+               ARMMMUIdxBit_SE10_1_PAN |
+               ARMMMUIdxBit_SE10_0;
     } else {
         return ARMMMUIdxBit_E10_1 |
                ARMMMUIdxBit_E10_1_PAN |
@@ -9965,6 +9965,8 @@ static inline uint64_t regime_sctlr(CPUARMState *env, ARMMMUIdx mmu_idx)
 static inline bool regime_translation_disabled(CPUARMState *env,
                                                ARMMMUIdx mmu_idx)
 {
+    uint64_t hcr_el2;
+
     if (arm_feature(env, ARM_FEATURE_M)) {
         switch (env->v7m.mpu_ctrl[regime_is_secure(env, mmu_idx)] &
                 (R_V7M_MPU_CTRL_ENABLE_MASK | R_V7M_MPU_CTRL_HFNMIENA_MASK)) {
@@ -9983,19 +9985,21 @@ static inline bool regime_translation_disabled(CPUARMState *env,
         }
     }
 
+    hcr_el2 = arm_hcr_el2_eff(env);
+
     if (mmu_idx == ARMMMUIdx_Stage2) {
         /* HCR.DC means HCR.VM behaves as 1 */
-        return (env->cp15.hcr_el2 & (HCR_DC | HCR_VM)) == 0;
+        return (hcr_el2 & (HCR_DC | HCR_VM)) == 0;
     }
 
-    if (env->cp15.hcr_el2 & HCR_TGE) {
+    if (hcr_el2 & HCR_TGE) {
         /* TGE means that NS EL0/1 act as if SCTLR_EL1.M is zero */
         if (!regime_is_secure(env, mmu_idx) && regime_el(env, mmu_idx) == 1) {
             return true;
         }
     }
 
-    if ((env->cp15.hcr_el2 & HCR_DC) && arm_mmu_idx_is_stage1_of_2(mmu_idx)) {
+    if ((hcr_el2 & HCR_DC) && arm_mmu_idx_is_stage1_of_2(mmu_idx)) {
         /* HCR.DC means SCTLR_EL1.M behaves as 0 */
         return true;
     }
@@ -10346,7 +10350,8 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
             fi->s1ptw = true;
             return ~0;
         }
-        if ((env->cp15.hcr_el2 & HCR_PTW) && (cacheattrs.attrs & 0xf0) == 0) {
+        if ((arm_hcr_el2_eff(env) & HCR_PTW) &&
+            (cacheattrs.attrs & 0xf0) == 0) {
             /*
              * PTW set and S1 walk touched S2 Device memory:
              * generate Permission fault.
@@ -10779,7 +10784,7 @@ static uint8_t convert_stage2_attrs(CPUARMState *env, uint8_t s2attrs)
     uint8_t hihint = 0, lohint = 0;
 
     if (hiattr != 0) { /* normal memory */
-        if ((env->cp15.hcr_el2 & HCR_CD) != 0) { /* cache disabled */
+        if (arm_hcr_el2_eff(env) & HCR_CD) { /* cache disabled */
             hiattr = loattr = 1; /* non-cacheable */
         } else {
             if (hiattr != 1) { /* Write-through or write-back */
@@ -12112,7 +12117,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
             }
 
             /* Combine the S1 and S2 cache attributes. */
-            if (env->cp15.hcr_el2 & HCR_DC) {
+            if (arm_hcr_el2_eff(env) & HCR_DC) {
                 /*
                  * HCR.DC forces the first stage attributes to
                  *  Normal Non-Shareable,
-- 
2.20.1


