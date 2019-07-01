Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB4C4749A
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Jun 2019 15:11:31 +0200 (CEST)
Received: from localhost ([::1]:39696 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcUwU-0008Oh-HD
	for lists+qemu-devel@lfdr.de; Sun, 16 Jun 2019 09:11:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47744)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1hcUoT-0003DB-76
 for qemu-devel@nongnu.org; Sun, 16 Jun 2019 09:03:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1hcUoR-0004Lr-LP
 for qemu-devel@nongnu.org; Sun, 16 Jun 2019 09:03:13 -0400
Received: from mail.ilande.co.uk ([46.43.2.167]:46516
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1hcUoR-0004Lg-Fh; Sun, 16 Jun 2019 09:03:11 -0400
Received: from host86-173-229-95.range86-173.btcentralplus.com
 ([86.173.229.95] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1hcUQ3-0001jp-R2; Sun, 16 Jun 2019 13:38:00 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au,
 rth@twiddle.net, gkurz@kaod.org
Date: Sun, 16 Jun 2019 13:37:46 +0100
Message-Id: <20190616123751.781-11-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190616123751.781-1-mark.cave-ayland@ilande.co.uk>
References: <20190616123751.781-1-mark.cave-ayland@ilande.co.uk>
X-SA-Exim-Connect-IP: 86.173.229.95
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.43.2.167
Subject: [Qemu-devel] [PATCH v3 10/15] target/ppc: introduce
 GEN_VSX_HELPER_R3 macro to fpu_helper.c
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rather than perform the VSR register decoding within the helper itself,
introduce a new GEN_VSX_HELPER_R3 macro which performs the decode based
upon rD, rA and rB at translation time.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/fpu_helper.c             | 36 ++++++++++++------------------------
 target/ppc/helper.h                 | 16 ++++++++--------
 target/ppc/translate/vsx-impl.inc.c | 36 ++++++++++++++++++++++++++++--------
 3 files changed, 48 insertions(+), 40 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 5fb43b619e..44970ebec9 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -1842,11 +1842,9 @@ VSX_ADD_SUB(xssubsp, sub, 1, float64, VsrD(0), 1, 1)
 VSX_ADD_SUB(xvsubdp, sub, 2, float64, VsrD(i), 0, 0)
 VSX_ADD_SUB(xvsubsp, sub, 4, float32, VsrW(i), 0, 0)
 
-void helper_xsaddqp(CPUPPCState *env, uint32_t opcode)
+void helper_xsaddqp(CPUPPCState *env, uint32_t opcode,
+                    ppc_vsr_t *xt, ppc_vsr_t *xa, ppc_vsr_t *xb)
 {
-    ppc_vsr_t *xt = &env->vsr[rD(opcode) + 32];
-    ppc_vsr_t *xa = &env->vsr[rA(opcode) + 32];
-    ppc_vsr_t *xb = &env->vsr[rB(opcode) + 32];
     ppc_vsr_t t = *xt;
     float_status tstat;
 
@@ -1920,11 +1918,9 @@ VSX_MUL(xsmulsp, 1, float64, VsrD(0), 1, 1)
 VSX_MUL(xvmuldp, 2, float64, VsrD(i), 0, 0)
 VSX_MUL(xvmulsp, 4, float32, VsrW(i), 0, 0)
 
-void helper_xsmulqp(CPUPPCState *env, uint32_t opcode)
+void helper_xsmulqp(CPUPPCState *env, uint32_t opcode,
+                    ppc_vsr_t *xt, ppc_vsr_t *xa, ppc_vsr_t *xb)
 {
-    ppc_vsr_t *xt = &env->vsr[rD(opcode) + 32];
-    ppc_vsr_t *xa = &env->vsr[rA(opcode) + 32];
-    ppc_vsr_t *xb = &env->vsr[rB(opcode) + 32];
     ppc_vsr_t t = *xt;
     float_status tstat;
 
@@ -1999,11 +1995,9 @@ VSX_DIV(xsdivsp, 1, float64, VsrD(0), 1, 1)
 VSX_DIV(xvdivdp, 2, float64, VsrD(i), 0, 0)
 VSX_DIV(xvdivsp, 4, float32, VsrW(i), 0, 0)
 
-void helper_xsdivqp(CPUPPCState *env, uint32_t opcode)
+void helper_xsdivqp(CPUPPCState *env, uint32_t opcode,
+                    ppc_vsr_t *xt, ppc_vsr_t *xa, ppc_vsr_t *xb)
 {
-    ppc_vsr_t *xt = &env->vsr[rD(opcode) + 32];
-    ppc_vsr_t *xa = &env->vsr[rA(opcode) + 32];
-    ppc_vsr_t *xb = &env->vsr[rB(opcode) + 32];
     ppc_vsr_t t = *xt;
     float_status tstat;
 
@@ -2620,11 +2614,9 @@ VSX_MAX_MIN(xvmindp, minnum, 2, float64, VsrD(i))
 VSX_MAX_MIN(xvminsp, minnum, 4, float32, VsrW(i))
 
 #define VSX_MAX_MINC(name, max)                                               \
-void helper_##name(CPUPPCState *env, uint32_t opcode)                         \
+void helper_##name(CPUPPCState *env, uint32_t opcode,                         \
+                   ppc_vsr_t *xt, ppc_vsr_t *xa, ppc_vsr_t *xb)               \
 {                                                                             \
-    ppc_vsr_t *xt = &env->vsr[rD(opcode) + 32];                               \
-    ppc_vsr_t *xa = &env->vsr[rA(opcode) + 32];                               \
-    ppc_vsr_t *xb = &env->vsr[rB(opcode) + 32];                               \
     ppc_vsr_t t = *xt;                                                        \
     bool vxsnan_flag = false, vex_flag = false;                               \
                                                                               \
@@ -2657,11 +2649,9 @@ VSX_MAX_MINC(xsmaxcdp, 1);
 VSX_MAX_MINC(xsmincdp, 0);
 
 #define VSX_MAX_MINJ(name, max)                                               \
-void helper_##name(CPUPPCState *env, uint32_t opcode)                         \
+void helper_##name(CPUPPCState *env, uint32_t opcode,                         \
+                   ppc_vsr_t *xt, ppc_vsr_t *xa, ppc_vsr_t *xb)               \
 {                                                                             \
-    ppc_vsr_t *xt = &env->vsr[rD(opcode) + 32];                               \
-    ppc_vsr_t *xa = &env->vsr[rA(opcode) + 32];                               \
-    ppc_vsr_t *xb = &env->vsr[rB(opcode) + 32];                               \
     ppc_vsr_t t = *xt;                                                        \
     bool vxsnan_flag = false, vex_flag = false;                               \
                                                                               \
@@ -3436,11 +3426,9 @@ void helper_xssqrtqp(CPUPPCState *env, uint32_t opcode)
     do_float_check_status(env, GETPC());
 }
 
-void helper_xssubqp(CPUPPCState *env, uint32_t opcode)
+void helper_xssubqp(CPUPPCState *env, uint32_t opcode,
+                    ppc_vsr_t *xt, ppc_vsr_t *xa, ppc_vsr_t *xb)
 {
-    ppc_vsr_t *xt = &env->vsr[rD(opcode) + 32];
-    ppc_vsr_t *xa = &env->vsr[rA(opcode) + 32];
-    ppc_vsr_t *xb = &env->vsr[rB(opcode) + 32];
     ppc_vsr_t t = *xt;
     float_status tstat;
 
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index a8886c56ad..9134da9cbb 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -366,12 +366,12 @@ DEF_HELPER_4(bcdtrunc, i32, avr, avr, avr, i32)
 DEF_HELPER_4(bcdutrunc, i32, avr, avr, avr, i32)
 
 DEF_HELPER_4(xsadddp, void, env, vsr, vsr, vsr)
-DEF_HELPER_2(xsaddqp, void, env, i32)
+DEF_HELPER_5(xsaddqp, void, env, i32, vsr, vsr, vsr)
 DEF_HELPER_4(xssubdp, void, env, vsr, vsr, vsr)
 DEF_HELPER_4(xsmuldp, void, env, vsr, vsr, vsr)
-DEF_HELPER_2(xsmulqp, void, env, i32)
+DEF_HELPER_5(xsmulqp, void, env, i32, vsr, vsr, vsr)
 DEF_HELPER_4(xsdivdp, void, env, vsr, vsr, vsr)
-DEF_HELPER_2(xsdivqp, void, env, i32)
+DEF_HELPER_5(xsdivqp, void, env, i32, vsr, vsr, vsr)
 DEF_HELPER_3(xsredp, void, env, vsr, vsr)
 DEF_HELPER_3(xssqrtdp, void, env, vsr, vsr)
 DEF_HELPER_3(xsrsqrtedp, void, env, vsr, vsr)
@@ -397,10 +397,10 @@ DEF_HELPER_2(xscmpoqp, void, env, i32)
 DEF_HELPER_2(xscmpuqp, void, env, i32)
 DEF_HELPER_4(xsmaxdp, void, env, vsr, vsr, vsr)
 DEF_HELPER_4(xsmindp, void, env, vsr, vsr, vsr)
-DEF_HELPER_2(xsmaxcdp, void, env, i32)
-DEF_HELPER_2(xsmincdp, void, env, i32)
-DEF_HELPER_2(xsmaxjdp, void, env, i32)
-DEF_HELPER_2(xsminjdp, void, env, i32)
+DEF_HELPER_5(xsmaxcdp, void, env, i32, vsr, vsr, vsr)
+DEF_HELPER_5(xsmincdp, void, env, i32, vsr, vsr, vsr)
+DEF_HELPER_5(xsmaxjdp, void, env, i32, vsr, vsr, vsr)
+DEF_HELPER_5(xsminjdp, void, env, i32, vsr, vsr, vsr)
 DEF_HELPER_3(xscvdphp, void, env, vsr, vsr)
 DEF_HELPER_2(xscvdpqp, void, env, i32)
 DEF_HELPER_3(xscvdpsp, void, env, vsr, vsr)
@@ -434,7 +434,7 @@ DEF_HELPER_3(xsrdpiz, void, env, vsr, vsr)
 DEF_HELPER_2(xsrqpi, void, env, i32)
 DEF_HELPER_2(xsrqpxp, void, env, i32)
 DEF_HELPER_2(xssqrtqp, void, env, i32)
-DEF_HELPER_2(xssubqp, void, env, i32)
+DEF_HELPER_5(xssubqp, void, env, i32, vsr, vsr, vsr)
 
 DEF_HELPER_4(xsaddsp, void, env, vsr, vsr, vsr)
 DEF_HELPER_4(xssubsp, void, env, vsr, vsr, vsr)
diff --git a/target/ppc/translate/vsx-impl.inc.c b/target/ppc/translate/vsx-impl.inc.c
index 8af093d256..8380651a8d 100644
--- a/target/ppc/translate/vsx-impl.inc.c
+++ b/target/ppc/translate/vsx-impl.inc.c
@@ -1095,6 +1095,26 @@ static void gen_##name(DisasContext *ctx)                                     \
     tcg_temp_free_ptr(xb);                                                    \
 }
 
+#define GEN_VSX_HELPER_R3(name, op1, op2, inval, type)                        \
+static void gen_##name(DisasContext *ctx)                                     \
+{                                                                             \
+    TCGv_i32 opc;                                                             \
+    TCGv_ptr xt, xa, xb;                                                      \
+    if (unlikely(!ctx->vsx_enabled)) {                                        \
+        gen_exception(ctx, POWERPC_EXCP_VSXU);                                \
+        return;                                                               \
+    }                                                                         \
+    opc = tcg_const_i32(ctx->opcode);                                         \
+    xt = gen_vsr_ptr(rD(ctx->opcode) + 32);                                   \
+    xa = gen_vsr_ptr(rA(ctx->opcode) + 32);                                   \
+    xb = gen_vsr_ptr(rB(ctx->opcode) + 32);                                   \
+    gen_helper_##name(cpu_env, opc, xt, xa, xb);                              \
+    tcg_temp_free_i32(opc);                                                   \
+    tcg_temp_free_ptr(xt);                                                    \
+    tcg_temp_free_ptr(xa);                                                    \
+    tcg_temp_free_ptr(xb);                                                    \
+}
+
 #define GEN_VSX_HELPER_XT_XB_ENV(name, op1, op2, inval, type) \
 static void gen_##name(DisasContext *ctx)                     \
 {                                                             \
@@ -1114,12 +1134,12 @@ static void gen_##name(DisasContext *ctx)                     \
 }
 
 GEN_VSX_HELPER_X3(xsadddp, 0x00, 0x04, 0, PPC2_VSX)
-GEN_VSX_HELPER_2(xsaddqp, 0x04, 0x00, 0, PPC2_ISA300)
+GEN_VSX_HELPER_R3(xsaddqp, 0x04, 0x00, 0, PPC2_ISA300)
 GEN_VSX_HELPER_X3(xssubdp, 0x00, 0x05, 0, PPC2_VSX)
 GEN_VSX_HELPER_X3(xsmuldp, 0x00, 0x06, 0, PPC2_VSX)
-GEN_VSX_HELPER_2(xsmulqp, 0x04, 0x01, 0, PPC2_ISA300)
+GEN_VSX_HELPER_R3(xsmulqp, 0x04, 0x01, 0, PPC2_ISA300)
 GEN_VSX_HELPER_X3(xsdivdp, 0x00, 0x07, 0, PPC2_VSX)
-GEN_VSX_HELPER_2(xsdivqp, 0x04, 0x11, 0, PPC2_ISA300)
+GEN_VSX_HELPER_R3(xsdivqp, 0x04, 0x11, 0, PPC2_ISA300)
 GEN_VSX_HELPER_X2(xsredp, 0x14, 0x05, 0, PPC2_VSX)
 GEN_VSX_HELPER_X2(xssqrtdp, 0x16, 0x04, 0, PPC2_VSX)
 GEN_VSX_HELPER_X2(xsrsqrtedp, 0x14, 0x04, 0, PPC2_VSX)
@@ -1145,10 +1165,10 @@ GEN_VSX_HELPER_2(xscmpoqp, 0x04, 0x04, 0, PPC2_VSX)
 GEN_VSX_HELPER_2(xscmpuqp, 0x04, 0x14, 0, PPC2_VSX)
 GEN_VSX_HELPER_X3(xsmaxdp, 0x00, 0x14, 0, PPC2_VSX)
 GEN_VSX_HELPER_X3(xsmindp, 0x00, 0x15, 0, PPC2_VSX)
-GEN_VSX_HELPER_2(xsmaxcdp, 0x00, 0x10, 0, PPC2_ISA300)
-GEN_VSX_HELPER_2(xsmincdp, 0x00, 0x11, 0, PPC2_ISA300)
-GEN_VSX_HELPER_2(xsmaxjdp, 0x00, 0x12, 0, PPC2_ISA300)
-GEN_VSX_HELPER_2(xsminjdp, 0x00, 0x12, 0, PPC2_ISA300)
+GEN_VSX_HELPER_R3(xsmaxcdp, 0x00, 0x10, 0, PPC2_ISA300)
+GEN_VSX_HELPER_R3(xsmincdp, 0x00, 0x11, 0, PPC2_ISA300)
+GEN_VSX_HELPER_R3(xsmaxjdp, 0x00, 0x12, 0, PPC2_ISA300)
+GEN_VSX_HELPER_R3(xsminjdp, 0x00, 0x12, 0, PPC2_ISA300)
 GEN_VSX_HELPER_X2(xscvdphp, 0x16, 0x15, 0x11, PPC2_ISA300)
 GEN_VSX_HELPER_X2(xscvdpsp, 0x12, 0x10, 0, PPC2_VSX)
 GEN_VSX_HELPER_2(xscvdpqp, 0x04, 0x1A, 0x16, PPC2_ISA300)
@@ -1178,7 +1198,7 @@ GEN_VSX_HELPER_XT_XB_ENV(xsrsp, 0x12, 0x11, 0, PPC2_VSX207)
 GEN_VSX_HELPER_2(xsrqpi, 0x05, 0x00, 0, PPC2_ISA300)
 GEN_VSX_HELPER_2(xsrqpxp, 0x05, 0x01, 0, PPC2_ISA300)
 GEN_VSX_HELPER_2(xssqrtqp, 0x04, 0x19, 0x1B, PPC2_ISA300)
-GEN_VSX_HELPER_2(xssubqp, 0x04, 0x10, 0, PPC2_ISA300)
+GEN_VSX_HELPER_R3(xssubqp, 0x04, 0x10, 0, PPC2_ISA300)
 
 GEN_VSX_HELPER_X3(xsaddsp, 0x00, 0x00, 0, PPC2_VSX207)
 GEN_VSX_HELPER_X3(xssubsp, 0x00, 0x01, 0, PPC2_VSX207)
-- 
2.11.0


