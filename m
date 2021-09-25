Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF365418329
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 17:17:47 +0200 (CEST)
Received: from localhost ([::1]:42806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU9Qw-0001mB-To
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 11:17:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU93m-0002Z9-Pa; Sat, 25 Sep 2021 10:53:50 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:38840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU93g-0006oV-P6; Sat, 25 Sep 2021 10:53:46 -0400
Received: by mail-wr1-x42e.google.com with SMTP id u18so36547773wrg.5;
 Sat, 25 Sep 2021 07:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IiP54nTlira6zI1808uaFu0plQ+4ScQiNyLo+fDpcgY=;
 b=oa9N22veagxHVmHotr3xEvh0pdMb0uSKgqnKR1v15a7I8NE3DfxoWbsyw4DBFZspI7
 jAIociFOwzbZX0OC0DzztlZ3Bd63o9jtbmV1eNjUg5g+lwkM4C4fT8lnNDvvI4JCY0pb
 JuBL+n5N5DHcnaDXuAoeDBUHAF79oFI8mpBeUyuWb+KthCDIMwZ+DxqqipW0i6Os4vyY
 CMfFwfw4WvPflHgwguRmWAMhj8xk/7hvTu9OefUXHNS8YS0pioV7dY9KiYiPqAlKWKZf
 3bE8qcnljbGvYgV/3s1ingfgfs0D1W3LlQjsfrrypkLlgcXOWZy1hLOuqWpld2JrvfWc
 MxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IiP54nTlira6zI1808uaFu0plQ+4ScQiNyLo+fDpcgY=;
 b=VoNcQPHjYCIjIT3bewsOOlgK0FWXRYOkT8m8BLu63CIqJrMKJVX3Q+fOlNjKO7qMnR
 Ii/r702cq/u6j8ZMLizlnsWyLyjS6kHI9dXehE7nhf5tBP+44nYzcQISWWEbHnq1AQjG
 h4dcIjzNQdvsgfH8iTzvBEMAo4Zy1651Q5WjHecJnVPRC1wWPUtLb7c6wovnk30QamHl
 ckK9f8l3/C45cmiOoc5mY1nWv1xApXsduZzbj+IvDk0LnMLm0LHUxD/qP6kCPxzP2hZH
 VYmJqOk+TUJGHqJa9bby2ku1s9BVjzbHlZ6Ux0+bCGw8zrVL3dBUHj2BgQ+cKNJeD1ih
 n2WA==
X-Gm-Message-State: AOAM532+rWkdDICuL3ekAh0eRUgtohGPgjlPoq4yJEhL6M18JnoMEd3T
 gxivZANCybLf+msb84Lc4rWDOlPGnXI=
X-Google-Smtp-Source: ABdhPJw0ZKv5G6qL/TsD0qZhdNETmr67E8gkLaWoXIQwbJfheOBtp9UTy7Ig0OZPSOtwh3h4gCNmcg==
X-Received: by 2002:a05:600c:2109:: with SMTP id
 u9mr7226486wml.6.1632581622819; 
 Sat, 25 Sep 2021 07:53:42 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 c132sm15873859wma.22.2021.09.25.07.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 07:53:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 30/40] target/ppc: Restrict has_work() handlers to sysemu
 and TCG
Date: Sat, 25 Sep 2021 16:51:08 +0200
Message-Id: <20210925145118.1361230-31-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210925145118.1361230-1-f4bug@amsat.org>
References: <20210925145118.1361230-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 Greg Kurz <groug@kaod.org>, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict PowerPCCPUClass::has_work() and ppc_cpu_has_work()
- SysemuCPUOps::has_work() implementation - to TCG sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/ppc/cpu-qom.h  |  4 +++-
 target/ppc/cpu_init.c | 24 ++++++++++++++++++------
 2 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 36110112506..ff2bafcde6f 100644
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
index 2f7d262b176..5c134adeea9 100644
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
2.31.1


