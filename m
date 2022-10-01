Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A905F1DF1
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 18:55:16 +0200 (CEST)
Received: from localhost ([::1]:59258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeflj-0002wv-8x
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 12:55:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefI1-0007sS-0P
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:33 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:38557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHy-0006Gl-Qb
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:32 -0400
Received: by mail-qk1-x734.google.com with SMTP id 3so4548441qka.5
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 09:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=jzDPmkcbyBXmgF7/UF+Ax8S2mqEsTchVghdM8qEDw1g=;
 b=YcOe+zxAKVqqfDB2Vk5t/EcrMCxvWZGj9U2j7aNJBWwpYBR6mcD3+P99zpEacXx6Gt
 TmUVKEzQQ9653BBWHbyZTB9d9zOjLzoTt+lQwZVPCxjApqLQ24Jz2TvFfPGsnD8WxZTD
 WccAnYq3yZ80BTwYmdwwEvje7pwRUSnnGIPwOW07OlHh0oD6JH4Vbn99ADpxYWdBxdXK
 TUy9Qw/QH8xgQAcs3B+kwivW1OyDL6K9by0G+VPDQU7rcDqXIuOolGwmWnZEbn+6yp6b
 6mAqwg8oJvGpfQyEflwXYXe0xgLPEK0eHuA/iA0ldxHW5/bZm1KP4yOodhHOHEVJ4CAc
 zrlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=jzDPmkcbyBXmgF7/UF+Ax8S2mqEsTchVghdM8qEDw1g=;
 b=bLUCfDeMNjcznv9TAKttGiMvg+fV1THlYNkHPA3Jw3W1YJYOmLYkXrgMz7vsfWSfaU
 MTJ9mp6tggN05e4RoUJqqdcZUgY2/I4M7TwxJ091WZS34hnvuYzXIuNPxi3w7Ug8/kyZ
 Af2CCVgJjivgrtdelFw6W27mTUhUXcuM2fXq603lvVCFKt1CgGqQUb+LnmqTD5IWg0mr
 RW0m0M5Jh3Uz/H1BsKe7cG1jq5QoZrZAMuiu6Jnfkxo5mNOL23M+ACQSNu8dZFFC8K+Z
 VkwHFilpmpLP9aJtrBzff1Hfg4EqhalM2ACn1v3UdcJY5f8LW1K9njTvnlUrWL7oQv/g
 txHQ==
X-Gm-Message-State: ACrzQf1zbqKT9i6pyUfRjWhcgFxt9eVGUfeX4bUouvYuqduri2GMjz9d
 m3v5m1TLZg0XVQJwHkVjdwDLiHT6inETdQ==
X-Google-Smtp-Source: AMsMyM77rEvDdbntB29FKG7OSUO637LvAUv5MWjjQZt54hJ39Y3OApOXc9E9qVJG76vFTkGOm1oF3w==
X-Received: by 2002:a05:620a:15d2:b0:6cf:2d38:9c0d with SMTP id
 o18-20020a05620a15d200b006cf2d389c0dmr9718953qkm.426.1664641470154; 
 Sat, 01 Oct 2022 09:24:30 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.24.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:24:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 28/42] target/arm: Split out get_phys_addr_twostage
Date: Sat,  1 Oct 2022 09:23:04 -0700
Message-Id: <20221001162318.153420-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x734.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 196 +++++++++++++++++++++++++----------------------
 1 file changed, 106 insertions(+), 90 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index ba496c3421..3f5733a237 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -21,6 +21,15 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
     __attribute__((nonnull));
 
+static bool get_phys_addr_with_secure_debug(CPUARMState *env,
+                                            target_ulong address,
+                                            MMUAccessType access_type,
+                                            ARMMMUIdx mmu_idx,
+                                            bool is_secure, bool debug,
+                                            GetPhysAddrResult *result,
+                                            ARMMMUFaultInfo *fi)
+    __attribute__((nonnull));
+
 /* This mapping is common between ID_AA64MMFR0.PARANGE and TCR_ELx.{I}PS. */
 static const uint8_t pamax_map[] = {
     [0] = 32,
@@ -2426,6 +2435,98 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
     return 0;
 }
 
