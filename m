Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A18212A98
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 18:58:35 +0200 (CEST)
Received: from localhost ([::1]:35894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jr2Xi-0000l6-2s
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 12:58:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4451fe355=alistair.francis@wdc.com>)
 id 1jr2AH-0005Kh-T4
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 12:34:21 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:44889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4451fe355=alistair.francis@wdc.com>)
 id 1jr2AE-0000BG-JD
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 12:34:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1593707658; x=1625243658;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FnWKROq4teNUjUvyBTym/vkTE+CyBQbmP7si5AO1fEQ=;
 b=MC+USIUL/rOsiO1DyV7zS+pTWcXjd6cLUw3yWEHUIXmH/kEm0P01AttM
 MFZsrpSf1tNfrbt0Nyr7Rp4doR7S6bcNuaoh3V9cZgpmdaH5eq1jdFGwF
 aHP0ClwpOZxJlMVsWuM8bhYb80AWtVPP+LDx0nM72ucHVMHKPIJhBZIw/
 56+xSIjzkMvl77slwCXW/kF6TajuNehhUctjKCjlAp/BnUcN8wTibCnTZ
 fo95/uW62FH/TKsTwIC6/YJZJ+gSJFkNzjGlJbiMZ2wzoUHsnh2BKF+fD
 TMP/jLmhzfsopnOc+zHqC5JajSySifFyqUn32GtUT/fQ7rw/WvfQ/XISB w==;
IronPort-SDR: PEUHOWTv4q4LmVz1fzbfGejYomzrtGbO6N5ocFBKhMxoYDOnzfftkamz4Lhs7AnYg0xrqaOylg
 5JV6Ee6iqPxMeyyHa8goKclkFT5DPaJkzppcpPL4q2ChUEHbM0YjcDQvYyZ3qCXH9ZOasRAg4N
 0q4safHAs2ncvmDphTNkppJKA7yhT+RTojLxc8k/SRLy8zeAhDB4IsvcAn2GYxrXpPCtaHOBzs
 Jp9jKxFbSMbOwq9wIrK/rBopWHxW6M0w/zbtvcfUxVypdhDWa050pGnzkLxChnuBabqAmYas/d
 zhc=
X-IronPort-AV: E=Sophos;i="5.75,304,1589212800"; d="scan'208";a="141498506"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jul 2020 00:33:28 +0800
IronPort-SDR: M6QSj2I4nJpaf7vXih+yJ6eWDyB8gvELDWL+mQMJhkXqg/HfudbsjOUAskeMfPkpfNFyK7y7fs
 Tr3NkxJMLouDmtdIItBMKLq1CrPAAFY/c=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 09:21:43 -0700
IronPort-SDR: O2Kk/OnVPmsOrcUV1Qgrff3LzrCdOPg7nU7vojUTQxGO4JbY9jpDOXIAL4/7cvRhehYX142EFy
 LhBpkHppNr+A==
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.58.118])
 by uls-op-cesaip01.wdc.com with ESMTP; 02 Jul 2020 09:33:28 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL v2 33/64] target/riscv: vector single-width floating-point
 add/subtract instructions
