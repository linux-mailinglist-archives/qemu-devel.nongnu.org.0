Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FB1575194
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 17:19:37 +0200 (CEST)
Received: from localhost ([::1]:53182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC0co-0007Z8-9P
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 11:19:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_trohmel@quicinc.com>)
 id 1oC0KR-0005qs-6W
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 11:00:35 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:15254)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_trohmel@quicinc.com>)
 id 1oC0KO-0007aE-4d
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 11:00:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657810832; x=1689346832;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rDDYPyAsKAP+4QMNBSGjqis1xptYRxkRlQgJvjG+XY4=;
 b=xrcYQBNllWDb5mPD23NacbcXb7rlXfW2yZg1FzRmHwk7M2wei0CSkXpQ
 q/5Cu4oJjgt6Xkx9bPi+rA9+fKWJstqaXBeWHaDESRmLQ0atjAQ2L9MO1
 hSIDW6Gwa5c6mJPezy431tkhrRIKZqfJcnZba6I+7gBvplq1C7qcB+F9t M=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 14 Jul 2022 07:54:25 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2022 07:54:25 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 14 Jul 2022 07:54:24 -0700
Received: from avd-de-lrx-6.eu.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 14 Jul 2022 07:54:23 -0700
From: Tobias Roehmel <quic_trohmel@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, =?UTF-8?q?Tobias=20R=C3=B6hmel?=
 <quic_trohmel@quicinc.com>
Subject: [PATCH 09/11] target/arm: Add PMSAv8r functionality
Date: Thu, 14 Jul 2022 16:53:53 +0200
Message-ID: <20220714145355.7225-10-quic_trohmel@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220714145355.7225-1-quic_trohmel@quicinc.com>
References: <20220714145355.7225-1-quic_trohmel@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
Received-SPF: pass client-ip=129.46.98.28;
 envelope-from=quic_trohmel@quicinc.com; helo=alexa-out.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Tobias Röhmel <quic_trohmel@quicinc.com>

Add PMSAv8r translation that is used by the ARM Cortex-R52.

Signed-off-by: Tobias Röhmel <quic_trohmel@quicinc.com>
---
 target/arm/ptw.c | 171 +++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 150 insertions(+), 21 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index c4f5721012..c7e37c66d0 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -140,6 +140,9 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx)
              */
             return true;
         }
+    } else if (arm_feature(env, ARM_FEATURE_V8_R)) {
+        return !(regime_sctlr(env, mmu_idx) & SCTLR_M) ||
+        (!(regime_el(env, mmu_idx) == 2) && arm_hcr_el2_eff(env) & HCR_TGE);
     }
 
     hcr_el2 = arm_hcr_el2_eff(env);
@@ -1504,6 +1507,8 @@ static bool pmsav7_use_background_region(ARMCPU *cpu, ARMMMUIdx mmu_idx,
     if (arm_feature(env, ARM_FEATURE_M)) {
         return env->v7m.mpu_ctrl[regime_is_secure(env, mmu_idx)]
             & R_V7M_MPU_CTRL_PRIVDEFENA_MASK;
+    } else if (arm_feature(env, ARM_FEATURE_V8_R)) {
+        return false;
     } else {
         return regime_sctlr(env, mmu_idx) & SCTLR_BR;
     }
@@ -1698,6 +1703,77 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
     return !(*prot & (1 << access_type));
 }
 
+static uint32_t *regime_rbar(CPUARMState *env, ARMMMUIdx mmu_idx,
+                             uint32_t secure)
+{
+    if (arm_feature(env, ARM_FEATURE_V8_R)) {
+        if (regime_el(env, mmu_idx) == 2) {
+            return env->pmsav8.hprbarn;
+        } else {
+            return env->pmsav8.prbarn;
+        }
+    } else {
+         return env->pmsav8.rbar[secure];
+    }
+}
+
+static uint32_t *regime_rlar(CPUARMState *env, ARMMMUIdx mmu_idx,
+                             uint32_t secure)
+{
+    if (arm_feature(env, ARM_FEATURE_V8_R)) {
+        if (regime_el(env, mmu_idx) == 2) {
+            return env->pmsav8.hprlarn;
+        } else {
+            return env->pmsav8.prlarn;
+        }
+    } else {
+        return env->pmsav8.rlar[secure];
+    }
+}
+
+static inline void get_phys_addr_pmsav8_default(CPUARMState *env,
+                                                ARMMMUIdx mmu_idx,
+                                                uint32_t address, int *prot)
+{
+    if (arm_feature(env, ARM_FEATURE_V8_R)) {
+        *prot = PAGE_READ | PAGE_WRITE;
+        if (address <= 0x7FFFFFFF) {
+            *prot |= PAGE_EXEC;
+        }
+        if ((regime_el(env, mmu_idx) == 2)
+            && (regime_sctlr(env, mmu_idx) & SCTLR_WXN)
+            && (regime_sctlr(env, mmu_idx) & SCTLR_M)) {
+            *prot &= ~PAGE_EXEC;
+        }
+    } else {
+        get_phys_addr_pmsav7_default(env, mmu_idx, address, prot);
+    }
+}
+
+static bool pmsav8_fault(bool hit, CPUARMState *env, ARMMMUIdx mmu_idx)
+{
+    if (arm_feature(env, ARM_FEATURE_V8_R)) {
+        if (regime_el(env, mmu_idx) == 2) {
+            if (!hit && (mmu_idx != ARMMMUIdx_E2)) {
+                return true;
+            } else if (!hit && (mmu_idx == ARMMMUIdx_E2)
+                       &&!(regime_sctlr(env, mmu_idx) & SCTLR_BR)) {
+                return true;
+            }
+        } else {
+            if (!hit && (mmu_idx != ARMMMUIdx_Stage1_E1)) {
+                return true;
+            } else if (!hit && (mmu_idx == ARMMMUIdx_Stage1_E1)
+                       &&!(regime_sctlr(env, mmu_idx) & SCTLR_BR)) {
+                return true;
+            }
+        }
+        return false;
+    } else {
+        return !hit;
+    }
+}
+
 bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
                        MMUAccessType access_type, ARMMMUIdx mmu_idx,
                        hwaddr *phys_ptr, MemTxAttrs *txattrs,
