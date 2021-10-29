Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DE64404A4
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 23:07:00 +0200 (CEST)
Received: from localhost ([::1]:53594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgZ5W-0006dN-Vh
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 17:06:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mgYTb-00054I-Of; Fri, 29 Oct 2021 16:27:47 -0400
Received: from [201.28.113.2] (port=43261 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mgYTY-0002IC-GN; Fri, 29 Oct 2021 16:27:47 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 29 Oct 2021 17:26:32 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id DE9A0800B36;
 Fri, 29 Oct 2021 17:26:31 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 21/34] target/ppc: receive high/low as argument in
 get/set_cpu_vsr
Date: Fri, 29 Oct 2021 17:24:12 -0300
Message-Id: <20211029202424.175401-22-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029202424.175401-1-matheus.ferst@eldorado.org.br>
References: <20211029202424.175401-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 29 Oct 2021 20:26:32.0532 (UTC)
 FILETIME=[431D7940:01D7CD03]
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
 luis.pires@eldorado.org.br, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Changes get_cpu_vsr to receive a new argument indicating whether the
high or low part of the register is being accessed. This change improves
consistency between the interfaces used to access Vector and VSX
registers and helps to handle endianness in some cases.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
New in v2. Will be used in the next patch to address the problems in the
v1 implementation of stxv/lxv.
---
 target/ppc/translate/vsx-impl.c.inc | 317 +++++++++++++---------------
 1 file changed, 146 insertions(+), 171 deletions(-)

diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 57a7f73bba..d923c6a090 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1,23 +1,13 @@
 /***                           VSX extension                               ***/
 
-static inline void get_cpu_vsrh(TCGv_i64 dst, int n)
+static inline void get_cpu_vsr(TCGv_i64 dst, int n, bool high)
 {
-    tcg_gen_ld_i64(dst, cpu_env, vsr64_offset(n, true));
+    tcg_gen_ld_i64(dst, cpu_env, vsr64_offset(n, high));
 }
 
-static inline void get_cpu_vsrl(TCGv_i64 dst, int n)
+static inline void set_cpu_vsr(int n, TCGv_i64 src, bool high)
 {
-    tcg_gen_ld_i64(dst, cpu_env, vsr64_offset(n, false));
-}
-
-static inline void set_cpu_vsrh(int n, TCGv_i64 src)
-{
-    tcg_gen_st_i64(src, cpu_env, vsr64_offset(n, true));
-}
-
-static inline void set_cpu_vsrl(int n, TCGv_i64 src)
-{
-    tcg_gen_st_i64(src, cpu_env, vsr64_offset(n, false));
+    tcg_gen_st_i64(src, cpu_env, vsr64_offset(n, high));
 }
 
 static inline TCGv_ptr gen_vsr_ptr(int reg)
@@ -41,7 +31,7 @@ static void gen_##name(DisasContext *ctx)                     \
     EA = tcg_temp_new();                                      \
     gen_addr_reg_index(ctx, EA);                              \
     gen_qemu_##operation(ctx, t0, EA);                        \
-    set_cpu_vsrh(xT(ctx->opcode), t0);                        \
+    set_cpu_vsr(xT(ctx->opcode), t0, true);                   \
     /* NOTE: cpu_vsrl is undefined */                         \
     tcg_temp_free(EA);                                        \
     tcg_temp_free_i64(t0);                                    \
@@ -67,10 +57,10 @@ static void gen_lxvd2x(DisasContext *ctx)
     EA = tcg_temp_new();
     gen_addr_reg_index(ctx, EA);
     gen_qemu_ld64_i64(ctx, t0, EA);
-    set_cpu_vsrh(xT(ctx->opcode), t0);
+    set_cpu_vsr(xT(ctx->opcode), t0, true);
     tcg_gen_addi_tl(EA, EA, 8);
     gen_qemu_ld64_i64(ctx, t0, EA);
-    set_cpu_vsrl(xT(ctx->opcode), t0);
+    set_cpu_vsr(xT(ctx->opcode), t0, false);
     tcg_temp_free(EA);
     tcg_temp_free_i64(t0);
 }
@@ -109,8 +99,8 @@ static void gen_lxvw4x(DisasContext *ctx)
         tcg_gen_addi_tl(EA, EA, 8);
         tcg_gen_qemu_ld_i64(xtl, EA, ctx->mem_idx, MO_BEQ);
     }
-    set_cpu_vsrh(xT(ctx->opcode), xth);
-    set_cpu_vsrl(xT(ctx->opcode), xtl);
+    set_cpu_vsr(xT(ctx->opcode), xth, true);
+    set_cpu_vsr(xT(ctx->opcode), xtl, false);
     tcg_temp_free(EA);
     tcg_temp_free_i64(xth);
     tcg_temp_free_i64(xtl);
@@ -233,8 +223,8 @@ static void gen_lxvh8x(DisasContext *ctx)
     if (ctx->le_mode) {
         gen_bswap16x8(xth, xtl, xth, xtl);
     }
-    set_cpu_vsrh(xT(ctx->opcode), xth);
-    set_cpu_vsrl(xT(ctx->opcode), xtl);
+    set_cpu_vsr(xT(ctx->opcode), xth, true);
+    set_cpu_vsr(xT(ctx->opcode), xtl, false);
     tcg_temp_free(EA);
     tcg_temp_free_i64(xth);
     tcg_temp_free_i64(xtl);
@@ -258,8 +248,8 @@ static void gen_lxvb16x(DisasContext *ctx)
     tcg_gen_qemu_ld_i64(xth, EA, ctx->mem_idx, MO_BEQ);
     tcg_gen_addi_tl(EA, EA, 8);
     tcg_gen_qemu_ld_i64(xtl, EA, ctx->mem_idx, MO_BEQ);
-    set_cpu_vsrh(xT(ctx->opcode), xth);
-    set_cpu_vsrl(xT(ctx->opcode), xtl);
+    set_cpu_vsr(xT(ctx->opcode), xth, true);
+    set_cpu_vsr(xT(ctx->opcode), xtl, false);
     tcg_temp_free(EA);
     tcg_temp_free_i64(xth);
     tcg_temp_free_i64(xtl);
