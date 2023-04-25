Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A947A6EDC19
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:04:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prCiP-0001Z0-Iz; Tue, 25 Apr 2023 03:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1prCiI-0001XS-MM
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:03:46 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1prCiG-0008I8-0B
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:03:46 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Ax1ehDe0dkxl8AAA--.691S3;
 Tue, 25 Apr 2023 15:03:31 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cxeb0Ye0dk3Eo6AA--.4591S43; 
 Tue, 25 Apr 2023 15:03:29 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	gaosong@loongson.cn
Subject: [RFC PATCH v4 41/44] target/loongarch: Implement vld vst
Date: Tue, 25 Apr 2023 15:02:45 +0800
Message-Id: <20230425070248.2550028-42-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230425070248.2550028-1-gaosong@loongson.cn>
References: <20230425070248.2550028-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxeb0Ye0dk3Eo6AA--.4591S43
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3JFy8GrWfWr1kAr43ZF4fKrg_yoWftF4rpF
 1qyryUur48Jr17XFyIyw15Cr15Zr47C3W2g3s3tw4rZFWUJFnrXF18trWjvFWUXF4kXFW8
 tFsrCFyUWrWfJwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bexFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aV
 CY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x2
 6I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWrMcvjeVCFs4
 IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AG
 Y7Cv6cx26rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
 026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF
 0xvE2Ix0cI8IcVAFwI0_tr0E3s1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42
 IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2
 jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0zRVWlkUUUUU=
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patch includes:
- VLD[X], VST[X];
- VLDREPL.{B/H/W/D};
- VSTELM.{B/H/W/D}.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  34 +++++
 target/loongarch/insn_trans/trans_lsx.c.inc | 159 ++++++++++++++++++++
 target/loongarch/insns.decode               |  36 +++++
 target/loongarch/translate.c                |  10 ++
 4 files changed, 239 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 0b62bbb8be..8627908fc9 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -21,11 +21,21 @@ static inline int plus_1(DisasContext *ctx, int x)
     return x + 1;
 }
 
+static inline int shl_1(DisasContext *ctx, int x)
+{
+    return x << 1;
+}
+
 static inline int shl_2(DisasContext *ctx, int x)
 {
     return x << 2;
 }
 
+static inline int shl_3(DisasContext *ctx, int x)
+{
+    return x << 3;
+}
+
 #define CSR_NAME(REG) \
     [LOONGARCH_CSR_##REG] = (#REG)
 
@@ -823,6 +833,11 @@ static void output_vr_i(DisasContext *ctx, arg_vr_i *a, const char *mnemonic)
     output(ctx, mnemonic, "v%d, r%d, 0x%x", a->vd, a->rj, a->imm);
 }
 
+static void output_vr_ii(DisasContext *ctx, arg_vr_ii *a, const char *mnemonic)
+{
+    output(ctx, mnemonic, "v%d, r%d, 0x%x, 0x%x", a->vd, a->rj, a->imm, a->imm2);
+}
+
 static void output_rv_i(DisasContext *ctx, arg_rv_i *a, const char *mnemonic)
 {
     output(ctx, mnemonic, "r%d, v%d, 0x%x", a->rd, a->vj,  a->imm);
@@ -838,6 +853,11 @@ static void output_vvr(DisasContext *ctx, arg_vvr *a, const char *mnemonic)
     output(ctx, mnemonic, "v%d, v%d, r%d", a->vd, a->vj, a->rk);
 }
 
+static void output_vrr(DisasContext *ctx, arg_vrr *a, const char *mnemonic)
+{
+    output(ctx, mnemonic, "v%d, r%d, r%d", a->vd, a->rj, a->rk);
+}
+
 INSN_LSX(vadd_b,           vvv)
 INSN_LSX(vadd_h,           vvv)
 INSN_LSX(vadd_w,           vvv)
