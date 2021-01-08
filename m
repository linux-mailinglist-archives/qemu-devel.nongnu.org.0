Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DD12EFB8A
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 00:04:10 +0100 (CET)
Received: from localhost ([::1]:46470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky0nh-00021Z-OS
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 18:04:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ky0Tj-00065d-B6
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 17:43:31 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:52049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ky0Tb-0003NR-K8
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 17:43:31 -0500
Received: by mail-wm1-x336.google.com with SMTP id v14so8974102wml.1
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 14:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d1oHXuksLJ8aF0Xt8uz1EAUnbZdRGxei40npCbCiF8w=;
 b=fZzqdHMkWjwr5DYkhdfmsWX1sUD5WQuUZemobmN4B55pmEXsdddOJr0ojtRD7tDqYX
 oZjc3k27Imk6g8XEKNXzFHPLMiQ7mCGhNerswUPmCLB9K/erWmFGXzZOZDVjN1V6eja5
 Xh5o26ljYM7MrqbkL+/jGJat0M7iG8pXWo8nFkOprTYCd4mby8UzLZM13/thTPTwkFnU
 jWzaxSEqJ8E1DB8qMRTyhG1P6OMrKexjgAfOv4XDzrPLL9cJHw15jE5XhmYJDCycW4WH
 VW2HXvniBTWBmv47HcrwLPl4oVotsBI3FgB9VEvImvqx8ze7Z+IevOFdOIUezqiG/Ipf
 DDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d1oHXuksLJ8aF0Xt8uz1EAUnbZdRGxei40npCbCiF8w=;
 b=ni/PZhfHMKtAuaJHf7BiccOgqNCpcQIoteExW3+0TdKmvW5sqFXd0qa7IN0sRHNhVk
 Tavg3ygRe6iPHfMbEwuFyJVdNx/bIBi5my9tnWbcTRcKfVhVCEh5ayFgBR7G3INLsnPv
 xXdJA7ckojjLiMI2Sfvy65m20SrdI5bmHzYLodUffrUKQTqWjAY0v8Jp6ikhfPjX9+G/
 a5/yNOI4Xm9uZI3utjbilswHFSkRzx3FGBIS3n9Fmk0U9QU67tkBoC0Z13iHISO5rOLk
 rs4sxpNR/Bvj1g0agQMgCkcTp6s/dijg2DWWwYnVyB3ZgbOyhsi9CH8FdgDbY1b6uTNo
 4tOg==
X-Gm-Message-State: AOAM531fSJC/L+8DC3fx7nzik+KGzOO7ziFaLls/0yoebLkzfnSZct4l
 t/omgSH5myKZFAWpm3gSUIVHTurJKhQAWA==
X-Google-Smtp-Source: ABdhPJylaN/tOdSss5rxCIjfi2Hm6+mzs1uyycyIVC7AQtNGiBRz5fgyxwgIz84DMlwNjowtg9J6uQ==
X-Received: by 2002:a1c:bd87:: with SMTP id n129mr4903733wmf.32.1610145799900; 
 Fri, 08 Jan 2021 14:43:19 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a13sm14775035wrt.96.2021.01.08.14.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 14:43:11 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 629481FF9D;
 Fri,  8 Jan 2021 22:42:58 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 14/20] semihosting: Change internal common-semi interfaces
 to use CPUState *
Date: Fri,  8 Jan 2021 22:42:50 +0000
Message-Id: <20210108224256.2321-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108224256.2321-1-alex.bennee@linaro.org>
References: <20210108224256.2321-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Keith Packard <keithp@keithp.com>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keith Packard <keithp@keithp.com>

This makes all of the internal interfaces architecture-independent and
renames the internal functions to use the 'common_semi' prefix instead
of 'arm' or 'arm_semi'.

To do this, some new architecture-specific internal helper functions
were created:

    static inline target_ulong
    common_semi_arg(CPUState *cs, int argno)

	Returns the argno'th semihosting argument, where argno can be
	either 0 or 1.

    static inline void
    common_semi_set_ret(CPUState *cs, target_ulong ret)

	Sets the semihosting return value.

    static inline bool
    common_semi_sys_exit_extended(CPUState *cs, int nr)

	This detects whether the specified semihosting call, which
	is either TARGET_SYS_EXIT or TARGET_SYS_EXIT_EXTENDED should
	be executed using the TARGET_SYS_EXIT_EXTENDED semantics.

    static inline target_ulong
    common_semi_rambase(CPUState *cs)

	Returns the base of RAM region used for heap and stack. This
	is used to construct plausible values for the SYS_HEAPINFO
	call.

In addition, several existing functions have been changed to flag
areas of code which are architecture specific:

    static target_ulong
    common_semi_flen_buf(CPUState *cs)

	Returns the current stack pointer minus 64, which is
	where a stat structure will be placed on the stack

    #define GET_ARG(n)

	This fetches arguments from the semihosting command's argument
	block. The address of this is available implicitly through the
	local 'args' variable. This is *mostly* architecture
	independent, but does depend on the current ABI's notion of
	the size of a 'long' parameter, which may need run-time checks
	(as it does on AARCH64)

    #define SET_ARG(n, val)

	This mirrors GET_ARG and stores data back into the argument
	block.

