Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3222742071A
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:13:32 +0200 (CEST)
Received: from localhost ([::1]:33404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJ6J-0007P5-7A
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:13:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mXIeR-0004K7-TH; Mon, 04 Oct 2021 03:44:43 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:36429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mXIeO-0004uM-MJ; Mon, 04 Oct 2021 03:44:43 -0400
Received: from quad ([82.142.3.114]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MysmQ-1mjrew1vjG-00w0V6; Mon, 04
 Oct 2021 09:44:36 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 21/26] linux-user/s390x: Implement setup_sigtramp
Date: Mon,  4 Oct 2021 09:44:16 +0200
Message-Id: <20211004074421.3141222-22-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004074421.3141222-1-laurent@vivier.eu>
References: <20211004074421.3141222-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:c30x3yUmnq8Umz5Jiv9UEsmawYcGms+lxlyFGWhYKfqkKjvF5i/
 b/0UJNaHtB2njBXLFQIt0RmodO/UaOLE9MHwetgL7sAq+T61qPXQ0qDrKoQHQzvQY9+WYmO
 zyMnO+g4IKofj/x2wzj7lNn6/bYHdC+VRhUaL8LO5iu/I6Q8khcHSsd2YGRIsGS8GRptME3
 w3miAhemiy06MZoq2bV8A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NIgMMTv4LDg=:l6bhVuCLN/AH4Dv9D4GxmF
 Z2BreH4FdN5pCnTLTmK5H+AHCP7eFOB04IkLLPC16Vt8wZB94Cwq69GRwOWEf/WX7PmRzZL9o
 nbs7DXizH4EkDkzd/CQv+tkx9xTLlDhoN3eGeqKSjiqX5+drf44yENUeBUErFftnHS1fp6j/v
 4K1oD88DnPojqzz95/vALdfj6znpkfwUzgkHQjMT5h80ZuViWxEXCLFPuDZLYXGaXCzTzD67l
 8kIb8G6TIh/3cFDQpU3sH4LmRZo9+nD4apNECu1AiaDknSKe9mMZbUaV4+5VA8B/3q3rsj7V5
 yAz+9LWiElUW5C3V+0zR+w7tN0HjEQ1ZqVvZjszuznFHDcIWBbsZwlWxVetpF80kgB0jDnkQl
 nIcgYtN6p7U2RYot50Ra5tDzHSmzOH+j1isEvycz8uAPr9d4Oma8GDU4uMvxUuNizTzZXLkxX
 RGWJYJPjwhwSlcX5lbQ/fepUS5gpZntnCdzo9deM7qx7jWxtNYeFeETZ4ESS4+hUv5Xm/6KZ4
 f+ihI/9NYC3KmLqLjPf/WTLTeHbirHE6HgGngulzb9pBxk5ThQOCDQC+AMsqnd3wNSLxjoWEe
 EciuYlyYz+p7iKZKB3N02G1D1YmsX8eBA/LQRO5dyAKwB2jOvJMnAKDwAeI7rFdNa0wKPBfEt
 U1dIAfX1GpQCO3kEC+8UQAqPYzB/uFKeg7o/iokfzqT/0phKcZamGWhPw/wDiQEUFcP8jgpYs
 j4uyGQfsnUA/hG+du2LYCPCZK4QCf/cMHbzN2w==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Create and record the two signal trampolines.
Use them when the guest does not use SA_RESTORER.

Cc: qemu-s390x@nongnu.org
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210929130553.121567-22-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/s390x/signal.c        | 24 ++++++++++++++++--------
 linux-user/s390x/target_signal.h |  2 ++
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index 80f34086d7b5..676b94814769 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -68,7 +68,6 @@ typedef struct {
     target_sigregs sregs;
     int signo;
     target_sigregs_ext sregs_ext;
-    uint16_t retcode;
 } sigframe;
 
 #define TARGET_UC_VXRS 2
@@ -85,7 +84,6 @@ struct target_ucontext {
 
 typedef struct {
     uint8_t callee_used_stack[__SIGNAL_FRAMESIZE];
-    uint16_t retcode;
     struct target_siginfo info;
     struct target_ucontext uc;
 } rt_sigframe;
@@ -209,9 +207,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
     if (ka->sa_flags & TARGET_SA_RESTORER) {
         restorer = ka->sa_restorer;
     } else {
-        restorer = frame_addr + offsetof(sigframe, retcode);
-        __put_user(S390_SYSCALL_OPCODE | TARGET_NR_sigreturn,
-                   &frame->retcode);
+        restorer = default_sigreturn;
     }
 
     /* Set up registers for signal handler */
@@ -262,9 +258,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     if (ka->sa_flags & TARGET_SA_RESTORER) {
         restorer = ka->sa_restorer;
     } else {
-        restorer = frame_addr + offsetof(typeof(*frame), retcode);
-        __put_user(S390_SYSCALL_OPCODE | TARGET_NR_rt_sigreturn,
-                   &frame->retcode);
+        restorer = default_rt_sigreturn;
     }
 
     /* Create siginfo on the signal stack. */
@@ -405,3 +399,17 @@ long do_rt_sigreturn(CPUS390XState *env)
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
diff --git a/linux-user/s390x/target_signal.h b/linux-user/s390x/target_signal.h
index bbfc464d4417..64f5f422010f 100644
--- a/linux-user/s390x/target_signal.h
+++ b/linux-user/s390x/target_signal.h
@@ -19,4 +19,6 @@ typedef struct target_sigaltstack {
 #include "../generic/signal.h"
 
 #define TARGET_ARCH_HAS_SETUP_FRAME
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
 #endif /* S390X_TARGET_SIGNAL_H */
-- 
2.31.1


