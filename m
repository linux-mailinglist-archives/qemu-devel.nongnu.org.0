Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02ABF6B39E2
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 10:14:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paYnw-0007ju-3a; Fri, 10 Mar 2023 04:12:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1paYnj-0007gI-05
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 04:12:35 -0500
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1paYnf-0002Yq-Ep
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 04:12:34 -0500
Received: from [167.98.27.226] (helo=lawrence-thinkpad.office.codethink.co.uk)
 by imap5.colo.codethink.co.uk with esmtpsa (Exim 4.94.2 #2 (Debian))
 id 1paYna-00GpVx-CT; Fri, 10 Mar 2023 09:12:26 +0000
From: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
To: qemu-devel@nongnu.org
Cc: dickon.hood@codethink.co.uk, nazar.kazakov@codethink.co.uk,
 kiran.ostrolenk@codethink.co.uk, frank.chang@sifive.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 pbonzini@redhat.com, philipp.tomsich@vrull.eu, kvm@vger.kernel.org
Subject: [PATCH 10/45] target/riscv: Add vrol.[vv, vx] and vror.[vv, vx,
 vi] decoding, translation and execution support
Date: Fri, 10 Mar 2023 09:11:40 +0000
Message-Id: <20230310091215.931644-11-lawrence.hunter@codethink.co.uk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310091215.931644-1-lawrence.hunter@codethink.co.uk>
References: <20230310091215.931644-1-lawrence.hunter@codethink.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=78.40.148.171;
 envelope-from=lawrence.hunter@codethink.co.uk; helo=imap5.colo.codethink.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Dickon Hood <dickon.hood@codethink.co.uk>

Add an implementation of the vrol.* and vror.* instructions,
with mappings between the RISC-V instructions and their internal TCG
accelerated implmentations.

There are some missing ror helpers, so I've bodged it by converting them
to rols.

Co-authored-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
Signed-off-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
Signed-off-by: Dickon Hood <dickon.hood@codethink.co.uk>
---
 target/riscv/helper.h                      | 20 ++++++++
 target/riscv/insn32.decode                 |  7 +++
 target/riscv/insn_trans/trans_rvv.c.inc    |  3 ++
 target/riscv/insn_trans/trans_rvzvkb.c.inc | 57 ++++++++++++++++++++++
 target/riscv/vcrypto_helper.c              | 36 ++++++++++++++
 5 files changed, 123 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 37f2e162f6..841cb43f04 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1148,3 +1148,23 @@ DEF_HELPER_6(vclmul_vv, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vclmul_vx, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vclmulh_vv, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vclmulh_vx, void, ptr, ptr, tl, ptr, env, i32)
+
+DEF_HELPER_6(vror_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vror_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vror_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vror_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+
+DEF_HELPER_6(vror_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vror_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vror_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vror_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+
+DEF_HELPER_6(vrol_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vrol_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vrol_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vrol_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+
+DEF_HELPER_6(vrol_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vrol_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vrol_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vrol_vx_d, void, ptr, ptr, tl, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 488e01ca59..c557c063df 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -37,6 +37,7 @@
 %imm_u    12:s20                 !function=ex_shift_12
 %imm_bs   30:2                   !function=ex_shift_3
 %imm_rnum 20:4
+%imm_z6   26:1 15:5
 
 # Argument sets:
 &empty
@@ -82,6 +83,7 @@
 @r_vm    ...... vm:1 ..... ..... ... ..... ....... &rmrr %rs2 %rs1 %rd
 @r_vm_1  ...... . ..... ..... ... ..... .......    &rmrr vm=1 %rs2 %rs1 %rd
 @r_vm_0  ...... . ..... ..... ... ..... .......    &rmrr vm=0 %rs2 %rs1 %rd
+@r2_zimm6  ..... . vm:1 ..... ..... ... ..... .......  &rmrr %rs2 rs1=%imm_z6 %rd
 @r2_zimm11 . zimm:11  ..... ... ..... ....... %rs1 %rd
 @r2_zimm10 .. zimm:10  ..... ... ..... ....... %rs1 %rd
 @r2_s    .......   ..... ..... ... ..... ....... %rs2 %rs1
@@ -914,3 +916,8 @@ vclmul_vv       001100 . ..... ..... 010 ..... 1010111 @r_vm
 vclmul_vx       001100 . ..... ..... 110 ..... 1010111 @r_vm
 vclmulh_vv      001101 . ..... ..... 010 ..... 1010111 @r_vm
 vclmulh_vx      001101 . ..... ..... 110 ..... 1010111 @r_vm
+vrol_vv         010101 . ..... ..... 000 ..... 1010111 @r_vm
+vrol_vx         010101 . ..... ..... 100 ..... 1010111 @r_vm
+vror_vv         010100 . ..... ..... 000 ..... 1010111 @r_vm
+vror_vx         010100 . ..... ..... 100 ..... 1010111 @r_vm
+vror_vi         01010. . ..... ..... 011 ..... 1010111 @r2_zimm6
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index bb5e2c5407..fa89a2f466 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1374,6 +1374,7 @@ GEN_OPIVX_GVEC_TRANS(vrsub_vx, rsubs)
 typedef enum {
     IMM_ZX,         /* Zero-extended */
     IMM_SX,         /* Sign-extended */
+    IMM_ZIMM6,      /* Truncate to 6 bits */
     IMM_TRUNC_SEW,  /* Truncate to log(SEW) bits */
     IMM_TRUNC_2SEW, /* Truncate to log(2*SEW) bits */
 } imm_mode_t;
@@ -1389,6 +1390,8 @@ static int64_t extract_imm(DisasContext *s, uint32_t imm, imm_mode_t imm_mode)
         return extract64(imm, 0, s->sew + 3);
     case IMM_TRUNC_2SEW:
         return extract64(imm, 0, s->sew + 4);
+    case IMM_ZIMM6:
+        return extract64(imm, 0, 6);
     default:
         g_assert_not_reached();
     }
diff --git a/target/riscv/insn_trans/trans_rvzvkb.c.inc b/target/riscv/insn_trans/trans_rvzvkb.c.inc
index 810e469e13..f71383e482 100644
--- a/target/riscv/insn_trans/trans_rvzvkb.c.inc
+++ b/target/riscv/insn_trans/trans_rvzvkb.c.inc
@@ -88,3 +88,60 @@ static bool vclmul_vx_check(DisasContext *s, arg_rmrr *a)
 
 GEN_VX_MASKED_TRANS(vclmul_vx, vclmul_vx_check)
 GEN_VX_MASKED_TRANS(vclmulh_vx, vclmul_vx_check)
+
+#define GEN_OPIVI_GVEC_TRANS_CHECK(NAME, IMM_MODE, OPIVX, SUF, CHECK) \
+static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                \
+{                                                                     \
+    if (CHECK(s, a)) {                                                \
+        static gen_helper_opivx * const fns[4] = {                    \
+            gen_helper_##OPIVX##_b, gen_helper_##OPIVX##_h,           \
+            gen_helper_##OPIVX##_w, gen_helper_##OPIVX##_d,           \
+        };                                                            \
+        return do_opivi_gvec(s, a, tcg_gen_gvec_##SUF,                \
+                             fns[s->sew], IMM_MODE);                  \
+    }                                                                 \
+    return false;                                                     \
+}
+
+#define GEN_OPIVV_GVEC_TRANS_CHECK(NAME, SUF, CHECK)                 \
+static bool trans_##NAME(DisasContext *s, arg_rmrr *a)               \
+{                                                                    \
+    if (CHECK(s, a)) {                                               \
+        static gen_helper_gvec_4_ptr * const fns[4] = {              \
+            gen_helper_##NAME##_b, gen_helper_##NAME##_h,            \
+            gen_helper_##NAME##_w, gen_helper_##NAME##_d,            \
+        };                                                           \
+        return do_opivv_gvec(s, a, tcg_gen_gvec_##SUF, fns[s->sew]); \
+    }                                                                \
+    return false;                                                    \
+}
+
+#define GEN_OPIVX_GVEC_SHIFT_TRANS_CHECK(NAME, SUF, CHECK)                 \
+static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                     \
+{                                                                          \
+    if (CHECK(s, a)) {                                                     \
+        static gen_helper_opivx * const fns[4] = {                         \
+            gen_helper_##NAME##_b, gen_helper_##NAME##_h,                  \
+            gen_helper_##NAME##_w, gen_helper_##NAME##_d,                  \
+        };                                                                 \
+        return do_opivx_gvec_shift(s, a, tcg_gen_gvec_##SUF, fns[s->sew]); \
+    }                                                                      \
+    return false;                                                          \
+}
+
+static void tcg_gen_gvec_rotrs(unsigned vece, uint32_t dofs, uint32_t aofs,
+                               TCGv_i32 shift, uint32_t oprsz, uint32_t maxsz)
+{
+    TCGv_i32 tmp = tcg_temp_new_i32();
+    tcg_gen_sub_i32(tmp, tcg_constant_i32(1 << (vece + 3)), shift);
+    tcg_gen_gvec_rotls(vece, dofs, aofs, tmp, oprsz, maxsz);
+}
+
+/* vrol.v[vx] */
+GEN_OPIVV_GVEC_TRANS_CHECK(vrol_vv, rotlv, zvkb_vv_check)
+GEN_OPIVX_GVEC_SHIFT_TRANS_CHECK(vrol_vx, rotls, zvkb_vx_check)
+
+/* vror.v[vxi] */
+GEN_OPIVV_GVEC_TRANS_CHECK(vror_vv, rotrv, zvkb_vv_check)
+GEN_OPIVX_GVEC_SHIFT_TRANS_CHECK(vror_vx, rotrs, zvkb_vx_check)
+GEN_OPIVI_GVEC_TRANS_CHECK(vror_vi, IMM_ZIMM6, vror_vx, rotri, zvkb_vx_check)
diff --git a/target/riscv/vcrypto_helper.c b/target/riscv/vcrypto_helper.c
index 8b7c63d499..30ed9b1270 100644
--- a/target/riscv/vcrypto_helper.c
+++ b/target/riscv/vcrypto_helper.c
@@ -57,3 +57,39 @@ RVVCALL(OPIVV2, vclmulh_vv, OP_UUU_D, H8, H8, H8, clmulh64)
 GEN_VEXT_VV(vclmulh_vv, 8)
 RVVCALL(OPIVX2, vclmulh_vx, OP_UUU_D, H8, H8, clmulh64)
 GEN_VEXT_VX(vclmulh_vx, 8)
+
+RVVCALL(OPIVV2, vror_vv_b, OP_UUU_B, H1, H1, H1, ror8)
+RVVCALL(OPIVV2, vror_vv_h, OP_UUU_H, H2, H2, H2, ror16)
+RVVCALL(OPIVV2, vror_vv_w, OP_UUU_W, H4, H4, H4, ror32)
+RVVCALL(OPIVV2, vror_vv_d, OP_UUU_D, H8, H8, H8, ror64)
+GEN_VEXT_VV(vror_vv_b, 1)
+GEN_VEXT_VV(vror_vv_h, 2)
+GEN_VEXT_VV(vror_vv_w, 4)
+GEN_VEXT_VV(vror_vv_d, 8)
+
+RVVCALL(OPIVX2, vror_vx_b, OP_UUU_B, H1, H1, ror8)
+RVVCALL(OPIVX2, vror_vx_h, OP_UUU_H, H2, H2, ror16)
+RVVCALL(OPIVX2, vror_vx_w, OP_UUU_W, H4, H4, ror32)
+RVVCALL(OPIVX2, vror_vx_d, OP_UUU_D, H8, H8, ror64)
+GEN_VEXT_VX(vror_vx_b, 1)
+GEN_VEXT_VX(vror_vx_h, 2)
+GEN_VEXT_VX(vror_vx_w, 4)
+GEN_VEXT_VX(vror_vx_d, 8)
+
+RVVCALL(OPIVV2, vrol_vv_b, OP_UUU_B, H1, H1, H1, rol8)
+RVVCALL(OPIVV2, vrol_vv_h, OP_UUU_H, H2, H2, H2, rol16)
+RVVCALL(OPIVV2, vrol_vv_w, OP_UUU_W, H4, H4, H4, rol32)
+RVVCALL(OPIVV2, vrol_vv_d, OP_UUU_D, H8, H8, H8, rol64)
+GEN_VEXT_VV(vrol_vv_b, 1)
+GEN_VEXT_VV(vrol_vv_h, 2)
+GEN_VEXT_VV(vrol_vv_w, 4)
+GEN_VEXT_VV(vrol_vv_d, 8)
+
+RVVCALL(OPIVX2, vrol_vx_b, OP_UUU_B, H1, H1, rol8)
+RVVCALL(OPIVX2, vrol_vx_h, OP_UUU_H, H2, H2, rol16)
+RVVCALL(OPIVX2, vrol_vx_w, OP_UUU_W, H4, H4, rol32)
+RVVCALL(OPIVX2, vrol_vx_d, OP_UUU_D, H8, H8, rol64)
+GEN_VEXT_VX(vrol_vx_b, 1)
+GEN_VEXT_VX(vrol_vx_h, 2)
+GEN_VEXT_VX(vrol_vx_w, 4)
+GEN_VEXT_VX(vrol_vx_d, 8)
-- 
2.39.2


