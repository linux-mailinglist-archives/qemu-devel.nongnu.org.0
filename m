Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68317518F72
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:53:32 +0200 (CEST)
Received: from localhost ([::1]:36004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlzWV-0008FQ-DJ
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:53:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZe-0008ER-7P
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:42 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:40953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZZ-0006KI-Kv
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:39 -0400
Received: by mail-pl1-x635.google.com with SMTP id i1so9744723plg.7
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=G5TUXq2IL4pMyRpoJ6zLWtNUYnfueO0F38AbAA6OUSY=;
 b=NHm0POJ/k5W8exETv800htWvSW0v6gYAFe6sxaU8Ln4BFA5++e6otKo6btl09NvduM
 wQEEYidd7YvmM7kK8Sjq4qNR1tHVRM9ZcMLvPq0dE+VkpylS7OvL0mGmtUs3XSTlOsbU
 615WCwQscqQFqpha2yoWCQGJNhpdQZPkPQDUd6z2V/oR+xan11SHiD/LvnLNDK/MVMqj
 q+UGaDS4ehrNfJZGktmJGvzGDs4c0cudL4hi7K0GKT5MpmxlFQ1e75OVf/0u0pavXi8c
 hh6A3OJML6oX2VTtEF001YI/W8Qt5ovCTZH1F3YPWshex+0FGG2ZBWPMxfMHhEfLxABt
 XozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G5TUXq2IL4pMyRpoJ6zLWtNUYnfueO0F38AbAA6OUSY=;
 b=KCMCH3hsU3N60/LD9do7VRVxz8H9+pT4uxydj22B2qM8cD9WKSzsCyhe09ASYlsY8X
 qVk036Csz7FlMlsbzMKThqH112rzExk6pXY9zFRJ4AP6qNKWVz8wNJxmKfPq0IRZ486M
 BiiUy90AMqG9ORa82UDHJDuiAO0yzX6w547jwkRCeeKq+ouq9aqJWyOKKDNylKPGtqTk
 vPucYKYhnLVlCkt1rFkLU2FlgFLdUCXs9Dtx+yK4nOtAF7GZ/78DM7NZNaXlg/loW2BE
 MX8ye47FYNeO0gJ4NmKetSzJ8fBkAaoE3jfDuR8NYngr7wjn7jtg7fo8yGVZyVKn75rS
 esnA==
X-Gm-Message-State: AOAM532eCq+i1gI++PN2IZ1gDEpbGSLfiC1LXypX3wmk2zCeu/1AuR6r
 3kv0csH6JWzhJN+nwvodBkgVwffUDPFq/g==
X-Google-Smtp-Source: ABdhPJyKZttH9/H1Y0FI7Zcad2rY6gl4h3w3y0SHiRDaI3o/jkZrTTjDUPd6JBr9JqAMj0jYUYgzrg==
X-Received: by 2002:a17:90b:30c4:b0:1d8:3395:a158 with SMTP id
 hi4-20020a17090b30c400b001d83395a158mr6368039pjb.184.1651607556312; 
 Tue, 03 May 2022 12:52:36 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 fz16-20020a17090b025000b001dbe11be891sm1692286pjb.44.2022.05.03.12.52.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:52:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 51/74] target/nios2: Eliminate nios2_semi_is_lseek
Date: Tue,  3 May 2022 12:48:20 -0700
Message-Id: <20220503194843.1379101-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

Reorg nios2_semi_return_* to gdb_syscall_complete_cb.
Use the 32-bit version normally, and the 64-bit version
for HOSTED_LSEEK.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/nios2-semi.c | 59 +++++++++++++++------------------------
 1 file changed, 23 insertions(+), 36 deletions(-)

diff --git a/target/nios2/nios2-semi.c b/target/nios2/nios2-semi.c
index 4d02789d26..bdf8849689 100644
--- a/target/nios2/nios2-semi.c
+++ b/target/nios2/nios2-semi.c
@@ -108,9 +108,12 @@ static bool translate_stat(CPUNios2State *env, target_ulong addr,
     return true;
 }
 
