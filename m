Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E38188946
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 16:39:01 +0100 (CET)
Received: from localhost ([::1]:34938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEEJ2-0000OQ-Ap
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 11:39:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43944)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jEE9k-0005Th-Ek
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 11:29:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jEE9h-0004vE-Pz
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 11:29:24 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:45426)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jEE9g-0004CJ-QG; Tue, 17 Mar 2020 11:29:21 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436282|-1; CH=green; DM=||false|;
 DS=CONTINUE|ham_system_inform|0.762254-0.00146154-0.236284;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03307; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=10; RT=10; SR=0; TI=SMTPD_---.H0zhVLV_1584458948; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.H0zhVLV_1584458948)
 by smtp.aliyun-inc.com(10.147.41.138);
 Tue, 17 Mar 2020 23:29:09 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: richard.henderson@linaro.org, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Subject: [PATCH v6 11/61] target/riscv: vector widening integer add and
 subtract
Date: Tue, 17 Mar 2020 23:06:03 +0800
Message-Id: <20200317150653.9008-12-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200317150653.9008-1-zhiwei_liu@c-sky.com>
References: <20200317150653.9008-1-zhiwei_liu@c-sky.com>
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |  49 +++++++
 target/riscv/insn32.decode              |  16 +++
 target/riscv/insn_trans/trans_rvv.inc.c | 178 ++++++++++++++++++++++++
 target/riscv/vector_helper.c            | 111 +++++++++++++++
 4 files changed, 354 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index e73701d4bb..1256defb6c 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -290,3 +290,52 @@ DEF_HELPER_6(vrsub_vx_b, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vrsub_vx_h, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vrsub_vx_w, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vrsub_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+
+DEF_HELPER_6(vwaddu_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwaddu_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwaddu_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwsubu_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwsubu_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwsubu_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwadd_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwadd_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwadd_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwsub_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwsub_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwsub_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwaddu_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwaddu_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwaddu_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwsubu_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwsubu_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwsubu_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwadd_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwadd_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwadd_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwsub_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwsub_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwsub_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwaddu_wv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwaddu_wv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwaddu_wv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwsubu_wv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwsubu_wv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwsubu_wv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwadd_wv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwadd_wv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwadd_wv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwsub_wv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwsub_wv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwsub_wv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwaddu_wx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwaddu_wx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwaddu_wx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwsubu_wx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwsubu_wx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwsubu_wx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwadd_wx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwadd_wx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwadd_wx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwsub_wx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwsub_wx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vwsub_wx_w, void, ptr, ptr, tl, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index d1034a0e61..4bdbfd16fa 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -284,6 +284,22 @@ vsub_vv         000010 . ..... ..... 000 ..... 1010111 @r_vm
 vsub_vx         000010 . ..... ..... 100 ..... 1010111 @r_vm
 vrsub_vx        000011 . ..... ..... 100 ..... 1010111 @r_vm
 vrsub_vi        000011 . ..... ..... 011 ..... 1010111 @r_vm
+vwaddu_vv       110000 . ..... ..... 010 ..... 1010111 @r_vm
+vwaddu_vx       110000 . ..... ..... 110 ..... 1010111 @r_vm
+vwadd_vv        110001 . ..... ..... 010 ..... 1010111 @r_vm
+vwadd_vx        110001 . ..... ..... 110 ..... 1010111 @r_vm
+vwsubu_vv       110010 . ..... ..... 010 ..... 1010111 @r_vm
+vwsubu_vx       110010 . ..... ..... 110 ..... 1010111 @r_vm
+vwsub_vv        110011 . ..... ..... 010 ..... 1010111 @r_vm
+vwsub_vx        110011 . ..... ..... 110 ..... 1010111 @r_vm
+vwaddu_wv       110100 . ..... ..... 010 ..... 1010111 @r_vm
+vwaddu_wx       110100 . ..... ..... 110 ..... 1010111 @r_vm
+vwadd_wv        110101 . ..... ..... 010 ..... 1010111 @r_vm
+vwadd_wx        110101 . ..... ..... 110 ..... 1010111 @r_vm
+vwsubu_wv       110110 . ..... ..... 010 ..... 1010111 @r_vm
+vwsubu_wx       110110 . ..... ..... 110 ..... 1010111 @r_vm
+vwsub_wv        110111 . ..... ..... 010 ..... 1010111 @r_vm
+vwsub_wx        110111 . ..... ..... 110 ..... 1010111 @r_vm
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index c68f6ffe3b..8f17faa3f3 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -128,6 +128,14 @@ static bool vext_check_nf(DisasContext *s, uint32_t nf)
     return (1 << s->lmul) * nf <= 8;
 }
 
+/*
+ * The destination vector register group cannot overlap a source vector register
+ * group of a different element width. (Section 11.2)
+ */
+static inline bool vext_check_overlap_group(int rd, int dlen, int rs, int slen)
+{
+    return ((rd >= rs + slen) || (rs >= rd + dlen));
+}
 /* common translation macro */
 #define GEN_VEXT_TRANS(NAME, SEQ, ARGTYPE, OP, CHECK)      \
 static bool trans_##NAME(DisasContext *s, arg_##ARGTYPE *a)\
@@ -991,3 +999,173 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                   \
 }
 
 GEN_OPIVI_TRANS(vrsub_vi, 0, vrsub_vx, opivx_check)
