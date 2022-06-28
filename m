Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F3355C08F
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 13:06:35 +0200 (CEST)
Received: from localhost ([::1]:48086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o693C-0000Ky-F9
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 07:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o68xq-0002mO-3y
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:01:09 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:37487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o68xn-0007kJ-U8
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:01:01 -0400
Received: by mail-pf1-x430.google.com with SMTP id bo5so11688295pfb.4
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 04:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sHuZfnOrU5/BvSYjrL7jZ7YROY8Ri6t33K4cwNt6kfo=;
 b=T0AP3ZxApODNPNJh/yX+qy3Dj1efqq9VJg0JsrMsNSiop8EgdFbxJitiyVWropcVzm
 hYyrxrG3n3XXocTKvA1stUrSor3CoPb7mZMO+0KP1ER0JBAet2el0GrFptMAODKQocYh
 6is9F4plfMz3tl4A6IGFDW2R6vNq2574XTSaDXteHaQKSu5+BP+FD1db23edybEHr3vT
 YsrzBP+r3Ezr2x79nh80hxL51q/BwTtdp091huFpfxJXz95GSAZARA0kceXUEPC6u98x
 3rWOXRR8TygTJ8lbZjj/LTfazdp+kwLCWyqN1hszUGukuUdNYYd6R93vT7gbk0fxpNs0
 z+gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sHuZfnOrU5/BvSYjrL7jZ7YROY8Ri6t33K4cwNt6kfo=;
 b=HwJ0dPeh3JMvYkVHd+2fQlAIj1VkhFz8ipLuDH/Jew3IrlIqEsB6Xki7G9SuSTvheB
 lGAP8XvM9RFZYne6nSqF1ZaLnAy07r/Kl0nVvSHwN2UP1FfmvJ1s6mB2Rc3ER+qPYCqJ
 yvc3/7BjN3ZagyzRLQbREInKbLt2HzRkxoqciwMXOGIH+RBoQAaqH2CKIC1H38wZ/IrC
 s3ySvBvpNZx2mdAW7diT7DN7Q/qzlePobWm7jfIC7KLC6ZUyfhGSj0PGlXhdRoPnfKEH
 Ipcy/+63tq4H55CTIeubtjKrv4obyMG6wnU1g1/b9iAQhNKWf0TD4504VuuXGOtHwHha
 zXqg==
X-Gm-Message-State: AJIora/AmZ6ZgPgkr/xJh00H9Uk7rn+r8fuUeHGCgZRWBUjMQTQwpZkh
 pzRcTFoX/HsyPGYOnVp9m8u1WeBdlYYGKg==
X-Google-Smtp-Source: AGRyM1vyfGaYbV54HgP25StBOC9sTWqiVlRfBEtsDt0SOVLkcny+nvYBGRNYKqz0m/QW6bSinJuEzA==
X-Received: by 2002:aa7:8f01:0:b0:525:2428:1157 with SMTP id
 x1-20020aa78f01000000b0052524281157mr3140216pfr.41.1656414056634; 
 Tue, 28 Jun 2022 04:00:56 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 p22-20020a1709027ed600b0016a0fe1a1fbsm9044501plb.220.2022.06.28.04.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 04:00:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v5 1/2] target/m68k: Use semihosting/syscalls.h
Date: Tue, 28 Jun 2022 16:30:46 +0530
Message-Id: <20220628110047.666612-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628110047.666612-1-richard.henderson@linaro.org>
References: <20220628110047.666612-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
 target/m68k/m68k-semi.c | 281 +++++++---------------------------------
 1 file changed, 49 insertions(+), 232 deletions(-)

diff --git a/target/m68k/m68k-semi.c b/target/m68k/m68k-semi.c
index d0697ddbd1..586a801034 100644
--- a/target/m68k/m68k-semi.c
+++ b/target/m68k/m68k-semi.c
@@ -21,6 +21,7 @@
 
 #include "cpu.h"
 #include "exec/gdbstub.h"
+#include "semihosting/syscalls.h"
 #include "semihosting/softmmu-uaccess.h"
 #include "hw/boards.h"
 #include "qemu/log.h"
@@ -40,56 +41,6 @@
 #define HOSTED_ISATTY 12
 #define HOSTED_SYSTEM 13
 
