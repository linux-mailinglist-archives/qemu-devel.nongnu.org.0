Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBECD52F6CB
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 02:28:26 +0200 (CEST)
Received: from localhost ([::1]:52250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsCyn-0004GC-SX
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 20:28:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbu-0008B3-Ua
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:47 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:34756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbT-0003zo-3x
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:38 -0400
Received: by mail-pg1-x531.google.com with SMTP id g184so8989004pgc.1
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 17:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7Ft7CVbGog1TUu0kU/zq3jjXX/+B4Wi5S7h2gXyMVQw=;
 b=InJAiLnT02x2OcNZyBfA4Wu2QFk6Ie5HOq7MGUtX/G7snzgOmqvgsaAPxTKd6lDXyj
 qYqt8UVscLQAoFFf8+5la6jFPaCywQ6NleT2rbF6DexmXF1Pfs99iQEvHR2eNW7icpdf
 chUmZr+HDPd0FSm3CH4lCzbrqdVVwIKGwUvcoHhrf0/zn90sLFzb9n+13OPRqQBYpx1l
 hSFDxTX0s5agxu2acQznMh82pcA8zM0+p/k62jO8SoPzOXo+PGD0zIM2KXFCgLNVrqOk
 iw/Q9zjAGuhbY1ojUMLJY5lBTyRgEDSJ6TlkuvgvixoMqm2FUIUbI/VszucRLXox0+gf
 D5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7Ft7CVbGog1TUu0kU/zq3jjXX/+B4Wi5S7h2gXyMVQw=;
 b=hRcRdF6+pfHF45a4ZNt5dS2KJJvev+JFzTUW/gmndVkXsj41RLSiBmXcPvXGr8BL/4
 Je8L1FC9yzgZKm3qvNeBXcBOf5n28yuBW522GL6Tz/YPHC0WqC9fR6ODKyYo9zRDO1cH
 sLYZ/igpGfXZHBc2Ix82f4tp3rV4uMPsLLIIPO33ChhfW5LHL0iX65w3onwG6KAqtOZj
 2nEex0Faih9Kg7O67NGfYZ55C30mQq3w6M9gADu0s417VuFiDjqFKKttWY33Caf5OWrb
 cSL5E9hS3VAYosUSUr4x/NoLn9nIiz/swu1n/QMLyEDfhKu+AKQ1sQ2t67YvbqjpuQFq
 Eydg==
X-Gm-Message-State: AOAM533h3c/WC9vIUaQ9iLqwKEoYHKNu5WTkuxd3nH4kUakjMh70Wips
 AbXX/DNakHgIvSMLnZgK7LH5ecyHGQT/TQ==
X-Google-Smtp-Source: ABdhPJyD8I05cLlAqbr4NrI6IZOEL3g7kSglJuQjIvuX9/AYlErQIcPnQW4J6Qx9n+l1GbIJ5mGNSQ==
X-Received: by 2002:a63:f151:0:b0:3f6:1c2b:e678 with SMTP id
 o17-20020a63f151000000b003f61c2be678mr10759512pgk.403.1653091457041; 
 Fri, 20 May 2022 17:04:17 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 h8-20020a654808000000b003f9d1c020cbsm306369pgs.51.2022.05.20.17.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 17:04:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 12/49] semihosting: Return void from do_common_semihosting
Date: Fri, 20 May 2022 17:03:23 -0700
Message-Id: <20220521000400.454525-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521000400.454525-1-richard.henderson@linaro.org>
References: <20220521000400.454525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Perform the cleanup in the FIXME comment in common_semi_gdb_syscall.
Do not modify guest registers until the syscall is complete,
which in the gdbstub case is asynchronous.

In the synchronous non-gdbstub case, use common_semi_set_ret
to set the result.  Merge set_swi_errno into common_semi_cb.
Rely on the latter for combined return value / errno setting.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/common-semi.h     |   2 +-
 linux-user/aarch64/cpu_loop.c |   2 +-
 linux-user/arm/cpu_loop.c     |   2 +-
 linux-user/riscv/cpu_loop.c   |   2 +-
 semihosting/arm-compat-semi.c | 543 ++++++++++++++++------------------
 target/arm/helper.c           |   4 +-
 target/arm/m_helper.c         |   2 +-
 target/riscv/cpu_helper.c     |   2 +-
 8 files changed, 264 insertions(+), 295 deletions(-)

diff --git a/semihosting/common-semi.h b/semihosting/common-semi.h
index 0bfab1c669..0a91db7c41 100644
--- a/semihosting/common-semi.h
+++ b/semihosting/common-semi.h
@@ -34,6 +34,6 @@
 #ifndef COMMON_SEMI_H
 #define COMMON_SEMI_H
 
-target_ulong do_common_semihosting(CPUState *cs);
+void do_common_semihosting(CPUState *cs);
 
 #endif /* COMMON_SEMI_H */
diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 3b273f6299..f7ef36cd9f 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -154,7 +154,7 @@ void cpu_loop(CPUARMState *env)
             force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->pc);
             break;
         case EXCP_SEMIHOST:
