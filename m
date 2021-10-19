Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3EC432FF7
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 09:44:06 +0200 (CEST)
Received: from localhost ([::1]:53410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcjn3-00077N-9l
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 03:44:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mcjf0-0001IA-3V
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:35:46 -0400
Received: from mail.loongson.cn ([114.242.206.163]:34868 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mcjev-0004Un-Oo
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:35:45 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP2s1dW5h3HwcAA--.43474S11; 
 Tue, 19 Oct 2021 15:35:32 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/31] target/loongarch: Add other core instructions support
Date: Tue, 19 Oct 2021 15:34:55 +0800
Message-Id: <1634628917-10031-10-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9DxP2s1dW5h3HwcAA--.43474S11
X-Coremail-Antispam: 1UD129KBjvJXoWfJryUWw4kXw4UCF48JFyUAwb_yoWkWr1kpF
 42krW7Cr48JFZ3Zwnrt3WYyFn8Xr4xCa1xZayft34FvF47XFykXrW8X3y3KF4UXwn5ZrWU
 ZFn8AryjvFyUXaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 mst@redhat.com, philmd@redhat.com, richard.henderson@linaro.org,
 laurent@vivier.eu, peterx@redhat.com, f4bug@amsat.org,
 yangxiaojuan@loongson.cn, alistair.francis@wdc.com, maobibo@loongson.cn,
 gaosong@loongson.cn, pbonzini@redhat.com, mark.cave-ayland@ilande.co.uk,
 bmeng.cn@gmail.com, alex.bennee@linaro.org, david@gibson.dropbear.id.au
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
 target/loongarch/cpu.c                   |  1 +
 target/loongarch/cpu.h                   |  5 +-
 target/loongarch/helper.h                |  4 ++
 target/loongarch/insn_trans/trans_core.c | 57 ++++++++++++++++
 target/loongarch/insns.decode            | 15 +++++
 target/loongarch/op_helper.c             | 48 ++++++++++++++
 target/loongarch/tlb_helper.c            | 83 ++++++++++++++++++++++++
 7 files changed, 212 insertions(+), 1 deletion(-)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index afd186abac..7fa3851251 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -45,6 +45,7 @@ static const char * const excp_names[EXCP_LAST + 1] = {
     [EXCP_TLBPE] = "TLB priviledged error",
     [EXCP_TLBNX] = "TLB execute-inhibit",
     [EXCP_TLBNR] = "TLB read-inhibit",
+    [EXCP_DBP] = "debug breakpoint",
 };
 
 const char *loongarch_exception_name(int32_t exception)
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index 567fc7620d..d39c618d6b 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -166,10 +166,13 @@ enum {
     EXCP_TLBPE,
     EXCP_TLBNX,
     EXCP_TLBNR,
+    EXCP_DBP,
 
-    EXCP_LAST = EXCP_TLBNR,
+    EXCP_LAST = EXCP_DBP,
 };
 
+#define CPU_INTERRUPT_WAKE CPU_INTERRUPT_TGT_INT_0
+
 #define LOONGARCH_CPU_TYPE_SUFFIX "-" TYPE_LOONGARCH_CPU
 #define LOONGARCH_CPU_TYPE_NAME(model) model LOONGARCH_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_LOONGARCH_CPU
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 1bb1df91b3..8544771790 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -112,4 +112,8 @@ DEF_HELPER_1(tlbflush, void, env)
 DEF_HELPER_4(invtlb, void, env, tl, tl, tl)
 DEF_HELPER_2(iocsr_read, i64, env, tl)
 DEF_HELPER_4(iocsr_write, void, env, tl, tl, i32)
+DEF_HELPER_4(lddir, tl, env, tl, tl, i32)
+DEF_HELPER_4(ldpte, void, env, tl, tl, i32)
+DEF_HELPER_1(ertn, void, env)
+DEF_HELPER_1(idle, void, env)
 #endif /* !CONFIG_USER_ONLY */
diff --git a/target/loongarch/insn_trans/trans_core.c b/target/loongarch/insn_trans/trans_core.c
index f8a72436dd..7fa13e65b9 100644
--- a/target/loongarch/insn_trans/trans_core.c
+++ b/target/loongarch/insn_trans/trans_core.c
@@ -34,6 +34,12 @@ GEN_FALSE_TRANS(tlbfill)
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
 static bool trans_csrrd(DisasContext *ctx, unsigned rd, unsigned csr)
@@ -173,6 +179,11 @@ static bool trans_iocsrwr_d(DisasContext *ctx, arg_iocsrwr_d *a)
     return true;
 }
 
+static bool trans_cacop(DisasContext *ctx, arg_cacop *a)
+{
+    return false;
+}
+
 static bool trans_tlbsrch(DisasContext *ctx, arg_tlbsrch *a)
 {
     gen_helper_tlbsrch(cpu_env);
@@ -219,4 +230,50 @@ static bool trans_invtlb(DisasContext *ctx, arg_invtlb *a)
     return true;
 }
 
