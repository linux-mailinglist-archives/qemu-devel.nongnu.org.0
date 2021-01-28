Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 262043081AB
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 00:08:04 +0100 (CET)
Received: from localhost ([::1]:48310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5GOQ-0006P3-UC
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 18:08:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5Fzj-0005vo-HU
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:42:31 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:42101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzY-0008EP-09
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:42:31 -0500
Received: by mail-pf1-x435.google.com with SMTP id w18so4960011pfu.9
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 14:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j34etXVQZzqqkkDQF4UCutDcHqFcrqbhKldr7JT3Nmk=;
 b=mKXxstFiDWv5XglClKNXc3avHws3W7vvEy0pq/qksBqkMgKnqQh4abpDjGT/Q4EnzI
 kedzqZB0H6eWrsv4OpgHMMwy+XLK2MtrOhoIXJhgI+CLNjIaognILbgDT4uuyKeKCiI2
 0kxckyiOGwvuoQC4PNspD4VTFx2IX9cquudXu2+zwkDkJ79qXHDXha+p1dSrYW6WNWm8
 Y+0kTLPW9UeULwKyaL4QYLXhnADhhKDoeEUTdL26Eg+p/1hZR3kaBcZ8kD8FvQRYnGv7
 s6a+aPAuYQY/FvD7ddXBFIjb07S1uD5U73VJQJqhry0Z16RMahGHQ4zCBaaA2Q6KxOsJ
 X8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j34etXVQZzqqkkDQF4UCutDcHqFcrqbhKldr7JT3Nmk=;
 b=ODbZGnpW0OYUlVM20mm/jE+7sE4K58nguwFMHjUppnWn4twCJJgFZ9m7ct7jOBE8G9
 h2+/v/MIgI7Fp9F7J78tDjgaaBTXTNOLMmjec0PgyQTbPzZr8pR28R1qLNmIUzgjN6DC
 9ejBeJzKvoNGpZaGBJHMrcBAdObGOdwJTuLK9LNfOIutx6B8pb0aAsqv8HqFjknXFh0B
 IlRuZACLlZyXwj/r0ZyMkLSpo4qogneKyIYlsd7IaD7BYTyOMSGdj3S+xy8rGN4FYrvR
 Ejo17bS+L4u5LeMeSvVb9hFyq1CJnICVgLSdMXtMarMXhf9r3s66aeAhZFzWGqfcSRWA
 GvOg==
X-Gm-Message-State: AOAM530STJ7F9oGzez4zjfdnZ1ctlYJeRw8WSD93Jb+RxYxwpMXAX5TQ
 8LkCQbxP0iahi8P9CEwlbU5prVW8ARJzsx8d
X-Google-Smtp-Source: ABdhPJwd9nNYm3DYd2Byuks3HjREQg2YTgz8quYZtUj1OzWjdDyKYalZO2iksIomwRXuD1Ru4pNd6g==
X-Received: by 2002:a65:56cb:: with SMTP id w11mr1696082pgs.88.1611873737546; 
 Thu, 28 Jan 2021 14:42:17 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id m10sm6042358pjs.25.2021.01.28.14.42.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 14:42:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 20/23] linux-user/aarch64: Signal SEGV_MTEAERR for async
 tag check error
Date: Thu, 28 Jan 2021 12:41:38 -1000
Message-Id: <20210128224141.638790-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128224141.638790-1-richard.henderson@linaro.org>
References: <20210128224141.638790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The real kernel collects _TIF_MTE_ASYNC_FAULT into the current thread's
state on any kernel entry (interrupt, exception etc), and then delivers
the signal in advance of resuming the thread.

This means that while the signal won't be delivered immediately, it will
not be delayed forever -- at minimum it will be delivered after the next
clock interrupt.

We don't have a clock interrupt in linux-user, so we issue a cpu_kick
to signal a return to the main loop at the end of the current TB.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_signal.h |  1 +
 linux-user/aarch64/cpu_loop.c      | 11 +++++++++++
 target/arm/mte_helper.c            | 10 ++++++++++
 3 files changed, 22 insertions(+)

diff --git a/linux-user/aarch64/target_signal.h b/linux-user/aarch64/target_signal.h
index 777fb667fe..18013e1b23 100644
--- a/linux-user/aarch64/target_signal.h
+++ b/linux-user/aarch64/target_signal.h
@@ -21,6 +21,7 @@ typedef struct target_sigaltstack {
 
 #include "../generic/signal.h"
 
+#define TARGET_SEGV_MTEAERR  8  /* Asynchronous ARM MTE error */
 #define TARGET_SEGV_MTESERR  9  /* Synchronous ARM MTE exception */
 
 #define TARGET_ARCH_HAS_SETUP_FRAME
diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index b6a2e65593..7c42f65706 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -164,6 +164,17 @@ void cpu_loop(CPUARMState *env)
             EXCP_DUMP(env, "qemu: unhandled CPU exception 0x%x - aborting\n", trapnr);
             abort();
         }
+
+        /* Check for MTE asynchronous faults */
+        if (unlikely(env->cp15.tfsr_el[0])) {
+            env->cp15.tfsr_el[0] = 0;
+            info.si_signo = TARGET_SIGSEGV;
+            info.si_errno = 0;
+            info._sifields._sigfault._addr = 0;
+            info.si_code = TARGET_SEGV_MTEAERR;
+            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+        }
+
         process_pending_signals(env);
         /* Exception return on AArch64 always clears the exclusive monitor,
          * so any return to running guest code implies this.
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 153bd1e9df..d55f8d1e1e 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -565,6 +565,16 @@ static void mte_check_fail(CPUARMState *env, uint32_t desc,
             select = 0;
         }
         env->cp15.tfsr_el[el] |= 1 << select;
+#ifdef CONFIG_USER_ONLY
+        /*
+         * Stand in for a timer irq, setting _TIF_MTE_ASYNC_FAULT,
+         * which then sends a SIGSEGV when the thread is next scheduled.
+         * This cpu will return to the main loop at the end of the TB,
+         * which is rather sooner than "normal".  But the alternative
+         * is waiting until the next syscall.
+         */
+        qemu_cpu_kick(env_cpu(env));
+#endif
         break;
 
     default:
-- 
2.25.1


