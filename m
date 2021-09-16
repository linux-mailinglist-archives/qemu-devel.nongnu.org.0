Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6737240DECD
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:58:05 +0200 (CEST)
Received: from localhost ([::1]:48306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQtm0-00088n-G4
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:58:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLk-0001Zx-5E
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:56 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:40485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLZ-0002aH-64
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:55 -0400
Received: by mail-pg1-x535.google.com with SMTP id h3so6480194pgb.7
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0hwaVqaKz38vUrAyliZJndyCYKt8BX36m2eIR+cLHnk=;
 b=Bh+BfcQq7JMQ+SKJJIV9o8dB5G4ujbjrjS9DGUWawwU3tBrXLjVHXk5M2zfLRN4Y6H
 ugyxQ83hOg9Ule7vywlkgv+JNkeZT4XKs9L+xDKVc8eVnluaMehliyzCJ0DnIl6rDny/
 TrTncUxsihBTb+KzIdtsVWVXzeM6aMPxCkVX1alLaA8JqKTQnfl86S9V2sqvtCHCcgPx
 Jp1IcgowzH2XDZdZbjfJn6Y0HFChuVcEmyMCgsz203nJkgMqpBozISweijoJ4nNGFs3A
 uR7HVgTnTF80qo53G5It7zQwBcUMkTwIuUq5FwjFt+1h59lVUPHN4eaCpp2TWGtaLJMQ
 1Lpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0hwaVqaKz38vUrAyliZJndyCYKt8BX36m2eIR+cLHnk=;
 b=QqrTe2PCE8HdfupkpZNnJMWSDXr9veS77r0G29HWDalGPIOhYIPGlSe7k6MIBSIpNO
 WWao3CybI9CtE3qy6sO3861gQ1Zhf5H3D5RT0yma2/2eF1klCVABKWOxrOyMSW1H+KAg
 qyYOqvAoIEE9xHFdhVMdNS8Jyv2M4+O8/d5X6qbb1fsHDwfmWmxwyR96mQOigVaFKqDR
 1XxABW/aXYXOIMIB6uf30vt37tew5QU8Ii+iW2KY3CUBmv4lb/9PnYSz1jF7lam+wz+A
 z5ziYPVpWf5R2eX7/n/JhZlinF0sk07ntW2I8im6/bhqkVgXVCtYjt6HrRMNRxvqzWPw
 s/kg==
X-Gm-Message-State: AOAM532QFi7jpatXcR063ZQyhPUF2e7uvBFnkAEXxMcCxw8beHfc3iwb
 e7OrDr2+xr2w7jxYpf5VHpIGMEPIMf+YYQ==
X-Google-Smtp-Source: ABdhPJwiP5u+1ACekHz/yCpdGtS+jDEBqFsbeXe7WPb7EQz6fSxaNfzpsGIQMSPPXhYfKFYWuSb5sQ==
X-Received: by 2002:a63:cc01:: with SMTP id x1mr5453611pgf.304.1631806241880; 
 Thu, 16 Sep 2021 08:30:41 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b7sm3779447pgs.64.2021.09.16.08.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 08:30:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/35] target/ppc: Restrict has_work() handlers to sysemu and
 TCG
