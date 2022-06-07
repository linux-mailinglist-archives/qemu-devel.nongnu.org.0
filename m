Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FF8541E77
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:32:33 +0200 (CEST)
Received: from localhost ([::1]:57152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyhkW-0003UW-Bh
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:32:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg92-0005ef-HW
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:49:46 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:40856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg8w-0001oc-7k
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:49:42 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 w13-20020a17090a780d00b001e8961b355dso4740640pjk.5
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=2QV6Z5mGxNEu7A6+PkUh39CG6ZEMqsAUtAKGx6Ugq74=;
 b=bRgDh6PDc9K2cHxxUNMY/rPH6bJfjrzhz63nnma/RG6pfiNvmcjOJiQbhKsv0z9H0I
 s0ZYsB68IZkahIf4Fy+vwsQHwD+Qc+D8Q87iFFfvDIo0dHKAdRW/w2FKnr5YKvdruFEY
 C/ZID0nj7ONzstwePqy0mZ3X5UfsWvvNud+HdTz8G53j2NOXPdt5J8ydSjPLEooSucpc
 pUS7oWDEGYbzyv1Xues/fGXmvi+2F/1DjO565B1lB2zMkGys9SAdm7OWLJgG+ygorPj9
 EIhEWZrhjeMGU8nQL6b4K6Cf9UqSxs1wAaWbxK7Oj8Elvb6+N09qlk70prMg9xPQc0nM
 ta3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2QV6Z5mGxNEu7A6+PkUh39CG6ZEMqsAUtAKGx6Ugq74=;
 b=BcGkt1htM/oUjm1eImYFi5XXOhaEOd0pIPcVIq6RVYrKAc+OR0vbkiaDWY1fYkNbo2
 9r6vznJOiBQ/a1jbu/03DYa4UrL33Vg7URfKW33UQ8DV4YnTKslPc4/Be/3Wa19VhLM5
 fnmgLArp64vONCThKVoCR1cLMh8Jdnw617iWwA0664XLcHSekLCcSabA0eRoJyUFHI7h
 BOfZb1ux8uSOtvyDgeS8DPNRjNDahDlBpI9iwfuA6ypBzGycLXl4b+xG0r1e60wEo9YP
 mCnwA5naWWhzjaHaTKInqRpca/KN8UGg7UXfm4YTy23PyODb8d5tLLjGqyR4txkUJgPT
 Vv1g==
X-Gm-Message-State: AOAM53116yt6fgJtd6459OxTch3ucRorveLANBpJ0In4UXDcrFhNLjrZ
 6H4YzX/+zimTWkjg4taBEHfM39194/qaRA==
X-Google-Smtp-Source: ABdhPJwhcsQnZpmABNltI5AJO9PXsZ0j3RG5YrLFCEG7qU3lzoRXB3j048minXU6izc14bXaJbSplg==
X-Received: by 2002:a17:90b:23d8:b0:1e2:e3cb:ac08 with SMTP id
 md24-20020a17090b23d800b001e2e3cbac08mr34227206pjb.35.1654634975449; 
 Tue, 07 Jun 2022 13:49:35 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 128-20020a620686000000b00518b4cfbbe0sm13152327pfg.203.2022.06.07.13.49.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:49:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 40/53] gdbstub: Adjust gdb_syscall_complete_cb declaration
Date: Tue,  7 Jun 2022 13:45:44 -0700
Message-Id: <20220607204557.658541-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

