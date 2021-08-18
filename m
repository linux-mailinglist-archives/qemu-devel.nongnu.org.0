Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C757A3F0C83
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:16:09 +0200 (CEST)
Received: from localhost ([::1]:56670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRyq-0001Ey-T3
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:16:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGRA1-0007uf-81
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:37 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:45869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR9y-0002sA-H4
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:36 -0400
Received: by mail-pg1-x52f.google.com with SMTP id n18so3319030pgm.12
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=c7KL/Z3JBX9llLYW618LeYQ6EbHHuWPQnV9uUm0RU8s=;
 b=ZUACPllq862x5WanMEz2SFEChIl/W8jvkktaJmAZ4wLDWoZrYi89xgnQxh2LTdXHnW
 Q6nEGxCFv50YibjfyW1WQ2iH05npEXtERDUqW4WLJxrIpC6FHUZAk3uyT/EMp9SP79GE
 vOxNG6kSMEwkvbfBETHPsIaynmt7cCoSRk6A4UEO3qAOhJ06VVipQ/y8gsIAqR6pxJRO
 fKHdZVZ7A7On00Z+OAekDz0xuOPCLTTPYToh68z6BiqcFQzU64ehHTN4vD9kfo2KKZTv
 wM6ZtiTQumzsPdcbuHLUe/0GG+Y69+ZX8+xbgq0muz3I8o+BbBLClbBryo2KvXzt2Kx1
 PrAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c7KL/Z3JBX9llLYW618LeYQ6EbHHuWPQnV9uUm0RU8s=;
 b=Nfd/yuii8qZNMlEkKHQgb+MYb3+HcN3F3KqSFkq2666ZI47cyqxShKRxQxV6x7bGPp
 V3cxvwgLjDeXHFi6nxWrPIb1miFr7QCFHvJ4jZZZoWeUCIyCSeLRvmbRHTXv1E+7rPhX
 1ruoaBp38RnQ7QiXtyGKApwFR/I1vA/bQ+dXwdB0H8adOiPhUiatd1ANL/jbGZKkTyDe
 TNQSuCi4Sfqw+CYts/7U77S+tt/lKDltmwAV92KRJazlEZfguHl2+Fied6LEyEPXzr39
 BxVCUUdFv0ERT4OPb2hxcDMw2zJWuHhfIIPUFE+sARLWOJKkfcT9mokRdzdbM6RKeQMC
 N1Iw==
X-Gm-Message-State: AOAM531AlPSLLzRAGtx6U0u6w2K2kFpM7RWFtScm3WehbvsQ72Fr9qe7
 YvNOTzWpOWqNjZNwmpb/lhYnNIbuKg1E8A==
X-Google-Smtp-Source: ABdhPJzoJyLCH4YlNh5S5dlUiVbrpFsR2TWmlsO7R6N3sn2uctSmuOUdHlb67ULbVsxyA4swSbtFfw==
X-Received: by 2002:a65:5342:: with SMTP id w2mr10265392pgr.333.1629314613222; 
 Wed, 18 Aug 2021 12:23:33 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id w82sm569302pff.112.2021.08.18.12.23.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:23:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 58/66] include/exec: Move cpu_signal_handler declaration
Date: Wed, 18 Aug 2021 09:19:12 -1000
Message-Id: <20210818191920.390759-59-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is nothing target specific about this.  The implementation
is host specific, but the declaration is 100% common.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h | 13 +++++++++++++
 target/alpha/cpu.h      |  6 ------
 target/arm/cpu.h        |  7 -------
 target/avr/cpu.h        |  2 --
 target/cris/cpu.h       |  8 --------
 target/hexagon/cpu.h    |  3 ---
 target/hppa/cpu.h       |  3 ---
 target/i386/cpu.h       |  7 -------
 target/m68k/cpu.h       |  8 --------
 target/microblaze/cpu.h |  7 -------
 target/mips/cpu.h       |  3 ---
 target/mips/internal.h  |  2 --
 target/nios2/cpu.h      |  2 --
 target/openrisc/cpu.h   |  2 --
 target/ppc/cpu.h        |  7 -------
 target/riscv/cpu.h      |  2 --
 target/rx/cpu.h         |  4 ----
 target/s390x/cpu.h      |  7 -------
 target/sh4/cpu.h        |  3 ---
 target/sparc/cpu.h      |  2 --
 target/tricore/cpu.h    |  2 --
 target/xtensa/cpu.h     |  2 --
 22 files changed, 13 insertions(+), 89 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 5d1b6d80fb..9d5987ba04 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -662,6 +662,19 @@ static inline tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env,
     }
     return addr;
 }