-            env->xregs[0] = do_common_semihosting(cs);
+            do_common_semihosting(cs);
             env->pc += 4;
             break;
         case EXCP_YIELD:
diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index d950409d5b..c0790f3246 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -449,7 +449,7 @@ void cpu_loop(CPUARMState *env)
             }
             break;
         case EXCP_SEMIHOST:
-            env->regs[0] = do_common_semihosting(cs);
+            do_common_semihosting(cs);
             env->regs[15] += env->thumb ? 2 : 4;
             break;
         case EXCP_INTERRUPT:
diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index 29084c1421..bffca7db12 100644
--- a/linux-user/riscv/cpu_loop.c
+++ b/linux-user/riscv/cpu_loop.c
@@ -81,7 +81,7 @@ void cpu_loop(CPURISCVState *env)
             force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->pc);
             break;
         case RISCV_EXCP_SEMIHOST:
-            env->gpr[xA0] = do_common_semihosting(cs);
+            do_common_semihosting(cs);
             env->pc += 4;
             break;
         default:
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 1f1c5b4c9e..7b56bae7db 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -261,20 +261,6 @@ static target_ulong syscall_err;
 #include "semihosting/softmmu-uaccess.h"
 #endif
 
-static inline uint32_t set_swi_errno(CPUState *cs, uint32_t code)
-{
-    if (code == (uint32_t)-1) {
-#ifdef CONFIG_USER_ONLY
-        TaskState *ts = cs->opaque;
-
-        ts->swi_errno = errno;
-#else
-        syscall_err = errno;
-#endif
-    }
-    return code;
-}
-
 static inline uint32_t get_swi_errno(CPUState *cs)
 {
 #ifdef CONFIG_USER_ONLY
@@ -373,54 +359,24 @@ common_semi_open_cb(CPUState *cs, target_ulong ret, target_ulong err)
     common_semi_cb(cs, ret, err);
 }
 
-static target_ulong
-common_semi_gdb_syscall(CPUState *cs, gdb_syscall_complete_cb cb,
-                        const char *fmt, ...)
-{
-    va_list va;
-
-    va_start(va, fmt);
-    gdb_do_syscallv(cb, fmt, va);
-    va_end(va);
-
-    /*
-     * FIXME: in softmmu mode, the gdbstub will schedule our callback
-     * to occur, but will not actually call it to complete the syscall
-     * until after this function has returned and we are back in the
-     * CPU main loop. Therefore callers to this function must not
-     * do anything with its return value, because it is not necessarily
-     * the result of the syscall, but could just be the old value of X0.
-     * The only thing safe to do with this is that the callers of
-     * do_common_semihosting() will write it straight back into X0.
-     * (In linux-user mode, the callback will have happened before
-     * gdb_do_syscallv() returns.)
-     *
-     * We should tidy this up so neither this function nor
-     * do_common_semihosting() return a value, so the mistake of
-     * doing something with the return value is not possible to make.
-     */
-
-    return common_semi_arg(cs, 0);
-}
-
 /*
  * Types for functions implementing various semihosting calls
  * for specific types of guest file descriptor. These must all
- * do the work and return the required return value for the guest,
- * setting the guest errno if appropriate.
+ * do the work and return the required return value to the guest
+ * via common_semi_cb.
  */
-typedef uint32_t sys_closefn(CPUState *cs, GuestFD *gf);
-typedef uint32_t sys_writefn(CPUState *cs, GuestFD *gf,
-                             target_ulong buf, uint32_t len);
-typedef uint32_t sys_readfn(CPUState *cs, GuestFD *gf,
-                            target_ulong buf, uint32_t len);
-typedef uint32_t sys_isattyfn(CPUState *cs, GuestFD *gf);
-typedef uint32_t sys_seekfn(CPUState *cs, GuestFD *gf,
-                            target_ulong offset);
-typedef uint32_t sys_flenfn(CPUState *cs, GuestFD *gf);
+typedef void sys_closefn(CPUState *cs, GuestFD *gf);
+typedef void sys_writefn(CPUState *cs, GuestFD *gf,
+                         target_ulong buf, uint32_t len);
+typedef void sys_readfn(CPUState *cs, GuestFD *gf,
+                        target_ulong buf, uint32_t len);
+typedef void sys_isattyfn(CPUState *cs, GuestFD *gf);
+typedef void sys_seekfn(CPUState *cs, GuestFD *gf, target_ulong offset);
+typedef void sys_flenfn(CPUState *cs, GuestFD *gf);
 
