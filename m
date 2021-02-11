Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B184E318C60
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:49:24 +0100 (CET)
Received: from localhost ([::1]:34132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lACLT-0000yc-Kv
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:49:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZT-0000Bx-At
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:47 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZE-00006U-7K
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:47 -0500
Received: by mail-wr1-x42c.google.com with SMTP id t15so1765896wrx.13
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7J6XWT7lnNznOqQ/E74q/yJaH9LSrrM5aTsBvvX3CmU=;
 b=Zx12nGz8AeQ93lavA+WXPikyzHmyD/AU9+okXdnG/mcuOsFhLcVZFoyYqHlLcTTZnn
 KnKYx916Y8VFG2+cQfyxZ5zRl+cBJrRe0mFbnsaZwtotcnXY5suhye0B3vAPN6hArUPc
 3xwBwNQBFaMKK9/04JyBv501txbO5bnUl4THMIVGAG1h9A04Aftyai9Z6VmZ8wJIryWo
 bUqfznN4cFbka/Q5uQzP4XY8m4Yy5un4ze3AVREXmE8W+iqlRvqaOqJNG76kk+ifQpHS
 CW175xOIf6AfLZ0lhSdkBLQnKk/n8uhghcvbbdpmJ2Q734Ko7fRzk3PlhOpbr2duRJKC
 ioew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7J6XWT7lnNznOqQ/E74q/yJaH9LSrrM5aTsBvvX3CmU=;
 b=KQaERaq/zvFLWodQlbMHY523uvqFlh21niCV4kKw2fBtOJxu9CXhwUX5BRsymFk5qO
 lEIQefm/XWYBo0SRRE3viouFWijSRleKx+hZ/sFC1DxuY6U4RqmLPbHCGkNNHHc4s2KH
 G15HvffqNXV0bIQBxFpotgxJzuCef9jxeQ4CTFeYjr603sShBcqcHVdFwgtEMiDZAp6m
 cXoYwSEBHSPFvPyj4ItUK402VcrPjQbWoZLxmOQmet/1fNnaJvMYW5hWMXwAOt8IzbZH
 NECEFBWa5xyeovMXVQGGG096JrtujnCbfiC7b6o4CIJyoia1Pmoo0FtN2ewknt7ZAy0u
 kuUQ==
X-Gm-Message-State: AOAM5325RreHtCblKLk70qRx4ch9GPg4SR8AkwZhOufAstxFlhDHTo+C
 V27mK2jQJNyCTawCVoBp/11De77Ly0+MkQ==
X-Google-Smtp-Source: ABdhPJxoMDFuuaZ4X+rAiFNOIfLv09nZliubhENDSrVv9oUoZuZBP9wgnhkIDcucCQx0UlMhHTXQDA==
X-Received: by 2002:adf:de11:: with SMTP id b17mr689120wrm.225.1613048370454; 
 Thu, 11 Feb 2021 04:59:30 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g15sm4955716wrx.1.2021.02.11.04.59.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:59:30 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 37/45] linux-user/aarch64: Signal SEGV_MTEAERR for async tag
 check error
Date: Thu, 11 Feb 2021 12:58:52 +0000
Message-Id: <20210211125900.22777-38-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211125900.22777-1-peter.maydell@linaro.org>
References: <20210211125900.22777-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
Message-id: 20210210000223.884088-29-richard.henderson@linaro.org
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


