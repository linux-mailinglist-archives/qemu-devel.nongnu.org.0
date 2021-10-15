Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C372F42E7F6
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:40:29 +0200 (CEST)
Received: from localhost ([::1]:58420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbF1A-0001eH-RK
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:40:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEZ8-0007Sg-Cf
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:30 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:33480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEZ4-0000Ps-5w
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:28 -0400
Received: by mail-pg1-x529.google.com with SMTP id j190so699318pgd.0
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KnTU5CAKa2qgMNASytkbtJZqSTjvEtUQYaIow0w1ICM=;
 b=a7eb1zlPqc3bP74CRPkCEpi9STnrvC1+Nx38ng5VMiw1u4SP68TXmb5k3zmOYdTheJ
 uzd1EOHxZfMXcd1EwbG/0Yp/1aXzQMCv/q5cvsB6snoWOdvoG7wIPxO8ZFVtKUvIDn5B
 2zMD22pwk8cetaUarx3mu/yyh/3LEyEwxTyzwHcUdmE6AdfUkKsgIQ2jbKaowLwHAEfv
 ULDaHPo9/Hqm2ICL+wfgrw776FlkNixZfTdciNu1d/2OKbd6LuM0/Vuh38XsPsAL4gpM
 7ERRJAOUtjxmX+tkhBHQt+LUPM1or9efDV28ogto3olNNNTp4Ns5fjX7vIbrlTJRO6hx
 FSyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KnTU5CAKa2qgMNASytkbtJZqSTjvEtUQYaIow0w1ICM=;
 b=rcWTlmnUIpea4scPh1ALYysHLnQSGIpmeJWftLWjnFMmwMDs7gy6DAttHj/Ci79YqM
 mV1ysDpsCG5W3QGGi4uAJVPqL1LEDdDU0eRbPUTGxQgdCUgjB4tXZJj/oU/p5nXqUggH
 5mjwS7/VefHCH21nV9uYqUuouWsrDqkNhoAO4wN9Xx8HWCmLYQYUzeJTbLCbKjPUnaMj
 2Zp6jLoCMQ5aDlOHTkzajqGE4AOBn0cVv9pgQE2A7yBhMeAKnaUH5xYNdYMvw4O3ldJs
 KbJQHsF9Rsp4RhlSf9iiYgh7QCZgjTHnQs76JuexhaR3xey+TzY12ZLPeWaOaeQKYRuZ
 +hsQ==
X-Gm-Message-State: AOAM532P494Q9XOqWTE16K3JumHkWn0sGlxFCWTaKNoXTrgY/F1jDh1w
 vjVayfCbJQ5UCLjVCmUr/tYEUykWY1E=
X-Google-Smtp-Source: ABdhPJwK75goxqZ7bLJfTY23K42iHeiqqsBOtrzyMf1FpXisrleH6VoBgrPmNdPLRvmCJcmiR3vmwA==
X-Received: by 2002:a63:7404:: with SMTP id p4mr7213586pgc.222.1634271082769; 
 Thu, 14 Oct 2021 21:11:22 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id me12sm5718006pjb.27.2021.10.14.21.11.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:11:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 34/67] target/ppc: Implement ppc_cpu_record_sigsegv
Date: Thu, 14 Oct 2021 21:10:20 -0700
Message-Id: <20211015041053.2769193-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Record DAR, DSISR, and exception_index.  That last means
that we must exit to cpu_loop ourselves, instead of letting
exception_index being overwritten.

This is exactly what the user-mode ppc_cpu_tlb_fill does,
so simply rename it as ppc_cpu_record_sigsegv.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu.h              |  3 ---
 target/ppc/internal.h         |  9 +++++++++
 target/ppc/cpu_init.c         |  6 ++++--
 target/ppc/user_only_helper.c | 15 +++++++++++----
 4 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index baa4e7c34d..2242d57718 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1279,9 +1279,6 @@ extern const VMStateDescription vmstate_ppc_cpu;
 
 /*****************************************************************************/
 void ppc_translate_init(void);
-bool ppc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                      MMUAccessType access_type, int mmu_idx,
-                      bool probe, uintptr_t retaddr);
 
 #if !defined(CONFIG_USER_ONLY)
 void ppc_store_sdr1(CPUPPCState *env, target_ulong value);
diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index 55284369f5..339974b7d8 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -283,5 +283,14 @@ static inline void pte_invalidate(target_ulong *pte0)
 #define PTE_PTEM_MASK 0x7FFFFFBF
 #define PTE_CHECK_MASK (TARGET_PAGE_MASK | 0x7B)
 
+#ifdef CONFIG_USER_ONLY
+void ppc_cpu_record_sigsegv(CPUState *cs, vaddr addr,
+                            MMUAccessType access_type,
+                            bool maperr, uintptr_t ra);
+#else
+bool ppc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                      MMUAccessType access_type, int mmu_idx,
+                      bool probe, uintptr_t retaddr);
+#endif
 
 #endif /* PPC_INTERNAL_H */
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 6aad01d1d3..ec8da08f0b 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -9014,9 +9014,11 @@ static const struct SysemuCPUOps ppc_sysemu_ops = {
 
 static const struct TCGCPUOps ppc_tcg_ops = {
   .initialize = ppc_translate_init,
-  .tlb_fill = ppc_cpu_tlb_fill,
 
-#ifndef CONFIG_USER_ONLY
+#ifdef CONFIG_USER_ONLY
+  .record_sigsegv = ppc_cpu_record_sigsegv,
+#else
+  .tlb_fill = ppc_cpu_tlb_fill,
   .cpu_exec_interrupt = ppc_cpu_exec_interrupt,
   .do_interrupt = ppc_cpu_do_interrupt,
   .cpu_exec_enter = ppc_cpu_exec_enter,
diff --git a/target/ppc/user_only_helper.c b/target/ppc/user_only_helper.c
index aa3f867596..7ff76f7a06 100644
--- a/target/ppc/user_only_helper.c
+++ b/target/ppc/user_only_helper.c
@@ -21,16 +21,23 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "internal.h"
 
-
-bool ppc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                      MMUAccessType access_type, int mmu_idx,
-                      bool probe, uintptr_t retaddr)
+void ppc_cpu_record_sigsegv(CPUState *cs, vaddr address,
+                            MMUAccessType access_type,
+                            bool maperr, uintptr_t retaddr)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
     CPUPPCState *env = &cpu->env;
     int exception, error_code;
 
+    /*
+     * Both DSISR and the "trap number" (exception vector offset,
+     * looked up from exception_index) are present in the linux-user
+     * signal frame.
+     * FIXME: we don't actually populate the trap number properly.
+     * It would be easiest to fill in an env->trap value now.
+     */
     if (access_type == MMU_INST_FETCH) {
         exception = POWERPC_EXCP_ISI;
         error_code = 0x40000000;
-- 
2.25.1


