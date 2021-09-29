Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE1741C5AD
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 15:31:30 +0200 (CEST)
Received: from localhost ([::1]:58894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVZgH-0002QM-87
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 09:31:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZIT-0007bY-5U
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:06:53 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:38818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZIP-0006Qy-3Y
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:06:52 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 c6-20020a9d2786000000b005471981d559so2760456otb.5
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 06:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N1pQeWtC9n4Sw0tRD9grdf+GtJJknjzU5E/8NqeYIIg=;
 b=V5OY+FFTo6FKTxfutsXHG90MHRYs8350pQjF1Y3+I23Ln815aN4E2SdsapxocFXYkY
 xSjXWZXDIaZKsw2COvR1BllxYySj4BhTqu7fUdyw6g3UmyazdOaYHJsEGIdZe7YXk0vj
 N6AdFSj9gIzDgDLntB0a7TRx/9xTIZL1nO6YeCpEXl8xXtG7K6X2eVbfzZ+iBro2L7GL
 k8HOxs9uM9zrnoQ94Ftqx4H8panWPfO3XG+gDXhgRRuCe9dr7g7c6/wcivv+web9Xpno
 LEJHQRvYYqBAXP/CIsdJ94TrE4UkZ1nyBXK0alQv6b013GPYGccysPnLUUF/zniHlbAs
 LpHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N1pQeWtC9n4Sw0tRD9grdf+GtJJknjzU5E/8NqeYIIg=;
 b=Lmm3wyP1yt0urh2wKkJC/Qm7IZm0vYG4OKGd1zlid7lnQIBrk5Mm9vfh7EyHNiPa5P
 UgcarW9SFZDod9MaFGIsYMbFIfi2rZdc3phjEOMVKifN3BPjmAbQcV7WQK7DlqmIsu0A
 iY40sCB6pPPz/JGlRdthB7e0uP86yQd8wkJYd1D0gwSBt4aDihpi4rfTVbm6kgVw8Gq2
 L2Q1M1V4YRDOW7qM+BpV33g6/3xv+CNBgcM5IiuAqX7jsKkNox4s2lsNmkKEjSzVVeQI
 4Y1Mg1LRMFtnlcHpGyG9yuJeRrLEdAvuFgS2hedKqNUQsZsEcg8BtEWvgpK2Otm1QRiW
 ByDg==
X-Gm-Message-State: AOAM532fRa73tO0hY+fVAXfqM4xGpFSUmdUWiQBYjfZHJSZlTzJK5y4C
 xmDlBCcuHJygJeitoKIYpB+RpPZKeUsVhg==
X-Google-Smtp-Source: ABdhPJzhLlauc6nEpI/Ver+XozCDuM9OcrVVTNzA30GFESpgihA9MKxm2oMHX7sKaV6GirhGITMGPw==
X-Received: by 2002:a9d:3e5e:: with SMTP id h30mr10031059otg.255.1632920806972; 
 Wed, 29 Sep 2021 06:06:46 -0700 (PDT)
Received: from localhost.localdomain ([172.58.171.248])
 by smtp.gmail.com with ESMTPSA id w1sm442823ote.41.2021.09.29.06.06.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 06:06:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 22/26] linux-user/sh4: Implement setup_sigtramp
Date: Wed, 29 Sep 2021 09:05:49 -0400
Message-Id: <20210929130553.121567-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210929130553.121567-1-richard.henderson@linaro.org>
References: <20210929130553.121567-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32d.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create and record the two signal trampolines.
Use them when the guest does not use SA_RESTORER.

Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sh4/target_signal.h |  2 ++
 linux-user/sh4/signal.c        | 40 +++++++++++++++++++---------------
 2 files changed, 24 insertions(+), 18 deletions(-)

diff --git a/linux-user/sh4/target_signal.h b/linux-user/sh4/target_signal.h
index d7309b7136..04069cba66 100644
--- a/linux-user/sh4/target_signal.h
+++ b/linux-user/sh4/target_signal.h
@@ -22,4 +22,6 @@ typedef struct target_sigaltstack {
 #include "../generic/signal.h"
 
 #define TARGET_ARCH_HAS_SETUP_FRAME
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
 #endif /* SH4_TARGET_SIGNAL_H */
diff --git a/linux-user/sh4/signal.c b/linux-user/sh4/signal.c
index d70d744bef..faa869fb19 100644
--- a/linux-user/sh4/signal.c
+++ b/linux-user/sh4/signal.c
@@ -52,7 +52,6 @@ struct target_sigframe
 {
     struct target_sigcontext sc;
     target_ulong extramask[TARGET_NSIG_WORDS-1];
-    uint16_t retcode[3];
 };
 
 
@@ -68,7 +67,6 @@ struct target_rt_sigframe
 {
     struct target_siginfo info;
     struct target_ucontext uc;
-    uint16_t retcode[3];
 };
 
 
@@ -190,15 +188,9 @@ void setup_frame(int sig, struct target_sigaction *ka,
     /* Set up to return from userspace.  If provided, use a stub
        already in userspace.  */
     if (ka->sa_flags & TARGET_SA_RESTORER) {
-        regs->pr = (unsigned long) ka->sa_restorer;
+        regs->pr = ka->sa_restorer;
     } else {
-        /* Generate return code (system call to sigreturn) */
-        abi_ulong retcode_addr = frame_addr +
-                                 offsetof(struct target_sigframe, retcode);
-        __put_user(MOVW(2), &frame->retcode[0]);
-        __put_user(TRAP_NOARG, &frame->retcode[1]);
-        __put_user((TARGET_NR_sigreturn), &frame->retcode[2]);
-        regs->pr = (unsigned long) retcode_addr;
+        regs->pr = default_sigreturn;
     }
 
     /* Set up registers for signal handler */
@@ -248,15 +240,9 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     /* Set up to return from userspace.  If provided, use a stub
        already in userspace.  */
     if (ka->sa_flags & TARGET_SA_RESTORER) {
-        regs->pr = (unsigned long) ka->sa_restorer;
+        regs->pr = ka->sa_restorer;
     } else {
-        /* Generate return code (system call to sigreturn) */
-        abi_ulong retcode_addr = frame_addr +
-                                 offsetof(struct target_rt_sigframe, retcode);
-        __put_user(MOVW(2), &frame->retcode[0]);
-        __put_user(TRAP_NOARG, &frame->retcode[1]);
-        __put_user((TARGET_NR_rt_sigreturn), &frame->retcode[2]);
-        regs->pr = (unsigned long) retcode_addr;
+        regs->pr = default_rt_sigreturn;
     }
 
     /* Set up registers for signal handler */
@@ -334,3 +320,21 @@ badframe:
     force_sig(TARGET_SIGSEGV);
     return -TARGET_QEMU_ESIGRETURN;
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint16_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 2 * 6, 0);
+    assert(tramp != NULL);
+
+    default_sigreturn = sigtramp_page;
+    __put_user(MOVW(2), &tramp[0]);
+    __put_user(TRAP_NOARG, &tramp[1]);
+    __put_user(TARGET_NR_sigreturn, &tramp[2]);
+
+    default_rt_sigreturn = sigtramp_page + 6;
+    __put_user(MOVW(2), &tramp[3]);
+    __put_user(TRAP_NOARG, &tramp[4]);
+    __put_user(TARGET_NR_rt_sigreturn, &tramp[5]);
+
+    unlock_user(tramp, sigtramp_page, 2 * 6);
+}
-- 
2.25.1