+
+/**
+ * cpu_signal_handler
+ * @signum: host signal number
+ * @pinfo: host siginfo_t
+ * @puc: host ucontext_t
+ *
+ * To be called from the SIGBUS and SIGSEGV signal handler to inform the
+ * virtual cpu of exceptions.  Returns true if the signal was handled by
+ * the virtual CPU.
+ */
+int cpu_signal_handler(int signum, void *pinfo, void *puc);
+
 #else
 static inline void mmap_lock(void) {}
 static inline void mmap_unlock(void) {}
diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index d9099ea188..dfa34f93b4 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -287,7 +287,6 @@ void alpha_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
                                    uintptr_t retaddr) QEMU_NORETURN;
 
 #define cpu_list alpha_cpu_list
-#define cpu_signal_handler cpu_alpha_signal_handler
 
 typedef CPUAlphaState CPUArchState;
 typedef AlphaCPU ArchCPU;
@@ -442,11 +441,6 @@ void alpha_translate_init(void);
 #define CPU_RESOLVING_TYPE TYPE_ALPHA_CPU
 
 void alpha_cpu_list(void);
-/* you can call this signal handler from your SIGBUS and SIGSEGV
-   signal handlers to inform the virtual CPU of exceptions. non zero
-   is returned if the signal was handled by the virtual CPU.  */
-int cpu_alpha_signal_handler(int host_signum, void *pinfo,
-                             void *puc);
 bool alpha_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
                         bool probe, uintptr_t retaddr);
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9f0a5f84d5..48f0cc490e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1117,12 +1117,6 @@ static inline bool is_a64(CPUARMState *env)
     return env->aarch64;
 }
 
-/* you can call this signal handler from your SIGBUS and SIGSEGV
-   signal handlers to inform the virtual CPU of exceptions. non zero
-   is returned if the signal was handled by the virtual CPU.  */
-int cpu_arm_signal_handler(int host_signum, void *pinfo,
-                           void *puc);
-
 /**
  * pmu_op_start/finish
  * @env: CPUARMState
@@ -3002,7 +2996,6 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync);
 #define ARM_CPU_TYPE_NAME(name) (name ARM_CPU_TYPE_SUFFIX)
 #define CPU_RESOLVING_TYPE TYPE_ARM_CPU
 
-#define cpu_signal_handler cpu_arm_signal_handler
 #define cpu_list arm_cpu_list
 
 /* ARM has the following "translation regimes" (as the ARM ARM calls them):
diff --git a/target/avr/cpu.h b/target/avr/cpu.h
index 93e3faa0a9..dceacf3cd7 100644
--- a/target/avr/cpu.h
+++ b/target/avr/cpu.h
@@ -175,7 +175,6 @@ static inline void set_avr_feature(CPUAVRState *env, int feature)
 }
 
 #define cpu_list avr_cpu_list
-#define cpu_signal_handler cpu_avr_signal_handler
 #define cpu_mmu_index avr_cpu_mmu_index
 
 static inline int avr_cpu_mmu_index(CPUAVRState *env, bool ifetch)
@@ -187,7 +186,6 @@ void avr_cpu_tcg_init(void);
 
 void avr_cpu_list(void);
 int cpu_avr_exec(CPUState *cpu);
-int cpu_avr_signal_handler(int host_signum, void *pinfo, void *puc);
 int avr_cpu_memory_rw_debug(CPUState *cs, vaddr address, uint8_t *buf,
                             int len, bool is_write);
 
diff --git a/target/cris/cpu.h b/target/cris/cpu.h
index d3b6492909..c87987e95c 100644
--- a/target/cris/cpu.h
+++ b/target/cris/cpu.h
@@ -199,12 +199,6 @@ int crisv10_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int cris_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int cris_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 
-/* you can call this signal handler from your SIGBUS and SIGSEGV
-   signal handlers to inform the virtual CPU of exceptions. non zero
-   is returned if the signal was handled by the virtual CPU.  */
-int cpu_cris_signal_handler(int host_signum, void *pinfo,
-                           void *puc);
-
 void cris_initialize_tcg(void);
 void cris_initialize_crisv10_tcg(void);
 
