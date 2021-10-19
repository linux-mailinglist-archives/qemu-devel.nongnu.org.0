Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9CD432FBA
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 09:37:57 +0200 (CEST)
Received: from localhost ([::1]:36046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcjh6-0003wH-Os
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 03:37:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mcjev-0001G4-Qw
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:35:42 -0400
Received: from mail.loongson.cn ([114.242.206.163]:34766 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mcjes-0004S1-7x
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:35:41 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP2s1dW5h3HwcAA--.43474S10; 
 Tue, 19 Oct 2021 15:35:31 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/31] target/loongarch: Add tlb instruction support
Date: Tue, 19 Oct 2021 15:34:54 +0800
Message-Id: <1634628917-10031-9-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9DxP2s1dW5h3HwcAA--.43474S10
X-Coremail-Antispam: 1UD129KBjvAXoWfAF1fWw4UKFW7Cw4DtFyxKrg_yoW8tr18to
 Wava1rt3WfGr4S9F9Fyw1qqa12qryUCan3CrnI9w45Way8Gr9rK34rKas5Aw4xCrn0qFyr
 A3W2va45JF13Jrn3n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUUUUUU=
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
- TLBSRCH
- TLBRD
- TLBWR
- TLBFILL
- TLBCLR
- TLBFLUSH
- INVTLB

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/cpu.c                   |  19 +
 target/loongarch/helper.h                |   8 +
 target/loongarch/insn_trans/trans_core.c |  54 +++
 target/loongarch/insns.decode            |  14 +
 target/loongarch/internals.h             |  18 +
 target/loongarch/tlb_helper.c            | 468 +++++++++++++++++++++++
 6 files changed, 581 insertions(+)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index f145afb603..afd186abac 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -118,6 +118,7 @@ static void set_loongarch_cpucfg(CPULoongArchState *env)
 static void set_loongarch_csr(CPULoongArchState *env)
 {
     uint64_t t;
+    CPUState *cs = env_cpu(env);
 
     t = FIELD_DP64(0, CSR_PRCFG1, SAVE_NUM, 8);
     t = FIELD_DP64(t, CSR_PRCFG1, TIMER_BITS, 0x2f);
@@ -145,6 +146,9 @@ static void set_loongarch_csr(CPULoongArchState *env)
     env->CSR_RVACFG = 0x0;
     env->CSR_ASID = 0xa0000;
     env->CSR_ERA = env->pc;
+    env->CSR_CPUID = (cs->cpu_index & 0x1ff);
+    env->CSR_EENTRY |= (uint64_t)0x80000000;
+    env->CSR_TLBRENTRY |= (uint64_t)0x80000000;
 }
 #endif
 
@@ -265,6 +269,21 @@ void loongarch_cpu_dump_state(CPUState *cs, FILE *f, int flags)
         }
     }
 
