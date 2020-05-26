Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BCD1DCBF1
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 13:13:47 +0200 (CEST)
Received: from localhost ([::1]:42690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbj90-0002PH-7K
	for lists+qemu-devel@lfdr.de; Thu, 21 May 2020 07:13:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jbj8I-0001nM-Or; Thu, 21 May 2020 07:13:02 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:56684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jbj8H-0003O6-8I; Thu, 21 May 2020 07:13:02 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07074887|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_regular_dialog|0.298853-0.00020417-0.700943;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03300; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=8; RT=8; SR=0; TI=SMTPD_---.Hbdcnx4_1590059574; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Hbdcnx4_1590059574)
 by smtp.aliyun-inc.com(10.147.42.198);
 Thu, 21 May 2020 19:12:55 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 44/62] target/riscv: widening floating-point/integer
 type-convert instructions
Date: Thu, 21 May 2020 17:43:55 +0800
Message-Id: <20200521094413.10425-45-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200521094413.10425-1-zhiwei_liu@c-sky.com>
References: <20200521094413.10425-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 05:19:14
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, UNPARSEABLE_RELAY=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 wenmeng_zhang@c-sky.com, alistair.francis@wdc.com, palmer@dabbelt.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h                   | 11 ++++++
 target/riscv/insn32.decode              |  5 +++
 target/riscv/insn_trans/trans_rvv.inc.c | 47 +++++++++++++++++++++++++
 target/riscv/vector_helper.c            | 42 ++++++++++++++++++++++
 4 files changed, 105 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 05f8fb5ffc..e59dcc5a7c 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1011,3 +1011,14 @@ DEF_HELPER_5(vfcvt_f_xu_v_d, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfcvt_f_x_v_h, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfcvt_f_x_v_w, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfcvt_f_x_v_d, void, ptr, ptr, ptr, env, i32)
+
+DEF_HELPER_5(vfwcvt_xu_f_v_h, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfwcvt_xu_f_v_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfwcvt_x_f_v_h, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfwcvt_x_f_v_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfwcvt_f_xu_v_h, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfwcvt_f_xu_v_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfwcvt_f_x_v_h, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfwcvt_f_x_v_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfwcvt_f_f_v_h, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfwcvt_f_f_v_w, void, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 53562c6663..e0efc63ec2 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -519,6 +519,11 @@ vfcvt_xu_f_v    100010 . ..... 00000 001 ..... 1010111 @r2_vm
 vfcvt_x_f_v     100010 . ..... 00001 001 ..... 1010111 @r2_vm
 vfcvt_f_xu_v    100010 . ..... 00010 001 ..... 1010111 @r2_vm
 vfcvt_f_x_v     100010 . ..... 00011 001 ..... 1010111 @r2_vm
+vfwcvt_xu_f_v   100010 . ..... 01000 001 ..... 1010111 @r2_vm
+vfwcvt_x_f_v    100010 . ..... 01001 001 ..... 1010111 @r2_vm
+vfwcvt_f_xu_v   100010 . ..... 01010 001 ..... 1010111 @r2_vm
+vfwcvt_f_x_v    100010 . ..... 01011 001 ..... 1010111 @r2_vm
+vfwcvt_f_f_v    100010 . ..... 01100 001 ..... 1010111 @r2_vm
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 6db460177d..44505027c1 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2221,3 +2221,50 @@ GEN_OPFV_TRANS(vfcvt_xu_f_v, opfv_check)
 GEN_OPFV_TRANS(vfcvt_x_f_v, opfv_check)
 GEN_OPFV_TRANS(vfcvt_f_xu_v, opfv_check)
 GEN_OPFV_TRANS(vfcvt_f_x_v, opfv_check)
+
+/* Widening Floating-Point/Integer Type-Convert Instructions */
+
+/*
+ * If the current SEW does not correspond to a supported IEEE floating-point
+ * type, an illegal instruction exception is raised
+ */
+static bool opfv_widen_check(DisasContext *s, arg_rmr *a)
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
+#define GEN_OPFV_WIDEN_TRANS(NAME)                                 \
+static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
+{                                                                  \
+    if (opfv_widen_check(s, a)) {                                  \
+        uint32_t data = 0;                                         \
+        static gen_helper_gvec_3_ptr * const fns[2] = {            \
+            gen_helper_##NAME##_h,                                 \
+            gen_helper_##NAME##_w,                                 \
+        };                                                         \
+        TCGLabel *over = gen_new_label();                          \
+        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
+                                                                   \
+        data = FIELD_DP32(data, VDATA, MLEN, s->mlen);             \
+        data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
+        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
+        tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
+                           vreg_ofs(s, a->rs2), cpu_env, 0,        \
+                           s->vlen / 8, data, fns[s->sew - 1]);    \
+        gen_set_label(over);                                       \
+        return true;                                               \
+    }                                                              \
+    return false;                                                  \
+}
+
+GEN_OPFV_WIDEN_TRANS(vfwcvt_xu_f_v)
+GEN_OPFV_WIDEN_TRANS(vfwcvt_x_f_v)
+GEN_OPFV_WIDEN_TRANS(vfwcvt_f_xu_v)
+GEN_OPFV_WIDEN_TRANS(vfwcvt_f_x_v)
+GEN_OPFV_WIDEN_TRANS(vfwcvt_f_f_v)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 34b21c8deb..ea6a5853f3 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4250,3 +4250,45 @@ RVVCALL(OPFVV1, vfcvt_f_x_v_d, OP_UU_D, H8, H8, int64_to_float64)
 GEN_VEXT_V_ENV(vfcvt_f_x_v_h, 2, 2, clearh)
 GEN_VEXT_V_ENV(vfcvt_f_x_v_w, 4, 4, clearl)
 GEN_VEXT_V_ENV(vfcvt_f_x_v_d, 8, 8, clearq)
