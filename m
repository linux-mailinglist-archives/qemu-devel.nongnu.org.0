Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B62B57283E
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 23:06:46 +0200 (CEST)
Received: from localhost ([::1]:60268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBN5h-00051G-F8
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 17:06:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMtt-00066g-3H
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:54:33 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:40874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMtp-0007Fc-AN
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:54:32 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 o19-20020a05600c511300b003a2de48b4bbso82474wms.5
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 13:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W+mE8FJOfqJaEWdE8/Viw//HmXoDfyVVL8rYwJv5DUM=;
 b=QOtcMkbbjbBCWX8wQERERh0PdhE/rWLjqvm+NVxTVi2kbS7mN8ttZfOERLzISi8OiS
 4qgzIUKGqdxXqwTrF8uwuqfcgxk8wOe9W8R6AqawJEcAPpfM/VRxl0irCvcKbwNLEvPi
 2T5qAI93tM8jIzBB6DjnDv3FswzsmJ1pAg+Y/u5hnA9VlHlNWJ6IlEaFuJclzzyDZbhM
 ENSk8bG1HL9DywL2HBqXFYda7wOrpFsRmGTS9wSiOUFItB+0f9vxjz5oONTNlvs7EF4S
 d3JupEPvXI2TagQeo/OnzVzeoQVKxtLLc5Pau8McsapqssZ1LoUUIGQS7O+RqF02EDjO
 sX1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=W+mE8FJOfqJaEWdE8/Viw//HmXoDfyVVL8rYwJv5DUM=;
 b=aGB9RtDTkBBMPUyPpy0CHCSucXSlYwsmn+ip6d6NlPGoX5qNvCk4+1G3yYC/I5WamR
 7dQMIwHCgJI1evKrjjjr2JnuEp1k4V2EAw/VBvwcYwSbF2KJbk0vrZK2BLmKWN/fO4wF
 TN75OPgjPTBE1aqncWIUiMeUq0mK0oD1CvRMyWHbtwwOMRF8Aji1nBBaFjjzhZtVHt6Z
 z/n4O81PdeCXMEeT/Tuj90KUca58YzPD5QzUdCxwgNVhsqVbuqKgcADfy5sVv3kmdv5r
 dI4OMku/vSzOOZTudH6cEUtqg4DEDfHjFERdDjhTj515PlFFgluowiLI8s+uucN3NxnG
 XweA==
X-Gm-Message-State: AJIora9sAhkdbHawpyREEgEdDem6FaCsIgDqzTzuotRfOkX/SGO26W5A
 DrAQbGWhRg3HvWvPcZuLbfB7ikA9avwIpRsK
X-Google-Smtp-Source: AGRyM1sCOw5H9TpAvfp5T2ZERX1mrv46JY60axyD7WW4hvaP/6HphF19kCLCziwn+u5MPH54VD6MYA==
X-Received: by 2002:a05:600c:4ba9:b0:3a2:daf6:44f6 with SMTP id
 e41-20020a05600c4ba900b003a2daf644f6mr5957529wmp.52.1657659267607; 
 Tue, 12 Jul 2022 13:54:27 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o38-20020a05600c512600b0039c5642e430sm63121wms.20.2022.07.12.13.54.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Jul 2022 13:54:27 -0700 (PDT)
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 07/12] target/mips: Use semihosting/syscalls.h
Date: Tue, 12 Jul 2022 22:53:42 +0200
Message-Id: <20220712205347.58372-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712205347.58372-1-f4bug@amsat.org>
References: <20220712205347.58372-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

This separates guest file descriptors from host file descriptors,
and utilizes shared infrastructure for integration with gdbstub.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220628111701.677216-4-richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/sysemu/mips-semi.c | 219 +++++++++++++----------------
 1 file changed, 95 insertions(+), 124 deletions(-)

diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
index 93c9d3d0b3..5b78cf21a7 100644
--- a/target/mips/tcg/sysemu/mips-semi.c
+++ b/target/mips/tcg/sysemu/mips-semi.c
@@ -20,9 +20,11 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "qemu/log.h"
+#include "exec/gdbstub.h"
 #include "semihosting/softmmu-uaccess.h"
 #include "semihosting/semihost.h"
 #include "semihosting/console.h"
+#include "semihosting/syscalls.h"
 #include "internal.h"
 
 typedef enum UHIOp {
@@ -121,101 +123,79 @@ static void report_fault(CPUMIPSState *env)
     abort();
 }
 
-static int errno_mips(int host_errno)
+static void uhi_cb(CPUState *cs, uint64_t ret, int err)
 {
-    /* Errno values taken from asm-mips/errno.h */
-    switch (host_errno) {
-    case 0:             return 0;
-    case ENAMETOOLONG:  return 78;
-#ifdef EOVERFLOW
-    case EOVERFLOW:     return 79;
-#endif
-#ifdef ELOOP
-    case ELOOP:         return 90;
-#endif
-    default:            return EINVAL;
-    }
-}
+    CPUMIPSState *env = cs->env_ptr;
 