-static int translate_openflags(int flags)
-{
-    int hf;
-
-    if (flags & GDB_O_WRONLY)
-        hf = O_WRONLY;
-    else if (flags & GDB_O_RDWR)
-        hf = O_RDWR;
-    else
-        hf = O_RDONLY;
-
-    if (flags & GDB_O_APPEND) hf |= O_APPEND;
-    if (flags & GDB_O_CREAT) hf |= O_CREAT;
-    if (flags & GDB_O_TRUNC) hf |= O_TRUNC;
-    if (flags & GDB_O_EXCL) hf |= O_EXCL;
-
-    return hf;
-}
-
-static void translate_stat(CPUM68KState *env, target_ulong addr, struct stat *s)
-{
-    struct gdb_stat *p;
-
-    p = lock_user(VERIFY_WRITE, addr, sizeof(struct gdb_stat), 0);
-    if (!p) {
-        /* FIXME - should this return an error code? */
-        return;
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
-}
-
 static void m68k_semi_u32_cb(CPUState *cs, uint64_t ret, int err)
 {
     M68kCPU *cpu = M68K_CPU(cs);
@@ -129,248 +80,109 @@ static void m68k_semi_u64_cb(CPUState *cs, uint64_t ret, int err)
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
+
 void do_m68k_semihosting(CPUM68KState *env, int nr)
 {
     CPUState *cs = env_cpu(env);
     uint32_t args;
     target_ulong arg0, arg1, arg2, arg3;
-    void *p;
-    void *q;
-    uint32_t len;
-    uint32_t result;
 
     args = env->dregs[1];
     switch (nr) {
     case HOSTED_EXIT:
         gdb_exit(env->dregs[0]);
         exit(env->dregs[0]);
+
     case HOSTED_OPEN:
         GET_ARG(0);
         GET_ARG(1);
         GET_ARG(2);
         GET_ARG(3);
-        if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_u32_cb, "open,%s,%x,%x", arg0, (int)arg1,
-                           arg2, arg3);
-            return;
-        } else {
-            p = lock_user_string(arg0);
-            if (!p) {
-                /* FIXME - check error code? */
-                result = -1;
-            } else {
-                result = open(p, translate_openflags(arg2), arg3);
-                unlock_user(p, arg0, 0);
-            }
-        }
+        semihost_sys_open(cs, m68k_semi_u32_cb, arg0, arg1, arg2, arg3);
         break;
+
     case HOSTED_CLOSE:
-        {
-            /* Ignore attempts to close stdin/out/err.  */
-            GET_ARG(0);
-            int fd = arg0;
-            if (fd > 2) {
-                if (use_gdb_syscalls()) {
-                    gdb_do_syscall(m68k_semi_u32_cb, "close,%x", arg0);
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
+        semihost_sys_close(cs, m68k_semi_u32_cb, arg0);
+        break;
+
     case HOSTED_READ:
         GET_ARG(0);
         GET_ARG(1);
         GET_ARG(2);
-        len = arg2;
-        if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_u32_cb, "read,%x,%x,%x",
-                           arg0, arg1, len);
-            return;
-        } else {
-            p = lock_user(VERIFY_WRITE, arg1, len, 0);
-            if (!p) {
-                /* FIXME - check error code? */
-                result = -1;
-            } else {
-                result = read(arg0, p, len);
-                unlock_user(p, arg1, len);
-            }
-        }
+        semihost_sys_read(cs, m68k_semi_u32_cb, arg0, arg1, arg2);
         break;
+
     case HOSTED_WRITE:
         GET_ARG(0);
         GET_ARG(1);
         GET_ARG(2);
-        len = arg2;
-        if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_u32_cb, "write,%x,%x,%x",
-                           arg0, arg1, len);
-            return;
-        } else {
-            p = lock_user(VERIFY_READ, arg1, len, 1);
-            if (!p) {
-                /* FIXME - check error code? */
-                result = -1;
-            } else {
-                result = write(arg0, p, len);
-                unlock_user(p, arg0, 0);
-            }
-        }
+        semihost_sys_write(cs, m68k_semi_u32_cb, arg0, arg1, arg2);
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
-                gdb_do_syscall(m68k_semi_u64_cb, "fseek,%x,%lx,%x",
-                               arg0, off, arg3);
-            } else {
-                off = lseek(arg0, off, arg3);
-                m68k_semi_u64_cb(cs, off, errno);
-            }
-            return;
-        }
+        GET_ARG64(0);
+        GET_ARG64(1);
+        GET_ARG64(2);
+        GET_ARG64(3);
+        semihost_sys_lseek(cs, m68k_semi_u64_cb, arg0,
+                           deposit64(arg2, arg1, 32, 32), arg3);
+        break;
+
     case HOSTED_RENAME:
         GET_ARG(0);
         GET_ARG(1);
         GET_ARG(2);
         GET_ARG(3);