@@ -301,16 +291,16 @@ static void gen_##name(DisasContext *ctx)                   \
     }                                                       \
     if (ctx->le_mode) {                                     \
         tcg_gen_qemu_##op(xtl, EA, ctx->mem_idx, MO_LEQ);   \
-        set_cpu_vsrl(xt, xtl);                              \
+        set_cpu_vsr(xt, xtl, false);                        \
         tcg_gen_addi_tl(EA, EA, 8);                         \
         tcg_gen_qemu_##op(xth, EA, ctx->mem_idx, MO_LEQ);   \
-        set_cpu_vsrh(xt, xth);                              \
+        set_cpu_vsr(xt, xth, true);                         \
     } else {                                                \
         tcg_gen_qemu_##op(xth, EA, ctx->mem_idx, MO_BEQ);   \
-        set_cpu_vsrh(xt, xth);                              \
+        set_cpu_vsr(xt, xth, true);                         \
         tcg_gen_addi_tl(EA, EA, 8);                         \
         tcg_gen_qemu_##op(xtl, EA, ctx->mem_idx, MO_BEQ);   \
-        set_cpu_vsrl(xt, xtl);                              \
+        set_cpu_vsr(xt, xtl, false);                        \
     }                                                       \
     tcg_temp_free(EA);                                      \
     tcg_temp_free_i64(xth);                                 \
@@ -347,8 +337,8 @@ static void gen_##name(DisasContext *ctx)                   \
     }                                                       \
     xth = tcg_temp_new_i64();                               \
     xtl = tcg_temp_new_i64();                               \
-    get_cpu_vsrh(xth, xt);                                  \
-    get_cpu_vsrl(xtl, xt);                                  \
+    get_cpu_vsr(xth, xt, true);                             \
+    get_cpu_vsr(xtl, xt, false);                            \
     gen_set_access_type(ctx, ACCESS_INT);                   \
     EA = tcg_temp_new();                                    \
     if (indexed) {                                          \
@@ -421,7 +411,7 @@ static void gen_##name(DisasContext *ctx)                         \
     EA = tcg_temp_new();                                          \
     gen_addr_imm_index(ctx, EA, 0x03);                            \
     gen_qemu_##operation(ctx, xth, EA);                           \
-    set_cpu_vsrh(rD(ctx->opcode) + 32, xth);                      \
+    set_cpu_vsr(rD(ctx->opcode) + 32, xth, true);                 \
     /* NOTE: cpu_vsrl is undefined */                             \
     tcg_temp_free(EA);                                            \
     tcg_temp_free_i64(xth);                                       \
@@ -443,7 +433,7 @@ static void gen_##name(DisasContext *ctx)                     \
     gen_set_access_type(ctx, ACCESS_INT);                     \
     EA = tcg_temp_new();                                      \
     gen_addr_reg_index(ctx, EA);                              \
-    get_cpu_vsrh(t0, xS(ctx->opcode));                        \
+    get_cpu_vsr(t0, xS(ctx->opcode), true);                   \
     gen_qemu_##operation(ctx, t0, EA);                        \
     tcg_temp_free(EA);                                        \
     tcg_temp_free_i64(t0);                                    \
@@ -468,10 +458,10 @@ static void gen_stxvd2x(DisasContext *ctx)
     gen_set_access_type(ctx, ACCESS_INT);
     EA = tcg_temp_new();
     gen_addr_reg_index(ctx, EA);
-    get_cpu_vsrh(t0, xS(ctx->opcode));
+    get_cpu_vsr(t0, xS(ctx->opcode), true);
     gen_qemu_st64_i64(ctx, t0, EA);
     tcg_gen_addi_tl(EA, EA, 8);
-    get_cpu_vsrl(t0, xS(ctx->opcode));
+    get_cpu_vsr(t0, xS(ctx->opcode), false);
     gen_qemu_st64_i64(ctx, t0, EA);
     tcg_temp_free(EA);
     tcg_temp_free_i64(t0);
@@ -489,8 +479,8 @@ static void gen_stxvw4x(DisasContext *ctx)
     }
     xsh = tcg_temp_new_i64();
     xsl = tcg_temp_new_i64();
-    get_cpu_vsrh(xsh, xS(ctx->opcode));
-    get_cpu_vsrl(xsl, xS(ctx->opcode));
+    get_cpu_vsr(xsh, xS(ctx->opcode), true);
+    get_cpu_vsr(xsl, xS(ctx->opcode), false);
     gen_set_access_type(ctx, ACCESS_INT);
     EA = tcg_temp_new();
     gen_addr_reg_index(ctx, EA);
@@ -529,8 +519,8 @@ static void gen_stxvh8x(DisasContext *ctx)
     }
     xsh = tcg_temp_new_i64();
     xsl = tcg_temp_new_i64();
-    get_cpu_vsrh(xsh, xS(ctx->opcode));
-    get_cpu_vsrl(xsl, xS(ctx->opcode));
+    get_cpu_vsr(xsh, xS(ctx->opcode), true);
+    get_cpu_vsr(xsl, xS(ctx->opcode), false);
     gen_set_access_type(ctx, ACCESS_INT);
     EA = tcg_temp_new();
     gen_addr_reg_index(ctx, EA);
@@ -566,8 +556,8 @@ static void gen_stxvb16x(DisasContext *ctx)
     }
     xsh = tcg_temp_new_i64();
     xsl = tcg_temp_new_i64();
-    get_cpu_vsrh(xsh, xS(ctx->opcode));
-    get_cpu_vsrl(xsl, xS(ctx->opcode));
+    get_cpu_vsr(xsh, xS(ctx->opcode), true);
+    get_cpu_vsr(xsl, xS(ctx->opcode), false);
     gen_set_access_type(ctx, ACCESS_INT);
     EA = tcg_temp_new();
     gen_addr_reg_index(ctx, EA);
@@ -590,7 +580,7 @@ static void gen_##name(DisasContext *ctx)                         \
         return;                                                   \
     }                                                             \
     xth = tcg_temp_new_i64();                                     \
-    get_cpu_vsrh(xth, rD(ctx->opcode) + 32);                      \
+    get_cpu_vsr(xth, rD(ctx->opcode) + 32, true);                 \
     gen_set_access_type(ctx, ACCESS_INT);                         \
     EA = tcg_temp_new();                                          \
     gen_addr_imm_index(ctx, EA, 0x03);                            \
