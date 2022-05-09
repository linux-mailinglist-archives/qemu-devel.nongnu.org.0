Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8D452064D
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 23:01:18 +0200 (CEST)
Received: from localhost ([::1]:37944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noAVJ-0000P1-GR
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 17:01:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1noARx-0003ZT-43
 for qemu-devel@nongnu.org; Mon, 09 May 2022 16:57:49 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:55255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1noARv-00050G-6o
 for qemu-devel@nongnu.org; Mon, 09 May 2022 16:57:48 -0400
Received: by mail-wm1-x32d.google.com with SMTP id bg25so9031308wmb.4
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 13:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4uKDEYYV9i2SXwBMvHl9Ac/EybZiFn5qRvM+OUC23KI=;
 b=At8n0BcVtrR0lU/D7at0jxIil7Z2AVdLLduJvprCh6mYjw3998yV5dFc/wlabIpGUK
 AZtvafbjVSK1Rvbz3B7w9hrJmnIP5kZJWGcoLOohTmdEDcmY/9XoEmfRcEfLQcUdRKLP
 ZiPRHmTzocClKMmjiv3WXiJX7oDN158qLGZw1DHZl1Mv7s0RuEcDMI36Q1cFUJLRWdcn
 5BrR8OCSqu7oq96psalpkfeUbj3hq2EZMt4HvrWUdpLrw0ijSRIFJrcRK9PGU7flahCZ
 5UxSq8Ln4GOiNopFy3wclBTHtop0LZRg7M+OPmrDkV+kXNRP6HYwO0FCseREuzds8Rys
 +84A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4uKDEYYV9i2SXwBMvHl9Ac/EybZiFn5qRvM+OUC23KI=;
 b=1HsYJwEUiGowwgobzEkiYV8T2BIq180Tav0ubkz9HIYn3721AP/JFZL6hJHWC0CFM9
 pdaKlMJLgkpJtD/cURChsseM1eNAo4XZVUv6VPZlCLVAEqSfaYCBBudsj9qLD6lnNomg
 0/Q4+webUWNtDf2csSorLDwMFkYFJGZcMlYMVqlXX7Atb4w56pox/lEIoQYVhKp5JwhO
 8bmSg8NGOO1BKrsdLgEyK2H/wLhB/ID5TY7pW4Ir43wqNYwddVLQY3hPd+deb0XN307A
 gj5TgHxESf7589f3QBYCXqp8F7OgtN0t/eqqs9OINDz6j8M7rwLQ8VnRvvg2sITXsNyj
 vb1A==
X-Gm-Message-State: AOAM533Y3c5QDrh+PydBk3Vbo6PGrW/XiIk+jBYlasScD53j/9Nd8INE
 mu0wjPdLl4sL24eSTzxKeR5/MXruuAE=
X-Google-Smtp-Source: ABdhPJwM97cSKEEWjQsH9fHnfU8j//5A5v/JUWGogBikb7uXE75jw4wIlylqgfZT5qLSR9D6NefayA==
X-Received: by 2002:a05:600c:a42:b0:393:d831:bf05 with SMTP id
 c2-20020a05600c0a4200b00393d831bf05mr17670350wmq.187.1652129865673; 
 Mon, 09 May 2022 13:57:45 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a05600c384b00b003942a244f57sm243353wmr.48.2022.05.09.13.57.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 May 2022 13:57:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 3/3] linux-user: Remove pointless CPU{ARCH}State casts
