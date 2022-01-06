Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D4F48635F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 12:01:49 +0100 (CET)
Received: from localhost ([::1]:42388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5QWi-0000jn-34
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 06:01:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDb-0007qa-Eb
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:42:05 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:36477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDS-0004k7-9w
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:42:01 -0500
Received: from quad ([82.142.12.178]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MgiPE-1mSoCy1N5I-00h2dv; Thu, 06
 Jan 2022 11:41:52 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 21/27] linux-user/nios2: Fix EA vs PC confusion
Date: Thu,  6 Jan 2022 11:41:31 +0100
Message-Id: <20220106104137.732883-22-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220106104137.732883-1-laurent@vivier.eu>
References: <20220106104137.732883-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fpma7rgrQfMkXeh/gmxujbOIZZ+gON8IEBva0thvttFJabWTRgz
 AmoD1gUIwMuMBRE9ZqtYOYoMHOvnKy8K0LmMAepdPM2VoIlcc8qOq0s5yDjs9hyPp9H/TjE
 j2smxwB4W0SdbFH0ntiWcQdJ35t9Dp8k0F07t5S3H9CcqRo84/j6y8iR38ybqzBoI5k9Sts
 4EwQeBHT9SbabDo1pQS8Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Q+38r0NksW0=:1tS/clRubEgF3TQxL3cesn
 9krz+O1NahMe+fxec3/9zevP8aXsG7SnyUIKOV7Ccxtsv064ZCmncFfzyYeBma8IKarZh8vW5
 oMe8fXjHAbc2wpIfogqYskdK7bzWVPur2w4dWNR5rmLLQdo1KmyvrzaTclQitur+ijbCIJsA2
 l8kiE5ZY7IeP5DWu8wAs5Kfsq1SwUTb0XVmUnjW+NqKnRqbzfSRPXnMELRxkDN3Qh0PbPhdvo
 zAbvAwX/BTZxZxYl8/1B/gA+uqXh/wa+0DWbVfRROu4MwjWFXTB0UW4NIhdWj37GIP25qF5qK
 T+yffcczYSHEGSmISLi++0RSqVw1JM8FK2fhphaNN4bQpF1wqCHXVCqDxUpZLfNUbhw33X+sW
 JdybWTAaMkkxeOzftkculPPmQJcruQ/5yjMaKHo8mNOPqHr9OUSuvI0EPkjyXkWFTkEWa4ORV
 1fOm91EnPOHWk0+ypNGPETrrMiD++v0N3mIcidu26wQxYlfyZdAvFJyQ7bVVaTWRy1IIvTimu
 UfGzsJMiwvgkGMIATpwgtc7c2xde81TfWQNEPgRCM6dKqn6OLGLpy3reicuUOct4eh0vwr7CG
 j3ZIse0Tj7Bc5ACyCuA8lHPn3UnCBFXYvj3FfJruyn8guPfTjE6Zw/zX4svib9Km6cdCLumKc
 duYNqNdmKWh+H70NRnkIgtLtf5K3X1DG5F0u5kysq2ez1iWSzawnxGIpzXup4VAfo7pg=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

The real kernel will talk about the user PC as EA,
because that's where the hardware will have copied it,
and where it expects to put it to then use ERET.
But qemu does not emulate all of the exception stuff
while emulating user-only.  Manipulate PC directly.

This fixes signal entry and return, and eliminates
some slight confusion from target_cpu_copy_regs.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20211221025012.1057923-6-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/nios2/cpu_loop.c | 5 +----
 linux-user/nios2/signal.c   | 6 +++---
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index de0fc63e2196..1e93ef34e649 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -155,9 +155,6 @@ void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
     env->regs[R_SP] = regs->sp;
     env->regs[R_GP] = regs->gp;
     env->regs[CR_ESTATUS] = regs->estatus;
-    env->regs[R_EA] = regs->ea;
-    /* TODO: unsigned long  orig_r7; */
-
-    /* Emulate eret when starting thread. */
     env->regs[R_PC] = regs->ea;
+    /* TODO: unsigned long  orig_r7; */
 }
diff --git a/linux-user/nios2/signal.c b/linux-user/nios2/signal.c
index adbffe32e3c8..20b65aa06e08 100644
--- a/linux-user/nios2/signal.c
+++ b/linux-user/nios2/signal.c
@@ -73,7 +73,7 @@ static void rt_setup_ucontext(struct target_ucontext *uc, CPUNios2State *env)
     __put_user(env->regs[R_RA], &gregs[23]);
     __put_user(env->regs[R_FP], &gregs[24]);
     __put_user(env->regs[R_GP], &gregs[25]);
-    __put_user(env->regs[R_EA], &gregs[27]);
+    __put_user(env->regs[R_PC], &gregs[27]);
     __put_user(env->regs[R_SP], &gregs[28]);
 }
 
@@ -122,7 +122,7 @@ static int rt_restore_ucontext(CPUNios2State *env, struct target_ucontext *uc,
     __get_user(env->regs[R_GP], &gregs[25]);
     /* Not really necessary no user settable bits */
     __get_user(temp, &gregs[26]);
-    __get_user(env->regs[R_EA], &gregs[27]);
+    __get_user(env->regs[R_PC], &gregs[27]);
 
     __get_user(env->regs[R_RA], &gregs[23]);
     __get_user(env->regs[R_SP], &gregs[28]);
@@ -181,7 +181,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     env->regs[4] = sig;
     env->regs[5] = frame_addr + offsetof(struct target_rt_sigframe, info);
     env->regs[6] = frame_addr + offsetof(struct target_rt_sigframe, uc);
-    env->regs[R_EA] = ka->_sa_handler;
+    env->regs[R_PC] = ka->_sa_handler;
 
     unlock_user_struct(frame, frame_addr, 1);
 }
-- 
2.33.1


