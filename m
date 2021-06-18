Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0B13AD2FF
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 21:38:51 +0200 (CEST)
Received: from localhost ([::1]:52962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luKKI-0001mg-3z
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 15:38:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKBo-0001aL-Hc
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:30:04 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:40769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKBh-0001SJ-GI
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:30:04 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 bb10-20020a17090b008ab029016eef083425so8302007pjb.5
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 12:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8EdJTWq8OgKipxSBNkme0TC2fL2bX66wTjLIFL0IsAQ=;
 b=eN2E6Xp0HrS7LanIyGtL4QBnH66ramgehpLPHNNXPJvR4ofQ+pgRPK5MNSIvTnaZCu
 SNPzy7ld8WpsrsepnHEkrbr/UWZpq2l0BD9bjw+SgpC9jhWz2BRn5P0FgTIS6N94f8w2
 MRENw/Z5X0zfjPwRVxO0XE9TMHcDwNa4tvrPUcPNimlx+ZSBMFwQ3WN8HYvzyQ2UCpb2
 YoOz0jjLI7jWcAkP9tQNmUckWeqdam8ncj0NQrCcD5hf/eEPSdz/E5L3JhGPvVeRdEkH
 uuyD2WS4V2ljMJy6FxxtLNXdJ5mIrpyQOKx5OIAOc6DHJxaGMFd0N6yakD2C5cqx8Qy3
 cv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8EdJTWq8OgKipxSBNkme0TC2fL2bX66wTjLIFL0IsAQ=;
 b=XWGq6FRHTghASgyWRRYDbPm6pAnNxDsOLS/goLG2tkA3e5RTscCv+AHAkGexjihT4W
 vVLOWzOoL0g5y/iseTfGQ35ga5tQRxzR47oBT6XODL2nUKQege6rJLEONb0xJC78MCRX
 XOay4sZJbEYk+2d10qD3ymXJOltIeYLV+2+uL49rll7mYA5unyZH8ECbQOLg55qd5yoW
 4JUTJtpZNbvmA0uNYx5a2c8r0O+9EpJa0fxG2N+8CVLzsmpfkpiFclXXptm/rEYX/JTI
 fqBUc8l8tSZJF2vgbMtyfpQKDBkY5Q4g9/v3sgj8boliGBhvz14chrhC3sfXGupOMF7A
 bFgA==
X-Gm-Message-State: AOAM5334XqwssAZIq2+wLTZ6FlmNQFHpGXKw89bt8hIg7A8qHOIiLVvh
 PICvKPaU0ugDecpDMCe47fjOXZIJixwvSA==
X-Google-Smtp-Source: ABdhPJyVdKyP2Il8KJ7Z69TuSCYTJdyKwKyUhRf6hnVNiGgLppx47W03tYBonnNSEu98Jum3R5H0Qw==
X-Received: by 2002:a17:902:7442:b029:11e:4b18:daf5 with SMTP id
 e2-20020a1709027442b029011e4b18daf5mr6113783plt.47.1624044596341; 
 Fri, 18 Jun 2021 12:29:56 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 92sm11938234pjv.29.2021.06.18.12.29.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 12:29:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/23] linux-user/cris: Implement setup_sigtramp
Date: Fri, 18 Jun 2021 12:29:35 -0700
Message-Id: <20210618192951.125651-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618192951.125651-1-richard.henderson@linaro.org>
References: <20210618192951.125651-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split out setup_sigreturn so that we can continue to
initialize the words on the stack, as documented.
However, use the off-stack trampoline.

Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
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


