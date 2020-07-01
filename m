Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B51211075
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jul 2020 18:19:20 +0200 (CEST)
Received: from localhost ([::1]:60900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqfSB-0008Pz-AD
	for lists+qemu-devel@lfdr.de; Wed, 01 Jul 2020 12:19:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jqfNi-0002t1-FK; Wed, 01 Jul 2020 12:14:42 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:47436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jqfNd-0006eW-Hz; Wed, 01 Jul 2020 12:14:42 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436282|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0435712-0.000606192-0.955823;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03299; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=9; RT=8; SR=0; TI=SMTPD_---.Hvvuxzq_1593620067; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Hvvuxzq_1593620067)
 by smtp.aliyun-inc.com(10.147.40.44); Thu, 02 Jul 2020 00:14:28 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v12 24/61] target/riscv: vector single-width saturating add
 and subtract
Date: Wed,  1 Jul 2020 23:25:12 +0800
Message-Id: <20200701152549.1218-25-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200701152549.1218-1-zhiwei_liu@c-sky.com>
References: <20200701152549.1218-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/01 11:22:02
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
 target/riscv/helper.h                   |  33 ++
 target/riscv/insn32.decode              |  10 +
 target/riscv/insn_trans/trans_rvv.inc.c |  16 +
 target/riscv/vector_helper.c            | 385 ++++++++++++++++++++++++
 4 files changed, 444 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 9851086730..85bd4b91bc 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -692,3 +692,36 @@ DEF_HELPER_4(vmv_v_x_b, void, ptr, i64, env, i32)
 DEF_HELPER_4(vmv_v_x_h, void, ptr, i64, env, i32)
 DEF_HELPER_4(vmv_v_x_w, void, ptr, i64, env, i32)
 DEF_HELPER_4(vmv_v_x_d, void, ptr, i64, env, i32)
+
+DEF_HELPER_6(vsaddu_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vsaddu_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vsaddu_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vsaddu_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vsadd_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vsadd_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vsadd_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vsadd_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vssubu_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vssubu_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vssubu_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vssubu_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vssub_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vssub_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vssub_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vssub_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vsaddu_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vsaddu_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vsaddu_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vsaddu_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vsadd_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vsadd_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vsadd_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vsadd_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vssubu_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vssubu_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vssubu_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vssubu_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vssub_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vssub_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vssub_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vssub_vx_d, void, ptr, ptr, tl, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 238aa014d1..70df42de9a 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -409,6 +409,16 @@ vmv_v_i         010111 1 00000 ..... 011 ..... 1010111 @r2
 vmerge_vvm      010111 0 ..... ..... 000 ..... 1010111 @r_vm_0
 vmerge_vxm      010111 0 ..... ..... 100 ..... 1010111 @r_vm_0
 vmerge_vim      010111 0 ..... ..... 011 ..... 1010111 @r_vm_0
+vsaddu_vv       100000 . ..... ..... 000 ..... 1010111 @r_vm
+vsaddu_vx       100000 . ..... ..... 100 ..... 1010111 @r_vm
+vsaddu_vi       100000 . ..... ..... 011 ..... 1010111 @r_vm
+vsadd_vv        100001 . ..... ..... 000 ..... 1010111 @r_vm
+vsadd_vx        100001 . ..... ..... 100 ..... 1010111 @r_vm
+vsadd_vi        100001 . ..... ..... 011 ..... 1010111 @r_vm
+vssubu_vv       100010 . ..... ..... 000 ..... 1010111 @r_vm
+vssubu_vx       100010 . ..... ..... 100 ..... 1010111 @r_vm
+vssub_vv        100011 . ..... ..... 000 ..... 1010111 @r_vm
+vssub_vx        100011 . ..... ..... 100 ..... 1010111 @r_vm
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index f9532ebc71..a2ab14ade0 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -1731,3 +1731,19 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_v_i *a)
 GEN_OPIVV_TRANS(vmerge_vvm, opivv_vadc_check)
 GEN_OPIVX_TRANS(vmerge_vxm, opivx_vadc_check)
 GEN_OPIVI_TRANS(vmerge_vim, 0, vmerge_vxm, opivx_vadc_check)
