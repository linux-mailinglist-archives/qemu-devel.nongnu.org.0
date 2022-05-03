Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B08C2518F12
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:39:35 +0200 (CEST)
Received: from localhost ([::1]:37298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlzJ0-0002G3-OD
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:39:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZg-0008Qu-2T
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:44 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:37751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZd-0006Ky-UE
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:43 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 t11-20020a17090ad50b00b001d95bf21996so3235104pju.2
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=s6WKnfYdYMcw1Zz1TWclm7cmlzkoYCvdkNaKkdbdgBg=;
 b=IXzdISf+yY2V5SbUoQVcX3gF3KS0oyiT2dDlrjkvzb+zgpU/vepipgc+7ACUiJc8Vg
 GTudgo8Nb/Z7+C1oP3zNQm8J/N8aaQ0Cz8uYq5oKbC/wMDwUiH4kaMhVtZIsqHmCv0oo
 yCadmF34mzzzNGgW/DSa9pVvot9molxGBf/viSFf0ezYRdLxA3pEqHEG6moDAe7ejcxY
 oKP0FtmfTf4lFP7rrRy1r4kqv1GuBbKpGEzcv0a9iF7IGwaSzn9O/AC0bLPUPwfnWkXc
 Avjw3uD5NGlXR8x6JgxILFF+ncHu/GauaxChiWIbSUCSQNccej4pi6Y5q7x+GXDahTf3
 NlBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s6WKnfYdYMcw1Zz1TWclm7cmlzkoYCvdkNaKkdbdgBg=;
 b=H1KVwewzNFGaZxZIhmeB0CXnAELubdUyw64bEToWbyFIxZxxRezmFx03DnQDlPcwtr
 sUInTaLrZ3/y++8FcEs+NYMegIngrER2OYMPFEiPGqfBp7nwh9xGybAkGNHiefHCe1Mz
 huE2+9/ZvuCB9WEjbJTR9VRJMC32gl77CpogOf6FCwlPAEsP4jj/J9jgMXcp3Q9wYP5a
 6acmkdyZyCZvJ8Lax+wPCuduFWqz7Jdug17lZZ0vNKM1vzwkvvGZu7RI0ODLrcoTx+Qy
 rXNc7XYSo49a4wW8w6Mm2l6CVgLnVT7VVjtYxkFhuZq6Dp8I22vvHL8uRVtUSfCuaAtq
 GLLQ==
X-Gm-Message-State: AOAM533plgxZ4oLN4YeHXKrfDOaKZoJSnAth+PmxWh+j9Pgjafbu/gzF
 YJ72O30kNHvPemRBzL5xWxK4yWuEZyRrVQ==
X-Google-Smtp-Source: ABdhPJwvxwSQpm1cLFrZHmfB4ytfEW5u9yK2xGTuEo7uC3SHCt1eDjvTCljd9q+kNYgDcaV6yO+4fw==
X-Received: by 2002:a17:90a:5215:b0:1ca:79cf:f3dd with SMTP id
 v21-20020a17090a521500b001ca79cff3ddmr6677536pjh.6.1651607558208; 
 Tue, 03 May 2022 12:52:38 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 fz16-20020a17090b025000b001dbe11be891sm1692286pjb.44.2022.05.03.12.52.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:52:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 53/74] target/nios2: Use semihosting/syscalls.h
Date: Tue,  3 May 2022 12:48:22 -0700
Message-Id: <20220503194843.1379101-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

This separates guest file descriptors from host file descriptors,
and utilizes shared infrastructure for integration with gdbstub.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/nios2-semi.c | 287 ++++++--------------------------------
 1 file changed, 41 insertions(+), 246 deletions(-)

diff --git a/target/nios2/nios2-semi.c b/target/nios2/nios2-semi.c
index bdf8849689..1b5afc9333 100644
--- a/target/nios2/nios2-semi.c
+++ b/target/nios2/nios2-semi.c
@@ -25,6 +25,7 @@
 
 #include "cpu.h"
 #include "exec/gdbstub.h"
+#include "semihosting/syscalls.h"
 #if defined(CONFIG_USER_ONLY)
 #include "qemu.h"
 #else
@@ -47,67 +48,6 @@
 #define HOSTED_ISATTY 12
 #define HOSTED_SYSTEM 13
 
