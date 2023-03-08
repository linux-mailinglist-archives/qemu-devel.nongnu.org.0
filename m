Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9936B094D
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 14:34:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZtsW-0003DD-73; Wed, 08 Mar 2023 08:30:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtqx-0001hW-NQ
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:12 -0500
Received: from mout.kundenserver.de ([212.227.17.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtqv-00065X-OH
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:11 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mj831-1qEkJq36Iv-00f9vt; Wed, 08
 Mar 2023 14:29:07 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 13/28] linux-user: Emulate CLONE_PIDFD flag in clone()
Date: Wed,  8 Mar 2023 14:28:42 +0100
Message-Id: <20230308132857.161793-14-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308132857.161793-1-laurent@vivier.eu>
References: <20230308132857.161793-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:vzTXupv3oZ6QX7fYicY4rF1TH7pIV4mYhUqwhARE5D6hskIBAtk
 bS5hl0nFB4uQaouWNZsuA+5vRJWOpaXqrg07GhNt+a/yn2nTrzLKzGMdVRdRMvdEhIhLBMK
 M2fXhiPbzYev7jB9t0vYH56WRZtkLoLb4juYH2ou46zX+C8j1j0x7xgQBWGFHUxWjKeM8RX
 xlTx3HR5UtXZZCd3dp+vA==
UI-OutboundReport: notjunk:1;M01:P0:PdeuOIq5vd4=;tM/kwzGfOxKpIiTYz110UIN04yX
 cL84H4kiTHn1TpVqDda7a2HPf5UpgkRsc/IBdUq6Y31+3+oRufcAsTDvvGrLkofUN3r5z23Fw
 goGtr/bS/iKq6dTFEREyfNR2IXWsqCG5WmDb9dhPctMJZlxfWeIdfWaCfhWxoJMzJmyBaG6Od
 Lhafy+oGgei8pJFf+6gH9BspEFE0nM1Ad09oDTlgY1EPhGxeqErPQahIAzM0RpPiQJ5Ul3+te
 S/xfLKC1eNZ6GKVhqSXRUJbBVf7ovvTl0lLJZpJ+YFq6PPaBhWR0y5H53XiJu9aNWdrGket/Y
 umQmtxPv1KrHm97wHmPl8gqs497GAnH/geePS7sh1NRT5iJT30aD27qofu7xi4Z0Bw/Z3uQEn
 Mv7c38pBCWyVNnug+b8TzVVwgyYq9fc7Umceobmjo1as/cF4j+HzQwods8irsPSvvR5OC4O8a
 pX8k+0w3EJE3rxMhGZl6WMEde+Iwr4gEF8fIy4bt9W4y8NigphNI/OeNuzk2TCdnO4thKPk9n
 Zxu/QMqZE9TIjzb5oFNtrNPBrdv/cePZ1jBp07UpoPnCFrkbMd7NFVSlMJm5N/Cd+UlxMjea6
 2VsH7RRzzSE4dFW8l/0e/8dsKBSpoCCuAMeJ7vINmiODaY/FacYF60d/yWY5Y8bDh5p2bE2gL
 6Hs+SrrpoJh5lkhAxLBj2oMoi4kf7VJwCC/q5iuYuQ==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Helge Deller <deller@gmx.de>

Add emulation for the CLONE_PIDFD flag of the clone() syscall.
This flag was added in Linux kernel 5.2.

Successfully tested on a x86-64 Linux host with hppa-linux target.
Can be verified by running the testsuite of the qcoro debian package,
which breaks hard and kills the currently logged-in user without this
patch.

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>

Message-Id: <Y4XoJCpvUA1JD7Sj@p100>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.c  |  1 +
 linux-user/syscall.c | 27 ++++++++++++++++++++++++++-
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index e9757ed9adee..5eff70d7727b 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -1116,6 +1116,7 @@ UNUSED static const struct flags clone_flags[] = {
     FLAG_GENERIC(CLONE_FS),
     FLAG_GENERIC(CLONE_FILES),
     FLAG_GENERIC(CLONE_SIGHAND),
+    FLAG_GENERIC(CLONE_PIDFD),
     FLAG_GENERIC(CLONE_PTRACE),
     FLAG_GENERIC(CLONE_VFORK),
     FLAG_GENERIC(CLONE_PARENT),
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 44498e9e8ac7..374e115dab13 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -171,7 +171,7 @@
 
 /* Flags for fork which we can implement within QEMU itself */
 #define CLONE_OPTIONAL_FORK_FLAGS               \
-    (CLONE_SETTLS | CLONE_PARENT_SETTID |       \
+    (CLONE_SETTLS | CLONE_PARENT_SETTID | CLONE_PIDFD | \
      CLONE_CHILD_CLEARTID | CLONE_CHILD_SETTID)
 
 /* Flags for thread creation which we can implement within QEMU itself */
@@ -6730,6 +6730,17 @@ static int do_fork(CPUArchState *env, unsigned int flags, abi_ulong newsp,
             return -TARGET_EINVAL;
         }
 
+#if !defined(__NR_pidfd_open) || !defined(TARGET_NR_pidfd_open)
+        if (flags & CLONE_PIDFD) {
+            return -TARGET_EINVAL;
+        }
+#endif
+
+        /* Can not allow CLONE_PIDFD with CLONE_PARENT_SETTID */
+        if ((flags & CLONE_PIDFD) && (flags & CLONE_PARENT_SETTID)) {
+            return -TARGET_EINVAL;
+        }
+
         if (block_signals()) {
             return -QEMU_ERESTARTSYS;
         }
@@ -6757,6 +6768,20 @@ static int do_fork(CPUArchState *env, unsigned int flags, abi_ulong newsp,
                 ts->child_tidptr = child_tidptr;
         } else {
             cpu_clone_regs_parent(env, flags);
+            if (flags & CLONE_PIDFD) {
+                int pid_fd = 0;
+#if defined(__NR_pidfd_open) && defined(TARGET_NR_pidfd_open)
+                int pid_child = ret;
+                pid_fd = pidfd_open(pid_child, 0);
+                if (pid_fd >= 0) {
+                        fcntl(pid_fd, F_SETFD, fcntl(pid_fd, F_GETFL)
+                                               | FD_CLOEXEC);
+                } else {
+                        pid_fd = 0;
+                }
+#endif
+                put_user_u32(pid_fd, parent_tidptr);
+                }
             fork_end(0);
         }
         g_assert(!cpu_in_exclusive_context(cpu));
-- 
2.39.2


