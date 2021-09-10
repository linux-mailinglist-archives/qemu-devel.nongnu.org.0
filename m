Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 545E4406B09
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 13:54:15 +0200 (CEST)
Received: from localhost ([::1]:58384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOf6k-00050g-Bc
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 07:54:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mOeiS-0005Tz-Nc; Fri, 10 Sep 2021 07:29:08 -0400
Received: from [201.28.113.2] (port=29928 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>)
 id 1mOeiP-0003iy-CS; Fri, 10 Sep 2021 07:29:07 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 10 Sep 2021 08:26:53 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 5E8BF8014C3;
 Fri, 10 Sep 2021 08:26:53 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 18/22] target/ppc: Move dcmp{u, o}[q], dts{tex, tsf,
 tsfi}[q] to decodetree
Date: Fri, 10 Sep 2021 08:26:20 -0300
Message-Id: <20210910112624.72748-19-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910112624.72748-1-luis.pires@eldorado.org.br>
References: <20210910112624.72748-1-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 10 Sep 2021 11:26:53.0576 (UTC)
 FILETIME=[C1832080:01D7A636]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=luis.pires@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Luis Pires <luis.pires@eldorado.org.br>, richard.henderson@linaro.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the following instructions to decodetree:
dcmpu:    DFP Compare Unordered
dcmpuq:   DFP Compare Unordered Quad
dcmpo:    DFP Compare Ordered
dcmpoq:   DFP Compare Ordered Quad
dtstex:   DFP Test Exponent
dtstexq:  DFP Test Exponent Quad
dtstsf:   DFP Test Significance
dtstsfq:  DFP Test Significance Quad
dtstsfi:  DFP Test Significance Immediate
dtstsfiq: DFP Test Significance Immediate Quad

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
---
 target/ppc/dfp_helper.c             | 20 ++++----
 target/ppc/helper.h                 | 20 ++++----
 target/ppc/insn32.decode            | 29 +++++++++++
 target/ppc/translate/dfp-impl.c.inc | 76 +++++++++++++----------------
 target/ppc/translate/dfp-ops.c.inc  | 31 ------------
 5 files changed, 83 insertions(+), 93 deletions(-)

diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
index 14080cecc8..b6634134d9 100644
--- a/target/ppc/dfp_helper.c
+++ b/target/ppc/dfp_helper.c
@@ -508,8 +508,8 @@ static void CMPU_PPs(struct PPC_DFP *dfp)
     dfp_check_for_VXSNAN(dfp);
 }
 
-DFP_HELPER_BF_AB(dcmpu, decNumberCompare, CMPU_PPs, 64)
-DFP_HELPER_BF_AB(dcmpuq, decNumberCompare, CMPU_PPs, 128)
+DFP_HELPER_BF_AB(DCMPU, decNumberCompare, CMPU_PPs, 64)
+DFP_HELPER_BF_AB(DCMPUQ, decNumberCompare, CMPU_PPs, 128)
 
 static void CMPO_PPs(struct PPC_DFP *dfp)
 {
@@ -519,8 +519,8 @@ static void CMPO_PPs(struct PPC_DFP *dfp)
     dfp_check_for_VXVC(dfp);
 }
 
-DFP_HELPER_BF_AB(dcmpo, decNumberCompare, CMPO_PPs, 64)
-DFP_HELPER_BF_AB(dcmpoq, decNumberCompare, CMPO_PPs, 128)
+DFP_HELPER_BF_AB(DCMPO, decNumberCompare, CMPO_PPs, 64)
+DFP_HELPER_BF_AB(DCMPOQ, decNumberCompare, CMPO_PPs, 128)
 
 #define DFP_HELPER_TSTDC(op, size)                                       \
 uint32_t helper_##op(CPUPPCState *env, ppc_fprp_t *a, uint32_t dcm)      \
@@ -634,8 +634,8 @@ uint32_t helper_##op(CPUPPCState *env, ppc_fprp_t *a, ppc_fprp_t *b)     \
     return dfp.crbf;                                                     \
 }
 
-DFP_HELPER_TSTEX(dtstex, 64)
-DFP_HELPER_TSTEX(dtstexq, 128)
+DFP_HELPER_TSTEX(DTSTEX, 64)
+DFP_HELPER_TSTEX(DTSTEXQ, 128)
 
 #define DFP_HELPER_TSTSF(op, size)                                       \
 uint32_t helper_##op(CPUPPCState *env, ppc_fprp_t *a, ppc_fprp_t *b)     \
