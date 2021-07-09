Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF40A3C1ED2
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 07:19:59 +0200 (CEST)
Received: from localhost ([::1]:41536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ive-0003ym-P4
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 01:19:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1itY-0000rS-Au; Fri, 09 Jul 2021 01:17:48 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:37857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1itV-0001pF-La; Fri, 09 Jul 2021 01:17:48 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GLhHd1hYjz9sXJ; Fri,  9 Jul 2021 15:17:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625807853;
 bh=n0Z0Q61yySpmPXEN69QistWyZ7yE79j3dN2qMy7QRDY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G0BiMrqpI2egm7GM/tKPDiJ7+R7K141pkwOUqk8WeLnTP9BYqPZUhE2s2xAb8IOTl
 yY9LFwv6myccSMBB07/0Gmjl41XpNO1cM9T0bLzK+Qo/thmqIcorY3h2RY+G57jEBT
 xGLLGWLzA6Bh5I3gzZFQJYHquXAn6b6Dc8Aij6Aw=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 04/33] target/ppc: Remove PowerPCCPUClass.handle_mmu_fault
Date: Fri,  9 Jul 2021 15:16:59 +1000
Message-Id: <20210709051728.170203-5-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210709051728.170203-1-david@gibson.dropbear.id.au>
References: <20210709051728.170203-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: aik@ozlabs.ru, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Instead, use a switch on env->mmu_model.  This avoids some
replicated information in cpu setup.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210621125115.67717-2-bruno.larsen@eldorado.org.br>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu-qom.h    |  1 -
 target/ppc/cpu_init.c   | 45 -----------------------------------------
 target/ppc/mmu_helper.c | 24 ++++++++++++++++++----
 3 files changed, 20 insertions(+), 50 deletions(-)

diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 7b424e3cb0..5800fa324e 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -198,7 +198,6 @@ struct PowerPCCPUClass {
     int n_host_threads;
     void (*init_proc)(CPUPPCState *env);
     int  (*check_pow)(CPUPPCState *env);
-    int (*handle_mmu_fault)(PowerPCCPU *cpu, vaddr eaddr, int rwx, int mmu_idx);
 };
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 1a22aef874..6f8ce010ba 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -4566,9 +4566,6 @@ POWERPC_FAMILY(601)(ObjectClass *oc, void *data)
                     (1ull << MSR_IR) |
                     (1ull << MSR_DR);
     pcc->mmu_model = POWERPC_MMU_601;
-#if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc->excp_model = POWERPC_EXCP_601;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_601;
@@ -4611,9 +4608,6 @@ POWERPC_FAMILY(601v)(ObjectClass *oc, void *data)
                     (1ull << MSR_IR) |
                     (1ull << MSR_DR);
     pcc->mmu_model = POWERPC_MMU_601;
-#if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_601;
     pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_RTC_CLK | POWERPC_FLAG_HID0_LE;
@@ -4877,9 +4871,6 @@ POWERPC_FAMILY(604)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_32B;
-#if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc->excp_model = POWERPC_EXCP_604;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_604;
@@ -4961,9 +4952,6 @@ POWERPC_FAMILY(604E)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_32B;
-#if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc->excp_model = POWERPC_EXCP_604;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_604;
@@ -5032,9 +5020,6 @@ POWERPC_FAMILY(740)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_32B;
-#if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc->excp_model = POWERPC_EXCP_7x0;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_750;
@@ -5112,9 +5097,6 @@ POWERPC_FAMILY(750)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_32B;
-#if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc->excp_model = POWERPC_EXCP_7x0;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_750;
@@ -5315,9 +5297,6 @@ POWERPC_FAMILY(750cl)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_32B;
-#if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc->excp_model = POWERPC_EXCP_7x0;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_750;
@@ -5398,9 +5377,6 @@ POWERPC_FAMILY(750cx)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_32B;
-#if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc->excp_model = POWERPC_EXCP_7x0;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_750;
@@ -5486,9 +5462,6 @@ POWERPC_FAMILY(750fx)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_32B;
-#if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc->excp_model = POWERPC_EXCP_7x0;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_750;
@@ -5574,9 +5547,6 @@ POWERPC_FAMILY(750gx)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_32B;
-#if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc->excp_model = POWERPC_EXCP_7x0;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_750;
@@ -5816,9 +5786,6 @@ POWERPC_FAMILY(7400)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_32B;
-#if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc->excp_model = POWERPC_EXCP_74xx;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_7400;
@@ -5902,9 +5869,6 @@ POWERPC_FAMILY(7410)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_32B;
-#if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc->excp_model = POWERPC_EXCP_74xx;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_7400;
@@ -6731,9 +6695,6 @@ POWERPC_FAMILY(e600)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_32B;
-#if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc->excp_model = POWERPC_EXCP_74xx;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_7400;
@@ -7493,7 +7454,6 @@ POWERPC_FAMILY(970)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI);
     pcc->mmu_model = POWERPC_MMU_64B;
 #if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash64_handle_mmu_fault;
     pcc->hash64_opts = &ppc_hash64_opts_basic;
 #endif
     pcc->excp_model = POWERPC_EXCP_970;
@@ -7571,7 +7531,6 @@ POWERPC_FAMILY(POWER5P)(ObjectClass *oc, void *data)
         LPCR_RMI | LPCR_HDICE;
     pcc->mmu_model = POWERPC_MMU_2_03;
 #if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash64_handle_mmu_fault;
     pcc->hash64_opts = &ppc_hash64_opts_basic;
     pcc->lrg_decr_bits = 32;
 #endif
@@ -7715,7 +7674,6 @@ POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
     pcc->lpcr_pm = LPCR_P7_PECE0 | LPCR_P7_PECE1 | LPCR_P7_PECE2;
     pcc->mmu_model = POWERPC_MMU_2_06;
 #if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash64_handle_mmu_fault;
     pcc->hash64_opts = &ppc_hash64_opts_POWER7;
     pcc->lrg_decr_bits = 32;
 #endif
@@ -7891,7 +7849,6 @@ POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
                    LPCR_P8_PECE3 | LPCR_P8_PECE4;
     pcc->mmu_model = POWERPC_MMU_2_07;
 #if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash64_handle_mmu_fault;
     pcc->hash64_opts = &ppc_hash64_opts_POWER7;
     pcc->lrg_decr_bits = 32;
     pcc->n_host_threads = 8;
@@ -8106,7 +8063,6 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
     pcc->lpcr_pm = LPCR_PDEE | LPCR_HDEE | LPCR_EEE | LPCR_DEE | LPCR_OEE;
     pcc->mmu_model = POWERPC_MMU_3_00;
 #if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc64_v3_handle_mmu_fault;
     /* segment page size remain the same */
     pcc->hash64_opts = &ppc_hash64_opts_POWER7;
     pcc->radix_page_info = &POWER9_radix_page_info;
@@ -8317,7 +8273,6 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
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
2.31.1


