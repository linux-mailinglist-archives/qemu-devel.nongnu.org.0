Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACE768AB19
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:11:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOL5z-0005QF-QE; Sat, 04 Feb 2023 11:08:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5n-00059G-Tp
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:43 -0500
Received: from mout.kundenserver.de ([217.72.192.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5k-0006ud-Uz
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:43 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M8xwu-1pIJDW414w-006ANn; Sat, 04
 Feb 2023 17:08:37 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Drew DeVault <sir@cmpwn.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 05/22] linux-user/syscall: Implement execveat()
Date: Sat,  4 Feb 2023 17:08:13 +0100
Message-Id: <20230204160830.193093-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230204160830.193093-1-laurent@vivier.eu>
References: <20230204160830.193093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8NSopOUTQc+8BCwkydaU2iaPDi8LCXCQQSwxb9KybrHBSBbfIA3
 idjaj+obc+RJJ3lh/OqXCpo7dFpJ/cL+srnzTgueWj0dAVh3FOMczmOeR8Wk3NYYKIvV/55
 BHeW3LUEa4VwcFGzYFv9qjkSY5wdLrHt1BWFwgXmxlQkJarjCexcgd7Jlyaax1quVmjbEEu
 FEDkv9mpSNZpYHDYte2HQ==
UI-OutboundReport: notjunk:1;M01:P0:ERcDDCGNyXk=;WlN06gnSUH8TpcobIPKMEkcENxg
 TsdRxr5xYpEGxgIR2RydOO5Fm0i9h7VmuDPCSwWI7tmvx3TXx6rnrNLJ0mvkmlQhzfBwl9fNF
 5x+y5z3IxHZML1wltbV20O1H/DbQxhPWQT3f4ln2Y2JIRM5nRFIKIx3P1V9dfKok2mJ3BSzMP
 l/N2VHJKcbmqjAdETZ1IUtqHp8I5Y5dPGI71LL7f29NYbUi9MCGJe9HLYkTHpnAzJvTO37yyb
 SetOyCCJO0spirr5h8UzF2EzGQUkRW3OtdfA0Zk6pnRA7ZlZggUk/IntXfrVpZzRj7z8BAfB4
 +IkNIViXL614rdSVh8+jj35DqwttDU6LpqQttp6Lf5HGjq88i+ZiywQe3lFhUbd6IFtMN81td
 y0Vbt3nC1JYIjkkXsYSbSY0KfyNgEcxzRtMIABk50SqkaexrdPVJyZWzdj2XnOKB1EAM1iMOX
 5GtcLcLY2wUaBsGhyFfaJoIY4XCd4AjkwUb/pitJbEAOBzwS+phd4vazcAi7oV+kFUOODXr67
 aWvGk7U2GNk2filkAYj+VTztFGk3fYJaefcx5tgy6d0ROnXe7WNoEm4GE21RBvpoqUZQLHLDv
 WQRRp2nYRgX0oA4g9gHcB973FhQ3koctEDFlrXrnTA3iK8bmv9MG58Z8egf2DLvD2Cr8tysXa
 1we57O2ZgEgBS1lD1N0N15n+pjmtvjds+VuKdKq35A==
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Drew DeVault <sir@cmpwn.com>

References: https://gitlab.com/qemu-project/qemu/-/issues/1007
Signed-off-by: Drew DeVault <sir@cmpwn.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20221104081015.706009-1-sir@cmpwn.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221104173632.1052-6-philmd@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 11236d16a372..3e72bd333ede 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -696,7 +696,8 @@ safe_syscall4(pid_t, wait4, pid_t, pid, int *, status, int, options, \
 #endif
 safe_syscall5(int, waitid, idtype_t, idtype, id_t, id, siginfo_t *, infop, \
               int, options, struct rusage *, rusage)
-safe_syscall3(int, execve, const char *, filename, char **, argv, char **, envp)
+safe_syscall5(int, execveat, int, dirfd, const char *, filename,
+              char **, argv, char **, envp, int, flags)
 #if defined(TARGET_NR_select) || defined(TARGET_NR__newselect) || \
     defined(TARGET_NR_pselect6) || defined(TARGET_NR_pselect6_time64)
 safe_syscall6(int, pselect6, int, nfds, fd_set *, readfds, fd_set *, writefds, \
@@ -8357,9 +8358,9 @@ static int do_openat(CPUArchState *cpu_env, int dirfd, const char *pathname, int
     return safe_openat(dirfd, path(pathname), flags, mode);
 }
 
-static int do_execve(CPUArchState *cpu_env,
+static int do_execveat(CPUArchState *cpu_env, int dirfd,
                        abi_long pathname, abi_long guest_argp,
-                       abi_long guest_envp)
+                       abi_long guest_envp, int flags)
 {
     int ret;
     char **argp, **envp;
@@ -8439,9 +8440,9 @@ static int do_execve(CPUArchState *cpu_env,
     }
 
     if (is_proc_myself(p, "exe")) {
-        ret = get_errno(safe_execve(exec_path, argp, envp));
+        ret = get_errno(safe_execveat(dirfd, exec_path, argp, envp, flags));
     } else {
-        ret = get_errno(safe_execve(p, argp, envp));
+        ret = get_errno(safe_execveat(dirfd, p, argp, envp, flags));
     }
 
     unlock_user(p, pathname, 0);
@@ -8979,8 +8980,10 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
         unlock_user(p, arg2, 0);
         return ret;
 #endif
+    case TARGET_NR_execveat:
+        return do_execveat(cpu_env, arg1, arg2, arg3, arg4, arg5);
     case TARGET_NR_execve:
-        return do_execve(cpu_env, arg1, arg2, arg3);
+        return do_execveat(cpu_env, AT_FDCWD, arg1, arg2, arg3, 0);
     case TARGET_NR_chdir:
         if (!(p = lock_user_string(arg1)))
             return -TARGET_EFAULT;
-- 
2.39.1


