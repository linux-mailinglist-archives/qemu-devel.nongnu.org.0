Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8506E198166
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Mar 2020 18:40:50 +0200 (CEST)
Received: from localhost ([::1]:52774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jIxSz-0007xG-Ja
	for lists+qemu-devel@lfdr.de; Mon, 30 Mar 2020 12:40:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51503)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jIxRh-00074R-CU
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 12:39:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jIxRf-0000XQ-3d
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 12:39:28 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:59191)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jIxRe-0000Qq-9M; Mon, 30 Mar 2020 12:39:27 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07608286|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_system_inform|0.0267904-6.01599e-05-0.973149;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01a16384; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=10; RT=10; SR=0; TI=SMTPD_---.H7khNB2_1585586359; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.H7khNB2_1585586359)
 by smtp.aliyun-inc.com(10.147.42.197);
 Tue, 31 Mar 2020 00:39:19 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: richard.henderson@linaro.org, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Subject: [PATCH v7 31/61] target/riscv: vector widening floating-point
 add/subtract instructions
Date: Mon, 30 Mar 2020 23:36:03 +0800
Message-Id: <20200330153633.15298-32-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200330153633.15298-1-zhiwei_liu@c-sky.com>
References: <20200330153633.15298-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 121.197.200.217
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
Cc: guoren@linux.alibaba.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 wxy194768@alibaba-inc.com, wenmeng_zhang@c-sky.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h                   |  17 +++
 target/riscv/insn32.decode              |   8 ++
 target/riscv/insn_trans/trans_rvv.inc.c | 145 ++++++++++++++++++++++++
 target/riscv/vector_helper.c            |  83 ++++++++++++++
 4 files changed, 253 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 3031a941c2..73fc7a5a00 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -813,3 +813,20 @@ DEF_HELPER_6(vfsub_vf_d, void, ptr, ptr, i64, ptr, env, i32)
 DEF_HELPER_6(vfrsub_vf_h, void, ptr, ptr, i64, ptr, env, i32)
 DEF_HELPER_6(vfrsub_vf_w, void, ptr, ptr, i64, ptr, env, i32)
 DEF_HELPER_6(vfrsub_vf_d, void, ptr, ptr, i64, ptr, env, i32)
+
+DEF_HELPER_6(vfwadd_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfwadd_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfwsub_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfwsub_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfwadd_wv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfwadd_wv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfwsub_wv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfwsub_wv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfwadd_vf_h, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfwadd_vf_w, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfwsub_vf_h, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfwsub_vf_w, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfwadd_wf_h, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfwadd_wf_w, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfwsub_wf_h, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfwsub_wf_w, void, ptr, ptr, i64, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index c8e3f10162..68e9448842 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -448,6 +448,14 @@ vfadd_vf        000000 . ..... ..... 101 ..... 1010111 @r_vm
 vfsub_vv        000010 . ..... ..... 001 ..... 1010111 @r_vm
 vfsub_vf        000010 . ..... ..... 101 ..... 1010111 @r_vm
 vfrsub_vf       100111 . ..... ..... 101 ..... 1010111 @r_vm
+vfwadd_vv       110000 . ..... ..... 001 ..... 1010111 @r_vm
+vfwadd_vf       110000 . ..... ..... 101 ..... 1010111 @r_vm
+vfwadd_wv       110100 . ..... ..... 001 ..... 1010111 @r_vm
+vfwadd_wf       110100 . ..... ..... 101 ..... 1010111 @r_vm
+vfwsub_vv       110010 . ..... ..... 001 ..... 1010111 @r_vm
+vfwsub_vf       110010 . ..... ..... 101 ..... 1010111 @r_vm
+vfwsub_wv       110110 . ..... ..... 001 ..... 1010111 @r_vm
+vfwsub_wf       110110 . ..... ..... 101 ..... 1010111 @r_vm
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 9a8fb18adc..a539849fab 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -1923,3 +1923,148 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)            \
 GEN_OPFVF_TRANS(vfadd_vf,  opfvf_check)
 GEN_OPFVF_TRANS(vfsub_vf,  opfvf_check)
 GEN_OPFVF_TRANS(vfrsub_vf,  opfvf_check)