@@ -618,7 +608,7 @@ static void gen_mfvsrwz(DisasContext *ctx)
     }
     TCGv_i64 tmp = tcg_temp_new_i64();
     TCGv_i64 xsh = tcg_temp_new_i64();
-    get_cpu_vsrh(xsh, xS(ctx->opcode));
+    get_cpu_vsr(xsh, xS(ctx->opcode), true);
     tcg_gen_ext32u_i64(tmp, xsh);
     tcg_gen_trunc_i64_tl(cpu_gpr[rA(ctx->opcode)], tmp);
     tcg_temp_free_i64(tmp);
@@ -642,7 +632,7 @@ static void gen_mtvsrwa(DisasContext *ctx)
     TCGv_i64 xsh = tcg_temp_new_i64();
     tcg_gen_extu_tl_i64(tmp, cpu_gpr[rA(ctx->opcode)]);
     tcg_gen_ext32s_i64(xsh, tmp);
-    set_cpu_vsrh(xT(ctx->opcode), xsh);
+    set_cpu_vsr(xT(ctx->opcode), xsh, true);
     tcg_temp_free_i64(tmp);
     tcg_temp_free_i64(xsh);
 }
@@ -664,7 +654,7 @@ static void gen_mtvsrwz(DisasContext *ctx)
     TCGv_i64 xsh = tcg_temp_new_i64();
     tcg_gen_extu_tl_i64(tmp, cpu_gpr[rA(ctx->opcode)]);
     tcg_gen_ext32u_i64(xsh, tmp);
-    set_cpu_vsrh(xT(ctx->opcode), xsh);
+    set_cpu_vsr(xT(ctx->opcode), xsh, true);
     tcg_temp_free_i64(tmp);
     tcg_temp_free_i64(xsh);
 }
@@ -685,7 +675,7 @@ static void gen_mfvsrd(DisasContext *ctx)
         }
     }
     t0 = tcg_temp_new_i64();
-    get_cpu_vsrh(t0, xS(ctx->opcode));
+    get_cpu_vsr(t0, xS(ctx->opcode), true);
     tcg_gen_mov_i64(cpu_gpr[rA(ctx->opcode)], t0);
     tcg_temp_free_i64(t0);
 }
@@ -706,7 +696,7 @@ static void gen_mtvsrd(DisasContext *ctx)
     }
     t0 = tcg_temp_new_i64();
     tcg_gen_mov_i64(t0, cpu_gpr[rA(ctx->opcode)]);
-    set_cpu_vsrh(xT(ctx->opcode), t0);
+    set_cpu_vsr(xT(ctx->opcode), t0, true);
     tcg_temp_free_i64(t0);
 }
 
@@ -725,7 +715,7 @@ static void gen_mfvsrld(DisasContext *ctx)
         }
     }
     t0 = tcg_temp_new_i64();
-    get_cpu_vsrl(t0, xS(ctx->opcode));
+    get_cpu_vsr(t0, xS(ctx->opcode), false);
     tcg_gen_mov_i64(cpu_gpr[rA(ctx->opcode)], t0);
     tcg_temp_free_i64(t0);
 }
@@ -751,10 +741,10 @@ static void gen_mtvsrdd(DisasContext *ctx)
     } else {
         tcg_gen_mov_i64(t0, cpu_gpr[rA(ctx->opcode)]);
     }
-    set_cpu_vsrh(xT(ctx->opcode), t0);
+    set_cpu_vsr(xT(ctx->opcode), t0, true);
 
     tcg_gen_mov_i64(t0, cpu_gpr[rB(ctx->opcode)]);
-    set_cpu_vsrl(xT(ctx->opcode), t0);
+    set_cpu_vsr(xT(ctx->opcode), t0, false);
     tcg_temp_free_i64(t0);
 }
 
@@ -776,8 +766,8 @@ static void gen_mtvsrws(DisasContext *ctx)
     t0 = tcg_temp_new_i64();
     tcg_gen_deposit_i64(t0, cpu_gpr[rA(ctx->opcode)],
                         cpu_gpr[rA(ctx->opcode)], 32, 32);
-    set_cpu_vsrl(xT(ctx->opcode), t0);
-    set_cpu_vsrh(xT(ctx->opcode), t0);
+    set_cpu_vsr(xT(ctx->opcode), t0, false);
+    set_cpu_vsr(xT(ctx->opcode), t0, true);
     tcg_temp_free_i64(t0);
 }
 
@@ -797,33 +787,25 @@ static void gen_xxpermdi(DisasContext *ctx)
 
     if (unlikely((xT(ctx->opcode) == xA(ctx->opcode)) ||
                  (xT(ctx->opcode) == xB(ctx->opcode)))) {
-        if ((DM(ctx->opcode) & 2) == 0) {
-            get_cpu_vsrh(xh, xA(ctx->opcode));
-        } else {
-            get_cpu_vsrl(xh, xA(ctx->opcode));
-        }
-        if ((DM(ctx->opcode) & 1) == 0) {
-            get_cpu_vsrh(xl, xB(ctx->opcode));
-        } else {
-            get_cpu_vsrl(xl, xB(ctx->opcode));
-        }
+        get_cpu_vsr(xh, xA(ctx->opcode), (DM(ctx->opcode) & 2) == 0);
+        get_cpu_vsr(xl, xB(ctx->opcode), (DM(ctx->opcode) & 1) == 0);
 
-        set_cpu_vsrh(xT(ctx->opcode), xh);
-        set_cpu_vsrl(xT(ctx->opcode), xl);
+        set_cpu_vsr(xT(ctx->opcode), xh, true);
+        set_cpu_vsr(xT(ctx->opcode), xl, false);
     } else {
         if ((DM(ctx->opcode) & 2) == 0) {
-            get_cpu_vsrh(xh, xA(ctx->opcode));
-            set_cpu_vsrh(xT(ctx->opcode), xh);
+            get_cpu_vsr(xh, xA(ctx->opcode), true);
+            set_cpu_vsr(xT(ctx->opcode), xh, true);
         } else {
-            get_cpu_vsrl(xh, xA(ctx->opcode));
-            set_cpu_vsrh(xT(ctx->opcode), xh);
+            get_cpu_vsr(xh, xA(ctx->opcode), false);
+            set_cpu_vsr(xT(ctx->opcode), xh, true);
         }
         if ((DM(ctx->opcode) & 1) == 0) {
-            get_cpu_vsrh(xl, xB(ctx->opcode));
-            set_cpu_vsrl(xT(ctx->opcode), xl);
+            get_cpu_vsr(xl, xB(ctx->opcode), true);
+            set_cpu_vsr(xT(ctx->opcode), xl, false);
         } else {
-            get_cpu_vsrl(xl, xB(ctx->opcode));
-            set_cpu_vsrl(xT(ctx->opcode), xl);
+            get_cpu_vsr(xl, xB(ctx->opcode), false);
+            set_cpu_vsr(xT(ctx->opcode), xl, false);
         }
     }
     tcg_temp_free_i64(xh);
