Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B0951078B
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 20:50:50 +0200 (CEST)
Received: from localhost ([::1]:58818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQGv-0002FO-8d
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 14:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmn-0002mA-Vo
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:42 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:40814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmm-0004SV-7u
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:41 -0400
Received: by mail-pl1-x635.google.com with SMTP id k4so19422634plk.7
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A1+hFfX+YJ+rRNsAMYCjA2Q5J7nLgy08oqJtBrD3bio=;
 b=N9tVD146lC91OR9AB1YEauJTpihgsmfbQ9sU3QwN0ZL5HR/wxRK3h56FjtmTVMiU4Z
 LD+fnTl3kvX/8r8W8LP2p5QUznySyHq1t305HdvdoGkBBQScIbKzlO2Istl07z8r8yub
 T5famVUUr/wWT5eCLFLoEKFyBaI5kUIzS85iz81Q8q+tfcXTR2gRpgE0nArf0dobYQm5
 F+WB6oz7pdYQFHIXOXY+yz6cKE79fU4VyjywrxBz7EInDGFe94ESjieY/v8hrMJTm50Z
 C4SfCRKmb4K/FwBlFYWDUhigTxdEg3/X6OWeFLrAyaGoOpUGndS9/2wPeUMnOu9HN6Vd
 5Xyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A1+hFfX+YJ+rRNsAMYCjA2Q5J7nLgy08oqJtBrD3bio=;
 b=pJjcLxAjFj6CIsoVRNfhveG5o6xIppnzRMaJoFHDJTdv4Nn7Nn01OqJeB21HEcGC1K
 MDpjQa9eCnrwqnc5QCR1O/Tbh5NnFT481nw5vRFgfE2zYYiB57WElUYNSUM1H4UIqN5p
 7itxTJSnp3m7ya/DbYE8DkQLtoXxlT/WNzcu+CKW821c1iurDJ5YyQ698xC4jCGgT989
 AW6C8ZW0gVFll5HxxX8FM7hfZ8vjuCrICYd5xJC8QlPDVn0NaI7GxGjKFpuzwCTEdqb5
 kLlBjV+A9UUgbq9PMaHrJ2Am7OzxR2KnOQfGRj0qY+HcBcP4M4XL3iGAW+FHj1/Hgcf0
 Umzg==
X-Gm-Message-State: AOAM533YF7cMOYSwR9S2wXOvSzzdcTGMyHzudyYUBfCrFCP9n0djFfLQ
 4PNP3wdwKl4DWceTzOyvZo2ts6rXHEKYAA==
X-Google-Smtp-Source: ABdhPJznpUFVx1rgGFnM3X9ksargTx2a+s+YpG2ORZUSdo5/gE+eNhXyW/uIWdYeYtu/YkXlqt2xUg==
X-Received: by 2002:a17:902:e808:b0:15c:ed0d:f11c with SMTP id
 u8-20020a170902e80800b0015ced0df11cmr17368991plg.1.1650997178888; 
 Tue, 26 Apr 2022 11:19:38 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a056a00130700b004b9f7cd94a4sm16482827pfu.56.2022.04.26.11.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:19:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 33/68] target/nios2: Hoist CPU_LOG_INT logging
Date: Tue, 26 Apr 2022 11:18:32 -0700
Message-Id: <20220426181907.103691-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Performing this early means that we can merge more cases
within the non-logging switch statement.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-34-richard.henderson@linaro.org>
---
 target/nios2/helper.c | 58 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 47 insertions(+), 11 deletions(-)

diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index 63971a8b3c..c57ffd64e0 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -70,20 +70,64 @@ void nios2_cpu_do_interrupt(CPUState *cs)
     Nios2CPU *cpu = NIOS2_CPU(cs);
     CPUNios2State *env = &cpu->env;
 
