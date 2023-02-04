Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B4768AB21
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:11:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOL5u-0005Fq-PL; Sat, 04 Feb 2023 11:08:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5n-00057x-OR
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:43 -0500
Received: from mout.kundenserver.de ([212.227.17.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5k-0006uJ-WB
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:43 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Ml76o-1ouYG742qi-00lWjJ; Sat, 04
 Feb 2023 17:08:36 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Drew DeVault <sir@cmpwn.com>, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 03/22] linux-user/strace: Add output for execveat() syscall
Date: Sat,  4 Feb 2023 17:08:11 +0100
Message-Id: <20230204160830.193093-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230204160830.193093-1-laurent@vivier.eu>
References: <20230204160830.193093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4NWYFXMpGpe9nwLf8GbrrOkc9jWO4PxeZQRYrc22OkRgYaj+V42
 exMS7dOQgtRjqnoZ5ltKz4DIfzmTpV6ZMjLjO9jopZD1Ocso4KRojIylNM4VtK4hagdWKa3
 OwbOJEW1CPPW+4+wwU1RQQXZ4dGEC+PMQfkN4BlqktNDABtgRa5uM82JF0QGyHKw6oxywkU
 ZZnte84lto7TRWNcGqgpg==
UI-OutboundReport: notjunk:1;M01:P0:wcL2QtL1BMs=;sojRCxOjnazA1ltxDGvlapJT/yr
 Ws+gZbyYoD21r9/UBJCjc5cqxII0WJvuGjMsA+MBtGthqdJ7wNIsVNw+1kowZY3j7HEYhGrpf
 Uy1FBeos9Ax172l2If1XkBZDh3vmNewuvE8E8WwN9zerfDBCvdMXmka4+zWEiewYkPkhwZpL+
 aWiAAZ0tinnht8PdW9rvDVbostZ1LNc0kuMgN4y2FvzDrPUr8J/XBNdKA7/hQXEfkakvwDEVq
 1hp7PHgcMBCR57mbZm/VXAve12yUbZ1tsK+V2Yj1I9QaRqCaShnsPzAewCpI7wAQeoe6l8D/E
 K5S+EoCAOAwheb0Tr0I+Ne5m5DlmIBLfnm7QnyPqqvjPR3zYsq+9AJ0Mid2MSLvTe7APzxqfd
 cgAWJRv2k6J2WuH8BvMyw4bOPqLaBGdp7vVhBcKsVJelqRMwksPODkEt41XF6NDqjSIggx5Vu
 RmDInhCWeG0RxD+gUlHV39D9Spfb8FEuGCh58JwoWKIabP4c+Z0vpgSaZa+9PkpmGBfruyyrQ
 rSoI0xw/WawudnvL1mPHPwi3aCKQqFeGK9IYxV8qccQsFwvAQYx+vuoz6uhwvWZzZ1yylL5MV
 nw7nhhEwJfNeAvdkS9DzFY0Hlpd5Yb6Y9MfoqwAH3lHIVYJVbOfEW/Ql0EfR14ggv+YKf6Z8l
 BJ8j/ofZMa8oQ8slLxIwBIDMoRtC9gL1+cpU8oAdgA==
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

From: Drew DeVault <sir@cmpwn.com>

Signed-off-by: Drew DeVault <sir@cmpwn.com>
Message-Id: <20221104081015.706009-1-sir@cmpwn.com>
Suggested-by: Helge Deller <deller@gmx.de>
[PMD: Split of bigger patch]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20221104173632.1052-4-philmd@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.c    | 23 +++++++++++++++++++++++
 linux-user/strace.list |  2 +-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 3d11d2f75978..7bccb4f0c067 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -1104,6 +1104,16 @@ UNUSED static const struct flags clone_flags[] = {
     FLAG_END,
 };
 
+UNUSED static const struct flags execveat_flags[] = {
+#ifdef AT_EMPTY_PATH
+    FLAG_GENERIC(AT_EMPTY_PATH),
+#endif
+#ifdef AT_SYMLINK_NOFOLLOW
+    FLAG_GENERIC(AT_SYMLINK_NOFOLLOW),
+#endif
+    FLAG_END,
+};
+
 UNUSED static const struct flags msg_flags[] = {
     /* send */
     FLAG_GENERIC(MSG_CONFIRM),
@@ -1976,6 +1986,19 @@ print_execve(CPUArchState *cpu_env, const struct syscallname *name,
     print_syscall_epilogue(name);
 }
 
+static void
+print_execveat(CPUArchState *cpu_env, const struct syscallname *name,
+               abi_long arg1, abi_long arg2, abi_long arg3,
+               abi_long arg4, abi_long arg5, abi_long arg6)
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
index 3a898e2532d3..bb21c054148e 100644
--- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -164,7 +164,7 @@
 { TARGET_NR_execve, "execve" , NULL, print_execve, NULL },
 #endif
 #ifdef TARGET_NR_execveat
-{ TARGET_NR_execveat, "execveat" , NULL, NULL, NULL },
+{ TARGET_NR_execveat, "execveat" , NULL, print_execveat, NULL },
 #endif
 #ifdef TARGET_NR_exec_with_loader
 { TARGET_NR_exec_with_loader, "exec_with_loader" , NULL, NULL, NULL },
-- 
2.39.1