@@ -1730,6 +1806,12 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
         *mregion = -1;
     }
 
+    if (arm_feature(env, ARM_FEATURE_V8_R)) {
+        if (mmu_idx == ARMMMUIdx_Stage2) {
+            fi->stage2 = true;
+        }
+    }
+
     /*
      * Unlike the ARM ARM pseudocode, we don't need to check whether this
      * was an exception vector read from the vector table (which is always
@@ -1746,17 +1828,26 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
             hit = true;
         }
 
+        uint32_t bitmask;
+        if (arm_feature(env, ARM_FEATURE_V8_R)) {
+            bitmask = 0x3f;
+        } else {
+            bitmask = 0x1f;
+        }
+
+
         for (n = (int)cpu->pmsav7_dregion - 1; n >= 0; n--) {
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
@@ -1799,22 +1890,25 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
         }
     }
 
-    if (!hit) {
-        /* background fault */
-        fi->type = ARMFault_Background;
+    if (pmsav8_fault(hit, env, mmu_idx)) {
+        fi->type = ARMFault_Permission;
+        fi->level = 0;
         return true;
     }
 
     if (matchregion == -1) {
         /* hit using the background region */
-        get_phys_addr_pmsav7_default(env, mmu_idx, address, prot);
+        get_phys_addr_pmsav8_default(env, mmu_idx, address, prot);
     } else {
-        uint32_t ap = extract32(env->pmsav8.rbar[secure][matchregion], 1, 2);
-        uint32_t xn = extract32(env->pmsav8.rbar[secure][matchregion], 0, 1);
+        uint32_t ap = extract32(regime_rbar(env,
+                                mmu_idx, secure)[matchregion], 1, 2);
+        uint32_t xn = extract32(regime_rbar(env,
+                                mmu_idx, secure)[matchregion], 0, 1);
         bool pxn = false;
 
         if (arm_feature(env, ARM_FEATURE_V8_1M)) {
-            pxn = extract32(env->pmsav8.rlar[secure][matchregion], 4, 1);
+            pxn = extract32(regime_rlar(env,
+                            mmu_idx, secure)[matchregion], 4, 1);
         }
 
         if (m_is_system_region(env, address)) {
@@ -1822,14 +1916,42 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
             xn = 1;
         }
 
-        *prot = simple_ap_to_rw_prot(env, mmu_idx, ap);
+        if (arm_feature(env, ARM_FEATURE_V8_R)) {
+            if (regime_el(env, mmu_idx) == 2) {
+                *prot = simple_ap_to_rw_prot_is_user(ap,
+                                                mmu_idx != ARMMMUIdx_E2);
+            } else {
+                *prot = simple_ap_to_rw_prot_is_user(ap,
+                                                mmu_idx != ARMMMUIdx_Stage1_E1);
+            }
+
+            if (regime_sctlr(env, mmu_idx) & SCTLR_WXN
+                && (*prot & PAGE_WRITE)) {
+                xn = 0x1;
+            }
+
+            if ((regime_el(env, mmu_idx) == 1) && regime_sctlr(env, mmu_idx)
+                 & SCTLR_UWXN && (ap == 0x1)) {
+                xn = 0x1;
+            }
+
+            uint8_t attrindx = extract32(regime_rlar(env,
+                                         mmu_idx, secure)[matchregion], 1, 3);
+            uint64_t mair = env->cp15.mair_el[regime_el(env, mmu_idx)];
+            uint8_t sh = extract32(regime_rlar(env,
+                                   mmu_idx, secure)[matchregion], 3, 2);
+            assert(attrindx <= 4);
+            cacheattrs->is_s2_format = false;
+            cacheattrs->attrs = extract64(mair, attrindx * 8, 8);
+            cacheattrs->shareability = sh;
+        } else {
+            *prot = simple_ap_to_rw_prot(env, mmu_idx, ap);
+        }
+
         if (*prot && !xn && !(pxn && !is_user)) {
             *prot |= PAGE_EXEC;
         }
-        /*
-         * We don't need to look the attribute up in the MAIR0/MAIR1
-         * registers because that only tells us about cacheability.
-         */
+
         if (mregion) {
             *mregion = matchregion;
         }
@@ -2342,9 +2464,16 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
             is_el0 = mmu_idx == ARMMMUIdx_E10_0 || mmu_idx == ARMMMUIdx_SE10_0;
 
             /* S1 is done. Now do S2 translation.  */
-            ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx, is_el0,
-                                     phys_ptr, attrs, &s2_prot,
-                                     page_size, fi, &cacheattrs2);
+            if (arm_feature(env, ARM_FEATURE_V8_R)) {
+                ret = get_phys_addr_pmsav8(env, ipa, access_type, s2_mmu_idx,
+                                       phys_ptr, attrs, &s2_prot, page_size,
+                                       fi, &cacheattrs2);
+            } else {
+                ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx,
+                                      is_el0, phys_ptr, attrs, &s2_prot,
+                                      page_size, fi, &cacheattrs2);
+            }
+
             fi->s2addr = ipa;
             /* Combine the S1 and S2 perms.  */
             *prot &= s2_prot;
-- 
2.25.1


