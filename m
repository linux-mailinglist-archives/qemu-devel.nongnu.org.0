Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BB04CC74E
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 21:48:57 +0100 (CET)
Received: from localhost ([::1]:57906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPsNc-0004S5-Ff
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 15:48:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsLc-0001fB-88
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:46:52 -0500
Received: from [2607:f8b0:4864:20::102e] (port=51144
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsLY-000110-0P
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:46:51 -0500
Received: by mail-pj1-x102e.google.com with SMTP id m22so5721209pja.0
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 12:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NZsEcN4dnDK5OBQ0/25VfSwi8UBjAELqG0R7yGR1FOg=;
 b=Py/0eh9/ooy6fZPq9q4eK2TvXcAwsK+CbuIZIfxM/PZ1mboleBzMTFAp5cmZP/s2O9
 RQvmf1mmXrLKNAuQ7QvxPfhZ9SkRRS/KZxfMuijDV7Wzm0og/QBN2//a7I5qWJZH9Nwc
 kQiS0rUhv1f2847vFmonfamq3dqfATCAQBKmNBOjXDfPnrk+Q8gnIrjiKRpUOl9FEEIZ
 gWvY+6snxpYuCVzNYfo44NkzB5DRp+QT2ep4rLvVvCC6qA7rvQI1ygNXJWM8LSE1n8Je
 BoNQwAB23bA1aY5ZX/OO/k057984getXKKm3J7O72gKBIADbEKlcgTOZSfVKgoTZ9KvG
 Ct3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NZsEcN4dnDK5OBQ0/25VfSwi8UBjAELqG0R7yGR1FOg=;
 b=7aAXMMLKZPSOFKG8gZJkaLTy2mGI7xEpF7NoLHO9/TISiB8Hy57go4zGQUa62BpNSw
 XbGhdsCOj0WdE+tq20g9i/FHIwZCqXW8VFJUaBbThkaoNdylbiYvBL/BeYCvuKE6zw0l
 bO0AzFiiR0UVIxUS24smEDJyYeIKVsHT12sj6a29hVm+anE8Q2P3eMuCY0U4kcPzKVcd
 Uj8K1WznfaILV2FvWgbUHWWJkoblXjnKQGuWgya5Uoqq7T48YhNOFUD3s/rVbGmgNtTi
 Bl4XPekJdXN7IyEgAmkjH6+93ew2dXoCJZXJXJFqN0TRg/mMxQxp2ta8QOkTs0fGyVdz
 9hOQ==
X-Gm-Message-State: AOAM531dK87vDytcSDphxuG3YhTbz0c2Uc2rDiymF/mgif1NweSYYFLu
 Cm0ifMSXoylxgRm2giaWd6aOkf/R7ESWZg==
X-Google-Smtp-Source: ABdhPJzW0nsIm6AFf21emHUq/9uq0Ca8dmPIH7re4Rfs4DA6mlyG/pE7mCzxa3sjSEZfxMgvzq7v4g==
X-Received: by 2002:a17:90a:2e0e:b0:1bc:dbe:2d04 with SMTP id
 q14-20020a17090a2e0e00b001bc0dbe2d04mr7269109pjd.74.1646340397563; 
 Thu, 03 Mar 2022 12:46:37 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 d16-20020a17090ad99000b001bcbc4247a0sm2901211pjv.57.2022.03.03.12.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 12:46:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 7/7] target/nios2: Rewrite interrupt handling
Date: Thu,  3 Mar 2022 10:46:24 -1000
Message-Id: <20220303204624.468786-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303204624.468786-1-richard.henderson@linaro.org>
References: <20220303204624.468786-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Previously, we would avoid setting CPU_INTERRUPT_HARD when interrupts
are disabled at a particular point in time, instead queuing the value
into cpu->irq_pending.  This is more complicated than required.

Instead, set CPU_INTERRUPT_HARD any time there is a pending interrupt,
and exclusively check for interrupts disabled in nios2_cpu_exec_interrupt.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h       |  1 -
 target/nios2/helper.h    |  1 -
 target/nios2/cpu.c       | 10 ++++------
 target/nios2/op_helper.c | 19 -------------------
 target/nios2/translate.c | 14 +++++---------
 5 files changed, 9 insertions(+), 36 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index d2ba0c5bbd..a00e4229ce 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -160,7 +160,6 @@ struct CPUNios2State {
 
 #if !defined(CONFIG_USER_ONLY)
     Nios2MMU mmu;
-    uint32_t irq_pending;
 #endif
     int error_code;
 };
diff --git a/target/nios2/helper.h b/target/nios2/helper.h
index 21ef7f0791..a44ecfdf7a 100644
--- a/target/nios2/helper.h
+++ b/target/nios2/helper.h
@@ -24,5 +24,4 @@ DEF_HELPER_FLAGS_2(raise_exception, TCG_CALL_NO_WG, noreturn, env, i32)
 DEF_HELPER_2(mmu_write_tlbacc, void, env, i32)
 DEF_HELPER_2(mmu_write_tlbmisc, void, env, i32)
 DEF_HELPER_2(mmu_write_pteaddr, void, env, i32)
-DEF_HELPER_1(check_interrupts, void, env)
 #endif
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 4cade61e93..6975ae4bdb 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -73,12 +73,9 @@ static void nios2_cpu_set_irq(void *opaque, int irq, int level)
 
     env->regs[CR_IPENDING] = deposit32(env->regs[CR_IPENDING], irq, 1, !!level);
 
-    env->irq_pending = env->regs[CR_IPENDING] & env->regs[CR_IENABLE];
-
-    if (env->irq_pending && (env->regs[CR_STATUS] & CR_STATUS_PIE)) {
-        env->irq_pending = 0;
+    if (env->regs[CR_IPENDING]) {
         cpu_interrupt(cs, CPU_INTERRUPT_HARD);
-    } else if (!env->irq_pending) {
+    } else {
         cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
     }
 }
@@ -134,7 +131,8 @@ static bool nios2_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     CPUNios2State *env = &cpu->env;
 
     if ((interrupt_request & CPU_INTERRUPT_HARD) &&
-        (env->regs[CR_STATUS] & CR_STATUS_PIE)) {
+        (env->regs[CR_STATUS] & CR_STATUS_PIE) &&
+        (env->regs[CR_IPENDING] & env->regs[CR_IENABLE])) {
         cs->exception_index = EXCP_IRQ;
         nios2_cpu_do_interrupt(cs);
         return true;
diff --git a/target/nios2/op_helper.c b/target/nios2/op_helper.c
index d729379e4d..caa885f7b4 100644
--- a/target/nios2/op_helper.c
+++ b/target/nios2/op_helper.c
@@ -21,28 +21,9 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/helper-proto.h"
-#include "exec/cpu_ldst.h"
 #include "exec/exec-all.h"
 #include "qemu/main-loop.h"
 
-#if !defined(CONFIG_USER_ONLY)
-static void nios2_check_interrupts(CPUNios2State *env)
-{
-    if (env->irq_pending &&
-        (env->regs[CR_STATUS] & CR_STATUS_PIE)) {
-        env->irq_pending = 0;
-        cpu_interrupt(env_cpu(env), CPU_INTERRUPT_HARD);
-    }
-}
-
-void helper_check_interrupts(CPUNios2State *env)
-{
-    qemu_mutex_lock_iothread();
-    nios2_check_interrupts(env);
-    qemu_mutex_unlock_iothread();
-}
-#endif /* !CONFIG_USER_ONLY */
-
 void helper_raise_exception(CPUNios2State *env, uint32_t index)
 {
     CPUState *cs = env_cpu(env);
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index a5f8d20729..f89271dbed 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -491,19 +491,15 @@ static void wrctl(DisasContext *dc, uint32_t code, uint32_t flags)
     case CR_IPENDING:
         /* ipending is read only, writes ignored. */
         break;
+    case CR_STATUS:
+    case CR_IENABLE:
+        /* If interrupts were enabled using WRCTL, trigger them. */
+        dc->base.is_jmp = DISAS_UPDATE;
+        /* fall through */
     default:
         tcg_gen_mov_tl(cpu_R[instr.imm5 + CR_BASE], v);
         break;
     }
-
-    /* If interrupts were enabled using WRCTL, trigger them. */
-    if ((instr.imm5 + CR_BASE) == CR_STATUS) {
-        if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
-            gen_io_start();
-        }
-        gen_helper_check_interrupts(cpu_env);
-        dc->base.is_jmp = DISAS_UPDATE;
-    }
 #endif
 }
 
-- 
2.25.1


