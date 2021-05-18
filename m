Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 377E538815C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 22:27:20 +0200 (CEST)
Received: from localhost ([::1]:44778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj6JD-00076W-0l
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 16:27:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64g-0000uE-CV
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:12:18 -0400
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32]:33455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64T-0006Jz-N4
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:12:18 -0400
Received: by mail-oo1-xc32.google.com with SMTP id
 j17-20020a4ad6d10000b02901fef5280522so2528084oot.0
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 13:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t1r0lLSqHjjKE2pLj2JipZ/ZLiJZUx0FOO0kIdrgSBM=;
 b=VY+/hYeb7IlYxZxx6qrf/fZSEtzhd+dF2/RJNxp38lHa1Iu2AmDwQASKn9MQej0phW
 XfszFRQTj2fkMfEqIcbigQPfxN/ilmkf081myBfCcfKHV59s1MF7a9bQ7ud5XUSUdWP0
 8/w5sO/upLfUnzwb3BSQhaH2r+cFJBj4RDqL+pm72Rhtxs95oVEjEIRQuPkgNDvb9/MX
 RXsR/6PO5AxRnnz5PzYhibe2TnWNxgTqMjujpgRRut1ljklQE1uawXVj3XbSTaFqsQNl
 qGzTJ1VamfddV3jIUxn6sRRcc8W17WmHcmDk2DYG3ZpI+gmV1uR+/YRTEvFTwO1xPePH
 VnAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t1r0lLSqHjjKE2pLj2JipZ/ZLiJZUx0FOO0kIdrgSBM=;
 b=hbMSqDQDmQQnjofVAhDblh5TJGy3Z3n8zhVTXA3sb2lk2HNNoxvL/4p78T4yMogn8y
 tuo/ngqtgoCDJWJpBhTHBv9mAhySTA+33etx9EVpxU68V0NlOYzch/CvqEMafPTPyemC
 P2rDnZ7nGrBvdc5ig0S99icZTP5t8Z4/2iPv9VrkZnS5egopJ46VdT5XsRKizumvAevf
 QjKmX3gt+Nf71DaAX/GsL/iACqviMP9EpQgsKbrvfuTsRKbaowZafossPBB5JlXOKZnw
 6N/725iwSHkQpaZS0fiFcAGvOI1Em9PkfMnq81+uXP8yT1w7skN/YA4OP+LZT50bgUyJ
 ZgBg==
X-Gm-Message-State: AOAM533/sqKFXeMICx3kmG9CjhdGcIdC+UgBN20x2kzhh/IfD63PWuSC
 3GAzCsaLDy+XB77pQSg0+mR1h3QU+jjW60dO
X-Google-Smtp-Source: ABdhPJzUbo+fdUlmMYLsPK15NgMZeRA0KRHr7K5arQpcGpBvAlhmm6LsY4dQKCVDK6krhGPyc3IIvg==
X-Received: by 2002:a4a:b402:: with SMTP id y2mr5797093oon.87.1621368724242;
 Tue, 18 May 2021 13:12:04 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id u27sm3953204oof.38.2021.05.18.13.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 13:12:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/24] target/ppc: Remove PowerPCCPUClass.handle_mmu_fault
Date: Tue, 18 May 2021 15:11:38 -0500
Message-Id: <20210518201146.794854-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518201146.794854-1-richard.henderson@linaro.org>
References: <20210518201146.794854-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c32;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc32.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: bruno.larsen@eldorado.org.br, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
index d0fa219880..d33aded7cf 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -4580,9 +4580,6 @@ POWERPC_FAMILY(601)(ObjectClass *oc, void *data)
                     (1ull << MSR_IR) |
                     (1ull << MSR_DR);
     pcc->mmu_model = POWERPC_MMU_601;
-#if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc->excp_model = POWERPC_EXCP_601;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_601;
@@ -4625,9 +4622,6 @@ POWERPC_FAMILY(601v)(ObjectClass *oc, void *data)
                     (1ull << MSR_IR) |
                     (1ull << MSR_DR);
     pcc->mmu_model = POWERPC_MMU_601;
-#if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_601;
     pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_RTC_CLK | POWERPC_FLAG_HID0_LE;
