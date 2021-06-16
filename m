Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF3A3A8E5C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:29:27 +0200 (CEST)
Received: from localhost ([::1]:57428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltKMw-0007El-QJ
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:29:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltK6Y-0005eY-MH
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:12:31 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:56178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltK6Q-0008Tw-Tu
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:12:28 -0400
Received: by mail-pj1-x1031.google.com with SMTP id k7so708770pjf.5
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 18:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=otFWOjo25PTZrmQ0CApLXIVYdTYiSF7ILSCJjVsE2Vk=;
 b=xIho14J9VZccF0xdHT0ReBhRINvgIEW8gbG06REgcdgBcmlXtBECTT/OvCS56DsKvT
 xlFC3Nlrh3rxB70ojUTr1m9mcNXEqKFNIRUeeUZfyriIPv9BkS5BgWcYHUmDwSF0y6mV
 3m1iHnhlH1Dz0S7ThASFke1yb+KLKMOzSb1HqTKqaDzbVRO12MpCWuFwgBp3s+3Pxd+4
 cnTlhgvccA4bgzsz+SrHgcIrgf+YAsJBR3HFPtJkd3TN8K4fmEj5NtPZa5VcB/Ygr5UV
 JOuYqfRJW+UwNswS0tev6W3kITjkNA54HNf/5L+8MTIFdRN9uZWzh86HK7Xa0ixP5S7O
 cwhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=otFWOjo25PTZrmQ0CApLXIVYdTYiSF7ILSCJjVsE2Vk=;
 b=uadCWGheuJ8IXubte+h2hxzvQDF1zgX9JTt2nGygrrQYmuOwgd1okLBCbuObsiix69
 /SWAGy3ElxhM6l9YS4OmUCGqN/vCnUT1X505uO/lJf80KGXKv7idIqQJuyALFgJIUncF
 CLKfXpevSaVY+Ojmt6MgoIoqPdNJ7oOKDjQfgBTRCXOYslv6/oCftA6y6KnubuAbgztI
 ECPa8G0Hhylg+Qycr8AJDq4zmtwp5H/9Q47M63Q2xQUTCJzfQiMkbpUeYpil/HSYfNE8
 VCNhlwLjUwYJ1p5p7IL4UgLvJlkJeZeu9YqVyQhg5JymDinomllk0X7BZrG+PBqBWy/Z
 r3EA==
X-Gm-Message-State: AOAM530EWDyFZ/WH+DeYOKBIiXAoiDQtK+4cmWYnwso1d94qcsJ5khpr
 B2Y7b8pFeFXfH+GRFAn55BJtbDavGtxDRA==
X-Google-Smtp-Source: ABdhPJz12L0OLusJAXjRVhh+ckAonad7OxHZbMeXwsvs9YnssvAE6qXdWBxHwb+xqTPjnE7k+N5yHw==
X-Received: by 2002:a17:90b:305:: with SMTP id ay5mr7819478pjb.0.1623805941588; 
 Tue, 15 Jun 2021 18:12:21 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id y18sm305297pgk.53.2021.06.15.18.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 18:12:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/21] linux-user/s390x: Implement setup_sigtramp
Date: Tue, 15 Jun 2021 18:12:05 -0700
Message-Id: <20210616011209.1446045-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616011209.1446045-1-richard.henderson@linaro.org>
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: qemu-s390x@nongnu.org, alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create and record the two signal trampolines.
Use them when the guest does not use SA_RESTORER.

Cc: qemu-s390x@nongnu.org
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
index ef136dae33..806c09f921 100644
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
+    uint16_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 4, 0);
+    assert(tramp != NULL);
+
+    default_sigreturn = sigtramp_page;
+    __put_user(S390_SYSCALL_OPCODE | TARGET_NR_sigreturn, &tramp[0]);
+
+    default_rt_sigreturn = sigtramp_page + 2;
+    __put_user(S390_SYSCALL_OPCODE | TARGET_NR_rt_sigreturn, &tramp[1]);
+
+    unlock_user(tramp, sigtramp_page, 4);
+}
-- 
2.25.1