+
+/*
+ *** Vector Fixed-Point Arithmetic Instructions
+ */
+
+/* Vector Single-Width Saturating Add and Subtract */
+GEN_OPIVV_TRANS(vsaddu_vv, opivv_check)
+GEN_OPIVV_TRANS(vsadd_vv,  opivv_check)
+GEN_OPIVV_TRANS(vssubu_vv, opivv_check)
+GEN_OPIVV_TRANS(vssub_vv,  opivv_check)
+GEN_OPIVX_TRANS(vsaddu_vx,  opivx_check)
+GEN_OPIVX_TRANS(vsadd_vx,  opivx_check)
+GEN_OPIVX_TRANS(vssubu_vx,  opivx_check)
+GEN_OPIVX_TRANS(vssub_vx,  opivx_check)
+GEN_OPIVI_TRANS(vsaddu_vi, 1, vsaddu_vx, opivx_check)
+GEN_OPIVI_TRANS(vsadd_vi, 0, vsadd_vx, opivx_check)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 92d90d07d6..1277aa1c10 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -2112,3 +2112,388 @@ GEN_VEXT_VMERGE_VX(vmerge_vxm_b, int8_t,  H1, clearb)
 GEN_VEXT_VMERGE_VX(vmerge_vxm_h, int16_t, H2, clearh)
 GEN_VEXT_VMERGE_VX(vmerge_vxm_w, int32_t, H4, clearl)
 GEN_VEXT_VMERGE_VX(vmerge_vxm_d, int64_t, H8, clearq)
