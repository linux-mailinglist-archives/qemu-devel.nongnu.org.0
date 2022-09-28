Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 885905EDBCC
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 13:31:57 +0200 (CEST)
Received: from localhost ([::1]:37270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odVIC-0003Ae-Ih
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 07:31:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSEP-0008Ff-HQ
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:53 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:37479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSEL-0008HH-DT
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:48 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MzhWp-1pQLn73msL-00vgUF; Wed, 28
 Sep 2022 10:15:37 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 36/38] linux-user: Lock log around strace
Date: Wed, 28 Sep 2022 10:15:15 +0200
Message-Id: <20220928081517.734954-37-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928081517.734954-1-laurent@vivier.eu>
References: <20220928081517.734954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:TWXvrr7PU6WcMeI+mKtdiE3jbUWgER8+6r7lUgh/TAqGP5CQGs0
 /T380f8LlLO0UdjOd5/cM6g3l7Fdaw+c8cDYAnZ8xuPflft+mKkxd6gghe8LjTwIjwQC8qP
 UZlNqZxcIbUU6f7QrwTvW4Mp7QGRnzCV5R3tp9EJpfeuLNgBsbgPHQyNlmzNsRnsYFZkeQ0
 8W1B9c8gtxY8B0wnHp98Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7c/b14zdDCg=:hx1cmdsrSQmyEgFoAKy/1a
 XtipXmOAeWhjj+UvOh9Za0RSOp3H2DTe8DctfTHR7Lg36RP0IWa8mdixDPprgQ4hyxgOnb00B
 +W18H64eQ0xic88luo/KEkzd1aXm6yb4mIIqhqbGFdJA5+JqC4Eugqk7RCVn9klAua8NTv9/9
 jRiMe29VjMlGsQCu1JWt4NZ+Zbrdc0Hyo2mtoaaCD84kna0qxVhDBfxY/3SeDpZS+V2Swv9ku
 OChp6rsrGq/xJmIqYdZvdnwtriSuTSI0ar9oEitappPjiQpuWVltAFKaXOU8gIiJXWprYitA2
 uTgCknPerbGhXb+RCwtWB3j7rQBCA9/ntXQKXtAuVFJgZDtajGyS3Eb16joANY9tQxknHifGo
 sY0/YihNuWu50jS5B8pPvxoZWdncDWt2lkh/YJU21LY02vmF9il98PNHThPQrTeQEig3Q0siV
 ZseynwsGZwbrNfQ9DiMZHLSksGY9GR96sQ/bmV3FOjeZtwbno3CrhIn4e/27D9CcqdKcOeT3q
 pewbbJtfakxP3Fw2z55K3od8yLMgPO7fMT/MYhwmrwScYUnmq8wq2UYK+6xC+QLWiML+ghEty
 vYNoRTbCDGt3ZToJip0rhRFbqPDWcgOJxx5rfqvlG1ZcbtM83dmHBle6iRXQEG67RAdJFIfwm
 0ul5fFgXBBlNbjQ2aAMpR6Ic7/shTyhMJL+Zkl34SomFsyRPFTMsFgfU6FAWKAynLpq2bNZDl
 2Xx+/C5nBSNG2TpdJyzqT0/yVxkG3qu/h92gGFzlGk+8y6lWfZ1Zc8oTyoim3PQKFAZqcIP1q
 Q36uReO
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