-static uint32_t host_closefn(CPUState *cs, GuestFD *gf)
+static void host_closefn(CPUState *cs, GuestFD *gf)
 {
+    int ret;
     /*
      * Only close the underlying host fd if it's one we opened on behalf
      * of the guest in SYS_OPEN.
@@ -428,113 +384,106 @@ static uint32_t host_closefn(CPUState *cs, GuestFD *gf)
     if (gf->hostfd == STDIN_FILENO ||
         gf->hostfd == STDOUT_FILENO ||
         gf->hostfd == STDERR_FILENO) {
-        return 0;
+        ret = 0;
+    } else {
+        ret = close(gf->hostfd);
     }
-    return set_swi_errno(cs, close(gf->hostfd));
+    common_semi_cb(cs, ret, ret ? errno : 0);
 }
 
-static uint32_t host_writefn(CPUState *cs, GuestFD *gf,
-                             target_ulong buf, uint32_t len)
+static void host_writefn(CPUState *cs, GuestFD *gf,
+                         target_ulong buf, uint32_t len)
 {
     CPUArchState *env = cs->env_ptr;
-    uint32_t ret;
+    uint32_t ret = 0;
     char *s = lock_user(VERIFY_READ, buf, len, 1);
     (void) env; /* Used in arm softmmu lock_user implicitly */
-    if (!s) {
-        /* Return bytes not written on error */
-        return len;
+    if (s) {
+        ret = write(gf->hostfd, s, len);
+        unlock_user(s, buf, 0);
+        if (ret == (uint32_t)-1) {
+            ret = 0;
+        }
     }
-    ret = set_swi_errno(cs, write(gf->hostfd, s, len));
-    unlock_user(s, buf, 0);
-    if (ret == (uint32_t)-1) {
-        ret = 0;
-    }
-    /* Return bytes not written */
-    return len - ret;
+    /* Return bytes not written, on error as well. */
+    common_semi_cb(cs, len - ret, 0);
 }
 
-static uint32_t host_readfn(CPUState *cs, GuestFD *gf,
-                            target_ulong buf, uint32_t len)
+static void host_readfn(CPUState *cs, GuestFD *gf,
+                        target_ulong buf, uint32_t len)
 {
     CPUArchState *env = cs->env_ptr;
-    uint32_t ret;
+    uint32_t ret = 0;
     char *s = lock_user(VERIFY_WRITE, buf, len, 0);
     (void) env; /* Used in arm softmmu lock_user implicitly */
-    if (!s) {
-        /* return bytes not read */
-        return len;
+    if (s) {
+        do {
+            ret = read(gf->hostfd, s, len);
+        } while (ret == -1 && errno == EINTR);
+        unlock_user(s, buf, len);
+        if (ret == (uint32_t)-1) {
+            ret = 0;
+        }
     }
-    do {
-        ret = set_swi_errno(cs, read(gf->hostfd, s, len));
-    } while (ret == -1 && errno == EINTR);
-    unlock_user(s, buf, len);
-    if (ret == (uint32_t)-1) {
-        ret = 0;
-    }
-    /* Return bytes not read */
-    return len - ret;
+    /* Return bytes not read, on error as well. */
+    common_semi_cb(cs, len - ret, 0);
 }
 
-static uint32_t host_isattyfn(CPUState *cs, GuestFD *gf)
+static void host_isattyfn(CPUState *cs, GuestFD *gf)
 {
-    return isatty(gf->hostfd);
+    common_semi_cb(cs, isatty(gf->hostfd), 0);
 }
 
-static uint32_t host_seekfn(CPUState *cs, GuestFD *gf, target_ulong offset)
+static void host_seekfn(CPUState *cs, GuestFD *gf, target_ulong offset)
 {
-    uint32_t ret = set_swi_errno(cs, lseek(gf->hostfd, offset, SEEK_SET));
-    if (ret == (uint32_t)-1) {
-        return -1;
-    }
-    return 0;
+    off_t ret = lseek(gf->hostfd, offset, SEEK_SET);
+    common_semi_cb(cs, ret, ret == -1 ? errno : 0);
 }
 
-static uint32_t host_flenfn(CPUState *cs, GuestFD *gf)
+static void host_flenfn(CPUState *cs, GuestFD *gf)
 {
     struct stat buf;
-    uint32_t ret = set_swi_errno(cs, fstat(gf->hostfd, &buf));
-    if (ret == (uint32_t)-1) {
-        return -1;
+
+    if (fstat(gf->hostfd, &buf)) {
+        common_semi_cb(cs, -1, errno);
+    } else {
+        common_semi_cb(cs, buf.st_size, 0);
     }
-    return buf.st_size;
 }
 
-static uint32_t gdb_closefn(CPUState *cs, GuestFD *gf)
+static void gdb_closefn(CPUState *cs, GuestFD *gf)
 {
-    return common_semi_gdb_syscall(cs, common_semi_cb, "close,%x", gf->hostfd);
+    gdb_do_syscall(common_semi_cb, "close,%x", gf->hostfd);
 }
 
-static uint32_t gdb_writefn(CPUState *cs, GuestFD *gf,
-                            target_ulong buf, uint32_t len)
+static void gdb_writefn(CPUState *cs, GuestFD *gf,
+                        target_ulong buf, uint32_t len)
 {
     common_semi_syscall_len = len;
-    return common_semi_gdb_syscall(cs, common_semi_cb, "write,%x,%x,%x",
-                                   gf->hostfd, buf, len);
+    gdb_do_syscall(common_semi_cb, "write,%x,%x,%x", gf->hostfd, buf, len);
 }
 
-static uint32_t gdb_readfn(CPUState *cs, GuestFD *gf,
-                           target_ulong buf, uint32_t len)
+static void gdb_readfn(CPUState *cs, GuestFD *gf,
+                       target_ulong buf, uint32_t len)
 {
     common_semi_syscall_len = len;
-    return common_semi_gdb_syscall(cs, common_semi_cb, "read,%x,%x,%x",
-                                   gf->hostfd, buf, len);
+    gdb_do_syscall(common_semi_cb, "read,%x,%x,%x", gf->hostfd, buf, len);
 }
 
-static uint32_t gdb_isattyfn(CPUState *cs, GuestFD *gf)
+static void gdb_isattyfn(CPUState *cs, GuestFD *gf)
 {
-    return common_semi_gdb_syscall(cs, common_semi_cb, "isatty,%x", gf->hostfd);
+    gdb_do_syscall(common_semi_cb, "isatty,%x", gf->hostfd);
 }
 
-static uint32_t gdb_seekfn(CPUState *cs, GuestFD *gf, target_ulong offset)
+static void gdb_seekfn(CPUState *cs, GuestFD *gf, target_ulong offset)
 {
-    return common_semi_gdb_syscall(cs, common_semi_cb, "lseek,%x,%x,0",
-                                   gf->hostfd, offset);
+    gdb_do_syscall(common_semi_cb, "lseek,%x,%x,0", gf->hostfd, offset);
 }
 
-static uint32_t gdb_flenfn(CPUState *cs, GuestFD *gf)
+static void gdb_flenfn(CPUState *cs, GuestFD *gf)
 {
-    return common_semi_gdb_syscall(cs, common_semi_flen_cb, "fstat,%x,%x",
-                                   gf->hostfd, common_semi_flen_buf(cs));
+    gdb_do_syscall(common_semi_flen_cb, "fstat,%x,%x",
+                   gf->hostfd, common_semi_flen_buf(cs));
 }
 
 #define SHFB_MAGIC_0 0x53
@@ -554,63 +503,57 @@ static const uint8_t featurefile_data[] = {
     SH_EXT_EXIT_EXTENDED | SH_EXT_STDOUT_STDERR, /* Feature byte 0 */
 };
 
-static uint32_t staticfile_closefn(CPUState *cs, GuestFD *gf)
+static void staticfile_closefn(CPUState *cs, GuestFD *gf)
 {
     /* Nothing to do */
-    return 0;
+    common_semi_cb(cs, 0, 0);
 }
 
-static uint32_t staticfile_writefn(CPUState *cs, GuestFD *gf,
-                                    target_ulong buf, uint32_t len)
+static void staticfile_writefn(CPUState *cs, GuestFD *gf,
+                               target_ulong buf, uint32_t len)
 {
     /* This fd can never be open for writing */
-
-    errno = EBADF;
-    return set_swi_errno(cs, -1);
+    common_semi_cb(cs, -1, EBADF);
 }
 
-static uint32_t staticfile_readfn(CPUState *cs, GuestFD *gf,
-                                   target_ulong buf, uint32_t len)
+static void staticfile_readfn(CPUState *cs, GuestFD *gf,
+                              target_ulong buf, uint32_t len)
 {
     CPUArchState *env = cs->env_ptr;
-    uint32_t i;
+    uint32_t i = 0;
     char *s;
 
     (void) env; /* Used in arm softmmu lock_user implicitly */
     s = lock_user(VERIFY_WRITE, buf, len, 0);
-    if (!s) {
-        return len;
-    }
-
-    for (i = 0; i < len; i++) {
-        if (gf->staticfile.off >= gf->staticfile.len) {
-            break;
+    if (s) {
+        for (i = 0; i < len; i++) {
+            if (gf->staticfile.off >= gf->staticfile.len) {
+                break;
+            }
+            s[i] = gf->staticfile.data[gf->staticfile.off];
+            gf->staticfile.off++;
         }
-        s[i] = gf->staticfile.data[gf->staticfile.off];
-        gf->staticfile.off++;
+        unlock_user(s, buf, len);
     }
 
-    unlock_user(s, buf, len);
-
     /* Return number of bytes not read */
-    return len - i;
+    common_semi_cb(cs, len - i, 0);
 }
 
-static uint32_t staticfile_isattyfn(CPUState *cs, GuestFD *gf)
+static void staticfile_isattyfn(CPUState *cs, GuestFD *gf)
 {
-    return 0;
+    common_semi_cb(cs, 0, 0);
 }
 
-static uint32_t staticfile_seekfn(CPUState *cs, GuestFD *gf,
-                                   target_ulong offset)
+static void staticfile_seekfn(CPUState *cs, GuestFD *gf, target_ulong offset)
 {
     gf->staticfile.off = offset;
-    return 0;
+    common_semi_cb(cs, 0, 0);
 }
 
-static uint32_t staticfile_flenfn(CPUState *cs, GuestFD *gf)
+static void staticfile_flenfn(CPUState *cs, GuestFD *gf)
 {
-    return gf->staticfile.len;
+    common_semi_cb(cs, gf->staticfile.len, 0);
 }
 
 typedef struct GuestFDFunctions {
@@ -669,13 +612,11 @@ static inline bool is_64bit_semihosting(CPUArchState *env)
 #define GET_ARG(n) do {                                 \
     if (is_64bit_semihosting(env)) {                    \
         if (get_user_u64(arg ## n, args + (n) * 8)) {   \
-            errno = EFAULT;                             \
-            return set_swi_errno(cs, -1);               \
+            goto do_fault;                              \
         }                                               \
     } else {                                            \
         if (get_user_u32(arg ## n, args + (n) * 4)) {   \
-            errno = EFAULT;                             \
-            return set_swi_errno(cs, -1);              \
+            goto do_fault;                              \
         }                                               \
     }                                                   \
 } while (0)
@@ -695,7 +636,7 @@ static inline bool is_64bit_semihosting(CPUArchState *env)
  * leave the register unchanged. We use 0xdeadbeef as the return value
  * when there isn't a defined return value for the call.
  */
-target_ulong do_common_semihosting(CPUState *cs)
+void do_common_semihosting(CPUState *cs)
 {
     CPUArchState *env = cs->env_ptr;
     target_ulong args;
@@ -715,32 +656,23 @@ target_ulong do_common_semihosting(CPUState *cs)
     switch (nr) {
     case TARGET_SYS_OPEN:
     {
-        int guestfd;
+        int ret, err = 0;
+        int hostfd;
 
         GET_ARG(0);
         GET_ARG(1);
         GET_ARG(2);
         s = lock_user_string(arg0);
         if (!s) {
-            errno = EFAULT;
-            return set_swi_errno(cs, -1);
+            goto do_fault;
         }
         if (arg1 >= 12) {
             unlock_user(s, arg0, 0);
-            errno = EINVAL;
-            return set_swi_errno(cs, -1);
-        }
-
-        guestfd = alloc_guestfd();
-        if (guestfd < 0) {
-            unlock_user(s, arg0, 0);
-            errno = EMFILE;
-            return set_swi_errno(cs, -1);
+            common_semi_cb(cs, -1, EINVAL);
+            break;
         }
 
         if (strcmp(s, ":tt") == 0) {
-            int result_fileno;
-
             /*
              * We implement SH_EXT_STDOUT_STDERR, so:
              *  open for read == stdin
@@ -748,63 +680,67 @@ target_ulong do_common_semihosting(CPUState *cs)
              *  open for append == stderr
              */
             if (arg1 < 4) {
-                result_fileno = STDIN_FILENO;
+                hostfd = STDIN_FILENO;
             } else if (arg1 < 8) {
-                result_fileno = STDOUT_FILENO;
+                hostfd = STDOUT_FILENO;
             } else {
-                result_fileno = STDERR_FILENO;
+                hostfd = STDERR_FILENO;
             }
-            associate_guestfd(guestfd, result_fileno);
-            unlock_user(s, arg0, 0);
-            return guestfd;
-        }
-        if (strcmp(s, ":semihosting-features") == 0) {
-            unlock_user(s, arg0, 0);
+            ret = alloc_guestfd();
+            associate_guestfd(ret, hostfd);
+        } else if (strcmp(s, ":semihosting-features") == 0) {
             /* We must fail opens for modes other than 0 ('r') or 1 ('rb') */
             if (arg1 != 0 && arg1 != 1) {
-                dealloc_guestfd(guestfd);
-                errno = EACCES;
-                return set_swi_errno(cs, -1);
-            }
-            staticfile_guestfd(guestfd, featurefile_data,
-                               sizeof(featurefile_data));
-            return guestfd;
-        }
-
-        if (use_gdb_syscalls()) {
-            common_semi_open_guestfd = guestfd;
-            ret = common_semi_gdb_syscall(cs, common_semi_open_cb,
-                                          "open,%s,%x,1a4", arg0, (int)arg2 + 1,
-                                          gdb_open_modeflags[arg1]);
-        } else {
-            ret = set_swi_errno(cs, open(s, open_modeflags[arg1], 0644));
-            if (ret == (uint32_t)-1) {
-                dealloc_guestfd(guestfd);
+                ret = -1;
+                err = EACCES;
             } else {
-                associate_guestfd(guestfd, ret);
-                ret = guestfd;
+                ret = alloc_guestfd();
+                staticfile_guestfd(ret, featurefile_data,
+                                   sizeof(featurefile_data));
+            }
+        } else if (use_gdb_syscalls()) {
+            unlock_user(s, arg0, 0);
+            common_semi_open_guestfd = alloc_guestfd();
+            gdb_do_syscall(common_semi_open_cb,
+                           "open,%s,%x,1a4", arg0, (int)arg2 + 1,
+                           gdb_open_modeflags[arg1]);
+            break;
+        } else {
+            hostfd = open(s, open_modeflags[arg1], 0644);
+            if (hostfd < 0) {
+                ret = -1;
+                err = errno;
+            } else {
+                ret = alloc_guestfd();
+                associate_guestfd(ret, hostfd);
             }
         }
         unlock_user(s, arg0, 0);
-        return ret;
+        common_semi_cb(cs, ret, err);
+        break;
     }
+
     case TARGET_SYS_CLOSE:
         GET_ARG(0);
 
         gf = get_guestfd(arg0);
         if (!gf) {
-            errno = EBADF;
-            return set_swi_errno(cs, -1);
+            goto do_badf;
         }
-
-        ret = guestfd_fns[gf->type].closefn(cs, gf);
+        guestfd_fns[gf->type].closefn(cs, gf);
         dealloc_guestfd(arg0);
-        return ret;
+        break;
+
     case TARGET_SYS_WRITEC:
         qemu_semihosting_console_outc(cs->env_ptr, args);
-        return 0xdeadbeef;
+        common_semi_set_ret(cs, 0xdeadbeef);
+        break;
+
     case TARGET_SYS_WRITE0:
-        return qemu_semihosting_console_outs(cs->env_ptr, args);
+        ret = qemu_semihosting_console_outs(cs->env_ptr, args);
+        common_semi_set_ret(cs, ret);
+        break;
+
     case TARGET_SYS_WRITE:
         GET_ARG(0);
         GET_ARG(1);
@@ -813,11 +749,11 @@ target_ulong do_common_semihosting(CPUState *cs)
 
         gf = get_guestfd(arg0);
         if (!gf) {
-            errno = EBADF;
-            return set_swi_errno(cs, -1);
+            goto do_badf;
         }
+        guestfd_fns[gf->type].writefn(cs, gf, arg1, len);
+        break;
 
-        return guestfd_fns[gf->type].writefn(cs, gf, arg1, len);
     case TARGET_SYS_READ:
         GET_ARG(0);
         GET_ARG(1);
@@ -826,129 +762,150 @@ target_ulong do_common_semihosting(CPUState *cs)
 
         gf = get_guestfd(arg0);
         if (!gf) {
-            errno = EBADF;
-            return set_swi_errno(cs, -1);
+            goto do_badf;
         }
+        guestfd_fns[gf->type].readfn(cs, gf, arg1, len);
+        break;
 
-        return guestfd_fns[gf->type].readfn(cs, gf, arg1, len);
     case TARGET_SYS_READC:
-        return qemu_semihosting_console_inc(cs->env_ptr);
+        ret = qemu_semihosting_console_inc(cs->env_ptr);
+        common_semi_set_ret(cs, ret);
+        break;
+
     case TARGET_SYS_ISERROR:
         GET_ARG(0);
-        return (target_long) arg0 < 0 ? 1 : 0;
+        common_semi_set_ret(cs, (target_long)arg0 < 0);
+        break;
+
     case TARGET_SYS_ISTTY:
         GET_ARG(0);
 
         gf = get_guestfd(arg0);
         if (!gf) {
-            errno = EBADF;
-            return set_swi_errno(cs, -1);
+            goto do_badf;
         }
+        guestfd_fns[gf->type].isattyfn(cs, gf);
+        break;
 
-        return guestfd_fns[gf->type].isattyfn(cs, gf);
     case TARGET_SYS_SEEK:
         GET_ARG(0);
         GET_ARG(1);
 
         gf = get_guestfd(arg0);
         if (!gf) {
-            errno = EBADF;
-            return set_swi_errno(cs, -1);
+            goto do_badf;
         }
+        guestfd_fns[gf->type].seekfn(cs, gf, arg1);
+        break;
 
-        return guestfd_fns[gf->type].seekfn(cs, gf, arg1);
     case TARGET_SYS_FLEN:
         GET_ARG(0);
 
         gf = get_guestfd(arg0);
         if (!gf) {
-            errno = EBADF;
-            return set_swi_errno(cs, -1);
+            goto do_badf;
         }
+        guestfd_fns[gf->type].flenfn(cs, gf);
+        break;
 
-        return guestfd_fns[gf->type].flenfn(cs, gf);
     case TARGET_SYS_TMPNAM:
+    {
+        int len;
+        char *p;
+
         GET_ARG(0);
         GET_ARG(1);
         GET_ARG(2);
-        if (asprintf(&s, "/tmp/qemu-%x%02x", getpid(),
-                     (int) (arg1 & 0xff)) < 0) {
-            return -1;
-        }
-        ul_ret = (target_ulong) -1;
-
+        len = asprintf(&s, "/tmp/qemu-%x%02x", getpid(), (int)arg1 & 0xff);
         /* Make sure there's enough space in the buffer */
-        if (strlen(s) < arg2) {
-            char *output = lock_user(VERIFY_WRITE, arg0, arg2, 0);
-            strcpy(output, s);
-            unlock_user(output, arg0, arg2);
-            ul_ret = 0;
+        if (len < 0 || len >= arg2) {
+            common_semi_set_ret(cs, -1);
+            break;
         }
+        p = lock_user(VERIFY_WRITE, arg0, len, 0);
+        if (!p) {
+            goto do_fault;
+        }
+        memcpy(p, s, len + 1);
+        unlock_user(p, arg0, len);
         free(s);
-        return ul_ret;
+        common_semi_set_ret(cs, 0);
+        break;
+    }
+
     case TARGET_SYS_REMOVE:
         GET_ARG(0);
         GET_ARG(1);
         if (use_gdb_syscalls()) {
-            ret = common_semi_gdb_syscall(cs, common_semi_cb, "unlink,%s",
-                                          arg0, (int)arg1 + 1);
-        } else {
-            s = lock_user_string(arg0);
-            if (!s) {
-                errno = EFAULT;
-                return set_swi_errno(cs, -1);
-            }
-            ret =  set_swi_errno(cs, remove(s));
-            unlock_user(s, arg0, 0);
+            gdb_do_syscall(common_semi_cb, "unlink,%s",
+                           arg0, (int)arg1 + 1);
+            break;
         }
-        return ret;
+        s = lock_user_string(arg0);
+        if (!s) {
+            goto do_fault;
+        }
+        ret = remove(s);
+        unlock_user(s, arg0, 0);
+        common_semi_cb(cs, ret, ret ? errno : 0);
+        break;
+
     case TARGET_SYS_RENAME:
         GET_ARG(0);
         GET_ARG(1);
         GET_ARG(2);
         GET_ARG(3);
         if (use_gdb_syscalls()) {
-            return common_semi_gdb_syscall(cs, common_semi_cb, "rename,%s,%s",
-                                           arg0, (int)arg1 + 1, arg2,
-                                           (int)arg3 + 1);
+            gdb_do_syscall(common_semi_cb, "rename,%s,%s",
+                           arg0, (int)arg1 + 1, arg2, (int)arg3 + 1);
         } else {
             char *s2;
+
             s = lock_user_string(arg0);
-            s2 = lock_user_string(arg2);
-            if (!s || !s2) {
-                errno = EFAULT;
-                ret = set_swi_errno(cs, -1);
-            } else {
-                ret = set_swi_errno(cs, rename(s, s2));
+            if (!s) {
+                goto do_fault;
             }
-            if (s2)
-                unlock_user(s2, arg2, 0);
-            if (s)
+            s2 = lock_user_string(arg2);
+            if (!s2) {
                 unlock_user(s, arg0, 0);
-            return ret;
+                goto do_fault;
+            }
+            ret = rename(s, s2);
+            unlock_user(s2, arg2, 0);
+            unlock_user(s, arg0, 0);
+            common_semi_cb(cs, ret, ret ? errno : 0);
         }
+        break;
+
     case TARGET_SYS_CLOCK:
-        return clock() / (CLOCKS_PER_SEC / 100);
+        common_semi_set_ret(cs, clock() / (CLOCKS_PER_SEC / 100));
+        break;
+
     case TARGET_SYS_TIME:
-        return set_swi_errno(cs, time(NULL));
+        ul_ret = time(NULL);
+        common_semi_cb(cs, ul_ret, ul_ret == -1 ? errno : 0);
+        break;
+
     case TARGET_SYS_SYSTEM:
         GET_ARG(0);
         GET_ARG(1);
         if (use_gdb_syscalls()) {
-            return common_semi_gdb_syscall(cs, common_semi_cb, "system,%s",
-                                           arg0, (int)arg1 + 1);
-        } else {
-            s = lock_user_string(arg0);
-            if (!s) {
-                errno = EFAULT;
-                return set_swi_errno(cs, -1);
-            }
-            ret = set_swi_errno(cs, system(s));
-            unlock_user(s, arg0, 0);
-            return ret;
+            gdb_do_syscall(common_semi_cb, "system,%s", arg0, (int)arg1 + 1);
+            break;
         }
+        s = lock_user_string(arg0);
+        if (!s) {
+            goto do_fault;
+        }
+        ret = system(s);
+        unlock_user(s, arg0, 0);
+        common_semi_cb(cs, ret, ret == -1 ? errno : 0);
+        break;
+
     case TARGET_SYS_ERRNO:
-        return get_swi_errno(cs);
+        common_semi_set_ret(cs, get_swi_errno(cs));
+        break;
+
     case TARGET_SYS_GET_CMDLINE:
         {
             /* Build a command-line from the original argv.
@@ -999,22 +956,20 @@ target_ulong do_common_semihosting(CPUState *cs)
 
             if (output_size > input_size) {
                 /* Not enough space to store command-line arguments.  */
-                errno = E2BIG;
-                return set_swi_errno(cs, -1);
+                common_semi_cb(cs, -1, E2BIG);
+                break;
             }
 
             /* Adjust the command-line length.  */
             if (SET_ARG(1, output_size - 1)) {
                 /* Couldn't write back to argument block */
-                errno = EFAULT;
-                return set_swi_errno(cs, -1);
+                goto do_fault;
             }
 
             /* Lock the buffer on the ARM side.  */
             output_buffer = lock_user(VERIFY_WRITE, arg0, output_size, 0);
             if (!output_buffer) {
-                errno = EFAULT;
-                return set_swi_errno(cs, -1);
+                goto do_fault;
             }
 
             /* Copy the command-line arguments.  */
@@ -1029,9 +984,8 @@ target_ulong do_common_semihosting(CPUState *cs)
 
             if (copy_from_user(output_buffer, ts->info->arg_start,
                                output_size)) {
-                errno = EFAULT;
-                status = set_swi_errno(cs, -1);
-                goto out;
+                unlock_user(output_buffer, arg0, 0);
+                goto do_fault;
             }
 
             /* Separate arguments by white spaces.  */
@@ -1044,9 +998,10 @@ target_ulong do_common_semihosting(CPUState *cs)
 #endif
             /* Unlock the buffer on the ARM side.  */
             unlock_user(output_buffer, arg0, output_size);
-
-            return status;
+            common_semi_cb(cs, status, 0);
         }
+        break;
+
     case TARGET_SYS_HEAPINFO:
         {
             target_ulong retvals[4];
@@ -1103,12 +1058,13 @@ target_ulong do_common_semihosting(CPUState *cs)
 
                 if (fail) {
                     /* Couldn't write back to argument block */
-                    errno = EFAULT;
-                    return set_swi_errno(cs, -1);
+                    goto do_fault;
                 }
             }
-            return 0;
+            common_semi_set_ret(cs, 0);
         }
+        break;
+
     case TARGET_SYS_EXIT:
     case TARGET_SYS_EXIT_EXTENDED:
         if (common_semi_sys_exit_extended(cs, nr)) {
@@ -1138,6 +1094,7 @@ target_ulong do_common_semihosting(CPUState *cs)
         }
         gdb_exit(ret);
         exit(ret);
+
     case TARGET_SYS_ELAPSED:
         elapsed = get_clock() - clock_start;
         if (sizeof(target_ulong) == 8) {
@@ -1146,10 +1103,14 @@ target_ulong do_common_semihosting(CPUState *cs)
             SET_ARG(0, (uint32_t) elapsed);
             SET_ARG(1, (uint32_t) (elapsed >> 32));
         }
-        return 0;
+        common_semi_set_ret(cs, 0);
+        break;
+
     case TARGET_SYS_TICKFREQ:
         /* qemu always uses nsec */
-        return 1000000000;
+        common_semi_set_ret(cs, 1000000000);
+        break;
+
     case TARGET_SYS_SYNCCACHE:
         /*
          * Clean the D-cache and invalidate the I-cache for the specified
@@ -1158,16 +1119,24 @@ target_ulong do_common_semihosting(CPUState *cs)
          */
 #ifdef TARGET_ARM
         if (is_a64(cs->env_ptr)) {
-            return 0;
+            common_semi_set_ret(cs, 0);
+            break;
         }
 #endif
 #ifdef TARGET_RISCV
-        return 0;
+        common_semi_set_ret(cs, 0);
 #endif
         /* fall through -- invalid for A32/T32 */
     default:
         fprintf(stderr, "qemu: Unsupported SemiHosting SWI 0x%02x\n", nr);
         cpu_dump_state(cs, stderr, 0);
         abort();
+
+    do_badf:
+        common_semi_cb(cs, -1, EBADF);
+        break;
+    do_fault:
+        common_semi_cb(cs, -1, EFAULT);
+        break;
     }
 }
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 40da63913c..902abe67cf 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10313,13 +10313,13 @@ static void handle_semihosting(CPUState *cs)
         qemu_log_mask(CPU_LOG_INT,
                       "...handling as semihosting call 0x%" PRIx64 "\n",
                       env->xregs[0]);
-        env->xregs[0] = do_common_semihosting(cs);
+        do_common_semihosting(cs);
         env->pc += 4;
     } else {
         qemu_log_mask(CPU_LOG_INT,
                       "...handling as semihosting call 0x%x\n",
                       env->regs[0]);
-        env->regs[0] = do_common_semihosting(cs);
+        do_common_semihosting(cs);
         env->regs[15] += env->thumb ? 2 : 4;
     }
 }
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index a740c3e160..308610f6b4 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -2373,7 +2373,7 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
                       "...handling as semihosting call 0x%x\n",
                       env->regs[0]);
 #ifdef CONFIG_TCG
-        env->regs[0] = do_common_semihosting(cs);
+        do_common_semihosting(cs);
 #else
         g_assert_not_reached();
 #endif
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index e1aa4f2097..55105cb0cc 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1345,7 +1345,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
 
     if  (cause == RISCV_EXCP_SEMIHOST) {
         if (env->priv >= PRV_S) {
-            env->gpr[xA0] = do_common_semihosting(cs);
+            do_common_semihosting(cs);
             env->pc += 4;
             return;
         }
-- 
2.34.1


