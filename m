Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6ADC6E8C60
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 10:12:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppPM2-0000E0-Rq; Thu, 20 Apr 2023 04:09:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1ppPLy-0008QZ-UU
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 04:09:19 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1ppPLY-0008Pu-T4
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 04:09:18 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8DxXNrK8kBkkmUfAA--.37684S3;
 Thu, 20 Apr 2023 16:07:38 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cxur2u8kBkdNUwAA--.59556S43; 
 Thu, 20 Apr 2023 16:07:38 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	gaosong@loongson.cn
Subject: [RFC PATCH v3 41/44] target/loongarch: Implement vld vst
Date: Thu, 20 Apr 2023 16:07:06 +0800
Message-Id: <20230420080709.3352575-42-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230420080709.3352575-1-gaosong@loongson.cn>
References: <20230420080709.3352575-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxur2u8kBkdNUwAA--.59556S43
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3JFy8GrWfWr1kAr43ZF4fKrg_yoWDGw1fpF
 1jyryUCr48Jr9rXFyIkw15Cr15Zr47C3W2g3s3tws5ZF4UXFnrXF18t3yj9FWUXF4kXrW8
 tFsrCFyjgrZ3Jw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bnxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE
 44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFVCjc4
 AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIE
 Y20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
 80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0
 I7IYx2IY67AKxVWDJVCq3wCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42
 xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY
 1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRE6wZ7UUUUU==
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
 target/loongarch/insn_trans/trans_lsx.c.inc | 155 ++++++++++++++++++++
 target/loongarch/insns.decode               |  36 +++++
 target/loongarch/lsx_helper.c               |   1 +
 target/loongarch/translate.c                |  10 ++
 5 files changed, 236 insertions(+)

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
index 14f3a85ead..9698834cc4 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -4096,3 +4096,158 @@ TRANS(vextrins_b, gen_vv_i, gen_helper_vextrins_b)
 TRANS(vextrins_h, gen_vv_i, gen_helper_vextrins_h)
 TRANS(vextrins_w, gen_vv_i, gen_helper_vextrins_w)
 TRANS(vextrins_d, gen_vv_i, gen_helper_vextrins_d)
+
+#include "tcg/tcg-internal.h"
+
+static bool trans_vld(DisasContext *ctx, arg_vr_i *a)
+{
+    TCGv addr, temp;
+    TCGv_i128 val;
+
+    CHECK_SXE;
+
+    addr = gpr_src(ctx, a->rj, EXT_NONE);
+    val = tcg_temp_new_i128();
+
+    if (a->imm) {
+        temp = tcg_temp_new();
+        tcg_gen_addi_tl(temp, addr, a->imm);
+        addr = temp;
+    }
+
+    tcg_gen_qemu_ld_i128(val, addr, ctx->mem_idx, MO_128);
+    set_vreg64(TCGV128_HIGH(val), a->vd, 1);
+    set_vreg64(TCGV128_LOW(val), a->vd, 0);
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
+    tcg_gen_mov_i64(TCGV128_LOW(val), al);
+    tcg_gen_mov_i64(TCGV128_HIGH(val), ah);
+    tcg_gen_qemu_st_i128(val, addr, ctx->mem_idx, MO_128);
+
+    return true;
+}
+
+static bool trans_vldx(DisasContext *ctx, arg_vrr *a)
+{
+    TCGv addr, src1, src2;
+    TCGv_i128 val;
+
+    CHECK_SXE;
+
+    addr = tcg_temp_new();
+    src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    src2 = gpr_src(ctx, a->rk, EXT_NONE);
+    val = tcg_temp_new_i128();
+
+    tcg_gen_add_tl(addr, src1, src2);
+    tcg_gen_qemu_ld_i128(val, addr, ctx->mem_idx, MO_128);
+    set_vreg64(TCGV128_HIGH(val), a->vd, 1);
+    set_vreg64(TCGV128_LOW(val), a->vd, 0);
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
+    tcg_gen_mov_i64(TCGV128_LOW(val), al);
+    tcg_gen_mov_i64(TCGV128_HIGH(val), ah);
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
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index 707254b689..46049ec8e8 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -12,6 +12,7 @@
 #include "fpu/softfloat.h"
 #include "internals.h"
 #include "tcg/tcg.h"
+#include "tcg/tcg-ldst.h"
 
 #define DO_ADD(a, b)  (a + b)
 #define DO_SUB(a, b)  (a - b)
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 84a97031e6..e47151ec03 100644
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


