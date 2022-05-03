Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B177518EDC
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:32:52 +0200 (CEST)
Received: from localhost ([::1]:50136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlzCV-0005ok-60
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:32:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyWW-0002Hu-M1
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:29 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:42888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyWR-0003ce-0q
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:26 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 l11-20020a17090a49cb00b001d923a9ca99so2886841pjm.1
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=FaPp6XMU7/QLI/fAkjMpx5RbKj4Bgtv2vep9zbLkpHY=;
 b=ax+W/n2d7bqc2OJ/9rHUUHWAnnHPgCuat4gaYC3uFZz4gyIbIefpFChRPjc+cn/iq4
 +NOf5OYCzPoLy13KRrUWpKQAXtme8HLuHoaDp/P6STHUltJBKwhr2RSX6zmud0VTcphk
 np5cQSfidafO0Zi/r7qY8XzQJXeXbdpY2u0v9fbA5idupuNonaNpyCl2stmOhysa8cT6
 TdOvjBbX5IlbH8heZR2OrHv1szC/uCZvKDlhoma8Ej9HO75EDgbJziklmyTHcYlAi2YC
 Pga5zDcFGIxincDa/D7fIPewW9UXdPlJKrCFAJtIV647qR61Qgr8Mdy9FMcd/pwerbdx
 +SDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FaPp6XMU7/QLI/fAkjMpx5RbKj4Bgtv2vep9zbLkpHY=;
 b=7GSaNFIOqylN8Xv41tncnyongrg8KQ1+KijjS0YuVTT1k4mARsF8hIUy0h83g05kaQ
 P3EBhj2dFF2/K8Pwhe72nKO18nWMYZrmxRXrOnTH186lZWXprdsSEQ0kfdI8qKNONXvg
 QlRrHQCKrlhbJp6YwL1wsgAX1OSuyLjvLsOgBCU3HTxv/60rOQ5Rx/5Yoo6tM5wDP+pO
 wA0/pj2K0B9/s8CCtLoxn2kHJNcCvM+yM9JOUdYTFc7y8vFY6lMoegc63+r44S7j8J0W
 3n77wlS85Hc5yjLmTx2TErtP8K8XgYsBuQABPockB1nVHebuYpN2yDIZ92wAjQpXfsYB
 dl3Q==
X-Gm-Message-State: AOAM530mHs0T5QtzudKCpVbTamRVd8gmu9fTJOpLP9VQxSvSPMsRZF61
 LmSvwhGW+kZKbb93EBpE07nHVkvrvAkGHA==
X-Google-Smtp-Source: ABdhPJwu3SPRx9/aHsiSyp+si8ksIOhbRdBOHYdO6AszGdv1Vh3fr4Ux5sm5JgU5eSzy6nMOXHn53g==
X-Received: by 2002:a17:902:c2cc:b0:15b:a4e6:f58c with SMTP id
 c12-20020a170902c2cc00b0015ba4e6f58cmr17825157pla.149.1651607359169; 
 Tue, 03 May 2022 12:49:19 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 p11-20020a17090ad30b00b001cd4989fed3sm1712383pju.31.2022.05.03.12.49.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:49:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 34/74] gdbstub: Widen gdb_syscall_complete_cb return value
Date: Tue,  3 May 2022 12:48:03 -0700
Message-Id: <20220503194843.1379101-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

Always pass a uint64_t.  This resolves a FIXME in the
m68k and nios2 semihosting that we've lost data.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/gdbstub.h        |  3 +--
 gdbstub.c                     |  7 ++++---
 semihosting/arm-compat-semi.c |  9 ++++-----
 semihosting/console.c         |  7 +++----
 semihosting/syscalls.c        |  2 +-
 target/m68k/m68k-semi.c       | 10 +++-------
 target/nios2/nios2-semi.c     |  8 +++-----
 7 files changed, 19 insertions(+), 27 deletions(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 8e9cdcb1c1..63764a9766 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -77,8 +77,7 @@ struct gdb_timeval {
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
index a7520d6f41..3ca8b6455c 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -217,7 +217,7 @@ static inline uint32_t get_swi_errno(CPUState *cs)
 #endif
 }
 
-static void common_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
+static void common_semi_cb(CPUState *cs, uint64_t ret, int err)
 {
     if (err) {
 #ifdef CONFIG_USER_ONLY
@@ -234,7 +234,7 @@ static void common_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
  * SYS_READ and SYS_WRITE always return the number of bytes not read/written.
  * There is no error condition, other than returning the original length.
  */
-static void common_semi_rw_cb(CPUState *cs, target_ulong ret, target_ulong err)
+static void common_semi_rw_cb(CPUState *cs, uint64_t ret, int err)
 {
     /* Recover the original length from the third argument. */
     CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
@@ -251,8 +251,7 @@ static void common_semi_rw_cb(CPUState *cs, target_ulong ret, target_ulong err)
 /*
  * SYS_SEEK returns 0 on success, not the resulting offset.
  */
-static void common_semi_seek_cb(CPUState *cs, target_ulong ret,
-                                target_ulong err)
+static void common_semi_seek_cb(CPUState *cs, uint64_t ret, int err)
 {
     if (!err) {
         ret = 0;
@@ -273,7 +272,7 @@ static target_ulong common_semi_flen_buf(CPUState *cs)
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
index 269f750d98..4c934654cd 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -145,7 +145,7 @@ static int copy_stat_to_user(CPUState *cs, target_ulong addr,
 
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


