Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A65B7387186
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 07:58:44 +0200 (CEST)
Received: from localhost ([::1]:57896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liskd-0006xU-Iy
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 01:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKt-0007vm-HF
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:07 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:47293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKn-0007AD-2r
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:07 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MyNoa-1lZ2aU1DNU-00yizy; Tue, 18
 May 2021 07:31:54 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 41/59] linux-user/s390x: Clean up single-use gotos in signal.c
Date: Tue, 18 May 2021 07:31:13 +0200
Message-Id: <20210518053131.87212-42-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:C3gE75Od+oBlcgxFppGkxt2dL7Z0AMF9LS8MklpEC8D1PK1mJi1
 l/+rhdctnjhg0S4oqNasxvO2NpbEgDaTvAheXU59umjBxpOGjSekvCPelFQ2btGehBsrDu2
 jMjbbglauUeyzJSsuoiGIaJwBdI3DQAc1iBks1HyCAGAUi8vr8hxBNkBFw0BLmkR2R4olGW
 eATN/A/XJe0nwp4fLsoxA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ONp4jwaAAuc=:IzeJRHYI2l0As8CnS6qxGI
 KGH5XRSdPYFe67z3ArhYjhEfmziSIJWqQiJ+AqTSXK1raR4tyYWRkyBuSHeyZHSwCrCmnsq0C
 KY2sO2UpSI76UqO8QlzFVDcb7L1xtFEdXL8msK75fUmVGyM5/XvJpsH3hIjWHlkViZUbk8ukd
 JJc4UWGpSzHu3Hbt7PIrnlDBGe3DcJJYc6bXQGIbD9NttVuklo2UMTgr2Dq5IK3SIRUaXegj4
 dZb3cETXY2UXyvC74pTQRAaq+ViV/IM/7Ms/iWhjkAr59uqIYT3dZzU1xL5ZZmLn4utUN8BIZ
 i5dg9Glc1ePNnFwhRPepBQzqBhyRw01hLacqWUVnNR1gbyc9QsL5HEUmtGqdknW4EeI88e62t
 PhGrjJrYrQo0T/lCPxNoBQ3J5ckF59UHqQAJVEMrtsH72+xjFmPkwMdphCVCcNHG00+i3F7GV
 GDrQlh0EjI4BlgcZ1ube/t2OtQTnWHItObyHt4+zGxEqNymeGiTecLHt+w3fJEFCY8vr/JwJM
 oKrAAgMkhlf2UxdwnsShMM=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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


