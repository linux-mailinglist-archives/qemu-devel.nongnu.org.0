Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8C6515DE7
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 15:53:49 +0200 (CEST)
Received: from localhost ([::1]:46656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nknXg-0006pd-6R
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 09:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAo-000511-Mu
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:30:10 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:42644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAl-0006Vq-Qk
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:30:10 -0400
Received: by mail-pg1-x532.google.com with SMTP id bg9so8493891pgb.9
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 06:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tSJK3mS4bOjkLh53cDYFX3XNRh44hRQ7vDXtW3G1P34=;
 b=tvvn4E23OxaJmGtQqlIGdSK46W6Le8Lz8VADY3KMfreXn71o0RD3AgBfjvx0Os34YE
 9nOmqEsDQCClYw6slIs4Lf7eWNOEUaAdUKTLSDtDMC5zEhGz3kNw2x/dGmxwme8yTGG1
 CQojwGJKIzsKvjeRbRotxk+aSq1Ky+kjqLW9kiX+zzv1uoiGdrAlAJmDI2Joh+t3/gnY
 fJdekva5L/OgePMaemI59W5JA7cNVi5xtKw/T6moViB+Ny9p4e5U0i+1lDUvdtTNNnaG
 MNqA/KZeVTtBjCcODkx3zkLhzk/rVZqkLp8+QKQxMYw7oSgABO/cDGrriQaleyWTffaa
 bGlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tSJK3mS4bOjkLh53cDYFX3XNRh44hRQ7vDXtW3G1P34=;
 b=RDpUip4BwuWISaHMMXUKckiRyT3iDNK8c5HRKvfvh5x+aHuP1Bvr/ARSV08vvu9dC4
 UKlRjZ54yorqDE707T/F8Lf+pLuefw6jap7lonBhg+6ybWBNfnubJO8HQEopnJu8u8/6
 U9M7K9BInaFAnXt/Rbmw2a2wAPZV7uWQZ7M2Ds7JriIKILoCmsdljxjVocX+Uk/C5UVl
 37tXKYTFqoq3OyTXCMbMuU5uC4LeGefLEw5oOHpY3Y+xRh4p9TW1LfjQJbBozpigH9ki
 Xz/jwk+aPU4iuhg4DJrvBUh9bqMLUnLsvPzwE2r9lfj/HplsZLZ1srcEjRSKFSlYNpZT
 fBLQ==
X-Gm-Message-State: AOAM530/+p3uEwI7bAtXW8n+VA35kvz1YNuhQUl1eobxi+uETJrbDUQc
 iuCF+6BUbKCT77r5bcEHZtVlY42kpC1EKg==
X-Google-Smtp-Source: ABdhPJwmDCZmAJ/ogRmL6quBbKpDCIQF3fyXUCmSylBgCKgimdQkb9wMSkQit6e8ZnAtipWVWupfHA==
X-Received: by 2002:a63:f954:0:b0:3a8:2153:78fb with SMTP id
 q20-20020a63f954000000b003a8215378fbmr3149883pgk.8.1651325406539; 
 Sat, 30 Apr 2022 06:30:06 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 x5-20020aa793a5000000b0050dc7628201sm1522606pff.219.2022.04.30.06.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:30:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 33/43] gdbstub: Widen gdb_syscall_complete_cb return value
