Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0024C55BF02
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 09:17:26 +0200 (CEST)
Received: from localhost ([::1]:54754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o65TR-00059i-VV
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 03:17:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Jt-0002G1-AJ
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:59:25 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:46597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Jq-0000WI-V4
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:59:24 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 h9-20020a17090a648900b001ecb8596e43so11458083pjj.5
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p6Vm/V/7AHyeMphYYuV64Tllnf1xC7wkvKIiUvWLsiU=;
 b=r9g+7DyZlEnM489xOngVbdtCwnoggcctAVv/J8jg+bYXWMyd1X9wRO0Bsrxgm/kDBM
 eiELSPvosQv3Gl9b+hbdQCp89x0TIUkt2/GFyDp19Xd2Alq1yYCp5G+MBWTTt+khp3vM
 wULGllDb15zsnsoAIzKhtyOeBJs9KWo0YJNnf4Wpp9fDK/dSCaMw+z4wn6oJPmGDsfPE
 V4wVFHBQizcFikAz11iV5IGxz65m5RfOAsn8ajVjtuUg0BggDl1+trmcnHxECm5GlMN/
 dWBDpHPGOqSIuh1wwqWhwA8uB6ncw/lzhw3TdU7Hv8FdgLyd0Q0wsQsShu6FtYMfsQhm
 P4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p6Vm/V/7AHyeMphYYuV64Tllnf1xC7wkvKIiUvWLsiU=;
 b=XnRjkD/lbj4J7BSz9ic9d3leZd7I/JL7KoX2Oltdux1vk9PKvmAb+mnXwun2Xjsfw7
 3aw7m899R8mKX2gGshA+h4JcH6tZEpJaWOLo/V7mUndJM0J+alb+q6/+R31h4Ju0XO0Q
 ars7wEWokLqcd0vEf7t2nWET9ubUQd8CcRFpStJEnOsRubR6LpXUzZEJfYssX3asvUmg
 xsJT/6bP5tbICZZnjon3R8GZX4SH6M6LPsoNqlcgmWjp/1iV5Ep7SBXvWElIyBOXJWYT
 xh6wMF4kyNyUnhPRXbMYNwOOocZzY+r9Rgj9I1kKbfvdCKHzRAH0O2Z7Kllh8u9y5Rno
 PSDA==
X-Gm-Message-State: AJIora86lbJ07dKjq+BS60FGbfI2SrZUjnVq5qxZbsQIHLu650aoLm7b
 n68iVDnatUBdJuJ8yGLTU+Xf38GoYf4AMA==
X-Google-Smtp-Source: AGRyM1vdTPE0/nC/GqM8PcQ7Hss2K3veHi7NVsfBbE5sTJg7wxcT1OR3nbi2gA5RApa3dg9FfFda8Q==
X-Received: by 2002:a17:902:7282:b0:16b:7a53:3b41 with SMTP id
 d2-20020a170902728200b0016b7a533b41mr3028896pll.1.1656392362117; 
 Mon, 27 Jun 2022 21:59:22 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y7-20020aa78f27000000b00522c0a75c39sm8259686pfr.196.2022.06.27.21.59.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:59:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 54/60] target/m68k: Eliminate m68k_semi_is_fseek
Date: Tue, 28 Jun 2022 10:23:57 +0530
Message-Id: <20220628045403.508716-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/m68k-semi.c | 55 +++++++++++++++++------------------------
 1 file changed, 23 insertions(+), 32 deletions(-)

