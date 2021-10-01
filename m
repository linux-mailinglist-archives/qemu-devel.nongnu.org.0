Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D112541F2EA
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 19:18:32 +0200 (CEST)
Received: from localhost ([::1]:33128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWMB5-0004jQ-Sp
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 13:18:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM4j-0004YE-Lc
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:11:57 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:35653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM4i-0004ua-0t
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:11:57 -0400
Received: by mail-qt1-x834.google.com with SMTP id c20so9632902qtb.2
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 10:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=icrti6lDQPvhEiIgagWnJKzt2C7OPefDuKffLMhjklY=;
 b=CQDbL3aJacG3T3nXBRaG1TerIp6vyzVIsNa9bhxIPFtdMO1PeLU40zhTJb+mSlRXbs
 uqY33GSATT64PSG6ZGKvtUxCuyQVuYA54AQuypJFkyC8qlkN75BlKmHhyp8F/QBAZ6iL
 VmeHPeC+PLlxxW6O6uEaJ2X6cvYfUcsb6Q9n65xHnT27MkZvf8ODlOIRF5R6ZQMma7lh
 q3e1fvTJ0r676LaQmt/++X4J7rGfMXWmvRISLWsKikoczWSwFTbvlGv2lAmPXxO7vMkJ
 En7OWUfSTwrEHtvshpk+1GZWeZHZgaJAGJWduiCTLbgP4kcTy6ykYyFPGYnbsliIjNIy
 yCJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=icrti6lDQPvhEiIgagWnJKzt2C7OPefDuKffLMhjklY=;
 b=Q9yzEYjT8U2xI9It8LljGt5QJiIDp2B6E1YmwRnpRPleIfcODFoPweXmmP/JdX5nSH
 nPjiKUyDWbwvyNQKhqG/7wa9EWZ559pWnDNCycXEEUpqSttuevpTg/zEzY9DzK5lryFC
 psJfkZt/AFCeCDj4FekZHBdN+JqZkW+waqPYd5Qe3xAY2nRG2BBt0twadH71XNArzlya
 kKiZIm9i3xaREKFEST6jOIaKAtwJ1+RMCrjcU7zA4BGjeQxduyknf3Cv7aG5zptasBzk
 mMx2gWhSNXKVQMMAMmPdDuxR/Q3EIxrqtm3qiTGfVJmT7mSoNo4wpl3SHqC2EGi9y5jW
 sMkg==
X-Gm-Message-State: AOAM533JjRlbdivmUtBeaXxOoZqHklrlNxnQggPbRrMF1ZWYOXL4g/ZA
 PMoPNbK2WrshS8SDU8R6fGm2up65dNTKvw==
X-Google-Smtp-Source: ABdhPJzbgPDrDYWWg1xJCnXQ5S3KV7fqUnZe2WwUJRuJYnBJ8c9AQuMS0t8CtYPsde+w3WV1zvkQVg==
X-Received: by 2002:ac8:5752:: with SMTP id 18mr14961646qtx.203.1633108314910; 
 Fri, 01 Oct 2021 10:11:54 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id y15sm3557250qko.78.2021.10.01.10.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:11:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/41] accel/tcg: Move clear_helper_retaddr to cpu loop
Date: Fri,  1 Oct 2021 13:11:12 -0400
Message-Id: <20211001171151.1739472-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001171151.1739472-1-richard.henderson@linaro.org>
References: <20211001171151.1739472-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x834.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently there are only two places that require we reset this
value before exiting to the main loop, but that will change.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c  | 3 ++-
 accel/tcg/user-exec.c | 2 --
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 5fd1ed3422..410588d08a 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -451,6 +451,7 @@ void cpu_exec_step_atomic(CPUState *cpu)
          * memory.
          */
 #ifndef CONFIG_SOFTMMU
+        clear_helper_retaddr();
         tcg_debug_assert(!have_mmap_lock());
 #endif
         if (qemu_mutex_iothread_locked()) {
@@ -460,7 +461,6 @@ void cpu_exec_step_atomic(CPUState *cpu)
         qemu_plugin_disable_mem_helpers(cpu);
     }
 
-
     /*
      * As we start the exclusive region before codegen we must still
      * be in the region if we longjump out of either the codegen or
@@ -905,6 +905,7 @@ int cpu_exec(CPUState *cpu)
 #endif
 
 #ifndef CONFIG_SOFTMMU
+        clear_helper_retaddr();
         tcg_debug_assert(!have_mmap_lock());
 #endif
         if (qemu_mutex_iothread_locked()) {
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index cef025d001..e94f1fed00 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -175,7 +175,6 @@ static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
              * currently executing TB was modified and must be exited
              * immediately.  Clear helper_retaddr for next execution.
              */
-            clear_helper_retaddr();
             cpu_exit_tb_from_sighandler(cpu, old_set);
             /* NORETURN */
 
@@ -193,7 +192,6 @@ static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
      * an exception.  Undo signal and retaddr state prior to longjmp.
      */
     sigprocmask(SIG_SETMASK, old_set, NULL);
-    clear_helper_retaddr();
 
     cc = CPU_GET_CLASS(cpu);
     cc->tcg_ops->tlb_fill(cpu, address, 0, access_type,
-- 
2.25.1


