Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C53972EE6FB
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 21:34:58 +0100 (CET)
Received: from localhost ([::1]:45492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxbzl-0007OI-Or
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 15:34:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbh4-0001IY-0t
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:15:38 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:41267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbgw-0001bJ-2t
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:15:37 -0500
Received: by mail-pg1-x52d.google.com with SMTP id i7so5737434pgc.8
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 12:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sunWAzJe6zr/hqJZSTqg1lWjV1jgJ2mUk5ECH6sRN4M=;
 b=iitJNpPuhaJ0ssYJeY1LJoV89EvPxw1kVYf5nY6bkhW4iBH0GHrqlvPhJif8c6LE60
 lctvRvN7rOyVrEGjvVH1r+zJr4+bblgCXj4qGZxky9Xf0cdSVqlgwxW02GJxjexXe9bh
 5g9voPDnS/RXBbPLuQn+qEbEkpPWM1APFsjawlxWpncgzsKdznDWzvb3eu8kJ+4FvoFt
 jXVMexxRtTLnGjiX95dFim+qCbSaEI2W6c6OajqmZ1RidbMu4MY6WpcrUJ+blLBrJcYJ
 ZsC+w3UZq5lyHW3Wv0XpRhc+kLKLjFMn9qLqtVSGhkJkh6zHVf4lPiIAsksf9z5Dwahs
 0H1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sunWAzJe6zr/hqJZSTqg1lWjV1jgJ2mUk5ECH6sRN4M=;
 b=jNto3z7+MTUN2I2LXbbS8Axcu+FK3UqaWjRxQyaY6cYLmV9OxiPVUYEjOHDQI57i4E
 h6GSwlfMbr2SeTnqKFuf6oTTVklhgJwGgi/GLoIowdwwixPjh/Z58bOSUDwB9I33ovqO
 J12qb9Ai0q3Vz7e/y2fDQSBsPjSSeLCK4Te8fgfA+8awneRkRXiKgSJXPj6ie/FRm+Th
 no1KA0C05kmrFQwkN9+SHmqqoBAjg6jDjUywVz1DtBdDFMCC9VX9yAoJYr7j5SB0TwJ3
 gD87bfqON7k3H/WzHN0I/HtyGyTLh3rYlYL3EzbIlFWV4JwAWAmYOSTI+mkH7JNmw/X6
 8RqA==
X-Gm-Message-State: AOAM533Mf1JK7iaejfDkriFaT6Svd2HkGbokAZ7qwS+mp80DB7aUinVp
 mYF7O7jxWjZt2BJo5yqAK+H6jCFlL3TutQ==
X-Google-Smtp-Source: ABdhPJw5JQi7o6qiggZCRoFfeiN/bGkyRKMIh4B4PMXBt2Osp9YuyGp/4c8FhYf6t6hk+v5c/p/4Ew==
X-Received: by 2002:a65:5209:: with SMTP id o9mr3519430pgp.34.1610050526255;
 Thu, 07 Jan 2021 12:15:26 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id v6sm6516265pfi.31.2021.01.07.12.15.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 12:15:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/47] tcg: Make tb arg to synchronize_from_tb const
Date: Thu,  7 Jan 2021 10:14:20 -1000
Message-Id: <20210107201448.1152301-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107201448.1152301-1-richard.henderson@linaro.org>
References: <20210107201448.1152301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: peter.maydell@linaro.org, Joelle van Dyne <j@getutm.app>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is nothing within the translators that ought to be
changing the TranslationBlock data, so make it const.

This does not actually use the read-only copy of the
data structure that exists within the rx region.

Reviewed-by: Joelle van Dyne <j@getutm.app>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h     | 3 ++-
 target/arm/cpu.c          | 3 ++-
 target/avr/cpu.c          | 3 ++-
 target/hppa/cpu.c         | 3 ++-
 target/i386/tcg/tcg-cpu.c | 3 ++-
 target/microblaze/cpu.c   | 3 ++-
 target/mips/cpu.c         | 3 ++-
 target/riscv/cpu.c        | 3 ++-
 target/rx/cpu.c           | 3 ++-
 target/sh4/cpu.c          | 3 ++-
 target/sparc/cpu.c        | 3 ++-
 target/tricore/cpu.c      | 2 +-
 12 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 8e7552910d..140fa32a5e 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -189,7 +189,8 @@ struct CPUClass {
     void (*get_memory_mapping)(CPUState *cpu, MemoryMappingList *list,
                                Error **errp);
     void (*set_pc)(CPUState *cpu, vaddr value);
-    void (*synchronize_from_tb)(CPUState *cpu, struct TranslationBlock *tb);
+    void (*synchronize_from_tb)(CPUState *cpu,
+                                const struct TranslationBlock *tb);
     bool (*tlb_fill)(CPUState *cpu, vaddr address, int size,
                      MMUAccessType access_type, int mmu_idx,
                      bool probe, uintptr_t retaddr);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d6188f6566..62e319eb6a 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -54,7 +54,8 @@ static void arm_cpu_set_pc(CPUState *cs, vaddr value)
     }
 }
 