Date: Mon,  9 May 2022 22:57:28 +0200
Message-Id: <20220509205728.51912-4-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509205728.51912-1-philippe.mathieu.daude@gmail.com>
References: <20220509205728.51912-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/syscall.c        | 49 +++++++++++++++++--------------------
 linux-user/uname.c          |  2 +-
 linux-user/user-internals.h |  2 +-
 3 files changed, 25 insertions(+), 28 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index b5046e0c2c..766ee4996b 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -1610,16 +1610,16 @@ static abi_long do_pipe(CPUArchState *cpu_env, abi_ulong pipedes,
        pipe syscall, but didn't replicate this into the pipe2 syscall.  */
     if (!is_pipe2) {
 #if defined(TARGET_ALPHA)
-        ((CPUAlphaState *)cpu_env)->ir[IR_A4] = host_pipe[1];
+        cpu_env->ir[IR_A4] = host_pipe[1];
         return host_pipe[0];
 #elif defined(TARGET_MIPS)
-        ((CPUMIPSState*)cpu_env)->active_tc.gpr[3] = host_pipe[1];
+        cpu_env->active_tc.gpr[3] = host_pipe[1];
         return host_pipe[0];
 #elif defined(TARGET_SH4)
-        ((CPUSH4State*)cpu_env)->gregs[1] = host_pipe[1];
+        cpu_env->gregs[1] = host_pipe[1];
         return host_pipe[0];
 #elif defined(TARGET_SPARC)
-        ((CPUSPARCState*)cpu_env)->regwptr[1] = host_pipe[1];
+        cpu_env->regwptr[1] = host_pipe[1];
         return host_pipe[0];
 #endif
     }
@@ -7564,7 +7564,7 @@ static inline abi_long host_to_target_stat64(CPUArchState *cpu_env,
                                              struct stat *host_st)
 {
 #if defined(TARGET_ARM) && defined(TARGET_ABI32)
-    if (((CPUARMState *)cpu_env)->eabi) {
+    if (cpu_env->eabi) {
         struct target_eabi_stat64 *target_st;
 
         if (!lock_user_struct(VERIFY_WRITE, target_st, target_addr, 0))
@@ -7963,7 +7963,7 @@ int host_to_target_waitstatus(int status)
 
 static int open_self_cmdline(CPUArchState *cpu_env, int fd)
 {
-    CPUState *cpu = env_cpu((CPUArchState *)cpu_env);
+    CPUState *cpu = env_cpu(cpu_env);
     struct linux_binprm *bprm = ((TaskState *)cpu->opaque)->bprm;
     int i;
 
@@ -7980,7 +7980,7 @@ static int open_self_cmdline(CPUArchState *cpu_env, int fd)
 
 static int open_self_maps(CPUArchState *cpu_env, int fd)
 {
-    CPUState *cpu = env_cpu((CPUArchState *)cpu_env);
+    CPUState *cpu = env_cpu(cpu_env);
     TaskState *ts = cpu->opaque;
     GSList *map_info = read_self_maps();
     GSList *s;
@@ -8042,7 +8042,7 @@ static int open_self_maps(CPUArchState *cpu_env, int fd)
 
 static int open_self_stat(CPUArchState *cpu_env, int fd)
 {
-    CPUState *cpu = env_cpu((CPUArchState *)cpu_env);
+    CPUState *cpu = env_cpu(cpu_env);
     TaskState *ts = cpu->opaque;
     g_autoptr(GString) buf = g_string_new(NULL);
     int i;
@@ -8080,7 +8080,7 @@ static int open_self_stat(CPUArchState *cpu_env, int fd)
 
 static int open_self_auxv(CPUArchState *cpu_env, int fd)
 {
-    CPUState *cpu = env_cpu((CPUArchState *)cpu_env);
+    CPUState *cpu = env_cpu(cpu_env);
     TaskState *ts = cpu->opaque;
     abi_ulong auxv = ts->info->saved_auxv;
     abi_ulong len = ts->info->auxv_len;
@@ -8890,7 +8890,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
 #if defined(TARGET_NR_getxpid) && defined(TARGET_ALPHA)
     /* Alpha specific */
     case TARGET_NR_getxpid:
-        ((CPUAlphaState *)cpu_env)->ir[IR_A4] = getppid();
+        cpu_env->ir[IR_A4] = getppid();
         return get_errno(getpid());
 #endif
 #ifdef TARGET_NR_getpid
@@ -9413,7 +9413,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
             if (!is_error(ret)) {
                 host_to_target_old_sigset(&mask, &oldset);
                 ret = mask;
-                ((CPUAlphaState *)cpu_env)->ir[IR_V0] = 0; /* force no error */
+                cpu_env->ir[IR_V0] = 0; /* force no error */
             }
 #else
             sigset_t set, oldset, *set_ptr;
@@ -10033,7 +10033,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
         }
 #ifdef TARGET_ALPHA
         /* Return value is the unbiased priority.  Signal no error.  */
-        ((CPUAlphaState *)cpu_env)->ir[IR_V0] = 0;
+        cpu_env->ir[IR_V0] = 0;
 #else
         /* Return value is a biased priority to avoid negative numbers.  */
         ret = 20 - ret;
@@ -11413,7 +11413,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
          {
             uid_t euid;
             euid=geteuid();
-            ((CPUAlphaState *)cpu_env)->ir[IR_A4]=euid;
+            cpu_env->ir[IR_A4]=euid;
          }
         return get_errno(getuid());
 #endif
@@ -11423,7 +11423,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
          {
             uid_t egid;
             egid=getegid();
-            ((CPUAlphaState *)cpu_env)->ir[IR_A4]=egid;
+            cpu_env->ir[IR_A4]=egid;
          }
         return get_errno(getgid());
 #endif
@@ -11435,7 +11435,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
           case TARGET_GSI_IEEE_FP_CONTROL:
             {
                 uint64_t fpcr = cpu_alpha_load_fpcr(cpu_env);
-                uint64_t swcr = ((CPUAlphaState *)cpu_env)->swcr;
+                uint64_t swcr = cpu_env->swcr;
 
                 swcr &= ~SWCR_STATUS_MASK;
                 swcr |= (fpcr >> 35) & SWCR_STATUS_MASK;
@@ -11477,8 +11477,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
                  * could be queried.  Therefore, we store the status
                  * bits only in FPCR.
                  */
-                ((CPUAlphaState *)cpu_env)->swcr
-                    = swcr & (SWCR_TRAP_ENABLE_MASK | SWCR_MAP_MASK);
+                cpu_env->swcr = swcr & (SWCR_TRAP_ENABLE_MASK | SWCR_MAP_MASK);
 
                 fpcr = cpu_alpha_load_fpcr(cpu_env);
                 fpcr &= ((uint64_t)FPCR_DYN_MASK << 32);
@@ -11502,7 +11501,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
                 fex = alpha_ieee_fpcr_to_swcr(fpcr);
                 fex = exc & ~fex;
                 fex >>= SWCR_STATUS_TO_EXCSUM_SHIFT;
-                fex &= ((CPUArchState *)cpu_env)->swcr;
+                fex &= (cpu_env)->swcr;
 
                 /* Update the hardware fpcr.  */
                 fpcr |= alpha_ieee_swcr_to_fpcr(exc);
@@ -11534,9 +11533,8 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
                     info.si_signo = SIGFPE;
                     info.si_errno = 0;
                     info.si_code = si_code;
-                    info._sifields._sigfault._addr
-                        = ((CPUArchState *)cpu_env)->pc;
-                    queue_signal((CPUArchState *)cpu_env, info.si_signo,
+                    info._sifields._sigfault._addr = (cpu_env)->pc;
+                    queue_signal(cpu_env, info.si_signo,
                                  QEMU_SI_FAULT, &info);
                 }
                 ret = 0;
@@ -11822,7 +11820,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
         to_flock64_fn *copyto = copy_to_user_flock64;
 
 #ifdef TARGET_ARM
-        if (!((CPUARMState *)cpu_env)->eabi) {
+        if (!cpu_env->eabi) {
             copyfrom = copy_from_user_oabi_flock64;
             copyto = copy_to_user_oabi_flock64;
         }
@@ -12050,13 +12048,13 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
 #ifdef TARGET_NR_set_thread_area
     case TARGET_NR_set_thread_area:
 #if defined(TARGET_MIPS)
-      ((CPUMIPSState *) cpu_env)->active_tc.CP0_UserLocal = arg1;
+      cpu_env->active_tc.CP0_UserLocal = arg1;
       return 0;
 #elif defined(TARGET_CRIS)
       if (arg1 & 0xff)
           ret = -TARGET_EINVAL;
       else {
-          ((CPUCRISState *) cpu_env)->pregs[PR_PID] = arg1;
+          cpu_env->pregs[PR_PID] = arg1;
           ret = 0;
       }
       return ret;
@@ -12783,8 +12781,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
             info.si_errno = 0;
             info.si_code = TARGET_SEGV_MAPERR;
             info._sifields._sigfault._addr = arg6;
-            queue_signal((CPUArchState *)cpu_env, info.si_signo,
-                         QEMU_SI_FAULT, &info);
+            queue_signal(cpu_env, info.si_signo, QEMU_SI_FAULT, &info);
             ret = 0xdeadbeef;
 
         }
diff --git a/linux-user/uname.c b/linux-user/uname.c
index 1e3e98156d..32f71f2492 100644
--- a/linux-user/uname.c
+++ b/linux-user/uname.c
@@ -54,7 +54,7 @@ const char *cpu_to_uname_machine(CPUArchState *cpu_env)
     return "armv5te" utsname_suffix;
 #elif defined(TARGET_I386) && !defined(TARGET_X86_64)
     /* see arch/x86/kernel/cpu/bugs.c: check_bugs(), 386, 486, 586, 686 */
-    CPUState *cpu = env_cpu((CPUX86State *)cpu_env);
+    CPUState *cpu = env_cpu(cpu_env);
     int family = object_property_get_int(OBJECT(cpu), "family", NULL);
     if (family == 4) {
         return "i486";
diff --git a/linux-user/user-internals.h b/linux-user/user-internals.h
index 0bb26331c1..6175ce53db 100644
--- a/linux-user/user-internals.h
+++ b/linux-user/user-internals.h
@@ -134,7 +134,7 @@ void print_termios(void *arg);
 #ifdef TARGET_ARM
 static inline int regpairs_aligned(CPUArchState *cpu_env, int num)
 {
-    return ((((CPUARMState *)cpu_env)->eabi) == 1) ;
+    return cpu_env->eabi == 1;
 }
 #elif defined(TARGET_MIPS) && defined(TARGET_ABI_MIPSO32)
 static inline int regpairs_aligned(CPUArchState *cpu_env, int num) { return 1; }
-- 
2.35.1


