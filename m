Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 001221DCB8A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 12:59:41 +0200 (CEST)
Received: from localhost ([::1]:41116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbivN-0001eJ-2t
	for lists+qemu-devel@lfdr.de; Thu, 21 May 2020 06:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jbiug-0000w8-3C; Thu, 21 May 2020 06:58:58 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:48224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jbiue-0000PD-Tx; Thu, 21 May 2020 06:58:57 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.06623246|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_system_inform|0.217191-0.000665318-0.782144;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03301; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=8; RT=8; SR=0; TI=SMTPD_---.HbdP-z4_1590058730; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HbdP-z4_1590058730) by smtp.aliyun-inc.com(10.147.40.2);
 Thu, 21 May 2020 18:58:50 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 37/62] target/riscv: vector floating-point square-root
 instruction
Date: Thu, 21 May 2020 17:43:48 +0800
Message-Id: <20200521094413.10425-38-zhiwei_liu@c-sky.com>
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |  4 +++
 target/riscv/insn32.decode              |  3 ++
 target/riscv/insn_trans/trans_rvv.inc.c | 42 ++++++++++++++++++++++++
 target/riscv/vector_helper.c            | 43 +++++++++++++++++++++++++
 4 files changed, 92 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index edf963e787..db4de7135b 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -917,3 +917,7 @@ DEF_HELPER_6(vfwmsac_vf_h, void, ptr, ptr, i64, ptr, env, i32)
 DEF_HELPER_6(vfwmsac_vf_w, void, ptr, ptr, i64, ptr, env, i32)
 DEF_HELPER_6(vfwnmsac_vf_h, void, ptr, ptr, i64, ptr, env, i32)
 DEF_HELPER_6(vfwnmsac_vf_w, void, ptr, ptr, i64, ptr, env, i32)
