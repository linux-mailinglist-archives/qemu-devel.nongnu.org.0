Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0F64079C4
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 19:10:25 +0200 (CEST)
Received: from localhost ([::1]:42312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP6WG-0002mO-2a
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 13:10:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6It-00015y-RY
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:56:37 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:37840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6Is-0003L3-7W
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:56:35 -0400
Received: by mail-wr1-x431.google.com with SMTP id t8so2462560wrq.4
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 09:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JWKBtEMqz5hUsAPJr5foR0KE5eQgXFRtLCwxDOixiMc=;
 b=e+qje1cuNCCYtVs3KdwRTIkK5ZSjpTp6BMpUs7GfwGUUqy9HrXZS9daBZrcx5mI4ok
 OENU+npl3zj6/dVuVcRYhUhAqDhVjmXp38eSUE86vftr3VWxgvw7Q94BDdlUMdjz/T30
 sk6eAXeNxKSC3DpwPB9v00vTQM5zhDHwUwtkhnEsxaVdZYFZaLiAWVDAiKpjK3NHzcNK
 5VUdN4o84R9/XMFwwevHfp65f/Qj4JGPgiCKMnhlEzBWD6sTGjLfVBwUbLbuuA7HtwGe
 7Q4eJhIaNer4ZGDHhqI9N5OoxAwx/cAPC3daT2WQddta09UaQuuE83Y6iGvX66IPSIxZ
 dE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JWKBtEMqz5hUsAPJr5foR0KE5eQgXFRtLCwxDOixiMc=;
 b=SMc/GQiTtD8tM+W5hSzFup/rjQgSJARd2bM1Y1vi2n7pXp5WgjjhbVjiHnIOgYX3Ll
 omRAQ7Y/FgijfR5sZaii1re65xtMSF6PVqpEIXG13kncVdyJzntQ9btIx7eaVeaYoyXU
 EIvzq0HHt08YptRE/te04sIUf9i0T/eWZp28xVT5Vuo/V8wpOGGOhcfYSybAq/tJ64bR
 o1EEGbE+tn6sglIkqMQfx+a94y+DpUrkR2lrleoyFloX8DdTwKyHTs/Udr8U/akYirhK
 kXDsT8oRjjaxJ3L43fr/G7TS+2RDOzjgI1Yv7Sm1cIkJoN7BMRp1FtwgYhGZcyr8ohKS
 qBIw==
X-Gm-Message-State: AOAM532jiYR45+JTh7Ohh0LzE1Jfi/HZQ8KbdVfkuCjTfjrng4KjWvzF
 Wfas8vecNKoSMXz55Xnz3KOfEiM2QEM=
X-Google-Smtp-Source: ABdhPJy+XHF69mbQsLLAtV7bZsAkSniKDt5sTjSzxp9SGCwJ2i2TA2ouRs1eUod+YbkkquNP91rP9g==
X-Received: by 2002:adf:fd03:: with SMTP id e3mr3900306wrr.46.1631379391724;
 Sat, 11 Sep 2021 09:56:31 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id g9sm2082333wmg.21.2021.09.11.09.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 09:56:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 23/24] accel/tcg: Restrict TCGCPUOps::cpu_exec_interrupt()
 to sysemu
Date: Sat, 11 Sep 2021 18:54:33 +0200
Message-Id: <20210911165434.531552-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210911165434.531552-1-f4bug@amsat.org>
References: <20210911165434.531552-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All targets call TCGCPUOps::cpu_exec_interrupt() from sysemu code.
Move its declaration to restrict it to system emulation.
Extend the code guarded.
Restrict the static inlined need_replay_interrupt() method to
avoid a "defined but not used" warning.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/tcg-cpu-ops.h |  4 ++--
 accel/tcg/cpu-exec.c          | 10 +++++++---
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index 6c7ab9600ba..55123cb4d22 100644
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
index 2838177e7f0..75dbc1e4e33 100644
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
2.31.1


