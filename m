Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C887C3A8E68
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:31:54 +0200 (CEST)
Received: from localhost ([::1]:37046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltKPJ-0004MO-Px
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:31:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltK6e-0005fu-4c
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:12:36 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:40949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltK6R-0008UD-Hu
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:12:33 -0400
Received: by mail-pl1-x636.google.com with SMTP id e7so259813plj.7
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 18:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gmXhcVzm0Mn9qra3UUrV4KJ0gXBFFg35s1ELoxfM9Zo=;
 b=Bg5J7xyu7UhebMUdPbm+bab9HhIKGCcokiHNF4HgWZpVmus1tvnWxma6kUaIHATmlx
 k3cRyTUG+ATTxla+uP7yT/ljqcuvjXArtEyq6ngwxboe1LH8wum7jrguUzmgMseBrqvb
 8wW4jGcLivVUOXTD5cLT9KYIDo5Uus/I1c9+wGWK5hKYgAvd/NGlQw7KJWHPLY2XAwWQ
 oWXwGxoim91l16XAVoZcKUn1+LP0/b9S1rHiIQ3bo8pktFm4+k5M6+pVKYxiHomMtW9L
 If8sqVPz/y0hHET11CeNVwQVjSeGuoY6LTYhnuwycqVlaDjAAoHBcwXso5h/a4gRzzkq
 yjIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gmXhcVzm0Mn9qra3UUrV4KJ0gXBFFg35s1ELoxfM9Zo=;
 b=qMPy02IR+RbZI8vwq681g4quGqNEZPMlK8EQtpogCejJMMrbmtYsDbsemh3njAB3Gt
 A4kO7FsQCoFTn3zSCBGBY3B8+eh8jhay0uhDxKmnjBlSNfT68OO31u3/1Po9+um56pNw
 QNSloBqqtZ2+u1m7HRoA7/W5ByyY9/jbnshlz6yalQ5lgNS6yfQQVLVQxmH+AaqAI6jT
 iKMpB/Yg9GvD7pqDu2U/S6vaCsGtPdNMKHmycSssFzpR+qU2AYWeLOqgxkGvhqI9kbfY
 9LXzanGUVNpwAXKTxFv2AuQdzAEbu6LEjq1g+GctlToE+tRVL0RrecxcMhWiOhaRjR1L
 waYg==
X-Gm-Message-State: AOAM531MCtv10/Bi9ScjzyufYq6s+b89V+F1AmVLhd+AuVole4fWUkfV
 j8DSoV2bOVK+9tfqUFogzchQbpRT9VnC6A==
X-Google-Smtp-Source: ABdhPJwzNksVnscLRsGWQ/sMLUnEmTNx+V6l5FYS6hu+9disQ40iHM+W9FkLu1/L2m0H/9/zCLmRtw==
X-Received: by 2002:a17:902:8bca:b029:11d:b5c0:5677 with SMTP id
 r10-20020a1709028bcab029011db5c05677mr4826490plo.11.1623805942138; 
 Tue, 15 Jun 2021 18:12:22 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id y18sm305297pgk.53.2021.06.15.18.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 18:12:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/21] linux-user/sh4: Implement setup_sigtramp
Date: Tue, 15 Jun 2021 18:12:06 -0700
Message-Id: <20210616011209.1446045-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616011209.1446045-1-richard.henderson@linaro.org>
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create and record the two signal trampolines.
Use them when the guest does not use SA_RESTORER.

Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
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
index 0451e65806..5a5ae69785 100644
--- a/linux-user/sh4/signal.c
+++ b/linux-user/sh4/signal.c
@@ -51,7 +51,6 @@ struct target_sigframe
 {
     struct target_sigcontext sc;
     target_ulong extramask[TARGET_NSIG_WORDS-1];
-    uint16_t retcode[3];
 };
 
 
@@ -67,7 +66,6 @@ struct target_rt_sigframe
 {
     struct target_siginfo info;
     struct target_ucontext uc;
-    uint16_t retcode[3];
 };
 
 
@@ -189,15 +187,9 @@ void setup_frame(int sig, struct target_sigaction *ka,
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
@@ -247,15 +239,9 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
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
@@ -333,3 +319,21 @@ badframe:
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