+
+DEF_HELPER_5(vfsqrt_v_h, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfsqrt_v_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfsqrt_v_d, void, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 56bfd4a919..4ea71eaf39 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -45,6 +45,7 @@
 &shift     shamt rs1 rd
 &atomic    aq rl rs2 rs1 rd
 &rmrr      vm rd rs1 rs2
+&rmr       vm rd rs2
 &rwdvm     vm wd rd rs1 rs2
 &r2nfvm    vm rd rs1 nf
 &rnfvm     vm rd rs1 rs2 nf
@@ -68,6 +69,7 @@
 @r2_rm   .......   ..... ..... ... ..... ....... %rs1 %rm %rd
 @r2      .......   ..... ..... ... ..... ....... %rs1 %rd
 @r2_nfvm ... ... vm:1 ..... ..... ... ..... ....... &r2nfvm %nf %rs1 %rd
+@r2_vm   ...... vm:1 ..... ..... ... ..... ....... &rmr %rs2 %rd
 @r_nfvm  ... ... vm:1 ..... ..... ... ..... ....... &rnfvm %nf %rs2 %rs1 %rd
 @r_vm    ...... vm:1 ..... ..... ... ..... ....... &rmrr %rs2 %rs1 %rd
 @r_vm_1  ...... . ..... ..... ... ..... .......    &rmrr vm=1 %rs2 %rs1 %rd
@@ -487,6 +489,7 @@ vfwmsac_vv      111110 . ..... ..... 001 ..... 1010111 @r_vm
 vfwmsac_vf      111110 . ..... ..... 101 ..... 1010111 @r_vm
 vfwnmsac_vv     111111 . ..... ..... 001 ..... 1010111 @r_vm
 vfwnmsac_vf     111111 . ..... ..... 101 ..... 1010111 @r_vm
+vfsqrt_v        100011 . ..... 00000 001 ..... 1010111 @r2_vm
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index a71fe048a3..c2dbc324e7 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2083,3 +2083,45 @@ GEN_OPFVF_WIDEN_TRANS(vfwmacc_vf)
 GEN_OPFVF_WIDEN_TRANS(vfwnmacc_vf)
 GEN_OPFVF_WIDEN_TRANS(vfwmsac_vf)
 GEN_OPFVF_WIDEN_TRANS(vfwnmsac_vf)
+
+/* Vector Floating-Point Square-Root Instruction */
+
+/*
+ * If the current SEW does not correspond to a supported IEEE floating-point
+ * type, an illegal instruction exception is raised
+ */
+static bool opfv_check(DisasContext *s, arg_rmr *a)
+{
+   return (vext_check_isa_ill(s) &&
+            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
+            vext_check_reg(s, a->rd, false) &&
+            vext_check_reg(s, a->rs2, false) &&
+            (s->sew != 0));
+}
+
+#define GEN_OPFV_TRANS(NAME, CHECK)                                \
+static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
+{                                                                  \
+    if (CHECK(s, a)) {                                             \
+        uint32_t data = 0;                                         \
+        static gen_helper_gvec_3_ptr * const fns[3] = {            \
+            gen_helper_##NAME##_h,                                 \
+            gen_helper_##NAME##_w,                                 \
+            gen_helper_##NAME##_d,                                 \
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
+GEN_OPFV_TRANS(vfsqrt_v, opfv_check)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 171252fb69..b8b1e496b1 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3773,3 +3773,46 @@ RVVCALL(OPFVF3, vfwnmsac_vf_h, WOP_UUU_H, H4, H2, fwnmsac16)
 RVVCALL(OPFVF3, vfwnmsac_vf_w, WOP_UUU_W, H8, H4, fwnmsac32)
 GEN_VEXT_VF(vfwnmsac_vf_h, 2, 4, clearl)
 GEN_VEXT_VF(vfwnmsac_vf_w, 4, 8, clearq)
+
+/* Vector Floating-Point Square-Root Instruction */
+/* (TD, T2, TX2) */
+#define OP_UU_H uint16_t, uint16_t, uint16_t
+#define OP_UU_W uint32_t, uint32_t, uint32_t
+#define OP_UU_D uint64_t, uint64_t, uint64_t
+
+#define OPFVV1(NAME, TD, T2, TX2, HD, HS2, OP)        \
+static void do_##NAME(void *vd, void *vs2, int i,      \
+        CPURISCVState *env)                            \
+{                                                      \
+    TX2 s2 = *((T2 *)vs2 + HS2(i));                    \
+    *((TD *)vd + HD(i)) = OP(s2, &env->fp_status);     \
+}
+
+#define GEN_VEXT_V_ENV(NAME, ESZ, DSZ, CLEAR_FN)       \
+void HELPER(NAME)(void *vd, void *v0, void *vs2,       \
+        CPURISCVState *env, uint32_t desc)             \
+{                                                      \
+    uint32_t vlmax = vext_maxsz(desc) / ESZ;           \
+    uint32_t mlen = vext_mlen(desc);                   \
+    uint32_t vm = vext_vm(desc);                       \
+    uint32_t vl = env->vl;                             \
+    uint32_t i;                                        \
+                                                       \
+    if (vl == 0) {                                     \
+        return;                                        \
+    }                                                  \
+    for (i = 0; i < vl; i++) {                         \
+        if (!vm && !vext_elem_mask(v0, mlen, i)) {     \
+            continue;                                  \
+        }                                              \
+        do_##NAME(vd, vs2, i, env);                    \
+    }                                                  \
+    CLEAR_FN(vd, vl, vl * DSZ,  vlmax * DSZ);          \
+}
+
+RVVCALL(OPFVV1, vfsqrt_v_h, OP_UU_H, H2, H2, float16_sqrt)
+RVVCALL(OPFVV1, vfsqrt_v_w, OP_UU_W, H4, H4, float32_sqrt)
+RVVCALL(OPFVV1, vfsqrt_v_d, OP_UU_D, H8, H8, float64_sqrt)
+GEN_VEXT_V_ENV(vfsqrt_v_h, 2, 2, clearh)
+GEN_VEXT_V_ENV(vfsqrt_v_w, 4, 4, clearl)
+GEN_VEXT_V_ENV(vfsqrt_v_d, 8, 8, clearq)
-- 
2.23.0


