Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB47E61927C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 09:12:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqrn0-0007Pe-NS; Fri, 04 Nov 2022 04:10:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sir@cmpwn.com>) id 1oqrmx-0007MM-Pp
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 04:10:56 -0400
Received: from out-94.mta0.migadu.com ([2001:41d0:1004:224b::5e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sir@cmpwn.com>) id 1oqrmr-0000Qi-KZ
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 04:10:52 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cmpwn.com; s=key1;
 t=1667549416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=/B4mMgn1ZcNNyIfTJAGQxMoHLJAIGWbEf2SJpfdpR2A=;
 b=N+aFT4kDfMHCgqU9vRzI8Tl5niFVKhaBQt6xXlb0GBuoO+wB90d/2ucphauCmbKetpbamW
 /lZY93E9UQYV0VJ3T6qsFx13uYks1XHGVzobFxFRkBeEovZ1PWANb4qbo52UpcqjAAoRBS
 ub9SQo6AjwuS9zAoFOqHQWl2HyV03B/gQQNWcyoO2Dc/H05woKAGAZalIFrgE1v4+wytsI
 zN9rmRVhayaoUjN8xvsBEJ+wK3xsICpVPVh/VLqqY5Tcz3c7Q2KIQAsPMAkyIJOq7Rp9XU
 muB3LFTWSlEAU/mX7jHQEU67yHsVoLmWXDSrPB5dygoAptl5DUdUZKFHMsW+lw==
From: Drew DeVault <sir@cmpwn.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: Drew DeVault <sir@cmpwn.com>, qemu-devel@nongnu.org,
 "Helge Deller" <deller@gmx.de>
Subject: [PATCH v4] linux-user: implement execveat
Date: Fri,  4 Nov 2022 09:10:15 +0100
Message-Id: <20221104081015.706009-1-sir@cmpwn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=2001:41d0:1004:224b::5e;
 envelope-from=sir@cmpwn.com; helo=out-94.mta0.migadu.com
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
v3 => v4: implement strace for execveat

 linux-user/strace.c    |  91 +++++++++++-------
 linux-user/strace.list |   2 +-
 linux-user/syscall.c   | 203 +++++++++++++++++++++--------------------
 3 files changed, 165 insertions(+), 131 deletions(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 9ae5a812cd..4d1a14b88f 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -616,38 +616,6 @@ print_semctl(CPUArchState *cpu_env, const struct syscallname *name,
 }
 #endif
 
-static void
-print_execve(CPUArchState *cpu_env, const struct syscallname *name,
-             abi_long arg1, abi_long arg2, abi_long arg3,
-             abi_long arg4, abi_long arg5, abi_long arg6)
-{
-    abi_ulong arg_ptr_addr;
-    char *s;
-
-    if (!(s = lock_user_string(arg1)))
-        return;
-    qemu_log("%s(\"%s\",{", name->name, s);
-    unlock_user(s, arg1, 0);
-
-    for (arg_ptr_addr = arg2; ; arg_ptr_addr += sizeof(abi_ulong)) {
-        abi_ulong *arg_ptr, arg_addr;
-
-        arg_ptr = lock_user(VERIFY_READ, arg_ptr_addr, sizeof(abi_ulong), 1);
-        if (!arg_ptr)
-            return;
-    arg_addr = tswapal(*arg_ptr);
-        unlock_user(arg_ptr, arg_ptr_addr, 0);
-        if (!arg_addr)
-            break;
-        if ((s = lock_user_string(arg_addr))) {
-            qemu_log("\"%s\",", s);
-            unlock_user(s, arg_addr, 0);
-        }
-    }
-
-    qemu_log("NULL})");
-}
-
 #ifdef TARGET_NR_ipc
 static void
 print_ipc(CPUArchState *cpu_env, const struct syscallname *name,
@@ -1136,6 +1104,16 @@ UNUSED static struct flags clone_flags[] = {
     FLAG_END,
 };
 
+UNUSED static struct flags execveat_flags[] = {
+#ifdef AT_EMPTY_PATH
+    FLAG_GENERIC(AT_EMPTY_PATH),
+#endif
+#ifdef AT_SYMLINK_NOFOLLOW
+    FLAG_GENERIC(AT_SYMLINK_NOFOLLOW),
+#endif
+    FLAG_END,
+};
+
 UNUSED static struct flags msg_flags[] = {
     /* send */
     FLAG_GENERIC(MSG_CONFIRM),
@@ -1969,6 +1947,55 @@ print_execv(CPUArchState *cpu_env, const struct syscallname *name,
 }
 #endif
 
+static void
+print_execve_argv(abi_long argv, int last)
+{
+    abi_ulong arg_ptr_addr;
+    char *s;
+
+    qemu_log("{");
+    for (arg_ptr_addr = argv; ; arg_ptr_addr += sizeof(abi_ulong)) {
+        abi_ulong *arg_ptr, arg_addr;
+
+        arg_ptr = lock_user(VERIFY_READ, arg_ptr_addr, sizeof(abi_ulong), 1);
+        if (!arg_ptr)
+            return;
+        arg_addr = tswapal(*arg_ptr);
+        unlock_user(arg_ptr, arg_ptr_addr, 0);
+        if (!arg_addr)
+            break;
+        if ((s = lock_user_string(arg_addr))) {
+            qemu_log("\"%s\",", s);
+            unlock_user(s, arg_addr, 0);
+        }
+    }
+    qemu_log("NULL}%s", get_comma(last));
+}
+
+static void
+print_execve(CPUArchState *cpu_env, const struct syscallname *name,
+             abi_long arg1, abi_long arg2, abi_long arg3,
+             abi_long arg4, abi_long arg5, abi_long arg6)
+{
+    print_syscall_prologue(name);
+    print_string(arg1, 0);
+    print_execve_argv(arg2, 1);
+    print_syscall_epilogue(name);
+}
+
+static void
+print_execveat(CPUArchState *cpu_env, const struct syscallname *name,
+             abi_long arg1, abi_long arg2, abi_long arg3,
+             abi_long arg4, abi_long arg5, abi_long arg6)
+{
+    print_syscall_prologue(name);
+    print_at_dirfd(arg1, 0);
+    print_string(arg2, 0);
+    print_execve_argv(arg3, 0);
+    print_flags(execveat_flags, arg5, 1);
+    print_syscall_epilogue(name);
+}
+
 #if defined(TARGET_NR_faccessat) || defined(TARGET_NR_faccessat2)
 static void
 print_faccessat(CPUArchState *cpu_env, const struct syscallname *name,
diff --git a/linux-user/strace.list b/linux-user/strace.list
index 3df2184580..17d2f0fee8 100644
--- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -161,7 +161,7 @@
 { TARGET_NR_execve, "execve" , NULL, print_execve, NULL },
 #endif
 #ifdef TARGET_NR_execveat
-{ TARGET_NR_execveat, "execveat" , NULL, NULL, NULL },
+{ TARGET_NR_execveat, "execveat" , NULL, print_execveat, NULL },
 #endif
 #ifdef TARGET_NR_exec_with_loader
 { TARGET_NR_exec_with_loader, "exec_with_loader" , NULL, NULL, NULL },
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 8402c1399d..38fbbbad6a 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -689,7 +689,8 @@ safe_syscall4(pid_t, wait4, pid_t, pid, int *, status, int, options, \
 #endif
 safe_syscall5(int, waitid, idtype_t, idtype, id_t, id, siginfo_t *, infop, \
               int, options, struct rusage *, rusage)
-safe_syscall3(int, execve, const char *, filename, char **, argv, char **, envp)
+safe_syscall5(int, execveat, int, dirfd, const char *, filename,
+        char **, argv, char **, envp, int, flags)
 #if defined(TARGET_NR_select) || defined(TARGET_NR__newselect) || \
     defined(TARGET_NR_pselect6) || defined(TARGET_NR_pselect6_time64)
 safe_syscall6(int, pselect6, int, nfds, fd_set *, readfds, fd_set *, writefds, \
@@ -8349,6 +8350,106 @@ static int do_openat(CPUArchState *cpu_env, int dirfd, const char *pathname, int
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
+    if (is_proc_myself(p, "exe")) {
+        ret = get_errno(safe_execveat(dirfd, exec_path, argp, envp, flags));
+    } else {
+        ret = get_errno(safe_execveat(dirfd, p, argp, envp, flags));
+    }
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
 
@@ -8846,104 +8947,10 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
         unlock_user(p, arg2, 0);
         return ret;
 #endif
+    case TARGET_NR_execveat:
+        return do_execveat(cpu_env, arg1, arg2, arg3, arg4, arg5);
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
-            if (is_proc_myself(p, "exe")) {
-                ret = get_errno(safe_execve(exec_path, argp, envp));
-            } else {
-                ret = get_errno(safe_execve(p, argp, envp));
-            }
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


