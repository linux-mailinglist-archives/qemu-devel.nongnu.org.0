Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FC068AB22
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:11:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOL5v-0005GC-OJ; Sat, 04 Feb 2023 11:08:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5n-00059O-W7
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:44 -0500
Received: from mout.kundenserver.de ([217.72.192.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5k-0006uc-W1
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:43 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MZT2u-1p9c4T1wIw-00WSh1; Sat, 04
 Feb 2023 17:08:35 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Drew DeVault <sir@cmpwn.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 02/22] linux-user/strace: Extract print_execve_argv() from
 print_execve()
Date: Sat,  4 Feb 2023 17:08:10 +0100
Message-Id: <20230204160830.193093-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230204160830.193093-1-laurent@vivier.eu>
References: <20230204160830.193093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/wwAHRG41kOMHBmZzPjChXAhyasVmjbQUpwUd4IowSyv9bnii5J
 /Mqk7vXWBPft76w2rt2EOtpsIPXySm7Soik9U2jFT+K4zlPn4OEkvC2Xt1cP7MQS27qYaDG
 Vti8ucjLUVMYSx4y1hCMZAwCcbEYVxyqTN6CvBIAobwmZTdfPA1QyrSXsn3+YqOrdou1/XC
 4iwNji/Eif7ds/x23/fAw==
UI-OutboundReport: notjunk:1;M01:P0:YfGAEvojSWw=;ln7bmJf/s+DzcRTi+wg4BNRkpzf
 e2UGvdnMS2mKpisg++TUyzRAAFpe21TIKM7OiavBca6f2eeScGP+re2U5sj90anWq3EcM6ZtK
 JBHNby8WdH4dk2dHvHkepof+XTQ8pf+wS4VHM2Eqm8xPmv3m3pbGDnmmQzkT9Q0MGBqO0yrOB
 UOgdOLoOyldeaSflGs6/wuhAqpLCC67REd87WAB4eAlPj32tbPsw5FZw6wyrziiJVc3OFPPJ1
 I6GAuS5btIC1RB6DPRTGDfI4e0zyqVMoPySP1Fp4KeQmlc3Vn8sZTb4+fAFg+H42x2NoXiSj1
 Z//pb15JfTDRKeUovZG+qncqh+J8rdFXIrYwQziME+InP7pts8E6zkQrhlOPRfymKbezKu57K
 aRd8QIVaLQHhysGMr526g+GbkLf7qcBNYKNjTvSOOfqRqfRmKmqrORiT6QlGAPgv9QUDzQCS1
 X+XuIjmBNZj3n26y3SPib4wJKD1wSuU+1e0AIsdPYnKUBxdygCb90i3DJkSTurkVsy7Xks91/
 WYHqb3I6uDKtJkXveDRt0NsGyRtoh/CtDc2Si5R8lC8qTtzSjxbRp2mRHCg8G5WGFsVuDvU/n
 J4cXxtyuGbT31yusTHVMrdYSfcBmp899T+PSklRvjd8cnLxUbsqZBLc38L5NKs9g8es6DygqO
 NoUxvCkxJEvw7dQo1rVWyk7ohh6oyyGHfHTCKsuMJw==
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

In order to add print_execveat() which re-use common code from
print_execve(), extract print_execve_argv() from it.

Signed-off-by: Drew DeVault <sir@cmpwn.com>
Message-Id: <20221104081015.706009-1-sir@cmpwn.com>
[PMD: Split of bigger patch, filled description, fixed style]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20221104173632.1052-3-philmd@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.c | 71 +++++++++++++++++++++++++--------------------
 1 file changed, 39 insertions(+), 32 deletions(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 25c47f03160d..3d11d2f75978 100644
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
@@ -1969,6 +1937,45 @@ print_execv(CPUArchState *cpu_env, const struct syscallname *name,
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
+        if (!arg_ptr) {
+            return;
+        }
+        arg_addr = tswapal(*arg_ptr);
+        unlock_user(arg_ptr, arg_ptr_addr, 0);
+        if (!arg_addr) {
+            break;
+        }
+        s = lock_user_string(arg_addr);
+        if (s) {
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
 #if defined(TARGET_NR_faccessat) || defined(TARGET_NR_faccessat2)
 static void
 print_faccessat(CPUArchState *cpu_env, const struct syscallname *name,
-- 
2.39.1


