Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A25E717E035
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Mar 2020 13:26:59 +0100 (CET)
Received: from localhost ([::1]:42202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBHUo-00025X-LY
	for lists+qemu-devel@lfdr.de; Mon, 09 Mar 2020 08:26:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56525)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jBHJw-0002J6-47
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 08:15:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jBHJu-00033U-80
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 08:15:43 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:51820)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jBHJt-0002bw-G2; Mon, 09 Mar 2020 08:15:42 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07608497|-1; CH=blue; DM=||false|;
 DS=CONTINUE|ham_system_inform|0.723719-8.98328e-05-0.276191;
 FP=1071848094154949738|1|1|7|0|-1|-1|-1; HT=e02c03268; MF=zhiwei_liu@c-sky.com;
 NM=1; PH=DS; RN=10; RT=10; SR=0; TI=SMTPD_---.GyaeXy8_1583756101; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.GyaeXy8_1583756101)
 by smtp.aliyun-inc.com(10.147.41.199);
 Mon, 09 Mar 2020 20:15:09 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: richard.henderson@linaro.org, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Subject: [PATCH v3 14/60] target/riscv: vector narrowing integer right shift
 instructions
Date: Mon,  9 Mar 2020 20:14:11 +0800
Message-Id: <20200309121457.13719-15-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200309121457.13719-1-zhiwei_liu@c-sky.com>
References: <20200309121457.13719-1-zhiwei_liu@c-sky.com>
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
---
 target/riscv/helper.h                   | 13 ++++
 target/riscv/insn32.decode              |  6 ++
 target/riscv/insn_trans/trans_rvv.inc.c | 91 +++++++++++++++++++++++++
 target/riscv/vector_helper.c            | 14 ++++
 4 files changed, 124 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 47284c7476..0f36a8ce43 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -422,3 +422,16 @@ DEF_HELPER_6(vsra_vx_b, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vsra_vx_h, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vsra_vx_w, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vsra_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+
+DEF_HELPER_6(vnsrl_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnsrl_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnsrl_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnsra_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnsra_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnsra_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vnsrl_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnsrl_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnsrl_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnsra_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnsra_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vnsra_vx_w, void, ptr, ptr, tl, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index dbbfa34b97..e21b3d6b5e 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -328,6 +328,12 @@ vsrl_vi         101000 . ..... ..... 011 ..... 1010111 @r_vm
 vsra_vv         101001 . ..... ..... 000 ..... 1010111 @r_vm
 vsra_vx         101001 . ..... ..... 100 ..... 1010111 @r_vm
 vsra_vi         101001 . ..... ..... 011 ..... 1010111 @r_vm
+vnsrl_vv        101100 . ..... ..... 000 ..... 1010111 @r_vm
+vnsrl_vx        101100 . ..... ..... 100 ..... 1010111 @r_vm
+vnsrl_vi        101100 . ..... ..... 011 ..... 1010111 @r_vm
+vnsra_vv        101101 . ..... ..... 000 ..... 1010111 @r_vm
+vnsra_vx        101101 . ..... ..... 100 ..... 1010111 @r_vm
+vnsra_vi        101101 . ..... ..... 011 ..... 1010111 @r_vm
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index a60518e1df..7033eeaa4d 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -1267,3 +1267,94 @@ GEN_OPIVX_GVEC_SHIFT_TRANS(vsra_vx,  sars)
 GEN_OPIVI_GVEC_TRANS(vsll_vi, 1, vsll_vx,  shli)
 GEN_OPIVI_GVEC_TRANS(vsrl_vi, 1, vsrl_vx,  shri)
 GEN_OPIVI_GVEC_TRANS(vsra_vi, 1, vsra_vx,  sari)
+
+/* Vector Narrowing Integer Right Shift Instructions */
+static bool opivv_narrow_check(DisasContext *s, arg_rmrr *a)
+{
+    return (vext_check_isa_ill(s, RVV) &&
+            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
+            vext_check_reg(s, a->rd, false) &&
+            vext_check_reg(s, a->rs2, true) &&
+            vext_check_reg(s, a->rs1, false) &&
+            vext_check_overlap_group(a->rd, 1 << s->lmul, a->rs2,
+                2 << s->lmul) &&
+            (s->lmul < 0x3) && (s->sew < 0x3));
+}
+
+/* OPIVV with NARROW */
+#define GEN_OPIVV_NARROW_TRANS(NAME)                               \
+static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
+{                                                                  \
+    if (opivv_narrow_check(s, a)) {                                \
+        uint32_t data = 0;                                         \
+        static gen_helper_gvec_4_ptr * const fns[3] = {            \
+            gen_helper_##NAME##_b,                                 \
+            gen_helper_##NAME##_h,                                 \
+            gen_helper_##NAME##_w,                                 \
+        };                                                         \
+        data = FIELD_DP32(data, VDATA, MLEN, s->mlen);             \
+        data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
+        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
+        tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
+            vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),              \
+            cpu_env, 0, s->vlen / 8, data, fns[s->sew]);           \
+        return true;                                               \
+    }                                                              \
+    return false;                                                  \
+}
+GEN_OPIVV_NARROW_TRANS(vnsra_vv)
+GEN_OPIVV_NARROW_TRANS(vnsrl_vv)
+
+static bool opivx_narrow_check(DisasContext *s, arg_rmrr *a)
+{
+    return (vext_check_isa_ill(s, RVV) &&
+            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
+            vext_check_reg(s, a->rd, false) &&
+            vext_check_reg(s, a->rs2, true) &&
+            vext_check_overlap_group(a->rd, 1 << s->lmul, a->rs2,
+                2 << s->lmul) &&
+            (s->lmul < 0x3) && (s->sew < 0x3));
+}
+
+/* OPIVX with NARROW */
+#define GEN_OPIVX_NARROW_TRANS(NAME)                                     \
+static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                   \
+{                                                                        \
+    if (opivx_narrow_check(s, a)) {                                      \
+        uint32_t data = 0;                                               \
+        static gen_helper_opivx const fns[3] = {                         \
+            gen_helper_##NAME##_b,                                       \
+            gen_helper_##NAME##_h,                                       \
+            gen_helper_##NAME##_w,                                       \
+        };                                                               \
+        data = FIELD_DP32(data, VDATA, MLEN, s->mlen);                   \
+        data = FIELD_DP32(data, VDATA, VM, a->vm);                       \
+        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);                   \
+        return opivx_trans(a->rd, a->rs1, a->rs2, data, fns[s->sew], s); \
+    }                                                                    \
+    return false;                                                        \
+}
+GEN_OPIVX_NARROW_TRANS(vnsra_vx)
+GEN_OPIVX_NARROW_TRANS(vnsrl_vx)
+
+/* OPIVI with NARROW */
+#define GEN_OPIVI_NARROW_TRANS(NAME, ZX, OPIVX)                          \
+static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                   \
+{                                                                        \
+    if (opivx_narrow_check(s, a)) {                                      \
+        uint32_t data = 0;                                               \
+        static gen_helper_opivx const fns[3] = {                         \
+            gen_helper_##OPIVX##_b,                                      \
+            gen_helper_##OPIVX##_h,                                      \
+            gen_helper_##OPIVX##_w,                                      \
+        };                                                               \
+        data = FIELD_DP32(data, VDATA, MLEN, s->mlen);                   \
+        data = FIELD_DP32(data, VDATA, VM, a->vm);                       \
+        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);                   \
+        return opivi_trans(a->rd, a->rs1, a->rs2, data,                  \
+                fns[s->sew], s, ZX);                                     \
+    }                                                                    \
+    return false;                                                        \
+}
+GEN_OPIVI_NARROW_TRANS(vnsra_vi, 1, vnsra_vx)
+GEN_OPIVI_NARROW_TRANS(vnsrl_vi, 1, vnsrl_vx)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 3772b059b1..895155576c 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -1335,3 +1335,17 @@ GEN_VEXT_SHIFT_VX(vsra_vx_b, int8_t, int8_t, H1, H1, DO_SRL, 0x7, clearb)
 GEN_VEXT_SHIFT_VX(vsra_vx_h, int16_t, int16_t, H2, H2, DO_SRL, 0xf, clearh)
 GEN_VEXT_SHIFT_VX(vsra_vx_w, int32_t, int32_t, H4, H4, DO_SRL, 0x1f, clearl)
 GEN_VEXT_SHIFT_VX(vsra_vx_d, int64_t, int64_t, H8, H8, DO_SRL, 0x3f, clearq)
