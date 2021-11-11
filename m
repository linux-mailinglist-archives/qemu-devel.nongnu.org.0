Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CB744CF2E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 02:44:18 +0100 (CET)
Received: from localhost ([::1]:44780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkz8U-0000oe-0L
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 20:44:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mkz0P-0005h4-D4
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 20:35:59 -0500
Received: from mail.loongson.cn ([114.242.206.163]:54004 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mkz0K-0001iW-Ed
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 20:35:56 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr9Ngc4xh9RMCAA--.4955S12; 
 Thu, 11 Nov 2021 09:35:43 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 10/30] target/loongarch: Add other core instructions
 support
Date: Thu, 11 Nov 2021 09:35:08 +0800
Message-Id: <1636594528-8175-11-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9Dxr9Ngc4xh9RMCAA--.4955S12
X-Coremail-Antispam: 1UD129KBjvJXoW3Kr47CFWkWw1kWFW3tr1DKFg_yoWkAr43pF
 4IkrWjkr48Jr97Jwnrt3WYyrn8Xr4xCa1xZayft34FvF47Xa4kZF48trW3KFWUXwn5ZFWU
 ZFn8AryjvFy7Xw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: Song Gao <gaosong@loongson.cn>
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
 target/loongarch/helper.h                    |  4 +
 target/loongarch/insn_trans/trans_core.c.inc | 62 +++++++++++++++
 target/loongarch/insns.decode                | 15 ++++
 target/loongarch/internals.h                 |  5 ++
 target/loongarch/op_helper.c                 | 44 ++++++++++
 target/loongarch/tlb_helper.c                | 84 ++++++++++++++++++++
 7 files changed, 216 insertions(+)

diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index 4881f18cf1..6f7c13d366 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -449,6 +449,8 @@ enum {
     EXCP_LAST = EXCP_DINT,
 };
 
+#define CPU_INTERRUPT_WAKE CPU_INTERRUPT_TGT_INT_0
+
 #define LOONGARCH_CPU_TYPE_SUFFIX "-" TYPE_LOONGARCH_CPU
 #define LOONGARCH_CPU_TYPE_NAME(model) model LOONGARCH_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_LOONGARCH_CPU
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index dea0087273..afb362c9c7 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -110,4 +110,8 @@ DEF_HELPER_1(tlbrd, void, env)
 DEF_HELPER_1(tlbclr, void, env)
 DEF_HELPER_1(tlbflush, void, env)
 DEF_HELPER_4(invtlb, void, env, tl, tl, tl)
+DEF_HELPER_4(lddir, tl, env, tl, tl, i32)
+DEF_HELPER_4(ldpte, void, env, tl, tl, i32)
+DEF_HELPER_1(ertn, void, env)
+DEF_HELPER_1(idle, void, env)
 #endif /* !CONFIG_USER_ONLY */
diff --git a/target/loongarch/insn_trans/trans_core.c.inc b/target/loongarch/insn_trans/trans_core.c.inc
index c34163efec..37cae8c579 100644
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
 static bool trans_csrrd(DisasContext *ctx, arg_csrrd *a)
@@ -442,6 +448,13 @@ static bool trans_iocsrwr_d(DisasContext *ctx, arg_iocsrwr_d *a)
     return true;
 }
 
+static bool trans_cacop(DisasContext *ctx, arg_cacop *a)
+{
+    /* Treat the cacop as a nop */
+    gen_helper_check_plv(cpu_env);
+    return true;
+}
+
 static bool trans_tlbsrch(DisasContext *ctx, arg_tlbsrch *a)
 {
     gen_helper_check_plv(cpu_env);
@@ -505,4 +518,53 @@ static bool trans_invtlb(DisasContext *ctx, arg_invtlb *a)
     return true;
 }
 
+static bool trans_ldpte(DisasContext *ctx, arg_ldpte *a)
+{
+    TCGv_i32 mem_idx = tcg_constant_i32(ctx->mem_idx);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+
+    gen_helper_check_plv(cpu_env);
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
+    gen_helper_check_plv(cpu_env);
+    gen_helper_lddir(dest, cpu_env, src, tcg_constant_tl(a->level), mem_idx);
+    return true;
+}
+
+static bool trans_ertn(DisasContext *ctx, arg_ertn *a)
+{
+    gen_helper_check_plv(cpu_env);
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
+    gen_helper_check_plv(cpu_env);
+    generate_exception(ctx, EXCP_DBP);
+    return true;
+}
+
+static bool trans_idle(DisasContext *ctx, arg_idle *a)
+{
+    gen_helper_check_plv(cpu_env);
+
+    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next + 4);
+    gen_helper_idle(cpu_env);
+    ctx->base.is_jmp = DISAS_NORETURN;
+    return true;
+}
 #endif
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index f5031e089e..bb6f0b912b 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -41,9 +41,12 @@
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
 &fmt_rjrdoffs16     rj rd offs16
 &fmt_rdcsr          rd csr
 &fmt_rdrjcsr        rd rj csr
+&fmt_coprjsi12      cop rj si12
 &fmt_empty
 &fmt_invtlb         invop rj rk
+&fmt_rdrjlevel      rd rj level
+&fmt_rjseq          rj seq
 
 #
 # Formats
