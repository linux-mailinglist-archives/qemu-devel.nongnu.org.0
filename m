Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8FD6131D6
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 09:42:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opQLs-0008Ge-7n; Mon, 31 Oct 2022 04:41:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sir@cmpwn.com>) id 1opQLq-0008GA-2S
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 04:40:58 -0400
Received: from out2.migadu.com ([188.165.223.204])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sir@cmpwn.com>) id 1opQLn-0002tW-Qv
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 04:40:57 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cmpwn.com; s=key1;
 t=1667205651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=oKcRtyCbzqUAOI8QIWvqJZz2Nx+SnU7AvnSuOVI2hcA=;
 b=SGpEtQLhu18srSpeB5UkmxrHBk8l4QckIp2IVMpqWXRB/4ylt528+l3Vp2a/O6lvCmL8QO
 RVni0SHc+zmBii9KTNHmpWQuRZiizfrSjbNBWe3gnaw0FJoSIYB5LicQLZ329cC7ihzABa
 nbtyu4F4LDzhsVRAYkXGcwNPjcolet6PXXMfAEiIvj+Huw13wODq1NBizAJXuUHjXiX4fg
 hwfOLmZD/6LmnnetWKuP2HuljHoU97yYWZGABmVO9CRd3+mXZ1qnNlIiZI/5d5zdOxIIvU
 zOa+m2UWY7RTqW5T+sYiiAV4yGSwGmehvzsg5O24oaZ6leYT3fUjLXViDkjs0w==
From: Drew DeVault <sir@cmpwn.com>
To: qemu-devel@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Cc: Drew DeVault <sir@cmpwn.com>
Subject: [PATCH] linux-user: implement execveat
Date: Mon, 31 Oct 2022 09:40:30 +0100
Message-Id: <20221031084030.2125288-1-sir@cmpwn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=188.165.223.204; envelope-from=sir@cmpwn.com;
 helo=out2.migadu.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

References: https://gitlab.com/qemu-project/qemu/-/issues/1007
Signed-off-by: Drew DeVault <sir@cmpwn.com>
---
 linux-user/syscall.c | 50 ++++++++++++++++++++++++++++++++++++++------
 1 file changed, 44 insertions(+), 6 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index f55cdebee5..795f7ce4cd 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -634,6 +634,10 @@ safe_syscall4(pid_t, wait4, pid_t, pid, int *, status, int, options, \
 safe_syscall5(int, waitid, idtype_t, idtype, id_t, id, siginfo_t *, infop, \
               int, options, struct rusage *, rusage)
 safe_syscall3(int, execve, const char *, filename, char **, argv, char **, envp)
+#if defined(TARGET_NR_execveat)
+safe_syscall5(int, execveat, int, dirfd, const char *, filename,
+        char **, argv, char **, envp, int, flags)
+#endif
 #if defined(TARGET_NR_select) || defined(TARGET_NR__newselect) || \
     defined(TARGET_NR_pselect6) || defined(TARGET_NR_pselect6_time64)
 safe_syscall6(int, pselect6, int, nfds, fd_set *, readfds, fd_set *, writefds, \
@@ -8748,19 +8752,45 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
         ret = get_errno(unlinkat(arg1, p, arg3));
         unlock_user(p, arg2, 0);
         return ret;
+#endif
+#if defined(TARGET_NR_execveat)
+    case TARGET_NR_execveat:
 #endif
     case TARGET_NR_execve:
         {
             char **argp, **envp;
-            int argc, envc;
+            int argc, envc, dirfd, flags;
             abi_ulong gp;
             abi_ulong guest_argp;
             abi_ulong guest_envp;
             abi_ulong addr;
+            abi_long path;
             char **q;
 
             argc = 0;
-            guest_argp = arg2;
+
+            switch (num) {
+            case TARGET_NR_execve:
+                path = arg1;
+                guest_argp = arg2;
+                guest_envp = arg3;
+                dirfd = AT_FDCWD;
+                flags = 0;
+                break;
+#if defined(TARGET_NR_execveat)
+            case TARGET_NR_execveat:
+                dirfd = arg1;
+                path = arg2;
+                guest_argp = arg3;
+                guest_envp = arg4;
+                flags = arg5;
+                break;
+#endif
+            default:
+                // squelch uninitialized variable warnings
+                abort();
+            }
+
             for (gp = guest_argp; gp; gp += sizeof(abi_ulong)) {
                 if (get_user_ual(addr, gp))
                     return -TARGET_EFAULT;
@@ -8769,7 +8799,6 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
                 argc++;
             }
             envc = 0;
-            guest_envp = arg3;
             for (gp = guest_envp; gp; gp += sizeof(abi_ulong)) {
                 if (get_user_ual(addr, gp))
                     return -TARGET_EFAULT;
@@ -8803,7 +8832,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
             }
             *q = NULL;
 
-            if (!(p = lock_user_string(arg1)))
+            if (!(p = lock_user_string(path)))
                 goto execve_efault;
             /* Although execve() is not an interruptible syscall it is
              * a special case where we must use the safe_syscall wrapper:
@@ -8815,8 +8844,17 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
              * before the execve completes and makes it the other
              * program's problem.
              */
-            ret = get_errno(safe_execve(p, argp, envp));
-            unlock_user(p, arg1, 0);
+            switch (num) {
+            case TARGET_NR_execve:
+                ret = get_errno(safe_execve(p, argp, envp));
+                break;
+#if defined(TARGET_NR_execveat)
+            case TARGET_NR_execveat:
+                ret = get_errno(safe_execveat(dirfd, p, argp, envp, flags));
+                break;
+#endif
+            }
+            unlock_user(p, path, 0);
 
             goto execve_end;
 
-- 
2.38.1


