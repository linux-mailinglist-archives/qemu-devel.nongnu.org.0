Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E312D9974
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:09:46 +0100 (CET)
Received: from localhost ([::1]:54838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kooXl-00078O-0V
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:09:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooS9-0001oZ-SF
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:03:53 -0500
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:45029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooS2-0003wp-Iq
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:03:53 -0500
Received: by mail-oi1-x229.google.com with SMTP id d189so19219491oig.11
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=L3KSYgTID8lxe/3Pvx+7FaZP4H7EiUhUFytfizdwcH0=;
 b=kny7zWOyTubFzfS0qNfyZ6isMrBq9KTm+Ze783DOfsU6vLQnLriGlFnRydWxKvu3TA
 54DcSFPwR+CXR3lqgM8Kyk3qbE+6E1E7USxdZseWou/HteTVy5LsQGf8OEuwhWQoGPKB
 tlBragw7EXMA3vSnOQy83qWQDWtR5covvNP3EO/81mp9HJuTq44+Fc168tkCQQqygE5l
 KmBpTo9cmypKMHK9mSY3Fgy3F5yfnI9cTDxPq/VMaEBRblsiO7XSXK5cfgKY83ymI8Dm
 1MHy5FuKxHdTqSYglt3UeSvIYu6HogGNE9DfHy9C+qrPUIVfGxDmnE/feQRBWjMdjDRA
 XRfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L3KSYgTID8lxe/3Pvx+7FaZP4H7EiUhUFytfizdwcH0=;
 b=KhwYcltGmaNEgwJXd7fWrsVtwZ9nNgyPTEEJCXpp1kG0K1aCgUHWjSZPr6Y9kpA6OX
 ggOPj3CSrxx7zq8Bz03Co5+ab4x56L7RG/g2j2zQfalMDoPhFzm0HR0NEf9lkpB7shB8
 OgIVzhcZG+2zYbRrkfC6NjNFsM1bBzeFf5nEyj09lXhNIW4mBkrZaCvpDV770LeaeX+q
 Ni/lSMa6t74AsAW58rH/iBe10GhBkoaY/fjWX/52S2QqVcXVP96DRUxf7bt7giDE3Sbh
 yHH5JrdHyfcMsgni+d/LbixUbw69jDFiN0KY4iVjDOi/9UQwsNtujGrSoXIqK5huZuRs
 STQw==
X-Gm-Message-State: AOAM531MfFoAJ1gpQ2oqQ/GVtPbIBOIdyByxwboxEzhaBh1D02MVACeG
 oyu9vaWEKEiYmFx65Ws8r6kTti8GyB1m2rOt
X-Google-Smtp-Source: ABdhPJzUL5xAnUVx0zvB5JuNszeAWjb0WFrSTyeO4gEpk2h1VoZdLQPe9t2RSJuf3TSxG80niEXeRw==
X-Received: by 2002:aca:bd0b:: with SMTP id n11mr17593332oif.11.1607954623745; 
 Mon, 14 Dec 2020 06:03:43 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t24sm3940146oou.4.2020.12.14.06.03.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:03:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 15/43] tcg: Make tb arg to synchronize_from_tb const
Date: Mon, 14 Dec 2020 08:02:46 -0600
Message-Id: <20201214140314.18544-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214140314.18544-1-richard.henderson@linaro.org>
References: <20201214140314.18544-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x229.google.com
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

There is nothing within the translators that ought to be
changing the TranslationBlock data, so make it const.

This does not actually use the read-only copy of the
data structure that exists within the rx region.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h   | 3 ++-
 target/arm/cpu.c        | 3 ++-
 target/avr/cpu.c        | 3 ++-
 target/hppa/cpu.c       | 3 ++-
 target/i386/cpu.c       | 3 ++-
 target/microblaze/cpu.c | 3 ++-
 target/mips/cpu.c       | 3 ++-
 target/riscv/cpu.c      | 3 ++-
 target/rx/cpu.c         | 3 ++-
 target/sh4/cpu.c        | 3 ++-
 target/sparc/cpu.c      | 3 ++-
 target/tricore/cpu.c    | 2 +-
 12 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 3d92c967ff..44c336a96a 100644
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
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6c11feeb92..258b0d6148 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7047,7 +7047,8 @@ static void x86_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.eip = value;
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
index 76d50b00b4..79eee215cf 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -44,7 +44,8 @@ static void mips_cpu_set_pc(CPUState *cs, vaddr value)
     }
 }
 
-static void mips_cpu_synchronize_from_tb(CPUState *cs, TranslationBlock *tb)
+static void mips_cpu_synchronize_from_tb(CPUState *cs,
+                                         const TranslationBlock *tb)
 {
     MIPSCPU *cpu = MIPS_CPU(cs);
     CPUMIPSState *env = &cpu->env;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6a0264fc6b..1b2f40de47 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -285,7 +285,8 @@ static void riscv_cpu_set_pc(CPUState *cs, vaddr value)
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
index 701e794eac..57db14548c 100644
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