+
+/*
+ *** Vector Fixed-Point Arithmetic Instructions
+ */
+
+/* Vector Single-Width Saturating Add and Subtract */
+
+/*
+ * As fixed point instructions probably have round mode and saturation,
+ * define common macros for fixed point here.
+ */
+typedef void opivv2_rm_fn(void *vd, void *vs1, void *vs2, int i,
+                          CPURISCVState *env, int vxrm);
+
+#define OPIVV2_RM(NAME, TD, T1, T2, TX1, TX2, HD, HS1, HS2, OP)     \
+static inline void                                                  \
+do_##NAME(void *vd, void *vs1, void *vs2, int i,                    \
+          CPURISCVState *env, int vxrm)                             \
+{                                                                   \
+    TX1 s1 = *((T1 *)vs1 + HS1(i));                                 \
+    TX2 s2 = *((T2 *)vs2 + HS2(i));                                 \
+    *((TD *)vd + HD(i)) = OP(env, vxrm, s2, s1);                    \
+}
+
+static inline void
+vext_vv_rm_1(void *vd, void *v0, void *vs1, void *vs2,
+             CPURISCVState *env,
+             uint32_t vl, uint32_t vm, uint32_t mlen, int vxrm,
+             opivv2_rm_fn *fn)
+{
+    for (uint32_t i = 0; i < vl; i++) {
+        if (!vm && !vext_elem_mask(v0, mlen, i)) {
+            continue;
+        }
+        fn(vd, vs1, vs2, i, env, vxrm);
+    }
+}
+
+static inline void
+vext_vv_rm_2(void *vd, void *v0, void *vs1, void *vs2,
+             CPURISCVState *env,
+             uint32_t desc, uint32_t esz, uint32_t dsz,
+             opivv2_rm_fn *fn, clear_fn *clearfn)
+{
+    uint32_t vlmax = vext_maxsz(desc) / esz;
+    uint32_t mlen = vext_mlen(desc);
+    uint32_t vm = vext_vm(desc);
+    uint32_t vl = env->vl;
+
+    switch (env->vxrm) {
+    case 0: /* rnu */
+        vext_vv_rm_1(vd, v0, vs1, vs2,
+                     env, vl, vm, mlen, 0, fn);
+        break;
+    case 1: /* rne */
+        vext_vv_rm_1(vd, v0, vs1, vs2,
+                     env, vl, vm, mlen, 1, fn);
+        break;
+    case 2: /* rdn */
+        vext_vv_rm_1(vd, v0, vs1, vs2,
+                     env, vl, vm, mlen, 2, fn);
+        break;
+    default: /* rod */
+        vext_vv_rm_1(vd, v0, vs1, vs2,
+                     env, vl, vm, mlen, 3, fn);
+        break;
+    }
+
+    clearfn(vd, vl, vl * dsz,  vlmax * dsz);
+}
+
+/* generate helpers for fixed point instructions with OPIVV format */
+#define GEN_VEXT_VV_RM(NAME, ESZ, DSZ, CLEAR_FN)                \
+void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,     \
+                  CPURISCVState *env, uint32_t desc)            \
+{                                                               \
+    vext_vv_rm_2(vd, v0, vs1, vs2, env, desc, ESZ, DSZ,         \
+                 do_##NAME, CLEAR_FN);                          \
+}
+
+static inline uint8_t saddu8(CPURISCVState *env, int vxrm, uint8_t a, uint8_t b)
+{
+    uint8_t res = a + b;
+    if (res < a) {
+        res = UINT8_MAX;
+        env->vxsat = 0x1;
+    }
+    return res;
+}
+
+static inline uint16_t saddu16(CPURISCVState *env, int vxrm, uint16_t a,
+                               uint16_t b)
+{
+    uint16_t res = a + b;
+    if (res < a) {
+        res = UINT16_MAX;
+        env->vxsat = 0x1;
+    }
+    return res;
+}
+
+static inline uint32_t saddu32(CPURISCVState *env, int vxrm, uint32_t a,
+                               uint32_t b)
+{
+    uint32_t res = a + b;
+    if (res < a) {
+        res = UINT32_MAX;
+        env->vxsat = 0x1;
+    }
+    return res;
+}
+
+static inline uint64_t saddu64(CPURISCVState *env, int vxrm, uint64_t a,
+                               uint64_t b)
+{
+    uint64_t res = a + b;
+    if (res < a) {
+        res = UINT64_MAX;
+        env->vxsat = 0x1;
+    }
+    return res;
+}
+
+RVVCALL(OPIVV2_RM, vsaddu_vv_b, OP_UUU_B, H1, H1, H1, saddu8)
+RVVCALL(OPIVV2_RM, vsaddu_vv_h, OP_UUU_H, H2, H2, H2, saddu16)
+RVVCALL(OPIVV2_RM, vsaddu_vv_w, OP_UUU_W, H4, H4, H4, saddu32)
+RVVCALL(OPIVV2_RM, vsaddu_vv_d, OP_UUU_D, H8, H8, H8, saddu64)
+GEN_VEXT_VV_RM(vsaddu_vv_b, 1, 1, clearb)
+GEN_VEXT_VV_RM(vsaddu_vv_h, 2, 2, clearh)
+GEN_VEXT_VV_RM(vsaddu_vv_w, 4, 4, clearl)
+GEN_VEXT_VV_RM(vsaddu_vv_d, 8, 8, clearq)
+
+typedef void opivx2_rm_fn(void *vd, target_long s1, void *vs2, int i,
+                          CPURISCVState *env, int vxrm);
+
+#define OPIVX2_RM(NAME, TD, T1, T2, TX1, TX2, HD, HS2, OP)          \
+static inline void                                                  \
+do_##NAME(void *vd, target_long s1, void *vs2, int i,               \
+          CPURISCVState *env, int vxrm)                             \
+{                                                                   \
+    TX2 s2 = *((T2 *)vs2 + HS2(i));                                 \
+    *((TD *)vd + HD(i)) = OP(env, vxrm, s2, (TX1)(T1)s1);           \
+}
+
+static inline void
+vext_vx_rm_1(void *vd, void *v0, target_long s1, void *vs2,
+             CPURISCVState *env,
+             uint32_t vl, uint32_t vm, uint32_t mlen, int vxrm,
+             opivx2_rm_fn *fn)
+{
+    for (uint32_t i = 0; i < vl; i++) {
+        if (!vm && !vext_elem_mask(v0, mlen, i)) {
+            continue;
+        }
+        fn(vd, s1, vs2, i, env, vxrm);
+    }
+}
+
+static inline void
+vext_vx_rm_2(void *vd, void *v0, target_long s1, void *vs2,
+             CPURISCVState *env,
+             uint32_t desc, uint32_t esz, uint32_t dsz,
+             opivx2_rm_fn *fn, clear_fn *clearfn)
+{
+    uint32_t vlmax = vext_maxsz(desc) / esz;
+    uint32_t mlen = vext_mlen(desc);
+    uint32_t vm = vext_vm(desc);
+    uint32_t vl = env->vl;
+
+    switch (env->vxrm) {
+    case 0: /* rnu */
+        vext_vx_rm_1(vd, v0, s1, vs2,
+                     env, vl, vm, mlen, 0, fn);
+        break;
+    case 1: /* rne */
+        vext_vx_rm_1(vd, v0, s1, vs2,
+                     env, vl, vm, mlen, 1, fn);
+        break;
+    case 2: /* rdn */
+        vext_vx_rm_1(vd, v0, s1, vs2,
+                     env, vl, vm, mlen, 2, fn);
+        break;
+    default: /* rod */
+        vext_vx_rm_1(vd, v0, s1, vs2,
+                     env, vl, vm, mlen, 3, fn);
+        break;
+    }
+
+    clearfn(vd, vl, vl * dsz,  vlmax * dsz);
+}
+
+/* generate helpers for fixed point instructions with OPIVX format */
+#define GEN_VEXT_VX_RM(NAME, ESZ, DSZ, CLEAR_FN)          \
+void HELPER(NAME)(void *vd, void *v0, target_ulong s1,    \
+        void *vs2, CPURISCVState *env, uint32_t desc)     \
+{                                                         \
+    vext_vx_rm_2(vd, v0, s1, vs2, env, desc, ESZ, DSZ,    \
+                 do_##NAME, CLEAR_FN);                    \
+}
+
+RVVCALL(OPIVX2_RM, vsaddu_vx_b, OP_UUU_B, H1, H1, saddu8)
+RVVCALL(OPIVX2_RM, vsaddu_vx_h, OP_UUU_H, H2, H2, saddu16)
+RVVCALL(OPIVX2_RM, vsaddu_vx_w, OP_UUU_W, H4, H4, saddu32)
+RVVCALL(OPIVX2_RM, vsaddu_vx_d, OP_UUU_D, H8, H8, saddu64)
+GEN_VEXT_VX_RM(vsaddu_vx_b, 1, 1, clearb)
+GEN_VEXT_VX_RM(vsaddu_vx_h, 2, 2, clearh)
+GEN_VEXT_VX_RM(vsaddu_vx_w, 4, 4, clearl)
+GEN_VEXT_VX_RM(vsaddu_vx_d, 8, 8, clearq)
+
+static inline int8_t sadd8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
+{
+    int8_t res = a + b;
+    if ((res ^ a) & (res ^ b) & INT8_MIN) {
+        res = a > 0 ? INT8_MAX : INT8_MIN;
+        env->vxsat = 0x1;
+    }
+    return res;
+}
+
+static inline int16_t sadd16(CPURISCVState *env, int vxrm, int16_t a, int16_t b)
+{
+    int16_t res = a + b;
+    if ((res ^ a) & (res ^ b) & INT16_MIN) {
+        res = a > 0 ? INT16_MAX : INT16_MIN;
+        env->vxsat = 0x1;
+    }
+    return res;
+}
+
+static inline int32_t sadd32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
+{
+    int32_t res = a + b;
+    if ((res ^ a) & (res ^ b) & INT32_MIN) {
+        res = a > 0 ? INT32_MAX : INT32_MIN;
+        env->vxsat = 0x1;
+    }
+    return res;
+}
+
+static inline int64_t sadd64(CPURISCVState *env, int vxrm, int64_t a, int64_t b)
+{
+    int64_t res = a + b;
+    if ((res ^ a) & (res ^ b) & INT64_MIN) {
+        res = a > 0 ? INT64_MAX : INT64_MIN;
+        env->vxsat = 0x1;
+    }
+    return res;
+}
+
+RVVCALL(OPIVV2_RM, vsadd_vv_b, OP_SSS_B, H1, H1, H1, sadd8)
+RVVCALL(OPIVV2_RM, vsadd_vv_h, OP_SSS_H, H2, H2, H2, sadd16)
+RVVCALL(OPIVV2_RM, vsadd_vv_w, OP_SSS_W, H4, H4, H4, sadd32)
+RVVCALL(OPIVV2_RM, vsadd_vv_d, OP_SSS_D, H8, H8, H8, sadd64)
+GEN_VEXT_VV_RM(vsadd_vv_b, 1, 1, clearb)
+GEN_VEXT_VV_RM(vsadd_vv_h, 2, 2, clearh)
+GEN_VEXT_VV_RM(vsadd_vv_w, 4, 4, clearl)
+GEN_VEXT_VV_RM(vsadd_vv_d, 8, 8, clearq)
+
+RVVCALL(OPIVX2_RM, vsadd_vx_b, OP_SSS_B, H1, H1, sadd8)
+RVVCALL(OPIVX2_RM, vsadd_vx_h, OP_SSS_H, H2, H2, sadd16)
+RVVCALL(OPIVX2_RM, vsadd_vx_w, OP_SSS_W, H4, H4, sadd32)
+RVVCALL(OPIVX2_RM, vsadd_vx_d, OP_SSS_D, H8, H8, sadd64)
+GEN_VEXT_VX_RM(vsadd_vx_b, 1, 1, clearb)
+GEN_VEXT_VX_RM(vsadd_vx_h, 2, 2, clearh)
+GEN_VEXT_VX_RM(vsadd_vx_w, 4, 4, clearl)
+GEN_VEXT_VX_RM(vsadd_vx_d, 8, 8, clearq)
+
+static inline uint8_t ssubu8(CPURISCVState *env, int vxrm, uint8_t a, uint8_t b)
+{
+    uint8_t res = a - b;
+    if (res > a) {
+        res = 0;
+        env->vxsat = 0x1;
+    }
+    return res;
+}
+
+static inline uint16_t ssubu16(CPURISCVState *env, int vxrm, uint16_t a,
+                               uint16_t b)
+{
+    uint16_t res = a - b;
+    if (res > a) {
+        res = 0;
+        env->vxsat = 0x1;
+    }
+    return res;
+}
+
+static inline uint32_t ssubu32(CPURISCVState *env, int vxrm, uint32_t a,
+                               uint32_t b)
+{
+    uint32_t res = a - b;
+    if (res > a) {
+        res = 0;
+        env->vxsat = 0x1;
+    }
+    return res;
+}
+
+static inline uint64_t ssubu64(CPURISCVState *env, int vxrm, uint64_t a,
+                               uint64_t b)
+{
+    uint64_t res = a - b;
+    if (res > a) {
+        res = 0;
+        env->vxsat = 0x1;
+    }
+    return res;
+}
+
+RVVCALL(OPIVV2_RM, vssubu_vv_b, OP_UUU_B, H1, H1, H1, ssubu8)
+RVVCALL(OPIVV2_RM, vssubu_vv_h, OP_UUU_H, H2, H2, H2, ssubu16)
+RVVCALL(OPIVV2_RM, vssubu_vv_w, OP_UUU_W, H4, H4, H4, ssubu32)
+RVVCALL(OPIVV2_RM, vssubu_vv_d, OP_UUU_D, H8, H8, H8, ssubu64)
+GEN_VEXT_VV_RM(vssubu_vv_b, 1, 1, clearb)
+GEN_VEXT_VV_RM(vssubu_vv_h, 2, 2, clearh)
+GEN_VEXT_VV_RM(vssubu_vv_w, 4, 4, clearl)
+GEN_VEXT_VV_RM(vssubu_vv_d, 8, 8, clearq)
+
+RVVCALL(OPIVX2_RM, vssubu_vx_b, OP_UUU_B, H1, H1, ssubu8)
+RVVCALL(OPIVX2_RM, vssubu_vx_h, OP_UUU_H, H2, H2, ssubu16)
+RVVCALL(OPIVX2_RM, vssubu_vx_w, OP_UUU_W, H4, H4, ssubu32)
+RVVCALL(OPIVX2_RM, vssubu_vx_d, OP_UUU_D, H8, H8, ssubu64)
+GEN_VEXT_VX_RM(vssubu_vx_b, 1, 1, clearb)
+GEN_VEXT_VX_RM(vssubu_vx_h, 2, 2, clearh)
+GEN_VEXT_VX_RM(vssubu_vx_w, 4, 4, clearl)
+GEN_VEXT_VX_RM(vssubu_vx_d, 8, 8, clearq)
+
+static inline int8_t ssub8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
+{
+    int8_t res = a - b;
+    if ((res ^ a) & (a ^ b) & INT8_MIN) {
+        res = a > 0 ? INT8_MAX : INT8_MIN;
+        env->vxsat = 0x1;
+    }
+    return res;
+}
+
+static inline int16_t ssub16(CPURISCVState *env, int vxrm, int16_t a, int16_t b)
+{
+    int16_t res = a - b;
+    if ((res ^ a) & (a ^ b) & INT16_MIN) {
+        res = a > 0 ? INT16_MAX : INT16_MIN;
+        env->vxsat = 0x1;
+    }
+    return res;
+}
+
+static inline int32_t ssub32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
+{
+    int32_t res = a - b;
+    if ((res ^ a) & (a ^ b) & INT32_MIN) {
+        res = a > 0 ? INT32_MAX : INT32_MIN;
+        env->vxsat = 0x1;
+    }
+    return res;
+}
+
+static inline int64_t ssub64(CPURISCVState *env, int vxrm, int64_t a, int64_t b)
+{
+    int64_t res = a - b;
+    if ((res ^ a) & (a ^ b) & INT64_MIN) {
+        res = a > 0 ? INT64_MAX : INT64_MIN;
+        env->vxsat = 0x1;
+    }
+    return res;
+}
+
+RVVCALL(OPIVV2_RM, vssub_vv_b, OP_SSS_B, H1, H1, H1, ssub8)
+RVVCALL(OPIVV2_RM, vssub_vv_h, OP_SSS_H, H2, H2, H2, ssub16)
+RVVCALL(OPIVV2_RM, vssub_vv_w, OP_SSS_W, H4, H4, H4, ssub32)
+RVVCALL(OPIVV2_RM, vssub_vv_d, OP_SSS_D, H8, H8, H8, ssub64)
+GEN_VEXT_VV_RM(vssub_vv_b, 1, 1, clearb)
+GEN_VEXT_VV_RM(vssub_vv_h, 2, 2, clearh)
+GEN_VEXT_VV_RM(vssub_vv_w, 4, 4, clearl)
+GEN_VEXT_VV_RM(vssub_vv_d, 8, 8, clearq)
+
+RVVCALL(OPIVX2_RM, vssub_vx_b, OP_SSS_B, H1, H1, ssub8)
+RVVCALL(OPIVX2_RM, vssub_vx_h, OP_SSS_H, H2, H2, ssub16)
+RVVCALL(OPIVX2_RM, vssub_vx_w, OP_SSS_W, H4, H4, ssub32)
+RVVCALL(OPIVX2_RM, vssub_vx_d, OP_SSS_D, H8, H8, ssub64)
+GEN_VEXT_VX_RM(vssub_vx_b, 1, 1, clearb)
+GEN_VEXT_VX_RM(vssub_vx_h, 2, 2, clearh)
+GEN_VEXT_VX_RM(vssub_vx_w, 4, 4, clearl)
+GEN_VEXT_VX_RM(vssub_vx_d, 8, 8, clearq)
-- 
2.23.0


