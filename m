Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD164BFDFE
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 17:00:54 +0100 (CET)
Received: from localhost ([::1]:33404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMXav-0004lD-2r
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 11:00:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nMWPK-00028s-9x; Tue, 22 Feb 2022 09:44:50 -0500
Received: from [187.72.171.209] (port=14718 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nMWPI-0006Am-52; Tue, 22 Feb 2022 09:44:49 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 22 Feb 2022 11:37:51 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id CEF7B80047A;
 Tue, 22 Feb 2022 11:37:50 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 45/47] target/ppc: implement plxsd/pstxsd
Date: Tue, 22 Feb 2022 11:36:43 -0300
Message-Id: <20220222143646.1268606-46-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 22 Feb 2022 14:37:51.0262 (UTC)
 FILETIME=[C4FC03E0:01D827F9]
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
Cc: Leandro Lupori <leandro.lupori@eldorado.org.br>, danielhb413@gmail.com,
 richard.henderson@linaro.org, groug@kaod.org, clg@kaod.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Leandro Lupori <leandro.lupori@eldorado.org.br>

Implement instructions plxsd/pstxsd and port lxsd/stxsd to decode
tree.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/insn32.decode            |  2 ++
 target/ppc/insn64.decode            | 10 ++++++
 target/ppc/translate.c              | 14 ++------
 target/ppc/translate/vsx-impl.c.inc | 55 +++++++++++++++++++++++++++--
 4 files changed, 67 insertions(+), 14 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 8964898f20..d84ff333ec 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -600,6 +600,8 @@ VCLRRB          000100 ..... ..... ..... 00111001101    @VX
 
 # VSX Load/Store Instructions
 
+LXSD            111001 ..... ..... .............. 10    @DS
+STXSD           111101 ..... ..... .............. 10    @DS
 LXV             111101 ..... ..... ............ . 001   @DQ_TSX
 STXV            111101 ..... ..... ............ . 101   @DQ_TSX
 LXVP            000110 ..... ..... ............ 0000    @DQ_TSXP
diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
index fdb859f62d..b7426f5b24 100644
--- a/target/ppc/insn64.decode
+++ b/target/ppc/insn64.decode
@@ -32,6 +32,10 @@
                 ...... ..... ra:5 ................       \
                 &PLS_D si=%pls_si rt=%rt_tsxp
 
+@8LS_D          ...... .. . .. r:1 .. .................. \
+                ...... rt:5 ra:5 ................        \
+                &PLS_D si=%pls_si
+
 # Format 8RR:D
 %8rr_si         32:s16 0:16
 %8rr_xt         16:1 21:5
@@ -180,6 +184,12 @@ PSTFD           000001 10 0--.-- .................. \
 
 ### VSX instructions
 
+PLXSD           000001 00 0--.-- .................. \
+                101010 ..... ..... ................     @8LS_D
+
+PSTXSD          000001 00 0--.-- .................. \
+                101110 ..... ..... ................     @8LS_D
+
 PLXV            000001 00 0--.-- .................. \
                 11001 ...... ..... ................     @8LS_D_TSX
 PSTXV           000001 00 0--.-- .................. \
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index b647430012..aa860d6bf9 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -6668,7 +6668,7 @@ static bool resolve_PLS_D(DisasContext *ctx, arg_D *d, arg_PLS_D *a)
 
 #include "translate/branch-impl.c.inc"
 
-/* Handles lfdp, lxsd, lxssp */
+/* Handles lfdp, lxssp */
 static void gen_dform39(DisasContext *ctx)
 {
     switch (ctx->opcode & 0x3) {
@@ -6677,11 +6677,6 @@ static void gen_dform39(DisasContext *ctx)
             return gen_lfdp(ctx);
         }
         break;
-    case 2: /* lxsd */
-        if (ctx->insns_flags2 & PPC2_ISA300) {
-            return gen_lxsd(ctx);
-        }
-        break;
     case 3: /* lxssp */
         if (ctx->insns_flags2 & PPC2_ISA300) {
             return gen_lxssp(ctx);
@@ -6691,7 +6686,7 @@ static void gen_dform39(DisasContext *ctx)
     return gen_invalid(ctx);
 }
 
-/* handles stfdp, lxv, stxsd, stxssp lxvx */
+/* handles stfdp, lxv, stxssp lxvx */
 static void gen_dform3D(DisasContext *ctx)
 {
     if ((ctx->opcode & 3) != 1) { /* DS-FORM */
@@ -6701,11 +6696,6 @@ static void gen_dform3D(DisasContext *ctx)
                 return gen_stfdp(ctx);
             }
             break;
-        case 2: /* stxsd */
-            if (ctx->insns_flags2 & PPC2_ISA300) {
-                return gen_stxsd(ctx);
-            }
-            break;
         case 3: /* stxssp */
             if (ctx->insns_flags2 & PPC2_ISA300) {
                 return gen_stxssp(ctx);
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 2930537b8e..cabadcf106 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -309,7 +309,6 @@ static void gen_##name(DisasContext *ctx)                         \
     tcg_temp_free_i64(xth);                                       \
 }
 
-VSX_LOAD_SCALAR_DS(lxsd, ld64_i64)
 VSX_LOAD_SCALAR_DS(lxssp, ld32fs)
 
 #define VSX_STORE_SCALAR(name, operation)                     \
@@ -482,7 +481,6 @@ static void gen_##name(DisasContext *ctx)                         \
     tcg_temp_free_i64(xth);                                       \
 }
 
-VSX_STORE_SCALAR_DS(stxsd, st64_i64)
 VSX_STORE_SCALAR_DS(stxssp, st32fs)
 
 static void gen_mfvsrwz(DisasContext *ctx)
@@ -2281,6 +2279,57 @@ static bool do_lstxv_X(DisasContext *ctx, arg_X *a, bool store, bool paired)
     return do_lstxv(ctx, a->ra, cpu_gpr[a->rb], a->rt, store, paired);
 }
 
+static bool do_lstxsd(DisasContext *ctx, int rt, int ra, TCGv displ, bool store)
+{
+    TCGv ea;
+    TCGv_i64 xt;
+    MemOp mop;
+
+    if (store) {
+        REQUIRE_VECTOR(ctx);
+    } else {
+        REQUIRE_VSX(ctx);
+    }
+
+    xt = tcg_temp_new_i64();
+    mop = DEF_MEMOP(MO_UQ);
+
+    gen_set_access_type(ctx, ACCESS_INT);
+    ea = do_ea_calc(ctx, ra, displ);
+
+    if (store) {
+        get_cpu_vsr(xt, rt + 32, true);
+        tcg_gen_qemu_st_i64(xt, ea, ctx->mem_idx, mop);
+    } else {
+        tcg_gen_qemu_ld_i64(xt, ea, ctx->mem_idx, mop);
+        set_cpu_vsr(rt + 32, xt, true);
+        set_cpu_vsr(rt + 32, tcg_constant_i64(0), false);
+    }
+
+    tcg_temp_free(ea);
+    tcg_temp_free_i64(xt);
+
+    return true;
+}
+
+static bool do_lstxsd_DS(DisasContext *ctx, arg_D *a, bool store)
+{
+    return do_lstxsd(ctx, a->rt, a->ra, tcg_constant_tl(a->si), store);
+}
+
+static bool do_plstxsd_PLS_D(DisasContext *ctx, arg_PLS_D *a, bool store)
+{
+    arg_D d;
+
+    if (!resolve_PLS_D(ctx, &d, a)) {
+        return true;
+    }
+
+    return do_lstxsd(ctx, d.rt, d.ra, tcg_constant_tl(d.si), store);
+}
+
+TRANS_FLAGS2(ISA300, LXSD, do_lstxsd_DS, false)
+TRANS_FLAGS2(ISA300, STXSD, do_lstxsd_DS, true)
 TRANS_FLAGS2(ISA300, STXV, do_lstxv_D, true, false)
 TRANS_FLAGS2(ISA300, LXV, do_lstxv_D, false, false)
 TRANS_FLAGS2(ISA310, STXVP, do_lstxv_D, true, true)
@@ -2289,6 +2338,8 @@ TRANS_FLAGS2(ISA300, STXVX, do_lstxv_X, true, false)
 TRANS_FLAGS2(ISA300, LXVX, do_lstxv_X, false, false)
 TRANS_FLAGS2(ISA310, STXVPX, do_lstxv_X, true, true)
 TRANS_FLAGS2(ISA310, LXVPX, do_lstxv_X, false, true)
+TRANS64_FLAGS2(ISA310, PLXSD, do_plstxsd_PLS_D, false)
+TRANS64_FLAGS2(ISA310, PSTXSD, do_plstxsd_PLS_D, true)
 TRANS64_FLAGS2(ISA310, PSTXV, do_lstxv_PLS_D, true, false)
 TRANS64_FLAGS2(ISA310, PLXV, do_lstxv_PLS_D, false, false)
 TRANS64_FLAGS2(ISA310, PSTXVP, do_lstxv_PLS_D, true, true)
-- 
2.25.1