Date: Sat, 30 Apr 2022 06:29:22 -0700
Message-Id: <20220430132932.324018-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430132932.324018-1-richard.henderson@linaro.org>
References: <20220430132932.324018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: crwulff@gmail.com, alex.bennee@linaro.org, f4bug@amsat.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Always pass a uint64_t.  This resolves a FIXME in the
m68k and nios2 semihosting that we've lost data.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/gdbstub.h        |  3 +--
 gdbstub.c                     |  7 ++++---
 semihosting/arm-compat-semi.c |  9 ++++-----
 semihosting/console.c         |  7 +++----
 semihosting/guestfd.c         |  2 +-
 target/m68k/m68k-semi.c       | 10 +++-------
 target/nios2/nios2-semi.c     |  8 +++-----
 7 files changed, 19 insertions(+), 27 deletions(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index a7d3bfd5d4..22b386ff65 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -53,8 +53,7 @@ struct gdb_timeval {
 #ifdef NEED_CPU_H
 #include "cpu.h"
 
-typedef void (*gdb_syscall_complete_cb)(CPUState *cpu,
-                                        target_ulong ret, target_ulong err);
+typedef void (*gdb_syscall_complete_cb)(CPUState *cpu, uint64_t ret, int err);
 
 /**
  * gdb_do_syscall:
diff --git a/gdbstub.c b/gdbstub.c
index a3ff8702ce..5286253f8a 100644
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
index 61e8dede8d..ad0df6eabf 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -216,7 +216,7 @@ static inline uint32_t get_swi_errno(CPUState *cs)
 #endif
 }
 
-static void common_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
+static void common_semi_cb(CPUState *cs, uint64_t ret, int err)
 {
     if (err) {
 #ifdef CONFIG_USER_ONLY
@@ -233,7 +233,7 @@ static void common_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
  * SYS_READ and SYS_WRITE always return the number of bytes not read/written.
  * There is no error condition, other than returning the original length.
  */
-static void common_semi_rw_cb(CPUState *cs, target_ulong ret, target_ulong err)
+static void common_semi_rw_cb(CPUState *cs, uint64_t ret, int err)
 {
     /* Recover the original length from the third argument. */
     CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
@@ -250,8 +250,7 @@ static void common_semi_rw_cb(CPUState *cs, target_ulong ret, target_ulong err)
 /*
  * SYS_SEEK returns 0 on success, not the resulting offset.
  */
-static void common_semi_seek_cb(CPUState *cs, target_ulong ret,
-                                target_ulong err)
+static void common_semi_seek_cb(CPUState *cs, uint64_t ret, int err)
 {
     if (!err) {
         ret = 0;
@@ -272,7 +271,7 @@ static target_ulong common_semi_flen_buf(CPUState *cs)
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
 
diff --git a/semihosting/guestfd.c b/semihosting/guestfd.c
index cb9eab9587..341113f939 100644
--- a/semihosting/guestfd.c
+++ b/semihosting/guestfd.c
@@ -179,7 +179,7 @@ static int validate_lock_user_string(char **pstr, CPUState *cs,
 
 static gdb_syscall_complete_cb gdb_open_complete;
 
-static void gdb_open_cb(CPUState *cs, target_ulong ret, target_ulong err)
+static void gdb_open_cb(CPUState *cs, uint64_t ret, int err)
 {
     if (!err) {
         int guestfd = alloc_guestfd();
diff --git a/target/m68k/m68k-semi.c b/target/m68k/m68k-semi.c
index da0186f3ef..94deebf09e 100644
--- a/target/m68k/m68k-semi.c
+++ b/target/m68k/m68k-semi.c
@@ -93,7 +93,7 @@ static void translate_stat(CPUM68KState *env, target_ulong addr, struct stat *s)
     unlock_user(p, addr, sizeof(struct gdb_stat));
 }
 
-static void m68k_semi_return_u32(CPUM68KState *env, uint32_t ret, uint32_t err)
+static void m68k_semi_return_u32(CPUM68KState *env, uint32_t ret, int err)
 {
     target_ulong args = env->dregs[1];
     if (put_user_u32(ret, args) ||
@@ -108,7 +108,7 @@ static void m68k_semi_return_u32(CPUM68KState *env, uint32_t ret, uint32_t err)
     }
 }
 
-static void m68k_semi_return_u64(CPUM68KState *env, uint64_t ret, uint32_t err)
+static void m68k_semi_return_u64(CPUM68KState *env, uint64_t ret, int err)
 {
     target_ulong args = env->dregs[1];
     if (put_user_u32(ret >> 32, args) ||
@@ -122,16 +122,12 @@ static void m68k_semi_return_u64(CPUM68KState *env, uint64_t ret, uint32_t err)
 
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