@@ -1654,3 +1674,17 @@ INSN_LSX(vextrins_d,       vv_i)
 INSN_LSX(vextrins_w,       vv_i)
 INSN_LSX(vextrins_h,       vv_i)
 INSN_LSX(vextrins_b,       vv_i)
+
+INSN_LSX(vld,              vr_i)
+INSN_LSX(vst,              vr_i)
+INSN_LSX(vldx,             vrr)
+INSN_LSX(vstx,             vrr)
+
+INSN_LSX(vldrepl_d,        vr_i)
+INSN_LSX(vldrepl_w,        vr_i)
+INSN_LSX(vldrepl_h,        vr_i)
+INSN_LSX(vldrepl_b,        vr_i)
+INSN_LSX(vstelm_d,         vr_ii)
+INSN_LSX(vstelm_w,         vr_ii)
+INSN_LSX(vstelm_h,         vr_ii)
+INSN_LSX(vstelm_b,         vr_ii)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index e1eee6bc4c..6bf9656c2c 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -4102,3 +4102,162 @@ TRANS(vextrins_b, gen_vv_i, gen_helper_vextrins_b)
 TRANS(vextrins_h, gen_vv_i, gen_helper_vextrins_h)
 TRANS(vextrins_w, gen_vv_i, gen_helper_vextrins_w)
 TRANS(vextrins_d, gen_vv_i, gen_helper_vextrins_d)
