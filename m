Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D30453BE011
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 02:09:06 +0200 (CEST)
Received: from localhost ([::1]:45088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0v7h-0002D8-Qe
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 20:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0upQ-0001wA-I1
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:50:12 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:43907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0up9-0006hE-I7
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:50:12 -0400
Received: by mail-pg1-x532.google.com with SMTP id o18so384221pgu.10
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 16:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+jVFzflzGymDZrI1ZoMIgTCB/1BSyil5/+M6JPmFwtc=;
 b=RqHn1ecFuSdrWAHUFWjD6xuV93TMVllL5lkfak3aXPq0AoiDCwPPIVWoRZrHwXHW5+
 ZJjCPkqrCybaDSgoGXPGy827fiK6BS9WC5Y9VixkEGTqg1x/Wwnvtl6xS2ZSxIPDmgRM
 uk6MYM+3q/r4WOLvfOyiK7Adhw/llnnscMFHfQEwceeGsXp5iSyezGz17J+H8mFASu5f
 tcd76k9kzukkeYhTiQlkSe2YWrKGd4uxCed5ipfrDJEaB4mcBxkCMQ3gqsuyFcG7/Zom
 SmJh6BdAv+gfvg49rCaezf46lMVtJWGPF+oCYTmgr/liivFKdKmkbxp0Ee0ClCcBrP5v
 jqEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+jVFzflzGymDZrI1ZoMIgTCB/1BSyil5/+M6JPmFwtc=;
 b=jUCKbzMvaKJCYoW54pmu7+8b8+c0zjG5rCni9iIP3lAWwUcJxvYnFNCsTGurgEf16c
 pm09IJ77anjCpRjZNkaZZGa4jimXc7k6Yczh9URj2RfcVjhMuHIERVh1Ye22sjza/psf
 J/0zDAcN4QyXvfM1GDs0DkkdC1QEbKuEVIAtOaB+dEHuBzvEvW3zMdhhaheVd/YjISsL
 TBQWLEjOuMfZjNXx8AKGhDlfz8+bn2TaYKVlRDUkYXNBtrXIXVD2Xs+GqqPgPU4HBVFv
 2DqY2iq6DwW3FcPbVTHOtP6JoAda9OHYADkZRb+5xa2YAYCwJ9wjEH3ovkP7xWnmCEan
 6cdA==
X-Gm-Message-State: AOAM532y5faxEeFGThaS+42SC3VvBmn+jzV7sOSQIsF+G3TNpk5s/xlR
 oZyVSVUgu46zjxqcwaq7Yskuk7mMncsFeA==
X-Google-Smtp-Source: ABdhPJz71YnaWT10o4Dl97VyWRsGCvt+FC5BzdVs2+AXTYIfrLemocP5dMSngio4F4u1nDRVsj6RMw==
X-Received: by 2002:a65:63ce:: with SMTP id n14mr23080785pgv.273.1625615394360; 
 Tue, 06 Jul 2021 16:49:54 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b3sm18058114pfi.179.2021.07.06.16.49.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 16:49:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 33/36] linux-user/s390x: Implement setup_sigtramp
Date: Tue,  6 Jul 2021 16:49:29 -0700
Message-Id: <20210706234932.356913-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210706234932.356913-1-richard.henderson@linaro.org>
References: <20210706234932.356913-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: qemu-s390x@nongnu.org, alex.bennee@linaro.org, laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create and record the two signal trampolines.
Use them when the guest does not use SA_RESTORER.

Cc: qemu-s390x@nongnu.org
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/s390x/target_signal.h |  2 ++
 linux-user/s390x/signal.c        | 24 ++++++++++++++++--------
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/linux-user/s390x/target_signal.h b/linux-user/s390x/target_signal.h
index bbfc464d44..64f5f42201 100644
--- a/linux-user/s390x/target_signal.h
+++ b/linux-user/s390x/target_signal.h
@@ -19,4 +19,6 @@ typedef struct target_sigaltstack {
 #include "../generic/signal.h"
 
 #define TARGET_ARCH_HAS_SETUP_FRAME
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
 #endif /* S390X_TARGET_SIGNAL_H */
diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index bf8a8fbfe9..18b1997f1e 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -67,7 +67,6 @@ typedef struct {
     target_sigregs sregs;
     int signo;
     target_sigregs_ext sregs_ext;
-    uint16_t retcode;
 } sigframe;
 
 #define TARGET_UC_VXRS 2
@@ -84,7 +83,6 @@ struct target_ucontext {
 
 typedef struct {
     uint8_t callee_used_stack[__SIGNAL_FRAMESIZE];
-    uint16_t retcode;
     struct target_siginfo info;
     struct target_ucontext uc;
 } rt_sigframe;
@@ -208,9 +206,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
     if (ka->sa_flags & TARGET_SA_RESTORER) {
         restorer = ka->sa_restorer;
     } else {
-        restorer = frame_addr + offsetof(sigframe, retcode);
-        __put_user(S390_SYSCALL_OPCODE | TARGET_NR_sigreturn,
-                   &frame->retcode);
+        restorer = default_sigreturn;
     }
 
     /* Set up registers for signal handler */
@@ -261,9 +257,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     if (ka->sa_flags & TARGET_SA_RESTORER) {
         restorer = ka->sa_restorer;
     } else {
-        restorer = frame_addr + offsetof(typeof(*frame), retcode);
-        __put_user(S390_SYSCALL_OPCODE | TARGET_NR_rt_sigreturn,
-                   &frame->retcode);
+        restorer = default_rt_sigreturn;
     }
 
     /* Create siginfo on the signal stack. */
@@ -404,3 +398,17 @@ long do_rt_sigreturn(CPUS390XState *env)
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint16_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 2 + 2, 0);
+    assert(tramp != NULL);
+
+    default_sigreturn = sigtramp_page;
+    __put_user(S390_SYSCALL_OPCODE | TARGET_NR_sigreturn, &tramp[0]);
+
+    default_rt_sigreturn = sigtramp_page + 2;
+    __put_user(S390_SYSCALL_OPCODE | TARGET_NR_rt_sigreturn, &tramp[1]);
+
+    unlock_user(tramp, sigtramp_page, 2 + 2);
+}
-- 
2.25.1


