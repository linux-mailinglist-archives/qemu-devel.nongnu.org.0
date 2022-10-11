Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F03355FAB37
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 05:34:30 +0200 (CEST)
Received: from localhost ([::1]:37186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oi62I-0001VD-36
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 23:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5nw-0002Rh-Mb
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 23:19:41 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:34761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5nq-00032t-BP
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 23:19:39 -0400
Received: by mail-pf1-x429.google.com with SMTP id f140so12377608pfa.1
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 20:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6arXbE/EfddoNglUvqf08geiApKNWyNMEO6HKIy2RZ8=;
 b=UQ3/bKlq6QNwuSl766Two0OG/oOgVkaKSElEd9wtUhToAhJM8pb3L/1Lg8vzS/cWrx
 Q3nMxCaTq7pLQ4Nax7XhTlbk6m1LaTGvmyMQPtkR8kDA+BFzlBqB/n7OIQ1yUjSjb5IQ
 8cFoh4iGvFhvV1RHH/VfQ5GzP4+b+xumi3gxf6WTqTLk3mwwFn0M4Vwf0IUBdC5MaDAA
 1Zb8mMOTbAfrf/29jzRjmCkvh1FcHCFeSM+ofhYV/m0c3/h4Sd0cvU4cihISOT8lxXZD
 Ap4W/UvonegqYQZpvQxv+dwsZg5mWd+pznzvc3goYyEpWuAo4Drwm7qCyzynPWXuALtV
 DWoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6arXbE/EfddoNglUvqf08geiApKNWyNMEO6HKIy2RZ8=;
 b=AzdeUtUpoeP53i54CYa8ezFaLiINw7PNUcRT6DY+OXj6NPCIoLQwvPMOoBrL/sDGiM
 cnvdvkXcYE4WRbUAcM5agYe9zMotwswHOIGiupxT0fLkJbUErUsXVYuFVQk+RGVlSv2m
 FXDZUxZJIBf5RvMYLaHvtvyaVU5FXqqU6sWIiJYzWTPH74uL5vY6GwHAe5x77fdI0+2M
 NRvDV0cqfcbPqupsfHtJRbaLhYBDjyLXQMQez+C+i0051HDPRSieKTX86R0uzwjvfSB3
 rp9mLWkxdL7pDoqHXkNtJh3+64ISc6W00tZqAvzXKouBCdCFGuDviO+4LMFUK3zcrAL5
 mjSA==
X-Gm-Message-State: ACrzQf0UQzfQs9xrxmQ5v7LLGbN+d8LFGRnQt9THHfxfItT/Oo66VhFO
 F14DBWe8VyZ3dduRouWTtqZgK/+w04Ddkw==
X-Google-Smtp-Source: AMsMyM6Xu7m3gopBpdBors2fsbiNORMnPRrIFykGhwiF1oHP5ITWAjz4iu+/Dcyhbt5iFv7BOkLaHA==
X-Received: by 2002:a05:6a00:88f:b0:52c:6962:274f with SMTP id
 q15-20020a056a00088f00b0052c6962274fmr23807965pfj.12.1665458372992; 
 Mon, 10 Oct 2022 20:19:32 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 o74-20020a62cd4d000000b0055f209690c0sm7663567pfg.50.2022.10.10.20.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 20:19:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 11/24] target/arm: Split out get_phys_addr_twostage
Date: Mon, 10 Oct 2022 20:18:58 -0700
Message-Id: <20221011031911.2408754-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011031911.2408754-1-richard.henderson@linaro.org>
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 191 +++++++++++++++++++++++++----------------------
 1 file changed, 100 insertions(+), 91 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 8f41d285b7..dd6556560a 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -31,6 +31,13 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
                                GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
     __attribute__((nonnull));
 
+static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
+                                      target_ulong address,
+                                      MMUAccessType access_type,
+                                      GetPhysAddrResult *result,
+                                      ARMMMUFaultInfo *fi)
+    __attribute__((nonnull));
+
 /* This mapping is common between ID_AA64MMFR0.PARANGE and TCR_ELx.{I}PS. */
 static const uint8_t pamax_map[] = {
     [0] = 32,
@@ -2428,6 +2435,94 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
     return 0;
 }
 
