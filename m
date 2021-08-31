Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 969EB3FCBDE
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 18:53:01 +0200 (CEST)
Received: from localhost ([::1]:53794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL70O-0000QN-K2
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 12:53:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mL6sE-0007dR-AW; Tue, 31 Aug 2021 12:44:35 -0400
Received: from [201.28.113.2] (port=43158 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>)
 id 1mL6sB-0008P9-B8; Tue, 31 Aug 2021 12:44:34 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 31 Aug 2021 13:43:23 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 7E09E800930;
 Tue, 31 Aug 2021 13:43:21 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 09/19] target/ppc: Implement DCFFIXQQ
Date: Tue, 31 Aug 2021 13:39:57 -0300
Message-Id: <20210831164007.297781-10-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210831164007.297781-1-luis.pires@eldorado.org.br>
References: <20210831164007.297781-1-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 31 Aug 2021 16:43:23.0338 (UTC)
 FILETIME=[50295AA0:01D79E87]
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
Cc: Luis Pires <luis.pires@eldorado.org.br>, richard.henderson@linaro.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the following PowerISA v3.1 instruction:
dcffixqq: DFP Convert From Fixed Quadword Quad

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
---
 target/ppc/dfp_helper.c             | 11 +++++++++++
 target/ppc/helper.h                 |  1 +
 target/ppc/insn32.decode            |  8 ++++++++
 target/ppc/translate.c              |  7 ++++++-
 target/ppc/translate/dfp-impl.c.inc | 17 +++++++++++++++++
 5 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
index 07341a69f5..01a7ead783 100644
--- a/target/ppc/dfp_helper.c
+++ b/target/ppc/dfp_helper.c
@@ -970,6 +970,17 @@ static void CFFIX_PPs(struct PPC_DFP *dfp)
 DFP_HELPER_CFFIX(dcffix, 64)
 DFP_HELPER_CFFIX(dcffixq, 128)
 
+void helper_DCFFIXQQ(CPUPPCState *env, ppc_fprp_t *t, ppc_avr_t *b)
+{
+    struct PPC_DFP dfp;
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
index 4076aa281e..fff7bd46ad 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -734,6 +734,7 @@ DEF_HELPER_3(drsp, void, env, fprp, fprp)
 DEF_HELPER_3(drdpq, void, env, fprp, fprp)
 DEF_HELPER_3(dcffix, void, env, fprp, fprp)
 DEF_HELPER_3(dcffixq, void, env, fprp, fprp)
+DEF_HELPER_3(DCFFIXQQ, void, env, fprp, avr)
 DEF_HELPER_3(dctfix, void, env, fprp, fprp)
 DEF_HELPER_3(dctfixq, void, env, fprp, fprp)
 DEF_HELPER_4(ddedpd, void, env, fprp, fprp, i32)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 9fd8d6b817..92ea2d0739 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -43,6 +43,10 @@
 &X_bfl          bf l:bool ra rb
 @X_bfl          ...... bf:3 - l:1 ra:5 rb:5 ..........- &X_bfl
 
+&X_frtp_vrb     frtp vrb
+%x_frtp         22:4 !function=times_2
+@X_frtp_vrb     ...... ....0 ..... vrb:5 .......... .           &X_frtp_vrb frtp=%x_frtp
+
 ### Fixed-Point Load Instructions
 
 LBZ             100010 ..... ..... ................     @D
@@ -121,6 +125,10 @@ SETBCR          011111 ..... ..... ----- 0110100000 -   @X_bi
 SETNBC          011111 ..... ..... ----- 0111000000 -   @X_bi
 SETNBCR         011111 ..... ..... ----- 0111100000 -   @X_bi
 
+### Decimal Floating-Point Conversion Instructions
+
+DCFFIXQQ        111111 ..... 00000 ..... 1111100010 -   @X_frtp_vrb
+
 ## Vector Bit Manipulation Instruction
 
 VCFUGED         000100 ..... ..... ..... 10101001101    @VX
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 5489b4b6e0..c3739f7370 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7422,7 +7422,12 @@ static inline void set_avr64(int regno, TCGv_i64 src, bool high)
 /*
  * Helpers for decodetree used by !function for decoding arguments.
  */
-static int times_4(DisasContext *ctx, int x)
+static inline int times_2(DisasContext *ctx, int x)
+{
+    return x * 2;
+}
+
+static inline int times_4(DisasContext *ctx, int x)
 {
     return x * 4;
 }
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
2.25.1


