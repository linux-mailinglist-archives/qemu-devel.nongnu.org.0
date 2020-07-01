Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B922111AA
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jul 2020 19:12:24 +0200 (CEST)
Received: from localhost ([::1]:49886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqgHX-0005lA-6H
	for lists+qemu-devel@lfdr.de; Wed, 01 Jul 2020 13:12:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jqgGD-0004Jc-UQ; Wed, 01 Jul 2020 13:11:01 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:47830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jqgGB-0008V3-0J; Wed, 01 Jul 2020 13:11:01 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08209553|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_system_inform|0.00374601-0.00106944-0.995185;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01l07381; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=8; RT=8; SR=0; TI=SMTPD_---.HvxSm-j_1593623448; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HvxSm-j_1593623448)
 by smtp.aliyun-inc.com(10.147.41.143);
 Thu, 02 Jul 2020 01:10:49 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v12 52/61] target/riscv: set-X-first mask bit
Date: Wed,  1 Jul 2020 23:25:40 +0800
Message-Id: <20200701152549.1218-53-zhiwei_liu@c-sky.com>
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
 wenmeng_zhang@c-sky.com, Alistair.Francis@wdc.com, palmer@dabbelt.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h                   |  4 ++
 target/riscv/insn32.decode              |  3 ++
 target/riscv/insn_trans/trans_rvv.inc.c | 28 +++++++++++
 target/riscv/vector_helper.c            | 63 +++++++++++++++++++++++++
 4 files changed, 98 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 28aeb74f43..0f9012be7e 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1105,3 +1105,7 @@ DEF_HELPER_6(vmxnor_mm, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_4(vmpopc_m, tl, ptr, ptr, env, i32)
 
 DEF_HELPER_4(vmfirst_m, tl, ptr, ptr, env, i32)
+
+DEF_HELPER_5(vmsbf_m, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vmsif_m, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vmsof_m, void, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index a0f3315dbc..fab4a0b7e2 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -557,6 +557,9 @@ vmornot_mm      011100 - ..... ..... 010 ..... 1010111 @r
 vmxnor_mm       011111 - ..... ..... 010 ..... 1010111 @r
 vmpopc_m        010100 . ..... ----- 010 ..... 1010111 @r2_vm
 vmfirst_m       010101 . ..... ----- 010 ..... 1010111 @r2_vm
+vmsbf_m         010110 . ..... 00001 010 ..... 1010111 @r2_vm
+vmsif_m         010110 . ..... 00011 010 ..... 1010111 @r2_vm
+vmsof_m         010110 . ..... 00010 010 ..... 1010111 @r2_vm
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 01c32a3278..33ffe5dc1a 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2453,3 +2453,31 @@ static bool trans_vmfirst_m(DisasContext *s, arg_rmr *a)
     }
     return false;
 }
+
+/* vmsbf.m set-before-first mask bit */
+/* vmsif.m set-includ-first mask bit */
+/* vmsof.m set-only-first mask bit */
+#define GEN_M_TRANS(NAME)                                          \
+static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
+{                                                                  \
+    if (vext_check_isa_ill(s)) {                                   \
+        uint32_t data = 0;                                         \
+        gen_helper_gvec_3_ptr *fn = gen_helper_##NAME;             \
+        TCGLabel *over = gen_new_label();                          \
+        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
+                                                                   \
+        data = FIELD_DP32(data, VDATA, MLEN, s->mlen);             \
+        data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
+        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
+        tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd),                     \
+                           vreg_ofs(s, 0), vreg_ofs(s, a->rs2),    \
+                           cpu_env, 0, s->vlen / 8, data, fn);     \
+        gen_set_label(over);                                       \
+        return true;                                               \
+    }                                                              \
+    return false;                                                  \
+}
+
+GEN_M_TRANS(vmsbf_m)
+GEN_M_TRANS(vmsif_m)
+GEN_M_TRANS(vmsof_m)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index e0ec02cda3..a58809a3cd 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4581,3 +4581,66 @@ target_ulong HELPER(vmfirst_m)(void *v0, void *vs2, CPURISCVState *env,
     }
     return -1LL;
 }
+
+enum set_mask_type {
+    ONLY_FIRST = 1,
+    INCLUDE_FIRST,
+    BEFORE_FIRST,
+};
+
+static void vmsetm(void *vd, void *v0, void *vs2, CPURISCVState *env,
+                   uint32_t desc, enum set_mask_type type)
+{
+    uint32_t mlen = vext_mlen(desc);
+    uint32_t vlmax = env_archcpu(env)->cfg.vlen / mlen;
+    uint32_t vm = vext_vm(desc);
+    uint32_t vl = env->vl;
+    int i;
+    bool first_mask_bit = false;
+
+    for (i = 0; i < vl; i++) {
+        if (!vm && !vext_elem_mask(v0, mlen, i)) {
+            continue;
+        }
+        /* write a zero to all following active elements */
+        if (first_mask_bit) {
+            vext_set_elem_mask(vd, mlen, i, 0);
+            continue;
+        }
+        if (vext_elem_mask(vs2, mlen, i)) {
+            first_mask_bit = true;
+            if (type == BEFORE_FIRST) {
+                vext_set_elem_mask(vd, mlen, i, 0);
+            } else {
+                vext_set_elem_mask(vd, mlen, i, 1);
+            }
+        } else {
+            if (type == ONLY_FIRST) {
+                vext_set_elem_mask(vd, mlen, i, 0);
+            } else {
+                vext_set_elem_mask(vd, mlen, i, 1);
+            }
+        }
+    }
+    for (; i < vlmax; i++) {
+        vext_set_elem_mask(vd, mlen, i, 0);
+    }
+}
+
+void HELPER(vmsbf_m)(void *vd, void *v0, void *vs2, CPURISCVState *env,
+                     uint32_t desc)
+{
+    vmsetm(vd, v0, vs2, env, desc, BEFORE_FIRST);
+}
+
+void HELPER(vmsif_m)(void *vd, void *v0, void *vs2, CPURISCVState *env,
+                     uint32_t desc)
+{
+    vmsetm(vd, v0, vs2, env, desc, INCLUDE_FIRST);
+}
+
+void HELPER(vmsof_m)(void *vd, void *v0, void *vs2, CPURISCVState *env,
+                     uint32_t desc)
+{
+    vmsetm(vd, v0, vs2, env, desc, ONLY_FIRST);
+}
-- 
2.23.0