-        if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_u32_cb, "rename,%s,%s",
-                           arg0, (int)arg1, arg2, (int)arg3);
-            return;
-        } else {
-            p = lock_user_string(arg0);
-            q = lock_user_string(arg2);
-            if (!p || !q) {
-                /* FIXME - check error code? */
-                result = -1;
-            } else {
-                result = rename(p, q);
-            }
-            unlock_user(p, arg0, 0);
-            unlock_user(q, arg2, 0);
-        }
+        semihost_sys_rename(cs, m68k_semi_u32_cb, arg0, arg1, arg2, arg3);
         break;
+
     case HOSTED_UNLINK:
         GET_ARG(0);
         GET_ARG(1);
-        if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_u32_cb, "unlink,%s",
-                           arg0, (int)arg1);
-            return;
-        } else {
-            p = lock_user_string(arg0);
-            if (!p) {
-                /* FIXME - check error code? */
-                result = -1;
-            } else {
-                result = unlink(p);
-                unlock_user(p, arg0, 0);
-            }
-        }
+        semihost_sys_remove(cs, m68k_semi_u32_cb, arg0, arg1);
         break;
+
     case HOSTED_STAT:
         GET_ARG(0);
         GET_ARG(1);
         GET_ARG(2);
-        if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_u32_cb, "stat,%s,%x",
-                           arg0, (int)arg1, arg2);
-            return;
-        } else {
-            struct stat s;
-            p = lock_user_string(arg0);
-            if (!p) {
-                /* FIXME - check error code? */
-                result = -1;
-            } else {
-                result = stat(p, &s);
-                unlock_user(p, arg0, 0);
-            }
-            if (result == 0) {
-                translate_stat(env, arg2, &s);
-            }
-        }
+        semihost_sys_stat(cs, m68k_semi_u32_cb, arg0, arg1, arg2);
         break;
+
     case HOSTED_FSTAT:
         GET_ARG(0);
         GET_ARG(1);
-        if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_u32_cb, "fstat,%x,%x",
-                           arg0, arg1);
-            return;
-        } else {
-            struct stat s;
-            result = fstat(arg0, &s);
-            if (result == 0) {
-                translate_stat(env, arg1, &s);
-            }
-        }
+        semihost_sys_fstat(cs, m68k_semi_u32_cb, arg0, arg1);
         break;
+
     case HOSTED_GETTIMEOFDAY:
         GET_ARG(0);
         GET_ARG(1);
-        if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_u32_cb, "gettimeofday,%x,%x",
-                           arg0, arg1);
-            return;
-        } else {
-            struct gdb_timeval *p;
-            int64_t rt = g_get_real_time();
-            p = lock_user(VERIFY_WRITE, arg0, sizeof(struct gdb_timeval), 0);
-            if (!p) {
-                /* FIXME - check error code? */
-                result = -1;
-            } else {
-                result = 0;
-                p->tv_sec = cpu_to_be32(rt / G_USEC_PER_SEC);
-                p->tv_usec = cpu_to_be64(rt % G_USEC_PER_SEC);
-                unlock_user(p, arg0, sizeof(struct gdb_timeval));
-            }
-        }
+        semihost_sys_gettimeofday(cs, m68k_semi_u32_cb, arg0, arg1);
         break;
+
     case HOSTED_ISATTY:
         GET_ARG(0);
-        if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_u32_cb, "isatty,%x", arg0);
-            return;
-        } else {
-            result = isatty(arg0);
-        }
+        semihost_sys_isatty(cs, m68k_semi_u32_cb, arg0);
         break;
+
     case HOSTED_SYSTEM:
         GET_ARG(0);
         GET_ARG(1);
-        if (use_gdb_syscalls()) {
-            gdb_do_syscall(m68k_semi_u32_cb, "system,%s",
-                           arg0, (int)arg1);
-            return;
-        } else {
-            p = lock_user_string(arg0);
-            if (!p) {
-                /* FIXME - check error code? */
-                result = -1;
-            } else {
-                result = system(p);
-                unlock_user(p, arg0, 0);
-            }
-        }
+        semihost_sys_system(cs, m68k_semi_u32_cb, arg0, arg1);
         break;
+
     case HOSTED_INIT_SIM:
         /*
          * FIXME: This is wrong for boards where RAM does not start at
@@ -379,10 +191,15 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
         env->dregs[1] = current_machine->ram_size;
         env->aregs[7] = current_machine->ram_size;
         return;
+
     default:
         cpu_abort(env_cpu(env), "Unsupported semihosting syscall %d\n", nr);
-        result = 0;
+
+    failed:
+        m68k_semi_u32_cb(cs, -1, EFAULT);
+        break;
+    failed64:
+        m68k_semi_u64_cb(cs, -1, EFAULT);
+        break;
     }
-failed:
-    m68k_semi_u32_cb(cs, result, errno);
 }
-- 
2.34.1