+static bool trans_ldpte(DisasContext *ctx, arg_ldpte *a)
+{
+    TCGv_i32 mem_idx = tcg_constant_i32(ctx->mem_idx);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+
+    gen_helper_ldpte(cpu_env, src1, tcg_constant_tl(a->seq), mem_idx);
+    return true;
+}
+
+static bool trans_lddir(DisasContext *ctx, arg_lddir *a)
+{
+    TCGv_i32 mem_idx = tcg_constant_i32(ctx->mem_idx);
+    TCGv src = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+
+    gen_helper_lddir(dest, cpu_env, src, tcg_constant_tl(a->level), mem_idx);
+    return true;
+}
+
+static bool trans_ertn(DisasContext *ctx, arg_ertn *a)
+{
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
+    generate_exception(ctx, EXCP_DBP);
+    return true;
+}
+
+static bool trans_idle(DisasContext *ctx, arg_idle *a)
+{
+    ctx->base.pc_next += 4;
+    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
+    ctx->base.pc_next -= 4;
+    gen_helper_idle(cpu_env);
+    ctx->base.is_jmp = DISAS_NORETURN;
+    return true;
+}
+
 #endif
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index aa40ecfca7..2b18b27c88 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -42,9 +42,12 @@
 %offs16  10:s16
 %offs    0:s10 10:16
 %csr     10:14
+%cop     0:5
 %addr    10:5
 %info    5:5
 %invop   0:5
+%level   10:8
+%seq     10:8
 
 #
 # Argument sets
@@ -87,8 +90,11 @@
 &fmt_offs           offs
 &fmt_rjrdoffs16     rj rd offs16
 &fmt_rdrjcsr        rd rj csr
+&fmt_coprjsi12      cop rj si12
 &fmt_empty
 &fmt_invtlb         addr info invop
+&fmt_rdrjlevel      rd rj level
+&fmt_rjseq          rj seq
 
 #
 # Formats
@@ -131,8 +137,11 @@
 @fmt_offs            .... .. ..........................       &fmt_offs           %offs
 @fmt_rjrdoffs16      .... .. ................ ..... .....     &fmt_rjrdoffs16     %rj %rd %offs16
 @fmt_rdrjcsr         .... .... .............. ..... .....     &fmt_rdrjcsr        %rd %rj %csr
+@fmt_coprjsi12       .... ...... ............ ..... .....     &fmt_coprjsi12      %cop %rj %si12
 @fmt_empty           .... ........ ..... ..... ..... .....    &fmt_empty
 @fmt_invtlb          ...... ...... ..... ..... ..... .....    &fmt_invtlb         %addr %info %invop
+@fmt_rdrjlevel       .... ........ .. ........ ..... .....    &fmt_rdrjlevel      %rd %rj %level
+@fmt_rjseq           .... ........ .. ........ ..... .....    &fmt_rjseq          %rj %seq
 
 #
 # Fixed point arithmetic operation instruction
@@ -501,6 +510,7 @@ iocsrwr_b        0000 01100100 10000 00100 ..... .....    @fmt_rdrj
 iocsrwr_h        0000 01100100 10000 00101 ..... .....    @fmt_rdrj
 iocsrwr_w        0000 01100100 10000 00110 ..... .....    @fmt_rdrj
 iocsrwr_d        0000 01100100 10000 00111 ..... .....    @fmt_rdrj
+cacop            0000 011000 ............ ..... .....     @fmt_coprjsi12
 tlbsrch          0000 01100100 10000 01010 00000 00000    @fmt_empty
 tlbrd            0000 01100100 10000 01011 00000 00000    @fmt_empty
 tlbwr            0000 01100100 10000 01100 00000 00000    @fmt_empty
@@ -508,3 +518,8 @@ tlbfill          0000 01100100 10000 01101 00000 00000    @fmt_empty
 tlbclr           0000 01100100 10000 01000 00000 00000    @fmt_empty
 tlbflush         0000 01100100 10000 01001 00000 00000    @fmt_empty
 invtlb           0000 01100100 10011 ..... ..... .....    @fmt_invtlb
+lddir            0000 01100100 00 ........ ..... .....    @fmt_rdrjlevel
+ldpte            0000 01100100 01 ........ ..... 00000    @fmt_rjseq
+ertn             0000 01100100 10000 01110 00000 00000    @fmt_empty
+idle             0000 01100100 10001 ...............      @fmt_whint
+dbcl             0000 00000010 10101 ...............      @fmt_code
diff --git a/target/loongarch/op_helper.c b/target/loongarch/op_helper.c
index c560a9be26..4547880c8f 100644
--- a/target/loongarch/op_helper.c
+++ b/target/loongarch/op_helper.c
@@ -83,3 +83,51 @@ target_ulong helper_cpucfg(CPULoongArchState *env, target_ulong rj)
 {
     return env->cpucfg[rj];
 }
