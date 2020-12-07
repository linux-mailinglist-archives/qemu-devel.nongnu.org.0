Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4032D09DA
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 05:52:20 +0100 (CET)
Received: from localhost ([::1]:39056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1km8VX-0003tb-4K
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 23:52:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1km8Qk-0008Jp-Ub
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 23:47:22 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:39142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1km8Qh-00018X-Ph
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 23:47:22 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07732064|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.531916-0.000212585-0.467872;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047187; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=5; RT=5; SR=0; TI=SMTPD_---.J3tRDLu_1607316427; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.J3tRDLu_1607316427)
 by smtp.aliyun-inc.com(10.147.41.199);
 Mon, 07 Dec 2020 12:47:08 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] target/arm: adjust CPTR_EL2 according to HCR_EL2.E2H
Date: Mon,  7 Dec 2020 12:46:55 +0800
Message-Id: <20201207044655.2312-5-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201207044655.2312-1-zhiwei_liu@c-sky.com>
References: <20201207044655.2312-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org, richard.henderson@linaro.org,
 LIU Zhiwei <zhiwei_liu@c-sky.com>, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From DDI0487Fc_armv8_arm.pdf, the CPTR_EL2 has two kinds
of layouts according to HCR_EL2.E2H.

When HCR_EL2.E2H is 1, fp_exception_el should refer to
HCR_EL2.FPEN and sve_exception_el should refer to HCR_EL2.ZEN.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/arm/helper.c | 55 +++++++++++++++++++++++++++++++++++++--------
 1 file changed, 46 insertions(+), 9 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 38cd35c049..6cc9f2bb50 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6147,11 +6147,30 @@ int sve_exception_el(CPUARMState *env, int el)
      * they will be zero when EL2 is not present.
      */
     if (el <= 2 && !arm_is_secure_below_el3(env)) {
-        if (env->cp15.cptr_el[2] & CPTR_TZ) {
-            return 2;
-        }
-        if (env->cp15.cptr_el[2] & CPTR_TFP) {
-            return 0;
+        /* Since we exclude secure first, we may read HCR_EL2 directly. */
+        if (env->cp15.hcr_el2 & HCR_E2H) {
+            int zen = extract32(env->cp15.cptr_el[2], 16, 2);
+            switch (zen) {
+            case 0:
+            case 2:
+                return 2;
+            case 1:
+                if (env->cp15.hcr_el2 & HCR_TGE) {
+                    if (el == 0) {
+                        return 2;
+                    }
+                }
+                break;
+            case 3:
+                break;
+            }
+        } else {
+            if (env->cp15.cptr_el[2] & CPTR_TZ) {
+                return 2;
+            }
+            if (env->cp15.cptr_el[2] & CPTR_TFP) {
+                return 0;
+            }
         }
     }
 
@@ -12635,12 +12654,30 @@ int fp_exception_el(CPUARMState *env, int cur_el)
      */
 
     /* CPTR_EL2 : present in v7VE or v8 */
-    if (cur_el <= 2 && extract32(env->cp15.cptr_el[2], 10, 1)
-        && !arm_is_secure_below_el3(env)) {
+    if ((cur_el <= 2) && !arm_is_secure_below_el3(env)) {
         /* Trap FP ops at EL2, NS-EL1 or NS-EL0 to EL2 */
-        return 2;
+        if ((arm_hcr_el2_eff(env) & HCR_E2H) == HCR_E2H) {
+            int fpen = extract32(env->cp15.cptr_el[2], 20, 2);
+            switch (fpen) {
+            case 0:
+            case 2:
+                return 2;
+            case 1:
+                if ((arm_hcr_el2_eff(env) & HCR_TGE) == HCR_TGE) {
+                    if (cur_el == 0) {
+                        return 2;
+                    }
+                }
+                break;
+            case 3:
+                break;
+            }
+        } else {
+            if (extract32(env->cp15.cptr_el[2], 10, 1)) {
+                return 2;
+            }
+        }
     }
-
     /* CPTR_EL3 : present in v8 */
     if (extract32(env->cp15.cptr_el[3], 10, 1)) {
         /* Trap all FP ops to EL3 */
-- 
2.23.0


