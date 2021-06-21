Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BBB3AE971
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 14:55:29 +0200 (CEST)
Received: from localhost ([::1]:46234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvJSa-0000hg-NB
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 08:55:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lvJP2-00061S-I9; Mon, 21 Jun 2021 08:51:48 -0400
Received: from [201.28.113.2] (port=53676 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lvJP0-0004ci-J5; Mon, 21 Jun 2021 08:51:48 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 21 Jun 2021 09:51:39 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 2AAD7800055;
 Mon, 21 Jun 2021 09:51:39 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/10] target/ppc: Remove PowerPCCPUClass.handle_mmu_fault
Date: Mon, 21 Jun 2021 09:51:06 -0300
Message-Id: <20210621125115.67717-2-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210621125115.67717-1-bruno.larsen@eldorado.org.br>
References: <20210621125115.67717-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 21 Jun 2021 12:51:39.0289 (UTC)
 FILETIME=[2D5F9890:01D7669C]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SUBJ_WIPE_DEBT=1.004 autolearn=no autolearn_force=no
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
Cc: farosas@linux.ibm.com, Richard Henderson <richard.henderson@linaro.org>,
 luis.pires@eldorado.org.br, Greg Kurz <groug@kaod.org>,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, clg@kaod.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Instead, use a switch on env->mmu_model.  This avoids some
replicated information in cpu setup.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu-qom.h    |  1 -
 target/ppc/cpu_init.c   | 45 -----------------------------------------
 target/ppc/mmu_helper.c | 24 ++++++++++++++++++----
 3 files changed, 20 insertions(+), 50 deletions(-)

diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 06b6571bc9..3b14d2f134 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -198,7 +198,6 @@ struct PowerPCCPUClass {
     int n_host_threads;
     void (*init_proc)(CPUPPCState *env);
     int  (*check_pow)(CPUPPCState *env);
-    int (*handle_mmu_fault)(PowerPCCPU *cpu, vaddr eaddr, int rwx, int mmu_idx);
     bool (*interrupts_big_endian)(PowerPCCPU *cpu);
 };
 
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index d0411e7302..3a8d8d3f07 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -4578,9 +4578,6 @@ POWERPC_FAMILY(601)(ObjectClass *oc, void *data)
                     (1ull << MSR_IR) |
                     (1ull << MSR_DR);
     pcc->mmu_model = POWERPC_MMU_601;
-#if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc->excp_model = POWERPC_EXCP_601;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_601;
@@ -4623,9 +4620,6 @@ POWERPC_FAMILY(601v)(ObjectClass *oc, void *data)
                     (1ull << MSR_IR) |
                     (1ull << MSR_DR);
     pcc->mmu_model = POWERPC_MMU_601;
-#if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_601;
     pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_RTC_CLK | POWERPC_FLAG_HID0_LE;
@@ -4889,9 +4883,6 @@ POWERPC_FAMILY(604)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_32B;
-#if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc->excp_model = POWERPC_EXCP_604;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_604;
@@ -4973,9 +4964,6 @@ POWERPC_FAMILY(604E)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_32B;
-#if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc->excp_model = POWERPC_EXCP_604;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_604;
@@ -5044,9 +5032,6 @@ POWERPC_FAMILY(740)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_32B;
-#if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc->excp_model = POWERPC_EXCP_7x0;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_750;
@@ -5124,9 +5109,6 @@ POWERPC_FAMILY(750)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_32B;
-#if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc->excp_model = POWERPC_EXCP_7x0;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_750;
@@ -5327,9 +5309,6 @@ POWERPC_FAMILY(750cl)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_32B;
-#if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc->excp_model = POWERPC_EXCP_7x0;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_750;
@@ -5410,9 +5389,6 @@ POWERPC_FAMILY(750cx)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_32B;
-#if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc->excp_model = POWERPC_EXCP_7x0;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_750;
@@ -5498,9 +5474,6 @@ POWERPC_FAMILY(750fx)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_32B;
-#if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc->excp_model = POWERPC_EXCP_7x0;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_750;
@@ -5586,9 +5559,6 @@ POWERPC_FAMILY(750gx)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_32B;
-#if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc->excp_model = POWERPC_EXCP_7x0;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_750;
@@ -5828,9 +5798,6 @@ POWERPC_FAMILY(7400)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_32B;
-#if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc->excp_model = POWERPC_EXCP_74xx;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_7400;
@@ -5914,9 +5881,6 @@ POWERPC_FAMILY(7410)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_32B;
-#if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc->excp_model = POWERPC_EXCP_74xx;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_7400;
@@ -6743,9 +6707,6 @@ POWERPC_FAMILY(e600)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_32B;
-#if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc->excp_model = POWERPC_EXCP_74xx;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_7400;
@@ -7505,7 +7466,6 @@ POWERPC_FAMILY(970)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI);
     pcc->mmu_model = POWERPC_MMU_64B;
 #if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash64_handle_mmu_fault;
     pcc->hash64_opts = &ppc_hash64_opts_basic;
 #endif
     pcc->excp_model = POWERPC_EXCP_970;