+
+/* Vector Widening Integer Add/Subtract */
+
+/* OPIVV with WIDEN */
+static bool opivv_widen_check(DisasContext *s, arg_rmrr *a)
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
+            (s->lmul < 0x3) && (s->sew < 0x3));
+}
+
+static bool do_opivv_widen(DisasContext *s, arg_rmrr *a,
+                           gen_helper_gvec_4_ptr *fn,
+                           bool (*checkfn)(DisasContext *, arg_rmrr *))
+{
+    if (checkfn(s, a)) {
+        uint32_t data = 0;
+        data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
+        data = FIELD_DP32(data, VDATA, VM, a->vm);
+        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
+        tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
+                           vreg_ofs(s, a->rs1),
+                           vreg_ofs(s, a->rs2),
+                           cpu_env, 0, s->vlen / 8,
+                           data, fn);
+        return true;
+    }
+    return false;
+}
+
+#define GEN_OPIVV_WIDEN_TRANS(NAME, CHECK) \
+static bool trans_##NAME(DisasContext *s, arg_rmrr *a)       \
+{                                                            \
+    static gen_helper_gvec_4_ptr * const fns[3] = {          \
+        gen_helper_##NAME##_b,                               \
+        gen_helper_##NAME##_h,                               \
+        gen_helper_##NAME##_w                                \
+    };                                                       \
+    return do_opivv_widen(s, a, fns[s->sew], CHECK);         \
+}
+
+GEN_OPIVV_WIDEN_TRANS(vwaddu_vv, opivv_widen_check)
+GEN_OPIVV_WIDEN_TRANS(vwadd_vv, opivv_widen_check)
+GEN_OPIVV_WIDEN_TRANS(vwsubu_vv, opivv_widen_check)
+GEN_OPIVV_WIDEN_TRANS(vwsub_vv, opivv_widen_check)
+
+/* OPIVX with WIDEN */
+static bool opivx_widen_check(DisasContext *s, arg_rmrr *a)
+{
+    return (vext_check_isa_ill(s) &&
+            vext_check_overlap_mask(s, a->rd, a->vm, true) &&
+            vext_check_reg(s, a->rd, true) &&
+            vext_check_reg(s, a->rs2, false) &&
+            vext_check_overlap_group(a->rd, 2 << s->lmul, a->rs2,
+                                     1 << s->lmul) &&
+            (s->lmul < 0x3) && (s->sew < 0x3));
+}
+
+static bool do_opivx_widen(DisasContext *s, arg_rmrr *a,
+                           gen_helper_opivx *fn)
+{
+    if (opivx_widen_check(s, a)) {
+        return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s);
+    }
+    return true;
+}
+
+#define GEN_OPIVX_WIDEN_TRANS(NAME) \
+static bool trans_##NAME(DisasContext *s, arg_rmrr *a)       \
+{                                                            \
+    static gen_helper_opivx * const fns[3] = {               \
+        gen_helper_##NAME##_b,                               \
+        gen_helper_##NAME##_h,                               \
+        gen_helper_##NAME##_w                                \
+    };                                                       \
+    return do_opivx_widen(s, a, fns[s->sew]);                \
+}
+
+GEN_OPIVX_WIDEN_TRANS(vwaddu_vx)
+GEN_OPIVX_WIDEN_TRANS(vwadd_vx)
+GEN_OPIVX_WIDEN_TRANS(vwsubu_vx)
+GEN_OPIVX_WIDEN_TRANS(vwsub_vx)
+
+/* WIDEN OPIVV with WIDEN */
+static bool opiwv_widen_check(DisasContext *s, arg_rmrr *a)
+{
+    return (vext_check_isa_ill(s) &&
+            vext_check_overlap_mask(s, a->rd, a->vm, true) &&
+            vext_check_reg(s, a->rd, true) &&
+            vext_check_reg(s, a->rs2, true) &&
+            vext_check_reg(s, a->rs1, false) &&
+            vext_check_overlap_group(a->rd, 2 << s->lmul, a->rs1,
+                                     1 << s->lmul) &&
+            (s->lmul < 0x3) && (s->sew < 0x3));
+}
+
+static bool do_opiwv_widen(DisasContext *s, arg_rmrr *a,
+                           gen_helper_gvec_4_ptr *fn)
+{
+    if (opiwv_widen_check(s, a)) {
+        uint32_t data = 0;
+        data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
+        data = FIELD_DP32(data, VDATA, VM, a->vm);
+        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
+        tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
+                           vreg_ofs(s, a->rs1),
+                           vreg_ofs(s, a->rs2),
+                           cpu_env, 0, s->vlen / 8, data, fn);
+        return true;
+    }
+    return false;
+}
+
+#define GEN_OPIWV_WIDEN_TRANS(NAME) \
+static bool trans_##NAME(DisasContext *s, arg_rmrr *a)       \
+{                                                            \
+    static gen_helper_gvec_4_ptr * const fns[3] = {          \
+        gen_helper_##NAME##_b,                               \
+        gen_helper_##NAME##_h,                               \
+        gen_helper_##NAME##_w                                \
+    };                                                       \
+    return do_opiwv_widen(s, a, fns[s->sew]);                \
+}
+
+GEN_OPIWV_WIDEN_TRANS(vwaddu_wv)
+GEN_OPIWV_WIDEN_TRANS(vwadd_wv)
+GEN_OPIWV_WIDEN_TRANS(vwsubu_wv)
+GEN_OPIWV_WIDEN_TRANS(vwsub_wv)
+
+/* WIDEN OPIVX with WIDEN */
+static bool opiwx_widen_check(DisasContext *s, arg_rmrr *a)
+{
+    return (vext_check_isa_ill(s) &&
+            vext_check_overlap_mask(s, a->rd, a->vm, true) &&
+            vext_check_reg(s, a->rd, true) &&
+            vext_check_reg(s, a->rs2, true) &&
+            (s->lmul < 0x3) && (s->sew < 0x3));
+}
+
+static bool do_opiwx_widen(DisasContext *s, arg_rmrr *a,
+                           gen_helper_opivx *fn)
+{
+    if (opiwx_widen_check(s, a)) {
+        return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s);
+    }
+    return false;
+}
+
+#define GEN_OPIWX_WIDEN_TRANS(NAME) \
+static bool trans_##NAME(DisasContext *s, arg_rmrr *a)       \
+{                                                            \
+    static gen_helper_opivx * const fns[3] = {               \
+        gen_helper_##NAME##_b,                               \
+        gen_helper_##NAME##_h,                               \
+        gen_helper_##NAME##_w                                \
+    };                                                       \
+    return do_opiwx_widen(s, a, fns[s->sew]);                \
+}
+
+GEN_OPIWX_WIDEN_TRANS(vwaddu_wx)
+GEN_OPIWX_WIDEN_TRANS(vwadd_wx)
+GEN_OPIWX_WIDEN_TRANS(vwsubu_wx)
+GEN_OPIWX_WIDEN_TRANS(vwsub_wx)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 27934e291b..d0e6f12f43 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -976,3 +976,114 @@ GEN_VEXT_VX(vrsub_vx_b, 1, 1, clearb)
 GEN_VEXT_VX(vrsub_vx_h, 2, 2, clearh)
 GEN_VEXT_VX(vrsub_vx_w, 4, 4, clearl)
 GEN_VEXT_VX(vrsub_vx_d, 8, 8, clearq)