+
+static bool trans_vld(DisasContext *ctx, arg_vr_i *a)
+{
+    TCGv addr, temp;
+    TCGv_i64 rl, rh;
+    TCGv_i128 val;
+
+    CHECK_SXE;
+
+    addr = gpr_src(ctx, a->rj, EXT_NONE);
+    val = tcg_temp_new_i128();
+    rl = tcg_temp_new_i64();
+    rh = tcg_temp_new_i64();
+
+    if (a->imm) {
+        temp = tcg_temp_new();
+        tcg_gen_addi_tl(temp, addr, a->imm);
+        addr = temp;
+    }
+
+    tcg_gen_qemu_ld_i128(val, addr, ctx->mem_idx, MO_128);
+    tcg_gen_extr_i128_i64(rl, rh, val);
+    set_vreg64(rh, a->vd, 1);
+    set_vreg64(rl, a->vd, 0);
+
+    return true;
+}
+
+static bool trans_vst(DisasContext *ctx, arg_vr_i *a)
+{
+    TCGv addr, temp;
+    TCGv_i128 val;
+    TCGv_i64 ah, al;
+
+    CHECK_SXE;
+
+    addr = gpr_src(ctx, a->rj, EXT_NONE);
+    val = tcg_temp_new_i128();
+    ah = tcg_temp_new_i64();
+    al = tcg_temp_new_i64();
+
+    if (a->imm) {
+        temp = tcg_temp_new();
+        tcg_gen_addi_tl(temp, addr, a->imm);
+        addr = temp;
+    }
+
+    get_vreg64(ah, a->vd, 1);
+    get_vreg64(al, a->vd, 0);
+    tcg_gen_concat_i64_i128(val, al, ah);
+    tcg_gen_qemu_st_i128(val, addr, ctx->mem_idx, MO_128);
+
+    return true;
+}
+
+static bool trans_vldx(DisasContext *ctx, arg_vrr *a)
+{
+    TCGv addr, src1, src2;
+    TCGv_i64 rl, rh;
+    TCGv_i128 val;
+
+    CHECK_SXE;
+
+    addr = tcg_temp_new();
+    src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    src2 = gpr_src(ctx, a->rk, EXT_NONE);
+    val = tcg_temp_new_i128();
+    rl = tcg_temp_new_i64();
+    rh = tcg_temp_new_i64();
+
+    tcg_gen_add_tl(addr, src1, src2);
+    tcg_gen_qemu_ld_i128(val, addr, ctx->mem_idx, MO_128);
+    tcg_gen_extr_i128_i64(rl, rh, val);
+    set_vreg64(rh, a->vd, 1);
+    set_vreg64(rl, a->vd, 0);
+
+    return true;
+}
+
+static bool trans_vstx(DisasContext *ctx, arg_vrr *a)
+{
+    TCGv addr, src1, src2;
+    TCGv_i64 ah, al;
+    TCGv_i128 val;
+
+    CHECK_SXE;
+
+    addr = tcg_temp_new();
+    src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    src2 = gpr_src(ctx, a->rk, EXT_NONE);
+    val = tcg_temp_new_i128();
+    ah = tcg_temp_new_i64();
+    al = tcg_temp_new_i64();
+
+    tcg_gen_add_tl(addr, src1, src2);
+    get_vreg64(ah, a->vd, 1);
+    get_vreg64(al, a->vd, 0);
+    tcg_gen_concat_i64_i128(val, al, ah);
+    tcg_gen_qemu_st_i128(val, addr, ctx->mem_idx, MO_128);
+
+    return true;
+}
+
+#define VLDREPL(NAME, MO)                                                 \
+static bool trans_## NAME (DisasContext *ctx, arg_vr_i *a)                \
+{                                                                         \
+    TCGv addr, temp;                                                      \
+    TCGv_i64 val;                                                         \
+                                                                          \
+    CHECK_SXE;                                                            \
+                                                                          \
+    addr = gpr_src(ctx, a->rj, EXT_NONE);                                 \
+    val = tcg_temp_new_i64();                                             \
+                                                                          \
+    if (a->imm) {                                                         \
+        temp = tcg_temp_new();                                            \
+        tcg_gen_addi_tl(temp, addr, a->imm);                              \
+        addr = temp;                                                      \
+    }                                                                     \
+                                                                          \
+    tcg_gen_qemu_ld_i64(val, addr, ctx->mem_idx, MO);                     \
+    tcg_gen_gvec_dup_i64(MO, vec_full_offset(a->vd), 16, ctx->vl/8, val); \
+                                                                          \
+    return true;                                                          \
+}
+
+VLDREPL(vldrepl_b, MO_8)
+VLDREPL(vldrepl_h, MO_16)
+VLDREPL(vldrepl_w, MO_32)
+VLDREPL(vldrepl_d, MO_64)
+
+#define VSTELM(NAME, MO, E)                                                  \
+static bool trans_## NAME (DisasContext *ctx, arg_vr_ii *a)                  \
+{                                                                            \
+    TCGv addr, temp;                                                         \
+    TCGv_i64 val;                                                            \
+                                                                             \
+    CHECK_SXE;                                                               \
+                                                                             \
+    addr = gpr_src(ctx, a->rj, EXT_NONE);                                    \
+    val = tcg_temp_new_i64();                                                \
+                                                                             \
+    if (a->imm) {                                                            \
+        temp = tcg_temp_new();                                               \
+        tcg_gen_addi_tl(temp, addr, a->imm);                                 \
+        addr = temp;                                                         \
+    }                                                                        \
+                                                                             \
+    tcg_gen_ld_i64(val, cpu_env,                                             \
+                   offsetof(CPULoongArchState, fpr[a->vd].vreg.E(a->imm2))); \
+    tcg_gen_qemu_st_i64(val, addr, ctx->mem_idx, MO);                        \
+                                                                             \
+    return true;                                                             \
+}
+
+VSTELM(vstelm_b, MO_8, B)
+VSTELM(vstelm_h, MO_16, H)
+VSTELM(vstelm_w, MO_32, W)
+VSTELM(vstelm_d, MO_64, D)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 0263bce28e..ea6eedb7a9 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -486,6 +486,17 @@ ertn             0000 01100100 10000 01110 00000 00000    @empty
 idle             0000 01100100 10001 ...............      @i15
 dbcl             0000 00000010 10101 ...............      @i15
 
+#
+# LSX Fields
+#
+
+%i9s3     10:s9       !function=shl_3
+%i10s2    10:s10      !function=shl_2
+%i11s1    10:s11      !function=shl_1
+%i8s3     10:s8       !function=shl_3
+%i8s2     10:s8       !function=shl_2
+%i8s1     10:s8       !function=shl_1
+
 #
 # LSX Argument sets
 #