@@ -671,8 +671,8 @@ uint32_t helper_##op(CPUPPCState *env, ppc_fprp_t *a, ppc_fprp_t *b)     \
     return dfp.crbf;                                                     \
 }
 
-DFP_HELPER_TSTSF(dtstsf, 64)
-DFP_HELPER_TSTSF(dtstsfq, 128)
+DFP_HELPER_TSTSF(DTSTSF, 64)
+DFP_HELPER_TSTSF(DTSTSFQ, 128)
 
 #define DFP_HELPER_TSTSFI(op, size)                                     \
 uint32_t helper_##op(CPUPPCState *env, uint32_t a, ppc_fprp_t *b)       \
@@ -706,8 +706,8 @@ uint32_t helper_##op(CPUPPCState *env, uint32_t a, ppc_fprp_t *b)       \
     return dfp.crbf;                                                    \
 }
 
-DFP_HELPER_TSTSFI(dtstsfi, 64)
-DFP_HELPER_TSTSFI(dtstsfiq, 128)
+DFP_HELPER_TSTSFI(DTSTSFI, 64)
+DFP_HELPER_TSTSFI(DTSTSFIQ, 128)
 
 static void QUA_PPs(struct PPC_DFP *dfp)
 {
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 1f00e47b82..22bf167b15 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -704,20 +704,20 @@ DEF_HELPER_4(DMUL, void, env, fprp, fprp, fprp)
 DEF_HELPER_4(DMULQ, void, env, fprp, fprp, fprp)
 DEF_HELPER_4(DDIV, void, env, fprp, fprp, fprp)
 DEF_HELPER_4(DDIVQ, void, env, fprp, fprp, fprp)
-DEF_HELPER_3(dcmpo, i32, env, fprp, fprp)
-DEF_HELPER_3(dcmpoq, i32, env, fprp, fprp)
-DEF_HELPER_3(dcmpu, i32, env, fprp, fprp)
-DEF_HELPER_3(dcmpuq, i32, env, fprp, fprp)
+DEF_HELPER_3(DCMPO, i32, env, fprp, fprp)
+DEF_HELPER_3(DCMPOQ, i32, env, fprp, fprp)
+DEF_HELPER_3(DCMPU, i32, env, fprp, fprp)
+DEF_HELPER_3(DCMPUQ, i32, env, fprp, fprp)
 DEF_HELPER_3(DTSTDC, i32, env, fprp, i32)
 DEF_HELPER_3(DTSTDCQ, i32, env, fprp, i32)
 DEF_HELPER_3(DTSTDG, i32, env, fprp, i32)
 DEF_HELPER_3(DTSTDGQ, i32, env, fprp, i32)
-DEF_HELPER_3(dtstex, i32, env, fprp, fprp)
-DEF_HELPER_3(dtstexq, i32, env, fprp, fprp)
-DEF_HELPER_3(dtstsf, i32, env, fprp, fprp)
-DEF_HELPER_3(dtstsfq, i32, env, fprp, fprp)
-DEF_HELPER_3(dtstsfi, i32, env, i32, fprp)
-DEF_HELPER_3(dtstsfiq, i32, env, i32, fprp)
+DEF_HELPER_3(DTSTEX, i32, env, fprp, fprp)
+DEF_HELPER_3(DTSTEXQ, i32, env, fprp, fprp)
+DEF_HELPER_3(DTSTSF, i32, env, fprp, fprp)
+DEF_HELPER_3(DTSTSFQ, i32, env, fprp, fprp)
+DEF_HELPER_3(DTSTSFI, i32, env, i32, fprp)
+DEF_HELPER_3(DTSTSFIQ, i32, env, i32, fprp)
 DEF_HELPER_5(dquai, void, env, fprp, fprp, i32, i32)
 DEF_HELPER_5(dquaiq, void, env, fprp, fprp, i32, i32)
 DEF_HELPER_5(dqua, void, env, fprp, fprp, fprp, i32)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index c4a8cc7ec5..aaeccebca0 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -50,6 +50,18 @@
 &X_bi           rt bi
 @X_bi           ...... rt:5 bi:5 ----- .......... -     &X_bi
 
+&X_bf           bf ra rb
+@X_bf           ...... bf:3 .. ra:5 rb:5 .......... .           &X_bf
+
+@X_bf_ap_bp     ...... bf:3 .. ....0 ....0 .......... .         &X_bf ra=%x_frap rb=%x_frbp
+
+@X_bf_a_bp      ...... bf:3 .. ra:5 ....0 .......... .          &X_bf rb=%x_frbp
+
+&X_bf_uim       bf uim rb
+@X_bf_uim       ...... bf:3 . uim:6 rb:5 .......... .           &X_bf_uim
+
+@X_bf_uim_bp    ...... bf:3 . uim:6 ....0 .......... .          &X_bf_uim rb=%x_frbp
+
 &X_bfl          bf l:bool ra rb
 @X_bfl          ...... bf:3 - l:1 ra:5 rb:5 ..........- &X_bfl
 
@@ -157,6 +169,14 @@ DMULQ           111111 ..... ..... ..... 0000100010 .   @X_tp_ap_bp_rc
 DDIV            111011 ..... ..... ..... 1000100010 .   @X_rc
 DDIVQ           111111 ..... ..... ..... 1000100010 .   @X_tp_ap_bp_rc
 
+### Decimal Floating-Point Compare Instructions
+
+DCMPU           111011 ... -- ..... ..... 1010000010 -  @X_bf
+DCMPUQ          111111 ... -- ..... ..... 1010000010 -  @X_bf_ap_bp
+
+DCMPO           111011 ... -- ..... ..... 0010000010 -  @X_bf
+DCMPOQ          111111 ... -- ..... ..... 0010000010 -  @X_bf_ap_bp
+
 ### Decimal Floating-Point Test Instructions
 
 DTSTDC          111011 ... -- ..... ...... 011000010 -  @Z22_bf_fra
@@ -165,6 +185,15 @@ DTSTDCQ         111111 ... -- ..... ...... 011000010 -  @Z22_bf_frap
 DTSTDG          111011 ... -- ..... ...... 011100010 -  @Z22_bf_fra
 DTSTDGQ         111111 ... -- ..... ...... 011100010 -  @Z22_bf_frap
 
+DTSTEX          111011 ... -- ..... ..... 0010100010 -  @X_bf
+DTSTEXQ         111111 ... -- ..... ..... 0010100010 -  @X_bf_ap_bp
+
+DTSTSF          111011 ... -- ..... ..... 1010100010 -  @X_bf
+DTSTSFQ         111111 ... -- ..... ..... 1010100010 -  @X_bf_a_bp
+
+DTSTSFI         111011 ... - ...... ..... 1010100011 -  @X_bf_uim
+DTSTSFIQ        111111 ... - ...... ..... 1010100011 -  @X_bf_uim_bp
+
 ### Decimal Floating-Point Conversion Instructions
 
 DCFFIXQQ        111111 ..... 00000 ..... 1111100010 -   @X_frtp_vrb
diff --git a/target/ppc/translate/dfp-impl.c.inc b/target/ppc/translate/dfp-impl.c.inc
index c54ea16106..011c3484b4 100644
--- a/target/ppc/translate/dfp-impl.c.inc
+++ b/target/ppc/translate/dfp-impl.c.inc
@@ -26,39 +26,32 @@ static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a)   \
     return true;                                             \
 }
 
