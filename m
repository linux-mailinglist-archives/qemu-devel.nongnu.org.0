Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE51F44A6DB
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 07:32:21 +0100 (CET)
Received: from localhost ([::1]:42872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkKg8-0004E8-SJ
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 01:32:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK3q-0004WD-Ne; Tue, 09 Nov 2021 00:52:47 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:35513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK3n-0006hs-5W; Tue, 09 Nov 2021 00:52:46 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HpHDp1jfbz4xdv; Tue,  9 Nov 2021 16:52:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636437130;
 bh=A/IMGFZXCZrCtDudAXqLouDQM73yk1CzNamBElX6i4A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G4T1LF422BGpEq3626QHdfadf2WcLyw9axRFs4KCBjPOuaW8tLPweHdeeUx3nc9/y
 SFxMyjV3hcYiKNRMnOdjaG187qW0jz28IxIsa6i1474abM0+K1/TRrUZpJBOblgrun
 S9AhDOfHfb8+A+Nhwv7eJ7LXlfxBHlsv4hK18+wE=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org, clg@kaod.org, danielhb413@gmail.com,
 groug@kaod.org
Subject: [PULL 19/54] target/ppc: Move dtstdc[q]/dtstdg[q] to decodetree
Date: Tue,  9 Nov 2021 16:51:29 +1100
Message-Id: <20211109055204.230765-20-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211109055204.230765-1-david@gibson.dropbear.id.au>
References: <20211109055204.230765-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Luis Pires <luis.pires@eldorado.org.br>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Luis Pires <luis.pires@eldorado.org.br>

Move the following instructions to decodetree:
dtstdc:  DFP Test Data Class
dtstdcq: DFP Test Data Class Quad
dtstdg:  DFP Test Data Group
dtstdgq: DFP Test Data Group Quad

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211029192417.400707-10-luis.pires@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
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
index 3812bb0270..2f11411e14 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -710,10 +710,10 @@ DEF_HELPER_3(dcmpo, i32, env, fprp, fprp)
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
index 33463c14ea..49bdd3531e 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -58,6 +58,12 @@
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
@@ -168,6 +174,14 @@ SETBCR          011111 ..... ..... ----- 0110100000 -   @X_bi
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
2.33.1