-static int copy_stat_to_target(CPUMIPSState *env, const struct stat *src,
-                               target_ulong vaddr)
-{
-    hwaddr len = sizeof(struct UHIStat);
-    UHIStat *dst = lock_user(VERIFY_WRITE, vaddr, len, 0);
-    if (!dst) {
+#define E(N) case E##N: err = UHI_E##N; break
+
+    switch (err) {
+    case 0:
+        break;
+    E(PERM);
+    E(NOENT);
+    E(INTR);
+    E(BADF);
+    E(BUSY);
+    E(EXIST);
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
+        err = UHI_EINVAL;
+        break;
+    case EFAULT:
         report_fault(env);
     }
 
-    dst->uhi_st_dev = tswap16(src->st_dev);
-    dst->uhi_st_ino = tswap16(src->st_ino);
-    dst->uhi_st_mode = tswap32(src->st_mode);
-    dst->uhi_st_nlink = tswap16(src->st_nlink);
-    dst->uhi_st_uid = tswap16(src->st_uid);
-    dst->uhi_st_gid = tswap16(src->st_gid);
-    dst->uhi_st_rdev = tswap16(src->st_rdev);
-    dst->uhi_st_size = tswap64(src->st_size);
-    dst->uhi_st_atime = tswap64(src->st_atime);
-    dst->uhi_st_mtime = tswap64(src->st_mtime);
-    dst->uhi_st_ctime = tswap64(src->st_ctime);
-#ifdef _WIN32
-    dst->uhi_st_blksize = 0;
-    dst->uhi_st_blocks = 0;
-#else
-    dst->uhi_st_blksize = tswap64(src->st_blksize);
-    dst->uhi_st_blocks = tswap64(src->st_blocks);
-#endif
-    unlock_user(dst, vaddr, len);
-    return 0;
+#undef E
+
+    env->active_tc.gpr[2] = ret;
+    env->active_tc.gpr[3] = err;
 }
 
-static int get_open_flags(target_ulong target_flags)
+static void uhi_fstat_cb(CPUState *cs, uint64_t ret, int err)
 {
-    int open_flags = 0;
+    QEMU_BUILD_BUG_ON(sizeof(UHIStat) < sizeof(struct gdb_stat));
 
-    if (target_flags & UHIOpen_RDWR) {
-        open_flags |= O_RDWR;
-    } else if (target_flags & UHIOpen_WRONLY) {
-        open_flags |= O_WRONLY;
-    } else {
-        open_flags |= O_RDONLY;
+    if (!err) {
+        CPUMIPSState *env = cs->env_ptr;
+        target_ulong addr = env->active_tc.gpr[5];
+        UHIStat *dst = lock_user(VERIFY_WRITE, addr, sizeof(UHIStat), 1);
+        struct gdb_stat s;
+
+        if (!dst) {
+            report_fault(env);
+        }
+
+        memcpy(&s, dst, sizeof(struct gdb_stat));
+        memset(dst, 0, sizeof(UHIStat));
+
+        dst->uhi_st_dev = tswap16(be32_to_cpu(s.gdb_st_dev));
+        dst->uhi_st_ino = tswap16(be32_to_cpu(s.gdb_st_ino));
+        dst->uhi_st_mode = tswap32(be32_to_cpu(s.gdb_st_mode));
+        dst->uhi_st_nlink = tswap16(be32_to_cpu(s.gdb_st_nlink));
+        dst->uhi_st_uid = tswap16(be32_to_cpu(s.gdb_st_uid));
+        dst->uhi_st_gid = tswap16(be32_to_cpu(s.gdb_st_gid));
+        dst->uhi_st_rdev = tswap16(be32_to_cpu(s.gdb_st_rdev));
+        dst->uhi_st_size = tswap64(be64_to_cpu(s.gdb_st_size));
+        dst->uhi_st_atime = tswap64(be32_to_cpu(s.gdb_st_atime));
+        dst->uhi_st_mtime = tswap64(be32_to_cpu(s.gdb_st_mtime));
+        dst->uhi_st_ctime = tswap64(be32_to_cpu(s.gdb_st_ctime));
+        dst->uhi_st_blksize = tswap64(be64_to_cpu(s.gdb_st_blksize));
+        dst->uhi_st_blocks = tswap64(be64_to_cpu(s.gdb_st_blocks));
+
+        unlock_user(dst, addr, sizeof(UHIStat));
     }
 
-    open_flags |= (target_flags & UHIOpen_APPEND) ? O_APPEND : 0;
-    open_flags |= (target_flags & UHIOpen_CREAT)  ? O_CREAT  : 0;
-    open_flags |= (target_flags & UHIOpen_TRUNC)  ? O_TRUNC  : 0;
-    open_flags |= (target_flags & UHIOpen_EXCL)   ? O_EXCL   : 0;
-
-    return open_flags;
-}
-
-static int write_to_file(CPUMIPSState *env, target_ulong fd,
-                         target_ulong vaddr, target_ulong len)
-{
-    int num_of_bytes;
-    void *dst = lock_user(VERIFY_READ, vaddr, len, 1);
-    if (!dst) {
-        report_fault(env);
-    }
-
-    num_of_bytes = write(fd, dst, len);
-
-    unlock_user(dst, vaddr, 0);
-    return num_of_bytes;
-}
-
-static int read_from_file(CPUMIPSState *env, target_ulong fd,
-                          target_ulong vaddr, target_ulong len)
-{
-    int num_of_bytes;
-    void *dst = lock_user(VERIFY_WRITE, vaddr, len, 0);
-    if (!dst) {
-        report_fault(env);
-    }
-
-    num_of_bytes = read(fd, dst, len);
-
-    unlock_user(dst, vaddr, len);
-    return num_of_bytes;
+    uhi_cb(cs, ret, err);
 }
 
 static int copy_argn_to_target(CPUMIPSState *env, int arg_num,
@@ -260,68 +240,59 @@ static int copy_argn_to_target(CPUMIPSState *env, int arg_num,
 
 void mips_semihosting(CPUMIPSState *env)
 {
+    CPUState *cs = env_cpu(env);
     target_ulong *gpr = env->active_tc.gpr;
     const UHIOp op = gpr[25];
     char *p, *p2;
 
     switch (op) {
     case UHI_exit:
-        qemu_log("UHI(%d): exit(%d)\n", op, (int)gpr[4]);
+        gdb_exit(gpr[4]);
         exit(gpr[4]);
+
     case UHI_open:
-        GET_TARGET_STRING(p, gpr[4]);
-        if (!strcmp("/dev/stdin", p)) {
-            gpr[2] = 0;
-        } else if (!strcmp("/dev/stdout", p)) {
-            gpr[2] = 1;
-        } else if (!strcmp("/dev/stderr", p)) {
-            gpr[2] = 2;
-        } else {
-            gpr[2] = open(p, get_open_flags(gpr[5]), gpr[6]);
-            gpr[3] = errno_mips(errno);
+        {
+            int ret = -1;
+
+            GET_TARGET_STRING(p, gpr[4]);
+            if (!strcmp("/dev/stdin", p)) {
+                ret = 0;
+            } else if (!strcmp("/dev/stdout", p)) {
+                ret = 1;
+            } else if (!strcmp("/dev/stderr", p)) {
+                ret = 2;
+            }
+            FREE_TARGET_STRING(p, gpr[4]);
+
+            /* FIXME: reusing a guest fd doesn't seem correct. */
+            if (ret >= 0) {
+                gpr[2] = ret;
+                break;
+            }
+
+            semihost_sys_open(cs, uhi_cb, gpr[4], 0, gpr[5], gpr[6]);
         }
-        FREE_TARGET_STRING(p, gpr[4]);
         break;
+
     case UHI_close:
-        if (gpr[4] < 3) {
-            /* ignore closing stdin/stdout/stderr */
-            gpr[2] = 0;
-            return;
-        }
-        gpr[2] = close(gpr[4]);
-        gpr[3] = errno_mips(errno);
+        semihost_sys_close(cs, uhi_cb, gpr[4]);
         break;
     case UHI_read:
-        gpr[2] = read_from_file(env, gpr[4], gpr[5], gpr[6]);
-        gpr[3] = errno_mips(errno);
+        semihost_sys_read(cs, uhi_cb, gpr[4], gpr[5], gpr[6]);
         break;
     case UHI_write:
-        gpr[2] = write_to_file(env, gpr[4], gpr[5], gpr[6]);
-        gpr[3] = errno_mips(errno);
+        semihost_sys_write(cs, uhi_cb, gpr[4], gpr[5], gpr[6]);
         break;
     case UHI_lseek:
-        gpr[2] = lseek(gpr[4], gpr[5], gpr[6]);
-        gpr[3] = errno_mips(errno);
+        semihost_sys_lseek(cs, uhi_cb, gpr[4], gpr[5], gpr[6]);
         break;
     case UHI_unlink:
-        GET_TARGET_STRING(p, gpr[4]);
-        gpr[2] = remove(p);
-        gpr[3] = errno_mips(errno);
-        FREE_TARGET_STRING(p, gpr[4]);
+        semihost_sys_remove(cs, uhi_cb, gpr[4], 0);
         break;
     case UHI_fstat:
-        {
-            struct stat sbuf;
-            memset(&sbuf, 0, sizeof(sbuf));
-            gpr[2] = fstat(gpr[4], &sbuf);
-            gpr[3] = errno_mips(errno);
-            if (gpr[2]) {
-                return;
-            }
-            gpr[2] = copy_stat_to_target(env, &sbuf, gpr[5]);
-            gpr[3] = errno_mips(errno);
-        }
+        semihost_sys_fstat(cs, uhi_fstat_cb, gpr[4], gpr[5]);
         break;
+
     case UHI_argc:
         gpr[2] = semihosting_get_argc();
         break;
-- 
2.36.1