Date: Thu,  2 Jul 2020 09:23:23 -0700
Message-Id: <20200702162354.928528-34-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200702162354.928528-1-alistair.francis@wdc.com>
References: <20200702162354.928528-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=4451fe355=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 12:33:30
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20200701152549.1218-31-zhiwei_liu@c-sky.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |  16 ++++
 target/riscv/insn32.decode              |   5 +
 target/riscv/insn_trans/trans_rvv.inc.c | 118 ++++++++++++++++++++++++
 target/riscv/vector_helper.c            | 111 ++++++++++++++++++++++
 4 files changed, 250 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 5fa4330200..ba8a3710e1 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -803,3 +803,19 @@ DEF_HELPER_6(vnclipu_vx_w, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vnclip_vx_b, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vnclip_vx_h, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vnclip_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+
+DEF_HELPER_6(vfadd_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfadd_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfadd_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfsub_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfsub_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfsub_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vfadd_vf_h, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfadd_vf_w, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfadd_vf_d, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfsub_vf_h, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfsub_vf_w, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfsub_vf_d, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfrsub_vf_h, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfrsub_vf_w, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfrsub_vf_d, void, ptr, ptr, i64, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 78e6da6205..9e26ed36e7 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -445,6 +445,11 @@ vnclipu_vi      101110 . ..... ..... 011 ..... 1010111 @r_vm
 vnclip_vv       101111 . ..... ..... 000 ..... 1010111 @r_vm
 vnclip_vx       101111 . ..... ..... 100 ..... 1010111 @r_vm
 vnclip_vi       101111 . ..... ..... 011 ..... 1010111 @r_vm
+vfadd_vv        000000 . ..... ..... 001 ..... 1010111 @r_vm
+vfadd_vf        000000 . ..... ..... 101 ..... 1010111 @r_vm
+vfsub_vv        000010 . ..... ..... 001 ..... 1010111 @r_vm
+vfsub_vf        000010 . ..... ..... 101 ..... 1010111 @r_vm
+vfrsub_vf       100111 . ..... ..... 101 ..... 1010111 @r_vm
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index b9d29f4051..55a6e514a9 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -1783,3 +1783,121 @@ GEN_OPIVX_NARROW_TRANS(vnclipu_vx)
 GEN_OPIVX_NARROW_TRANS(vnclip_vx)
 GEN_OPIVI_NARROW_TRANS(vnclipu_vi, 1, vnclipu_vx)
 GEN_OPIVI_NARROW_TRANS(vnclip_vi, 1, vnclip_vx)
+
+/*
+ *** Vector Float Point Arithmetic Instructions
+ */
+/* Vector Single-Width Floating-Point Add/Subtract Instructions */
+
+/*
+ * If the current SEW does not correspond to a supported IEEE floating-point
+ * type, an illegal instruction exception is raised.
+ */
+static bool opfvv_check(DisasContext *s, arg_rmrr *a)
+{
+    return (vext_check_isa_ill(s) &&
+            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
+            vext_check_reg(s, a->rd, false) &&
+            vext_check_reg(s, a->rs2, false) &&
+            vext_check_reg(s, a->rs1, false) &&
+            (s->sew != 0));
+}
+
+/* OPFVV without GVEC IR */
+#define GEN_OPFVV_TRANS(NAME, CHECK)                               \
+static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
+{                                                                  \
+    if (CHECK(s, a)) {                                             \
+        uint32_t data = 0;                                         \
+        static gen_helper_gvec_4_ptr * const fns[3] = {            \
+            gen_helper_##NAME##_h,                                 \
+            gen_helper_##NAME##_w,                                 \
+            gen_helper_##NAME##_d,                                 \
+        };                                                         \
+        TCGLabel *over = gen_new_label();                          \
+        gen_set_rm(s, 7);                                          \
+        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
+                                                                   \
+        data = FIELD_DP32(data, VDATA, MLEN, s->mlen);             \
+        data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
+        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
+        tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
+                           vreg_ofs(s, a->rs1),                    \
+                           vreg_ofs(s, a->rs2), cpu_env, 0,        \
+                           s->vlen / 8, data, fns[s->sew - 1]);    \
+        gen_set_label(over);                                       \
+        return true;                                               \
+    }                                                              \
+    return false;                                                  \
+}
+GEN_OPFVV_TRANS(vfadd_vv, opfvv_check)
+GEN_OPFVV_TRANS(vfsub_vv, opfvv_check)
+
+typedef void gen_helper_opfvf(TCGv_ptr, TCGv_ptr, TCGv_i64, TCGv_ptr,
+                              TCGv_env, TCGv_i32);
+
+static bool opfvf_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
+                        uint32_t data, gen_helper_opfvf *fn, DisasContext *s)
+{
+    TCGv_ptr dest, src2, mask;
+    TCGv_i32 desc;
+
+    TCGLabel *over = gen_new_label();
+    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
+
+    dest = tcg_temp_new_ptr();
+    mask = tcg_temp_new_ptr();
+    src2 = tcg_temp_new_ptr();
+    desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
+
+    tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
+    tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, vs2));
+    tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
+
+    fn(dest, mask, cpu_fpr[rs1], src2, cpu_env, desc);
+
+    tcg_temp_free_ptr(dest);
+    tcg_temp_free_ptr(mask);
+    tcg_temp_free_ptr(src2);
+    tcg_temp_free_i32(desc);
+    gen_set_label(over);
+    return true;
+}
+
+static bool opfvf_check(DisasContext *s, arg_rmrr *a)
+{
+/*
+ * If the current SEW does not correspond to a supported IEEE floating-point
+ * type, an illegal instruction exception is raised
+ */
+    return (vext_check_isa_ill(s) &&
+            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
+            vext_check_reg(s, a->rd, false) &&
+            vext_check_reg(s, a->rs2, false) &&
+            (s->sew != 0));
+}
+
+/* OPFVF without GVEC IR */
+#define GEN_OPFVF_TRANS(NAME, CHECK)                              \
+static bool trans_##NAME(DisasContext *s, arg_rmrr *a)            \
+{                                                                 \
+    if (CHECK(s, a)) {                                            \
+        uint32_t data = 0;                                        \
+        static gen_helper_opfvf *const fns[3] = {                 \
+            gen_helper_##NAME##_h,                                \
+            gen_helper_##NAME##_w,                                \
+            gen_helper_##NAME##_d,                                \
+        };                                                        \
+        gen_set_rm(s, 7);                                         \
+        data = FIELD_DP32(data, VDATA, MLEN, s->mlen);            \
+        data = FIELD_DP32(data, VDATA, VM, a->vm);                \
+        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);            \
+        return opfvf_trans(a->rd, a->rs1, a->rs2, data,           \
+                           fns[s->sew - 1], s);                   \
+    }                                                             \
+    return false;                                                 \
+}
+
+GEN_OPFVF_TRANS(vfadd_vf,  opfvf_check)
+GEN_OPFVF_TRANS(vfsub_vf,  opfvf_check)
+GEN_OPFVF_TRANS(vfrsub_vf,  opfvf_check)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index d7c51daca7..a2bbe8481f 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -21,6 +21,7 @@
 #include "exec/memop.h"
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
+#include "fpu/softfloat.h"
 #include "tcg/tcg-gvec-desc.h"
 #include "internals.h"
 #include <math.h>
