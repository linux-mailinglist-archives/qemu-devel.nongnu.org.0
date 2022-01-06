Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 658E4486333
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 11:52:47 +0100 (CET)
Received: from localhost ([::1]:44910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5QNy-0008HY-E9
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 05:52:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDb-0007qe-G9
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:42:05 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:37973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDT-0004kK-1l
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:42:02 -0500
Received: from quad ([82.142.12.178]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N1u2b-1mPjeS0iXx-012KWU; Thu, 06
 Jan 2022 11:41:53 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 23/27] linux-user/nios2: Use set_sigmask in do_rt_sigreturn
Date: Thu,  6 Jan 2022 11:41:33 +0100
Message-Id: <20220106104137.732883-24-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220106104137.732883-1-laurent@vivier.eu>
References: <20220106104137.732883-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:G1CYcwi24EKj4DBof4R5whAD+q4axTF8BdkqPd4/LM9HETQdRz1
 p9Qu1FHaQcIfOPszPbz57EuQrtp8LhBkuS19OvWw8ToQKsbbujGblzWqaCkD7XiM38cB3cn
 I3bnFyBWT4kM4OCtyyO+mw347TV+8cG9Rn5utEFnlCSC/d71M4SyIp2p+5kPXYbyQkIXQwV
 1Z7ibGtFFrnBDNKF2gkKg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kg3W/yigEMI=:lHWSmiuO1Xyi95l9MiNAMI
 VPPYvKPV6NTdzzRl7eJnJeBt1k1BvuFJY1DgIa6GZIwnxEDt1X88z3f1eydEkgRJ8sW5V7wSC
 Vci/TpPoviqwA2JlTg7CJLjRhnH7MZi/xxtQUeHzORLnm6VleAEKDa/b5tnfvSCKwvGltV2wb
 90n2uKetZUXGPsPXUMKh9JB45isX+rRkR8eZjTS15vk/BlFptK0sc2FlPX36rz97e04uYSebA
 MBZQ9i1ivt4UJAbqn8I0uLXemSiqK/QcWcdhzUE7b46JMrXOko1deTapqB8t6+K7uLvKX8zKl
 rpFJci1a6+TE3DZD1v2iLQM1xLht1YQ1jCGyBQrk3eOOigKO0aDo7ErR7xM1n2Xy11PUhB1UQ
 W6mluu033uD9dMvQFj9J8M5QDkpu7kQAxooERDYSR+1nD9FhRRHJDrYfcxXDUx7JIwX1Md/qW
 7ARfb1Is8W6umDKajAgu9wDGCJb+0r4qMRcM2mULaK1hNu06B2cUWU84At7/5EEJqMiItbUEg
 FTfZYij0FP5rSfaD1Z9a2cRaIvzzYIPEjqO504YTnYwspUKxL80UDxon15ZxPpLxFz/PtFO8y
 NooZ4j5Rn9dI0cRitAqsyJ0QdrnnS7q3EDbI7QPzWUD3EO+BdhHt760kYxIi3mmfW3E9aP3gy
 lRlKYVcOKpv3jJIgTvE0CfDZJthCH/Xg9Ea2hAUDtXgUHR5zWEEdDD7SLU4xBM9ShhnQ=
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
X-Mailman-Version: 2.1.29
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

Using do_sigprocmask directly was incorrect, as it will
leave the signal blocked by the outer layers of linux-user.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211221025012.1057923-8-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/nios2/signal.c | 2 +-
 linux-user/signal.c       | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/linux-user/nios2/signal.c b/linux-user/nios2/signal.c
index 80e3d42fc965..517cd392701c 100644
--- a/linux-user/nios2/signal.c
+++ b/linux-user/nios2/signal.c
@@ -205,7 +205,7 @@ long do_rt_sigreturn(CPUNios2State *env)
     }
 
     target_to_host_sigset(&set, &frame->uc.tuc_sigmask);
-    do_sigprocmask(SIG_SETMASK, &set, NULL);
+    set_sigmask(&set);
 
     if (rt_restore_ucontext(env, &frame->uc, &rval)) {
         goto badframe;
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 1229fecf5cd4..f813b4f18e44 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -258,7 +258,6 @@ int do_sigprocmask(int how, const sigset_t *set, sigset_t *oldset)
     return 0;
 }
 
-#if !defined(TARGET_NIOS2)
 /* Just set the guest's signal mask to the specified value; the
  * caller is assumed to have called block_signals() already.
  */
@@ -268,7 +267,6 @@ void set_sigmask(const sigset_t *set)
 
     ts->signal_mask = *set;
 }
-#endif
 
 /* sigaltstack management */
 
-- 
2.33.1


