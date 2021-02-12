Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8F431A578
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 20:34:04 +0100 (CET)
Received: from localhost ([::1]:48190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAeCZ-00052r-9y
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 14:34:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVf-00023j-Kv
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:43 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:40724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVd-0007uy-7E
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:43 -0500
Received: by mail-pg1-x52b.google.com with SMTP id b21so243616pgk.7
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 10:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=974AXR02Bhg4aUVmYtdJXY9jOyaOxnirKIOpaZIiAKE=;
 b=uL6QzSKvUa1R3uUlp4m8xmRsrjdhlzNPPwrd9PHaIKNmf0vhfQZyEJJKCKgqXH1WvH
 2cx38JKyf5KCcTxTwpJuqXH+DGf4T5lFYuiZWclrqpqfKVF5cTOFeHlO30D3mVjTc95j
 OkEYTF1nWt4AHU3Psl02Xx1Nskdl1NYvS4aFbUM0y13kcs5rAOahZAu8zxjQZtW5hCyc
 cK3OvnKxphlznm7M8F+UTN49SYNiyXbaWLEfc0faq1VmuaPq5K79+mJCPX1VZ1ehCPMB
 zjwM2oRGfaaxxbGQglk5zgCg1Ps9nsSQDrMMAr7lX6JoKo9Xj50Rf53q0qEUo3F3ltGP
 DNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=974AXR02Bhg4aUVmYtdJXY9jOyaOxnirKIOpaZIiAKE=;
 b=My7NnbyIHWbwUMQ0Es1aAufvqkO89HvKkU6L8Sp3Ch2wCxga9htCGA2JnHdFKbk7NP
 +TdJeHE9OEXaiKWDRHWq5BeWMuIx95KBNFylomlB5/NsrDEHh+Ysgj4ZdvswPClD6iJr
 06mRjsZDWzaHKOfF6BK9nZdUCiGVf4F3d8fyXx9VgZHhW/0YO7gNSyBdPzZlm8wd3H0s
 gwAvextfg6F7VXM42jney38toBGDGZZ4BEvSPj5K3oC6homTW9MgdYbBE7FdjoxYiZ5d
 bfgvaaOLqIptC6x52x3ay8TRv+5JLkEArGnqutA0B2AMSGRaVXhh4gkCNfrFuAK+GO5J
 xKqQ==
X-Gm-Message-State: AOAM531maKPbmmSWmR6EAZqURKKlq5AaBrk/OK5PZwPoGarDrYVe6PPp
 ++pDSvNojzctkJ2bQ3VWZTjCvaGFpSMvvQ==
X-Google-Smtp-Source: ABdhPJzrqZybmK4UVs75ulIQ0SBsViXLFBMJrqgmsn6pb9C6QjE1nSms9qUk0n+zW4o+gif+Q1XlCg==
X-Received: by 2002:a63:f4e:: with SMTP id 14mr4549998pgp.3.1613155778890;
 Fri, 12 Feb 2021 10:49:38 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id k5sm9427618pfi.31.2021.02.12.10.49.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 10:49:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 28/31] linux-user/aarch64: Signal SEGV_MTEAERR for async
 tag check error
Date: Fri, 12 Feb 2021 10:48:59 -0800
Message-Id: <20210212184902.1251044-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210212184902.1251044-1-richard.henderson@linaro.org>
References: <20210212184902.1251044-1-richard.henderson@linaro.org>
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
Cc: peter.maydell@linaro.org
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


