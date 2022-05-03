Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD5D518F15
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:41:38 +0200 (CEST)
Received: from localhost ([::1]:40512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlzKz-0004xn-AH
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZY-00082r-A8
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:36 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:51894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZW-0006Ji-Du
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:36 -0400
Received: by mail-pj1-x102e.google.com with SMTP id p6so16255722pjm.1
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=wppbnjnSPA38ZbueUEu4qjUCfA8mLgkrGrV5gfq7DgQ=;
 b=F1Sb3G8Fjs8G3ejJ3CdntYiRLb6RIai5QloswbaxCxNVeEo/iCYnHVclSOjU2eBm/n
 cTHzD7k0rxrHggiBmmgCyFr4Uo0T1npYb2VFBG4dxOCXIaM66AItDycYT6lGw0WB8i8K
 v0H7m8OaUw9rrWu9ZXVFPsGSSYpFTAAvnj0rs5cukwfMJtZEL4uJvZDSeA08dtIKqFRD
 IUqHgW7gigODgarEY8LADShS0BYf00pFLQWrdbahPUJra2abshjA4Spuu6EyWUAu/iOF
 ty+wyKwnZrqdHYZzMjlaRE+mHzUcqmCIT2iJHmflQyfC+myCRkT7JMx1LavUtZ0I2NJ6
 wb4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wppbnjnSPA38ZbueUEu4qjUCfA8mLgkrGrV5gfq7DgQ=;
 b=xXTd+nDjp3BHG64JOrvraqTBxTX/4wDcsZ9WvG+XQYZwTknIwS0mtzOGbqJpJ17IoK
 Sh7cTqD3ScMxPXYrJ2cFNTPSErIoAxdosO2yMy/5LVzI7+QRptazFIV7jzwsI14rVpbn
 EjAqzwbz3WYhIATvWzCGwTZZHUABtpy5pF3tXDnRSnU2uJxPwhbMvf+vsy7Dk7nVHce1
 chx2fVAGmUtWJQrl3PNd48IwkF7LYSPAj7j6Vivq4huTwR5b13n9ZYTFW5wgNnCoGn/O
 hDG4JZM40XbozekWpDCnHPuuU5vLsSs+KWYNTTVrUZD3WHeed9U3a/3LsKEOejIOpUoc
 4JHQ==
X-Gm-Message-State: AOAM530VNs3xjOmV+Ud+6PvljidykOrd3OuytQvVmI8F2i5DFipzSrME
 IwHmlIf27kaJcd3OiI4vOeV77lxYYWvpSQ==
X-Google-Smtp-Source: ABdhPJwUUq20opwTC8fbvnL30nLUDX0pWyS+fnta+ROAjoiUDJBwPc7Oe/XukqlQ4/zdtblqtEQb4g==
X-Received: by 2002:a17:90b:33ca:b0:1d4:d5ab:40b0 with SMTP id
 lk10-20020a17090b33ca00b001d4d5ab40b0mr6571089pjb.96.1651607553199; 
 Tue, 03 May 2022 12:52:33 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 fz16-20020a17090b025000b001dbe11be891sm1692286pjb.44.2022.05.03.12.52.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:52:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 48/74] target/m68k: Eliminate m68k_semi_is_fseek
Date: Tue,  3 May 2022 12:48:17 -0700
Message-Id: <20220503194843.1379101-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

Reorg m68k_semi_return_* to gdb_syscall_complete_cb.
Use the 32-bit version normally, and the 64-bit version
for HOSTED_LSEEK.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/m68k-semi.c | 55 +++++++++++++++++------------------------
 1 file changed, 23 insertions(+), 32 deletions(-)

diff --git a/target/m68k/m68k-semi.c b/target/m68k/m68k-semi.c
index 94deebf09e..5b4c51957e 100644
--- a/target/m68k/m68k-semi.c
+++ b/target/m68k/m68k-semi.c
@@ -93,8 +93,11 @@ static void translate_stat(CPUM68KState *env, target_ulong addr, struct stat *s)
     unlock_user(p, addr, sizeof(struct gdb_stat));
 }
 
-static void m68k_semi_return_u32(CPUM68KState *env, uint32_t ret, int err)
+static void m68k_semi_u32_cb(CPUState *cs, uint64_t ret, int err)
 {
+    M68kCPU *cpu = M68K_CPU(cs);
+    CPUM68KState *env = &cpu->env;
+
     target_ulong args = env->dregs[1];
     if (put_user_u32(ret, args) ||
         put_user_u32(err, args + 4)) {
@@ -108,8 +111,11 @@ static void m68k_semi_return_u32(CPUM68KState *env, uint32_t ret, int err)
     }
 }
 
-static void m68k_semi_return_u64(CPUM68KState *env, uint64_t ret, int err)
+static void m68k_semi_u64_cb(CPUState *cs, uint64_t ret, int err)
 {
+    M68kCPU *cpu = M68K_CPU(cs);
+    CPUM68KState *env = &cpu->env;
+
     target_ulong args = env->dregs[1];
     if (put_user_u32(ret >> 32, args) ||
         put_user_u32(ret, args + 4) ||
@@ -120,21 +126,6 @@ static void m68k_semi_return_u64(CPUM68KState *env, uint64_t ret, int err)
     }
 }
 
