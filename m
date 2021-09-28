Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 428B041A530
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 04:16:47 +0200 (CEST)
Received: from localhost ([::1]:46698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mV2fm-000075-8P
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 22:16:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mV2QQ-0004aA-OH
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 22:00:55 -0400
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:34720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mV2QL-0005gi-Es
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 22:00:54 -0400
Received: by mail-qv1-xf31.google.com with SMTP id w8so12509590qvu.1
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 19:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gwFLRVkTdcJ6AaaaGFzbcnne0zgO30rR8Nm1DoFMwjE=;
 b=LpyrraaySanQF2GUjk/5s5JnULXcI73CZNwInuCI8pFvazTD9QjXOJ9/Isjne6xb8K
 BlY+Mkq5eOjyvPn19B/xSm2VKvWDm1kQKM5sVFLAREvdIYz/teFQ0IrmHFfpt/AFrqhn
 Cc0BKI/mHFYfJU9MRsPvt9lBa1udVnSN6rLoxHiHwoGcgNr+YEE4SF7gN11FkZj3Rj06
 Y9oM6kq3QhHMANKv2CmBZgcNZidQK6GMO8FusKW1fTVDAtkp9XLcdWGGsoT0v686H33N
 6lxqxzlI2dScJWr5LRt93c6DzuiHIrwmocjQnDY34NkpaDFlyhBiM2Cispr8UsFe53xb
 pncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gwFLRVkTdcJ6AaaaGFzbcnne0zgO30rR8Nm1DoFMwjE=;
 b=jVikLN7nma3Hsm+/IKC4w+gSF6qNtGtZzA1fmuJ+KokPh4OPHYYxS8flfBL4IFeFjB
 G3/FxLSlhWMHSzo5b8H2mMfSaPAecffk7cjgbCZik08svzSwTdZLUEla3eHcmqlN6aEM
 PgdfYU7pMD2EDvjoka0WRN/bBa+SDstncr0D7wbsn0903zq5zL35X9KfOAKjxF5sAiUK
 wQyuTuFoI4kZ33zld/h2GvH3bE6xNk3WUiuw007YneDkQw/+GkvyxO6UmmrB/NmrmpOl
 BOZ6HQsp0Zge/mb40XCti/j0rjXbNJ5BeYqTd5gylhHmMbKRH/v+4hB9JOsnQ5selK0l
 jpvA==
X-Gm-Message-State: AOAM531gMXcjVg6c6M/cbg237j4tJuMudG7YF2MsoA8nZGc2Hj/2x+Zz
 dOONW8jfnjsXD6u8m6S4Ei5hKTCbfrTu/g==
X-Google-Smtp-Source: ABdhPJxYi31gfFDZulTbcDVVmhkjLs6iHBPFY4uy4dxojQ8zGKCxsorMGAS/9ltkw8xkqAQDd/3s6g==
X-Received: by 2002:a0c:a915:: with SMTP id y21mr2943216qva.55.1632794447680; 
 Mon, 27 Sep 2021 19:00:47 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-31-215-130.sc.res.rr.com.
 [24.31.215.130])
 by smtp.gmail.com with ESMTPSA id g12sm12530370qtm.59.2021.09.27.19.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 19:00:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/25] linux-user/cris: Implement setup_sigtramp
Date: Mon, 27 Sep 2021 22:00:21 -0400
Message-Id: <20210928020039.184412-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210928020039.184412-1-richard.henderson@linaro.org>
References: <20210928020039.184412-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf31.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, laurent@vivier.eu,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
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
index 2c39bdf727..7f6aca934e 100644
--- a/linux-user/cris/signal.c
+++ b/linux-user/cris/signal.c
@@ -97,6 +97,14 @@ static abi_ulong get_sigframe(CPUCRISState *env, int framesize)
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
@@ -112,14 +120,8 @@ void setup_frame(int sig, struct target_sigaction *ka,
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
@@ -135,7 +137,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
     env->regs[10] = sig;
     env->pc = (unsigned long) ka->_sa_handler;
     /* Link SRP so the guest returns through the trampoline.  */
-    env->pregs[PR_SRP] = frame_addr + offsetof(typeof(*frame), retcode);
+    env->pregs[PR_SRP] = default_sigreturn;
 
     unlock_user_struct(frame, frame_addr, 1);
     return;
@@ -187,3 +189,14 @@ long do_rt_sigreturn(CPUCRISState *env)
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


