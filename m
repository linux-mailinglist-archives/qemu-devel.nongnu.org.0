Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F921410857
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 21:23:22 +0200 (CEST)
Received: from localhost ([::1]:45132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRfvl-00018w-IA
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 15:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLl-0005HN-Nk
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:46:09 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:38524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLb-0006x6-4D
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:46:09 -0400
Received: by mail-pg1-x531.google.com with SMTP id w8so13086670pgf.5
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 11:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sn+LIrzqj+yUnZFtGLsVKMxQIhFnl26SyubeCGE6DkU=;
 b=B6MspZYAJYqgG6K/uTqQMn/Ddo9O0k4jTqPEQSTkZB0wtBiBJNsb+N6JBmV2P3bKIX
 tnK4mXr8M3V4vKpzOYK7fFHgmC04PcQfvgspqY3My2z3pDMLxzQjqkeMnEuX8QzxDGoK
 EQku/TjvUJ280cyj5z6oeCpVezJFnMeiHXafUS9qAzWF9NgxsV3YL1Ln0+M+ki1t4lYv
 ryMY262MWftOBIVWDyFmvkJ+LgfITyd4BKp0CVDHvwOfmNXFodJHxF5GNyCZiUGo/dx+
 jRIvLbTRUD8DcsmR7dMeIdQEymXQOuMEwhN1peSdogEEEjGjX0Wkz0Qe2yOS6IFDR6zQ
 fOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sn+LIrzqj+yUnZFtGLsVKMxQIhFnl26SyubeCGE6DkU=;
 b=yN2MiSfXoY/1aUmklU/wlRH+6Nyh2hZJdZgnTPk5WxznlyxlqzXWp8f3/cr29qy6VL
 mpwIESH5ZgofEibo5WpII4H0XzTuM3rpU9Yx2MFGvk3jIBm85YXCw1Wf74YxIghzEvOp
 OLIQcJCvE6RUTQtccuzLKMrdwHDIxdUq1kJ4xUeCNff36Evy3mU19KD8wF7pcpSdsOa+
 K1mpi6WwNC72M4S/WAkix0vig47u8YJKnFxM4Z9R6ruae4pDWaAtxrDvi5pd5HDEPm6G
 1Io9LVVbznmiWQQK0c22ykVfRDhWTN6ibjw6cryJztrdsIlh3z8VqpLLDU1lrmRbTnFB
 i03A==
X-Gm-Message-State: AOAM53209GFm00ceF8M6/RVKAXWlfsKgVFa2Q6yrwMXHClJSFuzVy3T9
 tar6DuA9ei9O4iz6aLLW9zpBE6bVbjUXYg==
X-Google-Smtp-Source: ABdhPJx5R0YyfirwCYXzyIqX0OTYpDHOYWFYKPLprgOPoxcwb+tRg/7d7OgsJ+37gRf3iItOuhMiCw==
X-Received: by 2002:a62:e50c:0:b029:2f9:b9b1:d44f with SMTP id
 n12-20020a62e50c0000b02902f9b9b1d44fmr17619345pff.42.1631990756905; 
 Sat, 18 Sep 2021 11:45:56 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y26sm9555858pfe.69.2021.09.18.11.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 11:45:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 34/41] target/ppc: Implement ppc_cpu_record_sigsegv
Date: Sat, 18 Sep 2021 11:45:20 -0700
Message-Id: <20210918184527.408540-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918184527.408540-1-richard.henderson@linaro.org>
References: <20210918184527.408540-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Record DAR, DSISR, and exception_index.  That last means
that we must exit to cpu_loop ourselves, instead of letting
exception_index being overwritten.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu.h              |  3 ---
 target/ppc/internal.h         |  9 +++++++++
 target/ppc/cpu_init.c         |  6 ++++--
 target/ppc/user_only_helper.c | 15 +++++++++++----
 4 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 01d3773bc7..60d1117845 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1278,9 +1278,6 @@ extern const VMStateDescription vmstate_ppc_cpu;
 
 /*****************************************************************************/
 void ppc_translate_init(void);
-bool ppc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                      MMUAccessType access_type, int mmu_idx,
-                      bool probe, uintptr_t retaddr);
 
 #if !defined(CONFIG_USER_ONLY)
 void ppc_store_sdr1(CPUPPCState *env, target_ulong value);
diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index b71406fa46..f3e5aa8fbc 100644
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
index 5c134adeea..d56fde1215 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -9028,10 +9028,12 @@ static const struct SysemuCPUOps ppc_sysemu_ops = {
 
 static const struct TCGCPUOps ppc_tcg_ops = {
   .initialize = ppc_translate_init,
-  .tlb_fill = ppc_cpu_tlb_fill,
 
-#ifndef CONFIG_USER_ONLY
+#ifdef CONFIG_USER_ONLY
+  .record_sigsegv = ppc_cpu_record_sigsegv,
+#else
   .has_work = ppc_cpu_has_work,
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


