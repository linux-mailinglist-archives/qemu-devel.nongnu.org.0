Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D324244D0
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 19:41:16 +0200 (CEST)
Received: from localhost ([::1]:49176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYAup-00081J-Vk
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 13:41:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAde-0007F8-Ho
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:30 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:44933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdb-00088K-Po
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:29 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 oa12-20020a17090b1bcc00b0019f715462a8so2896489pjb.3
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 10:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9+X2LKa5dfRs3QXGafYGnRy0Nujo7pyvdpcMGoKpk3Q=;
 b=S1F5zxa7rJKLWTP7RCvCGnmLmgI+BFy6X+5IHgihZ4DsQQyb+zWwtS/GyDveIFuE68
 eRN+KE7HChqZKlPOM9Vql3DeELq34VseSVnl9gyml5t3RiO9W7ev33QkNVChG1OrHGt1
 vThKrNgsCGWrLu/dEwPrOgYCugpi+ZVEKK4pQSBk/4HNEvb5AssEAg1rpj9XjllPHM2h
 EomtR2OQAUkf5uSZAwC1uQfiOHA5nLdKKfBbHG5K16E6BTBcNvZZnpFd8wa++aukPW/i
 r91lSYksxlc1rDUg3ZorprjI6s9DxYqRKfQJqrciFFAAts1F52h1LyAFXKatxSxhpgjJ
 s87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9+X2LKa5dfRs3QXGafYGnRy0Nujo7pyvdpcMGoKpk3Q=;
 b=VGJdPWtbU0QO4+O5nAXkeRl/Ym5AQyEUgSgDu4U2X5OpCHAT8EIBWQjWJ6GiR1hxUQ
 ImCOY9WEptB2vlBdNxCzHQiVKW9U3qL9xcqT1c3oPV6VTQ8U64c1l5NgVvttNtZP6Ulk
 4jIKCVa8hPje4JWQ5f2TNlQ65SGn+D4tEVAR5DEcGPTDClXy09LooP+UJziifIQKM5li
 3djMiQvxpiyQtmJDJY1vFrens3/qil4klkth1Djzb/mC3dW2WOdXId1iANIRFdeeEkGz
 iqbhjXpd/v/yfhRu4LdAiJ6yuvhplaqKrO29Pn504V26PyRSrtdg9Dq3oBLfTa7nMVxd
 dnPQ==
X-Gm-Message-State: AOAM533fBI0bDhzc22V4udeD0HjnMi8nEpwZDZK34iIqrXKMlxT65qvY
 ToaWx+5/G9jQTzNtqOISAgIkV67WSjI1XA==
X-Google-Smtp-Source: ABdhPJyAD1jLuSLiTU3Dy0KsaO2v92LhjRGUffD0EfG0nCwZbkaqZLc+6ecXjpRDEcGhH6/+F8uEZw==
X-Received: by 2002:a17:902:6e02:b0:13a:41f5:1666 with SMTP id
 u2-20020a1709026e0200b0013a41f51666mr12198701plk.39.1633541005907; 
 Wed, 06 Oct 2021 10:23:25 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id w7sm21606929pfj.189.2021.10.06.10.23.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 10:23:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 21/41] target/alpha: Implement alpha_cpu_record_sigsegv
Date: Wed,  6 Oct 2021 10:22:47 -0700
Message-Id: <20211006172307.780893-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006172307.780893-1-richard.henderson@linaro.org>
References: <20211006172307.780893-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Record trap_arg{0,1,2} for the linux-user signal frame.

Fill in the stores to trap_arg{1,2} that were missing
from the previous user-only alpha_cpu_tlb_fill function.
Use maperr to simplify computation of trap_arg1.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/cpu.h    | 13 +++++++++----
 target/alpha/cpu.c    |  6 ++++--
 target/alpha/helper.c | 39 ++++++++++++++++++++++++++++++++++-----
 3 files changed, 47 insertions(+), 11 deletions(-)

diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index 772828cc26..d49cc36d07 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -439,9 +439,6 @@ void alpha_translate_init(void);
 #define CPU_RESOLVING_TYPE TYPE_ALPHA_CPU
 
 void alpha_cpu_list(void);
