Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 016E53DE4F6
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:16:56 +0200 (CEST)
Received: from localhost ([::1]:47976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAlrK-0005Re-UV
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:16:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpK-0002OH-TZ
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:14:50 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:45685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpJ-0001xd-2j
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:14:50 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 m10-20020a17090a34cab0290176b52c60ddso2973223pjf.4
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Cr9bG5R2wXMBJxA3dnzKH0WkF2sqLYLABDiIamHX2hQ=;
 b=pLo+v3/YJhxQEX/wbqX071PV4GspvxB8JxGVsGZnbS+iqVvdJ6SYqNvOVOd3RNdtFn
 GwZN8QKSfAKsyuRKneFIj5G6g9+7KYy/piACOUftX/H/qBM7D+TlvwQWu2CDubEgKP4/
 xvFBNNNBrZYU9SUA+JKd2mZIMntfbo16yEiFxdVRFaofSpItFWBmoKQhnruEIVxzAoS4
 GURIaXBVOBnzgBLchgE2SwXDMO90n1Gd0y5s3xTuKMe9C5G0hlWZeMNTyqWp2twNH+iD
 E2qlvWLdqGy4SAn+pegIz0REpwKmFXy84/8PHv8CuakT4lOl1M3oTp0RDplfcrkOP3v9
 mzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cr9bG5R2wXMBJxA3dnzKH0WkF2sqLYLABDiIamHX2hQ=;
 b=ug+3CYZ6untzt+He3qFW4AzqueD+UJQ4YaaRRl8bdDBatQe4W+xTPkG9ISKL3RWEeN
 y6lD55wVGhJ9qztwYl6VYFfiSM/GJ1EiW7TTINp9+7BE3g2MbCanW5ohl4T443DWkvRw
 i4qtqHdzwc1hblaAcW71KMKvnipekPxTkfo646teJDGNsOLxzjJwWsSblvQ4JmrTwFSx
 5rTlQUKDNrdqZ0PXgVaob0GVVUuJ1GQ7o8uVjNCWpyVvaAI5snelZEnpJwBOh7597Jqn
 MvLncO8Yug9T+C+1emQomyG9GefaCF6+rr5+7GpJyzdZp2B2D0B7nmfTP68zfuwiNfnH
 u8SQ==
X-Gm-Message-State: AOAM530d7cS4PL9i5WzmrsjciJJ+KWh9xvhS9sMeVTfwyfmOsMd3ZTxk
 Ld94C1nL0ZhY3mI42+EMFPrflxm+B2FWyQ==
X-Google-Smtp-Source: ABdhPJwRHTxDM5MReOvF+96CZJAa0zgfqTXNsDcDDwcNvTjqn61LkrxSCf3LYO/f2QEFDAtZxtO9Yg==
X-Received: by 2002:a17:90a:cb12:: with SMTP id
 z18mr20782330pjt.84.1627964087501; 
 Mon, 02 Aug 2021 21:14:47 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id c23sm13718532pfn.140.2021.08.02.21.14.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:14:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/55] hw/core: Make do_unaligned_access noreturn
Date: Mon,  2 Aug 2021 18:13:49 -1000
Message-Id: <20210803041443.55452-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

While we may have had some thought of allowing system-mode
to return from this hook, we have no guests that require this.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/tcg-cpu-ops.h  | 3 ++-
 target/alpha/cpu.h             | 4 ++--
 target/arm/internals.h         | 3 ++-
 target/microblaze/cpu.h        | 2 +-
 target/mips/tcg/tcg-internal.h | 4 ++--
 target/nios2/cpu.h             | 4 ++--
 target/ppc/internal.h          | 4 ++--
 target/riscv/cpu.h             | 2 +-
 target/s390x/s390x-internal.h  | 4 ++--
 target/sh4/cpu.h               | 4 ++--
 target/xtensa/cpu.h            | 4 ++--
 target/hppa/cpu.c              | 7 ++++---
 12 files changed, 24 insertions(+), 21 deletions(-)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index eab27d0c03..ee0795def4 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -72,10 +72,11 @@ struct TCGCPUOps {
                                   MemTxResult response, uintptr_t retaddr);
     /**
      * @do_unaligned_access: Callback for unaligned access handling
+     * The callback must exit via raising an exception.
      */
     void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
                                 MMUAccessType access_type,
-                                int mmu_idx, uintptr_t retaddr);
+                                int mmu_idx, uintptr_t retaddr) QEMU_NORETURN;
 
     /**
      * @adjust_watchpoint_address: hack for cpu_check_watchpoint used by ARM
diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index 82df108967..6eb3fcc63e 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -283,8 +283,8 @@ hwaddr alpha_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int alpha_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int alpha_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void alpha_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
-                                   MMUAccessType access_type,
-                                   int mmu_idx, uintptr_t retaddr);
+                                   MMUAccessType access_type, int mmu_idx,
+                                   uintptr_t retaddr) QEMU_NORETURN;
 
 #define cpu_list alpha_cpu_list
 #define cpu_signal_handler cpu_alpha_signal_handler
diff --git a/target/arm/internals.h b/target/arm/internals.h
index cd2ea8a388..3da9b1c61e 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -594,7 +594,8 @@ bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx);
 /* Raise a data fault alignment exception for the specified virtual address */
 void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
                                  MMUAccessType access_type,