+
+/* Vector Narrowing Integer Right Shift Instructions */
+GEN_VEXT_SHIFT_VV(vnsrl_vv_b, uint8_t,  uint16_t, H1, H2, DO_SRL, 0xf, clearb)
+GEN_VEXT_SHIFT_VV(vnsrl_vv_h, uint16_t, uint32_t, H2, H4, DO_SRL, 0x1f, clearh)
+GEN_VEXT_SHIFT_VV(vnsrl_vv_w, uint32_t, uint64_t, H4, H8, DO_SRL, 0x3f, clearl)
+GEN_VEXT_SHIFT_VV(vnsra_vv_b, uint8_t,  int16_t, H1, H2, DO_SRL, 0xf, clearb)
+GEN_VEXT_SHIFT_VV(vnsra_vv_h, uint16_t, int32_t, H2, H4, DO_SRL, 0x1f, clearh)
+GEN_VEXT_SHIFT_VV(vnsra_vv_w, uint32_t, int64_t, H4, H8, DO_SRL, 0x3f, clearl)
+GEN_VEXT_SHIFT_VX(vnsrl_vx_b, uint8_t, uint16_t, H1, H2, DO_SRL, 0xf, clearb)
+GEN_VEXT_SHIFT_VX(vnsrl_vx_h, uint16_t, uint32_t, H2, H4, DO_SRL, 0x1f, clearh)
+GEN_VEXT_SHIFT_VX(vnsrl_vx_w, uint32_t, uint64_t, H4, H8, DO_SRL, 0x3f, clearl)
+GEN_VEXT_SHIFT_VX(vnsra_vx_b, int8_t, int16_t, H1, H2, DO_SRL, 0xf, clearb)
+GEN_VEXT_SHIFT_VX(vnsra_vx_h, int16_t, int32_t, H2, H4, DO_SRL, 0x1f, clearh)
+GEN_VEXT_SHIFT_VX(vnsra_vx_w, int32_t, int64_t, H4, H8, DO_SRL, 0x3f, clearl)
-- 
2.23.0


