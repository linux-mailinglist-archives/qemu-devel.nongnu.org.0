Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3982838715D
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 07:39:11 +0200 (CEST)
Received: from localhost ([::1]:40762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lisRi-0001HN-93
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 01:39:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKT-0006jq-Fg
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:41 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:44839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKR-0006uG-Dl
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:41 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MYvHa-1lw1U11kBM-00UtMf; Tue, 18
 May 2021 07:31:37 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 10/59] linux-user: Pass CPUArchState to do_sigaltstack
Date: Tue, 18 May 2021 07:30:42 +0200
Message-Id: <20210518053131.87212-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Jw/oUiKDbNugkvf4iJbUazGAX2NzpEhAkTWc54ZKkoceoDH+qg4
 olZj7g53VYt6JD8eLQWsGDREJ9PA7YChgadWBavteBUWjLaCbcmzWGKGWgwix/yrJbQ+kR8
 NsuyFhJvmwVTlZEWOu5Clir61SrukYU1RaRH2Gzec8f2kWCrWfuDToTvq2eutWLIYAsQqpi
 3e07wrvVHkxD+N9oOZfvQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:If9dX0RJ5mc=:Xdz3KYrHF7kP5L+IOxcMLC
 Pb0/zp+EzYp4t6rzHsJazEiFXf8nLDzvW6gtAeOB1i4N7GVz85cpqDIZmUzI6V5OywtE/kCuq
 6E3HtFYFjo32tKJhwHtWO2S0IUUZ0SGVCnJLez4AZkVcZBwAUn/xdi0r2PM6XAHgd0ZvGjxRg
 5Tsj0TIRu8L0EIVwAhyOQVWQB8HIDJiIw95wVW6J4DukmHzIAMnuqbdZR7XY7FiZVR5bpRqXr
 TdQ5X+mND6RJo/89mzGrx9hHToUZMrwj7eMkzf5K7/4TPk/7pdjQOJuhGmrMogD0Q7wgUusdD
 MC8ghIU7JfBzoBy3rPwG11or7X99kjjwpylNg+2dw0c/YFrha048/oB1lNZazL+rzyq/Q2Ruk
 T3POjNNbNlNZySr40UH6+FFOe4ha/mCFvuYf5tBZ6Cqi086sdkeL9pcpkScPyftW4mWqlzczq
 ++2wmgefj9ROf0KtJW7r/vebaASc+DfK37dAozTXMuE+Yq+Y7VN6CmwMmCQkj1JB2q6q0i7Md
 112FxYEHsYKBmxKP/OeVjo=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Now that we have exactly one call, it's easy to pass
in env instead of passing in the sp value.
Use target_save_altstack, which required env.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210426025334.1168495-4-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/qemu.h    |  3 ++-
 linux-user/signal.c  | 11 ++++-------
 linux-user/syscall.c |  3 +--
 3 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 74e06e7121c5..3b0b6b75fe8f 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -432,7 +432,8 @@ int target_to_host_signal(int sig);
 int host_to_target_signal(int sig);
 long do_sigreturn(CPUArchState *env);
 long do_rt_sigreturn(CPUArchState *env);
-abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp);
+abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr,
+                        CPUArchState *env);
 int do_sigprocmask(int how, const sigset_t *set, sigset_t *oldset);
 abi_long do_swapcontext(CPUArchState *env, abi_ulong uold_ctx,
                         abi_ulong unew_ctx, abi_long ctx_size);
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 9daa89eac5db..2e1095055b7c 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -800,21 +800,18 @@ static void host_signal_handler(int host_signum, siginfo_t *info,
 
 /* do_sigaltstack() returns target values and errnos. */
 /* compare linux/kernel/signal.c:do_sigaltstack() */
-abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp)
+abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr,
+                        CPUArchState *env)
 {
     target_stack_t oss, *uoss = NULL;
     abi_long ret = -TARGET_EFAULT;
 
     if (uoss_addr) {
-        TaskState *ts = (TaskState *)thread_cpu->opaque;
-
         /* Verify writability now, but do not alter user memory yet. */
         if (!lock_user_struct(VERIFY_WRITE, uoss, uoss_addr, 0)) {
             goto out;
         }
-        __put_user(ts->sigaltstack_used.ss_sp, &oss.ss_sp);
-        __put_user(ts->sigaltstack_used.ss_size, &oss.ss_size);
-        __put_user(sas_ss_flags(sp), &oss.ss_flags);
+        target_save_altstack(&oss, env);
     }
 
     if (uss_addr) {
@@ -823,7 +820,7 @@ abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp)
         if (!lock_user_struct(VERIFY_READ, uss, uss_addr, 1)) {
             goto out;
         }
-        ret = target_restore_altstack(uss, sp);
+        ret = target_restore_altstack(uss, get_sp_from_cpustate(env));
         if (ret) {
             goto out;
         }
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 95d79ddc437a..4d52b2cfe36d 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -11195,8 +11195,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         return ret;
     }
     case TARGET_NR_sigaltstack:
-        return do_sigaltstack(arg1, arg2,
-                              get_sp_from_cpustate((CPUArchState *)cpu_env));
+        return do_sigaltstack(arg1, arg2, cpu_env);
 
 #ifdef CONFIG_SENDFILE
 #ifdef TARGET_NR_sendfile
-- 
2.31.1


