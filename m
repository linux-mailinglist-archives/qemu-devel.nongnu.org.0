Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 291AA4E721E
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 12:22:07 +0100 (CET)
Received: from localhost ([::1]:60182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXi17-0004v6-Sq
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 07:22:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nXhyK-0003wR-TY; Fri, 25 Mar 2022 07:19:13 -0400
Received: from [187.72.171.209] (port=25951 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nXhyI-0005pW-QL; Fri, 25 Mar 2022 07:19:12 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 25 Mar 2022 08:19:05 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id B78728000D6;
 Fri, 25 Mar 2022 08:19:04 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH for-7.0] target/ppc: fix helper_xvmadd* argument order
Date: Fri, 25 Mar 2022 08:18:51 -0300
Message-Id: <20220325111851.718966-1-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Mar 2022 11:19:05.0205 (UTC)
 FILETIME=[234E6250:01D8403A]
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

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

When the xsmadd* insns were moved to decodetree, the helper arguments
were reordered to better match the PowerISA description. The same macro
is used to declare xvmadd* helpers, but the translation macro of these
insns was not changed accordingly.

Reported-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Fixes: e4318ab2e423 ("target/ppc: move xs[n]madd[am][ds]p/xs[n]msub[am][ds]p to decodetree")
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/translate/vsx-impl.c.inc | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index e67fbf2bb8..d1f6333314 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1324,31 +1324,31 @@ TRANS(XSNMSUBQP, do_xsmadd_X, gen_helper_XSNMSUBQP, gen_helper_XSNMSUBQPO)
 #define GEN_VSX_HELPER_VSX_MADD(name, op1, aop, mop, inval, type)             \
 static void gen_##name(DisasContext *ctx)                                     \
 {                                                                             \
-    TCGv_ptr xt, xa, b, c;                                                    \
+    TCGv_ptr xt, s1, s2, s3;                                                  \
     if (unlikely(!ctx->vsx_enabled)) {                                        \
         gen_exception(ctx, POWERPC_EXCP_VSXU);                                \
         return;                                                               \
     }                                                                         \
     xt = gen_vsr_ptr(xT(ctx->opcode));                                        \
-    xa = gen_vsr_ptr(xA(ctx->opcode));                                        \
+    s1 = gen_vsr_ptr(xA(ctx->opcode));                                        \
     if (ctx->opcode & PPC_BIT32(25)) {                                        \
         /*                                                                    \
          * AxT + B                                                            \
          */                                                                   \
-        b = gen_vsr_ptr(xT(ctx->opcode));                                     \
-        c = gen_vsr_ptr(xB(ctx->opcode));                                     \
+        s2 = gen_vsr_ptr(xB(ctx->opcode));                                    \
+        s3 = gen_vsr_ptr(xT(ctx->opcode));                                    \
     } else {                                                                  \
         /*                                                                    \
          * AxB + T                                                            \
          */                                                                   \
-        b = gen_vsr_ptr(xB(ctx->opcode));                                     \
-        c = gen_vsr_ptr(xT(ctx->opcode));                                     \
+        s2 = gen_vsr_ptr(xT(ctx->opcode));                                    \
+        s3 = gen_vsr_ptr(xB(ctx->opcode));                                    \
     }                                                                         \
-    gen_helper_##name(cpu_env, xt, xa, b, c);                                 \
+    gen_helper_##name(cpu_env, xt, s1, s2, s3);                               \
     tcg_temp_free_ptr(xt);                                                    \
-    tcg_temp_free_ptr(xa);                                                    \
-    tcg_temp_free_ptr(b);                                                     \
-    tcg_temp_free_ptr(c);                                                     \
+    tcg_temp_free_ptr(s1);                                                    \
+    tcg_temp_free_ptr(s2);                                                    \
+    tcg_temp_free_ptr(s3);                                                    \
 }
 
 GEN_VSX_HELPER_VSX_MADD(xvmadddp, 0x04, 0x0C, 0x0D, 0, PPC2_VSX)
-- 
2.25.1


