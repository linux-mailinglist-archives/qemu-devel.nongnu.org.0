Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B045A410C
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 04:21:20 +0200 (CEST)
Received: from localhost ([::1]:55948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSUOt-00012S-Ic
	for lists+qemu-devel@lfdr.de; Sun, 28 Aug 2022 22:21:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oSUEF-0003as-QK
 for qemu-devel@nongnu.org; Sun, 28 Aug 2022 22:10:19 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:42982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oSUEE-0001cH-3D
 for qemu-devel@nongnu.org; Sun, 28 Aug 2022 22:10:19 -0400
Received: by mail-pl1-x62a.google.com with SMTP id v5so392088plo.9
 for <qemu-devel@nongnu.org>; Sun, 28 Aug 2022 19:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=MG15NAkIAITNs1OE3bxclYfrNMvmI1vfTm8EKN0Sndo=;
 b=RFDTln+pSjDUmG9UXyVj9H6FTR0ihRkPbzZpLHxIqKUSURhGJ140a1LbMaUE2DQ8+J
 3pVkbBQHuGi/YU3NnyC8PfpSUnCcAfEbv2H9cFwRlxqGxRtQl1TTEs+HZxrFA7Qg3HdF
 EMK0ukMsL3fBgXULEh5DyM8HpVSvJtT5KeuZA0RWuj2h06L1kiXVP1G9//8lKHvlZzB1
 bNLAm5oQnrTvQfV6Aq0IHR22lYeVXxUJj2du/xCKxjwprx7NLo6x6WX4Ghi2H2PV5xJg
 SglPiCWC6xme1oVTRUShLH4hZR7XNwh/pY1q+UeTloafvkAADhmQB/kkBgcFAPaZ+tVK
 E+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=MG15NAkIAITNs1OE3bxclYfrNMvmI1vfTm8EKN0Sndo=;
 b=Q331+3CR/9fKr+5emaVHcuZe2wCZDoSdSh30RzwRpiFARWkkmgEwGmc88WPm4WYjBh
 zaZFjZlnsh3+N/OgEMByMdp3vgSoYYJ1ymlblbiNY+qQxsrMJsE97WVdDhk7sp2ZAQt1
 ONHqayBcOQE8hbs7hv+WvI0Vv0PsftaQCjb073GSl9V/BlSvZk3qO03fJ4KdxlPg3ORT
 rwPqXlnoAYgaJCr7K/qLSMY5GHWMHCAKZCQoWMr0mH3/jbQxO/KvfhHQmnBZrecqFWn9
 zRK0KmpslFSKsiT5JNN3piH+DjyCozSS1BDkDKSoJ+CNAHv24VNCuldjMP/1Caz2BXvp
 aUZw==
X-Gm-Message-State: ACgBeo1mV6+b3PlmX7oJmomXgXysUCDeQ/M+cpVl78fl5Dh3gloLme0o
 Z27f3HD7qw0Ng27YsokJzwpqTZ6DLHmnEg==
X-Google-Smtp-Source: AA6agR7QIf9y01qZDpoBaHEZIjUOA6KwkZwn/k5XxjDHvH2g7n4b0i1ETUaiP7VNencgSaKgDIyyrQ==
X-Received: by 2002:a17:903:2d0:b0:172:b63b:3a1e with SMTP id
 s16-20020a17090302d000b00172b63b3a1emr14610369plk.76.1661739016406; 
 Sun, 28 Aug 2022 19:10:16 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:2fa6:2ab5:a96e:2a35])
 by smtp.gmail.com with ESMTPSA id
 ik30-20020a170902ab1e00b0016bdc98730bsm6035139plb.151.2022.08.28.19.10.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Aug 2022 19:10:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH 7/8] linux-user: Lock log around strace
Date: Sun, 28 Aug 2022 19:10:05 -0700
Message-Id: <20220829021006.67305-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220829021006.67305-1-richard.henderson@linaro.org>
References: <20220829021006.67305-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Do not allow syscall arguments to be interleaved between threads.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/strace.c | 65 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 46 insertions(+), 19 deletions(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 8eadbed39e..c47d91bb3d 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -3773,26 +3773,37 @@ print_syscall(CPUArchState *cpu_env, int num,
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
 
 
@@ -3802,21 +3813,29 @@ print_syscall_ret(CPUArchState *cpu_env, int num, abi_long ret,
                   abi_long arg4, abi_long arg5, abi_long arg6)
 {
     int i;
+    FILE *f;
 
-    for(i=0;i<nsyscalls;i++)
-        if( scnames[i].nr == num ) {
-            if( scnames[i].result != NULL ) {
+    f = qemu_log_trylock();
+    if (!f) {
+        return;
+    }
+
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
@@ -3824,9 +3843,17 @@ void print_taken_signal(int target_signum, const target_siginfo_t *tinfo)
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
2.34.1


