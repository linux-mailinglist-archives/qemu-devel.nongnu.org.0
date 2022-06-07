Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34254541F5F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 01:19:41 +0200 (CEST)
Received: from localhost ([::1]:50214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyiU8-0000ya-85
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 19:19:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyhef-0005jW-VE
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 18:26:29 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:33614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyheY-0007vw-CT
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 18:26:29 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 hv24-20020a17090ae41800b001e33eebdb5dso14757240pjb.0
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 15:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lbUVCZIzmf7Ku+4VUqNMsbqIl/D3k7AtZw52ek+GaWg=;
 b=wZCmSXnVq4u0FWkaGhVpAJId0UX8bqcEPUCPpx18VSa2b5qGjsWc7i5cRtDmko/wYH
 8wUOMpseXTSvP+GlUsf5sMExuLecf21GcNwbBfF17KTdDMPLBc7FkoUfsdy3njJdxL2B
 LcinDGYtS9tULTp7e66Iqxk2ceCAm6c8jnb1G99fUUOfiEmDSE4Rvn7/eqssBZy1rSzD
 tHNf3w3RJz/NQhu9hgI5I3IsqL2QTcXoqcWMJHOdwuvq8ce46mpy8HB0vsjfTaIbjB3N
 0qehOz7KHuCf1YvSyd2PHTVJjgkHYD3cVh0TIyjHTvlWMikorKKN1RU0GBVNuYezE3M5
 30GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lbUVCZIzmf7Ku+4VUqNMsbqIl/D3k7AtZw52ek+GaWg=;
 b=OB08Xa5j+C3Zz7NfnuINtDMtaITkyEjG8a6UdVeChH8ZfaIbgpDSHLcIWaAz2f0Sj6
 RtqhQSDLFLzPMFhyBk0LMKazuBR8Ezh8ALDy3N59nu9qBVNaPfp2cFZd7o6dpcF0SaPL
 hTq5IEETjlovr3doBD3HMFhJbAb0jhg4y2Fi7zUN5rGlJywk4HEHEQS+vVyEP2oTPHVy
 rKmpmZqJXK68rAwgCxD/1penznp+JUsYmLmr0tv3BHZjgV5BfeyaV/E+O94R+OcZxKTd
 t8d7e5rBvrRpdCgQDn9sPMHl9QXQOlX/R1GWTlvmiReSRn634tL/ztStRwGxoFfQ2SoO
 cAng==
X-Gm-Message-State: AOAM531EnfYtc1EfoiZoK2XMqOrV7hY8k0Lb5sbHtKjSgi5UQ0nJ0z2x
 1O+xHpnttZpujDxRpIohP/aw5fU7l4yxZg==
X-Google-Smtp-Source: ABdhPJxCR2yfmIQ04Hy34DAUQkyfeAZ2Bo7jVqZ5AsayLZMlIy9HLMk1Ms+yn3AXdG3XNTj56g9bnQ==
X-Received: by 2002:a17:90a:a614:b0:1df:8aec:cc71 with SMTP id
 c20-20020a17090aa61400b001df8aeccc71mr34027645pjq.82.1654640780991; 
 Tue, 07 Jun 2022 15:26:20 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 e19-20020a17090ae4d300b001e2fade86c1sm15112133pju.2.2022.06.07.15.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 15:26:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v4 3/3] target/m68k: Use semihosting/syscalls.h
Date: Tue,  7 Jun 2022 15:26:16 -0700
Message-Id: <20220607222616.717435-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607222616.717435-1-richard.henderson@linaro.org>
References: <20220607222616.717435-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
 target/m68k/m68k-semi.c | 306 ++++++++++------------------------------
 1 file changed, 76 insertions(+), 230 deletions(-)

diff --git a/target/m68k/m68k-semi.c b/target/m68k/m68k-semi.c
index d0697ddbd1..87b1314925 100644
--- a/target/m68k/m68k-semi.c
+++ b/target/m68k/m68k-semi.c
@@ -21,6 +21,7 @@
 
 #include "cpu.h"
 #include "exec/gdbstub.h"
+#include "semihosting/syscalls.h"
 #include "semihosting/softmmu-uaccess.h"
 #include "hw/boards.h"
 #include "qemu/log.h"
@@ -40,54 +41,33 @@
 #define HOSTED_ISATTY 12
 #define HOSTED_SYSTEM 13
 
-static int translate_openflags(int flags)
+static int host_to_gdb_errno(int err)
 {
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
+#define E(X)  case E##X: return GDB_E##X
+    switch (err) {
+    E(PERM);
+    E(NOENT);
+    E(INTR);
+    E(BADF);
+    E(ACCES);
+    E(FAULT);
+    E(BUSY);
+    E(EXIST);
+    E(NODEV);
+    E(NOTDIR);
+    E(ISDIR);
+    E(INVAL);
+    E(NFILE);
+    E(MFILE);
+    E(FBIG);
+    E(NOSPC);
+    E(SPIPE);
+    E(ROFS);
+    E(NAMETOOLONG);
+    default:
+        return GDB_EUNKNOWN;
     }
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
+#undef E
 }
 
 static void m68k_semi_u32_cb(CPUState *cs, uint64_t ret, int err)
@@ -97,7 +77,7 @@ static void m68k_semi_u32_cb(CPUState *cs, uint64_t ret, int err)
 
     target_ulong args = env->dregs[1];
     if (put_user_u32(ret, args) ||
-        put_user_u32(err, args + 4)) {
+        put_user_u32(host_to_gdb_errno(err), args + 4)) {
         /*
          * The m68k semihosting ABI does not provide any way to report this
          * error to the guest, so the best we can do is log it in qemu.
@@ -116,7 +96,7 @@ static void m68k_semi_u64_cb(CPUState *cs, uint64_t ret, int err)
     target_ulong args = env->dregs[1];
     if (put_user_u32(ret >> 32, args) ||
         put_user_u32(ret, args + 4) ||
-        put_user_u32(err, args + 8)) {
+        put_user_u32(host_to_gdb_errno(err), args + 8)) {
         /* No way to report this via m68k semihosting ABI; just log it */
         qemu_log_mask(LOG_GUEST_ERROR, "m68k-semihosting: return value "
                       "discarded because argument block not writable\n");
@@ -129,248 +109,109 @@ static void m68k_semi_u64_cb(CPUState *cs, uint64_t ret, int err)
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
@@ -379,10 +220,15 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
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