+static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
+                                   target_ulong address,
+                                   MMUAccessType access_type,
+                                   GetPhysAddrResult *result,
+                                   ARMMMUFaultInfo *fi)
+{
+    hwaddr ipa;
+    int s1_prot;
+    int ret;
+    bool is_secure = ptw->in_secure;
+    bool ipa_secure, s2walk_secure;
+    ARMCacheAttrs cacheattrs1;
+    bool is_el0;
+    uint64_t hcr;
+
+    ret = get_phys_addr_with_struct(env, ptw, address, access_type, result, fi);
+
+    /* If S1 fails or S2 is disabled, return early.  */
+    if (ret || regime_translation_disabled(env, ARMMMUIdx_Stage2, is_secure)) {
+        return ret;
+    }
+
+    ipa = result->f.phys_addr;
+    ipa_secure = result->f.attrs.secure;
+    if (is_secure) {
+        /* Select TCR based on the NS bit from the S1 walk. */
+        s2walk_secure = !(ipa_secure
+                          ? env->cp15.vstcr_el2 & VSTCR_SW
+                          : env->cp15.vtcr_el2 & VTCR_NSW);
+    } else {
+        assert(!ipa_secure);
+        s2walk_secure = false;
+    }
+
+    is_el0 = ptw->in_mmu_idx == ARMMMUIdx_Stage1_E0;
+    ptw->in_mmu_idx = s2walk_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
+    ptw->in_secure = s2walk_secure;
+
+    /*
+     * S1 is done, now do S2 translation.
+     * Save the stage1 results so that we may merge prot and cacheattrs later.
+     */
+    s1_prot = result->f.prot;
+    cacheattrs1 = result->cacheattrs;
+    memset(result, 0, sizeof(*result));
+
+    ret = get_phys_addr_lpae(env, ptw, ipa, access_type, is_el0, result, fi);
+    fi->s2addr = ipa;
+
+    /* Combine the S1 and S2 perms.  */
+    result->f.prot &= s1_prot;
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
+    /*
+     * Check if IPA translates to secure or non-secure PA space.
+     * Note that VSTCR overrides VTCR and {N}SW overrides {N}SA.
+     */
+    result->f.attrs.secure =
+        (is_secure
+         && !(env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW))
+         && (ipa_secure
+             || !(env->cp15.vtcr_el2 & (VTCR_NSA | VTCR_NSW))));
+
+    return 0;
+}
+
 static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
                                       target_ulong address,
                                       MMUAccessType access_type,
@@ -2441,99 +2536,13 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
     if (mmu_idx != s1_mmu_idx) {
         /*
          * Call ourselves recursively to do the stage 1 and then stage 2
-         * translations if mmu_idx is a two-stage regime.
+         * translations if mmu_idx is a two-stage regime, and EL2 present.
+         * Otherwise, a stage1+stage2 translation is just stage 1.
          */
+        ptw->in_mmu_idx = mmu_idx = s1_mmu_idx;
         if (arm_feature(env, ARM_FEATURE_EL2)) {
-            hwaddr ipa;
-            int s1_prot;
-            int ret;
-            bool ipa_secure, s2walk_secure;
-            ARMCacheAttrs cacheattrs1;
-            bool is_el0;
-            uint64_t hcr;
-
-            ptw->in_mmu_idx = s1_mmu_idx;
-            ret = get_phys_addr_with_struct(env, ptw, address, access_type,
-                                            result, fi);
-
-            /* If S1 fails or S2 is disabled, return early.  */
-            if (ret || regime_translation_disabled(env, ARMMMUIdx_Stage2,
-                                                   is_secure)) {
-                return ret;
-            }
-
-            ipa = result->f.phys_addr;
-            ipa_secure = result->f.attrs.secure;
-            if (is_secure) {
-                /* Select TCR based on the NS bit from the S1 walk. */
-                s2walk_secure = !(ipa_secure
-                                  ? env->cp15.vstcr_el2 & VSTCR_SW
-                                  : env->cp15.vtcr_el2 & VTCR_NSW);
-            } else {
-                assert(!ipa_secure);
-                s2walk_secure = false;
-            }
-
-            ptw->in_mmu_idx =
-                s2walk_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
-            ptw->in_secure = s2walk_secure;
-            is_el0 = mmu_idx == ARMMMUIdx_E10_0;
-
-            /*
-             * S1 is done, now do S2 translation.
-             * Save the stage1 results so that we may merge
-             * prot and cacheattrs later.
-             */
-            s1_prot = result->f.prot;
-            cacheattrs1 = result->cacheattrs;
-            memset(result, 0, sizeof(*result));
-
-            ret = get_phys_addr_lpae(env, ptw, ipa, access_type,
-                                     is_el0, result, fi);
-            fi->s2addr = ipa;
-
-            /* Combine the S1 and S2 perms.  */
-            result->f.prot &= s1_prot;
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
-            /*
-             * Check if IPA translates to secure or non-secure PA space.
-             * Note that VSTCR overrides VTCR and {N}SW overrides {N}SA.
-             */
-            result->f.attrs.secure =
-                (is_secure
-                 && !(env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW))
-                 && (ipa_secure
-                     || !(env->cp15.vtcr_el2 & (VTCR_NSA | VTCR_NSW))));
-
-            return 0;
-        } else {
-            /*
-             * For non-EL2 CPUs a stage1+stage2 translation is just stage 1.
-             */
-            mmu_idx = stage_1_mmu_idx(mmu_idx);
+            return get_phys_addr_twostage(env, ptw, address, access_type,
+                                          result, fi);
         }
     }
 
-- 
2.34.1