@@ -4891,9 +4885,6 @@ POWERPC_FAMILY(604)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_32B;
-#if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc->excp_model = POWERPC_EXCP_604;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_604;
@@ -4975,9 +4966,6 @@ POWERPC_FAMILY(604E)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_32B;
-#if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc->excp_model = POWERPC_EXCP_604;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_604;
@@ -5046,9 +5034,6 @@ POWERPC_FAMILY(740)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_32B;
-#if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc->excp_model = POWERPC_EXCP_7x0;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_750;
@@ -5126,9 +5111,6 @@ POWERPC_FAMILY(750)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_32B;
-#if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc->excp_model = POWERPC_EXCP_7x0;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_750;
@@ -5329,9 +5311,6 @@ POWERPC_FAMILY(750cl)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_32B;
-#if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc->excp_model = POWERPC_EXCP_7x0;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_750;
@@ -5412,9 +5391,6 @@ POWERPC_FAMILY(750cx)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_32B;
-#if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc->excp_model = POWERPC_EXCP_7x0;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_750;
@@ -5500,9 +5476,6 @@ POWERPC_FAMILY(750fx)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_32B;
-#if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc->excp_model = POWERPC_EXCP_7x0;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_750;
@@ -5588,9 +5561,6 @@ POWERPC_FAMILY(750gx)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_32B;
-#if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc->excp_model = POWERPC_EXCP_7x0;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_750;
@@ -5830,9 +5800,6 @@ POWERPC_FAMILY(7400)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_32B;
-#if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc->excp_model = POWERPC_EXCP_74xx;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_7400;
@@ -5916,9 +5883,6 @@ POWERPC_FAMILY(7410)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_32B;
-#if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc->excp_model = POWERPC_EXCP_74xx;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_7400;
@@ -6745,9 +6709,6 @@ POWERPC_FAMILY(e600)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_32B;
-#if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash32_handle_mmu_fault;
-#endif
     pcc->excp_model = POWERPC_EXCP_74xx;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_7400;
@@ -7507,7 +7468,6 @@ POWERPC_FAMILY(970)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI);
     pcc->mmu_model = POWERPC_MMU_64B;
 #if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash64_handle_mmu_fault;
     pcc->hash64_opts = &ppc_hash64_opts_basic;
 #endif
     pcc->excp_model = POWERPC_EXCP_970;
@@ -7585,7 +7545,6 @@ POWERPC_FAMILY(POWER5P)(ObjectClass *oc, void *data)
         LPCR_RMI | LPCR_HDICE;
     pcc->mmu_model = POWERPC_MMU_2_03;
 #if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash64_handle_mmu_fault;
     pcc->hash64_opts = &ppc_hash64_opts_basic;
     pcc->lrg_decr_bits = 32;
 #endif
@@ -7729,7 +7688,6 @@ POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
     pcc->lpcr_pm = LPCR_P7_PECE0 | LPCR_P7_PECE1 | LPCR_P7_PECE2;
     pcc->mmu_model = POWERPC_MMU_2_06;
 #if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash64_handle_mmu_fault;
     pcc->hash64_opts = &ppc_hash64_opts_POWER7;
     pcc->lrg_decr_bits = 32;
 #endif
@@ -7906,7 +7864,6 @@ POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
                    LPCR_P8_PECE3 | LPCR_P8_PECE4;
     pcc->mmu_model = POWERPC_MMU_2_07;
 #if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc_hash64_handle_mmu_fault;
     pcc->hash64_opts = &ppc_hash64_opts_POWER7;
     pcc->lrg_decr_bits = 32;
     pcc->n_host_threads = 8;
@@ -8122,7 +8079,6 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
     pcc->lpcr_pm = LPCR_PDEE | LPCR_HDEE | LPCR_EEE | LPCR_DEE | LPCR_OEE;
     pcc->mmu_model = POWERPC_MMU_3_00;
 #if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc64_v3_handle_mmu_fault;
     /* segment page size remain the same */
     pcc->hash64_opts = &ppc_hash64_opts_POWER7;
     pcc->radix_page_info = &POWER9_radix_page_info;
@@ -8334,7 +8290,6 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
     pcc->lpcr_pm = LPCR_PDEE | LPCR_HDEE | LPCR_EEE | LPCR_DEE | LPCR_OEE;
     pcc->mmu_model = POWERPC_MMU_3_00;
 #if defined(CONFIG_SOFTMMU)
-    pcc->handle_mmu_fault = ppc64_v3_handle_mmu_fault;
     /* segment page size remain the same */
     pcc->hash64_opts = &ppc_hash64_opts_POWER7;
     pcc->radix_page_info = &POWER10_radix_page_info;
diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index ef634fcb33..863e556a22 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -2963,14 +2963,30 @@ bool ppc_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
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
2.25.1


