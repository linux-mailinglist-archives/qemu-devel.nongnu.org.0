Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C63511F5505
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jun 2020 14:39:57 +0200 (CEST)
Received: from localhost ([::1]:51292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jj01M-0000bD-Sp
	for lists+qemu-devel@lfdr.de; Wed, 10 Jun 2020 08:39:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jizzz-0007pi-BA; Wed, 10 Jun 2020 08:38:31 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:46564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jizzw-0003DB-PQ; Wed, 10 Jun 2020 08:38:31 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07612455|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_system_inform|0.00777483-0.000127642-0.992097;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01a16384; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=9; RT=8; SR=0; TI=SMTPD_---.Hkat2oE_1591792701; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Hkat2oE_1591792701)
 by smtp.aliyun-inc.com(10.147.42.135);
 Wed, 10 Jun 2020 20:38:22 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v9 30/61] target/riscv: vector single-width floating-point
 add/subtract instructions
Date: Wed, 10 Jun 2020 19:37:17 +0800
Message-Id: <20200610113748.4754-31-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200610113748.4754-1-zhiwei_liu@c-sky.com>
References: <20200610113748.4754-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/10 07:37:52
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=_AUTOLEARN
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
Cc: richard.henderson@linaro.org, wxy194768@alibaba-inc.com,
 wenmeng_zhang@c-sky.com, Alistair Francis <alistair.francis@wdc.com>,
 palmer@dabbelt.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |  16 ++++
 target/riscv/insn32.decode              |   5 +
 target/riscv/insn_trans/trans_rvv.inc.c | 118 ++++++++++++++++++++++++
 target/riscv/vector_helper.c            | 111 ++++++++++++++++++++++
 4 files changed, 250 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 7f7fdcb451..3031a941c2 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -797,3 +797,19 @@ DEF_HELPER_6(vnclipu_vx_w, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vnclip_vx_b, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vnclip_vx_h, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vnclip_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+
+DEF_HELPER_6(vfadd_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfadd_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfadd_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfsub_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfsub_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfsub_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfadd_vf_h, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfadd_vf_w, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfadd_vf_d, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfsub_vf_h, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfsub_vf_w, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfsub_vf_d, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfrsub_vf_h, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfrsub_vf_w, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfrsub_vf_d, void, ptr, ptr, i64, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 8b898f9bad..c8e3f10162 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -443,6 +443,11 @@ vnclipu_vi      101110 . ..... ..... 011 ..... 1010111 @r_vm
 vnclip_vv       101111 . ..... ..... 000 ..... 1010111 @r_vm
 vnclip_vx       101111 . ..... ..... 100 ..... 1010111 @r_vm
 vnclip_vi       101111 . ..... ..... 011 ..... 1010111 @r_vm
+vfadd_vv        000000 . ..... ..... 001 ..... 1010111 @r_vm
+vfadd_vf        000000 . ..... ..... 101 ..... 1010111 @r_vm
+vfsub_vv        000010 . ..... ..... 001 ..... 1010111 @r_vm
+vfsub_vf        000010 . ..... ..... 101 ..... 1010111 @r_vm
+vfrsub_vf       100111 . ..... ..... 101 ..... 1010111 @r_vm
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 96fcf02a8c..7461e86de8 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -1783,3 +1783,121 @@ GEN_OPIVX_NARROW_TRANS(vnclipu_vx)
 GEN_OPIVX_NARROW_TRANS(vnclip_vx)
 GEN_OPIVI_NARROW_TRANS(vnclipu_vi, 1, vnclipu_vx)
 GEN_OPIVI_NARROW_TRANS(vnclip_vi, 1, vnclip_vx)
+
+/*
+ *** Vector Float Point Arithmetic Instructions
+ */
+/* Vector Single-Width Floating-Point Add/Subtract Instructions */
+
+/*
+ * If the current SEW does not correspond to a supported IEEE floating-point
+ * type, an illegal instruction exception is raised.
+ */
+static bool opfvv_check(DisasContext *s, arg_rmrr *a)
+{
+    return (vext_check_isa_ill(s) &&
+            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
+            vext_check_reg(s, a->rd, false) &&
+            vext_check_reg(s, a->rs2, false) &&
+            vext_check_reg(s, a->rs1, false) &&
+            (s->sew != 0));
+}
+
+/* OPFVV without GVEC IR */
+#define GEN_OPFVV_TRANS(NAME, CHECK)                               \
+static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
+{                                                                  \
+    if (CHECK(s, a)) {                                             \
+        uint32_t data = 0;                                         \
+        static gen_helper_gvec_4_ptr * const fns[3] = {            \
+            gen_helper_##NAME##_h,                                 \
+            gen_helper_##NAME##_w,                                 \
+            gen_helper_##NAME##_d,                                 \
+        };                                                         \
+        TCGLabel *over = gen_new_label();                          \
+        gen_set_rm(s, 7);                                          \
+        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
+                                                                   \
+        data = FIELD_DP32(data, VDATA, MLEN, s->mlen);             \
+        data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
+        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
+        tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
+                           vreg_ofs(s, a->rs1),                    \
+                           vreg_ofs(s, a->rs2), cpu_env, 0,        \
+                           s->vlen / 8, data, fns[s->sew - 1]);    \
+        gen_set_label(over);                                       \
+        return true;                                               \
+    }                                                              \
+    return false;                                                  \
+}
+GEN_OPFVV_TRANS(vfadd_vv, opfvv_check)
+GEN_OPFVV_TRANS(vfsub_vv, opfvv_check)
+
+typedef void gen_helper_opfvf(TCGv_ptr, TCGv_ptr, TCGv_i64, TCGv_ptr,
+                              TCGv_env, TCGv_i32);
+
+static bool opfvf_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
+                        uint32_t data, gen_helper_opfvf *fn, DisasContext *s)
+{
+    TCGv_ptr dest, src2, mask;
+    TCGv_i32 desc;
+
+    TCGLabel *over = gen_new_label();
+    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+
+    dest = tcg_temp_new_ptr();
+    mask = tcg_temp_new_ptr();
+    src2 = tcg_temp_new_ptr();
+    desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
+
+    tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
+    tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, vs2));
+    tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
+
+    fn(dest, mask, cpu_fpr[rs1], src2, cpu_env, desc);
+
+    tcg_temp_free_ptr(dest);
+    tcg_temp_free_ptr(mask);
+    tcg_temp_free_ptr(src2);
+    tcg_temp_free_i32(desc);
+    gen_set_label(over);
+    return true;
+}
+
+static bool opfvf_check(DisasContext *s, arg_rmrr *a)
+{
+/*
+ * If the current SEW does not correspond to a supported IEEE floating-point
+ * type, an illegal instruction exception is raised
+ */
+    return (vext_check_isa_ill(s) &&
+            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
+            vext_check_reg(s, a->rd, false) &&
+            vext_check_reg(s, a->rs2, false) &&
+            (s->sew != 0));
+}
+
+/* OPFVF without GVEC IR */
+#define GEN_OPFVF_TRANS(NAME, CHECK)                              \
+static bool trans_##NAME(DisasContext *s, arg_rmrr *a)            \
+{                                                                 \
+    if (CHECK(s, a)) {                                            \
+        uint32_t data = 0;                                        \
+        static gen_helper_opfvf *const fns[3] = {                 \
+            gen_helper_##NAME##_h,                                \
+            gen_helper_##NAME##_w,                                \
+            gen_helper_##NAME##_d,                                \
+        };                                                        \
+        gen_set_rm(s, 7);                                         \
+        data = FIELD_DP32(data, VDATA, MLEN, s->mlen);            \
+        data = FIELD_DP32(data, VDATA, VM, a->vm);                \
+        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);            \
+        return opfvf_trans(a->rd, a->rs1, a->rs2, data,           \
+                           fns[s->sew - 1], s);                   \
+    }                                                             \
+    return false;                                                 \
+}
+
+GEN_OPFVF_TRANS(vfadd_vf,  opfvf_check)
+GEN_OPFVF_TRANS(vfsub_vf,  opfvf_check)
+GEN_OPFVF_TRANS(vfrsub_vf,  opfvf_check)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 1c375f437a..f8f82008af 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -21,6 +21,7 @@
 #include "exec/memop.h"
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
+#include "fpu/softfloat.h"
 #include "tcg/tcg-gvec-desc.h"
 #include "internals.h"
 #include <math.h>