+    if (qemu_loglevel_mask(CPU_LOG_INT)) {
+        const char *name = NULL;
+
+        switch (cs->exception_index) {
+        case EXCP_IRQ:
+            name = "interrupt";
+            break;
+        case EXCP_TLBD:
+            if (env->ctrl[CR_STATUS] & CR_STATUS_EH) {
+                name = "TLB MISS (double)";
+            } else {
+                name = "TLB MISS (fast)";
+            }
+            break;
+        case EXCP_TLBR:
+        case EXCP_TLBW:
+        case EXCP_TLBX:
+            name = "TLB PERM";
+            break;
+        case EXCP_SUPERA:
+        case EXCP_SUPERD:
+            name = "SUPERVISOR (address)";
+            break;
+        case EXCP_SUPERI:
+            name = "SUPERVISOR (insn)";
+            break;
+        case EXCP_ILLEGAL:
+            name = "ILLEGAL insn";
+            break;
+        case EXCP_TRAP:
+            name = "TRAP insn";
+            break;
+        case EXCP_BREAK:
+            name = "BREAK insn";
+            break;
+        case EXCP_SEMIHOST:
+            name = "SEMIHOST insn";
+            break;
+        }
+        if (name) {
+            qemu_log("%s at pc=0x%08x\n", name, env->pc);
+        } else {
+            qemu_log("Unknown exception %d at pc=0x%08x\n",
+                     cs->exception_index, env->pc);
+        }
+    }
+
     switch (cs->exception_index) {
     case EXCP_IRQ:
-        qemu_log_mask(CPU_LOG_INT, "interrupt at pc=%x\n", env->pc);
         do_iic_irq(cpu);
         break;
 
     case EXCP_TLBD:
         if ((env->ctrl[CR_STATUS] & CR_STATUS_EH) == 0) {
-            qemu_log_mask(CPU_LOG_INT, "TLB MISS (fast) at pc=%x\n", env->pc);
             env->ctrl[CR_TLBMISC] &= ~CR_TLBMISC_DBL;
             env->ctrl[CR_TLBMISC] |= CR_TLBMISC_WE;
             do_exception(cpu, cpu->fast_tlb_miss_addr, false);
         } else {
-            qemu_log_mask(CPU_LOG_INT, "TLB MISS (double) at pc=%x\n", env->pc);
             env->ctrl[CR_TLBMISC] |= CR_TLBMISC_DBL;
             do_exception(cpu, cpu->exception_addr, false);
         }
@@ -92,7 +136,6 @@ void nios2_cpu_do_interrupt(CPUState *cs)
     case EXCP_TLBR:
     case EXCP_TLBW:
     case EXCP_TLBX:
-        qemu_log_mask(CPU_LOG_INT, "TLB PERM at pc=%x\n", env->pc);
         if ((env->ctrl[CR_STATUS] & CR_STATUS_EH) == 0) {
             env->ctrl[CR_TLBMISC] |= CR_TLBMISC_WE;
         }
@@ -102,23 +145,16 @@ void nios2_cpu_do_interrupt(CPUState *cs)
     case EXCP_SUPERA:
     case EXCP_SUPERI:
     case EXCP_SUPERD:
-        qemu_log_mask(CPU_LOG_INT, "SUPERVISOR exception at pc=%x\n", env->pc);
-        do_exception(cpu, cpu->exception_addr, false);
-        break;
-
     case EXCP_ILLEGAL:
     case EXCP_TRAP:
-        qemu_log_mask(CPU_LOG_INT, "TRAP exception at pc=%x\n", env->pc);
         do_exception(cpu, cpu->exception_addr, false);
         break;
 
     case EXCP_BREAK:
-        qemu_log_mask(CPU_LOG_INT, "BREAK exception at pc=%x\n", env->pc);
         do_exception(cpu, cpu->exception_addr, true);
         break;
 
     case EXCP_SEMIHOST:
-        qemu_log_mask(CPU_LOG_INT, "BREAK semihosting at pc=%x\n", env->pc);
         env->pc += 4;
         do_nios2_semihosting(env);
         break;
-- 
2.34.1