-#define GEN_DFP_BF_A_B(name)                      \
-static void gen_##name(DisasContext *ctx)         \
-{                                                 \
-    TCGv_ptr ra, rb;                              \
-    if (unlikely(!ctx->fpu_enabled)) {            \
-        gen_exception(ctx, POWERPC_EXCP_FPU);     \
-        return;                                   \
-    }                                             \
-    gen_update_nip(ctx, ctx->base.pc_next - 4);            \
-    ra = gen_fprp_ptr(rA(ctx->opcode));           \
-    rb = gen_fprp_ptr(rB(ctx->opcode));           \
-    gen_helper_##name(cpu_crf[crfD(ctx->opcode)], \
-                      cpu_env, ra, rb);           \
-    tcg_temp_free_ptr(ra);                        \
-    tcg_temp_free_ptr(rb);                        \
+#define TRANS_DFP_BF_A_B(NAME)                               \
+static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a)   \
+{                                                            \
+    TCGv_ptr ra, rb;                                         \
+    REQUIRE_INSNS_FLAGS2(ctx, DFP);                          \
+    REQUIRE_FPU(ctx);                                        \
+    ra = gen_fprp_ptr(a->ra);                                \
+    rb = gen_fprp_ptr(a->rb);                                \
+    gen_helper_##NAME(cpu_crf[a->bf],                        \
+                      cpu_env, ra, rb);                      \
+    tcg_temp_free_ptr(ra);                                   \
+    tcg_temp_free_ptr(rb);                                   \
+    return true;                                             \
 }
 