@@ -250,8 +244,6 @@ enum {
 #define CRIS_CPU_TYPE_NAME(name) (name CRIS_CPU_TYPE_SUFFIX)
 #define CPU_RESOLVING_TYPE TYPE_CRIS_CPU
 
-#define cpu_signal_handler cpu_cris_signal_handler
-
 /* MMU modes definitions */
 #define MMU_USER_IDX 1
 static inline int cpu_mmu_index (CPUCRISState *env, bool ifetch)
diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
index bde538fd5c..f90c187888 100644
--- a/target/hexagon/cpu.h
+++ b/target/hexagon/cpu.h
@@ -129,9 +129,6 @@ typedef struct HexagonCPU {
 
 #include "cpu_bits.h"
 
-#define cpu_signal_handler cpu_hexagon_signal_handler
-int cpu_hexagon_signal_handler(int host_signum, void *pinfo, void *puc);
-
 static inline void cpu_get_tb_cpu_state(CPUHexagonState *env, target_ulong *pc,
                                         target_ulong *cs_base, uint32_t *flags)
 {
diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index 332ca5de62..1a0907ec0f 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -322,9 +322,6 @@ static inline void cpu_hppa_change_prot_id(CPUHPPAState *env) { }
 void cpu_hppa_change_prot_id(CPUHPPAState *env);
 #endif
 
-#define cpu_signal_handler cpu_hppa_signal_handler
-
-int cpu_hppa_signal_handler(int host_signum, void *pinfo, void *puc);
 hwaddr hppa_cpu_get_phys_page_debug(CPUState *cs, vaddr addr);
 int hppa_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int hppa_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 6c50d3ab4f..7045e46af4 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1940,12 +1940,6 @@ void cpu_x86_frstor(CPUX86State *s, target_ulong ptr, int data32);
 void cpu_x86_fxsave(CPUX86State *s, target_ulong ptr);
 void cpu_x86_fxrstor(CPUX86State *s, target_ulong ptr);
 
-/* you can call this signal handler from your SIGBUS and SIGSEGV
-   signal handlers to inform the virtual CPU of exceptions. non zero
-   is returned if the signal was handled by the virtual CPU.  */
-int cpu_x86_signal_handler(int host_signum, void *pinfo,
-                           void *puc);
-
 /* cpu.c */
 void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
                               uint32_t vendor2, uint32_t vendor3);
@@ -2011,7 +2005,6 @@ uint64_t cpu_get_tsc(CPUX86State *env);
 #define TARGET_DEFAULT_CPU_TYPE X86_CPU_TYPE_NAME("qemu32")
 #endif
 
-#define cpu_signal_handler cpu_x86_signal_handler
 #define cpu_list x86_cpu_list
 
 /* MMU modes definitions */
diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 997d588911..da7b6b2fab 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -175,13 +175,6 @@ int m68k_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 
 void m68k_tcg_init(void);
 void m68k_cpu_init_gdb(M68kCPU *cpu);
-/*
- * you can call this signal handler from your SIGBUS and SIGSEGV
- * signal handlers to inform the virtual CPU of exceptions. non zero
- * is returned if the signal was handled by the virtual CPU.
- */
-int cpu_m68k_signal_handler(int host_signum, void *pinfo,
-                           void *puc);
 uint32_t cpu_m68k_get_ccr(CPUM68KState *env);
 void cpu_m68k_set_ccr(CPUM68KState *env, uint32_t);
 void cpu_m68k_set_sr(CPUM68KState *env, uint32_t);
@@ -561,7 +554,6 @@ enum {
 #define M68K_CPU_TYPE_NAME(model) model M68K_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_M68K_CPU
 
-#define cpu_signal_handler cpu_m68k_signal_handler
 #define cpu_list m68k_cpu_list
 
 /* MMU modes definitions */
diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index 620c3742e1..bda697494b 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -383,16 +383,9 @@ static inline void mb_cpu_write_msr(CPUMBState *env, uint32_t val)
 }
 
 void mb_tcg_init(void);
-/* you can call this signal handler from your SIGBUS and SIGSEGV
-   signal handlers to inform the virtual CPU of exceptions. non zero
-   is returned if the signal was handled by the virtual CPU.  */
-int cpu_mb_signal_handler(int host_signum, void *pinfo,
-                          void *puc);
 
 #define CPU_RESOLVING_TYPE TYPE_MICROBLAZE_CPU
 
-#define cpu_signal_handler cpu_mb_signal_handler
-
 /* MMU modes definitions */
 #define MMU_NOMMU_IDX   0
 #define MMU_KERNEL_IDX  1
diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 1dfe69c6c0..56b1cbd091 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1193,7 +1193,6 @@ struct MIPSCPU {
 
 void mips_cpu_list(void);
 
-#define cpu_signal_handler cpu_mips_signal_handler
 #define cpu_list mips_cpu_list
 
 extern void cpu_wrdsp(uint32_t rs, uint32_t mask_num, CPUMIPSState *env);
@@ -1277,8 +1276,6 @@ enum {
  */
 #define CPU_INTERRUPT_WAKE CPU_INTERRUPT_TGT_INT_0
 
-int cpu_mips_signal_handler(int host_signum, void *pinfo, void *puc);
-
 #define MIPS_CPU_TYPE_SUFFIX "-" TYPE_MIPS_CPU
 #define MIPS_CPU_TYPE_NAME(model) model MIPS_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_MIPS_CPU
diff --git a/target/mips/internal.h b/target/mips/internal.h
index eecdd10116..daddb05fd4 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -156,8 +156,6 @@ extern const VMStateDescription vmstate_mips_cpu;
 
 #endif /* !CONFIG_USER_ONLY */
 
-#define cpu_signal_handler cpu_mips_signal_handler
-
 static inline bool cpu_mips_hw_interrupts_enabled(CPUMIPSState *env)
 {
     return (env->CP0_Status & (1 << CP0St_IE)) &&
diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 27227b1e88..a80587338a 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -193,7 +193,6 @@ struct Nios2CPU {
 
 void nios2_tcg_init(void);
 void nios2_cpu_do_interrupt(CPUState *cs);
-int cpu_nios2_signal_handler(int host_signum, void *pinfo, void *puc);
 void dump_mmu(CPUNios2State *env);
 void nios2_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 hwaddr nios2_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
@@ -206,7 +205,6 @@ void do_nios2_semihosting(CPUNios2State *env);
 #define CPU_RESOLVING_TYPE TYPE_NIOS2_CPU
 
 #define cpu_gen_code cpu_nios2_gen_code
-#define cpu_signal_handler cpu_nios2_signal_handler
 
 #define CPU_SAVE_VERSION 1
 
diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index 82cbaeb4f8..456a0cb1a7 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -322,11 +322,9 @@ void openrisc_translate_init(void);
 bool openrisc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                            MMUAccessType access_type, int mmu_idx,
                            bool probe, uintptr_t retaddr);
-int cpu_openrisc_signal_handler(int host_signum, void *pinfo, void *puc);
 int print_insn_or1k(bfd_vma addr, disassemble_info *info);
 
 #define cpu_list cpu_openrisc_list
-#define cpu_signal_handler cpu_openrisc_signal_handler
 
 #ifndef CONFIG_USER_ONLY
 extern const VMStateDescription vmstate_openrisc_cpu;
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 93d308ac8f..8e39f03bd0 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1278,12 +1278,6 @@ extern const VMStateDescription vmstate_ppc_cpu;
 
 /*****************************************************************************/
 void ppc_translate_init(void);
-/*
- * you can call this signal handler from your SIGBUS and SIGSEGV
- * signal handlers to inform the virtual CPU of exceptions. non zero
- * is returned if the signal was handled by the virtual CPU.
- */
-int cpu_ppc_signal_handler(int host_signum, void *pinfo, void *puc);
 bool ppc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                       MMUAccessType access_type, int mmu_idx,
                       bool probe, uintptr_t retaddr);
@@ -1362,7 +1356,6 @@ int ppc_dcr_write(ppc_dcr_t *dcr_env, int dcrn, uint32_t val);
 #define POWERPC_CPU_TYPE_NAME(model) model POWERPC_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_POWERPC_CPU
 
-#define cpu_signal_handler cpu_ppc_signal_handler
 #define cpu_list ppc_cpu_list
 
 /* MMU modes definitions */
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index a5b0047bfd..4b1141e0d1 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -357,7 +357,6 @@ void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
 char *riscv_isa_string(RISCVCPU *cpu);
 void riscv_cpu_list(void);
 
-#define cpu_signal_handler riscv_cpu_signal_handler
 #define cpu_list riscv_cpu_list
 #define cpu_mmu_index riscv_cpu_mmu_index
 
@@ -372,7 +371,6 @@ void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t),
 void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv);
 
 void riscv_translate_init(void);
-int riscv_cpu_signal_handler(int host_signum, void *pinfo, void *puc);
 void QEMU_NORETURN riscv_raise_exception(CPURISCVState *env,
                                          uint32_t exception, uintptr_t pc);
 
diff --git a/target/rx/cpu.h b/target/rx/cpu.h
index 0b4b998c7b..56f99826ea 100644
--- a/target/rx/cpu.h
+++ b/target/rx/cpu.h
@@ -132,13 +132,9 @@ int rx_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 hwaddr rx_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 
 void rx_translate_init(void);
-int cpu_rx_signal_handler(int host_signum, void *pinfo,
-                           void *puc);
-
 void rx_cpu_list(void);
 void rx_cpu_unpack_psw(CPURXState *env, uint32_t psw, int rte);
 
-#define cpu_signal_handler cpu_rx_signal_handler
 #define cpu_list rx_cpu_list
 
 #include "exec/cpu-all.h"
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index b26ae8fff2..3153d053e9 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -809,13 +809,6 @@ void s390_set_qemu_cpu_model(uint16_t type, uint8_t gen, uint8_t ec_ga,
 #define S390_CPU_TYPE_NAME(name) (name S390_CPU_TYPE_SUFFIX)
 #define CPU_RESOLVING_TYPE TYPE_S390_CPU
 
-/* you can call this signal handler from your SIGBUS and SIGSEGV
-   signal handlers to inform the virtual CPU of exceptions. non zero
-   is returned if the signal was handled by the virtual CPU.  */
-int cpu_s390x_signal_handler(int host_signum, void *pinfo, void *puc);
-#define cpu_signal_handler cpu_s390x_signal_handler
-
-
 /* interrupt.c */
 #define RA_IGNORED                  0
 void s390_program_interrupt(CPUS390XState *env, uint32_t code, uintptr_t ra);
diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index 5f2dc551e3..d7ac67e0d3 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -216,8 +216,6 @@ void superh_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
                                     uintptr_t retaddr) QEMU_NORETURN;
 
 void sh4_translate_init(void);
-int cpu_sh4_signal_handler(int host_signum, void *pinfo,
-                           void *puc);
 bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                          MMUAccessType access_type, int mmu_idx,
                          bool probe, uintptr_t retaddr);
@@ -251,7 +249,6 @@ void cpu_load_tlb(CPUSH4State * env);
 #define SUPERH_CPU_TYPE_NAME(model) model SUPERH_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_SUPERH_CPU
 
-#define cpu_signal_handler cpu_sh4_signal_handler
 #define cpu_list sh4_cpu_list
 
 /* MMU modes definitions */
diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index ff8ae73002..6b40d02237 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -649,13 +649,11 @@ hwaddr cpu_get_phys_page_nofault(CPUSPARCState *env, target_ulong addr,
                                            int mmu_idx);
 #endif
 #endif
-int cpu_sparc_signal_handler(int host_signum, void *pinfo, void *puc);
 
 #define SPARC_CPU_TYPE_SUFFIX "-" TYPE_SPARC_CPU
 #define SPARC_CPU_TYPE_NAME(model) model SPARC_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_SPARC_CPU
 
-#define cpu_signal_handler cpu_sparc_signal_handler
 #define cpu_list sparc_cpu_list
 
 /* MMU modes definitions */
diff --git a/target/tricore/cpu.h b/target/tricore/cpu.h
index 4b61a2c03f..c461387e71 100644
--- a/target/tricore/cpu.h
+++ b/target/tricore/cpu.h
@@ -362,7 +362,6 @@ void fpu_set_state(CPUTriCoreState *env);
 
 void tricore_cpu_list(void);
 
-#define cpu_signal_handler cpu_tricore_signal_handler
 #define cpu_list tricore_cpu_list
 
 static inline int cpu_mmu_index(CPUTriCoreState *env, bool ifetch)
@@ -377,7 +376,6 @@ typedef TriCoreCPU ArchCPU;
 
 void cpu_state_reset(CPUTriCoreState *s);
 void tricore_tcg_init(void);
-int cpu_tricore_signal_handler(int host_signum, void *pinfo, void *puc);
 
 static inline void cpu_get_tb_cpu_state(CPUTriCoreState *env, target_ulong *pc,
                                         target_ulong *cs_base, uint32_t *flags)
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index aa9c77d719..029a331f7e 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -582,7 +582,6 @@ void xtensa_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
                                     MMUAccessType access_type, int mmu_idx,
                                     uintptr_t retaddr) QEMU_NORETURN;
 
-#define cpu_signal_handler cpu_xtensa_signal_handler
 #define cpu_list xtensa_cpu_list
 
 #define XTENSA_CPU_TYPE_SUFFIX "-" TYPE_XTENSA_CPU
@@ -611,7 +610,6 @@ void check_interrupts(CPUXtensaState *s);
 void xtensa_irq_init(CPUXtensaState *env);
 qemu_irq *xtensa_get_extints(CPUXtensaState *env);
 qemu_irq xtensa_get_runstall(CPUXtensaState *env);
-int cpu_xtensa_signal_handler(int host_signum, void *pinfo, void *puc);
 void xtensa_cpu_list(void);
 void xtensa_sync_window_from_phys(CPUXtensaState *env);
 void xtensa_sync_phys_from_window(CPUXtensaState *env);
-- 
2.25.1


