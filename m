Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C591DCB9E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 13:05:51 +0200 (CEST)
Received: from localhost ([::1]:53980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbj1K-0000uK-Oy
	for lists+qemu-devel@lfdr.de; Thu, 21 May 2020 07:05:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jbj0X-00009b-SE; Thu, 21 May 2020 07:05:01 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:45084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jbj0V-0001TO-7Y; Thu, 21 May 2020 07:05:01 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.06436282|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_regular_dialog|0.0354011-8.05315e-05-0.964518;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03296; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=8; RT=8; SR=0; TI=SMTPD_---.HbdydA5_1590059092; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HbdydA5_1590059092)
 by smtp.aliyun-inc.com(10.147.41.231);
 Thu, 21 May 2020 19:04:52 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 40/62] target/riscv: vector floating-point compare
 instructions
Date: Thu, 21 May 2020 17:43:51 +0800
Message-Id: <20200521094413.10425-41-zhiwei_liu@c-sky.com>
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |  37 +++++
 target/riscv/insn32.decode              |  12 ++
 target/riscv/insn_trans/trans_rvv.inc.c |  35 +++++
 target/riscv/vector_helper.c            | 174 ++++++++++++++++++++++++
 4 files changed, 258 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index d6e7ce57be..bedd4d0114 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -953,3 +953,40 @@ DEF_HELPER_6(vfsgnjn_vf_d, void, ptr, ptr, i64, ptr, env, i32)
 DEF_HELPER_6(vfsgnjx_vf_h, void, ptr, ptr, i64, ptr, env, i32)
 DEF_HELPER_6(vfsgnjx_vf_w, void, ptr, ptr, i64, ptr, env, i32)
 DEF_HELPER_6(vfsgnjx_vf_d, void, ptr, ptr, i64, ptr, env, i32)
