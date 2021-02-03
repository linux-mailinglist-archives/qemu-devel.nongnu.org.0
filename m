Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D48630E358
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 20:37:10 +0100 (CET)
Received: from localhost ([::1]:40154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Nxd-0003hh-Dn
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 14:37:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NP0-0007dS-H6
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:01:22 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:35111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOr-0001pr-J8
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:01:22 -0500
Received: by mail-pg1-x52b.google.com with SMTP id t25so403833pga.2
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 11:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=974AXR02Bhg4aUVmYtdJXY9jOyaOxnirKIOpaZIiAKE=;
 b=uC3VrUVigIqQnyoERevzYJv11v1YEPmymjefcoiQU4YtsJgR40QntKJjVi2JQVHfbN
 PvdhXM8za6ZbZK6g4fc24ntgNfdRmLcCMIyuS7G2Wwb9Zaidvyph4HEDx5IyjMmsAvd8
 p48X1znAvA+jzuH/4kguaM8UVHcrReJexgYq6Xl2rSUSp9cLF7P3AKJg+bB3dSGIf1Hw
 wu53zS9ZjT099cteb24Eac1rrdatfxdIfxv4fa341RAGKTc9Q1GBsyiG9np/L2nFwYxZ
 f57JUfJlvfxwZpAulY0oxjCr+6sAx1HtUXOjB7tRKANdDVJ4+kfXLy70iVOKAQUDHgdW
 H50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=974AXR02Bhg4aUVmYtdJXY9jOyaOxnirKIOpaZIiAKE=;
 b=IqmhtFZj+dvKVZ9sUOyG8AbdecsVn3xyv+sor4/cs1fDVpHa3OvNg7ANOkCZj7voHc
 GaN/mel87mcVKTO5pHmeVIjqi0ZusYKPUR9TBGr2WiPJhQrXwQZBQh8RIm595Rv2uznP
 oQMsS11ASyZrF2RYhsYCFNYqhySkgHbGqWnOSlAOACPNoDzEX1uUbcuSW29l0qw8fwuQ
 kJjkzS3h7d+ZKiGbNxYcX6bjbVywwtYAMXfvNaZEN/kGWwxZC2b/lpUXlozp60ve2buc
 ZwXMxeFYPEbobmYhjWdmmklHGpyjDZisp2Lo0ViWKFR+hs5a+2x+u9j4JP4SOmrfPaTd
 ijAA==
X-Gm-Message-State: AOAM530IEjIfHWM/kf3NNxKWn0O3ZkzcVWn/8eXRhhwkzM0Mx59KMZyh
 nIfF83bxcTzUtobI6MCC2uglohcD9h9PKZhk
X-Google-Smtp-Source: ABdhPJyVmrFyH0IUPV1ufHpnQPsAF+GdcTI2ETnfpiofcyf/9jGAojox6DmmK45U/EQnUYI/cWB/mg==
X-Received: by 2002:a63:5805:: with SMTP id m5mr5046724pgb.352.1612378870804; 
 Wed, 03 Feb 2021 11:01:10 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l2sm2906666pju.25.2021.02.03.11.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:01:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 28/31] linux-user/aarch64: Signal SEGV_MTEAERR for async
 tag check error
Date: Wed,  3 Feb 2021 09:00:07 -1000
Message-Id: <20210203190010.759771-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203190010.759771-1-richard.henderson@linaro.org>
References: <20210203190010.759771-1-richard.henderson@linaro.org>
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


