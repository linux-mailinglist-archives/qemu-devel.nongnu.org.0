Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 776E9383C49
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:31:22 +0200 (CEST)
Received: from localhost ([::1]:33832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lii1R-0006aW-EO
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:31:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlO-0005wX-As
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:14:46 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:56609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlC-0004MN-2X
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:14:46 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MGQWr-1lhqIN42cX-00GsAE; Mon, 17
 May 2021 20:14:31 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 10/59] linux-user: Pass CPUArchState to do_sigaltstack
Date: Mon, 17 May 2021 20:13:35 +0200
Message-Id: <20210517181424.8093-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:rUPu/Ygw+LvHp9Wjf8l2RpYT6LpUCOl6JEMc0tmqKV5B78E6zj6
 K3GtAATnkBgR1MC1UNCU89t42CR5pHZ/X5m5782YT9o8igQAi378WpzdeQ16AvlOIaNbH7r
 D1anWo6btLVOYOCrpKPf3R+frQJo4DkfapG/RaWWMLzH4GF26tCxez2xLau23Y4wccKdc8p
 pt83h5AKn4+SFQRVibvHw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OUgD/KsezNg=:0ELVijqLDOxQn7t7W0VpOi
 InhouWLt25pUedyT8bnL3LwWRBuF18Q9hu3awogNBXBSiE/OH0DwkTDC3S9+0WGOxBqUcaoNc
 GWkN80xpZJtAKXNUKkA0+9ljk9fg/XplD1/8CZ4Hxs22dG97cE4hVlUyN6q0k4s0ETh7PDK/j
 nb6o8Rv4t7bGCMN0Md4+jICBj93KhChBykC2P5hB2J8mvzwiMwaMPSFpHkY5Mtc7EDRka6WNb
 PD2iAnzZ2c2JSctN7XEWSmy69/OjAWVn/87WnwalvbhNUfR/7NY4OAhx33kwue0N2kEZJZTG2
 z+2dQmR2h9qxJtxon3G140ape9xWuNwp3CYB8VNObl3lpp6cmqhHB1jMIOvJJubAzJkoRarOf
 G1HETELeQjNnyBoSGYMr+JPB9dNa/0GMyAmLYFvJKC9xkqQid8T5mTQBBYy+R3TduWslQaPgv
 PeG9/aGGWMLeXqGJEpE0o+9ND6HtN2/h/moKWthsKj0zdaPb85Vc/2nnhfDAxhpIa1ehXFBYb
 mvI3hfG11i/ZjCsr6ZQDCs=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
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