+
+DEF_HELPER_6(vmfeq_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmfeq_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmfeq_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmfne_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmfne_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmfne_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmflt_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmflt_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmflt_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmfle_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmfle_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmfle_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmfeq_vf_h, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vmfeq_vf_w, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vmfeq_vf_d, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vmfne_vf_h, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vmfne_vf_w, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vmfne_vf_d, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vmflt_vf_h, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vmflt_vf_w, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vmflt_vf_d, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vmfle_vf_h, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vmfle_vf_w, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vmfle_vf_d, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vmfgt_vf_h, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vmfgt_vf_w, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vmfgt_vf_d, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vmfge_vf_h, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vmfge_vf_w, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vmfge_vf_d, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vmford_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmford_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmford_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmford_vf_h, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vmford_vf_w, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vmford_vf_d, void, ptr, ptr, i64, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index ce2f497ed2..b0f1c54d53 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -500,6 +500,18 @@ vfsgnjn_vv      001001 . ..... ..... 001 ..... 1010111 @r_vm
 vfsgnjn_vf      001001 . ..... ..... 101 ..... 1010111 @r_vm
 vfsgnjx_vv      001010 . ..... ..... 001 ..... 1010111 @r_vm
 vfsgnjx_vf      001010 . ..... ..... 101 ..... 1010111 @r_vm
+vmfeq_vv        011000 . ..... ..... 001 ..... 1010111 @r_vm
+vmfeq_vf        011000 . ..... ..... 101 ..... 1010111 @r_vm
+vmfne_vv        011100 . ..... ..... 001 ..... 1010111 @r_vm
+vmfne_vf        011100 . ..... ..... 101 ..... 1010111 @r_vm
+vmflt_vv        011011 . ..... ..... 001 ..... 1010111 @r_vm
+vmflt_vf        011011 . ..... ..... 101 ..... 1010111 @r_vm
+vmfle_vv        011001 . ..... ..... 001 ..... 1010111 @r_vm
+vmfle_vf        011001 . ..... ..... 101 ..... 1010111 @r_vm
+vmfgt_vf        011101 . ..... ..... 101 ..... 1010111 @r_vm
+vmfge_vf        011111 . ..... ..... 101 ..... 1010111 @r_vm
+vmford_vv       011010 . ..... ..... 001 ..... 1010111 @r_vm
+vmford_vf       011010 . ..... ..... 101 ..... 1010111 @r_vm
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 881bb73909..4a45c00ffb 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2139,3 +2139,38 @@ GEN_OPFVV_TRANS(vfsgnjx_vv, opfvv_check)
 GEN_OPFVF_TRANS(vfsgnj_vf, opfvf_check)
 GEN_OPFVF_TRANS(vfsgnjn_vf, opfvf_check)
 GEN_OPFVF_TRANS(vfsgnjx_vf, opfvf_check)
+
+/* Vector Floating-Point Compare Instructions */
+static bool opfvv_cmp_check(DisasContext *s, arg_rmrr *a)
+{
+    return (vext_check_isa_ill(s) &&
+            vext_check_reg(s, a->rs2, false) &&
+            vext_check_reg(s, a->rs1, false) &&
+            (s->sew != 0) &&
+            ((vext_check_overlap_group(a->rd, 1, a->rs1, 1 << s->lmul) &&
+              vext_check_overlap_group(a->rd, 1, a->rs2, 1 << s->lmul)) ||
+             (s->lmul == 0)));
+}
+
+GEN_OPFVV_TRANS(vmfeq_vv, opfvv_cmp_check)
+GEN_OPFVV_TRANS(vmfne_vv, opfvv_cmp_check)
+GEN_OPFVV_TRANS(vmflt_vv, opfvv_cmp_check)
+GEN_OPFVV_TRANS(vmfle_vv, opfvv_cmp_check)
+GEN_OPFVV_TRANS(vmford_vv, opfvv_cmp_check)
+
+static bool opfvf_cmp_check(DisasContext *s, arg_rmrr *a)
+{
+    return (vext_check_isa_ill(s) &&
+            vext_check_reg(s, a->rs2, false) &&
+            (s->sew != 0) &&
+            (vext_check_overlap_group(a->rd, 1, a->rs2, 1 << s->lmul) ||
+             (s->lmul == 0)));
+}
+
+GEN_OPFVF_TRANS(vmfeq_vf, opfvf_cmp_check)
+GEN_OPFVF_TRANS(vmfne_vf, opfvf_cmp_check)
+GEN_OPFVF_TRANS(vmflt_vf, opfvf_cmp_check)
+GEN_OPFVF_TRANS(vmfle_vf, opfvf_cmp_check)
+GEN_OPFVF_TRANS(vmfgt_vf, opfvf_cmp_check)
+GEN_OPFVF_TRANS(vmfge_vf, opfvf_cmp_check)
+GEN_OPFVF_TRANS(vmford_vf, opfvf_cmp_check)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 3f01fdd83c..92227228b7 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3928,3 +3928,177 @@ RVVCALL(OPFVF2, vfsgnjx_vf_d, OP_UUU_D, H8, H8, fsgnjx64)
 GEN_VEXT_VF(vfsgnjx_vf_h, 2, 2, clearh)
 GEN_VEXT_VF(vfsgnjx_vf_w, 4, 4, clearl)
 GEN_VEXT_VF(vfsgnjx_vf_d, 8, 8, clearq)
+
+/* Vector Floating-Point Compare Instructions */
+#define GEN_VEXT_CMP_VV_ENV(NAME, ETYPE, H, DO_OP)            \
+void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
+                  CPURISCVState *env, uint32_t desc)          \
+{                                                             \
+    uint32_t mlen = vext_mlen(desc);                          \
+    uint32_t vm = vext_vm(desc);                              \
+    uint32_t vl = env->vl;                                    \
+    uint32_t vlmax = vext_maxsz(desc) / sizeof(ETYPE);        \
+    uint32_t i;                                               \
+                                                              \
+    for (i = 0; i < vl; i++) {                                \
+        ETYPE s1 = *((ETYPE *)vs1 + H(i));                    \
+        ETYPE s2 = *((ETYPE *)vs2 + H(i));                    \
+        if (!vm && !vext_elem_mask(v0, mlen, i)) {            \
+            continue;                                         \
+        }                                                     \
+        vext_set_elem_mask(vd, mlen, i, DO_OP(s2, s1,         \
+                           &env->fp_status));                 \
+    }                                                         \
+    for (; i < vlmax; i++) {                                  \
+        vext_set_elem_mask(vd, mlen, i, 0);                   \
+    }                                                         \
+}
+
+static uint8_t float16_eq_quiet(uint16_t a, uint16_t b, float_status *s)
+{
+    int compare = float16_compare_quiet(a, b, s);
+    return compare == float_relation_equal;
+}
+
+GEN_VEXT_CMP_VV_ENV(vmfeq_vv_h, uint16_t, H2, float16_eq_quiet)
+GEN_VEXT_CMP_VV_ENV(vmfeq_vv_w, uint32_t, H4, float32_eq_quiet)
+GEN_VEXT_CMP_VV_ENV(vmfeq_vv_d, uint64_t, H8, float64_eq_quiet)
+
+#define GEN_VEXT_CMP_VF(NAME, ETYPE, H, DO_OP)                      \
+void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,       \
+                  CPURISCVState *env, uint32_t desc)                \
+{                                                                   \
+    uint32_t mlen = vext_mlen(desc);                                \
+    uint32_t vm = vext_vm(desc);                                    \
+    uint32_t vl = env->vl;                                          \
+    uint32_t vlmax = vext_maxsz(desc) / sizeof(ETYPE);              \
+    uint32_t i;                                                     \
+                                                                    \
+    for (i = 0; i < vl; i++) {                                      \
+        ETYPE s2 = *((ETYPE *)vs2 + H(i));                          \
+        if (!vm && !vext_elem_mask(v0, mlen, i)) {                  \
+            continue;                                               \
+        }                                                           \
+        vext_set_elem_mask(vd, mlen, i, DO_OP(s2, (ETYPE)s1,        \
+                           &env->fp_status));                       \
+    }                                                               \
+    for (; i < vlmax; i++) {                                        \
+        vext_set_elem_mask(vd, mlen, i, 0);                         \
+    }                                                               \
+}
+
+GEN_VEXT_CMP_VF(vmfeq_vf_h, uint16_t, H2, float16_eq_quiet)
+GEN_VEXT_CMP_VF(vmfeq_vf_w, uint32_t, H4, float32_eq_quiet)
+GEN_VEXT_CMP_VF(vmfeq_vf_d, uint64_t, H8, float64_eq_quiet)
+
+static uint8_t vmfne16(uint16_t a, uint16_t b, float_status *s)
+{
+    int compare = float16_compare_quiet(a, b, s);
+    return compare != float_relation_equal;
+}
+
+static uint8_t vmfne32(uint32_t a, uint32_t b, float_status *s)
+{
+    int compare = float32_compare_quiet(a, b, s);
+    return compare != float_relation_equal;
+}
+
+static uint8_t vmfne64(uint64_t a, uint64_t b, float_status *s)
+{
+    int compare = float64_compare_quiet(a, b, s);
+    return compare != float_relation_equal;
+}
+
+GEN_VEXT_CMP_VV_ENV(vmfne_vv_h, uint16_t, H2, vmfne16)
+GEN_VEXT_CMP_VV_ENV(vmfne_vv_w, uint32_t, H4, vmfne32)
+GEN_VEXT_CMP_VV_ENV(vmfne_vv_d, uint64_t, H8, vmfne64)
+GEN_VEXT_CMP_VF(vmfne_vf_h, uint16_t, H2, vmfne16)
+GEN_VEXT_CMP_VF(vmfne_vf_w, uint32_t, H4, vmfne32)
+GEN_VEXT_CMP_VF(vmfne_vf_d, uint64_t, H8, vmfne64)
+
+static uint8_t float16_lt(uint16_t a, uint16_t b, float_status *s)
+{
+    int compare = float16_compare(a, b, s);
+    return compare == float_relation_less;
+}
+
+GEN_VEXT_CMP_VV_ENV(vmflt_vv_h, uint16_t, H2, float16_lt)
+GEN_VEXT_CMP_VV_ENV(vmflt_vv_w, uint32_t, H4, float32_lt)
+GEN_VEXT_CMP_VV_ENV(vmflt_vv_d, uint64_t, H8, float64_lt)
+GEN_VEXT_CMP_VF(vmflt_vf_h, uint16_t, H2, float16_lt)
+GEN_VEXT_CMP_VF(vmflt_vf_w, uint32_t, H4, float32_lt)
+GEN_VEXT_CMP_VF(vmflt_vf_d, uint64_t, H8, float64_lt)
+
+static uint8_t float16_le(uint16_t a, uint16_t b, float_status *s)
+{
+    int compare = float16_compare(a, b, s);
+    return compare == float_relation_less ||
+           compare == float_relation_equal;
+}
+
+GEN_VEXT_CMP_VV_ENV(vmfle_vv_h, uint16_t, H2, float16_le)
+GEN_VEXT_CMP_VV_ENV(vmfle_vv_w, uint32_t, H4, float32_le)
+GEN_VEXT_CMP_VV_ENV(vmfle_vv_d, uint64_t, H8, float64_le)
+GEN_VEXT_CMP_VF(vmfle_vf_h, uint16_t, H2, float16_le)
+GEN_VEXT_CMP_VF(vmfle_vf_w, uint32_t, H4, float32_le)
+GEN_VEXT_CMP_VF(vmfle_vf_d, uint64_t, H8, float64_le)
+
+static uint8_t vmfgt16(uint16_t a, uint16_t b, float_status *s)
+{
+    int compare = float16_compare(a, b, s);
+    return compare == float_relation_greater;
+}
+
+static uint8_t vmfgt32(uint32_t a, uint32_t b, float_status *s)
+{
+    int compare = float32_compare(a, b, s);
+    return compare == float_relation_greater;
+}
+
+static uint8_t vmfgt64(uint64_t a, uint64_t b, float_status *s)
+{
+    int compare = float64_compare(a, b, s);
+    return compare == float_relation_greater;
+}
+
+GEN_VEXT_CMP_VF(vmfgt_vf_h, uint16_t, H2, vmfgt16)
+GEN_VEXT_CMP_VF(vmfgt_vf_w, uint32_t, H4, vmfgt32)
+GEN_VEXT_CMP_VF(vmfgt_vf_d, uint64_t, H8, vmfgt64)
+
+static uint8_t vmfge16(uint16_t a, uint16_t b, float_status *s)
+{
+    int compare = float16_compare(a, b, s);
+    return compare == float_relation_greater ||
+           compare == float_relation_equal;
+}
+
+static uint8_t vmfge32(uint32_t a, uint32_t b, float_status *s)
+{
+    int compare = float32_compare(a, b, s);
+    return compare == float_relation_greater ||
+           compare == float_relation_equal;
+}
+
+static uint8_t vmfge64(uint64_t a, uint64_t b, float_status *s)
+{
+    int compare = float64_compare(a, b, s);
+    return compare == float_relation_greater ||
+           compare == float_relation_equal;
+}
+
+GEN_VEXT_CMP_VF(vmfge_vf_h, uint16_t, H2, vmfge16)
+GEN_VEXT_CMP_VF(vmfge_vf_w, uint32_t, H4, vmfge32)
+GEN_VEXT_CMP_VF(vmfge_vf_d, uint64_t, H8, vmfge64)
+
+static uint8_t float16_unordered_quiet(uint16_t a, uint16_t b, float_status *s)
+{
+    int compare = float16_compare_quiet(a, b, s);
+    return compare == float_relation_unordered;
+}
+
+GEN_VEXT_CMP_VV_ENV(vmford_vv_h, uint16_t, H2, !float16_unordered_quiet)
+GEN_VEXT_CMP_VV_ENV(vmford_vv_w, uint32_t, H4, !float32_unordered_quiet)
+GEN_VEXT_CMP_VV_ENV(vmford_vv_d, uint64_t, H8, !float64_unordered_quiet)
+GEN_VEXT_CMP_VF(vmford_vf_h, uint16_t, H2, !float16_unordered_quiet)
+GEN_VEXT_CMP_VF(vmford_vf_w, uint32_t, H4, !float32_unordered_quiet)
+GEN_VEXT_CMP_VF(vmford_vf_d, uint64_t, H8, !float64_unordered_quiet)
-- 
2.23.0