+
+#ifndef CONFIG_USER_ONLY
+static inline void exception_return(CPULoongArchState *env)
+{
+    if (env->CSR_TLBRERA & 0x1) {
+        env->CSR_CRMD = FIELD_DP64(env->CSR_CRMD, CSR_CRMD, PLV,
+                                   FIELD_EX64(env->CSR_TLBRPRMD, CSR_TLBRPRMD, PPLV));
+        env->CSR_CRMD = FIELD_DP64(env->CSR_CRMD, CSR_CRMD, IE,
+                                   FIELD_EX64(env->CSR_TLBRPRMD, CSR_TLBRPRMD, PIE));
+        /* Clear Refill flag and set pc */
+        env->CSR_TLBRERA &= (~0x1);
+        env->pc = env->CSR_TLBRERA;
+        if (qemu_loglevel_mask(CPU_LOG_INT)) {
+            qemu_log("%s: TLBRERA 0x%lx\n", __func__, env->CSR_TLBRERA);
+        }
+    } else {
+        env->CSR_CRMD = FIELD_DP64(env->CSR_CRMD, CSR_CRMD, PLV,
+                                   FIELD_EX64(env->CSR_PRMD, CSR_PRMD, PPLV));
+        env->CSR_CRMD = FIELD_DP64(env->CSR_CRMD, CSR_CRMD, IE,
+                                   FIELD_EX64(env->CSR_PRMD, CSR_PRMD, PIE));
+        /* set pc*/
+        env->pc = env->CSR_ERA;
+        if (qemu_loglevel_mask(CPU_LOG_INT)) {
+            qemu_log("%s: ERA 0x%lx\n", __func__, env->CSR_ERA);
+        }
+    }
+}
+
+void helper_ertn(CPULoongArchState *env)
+{
+    exception_return(env);
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
+#endif /* !CONFIG_USER_ONLY */
diff --git a/target/loongarch/tlb_helper.c b/target/loongarch/tlb_helper.c
index fd844d5a46..1eea4e1dc4 100644
--- a/target/loongarch/tlb_helper.c
+++ b/target/loongarch/tlb_helper.c
@@ -833,3 +833,86 @@ bool loongarch_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
         do_raise_exception(env, cs->exception_index, retaddr);
     }
 }
+
+target_ulong helper_lddir(CPULoongArchState *env, target_ulong base,
+                          target_ulong level, uint32_t mem_idx)
+{
+    target_ulong badvaddr;
+    target_ulong index;
+    target_ulong vaddr;
+    int shift;
+    uint64_t dir1_base, dir1_width;
+    uint64_t dir3_base, dir3_width;
+
+    badvaddr = env->CSR_TLBRBADV;
+
+    /* 0:8B, 1:16B, 2:32B, 3:64B */
+    shift = FIELD_EX64(env->CSR_PWCL, CSR_PWCL, PTEWIDTH);
+    shift = (shift + 1) * 3;
+
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
+        do_raise_exception(env, EXCP_INE, GETPC());
+        return 0;
+    }
+
+    vaddr = base | index << shift;
+    return cpu_ldq_mmuidx_ra(env, vaddr, mem_idx, GETPC());
+}
+
+void helper_ldpte(CPULoongArchState *env, target_ulong base, target_ulong odd,
+                  uint32_t mem_idx)
+{
+    target_ulong vaddr;
+    target_ulong tmp0;
+    target_ulong ptindex, ptoffset0, ptoffset1;
+    target_ulong pagesize;
+    target_ulong badv;
+    int shift;
+    bool huge = base & LOONGARCH_PAGE_HUGE;
+    uint64_t ptbase = FIELD_EX64(env->CSR_PWCL, CSR_PWCL, PTBASE);
+    uint64_t ptwidth = FIELD_EX64(env->CSR_PWCL, CSR_PWCL, PTWIDTH);
+
+    if (huge) {
+        /* Huge Page. base is paddr */
+        tmp0 = base ^ LOONGARCH_PAGE_HUGE;
+        /* move Global bit */
+        tmp0 |= ((tmp0 & LOONGARCH_HUGE_GLOBAL)
+                 >> (LOONGARCH_HUGE_GLOBAL_SH - R_CSR_TLBELO0_G_SHIFT));
+        pagesize = ptbase + ptwidth - 1;
+        if (odd) {
+            tmp0 += (1 << pagesize);
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
+        vaddr = base | (odd ? ptoffset1 : ptoffset0);
+        tmp0 = cpu_ldq_mmuidx_ra(env, vaddr, mem_idx, GETPC());
+        pagesize = ptbase;
+    }
+    if (odd) {
+        env->CSR_TLBRELO1 = tmp0;
+    } else {
+        env->CSR_TLBRELO0 = tmp0;
+    }
+    env->CSR_TLBREHI = env->CSR_TLBREHI & (~0x3f);
+    env->CSR_TLBREHI = env->CSR_TLBREHI | pagesize;
+}
-- 
2.27.0