+
+/* Vector Widening Integer Add/Subtract */
+#define WOP_UUU_B uint16_t, uint8_t, uint8_t, uint16_t, uint16_t
+#define WOP_UUU_H uint32_t, uint16_t, uint16_t, uint32_t, uint32_t
+#define WOP_UUU_W uint64_t, uint32_t, uint32_t, uint64_t, uint64_t
+#define WOP_SSS_B int16_t, int8_t, int8_t, int16_t, int16_t
+#define WOP_SSS_H int32_t, int16_t, int16_t, int32_t, int32_t
+#define WOP_SSS_W int64_t, int32_t, int32_t, int64_t, int64_t
+#define WOP_WUUU_B  uint16_t, uint8_t, uint16_t, uint16_t, uint16_t
+#define WOP_WUUU_H  uint32_t, uint16_t, uint32_t, uint32_t, uint32_t
+#define WOP_WUUU_W  uint64_t, uint32_t, uint64_t, uint64_t, uint64_t
+#define WOP_WSSS_B  int16_t, int8_t, int16_t, int16_t, int16_t
+#define WOP_WSSS_H  int32_t, int16_t, int32_t, int32_t, int32_t
+#define WOP_WSSS_W  int64_t, int32_t, int64_t, int64_t, int64_t
+RVVCALL(OPIVV2, vwaddu_vv_b, WOP_UUU_B, H2, H1, H1, DO_ADD)
+RVVCALL(OPIVV2, vwaddu_vv_h, WOP_UUU_H, H4, H2, H2, DO_ADD)
+RVVCALL(OPIVV2, vwaddu_vv_w, WOP_UUU_W, H8, H4, H4, DO_ADD)
+RVVCALL(OPIVV2, vwsubu_vv_b, WOP_UUU_B, H2, H1, H1, DO_SUB)
+RVVCALL(OPIVV2, vwsubu_vv_h, WOP_UUU_H, H4, H2, H2, DO_SUB)
+RVVCALL(OPIVV2, vwsubu_vv_w, WOP_UUU_W, H8, H4, H4, DO_SUB)
+RVVCALL(OPIVV2, vwadd_vv_b, WOP_SSS_B, H2, H1, H1, DO_ADD)
+RVVCALL(OPIVV2, vwadd_vv_h, WOP_SSS_H, H4, H2, H2, DO_ADD)
+RVVCALL(OPIVV2, vwadd_vv_w, WOP_SSS_W, H8, H4, H4, DO_ADD)
+RVVCALL(OPIVV2, vwsub_vv_b, WOP_SSS_B, H2, H1, H1, DO_SUB)
+RVVCALL(OPIVV2, vwsub_vv_h, WOP_SSS_H, H4, H2, H2, DO_SUB)
+RVVCALL(OPIVV2, vwsub_vv_w, WOP_SSS_W, H8, H4, H4, DO_SUB)
+RVVCALL(OPIVV2, vwaddu_wv_b, WOP_WUUU_B, H2, H1, H1, DO_ADD)
+RVVCALL(OPIVV2, vwaddu_wv_h, WOP_WUUU_H, H4, H2, H2, DO_ADD)
+RVVCALL(OPIVV2, vwaddu_wv_w, WOP_WUUU_W, H8, H4, H4, DO_ADD)
+RVVCALL(OPIVV2, vwsubu_wv_b, WOP_WUUU_B, H2, H1, H1, DO_SUB)
+RVVCALL(OPIVV2, vwsubu_wv_h, WOP_WUUU_H, H4, H2, H2, DO_SUB)
+RVVCALL(OPIVV2, vwsubu_wv_w, WOP_WUUU_W, H8, H4, H4, DO_SUB)
+RVVCALL(OPIVV2, vwadd_wv_b, WOP_WSSS_B, H2, H1, H1, DO_ADD)
+RVVCALL(OPIVV2, vwadd_wv_h, WOP_WSSS_H, H4, H2, H2, DO_ADD)
+RVVCALL(OPIVV2, vwadd_wv_w, WOP_WSSS_W, H8, H4, H4, DO_ADD)
+RVVCALL(OPIVV2, vwsub_wv_b, WOP_WSSS_B, H2, H1, H1, DO_SUB)
+RVVCALL(OPIVV2, vwsub_wv_h, WOP_WSSS_H, H4, H2, H2, DO_SUB)
+RVVCALL(OPIVV2, vwsub_wv_w, WOP_WSSS_W, H8, H4, H4, DO_SUB)
+GEN_VEXT_VV(vwaddu_vv_b, 1, 2, clearh)
+GEN_VEXT_VV(vwaddu_vv_h, 2, 4, clearl)
+GEN_VEXT_VV(vwaddu_vv_w, 4, 8, clearq)
+GEN_VEXT_VV(vwsubu_vv_b, 1, 2, clearh)
+GEN_VEXT_VV(vwsubu_vv_h, 2, 4, clearl)
+GEN_VEXT_VV(vwsubu_vv_w, 4, 8, clearq)
+GEN_VEXT_VV(vwadd_vv_b, 1, 2, clearh)
+GEN_VEXT_VV(vwadd_vv_h, 2, 4, clearl)
+GEN_VEXT_VV(vwadd_vv_w, 4, 8, clearq)
+GEN_VEXT_VV(vwsub_vv_b, 1, 2, clearh)
+GEN_VEXT_VV(vwsub_vv_h, 2, 4, clearl)
+GEN_VEXT_VV(vwsub_vv_w, 4, 8, clearq)
+GEN_VEXT_VV(vwaddu_wv_b, 1, 2, clearh)
+GEN_VEXT_VV(vwaddu_wv_h, 2, 4, clearl)
+GEN_VEXT_VV(vwaddu_wv_w, 4, 8, clearq)
+GEN_VEXT_VV(vwsubu_wv_b, 1, 2, clearh)
+GEN_VEXT_VV(vwsubu_wv_h, 2, 4, clearl)
+GEN_VEXT_VV(vwsubu_wv_w, 4, 8, clearq)
+GEN_VEXT_VV(vwadd_wv_b, 1, 2, clearh)
+GEN_VEXT_VV(vwadd_wv_h, 2, 4, clearl)
+GEN_VEXT_VV(vwadd_wv_w, 4, 8, clearq)
+GEN_VEXT_VV(vwsub_wv_b, 1, 2, clearh)
+GEN_VEXT_VV(vwsub_wv_h, 2, 4, clearl)
+GEN_VEXT_VV(vwsub_wv_w, 4, 8, clearq)
+
+RVVCALL(OPIVX2, vwaddu_vx_b, WOP_UUU_B, H2, H1, DO_ADD)
+RVVCALL(OPIVX2, vwaddu_vx_h, WOP_UUU_H, H4, H2, DO_ADD)
+RVVCALL(OPIVX2, vwaddu_vx_w, WOP_UUU_W, H8, H4, DO_ADD)
+RVVCALL(OPIVX2, vwsubu_vx_b, WOP_UUU_B, H2, H1, DO_SUB)
+RVVCALL(OPIVX2, vwsubu_vx_h, WOP_UUU_H, H4, H2, DO_SUB)
+RVVCALL(OPIVX2, vwsubu_vx_w, WOP_UUU_W, H8, H4, DO_SUB)
+RVVCALL(OPIVX2, vwadd_vx_b, WOP_SSS_B, H2, H1, DO_ADD)
+RVVCALL(OPIVX2, vwadd_vx_h, WOP_SSS_H, H4, H2, DO_ADD)
+RVVCALL(OPIVX2, vwadd_vx_w, WOP_SSS_W, H8, H4, DO_ADD)
+RVVCALL(OPIVX2, vwsub_vx_b, WOP_SSS_B, H2, H1, DO_SUB)
+RVVCALL(OPIVX2, vwsub_vx_h, WOP_SSS_H, H4, H2, DO_SUB)
+RVVCALL(OPIVX2, vwsub_vx_w, WOP_SSS_W, H8, H4, DO_SUB)
+RVVCALL(OPIVX2, vwaddu_wx_b, WOP_WUUU_B, H2, H1, DO_ADD)
+RVVCALL(OPIVX2, vwaddu_wx_h, WOP_WUUU_H, H4, H2, DO_ADD)
+RVVCALL(OPIVX2, vwaddu_wx_w, WOP_WUUU_W, H8, H4, DO_ADD)
+RVVCALL(OPIVX2, vwsubu_wx_b, WOP_WUUU_B, H2, H1, DO_SUB)
+RVVCALL(OPIVX2, vwsubu_wx_h, WOP_WUUU_H, H4, H2, DO_SUB)
+RVVCALL(OPIVX2, vwsubu_wx_w, WOP_WUUU_W, H8, H4, DO_SUB)
+RVVCALL(OPIVX2, vwadd_wx_b, WOP_WSSS_B, H2, H1, DO_ADD)
+RVVCALL(OPIVX2, vwadd_wx_h, WOP_WSSS_H, H4, H2, DO_ADD)
+RVVCALL(OPIVX2, vwadd_wx_w, WOP_WSSS_W, H8, H4, DO_ADD)
+RVVCALL(OPIVX2, vwsub_wx_b, WOP_WSSS_B, H2, H1, DO_SUB)
+RVVCALL(OPIVX2, vwsub_wx_h, WOP_WSSS_H, H4, H2, DO_SUB)
+RVVCALL(OPIVX2, vwsub_wx_w, WOP_WSSS_W, H8, H4, DO_SUB)
+GEN_VEXT_VX(vwaddu_vx_b, 1, 2, clearh)
+GEN_VEXT_VX(vwaddu_vx_h, 2, 4, clearl)
+GEN_VEXT_VX(vwaddu_vx_w, 4, 8, clearq)
+GEN_VEXT_VX(vwsubu_vx_b, 1, 2, clearh)
+GEN_VEXT_VX(vwsubu_vx_h, 2, 4, clearl)
+GEN_VEXT_VX(vwsubu_vx_w, 4, 8, clearq)
+GEN_VEXT_VX(vwadd_vx_b, 1, 2, clearh)
+GEN_VEXT_VX(vwadd_vx_h, 2, 4, clearl)
+GEN_VEXT_VX(vwadd_vx_w, 4, 8, clearq)
+GEN_VEXT_VX(vwsub_vx_b, 1, 2, clearh)
+GEN_VEXT_VX(vwsub_vx_h, 2, 4, clearl)
+GEN_VEXT_VX(vwsub_vx_w, 4, 8, clearq)
+GEN_VEXT_VX(vwaddu_wx_b, 1, 2, clearh)
+GEN_VEXT_VX(vwaddu_wx_h, 2, 4, clearl)
+GEN_VEXT_VX(vwaddu_wx_w, 4, 8, clearq)
+GEN_VEXT_VX(vwsubu_wx_b, 1, 2, clearh)
+GEN_VEXT_VX(vwsubu_wx_h, 2, 4, clearl)
+GEN_VEXT_VX(vwsubu_wx_w, 4, 8, clearq)
+GEN_VEXT_VX(vwadd_wx_b, 1, 2, clearh)
+GEN_VEXT_VX(vwadd_wx_h, 2, 4, clearl)
+GEN_VEXT_VX(vwadd_wx_w, 4, 8, clearq)
+GEN_VEXT_VX(vwsub_wx_b, 1, 2, clearh)
+GEN_VEXT_VX(vwsub_wx_h, 2, 4, clearl)
+GEN_VEXT_VX(vwsub_wx_w, 4, 8, clearq)
-- 
2.23.0


