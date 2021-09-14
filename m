Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0997A40A1D0
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 02:18:37 +0200 (CEST)
Received: from localhost ([::1]:51402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPw9j-0004oG-Sj
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 20:18:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6j-0001oG-04
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:30 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:44010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6d-0007q5-VX
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:28 -0400
Received: by mail-pf1-x436.google.com with SMTP id f65so10433375pfb.10
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 17:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UMGhT+Bk3r2Ql0EVWaSy+w/Od3g4R59cJ3IGkIKsmyE=;
 b=MF2zj3Mf23hIgMDmiWJcNuzjdGQrGE/axuyQdp/7Hmg/gBNNvXOs02CbC6YlNs+pYn
 TknkL8z2VypXjDeAm64UJSvzMIS5rDEbRzleiWJrG/+w4TU93snP7V+bIpoqWpcBasnJ
 aliI3zM1MVNRxJU9H1h4W1G0V2I9caLV9aCPlioGcRJEHZErNNfv8dy3CAT0S0n2rv3i
 21kDeDR3Pd4U8RjswM0Ksz5xX6X6UeG6VWlc0GjWoPODj9CB2BdJ4vos85o7/DJJtXyo
 LwJMJCmranZB/XFswBhgPihLkjYOKWxXqp7Kijw+pXX1yIBpdPnfVARb/AXDlRuMZYZB
 KjvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UMGhT+Bk3r2Ql0EVWaSy+w/Od3g4R59cJ3IGkIKsmyE=;
 b=N0arnccS7+6ZoCFBl85sq1LSc/SHy8QMlip+uk0s9cnkqYi6indzg1hK0LVqFqh3fy
 MmQektdSgRXtZtUyFqna774vv9hqUjIP9jq0507MPZjku2uZjU2kshaY319/lXIOsi8f
 mZT2iMhpcYr7KkTmWDBxGVhONNkWWsSsxaanePMPyV/zbmap1LH4rmmcgC7FV1WLVbLe
 ML05cESX2339sA6F8wDqNQgAnuznyDRcgIK2oyX2V1EWLSbN1roRsRGRjVYDPEY/rJYI
 0itmi/jwIgfJkXmDVgvkfath//9bHNS6NgrAKZehJA/yX6GXlUTIDn1KXx9C4W934Y2P
 EEHQ==
X-Gm-Message-State: AOAM533yQZ5KouFosfTornGsiJKfsxAS/1vt0cF5WfPz5rU9eyCXc2zH
 wBW9RARyLhXb99fDLTtHUeqmE2GstpSMSA==
X-Google-Smtp-Source: ABdhPJz5cfxjOjWx50t3W0ZgRHPjOPIHKWH9hIPMIKmwngTUc6c/0mhp9NGWVXN3y7dZL/8mqm6Jvg==
X-Received: by 2002:a63:9313:: with SMTP id b19mr13266059pge.128.1631578520855; 
 Mon, 13 Sep 2021 17:15:20 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m7sm9334179pgn.32.2021.09.13.17.15.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 17:15:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/44] accel/tcg: Restrict TCGCPUOps::cpu_exec_interrupt() to
 sysemu
Date: Mon, 13 Sep 2021 17:14:43 -0700
Message-Id: <20210914001456.793490-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914001456.793490-1-richard.henderson@linaro.org>
References: <20210914001456.793490-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

All targets call TCGCPUOps::cpu_exec_interrupt() from sysemu code.
Move its declaration to restrict it to system emulation.
Extend the code guarded.
Restrict the static inlined need_replay_interrupt() method to
avoid a "defined but not used" warning.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210911165434.531552-24-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/tcg-cpu-ops.h |  4 ++--
 accel/tcg/cpu-exec.c          | 10 +++++++---
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index 6c7ab9600b..55123cb4d2 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -35,8 +35,6 @@ struct TCGCPUOps {
     void (*cpu_exec_enter)(CPUState *cpu);
     /** @cpu_exec_exit: Callback for cpu_exec cleanup */
     void (*cpu_exec_exit)(CPUState *cpu);
-    /** @cpu_exec_interrupt: Callback for processing interrupts in cpu_exec */
-    bool (*cpu_exec_interrupt)(CPUState *cpu, int interrupt_request);
     /**
      * @tlb_fill: Handle a softmmu tlb miss or user-only address fault
      *
@@ -68,6 +66,8 @@ struct TCGCPUOps {
     void (*do_interrupt)(CPUState *cpu);
 #endif /* !CONFIG_USER_ONLY || !TARGET_I386 */
 #ifdef CONFIG_SOFTMMU
+    /** @cpu_exec_interrupt: Callback for processing interrupts in cpu_exec */
+    bool (*cpu_exec_interrupt)(CPUState *cpu, int interrupt_request);
     /**
      * @do_transaction_failed: Callback for handling failed memory transactions
      * (ie bus faults or external aborts; not MMU faults)
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 2838177e7f..75dbc1e4e3 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -685,6 +685,7 @@ static inline bool cpu_handle_exception(CPUState *cpu, int *ret)
     return false;
 }
 
+#ifndef CONFIG_USER_ONLY
 /*
  * CPU_INTERRUPT_POLL is a virtual event which gets converted into a
  * "real" interrupt event later. It does not need to be recorded for
@@ -698,12 +699,11 @@ static inline bool need_replay_interrupt(int interrupt_request)
     return true;
 #endif
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static inline bool cpu_handle_interrupt(CPUState *cpu,
                                         TranslationBlock **last_tb)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
     /* Clear the interrupt flag now since we're processing
      * cpu->interrupt_request and cpu->exit_request.
      * Ensure zeroing happens before reading cpu->exit_request or
@@ -725,6 +725,7 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
             qemu_mutex_unlock_iothread();
             return true;
         }
+#if !defined(CONFIG_USER_ONLY)
         if (replay_mode == REPLAY_MODE_PLAY && !replay_has_interrupt()) {
             /* Do nothing */
         } else if (interrupt_request & CPU_INTERRUPT_HALT) {
@@ -753,12 +754,14 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
             qemu_mutex_unlock_iothread();
             return true;
         }
-#endif
+#endif /* !TARGET_I386 */
         /* The target hook has 3 exit conditions:
            False when the interrupt isn't processed,
            True when it is, and we should restart on a new TB,
            and via longjmp via cpu_loop_exit.  */
         else {
+            CPUClass *cc = CPU_GET_CLASS(cpu);
+
             if (cc->tcg_ops->cpu_exec_interrupt &&
                 cc->tcg_ops->cpu_exec_interrupt(cpu, interrupt_request)) {
                 if (need_replay_interrupt(interrupt_request)) {
@@ -777,6 +780,7 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
              * reload the 'interrupt_request' value */
             interrupt_request = cpu->interrupt_request;
         }
+#endif /* !CONFIG_USER_ONLY */
         if (interrupt_request & CPU_INTERRUPT_EXITTB) {
             cpu->interrupt_request &= ~CPU_INTERRUPT_EXITTB;
             /* ensure that no TB jump will be modified as
-- 
2.25.1


