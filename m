Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B114CEEAF
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 00:43:29 +0100 (CET)
Received: from localhost ([::1]:45254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR0XA-0002HD-6c
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 18:43:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR0UE-00059t-I3
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 18:40:26 -0500
Received: from [2a00:1450:4864:20::334] (port=43697
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR0UC-0002NR-KU
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 18:40:26 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 l1-20020a05600c4f0100b00389645443d2so5457029wmq.2
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 15:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8AyaT1vsRLFKzV2OT/849dFfR9YLfZCoXoP3Vr0kGyw=;
 b=ahXo+bmgLo061RKfcnKZkQU/Zqon5OTUDSiMmJgra3650AZsyxbIAChuS1jv4ZCPq0
 bGcPlnQ1tG5zLrVGRjfWbJubejbwUrZ88mhSdEHwSVdWlsgIoLytPBS3tCxTBiaSxSvn
 IMuL7cbFANats2SDJQlBusX9tIMmbz6s7tpunxcmoOq9LtokFboeHKI76tyCtA5ulT4f
 sny9l8CW881Ae1nEgtCC59Zmo0kTOlIoCJe68nK1/5KmAjvqrO7RXNyBeX/gX4r/I3Rl
 dZ4Sg96w6zNDyx32YdP6NOl+NphfzzHS1VbwJVwveoCcOFLAqtzVbOIEzWX9cbMuEbpa
 61Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8AyaT1vsRLFKzV2OT/849dFfR9YLfZCoXoP3Vr0kGyw=;
 b=Wi1N7IwtAHT9p/CB3Avcq8Hiq8vMoLenNeQwErRjTvjyRu5GIQH8/sRLvvPCxa8M6b
 FxejwtVui/M8nBmf3ngXSmY3V5QersvZYSl/rFUS+6nkplXBwQCvzFKrYeey6l22R9cY
 TozJFmia6OQor2JXWVpxiwIZGFowXhxAT1vtloeyt0y2mUr81jTD+a2NbfoZY/T+tqMi
 FiPN5enF2EWNoaZ+TCP/wZL8UuvdmGKGfvvyxQaNHQIRCapFDtCmbweQbbCOz/UOiQ8U
 HrdUibyQ7fQ2JZdoJuI4q8YeQGrnoLnRbQIo04/X3nAQMI+So2/Rs5FUF3xo1zsmmMH4
 Ffrg==
X-Gm-Message-State: AOAM532r2oQPlE62iPV+y0ImqEuOsAWFGXAfdo2Tf+OCPVdlNuI3chdT
 dZTtieGlHA6sqlGr+gT4MFrLPvv6IQk=
X-Google-Smtp-Source: ABdhPJyEc/LidRmCcEW5BI5ZQ+7LJKU2luWo9j/C8GiChYYBt6jtoJ8IoNkXKdC5Q3PjzT8JABNPMQ==
X-Received: by 2002:a1c:7519:0:b0:383:d29b:257 with SMTP id
 o25-20020a1c7519000000b00383d29b0257mr8517737wmc.172.1646610023010; 
 Sun, 06 Mar 2022 15:40:23 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bg18-20020a05600c3c9200b0037c2ef07493sm13456497wmb.3.2022.03.06.15.40.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Mar 2022 15:40:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] linux-user: Remove pointless CPU{ARCH}State casts
Date: Mon,  7 Mar 2022 00:40:05 +0100
Message-Id: <20220306234005.52511-4-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220306234005.52511-1-philippe.mathieu.daude@gmail.com>
References: <20220306234005.52511-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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
index ee6ca08f57..87740a5345 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -1630,16 +1630,16 @@ static abi_long do_pipe(CPUArchState *cpu_env, abi_ulong pipedes,
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
@@ -7584,7 +7584,7 @@ static inline abi_long host_to_target_stat64(CPUArchState *cpu_env,
                                              struct stat *host_st)
 {
 #if defined(TARGET_ARM) && defined(TARGET_ABI32)
-    if (((CPUARMState *)cpu_env)->eabi) {
+    if (cpu_env->eabi) {
         struct target_eabi_stat64 *target_st;
 
         if (!lock_user_struct(VERIFY_WRITE, target_st, target_addr, 0))
@@ -7983,7 +7983,7 @@ int host_to_target_waitstatus(int status)
 
 static int open_self_cmdline(CPUArchState *cpu_env, int fd)
 {
-    CPUState *cpu = env_cpu((CPUArchState *)cpu_env);
+    CPUState *cpu = env_cpu(cpu_env);
     struct linux_binprm *bprm = ((TaskState *)cpu->opaque)->bprm;
     int i;
 
@@ -8000,7 +8000,7 @@ static int open_self_cmdline(CPUArchState *cpu_env, int fd)
 
 static int open_self_maps(CPUArchState *cpu_env, int fd)
 {
-    CPUState *cpu = env_cpu((CPUArchState *)cpu_env);
+    CPUState *cpu = env_cpu(cpu_env);
     TaskState *ts = cpu->opaque;
     GSList *map_info = read_self_maps();
     GSList *s;
@@ -8062,7 +8062,7 @@ static int open_self_maps(CPUArchState *cpu_env, int fd)
 
 static int open_self_stat(CPUArchState *cpu_env, int fd)
 {
-    CPUState *cpu = env_cpu((CPUArchState *)cpu_env);
+    CPUState *cpu = env_cpu(cpu_env);
     TaskState *ts = cpu->opaque;
     g_autoptr(GString) buf = g_string_new(NULL);
     int i;
@@ -8100,7 +8100,7 @@ static int open_self_stat(CPUArchState *cpu_env, int fd)
 
 static int open_self_auxv(CPUArchState *cpu_env, int fd)
 {
-    CPUState *cpu = env_cpu((CPUArchState *)cpu_env);
+    CPUState *cpu = env_cpu(cpu_env);
     TaskState *ts = cpu->opaque;
     abi_ulong auxv = ts->info->saved_auxv;
     abi_ulong len = ts->info->auxv_len;
@@ -8910,7 +8910,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
 #if defined(TARGET_NR_getxpid) && defined(TARGET_ALPHA)
     /* Alpha specific */
     case TARGET_NR_getxpid:
-        ((CPUAlphaState *)cpu_env)->ir[IR_A4] = getppid();
+        cpu_env->ir[IR_A4] = getppid();
         return get_errno(getpid());
 #endif
 #ifdef TARGET_NR_getpid
@@ -9433,7 +9433,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
             if (!is_error(ret)) {
                 host_to_target_old_sigset(&mask, &oldset);
                 ret = mask;
-                ((CPUAlphaState *)cpu_env)->ir[IR_V0] = 0; /* force no error */
+                cpu_env->ir[IR_V0] = 0; /* force no error */
             }
 #else
             sigset_t set, oldset, *set_ptr;
@@ -10058,7 +10058,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
         }
 #ifdef TARGET_ALPHA
         /* Return value is the unbiased priority.  Signal no error.  */
-        ((CPUAlphaState *)cpu_env)->ir[IR_V0] = 0;
+        cpu_env->ir[IR_V0] = 0;
 #else
         /* Return value is a biased priority to avoid negative numbers.  */
         ret = 20 - ret;
@@ -11438,7 +11438,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
          {
             uid_t euid;
             euid=geteuid();
-            ((CPUAlphaState *)cpu_env)->ir[IR_A4]=euid;
+            cpu_env->ir[IR_A4]=euid;
          }
         return get_errno(getuid());
 #endif
@@ -11448,7 +11448,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
          {
             uid_t egid;
             egid=getegid();
-            ((CPUAlphaState *)cpu_env)->ir[IR_A4]=egid;
+            cpu_env->ir[IR_A4]=egid;
          }
         return get_errno(getgid());
 #endif
@@ -11460,7 +11460,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
           case TARGET_GSI_IEEE_FP_CONTROL:
             {
                 uint64_t fpcr = cpu_alpha_load_fpcr(cpu_env);
-                uint64_t swcr = ((CPUAlphaState *)cpu_env)->swcr;
+                uint64_t swcr = cpu_env->swcr;
 
                 swcr &= ~SWCR_STATUS_MASK;
                 swcr |= (fpcr >> 35) & SWCR_STATUS_MASK;
@@ -11502,8 +11502,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
                  * could be queried.  Therefore, we store the status
                  * bits only in FPCR.
                  */
-                ((CPUAlphaState *)cpu_env)->swcr
-                    = swcr & (SWCR_TRAP_ENABLE_MASK | SWCR_MAP_MASK);
+                cpu_env->swcr = swcr & (SWCR_TRAP_ENABLE_MASK | SWCR_MAP_MASK);
 
                 fpcr = cpu_alpha_load_fpcr(cpu_env);
                 fpcr &= ((uint64_t)FPCR_DYN_MASK << 32);
@@ -11527,7 +11526,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
                 fex = alpha_ieee_fpcr_to_swcr(fpcr);
                 fex = exc & ~fex;
                 fex >>= SWCR_STATUS_TO_EXCSUM_SHIFT;
-                fex &= ((CPUArchState *)cpu_env)->swcr;
+                fex &= (cpu_env)->swcr;
 
                 /* Update the hardware fpcr.  */
                 fpcr |= alpha_ieee_swcr_to_fpcr(exc);
@@ -11559,9 +11558,8 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
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
@@ -11847,7 +11845,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
         to_flock64_fn *copyto = copy_to_user_flock64;
 
 #ifdef TARGET_ARM
-        if (!((CPUARMState *)cpu_env)->eabi) {
+        if (!cpu_env->eabi) {
             copyfrom = copy_from_user_oabi_flock64;
             copyto = copy_to_user_oabi_flock64;
         }
@@ -12075,13 +12073,13 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
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
@@ -12816,8 +12814,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
             info.si_errno = 0;
             info.si_code = TARGET_SEGV_MAPERR;
             info._sifields._sigfault._addr = arg6;
-            queue_signal((CPUArchState *)cpu_env, info.si_signo,
-                         QEMU_SI_FAULT, &info);
+            queue_signal(cpu_env, info.si_signo, QEMU_SI_FAULT, &info);
             ret = 0xdeadbeef;
 
         }
diff --git a/linux-user/uname.c b/linux-user/uname.c
index b8540b21b3..5f37e665ed 100644
--- a/linux-user/uname.c
+++ b/linux-user/uname.c
@@ -55,7 +55,7 @@ const char *cpu_to_uname_machine(CPUArchState *cpu_env)
     return "armv5te" utsname_suffix;
 #elif defined(TARGET_I386) && !defined(TARGET_X86_64)
     /* see arch/x86/kernel/cpu/bugs.c: check_bugs(), 386, 486, 586, 686 */
-    CPUState *cpu = env_cpu((CPUX86State *)cpu_env);
+    CPUState *cpu = env_cpu(cpu_env);
     int family = object_property_get_int(OBJECT(cpu), "family", NULL);
     if (family == 4) {
         return "i486";
diff --git a/linux-user/user-internals.h b/linux-user/user-internals.h
index 4d5c3d8605..6b05ecc3ba 100644
--- a/linux-user/user-internals.h
+++ b/linux-user/user-internals.h
@@ -134,7 +134,7 @@ void print_termios(void *arg);
 #ifdef TARGET_ARM
 static inline int regpairs_aligned(CPUArchState *cpu_env, int num)
 {
-    return ((((CPUARMState *)cpu_env)->eabi) == 1) ;
+    return cpu_env->eabi == 1;
 }
 #elif defined(TARGET_MIPS) && (TARGET_ABI_BITS == 32)
 static inline int regpairs_aligned(CPUArchState *cpu_env, int num) { return 1; }
-- 
2.34.1