-static void nios2_semi_return_u32(CPUNios2State *env, uint32_t ret, int err)
+static void nios2_semi_u32_cb(CPUState *cs, uint64_t ret, int err)
 {
+    Nios2CPU *cpu = NIOS2_CPU(cs);
+    CPUNios2State *env = &cpu->env;
     target_ulong args = env->regs[R_ARG1];
+
     if (put_user_u32(ret, args) ||
         put_user_u32(err, args + 4)) {
         /*
@@ -123,9 +126,12 @@ static void nios2_semi_return_u32(CPUNios2State *env, uint32_t ret, int err)
     }
 }
 
-static void nios2_semi_return_u64(CPUNios2State *env, uint64_t ret, int err)
+static void nios2_semi_u64_cb(CPUState *cs, uint64_t ret, int err)
 {
+    Nios2CPU *cpu = NIOS2_CPU(cs);
+    CPUNios2State *env = &cpu->env;
     target_ulong args = env->regs[R_ARG1];
+
     if (put_user_u32(ret >> 32, args) ||
         put_user_u32(ret, args + 4) ||
         put_user_u32(err, args + 8)) {
@@ -135,25 +141,6 @@ static void nios2_semi_return_u64(CPUNios2State *env, uint64_t ret, int err)
     }
 }
 
-static int nios2_semi_is_lseek;
-
-static void nios2_semi_cb(CPUState *cs, uint64_t ret, int err)
-{
-    Nios2CPU *cpu = NIOS2_CPU(cs);
-    CPUNios2State *env = &cpu->env;
-
-    if (nios2_semi_is_lseek) {
-        /*
-         * FIXME: We've already lost the high bits of the lseek
-         * return value.
-         */
-        nios2_semi_return_u64(env, ret, err);
-        nios2_semi_is_lseek = 0;
-    } else {
-        nios2_semi_return_u32(env, ret, err);
-    }
-}
-
 /*
  * Read the input value from the argument block; fail the semihosting
  * call if the memory read fails.
@@ -168,6 +155,7 @@ static void nios2_semi_cb(CPUState *cs, uint64_t ret, int err)
 
 void do_nios2_semihosting(CPUNios2State *env)
 {
+    CPUState *cs = env_cpu(env);
     int nr;
     uint32_t args;
     target_ulong arg0, arg1, arg2, arg3;
@@ -188,7 +176,7 @@ void do_nios2_semihosting(CPUNios2State *env)
         GET_ARG(2);
         GET_ARG(3);
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(nios2_semi_cb, "open,%s,%x,%x", arg0, (int)arg1,
+            gdb_do_syscall(nios2_semi_u32_cb, "open,%s,%x,%x", arg0, (int)arg1,
                            arg2, arg3);
             return;
         } else {
@@ -209,7 +197,7 @@ void do_nios2_semihosting(CPUNios2State *env)
             int fd = arg0;
             if (fd > 2) {
                 if (use_gdb_syscalls()) {
-                    gdb_do_syscall(nios2_semi_cb, "close,%x", arg0);
+                    gdb_do_syscall(nios2_semi_u32_cb, "close,%x", arg0);
                     return;
                 } else {
                     result = close(fd);
@@ -225,7 +213,7 @@ void do_nios2_semihosting(CPUNios2State *env)
         GET_ARG(2);
         len = arg2;
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(nios2_semi_cb, "read,%x,%x,%x",
+            gdb_do_syscall(nios2_semi_u32_cb, "read,%x,%x,%x",
                            arg0, arg1, len);
             return;
         } else {
@@ -245,7 +233,7 @@ void do_nios2_semihosting(CPUNios2State *env)
         GET_ARG(2);
         len = arg2;
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(nios2_semi_cb, "write,%x,%x,%x",
+            gdb_do_syscall(nios2_semi_u32_cb, "write,%x,%x,%x",
                            arg0, arg1, len);
             return;
         } else {
@@ -268,12 +256,11 @@ void do_nios2_semihosting(CPUNios2State *env)
             GET_ARG(3);
             off = (uint32_t)arg2 | ((uint64_t)arg1 << 32);
             if (use_gdb_syscalls()) {
-                nios2_semi_is_lseek = 1;
-                gdb_do_syscall(nios2_semi_cb, "lseek,%x,%lx,%x",
+                gdb_do_syscall(nios2_semi_u64_cb, "lseek,%x,%lx,%x",
                                arg0, off, arg3);
             } else {
                 off = lseek(arg0, off, arg3);
-                nios2_semi_return_u64(env, off, errno);
+                nios2_semi_u64_cb(cs, off, errno);
             }
             return;
         }
@@ -283,7 +270,7 @@ void do_nios2_semihosting(CPUNios2State *env)
         GET_ARG(2);
         GET_ARG(3);
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(nios2_semi_cb, "rename,%s,%s",
+            gdb_do_syscall(nios2_semi_u32_cb, "rename,%s,%s",
                            arg0, (int)arg1, arg2, (int)arg3);
             return;
         } else {
@@ -303,7 +290,7 @@ void do_nios2_semihosting(CPUNios2State *env)
         GET_ARG(0);
         GET_ARG(1);
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(nios2_semi_cb, "unlink,%s",
+            gdb_do_syscall(nios2_semi_u32_cb, "unlink,%s",
                            arg0, (int)arg1);
             return;
         } else {
@@ -322,7 +309,7 @@ void do_nios2_semihosting(CPUNios2State *env)
         GET_ARG(1);
         GET_ARG(2);
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(nios2_semi_cb, "stat,%s,%x",
+            gdb_do_syscall(nios2_semi_u32_cb, "stat,%s,%x",
                            arg0, (int)arg1, arg2);
             return;
         } else {
@@ -345,7 +332,7 @@ void do_nios2_semihosting(CPUNios2State *env)
         GET_ARG(0);
         GET_ARG(1);
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(nios2_semi_cb, "fstat,%x,%x",
+            gdb_do_syscall(nios2_semi_u32_cb, "fstat,%x,%x",
                            arg0, arg1);
             return;
         } else {
@@ -361,7 +348,7 @@ void do_nios2_semihosting(CPUNios2State *env)
         /* Only the tv parameter is used.  tz is assumed NULL.  */
         GET_ARG(0);
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(nios2_semi_cb, "gettimeofday,%x,%x",
+            gdb_do_syscall(nios2_semi_u32_cb, "gettimeofday,%x,%x",
                            arg0, 0);
             return;
         } else {
@@ -382,7 +369,7 @@ void do_nios2_semihosting(CPUNios2State *env)
     case HOSTED_ISATTY:
         GET_ARG(0);
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(nios2_semi_cb, "isatty,%x", arg0);
+            gdb_do_syscall(nios2_semi_u32_cb, "isatty,%x", arg0);
             return;
         } else {
             result = isatty(arg0);
@@ -392,7 +379,7 @@ void do_nios2_semihosting(CPUNios2State *env)
         GET_ARG(0);
         GET_ARG(1);
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(nios2_semi_cb, "system,%s",
+            gdb_do_syscall(nios2_semi_u32_cb, "system,%s",
                            arg0, (int)arg1);
             return;
         } else {
@@ -412,5 +399,5 @@ void do_nios2_semihosting(CPUNios2State *env)
         result = 0;
     }
 failed:
-    nios2_semi_return_u32(env, result, errno);
+    nios2_semi_u32_cb(cs, result, errno);
 }
-- 
2.34.1