@@ -847,7 +829,7 @@ static void glue(gen_, name)(DisasContext *ctx)                   \
         }                                                         \
         xb = tcg_temp_new_i64();                                  \
         sgm = tcg_temp_new_i64();                                 \
-        get_cpu_vsrh(xb, xB(ctx->opcode));                        \
+        get_cpu_vsr(xb, xB(ctx->opcode), true);                   \
         tcg_gen_movi_i64(sgm, sgn_mask);                          \
         switch (op) {                                             \
             case OP_ABS: {                                        \
@@ -864,7 +846,7 @@ static void glue(gen_, name)(DisasContext *ctx)                   \
             }                                                     \
             case OP_CPSGN: {                                      \
                 TCGv_i64 xa = tcg_temp_new_i64();                 \
-                get_cpu_vsrh(xa, xA(ctx->opcode));                \
+                get_cpu_vsr(xa, xA(ctx->opcode), true);           \
                 tcg_gen_and_i64(xa, xa, sgm);                     \
                 tcg_gen_andc_i64(xb, xb, sgm);                    \
                 tcg_gen_or_i64(xb, xb, xa);                       \
@@ -872,7 +854,7 @@ static void glue(gen_, name)(DisasContext *ctx)                   \
                 break;                                            \
             }                                                     \
         }                                                         \
-        set_cpu_vsrh(xT(ctx->opcode), xb);                        \
+        set_cpu_vsr(xT(ctx->opcode), xb, true);                   \
         tcg_temp_free_i64(xb);                                    \
         tcg_temp_free_i64(sgm);                                   \
     }
@@ -898,8 +880,8 @@ static void glue(gen_, name)(DisasContext *ctx)                   \
     xbl = tcg_temp_new_i64();                                     \
     sgm = tcg_temp_new_i64();                                     \
     tmp = tcg_temp_new_i64();                                     \
-    get_cpu_vsrh(xbh, xb);                                        \
-    get_cpu_vsrl(xbl, xb);                                        \
+    get_cpu_vsr(xbh, xb, true);                                   \
+    get_cpu_vsr(xbl, xb, false);                                  \
     tcg_gen_movi_i64(sgm, sgn_mask);                              \
     switch (op) {                                                 \
     case OP_ABS:                                                  \
@@ -914,15 +896,15 @@ static void glue(gen_, name)(DisasContext *ctx)                   \
     case OP_CPSGN:                                                \
         xah = tcg_temp_new_i64();                                 \
         xa = rA(ctx->opcode) + 32;                                \
-        get_cpu_vsrh(tmp, xa);                                    \
+        get_cpu_vsr(tmp, xa, true);                               \
         tcg_gen_and_i64(xah, tmp, sgm);                           \
         tcg_gen_andc_i64(xbh, xbh, sgm);                          \
         tcg_gen_or_i64(xbh, xbh, xah);                            \
         tcg_temp_free_i64(xah);                                   \
         break;                                                    \
     }                                                             \
-    set_cpu_vsrh(xt, xbh);                                        \
-    set_cpu_vsrl(xt, xbl);                                        \
+    set_cpu_vsr(xt, xbh, true);                                   \
+    set_cpu_vsr(xt, xbl, false);                                  \
     tcg_temp_free_i64(xbl);                                       \
     tcg_temp_free_i64(xbh);                                       \
     tcg_temp_free_i64(sgm);                                       \
@@ -945,8 +927,8 @@ static void glue(gen_, name)(DisasContext *ctx)                  \
         xbh = tcg_temp_new_i64();                                \
         xbl = tcg_temp_new_i64();                                \
         sgm = tcg_temp_new_i64();                                \
-        get_cpu_vsrh(xbh, xB(ctx->opcode));                      \
-        get_cpu_vsrl(xbl, xB(ctx->opcode));                      \
+        get_cpu_vsr(xbh, xB(ctx->opcode), true);                 \
+        get_cpu_vsr(xbl, xB(ctx->opcode), false);                \
         tcg_gen_movi_i64(sgm, sgn_mask);                         \
         switch (op) {                                            \
             case OP_ABS: {                                       \
@@ -967,8 +949,8 @@ static void glue(gen_, name)(DisasContext *ctx)                  \
             case OP_CPSGN: {                                     \
                 TCGv_i64 xah = tcg_temp_new_i64();               \
                 TCGv_i64 xal = tcg_temp_new_i64();               \
-                get_cpu_vsrh(xah, xA(ctx->opcode));              \
-                get_cpu_vsrl(xal, xA(ctx->opcode));              \
+                get_cpu_vsr(xah, xA(ctx->opcode), true);         \
+                get_cpu_vsr(xal, xA(ctx->opcode), false);        \
                 tcg_gen_and_i64(xah, xah, sgm);                  \
                 tcg_gen_and_i64(xal, xal, sgm);                  \
                 tcg_gen_andc_i64(xbh, xbh, sgm);                 \
@@ -980,8 +962,8 @@ static void glue(gen_, name)(DisasContext *ctx)                  \
                 break;                                           \
             }                                                    \
         }                                                        \
-        set_cpu_vsrh(xT(ctx->opcode), xbh);                      \
-        set_cpu_vsrl(xT(ctx->opcode), xbl);                      \
+        set_cpu_vsr(xT(ctx->opcode), xbh, true);                 \
+        set_cpu_vsr(xT(ctx->opcode), xbl, false);                \
         tcg_temp_free_i64(xbh);                                  \
         tcg_temp_free_i64(xbl);                                  \
         tcg_temp_free_i64(sgm);                                  \
@@ -1193,9 +1175,9 @@ static void gen_##name(DisasContext *ctx)                     \
     }                                                         \
     t0 = tcg_temp_new_i64();                                  \
     t1 = tcg_temp_new_i64();                                  \
