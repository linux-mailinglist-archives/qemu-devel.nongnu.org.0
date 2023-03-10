Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0776B53F6
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 23:12:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pakvn-0008FA-Ob; Fri, 10 Mar 2023 17:09:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvl-0008Dv-6K
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:41 -0500
Received: from mout.kundenserver.de ([212.227.17.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvj-000328-Bg
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:40 -0500
Received: from quad ([82.64.211.94]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MxVbb-1qTPyY05Rx-00xoOI; Fri, 10
 Mar 2023 23:09:35 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Helge Deller <deller@gmx.de>
Subject: [PULL 13/28] linux-user: Emulate CLONE_PIDFD flag in clone()
Date: Fri, 10 Mar 2023 23:09:12 +0100
Message-Id: <20230310220927.326606-14-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310220927.326606-1-laurent@vivier.eu>
References: <20230310220927.326606-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:GvON6A3EF/oi0Cbxf72sNTEAcsDhL6RbOybPA4GkObzkQmVPmKf
 WPE6Xtzl7BLjrInpSHDp4tjMxFkh8V1jolZH9xHto2J6jJHtMRBdyf9ZYFRC2PQlKf6cgIx
 Jwh/M1CUNUT1OtjtoSlZJ2pt1iC0nJ0fu56lsuBLSbSClCiDlq1H9SJQX+eNaqjhYhujsoM
 V63oi7yHxPKHbTiEeNldQ==
UI-OutboundReport: notjunk:1;M01:P0:9ZMAy8/KItI=;JKHdV4aIQD+KMEaKWrHoR8AzjrB
 2diKdykXgM3JPmEs2UMWATVsEkeanqitxwAF8BYG71MUsCYOMIzF6QuPJARdNjS0jUcPdgN4l
 wWloxeDP3mFh3YG+h4GMIZeU1psleMPsGn1NrkSCrf1tLNpDAPukwfFciChdIHX1prjtqWaTO
 8Ln7BT9OtwWIdBdvf1MCI2Zbw9puYqtI8meG30xnJw/xt26j81Wu5K4xou7HuDoD8Oa5IVuuv
 mT6XaCOSyuaYCgUDyE482GiveoMHtsV9H6Q5+kc/8Ox3NBsn2LBh4swwmJB9s22rnSmr9AwnT
 4NPqcJLbR9vB+j23Cy2Y7qHRS/sT66E4c4FGmM6WjXxlLds5wVrAYqqKhX9gGNQ/GX8oJ7Qfx
 Lf6nRpR5pB8vrevEfc0BtEuCtBl8dUfdZd8BiHfk827lJiKNO88i+shYTZvG8dx2bUAsjpCOB
 cc0jCVZeqaCmvA6B+M2hsRqs/FiWEp6081G0y4gE+BpBtAQoAWrPVZOBX2wkEYzVLkuJ89ltP
 HVoQU9/Y8fzY8n6ox1c+khQtRteU+IT9hmIc8kq5QaaIbLtFGHNhPyvgg5CaQ/sTZ71eiDUEi
 p4gPFtFUHHhjjxf8PzjI4XTMJQ3MuExyto75I39JSyN7elzu+68sqIPlb9UDj+wLhwurAm/64
 8ofgKN/ApM5mENKKgISeihHzdW8EO69R/WCbIN49Mg==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
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
[lv: define CLONE_PIDFD if it is not]
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.c  |  5 +++++
 linux-user/syscall.c | 31 ++++++++++++++++++++++++++++++-
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index e08bd53afb48..aad2b62ca416 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -1111,11 +1111,16 @@ UNUSED static const struct flags mmap_flags[] = {
     FLAG_END,
 };
 
+#ifndef CLONE_PIDFD
+# define CLONE_PIDFD 0x00001000
+#endif
+
 UNUSED static const struct flags clone_flags[] = {
     FLAG_GENERIC(CLONE_VM),
     FLAG_GENERIC(CLONE_FS),
     FLAG_GENERIC(CLONE_FILES),
     FLAG_GENERIC(CLONE_SIGHAND),
+    FLAG_GENERIC(CLONE_PIDFD),
     FLAG_GENERIC(CLONE_PTRACE),
     FLAG_GENERIC(CLONE_VFORK),
     FLAG_GENERIC(CLONE_PARENT),
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index dad2c3312032..24cea6fb6a63 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -169,9 +169,13 @@
 #define CLONE_IGNORED_FLAGS                     \
     (CLONE_DETACHED | CLONE_IO)
 
+#ifndef CLONE_PIDFD
+# define CLONE_PIDFD 0x00001000
+#endif
+
 /* Flags for fork which we can implement within QEMU itself */
 #define CLONE_OPTIONAL_FORK_FLAGS               \
-    (CLONE_SETTLS | CLONE_PARENT_SETTID |       \
+    (CLONE_SETTLS | CLONE_PARENT_SETTID | CLONE_PIDFD | \
      CLONE_CHILD_CLEARTID | CLONE_CHILD_SETTID)
 
 /* Flags for thread creation which we can implement within QEMU itself */
@@ -6730,6 +6734,17 @@ static int do_fork(CPUArchState *env, unsigned int flags, abi_ulong newsp,
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
@@ -6757,6 +6772,20 @@ static int do_fork(CPUArchState *env, unsigned int flags, abi_ulong newsp,
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


