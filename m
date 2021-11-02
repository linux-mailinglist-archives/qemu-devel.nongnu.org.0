Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C646442C52
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:15:46 +0100 (CET)
Received: from localhost ([::1]:34626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhrlZ-0007Fx-PC
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:15:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrdq-0003cT-EQ
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:07:46 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:37851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrdn-0000r4-JD
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:07:46 -0400
Received: by mail-qt1-x830.google.com with SMTP id o12so7699372qtv.4
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xXlHj7GOOQFwxbMfswRsUIWuGeJ1kP2ehgRt9eaYqEQ=;
 b=Zwak4UEpGoYhHgJS7JDogOfAPDX/1uZJPB2zXNpLBV0sOZlwZxntcLrZylOK5Dqtcn
 fTxuoKDq1bEQTPc5O9aLAW4Dax6io5DwGHFLA28dGnWEvn90CueEtrQXBJtEm6cuIzgK
 AN6akTQCE/QsDHkPx2cAhk+0sMf/Vg2+yavPSwSAFOE2nbGSxTEpDCntZKzcgzQ/z/vQ
 OcvR3egHagFDrIa7WHwJx2TY2ZBJzHOo/qeVXyGRPM3Aunuee6yJEBeRbpT58TxhinFN
 5bC9nb/My+8fd6qG0w8XGCdXNgcSwsSF5rXGFRvrGbsZW45fcOxj9kfj7A5uef/ygav2
 yHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xXlHj7GOOQFwxbMfswRsUIWuGeJ1kP2ehgRt9eaYqEQ=;
 b=rY4RDsLaoJ7rBKlKIMZSVn+vI6fSVjMj+aiG8q1sXXF1qO1sSBZkpjbC1mh9lkp2GE
 wxlp9T+T2s4k2D5GbSsLNkFRZ1wWtzQXglFHf9/Sp7PStkGtgHKvahN6A2VCJeC5fEtd
 HSl+eDg6GnUII/pg3Z9BqO6ENk+C9owQdyYSplOgCwusXwpoXlmHUXhGwvC5NglxWNVa
 eT4n3l46LmPrUezGilyVT12t2rCcBIsKKOQl2lwKGKuLZAnN2IHjJBg1MYILbvUHCIlG
 TqRdMOagbGb/QKPIkUdB0r/gYw6dLVwN2pybfVXITT+aKLedplGrIUg2MZ2+u6wwtVM+
 gtJA==
X-Gm-Message-State: AOAM5303WnUGnb1chaS4Ws4mAQJO8iZGDplogaB45ws1B+ac9R1dbIef
 xN35vkMEg99K1cCoun09fEXuzr4bKpMtEA==
X-Google-Smtp-Source: ABdhPJy9TXmX3l55LtDILzutQK4YZWZsFeCq0HW3gr5KsMUJDHf7DLuVVUgzFY999JT5gp2HwDScSg==
X-Received: by 2002:ac8:5f51:: with SMTP id y17mr325652qta.154.1635851262482; 
 Tue, 02 Nov 2021 04:07:42 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm7sm3568612qkb.86.2021.11.02.04.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:07:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/60] accel/tcg: Move clear_helper_retaddr to cpu loop
Date: Tue,  2 Nov 2021 07:06:42 -0400
Message-Id: <20211102110740.215699-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x830.google.com
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