+static bool get_phys_addr_twostage(CPUARMState *env, target_ulong address,
+                                   MMUAccessType access_type,
+                                   ARMMMUIdx s1_mmu_idx,
+                                   bool is_secure, bool debug,
+                                   GetPhysAddrResult *result,
+                                   ARMMMUFaultInfo *fi)
+{
+    hwaddr ipa;
+    int s1_prot;
+    int ret;
+    bool ipa_secure, s2walk_secure;
+    ARMCacheAttrs cacheattrs1;
+    ARMMMUIdx s2_mmu_idx;
+    bool is_el0;
+    uint64_t hcr;
+
+    ret = get_phys_addr_with_secure_debug(env, address, access_type,
+                                          s1_mmu_idx, is_secure, debug,
+                                          result, fi);
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
+    s2_mmu_idx = (s2walk_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2);
+    is_el0 = s1_mmu_idx == ARMMMUIdx_Stage1_E0;
+
+    /*
+     * S1 is done, now do S2 translation.
+     * Save the stage1 results so that we may merge prot and cacheattrs later.
+     */
+    s1_prot = result->f.prot;
+    cacheattrs1 = result->cacheattrs;
+    memset(result, 0, sizeof(*result));
+
+    ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx,
+                             s2walk_secure, is_el0, debug, result, fi);
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
+    /* Check if IPA translates to secure or non-secure PA space. */
+    if (is_secure) {
+        if (ipa_secure) {
+            result->f.attrs.secure =
+                !(env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW));
+        } else {
+            result->f.attrs.secure =
+                !((env->cp15.vtcr_el2 & (VTCR_NSA | VTCR_NSW))
+                || (env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW)));
+        }
+    }
+    return 0;
+}
+
 static bool get_phys_addr_with_secure_debug(CPUARMState *env,
                                             target_ulong address,
                                             MMUAccessType access_type,
@@ -2442,97 +2543,12 @@ static bool get_phys_addr_with_secure_debug(CPUARMState *env,
          * translations if mmu_idx is a two-stage regime.
          */
         if (arm_feature(env, ARM_FEATURE_EL2)) {
-            hwaddr ipa;
-            int s1_prot;
-            int ret;
-            bool ipa_secure, s2walk_secure;
-            ARMCacheAttrs cacheattrs1;
-            ARMMMUIdx s2_mmu_idx;
-            bool is_el0;
-            uint64_t hcr;
-
-            ret = get_phys_addr_with_secure(env, address, access_type,
-                                            s1_mmu_idx, is_secure, result, fi);
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
-            s2_mmu_idx = (s2walk_secure
-                          ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2);
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
-            ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx,
-                                     s2walk_secure, is_el0, debug, result, fi);
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
-            /* Check if IPA translates to secure or non-secure PA space. */
-            if (is_secure) {
-                if (ipa_secure) {
-                    result->f.attrs.secure =
-                        !(env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW));
-                } else {
-                    result->f.attrs.secure =
-                        !((env->cp15.vtcr_el2 & (VTCR_NSA | VTCR_NSW))
-                        || (env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW)));
-                }
-            }
-            return 0;
-        } else {
-            /*
-             * For non-EL2 CPUs a stage1+stage2 translation is just stage 1.
-             */
-            mmu_idx = stage_1_mmu_idx(mmu_idx);
+            return get_phys_addr_twostage(env, address, access_type,
+                                          s1_mmu_idx, is_secure, debug,
+                                          result, fi);
         }
+        /* For non-EL2 CPUs a stage1+stage2 translation is just stage 1. */
+        mmu_idx = s1_mmu_idx;
     }
 
     /*
-- 
2.34.1


