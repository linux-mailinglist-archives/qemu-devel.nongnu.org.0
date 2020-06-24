Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDC320689F
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 01:48:06 +0200 (CEST)
Received: from localhost ([::1]:52816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnse5-0004xr-H9
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 19:48:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jnsch-0004Ur-Qg; Tue, 23 Jun 2020 19:46:39 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:44168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jnscg-0003sO-0A; Tue, 23 Jun 2020 19:46:39 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08011243|-1; BR=01201311R111ec; CH=green;
 DM=|OVERLOAD|false|; DS=SPAM|spam_blackmail|0.948973-1.39969e-05-0.0510128;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03309; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=8; RT=8; SR=0; TI=SMTPD_---.HrTdUFm_1592955991; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HrTdUFm_1592955991)
 by smtp.aliyun-inc.com(10.147.41.199);
 Wed, 24 Jun 2020 07:46:31 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v11 53/61] target/riscv: vector iota instruction
Date: Wed, 24 Jun 2020 05:59:12 +0800
Message-Id: <20200623215920.2594-54-zhiwei_liu@c-sky.com>
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
 target/riscv/helper.h                   |  5 +++++
 target/riscv/insn32.decode              |  1 +
 target/riscv/insn_trans/trans_rvv.inc.c | 27 +++++++++++++++++++++++
 target/riscv/vector_helper.c            | 29 +++++++++++++++++++++++++
 4 files changed, 62 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 0f9012be7e..91db396979 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1109,3 +1109,8 @@ DEF_HELPER_4(vmfirst_m, tl, ptr, ptr, env, i32)
 DEF_HELPER_5(vmsbf_m, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vmsif_m, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vmsof_m, void, ptr, ptr, ptr, env, i32)
+
+DEF_HELPER_5(viota_m_b, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(viota_m_h, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(viota_m_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(viota_m_d, void, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index fab4a0b7e2..415523573d 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -560,6 +560,7 @@ vmfirst_m       010101 . ..... ----- 010 ..... 1010111 @r2_vm
 vmsbf_m         010110 . ..... 00001 010 ..... 1010111 @r2_vm
 vmsif_m         010110 . ..... 00011 010 ..... 1010111 @r2_vm
 vmsof_m         010110 . ..... 00010 010 ..... 1010111 @r2_vm
+viota_m         010110 . ..... 10000 010 ..... 1010111 @r2_vm
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 33ffe5dc1a..4dc893fa70 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2481,3 +2481,30 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
 GEN_M_TRANS(vmsbf_m)
 GEN_M_TRANS(vmsif_m)
 GEN_M_TRANS(vmsof_m)
+
+/* Vector Iota Instruction */
+static bool trans_viota_m(DisasContext *s, arg_viota_m *a)
+{
+    if (vext_check_isa_ill(s) &&
+        vext_check_reg(s, a->rd, false) &&
+        vext_check_overlap_group(a->rd, 1 << s->lmul, a->rs2, 1) &&
+        (a->vm != 0 || a->rd != 0)) {
+        uint32_t data = 0;
+        TCGLabel *over = gen_new_label();
+        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+
+        data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
+        data = FIELD_DP32(data, VDATA, VM, a->vm);
+        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
+        static gen_helper_gvec_3_ptr * const fns[4] = {
+            gen_helper_viota_m_b, gen_helper_viota_m_h,
+            gen_helper_viota_m_w, gen_helper_viota_m_d,
+        };
+        tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
+                           vreg_ofs(s, a->rs2), cpu_env, 0,
+                           s->vlen / 8, data, fns[s->sew]);
+        gen_set_label(over);
+        return true;
+    }
+    return false;
+}
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index d07abb34ed..28381c9ea6 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4644,3 +4644,32 @@ void HELPER(vmsof_m)(void *vd, void *v0, void *vs2, CPURISCVState *env,
 {
     vmsetm(vd, v0, vs2, env, desc, ONLY_FIRST);
 }
+
+/* Vector Iota Instruction */
+#define GEN_VEXT_VIOTA_M(NAME, ETYPE, H, CLEAR_FN)                        \
+void HELPER(NAME)(void *vd, void *v0, void *vs2, CPURISCVState *env,      \
+                  uint32_t desc)                                          \
+{                                                                         \
+    uint32_t mlen = vext_mlen(desc);                                      \
+    uint32_t vlmax = env_archcpu(env)->cfg.vlen / mlen;                   \
+    uint32_t vm = vext_vm(desc);                                          \
+    uint32_t vl = env->vl;                                                \
+    uint32_t sum = 0;                                                     \
+    int i;                                                                \
+                                                                          \
+    for (i = 0; i < vl; i++) {                                            \
+        if (!vm && !vext_elem_mask(v0, mlen, i)) {                        \
+            continue;                                                     \
+        }                                                                 \
+        *((ETYPE *)vd + H(i)) = sum;                                      \
+        if (vext_elem_mask(vs2, mlen, i)) {                               \
+            sum++;                                                        \
+        }                                                                 \
+    }                                                                     \
+    CLEAR_FN(vd, vl, vl * sizeof(ETYPE), vlmax * sizeof(ETYPE));          \
+}
+
+GEN_VEXT_VIOTA_M(viota_m_b, uint8_t, H1, clearb)
+GEN_VEXT_VIOTA_M(viota_m_h, uint16_t, H2, clearh)
+GEN_VEXT_VIOTA_M(viota_m_w, uint32_t, H4, clearl)
+GEN_VEXT_VIOTA_M(viota_m_d, uint64_t, H8, clearq)
-- 
2.23.0