@@ -3167,3 +3168,113 @@ RVVCALL(OPIVX2_RM, vnclipu_vx_w, NOP_UUU_W, H4, H8, vnclipu32)
 GEN_VEXT_VX_RM(vnclipu_vx_b, 1, 1, clearb)
 GEN_VEXT_VX_RM(vnclipu_vx_h, 2, 2, clearh)
 GEN_VEXT_VX_RM(vnclipu_vx_w, 4, 4, clearl)
+
+/*
+ *** Vector Float Point Arithmetic Instructions
+ */
+/* Vector Single-Width Floating-Point Add/Subtract Instructions */
+#define OPFVV2(NAME, TD, T1, T2, TX1, TX2, HD, HS1, HS2, OP)   \
+static void do_##NAME(void *vd, void *vs1, void *vs2, int i,   \
+                      CPURISCVState *env)                      \
+{                                                              \
+    TX1 s1 = *((T1 *)vs1 + HS1(i));                            \
+    TX2 s2 = *((T2 *)vs2 + HS2(i));                            \
+    *((TD *)vd + HD(i)) = OP(s2, s1, &env->fp_status);         \
+}
+
+#define GEN_VEXT_VV_ENV(NAME, ESZ, DSZ, CLEAR_FN)         \
+void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
+                  void *vs2, CPURISCVState *env,          \
+                  uint32_t desc)                          \
+{                                                         \
+    uint32_t vlmax = vext_maxsz(desc) / ESZ;              \
+    uint32_t mlen = vext_mlen(desc);                      \
+    uint32_t vm = vext_vm(desc);                          \
+    uint32_t vl = env->vl;                                \
+    uint32_t i;                                           \
+                                                          \
+    for (i = 0; i < vl; i++) {                            \
+        if (!vm && !vext_elem_mask(v0, mlen, i)) {        \
+            continue;                                     \
+        }                                                 \
+        do_##NAME(vd, vs1, vs2, i, env);                  \
+    }                                                     \
+    CLEAR_FN(vd, vl, vl * DSZ,  vlmax * DSZ);             \
+}
+
+RVVCALL(OPFVV2, vfadd_vv_h, OP_UUU_H, H2, H2, H2, float16_add)
+RVVCALL(OPFVV2, vfadd_vv_w, OP_UUU_W, H4, H4, H4, float32_add)
+RVVCALL(OPFVV2, vfadd_vv_d, OP_UUU_D, H8, H8, H8, float64_add)
+GEN_VEXT_VV_ENV(vfadd_vv_h, 2, 2, clearh)
+GEN_VEXT_VV_ENV(vfadd_vv_w, 4, 4, clearl)
+GEN_VEXT_VV_ENV(vfadd_vv_d, 8, 8, clearq)
+
+#define OPFVF2(NAME, TD, T1, T2, TX1, TX2, HD, HS2, OP)        \
+static void do_##NAME(void *vd, uint64_t s1, void *vs2, int i, \
+                      CPURISCVState *env)                      \
+{                                                              \
+    TX2 s2 = *((T2 *)vs2 + HS2(i));                            \
+    *((TD *)vd + HD(i)) = OP(s2, (TX1)(T1)s1, &env->fp_status);\
+}
+
+#define GEN_VEXT_VF(NAME, ESZ, DSZ, CLEAR_FN)             \
+void HELPER(NAME)(void *vd, void *v0, uint64_t s1,        \
+                  void *vs2, CPURISCVState *env,          \
+                  uint32_t desc)                          \
+{                                                         \
+    uint32_t vlmax = vext_maxsz(desc) / ESZ;              \
+    uint32_t mlen = vext_mlen(desc);                      \
+    uint32_t vm = vext_vm(desc);                          \
+    uint32_t vl = env->vl;                                \
+    uint32_t i;                                           \
+                                                          \
+    for (i = 0; i < vl; i++) {                            \
+        if (!vm && !vext_elem_mask(v0, mlen, i)) {        \
+            continue;                                     \
+        }                                                 \
+        do_##NAME(vd, s1, vs2, i, env);                   \
+    }                                                     \
+    CLEAR_FN(vd, vl, vl * DSZ,  vlmax * DSZ);             \
+}
+
+RVVCALL(OPFVF2, vfadd_vf_h, OP_UUU_H, H2, H2, float16_add)
+RVVCALL(OPFVF2, vfadd_vf_w, OP_UUU_W, H4, H4, float32_add)
+RVVCALL(OPFVF2, vfadd_vf_d, OP_UUU_D, H8, H8, float64_add)
+GEN_VEXT_VF(vfadd_vf_h, 2, 2, clearh)
+GEN_VEXT_VF(vfadd_vf_w, 4, 4, clearl)
+GEN_VEXT_VF(vfadd_vf_d, 8, 8, clearq)
+
+RVVCALL(OPFVV2, vfsub_vv_h, OP_UUU_H, H2, H2, H2, float16_sub)
+RVVCALL(OPFVV2, vfsub_vv_w, OP_UUU_W, H4, H4, H4, float32_sub)
+RVVCALL(OPFVV2, vfsub_vv_d, OP_UUU_D, H8, H8, H8, float64_sub)
+GEN_VEXT_VV_ENV(vfsub_vv_h, 2, 2, clearh)
+GEN_VEXT_VV_ENV(vfsub_vv_w, 4, 4, clearl)
+GEN_VEXT_VV_ENV(vfsub_vv_d, 8, 8, clearq)
+RVVCALL(OPFVF2, vfsub_vf_h, OP_UUU_H, H2, H2, float16_sub)
+RVVCALL(OPFVF2, vfsub_vf_w, OP_UUU_W, H4, H4, float32_sub)
+RVVCALL(OPFVF2, vfsub_vf_d, OP_UUU_D, H8, H8, float64_sub)
+GEN_VEXT_VF(vfsub_vf_h, 2, 2, clearh)
+GEN_VEXT_VF(vfsub_vf_w, 4, 4, clearl)
+GEN_VEXT_VF(vfsub_vf_d, 8, 8, clearq)
+
+static uint16_t float16_rsub(uint16_t a, uint16_t b, float_status *s)
+{
+    return float16_sub(b, a, s);
+}
+
+static uint32_t float32_rsub(uint32_t a, uint32_t b, float_status *s)
+{
+    return float32_sub(b, a, s);
+}
+
+static uint64_t float64_rsub(uint64_t a, uint64_t b, float_status *s)
+{
+    return float64_sub(b, a, s);
+}
+
+RVVCALL(OPFVF2, vfrsub_vf_h, OP_UUU_H, H2, H2, float16_rsub)
+RVVCALL(OPFVF2, vfrsub_vf_w, OP_UUU_W, H4, H4, float32_rsub)
+RVVCALL(OPFVF2, vfrsub_vf_d, OP_UUU_D, H8, H8, float64_rsub)
+GEN_VEXT_VF(vfrsub_vf_h, 2, 2, clearh)
+GEN_VEXT_VF(vfrsub_vf_w, 4, 4, clearl)
+GEN_VEXT_VF(vfrsub_vf_d, 8, 8, clearq)
-- 
2.27.0


