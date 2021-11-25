Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FF745D612
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 09:20:54 +0100 (CET)
Received: from localhost ([::1]:37464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mq9zx-0004Xk-M9
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 03:20:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mq9Xb-0003Je-UE; Thu, 25 Nov 2021 02:51:36 -0500
Received: from out28-172.mail.aliyun.com ([115.124.28.172]:46201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mq9XU-00063x-QO; Thu, 25 Nov 2021 02:51:35 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07609297|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.411451-0.000991827-0.587557;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047202; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.LyzuCJ9_1637826673; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LyzuCJ9_1637826673)
 by smtp.aliyun-inc.com(10.147.42.135);
 Thu, 25 Nov 2021 15:51:13 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v5 21/22] target/riscv: Adjust scalar reg in vector with XLEN
Date: Thu, 25 Nov 2021 15:39:50 +0800
Message-Id: <20211125073951.57678-22-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211125073951.57678-1-zhiwei_liu@c-sky.com>
References: <20211125073951.57678-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.172; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-172.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Alistair.Francis@wdc.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, palmer@dabbelt.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When sew <= 32bits, not need to extend scalar reg.
When sew > 32bits, if xlen is less that sew, we should sign extend
the scalar register, except explicitly specified by the spec.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 44 ++++++++++++++++++-------
 1 file changed, 32 insertions(+), 12 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index aacb97d280..411b5414b2 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -833,7 +833,7 @@ typedef void gen_helper_opivx(TCGv_ptr, TCGv_ptr, TCGv, TCGv_ptr,
                               TCGv_env, TCGv_i32);
 
 static bool opivx_trans(uint32_t vd, uint32_t rs1, uint32_t vs2, uint32_t vm,
-                        gen_helper_opivx *fn, DisasContext *s)
+                        gen_helper_opivx *fn, DisasContext *s, DisasExtend ext)
 {
     TCGv_ptr dest, src2, mask;
     TCGv src1;
@@ -846,7 +846,7 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, uint32_t vs2, uint32_t vm,
     dest = tcg_temp_new_ptr();
     mask = tcg_temp_new_ptr();
     src2 = tcg_temp_new_ptr();
-    src1 = get_gpr(s, rs1, EXT_NONE);
+    src1 = get_gpr(s, rs1, ext);
 
     data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
     data = FIELD_DP32(data, VDATA, VM, vm);
@@ -895,7 +895,7 @@ do_opivx_gvec(DisasContext *s, arg_rmrr *a, GVecGen2sFn *gvec_fn,
         tcg_temp_free_i64(src1);
         return true;
     }
-    return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s);
+    return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s, EXT_SIGN);
 }
 
 /* OPIVX with GVEC IR */
@@ -1128,7 +1128,7 @@ static bool do_opivx_widen(DisasContext *s, arg_rmrr *a,
                            gen_helper_opivx *fn)
 {
     if (opivx_widen_check(s, a)) {
-        return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s);
+        return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s, EXT_SIGN);
     }
     return false;
 }
@@ -1213,7 +1213,7 @@ static bool do_opiwx_widen(DisasContext *s, arg_rmrr *a,
                            gen_helper_opivx *fn)
 {
     if (opiwx_widen_check(s, a)) {
-        return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s);
+        return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s, EXT_SIGN);
     }
     return false;
 }
@@ -1312,7 +1312,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                   \
             gen_helper_##NAME##_w, gen_helper_##NAME##_d,                \
         };                                                               \
                                                                          \
-        return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fns[s->sew], s);\
+        return opivx_trans(a->rd, a->rs1, a->rs2, a->vm,                 \
+                           fns[s->sew], s, EXT_SIGN);                    \
     }                                                                    \
     return false;                                                        \
 }
@@ -1386,7 +1387,7 @@ do_opivx_gvec_shift(DisasContext *s, arg_rmrr *a, GVecGen2sFn32 *gvec_fn,
         tcg_temp_free_i32(src1);
         return true;
     }
-    return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s);
+    return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s, EXT_SIGN);
 }
 
 #define GEN_OPIVX_GVEC_SHIFT_TRANS(NAME, SUF) \
@@ -1472,7 +1473,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                   \
             gen_helper_##NAME##_h,                                       \
             gen_helper_##NAME##_w,                                       \
         };                                                               \
-        return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fns[s->sew], s);\
+        return opivx_trans(a->rd, a->rs1, a->rs2, a->vm,                 \
+                           fns[s->sew], s, EXT_SIGN);                    \
     }                                                                    \
     return false;                                                        \
 }
@@ -2670,6 +2672,7 @@ static bool trans_vmv_s_x(DisasContext *s, arg_vmv_s_x *a)
         /* This instruction ignores LMUL and vector register groups */
         int maxsz = s->vlen >> 3;
         TCGv_i64 t1;
+        TCGv src1 = get_gpr(s, a->rs1, EXT_ZERO);
         TCGLabel *over = gen_new_label();
 
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
@@ -2679,7 +2682,7 @@ static bool trans_vmv_s_x(DisasContext *s, arg_vmv_s_x *a)
         }
 
         t1 = tcg_temp_new_i64();
-        tcg_gen_extu_tl_i64(t1, cpu_gpr[a->rs1]);
+        tcg_gen_extu_tl_i64(t1, src1);
         vec_element_storei(s, a->rd, 0, t1);
         tcg_temp_free_i64(t1);
     done:
@@ -2748,12 +2751,28 @@ static bool slideup_check(DisasContext *s, arg_rmrr *a)
             (a->rd != a->rs2));
 }
 
+/* OPIVXU without GVEC IR */
+#define GEN_OPIVXU_TRANS(NAME, CHECK)                                    \
+static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                   \
+{                                                                        \
+    if (CHECK(s, a)) {                                                   \
+        static gen_helper_opivx * const fns[4] = {                       \
+            gen_helper_##NAME##_b, gen_helper_##NAME##_h,                \
+            gen_helper_##NAME##_w, gen_helper_##NAME##_d,                \
+        };                                                               \
+                                                                         \
+        return opivx_trans(a->rd, a->rs1, a->rs2, a->vm,                 \
+                           fns[s->sew], s, EXT_ZERO);                    \
+    }                                                                    \
+    return false;                                                        \
+}
+
 GEN_OPIVX_TRANS(vslideup_vx, slideup_check)
-GEN_OPIVX_TRANS(vslide1up_vx, slideup_check)
+GEN_OPIVXU_TRANS(vslide1up_vx, slideup_check)
 GEN_OPIVI_TRANS(vslideup_vi, 1, vslideup_vx, slideup_check)
 
 GEN_OPIVX_TRANS(vslidedown_vx, opivx_check)
-GEN_OPIVX_TRANS(vslide1down_vx, opivx_check)
+GEN_OPIVXU_TRANS(vslide1down_vx, opivx_check)
 GEN_OPIVI_TRANS(vslidedown_vi, 1, vslidedown_vx, opivx_check)
 
 /* Vector Register Gather Instruction */
@@ -2803,7 +2822,8 @@ static bool trans_vrgather_vx(DisasContext *s, arg_rmrr *a)
             gen_helper_vrgather_vx_b, gen_helper_vrgather_vx_h,
             gen_helper_vrgather_vx_w, gen_helper_vrgather_vx_d
         };
-        return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fns[s->sew], s);
+        return opivx_trans(a->rd, a->rs1, a->rs2, a->vm,
+                           fns[s->sew], s, EXT_SIGN);
     }
     return true;
 }
-- 
2.25.1


