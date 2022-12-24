Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17908655945
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 09:29:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8zjE-0006aQ-9l; Sat, 24 Dec 2022 03:18:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1p8ziU-0006D7-2u
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:17:19 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1p8ziQ-0001nm-2N
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:17:12 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Axz+t4taZjZ0kIAA--.18546S3;
 Sat, 24 Dec 2022 16:16:56 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxPuRhtaZjuccKAA--.38440S44; 
 Sat, 24 Dec 2022 16:16:55 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH 42/43] target/loongarch: Implement vld vst
Date: Sat, 24 Dec 2022 16:16:32 +0800
Message-Id: <20221224081633.4185445-43-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221224081633.4185445-1-gaosong@loongson.cn>
References: <20221224081633.4185445-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxPuRhtaZjuccKAA--.38440S44
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvAXoW3tw1rGrW5Ww4DAryrWF1kuFg_yoW8Ar1Dto
 W8J3WUJa18Gw1FyryDCw1DXF42q34Fy397Jr9xuw1vgay8Ary7KryUKw1kAa18Kry8KFyf
 Cwn2yFn8XF45ZF9rn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXasCq-sGcSsGvf
 J3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnRJU
 UUqG1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64
 kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY
 1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aV
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 target/loongarch/disas.c                    |  34 +++
 target/loongarch/helper.h                   |  12 +
 target/loongarch/insn_trans/trans_lsx.c.inc |  75 ++++++
 target/loongarch/insns.decode               |  36 +++
 target/loongarch/lsx_helper.c               | 266 ++++++++++++++++++++
 target/loongarch/translate.c                |  10 +
 6 files changed, 433 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index ee92029007..e8dc0644bb 100644
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
 
@@ -794,6 +804,11 @@ static void output_vr_i(DisasContext *ctx, arg_vr_i *a, const char *mnemonic)
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
@@ -809,6 +824,11 @@ static void output_vvr(DisasContext *ctx, arg_vvr *a, const char *mnemonic)
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
@@ -1625,3 +1645,17 @@ INSN_LSX(vextrins_d,       vv_i)
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
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index b0fb82c60e..a92bcfffe8 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -864,3 +864,15 @@ DEF_HELPER_4(vextrins_b, void, env, i32, i32, i32)
 DEF_HELPER_4(vextrins_h, void, env, i32, i32, i32)
 DEF_HELPER_4(vextrins_w, void, env, i32, i32, i32)
 DEF_HELPER_4(vextrins_d, void, env, i32, i32, i32)