@@ -500,6 +511,8 @@ dbcl             0000 00000010 10101 ...............      @i15
 &rv_i         rd vj imm
 &vr           vd rj
 &vvr          vd vj rk
+&vrr          vd rj rk
+&vr_ii        vd rj imm imm2
 
 #
 # LSX Formats
@@ -528,6 +541,15 @@ dbcl             0000 00000010 10101 ...............      @i15
 @rv_ui1      .... ........ ..... .... imm:1 vj:5 rd:5    &rv_i
 @vr               .... ........ ..... ..... rj:5 vd:5    &vr
 @vvr               .... ........ ..... rk:5 vj:5 vd:5    &vvr
+@vr_i9            .... ........ . ......... rj:5 vd:5    &vr_i imm=%i9s3
+@vr_i10            .... ........ .......... rj:5 vd:5    &vr_i imm=%i10s2
+@vr_i11            .... ....... ........... rj:5 vd:5    &vr_i imm=%i11s1
+@vr_i12                 .... ...... imm:s12 rj:5 vd:5    &vr_i
+@vr_i8i1    .... ........ . imm2:1 ........ rj:5 vd:5    &vr_ii imm=%i8s3
+@vr_i8i2      .... ........ imm2:2 ........ rj:5 vd:5    &vr_ii imm=%i8s2
+@vr_i8i3       .... ....... imm2:3 ........ rj:5 vd:5    &vr_ii imm=%i8s1
+@vr_i8i4          .... ...... imm2:4 imm:s8 rj:5 vd:5    &vr_ii
+@vrr               .... ........ ..... rk:5 rj:5 vd:5    &vrr
 
 vadd_b           0111 00000000 10100 ..... ..... .....    @vvv
 vadd_h           0111 00000000 10101 ..... ..... .....    @vvv
@@ -1256,3 +1278,17 @@ vextrins_d       0111 00111000 00 ........ ..... .....    @vv_ui8
 vextrins_w       0111 00111000 01 ........ ..... .....    @vv_ui8
 vextrins_h       0111 00111000 10 ........ ..... .....    @vv_ui8
 vextrins_b       0111 00111000 11 ........ ..... .....    @vv_ui8
+
+vld              0010 110000 ............ ..... .....     @vr_i12
+vst              0010 110001 ............ ..... .....     @vr_i12
+vldx             0011 10000100 00000 ..... ..... .....    @vrr
+vstx             0011 10000100 01000 ..... ..... .....    @vrr
+
+vldrepl_d        0011 00000001 0 ......... ..... .....    @vr_i9
+vldrepl_w        0011 00000010 .......... ..... .....     @vr_i10
+vldrepl_h        0011 0000010 ........... ..... .....     @vr_i11
+vldrepl_b        0011 000010 ............ ..... .....     @vr_i12
+vstelm_d         0011 00010001 0 . ........ ..... .....   @vr_i8i1
+vstelm_w         0011 00010010 .. ........ ..... .....    @vr_i8i2
+vstelm_h         0011 0001010 ... ........ ..... .....    @vr_i8i3
+vstelm_b         0011 000110 .... ........ ..... .....    @vr_i8i4
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 862847afb3..c04ed7592b 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -53,11 +53,21 @@ static inline int plus_1(DisasContext *ctx, int x)
     return x + 1;
 }
 
+static inline int shl_1(DisasContext *ctx, int x)
+{
+    return x << 1;
+}
+
 static inline int shl_2(DisasContext *ctx, int x)
 {
     return x << 2;
 }
 
+static inline int shl_3(DisasContext *ctx, int x)
+{
+    return x << 3;
+}
+
 /*
  * LoongArch the upper 32 bits are undefined ("can be any value").
  * QEMU chooses to nanbox, because it is most likely to show guest bugs early.
-- 
2.31.1