Date: Thu, 16 Sep 2021 08:30:12 -0700
Message-Id: <20210916153025.1944763-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916153025.1944763-1-richard.henderson@linaro.org>
References: <20210916153025.1944763-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Restrict PowerPCCPUClass::has_work() and ppc_cpu_has_work()
- SysemuCPUOps::has_work() implementation - to TCG sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210912172731.789788-22-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu-qom.h  |  4 +++-
 target/ppc/cpu_init.c | 24 ++++++++++++++++++------
 2 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 3611011250..ff2bafcde6 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -188,8 +188,10 @@ struct PowerPCCPUClass {
     uint32_t flags;
     int bfd_mach;
     uint32_t l1_dcache_size, l1_icache_size;
-    bool (*has_work)(CPUState *cpu);
 #ifndef CONFIG_USER_ONLY
+#ifdef CONFIG_TCG
+    bool (*has_work)(CPUState *cpu);
+#endif /* CONFIG_TCG */
     unsigned int gdb_num_sprs;
     const char *gdb_spr_xml;
 #endif
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 2f7d262b17..5c134adeea 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7583,6 +7583,7 @@ static bool ppc_pvr_match_power7(PowerPCCPUClass *pcc, uint32_t pvr)
     return false;
 }
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static bool cpu_has_work_POWER7(CPUState *cs)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
@@ -7616,6 +7617,7 @@ static bool cpu_has_work_POWER7(CPUState *cs)
         return msr_ee && (cs->interrupt_request & CPU_INTERRUPT_HARD);
     }
 }
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
 {
@@ -7629,7 +7631,6 @@ POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
     pcc->pcr_supported = PCR_COMPAT_2_06 | PCR_COMPAT_2_05;
     pcc->init_proc = init_proc_POWER7;
     pcc->check_pow = check_pow_nocheck;
-    pcc->has_work = cpu_has_work_POWER7;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
@@ -7672,6 +7673,7 @@ POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
     pcc->lpcr_pm = LPCR_P7_PECE0 | LPCR_P7_PECE1 | LPCR_P7_PECE2;
     pcc->mmu_model = POWERPC_MMU_2_06;
 #if defined(CONFIG_SOFTMMU)
+    pcc->has_work = cpu_has_work_POWER7;
     pcc->hash64_opts = &ppc_hash64_opts_POWER7;
     pcc->lrg_decr_bits = 32;
 #endif
@@ -7742,6 +7744,7 @@ static bool ppc_pvr_match_power8(PowerPCCPUClass *pcc, uint32_t pvr)
     return false;
 }
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static bool cpu_has_work_POWER8(CPUState *cs)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
@@ -7783,6 +7786,7 @@ static bool cpu_has_work_POWER8(CPUState *cs)
         return msr_ee && (cs->interrupt_request & CPU_INTERRUPT_HARD);
     }
 }
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
 {
@@ -7796,7 +7800,6 @@ POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
     pcc->pcr_supported = PCR_COMPAT_2_07 | PCR_COMPAT_2_06 | PCR_COMPAT_2_05;
     pcc->init_proc = init_proc_POWER8;
     pcc->check_pow = check_pow_nocheck;
-    pcc->has_work = cpu_has_work_POWER8;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
@@ -7846,6 +7849,7 @@ POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
                    LPCR_P8_PECE3 | LPCR_P8_PECE4;
     pcc->mmu_model = POWERPC_MMU_2_07;
 #if defined(CONFIG_SOFTMMU)
+    pcc->has_work = cpu_has_work_POWER8;
     pcc->hash64_opts = &ppc_hash64_opts_POWER7;
     pcc->lrg_decr_bits = 32;
     pcc->n_host_threads = 8;
@@ -7939,6 +7943,7 @@ static bool ppc_pvr_match_power9(PowerPCCPUClass *pcc, uint32_t pvr)
     return false;
 }
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static bool cpu_has_work_POWER9(CPUState *cs)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
@@ -7996,6 +8001,7 @@ static bool cpu_has_work_POWER9(CPUState *cs)
         return msr_ee && (cs->interrupt_request & CPU_INTERRUPT_HARD);
     }
 }
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
 {
@@ -8010,7 +8016,6 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
                          PCR_COMPAT_2_05;
     pcc->init_proc = init_proc_POWER9;
     pcc->check_pow = check_pow_nocheck;
-    pcc->has_work = cpu_has_work_POWER9;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
@@ -8059,6 +8064,7 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
     pcc->lpcr_pm = LPCR_PDEE | LPCR_HDEE | LPCR_EEE | LPCR_DEE | LPCR_OEE;
     pcc->mmu_model = POWERPC_MMU_3_00;
 #if defined(CONFIG_SOFTMMU)
+    pcc->has_work = cpu_has_work_POWER9;
     /* segment page size remain the same */
     pcc->hash64_opts = &ppc_hash64_opts_POWER7;
     pcc->radix_page_info = &POWER9_radix_page_info;
@@ -8147,6 +8153,7 @@ static bool ppc_pvr_match_power10(PowerPCCPUClass *pcc, uint32_t pvr)
     return false;
 }
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static bool cpu_has_work_POWER10(CPUState *cs)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
@@ -8204,6 +8211,7 @@ static bool cpu_has_work_POWER10(CPUState *cs)
         return msr_ee && (cs->interrupt_request & CPU_INTERRUPT_HARD);
     }
 }
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
 {
@@ -8219,7 +8227,6 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
                          PCR_COMPAT_2_06 | PCR_COMPAT_2_05;
     pcc->init_proc = init_proc_POWER10;
     pcc->check_pow = check_pow_nocheck;
-    pcc->has_work = cpu_has_work_POWER10;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
@@ -8271,6 +8278,7 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
     pcc->lpcr_pm = LPCR_PDEE | LPCR_HDEE | LPCR_EEE | LPCR_DEE | LPCR_OEE;
     pcc->mmu_model = POWERPC_MMU_3_00;
 #if defined(CONFIG_SOFTMMU)
+    pcc->has_work = cpu_has_work_POWER10;
     /* segment page size remain the same */
     pcc->hash64_opts = &ppc_hash64_opts_POWER7;
     pcc->radix_page_info = &POWER10_radix_page_info;
@@ -8786,6 +8794,7 @@ static void ppc_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.nip = value;
 }
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static bool cpu_has_work_default(CPUState *cs)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
@@ -8801,6 +8810,7 @@ static bool ppc_cpu_has_work(CPUState *cs)
 
     return pcc->has_work(cs);
 }
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 static void ppc_cpu_reset(DeviceState *dev)
 {
@@ -9021,6 +9031,7 @@ static const struct TCGCPUOps ppc_tcg_ops = {
   .tlb_fill = ppc_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+  .has_work = ppc_cpu_has_work,
   .cpu_exec_interrupt = ppc_cpu_exec_interrupt,
   .do_interrupt = ppc_cpu_do_interrupt,
   .cpu_exec_enter = ppc_cpu_exec_enter,
@@ -9041,13 +9052,11 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_unrealize(dc, ppc_cpu_unrealize,
                                       &pcc->parent_unrealize);
     pcc->pvr_match = ppc_pvr_match_default;
-    pcc->has_work = cpu_has_work_default;
     device_class_set_props(dc, ppc_cpu_properties);
 
     device_class_set_parent_reset(dc, ppc_cpu_reset, &pcc->parent_reset);
 
     cc->class_by_name = ppc_cpu_class_by_name;
-    cc->has_work = ppc_cpu_has_work;
     cc->dump_state = ppc_cpu_dump_state;
     cc->set_pc = ppc_cpu_set_pc;
     cc->gdb_read_register = ppc_cpu_gdb_read_register;
@@ -9078,6 +9087,9 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
 
 #ifdef CONFIG_TCG
     cc->tcg_ops = &ppc_tcg_ops;
+#ifndef CONFIG_USER_ONLY
+    pcc->has_work = cpu_has_work_default;
+#endif
 #endif /* CONFIG_TCG */
 }
 
-- 
2.25.1