-#define GEN_DFP_BF_I_B(name)                      \
-static void gen_##name(DisasContext *ctx)         \
-{                                                 \
-    TCGv_i32 uim;                                 \
-    TCGv_ptr rb;                                  \
-    if (unlikely(!ctx->fpu_enabled)) {            \
-        gen_exception(ctx, POWERPC_EXCP_FPU);     \
-        return;                                   \
-    }                                             \
-    gen_update_nip(ctx, ctx->base.pc_next - 4);            \
-    uim = tcg_const_i32(UIMM5(ctx->opcode));      \
-    rb = gen_fprp_ptr(rB(ctx->opcode));           \
-    gen_helper_##name(cpu_crf[crfD(ctx->opcode)], \
-                      cpu_env, uim, rb);          \
-    tcg_temp_free_i32(uim);                       \
-    tcg_temp_free_ptr(rb);                        \
+#define TRANS_DFP_BF_I_B(NAME)                               \
+static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a)   \
+{                                                            \
+    TCGv_ptr rb;                                             \
+    REQUIRE_INSNS_FLAGS2(ctx, DFP);                          \
+    REQUIRE_FPU(ctx);                                        \
+    rb = gen_fprp_ptr(a->rb);                                \
+    gen_helper_##NAME(cpu_crf[a->bf],                        \
+                      cpu_env, tcg_constant_i32(a->uim), rb);\
+    tcg_temp_free_ptr(rb);                                   \
+    return true;                                             \
 }
 
 #define TRANS_DFP_BF_A_DCM(NAME)                             \
@@ -171,20 +164,20 @@ TRANS_DFP_T_A_B_Rc(DMUL)
 TRANS_DFP_T_A_B_Rc(DMULQ)
 TRANS_DFP_T_A_B_Rc(DDIV)
 TRANS_DFP_T_A_B_Rc(DDIVQ)
-GEN_DFP_BF_A_B(dcmpu)
-GEN_DFP_BF_A_B(dcmpuq)
-GEN_DFP_BF_A_B(dcmpo)
-GEN_DFP_BF_A_B(dcmpoq)
+TRANS_DFP_BF_A_B(DCMPU)
+TRANS_DFP_BF_A_B(DCMPUQ)
+TRANS_DFP_BF_A_B(DCMPO)
+TRANS_DFP_BF_A_B(DCMPOQ)
 TRANS_DFP_BF_A_DCM(DTSTDC)
 TRANS_DFP_BF_A_DCM(DTSTDCQ)
 TRANS_DFP_BF_A_DCM(DTSTDG)
 TRANS_DFP_BF_A_DCM(DTSTDGQ)
-GEN_DFP_BF_A_B(dtstex)
-GEN_DFP_BF_A_B(dtstexq)
-GEN_DFP_BF_A_B(dtstsf)
-GEN_DFP_BF_A_B(dtstsfq)
-GEN_DFP_BF_I_B(dtstsfi)
-GEN_DFP_BF_I_B(dtstsfiq)
+TRANS_DFP_BF_A_B(DTSTEX)
+TRANS_DFP_BF_A_B(DTSTEXQ)
+TRANS_DFP_BF_A_B(DTSTSF)
+TRANS_DFP_BF_A_B(DTSTSFQ)
+TRANS_DFP_BF_I_B(DTSTSFI)
+TRANS_DFP_BF_I_B(DTSTSFIQ)
 GEN_DFP_T_B_U32_U32_Rc(dquai, SIMM5, RMC)
 GEN_DFP_T_B_U32_U32_Rc(dquaiq, SIMM5, RMC)
 GEN_DFP_T_A_B_I32_Rc(dqua, RMC)
@@ -216,7 +209,6 @@ GEN_DFP_T_FPR_I32_Rc(dscliq, rA, DCM)
 GEN_DFP_T_FPR_I32_Rc(dscri, rA, DCM)
 GEN_DFP_T_FPR_I32_Rc(dscriq, rA, DCM)
 
-#undef GEN_DFP_BF_A_B
 #undef GEN_DFP_T_B_U32_U32_Rc
 #undef GEN_DFP_T_A_B_I32_Rc
 #undef GEN_DFP_T_B_Rc
diff --git a/target/ppc/translate/dfp-ops.c.inc b/target/ppc/translate/dfp-ops.c.inc
index 38ea551488..e59425c8b2 100644
--- a/target/ppc/translate/dfp-ops.c.inc
+++ b/target/ppc/translate/dfp-ops.c.inc
@@ -1,9 +1,6 @@
 #define _GEN_DFP_LONG(name, op1, op2, mask) \
 GEN_HANDLER_E(name, 0x3B, op1, op2, mask, PPC_NONE, PPC2_DFP)
 
