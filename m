Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5D14684BA
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 13:18:21 +0100 (CET)
Received: from localhost ([::1]:52684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtTzg-0004dw-6b
	for lists+qemu-devel@lfdr.de; Sat, 04 Dec 2021 07:18:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mtTpZ-0007Yl-U0
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 07:07:53 -0500
Received: from mail.loongson.cn ([114.242.206.163]:58146 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mtTpW-0003Gc-L8
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 07:07:53 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Axysj9Wath8+ECAA--.6122S12; 
 Sat, 04 Dec 2021 20:07:34 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 10/27] target/loongarch: Add other core instructions
 support
Date: Sat,  4 Dec 2021 20:07:08 +0800
Message-Id: <1638619645-11283-11-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1638619645-11283-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1638619645-11283-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9Axysj9Wath8+ECAA--.6122S12
X-Coremail-Antispam: 1UD129KBjvJXoW3Cr18Ar1DGr47Cr4xXr1UJrb_yoWkuF1fpF
 s2krWjkrW8GrZ7Zwn3K3WYyrn8Xw4Ika1Ivas3t34F9w13Xa4kXr48trZxKFWUXwn8XrWU
 ZFnxA34j9FyxX3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 philmd@redhat.com, i.qemu@xen0n.name, mark.cave-ayland@ilande.co.uk,
 laurent@vivier.eu, peterx@redhat.com, f4bug@amsat.org,
 yangxiaojuan@loongson.cn, alistair.francis@wdc.com, maobibo@loongson.cn,
 pbonzini@redhat.com, richard.henderson@linaro.org, alex.bennee@linaro.org,
 gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This includes:
-CACOP
-LDDIR
-LDPTE
-ERTN
-DBCL
-IDLE

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/cpu.h                       |  2 +
 target/loongarch/disas.c                     | 17 ++++
 target/loongarch/helper.h                    |  4 +
 target/loongarch/insn_trans/trans_core.c.inc | 74 +++++++++++++++++
 target/loongarch/insns.decode                | 11 +++
 target/loongarch/internals.h                 |  5 ++
 target/loongarch/op_helper.c                 | 48 +++++++++++
 target/loongarch/tlb_helper.c                | 87 ++++++++++++++++++++
 8 files changed, 248 insertions(+)

diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index 307a185a51..198d2606c5 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -438,6 +438,8 @@ enum {
     EXCP_LAST = EXCP_FPE,
 };
 
+#define CPU_INTERRUPT_WAKE CPU_INTERRUPT_TGT_INT_0
+
 #define LOONGARCH_CPU_TYPE_SUFFIX "-" TYPE_LOONGARCH_CPU
 #define LOONGARCH_CPU_TYPE_NAME(model) model LOONGARCH_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_LOONGARCH_CPU
diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 483270f331..516866c2d3 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -226,6 +226,17 @@ static void output_i_rr(DisasContext *ctx, arg_i_rr *a, const char *mnemonic)
     output(ctx, mnemonic, "%d, r%d, r%d", a->imm, a->rj, a->rk);
 }
 
