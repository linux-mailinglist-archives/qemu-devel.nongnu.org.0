Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C764C5E0E
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 19:25:40 +0100 (CET)
Received: from localhost ([::1]:34922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOOEl-00028s-B0
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 13:25:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOOAw-0002tp-B1
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 13:21:42 -0500
Received: from [2607:f8b0:4864:20::1030] (port=41596
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOOAu-0007pT-P1
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 13:21:42 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 ev16-20020a17090aead000b001bc3835fea8so9436947pjb.0
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 10:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1zSh8vavOK2dDRCHMdm2xP+DD5rjftdrYBF4cR1vNmw=;
 b=h/gDasq1Hy8kheLbjEQ4bSzKMb2frFHTbUNXStTJdhhonyD+YCFxVE601hUktz+WYm
 VVtgSq7myBFI0LaLI2g2T+jSBTSotFrES5W4BsmXKMpo9Fqns3RO2TFqoEKTdV09hn/a
 xOhr7j2YDZHB0ysY6HmrYQak0KnykwUan22KKpSjwHAEnDBFfWDY4g1nl9V1DMM/SJqf
 Soli+zKAtOA+lEAEk2Z4i9QF+LMZLWEJOyyfJYDaAEF7FEfPnou0PdM7PhJt1qEzr+TC
 3PM4atTCk5BER5N2eIl7Ix6cb11VeQM51A95pFbInTN+dNC0oLXwmYYG5NKa3q6JYgw7
 tJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1zSh8vavOK2dDRCHMdm2xP+DD5rjftdrYBF4cR1vNmw=;
 b=6bBYcxqR2rnjqwMGUvCBw5qXH6kGYGCHSV/q4SUmPLi8lAHPMADnJwqfMWOOljZZ7U
 0qczKhkPft7c3ds3GF7r+n/iRvOnCgRi7E0InW+z0I9RJirBuKHk+R/kBu1jST3G7ZSF
 PbUEYUYFWoNiQiAlmwelh18HefdEwr/3yFjbOuhxr33pzPopFJ/mnjfULv6ISgpp3/9q
 YxNakzSpnteQSZuILPnOQtwMzWttTd4D/oixHQTKTqi9A9ftU+zqPuFb6BzHstGV5WFX
 744SwNlAl3SXfWXkkpuUjX17h7RCPwKL4tN5vVJEawKVWBjoKc7n41Q7G9x0Aw3eIxWA
 fIHA==
X-Gm-Message-State: AOAM530MPxNhqnN6IP76+U6q42y68q/H9Ih5H04mkV0GULd5OEBr9Ca+
 72dG1Y+/v/Z5gXqtDO9USQUoY2zbHcDmQg==
X-Google-Smtp-Source: ABdhPJxCNsyJQrCi73wilJh4l0d8WXF4QU7Hxjh/hZJbnloKGiuTRH3Y0NgOVJlaa0h0KW+P66IRZQ==
X-Received: by 2002:a17:90a:8d82:b0:1bc:6b54:e798 with SMTP id
 d2-20020a17090a8d8200b001bc6b54e798mr13092201pjo.77.1645986099405; 
 Sun, 27 Feb 2022 10:21:39 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-23be-43d9-7006-705a.res6.spectrum.com.
 [2603:800c:1201:c600:23be:43d9:7006:705a])
 by smtp.gmail.com with ESMTPSA id
 t41-20020a056a0013a900b004e167af0c0dsm10776252pfg.89.2022.02.27.10.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 10:21:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/7] target/nios2: Rewrite interrupt handling
Date: Sun, 27 Feb 2022 08:21:25 -1000
Message-Id: <20220227182125.21809-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220227182125.21809-1-richard.henderson@linaro.org>
References: <20220227182125.21809-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Drop irq_pending boolean.
Drop helper_check_interrupts.
Move checks for irq disabled into nios2_cpu_exec_interrupt.
End the TB on writes to ienable, just like to status.

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
index b17ce25a36..ce3aacf59d 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -489,19 +489,15 @@ static void wrctl(DisasContext *dc, uint32_t code, uint32_t flags)
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


