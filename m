Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43744487D5A
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 20:55:30 +0100 (CET)
Received: from localhost ([::1]:39060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5vKh-0007zV-4g
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 14:55:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1n5uV6-0006lP-Oc; Fri, 07 Jan 2022 14:02:08 -0500
Received: from [201.28.113.2] (port=59912 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1n5uV5-0008Dy-4Q; Fri, 07 Jan 2022 14:02:08 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 7 Jan 2022 15:57:44 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 6007A8001D1;
 Fri,  7 Jan 2022 15:57:44 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 30/37] target/ppc: Refactor VSX_SCALAR_CMP_DP
Date: Fri,  7 Jan 2022 15:56:46 -0300
Message-Id: <20220107185653.1609775-31-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107185653.1609775-1-matheus.ferst@eldorado.org.br>
References: <20220107185653.1609775-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 07 Jan 2022 18:57:44.0685 (UTC)
 FILETIME=[746309D0:01D803F8]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 Victor Colombo <victor.colombo@eldorado.org.br>, clg@kaod.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Victor Colombo <victor.colombo@eldorado.org.br>

Refactor VSX_SCALAR_CMP_DP, changing its name to VSX_SCALAR_CMP and
prepare the helper to be used for quadword comparisons.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/fpu_helper.c | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index cd4e07ed5b..7c9fd1ac02 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2265,28 +2265,30 @@ VSX_MADDQ(XSNMSUBQP, NMSUB_FLGS, 0)
 VSX_MADDQ(XSNMSUBQPO, NMSUB_FLGS, 0)
 
 /*
- * VSX_SCALAR_CMP_DP - VSX scalar floating point compare double precision
+ * VSX_SCALAR_CMP - VSX scalar floating point compare
  *   op    - instruction mnemonic
+ *   tp    - type
  *   cmp   - comparison operation
  *   exp   - expected result of comparison
+ *   fld   - vsr_t field
  *   svxvc - set VXVC bit
  */
-#define VSX_SCALAR_CMP_DP(op, cmp, exp, svxvc)                                \
+#define VSX_SCALAR_CMP(op, tp, cmp, fld, exp, svxvc)                          \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                             \
                  ppc_vsr_t *xa, ppc_vsr_t *xb)                                \
 {                                                                             \
-    ppc_vsr_t t = *xt;                                                        \
+    ppc_vsr_t t = { };                                                        \
     bool vxsnan_flag = false, vxvc_flag = false, vex_flag = false;            \
                                                                               \
-    if (float64_is_signaling_nan(xa->VsrD(0), &env->fp_status) ||             \
-        float64_is_signaling_nan(xb->VsrD(0), &env->fp_status)) {             \
+    if (tp##_is_signaling_nan(xa->fld, &env->fp_status) ||                    \
+        tp##_is_signaling_nan(xb->fld, &env->fp_status)) {                    \
         vxsnan_flag = true;                                                   \
         if (fpscr_ve == 0 && svxvc) {                                         \
             vxvc_flag = true;                                                 \
         }                                                                     \
     } else if (svxvc) {                                                       \
-        vxvc_flag = float64_is_quiet_nan(xa->VsrD(0), &env->fp_status) ||     \
-            float64_is_quiet_nan(xb->VsrD(0), &env->fp_status);               \
+        vxvc_flag = tp##_is_quiet_nan(xa->fld, &env->fp_status) ||            \
+            tp##_is_quiet_nan(xb->fld, &env->fp_status);                      \
     }                                                                         \
     if (vxsnan_flag) {                                                        \
         float_invalid_op_vxsnan(env, GETPC());                                \
@@ -2297,23 +2299,18 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                             \
     vex_flag = fpscr_ve && (vxvc_flag || vxsnan_flag);                        \
                                                                               \
     if (!vex_flag) {                                                          \
-        if (float64_##cmp(xb->VsrD(0), xa->VsrD(0),                           \
-                          &env->fp_status) == exp) {                          \
-            t.VsrD(0) = -1;                                                   \
-            t.VsrD(1) = 0;                                                    \
-        } else {                                                              \
-            t.VsrD(0) = 0;                                                    \
-            t.VsrD(1) = 0;                                                    \
+        if (tp##_##cmp(xb->fld, xa->fld, &env->fp_status) == exp) {           \
+            memset(&t.fld, 0xFF, sizeof(t.fld));                              \
         }                                                                     \
     }                                                                         \
     *xt = t;                                                                  \
     do_float_check_status(env, GETPC());                                      \
 }
 
-VSX_SCALAR_CMP_DP(xscmpeqdp, eq, 1, 0)
-VSX_SCALAR_CMP_DP(xscmpgedp, le, 1, 1)
-VSX_SCALAR_CMP_DP(xscmpgtdp, lt, 1, 1)
-VSX_SCALAR_CMP_DP(xscmpnedp, eq, 0, 0)
+VSX_SCALAR_CMP(xscmpeqdp, float64, eq, VsrD(0), 1, 0)
+VSX_SCALAR_CMP(xscmpgedp, float64, le, VsrD(0), 1, 1)
+VSX_SCALAR_CMP(xscmpgtdp, float64, lt, VsrD(0), 1, 1)
+VSX_SCALAR_CMP(xscmpnedp, float64, eq, VsrD(0), 0, 1)
 
 void helper_xscmpexpdp(CPUPPCState *env, uint32_t opcode,
                        ppc_vsr_t *xa, ppc_vsr_t *xb)
-- 
2.25.1


