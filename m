Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FF843A009
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 21:24:37 +0200 (CEST)
Received: from localhost ([::1]:52768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf5aG-000240-0V
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 15:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mf5RL-00026i-9N; Mon, 25 Oct 2021 15:15:24 -0400
Received: from [201.28.113.2] (port=19916 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>)
 id 1mf5RI-0001bh-1p; Mon, 25 Oct 2021 15:15:22 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 25 Oct 2021 16:12:28 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id EA1A8800BA7;
 Mon, 25 Oct 2021 16:12:27 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 13/19] target/ppc: Move dtstdc[q]/dtstdg[q] to decodetree
Date: Mon, 25 Oct 2021 16:11:48 -0300
Message-Id: <20211025191154.350831-14-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211025191154.350831-1-luis.pires@eldorado.org.br>
References: <20211025191154.350831-1-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Oct 2021 19:12:28.0253 (UTC)
 FILETIME=[407750D0:01D7C9D4]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=luis.pires@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 richard.henderson@linaro.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the following instructions to decodetree:
dtstdc:  DFP Test Data Class
dtstdcq: DFP Test Data Class Quad
dtstdg:  DFP Test Data Group
dtstdgq: DFP Test Data Group Quad

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/dfp_helper.c             |  8 +++----
 target/ppc/helper.h                 |  8 +++----
 target/ppc/insn32.decode            | 14 ++++++++++++
 target/ppc/translate/dfp-impl.c.inc | 35 +++++++++++++----------------
 target/ppc/translate/dfp-ops.c.inc  | 10 ---------
 5 files changed, 37 insertions(+), 38 deletions(-)

diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
index 6ab46d7db5..f3c1e525a3 100644
--- a/target/ppc/dfp_helper.c
+++ b/target/ppc/dfp_helper.c
@@ -546,8 +546,8 @@ uint32_t helper_##op(CPUPPCState *env, ppc_fprp_t *a, uint32_t dcm)      \
     return dfp.crbf;                                                     \
 }
 
-DFP_HELPER_TSTDC(dtstdc, 64)
-DFP_HELPER_TSTDC(dtstdcq, 128)
+DFP_HELPER_TSTDC(DTSTDC, 64)
+DFP_HELPER_TSTDC(DTSTDCQ, 128)
 
 #define DFP_HELPER_TSTDG(op, size)                                       \
 uint32_t helper_##op(CPUPPCState *env, ppc_fprp_t *a, uint32_t dcm)      \
@@ -601,8 +601,8 @@ uint32_t helper_##op(CPUPPCState *env, ppc_fprp_t *a, uint32_t dcm)      \
     return dfp.crbf;                                                     \
 }
 
-DFP_HELPER_TSTDG(dtstdg, 64)
-DFP_HELPER_TSTDG(dtstdgq, 128)
+DFP_HELPER_TSTDG(DTSTDG, 64)
+DFP_HELPER_TSTDG(DTSTDGQ, 128)
 
 #define DFP_HELPER_TSTEX(op, size)                                       \
 uint32_t helper_##op(CPUPPCState *env, ppc_fprp_t *a, ppc_fprp_t *b)     \
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 20041ce977..30e9247a5a 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -708,10 +708,10 @@ DEF_HELPER_3(dcmpo, i32, env, fprp, fprp)
 DEF_HELPER_3(dcmpoq, i32, env, fprp, fprp)
 DEF_HELPER_3(dcmpu, i32, env, fprp, fprp)
 DEF_HELPER_3(dcmpuq, i32, env, fprp, fprp)