-    get_cpu_vsrh(t0, xB(ctx->opcode));                        \
+    get_cpu_vsr(t0, xB(ctx->opcode), true);                   \
     gen_helper_##name(t1, cpu_env, t0);                       \
-    set_cpu_vsrh(xT(ctx->opcode), t1);                        \
+    set_cpu_vsr(xT(ctx->opcode), t1, true);                   \
     tcg_temp_free_i64(t0);                                    \
     tcg_temp_free_i64(t1);                                    \
 }
@@ -1390,13 +1372,13 @@ static void gen_xxbrd(DisasContext *ctx)
     xtl = tcg_temp_new_i64();
     xbh = tcg_temp_new_i64();
     xbl = tcg_temp_new_i64();
-    get_cpu_vsrh(xbh, xB(ctx->opcode));
-    get_cpu_vsrl(xbl, xB(ctx->opcode));
+    get_cpu_vsr(xbh, xB(ctx->opcode), true);
+    get_cpu_vsr(xbl, xB(ctx->opcode), false);
 
     tcg_gen_bswap64_i64(xth, xbh);
     tcg_gen_bswap64_i64(xtl, xbl);
-    set_cpu_vsrh(xT(ctx->opcode), xth);
-    set_cpu_vsrl(xT(ctx->opcode), xtl);
+    set_cpu_vsr(xT(ctx->opcode), xth, true);
+    set_cpu_vsr(xT(ctx->opcode), xtl, false);
 
     tcg_temp_free_i64(xth);
     tcg_temp_free_i64(xtl);
@@ -1419,12 +1401,12 @@ static void gen_xxbrh(DisasContext *ctx)
     xtl = tcg_temp_new_i64();
     xbh = tcg_temp_new_i64();
     xbl = tcg_temp_new_i64();
-    get_cpu_vsrh(xbh, xB(ctx->opcode));
-    get_cpu_vsrl(xbl, xB(ctx->opcode));
+    get_cpu_vsr(xbh, xB(ctx->opcode), true);
+    get_cpu_vsr(xbl, xB(ctx->opcode), false);
 
     gen_bswap16x8(xth, xtl, xbh, xbl);
-    set_cpu_vsrh(xT(ctx->opcode), xth);
-    set_cpu_vsrl(xT(ctx->opcode), xtl);
+    set_cpu_vsr(xT(ctx->opcode), xth, true);
+    set_cpu_vsr(xT(ctx->opcode), xtl, false);
 
     tcg_temp_free_i64(xth);
     tcg_temp_free_i64(xtl);
@@ -1448,15 +1430,15 @@ static void gen_xxbrq(DisasContext *ctx)
     xtl = tcg_temp_new_i64();
     xbh = tcg_temp_new_i64();
     xbl = tcg_temp_new_i64();
-    get_cpu_vsrh(xbh, xB(ctx->opcode));
-    get_cpu_vsrl(xbl, xB(ctx->opcode));
+    get_cpu_vsr(xbh, xB(ctx->opcode), true);
+    get_cpu_vsr(xbl, xB(ctx->opcode), false);
     t0 = tcg_temp_new_i64();
 
     tcg_gen_bswap64_i64(t0, xbl);
     tcg_gen_bswap64_i64(xtl, xbh);
-    set_cpu_vsrl(xT(ctx->opcode), xtl);
+    set_cpu_vsr(xT(ctx->opcode), xtl, false);
     tcg_gen_mov_i64(xth, t0);
-    set_cpu_vsrh(xT(ctx->opcode), xth);
+    set_cpu_vsr(xT(ctx->opcode), xth, true);
 
     tcg_temp_free_i64(t0);
     tcg_temp_free_i64(xth);
@@ -1480,12 +1462,12 @@ static void gen_xxbrw(DisasContext *ctx)
     xtl = tcg_temp_new_i64();
     xbh = tcg_temp_new_i64();
     xbl = tcg_temp_new_i64();
-    get_cpu_vsrh(xbh, xB(ctx->opcode));
-    get_cpu_vsrl(xbl, xB(ctx->opcode));
+    get_cpu_vsr(xbh, xB(ctx->opcode), true);
+    get_cpu_vsr(xbl, xB(ctx->opcode), false);
 
     gen_bswap32x4(xth, xtl, xbh, xbl);
-    set_cpu_vsrh(xT(ctx->opcode), xth);
-    set_cpu_vsrl(xT(ctx->opcode), xtl);
+    set_cpu_vsr(xT(ctx->opcode), xth, true);
+    set_cpu_vsr(xT(ctx->opcode), xtl, false);
 
     tcg_temp_free_i64(xth);
     tcg_temp_free_i64(xtl);
@@ -1527,23 +1509,16 @@ static void glue(gen_, name)(DisasContext *ctx)             \
         b0 = tcg_temp_new_i64();                            \
         b1 = tcg_temp_new_i64();                            \
         tmp = tcg_temp_new_i64();                           \
-        if (high) {                                         \
-            get_cpu_vsrh(a0, xA(ctx->opcode));              \
-            get_cpu_vsrh(a1, xA(ctx->opcode));              \
-            get_cpu_vsrh(b0, xB(ctx->opcode));              \
-            get_cpu_vsrh(b1, xB(ctx->opcode));              \
-        } else {                                            \
-            get_cpu_vsrl(a0, xA(ctx->opcode));              \
-            get_cpu_vsrl(a1, xA(ctx->opcode));              \
-            get_cpu_vsrl(b0, xB(ctx->opcode));              \
-            get_cpu_vsrl(b1, xB(ctx->opcode));              \
-        }                                                   \
+        get_cpu_vsr(a0, xA(ctx->opcode), high);             \
+        get_cpu_vsr(a1, xA(ctx->opcode), high);             \
+        get_cpu_vsr(b0, xB(ctx->opcode), high);             \
+        get_cpu_vsr(b1, xB(ctx->opcode), high);             \
         tcg_gen_shri_i64(a0, a0, 32);                       \
         tcg_gen_shri_i64(b0, b0, 32);                       \
         tcg_gen_deposit_i64(tmp, b0, a0, 32, 32);           \