Signed-off-by: Keith Packard <keithp@keithp.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20210107170717.2098982-4-keithp@keithp.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/semihosting/common-semi.c | 349 +++++++++++++++++++----------------
 1 file changed, 186 insertions(+), 163 deletions(-)

diff --git a/hw/semihosting/common-semi.c b/hw/semihosting/common-semi.c
index 2e959aba08..ac1271545e 100644
--- a/hw/semihosting/common-semi.c
+++ b/hw/semihosting/common-semi.c
@@ -32,15 +32,18 @@
 #include "cpu.h"
 #include "hw/semihosting/semihost.h"
 #include "hw/semihosting/console.h"
+#include "hw/semihosting/common-semi.h"
 #include "qemu/log.h"
 #ifdef CONFIG_USER_ONLY
 #include "qemu.h"
 
-#define ARM_ANGEL_HEAP_SIZE (128 * 1024 * 1024)
+#define COMMON_SEMI_HEAP_SIZE (128 * 1024 * 1024)
 #else
 #include "exec/gdbstub.h"
 #include "qemu/cutils.h"
+#ifdef TARGET_ARM
 #include "hw/arm/boot.h"
+#endif
 #include "hw/boards.h"
 #endif
 
@@ -134,6 +137,50 @@ typedef struct GuestFD {
 
 static GArray *guestfd_array;
 
+#ifdef TARGET_ARM
+static inline target_ulong
+common_semi_arg(CPUState *cs, int argno)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    if (is_a64(env)) {
+        return env->xregs[argno];
+    } else {
+        return env->regs[argno];
+    }
+}
+
+static inline void
+common_semi_set_ret(CPUState *cs, target_ulong ret)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    if (is_a64(env)) {
+        env->xregs[0] = ret;
+    } else {
+        env->regs[0] = ret;
+    }
+}
+
+static inline bool
+common_semi_sys_exit_extended(CPUState *cs, int nr)
+{
+    return (nr == TARGET_SYS_EXIT_EXTENDED || is_a64(cs->env_ptr));
+}
+
+#ifndef CONFIG_USER_ONLY
+#include "hw/arm/boot.h"
+static inline target_ulong
+common_semi_rambase(CPUState *cs)
+{
+    CPUArchState *env = cs->env_ptr;
+    const struct arm_boot_info *info = env->boot_info;
+    return info->loader_start;
+}
+#endif
+
+#endif /* TARGET_ARM */
+
 /*
  * Allocate a new guest file descriptor and return it; if we
  * couldn't allocate a new fd then return -1.
@@ -239,11 +286,10 @@ static target_ulong syscall_err;
 #include "exec/softmmu-semi.h"
 #endif
 
-static inline uint32_t set_swi_errno(CPUARMState *env, uint32_t code)
+static inline uint32_t set_swi_errno(CPUState *cs, uint32_t code)
 {
     if (code == (uint32_t)-1) {
 #ifdef CONFIG_USER_ONLY
-        CPUState *cs = env_cpu(env);
         TaskState *ts = cs->opaque;
 
         ts->swi_errno = errno;
@@ -254,10 +300,9 @@ static inline uint32_t set_swi_errno(CPUARMState *env, uint32_t code)
     return code;
 }
 
-static inline uint32_t get_swi_errno(CPUARMState *env)
+static inline uint32_t get_swi_errno(CPUState *cs)
 {
 #ifdef CONFIG_USER_ONLY
-    CPUState *cs = env_cpu(env);
     TaskState *ts = cs->opaque;
 
     return ts->swi_errno;
@@ -266,24 +311,22 @@ static inline uint32_t get_swi_errno(CPUARMState *env)
 #endif
 }
 
-static target_ulong arm_semi_syscall_len;
+static target_ulong common_semi_syscall_len;
 
-static void arm_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
+static void common_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
 {
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-    target_ulong reg0 = is_a64(env) ? env->xregs[0] : env->regs[0];
+    target_ulong reg0 = common_semi_arg(cs, 0);
 
     if (ret == (target_ulong)-1) {
         errno = err;
-        set_swi_errno(env, -1);
+        set_swi_errno(cs, -1);
         reg0 = ret;
     } else {
         /* Fixup syscalls that use nonstardard return conventions.  */
         switch (reg0) {
         case TARGET_SYS_WRITE:
         case TARGET_SYS_READ:
-            reg0 = arm_semi_syscall_len - ret;
+            reg0 = common_semi_syscall_len - ret;
             break;
         case TARGET_SYS_SEEK:
             reg0 = 0;
@@ -293,77 +336,66 @@ static void arm_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
             break;
         }
     }