+
+/* Widening Floating-Point/Integer Type-Convert Instructions */
+/* (TD, T2, TX2) */
+#define WOP_UU_H uint32_t, uint16_t, uint16_t
+#define WOP_UU_W uint64_t, uint32_t, uint32_t
+/* vfwcvt.xu.f.v vd, vs2, vm # Convert float to double-width unsigned integer.*/
+RVVCALL(OPFVV1, vfwcvt_xu_f_v_h, WOP_UU_H, H4, H2, float16_to_uint32)
+RVVCALL(OPFVV1, vfwcvt_xu_f_v_w, WOP_UU_W, H8, H4, float32_to_uint64)
+GEN_VEXT_V_ENV(vfwcvt_xu_f_v_h, 2, 4, clearl)
+GEN_VEXT_V_ENV(vfwcvt_xu_f_v_w, 4, 8, clearq)
+
+/* vfwcvt.x.f.v vd, vs2, vm # Convert float to double-width signed integer. */
+RVVCALL(OPFVV1, vfwcvt_x_f_v_h, WOP_UU_H, H4, H2, float16_to_int32)
+RVVCALL(OPFVV1, vfwcvt_x_f_v_w, WOP_UU_W, H8, H4, float32_to_int64)
+GEN_VEXT_V_ENV(vfwcvt_x_f_v_h, 2, 4, clearl)
+GEN_VEXT_V_ENV(vfwcvt_x_f_v_w, 4, 8, clearq)
+
+/* vfwcvt.f.xu.v vd, vs2, vm # Convert unsigned integer to double-width float */
+RVVCALL(OPFVV1, vfwcvt_f_xu_v_h, WOP_UU_H, H4, H2, uint16_to_float32)
+RVVCALL(OPFVV1, vfwcvt_f_xu_v_w, WOP_UU_W, H8, H4, uint32_to_float64)
+GEN_VEXT_V_ENV(vfwcvt_f_xu_v_h, 2, 4, clearl)
+GEN_VEXT_V_ENV(vfwcvt_f_xu_v_w, 4, 8, clearq)
+
+/* vfwcvt.f.x.v vd, vs2, vm # Convert integer to double-width float. */
+RVVCALL(OPFVV1, vfwcvt_f_x_v_h, WOP_UU_H, H4, H2, int16_to_float32)
+RVVCALL(OPFVV1, vfwcvt_f_x_v_w, WOP_UU_W, H8, H4, int32_to_float64)
+GEN_VEXT_V_ENV(vfwcvt_f_x_v_h, 2, 4, clearl)
+GEN_VEXT_V_ENV(vfwcvt_f_x_v_w, 4, 8, clearq)
+
+/*
+ * vfwcvt.f.f.v vd, vs2, vm #
+ * Convert single-width float to double-width float.
+ */
+static uint32_t vfwcvtffv16(uint16_t a, float_status *s)
+{
+    return float16_to_float32(a, true, s);
+}
+
+RVVCALL(OPFVV1, vfwcvt_f_f_v_h, WOP_UU_H, H4, H2, vfwcvtffv16)
+RVVCALL(OPFVV1, vfwcvt_f_f_v_w, WOP_UU_W, H8, H4, float32_to_float64)
+GEN_VEXT_V_ENV(vfwcvt_f_f_v_h, 2, 4, clearl)
+GEN_VEXT_V_ENV(vfwcvt_f_f_v_w, 4, 8, clearq)
-- 
2.23.0