-        set_cpu_vsrh(xT(ctx->opcode), tmp);                 \
+        set_cpu_vsr(xT(ctx->opcode), tmp, true);            \
         tcg_gen_deposit_i64(tmp, b1, a1, 32, 32);           \
-        set_cpu_vsrl(xT(ctx->opcode), tmp);                 \
+        set_cpu_vsr(xT(ctx->opcode), tmp, false);           \
         tcg_temp_free_i64(a0);                              \
         tcg_temp_free_i64(a1);                              \
         tcg_temp_free_i64(b0);                              \
@@ -1624,40 +1599,40 @@ static void gen_xxsldwi(DisasContext *ctx)
 
     switch (SHW(ctx->opcode)) {
         case 0: {
-            get_cpu_vsrh(xth, xA(ctx->opcode));
-            get_cpu_vsrl(xtl, xA(ctx->opcode));
+            get_cpu_vsr(xth, xA(ctx->opcode), true);
+            get_cpu_vsr(xtl, xA(ctx->opcode), false);
             break;
         }
         case 1: {
             TCGv_i64 t0 = tcg_temp_new_i64();
-            get_cpu_vsrh(xth, xA(ctx->opcode));
+            get_cpu_vsr(xth, xA(ctx->opcode), true);
             tcg_gen_shli_i64(xth, xth, 32);
-            get_cpu_vsrl(t0, xA(ctx->opcode));
+            get_cpu_vsr(t0, xA(ctx->opcode), false);
             tcg_gen_shri_i64(t0, t0, 32);
             tcg_gen_or_i64(xth, xth, t0);
-            get_cpu_vsrl(xtl, xA(ctx->opcode));
+            get_cpu_vsr(xtl, xA(ctx->opcode), false);
             tcg_gen_shli_i64(xtl, xtl, 32);
-            get_cpu_vsrh(t0, xB(ctx->opcode));
+            get_cpu_vsr(t0, xB(ctx->opcode), true);
             tcg_gen_shri_i64(t0, t0, 32);
             tcg_gen_or_i64(xtl, xtl, t0);
             tcg_temp_free_i64(t0);
             break;
         }
         case 2: {
-            get_cpu_vsrl(xth, xA(ctx->opcode));
-            get_cpu_vsrh(xtl, xB(ctx->opcode));
+            get_cpu_vsr(xth, xA(ctx->opcode), false);
+            get_cpu_vsr(xtl, xB(ctx->opcode), true);
             break;
         }
         case 3: {
             TCGv_i64 t0 = tcg_temp_new_i64();
-            get_cpu_vsrl(xth, xA(ctx->opcode));
+            get_cpu_vsr(xth, xA(ctx->opcode), false);
             tcg_gen_shli_i64(xth, xth, 32);
-            get_cpu_vsrh(t0, xB(ctx->opcode));
+            get_cpu_vsr(t0, xB(ctx->opcode), true);
             tcg_gen_shri_i64(t0, t0, 32);
             tcg_gen_or_i64(xth, xth, t0);
-            get_cpu_vsrh(xtl, xB(ctx->opcode));
+            get_cpu_vsr(xtl, xB(ctx->opcode), true);
             tcg_gen_shli_i64(xtl, xtl, 32);
-            get_cpu_vsrl(t0, xB(ctx->opcode));
+            get_cpu_vsr(t0, xB(ctx->opcode), false);
             tcg_gen_shri_i64(t0, t0, 32);
             tcg_gen_or_i64(xtl, xtl, t0);
             tcg_temp_free_i64(t0);
@@ -1665,8 +1640,8 @@ static void gen_xxsldwi(DisasContext *ctx)
         }
     }
 
-    set_cpu_vsrh(xT(ctx->opcode), xth);
-    set_cpu_vsrl(xT(ctx->opcode), xtl);
+    set_cpu_vsr(xT(ctx->opcode), xth, true);
+    set_cpu_vsr(xT(ctx->opcode), xtl, false);
 
     tcg_temp_free_i64(xth);
     tcg_temp_free_i64(xtl);
@@ -1694,8 +1669,8 @@ static void gen_##name(DisasContext *ctx)                       \
      */                                                         \
     if (uimm > 15) {                                            \
         tcg_gen_movi_i64(t1, 0);                                \
-        set_cpu_vsrh(xT(ctx->opcode), t1);                      \
-        set_cpu_vsrl(xT(ctx->opcode), t1);                      \
+        set_cpu_vsr(xT(ctx->opcode), t1, true);                 \
+        set_cpu_vsr(xT(ctx->opcode), t1, false);                \
         return;                                                 \
     }                                                           \
     tcg_gen_movi_i32(t0, uimm);                                 \
@@ -1719,7 +1694,7 @@ static void gen_xsxexpdp(DisasContext *ctx)
         return;
     }
     t0 = tcg_temp_new_i64();
-    get_cpu_vsrh(t0, xB(ctx->opcode));
+    get_cpu_vsr(t0, xB(ctx->opcode), true);
     tcg_gen_extract_i64(rt, t0, 52, 11);
     tcg_temp_free_i64(t0);
 }
@@ -1737,12 +1712,12 @@ static void gen_xsxexpqp(DisasContext *ctx)
     xth = tcg_temp_new_i64();
     xtl = tcg_temp_new_i64();
     xbh = tcg_temp_new_i64();
-    get_cpu_vsrh(xbh, rB(ctx->opcode) + 32);
+    get_cpu_vsr(xbh, rB(ctx->opcode) + 32, true);
 
     tcg_gen_extract_i64(xth, xbh, 48, 15);
-    set_cpu_vsrh(rD(ctx->opcode) + 32, xth);
+    set_cpu_vsr(rD(ctx->opcode) + 32, xth, true);
     tcg_gen_movi_i64(xtl, 0);