-DEF_HELPER_3(dtstdc, i32, env, fprp, i32)
-DEF_HELPER_3(dtstdcq, i32, env, fprp, i32)
-DEF_HELPER_3(dtstdg, i32, env, fprp, i32)
-DEF_HELPER_3(dtstdgq, i32, env, fprp, i32)
+DEF_HELPER_3(DTSTDC, i32, env, fprp, i32)
+DEF_HELPER_3(DTSTDCQ, i32, env, fprp, i32)
+DEF_HELPER_3(DTSTDG, i32, env, fprp, i32)
+DEF_HELPER_3(DTSTDGQ, i32, env, fprp, i32)
 DEF_HELPER_3(dtstex, i32, env, fprp, fprp)
 DEF_HELPER_3(dtstexq, i32, env, fprp, fprp)
 DEF_HELPER_3(dtstsf, i32, env, fprp, fprp)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 6d97f9ae3b..38f8525d54 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -51,6 +51,12 @@
 %x_frbp         12:4 !function=times_2
 @X_vrt_frbp     ...... vrt:5 ..... ....0 .......... .           &X_vrt_frbp frbp=%x_frbp
 
+&Z22_bf_fra     bf fra dm
+@Z22_bf_fra     ...... bf:3 .. fra:5 dm:6 ......... .           &Z22_bf_fra
+
+%z22_frap       17:4 !function=times_2
+@Z22_bf_frap    ...... bf:3 .. ....0 dm:6 ......... .           &Z22_bf_fra fra=%z22_frap
+
 ### Fixed-Point Load Instructions
 
 LBZ             100010 ..... ..... ................     @D
@@ -129,6 +135,14 @@ SETBCR          011111 ..... ..... ----- 0110100000 -   @X_bi
 SETNBC          011111 ..... ..... ----- 0111000000 -   @X_bi
 SETNBCR         011111 ..... ..... ----- 0111100000 -   @X_bi
 
+### Decimal Floating-Point Test Instructions
+
+DTSTDC          111011 ... -- ..... ...... 011000010 -  @Z22_bf_fra
+DTSTDCQ         111111 ... -- ..... ...... 011000010 -  @Z22_bf_frap
+
+DTSTDG          111011 ... -- ..... ...... 011100010 -  @Z22_bf_fra
+DTSTDGQ         111111 ... -- ..... ...... 011100010 -  @Z22_bf_frap
+
 ### Decimal Floating-Point Conversion Instructions
 
 DCFFIXQQ        111111 ..... 00000 ..... 1111100010 -   @X_frtp_vrb
diff --git a/target/ppc/translate/dfp-impl.c.inc b/target/ppc/translate/dfp-impl.c.inc
index 1431d955c6..1a30c51467 100644
--- a/target/ppc/translate/dfp-impl.c.inc
+++ b/target/ppc/translate/dfp-impl.c.inc
@@ -60,21 +60,17 @@ static void gen_##name(DisasContext *ctx)         \
     tcg_temp_free_ptr(rb);                        \
 }
 
-#define GEN_DFP_BF_A_DCM(name)                    \
-static void gen_##name(DisasContext *ctx)         \
-{                                                 \
-    TCGv_ptr ra;                                  \
-    TCGv_i32 dcm;                                 \
-    if (unlikely(!ctx->fpu_enabled)) {            \
-        gen_exception(ctx, POWERPC_EXCP_FPU);     \
-        return;                                   \
-    }                                             \
-    ra = gen_fprp_ptr(rA(ctx->opcode));           \
-    dcm = tcg_const_i32(DCM(ctx->opcode));        \
-    gen_helper_##name(cpu_crf[crfD(ctx->opcode)], \
-                      cpu_env, ra, dcm);          \
-    tcg_temp_free_ptr(ra);                        \
-    tcg_temp_free_i32(dcm);                       \
+#define TRANS_DFP_BF_A_DCM(NAME)                             \
+static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a)   \
+{                                                            \
+    TCGv_ptr ra;                                             \
+    REQUIRE_INSNS_FLAGS2(ctx, DFP);                          \
+    REQUIRE_FPU(ctx);                                        \
+    ra = gen_fprp_ptr(a->fra);                               \
+    gen_helper_##NAME(cpu_crf[a->bf],                        \
+                      cpu_env, ra, tcg_constant_i32(a->dm)); \
+    tcg_temp_free_ptr(ra);                                   \
+    return true;                                             \
 }
 
 #define GEN_DFP_T_B_U32_U32_Rc(name, u32f1, u32f2)    \
