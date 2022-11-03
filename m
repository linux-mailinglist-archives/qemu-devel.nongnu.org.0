Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BEF61804C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 15:58:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqbes-0000sV-Vs; Thu, 03 Nov 2022 10:57:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sir@cmpwn.com>) id 1oqbep-0000rg-TD
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 10:57:27 -0400
Received: from out-211.mta0.migadu.com ([91.218.175.211])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sir@cmpwn.com>) id 1oqben-0004kA-99
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 10:57:27 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cmpwn.com; s=key1;
 t=1667487442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Yju7kUqadQp8sitN8jI3Pn5CCNyfTqfPJCZ7HzAZRXA=;
 b=Pz7kiPrEYP7SVZ/XM60WGFokgvpzPb2VgBdcZbt/vlN0HNAg7r82zlw/B1+Olj47kQC4P8
 je3Unu7ye+Vm3ZUuhROn5Ai3McswQN4Z7EZaVJRBXU6+uvK2AHkHUsDV0bBky5VXQbuRM6
 0TBz+uxT9cm2e5id/TVuQ2YcYaxwrPplgCOTRYUhbJrwncUq7hmpl2VnyR3XRhhYBGi6VQ
 DN/v7YpI7sSyQh2VDiVb5yRHZn7SeeWZ9drwVLTE1FrQVEZGR8nL57+qNB3IdWM/+XIOWQ
 IaIt3W1Tl84Sk7Ok8ImRQzgfy/+rw8yo04ZKRcO/RXt8Wrgqd9YyztghsM08Sw==