-    set_cpu_vsrl(rD(ctx->opcode) + 32, xtl);
+    set_cpu_vsr(rD(ctx->opcode) + 32, xtl, false);
 
     tcg_temp_free_i64(xbh);
     tcg_temp_free_i64(xth);
@@ -1766,7 +1741,7 @@ static void gen_xsiexpdp(DisasContext *ctx)
     tcg_gen_andi_i64(t0, rb, 0x7FF);
     tcg_gen_shli_i64(t0, t0, 52);
     tcg_gen_or_i64(xth, xth, t0);
-    set_cpu_vsrh(xT(ctx->opcode), xth);
+    set_cpu_vsr(xT(ctx->opcode), xth, true);
     /* dword[1] is undefined */
     tcg_temp_free_i64(t0);
     tcg_temp_free_i64(xth);
@@ -1789,19 +1764,19 @@ static void gen_xsiexpqp(DisasContext *ctx)
     xtl = tcg_temp_new_i64();
     xah = tcg_temp_new_i64();
     xal = tcg_temp_new_i64();
-    get_cpu_vsrh(xah, rA(ctx->opcode) + 32);
-    get_cpu_vsrl(xal, rA(ctx->opcode) + 32);
+    get_cpu_vsr(xah, rA(ctx->opcode) + 32, true);
+    get_cpu_vsr(xal, rA(ctx->opcode) + 32, false);
     xbh = tcg_temp_new_i64();
-    get_cpu_vsrh(xbh, rB(ctx->opcode) + 32);
+    get_cpu_vsr(xbh, rB(ctx->opcode) + 32, true);
     t0 = tcg_temp_new_i64();
 
     tcg_gen_andi_i64(xth, xah, 0x8000FFFFFFFFFFFF);
     tcg_gen_andi_i64(t0, xbh, 0x7FFF);
     tcg_gen_shli_i64(t0, t0, 48);
     tcg_gen_or_i64(xth, xth, t0);
-    set_cpu_vsrh(rD(ctx->opcode) + 32, xth);
+    set_cpu_vsr(rD(ctx->opcode) + 32, xth, true);
     tcg_gen_mov_i64(xtl, xal);
-    set_cpu_vsrl(rD(ctx->opcode) + 32, xtl);
+    set_cpu_vsr(rD(ctx->opcode) + 32, xtl, false);
 
     tcg_temp_free_i64(t0);
     tcg_temp_free_i64(xth);
@@ -1826,12 +1801,12 @@ static void gen_xsxsigdp(DisasContext *ctx)
     zr = tcg_const_i64(0);
     nan = tcg_const_i64(2047);
 
-    get_cpu_vsrh(t1, xB(ctx->opcode));
+    get_cpu_vsr(t1, xB(ctx->opcode), true);
     tcg_gen_extract_i64(exp, t1, 52, 11);
     tcg_gen_movi_i64(t0, 0x0010000000000000);
     tcg_gen_movcond_i64(TCG_COND_EQ, t0, exp, zr, zr, t0);
     tcg_gen_movcond_i64(TCG_COND_EQ, t0, exp, nan, zr, t0);
-    get_cpu_vsrh(t1, xB(ctx->opcode));
+    get_cpu_vsr(t1, xB(ctx->opcode), true);
     tcg_gen_deposit_i64(rt, t0, t1, 0, 52);
 
     tcg_temp_free_i64(t0);
@@ -1857,8 +1832,8 @@ static void gen_xsxsigqp(DisasContext *ctx)
     xtl = tcg_temp_new_i64();
     xbh = tcg_temp_new_i64();
     xbl = tcg_temp_new_i64();
-    get_cpu_vsrh(xbh, rB(ctx->opcode) + 32);
-    get_cpu_vsrl(xbl, rB(ctx->opcode) + 32);
+    get_cpu_vsr(xbh, rB(ctx->opcode) + 32, true);
+    get_cpu_vsr(xbl, rB(ctx->opcode) + 32, false);
     exp = tcg_temp_new_i64();
     t0 = tcg_temp_new_i64();
     zr = tcg_const_i64(0);
@@ -1869,9 +1844,9 @@ static void gen_xsxsigqp(DisasContext *ctx)
     tcg_gen_movcond_i64(TCG_COND_EQ, t0, exp, zr, zr, t0);
     tcg_gen_movcond_i64(TCG_COND_EQ, t0, exp, nan, zr, t0);
     tcg_gen_deposit_i64(xth, t0, xbh, 0, 48);
-    set_cpu_vsrh(rD(ctx->opcode) + 32, xth);
+    set_cpu_vsr(rD(ctx->opcode) + 32, xth, true);
     tcg_gen_mov_i64(xtl, xbl);
-    set_cpu_vsrl(rD(ctx->opcode) + 32, xtl);
+    set_cpu_vsr(rD(ctx->opcode) + 32, xtl, false);
 
     tcg_temp_free_i64(t0);
     tcg_temp_free_i64(exp);
@@ -1904,22 +1879,22 @@ static void gen_xviexpsp(DisasContext *ctx)
     xal = tcg_temp_new_i64();
     xbh = tcg_temp_new_i64();
     xbl = tcg_temp_new_i64();
-    get_cpu_vsrh(xah, xA(ctx->opcode));
-    get_cpu_vsrl(xal, xA(ctx->opcode));
-    get_cpu_vsrh(xbh, xB(ctx->opcode));
-    get_cpu_vsrl(xbl, xB(ctx->opcode));
+    get_cpu_vsr(xah, xA(ctx->opcode), true);
+    get_cpu_vsr(xal, xA(ctx->opcode), false);
+    get_cpu_vsr(xbh, xB(ctx->opcode), true);
+    get_cpu_vsr(xbl, xB(ctx->opcode), false);
     t0 = tcg_temp_new_i64();
 
     tcg_gen_andi_i64(xth, xah, 0x807FFFFF807FFFFF);
     tcg_gen_andi_i64(t0, xbh, 0xFF000000FF);
     tcg_gen_shli_i64(t0, t0, 23);
     tcg_gen_or_i64(xth, xth, t0);