@@ -174,10 +170,10 @@ GEN_DFP_BF_A_B(dcmpu)
 GEN_DFP_BF_A_B(dcmpuq)
 GEN_DFP_BF_A_B(dcmpo)
 GEN_DFP_BF_A_B(dcmpoq)
-GEN_DFP_BF_A_DCM(dtstdc)
-GEN_DFP_BF_A_DCM(dtstdcq)
-GEN_DFP_BF_A_DCM(dtstdg)
-GEN_DFP_BF_A_DCM(dtstdgq)
+TRANS_DFP_BF_A_DCM(DTSTDC)
+TRANS_DFP_BF_A_DCM(DTSTDCQ)
+TRANS_DFP_BF_A_DCM(DTSTDG)
+TRANS_DFP_BF_A_DCM(DTSTDGQ)
 GEN_DFP_BF_A_B(dtstex)
 GEN_DFP_BF_A_B(dtstexq)
 GEN_DFP_BF_A_B(dtstsf)
@@ -217,7 +213,6 @@ GEN_DFP_T_FPR_I32_Rc(dscriq, rA, DCM)
 
 #undef GEN_DFP_T_A_B_Rc
 #undef GEN_DFP_BF_A_B
-#undef GEN_DFP_BF_A_DCM
 #undef GEN_DFP_T_B_U32_U32_Rc
 #undef GEN_DFP_T_A_B_I32_Rc
 #undef GEN_DFP_T_B_Rc
diff --git a/target/ppc/translate/dfp-ops.c.inc b/target/ppc/translate/dfp-ops.c.inc
index 6ef38e5712..e1df98d52e 100644
--- a/target/ppc/translate/dfp-ops.c.inc
+++ b/target/ppc/translate/dfp-ops.c.inc
@@ -66,12 +66,6 @@ _GEN_DFP_QUAD(name, op1, op2, 0x00600801)
 #define GEN_DFP_BF_A_Bp_300(name, op1, op2)     \
 _GEN_DFP_QUAD_300(name, op1, op2, 0x00400001)
 
-#define GEN_DFP_BF_A_DCM(name, op1, op2) \
-_GEN_DFP_LONGx2(name, op1, op2, 0x00600001)
-
-#define GEN_DFP_BF_Ap_DCM(name, op1, op2) \
-_GEN_DFP_QUADx2(name, op1, op2, 0x00610001)
-
 #define GEN_DFP_T_A_B_RMC_Rc(name, op1, op2) \
 _GEN_DFP_LONGx4(name, op1, op2, 0x00000000)
 
@@ -123,10 +117,6 @@ GEN_DFP_BF_A_B(dcmpu, 0x02, 0x14),
 GEN_DFP_BF_Ap_Bp(dcmpuq, 0x02, 0x14),
 GEN_DFP_BF_A_B(dcmpo, 0x02, 0x04),
 GEN_DFP_BF_Ap_Bp(dcmpoq, 0x02, 0x04),
-GEN_DFP_BF_A_DCM(dtstdc, 0x02, 0x06),
-GEN_DFP_BF_Ap_DCM(dtstdcq, 0x02, 0x06),
-GEN_DFP_BF_A_DCM(dtstdg, 0x02, 0x07),
-GEN_DFP_BF_Ap_DCM(dtstdgq, 0x02, 0x07),
 GEN_DFP_BF_A_B(dtstex, 0x02, 0x05),
 GEN_DFP_BF_Ap_Bp(dtstexq, 0x02, 0x05),
 GEN_DFP_BF_A_B(dtstsf, 0x02, 0x15),
-- 
2.25.1