+static void output_cop_r_i(DisasContext *ctx, arg_cop_r_i *a,
+                           const char *mnemonic)
+{
+    output(ctx, mnemonic, "%d, r%d, %d", a->cop, a->rj, a->imm);
+}
+
+static void output_j_i(DisasContext *ctx, arg_j_i *a, const char *mnemonic)
+{
+    output(ctx, mnemonic, "r%d, %d", a->rj, a->imm);
+}
+
 #define INSN(insn, type)                                    \
 static bool trans_##insn(DisasContext *ctx, arg_##type * a) \
 {                                                           \
@@ -556,6 +567,12 @@ INSN(tlbfill,      empty)
 INSN(tlbclr,       empty)
 INSN(tlbflush,     empty)
 INSN(invtlb,       i_rr)
+INSN(cacop,        cop_r_i)
+INSN(lddir,        rr_i)
+INSN(ldpte,        j_i)
+INSN(ertn,         empty)
+INSN(idle,         i)
+INSN(dbcl,         i)
 
 #define output_fcmp(C, PREFIX, SUFFIX)                                         \
 {                                                                              \
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 97af7ac8aa..c916f2650b 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -112,4 +112,8 @@ DEF_HELPER_2(invtlb_all_g, void, env, i32)
 DEF_HELPER_2(invtlb_all_asid, void, env, tl)
 DEF_HELPER_3(invtlb_page_asid, void, env, tl, tl)
 DEF_HELPER_3(invtlb_page_asid_or_g, void, env, tl, tl)
+DEF_HELPER_4(lddir, tl, env, tl, tl, i32)
+DEF_HELPER_4(ldpte, void, env, tl, tl, i32)
+DEF_HELPER_1(ertn, void, env)
+DEF_HELPER_1(idle, void, env)
 #endif /* !CONFIG_USER_ONLY */
diff --git a/target/loongarch/insn_trans/trans_core.c.inc b/target/loongarch/insn_trans/trans_core.c.inc
index 938802b526..3e627e9fd3 100644
--- a/target/loongarch/insn_trans/trans_core.c.inc
+++ b/target/loongarch/insn_trans/trans_core.c.inc
@@ -35,6 +35,12 @@ GEN_FALSE_TRANS(tlbfill)
 GEN_FALSE_TRANS(tlbclr)
 GEN_FALSE_TRANS(tlbflush)
 GEN_FALSE_TRANS(invtlb)
+GEN_FALSE_TRANS(cacop)
+GEN_FALSE_TRANS(ldpte)
+GEN_FALSE_TRANS(lddir)
+GEN_FALSE_TRANS(ertn)
+GEN_FALSE_TRANS(dbcl)
+GEN_FALSE_TRANS(idle)
 
 #else
 
@@ -332,4 +338,72 @@ static bool trans_invtlb(DisasContext *ctx, arg_invtlb *a)
     return true;
 }
 
+static bool trans_cacop(DisasContext *ctx, arg_cacop *a)
+{
+    /* Treat the cacop as a nop */
+    if (check_plv(ctx)) {
+        return false;
+    }
+    return true;
+}
+
+static bool trans_ldpte(DisasContext *ctx, arg_ldpte *a)
+{
+    TCGv_i32 mem_idx = tcg_constant_i32(ctx->mem_idx);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+
+    if (check_plv(ctx)) {
+        return false;
+    }
+    gen_helper_ldpte(cpu_env, src1, tcg_constant_tl(a->imm), mem_idx);
+    return true;
+}
+
+static bool trans_lddir(DisasContext *ctx, arg_lddir *a)
+{
+    TCGv_i32 mem_idx = tcg_constant_i32(ctx->mem_idx);
+    TCGv src = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+
+    if (check_plv(ctx)) {
+        return false;
+    }
+    gen_helper_lddir(dest, cpu_env, src, tcg_constant_tl(a->imm), mem_idx);
+    return true;
+}
+
+static bool trans_ertn(DisasContext *ctx, arg_ertn *a)
+{
+    if (check_plv(ctx)) {
+        return false;
+    }
+    gen_helper_ertn(cpu_env);
+    ctx->base.is_jmp = DISAS_EXIT;
+    return true;
+}
+
+static bool trans_dbcl(DisasContext *ctx, arg_dbcl *a)
+{
+    /*
+     * XXX: not clear which exception should be raised
+     *      when in debug mode...
+     */
+    if (check_plv(ctx)) {
+        return false;
+    }
+    generate_exception(ctx, EXCCODE_DBP);
+    return true;
+}
+
+static bool trans_idle(DisasContext *ctx, arg_idle *a)
+{
+    if (check_plv(ctx)) {
+        return false;
+    }
+
+    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next + 4);
+    gen_helper_idle(cpu_env);
+    ctx->base.is_jmp = DISAS_NORETURN;
+    return true;
+}
 #endif
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 6f2a814195..3fdc6e148c 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -49,6 +49,8 @@
 &rr_csr       rd rj csr
 &empty
 &i_rr         imm rj rk
+&cop_r_i      cop rj imm
+&j_i          rj imm
 
 #
 # Formats
@@ -60,6 +62,7 @@
 @r_i20                          .... ... imm:s20 rd:5    &r_i
 @rr_ui5           .... ........ ..... imm:5 rj:5 rd:5    &rr_i
 @rr_ui6            .... ........ .... imm:6 rj:5 rd:5    &rr_i
+@rr_ui8              .. ........ .... imm:8 rj:5 rd:5    &rr_i
 @rr_i12                 .... ...... imm:s12 rj:5 rd:5    &rr_i
 @rr_ui12                 .... ...... imm:12 rj:5 rd:5    &rr_i
 @rr_i14s2         .... ....  .............. rj:5 rd:5    &rr_i imm=%i14s2
@@ -93,6 +96,8 @@
 @rr_csr                    .... .... csr:14 rj:5 rd:5    &rr_csr
 @empty          .... ........ ..... ..... ..... .....    &empty
 @i_rr             ...... ...... ..... rk:5 rj:5 imm:5    &i_rr
+@cop_r_i              .... ......  imm:s12 rj:5 cop:5    &cop_r_i
+@j_i               .... ........ .. imm:8 rj:5 .....    &j_i
 
 #
 # Fixed point arithmetic operation instruction
