Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 575865EE827
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 23:17:23 +0200 (CEST)
Received: from localhost ([::1]:60064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odeQj-0004wg-PH
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 17:17:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddf7-0000nr-S3
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:28:09 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:40413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddf5-0006Yq-9u
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:28:09 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MaInF-1ohGHQ0IwX-00WAlb; Wed, 28
 Sep 2022 22:28:05 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 36/37] linux-user: Lock log around strace
Date: Wed, 28 Sep 2022 22:27:36 +0200
Message-Id: <20220928202737.793171-37-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928202737.793171-1-laurent@vivier.eu>
References: <20220928202737.793171-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ICkfNbLA3GARt9rmqMcZa7OiDge8auiR8jnvWVpmopwJz/D8/G7
 o/kKuoe6V5kEysrqjZNXg8YP9SHUo2H84wQvCpMwu/EXAOIsyyeDcycXFAYuGGBMBWSMswU
 Fw9eO2RsOGg+E+KdRfutSOF50zVMhix/+BLwNtMqklSbd94weXAC+hvV9M9zKbXx3bFGTfD
 e6mi95iZcSruNwJvqi7zw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7hhY9wMUQAU=:VEuOuG2sExr9lbVtUeJJrU
 8g1PnfZfby/8Waq60zgT+I6+R6c8VXxAg2n1TNtSgmLDnhemSNG/LvS0pZBfrlPqpfRHkjwJd
 F6RSNWdoiQtEFbVgrmFxLyQYzymi5t8XU1MiHsdliaVhkil3u/SH5tXaL6LgufessOma167m1
 ENEuq58Q8tuLegW3afDtm4ASNO79Y9BGJP9KqGuo1JfXy9IFRmG7hFHa8gEstEUD+PE3Zuyw2
 ERlaKuCU0jaU+fXrZUvyOMISeVN6q7xMoiQKCUmbtnkAjtgCabm7q7od/g/8FY7eudIY+OcsD
 N21zVr/pdl4R5Vzwy/qBuSMSa5/LCr14+t6VgrmuwuRrXIj+grjKXqDZpKcqAHR/qM6OMYLMQ
 Ep3zVP83BW0tARegEjdJeFR9wLexTUgQWXFYk2l+6WlztOpAFxo0gRQQ4OVzJDl6AkRFDZahc
 8nKJbqwljfyoY7kuwnyWm8o//dwqkbk9elH5H956W40/U51Hj0D6Lr6KXlk3kjyEf54bpaTJ0
 JE3L/D56pxnyVfr3SJb8NiRmLfhr3Nm4nSR4lTKHh8JsObT7gB607IF3D5Ie9x7b3QKbqj30A
 KcF29xicxnQKM432tVj6zG3+uYl4sIIMREbUHVMoWfeq/MHQwSb/YsNhtrw3+sGgymUF78peL
 kfFFwuzBbftjChtPsmeJWfvTMfsSO0jZ6GY+bWQXN0ScbBWM99G6kJRlayYJCZ+zEq+x4jDEJ
 aot48RX84LN294U9N1pz0yiprz35hS4JvmI0v/8PIie3CCH/czmJFaOASPkDBjt6Okefqt5/1
 yLt04ko
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
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

From: Richard Henderson <richard.henderson@linaro.org>

Do not allow syscall arguments to be interleaved between threads.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220829021006.67305-8-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.c | 65 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 46 insertions(+), 19 deletions(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index faa733125624..37bc96df9bb6 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -3919,26 +3919,37 @@ print_syscall(CPUArchState *cpu_env, int num,
               abi_long arg4, abi_long arg5, abi_long arg6)
 {
     int i;
-    const char *format="%s(" TARGET_ABI_FMT_ld "," TARGET_ABI_FMT_ld "," TARGET_ABI_FMT_ld "," TARGET_ABI_FMT_ld "," TARGET_ABI_FMT_ld "," TARGET_ABI_FMT_ld ")";
+    FILE *f;
+    const char *format = "%s(" TARGET_ABI_FMT_ld "," TARGET_ABI_FMT_ld ","
+                               TARGET_ABI_FMT_ld "," TARGET_ABI_FMT_ld ","
+                               TARGET_ABI_FMT_ld "," TARGET_ABI_FMT_ld ")";
 
-    qemu_log("%d ", getpid());
+    f = qemu_log_trylock();
+    if (!f) {
+        return;
+    }
+    fprintf(f, "%d ", getpid());
 
-    for(i=0;i<nsyscalls;i++)
-        if( scnames[i].nr == num ) {
-            if( scnames[i].call != NULL ) {
-                scnames[i].call(
-                    cpu_env, &scnames[i], arg1, arg2, arg3, arg4, arg5, arg6);
+    for (i = 0; i < nsyscalls; i++) {
+        if (scnames[i].nr == num) {
+            if (scnames[i].call != NULL) {
+                scnames[i].call(cpu_env, &scnames[i], arg1, arg2, arg3,
+                                arg4, arg5, arg6);
             } else {
                 /* XXX: this format system is broken because it uses
                    host types and host pointers for strings */
-                if( scnames[i].format != NULL )
+                if (scnames[i].format != NULL) {
                     format = scnames[i].format;
-                qemu_log(format,
-                         scnames[i].name, arg1, arg2, arg3, arg4, arg5, arg6);
+                }
+                fprintf(f, format, scnames[i].name, arg1, arg2,
+                        arg3, arg4, arg5, arg6);
             }
+            qemu_log_unlock(f);
             return;
         }
-    qemu_log("Unknown syscall %d\n", num);
+    }
+    fprintf(f, "Unknown syscall %d\n", num);
+    qemu_log_unlock(f);
 }
 
 
@@ -3948,21 +3959,29 @@ print_syscall_ret(CPUArchState *cpu_env, int num, abi_long ret,
                   abi_long arg4, abi_long arg5, abi_long arg6)
 {
     int i;
+    FILE *f;
+
+    f = qemu_log_trylock();
+    if (!f) {
+        return;
+    }
 
-    for(i=0;i<nsyscalls;i++)
-        if( scnames[i].nr == num ) {
-            if( scnames[i].result != NULL ) {
+    for (i = 0; i < nsyscalls; i++) {
+        if (scnames[i].nr == num) {
+            if (scnames[i].result != NULL) {
                 scnames[i].result(cpu_env, &scnames[i], ret,
                                   arg1, arg2, arg3,
                                   arg4, arg5, arg6);
             } else {
                 if (!print_syscall_err(ret)) {
-                    qemu_log(TARGET_ABI_FMT_ld, ret);
+                    fprintf(f, TARGET_ABI_FMT_ld, ret);
                 }
-                qemu_log("\n");
+                fprintf(f, "\n");
             }
             break;
         }
+    }
+    qemu_log_unlock(f);
 }
 
 void print_taken_signal(int target_signum, const target_siginfo_t *tinfo)
@@ -3970,9 +3989,17 @@ void print_taken_signal(int target_signum, const target_siginfo_t *tinfo)
     /* Print the strace output for a signal being taken:
      * --- SIGSEGV {si_signo=SIGSEGV, si_code=SI_KERNEL, si_addr=0} ---
      */
-    qemu_log("--- ");
+    FILE *f;
+
+    f = qemu_log_trylock();
+    if (!f) {
+        return;
+    }
+
+    fprintf(f, "--- ");
     print_signal(target_signum, 1);
-    qemu_log(" ");
+    fprintf(f, " ");
     print_siginfo(tinfo);
-    qemu_log(" ---\n");
+    fprintf(f, " ---\n");
+    qemu_log_unlock(f);
 }
-- 
2.37.3