+#ifndef CONFIG_USER_ONLY
+    qemu_fprintf(f, "EUEN            0x%lx\n", env->CSR_EUEN);
+    qemu_fprintf(f, "ESTAT           0x%lx\n", env->CSR_ESTAT);
+    qemu_fprintf(f, "ERA             0x%lx\n", env->CSR_ERA);
+    qemu_fprintf(f, "CRMD            0x%lx\n", env->CSR_CRMD);
+    qemu_fprintf(f, "PRMD            0x%lx\n", env->CSR_PRMD);
+    qemu_fprintf(f, "BadVAddr        0x%lx\n", env->CSR_BADV);
+    qemu_fprintf(f, "TLB refill ERA  0x%lx\n", env->CSR_TLBRERA);
+    qemu_fprintf(f, "TLB refill BadV 0x%lx\n", env->CSR_TLBRBADV);
+    qemu_fprintf(f, "EENTRY            0x%lx\n", env->CSR_EENTRY);
+    qemu_fprintf(f, "BadInstr        0x%lx\n", env->CSR_BADI);
+    qemu_fprintf(f, "PRCFG1    0x%lx\nPRCFG2     0x%lx\nPRCFG3     0x%lx\n",
+                 env->CSR_PRCFG1, env->CSR_PRCFG3, env->CSR_PRCFG3);
+#endif
+
     /* fpr */
     if (flags & CPU_DUMP_FPU) {
         for (i = 0; i < 32; i++) {
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index d1f18d71f7..1bb1df91b3 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -102,6 +102,14 @@ DEF_HELPER_2(csr_rdq, i64, env, i64)
 DEF_HELPER_3(csr_wrq, i64, env, tl, i64)
 DEF_HELPER_4(csr_xchgq, i64, env, tl, tl, i64)
 DEF_HELPER_3(csr_xchgq_r0, void, env, tl, i64)
+
+DEF_HELPER_1(tlbwr, void, env)
+DEF_HELPER_1(tlbfill, void, env)
+DEF_HELPER_1(tlbsrch, void, env)
+DEF_HELPER_1(tlbrd, void, env)
+DEF_HELPER_1(tlbclr, void, env)
+DEF_HELPER_1(tlbflush, void, env)
+DEF_HELPER_4(invtlb, void, env, tl, tl, tl)
 DEF_HELPER_2(iocsr_read, i64, env, tl)
 DEF_HELPER_4(iocsr_write, void, env, tl, tl, i32)
 #endif /* !CONFIG_USER_ONLY */
diff --git a/target/loongarch/insn_trans/trans_core.c b/target/loongarch/insn_trans/trans_core.c
index b1ca2faf04..f8a72436dd 100644
--- a/target/loongarch/insn_trans/trans_core.c
+++ b/target/loongarch/insn_trans/trans_core.c
@@ -27,6 +27,13 @@ GEN_FALSE_TRANS(iocsrwr_b)
 GEN_FALSE_TRANS(iocsrwr_h)
 GEN_FALSE_TRANS(iocsrwr_w)
 GEN_FALSE_TRANS(iocsrwr_d)
+GEN_FALSE_TRANS(tlbsrch)
+GEN_FALSE_TRANS(tlbrd)
+GEN_FALSE_TRANS(tlbwr)
+GEN_FALSE_TRANS(tlbfill)
+GEN_FALSE_TRANS(tlbclr)
+GEN_FALSE_TRANS(tlbflush)
+GEN_FALSE_TRANS(invtlb)
 
 #else
 static bool trans_csrrd(DisasContext *ctx, unsigned rd, unsigned csr)
@@ -165,4 +172,51 @@ static bool trans_iocsrwr_d(DisasContext *ctx, arg_iocsrwr_d *a)
     gen_helper_iocsr_write(cpu_env, addr, val, tcg_constant_i32(oi));
     return true;
 }
+
+static bool trans_tlbsrch(DisasContext *ctx, arg_tlbsrch *a)
+{
+    gen_helper_tlbsrch(cpu_env);
+    return true;
+}
+
+static bool trans_tlbrd(DisasContext *ctx, arg_tlbrd *a)
+{
+    gen_helper_tlbrd(cpu_env);
+    return true;
+}
+
+static bool trans_tlbwr(DisasContext *ctx, arg_tlbwr *a)
+{
+    gen_helper_tlbwr(cpu_env);
+    return true;
+}
+
+static bool trans_tlbfill(DisasContext *ctx, arg_tlbfill *a)
+{
+    gen_helper_tlbfill(cpu_env);
+    return true;
+}
+
+static bool trans_tlbclr(DisasContext *ctx, arg_tlbclr *a)
+{
+    gen_helper_tlbclr(cpu_env);
+    return true;
+}
+
+static bool trans_tlbflush(DisasContext *ctx, arg_tlbflush *a)
+{
+    gen_helper_tlbflush(cpu_env);
+    return true;
+}
+
+static bool trans_invtlb(DisasContext *ctx, arg_invtlb *a)
+{
+    TCGv addr = gpr_src(ctx, a->addr, EXT_NONE);
+    TCGv info = gpr_src(ctx, a->info, EXT_NONE);
+    TCGv op = tcg_constant_tl(a->invop);
+
+    gen_helper_invtlb(cpu_env, addr, info, op);
+    return true;
+}
+
 #endif
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index a4a6df4f1a..aa40ecfca7 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -42,6 +42,9 @@
 %offs16  10:s16
 %offs    0:s10 10:16
 %csr     10:14
+%addr    10:5
+%info    5:5
+%invop   0:5
 
 #
 # Argument sets
@@ -84,6 +87,8 @@
 &fmt_offs           offs
 &fmt_rjrdoffs16     rj rd offs16
 &fmt_rdrjcsr        rd rj csr
+&fmt_empty
+&fmt_invtlb         addr info invop
 
 #
 # Formats
@@ -126,6 +131,8 @@
 @fmt_offs            .... .. ..........................       &fmt_offs           %offs
 @fmt_rjrdoffs16      .... .. ................ ..... .....     &fmt_rjrdoffs16     %rj %rd %offs16
 @fmt_rdrjcsr         .... .... .............. ..... .....     &fmt_rdrjcsr        %rd %rj %csr
+@fmt_empty           .... ........ ..... ..... ..... .....    &fmt_empty
+@fmt_invtlb          ...... ...... ..... ..... ..... .....    &fmt_invtlb         %addr %info %invop
 
 #
 # Fixed point arithmetic operation instruction
@@ -494,3 +501,10 @@ iocsrwr_b        0000 01100100 10000 00100 ..... .....    @fmt_rdrj
 iocsrwr_h        0000 01100100 10000 00101 ..... .....    @fmt_rdrj
 iocsrwr_w        0000 01100100 10000 00110 ..... .....    @fmt_rdrj
 iocsrwr_d        0000 01100100 10000 00111 ..... .....    @fmt_rdrj
+tlbsrch          0000 01100100 10000 01010 00000 00000    @fmt_empty
+tlbrd            0000 01100100 10000 01011 00000 00000    @fmt_empty
+tlbwr            0000 01100100 10000 01100 00000 00000    @fmt_empty
+tlbfill          0000 01100100 10000 01101 00000 00000    @fmt_empty
+tlbclr           0000 01100100 10000 01000 00000 00000    @fmt_empty
+tlbflush         0000 01100100 10000 01001 00000 00000    @fmt_empty
+invtlb           0000 01100100 10011 ..... ..... .....    @fmt_invtlb
diff --git a/target/loongarch/internals.h b/target/loongarch/internals.h
index 1251e7f21c..916c675680 100644
--- a/target/loongarch/internals.h
+++ b/target/loongarch/internals.h
@@ -76,6 +76,14 @@ struct CPULoongArchTLBContext {
     int (*map_address)(struct CPULoongArchState *env, hwaddr *physical,
                        int *prot, target_ulong address,
                        MMUAccessType access_type);
+    void (*helper_tlbwr)(struct CPULoongArchState *env);
+    void (*helper_tlbfill)(struct CPULoongArchState *env);
+    void (*helper_tlbsrch)(struct CPULoongArchState *env);
+    void (*helper_tlbrd)(struct CPULoongArchState *env);
+    void (*helper_tlbclr)(struct CPULoongArchState *env);
+    void (*helper_tlbflush)(struct CPULoongArchState *env);
+    void (*helper_invtlb)(struct CPULoongArchState *env, target_ulong addr,
+                          target_ulong info, int op);
     struct {
         uint64_t     stlb_mask;
         uint32_t     stlb_size; /* at most : 8 * 256 = 2048 */
@@ -89,6 +97,16 @@ int ls3a5k_map_address(CPULoongArchState *env, hwaddr *physical, int *prot,
 
 void ls3a5k_mmu_init(CPULoongArchState *env);
 hwaddr loongarch_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
+void ls3a5k_helper_tlbwr(CPULoongArchState *env);
+void ls3a5k_helper_tlbfill(CPULoongArchState *env);
+void ls3a5k_helper_tlbsrch(CPULoongArchState *env);
+void ls3a5k_helper_tlbrd(CPULoongArchState *env);
+void ls3a5k_helper_tlbclr(CPULoongArchState *env);
+void ls3a5k_helper_tlbflush(CPULoongArchState *env);
+void ls3a5k_invalidate_tlb(CPULoongArchState *env, int idx);
+void ls3a5k_helper_invtlb(CPULoongArchState *env, target_ulong addr,
+                          target_ulong info, int op);
+void cpu_loongarch_tlb_flush(CPULoongArchState *env);
 #endif
 
 #endif
diff --git a/target/loongarch/tlb_helper.c b/target/loongarch/tlb_helper.c
index 70105cdced..fd844d5a46 100644
--- a/target/loongarch/tlb_helper.c
+++ b/target/loongarch/tlb_helper.c
@@ -10,6 +10,7 @@
 
 #include "cpu.h"
 #include "internals.h"
+#include "exec/helper-proto.h"
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
 #include "exec/log.h"
@@ -277,6 +278,428 @@ static void raise_mmu_exception(CPULoongArchState *env, target_ulong address,
     env->CSR_TLBEHI = address & (TARGET_PAGE_MASK << 1);
 }
 
+void cpu_loongarch_tlb_flush(CPULoongArchState *env)
+{
+    /* Flush qemu's TLB and discard all shadowed entries. */
+    tlb_flush(env_cpu(env));
+}
+
+static void ls3a5k_invalidate_tlb_entry(CPULoongArchState *env,
+                                        ls3a5k_tlb_t *tlb)
+{
+    CPUState *cs = env_cpu(env);
+    target_ulong    addr;
+    target_ulong    end;
+    target_ulong    mask;
+
+    mask = tlb->PageMask; /* 000...000111...111 */
+
+    if (tlb->V0) {
+        addr = tlb->VPN & ~mask;    /* xxx...xxx[0]000..0000 */
+        end = addr | (mask >> 1);   /* xxx...xxx[0]111..1111 */
+        while (addr < end) {
+            tlb_flush_page(cs, addr);
+            addr += TARGET_PAGE_SIZE;
+        }
+    }
+
+    if (tlb->V1) {
+        /* xxx...xxx[1]000..0000 */
+        addr = (tlb->VPN & ~mask) | ((mask >> 1) + 1);
+        end = addr | mask;              /* xxx...xxx[1]111..1111 */
+        while (addr - 1 < end) {
+            tlb_flush_page(cs, addr);
+            addr += TARGET_PAGE_SIZE;
+        }
+    }
+}
+
+void ls3a5k_invalidate_tlb(CPULoongArchState *env, int idx)
+{
+    ls3a5k_tlb_t *tlb;
+    uint16_t asid = FIELD_EX64(env->CSR_ASID, CSR_ASID, ASID);
+
+    tlb = &env->tlb->ls3a5k.tlb[idx];
+    if (tlb->G == 0 && tlb->ASID != asid) {
+        return;
+    }
+    ls3a5k_invalidate_tlb_entry(env, tlb);
+}
+
+static uint64_t ls3a5k_pagesize_to_mask(int pagesize)
+{
+    /* 4KB - 1GB */
+    if (pagesize < 12 && pagesize > 30) {
+        qemu_log_mask(CPU_LOG_MMU, "unsupported page size %d\n", pagesize);
+        exit(-1);
+    }
+
+    return (1 << (pagesize + 1)) - 1;
+}
+
+static void ls3a5k_fill_tlb_entry(CPULoongArchState *env,
+                                  ls3a5k_tlb_t *tlb, int is_stlb)
+{
+    uint64_t page_mask;  /* 0000...00001111...1111 */
+    uint32_t page_size;
+    uint64_t entryhi;
+    uint64_t lo0, lo1;
+
+    if (env->CSR_TLBRERA & 0x1) {
+        page_size = env->CSR_TLBREHI & 0x3f;
+        entryhi = env->CSR_TLBREHI;
+        lo0 = env->CSR_TLBRELO0;
+        lo1 = env->CSR_TLBRELO1;
+    } else {
+        page_size = FIELD_EX64(env->CSR_TLBIDX, CSR_TLBIDX, PS);
+        entryhi = env->CSR_TLBEHI;
+        lo0 = env->CSR_TLBELO0;
+        lo1 = env->CSR_TLBELO1;
+    }
+
+    if (page_size == 0) {
+        qemu_log_mask(CPU_LOG_MMU, "page size is 0\n");
+    }
+
+    /*
+     *       15-12  11-8   7-4    3-0
+     *  4KB: 0001   1111   1111   1111 // double 4KB  mask [12:0]
+     * 16KB: 0111   1111   1111   1111 // double 16KB mask [14:0]
+     */
+    if (is_stlb) {
+        page_mask = env->tlb->ls3a5k.stlb_mask;
+    } else {
+        page_mask = ls3a5k_pagesize_to_mask(page_size);
+    }
+
+    tlb->VPN = entryhi & 0xffffffffe000 & ~page_mask;
+
+    tlb->ASID = FIELD_EX64(env->CSR_ASID, CSR_ASID, ASID);
+    tlb->NE = 0;
+    tlb->G = FIELD_EX64(env->CSR_TLBELO0, CSR_TLBELO0, G) &
+             FIELD_EX64(env->CSR_TLBELO1, CSR_TLBELO1, G);
+
+    tlb->PageMask = page_mask;
+    tlb->PageSize = page_size;
+
+    tlb->V0 = FIELD_EX64(lo0, CSR_TLBELO0, V);      /* [0] */
+    tlb->D0 = FIELD_EX64(lo0, CSR_TLBELO0, D);      /* [1] */
+    tlb->PLV0 = FIELD_EX64(lo0, CSR_TLBELO0, PLV);  /* [3:2] */
+    tlb->MAT0 = FIELD_EX64(lo0, CSR_TLBELO0, MAT);  /* [5:4] */
+    tlb->PPN0 = (lo0 & 0xfffffffff000 & ~(page_mask >> 1));
+    tlb->NR0 = FIELD_EX64(lo0, CSR_TLBELO0, NR);    /* [61] */
+    tlb->NX0 = FIELD_EX64(lo0, CSR_TLBELO0, NX);    /* [62] */
+    tlb->RPLV0 = FIELD_EX64(lo0, CSR_TLBELO0, RPLV);/* [63] */
+
+    tlb->V1 = FIELD_EX64(lo1, CSR_TLBELO1, V);      /* [0] */
+    tlb->D1 = FIELD_EX64(lo1, CSR_TLBELO1, D);      /* [1] */
+    tlb->PLV1 = FIELD_EX64(lo1, CSR_TLBELO1, PLV);  /* [3:2] */
+    tlb->MAT1 = FIELD_EX64(lo1, CSR_TLBELO1, MAT);  /* [5:4] */
+    tlb->PPN1 = (lo1 & 0xfffffffff000 & ~(page_mask >> 1));
+    tlb->NR1 = FIELD_EX64(lo1, CSR_TLBELO1, NR);    /* [61] */
+    tlb->NX1 = FIELD_EX64(lo1, CSR_TLBELO1, NX);    /* [62] */
+    tlb->RPLV1 = FIELD_EX64(lo1, CSR_TLBELO1, RPLV);/* [63] */
+}
+
+static void ls3a5k_fill_tlb(CPULoongArchState *env, int idx, bool tlbwr)
+{
+    ls3a5k_tlb_t *tlb;
+
+    tlb = &env->tlb->ls3a5k.tlb[idx];
+    if (tlbwr) {
+        if (FIELD_EX64(env->CSR_TLBIDX, CSR_TLBIDX, NE)) {
+            tlb->NE = 1;
+            return;
+        }
+    }
+
+    if (idx < 2048) {
+        ls3a5k_fill_tlb_entry(env, tlb, 1);
+    } else {
+        ls3a5k_fill_tlb_entry(env, tlb, 0);
+    }
+}
+
+/* return random value in [low, high] */
+static uint32_t cpu_loongarch_get_random_ls3a5k_tlb(uint32_t low, uint32_t high)
+{
+    static uint32_t seed = 5;
+    static uint32_t prev_idx;
+    uint32_t idx;
+    uint32_t nb_rand_tlb = high - low + 1;
+
+    do {
+        seed = 1103515245 * seed + 12345;
+        idx = (seed >> 16) % nb_rand_tlb + low;
+    } while (idx == prev_idx);
+    prev_idx = idx;
+
+    return idx;
+}
+
+void ls3a5k_helper_tlbsrch(CPULoongArchState *env)
+{
+    uint64_t mask;
+    uint64_t vpn;
+    uint64_t tag;
+    uint16_t asid;
+
+    int stlb_size = env->tlb->ls3a5k.stlb_size;
+    int mtlb_size = env->tlb->ls3a5k.mtlb_size;
+    int i;
+    ls3a5k_tlb_t *tlb;
+    asid = FIELD_EX64(env->CSR_ASID, CSR_ASID, ASID);
+
+    /* search MTLB + STLB */
+    for (i = 0; i < stlb_size + mtlb_size; ++i) {
+        tlb = &env->tlb->ls3a5k.tlb[i];
+        mask = tlb->PageMask;
+        vpn = env->CSR_TLBEHI & 0xffffffffe000 & ~mask;
+        tag = tlb->VPN & ~mask;
+
+        if ((tlb->G == 1 || tlb->ASID == asid) && vpn == tag && tlb->NE != 1) {
+            env->CSR_TLBIDX = FIELD_DP64(env->CSR_TLBIDX, CSR_TLBIDX,
+                                         INDEX, (i & 0xfff));
+            env->CSR_TLBIDX = FIELD_DP64(env->CSR_TLBIDX, CSR_TLBIDX,
+                                         PS, (tlb->PageSize & 0x3f));
+            return;
+        }
+    }
+
+    env->CSR_TLBIDX = FIELD_DP64(env->CSR_TLBIDX, CSR_TLBIDX, NE, 1);
+}
+
+void ls3a5k_helper_tlbrd(CPULoongArchState *env)
+{
+    ls3a5k_tlb_t    *tlb;
+    int             idx;
+    uint16_t        asid;
+
+    idx = FIELD_EX64(env->CSR_TLBIDX, CSR_TLBIDX, INDEX);
+    tlb = &env->tlb->ls3a5k.tlb[idx];
+
+    asid = FIELD_EX64(env->CSR_ASID, CSR_ASID, ASID);
+
+    if (asid != tlb->ASID) {
+        cpu_loongarch_tlb_flush(env);
+    }
+
+    if (tlb->NE) {
+        /* invalid TLB entry */
+        env->CSR_TLBIDX = FIELD_DP64(env->CSR_TLBIDX, CSR_TLBIDX, NE, 1);
+        env->CSR_TLBEHI = 0;
+        env->CSR_TLBELO0 = 0;
+        env->CSR_TLBELO1 = 0;
+    } else {
+        /* valid TLB entry */
+        env->CSR_TLBIDX = FIELD_DP64(env->CSR_TLBIDX, CSR_TLBIDX,
+                                     INDEX, (idx & 0xfff));
+        env->CSR_TLBIDX = FIELD_DP64(env->CSR_TLBIDX, CSR_TLBIDX,
+                                     PS, (tlb->PageSize & 0x3f));
+        env->CSR_TLBEHI = tlb->VPN;
+
+        env->CSR_TLBELO0 = FIELD_DP64(0, CSR_TLBELO0, V, tlb->V0);
+        env->CSR_TLBELO0 = FIELD_DP64(env->CSR_TLBELO0, CSR_TLBELO0, D, tlb->D0);
+        env->CSR_TLBELO0 = FIELD_DP64(env->CSR_TLBELO0, CSR_TLBELO0, PLV, tlb->PLV0);
+        env->CSR_TLBELO0 = FIELD_DP64(env->CSR_TLBELO0, CSR_TLBELO0, MAT, tlb->MAT0);
+        env->CSR_TLBELO0 = FIELD_DP64(env->CSR_TLBELO0, CSR_TLBELO0, G, tlb->G);
+        env->CSR_TLBELO0 = FIELD_DP64(env->CSR_TLBELO0, CSR_TLBELO0, PPN, tlb->PPN0);
+        env->CSR_TLBELO0 = FIELD_DP64(env->CSR_TLBELO0, CSR_TLBELO0, NR, tlb->NR0);
+        env->CSR_TLBELO0 = FIELD_DP64(env->CSR_TLBELO0, CSR_TLBELO0, NX, tlb->NX0);
+        env->CSR_TLBELO0 = FIELD_DP64(env->CSR_TLBELO0, CSR_TLBELO0, RPLV, tlb->RPLV0);
+
+        env->CSR_TLBELO1 = FIELD_DP64(0, CSR_TLBELO1, V, tlb->V1);
+        env->CSR_TLBELO1 = FIELD_DP64(env->CSR_TLBELO1, CSR_TLBELO1, D, tlb->D1);
+        env->CSR_TLBELO1 = FIELD_DP64(env->CSR_TLBELO1, CSR_TLBELO1, PLV, tlb->PLV1);
+        env->CSR_TLBELO1 = FIELD_DP64(env->CSR_TLBELO1, CSR_TLBELO1, MAT, tlb->MAT1);
+        env->CSR_TLBELO1 = FIELD_DP64(env->CSR_TLBELO1, CSR_TLBELO1, G, tlb->G);
+        env->CSR_TLBELO1 = FIELD_DP64(env->CSR_TLBELO1, CSR_TLBELO1, PPN, tlb->PPN1);
+        env->CSR_TLBELO1 = FIELD_DP64(env->CSR_TLBELO1, CSR_TLBELO1, NR, tlb->NR1);
+        env->CSR_TLBELO1 = FIELD_DP64(env->CSR_TLBELO1, CSR_TLBELO1, NX, tlb->NX1);
+        env->CSR_TLBELO1 = FIELD_DP64(env->CSR_TLBELO1, CSR_TLBELO1, RPLV, tlb->RPLV1);
+
+        env->CSR_ASID  = FIELD_DP64(env->CSR_ASID, CSR_ASID, ASID, tlb->ASID);
+    }
+}
+
+void ls3a5k_helper_tlbwr(CPULoongArchState *env)
+{
+    int idx = FIELD_EX64(env->CSR_TLBIDX, CSR_TLBIDX, INDEX); /* 0-11 */
+
+    ls3a5k_invalidate_tlb(env, idx);
+    ls3a5k_fill_tlb(env, idx, true);
+}
+
+void ls3a5k_helper_tlbfill(CPULoongArchState *env)
+{
+    uint64_t mask;
+    uint64_t address;
+    int idx;
+    int set, stlb_idx;
+
+    uint64_t entryhi;
+    uint32_t pagesize;
+
+    if (env->CSR_TLBRERA & 0x1) {
+        entryhi = env->CSR_TLBREHI & ~0x3f;
+        pagesize = env->CSR_TLBREHI & 0x3f;
+    } else {
+        entryhi = env->CSR_TLBEHI;
+        pagesize = FIELD_EX64(env->CSR_TLBIDX, CSR_TLBIDX, PS);
+    }
+
+    uint32_t stlb_size = env->tlb->ls3a5k.stlb_size;
+    uint32_t mtlb_size = env->tlb->ls3a5k.mtlb_size;
+
+    mask = ls3a5k_pagesize_to_mask(pagesize);
+
+    if (mask == env->tlb->ls3a5k.stlb_mask &&
+        env->tlb->ls3a5k.stlb_size > 0) {
+        /* only write into STLB */
+        address = entryhi & 0xffffffffe000; /* [47:13] */
+
+        /* choose one set ramdomly */
+        set = cpu_loongarch_get_random_ls3a5k_tlb(0, 7);
+
+        /* index in one set */
+        stlb_idx = (address >> 15) & 0xff; /* [0,255] */
+
+        idx = set * 256 + stlb_idx;
+    } else {
+        /* only write into MTLB */
+        idx = cpu_loongarch_get_random_ls3a5k_tlb(
+                stlb_size, stlb_size + mtlb_size - 1);
+    }
+
+    ls3a5k_invalidate_tlb(env, idx);
+    ls3a5k_fill_tlb(env, idx, false);
+}
+
+void ls3a5k_helper_tlbclr(CPULoongArchState *env)
+{
+    int i;
+    uint16_t asid;
+    int msize, ssize, index;
+    ls3a5k_tlb_t *tlb;
+
+    asid = FIELD_EX64(env->CSR_ASID, CSR_ASID, ASID);
+    msize = env->tlb->ls3a5k.mtlb_size;
+    ssize = env->tlb->ls3a5k.stlb_size;
+    index = FIELD_EX64(env->CSR_TLBIDX, CSR_TLBIDX, INDEX);
+
+    if (index < ssize) {
+        /* STLB. One line per operation */
+        for (i = 0; i < 8; i++) {
+            tlb = &env->tlb->ls3a5k.tlb[i * 256 + (index % 256)];
+            if (!tlb->G && tlb->ASID == asid) {
+                tlb->NE = 1;
+            }
+        }
+    } else if (index < (ssize + msize)) {
+        /* MTLB. All entries */
+        for (i = ssize; i < ssize + msize; i++) {
+            tlb = &env->tlb->ls3a5k.tlb[i];
+            if (!tlb->G && tlb->ASID == asid) {
+                tlb->NE = 1;
+            }
+        }
+    }
+
+    cpu_loongarch_tlb_flush(env);
+}
+
+void ls3a5k_helper_tlbflush(CPULoongArchState *env)
+{
+    int i;
+    int msize, ssize, index;
+
+    msize = env->tlb->ls3a5k.mtlb_size;
+    ssize = env->tlb->ls3a5k.stlb_size;
+    index = FIELD_EX64(env->CSR_TLBIDX, CSR_TLBIDX, INDEX);
+
+    if (index < ssize) {
+        /* STLB. One line per operation */
+        for (i = 0; i < 8; i++) {
+            int idx = i * 256 + (index % 256);
+            env->tlb->ls3a5k.tlb[idx].NE = 1;
+        }
+    } else if (index < (ssize + msize)) {
+        /* MTLB. All entries */
+        for (i = ssize; i < ssize + msize; i++) {
+            env->tlb->ls3a5k.tlb[i].NE = 1;
+        }
+    }
+
+    cpu_loongarch_tlb_flush(env);
+}
+
+void ls3a5k_helper_invtlb(CPULoongArchState *env, target_ulong addr,
+                          target_ulong info, int op)
+{
+    uint32_t asid = info & 0x3ff;
+    int i;
+
+    switch (op) {
+    case 0:
+    case 1:
+        for (i = 0; i < env->tlb->nb_tlb; i++) {
+            env->tlb->ls3a5k.tlb[i].NE = 1;
+        }
+        break;
+    case 2:
+        for (i = 0; i < env->tlb->nb_tlb; i++) {
+            struct ls3a5k_tlb_t *tlb = &env->tlb->ls3a5k.tlb[i];
+
+            if (tlb->G) {
+                tlb->NE = 1;
+            }
+        }
+        break;
+    case 3:
+        for (i = 0; i < env->tlb->nb_tlb; i++) {
+            struct ls3a5k_tlb_t *tlb = &env->tlb->ls3a5k.tlb[i];
+
+            if (!tlb->G) {
+                tlb->NE = 1;
+            }
+        }
+        break;
+    case 4:
+        for (i = 0; i < env->tlb->nb_tlb; i++) {
+            struct ls3a5k_tlb_t *tlb = &env->tlb->ls3a5k.tlb[i];
+
+            if (!tlb->G && tlb->ASID == asid) {
+                tlb->NE = 1;
+            }
+        }
+        break;
+    case 5:
+        for (i = 0; i < env->tlb->nb_tlb; i++) {
+            struct ls3a5k_tlb_t *tlb = &env->tlb->ls3a5k.tlb[i];
+            uint64_t vpn = addr & 0xffffffffe000 & ~tlb->PageMask;
+
+            if (!tlb->G && tlb->ASID == asid && vpn == tlb->VPN) {
+                tlb->NE = 1;
+            }
+        }
+        break;
+    case 6:
+        for (i = 0; i < env->tlb->nb_tlb; i++) {
+            struct ls3a5k_tlb_t *tlb = &env->tlb->ls3a5k.tlb[i];
+            uint64_t vpn = addr & 0xffffffffe000 & ~tlb->PageMask;
+
+            if ((tlb->G || tlb->ASID == asid) && vpn == tlb->VPN) {
+                tlb->NE = 1;
+            }
+        }
+        break;
+    default:
+        do_raise_exception(env, EXCP_INE, GETPC());
+    }
+
+    cpu_loongarch_tlb_flush(env);
+}
+
 void ls3a5k_mmu_init(CPULoongArchState *env)
 {
     env->tlb = g_malloc0(sizeof(CPULoongArchTLBContext));
@@ -324,6 +747,51 @@ void ls3a5k_mmu_init(CPULoongArchState *env)
     }
 
     env->tlb->map_address = &ls3a5k_map_address;
+
+    /* TLB's helper functions */
+    env->tlb->helper_tlbsrch  = ls3a5k_helper_tlbsrch;
+    env->tlb->helper_tlbrd    = ls3a5k_helper_tlbrd;
+    env->tlb->helper_tlbwr    = ls3a5k_helper_tlbwr;
+    env->tlb->helper_tlbfill  = ls3a5k_helper_tlbfill;
+    env->tlb->helper_tlbclr   = ls3a5k_helper_tlbclr;
+    env->tlb->helper_tlbflush = ls3a5k_helper_tlbflush;
+    env->tlb->helper_invtlb   = ls3a5k_helper_invtlb;
+}
+
+void helper_tlbwr(CPULoongArchState *env)
+{
+    env->tlb->helper_tlbwr(env);
+}
+
+void helper_tlbfill(CPULoongArchState *env)
+{
+    env->tlb->helper_tlbfill(env);
+}
+
+void helper_tlbsrch(CPULoongArchState *env)
+{
+    env->tlb->helper_tlbsrch(env);
+}
+
+void helper_tlbrd(CPULoongArchState *env)
+{
+    env->tlb->helper_tlbrd(env);
+}
+
+void helper_tlbclr(CPULoongArchState *env)
+{
+    env->tlb->helper_tlbclr(env);
+}
+
+void helper_tlbflush(CPULoongArchState *env)
+{
+    env->tlb->helper_tlbflush(env);
+}
+
+void helper_invtlb(CPULoongArchState *env, target_ulong addr,
+                   target_ulong info, target_ulong op)
+{
+    env->tlb->helper_invtlb(env, addr, info, op);
 }
 
 bool loongarch_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-- 
2.27.0