@@ -3167,3 +3168,113 @@ RVVCALL(OPIVX2_RM, vnclipu_vx_w, NOP_UUU_W, H4, H8, vnclipu32)
 GEN_VEXT_VX_RM(vnclipu_vx_b, 1, 1, clearb)
 GEN_VEXT_VX_RM(vnclipu_vx_h, 2, 2, clearh)
 GEN_VEXT_VX_RM(vnclipu_vx_w, 4, 4, clearl)
+
+/*
+ *** Vector Float Point Arithmetic Instructions
+ */
+/* Vector Single-Width Floating-Point Add/Subtract Instructions */
+#define OPFVV2(NAME, TD, T1, T2, TX1, TX2, HD, HS1, HS2, OP)   \
+static void do_##NAME(void *vd, void *vs1, void *vs2, int i,   \
+                      CPURISCVState *env)                      \
+{                                                              \
+    TX1 s1 = *((T1 *)vs1 + HS1(i));                            \
+    TX2 s2 = *((T2 *)vs2 + HS2(i));                            \
+    *((TD *)vd + HD(i)) = OP(s2, s1, &env->fp_status);         \
+}
+
+#define GEN_VEXT_VV_ENV(NAME, ESZ, DSZ, CLEAR_FN)         \
+void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
+                  void *vs2, CPURISCVState *env,          \
+                  uint32_t desc)                          \
+{                                                         \
+    uint32_t vlmax = vext_maxsz(desc) / ESZ;              \
+    uint32_t mlen = vext_mlen(desc);                      \
+    uint32_t vm = vext_vm(desc);                          \
+    uint32_t vl = env->vl;                                \
+    uint32_t i;                                           \
+                                                          \
+    for (i = 0; i < vl; i++) {                            \
+        if (!vm && !vext_elem_mask(v0, mlen, i)) {        \
+            continue;                                     \
+        }                                                 \
+        do_##NAME(vd, vs1, vs2, i, env);                  \
+    }                                                     \
+    CLEAR_FN(vd, vl, vl * DSZ,  vlmax * DSZ);             \
+}
+
+RVVCALL(OPFVV2, vfadd_vv_h, OP_UUU_H, H2, H2, H2, float16_add)
+RVVCALL(OPFVV2, vfadd_vv_w, OP_UUU_W, H4, H4, H4, float32_add)
+RVVCALL(OPFVV2, vfadd_vv_d, OP_UUU_D, H8, H8, H8, float64_add)
+GEN_VEXT_VV_ENV(vfadd_vv_h, 2, 2, clearh)
+GEN_VEXT_VV_ENV(vfadd_vv_w, 4, 4, clearl)
+GEN_VEXT_VV_ENV(vfadd_vv_d, 8, 8, clearq)
+
+#define OPFVF2(NAME, TD, T1, T2, TX1, TX2, HD, HS2, OP)        \
+static void do_##NAME(void *vd, uint64_t s1, void *vs2, int i, \
+                      CPURISCVState *env)                      \
+{                                                              \
+    TX2 s2 = *((T2 *)vs2 + HS2(i));                            \
+    *((TD *)vd + HD(i)) = OP(s2, (TX1)(T1)s1, &env->fp_status);\
+}
+
+#define GEN_VEXT_VF(NAME, ESZ, DSZ, CLEAR_FN)             \
+void HELPER(NAME)(void *vd, void *v0, uint64_t s1,        \
+                  void *vs2, CPURISCVState *env,          \
+                  uint32_t desc)                          \
+{                                                         \
+    uint32_t vlmax = vext_maxsz(desc) / ESZ;              \
+    uint32_t mlen = vext_mlen(desc);                      \
+    uint32_t vm = vext_vm(desc);                          \
+    uint32_t vl = env->vl;                                \
+    uint32_t i;                                           \
+                                                          \
+    for (i = 0; i < vl; i++) {                            \
+        if (!vm && !vext_elem_mask(v0, mlen, i)) {        \
+            continue;                                     \
+        }                                                 \
+        do_##NAME(vd, s1, vs2, i, env);                   \
+    }                                                     \
+    CLEAR_FN(vd, vl, vl * DSZ,  vlmax * DSZ);             \
+}
+
+RVVCALL(OPFVF2, vfadd_vf_h, OP_UUU_H, H2, H2, float16_add)
+RVVCALL(OPFVF2, vfadd_vf_w, OP_UUU_W, H4, H4, float32_add)
+RVVCALL(OPFVF2, vfadd_vf_d, OP_UUU_D, H8, H8, float64_add)
+GEN_VEXT_VF(vfadd_vf_h, 2, 2, clearh)
+GEN_VEXT_VF(vfadd_vf_w, 4, 4, clearl)
+GEN_VEXT_VF(vfadd_vf_d, 8, 8, clearq)
+
+RVVCALL(OPFVV2, vfsub_vv_h, OP_UUU_H, H2, H2, H2, float16_sub)
+RVVCALL(OPFVV2, vfsub_vv_w, OP_UUU_W, H4, H4, H4, float32_sub)
+RVVCALL(OPFVV2, vfsub_vv_d, OP_UUU_D, H8, H8, H8, float64_sub)
+GEN_VEXT_VV_ENV(vfsub_vv_h, 2, 2, clearh)
+GEN_VEXT_VV_ENV(vfsub_vv_w, 4, 4, clearl)
+GEN_VEXT_VV_ENV(vfsub_vv_d, 8, 8, clearq)
+RVVCALL(OPFVF2, vfsub_vf_h, OP_UUU_H, H2, H2, float16_sub)
+RVVCALL(OPFVF2, vfsub_vf_w, OP_UUU_W, H4, H4, float32_sub)
+RVVCALL(OPFVF2, vfsub_vf_d, OP_UUU_D, H8, H8, float64_sub)
+GEN_VEXT_VF(vfsub_vf_h, 2, 2, clearh)
+GEN_VEXT_VF(vfsub_vf_w, 4, 4, clearl)
+GEN_VEXT_VF(vfsub_vf_d, 8, 8, clearq)
+
+static uint16_t float16_rsub(uint16_t a, uint16_t b, float_status *s)
+{
+    return float16_sub(b, a, s);
+}
+
+static uint32_t float32_rsub(uint32_t a, uint32_t b, float_status *s)
+{
+    return float32_sub(b, a, s);
+}
+
+static uint64_t float64_rsub(uint64_t a, uint64_t b, float_status *s)
+{
+    return float64_sub(b, a, s);
+}
+
+RVVCALL(OPFVF2, vfrsub_vf_h, OP_UUU_H, H2, H2, float16_rsub)
+RVVCALL(OPFVF2, vfrsub_vf_w, OP_UUU_W, H4, H4, float32_rsub)
+RVVCALL(OPFVF2, vfrsub_vf_d, OP_UUU_D, H8, H8, float64_rsub)
+GEN_VEXT_VF(vfrsub_vf_h, 2, 2, clearh)
+GEN_VEXT_VF(vfrsub_vf_w, 4, 4, clearl)
+GEN_VEXT_VF(vfrsub_vf_d, 8, 8, clearq)
-- 
2.23.0


