Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D05317DAD7
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Mar 2020 09:28:23 +0100 (CET)
Received: from localhost ([::1]:38324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBDlu-0002Ei-2F
	for lists+qemu-devel@lfdr.de; Mon, 09 Mar 2020 04:28:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44418)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jBDfz-0006kN-Q6
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 04:22:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jBDfx-0007fH-6S
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 04:22:15 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:59063)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jBDfv-0007Mr-DR; Mon, 09 Mar 2020 04:22:13 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436282|-1; CH=green; DM=||false|;
 DS=CONTINUE|ham_system_inform|0.783163-0.000272733-0.216564;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03301; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=10; RT=10; SR=0; TI=SMTPD_---.GyTxIXp_1583742101; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.GyTxIXp_1583742101)
 by smtp.aliyun-inc.com(10.147.41.137);
 Mon, 09 Mar 2020 16:21:46 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: richard.henderson@linaro.org, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Subject: [PATCH v3 08/60] target/riscv: add vector amo operations
Date: Mon,  9 Mar 2020 16:19:50 +0800
Message-Id: <20200309082042.12967-9-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200309082042.12967-1-zhiwei_liu@c-sky.com>
References: <20200309082042.12967-1-zhiwei_liu@c-sky.com>
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

Vector AMOs operate as if aq and rl bits were zero on each element
with regard to ordering relative to other instructions in the same hart.
Vector AMOs provide no ordering guarantee between element operations
in the same vector AMO instruction

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/cpu.h                      |   1 +
 target/riscv/helper.h                   |  29 +++++
 target/riscv/insn32-64.decode           |  11 ++
 target/riscv/insn32.decode              |  13 +++
 target/riscv/insn_trans/trans_rvv.inc.c | 130 +++++++++++++++++++++
 target/riscv/vector_helper.c            | 143 ++++++++++++++++++++++++
 6 files changed, 327 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index a6761f3838..6fcaa5bc89 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -374,6 +374,7 @@ FIELD(VDATA, MLEN, 0, 8)
 FIELD(VDATA, VM, 8, 1)
 FIELD(VDATA, LMUL, 9, 2)
 FIELD(VDATA, NF, 11, 4)
