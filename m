Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF492068BA
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 01:57:47 +0200 (CEST)
Received: from localhost ([::1]:38496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnsnS-0004ef-Ax
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 19:57:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jnsmS-0004CJ-PD; Tue, 23 Jun 2020 19:56:44 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:47171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jnsmQ-0001ba-O4; Tue, 23 Jun 2020 19:56:44 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07608629|-1; BR=01201311R171ec; CH=green;
 DM=|OVERLOAD|false|; DS=SPAM|spam_ad|0.801865-0.000159662-0.197975;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03275; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=8; RT=8; SR=0; TI=SMTPD_---.HrTHgM4_1592956594; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HrTHgM4_1592956594)
 by smtp.aliyun-inc.com(10.147.43.230);
 Wed, 24 Jun 2020 07:56:35 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v11 58/61] target/riscv: vector slide instructions
Date: Wed, 24 Jun 2020 05:59:17 +0800
Message-Id: <20200623215920.2594-59-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200623215920.2594-1-zhiwei_liu@c-sky.com>
References: <20200623215920.2594-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/23 17:32:41
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
 wenmeng_zhang@c-sky.com, Alistair.Francis@wdc.com, palmer@dabbelt.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h                   |  17 ++++
 target/riscv/insn32.decode              |   6 ++
 target/riscv/insn_trans/trans_rvv.inc.c |  18 ++++
 target/riscv/vector_helper.c            | 114 ++++++++++++++++++++++++
 4 files changed, 155 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index c6695ea7a8..29a5eb7049 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1119,3 +1119,20 @@ DEF_HELPER_4(vid_v_b, void, ptr, ptr, env, i32)
 DEF_HELPER_4(vid_v_h, void, ptr, ptr, env, i32)
 DEF_HELPER_4(vid_v_w, void, ptr, ptr, env, i32)
 DEF_HELPER_4(vid_v_d, void, ptr, ptr, env, i32)
+
+DEF_HELPER_6(vslideup_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vslideup_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vslideup_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vslideup_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vslidedown_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vslidedown_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vslidedown_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vslidedown_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vslide1up_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vslide1up_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vslide1up_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vslide1up_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vslide1down_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vslide1down_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vslide1down_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vslide1down_vx_d, void, ptr, ptr, tl, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 17288a3c95..36123f71b9 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -568,6 +568,12 @@ vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
 vmv_s_x         001101 1 00000 ..... 110 ..... 1010111 @r2
 vfmv_f_s        001100 1 ..... 00000 001 ..... 1010111 @r2rd
 vfmv_s_f        001101 1 00000 ..... 101 ..... 1010111 @r2
+vslideup_vx     001110 . ..... ..... 100 ..... 1010111 @r_vm
+vslideup_vi     001110 . ..... ..... 011 ..... 1010111 @r_vm
+vslide1up_vx    001110 . ..... ..... 110 ..... 1010111 @r_vm
+vslidedown_vx   001111 . ..... ..... 100 ..... 1010111 @r_vm
+vslidedown_vi   001111 . ..... ..... 011 ..... 1010111 @r_vm
+vslide1down_vx  001111 . ..... ..... 110 ..... 1010111 @r_vm
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 7af16ce0a8..4ed6d1ee2e 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2758,3 +2758,21 @@ static bool trans_vfmv_s_f(DisasContext *s, arg_vfmv_s_f *a)
     }
     return false;
 }
+
+/* Vector Slide Instructions */
+static bool slideup_check(DisasContext *s, arg_rmrr *a)
+{
+    return (vext_check_isa_ill(s) &&
+            vext_check_overlap_mask(s, a->rd, a->vm, true) &&
+            vext_check_reg(s, a->rd, false) &&
+            vext_check_reg(s, a->rs2, false) &&
+            (a->rd != a->rs2));
+}
+
+GEN_OPIVX_TRANS(vslideup_vx, slideup_check)
+GEN_OPIVX_TRANS(vslide1up_vx, slideup_check)
+GEN_OPIVI_TRANS(vslideup_vi, 1, vslideup_vx, slideup_check)
+
+GEN_OPIVX_TRANS(vslidedown_vx, opivx_check)
+GEN_OPIVX_TRANS(vslide1down_vx, opivx_check)
+GEN_OPIVI_TRANS(vslidedown_vi, 1, vslidedown_vx, opivx_check)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index dc6a94cea7..a3d7cd5f90 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4697,3 +4697,117 @@ GEN_VEXT_VID_V(vid_v_b, uint8_t, H1, clearb)
 GEN_VEXT_VID_V(vid_v_h, uint16_t, H2, clearh)
 GEN_VEXT_VID_V(vid_v_w, uint32_t, H4, clearl)
 GEN_VEXT_VID_V(vid_v_d, uint64_t, H8, clearq)