@@ -473,3 +478,9 @@ tlbfill          0000 01100100 10000 01101 00000 00000    @empty
 tlbclr           0000 01100100 10000 01000 00000 00000    @empty
 tlbflush         0000 01100100 10000 01001 00000 00000    @empty
 invtlb           0000 01100100 10011 ..... ..... .....    @i_rr
+cacop            0000 011000 ............ ..... .....     @cop_r_i
+lddir            0000 01100100 00 ........ ..... .....    @rr_ui8
+ldpte            0000 01100100 01 ........ ..... 00000    @j_i
+ertn             0000 01100100 10000 01110 00000 00000    @empty
+idle             0000 01100100 10001 ...............      @i15
+dbcl             0000 00000010 10101 ...............      @i15
diff --git a/target/loongarch/internals.h b/target/loongarch/internals.h
index a5b81bdca3..7035cbd7d5 100644
--- a/target/loongarch/internals.h
+++ b/target/loongarch/internals.h
@@ -16,6 +16,11 @@
 #define TARGET_PHYS_MASK MAKE_64BIT_MASK(0, TARGET_PHYS_ADDR_SPACE_BITS)
 #define TARGET_VIRT_MASK MAKE_64BIT_MASK(0, TARGET_VIRT_ADDR_SPACE_BITS)
 
+/* Global bit used for lddir/ldpte */
+#define LOONGARCH_PAGE_HUGE_SHIFT   6
+/* Global bit for huge page */
+#define LOONGARCH_HGLOBAL_SHIFT     12
+
 void loongarch_translate_init(void);
 
 void loongarch_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
diff --git a/target/loongarch/op_helper.c b/target/loongarch/op_helper.c
index 48c25e5a9b..ea059bb350 100644
--- a/target/loongarch/op_helper.c
+++ b/target/loongarch/op_helper.c
@@ -91,3 +91,51 @@ target_ulong helper_cpucfg(CPULoongArchState *env, target_ulong rj)
 {
     return rj > 21 ? 0 : env->cpucfg[rj];
 }
+
+#ifndef CONFIG_USER_ONLY
+void helper_ertn(CPULoongArchState *env)
+{
+    uint64_t csr_pplv, csr_pie;
+    if (FIELD_EX64(env->CSR_TLBRERA, CSR_TLBRERA, ISTLBR)) {
+        csr_pplv = FIELD_EX64(env->CSR_TLBRPRMD, CSR_TLBRPRMD, PPLV);
+        csr_pie = FIELD_EX64(env->CSR_TLBRPRMD, CSR_TLBRPRMD, PIE);
+
+        /* Clear Refill flag and set pc */
+        env->CSR_TLBRERA = FIELD_DP64(env->CSR_TLBRERA, CSR_TLBRERA, ISTLBR, 0);
+        env->pc = env->CSR_TLBRERA;
+        qemu_log_mask(CPU_LOG_INT, "%s: TLBRERA 0x%lx\n",
+                      __func__, env->CSR_TLBRERA);
+    } else {
+        csr_pplv = FIELD_EX64(env->CSR_PRMD, CSR_PRMD, PPLV);
+        csr_pie = FIELD_EX64(env->CSR_PRMD, CSR_PRMD, PIE);
+
+        /* set pc*/
+        env->pc = env->CSR_ERA;
+        qemu_log_mask(CPU_LOG_INT, "%s: ERA 0x%lx\n", __func__, env->CSR_ERA);
+    }
+    env->CSR_CRMD = FIELD_DP64(env->CSR_CRMD, CSR_CRMD, PLV, csr_pplv);
+    env->CSR_CRMD = FIELD_DP64(env->CSR_CRMD, CSR_CRMD, IE, csr_pie);
+
+    env->lladdr = 1;
+}
+
+void helper_idle(CPULoongArchState *env)
+{
+    CPUState *cs = env_cpu(env);
+
+    cs->halted = 1;
+    cpu_reset_interrupt(cs, CPU_INTERRUPT_WAKE);
+    /*
+     * Last instruction in the block, PC was updated before
+     * - no need to recover PC and icount
+     */
+    do_raise_exception(env, EXCP_HLT, 0);
+}
+
+uint64_t helper_rdtime_d(CPULoongArchState *env)
+{
+     LoongArchCPU *cpu = LOONGARCH_CPU(env_cpu(env));
+     return cpu_loongarch_get_stable_counter(cpu);
+}
+
+#endif /* !CONFIG_USER_ONLY */
diff --git a/target/loongarch/tlb_helper.c b/target/loongarch/tlb_helper.c
index 891ea06c8f..5cd0eac962 100644
--- a/target/loongarch/tlb_helper.c
+++ b/target/loongarch/tlb_helper.c
@@ -700,3 +700,90 @@ bool loongarch_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
         do_raise_exception(env, cs->exception_index, retaddr);
     }
 }