-static int translate_openflags(int flags)
-{
-    int hf;
-
-    if (flags & GDB_O_WRONLY) {
-        hf = O_WRONLY;
-    } else if (flags & GDB_O_RDWR) {
-        hf = O_RDWR;
-    } else {
-        hf = O_RDONLY;
-    }
-
-    if (flags & GDB_O_APPEND) {
-        hf |= O_APPEND;
-    }
-    if (flags & GDB_O_CREAT) {
-        hf |= O_CREAT;
-    }
-    if (flags & GDB_O_TRUNC) {
-        hf |= O_TRUNC;
-    }
-    if (flags & GDB_O_EXCL) {
-        hf |= O_EXCL;
-    }
-
-    return hf;
-}
-
-static bool translate_stat(CPUNios2State *env, target_ulong addr,
-                           struct stat *s)
-{
-    struct gdb_stat *p;
-
-    p = lock_user(VERIFY_WRITE, addr, sizeof(struct gdb_stat), 0);
-
-    if (!p) {
-        return false;
-    }
-    p->gdb_st_dev = cpu_to_be32(s->st_dev);
-    p->gdb_st_ino = cpu_to_be32(s->st_ino);
-    p->gdb_st_mode = cpu_to_be32(s->st_mode);
-    p->gdb_st_nlink = cpu_to_be32(s->st_nlink);
-    p->gdb_st_uid = cpu_to_be32(s->st_uid);
-    p->gdb_st_gid = cpu_to_be32(s->st_gid);
-    p->gdb_st_rdev = cpu_to_be32(s->st_rdev);
-    p->gdb_st_size = cpu_to_be64(s->st_size);
-#ifdef _WIN32
-    /* Windows stat is missing some fields.  */
-    p->gdb_st_blksize = 0;
-    p->gdb_st_blocks = 0;
-#else
-    p->gdb_st_blksize = cpu_to_be64(s->st_blksize);
-    p->gdb_st_blocks = cpu_to_be64(s->st_blocks);
-#endif
-    p->gdb_st_atime = cpu_to_be32(s->st_atime);
-    p->gdb_st_mtime = cpu_to_be32(s->st_mtime);
-    p->gdb_st_ctime = cpu_to_be32(s->st_ctime);
-    unlock_user(p, addr, sizeof(struct gdb_stat));
-    return true;
-}
-
 static void nios2_semi_u32_cb(CPUState *cs, uint64_t ret, int err)
 {
     Nios2CPU *cpu = NIOS2_CPU(cs);
@@ -147,8 +87,6 @@ static void nios2_semi_u64_cb(CPUState *cs, uint64_t ret, int err)
  */
 #define GET_ARG(n) do {                                 \
     if (get_user_ual(arg ## n, args + (n) * 4)) {       \
-        result = -1;                                    \
-        errno = EFAULT;                                 \
         goto failed;                                    \
     }                                                   \
 } while (0)
@@ -159,10 +97,6 @@ void do_nios2_semihosting(CPUNios2State *env)
     int nr;
     uint32_t args;
     target_ulong arg0, arg1, arg2, arg3;
-    void *p;
-    void *q;
-    uint32_t len;
-    uint32_t result;
 
     nr = env->regs[R_ARG0];
     args = env->regs[R_ARG1];
@@ -170,234 +104,95 @@ void do_nios2_semihosting(CPUNios2State *env)
     case HOSTED_EXIT:
         gdb_exit(env->regs[R_ARG0]);
         exit(env->regs[R_ARG0]);
+
     case HOSTED_OPEN:
         GET_ARG(0);
         GET_ARG(1);
         GET_ARG(2);
         GET_ARG(3);
-        if (use_gdb_syscalls()) {
-            gdb_do_syscall(nios2_semi_u32_cb, "open,%s,%x,%x", arg0, (int)arg1,
-                           arg2, arg3);
-            return;
-        } else {
-            p = lock_user_string(arg0);
-            if (!p) {
-                result = -1;
-                errno = EFAULT;
-            } else {
-                result = open(p, translate_openflags(arg2), arg3);
-                unlock_user(p, arg0, 0);
-            }
-        }
+        semihost_sys_open(cs, nios2_semi_u32_cb, arg0, arg1, arg2, arg3);
         break;
+
     case HOSTED_CLOSE:
-        {
-            /* Ignore attempts to close stdin/out/err.  */
-            GET_ARG(0);
-            int fd = arg0;
-            if (fd > 2) {
-                if (use_gdb_syscalls()) {
-                    gdb_do_syscall(nios2_semi_u32_cb, "close,%x", arg0);
-                    return;
-                } else {
-                    result = close(fd);
-                }
-            } else {
-                result = 0;
-            }
-            break;
-        }
+        GET_ARG(0);
+        semihost_sys_close(cs, nios2_semi_u32_cb, arg0);
+        break;
+
     case HOSTED_READ:
         GET_ARG(0);
         GET_ARG(1);
         GET_ARG(2);
-        len = arg2;
-        if (use_gdb_syscalls()) {
-            gdb_do_syscall(nios2_semi_u32_cb, "read,%x,%x,%x",
-                           arg0, arg1, len);
-            return;
-        } else {
-            p = lock_user(VERIFY_WRITE, arg1, len, 0);
-            if (!p) {
-                result = -1;
-                errno = EFAULT;
-            } else {
-                result = read(arg0, p, len);
-                unlock_user(p, arg1, len);
-            }
-        }
+        semihost_sys_read(cs, nios2_semi_u32_cb, arg0, arg1, arg2);
         break;
+
     case HOSTED_WRITE:
         GET_ARG(0);
         GET_ARG(1);
         GET_ARG(2);
-        len = arg2;
-        if (use_gdb_syscalls()) {
-            gdb_do_syscall(nios2_semi_u32_cb, "write,%x,%x,%x",
-                           arg0, arg1, len);
-            return;
-        } else {
-            p = lock_user(VERIFY_READ, arg1, len, 1);
-            if (!p) {
-                result = -1;
-                errno = EFAULT;
-            } else {
-                result = write(arg0, p, len);
-                unlock_user(p, arg0, 0);
-            }
-        }
+        semihost_sys_write(cs, nios2_semi_u32_cb, arg0, arg1, arg2);
         break;
+
     case HOSTED_LSEEK:
-        {
-            uint64_t off;
-            GET_ARG(0);
-            GET_ARG(1);
-            GET_ARG(2);
-            GET_ARG(3);
-            off = (uint32_t)arg2 | ((uint64_t)arg1 << 32);
-            if (use_gdb_syscalls()) {
-                gdb_do_syscall(nios2_semi_u64_cb, "lseek,%x,%lx,%x",
-                               arg0, off, arg3);
-            } else {
-                off = lseek(arg0, off, arg3);
-                nios2_semi_u64_cb(cs, off, errno);
-            }
-            return;
-        }
+        GET_ARG(0);
+        GET_ARG(1);
+        GET_ARG(2);
+        GET_ARG(3);
+        semihost_sys_lseek(cs, nios2_semi_u64_cb, arg0,
+                           deposit64(arg2, arg1, 32, 32), arg3);
+        break;
+
     case HOSTED_RENAME:
         GET_ARG(0);
         GET_ARG(1);
         GET_ARG(2);
         GET_ARG(3);
-        if (use_gdb_syscalls()) {
-            gdb_do_syscall(nios2_semi_u32_cb, "rename,%s,%s",
-                           arg0, (int)arg1, arg2, (int)arg3);
-            return;
-        } else {
-            p = lock_user_string(arg0);
-            q = lock_user_string(arg2);
-            if (!p || !q) {
-                result = -1;
-                errno = EFAULT;
-            } else {
-                result = rename(p, q);
-            }
-            unlock_user(p, arg0, 0);
-            unlock_user(q, arg2, 0);
-        }
+        semihost_sys_rename(cs, nios2_semi_u32_cb, arg0, arg1, arg2, arg3);
         break;
+
     case HOSTED_UNLINK:
         GET_ARG(0);
         GET_ARG(1);
-        if (use_gdb_syscalls()) {
-            gdb_do_syscall(nios2_semi_u32_cb, "unlink,%s",
-                           arg0, (int)arg1);
-            return;
-        } else {
-            p = lock_user_string(arg0);
-            if (!p) {
-                result = -1;
-                errno = EFAULT;
-            } else {
-                result = unlink(p);
-                unlock_user(p, arg0, 0);
-            }
-        }
+        semihost_sys_remove(cs, nios2_semi_u32_cb, arg0, arg1);
         break;
+
     case HOSTED_STAT:
         GET_ARG(0);
         GET_ARG(1);
         GET_ARG(2);
-        if (use_gdb_syscalls()) {
-            gdb_do_syscall(nios2_semi_u32_cb, "stat,%s,%x",
-                           arg0, (int)arg1, arg2);
-            return;
-        } else {
-            struct stat s;
-            p = lock_user_string(arg0);
-            if (!p) {
-                result = -1;
-                errno = EFAULT;
-            } else {
-                result = stat(p, &s);
-                unlock_user(p, arg0, 0);
-            }
-            if (result == 0 && !translate_stat(env, arg2, &s)) {
-                result = -1;
-                errno = EFAULT;
-            }
-        }
+        semihost_sys_stat(cs, nios2_semi_u32_cb, arg0, arg1, arg2);
         break;
+
     case HOSTED_FSTAT:
         GET_ARG(0);
         GET_ARG(1);
-        if (use_gdb_syscalls()) {
-            gdb_do_syscall(nios2_semi_u32_cb, "fstat,%x,%x",
-                           arg0, arg1);
-            return;
-        } else {
-            struct stat s;
-            result = fstat(arg0, &s);
-            if (result == 0 && !translate_stat(env, arg1, &s)) {
-                result = -1;
-                errno = EFAULT;
-            }
-        }
+        semihost_sys_fstat(cs, nios2_semi_u32_cb, arg0, arg1);
         break;
+
     case HOSTED_GETTIMEOFDAY:
-        /* Only the tv parameter is used.  tz is assumed NULL.  */
         GET_ARG(0);
-        if (use_gdb_syscalls()) {
-            gdb_do_syscall(nios2_semi_u32_cb, "gettimeofday,%x,%x",
-                           arg0, 0);
-            return;
-        } else {
-            struct gdb_timeval *p;
-            int64_t rt = g_get_real_time();
-            p = lock_user(VERIFY_WRITE, arg0, sizeof(struct gdb_timeval), 0);
-            if (!p) {
-                result = -1;
-                errno = EFAULT;
-            } else {
-                result = 0;
-                p->tv_sec = cpu_to_be32(rt / G_USEC_PER_SEC);
-                p->tv_usec = cpu_to_be64(rt % G_USEC_PER_SEC);
-                unlock_user(p, arg0, sizeof(struct gdb_timeval));
-            }
-        }
+        GET_ARG(1);
+        semihost_sys_gettimeofday(cs, nios2_semi_u32_cb, arg0, arg1);
         break;
+
     case HOSTED_ISATTY:
         GET_ARG(0);
-        if (use_gdb_syscalls()) {
-            gdb_do_syscall(nios2_semi_u32_cb, "isatty,%x", arg0);
-            return;
-        } else {
-            result = isatty(arg0);
-        }
+        semihost_sys_isatty(cs, nios2_semi_u32_cb, arg0);
         break;
+
     case HOSTED_SYSTEM:
         GET_ARG(0);
         GET_ARG(1);
-        if (use_gdb_syscalls()) {
-            gdb_do_syscall(nios2_semi_u32_cb, "system,%s",
-                           arg0, (int)arg1);
-            return;
-        } else {
-            p = lock_user_string(arg0);
-            if (!p) {
-                result = -1;
-                errno = EFAULT;
-            } else {
-                result = system(p);
-                unlock_user(p, arg0, 0);
-            }
-        }
+        semihost_sys_system(cs, nios2_semi_u32_cb, arg0, arg1);
         break;
+
     default:
         qemu_log_mask(LOG_GUEST_ERROR, "nios2-semihosting: unsupported "
                       "semihosting syscall %d\n", nr);
-        result = 0;
+        nios2_semi_u32_cb(cs, -1, ENOSYS);
+        break;
+
+    failed:
+        nios2_semi_u32_cb(cs, -1, EFAULT);
+        break;
     }
-failed:
-    nios2_semi_u32_cb(cs, result, errno);
 }
-- 
2.34.1


