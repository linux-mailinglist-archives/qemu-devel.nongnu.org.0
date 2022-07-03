Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEFE56462D
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 11:12:27 +0200 (CEST)
Received: from localhost ([::1]:57194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7veU-00082M-Hp
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 05:12:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzO-000145-4e
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:29:58 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:44825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzM-0006hp-5v
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:29:57 -0400
Received: by mail-pl1-x631.google.com with SMTP id l6so6005867plg.11
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XNrURcON7TIYKeGGNMcTizSaXpWHipL5ZGIPBDvwmUY=;
 b=eBlyHVsoGAdkQyWsp5iE3FqW09F/+4kZLk4Zqc9wZuD+ZcEAI4UvgXMeDRKpTiXsY0
 6ey1NtCYhwe4YyEQlwD4KJHcxKNy8Q/gOGWzpxrifN9TN48SJcIurrUamsuQwz9sj4YI
 NH0A1egQflaY52pkESNSUadjNFCBn7pewz4Ynwx6PUPqTZ44u2PgV/74l8HNzMkhTcDy
 t3+S/1KNm4pc7KPM7nFV4Vdww8El+g+uGJCZAE1uNCfuBhEYFqyhz07A4BmGT2J119og
 bePeDLJOc/vNmptpFygCHMdHdxkLYam71Ai1IeQafUabnodYrQa0ythcZDHdCPbe62e7
 QioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XNrURcON7TIYKeGGNMcTizSaXpWHipL5ZGIPBDvwmUY=;
 b=jvOpO/yoiCAnMv+2hgSBPwd/+8MV8PgFLubcgikVseNLbQM1HtZtiSD7EFy4YQ4nsS
 1Z0JVXsSKuJ5nq00FVzy9iEx1RuLwdZ3ha7L4Uk6YxbhDQs9fHkdA4xEQaN9TyhR7Itv
 OEebCiLsr90j86ERbwBLL6QiKOxb3FZNotkzDMfaVs3t+GIwM7EY6URuhrUjVqQtNFBY
 TExxkUZ4LfTGFB5cZ/sCZSW4xruXFn22bKvPME4WRlPg/r0i6gJLVhLxWOLm6HmHuybf
 9sJrnuegTAPxeaKemYwbGkNH96plfv0StClN66MMVe4BAfJ5seGysCqvwOM18t1bbb5v
 cXRg==
X-Gm-Message-State: AJIora/8jD4gSqKdO4KTysZYHrX/NATHQ88NKT2O9MsNZ3c9Fz9rNkwO
 dIp/F0Z/wPqbHy0dFxxR2hX/cRizoqVskOlR
X-Google-Smtp-Source: AGRyM1s1v13d4sXMEnhi8+sv5PHCwLyHPvXylgVIJgtuMoX9O5AGNiHOV0p/suRFFi4Kz1Qt9ZKqJg==
X-Received: by 2002:a17:90b:3784:b0:1ef:6b06:c4 with SMTP id
 mz4-20020a17090b378400b001ef6b0600c4mr8690326pjb.187.1656836994779; 
 Sun, 03 Jul 2022 01:29:54 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 g6-20020a1709026b4600b0016788487357sm18574523plt.132.2022.07.03.01.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:29:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 48/62] target/arm: Split out get_phys_addr_twostage
Date: Sun,  3 Jul 2022 13:54:05 +0530
Message-Id: <20220703082419.770989-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 182 +++++++++++++++++++++++++----------------------
 1 file changed, 96 insertions(+), 86 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 84d72ac249..993f015904 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2400,6 +2400,95 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
     return 0;
 }
 
