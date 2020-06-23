Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B47D20672D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 00:29:35 +0200 (CEST)
Received: from localhost ([::1]:34058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnrQ6-00088l-5p
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 18:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jnrOh-0006xN-Tb; Tue, 23 Jun 2020 18:28:07 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:32819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jnrOf-0003fH-Mi; Tue, 23 Jun 2020 18:28:07 -0400
X-Alimail-AntiSpam: AC=PASS; BC=0.07436282|-1; BR=01201311R121ee; CH=green;
 DM=|CONTINUE|false|; DS=SPAM|spam_ad|0.886079-0.000789594-0.113131;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01a16368; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=9; RT=8; SR=0; TI=SMTPD_---.HrRvIrj_1592951281; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HrRvIrj_1592951281)
 by smtp.aliyun-inc.com(10.147.42.197);
 Wed, 24 Jun 2020 06:28:01 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v11 14/61] target/riscv: vector single-width bit shift
 instructions
Date: Wed, 24 Jun 2020 05:58:33 +0800
Message-Id: <20200623215920.2594-15-zhiwei_liu@c-sky.com>
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
 wenmeng_zhang@c-sky.com, Alistair Francis <alistair.francis@wdc.com>,
 palmer@dabbelt.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   | 25 ++++++++
 target/riscv/insn32.decode              |  9 +++
 target/riscv/insn_trans/trans_rvv.inc.c | 52 ++++++++++++++++
 target/riscv/vector_helper.c            | 79 +++++++++++++++++++++++++
 4 files changed, 165 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index f8b1c8a800..6805bf7dbd 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -407,3 +407,28 @@ DEF_HELPER_6(vxor_vx_b, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vxor_vx_h, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vxor_vx_w, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vxor_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+
+DEF_HELPER_6(vsll_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vsll_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vsll_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vsll_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vsrl_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vsrl_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vsrl_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vsrl_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vsra_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vsra_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vsra_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vsra_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vsll_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vsll_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vsll_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vsll_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vsrl_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vsrl_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vsrl_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vsrl_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vsra_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vsra_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vsra_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vsra_vx_d, void, ptr, ptr, tl, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 34d05a5917..e5334230df 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -322,6 +322,15 @@ vor_vi          001010 . ..... ..... 011 ..... 1010111 @r_vm
 vxor_vv         001011 . ..... ..... 000 ..... 1010111 @r_vm
 vxor_vx         001011 . ..... ..... 100 ..... 1010111 @r_vm
 vxor_vi         001011 . ..... ..... 011 ..... 1010111 @r_vm
+vsll_vv         100101 . ..... ..... 000 ..... 1010111 @r_vm
+vsll_vx         100101 . ..... ..... 100 ..... 1010111 @r_vm
+vsll_vi         100101 . ..... ..... 011 ..... 1010111 @r_vm
+vsrl_vv         101000 . ..... ..... 000 ..... 1010111 @r_vm
+vsrl_vx         101000 . ..... ..... 100 ..... 1010111 @r_vm
+vsrl_vi         101000 . ..... ..... 011 ..... 1010111 @r_vm
+vsra_vv         101001 . ..... ..... 000 ..... 1010111 @r_vm
+vsra_vx         101001 . ..... ..... 100 ..... 1010111 @r_vm
+vsra_vi         101001 . ..... ..... 011 ..... 1010111 @r_vm
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 1552534796..d2dbf701c8 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -1373,3 +1373,55 @@ GEN_OPIVX_GVEC_TRANS(vxor_vx, xors)
 GEN_OPIVI_GVEC_TRANS(vand_vi, 0, vand_vx, andi)
 GEN_OPIVI_GVEC_TRANS(vor_vi, 0, vor_vx,  ori)
 GEN_OPIVI_GVEC_TRANS(vxor_vi, 0, vxor_vx, xori)
+
+/* Vector Single-Width Bit Shift Instructions */
+GEN_OPIVV_GVEC_TRANS(vsll_vv,  shlv)
+GEN_OPIVV_GVEC_TRANS(vsrl_vv,  shrv)
+GEN_OPIVV_GVEC_TRANS(vsra_vv,  sarv)
+
+typedef void GVecGen2sFn32(unsigned, uint32_t, uint32_t, TCGv_i32,
+                           uint32_t, uint32_t);
+
+static inline bool
+do_opivx_gvec_shift(DisasContext *s, arg_rmrr *a, GVecGen2sFn32 *gvec_fn,
+                    gen_helper_opivx *fn)
+{
+    if (!opivx_check(s, a)) {
+        return false;
+    }
+
+    if (a->vm && s->vl_eq_vlmax) {
+        TCGv_i32 src1 = tcg_temp_new_i32();
+        TCGv tmp = tcg_temp_new();
+
+        gen_get_gpr(tmp, a->rs1);
+        tcg_gen_trunc_tl_i32(src1, tmp);
+        tcg_gen_extract_i32(src1, src1, 0, s->sew + 3);
+        gvec_fn(s->sew, vreg_ofs(s, a->rd), vreg_ofs(s, a->rs2),
+                src1, MAXSZ(s), MAXSZ(s));
+
+        tcg_temp_free_i32(src1);
+        tcg_temp_free(tmp);
+        return true;
+    }
+    return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s);
+}
+
+#define GEN_OPIVX_GVEC_SHIFT_TRANS(NAME, SUF) \
+static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                    \
+{                                                                         \
+    static gen_helper_opivx * const fns[4] = {                            \
+        gen_helper_##NAME##_b, gen_helper_##NAME##_h,                     \
+        gen_helper_##NAME##_w, gen_helper_##NAME##_d,                     \
+    };                                                                    \
+                                                                          \
+    return do_opivx_gvec_shift(s, a, tcg_gen_gvec_##SUF, fns[s->sew]);    \
+}
+
+GEN_OPIVX_GVEC_SHIFT_TRANS(vsll_vx,  shls)
+GEN_OPIVX_GVEC_SHIFT_TRANS(vsrl_vx,  shrs)
+GEN_OPIVX_GVEC_SHIFT_TRANS(vsra_vx,  sars)
+
+GEN_OPIVI_GVEC_TRANS(vsll_vi, 1, vsll_vx,  shli)
+GEN_OPIVI_GVEC_TRANS(vsrl_vi, 1, vsrl_vx,  shri)
+GEN_OPIVI_GVEC_TRANS(vsra_vi, 1, vsra_vx,  sari)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 6c53dc5796..f63f06bd37 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -1316,3 +1316,82 @@ GEN_VEXT_VX(vxor_vx_b, 1, 1, clearb)
 GEN_VEXT_VX(vxor_vx_h, 2, 2, clearh)
 GEN_VEXT_VX(vxor_vx_w, 4, 4, clearl)
 GEN_VEXT_VX(vxor_vx_d, 8, 8, clearq)
+
+/* Vector Single-Width Bit Shift Instructions */
+#define DO_SLL(N, M)  (N << (M))
+#define DO_SRL(N, M)  (N >> (M))
+
+/* generate the helpers for shift instructions with two vector operators */
+#define GEN_VEXT_SHIFT_VV(NAME, TS1, TS2, HS1, HS2, OP, MASK, CLEAR_FN)   \
+void HELPER(NAME)(void *vd, void *v0, void *vs1,                          \
+                  void *vs2, CPURISCVState *env, uint32_t desc)           \
+{                                                                         \
+    uint32_t mlen = vext_mlen(desc);                                      \
+    uint32_t vm = vext_vm(desc);                                          \
+    uint32_t vl = env->vl;                                                \
+    uint32_t esz = sizeof(TS1);                                           \
+    uint32_t vlmax = vext_maxsz(desc) / esz;                              \
+    uint32_t i;                                                           \
+                                                                          \
+    for (i = 0; i < vl; i++) {                                            \
+        if (!vm && !vext_elem_mask(v0, mlen, i)) {                        \
+            continue;                                                     \
+        }                                                                 \
+        TS1 s1 = *((TS1 *)vs1 + HS1(i));                                  \
+        TS2 s2 = *((TS2 *)vs2 + HS2(i));                                  \
+        *((TS1 *)vd + HS1(i)) = OP(s2, s1 & MASK);                        \
+    }                                                                     \
+    CLEAR_FN(vd, vl, vl * esz, vlmax * esz);                              \
+}
+
+GEN_VEXT_SHIFT_VV(vsll_vv_b, uint8_t,  uint8_t, H1, H1, DO_SLL, 0x7, clearb)
+GEN_VEXT_SHIFT_VV(vsll_vv_h, uint16_t, uint16_t, H2, H2, DO_SLL, 0xf, clearh)
+GEN_VEXT_SHIFT_VV(vsll_vv_w, uint32_t, uint32_t, H4, H4, DO_SLL, 0x1f, clearl)
+GEN_VEXT_SHIFT_VV(vsll_vv_d, uint64_t, uint64_t, H8, H8, DO_SLL, 0x3f, clearq)
+
+GEN_VEXT_SHIFT_VV(vsrl_vv_b, uint8_t, uint8_t, H1, H1, DO_SRL, 0x7, clearb)
+GEN_VEXT_SHIFT_VV(vsrl_vv_h, uint16_t, uint16_t, H2, H2, DO_SRL, 0xf, clearh)
+GEN_VEXT_SHIFT_VV(vsrl_vv_w, uint32_t, uint32_t, H4, H4, DO_SRL, 0x1f, clearl)
+GEN_VEXT_SHIFT_VV(vsrl_vv_d, uint64_t, uint64_t, H8, H8, DO_SRL, 0x3f, clearq)
+
+GEN_VEXT_SHIFT_VV(vsra_vv_b, uint8_t,  int8_t, H1, H1, DO_SRL, 0x7, clearb)
+GEN_VEXT_SHIFT_VV(vsra_vv_h, uint16_t, int16_t, H2, H2, DO_SRL, 0xf, clearh)
+GEN_VEXT_SHIFT_VV(vsra_vv_w, uint32_t, int32_t, H4, H4, DO_SRL, 0x1f, clearl)
+GEN_VEXT_SHIFT_VV(vsra_vv_d, uint64_t, int64_t, H8, H8, DO_SRL, 0x3f, clearq)
+
+/* generate the helpers for shift instructions with one vector and one scalar */
+#define GEN_VEXT_SHIFT_VX(NAME, TD, TS2, HD, HS2, OP, MASK, CLEAR_FN) \
+void HELPER(NAME)(void *vd, void *v0, target_ulong s1,                \
+        void *vs2, CPURISCVState *env, uint32_t desc)                 \
+{                                                                     \
+    uint32_t mlen = vext_mlen(desc);                                  \
+    uint32_t vm = vext_vm(desc);                                      \
+    uint32_t vl = env->vl;                                            \
+    uint32_t esz = sizeof(TD);                                        \
+    uint32_t vlmax = vext_maxsz(desc) / esz;                          \
+    uint32_t i;                                                       \
+                                                                      \
+    for (i = 0; i < vl; i++) {                                        \
+        if (!vm && !vext_elem_mask(v0, mlen, i)) {                    \
+            continue;                                                 \
+        }                                                             \
+        TS2 s2 = *((TS2 *)vs2 + HS2(i));                              \
+        *((TD *)vd + HD(i)) = OP(s2, s1 & MASK);                      \
+    }                                                                 \
+    CLEAR_FN(vd, vl, vl * esz, vlmax * esz);                          \
+}
+
+GEN_VEXT_SHIFT_VX(vsll_vx_b, uint8_t, int8_t, H1, H1, DO_SLL, 0x7, clearb)
+GEN_VEXT_SHIFT_VX(vsll_vx_h, uint16_t, int16_t, H2, H2, DO_SLL, 0xf, clearh)
+GEN_VEXT_SHIFT_VX(vsll_vx_w, uint32_t, int32_t, H4, H4, DO_SLL, 0x1f, clearl)
+GEN_VEXT_SHIFT_VX(vsll_vx_d, uint64_t, int64_t, H8, H8, DO_SLL, 0x3f, clearq)
+
+GEN_VEXT_SHIFT_VX(vsrl_vx_b, uint8_t, uint8_t, H1, H1, DO_SRL, 0x7, clearb)
+GEN_VEXT_SHIFT_VX(vsrl_vx_h, uint16_t, uint16_t, H2, H2, DO_SRL, 0xf, clearh)
+GEN_VEXT_SHIFT_VX(vsrl_vx_w, uint32_t, uint32_t, H4, H4, DO_SRL, 0x1f, clearl)
+GEN_VEXT_SHIFT_VX(vsrl_vx_d, uint64_t, uint64_t, H8, H8, DO_SRL, 0x3f, clearq)
+
+GEN_VEXT_SHIFT_VX(vsra_vx_b, int8_t, int8_t, H1, H1, DO_SRL, 0x7, clearb)
+GEN_VEXT_SHIFT_VX(vsra_vx_h, int16_t, int16_t, H2, H2, DO_SRL, 0xf, clearh)
+GEN_VEXT_SHIFT_VX(vsra_vx_w, int32_t, int32_t, H4, H4, DO_SRL, 0x1f, clearl)
+GEN_VEXT_SHIFT_VX(vsra_vx_d, int64_t, int64_t, H8, H8, DO_SRL, 0x3f, clearq)
-- 
2.23.0


