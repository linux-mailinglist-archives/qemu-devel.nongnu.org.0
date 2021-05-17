Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE91F383CAD
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:50:12 +0200 (CEST)
Received: from localhost ([::1]:35712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liiJf-0003u9-NC
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:50:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlg-0006jX-DS
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:05 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:54961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlU-0004Wr-BB
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:04 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MpTpc-1l8EMF1xr2-00ptfR; Mon, 17
 May 2021 20:14:47 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 40/59] linux-user/s390x: Tidy save_sigregs
Date: Mon, 17 May 2021 20:14:05 +0200
Message-Id: <20210517181424.8093-41-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:L+pOqaZU5qHZ9ZrlCwBDda0rr6kvzomzgFwGDGxRtRqWSrBjdGk
 75in70yKMBDowbyO8yzk2aVH8uQE94N+FzFmkG6OFEr6AHUGN7Wmb5bqxMZHlgABmeO54nf
 VfPCDqDMoc3GP+xCxmbnZLwg/4elZsTjFnAwWsnoUgmLorf1i6bP3S9+UEjKS0os+no7KEA
 RvCRa4rgzL/lEVCH1Qymg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BBjbWLZH9EM=:I66kj5DLtEODNIExcc6gKf
 uGPIMTryOvD9CEjIPeJRfyyc8pjDe4KKKL7FtJTqN5/XPMtoDLrO3DLYGZk6XhcCLE/qp08x0
 lNGtS1L+4acDZXLCidWx+N3XXf3BxpE+Bsk/BCVuvAdT6AoB9tIaxmLdAFwwYDjqjcc+hnW8/
 WB3r3qT572DbKm53EfSuc5Ic80lMbwQkP14yQF4Grsj89sMxkjD0S+Xrx7bkKkrDcP761wlOJ
 N2D+ZjVUICokBBFTWOgs+XLJAYppDZuY5nKaAxL13dAEDYcky3dgfHR4AA3DXULVpFlKGxuyn
 Wa9I4PU33zey5gkgKwn+M/qmW5mDh6+26mqSzmJZqPTqkB59k0vaz0izE8HX+y7nMRxaTf3V2
 NFmD9x74146rZFI6Qy3sw92Gp0hKERoxMd0yeNlE69cNV6B1ORPC3m/2ZbWBxvCgSgn251T2+
 LjZ4ve/M1utAVuqPyZ1QvuUOIKic2aYfOKbhE4KbG06YlEaBPr8dETowuRUSrLIZtQEKyYCOq
 sgusOD16nU/Z9Ss87BfH3A=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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

The "save" routines copied from the kernel, which are currently
commented out, are unnecessary in qemu.  We can copy from env
where the kernel needs special instructions.  Fix comment style.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210428193408.233706-9-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/s390x/signal.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index 4dde55d4d518..eabfe4293f9f 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -104,23 +104,25 @@ get_sigframe(struct target_sigaction *ka, CPUS390XState *env, size_t frame_size)
 static void save_sigregs(CPUS390XState *env, target_sigregs *sregs)
 {
     int i;
-    //save_access_regs(current->thread.acrs); FIXME
 
-    /* Copy a 'clean' PSW mask to the user to avoid leaking
-       information about whether PER is currently on.  */
+    /*
+     * Copy a 'clean' PSW mask to the user to avoid leaking
+     * information about whether PER is currently on.
+     */
     __put_user(env->psw.mask, &sregs->regs.psw.mask);
     __put_user(env->psw.addr, &sregs->regs.psw.addr);
+
     for (i = 0; i < 16; i++) {
         __put_user(env->regs[i], &sregs->regs.gprs[i]);
     }
     for (i = 0; i < 16; i++) {
         __put_user(env->aregs[i], &sregs->regs.acrs[i]);
     }
+
     /*
      * We have to store the fp registers to current->thread.fp_regs
      * to merge them with the emulated registers.
      */
-    //save_fp_regs(&current->thread.fp_regs); FIXME
     for (i = 0; i < 16; i++) {
         __put_user(*get_freg(env, i), &sregs->fpregs.fprs[i]);
     }
-- 
2.31.1


