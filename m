Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CC95E9454
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 18:22:02 +0200 (CEST)
Received: from localhost ([::1]:48456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocUOH-0005DA-7h
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 12:22:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ocUI5-0008KG-2w
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 12:15:37 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:35615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ocUI3-0005Yq-DD
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 12:15:36 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MHG4c-1oPEk048sS-00DINQ; Sun, 25
 Sep 2022 18:15:33 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 1/2] linux-user: handle /proc/self/exe with execve() syscall
Date: Sun, 25 Sep 2022 18:15:26 +0200
Message-Id: <20220925161527.374593-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220925161527.374593-1-laurent@vivier.eu>
References: <20220925161527.374593-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:r10wQjcsMwnRBGXgrEWmNOITrQypMreVTVzIzf1rAfE0Jum2K74
 +ZmzcOekypPPsE7fgJpTg4lznblKUIOZ2ohrAT+1qO/o0g9odqVSnJK9AwgmKCTG55zXzz4
 qB0rGNO8xXZyBAdcVgULiJGCoxpoebEgyH09qFTpyCMvPqm5gde1wiHx+g5OZCmjZ90CqYm
 itnAF92ONj5GaaTe7QgeQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VwkIOfZ5FsY=:8wIhXCI1eTAEDpPvudyqAu
 ap+bHgHJDF105B5tG2vuE96PFvuCE5rheySSOWAa0yAsHoeo9m6iFMMDle8aVfGCadN6GFubS
 lh8QYGC+/476Pf0/Rhc58QLMVhlIuWho8vc+039eaIZbFY8405wQ26mssVXMspdr2CyMcRvrx
 drGk+VVTsj9wMZwsAnySgaslxcyw+YAWFhEJGJnN4tqe3c3UsznlTUX5v50DjgplSGxqzRZKM
 0MlibdxID2vQ3bs3/3Sue2nLq6D8hGWa8z/1qRBESEgpwguJbJiR8lbXTd7yGGlbcp9zbnorW
 PNJySgApUQ4C8hbWp6JBkLPPYd2g8hXm/ioBFyJR1oApDY5ig5rf1LgjxPbR/DS+oRzPis1ox
 vd1R+iVDNXtOKr6xn8msUdLWFrUgWjwRfiR24LXeQ6Ohpn+7Nc7WTmrKpAJXLxwX/+0VJ9hmT
 qE5gPfPfDWl3om7gIjnOUBIVMUBumvtpcTFsSDTGNwUmRbg0j1H+pScIQGehCt0rHGbLEtJ1A
 qsfbl5ntLLDxR+iIjdzUUXRyP/1qD2xEPJdmaazIUFoT6N6ivK5IlGhfxM+ydztxy2iHi5JdJ
 xfRYf1pT0p77MIxf3WYtL4aFgXnRap1EoRdfQJZE6g0qeY0xw8g7bEIafFje5jxwEufQasrlT
 d5FVMphBaE3n6zmQnXIYsfAB+ECyolhrQmyxqGvKcTZEX9N5znrD5BFcnsVBfjRZu3YuEzI4h
 kYi9PP4yE5fefONI/mXQ2D29AIzLrzWLWHOMm+HlRjzBDyL3I14VRPqeOqslw3pJUIzS8o56i
 N9o519V
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If path is /proc/self/exe, use the executable file descriptor
provided by binfmt_misc (or opened by main()) with execveat().

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/main.c           | 9 +++++++--
 linux-user/syscall.c        | 9 ++++++++-
 linux-user/user-internals.h | 1 +
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index e44bdb17b853..f915bdd7cef7 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -64,6 +64,7 @@
 #endif
 
 char *exec_path;
+int execfd;
 
 int singlestep;
 static const char *argv0;
@@ -646,7 +647,6 @@ int main(int argc, char **argv, char **envp)
     int target_argc;
     int i;
     int ret;
-    int execfd;
     unsigned long max_reserved_va;
     bool preserve_argv0;
 
@@ -845,7 +845,12 @@ int main(int argc, char **argv, char **envp)
 
     fd_trans_init();
 
-    ret = loader_exec(execfd, exec_path, target_argv, target_environ, regs,
+    /*
+     * loader_exec() closes the file descriptor provided by the caller.
+     * As we need to keep it available for execve("/proc/self/exe")
+     * we provide a copy to loader_exec().
+     */
+    ret = loader_exec(dup(execfd), exec_path, target_argv, target_environ, regs,
         info, &bprm);
     if (ret != 0) {
         printf("Error while loading %s: %s\n", exec_path, strerror(-ret));
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index f4091212027c..6642652b7644 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -649,6 +649,8 @@ safe_syscall4(pid_t, wait4, pid_t, pid, int *, status, int, options, \
 safe_syscall5(int, waitid, idtype_t, idtype, id_t, id, siginfo_t *, infop, \
               int, options, struct rusage *, rusage)
 safe_syscall3(int, execve, const char *, filename, char **, argv, char **, envp)
+safe_syscall5(int, execveat, int, dirfd, const char *, pathname, char **, \
+              argv, char **, envp, int, flags)
 #if defined(TARGET_NR_select) || defined(TARGET_NR__newselect) || \
     defined(TARGET_NR_pselect6) || defined(TARGET_NR_pselect6_time64)
 safe_syscall6(int, pselect6, int, nfds, fd_set *, readfds, fd_set *, writefds, \
@@ -8843,7 +8845,12 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
              * before the execve completes and makes it the other
              * program's problem.
              */
-            ret = get_errno(safe_execve(p, argp, envp));
+            if (is_proc_myself(p, "exe")) {
+                ret = get_errno(safe_execveat(execfd, "", argp, envp,
+                                AT_EMPTY_PATH));
+            } else {
+                ret = get_errno(safe_execve(p, argp, envp));
+            }
             unlock_user(p, arg1, 0);
 
             goto execve_end;
diff --git a/linux-user/user-internals.h b/linux-user/user-internals.h
index 0280e76addda..84f29a1e2990 100644
--- a/linux-user/user-internals.h
+++ b/linux-user/user-internals.h
@@ -23,6 +23,7 @@
 #include "qemu/log.h"
 
 extern char *exec_path;
+extern int execfd;
 void init_task_state(TaskState *ts);
 void task_settid(TaskState *);
 void stop_all_tasks(void);
-- 
2.37.3


