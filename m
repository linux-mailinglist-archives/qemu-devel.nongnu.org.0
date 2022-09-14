Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7735A5B8A37
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 16:21:26 +0200 (CEST)
Received: from localhost ([::1]:60284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYTGX-0005bs-KO
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 10:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYSMH-0007yb-PD
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 09:23:18 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:39581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYSMF-0000ae-4J
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 09:23:17 -0400
Received: by mail-wr1-x42e.google.com with SMTP id cc5so15852355wrb.6
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 06:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=114N/Vlw3BZhk8rKh2FZz62XHFpOWPD/xYj4W6zefEA=;
 b=JAI6LLO9gfSPwV899uaVNQqAjn+qp13msvQgi7uP4XXSl4eEJadnaCz1g1UU2Mv5r8
 IT95ll3eAIq98U+W2pCrXoSJ/94DCJ5DmWuAKVhQCjo7iCflkG1wr0Gf3UMncwhnAYov
 WQHMSPurfEP46KCPYgpgG8ucZpYF6+PPKJ6iqg2sriEod7UxdQTVjrNBCWy9vGFcQSVO
 RpXw33WWmxgJpelDcHIQ4hZhro0ppc9cbkMBb7tQOpwlSd1on3NX8AneVFmiAE6x81CI
 0HsyoR9vzdW6UdyYv0JpWthAqgotkVKzv5WiwMcjHetvHQsFHJ27BAp6ONdB9hubUj/O
 OGFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=114N/Vlw3BZhk8rKh2FZz62XHFpOWPD/xYj4W6zefEA=;
 b=u4aoLM/iqPHwIWD3PiDjhmRu6YNBijhWpb1uwFXqQagfnGXUXTZKMWNN+PN6LO1AwK
 QuGpY/ugU/vja/1Xi3RCrrvds0b0FjlpUqv/+QwgDJeAqa7H6D/KMYu23iUaxHuZBM/P
 kJ6A/9CER0FNfOgaORfUTVt02AYPv/iaaZXs0p0eB35eIthmV3yqOuh0K6JTS+1gtad0
 CWv/rBaRaxbxda2KsrM/gsqY0ENYwJlmplRWts8n0jhk/H6sdj9IDwm7j6+nKlmi6vK1
 9WD8w+8QHf/Im3b9ICDt78oYDT2K0j3+aHdwvVnHHw5q/Qnse9YG+rqNyGDc0UjxJVgt
 quqg==
X-Gm-Message-State: ACgBeo2+em4COY8NqouSAmTX2CsL9IsXY9J1VJuMPVOFZ7ggdqCj1cCs
 4IyBwZfPIchuT/XaY6YKE0Lv/ZTc6ICKPwxZ
X-Google-Smtp-Source: AA6agR7tcWsSwXkomi9XDAM/ej7jDu28w6ghqhj87MTAXnJw/dNBB0Q78MUuKH6bpKvUKB8tAZ+b1Q==
X-Received: by 2002:adf:f2c9:0:b0:228:63f6:73c2 with SMTP id
 d9-20020adff2c9000000b0022863f673c2mr21484366wrp.554.1663161793582; 
 Wed, 14 Sep 2022 06:23:13 -0700 (PDT)
Received: from stoup.. ([89.101.193.70]) by smtp.gmail.com with ESMTPSA id
 p15-20020a5d48cf000000b00226dedf1ab7sm13768244wrs.76.2022.09.14.06.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 06:23:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 03/11] target/m68k: Use semihosting/syscalls.h
Date: Wed, 14 Sep 2022 14:23:00 +0100
Message-Id: <20220914132308.118495-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914132308.118495-1-richard.henderson@linaro.org>
References: <20220914132308.118495-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
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

Acked-by: Laurent Vivier <laurent@vivier.eu>
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


