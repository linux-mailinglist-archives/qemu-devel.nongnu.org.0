Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DFD65F263
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:17:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTM0-0000WB-GG; Thu, 05 Jan 2023 11:44:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTLy-0000Sr-GW
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:30 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTLu-0007My-G5
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:28 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 bi26-20020a05600c3d9a00b003d3404a89faso2535013wmb.1
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2hpQCTC8nGWhTVif5Vc0Cni0nOiQ1N1H86BSl5lGHtY=;
 b=Vm33gnULgSEbiU7G7P3KP/PiqYRBgKnQpK4MGLC9BNviCe2V2H/olJUXsfnGUZK4tH
 9jL5MX7rzZcxlnZG+0tOcODXdIZc5SpZb4211ewev17Tsl+clWPiMgvigRvEZfFdj/g3
 54YfFkJLRlgfwTyhbc7OoUkdGBYh81/eNVbwBRViLKojQkxNmFLwLFt8s1lCapZZSGvx
 FbgjpaKqJFrdXC8X4MrHFp4I5ZTWrRjKibXfoz0ZHkMBhx087+J7eJXo7QAmfEOv0XS6
 p5gP4zQS9DN+TSdo7NsUwjzyRfKLumHHEqSQ++wpz7DTjyRTB+HG2nMfe9eqos2PYG/S
 KqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2hpQCTC8nGWhTVif5Vc0Cni0nOiQ1N1H86BSl5lGHtY=;
 b=YEKwgtQ90H/iTqxq/HkNPDhBwQE9cqVEIKOocFfDjkKGMIsz3aWCpfR9BTXd9out4Q
 l2iucxXQ6vY0zeQTHWgUZCLsTycdfhNPp6ep4pMFkHxcW14NYdNR58VDdbm5990esdYX
 w7+f1G54O4okRVAJIxUql3D6jsOi+HMFHViM1O+jRWzZuyyGJjHj2+xyeEgt2wy4c94l
 OaYJIWpOMiVxemNIoTuOnRUsees0Gsa9cBIWmB13TB+xUO1QS0FvRiJ1q2mMmrV5Bxc7
 O2rV5a/us2ueRXS7s5z0JKy76ZckWVYANoGEtaLeH5w2wAC1JCfs9CF2SgEgOZ8bVyRw
 nGFA==
X-Gm-Message-State: AFqh2krIyl40s9PK0GrtXLwJwbMO9pvGXyCTKSS8LYfZIdK7N5QX/mzy
 EvTGMjXFs1e1TyTVJrELBUVntYrnPppkIqxu
X-Google-Smtp-Source: AMrXdXsQmRqcwlswN/gFuehVmKPz9hQmtvK8ID4BdtyXkvqFwG1bwTkx06hB/1kC0cBOBV1jZ9tVQA==
X-Received: by 2002:a05:600c:c06:b0:3d9:7065:5b9c with SMTP id
 fm6-20020a05600c0c0600b003d970655b9cmr31602205wmb.6.1672937065188; 
 Thu, 05 Jan 2023 08:44:25 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 hg9-20020a05600c538900b003cf71b1f66csm3055547wmb.0.2023.01.05.08.44.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:44:24 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/34] target/arm: Add PMSAv8r functionality
Date: Thu,  5 Jan 2023 16:43:50 +0000
Message-Id: <20230105164417.3994639-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105164417.3994639-1-peter.maydell@linaro.org>
References: <20230105164417.3994639-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>

Add PMSAv8r translation.

Signed-off-by: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20221206102504.165775-7-tobias.roehmel@rwth-aachen.de
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 126 ++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 104 insertions(+), 22 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 1c7c9cb5e37..4bda0590c7c 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1758,9 +1758,13 @@ static bool pmsav7_use_background_region(ARMCPU *cpu, ARMMMUIdx mmu_idx,
 
     if (arm_feature(env, ARM_FEATURE_M)) {
         return env->v7m.mpu_ctrl[is_secure] & R_V7M_MPU_CTRL_PRIVDEFENA_MASK;
-    } else {
-        return regime_sctlr(env, mmu_idx) & SCTLR_BR;
     }
+
+    if (mmu_idx == ARMMMUIdx_Stage2) {
+        return false;
+    }
+
+    return regime_sctlr(env, mmu_idx) & SCTLR_BR;
 }
 
 static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