-    if (is_a64(env)) {
-        env->xregs[0] = reg0;
-    } else {
-        env->regs[0] = reg0;
-    }
+    common_semi_set_ret(cs, reg0);
 }
 
-static target_ulong arm_flen_buf(ARMCPU *cpu)
+static target_ulong common_semi_flen_buf(CPUState *cs)
 {
+    target_ulong sp;
+#ifdef TARGET_ARM
     /* Return an address in target memory of 64 bytes where the remote
      * gdb should write its stat struct. (The format of this structure
      * is defined by GDB's remote protocol and is not target-specific.)
      * We put this on the guest's stack just below SP.
      */
+    ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
-    target_ulong sp;
 
     if (is_a64(env)) {
         sp = env->xregs[31];
     } else {
         sp = env->regs[13];
     }
+#endif
 
     return sp - 64;
 }
 
-static void arm_semi_flen_cb(CPUState *cs, target_ulong ret, target_ulong err)
+static void
+common_semi_flen_cb(CPUState *cs, target_ulong ret, target_ulong err)
 {
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
     /* The size is always stored in big-endian order, extract
        the value. We assume the size always fit in 32 bits.  */
     uint32_t size;
-    cpu_memory_rw_debug(cs, arm_flen_buf(cpu) + 32, (uint8_t *)&size, 4, 0);
+    cpu_memory_rw_debug(cs, common_semi_flen_buf(cs) + 32,
+                        (uint8_t *)&size, 4, 0);
     size = be32_to_cpu(size);
-    if (is_a64(env)) {
-        env->xregs[0] = size;
-    } else {
-        env->regs[0] = size;
-    }
+    common_semi_set_ret(cs, size);
     errno = err;
-    set_swi_errno(env, -1);
+    set_swi_errno(cs, -1);
 }
 
-static int arm_semi_open_guestfd;
+static int common_semi_open_guestfd;
 
-static void arm_semi_open_cb(CPUState *cs, target_ulong ret, target_ulong err)
+static void
+common_semi_open_cb(CPUState *cs, target_ulong ret, target_ulong err)
 {
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
     if (ret == (target_ulong)-1) {
         errno = err;
-        set_swi_errno(env, -1);
-        dealloc_guestfd(arm_semi_open_guestfd);
+        set_swi_errno(cs, -1);
+        dealloc_guestfd(common_semi_open_guestfd);
     } else {
-        associate_guestfd(arm_semi_open_guestfd, ret);
-        ret = arm_semi_open_guestfd;
-    }
-
-    if (is_a64(env)) {
-        env->xregs[0] = ret;
-    } else {
-        env->regs[0] = ret;
+        associate_guestfd(common_semi_open_guestfd, ret);
+        ret = common_semi_open_guestfd;
     }
+    common_semi_set_ret(cs, ret);
 }
 