+
+DEF_HELPER_3(vld_b, void, env, i32, tl)
+DEF_HELPER_3(vst_b, void, env, i32, tl)
+
+DEF_HELPER_3(vldrepl_d, void, env, i32, tl)
+DEF_HELPER_3(vldrepl_w, void, env, i32, tl)
+DEF_HELPER_3(vldrepl_h, void, env, i32, tl)
+DEF_HELPER_3(vldrepl_b, void, env, i32, tl)
+DEF_HELPER_4(vstelm_d, void, env, i32, tl, i32)
+DEF_HELPER_4(vstelm_w, void, env, i32, tl, i32)
+DEF_HELPER_4(vstelm_h, void, env, i32, tl, i32)
+DEF_HELPER_4(vstelm_b, void, env, i32, tl, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index b289354dc3..308cba12f2 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -873,3 +873,78 @@ TRANS(vextrins_b, gen_vv_i, gen_helper_vextrins_b)
 TRANS(vextrins_h, gen_vv_i, gen_helper_vextrins_h)
 TRANS(vextrins_w, gen_vv_i, gen_helper_vextrins_w)
 TRANS(vextrins_d, gen_vv_i, gen_helper_vextrins_d)
+
+static bool gen_memory(DisasContext *ctx, arg_vr_i *a,
+                       void (*func)(TCGv_ptr, TCGv_i32, TCGv))
+{
+    TCGv_i32 vd = tcg_constant_i32(a->vd);
+    TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv temp = NULL;
+
+    CHECK_SXE;
+
+    if (a->imm) {
+        temp = tcg_temp_new();
+        tcg_gen_addi_tl(temp, addr, a->imm);
+        addr = temp;
+    }
+
+    func(cpu_env, vd, addr);
+    if (temp) {
+        tcg_temp_free(temp);
+    }
+    return true;
+}
+
+static bool gen_memory_x(DisasContext *ctx, arg_vrr *a,
+                    void (*func)(TCGv_ptr, TCGv_i32, TCGv))
+{
+    TCGv_i32 vd = tcg_constant_i32(a->vd);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+
+    CHECK_SXE;
+
+    TCGv addr = tcg_temp_new();
+    tcg_gen_add_tl(addr, src1, src2);
+    func(cpu_env, vd, addr);
+    tcg_temp_free(addr);
+    return true;
+}
+
+TRANS(vld, gen_memory, gen_helper_vld_b)
+TRANS(vst, gen_memory, gen_helper_vst_b)
+TRANS(vldx, gen_memory_x, gen_helper_vld_b)
+TRANS(vstx, gen_memory_x, gen_helper_vst_b)
+
+static bool gen_memory_elm(DisasContext *ctx, arg_vr_ii *a,
+                           void (*func)(TCGv_ptr, TCGv_i32, TCGv, TCGv_i32))
+{
+    TCGv_i32 vd = tcg_constant_i32(a->vd);
+    TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv_i32 tidx = tcg_constant_i32(a->imm2);
+    TCGv temp = NULL;
+
+    CHECK_SXE;
+
+    if (a->imm) {
+        temp = tcg_temp_new();
+        tcg_gen_addi_tl(temp, addr, a->imm);
+        addr = temp;
+    }
+
+    func(cpu_env, vd, addr, tidx);
+    if (temp) {
+        tcg_temp_free(temp);
+    }
+    return true;
+}
+
+TRANS(vldrepl_b, gen_memory, gen_helper_vldrepl_b)
+TRANS(vldrepl_h, gen_memory, gen_helper_vldrepl_h)
+TRANS(vldrepl_w, gen_memory, gen_helper_vldrepl_w)
+TRANS(vldrepl_d, gen_memory, gen_helper_vldrepl_d)
+TRANS(vstelm_b, gen_memory_elm, gen_helper_vstelm_b)
+TRANS(vstelm_h, gen_memory_elm, gen_helper_vstelm_h)
+TRANS(vstelm_w, gen_memory_elm, gen_helper_vstelm_w)
+TRANS(vstelm_d, gen_memory_elm, gen_helper_vstelm_d)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 67bce30d00..f786a9a9ee 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -485,6 +485,17 @@ ertn             0000 01100100 10000 01110 00000 00000    @empty
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
@@ -499,6 +510,8 @@ dbcl             0000 00000010 10101 ...............      @i15
 &rv_i         rd vj imm
 &vr           vd rj
 &vvr          vd vj rk
+&vrr          vd rj rk
+&vr_ii        vd rj imm imm2
 
 #
 # LSX Formats
@@ -527,6 +540,15 @@ dbcl             0000 00000010 10101 ...............      @i15
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
@@ -1255,3 +1277,17 @@ vextrins_d       0111 00111000 00 ........ ..... .....    @vv_ui8
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
index 3d478f96ce..9058230975 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -4973,3 +4973,269 @@ DO_HELPER_VV_I(vextrins_b, 8, helper_vextrins, do_vextrins)
 DO_HELPER_VV_I(vextrins_h, 16, helper_vextrins, do_vextrins)
 DO_HELPER_VV_I(vextrins_w, 32, helper_vextrins, do_vextrins)
 DO_HELPER_VV_I(vextrins_d, 64, helper_vextrins, do_vextrins)
+
+void helper_vld_b(CPULoongArchState *env, uint32_t vd, target_ulong addr)
+{
+    int i;
+    vec_t *Vd = &(env->fpr[vd].vec);
+#if !defined(CONFIG_USER_ONLY)
+    MemOpIdx oi = make_memop_idx(MO_TE | MO_UNALN, cpu_mmu_index(env, false));
+
+    for (i = 0; i < LSX_LEN/8; i++) {
+        Vd->B[i]  = helper_ret_ldub_mmu(env, addr + i, oi, GETPC());
+    }
+#else
+    for (i = 0; i < LSX_LEN/8; i++) {
+        Vd->B[i]  = cpu_ldub_data(env, addr + i);
+    }
+#endif
+}
+
+#define LSX_PAGESPAN(x) \
+        ((((x) & ~TARGET_PAGE_MASK) + LSX_LEN/8 - 1) >= TARGET_PAGE_SIZE)
+
+static inline void ensure_writable_pages(CPULoongArchState *env,
+                                         target_ulong addr,
+                                         int mmu_idx,
+                                         uintptr_t retaddr)
+{
+#ifndef CONFIG_USER_ONLY
+    /* FIXME: Probe the actual accesses (pass and use a size) */
+    if (unlikely(LSX_PAGESPAN(addr))) {
+        /* first page */
+        probe_write(env, addr, 0, mmu_idx, retaddr);
+        /* second page */
+        addr = (addr & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
+        probe_write(env, addr, 0, mmu_idx, retaddr);
+    }
+#endif
+}
+
+void helper_vst_b(CPULoongArchState *env, uint32_t vd, target_ulong addr)
+{
+    int i;
+    vec_t *Vd = &(env->fpr[vd].vec);
+    int mmu_idx = cpu_mmu_index(env, false);
+
+    ensure_writable_pages(env, addr, mmu_idx, GETPC());
+#if !defined(CONFIG_USER_ONLY)
+    MemOpIdx oi = make_memop_idx(MO_TE | MO_UNALN, mmu_idx);
+    for (i = 0; i < LSX_LEN/8; i++) {
+        helper_ret_stb_mmu(env, addr + i, Vd->B[i],  oi, GETPC());
+    }
+#else
+    for (i = 0; i < LSX_LEN/8; i++) {
+        cpu_stb_data(env, addr + i, Vd->B[i]);
+    }
+#endif
+}
+
+void helper_vldrepl_b(CPULoongArchState *env, uint32_t vd, target_ulong addr)
+{
+    vec_t *Vd = &(env->fpr[vd].vec);
+    uint8_t data;
+#if !defined(CONFIG_USER_ONLY)
+    MemOpIdx oi = make_memop_idx(MO_TE | MO_8 | MO_UNALN,
+                                 cpu_mmu_index(env, false));
+    data = helper_ret_ldub_mmu(env, add, oi, GETPC());
+#else
+    data = cpu_ldub_data(env, addr);
+#endif
+    int i;
+    for (i = 0; i < 16; i++) {
+        Vd->B[i] = data;
+    }
+}
+
+void helper_vldrepl_h(CPULoongArchState *env, uint32_t vd, target_ulong addr)
+{
+    vec_t *Vd = &(env->fpr[vd].vec);
+    uint16_t data;
+#if !defined(CONFIG_USER_ONLY)
+    MemOpIdx oi = make_memop_idx(MO_TE | MO_16 | MO_UNALN,
+                                 cpu_mmu_index(env, false));
+    data = helper_le_lduw_mmu(env, addr, oi, GETPC());
+#else
+    data = cpu_lduw_data(env, addr);
+#endif
+    int i;
+    for (i = 0; i < 8; i++) {
+        Vd->H[i] = data;
+    }
+}
+
+void helper_vldrepl_w(CPULoongArchState *env, uint32_t vd, target_ulong addr)
+{
+    vec_t *Vd = &(env->fpr[vd].vec);
+    uint32_t data;
+#if !defined(CONFIG_USER_ONLY)
+    MemOpIdx oi = make_memop_idx(MO_TE | MO_32 | MO_UNALN,
+                                 cpu_mmu_index(env, false));
+    data = helper_le_ldul_mmu(env, addr, oi, GETPC());
+#else
+    data = cpu_ldl_data(env, addr);
+#endif
+    Vd->W[0] = data;
+    Vd->W[1] = data;
+    Vd->W[2] = data;
+    Vd->W[3] = data;
+}
+
+void helper_vldrepl_d(CPULoongArchState *env, uint32_t vd, target_ulong addr)
+{
+    vec_t *Vd = &(env->fpr[vd].vec);
+    uint64_t data;
+#if !defined(CONFIG_USER_ONLY)
+    MemOpIdx oi = make_memop_idx(MO_TE | MO_64 | MO_UNALN,
+                                 cpu_mmu_index(env, false));
+    data = helper_le_ldq_mmu(env, addr, oi, GETPC());
+#else
+    data = cpu_ldq_data(env, addr);
+#endif
+    Vd->D[0] = data;
+    Vd->D[1] = data;
+}
+
+#define B_PAGESPAN(x) \
+        ((((x) & ~TARGET_PAGE_MASK) + 8/8 - 1) >= TARGET_PAGE_SIZE)
+
+static inline void ensure_b_writable_pages(CPULoongArchState *env,
+                                           target_ulong addr,
+                                           int mmu_idx,
+                                           uintptr_t retaddr)
+{
+#ifndef CONFIG_USER_ONLY
+    /* FIXME: Probe the actual accesses (pass and use a size) */
+    if (unlikely(B_PAGESPAN(addr))) {
+        /* first page */
+        probe_write(env, addr, 0, mmu_idx, retaddr);
+        /* second page */
+        addr = (addr & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
+        probe_write(env, addr, 0, mmu_idx, retaddr);
+    }
+#endif
+}
+
+void helper_vstelm_b(CPULoongArchState *env,
+                     uint32_t vd, target_ulong addr, uint32_t sel)
+{
+    vec_t *Vd = &(env->fpr[vd].vec);
+    int mmu_idx = cpu_mmu_index(env, false);
+
+    ensure_b_writable_pages(env, addr, mmu_idx, GETPC());
+#if !defined(CONFIG_USER_ONLY)
+    MemOpIdx oi = make_memop_idx(MO_TE | MO_8 | MO_UNALN,
+                                 cpu_mmu_index(env, false));
+    helper_ret_stb_mmu(env, addr, Vd->B[sel], oi, GETPC());
+#else
+    cpu_stb_data(env, addr, Vd->B[sel]);
+#endif
+}
+
+#define H_PAGESPAN(x) \
+        ((((x) & ~TARGET_PAGE_MASK) + 16/8 - 1) >= TARGET_PAGE_SIZE)
+
+static inline void ensure_h_writable_pages(CPULoongArchState *env,
+                                           target_ulong addr,
+                                           int mmu_idx,
+                                           uintptr_t retaddr)
+{
+#ifndef CONFIG_USER_ONLY
+    /* FIXME: Probe the actual accesses (pass and use a size) */
+    if (unlikely(H_PAGESPAN(addr))) {
+        /* first page */
+        probe_write(env, addr, 0, mmu_idx, retaddr);
+        /* second page */
+        addr = (addr & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
+        probe_write(env, addr, 0, mmu_idx, retaddr);
+    }
+#endif
+}
+
+void helper_vstelm_h(CPULoongArchState *env,
+                     uint32_t vd, target_ulong addr, uint32_t sel)
+{
+    vec_t *Vd = &(env->fpr[vd].vec);
+    int mmu_idx = cpu_mmu_index(env, false);
+
+    ensure_h_writable_pages(env, addr, mmu_idx, GETPC());
+#if !defined(CONFIG_USER_ONLY)
+    MemOpIdx oi = make_memop_idx(MO_TE | MO_16 | MO_UNALN,
+                                 cpu_mmu_index(env, false));
+    helper_le_stw_mmu(env, addr, Vd->H[sel], oi, GETPC());
+#else
+    cpu_stw_data(env, addr, Vd->H[sel]);
+#endif
+}
+
+#define W_PAGESPAN(x) \
+        ((((x) & ~TARGET_PAGE_MASK) + 32/8 - 1) >= TARGET_PAGE_SIZE)
+
+static inline void ensure_w_writable_pages(CPULoongArchState *env,
+                                           target_ulong addr,
+                                           int mmu_idx,
+                                           uintptr_t retaddr)
+{
+#ifndef CONFIG_USER_ONLY
+    /* FIXME: Probe the actual accesses (pass and use a size) */
+    if (unlikely(W_PAGESPAN(addr))) {
+        /* first page */
+        probe_write(env, addr, 0, mmu_idx, retaddr);
+        /* second pdge */
+        addr = (addr & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
+        probe_write(env, addr, 0, mmu_idx, retaddr);
+    }
+#endif
+}
+
+void helper_vstelm_w(CPULoongArchState *env,
+                     uint32_t vd, target_ulong addr, uint32_t sel)
+{
+    vec_t *Vd = &(env->fpr[vd].vec);
+    int mmu_idx = cpu_mmu_index(env, false);
+
+    ensure_w_writable_pages(env, addr, mmu_idx, GETPC());
+#if !defined(CONFIG_USER_ONLY)
+    MemOpIdx oi = make_memop_idx(MO_TE | MO_32 | MO_UNALN,
+                                 cpu_mmu_index(env, false));
+    helper_le_stl_mmu(env, addr, Vd->W[sel], oi, GETPC());
+#else
+    cpu_stl_data(env, addr, Vd->W[sel]);
+#endif
+}
+
+#define D_PAGESPAN(x) \
+        ((((x) & ~TARGET_PAGE_MASK) + 32/8 - 1) >= TARGET_PAGE_SIZE)
+
+static inline void ensure_d_writable_pages(CPULoongArchState *env,
+                                           target_ulong addr,
+                                           int mmu_idx,
+                                           uintptr_t retaddr)
+{
+#ifndef CONFIG_USER_ONLY
+    /* FIXME: Probe the actual accesses (pass and use a size) */
+    if (unlikely(D_PAGESPAN(addr))) {
+        /* first page */
+        probe_write(env, addr, 0, mmu_idx, retaddr);
+        /* second page */
+        addr = (addr & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
+        probe_write(env, addr, 0, mmu_idx, retaddr);
+    }
+#endif
+}
+
+void helper_vstelm_d(CPULoongArchState *env,
+                     uint32_t vd, target_ulong addr, uint32_t sel)
+{
+    vec_t *Vd = &(env->fpr[vd].vec);
+    int mmu_idx = cpu_mmu_index(env, false);
+
+    ensure_d_writable_pages(env, addr, mmu_idx, GETPC());
+#if !defined(CONFIG_USER_ONLY)
+    MemOpIdx oi = make_memop_idx(MO_TE | MO_64 | MO_UNALN,
+                                 cpu_mmu_index(env, false));
+    helper_le_stq_mmu(env, addr, Vd->D[sel], oi, GETPC());
+#else
+    cpu_stq_data(env, addr, Vd->D[sel]);
+#endif
+}
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index fa43473738..3bb63bfb3e 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -35,11 +35,21 @@ static inline int plus_1(DisasContext *ctx, int x)
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