+FIELD(VDATA, WD, 11, 1)
 
 FIELD(TB_FLAGS, VL_EQ_VLMAX, 2, 1)
 FIELD(TB_FLAGS, LMUL, 3, 2)
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 72ba4d9bdb..70a4b05f75 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -240,3 +240,32 @@ DEF_HELPER_5(vlhuff_v_w, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_5(vlhuff_v_d, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_5(vlwuff_v_w, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_5(vlwuff_v_d, void, ptr, ptr, tl, env, i32)
+#ifdef TARGET_RISCV64
+DEF_HELPER_6(vamoswapw_v_d, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoswapd_v_d, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoaddw_v_d,  void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoaddd_v_d,  void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoxorw_v_d,  void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoxord_v_d,  void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoandw_v_d,  void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoandd_v_d,  void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoorw_v_d,   void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoord_v_d,   void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamominw_v_d,  void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamomind_v_d,  void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamomaxw_v_d,  void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamomaxd_v_d,  void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamominuw_v_d, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamominud_v_d, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamomaxuw_v_d, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamomaxud_v_d, void, ptr, ptr, tl, ptr, env, i32)
+#endif
+DEF_HELPER_6(vamoswapw_v_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoaddw_v_w,  void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoxorw_v_w,  void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoandw_v_w,  void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamoorw_v_w,   void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamominw_v_w,  void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamomaxw_v_w,  void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamominuw_v_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vamomaxuw_v_w, void, ptr, ptr, tl, ptr, env, i32)
diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index 380bf791bc..86153d93fa 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -57,6 +57,17 @@ amomax_d   10100 . . ..... ..... 011 ..... 0101111 @atom_st
 amominu_d  11000 . . ..... ..... 011 ..... 0101111 @atom_st
 amomaxu_d  11100 . . ..... ..... 011 ..... 0101111 @atom_st
 
+#*** Vector AMO operations (in addition to Zvamo) ***
+vamoswapd_v     00001 . . ..... ..... 111 ..... 0101111 @r_wdvm
+vamoaddd_v      00000 . . ..... ..... 111 ..... 0101111 @r_wdvm
+vamoxord_v      00100 . . ..... ..... 111 ..... 0101111 @r_wdvm
+vamoandd_v      01100 . . ..... ..... 111 ..... 0101111 @r_wdvm
+vamoord_v       01000 . . ..... ..... 111 ..... 0101111 @r_wdvm
+vamomind_v      10000 . . ..... ..... 111 ..... 0101111 @r_wdvm
+vamomaxd_v      10100 . . ..... ..... 111 ..... 0101111 @r_wdvm
+vamominud_v     11000 . . ..... ..... 111 ..... 0101111 @r_wdvm
+vamomaxud_v     11100 . . ..... ..... 111 ..... 0101111 @r_wdvm
+
 # *** RV64F Standard Extension (in addition to RV32F) ***
 fcvt_l_s   1100000  00010 ..... ... ..... 1010011 @r2_rm
 fcvt_lu_s  1100000  00011 ..... ... ..... 1010011 @r2_rm
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index b76c09c8c0..1330703720 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -44,6 +44,7 @@
 &u    imm rd
 &shift     shamt rs1 rd
 &atomic    aq rl rs2 rs1 rd
+&rwdvm     vm wd rd rs1 rs2
 &r2nfvm    vm rd rs1 nf
 &rnfvm     vm rd rs1 rs2 nf
 
@@ -67,6 +68,7 @@
 @r2      .......   ..... ..... ... ..... ....... %rs1 %rd
 @r2_nfvm ... ... vm:1 ..... ..... ... ..... ....... &r2nfvm %nf %rs1 %rd
 @r_nfvm  ... ... vm:1 ..... ..... ... ..... ....... &rnfvm %nf %rs2 %rs1 %rd
+@r_wdvm  ..... wd:1 vm:1 ..... ..... ... ..... ....... &rwdvm %rs2 %rs1 %rd
 @r2_zimm . zimm:11  ..... ... ..... ....... %rs1 %rd
 
 @hfence_gvma ....... ..... .....   ... ..... ....... %rs2 %rs1
@@ -261,6 +263,17 @@ vsxh_v     ... -11 . ..... ..... 101 ..... 0100111 @r_nfvm
 vsxw_v     ... -11 . ..... ..... 110 ..... 0100111 @r_nfvm
 vsxe_v     ... -11 . ..... ..... 111 ..... 0100111 @r_nfvm
 
+#*** Vector AMO operations are encoded under the standard AMO major opcode ***
+vamoswapw_v     00001 . . ..... ..... 110 ..... 0101111 @r_wdvm
+vamoaddw_v      00000 . . ..... ..... 110 ..... 0101111 @r_wdvm
+vamoxorw_v      00100 . . ..... ..... 110 ..... 0101111 @r_wdvm
+vamoandw_v      01100 . . ..... ..... 110 ..... 0101111 @r_wdvm
+vamoorw_v       01000 . . ..... ..... 110 ..... 0101111 @r_wdvm
+vamominw_v      10000 . . ..... ..... 110 ..... 0101111 @r_wdvm
+vamomaxw_v      10100 . . ..... ..... 110 ..... 0101111 @r_wdvm
+vamominuw_v     11000 . . ..... ..... 110 ..... 0101111 @r_wdvm
+vamomaxuw_v     11100 . . ..... ..... 110 ..... 0101111 @r_wdvm
+
 # *** new major opcode OP-V ***
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 9d9fc886d6..3c677160c5 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -600,3 +600,133 @@ GEN_VEXT_TRANS(vleff_v, 3, r2nfvm, ldff_op, ld_us_check)
 GEN_VEXT_TRANS(vlbuff_v, 4, r2nfvm, ldff_op, ld_us_check)
 GEN_VEXT_TRANS(vlhuff_v, 5, r2nfvm, ldff_op, ld_us_check)
 GEN_VEXT_TRANS(vlwuff_v, 6, r2nfvm, ldff_op, ld_us_check)
+
+/*
+ *** vector atomic operation
+ */
+typedef void gen_helper_amo(TCGv_ptr, TCGv_ptr, TCGv, TCGv_ptr,
+        TCGv_env, TCGv_i32);
+
+static bool amo_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
+        uint32_t data, gen_helper_amo *fn, DisasContext *s)
+{
+    TCGv_ptr dest, mask, index;
+    TCGv base;
+    TCGv_i32 desc;
+
+    dest = tcg_temp_new_ptr();
+    mask = tcg_temp_new_ptr();
+    index = tcg_temp_new_ptr();
+    base = tcg_temp_new();
+    desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
+
+    gen_get_gpr(base, rs1);
+    tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
+    tcg_gen_addi_ptr(index, cpu_env, vreg_ofs(s, vs2));
+    tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
+
+    fn(dest, mask, base, index, cpu_env, desc);
+
+    tcg_temp_free_ptr(dest);
+    tcg_temp_free_ptr(mask);
+    tcg_temp_free_ptr(index);
+    tcg_temp_free(base);
+    tcg_temp_free_i32(desc);
+    return true;
+}
+
+static bool amo_op(DisasContext *s, arg_rwdvm *a, uint8_t seq)
+{
+    uint32_t data = 0;
+    gen_helper_amo *fn;
+    static gen_helper_amo *const fnsw[9] = {
+        /* no atomic operation */
+        gen_helper_vamoswapw_v_w,
+        gen_helper_vamoaddw_v_w,
+        gen_helper_vamoxorw_v_w,
+        gen_helper_vamoandw_v_w,
+        gen_helper_vamoorw_v_w,
+        gen_helper_vamominw_v_w,
+        gen_helper_vamomaxw_v_w,
+        gen_helper_vamominuw_v_w,
+        gen_helper_vamomaxuw_v_w
+    };
+#ifdef TARGET_RISCV64
+    static gen_helper_amo *const fnsd[18] = {
+        gen_helper_vamoswapw_v_d,
+        gen_helper_vamoaddw_v_d,
+        gen_helper_vamoxorw_v_d,
+        gen_helper_vamoandw_v_d,
+        gen_helper_vamoorw_v_d,
+        gen_helper_vamominw_v_d,
+        gen_helper_vamomaxw_v_d,
+        gen_helper_vamominuw_v_d,
+        gen_helper_vamomaxuw_v_d,
+        gen_helper_vamoswapd_v_d,
+        gen_helper_vamoaddd_v_d,
+        gen_helper_vamoxord_v_d,
+        gen_helper_vamoandd_v_d,
+        gen_helper_vamoord_v_d,
+        gen_helper_vamomind_v_d,
+        gen_helper_vamomaxd_v_d,
+        gen_helper_vamominud_v_d,
+        gen_helper_vamomaxud_v_d
+    };
+#endif
+
+    if (tb_cflags(s->base.tb) & CF_PARALLEL) {
+        gen_helper_exit_atomic(cpu_env);
+        s->base.is_jmp = DISAS_NORETURN;
+        return true;
+    } else {
+        fn = fnsw[seq];
+#ifdef TARGET_RISCV64
+        if (s->sew == 3) {
+            fn = fnsd[seq];
+        }
+#endif
+    }
+
+    data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
+    data = FIELD_DP32(data, VDATA, VM, a->vm);
+    data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
+    data = FIELD_DP32(data, VDATA, WD, a->wd);
+    return amo_trans(a->rd, a->rs1, a->rs2, data, fn, s);
+}
+/*
+ * There are two rules check here.
+ *
+ * 1. SEW must be at least as wide as the AMO memory element size.
+ *
+ * 2. If SEW is greater than XLEN, an illegal instruction exception is raised.
+ */
+static bool amo_check(DisasContext *s, arg_rwdvm* a)
+{
+    return (vext_check_isa_ill(s, RVV | RVA) &&
+            (!a->wd || vext_check_overlap_mask(s, a->rd, a->vm, false)) &&
+            vext_check_reg(s, a->rd, false) &&
+            vext_check_reg(s, a->rs2, false) &&
+            ((1 << s->sew) <= sizeof(target_ulong)) &&
+            ((1 << s->sew) >= 4));
+}
+
+GEN_VEXT_TRANS(vamoswapw_v, 0, rwdvm, amo_op, amo_check)
+GEN_VEXT_TRANS(vamoaddw_v, 1, rwdvm, amo_op, amo_check)
+GEN_VEXT_TRANS(vamoxorw_v, 2, rwdvm, amo_op, amo_check)
+GEN_VEXT_TRANS(vamoandw_v, 3, rwdvm, amo_op, amo_check)
+GEN_VEXT_TRANS(vamoorw_v, 4, rwdvm, amo_op, amo_check)
+GEN_VEXT_TRANS(vamominw_v, 5, rwdvm, amo_op, amo_check)
+GEN_VEXT_TRANS(vamomaxw_v, 6, rwdvm, amo_op, amo_check)
+GEN_VEXT_TRANS(vamominuw_v, 7, rwdvm, amo_op, amo_check)
+GEN_VEXT_TRANS(vamomaxuw_v, 8, rwdvm, amo_op, amo_check)
+#ifdef TARGET_RISCV64
+GEN_VEXT_TRANS(vamoswapd_v, 9, rwdvm, amo_op, amo_check)
+GEN_VEXT_TRANS(vamoaddd_v, 10, rwdvm, amo_op, amo_check)
+GEN_VEXT_TRANS(vamoxord_v, 11, rwdvm, amo_op, amo_check)
+GEN_VEXT_TRANS(vamoandd_v, 12, rwdvm, amo_op, amo_check)
+GEN_VEXT_TRANS(vamoord_v, 13, rwdvm, amo_op, amo_check)
+GEN_VEXT_TRANS(vamomind_v, 14, rwdvm, amo_op, amo_check)
+GEN_VEXT_TRANS(vamomaxd_v, 15, rwdvm, amo_op, amo_check)
+GEN_VEXT_TRANS(vamominud_v, 16, rwdvm, amo_op, amo_check)
+GEN_VEXT_TRANS(vamomaxud_v, 17, rwdvm, amo_op, amo_check)
+#endif
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 3841301b74..f9b409b169 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -94,6 +94,11 @@ static inline uint32_t vext_lmul(uint32_t desc)
     return FIELD_EX32(simd_data(desc), VDATA, LMUL);
 }
 
+static uint32_t vext_wd(uint32_t desc)
+{
+    return (simd_data(desc) >> 11) & 0x1;
+}
+
 /*
  * Get vector group length in bytes. Its range is [64, 2048].
  *
@@ -685,3 +690,141 @@ GEN_VEXT_LDFF(vlhuff_v_w, uint16_t, uint32_t, MO_LEUW, ldhu_w, clearl)
 GEN_VEXT_LDFF(vlhuff_v_d, uint16_t, uint64_t, MO_LEUW, ldhu_d, clearq)
 GEN_VEXT_LDFF(vlwuff_v_w, uint32_t, uint32_t, MO_LEUL, ldwu_w, clearl)
 GEN_VEXT_LDFF(vlwuff_v_d, uint32_t, uint64_t, MO_LEUL, ldwu_d, clearq)
+
+/*
+ *** Vector AMO Operations (Zvamo)
+ */
+typedef void (*vext_amo_noatomic_fn)(void *vs3, target_ulong addr,
+        uint32_t wd, uint32_t idx, CPURISCVState *env, uintptr_t retaddr);
+
+/* no atomic opreation for vector atomic insructions */
+#define DO_SWAP(N, M) (M)
+#define DO_AND(N, M)  (N & M)
+#define DO_XOR(N, M)  (N ^ M)
+#define DO_OR(N, M)   (N | M)
+#define DO_ADD(N, M)  (N + M)
+
+#define GEN_VEXT_AMO_NOATOMIC_OP(NAME, ESZ, MSZ, H, DO_OP, SUF) \
+static void vext_##NAME##_noatomic_op(void *vs3,                \
+            target_ulong addr, uint32_t wd, uint32_t idx,       \
+                CPURISCVState *env, uintptr_t retaddr)          \
+{                                                               \
+    typedef int##ESZ##_t ETYPE;                                 \
+    typedef int##MSZ##_t MTYPE;                                 \
+    typedef uint##MSZ##_t UMTYPE __attribute__((unused));       \
+    ETYPE *pe3 = (ETYPE *)vs3 + H(idx);                         \
+    MTYPE a = *pe3, b = cpu_ld##SUF##_data(env, addr);          \
+    a = DO_OP(a, b);                                            \
+    cpu_st##SUF##_data(env, addr, a);                           \
+    if (wd) {                                                   \
+        *pe3 = a;                                               \
+    }                                                           \
+}
+
+/* Signed min/max */
+#define DO_MAX(N, M)  ((N) >= (M) ? (N) : (M))
+#define DO_MIN(N, M)  ((N) >= (M) ? (M) : (N))
+
+/* Unsigned min/max */
+#define DO_MAXU(N, M) DO_MAX((UMTYPE)N, (UMTYPE)M)
+#define DO_MINU(N, M) DO_MIN((UMTYPE)N, (UMTYPE)M)
+
+GEN_VEXT_AMO_NOATOMIC_OP(vamoswapw_v_w, 32, 32, H4, DO_SWAP, l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoaddw_v_w,  32, 32, H4, DO_ADD,  l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoxorw_v_w,  32, 32, H4, DO_XOR,  l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoandw_v_w,  32, 32, H4, DO_AND,  l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoorw_v_w,   32, 32, H4, DO_OR,   l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamominw_v_w,  32, 32, H4, DO_MIN,  l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamomaxw_v_w,  32, 32, H4, DO_MAX,  l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamominuw_v_w, 32, 32, H4, DO_MINU, l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamomaxuw_v_w, 32, 32, H4, DO_MAXU, l)
+#ifdef TARGET_RISCV64
+GEN_VEXT_AMO_NOATOMIC_OP(vamoswapw_v_d, 64, 32, H8, DO_SWAP, l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoswapd_v_d, 64, 64, H8, DO_SWAP, q)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoaddw_v_d,  64, 32, H8, DO_ADD,  l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoaddd_v_d,  64, 64, H8, DO_ADD,  q)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoxorw_v_d,  64, 32, H8, DO_XOR,  l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoxord_v_d,  64, 64, H8, DO_XOR,  q)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoandw_v_d,  64, 32, H8, DO_AND,  l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoandd_v_d,  64, 64, H8, DO_AND,  q)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoorw_v_d,   64, 32, H8, DO_OR,   l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamoord_v_d,   64, 64, H8, DO_OR,   q)
+GEN_VEXT_AMO_NOATOMIC_OP(vamominw_v_d,  64, 32, H8, DO_MIN,  l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamomind_v_d,  64, 64, H8, DO_MIN,  q)
+GEN_VEXT_AMO_NOATOMIC_OP(vamomaxw_v_d,  64, 32, H8, DO_MAX,  l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamomaxd_v_d,  64, 64, H8, DO_MAX,  q)
+GEN_VEXT_AMO_NOATOMIC_OP(vamominuw_v_d, 64, 32, H8, DO_MINU, l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamominud_v_d, 64, 64, H8, DO_MINU, q)
+GEN_VEXT_AMO_NOATOMIC_OP(vamomaxuw_v_d, 64, 32, H8, DO_MAXU, l)
+GEN_VEXT_AMO_NOATOMIC_OP(vamomaxud_v_d, 64, 64, H8, DO_MAXU, q)
+#endif
+
+static inline void vext_amo_noatomic(void *vs3, void *v0, target_ulong base,
+        void *vs2, CPURISCVState *env, uint32_t desc,
+        vext_get_index_addr get_index_addr,
+        vext_amo_noatomic_fn noatomic_op,
+        vext_ld_clear_elem clear_elem,
+        uint32_t esz, uint32_t msz, uintptr_t ra)
+{
+    uint32_t i;
+    target_long addr;
+    uint32_t wd = vext_wd(desc);
+    uint32_t vm = vext_vm(desc);
+    uint32_t mlen = vext_mlen(desc);
+    uint32_t vlmax = vext_maxsz(desc) / esz;
+
+    for (i = 0; i < env->vl; i++) {
+        if (!vm && !vext_elem_mask(v0, mlen, i)) {
+            continue;
+        }
+        probe_pages(env, get_index_addr(base, i, vs2), msz, ra, MMU_DATA_LOAD);
+        probe_pages(env, get_index_addr(base, i, vs2), msz, ra, MMU_DATA_STORE);
+    }
+    for (i = 0; i < env->vl; i++) {
+        if (!vm && !vext_elem_mask(v0, mlen, i)) {
+            continue;
+        }
+        addr = get_index_addr(base, i, vs2);
+        noatomic_op(vs3, addr, wd, i, env, ra);
+    }
+    clear_elem(vs3, env->vl, env->vl * esz, vlmax * esz);
+}
+
+#define GEN_VEXT_AMO(NAME, MTYPE, ETYPE, INDEX_FN, CLEAR_FN)    \
+void HELPER(NAME)(void *vs3, void *v0, target_ulong base,       \
+        void *vs2, CPURISCVState *env, uint32_t desc)           \
+{                                                               \
+    vext_amo_noatomic(vs3, v0, base, vs2, env, desc,            \
+        INDEX_FN, vext_##NAME##_noatomic_op, CLEAR_FN,          \
+        sizeof(ETYPE), sizeof(MTYPE), GETPC());                 \
+}
+
+#ifdef TARGET_RISCV64
+GEN_VEXT_AMO(vamoswapw_v_d, int32_t,  int64_t,  idx_d, clearq)
+GEN_VEXT_AMO(vamoswapd_v_d, int64_t,  int64_t,  idx_d, clearq)
+GEN_VEXT_AMO(vamoaddw_v_d,  int32_t,  int64_t,  idx_d, clearq)
+GEN_VEXT_AMO(vamoaddd_v_d,  int64_t,  int64_t,  idx_d, clearq)
+GEN_VEXT_AMO(vamoxorw_v_d,  int32_t,  int64_t,  idx_d, clearq)
+GEN_VEXT_AMO(vamoxord_v_d,  int64_t,  int64_t,  idx_d, clearq)
+GEN_VEXT_AMO(vamoandw_v_d,  int32_t,  int64_t,  idx_d, clearq)
+GEN_VEXT_AMO(vamoandd_v_d,  int64_t,  int64_t,  idx_d, clearq)
+GEN_VEXT_AMO(vamoorw_v_d,   int32_t,  int64_t,  idx_d, clearq)
+GEN_VEXT_AMO(vamoord_v_d,   int64_t,  int64_t,  idx_d, clearq)
+GEN_VEXT_AMO(vamominw_v_d,  int32_t,  int64_t,  idx_d, clearq)
+GEN_VEXT_AMO(vamomind_v_d,  int64_t,  int64_t,  idx_d, clearq)
+GEN_VEXT_AMO(vamomaxw_v_d,  int32_t,  int64_t,  idx_d, clearq)
+GEN_VEXT_AMO(vamomaxd_v_d,  int64_t,  int64_t,  idx_d, clearq)
+GEN_VEXT_AMO(vamominuw_v_d, uint32_t, uint64_t, idx_d, clearq)
+GEN_VEXT_AMO(vamominud_v_d, uint64_t, uint64_t, idx_d, clearq)
+GEN_VEXT_AMO(vamomaxuw_v_d, uint32_t, uint64_t, idx_d, clearq)
+GEN_VEXT_AMO(vamomaxud_v_d, uint64_t, uint64_t, idx_d, clearq)
+#endif
+GEN_VEXT_AMO(vamoswapw_v_w, int32_t,  int32_t,  idx_w, clearl)
+GEN_VEXT_AMO(vamoaddw_v_w,  int32_t,  int32_t,  idx_w, clearl)
+GEN_VEXT_AMO(vamoxorw_v_w,  int32_t,  int32_t,  idx_w, clearl)
+GEN_VEXT_AMO(vamoandw_v_w,  int32_t,  int32_t,  idx_w, clearl)
+GEN_VEXT_AMO(vamoorw_v_w,   int32_t,  int32_t,  idx_w, clearl)
+GEN_VEXT_AMO(vamominw_v_w,  int32_t,  int32_t,  idx_w, clearl)
+GEN_VEXT_AMO(vamomaxw_v_w,  int32_t,  int32_t,  idx_w, clearl)
+GEN_VEXT_AMO(vamominuw_v_w, uint32_t, uint32_t, idx_w, clearl)
+GEN_VEXT_AMO(vamomaxuw_v_w, uint32_t, uint32_t, idx_w, clearl)
-- 
2.23.0