-static target_ulong arm_gdb_syscall(ARMCPU *cpu, gdb_syscall_complete_cb cb,
-                                    const char *fmt, ...)
+static target_ulong
+common_semi_gdb_syscall(CPUState *cs, gdb_syscall_complete_cb cb,
+                        const char *fmt, ...)
 {
     va_list va;
-    CPUARMState *env = &cpu->env;
 
     va_start(va, fmt);
     gdb_do_syscallv(cb, fmt, va);
@@ -386,7 +418,7 @@ static target_ulong arm_gdb_syscall(ARMCPU *cpu, gdb_syscall_complete_cb cb,
      * doing something with the return value is not possible to make.
      */
 
-    return is_a64(env) ? env->xregs[0] : env->regs[0];
+    return common_semi_arg(cs, 0);
 }
 
 /*
@@ -395,20 +427,18 @@ static target_ulong arm_gdb_syscall(ARMCPU *cpu, gdb_syscall_complete_cb cb,
  * do the work and return the required return value for the guest,
  * setting the guest errno if appropriate.
  */
-typedef uint32_t sys_closefn(ARMCPU *cpu, GuestFD *gf);
-typedef uint32_t sys_writefn(ARMCPU *cpu, GuestFD *gf,
+typedef uint32_t sys_closefn(CPUState *cs, GuestFD *gf);
+typedef uint32_t sys_writefn(CPUState *cs, GuestFD *gf,
                              target_ulong buf, uint32_t len);
-typedef uint32_t sys_readfn(ARMCPU *cpu, GuestFD *gf,
+typedef uint32_t sys_readfn(CPUState *cs, GuestFD *gf,
                             target_ulong buf, uint32_t len);
-typedef uint32_t sys_isattyfn(ARMCPU *cpu, GuestFD *gf);
-typedef uint32_t sys_seekfn(ARMCPU *cpu, GuestFD *gf,
+typedef uint32_t sys_isattyfn(CPUState *cs, GuestFD *gf);
+typedef uint32_t sys_seekfn(CPUState *cs, GuestFD *gf,
                             target_ulong offset);
-typedef uint32_t sys_flenfn(ARMCPU *cpu, GuestFD *gf);
+typedef uint32_t sys_flenfn(CPUState *cs, GuestFD *gf);
 
-static uint32_t host_closefn(ARMCPU *cpu, GuestFD *gf)
+static uint32_t host_closefn(CPUState *cs, GuestFD *gf)
 {
-    CPUARMState *env = &cpu->env;
-
     /*
      * Only close the underlying host fd if it's one we opened on behalf
      * of the guest in SYS_OPEN.
@@ -418,20 +448,21 @@ static uint32_t host_closefn(ARMCPU *cpu, GuestFD *gf)
         gf->hostfd == STDERR_FILENO) {
         return 0;
     }
-    return set_swi_errno(env, close(gf->hostfd));
+    return set_swi_errno(cs, close(gf->hostfd));
 }
 
-static uint32_t host_writefn(ARMCPU *cpu, GuestFD *gf,
+static uint32_t host_writefn(CPUState *cs, GuestFD *gf,
                              target_ulong buf, uint32_t len)
 {
+    CPUArchState *env = cs->env_ptr;
     uint32_t ret;
-    CPUARMState *env = &cpu->env;
     char *s = lock_user(VERIFY_READ, buf, len, 1);
+    (void) env; /* Used in arm softmmu lock_user implicitly */
     if (!s) {
         /* Return bytes not written on error */
         return len;
     }
-    ret = set_swi_errno(env, write(gf->hostfd, s, len));
+    ret = set_swi_errno(cs, write(gf->hostfd, s, len));
     unlock_user(s, buf, 0);
     if (ret == (uint32_t)-1) {
         ret = 0;
@@ -440,18 +471,19 @@ static uint32_t host_writefn(ARMCPU *cpu, GuestFD *gf,
     return len - ret;
 }
 
-static uint32_t host_readfn(ARMCPU *cpu, GuestFD *gf,
+static uint32_t host_readfn(CPUState *cs, GuestFD *gf,
                             target_ulong buf, uint32_t len)
 {
+    CPUArchState *env = cs->env_ptr;
     uint32_t ret;
-    CPUARMState *env = &cpu->env;
     char *s = lock_user(VERIFY_WRITE, buf, len, 0);
+    (void) env; /* Used in arm softmmu lock_user implicitly */
     if (!s) {
         /* return bytes not read */
         return len;
     }
     do {
-        ret = set_swi_errno(env, read(gf->hostfd, s, len));
+        ret = set_swi_errno(cs, read(gf->hostfd, s, len));
     } while (ret == -1 && errno == EINTR);
     unlock_user(s, buf, len);
     if (ret == (uint32_t)-1) {
@@ -461,68 +493,66 @@ static uint32_t host_readfn(ARMCPU *cpu, GuestFD *gf,
     return len - ret;
 }
 
-static uint32_t host_isattyfn(ARMCPU *cpu, GuestFD *gf)
+static uint32_t host_isattyfn(CPUState *cs, GuestFD *gf)
 {
     return isatty(gf->hostfd);
 }
 
-static uint32_t host_seekfn(ARMCPU *cpu, GuestFD *gf, target_ulong offset)
+static uint32_t host_seekfn(CPUState *cs, GuestFD *gf, target_ulong offset)
 {
-    CPUARMState *env = &cpu->env;
-    uint32_t ret = set_swi_errno(env, lseek(gf->hostfd, offset, SEEK_SET));
+    uint32_t ret = set_swi_errno(cs, lseek(gf->hostfd, offset, SEEK_SET));
     if (ret == (uint32_t)-1) {
         return -1;
     }
     return 0;
 }
 
-static uint32_t host_flenfn(ARMCPU *cpu, GuestFD *gf)
+static uint32_t host_flenfn(CPUState *cs, GuestFD *gf)
 {
-    CPUARMState *env = &cpu->env;
     struct stat buf;
-    uint32_t ret = set_swi_errno(env, fstat(gf->hostfd, &buf));
+    uint32_t ret = set_swi_errno(cs, fstat(gf->hostfd, &buf));
     if (ret == (uint32_t)-1) {
         return -1;
     }
     return buf.st_size;
 }
 
-static uint32_t gdb_closefn(ARMCPU *cpu, GuestFD *gf)
+static uint32_t gdb_closefn(CPUState *cs, GuestFD *gf)
 {
-    return arm_gdb_syscall(cpu, arm_semi_cb, "close,%x", gf->hostfd);
+    return common_semi_gdb_syscall(cs, common_semi_cb, "close,%x", gf->hostfd);
 }
 
-static uint32_t gdb_writefn(ARMCPU *cpu, GuestFD *gf,
+static uint32_t gdb_writefn(CPUState *cs, GuestFD *gf,
                             target_ulong buf, uint32_t len)
 {
-    arm_semi_syscall_len = len;
-    return arm_gdb_syscall(cpu, arm_semi_cb, "write,%x,%x,%x",
-                           gf->hostfd, buf, len);
+    common_semi_syscall_len = len;
+    return common_semi_gdb_syscall(cs, common_semi_cb, "write,%x,%x,%x",
+                                   gf->hostfd, buf, len);
 }
 
-static uint32_t gdb_readfn(ARMCPU *cpu, GuestFD *gf,
+static uint32_t gdb_readfn(CPUState *cs, GuestFD *gf,
                            target_ulong buf, uint32_t len)
 {
-    arm_semi_syscall_len = len;
-    return arm_gdb_syscall(cpu, arm_semi_cb, "read,%x,%x,%x",
-                           gf->hostfd, buf, len);
+    common_semi_syscall_len = len;
+    return common_semi_gdb_syscall(cs, common_semi_cb, "read,%x,%x,%x",
+                                   gf->hostfd, buf, len);
 }
 
-static uint32_t gdb_isattyfn(ARMCPU *cpu, GuestFD *gf)
+static uint32_t gdb_isattyfn(CPUState *cs, GuestFD *gf)
 {
-    return arm_gdb_syscall(cpu, arm_semi_cb, "isatty,%x", gf->hostfd);
+    return common_semi_gdb_syscall(cs, common_semi_cb, "isatty,%x", gf->hostfd);
 }
 
-static uint32_t gdb_seekfn(ARMCPU *cpu, GuestFD *gf, target_ulong offset)
+static uint32_t gdb_seekfn(CPUState *cs, GuestFD *gf, target_ulong offset)
 {
-    return arm_gdb_syscall(cpu, arm_semi_cb, "lseek,%x,%x,0",
-                           gf->hostfd, offset);
+    return common_semi_gdb_syscall(cs, common_semi_cb, "lseek,%x,%x,0",
+                                   gf->hostfd, offset);
 }
 
-static uint32_t gdb_flenfn(ARMCPU *cpu, GuestFD *gf)
+static uint32_t gdb_flenfn(CPUState *cs, GuestFD *gf)
 {
-    return arm_gdb_syscall(cpu, arm_semi_flen_cb, "fstat,%x,%x",
-                           gf->hostfd, arm_flen_buf(cpu));
+    return common_semi_gdb_syscall(cs, common_semi_flen_cb, "fstat,%x,%x",
+                                   gf->hostfd, common_semi_flen_buf(cs));
 }
 
 #define SHFB_MAGIC_0 0x53
@@ -551,31 +581,29 @@ static void init_featurefile_guestfd(int guestfd)
     gf->featurefile_offset = 0;
 }
 
-static uint32_t featurefile_closefn(ARMCPU *cpu, GuestFD *gf)
+static uint32_t featurefile_closefn(CPUState *cs, GuestFD *gf)
 {
     /* Nothing to do */
     return 0;
 }
 
-static uint32_t featurefile_writefn(ARMCPU *cpu, GuestFD *gf,
+static uint32_t featurefile_writefn(CPUState *cs, GuestFD *gf,
                                     target_ulong buf, uint32_t len)
 {
     /* This fd can never be open for writing */
-    CPUARMState *env = &cpu->env;
 
     errno = EBADF;
-    return set_swi_errno(env, -1);
+    return set_swi_errno(cs, -1);
 }
 
-static uint32_t featurefile_readfn(ARMCPU *cpu, GuestFD *gf,
+static uint32_t featurefile_readfn(CPUState *cs, GuestFD *gf,
                                    target_ulong buf, uint32_t len)
 {
+    CPUArchState *env = cs->env_ptr;
     uint32_t i;
-#ifndef CONFIG_USER_ONLY
-    CPUARMState *env = &cpu->env;
-#endif
     char *s;
 
+    (void) env; /* Used in arm softmmu lock_user implicitly */
     s = lock_user(VERIFY_WRITE, buf, len, 0);
     if (!s) {
         return len;
@@ -595,19 +623,19 @@ static uint32_t featurefile_readfn(ARMCPU *cpu, GuestFD *gf,
     return len - i;
 }
 
-static uint32_t featurefile_isattyfn(ARMCPU *cpu, GuestFD *gf)
+static uint32_t featurefile_isattyfn(CPUState *cs, GuestFD *gf)
 {
     return 0;
 }
 
-static uint32_t featurefile_seekfn(ARMCPU *cpu, GuestFD *gf,
+static uint32_t featurefile_seekfn(CPUState *cs, GuestFD *gf,
                                    target_ulong offset)
 {
     gf->featurefile_offset = offset;
     return 0;
 }
 
-static uint32_t featurefile_flenfn(ARMCPU *cpu, GuestFD *gf)
+static uint32_t featurefile_flenfn(CPUState *cs, GuestFD *gf)
 {
     return sizeof(featurefile_data);
 }
@@ -651,16 +679,17 @@ static const GuestFDFunctions guestfd_fns[] = {
 /* Read the input value from the argument block; fail the semihosting
  * call if the memory read fails.
  */
+#ifdef TARGET_ARM
 #define GET_ARG(n) do {                                 \
     if (is_a64(env)) {                                  \
         if (get_user_u64(arg ## n, args + (n) * 8)) {   \
             errno = EFAULT;                             \
-            return set_swi_errno(env, -1);              \
+            return set_swi_errno(cs, -1);              \
         }                                               \
     } else {                                            \
         if (get_user_u32(arg ## n, args + (n) * 4)) {   \
             errno = EFAULT;                             \
-            return set_swi_errno(env, -1);              \
+            return set_swi_errno(cs, -1);              \
         }                                               \
     }                                                   \
 } while (0)
@@ -669,6 +698,7 @@ static const GuestFDFunctions guestfd_fns[] = {
     (is_a64(env) ?                                      \
      put_user_u64(val, args + (n) * 8) :                \
      put_user_u32(val, args + (n) * 4))
+#endif
 
 /*
  * Do a semihosting call.
@@ -681,8 +711,7 @@ static const GuestFDFunctions guestfd_fns[] = {
  */
 target_ulong do_common_semihosting(CPUState *cs)
 {
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
+    CPUArchState *env = cs->env_ptr;
     target_ulong args;
     target_ulong arg0, arg1, arg2, arg3;
     char * s;
@@ -691,14 +720,9 @@ target_ulong do_common_semihosting(CPUState *cs)
     uint32_t len;
     GuestFD *gf;
 
-    if (is_a64(env)) {
-        /* Note that the syscall number is in W0, not X0 */
-        nr = env->xregs[0] & 0xffffffffU;
-        args = env->xregs[1];
-    } else {
-        nr = env->regs[0];
-        args = env->regs[1];
-    }
+    (void) env; /* Used implicitly by arm lock_user macro */
+    nr = common_semi_arg(cs, 0) & 0xffffffffU;
+    args = common_semi_arg(cs, 1);
 
     switch (nr) {
     case TARGET_SYS_OPEN:
@@ -711,19 +735,19 @@ target_ulong do_common_semihosting(CPUState *cs)
         s = lock_user_string(arg0);
         if (!s) {
             errno = EFAULT;
-            return set_swi_errno(env, -1);
+            return set_swi_errno(cs, -1);
         }
         if (arg1 >= 12) {
             unlock_user(s, arg0, 0);
             errno = EINVAL;
-            return set_swi_errno(env, -1);
+            return set_swi_errno(cs, -1);
         }
 
         guestfd = alloc_guestfd();
         if (guestfd < 0) {
             unlock_user(s, arg0, 0);
             errno = EMFILE;
-            return set_swi_errno(env, -1);
+            return set_swi_errno(cs, -1);
         }
 
         if (strcmp(s, ":tt") == 0) {
@@ -752,18 +776,19 @@ target_ulong do_common_semihosting(CPUState *cs)
             if (arg1 != 0 && arg1 != 1) {
                 dealloc_guestfd(guestfd);
                 errno = EACCES;
-                return set_swi_errno(env, -1);
+                return set_swi_errno(cs, -1);
             }
             init_featurefile_guestfd(guestfd);
             return guestfd;
         }
 
         if (use_gdb_syscalls()) {
-            arm_semi_open_guestfd = guestfd;
-            ret = arm_gdb_syscall(cpu, arm_semi_open_cb, "open,%s,%x,1a4", arg0,
-                                  (int)arg2 + 1, gdb_open_modeflags[arg1]);
+            common_semi_open_guestfd = guestfd;
+            ret = common_semi_gdb_syscall(cs, common_semi_open_cb,
+                                          "open,%s,%x,1a4", arg0, (int)arg2 + 1,
+                                          gdb_open_modeflags[arg1]);
         } else {
-            ret = set_swi_errno(env, open(s, open_modeflags[arg1], 0644));
+            ret = set_swi_errno(cs, open(s, open_modeflags[arg1], 0644));
             if (ret == (uint32_t)-1) {
                 dealloc_guestfd(guestfd);
             } else {
@@ -780,17 +805,17 @@ target_ulong do_common_semihosting(CPUState *cs)
         gf = get_guestfd(arg0);
         if (!gf) {
             errno = EBADF;
-            return set_swi_errno(env, -1);
+            return set_swi_errno(cs, -1);
         }
 
-        ret = guestfd_fns[gf->type].closefn(cpu, gf);
+        ret = guestfd_fns[gf->type].closefn(cs, gf);
         dealloc_guestfd(arg0);
         return ret;
     case TARGET_SYS_WRITEC:
-        qemu_semihosting_console_outc(env, args);
+        qemu_semihosting_console_outc(cs->env_ptr, args);
         return 0xdeadbeef;
     case TARGET_SYS_WRITE0:
-        return qemu_semihosting_console_outs(env, args);
+        return qemu_semihosting_console_outs(cs->env_ptr, args);
     case TARGET_SYS_WRITE:
         GET_ARG(0);
         GET_ARG(1);
@@ -800,10 +825,10 @@ target_ulong do_common_semihosting(CPUState *cs)
         gf = get_guestfd(arg0);
         if (!gf) {
             errno = EBADF;
-            return set_swi_errno(env, -1);
+            return set_swi_errno(cs, -1);
         }
 
-        return guestfd_fns[gf->type].writefn(cpu, gf, arg1, len);
+        return guestfd_fns[gf->type].writefn(cs, gf, arg1, len);
     case TARGET_SYS_READ:
         GET_ARG(0);
         GET_ARG(1);
@@ -813,22 +838,22 @@ target_ulong do_common_semihosting(CPUState *cs)
         gf = get_guestfd(arg0);
         if (!gf) {
             errno = EBADF;
-            return set_swi_errno(env, -1);
+            return set_swi_errno(cs, -1);
         }
 
-        return guestfd_fns[gf->type].readfn(cpu, gf, arg1, len);
+        return guestfd_fns[gf->type].readfn(cs, gf, arg1, len);
     case TARGET_SYS_READC:
-        return qemu_semihosting_console_inc(env);
+        return qemu_semihosting_console_inc(cs->env_ptr);
     case TARGET_SYS_ISTTY:
         GET_ARG(0);
 
         gf = get_guestfd(arg0);
         if (!gf) {
             errno = EBADF;
-            return set_swi_errno(env, -1);
+            return set_swi_errno(cs, -1);
         }
 
-        return guestfd_fns[gf->type].isattyfn(cpu, gf);
+        return guestfd_fns[gf->type].isattyfn(cs, gf);
     case TARGET_SYS_SEEK:
         GET_ARG(0);
         GET_ARG(1);
@@ -836,20 +861,20 @@ target_ulong do_common_semihosting(CPUState *cs)
         gf = get_guestfd(arg0);
         if (!gf) {
             errno = EBADF;
-            return set_swi_errno(env, -1);
+            return set_swi_errno(cs, -1);
         }
 
-        return guestfd_fns[gf->type].seekfn(cpu, gf, arg1);
+        return guestfd_fns[gf->type].seekfn(cs, gf, arg1);
     case TARGET_SYS_FLEN:
         GET_ARG(0);
 
         gf = get_guestfd(arg0);
         if (!gf) {
             errno = EBADF;
-            return set_swi_errno(env, -1);
+            return set_swi_errno(cs, -1);
         }
 
-        return guestfd_fns[gf->type].flenfn(cpu, gf);
+        return guestfd_fns[gf->type].flenfn(cs, gf);
     case TARGET_SYS_TMPNAM:
         qemu_log_mask(LOG_UNIMP, "%s: SYS_TMPNAM not implemented", __func__);
         return -1;
@@ -857,15 +882,15 @@ target_ulong do_common_semihosting(CPUState *cs)
         GET_ARG(0);
         GET_ARG(1);
         if (use_gdb_syscalls()) {
-            ret = arm_gdb_syscall(cpu, arm_semi_cb, "unlink,%s",
-                                  arg0, (int)arg1 + 1);
+            ret = common_semi_gdb_syscall(cs, common_semi_cb, "unlink,%s",
+                                          arg0, (int)arg1 + 1);
         } else {
             s = lock_user_string(arg0);
             if (!s) {
                 errno = EFAULT;
-                return set_swi_errno(env, -1);
+                return set_swi_errno(cs, -1);
             }
-            ret =  set_swi_errno(env, remove(s));
+            ret =  set_swi_errno(cs, remove(s));
             unlock_user(s, arg0, 0);
         }
         return ret;
@@ -875,17 +900,18 @@ target_ulong do_common_semihosting(CPUState *cs)
         GET_ARG(2);
         GET_ARG(3);
         if (use_gdb_syscalls()) {
-            return arm_gdb_syscall(cpu, arm_semi_cb, "rename,%s,%s",
-                                   arg0, (int)arg1 + 1, arg2, (int)arg3 + 1);
+            return common_semi_gdb_syscall(cs, common_semi_cb, "rename,%s,%s",
+                                           arg0, (int)arg1 + 1, arg2,
+                                           (int)arg3 + 1);
         } else {
             char *s2;
             s = lock_user_string(arg0);
             s2 = lock_user_string(arg2);
             if (!s || !s2) {
                 errno = EFAULT;
-                ret = set_swi_errno(env, -1);
+                ret = set_swi_errno(cs, -1);
             } else {
-                ret = set_swi_errno(env, rename(s, s2));
+                ret = set_swi_errno(cs, rename(s, s2));
             }
             if (s2)
                 unlock_user(s2, arg2, 0);
@@ -896,25 +922,25 @@ target_ulong do_common_semihosting(CPUState *cs)
     case TARGET_SYS_CLOCK:
         return clock() / (CLOCKS_PER_SEC / 100);
     case TARGET_SYS_TIME:
-        return set_swi_errno(env, time(NULL));
+        return set_swi_errno(cs, time(NULL));
     case TARGET_SYS_SYSTEM:
         GET_ARG(0);
         GET_ARG(1);
         if (use_gdb_syscalls()) {
-            return arm_gdb_syscall(cpu, arm_semi_cb, "system,%s",
-                                   arg0, (int)arg1 + 1);
+            return common_semi_gdb_syscall(cs, common_semi_cb, "system,%s",
+                                           arg0, (int)arg1 + 1);
         } else {
             s = lock_user_string(arg0);
             if (!s) {
                 errno = EFAULT;
-                return set_swi_errno(env, -1);
+                return set_swi_errno(cs, -1);
             }
-            ret = set_swi_errno(env, system(s));
+            ret = set_swi_errno(cs, system(s));
             unlock_user(s, arg0, 0);
             return ret;
         }
     case TARGET_SYS_ERRNO:
-        return get_swi_errno(env);
+        return get_swi_errno(cs);
     case TARGET_SYS_GET_CMDLINE:
         {
             /* Build a command-line from the original argv.
@@ -966,21 +992,21 @@ target_ulong do_common_semihosting(CPUState *cs)
             if (output_size > input_size) {
                 /* Not enough space to store command-line arguments.  */
                 errno = E2BIG;
-                return set_swi_errno(env, -1);
+                return set_swi_errno(cs, -1);
             }
 
             /* Adjust the command-line length.  */
             if (SET_ARG(1, output_size - 1)) {
                 /* Couldn't write back to argument block */
                 errno = EFAULT;
-                return set_swi_errno(env, -1);
+                return set_swi_errno(cs, -1);
             }
 
             /* Lock the buffer on the ARM side.  */
             output_buffer = lock_user(VERIFY_WRITE, arg0, output_size, 0);
             if (!output_buffer) {
                 errno = EFAULT;
-                return set_swi_errno(env, -1);
+                return set_swi_errno(cs, -1);
             }
 
             /* Copy the command-line arguments.  */
@@ -996,7 +1022,7 @@ target_ulong do_common_semihosting(CPUState *cs)
             if (copy_from_user(output_buffer, ts->info->arg_start,
                                output_size)) {
                 errno = EFAULT;
-                status = set_swi_errno(env, -1);
+                status = set_swi_errno(cs, -1);
                 goto out;
             }
 
@@ -1021,8 +1047,7 @@ target_ulong do_common_semihosting(CPUState *cs)
 #ifdef CONFIG_USER_ONLY
             TaskState *ts = cs->opaque;
 #else
-            const struct arm_boot_info *info = env->boot_info;
-            target_ulong rambase = info->loader_start;
+            target_ulong rambase = common_semi_rambase(cs);
 #endif
 
             GET_ARG(0);
@@ -1036,7 +1061,7 @@ target_ulong do_common_semihosting(CPUState *cs)
                 abi_ulong ret;
 
                 ts->heap_base = do_brk(0);
-                limit = ts->heap_base + ARM_ANGEL_HEAP_SIZE;
+                limit = ts->heap_base + COMMON_SEMI_HEAP_SIZE;
                 /* Try a big heap, and reduce the size if that fails.  */
                 for (;;) {
                     ret = do_brk(limit);
@@ -1064,23 +1089,19 @@ target_ulong do_common_semihosting(CPUState *cs)
             for (i = 0; i < ARRAY_SIZE(retvals); i++) {
                 bool fail;
 
-                if (is_a64(env)) {
-                    fail = put_user_u64(retvals[i], arg0 + i * 8);
-                } else {
-                    fail = put_user_u32(retvals[i], arg0 + i * 4);
-                }
+                fail = SET_ARG(i, retvals[i]);
 
                 if (fail) {
                     /* Couldn't write back to argument block */
                     errno = EFAULT;
-                    return set_swi_errno(env, -1);
+                    return set_swi_errno(cs, -1);
                 }
             }
             return 0;
         }
     case TARGET_SYS_EXIT:
     case TARGET_SYS_EXIT_EXTENDED:
-        if (nr == TARGET_SYS_EXIT_EXTENDED || is_a64(env)) {
+        if (common_semi_sys_exit_extended(cs, nr)) {
             /*
              * The A64 version of SYS_EXIT takes a parameter block,
              * so the application-exit type can return a subcode which
@@ -1113,9 +1134,11 @@ target_ulong do_common_semihosting(CPUState *cs)
          * virtual address range. This is a nop for us since we don't
          * implement caches. This is only present on A64.
          */
-        if (is_a64(env)) {
+#ifdef TARGET_ARM
+        if (is_a64(cs->env_ptr)) {
             return 0;
         }
+#endif
         /* fall through -- invalid for A32/T32 */
     default:
         fprintf(stderr, "qemu: Unsupported SemiHosting SWI 0x%02x\n", nr);
-- 
2.20.1


