Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 902CC400DB0
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 02:18:00 +0200 (CEST)
Received: from localhost ([::1]:45310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMfrD-0008RT-Mi
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 20:17:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfXk-0000b5-Q6
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:57:53 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfXg-00009F-6D
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:57:51 -0400
Received: by mail-wr1-x434.google.com with SMTP id q11so4049978wrr.9
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 16:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JWKBtEMqz5hUsAPJr5foR0KE5eQgXFRtLCwxDOixiMc=;
 b=Mol2KChTYyXAjwtJtg8BwAy3uL+yd6pCeL91yapgIA6uWpjlmF4HOK9LlTp6AIh1jM
 Fg3lr5zZiub1Mg2CJl/H5j3uzhTau2mfQlowbi94t/i5ALNzLOJLDnb7N+edfWSz3rqw
 fuJBwa3IITfWmNGo7qSujvqSuQ4AHv5a7NG+SRDU3W81i8F4cTRw8UdqYinpv2RwQ56g
 EyyGscnc0xuKE1mGUryCmKsPWUSwFK44OwmcA1CDBg7orj6dHXkj33meNGVRgqMxAsIA
 m4pXgepr8ySuI2Rzd1LJvzYHxzZAU9jeicPE8lCTm37PdPqwCdkgpR3kCeDjSpRHPsW5
 8ezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JWKBtEMqz5hUsAPJr5foR0KE5eQgXFRtLCwxDOixiMc=;
 b=tszM8xhmG3IMu/3poiqMTZwaMj8GwlIn1HOq9GxaDzmMhDcCPi7fah8R4wPRTFNB1N
 rHR/SDdHMOYOqt2dR4WEDNrIGgfK6/n8rKmYiPF3OySIKw7nxuuBVmd6IYY7IRAvzEME
 O5cY2A+X3/eAbAAU5HPVwfa3rkjV1FZm79L5ZJ9a/BYbVfc+rgsZGl/W4aA9N4THLiWP
 ViGle/XJ2iYNVcQIrrdHtdETR8YI/SUHfz2xova2LniegiWZlMsKIVoIQS6nRAX4tAim
 xvnqcXCWWZW4FKQs8MhacaFOWYQQebIWrO9V0+DJLgZ4GJ9xE9nGBmSrtIkYL9b6kg88
 nQUg==
X-Gm-Message-State: AOAM533c8clzbMJMs+IO/jDVacxDyRoeSp5bcOJdRq3zQzoP9o1ab2iC
 SDwIH0h8nwwsZEJs4pXygK88xkUyr4o=
X-Google-Smtp-Source: ABdhPJxxZHg1o3r7Jm18JFxf7I6oOjJ8kD0EE4Rd0HSDCX+GJ4F/1O2xYo6K2LeNAr0Fao9iVIxBng==
X-Received: by 2002:a5d:4f02:: with SMTP id c2mr5712629wru.311.1630799866551; 
 Sat, 04 Sep 2021 16:57:46 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id z1sm3243475wmi.34.2021.09.04.16.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 16:57:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/24] accel/tcg: Restrict TCGCPUOps::cpu_exec_interrupt()
 to sysemu
Date: Sun,  5 Sep 2021 01:55:41 +0200
Message-Id: <20210904235542.1092641-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210904235542.1092641-1-f4bug@amsat.org>
References: <20210904235542.1092641-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
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


