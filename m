Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8563F0BB4
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:24:21 +0200 (CEST)
Received: from localhost ([::1]:47354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRAi-0000BH-Hh
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:24:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR61-0008S3-Df
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:29 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:42560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR5z-0008IA-It
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:29 -0400
Received: by mail-pf1-x42c.google.com with SMTP id 18so3177355pfh.9
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xxk0EeKC824lLXRYg9R7MEWCroAuJKm0xXTttGGlRdE=;
 b=azxgCqcUJK2V+Bw10K6fPeNgBgYePeYtvDMD4g2WA21Fbjo4oyyng6OB3wXLqYKSYC
 zqLnm+QQ7BTQRqRLpJTyNDSxF32L7Gnrisbv5YTKo+/SWo6EtxGone6pU/Q5H5fUNr4c
 IC+AjXF4MnnnspKn5MJ0OglEkOJYnlG1JyPU6IKtGcF6ag18Tu6HXV1sHPlz5odPxMig
 w5jXX8yNqWwBh+Nw4T5akkSSNc4qCqrdfqNphBEi3HpSx5DWseUDrlqx7h8TUtomCvtO
 DAjbCLcWatf9CGEhywbsEunHi8SOfqHURdHYZSjOAujlN7wQQ3kHa2MVCwd9QzDRyQJi
 JUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xxk0EeKC824lLXRYg9R7MEWCroAuJKm0xXTttGGlRdE=;
 b=Xc6eCx6MF2xV9xiCf8SGFViJxJpcPVhGNQJQkl+Wq4YkaINtH9VlXEHT6IebN2XuVu
 dLiltQ/NygoKQZzQxq39UcB/1V7JhWeyHy958P4/xASPxNt+2UNOUZYxQlBhoP3Cxgl/
 4G9odNwv6T4civKwSIAkUusRv/6fGvxlwMjrh3QZpHpHSxveefZPJbsTvMH49kDR06CZ
 qi78+4/DJx38S0MBwHbTmzT8hnpHPxRzdqJOpvqnhhQJS6uF2IVQawdwTLT7pmri93Rm
 obRqRq+1wxf0+fMxh7Zei8YdCtc7H3miGUUex6c+tOqzK3vaZUhQQo02B0tcvtJqpSXj
 EXjw==
X-Gm-Message-State: AOAM530cz+jEOVKTaxi1rfHsy/DAPPUisvbxVuZPvwoI7xmjLP8PHeh9
 uSYePId7/4VAqM2rIA5zZf0QXE2rphDiUg==
X-Google-Smtp-Source: ABdhPJwsJCuJLyzpcSVdpinOCY+MUvfUABWm19DV57kK6XSEquB7e+35cWbs56v/MyOuXGuxHO4ArQ==
X-Received: by 2002:aa7:8891:0:b0:3e1:6eb1:b4b4 with SMTP id
 z17-20020aa78891000000b003e16eb1b4b4mr10898150pfe.9.1629314366163; 
 Wed, 18 Aug 2021 12:19:26 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id a6sm524108pjs.40.2021.08.18.12.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:19:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/66] hw/core: Make do_unaligned_access noreturn
Date: Wed, 18 Aug 2021 09:18:16 -1000
Message-Id: <20210818191920.390759-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While we may have had some thought of allowing system-mode
to return from this hook, we have no guests that require this.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/tcg-cpu-ops.h  | 3 ++-
 target/alpha/cpu.h             | 4 ++--
 target/arm/internals.h         | 2 +-
 target/microblaze/cpu.h        | 2 +-
 target/mips/tcg/tcg-internal.h | 4 ++--
 target/nios2/cpu.h             | 4 ++--
 target/ppc/internal.h          | 4 ++--
 target/riscv/cpu.h             | 2 +-
 target/s390x/s390x-internal.h  | 4 ++--
 target/sh4/cpu.h               | 4 ++--
 target/xtensa/cpu.h            | 4 ++--
 target/hppa/cpu.c              | 7 ++++---
 12 files changed, 23 insertions(+), 21 deletions(-)

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
index cd2ea8a388..8a77929793 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -594,7 +594,7 @@ bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx);
 /* Raise a data fault alignment exception for the specified virtual address */
 void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
                                  MMUAccessType access_type,
-                                 int mmu_idx, uintptr_t retaddr);
+                                 int mmu_idx, uintptr_t retaddr) QEMU_NORETURN;
 
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


