Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D572F2DE4
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 12:29:59 +0100 (CET)
Received: from localhost ([::1]:55956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzHs6-0003Sp-T3
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 06:29:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kzHB2-0003bh-AS; Tue, 12 Jan 2021 05:45:28 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:56710
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kzHAr-0003Lc-AR; Tue, 12 Jan 2021 05:45:24 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 7711B601B4;
 Tue, 12 Jan 2021 11:45:12 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 04/19] target/arm: use arm_hcr_el2_eff() where applicable
Date: Tue, 12 Jan 2021 12:44:56 +0200
Message-Id: <20210112104511.36576-4-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <12681824.uLZWGnKmhe@basile.remlab.net>
References: <12681824.uLZWGnKmhe@basile.remlab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

This will simplify accessing HCR conditionally in secure state.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 26dcafbee1..2676d227bb 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4432,16 +4432,16 @@ static CPAccessResult aa64_cacheop_pou_access(CPUARMState *env,
 
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
@@ -9964,6 +9964,8 @@ static inline uint64_t regime_sctlr(CPUARMState *env, ARMMMUIdx mmu_idx)
 static inline bool regime_translation_disabled(CPUARMState *env,
                                                ARMMMUIdx mmu_idx)
 {
+    uint64_t hcr_el2;
+
     if (arm_feature(env, ARM_FEATURE_M)) {
         switch (env->v7m.mpu_ctrl[regime_is_secure(env, mmu_idx)] &
                 (R_V7M_MPU_CTRL_ENABLE_MASK | R_V7M_MPU_CTRL_HFNMIENA_MASK)) {
@@ -9982,19 +9984,21 @@ static inline bool regime_translation_disabled(CPUARMState *env,
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
@@ -10345,7 +10349,8 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
             fi->s1ptw = true;
             return ~0;
         }
-        if ((env->cp15.hcr_el2 & HCR_PTW) && (cacheattrs.attrs & 0xf0) == 0) {
+        if ((arm_hcr_el2_eff(env) & HCR_PTW) &&
+            (cacheattrs.attrs & 0xf0) == 0) {
             /*
              * PTW set and S1 walk touched S2 Device memory:
              * generate Permission fault.
@@ -10778,7 +10783,7 @@ static uint8_t convert_stage2_attrs(CPUARMState *env, uint8_t s2attrs)
     uint8_t hihint = 0, lohint = 0;
 
     if (hiattr != 0) { /* normal memory */
-        if ((env->cp15.hcr_el2 & HCR_CD) != 0) { /* cache disabled */
+        if (arm_hcr_el2_eff(env) & HCR_CD) { /* cache disabled */
             hiattr = loattr = 1; /* non-cacheable */
         } else {
             if (hiattr != 1) { /* Write-through or write-back */
@@ -12111,7 +12116,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
             }
 
             /* Combine the S1 and S2 cache attributes. */
-            if (env->cp15.hcr_el2 & HCR_DC) {
+            if (arm_hcr_el2_eff(env) & HCR_DC) {
                 /*
                  * HCR.DC forces the first stage attributes to
                  *  Normal Non-Shareable,
-- 
2.30.0


