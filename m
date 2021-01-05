Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6103A2EB179
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:36:51 +0100 (CET)
Received: from localhost ([::1]:44840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwqGI-0004PZ-Ew
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:36:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0V-0002Nc-N3
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:32 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:34004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0P-0006Zp-9N
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:31 -0500
Received: by mail-pl1-x630.google.com with SMTP id t6so74340plq.1
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 09:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eilLw9ZK6iSUvH1D+Vc53ITHJN75NUB/4q2IHZwdzjI=;
 b=QbBo3ru8E3tumRDsMi+pScCctikjWpFcDQsvCVEE2OXUbYNpsIu7C1+M3JdtKJf0PZ
 hiLxvMeAwJIN180hv5cw0HTf5dCY4tnm8UL99qr/fmIVaHjcyTWn6wqC0ZuGiCh+fAey
 c6R5cC+8+xnaU3aGg/NlKTuBJcPXVlmA3e4t9JoyiUuBPURYnOGdyZXSBgpSpzvYbfL0
 bE8tBhv0rq5OVIAbvFjAzYmSVLRxTyh/o19Tct4fINEPkt/DrTZlvcn3mMkftu2Zg7ZW
 1Vceil519g7u5noyNspYieKQrJurqVOZCGGWh3QNPK5FI1f9OoCX1rv+xXFqXzKXrls4
 wntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eilLw9ZK6iSUvH1D+Vc53ITHJN75NUB/4q2IHZwdzjI=;
 b=c9Qhe2dEAOQ7zIIf8gk5CfA6wVGSigww4BOBmyhVD+M6JfR6uHklXeyTtXEX2BR2e5
 Hb2KlDAO1DDaqBRqgcC6iswJptkB50la0Oz7XMdkkAJspLRGKVa6y6sbS36XbM4Pn2T1
 FuIcrt0d4adtqe7v64BSEBmjIPj/8ER/7TXLARfFqTa0PeeKWSL7ijDaxsKG3R2UuYvy
 gNaazjTHu9CIaqD4evcRfbrCUakH1X5CJb8V1Di5eMnqqNwpi38X77uQgBtQ87qCgGTb
 4eQl48ObsvOWtYzhgZLDJVQ1yeY+3O4rAmBHdIgkxYvibZ8FZMjwy7MOxF4meCXQ24Kt
 hQaA==
X-Gm-Message-State: AOAM533AbHMoiJpi3dT74UgJr6vsOZqTo2pua019xVZLPpFgq446Ix4u
 7KohOQ6ZISoBibRSoe3xgWCGcLDBStFOcg==
X-Google-Smtp-Source: ABdhPJycisSQtPgeIBF2+k9387hDLaLUkjRm/nyXriwi3irkahSrmoUAS9aKaNF5oDQkOUqxDJUTBQ==
X-Received: by 2002:a17:902:b282:b029:da:fd05:7766 with SMTP id
 u2-20020a170902b282b02900dafd057766mr636321plr.52.1609867222911; 
 Tue, 05 Jan 2021 09:20:22 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id u12sm2010pfh.98.2021.01.05.09.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 09:20:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 15/43] tcg: Make tb arg to synchronize_from_tb const
Date: Tue,  5 Jan 2021 07:19:22 -1000
Message-Id: <20210105171950.415486-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105171950.415486-1-richard.henderson@linaro.org>
References: <20210105171950.415486-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: Joelle van Dyne <j@getutm.app>,
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
index b2cd69ff7f..318e0360ac 100644
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


