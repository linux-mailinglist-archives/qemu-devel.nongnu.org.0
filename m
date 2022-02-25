Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D01594C51AC
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 23:41:59 +0100 (CET)
Received: from localhost ([::1]:57730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNjHi-0007nL-OD
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 17:41:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nNhza-0003N7-Hx; Fri, 25 Feb 2022 16:19:10 -0500
Received: from [187.72.171.209] (port=45484 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nNhzY-00054b-JD; Fri, 25 Feb 2022 16:19:10 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 25 Feb 2022 18:10:02 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id BDA2E8001D1;
 Fri, 25 Feb 2022 18:10:01 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v5 49/49] target/ppc: implement lxvr[bhwd]/stxvr[bhwd]x
Date: Fri, 25 Feb 2022 18:09:36 -0300
Message-Id: <20220225210936.1749575-50-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
References: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Feb 2022 21:10:02.0173 (UTC)
 FILETIME=[0DBD56D0:01D82A8C]
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
 clg@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Lucas Coutinho <lucas.coutinho@eldorado.org.br>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lucas Coutinho <lucas.coutinho@eldorado.org.br>

Implement the following PowerISA v3.1 instuctions:
lxvrbx: Load VSX Vector Rightmost Byte Indexed X-form
lxvrhx: Load VSX Vector Rightmost Halfword Indexed X-form
lxvrwx: Load VSX Vector Rightmost Word Indexed X-form
lxvrdx: Load VSX Vector Rightmost Doubleword Indexed X-form

stxvrbx: Store VSX Vector Rightmost Byte Indexed X-form
stxvrhx: Store VSX Vector Rightmost Halfword Indexed X-form
stxvrwx: Store VSX Vector Rightmost Word Indexed X-form
stxvrdx: Store VSX Vector Rightmost Doubleword Indexed X-form

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Lucas Coutinho <lucas.coutinho@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/insn32.decode            |  8 +++++++
 target/ppc/translate/vsx-impl.c.inc | 35 +++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 1641a31894..ac2d3da9a7 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -614,6 +614,14 @@ LXVX            011111 ..... ..... ..... 0100 - 01100 . @X_TSX
 STXVX           011111 ..... ..... ..... 0110001100 .   @X_TSX
 LXVPX           011111 ..... ..... ..... 0101001101 -   @X_TSXP
 STXVPX          011111 ..... ..... ..... 0111001101 -   @X_TSXP
+LXVRBX          011111 ..... ..... ..... 0000001101 .   @X_TSX
+LXVRHX          011111 ..... ..... ..... 0000101101 .   @X_TSX
+LXVRWX          011111 ..... ..... ..... 0001001101 .   @X_TSX
+LXVRDX          011111 ..... ..... ..... 0001101101 .   @X_TSX
+STXVRBX         011111 ..... ..... ..... 0010001101 .   @X_TSX
+STXVRHX         011111 ..... ..... ..... 0010101101 .   @X_TSX
+STXVRWX         011111 ..... ..... ..... 0011001101 .   @X_TSX
+STXVRDX         011111 ..... ..... ..... 0011101101 .   @X_TSX
 
 ## VSX Scalar Multiply-Add Instructions
 
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index a980a79b78..2ffeab5287 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -2363,6 +2363,41 @@ TRANS64_FLAGS2(ISA310, PLXV, do_lstxv_PLS_D, false, false)
 TRANS64_FLAGS2(ISA310, PSTXVP, do_lstxv_PLS_D, true, true)
 TRANS64_FLAGS2(ISA310, PLXVP, do_lstxv_PLS_D, false, true)
 
+static bool do_lstrm(DisasContext *ctx, arg_X *a, MemOp mop, bool store)
+{
+    TCGv ea;
+    TCGv_i64 xt;
+
+    REQUIRE_VSX(ctx);
+
+    xt = tcg_temp_new_i64();
+
+    gen_set_access_type(ctx, ACCESS_INT);
+    ea = do_ea_calc(ctx, a->ra , cpu_gpr[a->rb]);
+
+    if (store) {
+        get_cpu_vsr(xt, a->rt, false);
+        tcg_gen_qemu_st_i64(xt, ea, ctx->mem_idx, mop);
+    } else {
+        tcg_gen_qemu_ld_i64(xt, ea, ctx->mem_idx, mop);
+        set_cpu_vsr(a->rt, xt, false);
+        set_cpu_vsr(a->rt, tcg_constant_i64(0), true);
+    }
+
+    tcg_temp_free(ea);
+    tcg_temp_free_i64(xt);
+    return true;
+}
+
+TRANS_FLAGS2(ISA310, LXVRBX, do_lstrm, DEF_MEMOP(MO_UB), false)
+TRANS_FLAGS2(ISA310, LXVRHX, do_lstrm, DEF_MEMOP(MO_UW), false)
+TRANS_FLAGS2(ISA310, LXVRWX, do_lstrm, DEF_MEMOP(MO_UL), false)
+TRANS_FLAGS2(ISA310, LXVRDX, do_lstrm, DEF_MEMOP(MO_UQ), false)
+TRANS_FLAGS2(ISA310, STXVRBX, do_lstrm, DEF_MEMOP(MO_UB), true)
+TRANS_FLAGS2(ISA310, STXVRHX, do_lstrm, DEF_MEMOP(MO_UW), true)
+TRANS_FLAGS2(ISA310, STXVRWX, do_lstrm, DEF_MEMOP(MO_UL), true)
+TRANS_FLAGS2(ISA310, STXVRDX, do_lstrm, DEF_MEMOP(MO_UQ), true)
+
 static void gen_xxeval_i64(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b, TCGv_i64 c,
                            int64_t imm)
 {
-- 
2.25.1


