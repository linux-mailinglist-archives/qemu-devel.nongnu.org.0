Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD84359C5DA
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 20:14:13 +0200 (CEST)
Received: from localhost ([::1]:48056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQBwC-0008RL-Qq
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 14:14:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Ox-0004lS-LH
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:45 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:38852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Ol-0001el-5f
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:39 -0400
Received: by mail-pg1-x535.google.com with SMTP id r22so9693474pgm.5
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=WjSL4eHObvEK6R8buP8RA9WVWUFZ8A0DbOMp8emchq4=;
 b=Bys5Do7cxUe2p1MZvkRSx5TDz6e3A9lB3BRLuHwpddiXJUgB+PccQfZPX/fM905QiH
 4FC6WtdVM2BWVcVTav4psv0PjwuYpD2MIe0PXhXwHH+sxdjOQApoIqZSs2Hp6HHDGGxS
 rUCan6tKH3w0UPI77LJV+Att8YlaeXNwwTgm99iLJD94xJKmhe3oQSBd8apF3V8n1tA4
 127tNtWpEU2ykf7Uitf/hgVLVyLRuHa8N7F/nt0EsGF3pZz6p3Z24gbo9N8P11VQJNDo
 mp9LoNrG0RIfz1fh7SxlG0Am4tYqCvD+Y1ss9z1kNUJcfjCuWIzU1ZGMyPdgyk9+Ha7U
 noDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=WjSL4eHObvEK6R8buP8RA9WVWUFZ8A0DbOMp8emchq4=;
 b=sTXdGJyWqvviYh0m2BXkVGlEbsmhy9IfvwsGuP4+W/wDIE5VPisIgHrYdsNdTk5bSj
 36uBk+WpRUsjUBCHRK4qgw0KxVCmAiquzRzqRb5y9JiQrzp5pw1Eh+56W1m9pVrXKQNJ
 fNHl52h1XnK3x/G53fZonUjN1YjdqAFeRKUYHS4aKp45oOgcKe9QZ0Ey/2tnsiGhLoc9
 xyOe6jfUv8uxGPoQhnh9p01hx9dwl7k3ndWBmKjlptDmuBOEJgeOjSv/yWtp8TVHF2dx
 EF8f/flnrfWguz3gSXat/trhXTsfvv9/psfOWLSYSHNoxlsoOgsZlKdLtY6MiVt+ogBF
 nKXg==
X-Gm-Message-State: ACgBeo3IdzDe4rUnYOmkmAc7XwAtsiuabHCi/vI+Fklca0ZAmSN5yvrm
 czqnV5PIi0YBh4THJHO6vxHVZfIBupcIqw==
X-Google-Smtp-Source: AA6agR68PcQac6vDJ/EmHx1YduaqYkqMfn1ENsa8GFJwZ/nnkIQQHR8MVMhBX540g9IMCGQlH0eQaw==
X-Received: by 2002:a63:134d:0:b0:42a:9680:29d7 with SMTP id
 13-20020a63134d000000b0042a968029d7mr7109030pgt.249.1661182288660; 
 Mon, 22 Aug 2022 08:31:28 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 i6-20020a17090a3d8600b001f262f6f717sm10353835pjc.3.2022.08.22.08.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:31:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 52/66] target/arm: Split out get_phys_addr_twostage
Date: Mon, 22 Aug 2022 08:27:27 -0700
Message-Id: <20220822152741.1617527-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
index d9daaf7536..e13a8442c5 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2404,6 +2404,95 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
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
+    ipa = result->f.phys_addr;
+    if (is_secure) {
+        /* Select TCR based on the NS bit from the S1 walk. */
+        ipa_secure = !(result->f.attrs.secure
+                       ? env->cp15.vstcr_el2 & VSTCR_SW
+                       : env->cp15.vtcr_el2 & VTCR_NSW);
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
+    s1_prot = result->f.prot;
+    cacheattrs1 = result->cacheattrs;
+    memset(result, 0, sizeof(*result));
+
+    ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx,
+                             ipa_secure, is_el0, result, fi);
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
 /**
  * get_phys_addr - get the physical address for this virtual address
  *
@@ -2441,93 +2530,14 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
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
-            ipa = result->f.phys_addr;
-            if (is_secure) {
-                /* Select TCR based on the NS bit from the S1 walk. */
-                ipa_secure = !(result->f.attrs.secure
-                               ? env->cp15.vstcr_el2 & VSTCR_SW
-                               : env->cp15.vtcr_el2 & VTCR_NSW);
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
-            s1_prot = result->f.prot;
-            cacheattrs1 = result->cacheattrs;
-            memset(result, 0, sizeof(*result));
-
-            ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx,
-                                     ipa_secure, is_el0, result, fi);
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


