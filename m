Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E93152F2D68
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 12:08:02 +0100 (CET)
Received: from localhost ([::1]:45124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzHWm-0000vB-O9
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 06:07:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kzHAy-0003bE-G7; Tue, 12 Jan 2021 05:45:27 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:56712
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kzHAr-0003Lh-A5; Tue, 12 Jan 2021 05:45:23 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id B639760228;
 Tue, 12 Jan 2021 11:45:12 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 05/19] target/arm: factor MDCR_EL2 common handling
Date: Tue, 12 Jan 2021 12:44:57 +0200
Message-Id: <20210112104511.36576-5-remi.denis.courmont@huawei.com>
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

This adds a common helper to compute the effective value of MDCR_EL2.
That is the actual value if EL2 is enabled in the current security
context, or 0 elsewise.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2676d227bb..7860ccd7ae 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -538,6 +538,11 @@ static CPAccessResult access_trap_aa32s_el1(CPUARMState *env,
     return CP_ACCESS_TRAP_UNCATEGORIZED;
 }
 
+static uint64_t arm_mdcr_el2_eff(CPUARMState *env)
+{
+    return arm_is_el2_enabled(env) ? env->cp15.mdcr_el2 : 0;
+}
+
 /* Check for traps to "powerdown debug" registers, which are controlled
  * by MDCR.TDOSA
  */
@@ -545,11 +550,11 @@ static CPAccessResult access_tdosa(CPUARMState *env, const ARMCPRegInfo *ri,
                                    bool isread)
 {
     int el = arm_current_el(env);
-    bool mdcr_el2_tdosa = (env->cp15.mdcr_el2 & MDCR_TDOSA) ||
-        (env->cp15.mdcr_el2 & MDCR_TDE) ||
+    uint64_t mdcr_el2 = arm_mdcr_el2_eff(env);
+    bool mdcr_el2_tdosa = (mdcr_el2 & MDCR_TDOSA) || (mdcr_el2 & MDCR_TDE) ||
         (arm_hcr_el2_eff(env) & HCR_TGE);
 
-    if (el < 2 && mdcr_el2_tdosa && !arm_is_secure_below_el3(env)) {
+    if (el < 2 && mdcr_el2_tdosa) {
         return CP_ACCESS_TRAP_EL2;
     }
     if (el < 3 && (env->cp15.mdcr_el3 & MDCR_TDOSA)) {
@@ -565,11 +570,11 @@ static CPAccessResult access_tdra(CPUARMState *env, const ARMCPRegInfo *ri,
                                   bool isread)
 {
     int el = arm_current_el(env);
-    bool mdcr_el2_tdra = (env->cp15.mdcr_el2 & MDCR_TDRA) ||
-        (env->cp15.mdcr_el2 & MDCR_TDE) ||
+    uint64_t mdcr_el2 = arm_mdcr_el2_eff(env);
+    bool mdcr_el2_tdra = (mdcr_el2 & MDCR_TDRA) || (mdcr_el2 & MDCR_TDE) ||
         (arm_hcr_el2_eff(env) & HCR_TGE);
 
-    if (el < 2 && mdcr_el2_tdra && !arm_is_secure_below_el3(env)) {
+    if (el < 2 && mdcr_el2_tdra) {
         return CP_ACCESS_TRAP_EL2;
     }
     if (el < 3 && (env->cp15.mdcr_el3 & MDCR_TDA)) {
@@ -585,11 +590,11 @@ static CPAccessResult access_tda(CPUARMState *env, const ARMCPRegInfo *ri,
                                   bool isread)
 {
     int el = arm_current_el(env);
-    bool mdcr_el2_tda = (env->cp15.mdcr_el2 & MDCR_TDA) ||
-        (env->cp15.mdcr_el2 & MDCR_TDE) ||
+    uint64_t mdcr_el2 = arm_mdcr_el2_eff(env);
+    bool mdcr_el2_tda = (mdcr_el2 & MDCR_TDA) || (mdcr_el2 & MDCR_TDE) ||
         (arm_hcr_el2_eff(env) & HCR_TGE);
 
-    if (el < 2 && mdcr_el2_tda && !arm_is_secure_below_el3(env)) {
+    if (el < 2 && mdcr_el2_tda) {
         return CP_ACCESS_TRAP_EL2;
     }
     if (el < 3 && (env->cp15.mdcr_el3 & MDCR_TDA)) {
@@ -605,9 +610,9 @@ static CPAccessResult access_tpm(CPUARMState *env, const ARMCPRegInfo *ri,
                                  bool isread)
 {
     int el = arm_current_el(env);
+    uint64_t mdcr_el2 = arm_mdcr_el2_eff(env);
 
-    if (el < 2 && (env->cp15.mdcr_el2 & MDCR_TPM)
-        && !arm_is_secure_below_el3(env)) {
+    if (el < 2 && (mdcr_el2 & MDCR_TPM)) {
         return CP_ACCESS_TRAP_EL2;
     }
     if (el < 3 && (env->cp15.mdcr_el3 & MDCR_TPM)) {
@@ -1347,12 +1352,12 @@ static CPAccessResult pmreg_access(CPUARMState *env, const ARMCPRegInfo *ri,
      * trapping to EL2 or EL3 for other accesses.
      */
     int el = arm_current_el(env);
+    uint64_t mdcr_el2 = arm_mdcr_el2_eff(env);
 
     if (el == 0 && !(env->cp15.c9_pmuserenr & 1)) {
         return CP_ACCESS_TRAP;
     }
-    if (el < 2 && (env->cp15.mdcr_el2 & MDCR_TPM)
-        && !arm_is_secure_below_el3(env)) {
+    if (el < 2 && (mdcr_el2 & MDCR_TPM)) {
         return CP_ACCESS_TRAP_EL2;
     }
     if (el < 3 && (env->cp15.mdcr_el3 & MDCR_TPM)) {
@@ -1431,7 +1436,8 @@ static bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
     bool enabled, prohibited, filtered;
     bool secure = arm_is_secure(env);
     int el = arm_current_el(env);
-    uint8_t hpmn = env->cp15.mdcr_el2 & MDCR_HPMN;
+    uint64_t mdcr_el2 = arm_mdcr_el2_eff(env);
+    uint8_t hpmn = mdcr_el2 & MDCR_HPMN;
 
     if (!arm_feature(env, ARM_FEATURE_PMU)) {
         return false;
@@ -1441,13 +1447,13 @@ static bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
             (counter < hpmn || counter == 31)) {
         e = env->cp15.c9_pmcr & PMCRE;
     } else {
-        e = env->cp15.mdcr_el2 & MDCR_HPME;
+        e = mdcr_el2 & MDCR_HPME;
     }
     enabled = e && (env->cp15.c9_pmcnten & (1 << counter));
 
     if (!secure) {
         if (el == 2 && (counter < hpmn || counter == 31)) {
-            prohibited = env->cp15.mdcr_el2 & MDCR_HPMD;
+            prohibited = mdcr_el2 & MDCR_HPMD;
         } else {
             prohibited = false;
         }
-- 
2.30.0


