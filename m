Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A09241F554B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jun 2020 15:02:55 +0200 (CEST)
Received: from localhost ([::1]:45692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jj0Na-0000M7-NY
	for lists+qemu-devel@lfdr.de; Wed, 10 Jun 2020 09:02:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jj0LP-0007zf-HW; Wed, 10 Jun 2020 09:00:39 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:42231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jj0LN-0000ly-Uv; Wed, 10 Jun 2020 09:00:39 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08183641|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_system_inform|0.00652819-9.09021e-05-0.993381;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03305; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=9; RT=8; SR=0; TI=SMTPD_---.HkaqxOt_1591794029; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HkaqxOt_1591794029)
 by smtp.aliyun-inc.com(10.147.43.95); Wed, 10 Jun 2020 21:00:30 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v9 41/61] target/riscv: vector floating-point merge
 instructions
Date: Wed, 10 Jun 2020 19:37:28 +0800
Message-Id: <20200610113748.4754-42-zhiwei_liu@c-sky.com>
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h                   |  4 +++
 target/riscv/insn32.decode              |  2 ++
 target/riscv/insn_trans/trans_rvv.inc.c | 38 +++++++++++++++++++++++++
 target/riscv/vector_helper.c            | 24 ++++++++++++++++
 4 files changed, 68 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 23b268df90..21054cc957 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -994,3 +994,7 @@ DEF_HELPER_6(vmford_vf_d, void, ptr, ptr, i64, ptr, env, i32)
 DEF_HELPER_5(vfclass_v_h, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfclass_v_w, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfclass_v_d, void, ptr, ptr, ptr, env, i32)
+
+DEF_HELPER_6(vfmerge_vfm_h, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfmerge_vfm_w, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfmerge_vfm_d, void, ptr, ptr, i64, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 23e80fe954..14cb4e2e66 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -513,6 +513,8 @@ vmfge_vf        011111 . ..... ..... 101 ..... 1010111 @r_vm
 vmford_vv       011010 . ..... ..... 001 ..... 1010111 @r_vm
 vmford_vf       011010 . ..... ..... 101 ..... 1010111 @r_vm
 vfclass_v       100011 . ..... 10000 001 ..... 1010111 @r2_vm
+vfmerge_vfm     010111 0 ..... ..... 101 ..... 1010111 @r_vm_0
+vfmv_v_f        010111 1 00000 ..... 101 ..... 1010111 @r2
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 80058669f0..51ee83255e 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2184,3 +2184,41 @@ GEN_OPFVF_TRANS(vmford_vf, opfvf_cmp_check)
 
 /* Vector Floating-Point Classify Instruction */
 GEN_OPFV_TRANS(vfclass_v, opfv_check)
+
+/* Vector Floating-Point Merge Instruction */
+GEN_OPFVF_TRANS(vfmerge_vfm,  opfvf_check)
+
+static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
+{
+    if (vext_check_isa_ill(s) &&
+        vext_check_reg(s, a->rd, false) &&
+        (s->sew != 0)) {
+
+        if (s->vl_eq_vlmax) {
+            tcg_gen_gvec_dup_i64(s->sew, vreg_ofs(s, a->rd),
+                                 MAXSZ(s), MAXSZ(s), cpu_fpr[a->rs1]);
+        } else {
+            TCGv_ptr dest;
+            TCGv_i32 desc;
+            uint32_t data = FIELD_DP32(0, VDATA, LMUL, s->lmul);
+            static gen_helper_vmv_vx * const fns[3] = {
+                gen_helper_vmv_v_x_h,
+                gen_helper_vmv_v_x_w,
+                gen_helper_vmv_v_x_d,
+            };
+            TCGLabel *over = gen_new_label();
+            tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+
+            dest = tcg_temp_new_ptr();
+            desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
+            tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, a->rd));
+            fns[s->sew - 1](dest, cpu_fpr[a->rs1], cpu_env, desc);
+
+            tcg_temp_free_ptr(dest);
+            tcg_temp_free_i32(desc);
+            gen_set_label(over);
+        }
+        return true;
+    }
+    return false;
+}
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index b0ccb32de0..5a0dd9304d 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4194,3 +4194,27 @@ RVVCALL(OPIVV1, vfclass_v_d, OP_UU_D, H8, H8, fclass_d)
 GEN_VEXT_V(vfclass_v_h, 2, 2, clearh)
 GEN_VEXT_V(vfclass_v_w, 4, 4, clearl)
 GEN_VEXT_V(vfclass_v_d, 8, 8, clearq)
+
+/* Vector Floating-Point Merge Instruction */
+#define GEN_VFMERGE_VF(NAME, ETYPE, H, CLEAR_FN)              \
+void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2, \
+                  CPURISCVState *env, uint32_t desc)          \
+{                                                             \
+    uint32_t mlen = vext_mlen(desc);                          \
+    uint32_t vm = vext_vm(desc);                              \
+    uint32_t vl = env->vl;                                    \
+    uint32_t esz = sizeof(ETYPE);                             \
+    uint32_t vlmax = vext_maxsz(desc) / esz;                  \
+    uint32_t i;                                               \
+                                                              \
+    for (i = 0; i < vl; i++) {                                \
+        ETYPE s2 = *((ETYPE *)vs2 + H(i));                    \
+        *((ETYPE *)vd + H(i))                                 \
+          = (!vm && !vext_elem_mask(v0, mlen, i) ? s2 : s1);  \
+    }                                                         \
+    CLEAR_FN(vd, vl, vl * esz, vlmax * esz);                  \
+}
+
+GEN_VFMERGE_VF(vfmerge_vfm_h, int16_t, H2, clearh)
+GEN_VFMERGE_VF(vfmerge_vfm_w, int32_t, H4, clearl)
+GEN_VFMERGE_VF(vfmerge_vfm_d, int64_t, H8, clearq)
-- 
2.23.0