+
+/* Vector Widening Floating-Point Add/Subtract Instructions */
+static bool opfvv_widen_check(DisasContext *s, arg_rmrr *a)
+{
+    return (vext_check_isa_ill(s) &&
+            vext_check_overlap_mask(s, a->rd, a->vm, true) &&
+            vext_check_reg(s, a->rd, true) &&
+            vext_check_reg(s, a->rs2, false) &&
+            vext_check_reg(s, a->rs1, false) &&
+            vext_check_overlap_group(a->rd, 2 << s->lmul, a->rs2,
+                                     1 << s->lmul) &&
+            vext_check_overlap_group(a->rd, 2 << s->lmul, a->rs1,
+                                     1 << s->lmul) &&
+            (s->lmul < 0x3) && (s->sew < 0x3) && (s->sew != 0));
+}
+
+/* OPFVV with WIDEN */
+#define GEN_OPFVV_WIDEN_TRANS(NAME, CHECK)                       \
+static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
+{                                                                \
+    if (CHECK(s, a)) {                                           \
+        uint32_t data = 0;                                       \
+        static gen_helper_gvec_4_ptr * const fns[2] = {          \
+            gen_helper_##NAME##_h, gen_helper_##NAME##_w,        \
+        };                                                       \
+        TCGLabel *over = gen_new_label();                        \
+        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);        \
+                                                                 \
+        data = FIELD_DP32(data, VDATA, MLEN, s->mlen);           \
+        data = FIELD_DP32(data, VDATA, VM, a->vm);               \
+        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
+        tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),   \
+                           vreg_ofs(s, a->rs1),                  \
+                           vreg_ofs(s, a->rs2), cpu_env, 0,      \
+                           s->vlen / 8, data, fns[s->sew - 1]);  \
+        gen_set_label(over);                                     \
+        return true;                                             \
+    }                                                            \
+    return false;                                                \
+}
+
+GEN_OPFVV_WIDEN_TRANS(vfwadd_vv, opfvv_widen_check)
+GEN_OPFVV_WIDEN_TRANS(vfwsub_vv, opfvv_widen_check)
+
+static bool opfvf_widen_check(DisasContext *s, arg_rmrr *a)
+{
+    return (vext_check_isa_ill(s) &&
+            vext_check_overlap_mask(s, a->rd, a->vm, true) &&
+            vext_check_reg(s, a->rd, true) &&
+            vext_check_reg(s, a->rs2, false) &&
+            vext_check_overlap_group(a->rd, 2 << s->lmul, a->rs2,
+                                     1 << s->lmul) &&
+            (s->lmul < 0x3) && (s->sew < 0x3) && (s->sew != 0));
+}
+
+/* OPFVF with WIDEN */
+#define GEN_OPFVF_WIDEN_TRANS(NAME)                              \
+static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
+{                                                                \
+    if (opfvf_widen_check(s, a)) {                               \
+        uint32_t data = 0;                                       \
+        static gen_helper_opfvf *const fns[2] = {                \
+            gen_helper_##NAME##_h, gen_helper_##NAME##_w,        \
+        };                                                       \
+        data = FIELD_DP32(data, VDATA, MLEN, s->mlen);           \
+        data = FIELD_DP32(data, VDATA, VM, a->vm);               \
+        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
+        return opfvf_trans(a->rd, a->rs1, a->rs2, data,          \
+                           fns[s->sew - 1], s);                  \
+    }                                                            \
+    return false;                                                \
+}
+
+GEN_OPFVF_WIDEN_TRANS(vfwadd_vf)
+GEN_OPFVF_WIDEN_TRANS(vfwsub_vf)
+
+static bool opfwv_widen_check(DisasContext *s, arg_rmrr *a)
+{
+    return (vext_check_isa_ill(s) &&
+            vext_check_overlap_mask(s, a->rd, a->vm, true) &&
+            vext_check_reg(s, a->rd, true) &&
+            vext_check_reg(s, a->rs2, true) &&
+            vext_check_reg(s, a->rs1, false) &&
+            vext_check_overlap_group(a->rd, 2 << s->lmul, a->rs1,
+                                     1 << s->lmul) &&
+            (s->lmul < 0x3) && (s->sew < 0x3) && (s->sew != 0));
+}
+
+/* WIDEN OPFVV with WIDEN */
+#define GEN_OPFWV_WIDEN_TRANS(NAME)                                \
+static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
+{                                                                  \
+    if (opfwv_widen_check(s, a)) {                                 \
+        uint32_t data = 0;                                         \
+        static gen_helper_gvec_4_ptr * const fns[2] = {            \
+            gen_helper_##NAME##_h, gen_helper_##NAME##_w,          \
+        };                                                         \
+        TCGLabel *over = gen_new_label();                          \
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
+
+GEN_OPFWV_WIDEN_TRANS(vfwadd_wv)
+GEN_OPFWV_WIDEN_TRANS(vfwsub_wv)
+
+static bool opfwf_widen_check(DisasContext *s, arg_rmrr *a)
+{
+    return (vext_check_isa_ill(s) &&
+            vext_check_overlap_mask(s, a->rd, a->vm, true) &&
+            vext_check_reg(s, a->rd, true) &&
+            vext_check_reg(s, a->rs2, true) &&
+            (s->lmul < 0x3) && (s->sew < 0x3) && (s->sew != 0));
+}
+
+/* WIDEN OPFVF with WIDEN */
+#define GEN_OPFWF_WIDEN_TRANS(NAME)                              \
+static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
+{                                                                \
+    if (opfwf_widen_check(s, a)) {                               \
+        uint32_t data = 0;                                       \
+        static gen_helper_opfvf *const fns[2] = {                \
+            gen_helper_##NAME##_h, gen_helper_##NAME##_w,        \
+        };                                                       \
+        data = FIELD_DP32(data, VDATA, MLEN, s->mlen);           \
+        data = FIELD_DP32(data, VDATA, VM, a->vm);               \
+        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
+        return opfvf_trans(a->rd, a->rs1, a->rs2, data,          \
+                           fns[s->sew - 1], s);                  \
+    }                                                            \
+    return false;                                                \
+}
+
+GEN_OPFWF_WIDEN_TRANS(vfwadd_wf)
+GEN_OPFWF_WIDEN_TRANS(vfwsub_wf)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index af343e9bf9..08e59b0e29 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3277,3 +3277,86 @@ RVVCALL(OPFVF2, vfrsub_vf_d, OP_UUU_D, H8, H8, float64_rsub)
 GEN_VEXT_VF(vfrsub_vf_h, 2, 2, clearh)
 GEN_VEXT_VF(vfrsub_vf_w, 4, 4, clearl)
 GEN_VEXT_VF(vfrsub_vf_d, 8, 8, clearq)
+
+/* Vector Widening Floating-Point Add/Subtract Instructions */
+static uint32_t vfwadd16(uint16_t a, uint16_t b, float_status *s)
+{
+    return float32_add(float16_to_float32(a, true, s),
+            float16_to_float32(b, true, s), s);
+}
+
+static uint64_t vfwadd32(uint32_t a, uint32_t b, float_status *s)
+{
+    return float64_add(float32_to_float64(a, s),
+            float32_to_float64(b, s), s);
+
+}
+
+RVVCALL(OPFVV2, vfwadd_vv_h, WOP_UUU_H, H4, H2, H2, vfwadd16)
+RVVCALL(OPFVV2, vfwadd_vv_w, WOP_UUU_W, H8, H4, H4, vfwadd32)
+GEN_VEXT_VV_ENV(vfwadd_vv_h, 2, 4, clearl)
+GEN_VEXT_VV_ENV(vfwadd_vv_w, 4, 8, clearq)
+RVVCALL(OPFVF2, vfwadd_vf_h, WOP_UUU_H, H4, H2, vfwadd16)
+RVVCALL(OPFVF2, vfwadd_vf_w, WOP_UUU_W, H8, H4, vfwadd32)
+GEN_VEXT_VF(vfwadd_vf_h, 2, 4, clearl)
+GEN_VEXT_VF(vfwadd_vf_w, 4, 8, clearq)
+
+static uint32_t vfwsub16(uint16_t a, uint16_t b, float_status *s)
+{
+    return float32_sub(float16_to_float32(a, true, s),
+            float16_to_float32(b, true, s), s);
+}
+
+static uint64_t vfwsub32(uint32_t a, uint32_t b, float_status *s)
+{
+    return float64_sub(float32_to_float64(a, s),
+            float32_to_float64(b, s), s);
+
+}
+
+RVVCALL(OPFVV2, vfwsub_vv_h, WOP_UUU_H, H4, H2, H2, vfwsub16)
+RVVCALL(OPFVV2, vfwsub_vv_w, WOP_UUU_W, H8, H4, H4, vfwsub32)
+GEN_VEXT_VV_ENV(vfwsub_vv_h, 2, 4, clearl)
+GEN_VEXT_VV_ENV(vfwsub_vv_w, 4, 8, clearq)
+RVVCALL(OPFVF2, vfwsub_vf_h, WOP_UUU_H, H4, H2, vfwsub16)
+RVVCALL(OPFVF2, vfwsub_vf_w, WOP_UUU_W, H8, H4, vfwsub32)
+GEN_VEXT_VF(vfwsub_vf_h, 2, 4, clearl)
+GEN_VEXT_VF(vfwsub_vf_w, 4, 8, clearq)
+
+static uint32_t vfwaddw16(uint32_t a, uint16_t b, float_status *s)
+{
+    return float32_add(a, float16_to_float32(b, true, s), s);
+}
+
+static uint64_t vfwaddw32(uint64_t a, uint32_t b, float_status *s)
+{
+    return float64_add(a, float32_to_float64(b, s), s);
+}
+
+RVVCALL(OPFVV2, vfwadd_wv_h, WOP_WUUU_H, H4, H2, H2, vfwaddw16)
+RVVCALL(OPFVV2, vfwadd_wv_w, WOP_WUUU_W, H8, H4, H4, vfwaddw32)
+GEN_VEXT_VV_ENV(vfwadd_wv_h, 2, 4, clearl)
+GEN_VEXT_VV_ENV(vfwadd_wv_w, 4, 8, clearq)
+RVVCALL(OPFVF2, vfwadd_wf_h, WOP_WUUU_H, H4, H2, vfwaddw16)
+RVVCALL(OPFVF2, vfwadd_wf_w, WOP_WUUU_W, H8, H4, vfwaddw32)
+GEN_VEXT_VF(vfwadd_wf_h, 2, 4, clearl)
+GEN_VEXT_VF(vfwadd_wf_w, 4, 8, clearq)
+
+static uint32_t vfwsubw16(uint32_t a, uint16_t b, float_status *s)
+{
+    return float32_sub(a, float16_to_float32(b, true, s), s);
+}
+
+static uint64_t vfwsubw32(uint64_t a, uint32_t b, float_status *s)
+{
+    return float64_sub(a, float32_to_float64(b, s), s);
+}
+
+RVVCALL(OPFVV2, vfwsub_wv_h, WOP_WUUU_H, H4, H2, H2, vfwsubw16)
+RVVCALL(OPFVV2, vfwsub_wv_w, WOP_WUUU_W, H8, H4, H4, vfwsubw32)
+GEN_VEXT_VV_ENV(vfwsub_wv_h, 2, 4, clearl)
+GEN_VEXT_VV_ENV(vfwsub_wv_w, 4, 8, clearq)
+RVVCALL(OPFVF2, vfwsub_wf_h, WOP_WUUU_H, H4, H2, vfwsubw16)
+RVVCALL(OPFVF2, vfwsub_wf_w, WOP_WUUU_W, H8, H4, vfwsubw32)
+GEN_VEXT_VF(vfwsub_wf_h, 2, 4, clearl)
+GEN_VEXT_VF(vfwsub_wf_w, 4, 8, clearq)
-- 
2.23.0