Change 'ret' to uint64_t.  This resolves a FIXME in the
m68k and nios2 semihosting that we've lost data.
Change 'err' to int.  There is nothing target-specific
about the width of the errno value.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/gdbstub.h        |  3 +--
 gdbstub.c                     |  7 ++++---
 semihosting/arm-compat-semi.c | 12 +++++-------
 semihosting/console.c         |  7 +++----
 semihosting/syscalls.c        |  2 +-
 target/m68k/m68k-semi.c       | 10 +++-------
 target/nios2/nios2-semi.c     |  8 +++-----
 7 files changed, 20 insertions(+), 29 deletions(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index b588c306cc..f667014888 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -74,8 +74,7 @@ struct gdb_timeval {
 #ifdef NEED_CPU_H
 #include "cpu.h"
 
-typedef void (*gdb_syscall_complete_cb)(CPUState *cpu,
-                                        target_ulong ret, target_ulong err);
+typedef void (*gdb_syscall_complete_cb)(CPUState *cpu, uint64_t ret, int err);
 
 /**
  * gdb_do_syscall:
diff --git a/gdbstub.c b/gdbstub.c
index ecc9d9cd6f..f7cf33a327 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1870,11 +1870,12 @@ static void handle_read_all_regs(GArray *params, void *user_ctx)
 static void handle_file_io(GArray *params, void *user_ctx)
 {
     if (params->len >= 1 && gdbserver_state.current_syscall_cb) {
-        target_ulong ret, err;
+        uint64_t ret;
+        int err;
 
-        ret = (target_ulong)get_param(params, 0)->val_ull;
+        ret = get_param(params, 0)->val_ull;
         if (params->len >= 2) {
-            err = (target_ulong)get_param(params, 1)->val_ull;
+            err = get_param(params, 1)->val_ull;
         } else {
             err = 0;
         }
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 8a4e22a20a..f992b60b6b 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -215,7 +215,7 @@ static inline uint32_t get_swi_errno(CPUState *cs)
 #endif
 }
 
-static void common_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
+static void common_semi_cb(CPUState *cs, uint64_t ret, int err)
 {
     if (err) {
 #ifdef CONFIG_USER_ONLY
@@ -232,7 +232,7 @@ static void common_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
  * SYS_READ and SYS_WRITE always return the number of bytes not read/written.
  * There is no error condition, other than returning the original length.
  */
-static void common_semi_rw_cb(CPUState *cs, target_ulong ret, target_ulong err)
+static void common_semi_rw_cb(CPUState *cs, uint64_t ret, int err)
 {
     /* Recover the original length from the third argument. */
     CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
@@ -251,8 +251,7 @@ static void common_semi_rw_cb(CPUState *cs, target_ulong ret, target_ulong err)
  * Convert from Posix ret+errno to Arm SYS_ISTTY return values.
  * With gdbstub, err is only ever set for protocol errors to EIO.
  */
-static void common_semi_istty_cb(CPUState *cs, target_ulong ret,
-                                 target_ulong err)
+static void common_semi_istty_cb(CPUState *cs, uint64_t ret, int err)
 {
     if (err) {
         ret = (err == ENOTTY ? 0 : -1);
@@ -263,8 +262,7 @@ static void common_semi_istty_cb(CPUState *cs, target_ulong ret,
 /*
  * SYS_SEEK returns 0 on success, not the resulting offset.
  */
-static void common_semi_seek_cb(CPUState *cs, target_ulong ret,
-                                target_ulong err)
+static void common_semi_seek_cb(CPUState *cs, uint64_t ret, int err)
 {
     if (!err) {
         ret = 0;
@@ -285,7 +283,7 @@ static target_ulong common_semi_flen_buf(CPUState *cs)
 }
 
 static void
-common_semi_flen_fstat_cb(CPUState *cs, target_ulong ret, target_ulong err)
+common_semi_flen_fstat_cb(CPUState *cs, uint64_t ret, int err)
 {
     if (!err) {
         /* The size is always stored in big-endian order, extract the value. */
diff --git a/semihosting/console.c b/semihosting/console.c
index ef6958d844..3dd0ac60e2 100644
--- a/semihosting/console.c
+++ b/semihosting/console.c
@@ -64,11 +64,10 @@ static GString *copy_user_string(CPUArchState *env, target_ulong addr)
     return s;
 }
 
-static void semihosting_cb(CPUState *cs, target_ulong ret, target_ulong err)
+static void semihosting_cb(CPUState *cs, uint64_t ret, int err)
 {
-    if (ret == (target_ulong) -1) {
-        qemu_log("%s: gdb console output failed ("TARGET_FMT_ld")",
-                 __func__, err);
+    if (err) {
+        qemu_log("%s: gdb console output failed (%d)", __func__, err);
     }
 }
 
diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index db1e9f6cc9..13a9bdeda6 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -115,7 +115,7 @@ static int copy_stat_to_user(CPUState *cs, target_ulong addr,
 
 static gdb_syscall_complete_cb gdb_open_complete;
 
-static void gdb_open_cb(CPUState *cs, target_ulong ret, target_ulong err)
+static void gdb_open_cb(CPUState *cs, uint64_t ret, int err)
 {
     if (!err) {
         int guestfd = alloc_guestfd();
diff --git a/target/m68k/m68k-semi.c b/target/m68k/m68k-semi.c
index b886ebf714..8c186c0e9f 100644
--- a/target/m68k/m68k-semi.c
+++ b/target/m68k/m68k-semi.c
@@ -95,7 +95,7 @@ static void translate_stat(CPUM68KState *env, target_ulong addr, struct stat *s)
     unlock_user(p, addr, sizeof(struct gdb_stat));
 }
 
-static void m68k_semi_return_u32(CPUM68KState *env, uint32_t ret, uint32_t err)
+static void m68k_semi_return_u32(CPUM68KState *env, uint32_t ret, int err)
 {
     target_ulong args = env->dregs[1];
     if (put_user_u32(ret, args) ||
@@ -110,7 +110,7 @@ static void m68k_semi_return_u32(CPUM68KState *env, uint32_t ret, uint32_t err)
     }
 }
 
-static void m68k_semi_return_u64(CPUM68KState *env, uint64_t ret, uint32_t err)
+static void m68k_semi_return_u64(CPUM68KState *env, uint64_t ret, int err)
 {
     target_ulong args = env->dregs[1];
     if (put_user_u32(ret >> 32, args) ||
@@ -124,16 +124,12 @@ static void m68k_semi_return_u64(CPUM68KState *env, uint64_t ret, uint32_t err)
 
 static int m68k_semi_is_fseek;
 
-static void m68k_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
+static void m68k_semi_cb(CPUState *cs, uint64_t ret, int err)
 {
     M68kCPU *cpu = M68K_CPU(cs);
     CPUM68KState *env = &cpu->env;
 
     if (m68k_semi_is_fseek) {
-        /*
-         * FIXME: We've already lost the high bits of the fseek
-         * return value.
-         */
         m68k_semi_return_u64(env, ret, err);
         m68k_semi_is_fseek = 0;
     } else {
diff --git a/target/nios2/nios2-semi.c b/target/nios2/nios2-semi.c
index 3e504a6c5f..4d02789d26 100644
--- a/target/nios2/nios2-semi.c
+++ b/target/nios2/nios2-semi.c
@@ -108,8 +108,7 @@ static bool translate_stat(CPUNios2State *env, target_ulong addr,
     return true;
 }
 
-static void nios2_semi_return_u32(CPUNios2State *env, uint32_t ret,
-                                  uint32_t err)
+static void nios2_semi_return_u32(CPUNios2State *env, uint32_t ret, int err)
 {
     target_ulong args = env->regs[R_ARG1];
     if (put_user_u32(ret, args) ||
@@ -124,8 +123,7 @@ static void nios2_semi_return_u32(CPUNios2State *env, uint32_t ret,
     }
 }
 
-static void nios2_semi_return_u64(CPUNios2State *env, uint64_t ret,
-                                  uint32_t err)
+static void nios2_semi_return_u64(CPUNios2State *env, uint64_t ret, int err)
 {
     target_ulong args = env->regs[R_ARG1];
     if (put_user_u32(ret >> 32, args) ||
@@ -139,7 +137,7 @@ static void nios2_semi_return_u64(CPUNios2State *env, uint64_t ret,
 
 static int nios2_semi_is_lseek;
 
-static void nios2_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
+static void nios2_semi_cb(CPUState *cs, uint64_t ret, int err)
 {
     Nios2CPU *cpu = NIOS2_CPU(cs);
     CPUNios2State *env = &cpu->env;
-- 
2.34.1