@@ -1952,6 +1956,26 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
     return !(result->f.prot & (1 << access_type));
 }
 
+static uint32_t *regime_rbar(CPUARMState *env, ARMMMUIdx mmu_idx,
+                             uint32_t secure)
+{
+    if (regime_el(env, mmu_idx) == 2) {
+        return env->pmsav8.hprbar;
+    } else {
+        return env->pmsav8.rbar[secure];
+    }
+}
+
+static uint32_t *regime_rlar(CPUARMState *env, ARMMMUIdx mmu_idx,
+                             uint32_t secure)
+{
+    if (regime_el(env, mmu_idx) == 2) {
+        return env->pmsav8.hprlar;
+    } else {
+        return env->pmsav8.rlar[secure];
+    }
+}
+
 bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
                        MMUAccessType access_type, ARMMMUIdx mmu_idx,
                        bool secure, GetPhysAddrResult *result,
@@ -1974,6 +1998,13 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
     bool hit = false;
     uint32_t addr_page_base = address & TARGET_PAGE_MASK;
     uint32_t addr_page_limit = addr_page_base + (TARGET_PAGE_SIZE - 1);
+    int region_counter;
+
+    if (regime_el(env, mmu_idx) == 2) {
+        region_counter = cpu->pmsav8r_hdregion;
+    } else {
+        region_counter = cpu->pmsav7_dregion;
+    }
 
     result->f.lg_page_size = TARGET_PAGE_BITS;
     result->f.phys_addr = address;
@@ -1982,6 +2013,10 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
         *mregion = -1;
     }
 
+    if (mmu_idx == ARMMMUIdx_Stage2) {
+        fi->stage2 = true;
+    }
+
     /*
      * Unlike the ARM ARM pseudocode, we don't need to check whether this
      * was an exception vector read from the vector table (which is always
@@ -1998,17 +2033,26 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
             hit = true;
         }
 
-        for (n = (int)cpu->pmsav7_dregion - 1; n >= 0; n--) {
+        uint32_t bitmask;
+        if (arm_feature(env, ARM_FEATURE_M)) {
+            bitmask = 0x1f;
+        } else {
+            bitmask = 0x3f;
+            fi->level = 0;
+        }
+
+        for (n = region_counter - 1; n >= 0; n--) {
             /* region search */
             /*
-             * Note that the base address is bits [31:5] from the register
-             * with bits [4:0] all zeroes, but the limit address is bits
-             * [31:5] from the register with bits [4:0] all ones.
+             * Note that the base address is bits [31:x] from the register
+             * with bits [x-1:0] all zeroes, but the limit address is bits
+             * [31:x] from the register with bits [x:0] all ones. Where x is
+             * 5 for Cortex-M and 6 for Cortex-R
              */
-            uint32_t base = env->pmsav8.rbar[secure][n] & ~0x1f;
-            uint32_t limit = env->pmsav8.rlar[secure][n] | 0x1f;
+            uint32_t base = regime_rbar(env, mmu_idx, secure)[n] & ~bitmask;
+            uint32_t limit = regime_rlar(env, mmu_idx, secure)[n] | bitmask;
 
-            if (!(env->pmsav8.rlar[secure][n] & 0x1)) {
+            if (!(regime_rlar(env, mmu_idx, secure)[n] & 0x1)) {
                 /* Region disabled */
                 continue;
             }
@@ -2042,7 +2086,9 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
                  * PMSAv7 where highest-numbered-region wins)
                  */
                 fi->type = ARMFault_Permission;
-                fi->level = 1;
+                if (arm_feature(env, ARM_FEATURE_M)) {
+                    fi->level = 1;
+                }
                 return true;
             }
 