-    set_cpu_vsrh(xT(ctx->opcode), xth);
+    set_cpu_vsr(xT(ctx->opcode), xth, true);
     tcg_gen_andi_i64(xtl, xal, 0x807FFFFF807FFFFF);
     tcg_gen_andi_i64(t0, xbl, 0xFF000000FF);
     tcg_gen_shli_i64(t0, t0, 23);
     tcg_gen_or_i64(xtl, xtl, t0);
-    set_cpu_vsrl(xT(ctx->opcode), xtl);
+    set_cpu_vsr(xT(ctx->opcode), xtl, false);
 
     tcg_temp_free_i64(t0);
     tcg_temp_free_i64(xth);
@@ -1949,16 +1924,16 @@ static void gen_xviexpdp(DisasContext *ctx)
     xal = tcg_temp_new_i64();
     xbh = tcg_temp_new_i64();
     xbl = tcg_temp_new_i64();
-    get_cpu_vsrh(xah, xA(ctx->opcode));
-    get_cpu_vsrl(xal, xA(ctx->opcode));
-    get_cpu_vsrh(xbh, xB(ctx->opcode));
-    get_cpu_vsrl(xbl, xB(ctx->opcode));
+    get_cpu_vsr(xah, xA(ctx->opcode), true);
+    get_cpu_vsr(xal, xA(ctx->opcode), false);
+    get_cpu_vsr(xbh, xB(ctx->opcode), true);
+    get_cpu_vsr(xbl, xB(ctx->opcode), false);
 
     tcg_gen_deposit_i64(xth, xah, xbh, 52, 11);
-    set_cpu_vsrh(xT(ctx->opcode), xth);
+    set_cpu_vsr(xT(ctx->opcode), xth, true);
 
     tcg_gen_deposit_i64(xtl, xal, xbl, 52, 11);
-    set_cpu_vsrl(xT(ctx->opcode), xtl);
+    set_cpu_vsr(xT(ctx->opcode), xtl, false);
 
     tcg_temp_free_i64(xth);
     tcg_temp_free_i64(xtl);
@@ -1983,15 +1958,15 @@ static void gen_xvxexpsp(DisasContext *ctx)
     xtl = tcg_temp_new_i64();
     xbh = tcg_temp_new_i64();
     xbl = tcg_temp_new_i64();
-    get_cpu_vsrh(xbh, xB(ctx->opcode));
-    get_cpu_vsrl(xbl, xB(ctx->opcode));
+    get_cpu_vsr(xbh, xB(ctx->opcode), true);
+    get_cpu_vsr(xbl, xB(ctx->opcode), false);
 
     tcg_gen_shri_i64(xth, xbh, 23);
     tcg_gen_andi_i64(xth, xth, 0xFF000000FF);
-    set_cpu_vsrh(xT(ctx->opcode), xth);
+    set_cpu_vsr(xT(ctx->opcode), xth, true);
     tcg_gen_shri_i64(xtl, xbl, 23);
     tcg_gen_andi_i64(xtl, xtl, 0xFF000000FF);
-    set_cpu_vsrl(xT(ctx->opcode), xtl);
+    set_cpu_vsr(xT(ctx->opcode), xtl, false);
 
     tcg_temp_free_i64(xth);
     tcg_temp_free_i64(xtl);
@@ -2014,13 +1989,13 @@ static void gen_xvxexpdp(DisasContext *ctx)
     xtl = tcg_temp_new_i64();
     xbh = tcg_temp_new_i64();
     xbl = tcg_temp_new_i64();
-    get_cpu_vsrh(xbh, xB(ctx->opcode));
-    get_cpu_vsrl(xbl, xB(ctx->opcode));
+    get_cpu_vsr(xbh, xB(ctx->opcode), true);
+    get_cpu_vsr(xbl, xB(ctx->opcode), false);
 
     tcg_gen_extract_i64(xth, xbh, 52, 11);
-    set_cpu_vsrh(xT(ctx->opcode), xth);
+    set_cpu_vsr(xT(ctx->opcode), xth, true);
     tcg_gen_extract_i64(xtl, xbl, 52, 11);
-    set_cpu_vsrl(xT(ctx->opcode), xtl);
+    set_cpu_vsr(xT(ctx->opcode), xtl, false);
 
     tcg_temp_free_i64(xth);
     tcg_temp_free_i64(xtl);
@@ -2046,8 +2021,8 @@ static void gen_xvxsigdp(DisasContext *ctx)
     xtl = tcg_temp_new_i64();
     xbh = tcg_temp_new_i64();
     xbl = tcg_temp_new_i64();
-    get_cpu_vsrh(xbh, xB(ctx->opcode));
-    get_cpu_vsrl(xbl, xB(ctx->opcode));
+    get_cpu_vsr(xbh, xB(ctx->opcode), true);
+    get_cpu_vsr(xbl, xB(ctx->opcode), false);
     exp = tcg_temp_new_i64();
     t0 = tcg_temp_new_i64();
     zr = tcg_const_i64(0);
@@ -2058,14 +2033,14 @@ static void gen_xvxsigdp(DisasContext *ctx)
     tcg_gen_movcond_i64(TCG_COND_EQ, t0, exp, zr, zr, t0);
     tcg_gen_movcond_i64(TCG_COND_EQ, t0, exp, nan, zr, t0);
     tcg_gen_deposit_i64(xth, t0, xbh, 0, 52);
-    set_cpu_vsrh(xT(ctx->opcode), xth);
+    set_cpu_vsr(xT(ctx->opcode), xth, true);
 
     tcg_gen_extract_i64(exp, xbl, 52, 11);
     tcg_gen_movi_i64(t0, 0x0010000000000000);
     tcg_gen_movcond_i64(TCG_COND_EQ, t0, exp, zr, zr, t0);
     tcg_gen_movcond_i64(TCG_COND_EQ, t0, exp, nan, zr, t0);
     tcg_gen_deposit_i64(xtl, t0, xbl, 0, 52);
-    set_cpu_vsrl(xT(ctx->opcode), xtl);
+    set_cpu_vsr(xT(ctx->opcode), xtl, false);
 
     tcg_temp_free_i64(t0);
     tcg_temp_free_i64(exp);
-- 
2.25.1


