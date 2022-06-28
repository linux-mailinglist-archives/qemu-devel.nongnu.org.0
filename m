Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B016355C0C6
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 13:43:58 +0200 (CEST)
Received: from localhost ([::1]:46800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o69dN-0007IG-Pb
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 07:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o69Hx-0001mT-12
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:21:51 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:44859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o69Hu-0003o9-Ts
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:21:48 -0400
Received: by mail-pf1-x434.google.com with SMTP id 65so11688303pfw.11
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 04:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BOg1aEu3yBTI9dGIqi4jrE4GeTG3hleBbfwHOhDBa5c=;
 b=yd/+sg00Z9pO3wSzvoXRq7g4dtJFbSbYYiK66sDEpjvzArLYqxO1ABBO29y7LkLKoN
 eXmM38Z1q4YfbtwF+7Huc8lqunMfI1HtkIu2ENg4Zg00qJS3OVcb/yo+JpB/bklb86LL
 pMVXdDGvouLSju99UQUEYkngR6/zqIb+s0ZO0BDIRGB3CCJvSzzOJ9k9aKvk7QoxCOx0
 WyusC/u9MsN8at5kd26m71W5/qVdFsFozezj3uSE5b0GJ5+mPmBVCwA8iQtocx4b1SAt
 SDoQnG02czP7t8ndpEgp5934zfOj6Na231vATroI9JxTFWq9FxN12GD3XGBN5w23fPy+
 19Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BOg1aEu3yBTI9dGIqi4jrE4GeTG3hleBbfwHOhDBa5c=;
 b=oxdFa5mTGNMGodoOsASbOi01OWnJoOyVef7IzX4aXBTUIwJsGZLmVoxSZVBVTBFsNB
 3FFO8e9WLMQEqe3vtpZtsCBNmT7sEU0hBy7shpWuiiUgPKMvLxmMZ6R1vxUVco2xqvXP
 +LhZb+AjZ9HI8RBkCt6T0qlN73omhEE7Fnkr2EV/ANaFIwH1lOLlfklJAgCRaIxbrdCo
 FBEe0cP5uUnC+shbHOIFFvsGPWXPH0n3xRAs+Bbm20EDuIynBWned3UtKqJTlBfGR4gU
 nnUHzau+vgvN/qPsa0jCqrQc8pHnzBO3K87+mVNyCym0Ql9Bzf9+W1u/2p13o7G2vJYk
 ruPg==
X-Gm-Message-State: AJIora/ZaXDJdBNxL3w22iRBeWKM62yX7BeD/r50Ofcy9woyLxXABsfh
 bjKtKn0BvAGXI4pzXgKezt/Q/5bIXW5KWg==
X-Google-Smtp-Source: AGRyM1vozhRQC6JyLdS6X1aXCfuCjcCz7kBH4r/vjcu+JyRDJWEZDDDng9XPJb/j4M71nzdyN4h4ag==
X-Received: by 2002:a63:4913:0:b0:40d:8235:2d1c with SMTP id
 w19-20020a634913000000b0040d82352d1cmr16869689pga.584.1656415304404; 
 Tue, 28 Jun 2022 04:21:44 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 g19-20020a62e313000000b0051ba8b742e4sm9192177pfh.69.2022.06.28.04.21.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 04:21:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org,
	peter.maydell@linaro.org
Subject: [PATCH v5 1/2] target/nios2: Use semihosting/syscalls.h
Date: Tue, 28 Jun 2022 16:51:34 +0530
Message-Id: <20220628112135.685617-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628112135.685617-1-richard.henderson@linaro.org>
References: <20220628112135.685617-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
 target/nios2/nios2-semi.c | 296 +++++++-------------------------------
 1 file changed, 50 insertions(+), 246 deletions(-)

diff --git a/target/nios2/nios2-semi.c b/target/nios2/nios2-semi.c
index 55061bb2dc..614fd76695 100644
--- a/target/nios2/nios2-semi.c
+++ b/target/nios2/nios2-semi.c
@@ -24,6 +24,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/gdbstub.h"
+#include "semihosting/syscalls.h"
 #include "semihosting/softmmu-uaccess.h"
 #include "qemu/log.h"
 
@@ -42,67 +43,6 @@
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
@@ -142,22 +82,22 @@ static void nios2_semi_u64_cb(CPUState *cs, uint64_t ret, int err)
  */
 #define GET_ARG(n) do {                                 \
     if (get_user_ual(arg ## n, args + (n) * 4)) {       \
-        result = -1;                                    \
-        errno = EFAULT;                                 \
         goto failed;                                    \
     }                                                   \
 } while (0)
 
+#define GET_ARG64(n) do {                               \
+    if (get_user_ual(arg ## n, args + (n) * 4)) {       \
+        goto failed64;                                  \
+    }                                                   \
+} while (0)
+
 void do_nios2_semihosting(CPUNios2State *env)
 {
     CPUState *cs = env_cpu(env);
     int nr;
     uint32_t args;
     target_ulong arg0, arg1, arg2, arg3;
-    void *p;
-    void *q;
-    uint32_t len;
-    uint32_t result;
 
     nr = env->regs[R_ARG0];
     args = env->regs[R_ARG1];
@@ -165,234 +105,98 @@ void do_nios2_semihosting(CPUNios2State *env)
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
+        GET_ARG64(0);
+        GET_ARG64(1);
+        GET_ARG64(2);
+        GET_ARG64(3);
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
+    failed64:
+        nios2_semi_u64_cb(cs, -1, EFAULT);
+        break;
     }
-failed:
-    nios2_semi_u32_cb(cs, result, errno);
 }
-- 
2.34.1