-bool alpha_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                        MMUAccessType access_type, int mmu_idx,
-                        bool probe, uintptr_t retaddr);
 void QEMU_NORETURN dynamic_excp(CPUAlphaState *, uintptr_t, int, int);
 void QEMU_NORETURN arith_excp(CPUAlphaState *, uintptr_t, int, uint64_t);
 
@@ -449,7 +446,15 @@ uint64_t cpu_alpha_load_fpcr (CPUAlphaState *env);
 void cpu_alpha_store_fpcr (CPUAlphaState *env, uint64_t val);
 uint64_t cpu_alpha_load_gr(CPUAlphaState *env, unsigned reg);
 void cpu_alpha_store_gr(CPUAlphaState *env, unsigned reg, uint64_t val);
-#ifndef CONFIG_USER_ONLY
+
+#ifdef CONFIG_USER_ONLY
+void alpha_cpu_record_sigsegv(CPUState *cs, vaddr address,
+                              MMUAccessType access_type,
+                              bool maperr, uintptr_t retaddr);
+#else
+bool alpha_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                        MMUAccessType access_type, int mmu_idx,
+                        bool probe, uintptr_t retaddr);
 void alpha_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                      vaddr addr, unsigned size,
                                      MMUAccessType access_type,
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 93e16a2ffb..69f32c3078 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -218,9 +218,11 @@ static const struct SysemuCPUOps alpha_sysemu_ops = {
 
 static const struct TCGCPUOps alpha_tcg_ops = {
     .initialize = alpha_translate_init,
-    .tlb_fill = alpha_cpu_tlb_fill,
 
-#ifndef CONFIG_USER_ONLY
+#ifdef CONFIG_USER_ONLY
+    .record_sigsegv = alpha_cpu_record_sigsegv,
+#else
+    .tlb_fill = alpha_cpu_tlb_fill,
     .cpu_exec_interrupt = alpha_cpu_exec_interrupt,
     .do_interrupt = alpha_cpu_do_interrupt,
     .do_transaction_failed = alpha_cpu_do_transaction_failed,
diff --git a/target/alpha/helper.c b/target/alpha/helper.c
index 81550d9e2f..b7e7f73b15 100644
--- a/target/alpha/helper.c
+++ b/target/alpha/helper.c
@@ -120,15 +120,44 @@ void cpu_alpha_store_gr(CPUAlphaState *env, unsigned reg, uint64_t val)
 }
 
 #if defined(CONFIG_USER_ONLY)
-bool alpha_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                        MMUAccessType access_type, int mmu_idx,
-                        bool probe, uintptr_t retaddr)
+void alpha_cpu_record_sigsegv(CPUState *cs, vaddr address,
+                              MMUAccessType access_type,
+                              bool maperr, uintptr_t retaddr)
 {
     AlphaCPU *cpu = ALPHA_CPU(cs);
+    target_ulong mmcsr, cause;
 
-    cs->exception_index = EXCP_MMFAULT;
+    /* Assuming !maperr, infer the missing protection. */
+    switch (access_type) {
+    case MMU_DATA_LOAD:
+        mmcsr = MM_K_FOR;
+        cause = 0;
+        break;
+    case MMU_DATA_STORE:
+        mmcsr = MM_K_FOW;
+        cause = 1;
+        break;
+    case MMU_INST_FETCH:
+        mmcsr = MM_K_FOE;
+        cause = -1;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    if (maperr) {
+        if (address < BIT_ULL(TARGET_VIRT_ADDR_SPACE_BITS - 1)) {
+            /* Userspace address, therefore page not mapped. */
+            mmcsr = MM_K_TNV;
+        } else {
+            /* Kernel or invalid address. */
+            mmcsr = MM_K_ACV;
+        }
+    }
+
+    /* Record the arguments that PALcode would give to the kernel. */
     cpu->env.trap_arg0 = address;
-    cpu_loop_exit_restore(cs, retaddr);
+    cpu->env.trap_arg1 = mmcsr;
+    cpu->env.trap_arg2 = cause;
 }
 #else
 /* Returns the OSF/1 entMM failure indication, or -1 on success.  */
-- 
2.25.1


