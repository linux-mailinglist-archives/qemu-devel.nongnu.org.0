Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9143BE008
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 02:05:29 +0200 (CEST)
Received: from localhost ([::1]:33158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0v4C-0002tP-Pv
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 20:05:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0up7-0001PC-TK
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:49:53 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:38849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0up0-0006eU-VQ
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:49:53 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 cs1-20020a17090af501b0290170856e1a8aso2555247pjb.3
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 16:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4mopW7s5yqP9F0ovgsMWsgQoRxKhvaHRwRrnWnVsrug=;
 b=Q4/R5H+lIAuM3R/QCkcbyAlk5IfnkGPqDs1oewXFzsIOfO9z1X1BjTvkmnndZQ4i+h
 iGUffW43V8b3Y+0b8euSp5AeFr13DjPW5N7kSZHxbWB4ZbvmI5yClcExED8eBV18n8I8
 t+A+bfUCNlbeFdua+e/F5oRug/V0o0cnNEs/ti/lhJEJCiq+XU4EV8NhJ2UHDTmejDfH
 59YcwnG+8BqadruKx9z8ztRFlXBeH7wEeIsAX3LZEX34sWZsf+TQZRdaQWbEJ6180cZe
 I3oSVJ3TjOGOSLGNejMtyaO11prrcm3wY5bWfzacQacsFjm9owji697blmxBT0chnEgW
 CorA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4mopW7s5yqP9F0ovgsMWsgQoRxKhvaHRwRrnWnVsrug=;
 b=JdKtK/z/OcK9VODlfPXWbZ1B4LGgZ6i1+br838aktR0DvUjDRV5sJ/mJ4xtfMvldIQ
 oWJBoLdlNuBvbg2MlyULaLDiBvXKRFBoBIbzd2+JgyH19cTS3Fd733fdakAKVeboo1ED
 a79/y6fkvLKEdvKa1AgtbS2TQA3NAnNgDTWoZzgo7QkMNxZUSrNIJ925/xkn6CvoUX2r
 dKUsTwTwqSJFpqR3cj0DKnEJ60b1671SbDSI8ogfYDHPTEq593jDRW/r8HCSHaAj46R4
 gmYaLNNOMEKJpRrKNPJrTvkjE4LM1bQ/J/3WYGL4KzHCJ8xJqyiaxu/3pnyHic+FPKrH
 mTsA==
X-Gm-Message-State: AOAM532Vo3ip58tCjxY/2og88e1Rop94Xj7gqPfe4GzbFg2kX1Jegynt
 gWnUQkx5f9Aj/D1vFMbf+YUN9aI622xY1Q==
X-Google-Smtp-Source: ABdhPJzCAWSXGZ6tGicvt7Y19QPCxhZfR2Zf4lq5Q7YEzYPjUeYmgcsoTakwsmyn3SjvWz6cbKhDow==
X-Received: by 2002:a17:902:e84b:b029:129:3120:153b with SMTP id
 t11-20020a170902e84bb02901293120153bmr18870159plg.47.1625615385401; 
 Tue, 06 Jul 2021 16:49:45 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b3sm18058114pfi.179.2021.07.06.16.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 16:49:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/36] linux-user/cris: Implement setup_sigtramp
Date: Tue,  6 Jul 2021 16:49:14 -0700
Message-Id: <20210706234932.356913-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210706234932.356913-1-richard.henderson@linaro.org>
References: <20210706234932.356913-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>, alex.bennee@linaro.org,
 laurent@vivier.eu, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split out setup_sigreturn so that we can continue to
initialize the words on the stack, as documented.
However, use the off-stack trampoline.

Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/cris/target_signal.h |  2 ++
 linux-user/cris/signal.c        | 29 +++++++++++++++++++++--------
 2 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/linux-user/cris/target_signal.h b/linux-user/cris/target_signal.h
index 495a142896..83a5155507 100644
--- a/linux-user/cris/target_signal.h
+++ b/linux-user/cris/target_signal.h
@@ -22,4 +22,6 @@ typedef struct target_sigaltstack {
 #include "../generic/signal.h"
 
 #define TARGET_ARCH_HAS_SETUP_FRAME
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
 #endif /* CRIS_TARGET_SIGNAL_H */
diff --git a/linux-user/cris/signal.c b/linux-user/cris/signal.c
index 1e02194377..9dad50f31f 100644
--- a/linux-user/cris/signal.c
+++ b/linux-user/cris/signal.c
@@ -96,6 +96,14 @@ static abi_ulong get_sigframe(CPUCRISState *env, int framesize)
     return sp - framesize;
 }
 
+static void setup_sigreturn(uint16_t *retcode)
+{
+    /* This is movu.w __NR_sigreturn, r9; break 13; */
+    __put_user(0x9c5f, retcode + 0);
+    __put_user(TARGET_NR_sigreturn, retcode + 1);
+    __put_user(0xe93d, retcode + 2);
+}
+
 void setup_frame(int sig, struct target_sigaction *ka,
                  target_sigset_t *set, CPUCRISState *env)
 {
@@ -111,14 +119,8 @@ void setup_frame(int sig, struct target_sigaction *ka,
     /*
      * The CRIS signal return trampoline. A real linux/CRIS kernel doesn't
      * use this trampoline anymore but it sets it up for GDB.
-     * In QEMU, using the trampoline simplifies things a bit so we use it.
-     *
-     * This is movu.w __NR_sigreturn, r9; break 13;
      */
-    __put_user(0x9c5f, frame->retcode+0);
-    __put_user(TARGET_NR_sigreturn,
-               frame->retcode + 1);
-    __put_user(0xe93d, frame->retcode + 2);
+    setup_sigreturn(frame->retcode);
 
     /* Save the mask.  */
     __put_user(set->sig[0], &frame->sc.oldmask);
@@ -134,7 +136,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
     env->regs[10] = sig;
     env->pc = (unsigned long) ka->_sa_handler;
     /* Link SRP so the guest returns through the trampoline.  */
-    env->pregs[PR_SRP] = frame_addr + offsetof(typeof(*frame), retcode);
+    env->pregs[PR_SRP] = default_sigreturn;
 
     unlock_user_struct(frame, frame_addr, 1);
     return;
@@ -186,3 +188,14 @@ long do_rt_sigreturn(CPUCRISState *env)
     qemu_log_mask(LOG_UNIMP, "do_rt_sigreturn: not implemented\n");
     return -TARGET_ENOSYS;
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint16_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 6, 0);
+    assert(tramp != NULL);
+
+    default_sigreturn = sigtramp_page;
+    setup_sigreturn(tramp);
+
+    unlock_user(tramp, sigtramp_page, 6);
+}
-- 
2.25.1