+
+/*
+ *** Vector Permutation Instructions
+ */
+
+/* Vector Slide Instructions */
+#define GEN_VEXT_VSLIDEUP_VX(NAME, ETYPE, H, CLEAR_FN)                    \
+void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
+                  CPURISCVState *env, uint32_t desc)                      \
+{                                                                         \
+    uint32_t mlen = vext_mlen(desc);                                      \
+    uint32_t vlmax = env_archcpu(env)->cfg.vlen / mlen;                   \
+    uint32_t vm = vext_vm(desc);                                          \
+    uint32_t vl = env->vl;                                                \
+    target_ulong offset = s1, i;                                          \
+                                                                          \
+    for (i = offset; i < vl; i++) {                                       \
+        if (!vm && !vext_elem_mask(v0, mlen, i)) {                        \
+            continue;                                                     \
+        }                                                                 \
+        *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i - offset));          \
+    }                                                                     \
+    CLEAR_FN(vd, vl, vl * sizeof(ETYPE), vlmax * sizeof(ETYPE));          \
+}
+
+/* vslideup.vx vd, vs2, rs1, vm # vd[i+rs1] = vs2[i] */
+GEN_VEXT_VSLIDEUP_VX(vslideup_vx_b, uint8_t, H1, clearb)
+GEN_VEXT_VSLIDEUP_VX(vslideup_vx_h, uint16_t, H2, clearh)
+GEN_VEXT_VSLIDEUP_VX(vslideup_vx_w, uint32_t, H4, clearl)
+GEN_VEXT_VSLIDEUP_VX(vslideup_vx_d, uint64_t, H8, clearq)
+
+#define GEN_VEXT_VSLIDEDOWN_VX(NAME, ETYPE, H, CLEAR_FN)                  \
+void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
+                  CPURISCVState *env, uint32_t desc)                      \
+{                                                                         \
+    uint32_t mlen = vext_mlen(desc);                                      \
+    uint32_t vlmax = env_archcpu(env)->cfg.vlen / mlen;                   \
+    uint32_t vm = vext_vm(desc);                                          \
+    uint32_t vl = env->vl;                                                \
+    target_ulong offset = s1, i;                                          \
+                                                                          \
+    for (i = 0; i < vl; ++i) {                                            \
+        target_ulong j = i + offset;                                      \
+        if (!vm && !vext_elem_mask(v0, mlen, i)) {                        \
+            continue;                                                     \
+        }                                                                 \
+        *((ETYPE *)vd + H(i)) = j >= vlmax ? 0 : *((ETYPE *)vs2 + H(j));  \
+    }                                                                     \
+    CLEAR_FN(vd, vl, vl * sizeof(ETYPE), vlmax * sizeof(ETYPE));          \
+}
+
+/* vslidedown.vx vd, vs2, rs1, vm # vd[i] = vs2[i+rs1] */
+GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_b, uint8_t, H1, clearb)
+GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_h, uint16_t, H2, clearh)
+GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_w, uint32_t, H4, clearl)
+GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_d, uint64_t, H8, clearq)
+
+#define GEN_VEXT_VSLIDE1UP_VX(NAME, ETYPE, H, CLEAR_FN)                   \
+void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
+                  CPURISCVState *env, uint32_t desc)                      \
+{                                                                         \
+    uint32_t mlen = vext_mlen(desc);                                      \
+    uint32_t vlmax = env_archcpu(env)->cfg.vlen / mlen;                   \
+    uint32_t vm = vext_vm(desc);                                          \
+    uint32_t vl = env->vl;                                                \
+    uint32_t i;                                                           \
+                                                                          \
+    for (i = 0; i < vl; i++) {                                            \
+        if (!vm && !vext_elem_mask(v0, mlen, i)) {                        \
+            continue;                                                     \
+        }                                                                 \
+        if (i == 0) {                                                     \
+            *((ETYPE *)vd + H(i)) = s1;                                   \
+        } else {                                                          \
+            *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i - 1));           \
+        }                                                                 \
+    }                                                                     \
+    CLEAR_FN(vd, vl, vl * sizeof(ETYPE), vlmax * sizeof(ETYPE));          \
+}
+
+/* vslide1up.vx vd, vs2, rs1, vm # vd[0]=x[rs1], vd[i+1] = vs2[i] */
+GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_b, uint8_t, H1, clearb)
+GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_h, uint16_t, H2, clearh)
+GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_w, uint32_t, H4, clearl)
+GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_d, uint64_t, H8, clearq)
+
+#define GEN_VEXT_VSLIDE1DOWN_VX(NAME, ETYPE, H, CLEAR_FN)                 \
+void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
+                  CPURISCVState *env, uint32_t desc)                      \
+{                                                                         \
+    uint32_t mlen = vext_mlen(desc);                                      \
+    uint32_t vlmax = env_archcpu(env)->cfg.vlen / mlen;                   \
+    uint32_t vm = vext_vm(desc);                                          \
+    uint32_t vl = env->vl;                                                \
+    uint32_t i;                                                           \
+                                                                          \
+    for (i = 0; i < vl; i++) {                                            \
+        if (!vm && !vext_elem_mask(v0, mlen, i)) {                        \
+            continue;                                                     \
+        }                                                                 \
+        if (i == vl - 1) {                                                \
+            *((ETYPE *)vd + H(i)) = s1;                                   \
+        } else {                                                          \
+            *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i + 1));           \
+        }                                                                 \
+    }                                                                     \
+    CLEAR_FN(vd, vl, vl * sizeof(ETYPE), vlmax * sizeof(ETYPE));          \
+}
+
+/* vslide1down.vx vd, vs2, rs1, vm # vd[i] = vs2[i+1], vd[vl-1]=x[rs1] */
+GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_b, uint8_t, H1, clearb)
+GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_h, uint16_t, H2, clearh)
+GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_w, uint32_t, H4, clearl)
+GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_d, uint64_t, H8, clearq)
-- 
2.23.0