-static int m68k_semi_is_fseek;
-
-static void m68k_semi_cb(CPUState *cs, uint64_t ret, int err)
-{
-    M68kCPU *cpu = M68K_CPU(cs);
-    CPUM68KState *env = &cpu->env;
-
-    if (m68k_semi_is_fseek) {
-        m68k_semi_return_u64(env, ret, err);
-        m68k_semi_is_fseek = 0;
-    } else {
-        m68k_semi_return_u32(env, ret, err);
-    }
-}
-
 /*
  * Read the input value from the argument block; fail the semihosting
  * call if the memory read fails.
@@ -149,6 +140,7 @@ static void m68k_semi_cb(CPUState *cs, uint64_t ret, int err)
 
 void do_m68k_semihosting(CPUM68KState *env, int nr)
 {
+    CPUState *cs = env_cpu(env);
     uint32_t args;
     target_ulong arg0, arg1, arg2, arg3;
     void *p;
@@ -167,7 +159,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
         GET_ARG(2);
         GET_ARG(3);
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_cb, "open,%s,%x,%x", arg0, (int)arg1,
+            gdb_do_syscall(m68k_semi_u32_cb, "open,%s,%x,%x", arg0, (int)arg1,
                            arg2, arg3);
             return;
         } else {
@@ -188,7 +180,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
             int fd = arg0;
             if (fd > 2) {
                 if (use_gdb_syscalls()) {
-                    gdb_do_syscall(m68k_semi_cb, "close,%x", arg0);
+                    gdb_do_syscall(m68k_semi_u32_cb, "close,%x", arg0);
                     return;
                 } else {
                     result = close(fd);
@@ -204,7 +196,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
         GET_ARG(2);
         len = arg2;
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_cb, "read,%x,%x,%x",
+            gdb_do_syscall(m68k_semi_u32_cb, "read,%x,%x,%x",
                            arg0, arg1, len);
             return;
         } else {
@@ -224,7 +216,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
         GET_ARG(2);
         len = arg2;
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_cb, "write,%x,%x,%x",
+            gdb_do_syscall(m68k_semi_u32_cb, "write,%x,%x,%x",
                            arg0, arg1, len);
             return;
         } else {
@@ -247,12 +239,11 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
             GET_ARG(3);
             off = (uint32_t)arg2 | ((uint64_t)arg1 << 32);
             if (use_gdb_syscalls()) {
-                m68k_semi_is_fseek = 1;
-                gdb_do_syscall(m68k_semi_cb, "fseek,%x,%lx,%x",
+                gdb_do_syscall(m68k_semi_u64_cb, "fseek,%x,%lx,%x",
                                arg0, off, arg3);
             } else {
                 off = lseek(arg0, off, arg3);
-                m68k_semi_return_u64(env, off, errno);
+                m68k_semi_u64_cb(cs, off, errno);
             }
             return;
         }
@@ -262,7 +253,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
         GET_ARG(2);
         GET_ARG(3);
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_cb, "rename,%s,%s",
+            gdb_do_syscall(m68k_semi_u32_cb, "rename,%s,%s",
                            arg0, (int)arg1, arg2, (int)arg3);
             return;
         } else {
@@ -282,7 +273,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
         GET_ARG(0);
         GET_ARG(1);
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_cb, "unlink,%s",
+            gdb_do_syscall(m68k_semi_u32_cb, "unlink,%s",
                            arg0, (int)arg1);
             return;
         } else {
@@ -301,7 +292,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
         GET_ARG(1);
         GET_ARG(2);
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_cb, "stat,%s,%x",
+            gdb_do_syscall(m68k_semi_u32_cb, "stat,%s,%x",
                            arg0, (int)arg1, arg2);
             return;
         } else {
@@ -323,7 +314,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
         GET_ARG(0);
         GET_ARG(1);
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_cb, "fstat,%x,%x",
+            gdb_do_syscall(m68k_semi_u32_cb, "fstat,%x,%x",
                            arg0, arg1);
             return;
         } else {
@@ -338,7 +329,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
         GET_ARG(0);
         GET_ARG(1);
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_cb, "gettimeofday,%x,%x",
+            gdb_do_syscall(m68k_semi_u32_cb, "gettimeofday,%x,%x",
                            arg0, arg1);
             return;
         } else {
@@ -359,7 +350,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
     case HOSTED_ISATTY:
         GET_ARG(0);
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_cb, "isatty,%x", arg0);
+            gdb_do_syscall(m68k_semi_u32_cb, "isatty,%x", arg0);
             return;
         } else {
             result = isatty(arg0);
@@ -369,7 +360,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
         GET_ARG(0);
         GET_ARG(1);
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_cb, "system,%s",
+            gdb_do_syscall(m68k_semi_u32_cb, "system,%s",
                            arg0, (int)arg1);
             return;
         } else {
@@ -427,5 +418,5 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
         result = 0;
     }
 failed:
-    m68k_semi_return_u32(env, result, errno);
+    m68k_semi_u32_cb(cs, result, errno);
 }
-- 
2.34.1


