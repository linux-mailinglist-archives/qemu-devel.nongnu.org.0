Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBE0183561
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Mar 2020 16:49:04 +0100 (CET)
Received: from localhost ([::1]:43750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCQ51-0003uq-Bw
	for lists+qemu-devel@lfdr.de; Thu, 12 Mar 2020 11:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49715)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jCQ02-00041N-1L
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 11:43:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jCQ00-0000bo-AZ
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 11:43:53 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:37691)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jCPzz-0008SX-7B; Thu, 12 Mar 2020 11:43:52 -0400
X-Alimail-AntiSpam: AC=PASS; BC=0.08221576|-1; BR=01201311R121ee; CH=green;
 DM=||false|; DS=SPAM|spam_ad|0.858603-0.00040499-0.140992;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03291; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=10; RT=10; SR=0; TI=SMTPD_---.H-Od4Ik_1584027814; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.H-Od4Ik_1584027814)
 by smtp.aliyun-inc.com(10.147.42.241);
 Thu, 12 Mar 2020 23:43:35 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: richard.henderson@linaro.org, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Subject: [PATCH v5 22/60] target/riscv: vector integer merge and move
 instructions
Date: Thu, 12 Mar 2020 22:58:22 +0800
Message-Id: <20200312145900.2054-23-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
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
 target/riscv/helper.h                   |  9 ++++
 target/riscv/insn32.decode              |  3 ++
 target/riscv/insn_trans/trans_rvv.inc.c | 24 ++++++++++
 target/riscv/vector_helper.c            | 58 +++++++++++++++++++++++++
 4 files changed, 94 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 1f0d3d60e3..121e9e57e7 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -665,3 +665,12 @@ DEF_HELPER_6(vwmaccsu_vx_w, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vwmaccus_vx_b, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vwmaccus_vx_h, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vwmaccus_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+
+DEF_HELPER_6(vmerge_vvm_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmerge_vvm_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmerge_vvm_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmerge_vvm_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmerge_vxm_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmerge_vxm_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmerge_vxm_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmerge_vxm_d, void, ptr, ptr, tl, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 2a5b945139..bcb8273bcc 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -399,6 +399,9 @@ vwmacc_vx       111101 . ..... ..... 110 ..... 1010111 @r_vm
 vwmaccsu_vv     111110 . ..... ..... 010 ..... 1010111 @r_vm
 vwmaccsu_vx     111110 . ..... ..... 110 ..... 1010111 @r_vm
 vwmaccus_vx     111111 . ..... ..... 110 ..... 1010111 @r_vm
+vmerge_vvm      010111 . ..... ..... 000 ..... 1010111 @r_vm
+vmerge_vxm      010111 . ..... ..... 100 ..... 1010111 @r_vm
+vmerge_vim      010111 . ..... ..... 011 ..... 1010111 @r_vm
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 958737d097..aff5ca8663 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -1481,3 +1481,27 @@ GEN_OPIVX_WIDEN_TRANS(vwmaccu_vx)
 GEN_OPIVX_WIDEN_TRANS(vwmacc_vx)
 GEN_OPIVX_WIDEN_TRANS(vwmaccsu_vx)
 GEN_OPIVX_WIDEN_TRANS(vwmaccus_vx)
+
+/* Vector Integer Merge and Move Instructions */
+static bool opivv_vmerge_check(DisasContext *s, arg_rmrr *a)
+{
+    return (vext_check_isa_ill(s, RVV) &&
+            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
+            vext_check_reg(s, a->rd, false) &&
+            vext_check_reg(s, a->rs2, false) &&
+            vext_check_reg(s, a->rs1, false) &&
+            ((a->vm == 0) || (a->rs2 == 0)));
+}
+GEN_OPIVV_TRANS(vmerge_vvm, opivv_vmerge_check)
+
+static bool opivx_vmerge_check(DisasContext *s, arg_rmrr *a)
+{
+    return (vext_check_isa_ill(s, RVV) &&
+            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
+            vext_check_reg(s, a->rd, false) &&
+            vext_check_reg(s, a->rs2, false) &&
+            ((a->vm == 0) || (a->rs2 == 0)));
+}
+GEN_OPIVX_TRANS(vmerge_vxm, opivx_vmerge_check)
+
+GEN_OPIVI_TRANS(vmerge_vim, 0, vmerge_vxm, opivx_vmerge_check)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 5109654f9f..273b705847 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -1955,3 +1955,61 @@ GEN_VEXT_VX(vwmaccsu_vx_w, 4, 8, clearq)
 GEN_VEXT_VX(vwmaccus_vx_b, 1, 2, clearh)
 GEN_VEXT_VX(vwmaccus_vx_h, 2, 4, clearl)
 GEN_VEXT_VX(vwmaccus_vx_w, 4, 8, clearq)
+
+/* Vector Integer Merge and Move Instructions */
+#define GEN_VEXT_VMERGE_VV(NAME, ETYPE, H, CLEAR_FN)                 \
+void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,          \
+        CPURISCVState *env, uint32_t desc)                           \
+{                                                                    \
+    uint32_t mlen = vext_mlen(desc);                                 \
+    uint32_t vm = vext_vm(desc);                                     \
+    uint32_t vl = env->vl;                                           \
+    uint32_t esz = sizeof(ETYPE);                                    \
+    uint32_t vlmax = vext_maxsz(desc) / esz;                         \
+    uint32_t i;                                                      \
+                                                                     \
+    for (i = 0; i < vl; i++) {                                       \
+        if (!vm && !vext_elem_mask(v0, mlen, i)) {                   \
+            ETYPE s2 = *((ETYPE *)vs2 + H(i));                       \
+            *((ETYPE *)vd + H1(i)) = s2;                             \
+        } else {                                                     \
+            ETYPE s1 = *((ETYPE *)vs1 + H(i));                       \
+            *((ETYPE *)vd + H(i)) = s1;                              \
+        }                                                            \
+    }                                                                \
+    if (i != 0) {                                                    \
+        CLEAR_FN(vd, vl, vl * esz, vlmax * esz);                     \
+    }                                                                \
+}
+GEN_VEXT_VMERGE_VV(vmerge_vvm_b, int8_t,  H1, clearb)
+GEN_VEXT_VMERGE_VV(vmerge_vvm_h, int16_t, H2, clearh)
+GEN_VEXT_VMERGE_VV(vmerge_vvm_w, int32_t, H4, clearl)
+GEN_VEXT_VMERGE_VV(vmerge_vvm_d, int64_t, H8, clearq)
+
+#define GEN_VEXT_VMERGE_VX(NAME, ETYPE, H, CLEAR_FN)                 \
+void HELPER(NAME)(void *vd, void *v0, target_ulong s1,               \
+        void *vs2, CPURISCVState *env, uint32_t desc)                \
+{                                                                    \
+    uint32_t mlen = vext_mlen(desc);                                 \
+    uint32_t vm = vext_vm(desc);                                     \
+    uint32_t vl = env->vl;                                           \
+    uint32_t esz = sizeof(ETYPE);                                    \
+    uint32_t vlmax = vext_maxsz(desc) / esz;                         \
+    uint32_t i;                                                      \
+                                                                     \
+    for (i = 0; i < vl; i++) {                                       \
+        if (!vm && !vext_elem_mask(v0, mlen, i)) {                   \
+            ETYPE s2 = *((ETYPE *)vs2 + H(i));                       \
+            *((ETYPE *)vd + H1(i)) = s2;                             \
+        } else {                                                     \
+            *((ETYPE *)vd + H(i)) = (ETYPE)(target_long)s1;          \
+        }                                                            \
+    }                                                                \
+    if (i != 0) {                                                    \
+        CLEAR_FN(vd, vl, vl * esz, vlmax * esz);                     \
+    }                                                                \
+}
+GEN_VEXT_VMERGE_VX(vmerge_vxm_b, int8_t,  H1, clearb)
+GEN_VEXT_VMERGE_VX(vmerge_vxm_h, int16_t, H2, clearh)
+GEN_VEXT_VMERGE_VX(vmerge_vxm_w, int32_t, H4, clearl)
+GEN_VEXT_VMERGE_VX(vmerge_vxm_d, int64_t, H8, clearq)
-- 
2.23.0


