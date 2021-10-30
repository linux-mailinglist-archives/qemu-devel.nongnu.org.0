Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F17C1440AC4
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 19:53:07 +0200 (CEST)
Received: from localhost ([::1]:50510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgsXT-0007Bf-2q
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 13:53:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryi-0002K1-Hs
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:17:13 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:46791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryf-0000DR-Te
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:17:11 -0400
Received: by mail-pg1-x529.google.com with SMTP id m21so12952887pgu.13
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b7jpFgMMciMmW9Xl8VdlfSERFh4gLfLYDvd7byDKhQQ=;
 b=bmggfLRWPCJlTliDYIwBF8AYW0VkvebmqgGIIqytjKXy3KZlUkUvhBwyV3DAeFF3Ux
 6zZRRoW/foO7p51WiwKTvH9lv0Gq4w3desbgQDwjyv1BPkX7lPWLQw5exHwH/stxrCOg
 qVYym6y9m7K1ibCV12ln0gntrzj7gJPyqHd64KeDun8I8icAcMSMBOa0b+9SLTW6A+OW
 h/p2auyDhFj41cVZTvETvNtaaBGhwZOJY6G7N1zr8igrHRKPRywOyFDh2RxAHpIMLOJP
 qEfwajpBMsb2y26V6PJsRojOjL8uNB5imsn5l5wFQMu3gihQ8POZAa0QvDyFapx4UT7I
 uvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b7jpFgMMciMmW9Xl8VdlfSERFh4gLfLYDvd7byDKhQQ=;
 b=Hbaa94Dg47HSETowMzBWQPCVNWaLmC4Djah17x8OQ2cFvgTPr9Fwmj0zFvOlta5dCj
 Xnd+Qo9SfpWyya7Awd8O60kBJuwbBO2m0Z28HECPZh0DNdctk4IMqacGFqKbDuAicGTP
 lsaJv6ixmkIu2Jb74P+NDO9UWEnsdPH+MHeLeptPnvDNRdmrtsmzASJBUUK2WWOgQjIa
 045NI7ifP/GzEvGTw/qxeE0wLhzkvppDXmdOq+tm7j9WrMITcmsdUBr3RLmnKEioUMIs
 BbH3nzHPDGFGSMskL2axukGXwpVXUF3NMquLRrflI0wcT6yXSQYFyurTgAmHjdKAkj9T
 hJeg==
X-Gm-Message-State: AOAM530VRkk9GZTZMTSeDdVu39ablvJhA1+R9u0aC5D/LueDQkxFVYrj
 WPLP8v9CLVxEHD4cVXg3LuXQBssOKpWsTw==
X-Google-Smtp-Source: ABdhPJzRHoczupkHll1mbPl1t+KPExVH+zlLmGLOXS4YVz6n4UINrdIgpT3r3h82s5mi/TE0O/EBPw==
X-Received: by 2002:a05:6a00:148c:b0:47c:1776:3599 with SMTP id
 v12-20020a056a00148c00b0047c17763599mr18320750pfu.32.1635614227940; 
 Sat, 30 Oct 2021 10:17:07 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id nv4sm3111943pjb.17.2021.10.30.10.17.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:17:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 34/66] target/ppc: Implement ppc_cpu_record_sigsegv
Date: Sat, 30 Oct 2021 10:16:03 -0700
Message-Id: <20211030171635.1689530-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Record DAR, DSISR, and exception_index.  That last means
that we must exit to cpu_loop ourselves, instead of letting
exception_index being overwritten.

This is exactly what the user-mode ppc_cpu_tlb_fill does,
so simply rename it as ppc_cpu_record_sigsegv.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu.h              |  3 ---
 target/ppc/internal.h         |  9 +++++++++
 target/ppc/cpu_init.c         |  6 ++++--
 target/ppc/user_only_helper.c | 15 +++++++++++----
 4 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 0472ec9154..e946da5f3a 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1302,9 +1302,6 @@ extern const VMStateDescription vmstate_ppc_cpu;
 
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
index 65545ba9ca..1c7a7b4b38 100644
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