-static void arm_cpu_synchronize_from_tb(CPUState *cs, TranslationBlock *tb)
+static void arm_cpu_synchronize_from_tb(CPUState *cs,
+                                        const TranslationBlock *tb)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 5d9c4ad5bf..6f3d5a9e4a 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -41,7 +41,8 @@ static bool avr_cpu_has_work(CPUState *cs)
             && cpu_interrupts_enabled(env);
 }
 
-static void avr_cpu_synchronize_from_tb(CPUState *cs, TranslationBlock *tb)
+static void avr_cpu_synchronize_from_tb(CPUState *cs,
+                                        const TranslationBlock *tb)
 {
     AVRCPU *cpu = AVR_CPU(cs);
     CPUAVRState *env = &cpu->env;
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 71b6aca45d..e28f047d10 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -35,7 +35,8 @@ static void hppa_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.iaoq_b = value + 4;
 }
 
-static void hppa_cpu_synchronize_from_tb(CPUState *cs, TranslationBlock *tb)
+static void hppa_cpu_synchronize_from_tb(CPUState *cs,
+                                         const TranslationBlock *tb)
 {
     HPPACPU *cpu = HPPA_CPU(cs);
 
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 628dd29fe7..4fa013720e 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -49,7 +49,8 @@ static void x86_cpu_exec_exit(CPUState *cs)
     env->eflags = cpu_compute_eflags(env);
 }
 
-static void x86_cpu_synchronize_from_tb(CPUState *cs, TranslationBlock *tb)
+static void x86_cpu_synchronize_from_tb(CPUState *cs,
+                                        const TranslationBlock *tb)
 {
     X86CPU *cpu = X86_CPU(cs);
 
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 9b2482159d..c8e754cfb1 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -83,7 +83,8 @@ static void mb_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.iflags = 0;
 }
 
-static void mb_cpu_synchronize_from_tb(CPUState *cs, TranslationBlock *tb)
+static void mb_cpu_synchronize_from_tb(CPUState *cs,
+                                       const TranslationBlock *tb)
 {
     MicroBlazeCPU *cpu = MICROBLAZE_CPU(cs);
 
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 2283214c87..b2864d67d7 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -47,7 +47,8 @@ static void mips_cpu_set_pc(CPUState *cs, vaddr value)
     }
 }
 
-static void mips_cpu_synchronize_from_tb(CPUState *cs, TranslationBlock *tb)
+static void mips_cpu_synchronize_from_tb(CPUState *cs,
+                                         const TranslationBlock *tb)
 {
     MIPSCPU *cpu = MIPS_CPU(cs);
     CPUMIPSState *env = &cpu->env;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 254cd83f8b..8227d7aea9 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -314,7 +314,8 @@ static void riscv_cpu_set_pc(CPUState *cs, vaddr value)
     env->pc = value;
 }
 
-static void riscv_cpu_synchronize_from_tb(CPUState *cs, TranslationBlock *tb)
+static void riscv_cpu_synchronize_from_tb(CPUState *cs,
+                                          const TranslationBlock *tb)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 23ee17a701..2bb14144a7 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -33,7 +33,8 @@ static void rx_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.pc = value;
 }
 
-static void rx_cpu_synchronize_from_tb(CPUState *cs, TranslationBlock *tb)
+static void rx_cpu_synchronize_from_tb(CPUState *cs,
+                                       const TranslationBlock *tb)
 {
     RXCPU *cpu = RX_CPU(cs);
 
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 3c68021c56..1e0f05a15b 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -34,7 +34,8 @@ static void superh_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.pc = value;
 }
 
-static void superh_cpu_synchronize_from_tb(CPUState *cs, TranslationBlock *tb)
+static void superh_cpu_synchronize_from_tb(CPUState *cs,
+                                           const TranslationBlock *tb)
 {
     SuperHCPU *cpu = SUPERH_CPU(cs);
 
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index d8a8bb1dda..6f14e370ed 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -691,7 +691,8 @@ static void sparc_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.npc = value + 4;
 }
 
-static void sparc_cpu_synchronize_from_tb(CPUState *cs, TranslationBlock *tb)
+static void sparc_cpu_synchronize_from_tb(CPUState *cs,
+                                          const TranslationBlock *tb)
 {
     SPARCCPU *cpu = SPARC_CPU(cs);
 
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 2f2e5b029f..4bff1d4718 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -42,7 +42,7 @@ static void tricore_cpu_set_pc(CPUState *cs, vaddr value)
 }
 
 static void tricore_cpu_synchronize_from_tb(CPUState *cs,
-                                            TranslationBlock *tb)
+                                            const TranslationBlock *tb)
 {
     TriCoreCPU *cpu = TRICORE_CPU(cs);
     CPUTriCoreState *env = &cpu->env;
-- 
2.25.1