diff --git a/target/m68k/m68k-semi.c b/target/m68k/m68k-semi.c
index 8c186c0e9f..37b409b0b9 100644
--- a/target/m68k/m68k-semi.c
+++ b/target/m68k/m68k-semi.c
@@ -95,8 +95,11 @@ static void translate_stat(CPUM68KState *env, target_ulong addr, struct stat *s)
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
@@ -110,8 +113,11 @@ static void m68k_semi_return_u32(CPUM68KState *env, uint32_t ret, int err)
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
@@ -122,21 +128,6 @@ static void m68k_semi_return_u64(CPUM68KState *env, uint64_t ret, int err)
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
@@ -151,6 +142,7 @@ static void m68k_semi_cb(CPUState *cs, uint64_t ret, int err)
 
 void do_m68k_semihosting(CPUM68KState *env, int nr)
 {
+    CPUState *cs = env_cpu(env);
     uint32_t args;
     target_ulong arg0, arg1, arg2, arg3;
     void *p;
@@ -169,7 +161,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
         GET_ARG(2);
         GET_ARG(3);
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_cb, "open,%s,%x,%x", arg0, (int)arg1,
+            gdb_do_syscall(m68k_semi_u32_cb, "open,%s,%x,%x", arg0, (int)arg1,
                            arg2, arg3);
             return;
         } else {
@@ -190,7 +182,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
             int fd = arg0;
             if (fd > 2) {
                 if (use_gdb_syscalls()) {
-                    gdb_do_syscall(m68k_semi_cb, "close,%x", arg0);
+                    gdb_do_syscall(m68k_semi_u32_cb, "close,%x", arg0);
                     return;
                 } else {
                     result = close(fd);
@@ -206,7 +198,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
         GET_ARG(2);
         len = arg2;
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_cb, "read,%x,%x,%x",
+            gdb_do_syscall(m68k_semi_u32_cb, "read,%x,%x,%x",
                            arg0, arg1, len);
             return;
         } else {
@@ -226,7 +218,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
         GET_ARG(2);
         len = arg2;
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_cb, "write,%x,%x,%x",
+            gdb_do_syscall(m68k_semi_u32_cb, "write,%x,%x,%x",
                            arg0, arg1, len);
             return;
         } else {
@@ -249,12 +241,11 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
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
@@ -264,7 +255,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
         GET_ARG(2);
         GET_ARG(3);
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_cb, "rename,%s,%s",
+            gdb_do_syscall(m68k_semi_u32_cb, "rename,%s,%s",
                            arg0, (int)arg1, arg2, (int)arg3);
             return;
         } else {
@@ -284,7 +275,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
         GET_ARG(0);
         GET_ARG(1);
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_cb, "unlink,%s",
+            gdb_do_syscall(m68k_semi_u32_cb, "unlink,%s",
                            arg0, (int)arg1);
             return;
         } else {
@@ -303,7 +294,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
         GET_ARG(1);
         GET_ARG(2);
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_cb, "stat,%s,%x",
+            gdb_do_syscall(m68k_semi_u32_cb, "stat,%s,%x",
                            arg0, (int)arg1, arg2);
             return;
         } else {
@@ -325,7 +316,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
         GET_ARG(0);
         GET_ARG(1);
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_cb, "fstat,%x,%x",
+            gdb_do_syscall(m68k_semi_u32_cb, "fstat,%x,%x",
                            arg0, arg1);
             return;
         } else {
@@ -340,7 +331,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
         GET_ARG(0);
         GET_ARG(1);
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_cb, "gettimeofday,%x,%x",
+            gdb_do_syscall(m68k_semi_u32_cb, "gettimeofday,%x,%x",
                            arg0, arg1);
             return;
         } else {
@@ -361,7 +352,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
     case HOSTED_ISATTY:
         GET_ARG(0);
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_cb, "isatty,%x", arg0);
+            gdb_do_syscall(m68k_semi_u32_cb, "isatty,%x", arg0);
             return;
         } else {
             result = isatty(arg0);
@@ -371,7 +362,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
         GET_ARG(0);
         GET_ARG(1);
         if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_cb, "system,%s",
+            gdb_do_syscall(m68k_semi_u32_cb, "system,%s",
                            arg0, (int)arg1);
             return;
         } else {
@@ -429,5 +420,5 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
         result = 0;
     }
 failed:
-    m68k_semi_return_u32(env, result, errno);
+    m68k_semi_u32_cb(cs, result, errno);
 }
-- 
2.34.1


