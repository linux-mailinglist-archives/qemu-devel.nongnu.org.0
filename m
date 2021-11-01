Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74644441F6B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 18:37:30 +0100 (CET)
Received: from localhost ([::1]:37114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhbFR-0001c9-KM
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 13:37:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb5r-0003KQ-QU
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:27:35 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:43627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb5p-0000a5-0C
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:27:35 -0400
Received: by mail-qt1-x835.google.com with SMTP id v29so15196693qtc.10
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xXlHj7GOOQFwxbMfswRsUIWuGeJ1kP2ehgRt9eaYqEQ=;
 b=VExdrT1z0TiLae9uxGL3Fq56Y7jjMe2eGA304jyvdBg9zFgDIN+BwcYaSS2viIbomS
 uxTXdmOphPzZaEgZT2RSF2XFseJNSBNw7Zhoibjvh/u1LuJV1SN2jk8VnBj0h4M8Sfdt
 18gaNF+5FhQlHhr39I2WXOw5fyrUtEE9WOTstYS+Aei5VDKeFldJ9FBIbrPatGx4pJB1
 vF4+eCyP4xoRpePNde3ilR0w4XfZcSxDiVTSXw3G2H/H6ix3MMWjRPk35eN0rxCXAW5n
 6/dL5hLjI/1RoOevoZwVk5ITVlOHxTlfiy03XgNkUK77TpQqJ6XuBcsQ+ApHdrnMK/Lu
 co7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xXlHj7GOOQFwxbMfswRsUIWuGeJ1kP2ehgRt9eaYqEQ=;
 b=sQJWfx9fyYFoEqxqudRRpuVbNU0r7OkUO2dv4eXwYNYNblx3ECCXPuPcLb5JTkxty/
 m/bKznSmnViHQyfIelAnOWrVvOGyUaXOCvwCMLPJmhe9GwD4taBqxNJoW+pvLkSse8QX
 PYXb4CcUbb6MQbIkJt5AzXb/p8+Bq+k/UELxMPXwlwDUyGv5Hte2NPG3Bp7x2ySSx8wg
 Z88iH0dlHDBX5JU+9KYSQOuypx/AuW8sJD0OZx+3c84M4dD6sDlwsLRoeX5u4UIM5G49
 ElIb/4y3YzLsnNPDcsRLRBpWnqmYs2WhaLuWvNfs984yNzHa2urskuj+4dlwQO6SuquR
 /qQw==
X-Gm-Message-State: AOAM530k9xZW3ude59pd+DrO+DrgUbt9P6U8pkj3mZ2hhPVWAVpAG7cy
 Jf51DwXjmnF2cLmWuT7Ht7ZfTKIQN2OFVg==
X-Google-Smtp-Source: ABdhPJxd88MZsWriGsgYt23fSGFbDE9B1OgdyneQqYy3JTfUiu1rJcURvVdadPMKls+KUxvp2YbzmA==
X-Received: by 2002:a05:622a:1111:: with SMTP id
 e17mr31898253qty.217.1635787652035; 
 Mon, 01 Nov 2021 10:27:32 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id t5sm6075331qkf.34.2021.11.01.10.27.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:27:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 02/60] accel/tcg: Move clear_helper_retaddr to cpu loop
Date: Mon,  1 Nov 2021 13:26:31 -0400
Message-Id: <20211101172729.23149-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x835.google.com
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
Cc: Warner Losh <imp@bsdimp.com>
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
index c9764c1325..bba4672632 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -462,6 +462,7 @@ void cpu_exec_step_atomic(CPUState *cpu)
          * memory.
          */
 #ifndef CONFIG_SOFTMMU
+        clear_helper_retaddr();
         tcg_debug_assert(!have_mmap_lock());
 #endif
         if (qemu_mutex_iothread_locked()) {
@@ -471,7 +472,6 @@ void cpu_exec_step_atomic(CPUState *cpu)
         qemu_plugin_disable_mem_helpers(cpu);
     }
 
-
     /*
      * As we start the exclusive region before codegen we must still
      * be in the region if we longjump out of either the codegen or
@@ -916,6 +916,7 @@ int cpu_exec(CPUState *cpu)
 #endif
 
 #ifndef CONFIG_SOFTMMU
+        clear_helper_retaddr();
         tcg_debug_assert(!have_mmap_lock());
 #endif
         if (qemu_mutex_iothread_locked()) {
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index c02d509ec6..3f3e793b7b 100644
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


