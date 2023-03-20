Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 752FB6C0E53
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 11:11:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peCTf-0003oS-Uf; Mon, 20 Mar 2023 06:10:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1peCTT-0003l2-EH
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 06:10:44 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1peCTR-0000D9-6k
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 06:10:43 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 i5-20020a05600c354500b003edd24054e0so2024372wmq.4
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 03:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679307040;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4kskGeJQrf9Cxcn5vNzrmuB/lHaeNa1KLZhaRS/P5FA=;
 b=tVTfBFQe7Sr0LP39/RjEGZK8aR/R4trqGKJMo7w/nuXxEgYRWEQWUG5wtWPORLpejv
 UlBZzE/17C8FCh9Ys5BHHRbrMexpQetN/bRd1kyU6iPi3NCZKcyT+m/JcvQ2TB6bgppT
 onvtmiQozBvdnMw+0QgrSED0wuFgz2sQMou7KJsNVqRhZ41wWWkG6vhEKVZFqkbrB6IW
 8VAKRIsLt/MHQawn3y7C3waDU5HQHY74qqZwfAbZZbO9r7D+0S6AfgE2TRMJFoax9+5P
 LtYKn0dydklvLcjkU/+hDMhHmtHoxfQZaErhfhI+mMgHTI3V2gI3LP09eGzWyTqSoWy4
 j/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679307040;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4kskGeJQrf9Cxcn5vNzrmuB/lHaeNa1KLZhaRS/P5FA=;
 b=LcYMXBJUKsaF0LXzm6roahSIwDIBb6BQ4FMCE9kDRMfmt95RS4HTDdF/hfr5eutMB4
 p3uSCROyFlTr3mYK43t1tIhxB0ctlf9/HZCNalPHP8vsThNyFoRwdaPKiA9fPn+oO+Nm
 IYoAAe6/WBBN5z0LqG2PfT55qOC+gknztvap1UEzvy+1hkJC4mWIqChJsv4Xgll/mu9A
 HN6xXcD4zTh4b1ayNFl/bW0qUoCoHtKjtfW12hLcqms1f9MCzc3/c9lgfajRnV3atERV
 h71yogRDibISORYxR5rJY+jQSQWT7Nqvsu6vKJKiNW/AWlMthvO+FZ6knlykkKnix27w
 RwQQ==
X-Gm-Message-State: AO0yUKVX4O5Hg5a2OiEGokm+ihRtOGiIrr8vISgj9+vFQXqwzbhPofdC
 CzmtkSArRtahY0EnIIC8ENTXyg==
X-Google-Smtp-Source: AK7set907v7gMikYK5L6/NPEw6FbCm0WHmBTxh3a78sigQsEG6P7upheKDhoJZJ+QyzfoaJ5uJOhug==
X-Received: by 2002:a1c:4c05:0:b0:3ed:6a32:d792 with SMTP id
 z5-20020a1c4c05000000b003ed6a32d792mr11410851wmf.7.1679307039854; 
 Mon, 20 Mar 2023 03:10:39 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 i26-20020a1c541a000000b003ed246f76a2sm16364366wmb.1.2023.03.20.03.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 03:10:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8A80B1FFBF;
 Mon, 20 Mar 2023 10:10:36 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alessandro Di Federico <ale@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 07/10] accel/tcg: use QEMU_IOTHREAD_LOCK_GUARD to cover the
 exit
Date: Mon, 20 Mar 2023 10:10:32 +0000
Message-Id: <20230320101035.2214196-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320101035.2214196-1-alex.bennee@linaro.org>
References: <20230320101035.2214196-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This avoids us having to make sure each exit path does an unlock.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/cpu-exec.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index ea2e7004fe..daa6e24daf 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -774,7 +774,9 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
 
     if (unlikely(qatomic_read(&cpu->interrupt_request))) {
         int interrupt_request;
-        qemu_mutex_lock_iothread();
+        /* If we exit via cpu_loop_exit/longjmp it is reset in cpu_exec */
+        QEMU_IOTHREAD_LOCK_GUARD();
+
         interrupt_request = cpu->interrupt_request;
         if (unlikely(cpu->singlestep_enabled & SSTEP_NOIRQ)) {
             /* Mask out external interrupts for this step. */
@@ -783,7 +785,6 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
         if (interrupt_request & CPU_INTERRUPT_DEBUG) {
             cpu->interrupt_request &= ~CPU_INTERRUPT_DEBUG;
             cpu->exception_index = EXCP_DEBUG;
-            qemu_mutex_unlock_iothread();
             return true;
         }
 #if !defined(CONFIG_USER_ONLY)
@@ -794,7 +795,6 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
             cpu->interrupt_request &= ~CPU_INTERRUPT_HALT;
             cpu->halted = 1;
             cpu->exception_index = EXCP_HLT;
-            qemu_mutex_unlock_iothread();
             return true;
         }
 #if defined(TARGET_I386)
@@ -805,14 +805,12 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
             cpu_svm_check_intercept_param(env, SVM_EXIT_INIT, 0, 0);
             do_cpu_init(x86_cpu);
             cpu->exception_index = EXCP_HALTED;
-            qemu_mutex_unlock_iothread();
             return true;
         }
 #else
         else if (interrupt_request & CPU_INTERRUPT_RESET) {
             replay_interrupt();
             cpu_reset(cpu);
-            qemu_mutex_unlock_iothread();
             return true;
         }
 #endif /* !TARGET_I386 */
@@ -835,7 +833,6 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
                  */
                 if (unlikely(cpu->singlestep_enabled)) {
                     cpu->exception_index = EXCP_DEBUG;
-                    qemu_mutex_unlock_iothread();
                     return true;
                 }
                 cpu->exception_index = -1;
@@ -852,9 +849,6 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
                the program flow was changed */
             *last_tb = NULL;
         }
-
-        /* If we exit via cpu_loop_exit/longjmp it is reset in cpu_exec */
-        qemu_mutex_unlock_iothread();
     }
 
     /* Finally, check if we need to exit to the main loop.  */
-- 
2.39.2


