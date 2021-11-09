Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B01D044A6C0
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 07:17:57 +0100 (CET)
Received: from localhost ([::1]:44196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkKSC-0002Yc-Pg
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 01:17:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK3l-0004UF-Et; Tue, 09 Nov 2021 00:52:44 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:43087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK3h-0006h4-VV; Tue, 09 Nov 2021 00:52:40 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HpHDp0pmQz4xdp; Tue,  9 Nov 2021 16:52:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636437130;
 bh=UlNbVBKPatAm87XjNPNH8pkTdAuw/DyJqkdNgzMdRIY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jhVY+d2Rzsw2vTNbSe0ekH7B81muFEmtAopS9WXbxu0tCX3JHTs6ARfdc0aq2YtL6
 05H/gbdP7lx74DkzXCAQbeb+MlhQOVen/q24Axy2Gt+tFi4oaMyNHytZe2rkX3KPCf
 iPTgn3w1tiGMRe3j7+VYh83ZD/H91Ovk1M00iFho=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org, clg@kaod.org, danielhb413@gmail.com,
 groug@kaod.org
Subject: [PULL 14/54] target/ppc: Implement DCFFIXQQ
Date: Tue,  9 Nov 2021 16:51:24 +1100
Message-Id: <20211109055204.230765-15-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211109055204.230765-1-david@gibson.dropbear.id.au>
References: <20211109055204.230765-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Luis Pires <luis.pires@eldorado.org.br>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Luis Pires <luis.pires@eldorado.org.br>

Implement the following PowerISA v3.1 instruction:
dcffixqq: DFP Convert From Fixed Quadword Quad

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211029192417.400707-5-luis.pires@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/dfp_helper.c             | 12 ++++++++++++
 target/ppc/helper.h                 |  1 +
 target/ppc/insn32.decode            |  8 ++++++++
 target/ppc/translate.c              |  5 +++++
 target/ppc/translate/dfp-impl.c.inc | 17 +++++++++++++++++
 5 files changed, 43 insertions(+)

diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
index 07341a69f5..6b837c4450 100644
--- a/target/ppc/dfp_helper.c
+++ b/target/ppc/dfp_helper.c
@@ -970,6 +970,18 @@ static void CFFIX_PPs(struct PPC_DFP *dfp)
 DFP_HELPER_CFFIX(dcffix, 64)
 DFP_HELPER_CFFIX(dcffixq, 128)
 
+void helper_DCFFIXQQ(CPUPPCState *env, ppc_fprp_t *t, ppc_avr_t *b)
+{
+    struct PPC_DFP dfp;
+
+    dfp_prepare_decimal128(&dfp, NULL, NULL, env);
+    decNumberFromInt128(&dfp.t, (uint64_t)b->VsrD(1), (int64_t)b->VsrD(0));
+    dfp_finalize_decimal128(&dfp);
+    CFFIX_PPs(&dfp);
+
+    set_dfp128(t, &dfp.vt);
+}
+
 #define DFP_HELPER_CTFIX(op, size)                                            \
 void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b)              \
 {                                                                             \
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 808c582382..8e4f67ceac 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -736,6 +736,7 @@ DEF_HELPER_3(drsp, void, env, fprp, fprp)
 DEF_HELPER_3(drdpq, void, env, fprp, fprp)
 DEF_HELPER_3(dcffix, void, env, fprp, fprp)
 DEF_HELPER_3(dcffixq, void, env, fprp, fprp)
+DEF_HELPER_3(DCFFIXQQ, void, env, fprp, avr)
 DEF_HELPER_3(dctfix, void, env, fprp, fprp)
 DEF_HELPER_3(dctfixq, void, env, fprp, fprp)
 DEF_HELPER_4(ddedpd, void, env, fprp, fprp, i32)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index e13f920702..36586dfa59 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -50,6 +50,10 @@
 &X_bfl          bf l:bool ra rb
 @X_bfl          ...... bf:3 - l:1 ra:5 rb:5 ..........- &X_bfl
 
+&X_frtp_vrb     frtp vrb
+%x_frtp         22:4 !function=times_2
+@X_frtp_vrb     ...... ....0 ..... vrb:5 .......... .           &X_frtp_vrb frtp=%x_frtp
+
 ### Fixed-Point Load Instructions
 
 LBZ             100010 ..... ..... ................     @D
@@ -160,6 +164,10 @@ SETBCR          011111 ..... ..... ----- 0110100000 -   @X_bi
 SETNBC          011111 ..... ..... ----- 0111000000 -   @X_bi
 SETNBCR         011111 ..... ..... ----- 0111100000 -   @X_bi
 
+### Decimal Floating-Point Conversion Instructions
+
+DCFFIXQQ        111111 ..... 00000 ..... 1111100010 -   @X_frtp_vrb
+
 ## Vector Bit Manipulation Instruction
 
 VCFUGED         000100 ..... ..... ..... 10101001101    @VX
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index d4e72affa6..486339d402 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7305,6 +7305,11 @@ static inline void set_avr64(int regno, TCGv_i64 src, bool high)
 /*
  * Helpers for decodetree used by !function for decoding arguments.
  */
+static int times_2(DisasContext *ctx, int x)
+{
+    return x * 2;
+}
+
 static int times_4(DisasContext *ctx, int x)
 {
     return x * 4;
diff --git a/target/ppc/translate/dfp-impl.c.inc b/target/ppc/translate/dfp-impl.c.inc
index 6c556dc2e1..d5b66567a6 100644
--- a/target/ppc/translate/dfp-impl.c.inc
+++ b/target/ppc/translate/dfp-impl.c.inc
@@ -230,3 +230,20 @@ GEN_DFP_T_FPR_I32_Rc(dscriq, rA, DCM)
 #undef GEN_DFP_T_A_B_I32_Rc
 #undef GEN_DFP_T_B_Rc
 #undef GEN_DFP_T_FPR_I32_Rc
+
+static bool trans_DCFFIXQQ(DisasContext *ctx, arg_DCFFIXQQ *a)
+{
+    TCGv_ptr rt, rb;
+
+    REQUIRE_INSNS_FLAGS2(ctx, DFP);
+    REQUIRE_FPU(ctx);
+    REQUIRE_VECTOR(ctx);
+
+    rt = gen_fprp_ptr(a->frtp);
+    rb = gen_avr_ptr(a->vrb);
+    gen_helper_DCFFIXQQ(cpu_env, rt, rb);
+    tcg_temp_free_ptr(rt);
+    tcg_temp_free_ptr(rb);
+
+    return true;
+}
-- 
2.33.1


