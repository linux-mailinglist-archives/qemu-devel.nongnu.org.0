Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D23BE4DB9D2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 21:58:42 +0100 (CET)
Received: from localhost ([::1]:35378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUajB-0005Zd-ES
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 16:58:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.coutinho@eldorado.org.br>)
 id 1nUa9U-0001jV-EJ; Wed, 16 Mar 2022 16:21:48 -0400
Received: from [187.72.171.209] (port=47541 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.coutinho@eldorado.org.br>)
 id 1nUa9S-0006KE-7j; Wed, 16 Mar 2022 16:21:47 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 16 Mar 2022 17:04:30 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 3EBB580012C;
 Wed, 16 Mar 2022 17:04:30 -0300 (-03)
From: Lucas Coutinho <lucas.coutinho@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH] target/ppc: Replicate Double->Single-Precision result
Date: Wed, 16 Mar 2022 17:04:27 -0300
Message-Id: <20220316200427.3410437-1-lucas.coutinho@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 16 Mar 2022 20:04:30.0648 (UTC)
 FILETIME=[0C377B80:01D83971]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=lucas.coutinho@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 16 Mar 2022 16:56:04 -0400
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
 clg@kaod.org, matheus.ferst@eldorado.org.br,
 Lucas Coutinho <lucas.coutinho@eldorado.org.br>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Power ISA v3.1 formalizes the previously undefined result in
words 1 and 3 to be a copy of the result in words 0 and 2.

This affects: xvcvsxdsp, xvcvuxdsp, xvcvdpsp.

And the previously undefined result in word 1 to be a copy of
the result in word 0.

This affects: xscvdpsp.

Signed-off-by: Lucas Coutinho <lucas.coutinho@eldorado.org.br>
---
This patch is a follow-up of: 
https://lists.gnu.org/archive/html/qemu-ppc/2022-03/msg00354.html
which have the same behavior of the instructions altered
---
 target/ppc/fpu_helper.c | 48 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 44 insertions(+), 4 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index e76d2ae83a..e9cf5f7a78 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2691,11 +2691,35 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)   \
     do_float_check_status(env, GETPC());                           \
 }
 
-VSX_CVT_FP_TO_FP(xscvdpsp, 1, float64, float32, VsrD(0), VsrW(0), 1)
 VSX_CVT_FP_TO_FP(xscvspdp, 1, float32, float64, VsrW(0), VsrD(0), 1)
-VSX_CVT_FP_TO_FP(xvcvdpsp, 2, float64, float32, VsrD(i), VsrW(2 * i), 0)
 VSX_CVT_FP_TO_FP(xvcvspdp, 2, float32, float64, VsrW(2 * i), VsrD(i), 0)
 
+#define VSX_CVT_FP_TO_FP2(op, nels, stp, ttp, sfprf)                  \
+void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)      \
+{                                                                     \
+    ppc_vsr_t t = { };                                                \
+    int i;                                                            \
+                                                                      \
+    for (i = 0; i < nels; i++) {                                      \
+        t.VsrW(2 * i) = stp##_to_##ttp(xb->VsrD(i), &env->fp_status); \
+        if (unlikely(stp##_is_signaling_nan(xb->VsrD(i),              \
+                                            &env->fp_status))) {      \
+            float_invalid_op_vxsnan(env, GETPC());                    \
+            t.VsrW(2 * i) = ttp##_snan_to_qnan(t.VsrW(2 * i));        \
+        }                                                             \
+        if (sfprf) {                                                  \
+            helper_compute_fprf_##ttp(env, t.VsrW(2 * i));            \
+        }                                                             \
+        t.VsrW(2 * i + 1) = t.VsrW(2 * i);                            \
+    }                                                                 \
+                                                                      \
+    *xt = t;                                                          \
+    do_float_check_status(env, GETPC());                              \
+}
+
+VSX_CVT_FP_TO_FP2(xvcvdpsp, 2, float64, float32, 0)
+VSX_CVT_FP_TO_FP2(xscvdpsp, 1, float64, float32, 1)
+
 /*
  * VSX_CVT_FP_TO_FP_VECTOR - VSX floating point/floating point conversion
  *   op    - instruction mnemonic
@@ -3011,11 +3035,27 @@ VSX_CVT_INT_TO_FP(xvcvsxddp, 2, int64, float64, VsrD(i), VsrD(i), 0, 0)
 VSX_CVT_INT_TO_FP(xvcvuxddp, 2, uint64, float64, VsrD(i), VsrD(i), 0, 0)
 VSX_CVT_INT_TO_FP(xvcvsxwdp, 2, int32, float64, VsrW(2 * i), VsrD(i), 0, 0)
 VSX_CVT_INT_TO_FP(xvcvuxwdp, 2, uint64, float64, VsrW(2 * i), VsrD(i), 0, 0)
-VSX_CVT_INT_TO_FP(xvcvsxdsp, 2, int64, float32, VsrD(i), VsrW(2 * i), 0, 0)
-VSX_CVT_INT_TO_FP(xvcvuxdsp, 2, uint64, float32, VsrD(i), VsrW(2 * i), 0, 0)
 VSX_CVT_INT_TO_FP(xvcvsxwsp, 4, int32, float32, VsrW(i), VsrW(i), 0, 0)
 VSX_CVT_INT_TO_FP(xvcvuxwsp, 4, uint32, float32, VsrW(i), VsrW(i), 0, 0)
 
+#define VSX_CVT_INT_TO_FP2(op, stp, ttp)                                \
+void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)        \
+{                                                                       \
+    ppc_vsr_t t = { };                                                  \
+    int i;                                                              \
+                                                                        \
+    for (i = 0; i < 2; i++) {                                           \
+        t.VsrW(2 * i) = stp##_to_##ttp(xb->VsrD(i), &env->fp_status);   \
+        t.VsrW(2 * i + 1) = t.VsrW(2 * i);                              \
+    }                                                                   \
+                                                                        \
+    *xt = t;                                                            \
+    do_float_check_status(env, GETPC());                                \
+}
+
+VSX_CVT_INT_TO_FP2(xvcvsxdsp, int64, float32)
+VSX_CVT_INT_TO_FP2(xvcvuxdsp, uint64, float32)
+
 /*
  * VSX_CVT_INT_TO_FP_VECTOR - VSX integer to floating point conversion
  *   op    - instruction mnemonic
-- 
2.25.1


