Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4AD442C94
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:31:59 +0100 (CET)
Received: from localhost ([::1]:55870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhs1G-0007Ts-5L
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:31:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhreM-00044w-61
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:08:23 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:35364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhreF-0000x3-Ff
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:08:17 -0400
Received: by mail-qt1-x832.google.com with SMTP id n2so18483171qta.2
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b7jpFgMMciMmW9Xl8VdlfSERFh4gLfLYDvd7byDKhQQ=;
 b=w7Pm78LuAizvjoUZfy4dfSHmmY31Ki3yRDddBQ2xgO9Pq8rT2Ga3GHlNM349h7Q251
 vXkACRNhmmFS7Igx6x0N1hp8k5XktLBqW80Ieh7YHmErXq3qR/T/jNQASwwawJiVlRuo
 DeiYdXvNyHnXVWwhDz4ebX43UyE+sztk46GNIfBiibfppj00p5hWNmBy7wAX7rufc1WK
 K6oAkk4SYHUo0DxeLBOeKjC7MuKAaUQzP5LPFRe9RUMdkpl1Tcw5ICs0ZItKKkCCsQ1O
 W0lQFrJqvgtVp6XUciRuX/fMVixB0PvhTTe3iBWf53bEvVsOYqkis61h8ySsygqBkE4y
 x9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b7jpFgMMciMmW9Xl8VdlfSERFh4gLfLYDvd7byDKhQQ=;
 b=rvpfVapn8GoyJEsnYL4D3g8SNi7bS0KIv/37kcxaF3rpAg33ANoqy5q/9TEZh1E9AU
 j0ABhf6gGOeY4M1GdSEDXFu7aue/FvptyOnnHzfxtEx70zEQRElXs2DZReixr8Md9BMD
 H0epO8zCrD6qQuopnXlIa2RBbm60pePL/7E2ZAYdOFPjQwAR/9NeS2sGDLqg5oFfLO65
 zoPMx6WmDd41wk7eVX30uAvUfkHD1f8x+z2WiJwHBXAw+5HBKZVUt/cXiF6pqtLHjrx2
 ZH3pUnI0KBNvF8QMw8E3WnxrEGrMm3/mkhIlJMcn1+oGywn9OOMiHYvpW+SjKhy9PDXf
 Hztw==
X-Gm-Message-State: AOAM530VexoXFx6v5R7ItVWATjf0YRroa0IKzPDddI3+trdd+k0XdQKG
 khrf0MwHgpEOv8qO3Nmeg2Se9W9wYXuPPw==
X-Google-Smtp-Source: ABdhPJxXWwDm/kSPArwFLQSrHSZ98WVRhCaRPBEXcCctrGN5jBZ/1iiVsLCAX1utsdo1URjxQpoTkg==
X-Received: by 2002:ac8:7f84:: with SMTP id z4mr20919448qtj.81.1635851281573; 
 Tue, 02 Nov 2021 04:08:01 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm7sm3568612qkb.86.2021.11.02.04.08.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:08:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 34/60] target/ppc: Implement ppc_cpu_record_sigsegv
Date: Tue,  2 Nov 2021 07:07:14 -0400
Message-Id: <20211102110740.215699-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x832.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
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


