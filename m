Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D04383CA0
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:45:50 +0200 (CEST)
Received: from localhost ([::1]:46868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liiFR-0000s6-7u
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:45:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlc-0006W9-GS
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:00 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:45613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlM-0004RU-OZ
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:00 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MqJVd-1l4drQ15Vb-00nOmz; Mon, 17
 May 2021 20:14:39 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 24/59] linux-user/sparc: Clean up get_sigframe
Date: Mon, 17 May 2021 20:13:49 +0200
Message-Id: <20210517181424.8093-25-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:CzjXPKmQAoA2UnakUWiAOkJLwWyM9ENLxvn73I8LyshK2AcsCGn
 bfuSPcRRJ5c7eisIeqq/snOAr804kQQ/pe94leo70KXzYhEOlG48GpYgfdYYata55hFfTUV
 EpbFQNwKiFkJvfdf+/0VIXjV+5hGcWAnlvahuHNMJSd3LxRXzMQWCsy76+rxEYNnB72zGR9
 zl7R8B8l/kqpVmvRwRPWg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5mTBrKKH7+o=:h7jtk4oAzeexTHa0lVX9iQ
 A4LrFYk34YRzH/KMRtkZOmLj+OkrVUdwYTPx7VirXKSfbECoXAMDyaeDZ2dN5eU9VHpPb1Byv
 oY5gWuR37ytYHsxghfCOoJ8SOPrLy6U4v4uUDrUNQvyaKRcoeMBSW+6fcu6X5khSJVzbF0zxf
 dvH4q3uZ2Wq4AFmbMkZY4oach7jNJSfeVjyxtHKL6tgWpVn2nWVy+hBN+CX9aVZ8DCv8wJWjq
 Mi3CHoOwgoOGyTRFKo0bg5N8ryIafjEh2Ul0lWUeRKMktXFNrylOOg+JAMqDOOlrYCt8rWsLv
 95WfYdplr5W6RmBFRcqOm44htO1w+zJf6oEu7dUm29mfq1D5zN2rRApyv3dvq9qtxAEqA9N8B
 sCxGjyzLtCvbtAtrtFzxfvcei/Q+3QLX0WLp57kJHER4gh+jbZjCpmA734CXvDwDWfecL86h5
 XQy9mOj/KQhuGFvVSwf6+FcNcmWGhtCLqvxp9TcNYnwr2fOy+brq+0ez/Lh0PGb2xpYT54md7
 z4W7f8AL2wNkXydILHA728=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
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
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Remove inline; fix spacing and comment format.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210426025334.1168495-18-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/signal.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index 69fee5a76a8b..57dbc72c9949 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -65,24 +65,25 @@ struct target_signal_frame {
     qemu_siginfo_fpu_t fpu_state;
 };
 
-static inline abi_ulong get_sigframe(struct target_sigaction *sa, 
-                                     CPUSPARCState *env,
-                                     unsigned long framesize)
+static abi_ulong get_sigframe(struct target_sigaction *sa,
+                              CPUSPARCState *env,
+                              size_t framesize)
 {
     abi_ulong sp = get_sp_from_cpustate(env);
 
     /*
      * If we are on the alternate signal stack and would overflow it, don't.
      * Return an always-bogus address instead so we will die with SIGSEGV.
-         */
+     */
     if (on_sig_stack(sp) && !likely(on_sig_stack(sp - framesize))) {
-            return -1;
+        return -1;
     }
 
     /* This is the X/Open sanctioned signal stack switching.  */
     sp = target_sigsp(sp, sa) - framesize;
 
-    /* Always align the stack frame.  This handles two cases.  First,
+    /*
+     * Always align the stack frame.  This handles two cases.  First,
      * sigaltstack need not be mindful of platform specific stack
      * alignment.  Second, if we took this signal because the stack
      * is not aligned properly, we'd like to take the signal cleanly
-- 
2.31.1


