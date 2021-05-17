Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDDF383CAB
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:48:36 +0200 (CEST)
Received: from localhost ([::1]:57128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liiI5-0007kc-KJ
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:48:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlr-0006nS-Bt
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:21 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:57287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlU-0004Wu-Bt
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:15 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M3Eqr-1lmIGY41fx-003aMm; Mon, 17
 May 2021 20:14:48 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 41/59] linux-user/s390x: Clean up single-use gotos in signal.c
Date: Mon, 17 May 2021 20:14:06 +0200
Message-Id: <20210517181424.8093-42-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ilrnnnC5J5fI9oV+YIibZK5eVVf7TGREUj2ZxLh21OaAx0gpdrv
 ptr7dcq+wxUEghMVylRGphCeJ7J4ajYdzTBiwV8JLRAvujepknezdGjYXy9tg7Z48p/XeDw
 HpZW1F6ekNd5a5F5mfK8QBNRDRIiZirF6YtHtilCW9D4LmQQAQPQ3bsl2Oz0AsNfdkAsAfg
 k27Tc5jRrQ7rI/g8mSAfg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wF1GGlIzGXU=:N/pgLkJkOfjJWW2c9FhNbm
 rz0farZ2aeY1Z5C8sAZXQuATuJEKneFuK37vshP2JQNwHyvRh4+VcwT7kFXJasQMkh6CZSwyU
 25j7ySHbAyI2bUbMdXGmpn2axsW5PehiS/x8Q2/4VtnBMulSvsbDoe865ydAHHbTY5Y+h94Gh
 23WSjJ+0P/r8NTI37KUpRXAkJRd9efNjmTHioe3jv0JEKf77rxEbN3u0Fg2r8QSQZZ/2qg6kj
 SsxG6B4+4rjJ/A0pbZ2B8bH8m2Y1E0Vyoq99AFBz1+lvVCWk1JJQMfijYSJOSoQzFF0Zmjy1+
 Irt6TC1cZhG7LFl1xDevrMZD8fo8e9nYCobGwhqpeHbzxlJZNGpE6YVbqT/CjnsRNT9LXQYdf
 HXfuNx/q++uJGUGCbsWXfM7ylIXgptHXIXyo7Y2ScgHZfiKKij7W04doau+P6JND5v0kDdDqP
 k2zCWRbwokYQwE320lctp94S09dQDjMkQmK+PNt/I0fN+99WX+7C70RFDS8MWgIBNr5ffvXEy
 Zcq3P4NnLnNDUQ7QZSiCjY=
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
 Laurent Vivier <laurent@vivier.eu>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210428193408.233706-10-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/s390x/signal.c | 29 ++++++++---------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index eabfe4293f9f..64a9eab09770 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -137,7 +137,8 @@ void setup_frame(int sig, struct target_sigaction *ka,
     frame_addr = get_sigframe(ka, env, sizeof(*frame));
     trace_user_setup_frame(env, frame_addr);
     if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0)) {
-        goto give_sigsegv;
+        force_sigsegv(sig);
+        return;
     }
 
     __put_user(set->sig[0], &frame->sc.oldmask[0]);
@@ -174,10 +175,6 @@ void setup_frame(int sig, struct target_sigaction *ka,
     /* Place signal number on stack to allow backtrace from handler.  */
     __put_user(env->regs[2], &frame->signo);
     unlock_user_struct(frame, frame_addr, 1);
-    return;
-
-give_sigsegv:
-    force_sigsegv(sig);
 }
 
 void setup_rt_frame(int sig, struct target_sigaction *ka,
@@ -190,7 +187,8 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     frame_addr = get_sigframe(ka, env, sizeof *frame);
     trace_user_setup_rt_frame(env, frame_addr);
     if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0)) {
-        goto give_sigsegv;
+        force_sigsegv(sig);
+        return;
     }
 
     tswap_siginfo(&frame->info, info);
@@ -222,10 +220,6 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     env->regs[2] = sig; //map_signal(sig);
     env->regs[3] = frame_addr + offsetof(typeof(*frame), info);
     env->regs[4] = frame_addr + offsetof(typeof(*frame), uc);
-    return;
-
-give_sigsegv:
-    force_sigsegv(sig);
 }
 
 static void restore_sigregs(CPUS390XState *env, target_sigregs *sc)
@@ -259,7 +253,8 @@ long do_sigreturn(CPUS390XState *env)
 
     trace_user_do_sigreturn(env, frame_addr);
     if (!lock_user_struct(VERIFY_READ, frame, frame_addr, 1)) {
-        goto badframe;
+        force_sig(TARGET_SIGSEGV);
+        return -TARGET_QEMU_ESIGRETURN;
     }
     __get_user(target_set.sig[0], &frame->sc.oldmask[0]);
 
@@ -270,10 +265,6 @@ long do_sigreturn(CPUS390XState *env)
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
-
-badframe:
-    force_sig(TARGET_SIGSEGV);
-    return -TARGET_QEMU_ESIGRETURN;
 }
 
 long do_rt_sigreturn(CPUS390XState *env)
@@ -284,7 +275,8 @@ long do_rt_sigreturn(CPUS390XState *env)
 
     trace_user_do_rt_sigreturn(env, frame_addr);
     if (!lock_user_struct(VERIFY_READ, frame, frame_addr, 1)) {
-        goto badframe;
+        force_sig(TARGET_SIGSEGV);
+        return -TARGET_QEMU_ESIGRETURN;
     }
     target_to_host_sigset(&set, &frame->uc.tuc_sigmask);
 
@@ -296,9 +288,4 @@ long do_rt_sigreturn(CPUS390XState *env)
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
-
-badframe:
-    unlock_user_struct(frame, frame_addr, 0);
-    force_sig(TARGET_SIGSEGV);
-    return -TARGET_QEMU_ESIGRETURN;
 }
-- 
2.31.1


