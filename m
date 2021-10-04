Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3372E4206E0
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 09:57:14 +0200 (CEST)
Received: from localhost ([::1]:58262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXIqX-0001U1-6x
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 03:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeJ-000422-H2
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:35 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:34195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeG-0004lt-01
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:33 -0400
Received: from quad ([82.142.3.114]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N3omW-1mxauL3WlM-00zjVI; Mon, 04
 Oct 2021 09:44:29 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 11/26] linux-user/x86_64: Raise SIGSEGV if SA_RESTORER not set
Date: Mon,  4 Oct 2021 09:44:06 +0200
Message-Id: <20211004074421.3141222-12-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004074421.3141222-1-laurent@vivier.eu>
References: <20211004074421.3141222-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+mQEQfC0509EGqg/4LAdEazqc+ZehDxXmp1nPzsudUqmL4bkkOB
 pqjUi7IBvfyNi3OjHcIzMMqAIM4qVtQwvRVKRLh/ZrY7XWeK5J+2tMyxNJkRjQd8R0aM9i4
 wXU3jeHreFia/t59MFS4Ml14S4bU0I1CjJs1TzX20cbuOzLytMRkYmNtb0VgSgL9U42REZv
 CppibBYnTaUzdZCuB6vhQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:r2e8AkzkGss=:1W7KQWCGhFyeaMZ1eGzZUu
 wpvxRcqq+K1m04Ki1UGnZuBZzbTFjlSF5WcmUon/VEiIZVaEfjKn3WftjO6EalQTWmceRn+KW
 Ko8lz9krYpuMPgsoqHIQsklbgLkh757lHlEr/0DFsWaaNnxeY2QXVpM79uZIijkfxPVAH6inT
 rc/39qdeRIbYEz7OAxB9KkAUg1gQksbvOk8eNq72dH9zQVXBl6WnkPoJqSXVYh6KWVhGnGiyE
 8SG1JFpasGJ0lBzF68teJTSD/8fuQidXpUjvWftXjlnRdTCT/0xIyHHzjB3x/VCzfZXreRdmd
 PFkR6TTCncUzMVf9paSRU+Ng43R8Mm0zS3V8aV4tTBtsjVYj41PJE4Lt0E5hW/vWbl+CJXHj3
 2ElVg8sVXIdH0KXUKlW1zrDp3aTRGH8qvVhIlndmm0oZZIcvO0459mfKhNyRcVi8e74Zi1iCt
 qs9RpOx9xWs/vEuErhkGnaz80WePPYoefLouujOKohOOyUZHZRI1ogBUpTB+d5+WILTI+sCF4
 r8dk0ihoGpJDlNNxXrR8LqcQNzRoWAze6tXe+h7EKNBnyj0DFh/q4UVp5jV76osQnYzlORHRN
 XssW82T52jUbr1LpvdnO81DsWGFTKe/0Zc40sep7zxxTBNNMujc21WQ7CY1N8diGHvyxy8Cnq
 7KVVxqDdMw5GioN8oal0jXuXqCri/29fOwocZbQb5Cm2nPd9C1uK89iAjyvXm0Xy6i9wYaBJn
 GRIJEn0FnRr+HDXy8YbW3+p2Oj86+OwVBXvGuA==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

This has been a fixme for some time.  The effect of
returning -EFAULT from the kernel code is to raise SIGSEGV.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210929130553.121567-12-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/i386/signal.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/linux-user/i386/signal.c b/linux-user/i386/signal.c
index b38b5f108eaf..433efa3d693b 100644
--- a/linux-user/i386/signal.c
+++ b/linux-user/i386/signal.c
@@ -421,19 +421,18 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 
     /* Set up to return from userspace.  If provided, use a stub
        already in userspace.  */
-#ifndef TARGET_X86_64
     if (ka->sa_flags & TARGET_SA_RESTORER) {
         __put_user(ka->sa_restorer, &frame->pretcode);
     } else {
+#ifdef TARGET_X86_64
+        /* For x86_64, SA_RESTORER is required ABI.  */
+        goto give_sigsegv;
+#else
         /* This is no longer used, but is retained for ABI compatibility. */
         install_rt_sigtramp(frame->retcode);
         __put_user(default_rt_sigreturn, &frame->pretcode);
-    }
-#else
-    /* XXX: Would be slightly better to return -EFAULT here if test fails
-       assert(ka->sa_flags & TARGET_SA_RESTORER); */
-    __put_user(ka->sa_restorer, &frame->pretcode);
 #endif
+    }
 
     /* Set up registers for signal handler */
     env->regs[R_ESP] = frame_addr;
-- 
2.31.1


