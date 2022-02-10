Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0804B116D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 16:14:14 +0100 (CET)
Received: from localhost ([::1]:47040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIB9A-0007hD-Su
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 10:14:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nI8sZ-0006Hx-Il; Thu, 10 Feb 2022 07:48:55 -0500
Received: from [187.72.171.209] (port=62981 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nI8sT-0001y3-U5; Thu, 10 Feb 2022 07:48:52 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 10 Feb 2022 09:35:35 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id A7C65800502;
 Thu, 10 Feb 2022 09:35:34 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 35/37] target/ppc: Refactor VSX_MAX_MINC helper
Date: Thu, 10 Feb 2022 09:34:45 -0300
Message-Id: <20220210123447.3933301-36-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210123447.3933301-1-matheus.ferst@eldorado.org.br>
References: <20220210123447.3933301-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 10 Feb 2022 12:35:35.0006 (UTC)
 FILETIME=[B3472FE0:01D81E7A]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
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

Refactor xs{max,min}cdp VSX_MAX_MINC helper to prepare for
xs{max,min}cqp implementation.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/fpu_helper.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 41f5748074..6ff5273269 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2536,27 +2536,22 @@ VSX_MAX_MIN(xsmindp, minnum, 1, float64, VsrD(0))
 VSX_MAX_MIN(xvmindp, minnum, 2, float64, VsrD(i))
 VSX_MAX_MIN(xvminsp, minnum, 4, float32, VsrW(i))
 
-#define VSX_MAX_MINC(name, max)                                               \
+#define VSX_MAX_MINC(name, op, tp, fld)                                       \
 void helper_##name(CPUPPCState *env,                                          \
                    ppc_vsr_t *xt, ppc_vsr_t *xa, ppc_vsr_t *xb)               \
 {                                                                             \
     ppc_vsr_t t = *xt;                                                        \
     bool vxsnan_flag = false, vex_flag = false;                               \
                                                                               \
-    if (unlikely(float64_is_any_nan(xa->VsrD(0)) ||                           \
-                 float64_is_any_nan(xb->VsrD(0)))) {                          \
-        if (float64_is_signaling_nan(xa->VsrD(0), &env->fp_status) ||         \
-            float64_is_signaling_nan(xb->VsrD(0), &env->fp_status)) {         \
+    if (unlikely(tp##_is_any_nan(xa->fld) ||                                  \
+                 tp##_is_any_nan(xb->fld))) {                                 \
+        if (tp##_is_signaling_nan(xa->fld, &env->fp_status) ||                \
+            tp##_is_signaling_nan(xb->fld, &env->fp_status)) {                \
             vxsnan_flag = true;                                               \
         }                                                                     \
-        t.VsrD(0) = xb->VsrD(0);                                              \
-    } else if ((max &&                                                        \
-               !float64_lt(xa->VsrD(0), xb->VsrD(0), &env->fp_status)) ||     \
-               (!max &&                                                       \
-               float64_lt(xa->VsrD(0), xb->VsrD(0), &env->fp_status))) {      \
-        t.VsrD(0) = xa->VsrD(0);                                              \
+        t.fld = xb->fld;                                                      \
     } else {                                                                  \
-        t.VsrD(0) = xb->VsrD(0);                                              \
+        t.fld = tp##_##op(xa->fld, xb->fld, &env->fp_status);                 \
     }                                                                         \
                                                                               \
     vex_flag = fpscr_ve & vxsnan_flag;                                        \
@@ -2568,8 +2563,8 @@ void helper_##name(CPUPPCState *env,                                          \
     }                                                                         \
 }                                                                             \
 
-VSX_MAX_MINC(XSMAXCDP, 1);
-VSX_MAX_MINC(XSMINCDP, 0);
+VSX_MAX_MINC(XSMAXCDP, maxnum, float64, VsrD(0));
+VSX_MAX_MINC(XSMINCDP, minnum, float64, VsrD(0));
 
 #define VSX_MAX_MINJ(name, max)                                               \
 void helper_##name(CPUPPCState *env,                                          \
-- 
2.31.1


