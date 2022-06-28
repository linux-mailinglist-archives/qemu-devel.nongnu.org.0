Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 902D055BEC0
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 08:28:40 +0200 (CEST)
Received: from localhost ([::1]:53252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o64iF-0004Hf-Kw
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 02:28:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63JN-0001ti-Fr
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:58:55 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:36398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63JL-0000Vf-LD
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:58:53 -0400
Received: by mail-pg1-x536.google.com with SMTP id s206so2079554pgs.3
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cXIVhOFx1yMV+bG8yPyaI+livennK38GrI/+kr+nCDk=;
 b=EKxs+YcU21PxxjEw2ajYqdvUpW+TcMrqjfmU/UYPKoX1dlrp/jmtiLmonfbZM9CTTE
 4ovcjkE+z5YZwBSbwkLJtsoZbOCOyHBEANBQrZQZR+K7N2yKFmZNzFJQZBNsV0/IYv/4
 Z+/tPgAJpAwLF8lCWyk69/z3/QHk3u1uWjH8QPzSkppmCwrDHg52iNp5WLTaNnMWiLRt
 VoOSm3+mCDG22Efh2yTf9zvCJ1mz9036bdO/aXn2jydmowDjA61AtuZyzxiU5qkQPNca
 0kQjoLbHVVfdN6P+2YpFEyTug7moZQJDZCOVrzuRD/Dgo590YgSPOczXHgwb4birqFbX
 bWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cXIVhOFx1yMV+bG8yPyaI+livennK38GrI/+kr+nCDk=;
 b=qTGLhf/9fD6ENyimYtfAZatzSdZ42FIJ+2KuuJo7qm5XqAh6AiaIcg/bAuwg7Txl09
 yRXGFQgKORIHLlB2sxdgo1v47Jnu0ttoS1uU7v91SyCKuA68Qbp4R31v8Sfrj6dh3XNJ
 XlnG3k0m1mmaVP+nDLvFvbkSAISVyxDhhZPawovj2Ipk5T24ofA4B3A/HCyfxj+JKndq
 I5cEYs274+ywx8jzxfbVyyr4DkNdPtZ0DQ9LzV+3dphWrk4wK07b6fuFvsiLIEKfcYIs
 jTmDc9PqfoiOxriquNMLQBJ4LrCQ2SISpiDBX1Z1tg5I2JTbgB9nISqnHh7uTZPiJ0nU
 FUGw==
X-Gm-Message-State: AJIora/kf15NDuvS9Uu1cmhgKi6VLG5yMAMPSsgPML2MZ+m8J5Bke2xD
 nZaY87dEWx+P1hSpNjV7uVk07CCKHep39g==
X-Google-Smtp-Source: AGRyM1uS2iNgzUWKD/H6rKl6NZAMoyluy118CayX8IXOl5h2DeABcMYUU8iFDcXd205qJRocP5N0Lw==
X-Received: by 2002:a65:6045:0:b0:399:3a5e:e25a with SMTP id
 a5-20020a656045000000b003993a5ee25amr16325911pgp.139.1656392330295; 
 Mon, 27 Jun 2022 21:58:50 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y7-20020aa78f27000000b00522c0a75c39sm8259686pfr.196.2022.06.27.21.58.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:58:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Luc Michel <lmichel@kalray.eu>
Subject: [PULL 40/60] gdbstub: Adjust gdb_syscall_complete_cb declaration
Date: Tue, 28 Jun 2022 10:23:43 +0530
Message-Id: <20220628045403.508716-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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

Reviewed-by: Luc Michel <lmichel@kalray.eu>
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
index f3a4664453..cf869b10e3 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1878,11 +1878,12 @@ static void handle_read_all_regs(GArray *params, void *user_ctx)
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
index 7ab6afd7fc..1b0505987a 100644
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
index ef6958d844..4e49202b2a 100644
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
+        qemu_log("%s: gdb console output failed (%d)\n", __func__, err);
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