@@ -132,8 +138,11 @@
 @fmt_rjrdoffs16      .... .. ................ ..... .....     &fmt_rjrdoffs16     %rj %rd %offs16
 @fmt_rdcsr           .... .... .............. ..... .....     &fmt_rdcsr          %rd %csr
 @fmt_rdrjcsr         .... .... .............. ..... .....     &fmt_rdrjcsr        %rd %rj %csr
+@fmt_coprjsi12       .... ...... ............ ..... .....     &fmt_coprjsi12      %cop %rj %si12
 @fmt_empty           .... ........ ..... ..... ..... .....    &fmt_empty
 @fmt_invtlb          ...... ...... ..... ..... ..... .....    &fmt_invtlb         %invop %rj %rk
+@fmt_rdrjlevel       .... ........ .. ........ ..... .....    &fmt_rdrjlevel      %rd %rj %level
+@fmt_rjseq           .... ........ .. ........ ..... .....    &fmt_rjseq          %rj %seq
 
 #
 # Fixed point arithmetic operation instruction
@@ -506,6 +515,7 @@ iocsrwr_b        0000 01100100 10000 00100 ..... .....    @fmt_rdrj
 iocsrwr_h        0000 01100100 10000 00101 ..... .....    @fmt_rdrj
 iocsrwr_w        0000 01100100 10000 00110 ..... .....    @fmt_rdrj
 iocsrwr_d        0000 01100100 10000 00111 ..... .....    @fmt_rdrj
+cacop            0000 011000 ............ ..... .....     @fmt_coprjsi12
 tlbsrch          0000 01100100 10000 01010 00000 00000    @fmt_empty
 tlbrd            0000 01100100 10000 01011 00000 00000    @fmt_empty
 tlbwr            0000 01100100 10000 01100 00000 00000    @fmt_empty
@@ -513,3 +523,8 @@ tlbfill          0000 01100100 10000 01101 00000 00000    @fmt_empty
 tlbclr           0000 01100100 10000 01000 00000 00000    @fmt_empty
 tlbflush         0000 01100100 10000 01001 00000 00000    @fmt_empty
 invtlb           0000 01100100 10011 ..... ..... .....    @fmt_invtlb
+lddir            0000 01100100 00 ........ ..... .....    @fmt_rdrjlevel
+ldpte            0000 01100100 01 ........ ..... 00000    @fmt_rjseq
+ertn             0000 01100100 10000 01110 00000 00000    @fmt_empty
+idle             0000 01100100 10001 ...............      @fmt_whint
+dbcl             0000 00000010 10101 ...............      @fmt_code
diff --git a/target/loongarch/internals.h b/target/loongarch/internals.h
index 3f72492b91..3177098337 100644
--- a/target/loongarch/internals.h
+++ b/target/loongarch/internals.h
@@ -13,6 +13,11 @@
 #define FCMP_UN   0x0100  /* unordered */
 #define FCMP_GT   0x1000  /* fp0 > fp1 */
 
+/* Global bit used for lddir/ldpte */
+#define LOONGARCH_PAGE_HUGE_SHIFT   6
+/* Global bit for huge page */
+#define LOONGARCH_HGLOBAL_SHIFT     12
+
 void loongarch_translate_init(void);
 
 void loongarch_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
diff --git a/target/loongarch/op_helper.c b/target/loongarch/op_helper.c
index 20014ef07a..e2a9fd9ad0 100644
--- a/target/loongarch/op_helper.c
+++ b/target/loongarch/op_helper.c
@@ -91,4 +91,48 @@ void helper_check_plv(CPULoongArchState *env)
         do_raise_exception(env, EXCP_IPE, GETPC());
     }
 }
+
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
+        if (qemu_loglevel_mask(CPU_LOG_INT)) {
+            qemu_log("%s: TLBRERA 0x%lx\n", __func__, env->CSR_TLBRERA);
+        }
+    } else {
+        csr_pplv = FIELD_EX64(env->CSR_PRMD, CSR_PRMD, PPLV);
+        csr_pie = FIELD_EX64(env->CSR_PRMD, CSR_PRMD, PIE);
+
+        /* set pc*/
+        env->pc = env->CSR_ERA;
+        if (qemu_loglevel_mask(CPU_LOG_INT)) {
+            qemu_log("%s: ERA 0x%lx\n", __func__, env->CSR_ERA);
+        }
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
+
 #endif /* !CONFIG_USER_ONLY */
diff --git a/target/loongarch/tlb_helper.c b/target/loongarch/tlb_helper.c
index f36e379499..7253b10889 100644
--- a/target/loongarch/tlb_helper.c
+++ b/target/loongarch/tlb_helper.c
@@ -815,3 +815,87 @@ bool loongarch_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
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
+        do_raise_exception(env, EXCP_INE, GETPC());
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
+    if (huge) {
+        /* Huge Page. base is paddr */
+        tmp0 = base ^ LOONGARCH_PAGE_HUGE_SHIFT;
+        /* Move Global bit */
+        tmp0 = (tmp0 >> LOONGARCH_HGLOBAL_SHIFT) << R_CSR_TLBELO0_G_SHIFT |
+               (tmp0 & (~(1 << R_CSR_TLBELO0_G_SHIFT)));
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