@@ -7583,7 +7543,6 @@ POWERPC_FAMILY(POWER5P)(ObjectClass *oc, void *data)
         LPCR_RMI | LPCR_HDICE;
     pcc->mmu_model = POWERPC_MMU_2_03;
 #if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash64_handle_mmu_fault;
     pcc->hash64_opts = &ppc_hash64_opts_basic;
     pcc->lrg_decr_bits = 32;
 #endif
@@ -7727,7 +7686,6 @@ POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
     pcc->lpcr_pm = LPCR_P7_PECE0 | LPCR_P7_PECE1 | LPCR_P7_PECE2;
     pcc->mmu_model = POWERPC_MMU_2_06;
 #if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash64_handle_mmu_fault;
     pcc->hash64_opts = &ppc_hash64_opts_POWER7;
     pcc->lrg_decr_bits = 32;
 #endif
@@ -7904,7 +7862,6 @@ POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
                    LPCR_P8_PECE3 | LPCR_P8_PECE4;
     pcc->mmu_model = POWERPC_MMU_2_07;
 #if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash64_handle_mmu_fault;
     pcc->hash64_opts = &ppc_hash64_opts_POWER7;
     pcc->lrg_decr_bits = 32;
     pcc->n_host_threads = 8;
@@ -8120,7 +8077,6 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
     pcc->lpcr_pm = LPCR_PDEE | LPCR_HDEE | LPCR_EEE | LPCR_DEE | LPCR_OEE;
     pcc->mmu_model = POWERPC_MMU_3_00;
 #if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc64_v3_handle_mmu_fault;
     /* segment page size remain the same */
     pcc->hash64_opts = &ppc_hash64_opts_POWER7;
     pcc->radix_page_info = &POWER9_radix_page_info;
@@ -8332,7 +8288,6 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
     pcc->lpcr_pm = LPCR_PDEE | LPCR_HDEE | LPCR_EEE | LPCR_DEE | LPCR_OEE;
     pcc->mmu_model = POWERPC_MMU_3_00;
 #if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc64_v3_handle_mmu_fault;
     /* segment page size remain the same */
     pcc->hash64_opts = &ppc_hash64_opts_POWER7;
     pcc->radix_page_info = &POWER10_radix_page_info;
diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 1ecb36e85a..c4b1c93e47 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -2947,14 +2947,30 @@ bool ppc_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
                       bool probe, uintptr_t retaddr)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
-    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cs);
     CPUPPCState *env = &cpu->env;
     int ret;
 
-    if (pcc->handle_mmu_fault) {
-        ret = pcc->handle_mmu_fault(cpu, addr, access_type, mmu_idx);
-    } else {
+    switch (env->mmu_model) {
+#if defined(TARGET_PPC64)
+    case POWERPC_MMU_64B:
+    case POWERPC_MMU_2_03:
+    case POWERPC_MMU_2_06:
+    case POWERPC_MMU_2_07:
+        ret = ppc_hash64_handle_mmu_fault(cpu, addr, access_type, mmu_idx);
+        break;
+    case POWERPC_MMU_3_00:
+        ret = ppc64_v3_handle_mmu_fault(cpu, addr, access_type, mmu_idx);
+        break;
+#endif
+
+    case POWERPC_MMU_32B:
+    case POWERPC_MMU_601:
+        ret = ppc_hash32_handle_mmu_fault(cpu, addr, access_type, mmu_idx);
+        break;
+
+    default:
         ret = cpu_ppc_handle_mmu_fault(env, addr, access_type, mmu_idx);
+        break;
     }
     if (unlikely(ret != 0)) {
         if (probe) {
-- 
2.17.1


