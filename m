Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3649168AB24
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:11:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOL5u-0005FP-69; Sat, 04 Feb 2023 11:08:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5p-0005CW-7r
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:48 -0500
Received: from mout.kundenserver.de ([217.72.192.74])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5m-0006vs-1r
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:45 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MTRhS-1pCM9o1nNU-00TirZ; Sat, 04
 Feb 2023 17:08:36 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Drew DeVault <sir@cmpwn.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 04/22] linux-user/syscall: Extract do_execve() from
 do_syscall1()
Date: Sat,  4 Feb 2023 17:08:12 +0100
Message-Id: <20230204160830.193093-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230204160830.193093-1-laurent@vivier.eu>
References: <20230204160830.193093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:PE0V9ZjRpSFuIvGQtSv+AotUhtFBGiJoD/oADrfSOzyyPFbAssV
 eWR4CfLe2IPVrtZ7rKe+G1PZACy7+mol6yfTZXMMfJHq+mHklnChGa4Ejh9rTODA+G77lFP
 mRzl6pAduVzxSU6A6FYQfX4ucRB60AqZ6zTZ8n5c27/wRmXlVSxbNjGvrUaEYgpJothU93v
 r91++L2VZExtn8XHFVhDA==
UI-OutboundReport: notjunk:1;M01:P0:Ov5CDAmCstM=;iObgGanYpTx/0gFk6iaCcB3AFDS
 nOUjBT14Z+jGWO9JxVBqr9vzHOZ5kRE9aCbIABVhnU0ZPmDgpCUR4QgWPfPQdm9M3RtIwcVNZ
 XhaOkK2RhpMFEHZUPNEUmyOcQ6vlcDxr/PHh8BHuA0GpsS9HOLZdFPZC0k6ugaQPyJ6doFCdD
 6XKsIJpb97LPPieHm6yuCYe/YNw9M8ofNUEbiT7vK0Xk8mT/13Por9vw66FA5rHkKOQvn6iU9
 CcEPSVWYov1VT2wwIeo2BTFviUR8fGw9Pn5maL8ghvwDVat1KkOvGe7WVJhpaLSyc2S1Fg6Ep
 r6taFwa8UJojAeBf7czn5G0Tjw3LjQbkvpIb7QgCSaxHDn8fz2XBoYZYkMLFB471A7H1lwpOQ
 7Kyhy7tGHjaNpJgoFP1405WKKvitzr8xMJy0rj4o0+sdaE5HQHABbqTGKGcF9bhpXRr6LmlPd
 cDVIRj8uUuHKPNoZ3rPS6t8tHN5daELnmfenLGwmKH6diRTIDMeUtEoJl2l1ubCKbR/lVi8er
 WptFVRo0akDwCzSMmCLxuJQZD3wxDtJhA7XIgwtzmrWYX7nOYlL0HE91G7JCMculo4iaWFrvM
 WsV0mGGrmErAXoylal2jiq0xsngNwNN6RKLVuVYq8eLAKkAJJZIml7QgYDITXxl2Fj1SP5L0c
 iAAC+RBLACeMqea9kNMbO3O9kEElSQ/6zGgwGPDbTQ==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
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

From: Drew DeVault <sir@cmpwn.com>

execve() is a particular case of execveat(). In order
to add do_execveat(), first factor do_execve() out.

Signed-off-by: Drew DeVault <sir@cmpwn.com>
Message-Id: <20221104081015.706009-1-sir@cmpwn.com>
[PMD: Split of bigger patch, filled description, fixed style]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20221104173632.1052-5-philmd@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 211 +++++++++++++++++++++++--------------------
 1 file changed, 114 insertions(+), 97 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 1f8c10f8ef94..11236d16a372 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8357,6 +8357,119 @@ static int do_openat(CPUArchState *cpu_env, int dirfd, const char *pathname, int
     return safe_openat(dirfd, path(pathname), flags, mode);
 }
 
+static int do_execve(CPUArchState *cpu_env,
+                       abi_long pathname, abi_long guest_argp,
+                       abi_long guest_envp)
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
+        if (get_user_ual(addr, gp)) {
+            return -TARGET_EFAULT;
+        }
+        if (!addr) {
+            break;
+        }
+        argc++;
+    }
+    envc = 0;
+    for (gp = guest_envp; gp; gp += sizeof(abi_ulong)) {
+        if (get_user_ual(addr, gp)) {
+            return -TARGET_EFAULT;
+        }
+        if (!addr) {
+            break;
+        }
+        envc++;
+    }
+
+    argp = g_new0(char *, argc + 1);
+    envp = g_new0(char *, envc + 1);
+
+    for (gp = guest_argp, q = argp; gp; gp += sizeof(abi_ulong), q++) {
+        if (get_user_ual(addr, gp)) {
+            goto execve_efault;
+        }
+        if (!addr) {
+            break;
+        }
+        *q = lock_user_string(addr);
+        if (!*q) {
+            goto execve_efault;
+        }
+    }
+    *q = NULL;
+
+    for (gp = guest_envp, q = envp; gp; gp += sizeof(abi_ulong), q++) {
+        if (get_user_ual(addr, gp)) {
+            goto execve_efault;
+        }
+        if (!addr) {
+            break;
+        }
+        *q = lock_user_string(addr);
+        if (!*q) {
+            goto execve_efault;
+        }
+    }
+    *q = NULL;
+
+    /*
+     * Although execve() is not an interruptible syscall it is
+     * a special case where we must use the safe_syscall wrapper:
+     * if we allow a signal to happen before we make the host
+     * syscall then we will 'lose' it, because at the point of
+     * execve the process leaves QEMU's control. So we use the
+     * safe syscall wrapper to ensure that we either take the
+     * signal as a guest signal, or else it does not happen
+     * before the execve completes and makes it the other
+     * program's problem.
+     */
+    p = lock_user_string(pathname);
+    if (!p) {
+        goto execve_efault;
+    }
+
+    if (is_proc_myself(p, "exe")) {
+        ret = get_errno(safe_execve(exec_path, argp, envp));
+    } else {
+        ret = get_errno(safe_execve(p, argp, envp));
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
+    for (gp = guest_argp, q = argp; *q; gp += sizeof(abi_ulong), q++) {
+        if (get_user_ual(addr, gp) || !addr) {
+            break;
+        }
+        unlock_user(*q, addr, 0);
+    }
+    for (gp = guest_envp, q = envp; *q; gp += sizeof(abi_ulong), q++) {
+        if (get_user_ual(addr, gp) || !addr) {
+            break;
+        }
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
 
@@ -8867,103 +8980,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
         return ret;
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
+        return do_execve(cpu_env, arg1, arg2, arg3);
     case TARGET_NR_chdir:
         if (!(p = lock_user_string(arg1)))
             return -TARGET_EFAULT;
-- 
2.39.1