From: Drew DeVault <sir@cmpwn.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: Drew DeVault <sir@cmpwn.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2] linux-user: implement execveat
Date: Thu,  3 Nov 2022 15:57:19 +0100
Message-Id: <20221103145719.3470738-1-sir@cmpwn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=91.218.175.211; envelope-from=sir@cmpwn.com;
 helo=out-211.mta0.migadu.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
 linux-user/syscall.c | 204 +++++++++++++++++++++++--------------------
 1 file changed, 111 insertions(+), 93 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index f55cdebee5..57f0b2f0e8 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -633,7 +633,12 @@ safe_syscall4(pid_t, wait4, pid_t, pid, int *, status, int, options, \
 #endif
 safe_syscall5(int, waitid, idtype_t, idtype, id_t, id, siginfo_t *, infop, \
               int, options, struct rusage *, rusage)
+#if defined(TARGET_NR_execveat)
+safe_syscall5(int, execveat, int, dirfd, const char *, filename,
+        char **, argv, char **, envp, int, flags)
+#else
 safe_syscall3(int, execve, const char *, filename, char **, argv, char **, envp)
+#endif
 #if defined(TARGET_NR_select) || defined(TARGET_NR__newselect) || \
     defined(TARGET_NR_pselect6) || defined(TARGET_NR_pselect6_time64)
 safe_syscall6(int, pselect6, int, nfds, fd_set *, readfds, fd_set *, writefds, \
@@ -8281,6 +8286,107 @@ static int do_openat(CPUArchState *cpu_env, int dirfd, const char *pathname, int
     return safe_openat(dirfd, path(pathname), flags, mode);
 }
 
+static int do_execveat(CPUArchState *cpu_env, int dirfd, abi_long pathname, abi_long guest_argp, abi_long guest_envp, int flags)
+{
+    int ret;
+    char **argp, **envp;
+    int argc, envc;
+    abi_ulong gp;
+    abi_ulong addr;
+    char **q;
+    void *p;
+
+    argc = 0;
+
+    for (gp = guest_argp; gp; gp += sizeof(abi_ulong)) {
+        if (get_user_ual(addr, gp))
+            return -TARGET_EFAULT;
+        if (!addr)
+            break;
+        argc++;
+    }
+    envc = 0;
+    for (gp = guest_envp; gp; gp += sizeof(abi_ulong)) {
+        if (get_user_ual(addr, gp))
+            return -TARGET_EFAULT;
+        if (!addr)
+            break;
+        envc++;
+    }
+
+    argp = g_new0(char *, argc + 1);
+    envp = g_new0(char *, envc + 1);
+
+    for (gp = guest_argp, q = argp; gp;
+          gp += sizeof(abi_ulong), q++) {
+        if (get_user_ual(addr, gp))
+            goto execve_efault;
+        if (!addr)
+            break;
+        if (!(*q = lock_user_string(addr)))
+            goto execve_efault;
+    }
+    *q = NULL;
+
+    for (gp = guest_envp, q = envp; gp;
+          gp += sizeof(abi_ulong), q++) {
+        if (get_user_ual(addr, gp))
+            goto execve_efault;
+        if (!addr)
+            break;
+        if (!(*q = lock_user_string(addr)))
+            goto execve_efault;
+    }
+    *q = NULL;
+
+    /* Although execve() is not an interruptible syscall it is
+     * a special case where we must use the safe_syscall wrapper:
+     * if we allow a signal to happen before we make the host
+     * syscall then we will 'lose' it, because at the point of
+     * execve the process leaves QEMU's control. So we use the
+     * safe syscall wrapper to ensure that we either take the
+     * signal as a guest signal, or else it does not happen
+     * before the execve completes and makes it the other
+     * program's problem.
+     */
+    if (!(p = lock_user_string(pathname)))
+        goto execve_efault;
+
+#if defined(TARGET_NR_execveat)
+    ret = get_errno(safe_execveat(dirfd, p, argp, envp, flags));
+#else
+    assert(dirfd == AT_FDCWD && flags == 0);
+    ret = get_errno(safe_execve(p, argp, envp));
+#endif
+
+    unlock_user(p, pathname, 0);
+
+    goto execve_end;
+
+execve_efault:
+    ret = -TARGET_EFAULT;
+
+execve_end:
+    for (gp = guest_argp, q = argp; *q;
+          gp += sizeof(abi_ulong), q++) {
+        if (get_user_ual(addr, gp)
+            || !addr)
+            break;
+        unlock_user(*q, addr, 0);
+    }
+    for (gp = guest_envp, q = envp; *q;
+          gp += sizeof(abi_ulong), q++) {
+        if (get_user_ual(addr, gp)
+            || !addr)
+            break;
+        unlock_user(*q, addr, 0);
+    }
+
+    g_free(argp);
+    g_free(envp);
+    return ret;
+}
+
 #define TIMER_MAGIC 0x0caf0000
 #define TIMER_MAGIC_MASK 0xffff0000
 
@@ -8748,101 +8854,13 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
         ret = get_errno(unlinkat(arg1, p, arg3));
         unlock_user(p, arg2, 0);
         return ret;
+#endif
+#if defined(TARGET_NR_execveat)
+    case TARGET_NR_execveat:
+        return do_execveat(cpu_env, arg1, arg2, arg3, arg4, arg5);
 #endif
     case TARGET_NR_execve:
-        {
-            char **argp, **envp;
-            int argc, envc;
-            abi_ulong gp;
-            abi_ulong guest_argp;
-            abi_ulong guest_envp;
-            abi_ulong addr;
-            char **q;
-
-            argc = 0;
-            guest_argp = arg2;
-            for (gp = guest_argp; gp; gp += sizeof(abi_ulong)) {
-                if (get_user_ual(addr, gp))
-                    return -TARGET_EFAULT;
-                if (!addr)
-                    break;
-                argc++;
-            }
-            envc = 0;
-            guest_envp = arg3;
-            for (gp = guest_envp; gp; gp += sizeof(abi_ulong)) {
-                if (get_user_ual(addr, gp))
-                    return -TARGET_EFAULT;
-                if (!addr)
-                    break;
-                envc++;
-            }
-
-            argp = g_new0(char *, argc + 1);
-            envp = g_new0(char *, envc + 1);
-
-            for (gp = guest_argp, q = argp; gp;
-                  gp += sizeof(abi_ulong), q++) {
-                if (get_user_ual(addr, gp))
-                    goto execve_efault;
-                if (!addr)
-                    break;
-                if (!(*q = lock_user_string(addr)))
-                    goto execve_efault;
-            }
-            *q = NULL;
-
-            for (gp = guest_envp, q = envp; gp;
-                  gp += sizeof(abi_ulong), q++) {
-                if (get_user_ual(addr, gp))
-                    goto execve_efault;
-                if (!addr)
-                    break;
-                if (!(*q = lock_user_string(addr)))
-                    goto execve_efault;
-            }
-            *q = NULL;
-
-            if (!(p = lock_user_string(arg1)))
-                goto execve_efault;
-            /* Although execve() is not an interruptible syscall it is
-             * a special case where we must use the safe_syscall wrapper:
-             * if we allow a signal to happen before we make the host
-             * syscall then we will 'lose' it, because at the point of
-             * execve the process leaves QEMU's control. So we use the
-             * safe syscall wrapper to ensure that we either take the
-             * signal as a guest signal, or else it does not happen
-             * before the execve completes and makes it the other
-             * program's problem.
-             */
-            ret = get_errno(safe_execve(p, argp, envp));
-            unlock_user(p, arg1, 0);
-
-            goto execve_end;
-
-        execve_efault:
-            ret = -TARGET_EFAULT;
-
-        execve_end:
-            for (gp = guest_argp, q = argp; *q;
-                  gp += sizeof(abi_ulong), q++) {
-                if (get_user_ual(addr, gp)
-                    || !addr)
-                    break;
-                unlock_user(*q, addr, 0);
-            }
-            for (gp = guest_envp, q = envp; *q;
-                  gp += sizeof(abi_ulong), q++) {
-                if (get_user_ual(addr, gp)
-                    || !addr)
-                    break;
-                unlock_user(*q, addr, 0);
-            }
-
-            g_free(argp);
-            g_free(envp);
-        }
-        return ret;
+        return do_execveat(cpu_env, AT_FDCWD, arg1, arg2, arg3, 0);
     case TARGET_NR_chdir:
         if (!(p = lock_user_string(arg1)))
             return -TARGET_EFAULT;
-- 
2.38.1


