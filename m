Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CC43BE012
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 02:09:15 +0200 (CEST)
Received: from localhost ([::1]:45860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0v7p-0002i5-R4
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 20:09:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0upS-00023i-Pp
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:50:14 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:33745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0upA-0006hY-5h
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:50:14 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 mn20-20020a17090b1894b02901707fc074e8so2493322pjb.0
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 16:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7UwSZzPtNanlmWoP6K+UEdnWrT6YCBYNNgPR1NCdYPw=;
 b=XsDwZV/YpjqcFdfJOFx+NKndj/S+eTsUTY6ypj7C3sOTdqGQ2TWbRgvmfdN475hSci
 lYEUa/kOC3dJsEGusTjZpZD301JnKwf+rycH4cox+UUghe/maRof+LfYT1USRh7F6YuG
 JKdQQeZHgOALUf8ImxkC2GSfeLU+C2Q8iEQ2kqDjb0do04AttZPRC8wAG5wnwnb991xc
 oNkA6iDYLMwkxl7i0GVVL+zIkXAoINzpY+uEH5PVCoY2tJd5zsPQ7+aDMOjcJKbYuFjG
 6uUS7Kf0BOeht3x4/Lre3KSIUZ0ufTj44aLdV+z9P1HACNJRDWI8PgPjVb2LesAE/ef0
 cWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7UwSZzPtNanlmWoP6K+UEdnWrT6YCBYNNgPR1NCdYPw=;
 b=bbZLopOynOOuNDrzWdUyUEYWhX+1Gt+ymY0dxXrGl5zc7I3wlbPPbZ1X1sT/7NJkwF
 lH31jyZKxSsE0/h203GZUabitMOn+t93glRinobh2jxRoHBSsPsJ9o19xQ8pocd417h/
 OauDFmr00Excy6ba1Qy+Q1/cUA4AhOaP1hufBSTFLzejFkFHfg1+7hB+tkU0MM5jNn1E
 QaIe/I3vIubZdNu0UkV1Ah5Z5i3fqDnT4NPTmuiUseSMjp17eOZwB9TkFGgYe58tyIZF
 pQVEaXPYDKwC3aQvIuY66eRmlKGppZnrwK7csISGvVF73XS0sUxaF/VvJYrlsa7HYYLL
 pR6Q==
X-Gm-Message-State: AOAM532LxCh42RDrwbke3hjhPi5gRLalspq2rpG3Hji2eLJwyCQM2o+t
 2VtH98vN5jSsloQ/AMOzV73GJ+QG8l8rsw==
X-Google-Smtp-Source: ABdhPJwdogDab2Uqo8Kh0fi3crURTEdNiWkk+ylbKJEUCXgTQtPF2265w0J5RODnj4vKya7qxaeKww==
X-Received: by 2002:a17:90a:8c87:: with SMTP id
 b7mr2888091pjo.230.1625615394989; 
 Tue, 06 Jul 2021 16:49:54 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b3sm18058114pfi.179.2021.07.06.16.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 16:49:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 34/36] linux-user/sh4: Implement setup_sigtramp
Date: Tue,  6 Jul 2021 16:49:30 -0700
Message-Id: <20210706234932.356913-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210706234932.356913-1-richard.henderson@linaro.org>
References: <20210706234932.356913-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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


