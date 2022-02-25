Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E829A4C51F2
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 00:12:13 +0100 (CET)
Received: from localhost ([::1]:50810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNjky-0000pq-HM
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 18:12:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nNhxY-0000XY-Iz; Fri, 25 Feb 2022 16:17:05 -0500
Received: from [187.72.171.209] (port=58124 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nNhxX-0004qx-3R; Fri, 25 Feb 2022 16:17:04 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 25 Feb 2022 18:09:59 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id C12578001D1;
 Fri, 25 Feb 2022 18:09:58 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v5 40/49] target/ppc: Refactor VSX_SCALAR_CMP_DP
Date: Fri, 25 Feb 2022 18:09:27 -0300
Message-Id: <20220225210936.1749575-41-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
References: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Feb 2022 21:09:59.0139 (UTC)
 FILETIME=[0BEE6330:01D82A8C]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 clg@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Víctor Colombo <victor.colombo@eldorado.org.br>

Refactor VSX_SCALAR_CMP_DP, changing its name to VSX_SCALAR_CMP and
prepare the helper to be used for quadword comparisons.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
changes for v5:
- Improve refactor as suggested by Richard Henderson
---
 target/ppc/fpu_helper.c | 66 +++++++++++++++++++----------------------
 1 file changed, 30 insertions(+), 36 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 9b034d1fe4..bbd54b2d9c 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2265,54 +2265,48 @@ VSX_MADDQ(XSNMSUBQP, NMSUB_FLGS, 0)
 VSX_MADDQ(XSNMSUBQPO, NMSUB_FLGS, 0)
 
 /*
- * VSX_SCALAR_CMP_DP - VSX scalar floating point compare double precision
+ * VSX_SCALAR_CMP - VSX scalar floating point compare
  *   op    - instruction mnemonic
+ *   tp    - type
  *   cmp   - comparison operation
- *   exp   - expected result of comparison
+ *   fld   - vsr_t field
  *   svxvc - set VXVC bit
  */
-#define VSX_SCALAR_CMP_DP(op, cmp, exp, svxvc)                                \
-void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                             \
-                 ppc_vsr_t *xa, ppc_vsr_t *xb)                                \
+#define VSX_SCALAR_CMP(op, tp, cmp, fld, svxvc)                               \
+        void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                     \
+                ppc_vsr_t *xa, ppc_vsr_t *xb)                                 \
 {                                                                             \
-    ppc_vsr_t t = *xt;                                                        \
-    bool vxsnan_flag = false, vxvc_flag = false, vex_flag = false;            \
+    int flags;                                                                \
+    bool r, vxvc;                                                             \
                                                                               \
-    if (float64_is_signaling_nan(xa->VsrD(0), &env->fp_status) ||             \
-        float64_is_signaling_nan(xb->VsrD(0), &env->fp_status)) {             \
-        vxsnan_flag = true;                                                   \
-        if (fpscr_ve == 0 && svxvc) {                                         \
-            vxvc_flag = true;                                                 \
+    helper_reset_fpstatus(env);                                               \
+                                                                              \
+    if (svxvc) {                                                              \
+        r = tp##_##cmp(xb->fld, xa->fld, &env->fp_status);                    \
+    } else {                                                                  \
+        r = tp##_##cmp##_quiet(xb->fld, xa->fld, &env->fp_status);            \
+    }                                                                         \
+                                                                              \
+    flags = get_float_exception_flags(&env->fp_status);                       \
+    if (unlikely(flags & float_flag_invalid)) {                               \
+        vxvc = svxvc;                                                         \
+        if (flags & float_flag_invalid_snan) {                                \
+            float_invalid_op_vxsnan(env, GETPC());                            \
+            vxvc &= fpscr_ve == 0;                                            \
         }                                                                     \
-    } else if (svxvc) {                                                       \
-        vxvc_flag = float64_is_quiet_nan(xa->VsrD(0), &env->fp_status) ||     \
-            float64_is_quiet_nan(xb->VsrD(0), &env->fp_status);               \
-    }                                                                         \
-    if (vxsnan_flag) {                                                        \
-        float_invalid_op_vxsnan(env, GETPC());                                \
-    }                                                                         \
-    if (vxvc_flag) {                                                          \
-        float_invalid_op_vxvc(env, 0, GETPC());                               \
-    }                                                                         \
-    vex_flag = fpscr_ve && (vxvc_flag || vxsnan_flag);                        \
-                                                                              \
-    if (!vex_flag) {                                                          \
-        if (float64_##cmp(xb->VsrD(0), xa->VsrD(0),                           \
-                          &env->fp_status) == exp) {                          \
-            t.VsrD(0) = -1;                                                   \
-            t.VsrD(1) = 0;                                                    \
-        } else {                                                              \
-            t.VsrD(0) = 0;                                                    \
-            t.VsrD(1) = 0;                                                    \
+        if (vxvc) {                                                           \
+            float_invalid_op_vxvc(env, 0, GETPC());                           \
         }                                                                     \
     }                                                                         \
-    *xt = t;                                                                  \
+                                                                              \
+    memset(xt, 0, sizeof(*xt));                                               \
+    memset(&xt->fld, -r, sizeof(xt->fld));                                    \
     do_float_check_status(env, GETPC());                                      \
 }
 
-VSX_SCALAR_CMP_DP(xscmpeqdp, eq, 1, 0)
-VSX_SCALAR_CMP_DP(xscmpgedp, le, 1, 1)
-VSX_SCALAR_CMP_DP(xscmpgtdp, lt, 1, 1)
+VSX_SCALAR_CMP(xscmpeqdp, float64, eq, VsrD(0), 0)
+VSX_SCALAR_CMP(xscmpgedp, float64, le, VsrD(0), 1)
+VSX_SCALAR_CMP(xscmpgtdp, float64, lt, VsrD(0), 1)
 
 void helper_xscmpexpdp(CPUPPCState *env, uint32_t opcode,
                        ppc_vsr_t *xa, ppc_vsr_t *xb)
-- 
2.25.1