-                                 int mmu_idx, uintptr_t retaddr);
+                                 int mmu_idx, uintptr_t retaddr)
+    QEMU_NORETURN;
 
 /* arm_cpu_do_transaction_failed: handle a memory system error response
  * (eg "no device/memory present at address") by raising an external abort
diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index e4bba8a755..620c3742e1 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -359,7 +359,7 @@ void mb_cpu_do_interrupt(CPUState *cs);
 bool mb_cpu_exec_interrupt(CPUState *cs, int int_req);
 void mb_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
                                 MMUAccessType access_type,
-                                int mmu_idx, uintptr_t retaddr);
+                                int mmu_idx, uintptr_t retaddr) QEMU_NORETURN;
 void mb_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 hwaddr mb_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
                                         MemTxAttrs *attrs);
diff --git a/target/mips/tcg/tcg-internal.h b/target/mips/tcg/tcg-internal.h
index 81b14eb219..7ac1e578d1 100644
--- a/target/mips/tcg/tcg-internal.h
+++ b/target/mips/tcg/tcg-internal.h
@@ -24,8 +24,8 @@ bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr);
 void mips_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
-                                  MMUAccessType access_type,
-                                  int mmu_idx, uintptr_t retaddr);
+                                  MMUAccessType access_type, int mmu_idx,
+                                  uintptr_t retaddr) QEMU_NORETURN;
 
 const char *mips_exception_name(int32_t exception);
 
diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 2ab82fdc71..27227b1e88 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -198,8 +198,8 @@ void dump_mmu(CPUNios2State *env);
 void nios2_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 hwaddr nios2_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 void nios2_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
-                                   MMUAccessType access_type,
-                                   int mmu_idx, uintptr_t retaddr);
+                                   MMUAccessType access_type, int mmu_idx,
+                                   uintptr_t retaddr) QEMU_NORETURN;
 
 void do_nios2_semihosting(CPUNios2State *env);
 
diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index f1fd3c8d04..d2163bf5a2 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -213,8 +213,8 @@ void helper_compute_fprf_float128(CPUPPCState *env, float128 arg);
 
 /* Raise a data fault alignment exception for the specified virtual address */
 void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
-                                 MMUAccessType access_type,
-                                 int mmu_idx, uintptr_t retaddr);
+                                 MMUAccessType access_type, int mmu_idx,
+                                 uintptr_t retaddr) QEMU_NORETURN;
 
 /* translate.c */
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index bf1c899c00..a5b0047bfd 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -345,7 +345,7 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);
 hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                     MMUAccessType access_type, int mmu_idx,
-                                    uintptr_t retaddr);
+                                    uintptr_t retaddr) QEMU_NORETURN;
 bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
                         bool probe, uintptr_t retaddr);
diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-internal.h
index 5506f185e8..96133ac2b6 100644
--- a/target/s390x/s390x-internal.h
+++ b/target/s390x/s390x-internal.h
@@ -274,8 +274,8 @@ bool s390_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr);
 void s390x_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
-                                   MMUAccessType access_type,
-                                   int mmu_idx, uintptr_t retaddr);
+                                   MMUAccessType access_type, int mmu_idx,
+                                   uintptr_t retaddr) QEMU_NORETURN;
 
 
 /* fpu_helper.c */
diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index 01c4344082..a9191951f8 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -211,8 +211,8 @@ hwaddr superh_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int superh_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int superh_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void superh_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
-                                    MMUAccessType access_type,
-                                    int mmu_idx, uintptr_t retaddr);
+                                    MMUAccessType access_type, int mmu_idx,
+                                    uintptr_t retaddr) QEMU_NORETURN;
 
 void sh4_translate_init(void);
 int cpu_sh4_signal_handler(int host_signum, void *pinfo,
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 2345cb59c7..aa9c77d719 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -579,8 +579,8 @@ void xtensa_count_regs(const XtensaConfig *config,
 int xtensa_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int xtensa_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void xtensa_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
-                                    MMUAccessType access_type,
-                                    int mmu_idx, uintptr_t retaddr);
+                                    MMUAccessType access_type, int mmu_idx,
+                                    uintptr_t retaddr) QEMU_NORETURN;
 
 #define cpu_signal_handler cpu_xtensa_signal_handler
 #define cpu_list xtensa_cpu_list
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 2eace4ee12..c2c56e7635 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -72,9 +72,10 @@ static void hppa_cpu_disas_set_info(CPUState *cs, disassemble_info *info)
 }
 
 #ifndef CONFIG_USER_ONLY
-static void hppa_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
-                                         MMUAccessType access_type,
-                                         int mmu_idx, uintptr_t retaddr)
+static void QEMU_NORETURN
+hppa_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
+                             MMUAccessType access_type, int mmu_idx,
+                             uintptr_t retaddr)
 {
     HPPACPU *cpu = HPPA_CPU(cs);
     CPUHPPAState *env = &cpu->env;
-- 
2.25.1