@@ -2052,8 +2098,11 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
     }
 
     if (!hit) {
-        /* background fault */
-        fi->type = ARMFault_Background;
+        if (arm_feature(env, ARM_FEATURE_M)) {
+            fi->type = ARMFault_Background;
+        } else {
+            fi->type = ARMFault_Permission;
+        }
         return true;
     }
 
@@ -2061,12 +2110,14 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
         /* hit using the background region */
         get_phys_addr_pmsav7_default(env, mmu_idx, address, &result->f.prot);
     } else {
-        uint32_t ap = extract32(env->pmsav8.rbar[secure][matchregion], 1, 2);
-        uint32_t xn = extract32(env->pmsav8.rbar[secure][matchregion], 0, 1);
+        uint32_t matched_rbar = regime_rbar(env, mmu_idx, secure)[matchregion];
+        uint32_t matched_rlar = regime_rlar(env, mmu_idx, secure)[matchregion];
+        uint32_t ap = extract32(matched_rbar, 1, 2);
+        uint32_t xn = extract32(matched_rbar, 0, 1);
         bool pxn = false;
 
         if (arm_feature(env, ARM_FEATURE_V8_1M)) {
-            pxn = extract32(env->pmsav8.rlar[secure][matchregion], 4, 1);
+            pxn = extract32(matched_rlar, 4, 1);
         }
 
         if (m_is_system_region(env, address)) {
@@ -2074,21 +2125,46 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
             xn = 1;
         }
 
-        result->f.prot = simple_ap_to_rw_prot(env, mmu_idx, ap);
+        if (regime_el(env, mmu_idx) == 2) {
+            result->f.prot = simple_ap_to_rw_prot_is_user(ap,
+                                            mmu_idx != ARMMMUIdx_E2);
+        } else {
+            result->f.prot = simple_ap_to_rw_prot(env, mmu_idx, ap);
+        }
+
+        if (!arm_feature(env, ARM_FEATURE_M)) {
+            uint8_t attrindx = extract32(matched_rlar, 1, 3);
+            uint64_t mair = env->cp15.mair_el[regime_el(env, mmu_idx)];
+            uint8_t sh = extract32(matched_rlar, 3, 2);
+
+            if (regime_sctlr(env, mmu_idx) & SCTLR_WXN &&
+                result->f.prot & PAGE_WRITE && mmu_idx != ARMMMUIdx_Stage2) {
+                xn = 0x1;
+            }
+
+            if ((regime_el(env, mmu_idx) == 1) &&
+                regime_sctlr(env, mmu_idx) & SCTLR_UWXN && ap == 0x1) {
+                pxn = 0x1;
+            }
+
+            result->cacheattrs.is_s2_format = false;
+            result->cacheattrs.attrs = extract64(mair, attrindx * 8, 8);
+            result->cacheattrs.shareability = sh;
+        }
+
         if (result->f.prot && !xn && !(pxn && !is_user)) {
             result->f.prot |= PAGE_EXEC;
         }
-        /*
-         * We don't need to look the attribute up in the MAIR0/MAIR1
-         * registers because that only tells us about cacheability.
-         */
+
         if (mregion) {
             *mregion = matchregion;
         }
     }
 
     fi->type = ARMFault_Permission;
-    fi->level = 1;
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        fi->level = 1;
+    }
     return !(result->f.prot & (1 << access_type));
 }
 
@@ -2649,7 +2725,13 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     cacheattrs1 = result->cacheattrs;
     memset(result, 0, sizeof(*result));
 
-    ret = get_phys_addr_lpae(env, ptw, ipa, access_type, is_el0, result, fi);
+    if (arm_feature(env, ARM_FEATURE_PMSA)) {
+        ret = get_phys_addr_pmsav8(env, ipa, access_type,
+                                   ptw->in_mmu_idx, is_secure, result, fi);
+    } else {
+        ret = get_phys_addr_lpae(env, ptw, ipa, access_type,
+                                 is_el0, result, fi);
+    }
     fi->s2addr = ipa;
 
     /* Combine the S1 and S2 perms.  */
-- 
2.25.1