+static bool get_phys_addr_twostage(CPUARMState *env, target_ulong address,
+                                   MMUAccessType access_type,
+                                   ARMMMUIdx s1_mmu_idx, bool is_secure,
+                                   GetPhysAddrResult *result,
+                                   ARMMMUFaultInfo *fi)
+{
+    hwaddr ipa;
+    int s1_prot;
+    int ret;
+    bool ipa_secure;
+    ARMCacheAttrs cacheattrs1;
+    ARMMMUIdx s2_mmu_idx;
+    bool is_el0;
+    uint64_t hcr;
+
+    ret = get_phys_addr_with_secure(env, address, access_type, s1_mmu_idx,
+                                    is_secure, result, fi);
+
+    /* If S1 fails, return early.  */
+    if (ret) {
+        return ret;
+    }
+
+    ipa = result->phys;
+    if (is_secure) {
+        /* Select TCR based on the NS bit from the S1 walk. */
+        ipa_secure = !(result->attrs.secure
+                       ? env->cp15.vstcr_el2.raw_tcr & VSTCR_SW
+                       : env->cp15.vtcr_el2.raw_tcr & VTCR_NSW);
+    } else {
+        ipa_secure = false;
+    }
+
+    s2_mmu_idx = (ipa_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2);
+    is_el0 = s1_mmu_idx == ARMMMUIdx_Stage1_E0;
+
+    /*
+     * S1 is done, now do S2 translation.
+     * Save the stage1 results so that we may merge
+     * prot and cacheattrs later.
+     */
+    s1_prot = result->prot;
+    cacheattrs1 = result->cacheattrs;
+    memset(result, 0, sizeof(*result));
+
+    ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx,
+                             ipa_secure, is_el0, result, fi);
+    fi->s2addr = ipa;
+
+    /* Combine the S1 and S2 perms.  */
+    result->prot &= s1_prot;
+
+    /* If S2 fails, return early.  */
+    if (ret) {
+        return ret;
+    }
+
+    /* Combine the S1 and S2 cache attributes. */
+    hcr = arm_hcr_el2_eff_secstate(env, is_secure);
+    if (hcr & HCR_DC) {
+        /*
+         * HCR.DC forces the first stage attributes to
+         *  Normal Non-Shareable,
+         *  Inner Write-Back Read-Allocate Write-Allocate,
+         *  Outer Write-Back Read-Allocate Write-Allocate.
+         * Do not overwrite Tagged within attrs.
+         */
+        if (cacheattrs1.attrs != 0xf0) {
+            cacheattrs1.attrs = 0xff;
+        }
+        cacheattrs1.shareability = 0;
+    }
+    result->cacheattrs = combine_cacheattrs(hcr, cacheattrs1,
+                                            result->cacheattrs);
+
+    /* Check if IPA translates to secure or non-secure PA space. */
+    if (is_secure) {
+        if (ipa_secure) {
+            result->attrs.secure =
+                !(env->cp15.vstcr_el2.raw_tcr & (VSTCR_SA | VSTCR_SW));
+        } else {
+            result->attrs.secure =
+                !((env->cp15.vtcr_el2.raw_tcr & (VTCR_NSA | VTCR_NSW)) ||
+                  (env->cp15.vstcr_el2.raw_tcr & (VSTCR_SA | VSTCR_SW)));
+        }
+    }
+    return 0;
+}
+
 /**
  * get_phys_addr - get the physical address for this virtual address
  *
@@ -2437,93 +2526,14 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
          */
         if (arm_feature(env, ARM_FEATURE_EL2) &&
             !regime_translation_disabled(env, ARMMMUIdx_Stage2, is_secure)) {
-            hwaddr ipa;
-            int s1_prot;
-            int ret;
-            bool ipa_secure;
-            ARMCacheAttrs cacheattrs1;
-            ARMMMUIdx s2_mmu_idx;
-            bool is_el0;
-            uint64_t hcr;
-
-            ret = get_phys_addr_with_secure(env, address, access_type,
-                                            s1_mmu_idx, is_secure, result, fi);
-
-            /* If S1 fails, return early.  */
-            if (ret) {
-                return ret;
-            }
-
-            ipa = result->phys;
-            if (is_secure) {
-                /* Select TCR based on the NS bit from the S1 walk. */
-                ipa_secure = !(result->attrs.secure
-                               ? env->cp15.vstcr_el2.raw_tcr & VSTCR_SW
-                               : env->cp15.vtcr_el2.raw_tcr & VTCR_NSW);
-            } else {
-                ipa_secure = false;
-            }
-
-            s2_mmu_idx = (ipa_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2);
-            is_el0 = mmu_idx == ARMMMUIdx_E10_0;
-
-            /*
-             * S1 is done, now do S2 translation.
-             * Save the stage1 results so that we may merge
-             * prot and cacheattrs later.
-             */
-            s1_prot = result->prot;
-            cacheattrs1 = result->cacheattrs;
-            memset(result, 0, sizeof(*result));
-
-            ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx,
-                                     ipa_secure, is_el0, result, fi);
-            fi->s2addr = ipa;
-
-            /* Combine the S1 and S2 perms.  */
-            result->prot &= s1_prot;
-
-            /* If S2 fails, return early.  */
-            if (ret) {
-                return ret;
-            }
-
-            /* Combine the S1 and S2 cache attributes. */
-            hcr = arm_hcr_el2_eff_secstate(env, is_secure);
-            if (hcr & HCR_DC) {
-                /*
-                 * HCR.DC forces the first stage attributes to
-                 *  Normal Non-Shareable,
-                 *  Inner Write-Back Read-Allocate Write-Allocate,
-                 *  Outer Write-Back Read-Allocate Write-Allocate.
-                 * Do not overwrite Tagged within attrs.
-                 */
-                if (cacheattrs1.attrs != 0xf0) {
-                    cacheattrs1.attrs = 0xff;
-                }
-                cacheattrs1.shareability = 0;
-            }
-            result->cacheattrs = combine_cacheattrs(hcr, cacheattrs1,
-                                                    result->cacheattrs);
-
-            /* Check if IPA translates to secure or non-secure PA space. */
-            if (is_secure) {
-                if (ipa_secure) {
-                    result->attrs.secure =
-                        !(env->cp15.vstcr_el2.raw_tcr & (VSTCR_SA | VSTCR_SW));
-                } else {
-                    result->attrs.secure =
-                        !((env->cp15.vtcr_el2.raw_tcr & (VTCR_NSA | VTCR_NSW))
-                        || (env->cp15.vstcr_el2.raw_tcr & (VSTCR_SA | VSTCR_SW)));
-                }
-            }
-            return 0;
-        } else {
-            /*
-             * For non-EL2 CPUs a stage1+stage2 translation is just stage 1.
-             */
-            mmu_idx = stage_1_mmu_idx(mmu_idx);
+            return get_phys_addr_twostage(env, address, access_type,
+                                          s1_mmu_idx, is_secure,
+                                          result, fi);
         }
+        /*
+         * For non-EL2 CPUs a stage1+stage2 translation is just stage 1.
+         */
+        mmu_idx = s1_mmu_idx;
     }
 
     /*
-- 
2.34.1


