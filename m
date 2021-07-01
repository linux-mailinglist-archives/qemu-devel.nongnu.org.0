Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3639B3B93FC
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 17:32:39 +0200 (CEST)
Received: from localhost ([::1]:54816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyygA-0001gA-8c
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 11:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyyZl-0004hj-2T
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 11:26:01 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:38805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyyZX-0008Fw-P6
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 11:26:00 -0400
Received: by mail-pg1-x52b.google.com with SMTP id h4so6415299pgp.5
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 08:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aZodwPrqQjUt8vQ3rujRtm0PKCZdI4rcPhp5DEtvTCc=;
 b=hVhivn0JQBLhfo15kUBHoJZe79uniU31FuCuDuDsAXIk+FCoCVEEMvHEaKqFUkpyQn
 10BiUMQ+/xjSlN0Aki51DpahvczC31+rm/4tCTGjy4Y52arC4wnWGpFYaeli2o4TQyls
 aykoNZqo7pTzSjFP2iKwBNe5utrSbySGUizAZXONlZ5SPkz0xA05k/eEu8xRZSuSUder
 MQMLxI3S/RcPi/KRd4w11ptEyQlMFu9AhfuraAMGU22EK3q3P7bHTNC45rs+Jsl1aHs7
 P5SYKa2O+igOULuLShCNFyg1ySNy57So40cAMDxLl+dx0n4l+0tDvKC0FOzS6+hrAHNp
 mpag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aZodwPrqQjUt8vQ3rujRtm0PKCZdI4rcPhp5DEtvTCc=;
 b=oUPaXE5Ufey22KyXvABa2IJ8SQxgOul0i/KzVFA4ffjN8yEDWqzXzhap0amr4W2a7Q
 lzyVV8WbRXQppJsAuNgJwsiFZ1Qip5aCT/MiVEZldIj+8jsgjXef1GbYWA+ThRQSxvQ+
 xTGZl786EnnLG3voSeRtyz8MYX92giHB5rfTGF3ilJoTdtHYS6aCHWSHmoCrvy2R7v5p
 fkhmravId8IQrEitRTkMALb2e6wyeERrabUpaSFxZ7KQ7xND7VK8tLt+OElJShApV3+h
 6ASHiGouZNx4POXynslI9mhCRRT0Ny5kUf+fBTFuBb6aIKwv4dlOBLbqOxj2Zdgnix9+
 0GsQ==
X-Gm-Message-State: AOAM532AILoCM2Y8ILIAFGesqxhoupgYOqftacvncIhStvqK5v864LqV
 K7rT9wnCpWmpeEMspRi7Tmp2I1OgS/PwpQ==
X-Google-Smtp-Source: ABdhPJy4RfeEuy1mb78uHYzVi8NNSlDMF4TM3wB8yRR0/rdF9MWgxRR5xb2NdAV0QJanp3NEB5bSJQ==
X-Received: by 2002:aa7:96f0:0:b029:312:8eda:61e1 with SMTP id
 i16-20020aa796f00000b02903128eda61e1mr266767pfq.42.1625153145759; 
 Thu, 01 Jul 2021 08:25:45 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j4sm10213197pjv.7.2021.07.01.08.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 08:25:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/17] accel/tcg: Use CF_NO_GOTO_{TB,
 PTR} in cpu_exec_step_atomic
Date: Thu,  1 Jul 2021 08:25:32 -0700
Message-Id: <20210701152537.3330420-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210701152537.3330420-1-richard.henderson@linaro.org>
References: <20210701152537.3330420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Request that the one TB returns immediately, so that
we release the exclusive lock as soon as possible.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 2206c463f5..5bb099174f 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -330,8 +330,7 @@ void cpu_exec_step_atomic(CPUState *cpu)
     CPUArchState *env = (CPUArchState *)cpu->env_ptr;
     TranslationBlock *tb;
     target_ulong cs_base, pc;
-    uint32_t flags;
-    uint32_t cflags = (curr_cflags(cpu) & ~CF_PARALLEL) | 1;
+    uint32_t flags, cflags;
     int tb_exit;
 
     if (sigsetjmp(cpu->jmp_env, 0) == 0) {
@@ -341,8 +340,14 @@ void cpu_exec_step_atomic(CPUState *cpu)
         cpu->running = true;
 
         cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
-        tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
 
+        cflags = curr_cflags(cpu);
+        /* Execute in a serial context. */
+        cflags &= ~CF_PARALLEL;
+        /* After 1 insn, return and release the exclusive lock. */
+        cflags |= CF_NO_GOTO_TB | CF_NO_GOTO_PTR | 1;
+
+        tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
         if (tb == NULL) {
             mmap_lock();
             tb = tb_gen_code(cpu, pc, cs_base, flags, cflags);
-- 
2.25.1