-#define _GEN_DFP_LONG_300(name, op1, op2, mask)                   \
-GEN_HANDLER_E(name, 0x3B, op1, op2, mask, PPC_NONE, PPC2_ISA300)
-
 #define _GEN_DFP_LONGx2(name, op1, op2, mask) \
 GEN_HANDLER_E(name, 0x3B, op1, 0x00 | op2, mask, PPC_NONE, PPC2_DFP), \
 GEN_HANDLER_E(name, 0x3B, op1, 0x10 | op2, mask, PPC_NONE, PPC2_DFP)
@@ -17,9 +14,6 @@ GEN_HANDLER_E(name, 0x3B, op1, 0x18 | op2, mask, PPC_NONE, PPC2_DFP)
 #define _GEN_DFP_QUAD(name, op1, op2, mask) \
 GEN_HANDLER_E(name, 0x3F, op1, op2, mask, PPC_NONE, PPC2_DFP)
 
-#define _GEN_DFP_QUAD_300(name, op1, op2, mask)             \
-GEN_HANDLER_E(name, 0x3F, op1, op2, mask, PPC_NONE, PPC2_ISA300)
-
 #define _GEN_DFP_QUADx2(name, op1, op2, mask) \
 GEN_HANDLER_E(name, 0x3F, op1, 0x00 | op2, mask, PPC_NONE, PPC2_DFP), \
 GEN_HANDLER_E(name, 0x3F, op1, 0x10 | op2, mask, PPC_NONE, PPC2_DFP)
@@ -42,21 +36,6 @@ _GEN_DFP_QUAD(name, op1, op2, 0x003F0000)
 #define GEN_DFP_T_Bp_Rc(name, op1, op2) \
 _GEN_DFP_QUAD(name, op1, op2, 0x001F0800)
 
-#define GEN_DFP_BF_A_B(name, op1, op2) \
-_GEN_DFP_LONG(name, op1, op2, 0x00000001)
-
-#define GEN_DFP_BF_A_B_300(name, op1, op2)          \
-_GEN_DFP_LONG_300(name, op1, op2, 0x00400001)
-
-#define GEN_DFP_BF_Ap_Bp(name, op1, op2) \
-_GEN_DFP_QUAD(name, op1, op2, 0x00610801)
-
-#define GEN_DFP_BF_A_Bp(name, op1, op2) \
-_GEN_DFP_QUAD(name, op1, op2, 0x00600801)
-
-#define GEN_DFP_BF_A_Bp_300(name, op1, op2)     \
-_GEN_DFP_QUAD_300(name, op1, op2, 0x00400001)
-
 #define GEN_DFP_T_A_B_RMC_Rc(name, op1, op2) \
 _GEN_DFP_LONGx4(name, op1, op2, 0x00000000)
 
@@ -96,16 +75,6 @@ _GEN_DFP_LONGx2(name, op1, op2, 0x00000000)
 #define GEN_DFP_Tp_Ap_SH_Rc(name, op1, op2) \
 _GEN_DFP_QUADx2(name, op1, op2, 0x00210000)
 
-GEN_DFP_BF_A_B(dcmpu, 0x02, 0x14),
-GEN_DFP_BF_Ap_Bp(dcmpuq, 0x02, 0x14),
-GEN_DFP_BF_A_B(dcmpo, 0x02, 0x04),
-GEN_DFP_BF_Ap_Bp(dcmpoq, 0x02, 0x04),
-GEN_DFP_BF_A_B(dtstex, 0x02, 0x05),
-GEN_DFP_BF_Ap_Bp(dtstexq, 0x02, 0x05),
-GEN_DFP_BF_A_B(dtstsf, 0x02, 0x15),
-GEN_DFP_BF_A_Bp(dtstsfq, 0x02, 0x15),
-GEN_DFP_BF_A_B_300(dtstsfi, 0x03, 0x15),
-GEN_DFP_BF_A_Bp_300(dtstsfiq, 0x03, 0x15),
 GEN_DFP_TE_T_B_RMC_Rc(dquai, 0x03, 0x02),
 GEN_DFP_TE_Tp_Bp_RMC_Rc(dquaiq, 0x03, 0x02),
 GEN_DFP_T_A_B_RMC_Rc(dqua, 0x03, 0x00),
-- 
2.25.1


