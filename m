Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A46A31CE5E
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 17:48:28 +0100 (CET)
Received: from localhost ([::1]:46878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC3WV-0007Oe-49
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 11:48:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC335-0000F5-87
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:18:03 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:35553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32Q-0002V5-3c
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:18:02 -0500
Received: by mail-wm1-x332.google.com with SMTP id n10so15029910wmq.0
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 08:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9QV6dxD/KPvoWsDk194HBYNrAPYe1/TdmLXa1Hr0QMw=;
 b=nQdb1btjKhndLubQXyA398cMP871k8C/JXSRZS3c/qrqHatRqmruqqydUF27XKOZRg
 BQ/WaBnuWR45jeVkehpnxNJKbJzzyMokZvpNW3Im/Ca/GSXlRfDpRuDEgXcwjgtR/MZv
 50PD6PlbKvc+zwwBTkohTaLpmCcZge8Hai2SzAL5gY8wkfK4spXx9To9fvd9FWg2SmRA
 i7Z1oKpmbX06w3cK8MOliDUaGHKc9dPlE7lGeRY63TSS1eeX5NF7EExRkD8PG3M7hjHA
 6cc4BWbBT9gF0VqQ9YADmP6a+jq7h0dgz4S5vBw8u++RB+ur7uDCvHj34cUXTnxml7h0
 9U/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9QV6dxD/KPvoWsDk194HBYNrAPYe1/TdmLXa1Hr0QMw=;
 b=i8ecZmL+cbzCKGEpSuXAubR7V1yTAe81JsXtRzLKnAstFiHnfQIho6Zuot/XWsbTvT
 Qp9G2qqgw514GKI1k+880CwdG4+wtIkyj/cJQPAabw+yVo2pe2gGn2ygmcYGVs1rXu1K
 VHasO0DADdhpN0vwSvrrHZbgAdI5F6qipYXTcMs0cWhVeUv+QwinVwghYtYO8NdVODq8
 zXhFlSNtNZ89bMZpNA+A4q01fktQzfaNmnzcdkauJHTZO4lhWc8vxNtxvhugNlRyulQR
 e8b64NJ/AZPLr5/dYMxuMYEtQakIcotmBbW2vcoThSXtsDC5IuA0aN4daIE+CTZxI5/A
 jCpA==
X-Gm-Message-State: AOAM530Di+jgTJm2d70OchJJBqfuPBwZYXpokHoQftbSflF3Y7aw39vq
 r53RCy+WUj++llbaVZSZjBsLUBqQ23tx/g==
X-Google-Smtp-Source: ABdhPJwAsRowfehofWI34AeQIPeS5f/ZOQd3KVIKfYkFQj5ZkhXG7fL19L7coYJ4zQ/xzgK/J45HiA==
X-Received: by 2002:a05:600c:4113:: with SMTP id
 j19mr1303011wmi.82.1613492240237; 
 Tue, 16 Feb 2021 08:17:20 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d5sm30630482wrb.14.2021.02.16.08.17.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 08:17:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/40] linux-user/aarch64: Signal SEGV_MTEAERR for async tag
 check error
Date: Tue, 16 Feb 2021 16:16:46 +0000
Message-Id: <20210216161658.29881-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210216161658.29881-1-peter.maydell@linaro.org>
References: <20210216161658.29881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

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
Message-id: 20210212184902.1251044-29-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/aarch64/target_signal.h |  1 +
 linux-user/aarch64/cpu_loop.c      | 11 +++++++++++
 target/arm/mte_helper.c            | 10 ++++++++++
 3 files changed, 22 insertions(+)

diff --git a/linux-user/aarch64/target_signal.h b/linux-user/aarch64/target_signal.h
index 777fb667fea..18013e1b235 100644
--- a/linux-user/aarch64/target_signal.h
+++ b/linux-user/aarch64/target_signal.h
@@ -21,6 +21,7 @@ typedef struct target_sigaltstack {
 
 #include "../generic/signal.h"
 
+#define TARGET_SEGV_MTEAERR  8  /* Asynchronous ARM MTE error */
 #define TARGET_SEGV_MTESERR  9  /* Synchronous ARM MTE exception */
 
 #define TARGET_ARCH_HAS_SETUP_FRAME
diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index b6a2e65593f..7c42f657068 100644
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
index 153bd1e9df8..d55f8d1e1ed 100644
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
2.20.1