+
+target_ulong helper_lddir(CPULoongArchState *env, target_ulong base,
+                          target_ulong level, uint32_t mem_idx)
+{
+    CPUState *cs = env_cpu(env);
+    target_ulong badvaddr, index, phys, ret;
+    int shift;
+    uint64_t dir1_base, dir1_width;
+    uint64_t dir3_base, dir3_width;
+    bool huge = (base >> LOONGARCH_PAGE_HUGE_SHIFT) & 0x1;
+
+    badvaddr = env->CSR_TLBRBADV;
+    base = base & TARGET_PHYS_MASK;
+
+    /* 0:8B, 1:16B, 2:32B, 3:64B */
+    shift = FIELD_EX64(env->CSR_PWCL, CSR_PWCL, PTEWIDTH);
+    shift = (shift + 1) * 3;
+
+    if (huge) {
+        return base;
+    }
+    switch (level) {
+    case 1:
+        dir1_base = FIELD_EX64(env->CSR_PWCL, CSR_PWCL, DIR1_BASE);
+        dir1_width = FIELD_EX64(env->CSR_PWCL, CSR_PWCL, DIR1_WIDTH);
+        index = (badvaddr >> dir1_base) & ((1 << dir1_width) - 1);
+        break;
+    case 3:
+        dir3_base = FIELD_EX64(env->CSR_PWCH, CSR_PWCH, DIR3_BASE);
+        dir3_width = FIELD_EX64(env->CSR_PWCH, CSR_PWCH, DIR3_WIDTH);
+        index = (badvaddr >> dir3_base) & ((1 << dir3_width) - 1);
+        break;
+    default:
+        do_raise_exception(env, EXCCODE_INE, GETPC());
+        return 0;
+    }
+
+    phys = base | index << shift;
+    ret = ldq_phys(cs->as, phys) & TARGET_PHYS_MASK;
+    return ret;
+}
+
+void helper_ldpte(CPULoongArchState *env, target_ulong base, target_ulong odd,
+                  uint32_t mem_idx)
+{
+    CPUState *cs = env_cpu(env);
+    target_ulong phys, tmp0, ptindex, ptoffset0, ptoffset1, ps, badv;
+    int shift;
+    bool huge = (base >> LOONGARCH_PAGE_HUGE_SHIFT) & 0x1;
+    uint64_t ptbase = FIELD_EX64(env->CSR_PWCL, CSR_PWCL, PTBASE);
+    uint64_t ptwidth = FIELD_EX64(env->CSR_PWCL, CSR_PWCL, PTWIDTH);
+
+    base = base & TARGET_PHYS_MASK;
+
+    if (huge) {
+        /* Huge Page. base is paddr */
+        tmp0 = base ^ LOONGARCH_PAGE_HUGE_SHIFT;
+        /* Move Global bit */
+        tmp0 = (tmp0 >> LOONGARCH_HGLOBAL_SHIFT) << R_TLBENTRY_G_SHIFT |
+               (tmp0 & (~(1 << R_TLBENTRY_G_SHIFT)));
+        ps = ptbase + ptwidth - 1;
+        if (odd) {
+            tmp0 += (1 << ps);
+        }
+    } else {
+        /* 0:8B, 1:16B, 2:32B, 3:64B */
+        shift = FIELD_EX64(env->CSR_PWCL, CSR_PWCL, PTEWIDTH);
+        shift = (shift + 1) * 3;
+        badv = env->CSR_TLBRBADV;
+
+        ptindex = (badv >> ptbase) & ((1 << ptwidth) - 1);
+        ptindex = ptindex & ~0x1;   /* clear bit 0 */
+        ptoffset0 = ptindex << shift;
+        ptoffset1 = (ptindex + 1) << shift;
+
+        phys = base | (odd ? ptoffset1 : ptoffset0);
+        tmp0 = ldq_phys(cs->as, phys) & TARGET_PHYS_MASK;
+        ps = ptbase;
+    }
+
+    if (odd) {
+        env->CSR_TLBRELO1 = tmp0;
+    } else {
+        env->CSR_TLBRELO0 = tmp0;
+    }
+    env->CSR_TLBREHI = FIELD_DP64(env->CSR_TLBREHI, CSR_TLBREHI, PS, ps);
+}
-- 
2.27.0


