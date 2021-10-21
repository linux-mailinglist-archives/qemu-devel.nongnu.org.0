Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B30436BC9
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 22:09:52 +0200 (CEST)
Received: from localhost ([::1]:45016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdeNq-00065F-Ce
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 16:09:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mde7f-00037S-Vd; Thu, 21 Oct 2021 15:53:07 -0400
Received: from [201.28.113.2] (port=46784 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mde7d-0005Hb-M5; Thu, 21 Oct 2021 15:53:07 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 21 Oct 2021 16:47:07 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 504C9800145;
 Thu, 21 Oct 2021 16:47:07 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 32/33] target/ppc: Implement
 xxblendvb/xxblendvh/xxblendvw/xxblendvd instructions
Date: Thu, 21 Oct 2021 16:45:46 -0300
Message-Id: <20211021194547.672988-33-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 21 Oct 2021 19:47:07.0858 (UTC)
 FILETIME=[6E5ADB20:01D7C6B4]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: lucas.castro@eldorado.org.br, richard.henderson@linaro.org, groug@kaod.org,
 luis.pires@eldorado.org.br, Bruno Larsen <bruno.larsen@eldorado.org.br>,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/helper.h                 |  4 +++
 target/ppc/insn64.decode            | 19 ++++++++++
 target/ppc/int_helper.c             | 15 ++++++++
 target/ppc/translate/vsx-impl.c.inc | 55 +++++++++++++++++++++++++++++
 4 files changed, 93 insertions(+)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index ac8ab7e436..67c639ada7 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -522,6 +522,10 @@ DEF_HELPER_4(xxpermr, void, env, vsr, vsr, vsr)
 DEF_HELPER_4(xxextractuw, void, env, vsr, vsr, i32)
 DEF_HELPER_4(xxinsertw, void, env, vsr, vsr, i32)
 DEF_HELPER_3(xvxsigsp, void, env, vsr, vsr)
+DEF_HELPER_5(XXBLENDVB, void, vsr, vsr, vsr, vsr, i32)
+DEF_HELPER_5(XXBLENDVH, void, vsr, vsr, vsr, vsr, i32)
+DEF_HELPER_5(XXBLENDVW, void, vsr, vsr, vsr, vsr, i32)
+DEF_HELPER_5(XXBLENDVD, void, vsr, vsr, vsr, vsr, i32)
 
 DEF_HELPER_2(efscfsi, i32, env, i32)
 DEF_HELPER_2(efscfui, i32, env, i32)
diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
index e2cdaadcd3..c1965dca17 100644
--- a/target/ppc/insn64.decode
+++ b/target/ppc/insn64.decode
@@ -44,6 +44,16 @@
                 ...... ..... ....  . ................ \
                 &8RR_D si=%8rr_si xt=%8rr_xt
 
+# Format XX4
+&XX4            xt xa xb xc
+%xx4_xt         0:1 21:5
+%xx4_xa         2:1 16:5
+%xx4_xb         1:1 11:5
+%xx4_xc         3:1  6:5
+@XX4            ........ ........ ........ ........ \
+                ...... ..... ..... ..... ..... .. .... \
+                &XX4 xt=%xx4_xt xa=%xx4_xa xb=%xx4_xb xc=%xx4_xc
+
 ### Fixed-Point Load Instructions
 
 PLBZ            000001 10 0--.-- .................. \
@@ -175,3 +185,12 @@ XXSPLTIW        000001 01 0000 -- -- ................ \
                 100000 ..... 0011 . ................    @8RR_D
 XXSPLTI32DX     000001 01 0000 -- -- ................ \
                 100000 ..... 000 .. ................    @8RR_D_IX
+
+XXBLENDVD       000001 01 0000 -- ------------------ \
+                100001 ..... ..... ..... ..... 11 ....  @XX4
+XXBLENDVW       000001 01 0000 -- ------------------ \
+                100001 ..... ..... ..... ..... 10 ....  @XX4
+XXBLENDVH       000001 01 0000 -- ------------------ \
+                100001 ..... ..... ..... ..... 01 ....  @XX4
+XXBLENDVB       000001 01 0000 -- ------------------ \
+                100001 ..... ..... ..... ..... 00 ....  @XX4
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 1577ea8788..4f56e83d46 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1771,6 +1771,21 @@ void helper_xxinsertw(CPUPPCState *env, ppc_vsr_t *xt,
     *xt = t;
 }
 
+#define XXBLEND(name, sz) \
+void glue(helper_XXBLENDV, name)(ppc_avr_t *t, ppc_avr_t *a, ppc_avr_t *b,  \
+                                 ppc_avr_t *c, uint32_t desc)               \
+{                                                                           \
+    for (int i = 0; i < ARRAY_SIZE(t->glue(u, sz)); i++) {                  \
+        t->glue(u, sz)[i] = (c->glue(s, sz)[i] >> (sz - 1)) ?               \
+            b->glue(u, sz)[i] : a->glue(u, sz)[i];                          \
+    }                                                                       \
+}
+XXBLEND(B, 8)
+XXBLEND(H, 16)
+XXBLEND(W, 32)
+XXBLEND(D, 64)
+#undef XXBLEND
+
 #define VEXT_SIGNED(name, element, cast)                            \
 void helper_##name(ppc_avr_t *r, ppc_avr_t *b)                      \
 {                                                                   \
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index f953a597c7..4619d7f238 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -2136,6 +2136,61 @@ TRANS64(PLXV, do_lstxv_PLS_D, false, false)
 TRANS64(PSTXVP, do_lstxv_PLS_D, true, true)
 TRANS64(PLXVP, do_lstxv_PLS_D, false, true)
 
+static void gen_xxblendv_vec(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b,
+                             TCGv_vec c)
+{
+    TCGv_vec tmp = tcg_temp_new_vec_matching(c);
+    tcg_gen_sari_vec(vece, tmp, c, (8 << vece) - 1);
+    tcg_gen_bitsel_vec(vece, t, tmp, b, a);
+    tcg_temp_free_vec(tmp);
+}
+
+static bool do_xxblendv(DisasContext *ctx, arg_XX4 *a, unsigned vece)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_sari_vec, 0
+    };
+    static const GVecGen4 ops[4] = {
+        {
+            .fniv = gen_xxblendv_vec,
+            .fno = gen_helper_XXBLENDVB,
+            .opt_opc = vecop_list,
+            .vece = MO_8
+        },
+        {
+            .fniv = gen_xxblendv_vec,
+            .fno = gen_helper_XXBLENDVH,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fniv = gen_xxblendv_vec,
+            .fno = gen_helper_XXBLENDVW,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fniv = gen_xxblendv_vec,
+            .fno = gen_helper_XXBLENDVD,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        }
+    };
+
+    REQUIRE_VSX(ctx);
+
+    tcg_gen_gvec_4(vsr_full_offset(a->xt), vsr_full_offset(a->xa),
+                   vsr_full_offset(a->xb), vsr_full_offset(a->xc),
+                   16, 16, &ops[vece]);
+
+    return true;
+}
+
+TRANS(XXBLENDVB, do_xxblendv, MO_8)
+TRANS(XXBLENDVH, do_xxblendv, MO_16)
+TRANS(XXBLENDVW, do_xxblendv, MO_32)
+TRANS(XXBLENDVD, do_xxblendv, MO_64)
+
 #undef GEN_XX2FORM
 #undef GEN_XX3FORM
 #undef GEN_XX2IFORM
-- 
2.25.1


