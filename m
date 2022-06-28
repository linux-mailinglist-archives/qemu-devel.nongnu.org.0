Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9011055BF7E
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 10:39:41 +0200 (CEST)
Received: from localhost ([::1]:48134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o66l2-0002FT-Lf
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 04:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63K6-0002eu-DO
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:59:39 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:35588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63K2-0000XJ-CM
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:59:36 -0400
Received: by mail-pf1-x42a.google.com with SMTP id x4so10975509pfq.2
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=10UhMZtSJjpdAac+q1u2FCqNKjafnovkh9qR1nshVX4=;
 b=Lo/9JmnmMBmpr5i6MHz8gd6z+sojHbcUWqLVRihYdwwWIBn9u4ctLDhpd5Dgo1iQ34
 i1Y8YzcIigyE4nT6gqJY4w9P5ETwqCxh7TQU6LUTNvlN7GAiNbc5RucH7QDpF0NzPO8T
 j6LieHpMZeAIpYNV+yoXSuHGewi+X2xNhRiraA1IGia1yoH31aTaueBhBmKwQ3oQrITF
 ETNQCD6x7X5Vt0CqK0FUeemYVGzhxErrQ/Syw60tUWsbtc8Gs9Aw3NBPbIX3Bxt6WjYf
 1uOQkI2RpTLwetMJu+VHkJe0rxS6Rl5BHAb4k8b3nzlcBzhf3C3x3D6K74kf4POxRxZ7
 HthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=10UhMZtSJjpdAac+q1u2FCqNKjafnovkh9qR1nshVX4=;
 b=4VPs4GKHxLATCsbS1lcarELDQpGPy6FZel8Sm1AG2yVPkkq7Nk2B9Hl2GJUVULs2kd
 uXZ1Oa8bM0yZvB4jPShfv5D1tF6VtAeGqYfbktX+XQXmdooo1ZSfqionsnbQO7ppZy8r
 r/9/a5lmfUiDOv9qqzu5GvbpE++KXvmI1flYaLGIqZlk2RFDjQNXYMdUQ+5ER5HwQsEc
 vJutevWsH0Z8kpc570sN2ybtVf82x+59Z3gG2AjF0vOqJfHVuDHbAGCCKWVjUX1yqmu3
 urYJvZpdIkSWY7cbL0eWD9Q/p/y0ByGK9lVSNDP4L+cUJWuwZQM5Za7VmcBDw1AiNOms
 Pb2A==
X-Gm-Message-State: AJIora/OtwO48dEy+6koSf2LltnAQl/CgicE7XyiGB226YU3biPQ4NeY
 1UgGHD7XUqf+x33C4rMXvY26HA4rrgwfLg==
X-Google-Smtp-Source: AGRyM1sGMREdt6fbxKNRRpsFs+0zOC2GkpWfESSFyIAMdOHSXZ+JTfXM1lo4y24OnOgPG5/A0w6PTw==
X-Received: by 2002:a05:6a00:1da5:b0:522:cb12:549b with SMTP id
 z37-20020a056a001da500b00522cb12549bmr2767958pfw.81.1656392373618; 
 Mon, 27 Jun 2022 21:59:33 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y7-20020aa78f27000000b00522c0a75c39sm8259686pfr.196.2022.06.27.21.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:59:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 59/60] target/nios2: Eliminate nios2_semi_is_lseek
Date: Tue, 28 Jun 2022 10:24:02 +0530
Message-Id: <20220628045403.508716-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


