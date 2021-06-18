Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCDB3AD308
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 21:41:24 +0200 (CEST)
Received: from localhost ([::1]:33180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luKMl-0007Wx-NF
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 15:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKBu-0001iz-4x
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:30:14 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:39768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKBo-0001ZW-PG
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:30:09 -0400
Received: by mail-pl1-x632.google.com with SMTP id o21so5193506pll.6
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 12:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NC4wjKEI8ei8zXE+8oh5v+0BndNCvCJb6FftDxcNOnE=;
 b=T4b3zjm0jvUgmrtHPiEx74l1HZZC6n7bYilccyY3ECmRzfdVL+oGYlndRJCa5P5jeB
 uJS/6R519bzMeuU+ALMMGUecghY8xsopn83C8EEOUJBHYHucbWgT2RXZIQT8sbW5Az+u
 FECcffJnwW+3f89wJRjujB/UKIceweW7xxTO8KA6vGNMb2zUIybWGI4kBTUb2qLvCF8w
 H1BcBO/mj/r1MXvI/Ktovo0A3482XGm0/GMZAo4YlFYvNnnY1lUI0qUPWYUiRHsuNgNj
 FAlUHU3HXZLAeVaeIA4qn15ipn55Oc/YviLnDXEcfgfYYBoL5ymwvVknd5ejxMhQUqYB
 y6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NC4wjKEI8ei8zXE+8oh5v+0BndNCvCJb6FftDxcNOnE=;
 b=ayuFdT0KIyU+1QoRCyDvSNqGIkZsIhLjLZt0nbNjbAZjFx7AZtVHNd0F0BsGFn7eHa
 72oT7wPFTcqHYiIYvQb9Nyzs06DPsYvAG1F5hprq0nejB2Q3RIw2D3M+nF5baMv4Z1zp
 mYiJwRecFgefv78vh4YIrdpIxfEO9SLCGqP8HEwYQl8Y4Xn5MH7ydeUXaj4PD5AUkxKv
 HspJpEdbb9ZMNbcI1coi/uCTmOX1nHE1Pvatlu6ek/HIxSScyufGX99tdAqbzpXXloSi
 RUDFX5XGbNmIG5QNmonOjI5Eu7NWdskQdiu/ki0LbsGStemQaSjj1soh3AM/r8KyDHzO
 ijyg==
X-Gm-Message-State: AOAM532VqKUOC7MxLw+aDY1Tf2LaHqvuPNvC8B9TPQ/dpyXtOauOtAC5
 uaQUmkWebz1JjrdTkJcJzUJFBKbqfTpjQA==
X-Google-Smtp-Source: ABdhPJwn+IAI2hY1PjFvy8oMMSUEJgP4X7nIWI8sav7It6g/wak85VVNBUEUkusHp9xH4Vn3ltUnWw==
X-Received: by 2002:a17:90a:ce8b:: with SMTP id
 g11mr11728706pju.170.1624044603556; 
 Fri, 18 Jun 2021 12:30:03 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 92sm11938234pjv.29.2021.06.18.12.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 12:30:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/23] linux-user/s390x: Implement setup_sigtramp
Date: Fri, 18 Jun 2021 12:29:47 -0700
Message-Id: <20210618192951.125651-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618192951.125651-1-richard.henderson@linaro.org>
References: <20210618192951.125651-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
index ef136dae33..372861d6d8 100644
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
@@ -200,9 +198,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
     if (ka->sa_flags & TARGET_SA_RESTORER) {
         restorer = ka->sa_restorer;
     } else {
-        restorer = frame_addr + offsetof(sigframe, retcode);
-        __put_user(S390_SYSCALL_OPCODE | TARGET_NR_sigreturn,
-                   &frame->retcode);
+        restorer = default_sigreturn;
     }
 
     /* Set up registers for signal handler */
@@ -253,9 +249,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     if (ka->sa_flags & TARGET_SA_RESTORER) {
         restorer = ka->sa_restorer;
     } else {
-        restorer = frame_addr + offsetof(typeof(*frame), retcode);
-        __put_user(S390_SYSCALL_OPCODE | TARGET_NR_rt_sigreturn,
-                   &frame->retcode);
+        restorer = default_rt_sigreturn;
     }
 
     /* Create siginfo on the signal stack. */
@@ -377,3 +371,17 @@ long do_rt_sigreturn(CPUS390XState *env)
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


