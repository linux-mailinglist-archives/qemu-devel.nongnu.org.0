Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A54E604662
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 15:09:14 +0200 (CEST)
Received: from localhost ([::1]:38952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol8op-00079s-BB
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 09:09:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1ol8YB-00051m-Tc; Wed, 19 Oct 2022 08:52:00 -0400
Received: from [200.168.210.66] (port=3639 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1ol8Y8-00025u-FF; Wed, 19 Oct 2022 08:51:59 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 19 Oct 2022 09:50:42 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 74CC8800278;
 Wed, 19 Oct 2022 09:50:42 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: richard.henderson@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v3 01/12] target/ppc: Moved VMLADDUHM to decodetree and use
 gvec
Date: Wed, 19 Oct 2022 09:50:29 -0300
Message-Id: <20221019125040.48028-2-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221019125040.48028-1-lucas.araujo@eldorado.org.br>
References: <20221019125040.48028-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 19 Oct 2022 12:50:42.0781 (UTC)
 FILETIME=[6609E8D0:01D8E3B9]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

This patch moves VMLADDUHM to decodetree a creates a gvec implementation
using mul_vec and add_vec.

rept    loop    master             patch
8       12500   0,01810500         0,00903100 (-50.1%)
25      4000    0,01739400         0,00747700 (-57.0%)
100     1000    0,01843600         0,00901400 (-51.1%)
500     200     0,02574600         0,01971000 (-23.4%)
2500    40      0,05921600         0,07121800 (+20.3%)
8000    12      0,15326700         0,21725200 (+41.7%)

The significant difference in performance when REPT is low and LOOP is
high I think is due to the fact that the new implementation has a higher
translation time, as when using a helper only 5 TCGop are used but with
the patch a total of 10 TCGop are needed (Power lacks a direct mul_vec
equivalent so this instruction is implemented with the help of 5 others,
vmuleu, vmulou, vmrgh, vmrgl and vpkum).

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/helper.h                 |  2 +-
 target/ppc/insn32.decode            |  2 ++
 target/ppc/int_helper.c             |  3 +-
 target/ppc/translate.c              |  1 -
 target/ppc/translate/vmx-impl.c.inc | 48 ++++++++++++++++++-----------
 5 files changed, 35 insertions(+), 21 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 57eee07256..9c562ab00e 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -264,7 +264,7 @@ DEF_HELPER_FLAGS_4(VMSUMUHM, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
 DEF_HELPER_5(VMSUMUHS, void, env, avr, avr, avr, avr)
 DEF_HELPER_FLAGS_4(VMSUMSHM, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
 DEF_HELPER_5(VMSUMSHS, void, env, avr, avr, avr, avr)
-DEF_HELPER_FLAGS_4(vmladduhm, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
+DEF_HELPER_FLAGS_5(VMLADDUHM, TCG_CALL_NO_RWG, void, avr, avr, avr, avr, i32)
 DEF_HELPER_FLAGS_2(mtvscr, TCG_CALL_NO_RWG, void, env, i32)
 DEF_HELPER_FLAGS_1(mfvscr, TCG_CALL_NO_RWG, i32, env)
 DEF_HELPER_3(lvebx, void, env, avr, tl)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index a5249ee32c..7445455a12 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -693,6 +693,8 @@ VMSUMUHS        000100 ..... ..... ..... ..... 100111   @VA
 VMSUMCUD        000100 ..... ..... ..... ..... 010111   @VA
 VMSUMUDM        000100 ..... ..... ..... ..... 100011   @VA
 
+VMLADDUHM       000100 ..... ..... ..... ..... 100010   @VA
+
 ## Vector String Instructions
 
 VSTRIBL         000100 ..... 00000 ..... . 0000001101   @VX_tb_rc
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 696096100b..0d25000b2a 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -974,7 +974,8 @@ void helper_vmhraddshs(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a,
     }
 }
 
-void helper_vmladduhm(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
+void helper_VMLADDUHM(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c,
+                      uint32_t v)
 {
     int i;
 
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index e810842925..11f729c60c 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -6921,7 +6921,6 @@ GEN_HANDLER(lvsl, 0x1f, 0x06, 0x00, 0x00000001, PPC_ALTIVEC),
 GEN_HANDLER(lvsr, 0x1f, 0x06, 0x01, 0x00000001, PPC_ALTIVEC),
 GEN_HANDLER(mfvscr, 0x04, 0x2, 0x18, 0x001ff800, PPC_ALTIVEC),
 GEN_HANDLER(mtvscr, 0x04, 0x2, 0x19, 0x03ff0000, PPC_ALTIVEC),
-GEN_HANDLER(vmladduhm, 0x04, 0x11, 0xFF, 0x00000000, PPC_ALTIVEC),
 #if defined(TARGET_PPC64)
 GEN_HANDLER_E(maddhd_maddhdu, 0x04, 0x18, 0xFF, 0x00000000, PPC_NONE,
               PPC2_ISA300),
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index e644ad3236..9f18c6d4f2 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -2523,24 +2523,6 @@ static void glue(gen_, name0##_##name1)(DisasContext *ctx)              \
 
 GEN_VAFORM_PAIRED(vmhaddshs, vmhraddshs, 16)
 
-static void gen_vmladduhm(DisasContext *ctx)
-{
-    TCGv_ptr ra, rb, rc, rd;
-    if (unlikely(!ctx->altivec_enabled)) {
-        gen_exception(ctx, POWERPC_EXCP_VPU);
-        return;
-    }
-    ra = gen_avr_ptr(rA(ctx->opcode));
-    rb = gen_avr_ptr(rB(ctx->opcode));
-    rc = gen_avr_ptr(rC(ctx->opcode));
-    rd = gen_avr_ptr(rD(ctx->opcode));
-    gen_helper_vmladduhm(rd, ra, rb, rc);
-    tcg_temp_free_ptr(ra);
-    tcg_temp_free_ptr(rb);
-    tcg_temp_free_ptr(rc);
-    tcg_temp_free_ptr(rd);
-}
-
 static bool do_va_helper(DisasContext *ctx, arg_VA *a,
     void (*gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr))
 {
@@ -2569,6 +2551,36 @@ TRANS_FLAGS2(ALTIVEC_207, VSUBECUQ, do_va_helper, gen_helper_VSUBECUQ)
 TRANS_FLAGS(ALTIVEC, VPERM, do_va_helper, gen_helper_VPERM)
 TRANS_FLAGS2(ISA300, VPERMR, do_va_helper, gen_helper_VPERMR)
 
+static void gen_vmladduhm_vec(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b,
+                              TCGv_vec c)
+{
+    tcg_gen_mul_vec(vece, t, a, b);
+    tcg_gen_add_vec(vece, t, t, c);
+}
+
+static bool trans_VMLADDUHM(DisasContext *ctx, arg_VA *a)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_add_vec, INDEX_op_mul_vec, 0
+    };
+
+    static const GVecGen4 op = {
+        .fno = gen_helper_VMLADDUHM,
+        .fniv = gen_vmladduhm_vec,
+        .opt_opc = vecop_list,
+        .vece = MO_16
+    };
+
+    REQUIRE_INSNS_FLAGS(ctx, ALTIVEC);
+    REQUIRE_VECTOR(ctx);
+
+    tcg_gen_gvec_4(avr_full_offset(a->vrt), avr_full_offset(a->vra),
+                   avr_full_offset(a->vrb), avr_full_offset(a->rc),
+                   16, 16, &op);
+
+    return true;
+}
+
 static bool trans_VSEL(DisasContext *ctx, arg_VA *a)
 {
     REQUIRE_INSNS_FLAGS(ctx, ALTIVEC);
-- 
2.37.3


