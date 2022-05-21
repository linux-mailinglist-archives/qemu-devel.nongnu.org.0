Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF1052F72E
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 02:58:29 +0200 (CEST)
Received: from localhost ([::1]:41108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsDRs-0002c2-VZ
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 20:58:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCc6-0008CC-Bi
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:05:00 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:34072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbl-000429-CX
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:49 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 ob14-20020a17090b390e00b001dff2a43f8cso2445022pjb.1
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 17:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TzUwl9qms3llKSXLrofbP99q2dV9evxhKXHM3ias5fg=;
 b=xLTKpjl7z/VKNrW0RL+BeVNnK5pkLHdeJqH/kBfk7HfpchqFSi2T9JNOfo4PAVWLAD
 SOAuJgmbDOfnzOxKe8EwBk+xBCblscU+EhMJ2wJpaWFaMMl+ATDlZr6u2Gp5FCzWHLrD
 BG0mylVkj7u/FzsnmEBJiPS3yd309wAJYZ6kfDYzPem1ML7+Oye/5zcLLGU+LlLZ0owQ
 5Ph8LezMzLl6pebrsBiW4fHDknAyyRl2mlrTPHDIMI6GwR73ZHu5TnEeDKLYseODChHe
 9vk17KiuV30Iw/awPSUp0WwJZV3cB6OGJvFjARNelJWqNSnmGBtmxeZxtPc6YVuhVfT7
 +Tmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TzUwl9qms3llKSXLrofbP99q2dV9evxhKXHM3ias5fg=;
 b=AGTrbNslOPCf9oUMQ+RmkhZNwgvWBCT2jSeT2GPj3DZ7m2SSqIpUPCgX3X0HbeqJhn
 aBoeaQk4TZaQNLwbhGYAdnQNExqdhNK8QhbNiUfhbuOxWG4B63iTi2DRIbl3T35RHdia
 NfODtM1Y4GMeeRj4TYupFfGreofsrxpIYudIgGDsKDMrErkg9ODbfHaaJS9AU2POxhpg
 wnfskLzgROGJMkjUYVrN6Z/9gd5S4HpsaVPLPfQCJuADjGsBiCPy9rLREVzFOZDdDou4
 oR7oSmtI6jETtNS5UeZRTONuOvK8pfd2qaKzeFScfbQ+US+lf+aAK+zOEvWKgWn0AlI8
 HRUg==
X-Gm-Message-State: AOAM533aTYwGEgJYNcS52qyDwU0dxLmBCFFAZJPrJ1iAaqhNt+elUpMJ
 VJ+mpqHY+HUgggJmgZCa2Md3N6jnG9sZ6g==
X-Google-Smtp-Source: ABdhPJxO/URDVxpNwLK4jHiF7pAcTt7O1Qek7WLUCWoF8njnI875kjKHk5FOaqGWnS05YbJAL1Tc2A==
X-Received: by 2002:a17:90b:3708:b0:1df:56ac:65c6 with SMTP id
 mg8-20020a17090b370800b001df56ac65c6mr14315066pjb.23.1653091476005; 
 Fri, 20 May 2022 17:04:36 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 h8-20020a654808000000b003f9d1c020cbsm306369pgs.51.2022.05.20.17.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 17:04:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 30/49] semihosting: Split out semihost_sys_flen
Date: Fri, 20 May 2022 17:03:41 -0700
Message-Id: <20220521000400.454525-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521000400.454525-1-richard.henderson@linaro.org>
References: <20220521000400.454525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

The ARM-specific SYS_FLEN isn't really something that can be
reused by other semihosting apis, but there are parts that can
reused for the implementation of semihost_sys_fstat.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/gdbstub.h         |  1 +
 include/semihosting/syscalls.h |  4 ++
 semihosting/arm-compat-semi.c  | 74 ++++++----------------------------
 semihosting/syscalls.c         | 49 ++++++++++++++++++++++
 4 files changed, 67 insertions(+), 61 deletions(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index fd4bc4e937..8e9cdcb1c1 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -42,6 +42,7 @@
 #define GDB_ENAMETOOLONG   91
 #define GDB_EUNKNOWN       9999
 #define GDB_ENOTTY         GDB_EUNKNOWN
+#define GDB_EOVERFLOW      GDB_EUNKNOWN
 
 /* For gdb file i/o remote protocol lseek whence. */
 #define GDB_SEEK_SET  0
diff --git a/include/semihosting/syscalls.h b/include/semihosting/syscalls.h
index c60ebafb85..1ae5ba6716 100644
--- a/include/semihosting/syscalls.h
+++ b/include/semihosting/syscalls.h
@@ -45,4 +45,8 @@ void semihost_sys_lseek(CPUState *cs, gdb_syscall_complete_cb complete,
 void semihost_sys_isatty(CPUState *cs, gdb_syscall_complete_cb complete,
                          int fd);
 
+void semihost_sys_flen(CPUState *cs, gdb_syscall_complete_cb fstat_cb,
+                       gdb_syscall_complete_cb flen_cb,
+                       int fd, target_ulong fstat_addr);
+
 #endif /* SEMIHOSTING_SYSCALLS_H */
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 973b0a68ab..5dd8c800cc 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -272,44 +272,25 @@ static target_ulong common_semi_flen_buf(CPUState *cs)
 }
 
 static void
-common_semi_flen_cb(CPUState *cs, target_ulong ret, target_ulong err)
+common_semi_flen_fstat_cb(CPUState *cs, target_ulong ret, target_ulong err)
 {
     if (!err) {
         /* The size is always stored in big-endian order, extract the value. */
         uint64_t size;
-        cpu_memory_rw_debug(cs, common_semi_flen_buf(cs) +
-                            offsetof(struct gdb_stat, gdb_st_size),
-                            &size, 8, 0);
-        ret = be64_to_cpu(size);
+        if (cpu_memory_rw_debug(cs, common_semi_flen_buf(cs) +
+                                offsetof(struct gdb_stat, gdb_st_size),
+                                &size, 8, 0)) {
+            ret = -1, err = GDB_EFAULT;
+        } else {
+            size = be64_to_cpu(size);
+            if (ret != size) {
+                ret = -1, err = GDB_EOVERFLOW;
+            }
+        }
     }
     common_semi_cb(cs, ret, err);
 }
 
-/*
- * Types for functions implementing various semihosting calls
- * for specific types of guest file descriptor. These must all
- * do the work and return the required return value to the guest
- * via common_semi_cb.
- */
-typedef void sys_flenfn(CPUState *cs, GuestFD *gf);
-
-static void host_flenfn(CPUState *cs, GuestFD *gf)
-{
-    struct stat buf;
-
-    if (fstat(gf->hostfd, &buf)) {
-        common_semi_cb(cs, -1, errno);
-    } else {
-        common_semi_cb(cs, buf.st_size, 0);
-    }
-}
-
-static void gdb_flenfn(CPUState *cs, GuestFD *gf)
-{
-    gdb_do_syscall(common_semi_flen_cb, "fstat,%x,%x",
-                   gf->hostfd, common_semi_flen_buf(cs));
-}
-
 #define SHFB_MAGIC_0 0x53
 #define SHFB_MAGIC_1 0x48
 #define SHFB_MAGIC_2 0x46
@@ -327,27 +308,6 @@ static const uint8_t featurefile_data[] = {
     SH_EXT_EXIT_EXTENDED | SH_EXT_STDOUT_STDERR, /* Feature byte 0 */
 };
 
-static void staticfile_flenfn(CPUState *cs, GuestFD *gf)
-{
-    common_semi_cb(cs, gf->staticfile.len, 0);
-}
-
-typedef struct GuestFDFunctions {
-    sys_flenfn *flenfn;
-} GuestFDFunctions;
-
-static const GuestFDFunctions guestfd_fns[] = {
-    [GuestFDHost] = {
-        .flenfn = host_flenfn,
-    },
-    [GuestFDGDB] = {
-        .flenfn = gdb_flenfn,
-    },
-    [GuestFDStatic] = {
-        .flenfn = staticfile_flenfn,
-    },
-};
-
 /*
  * Do a semihosting call.
  *
@@ -366,7 +326,6 @@ void do_common_semihosting(CPUState *cs)
     char * s;
     int nr;
     uint32_t ret;
-    GuestFD *gf;
     int64_t elapsed;
 
     nr = common_semi_arg(cs, 0) & 0xffffffffU;
@@ -479,12 +438,8 @@ void do_common_semihosting(CPUState *cs)
 
     case TARGET_SYS_FLEN:
         GET_ARG(0);
-
-        gf = get_guestfd(arg0);
-        if (!gf) {
-            goto do_badf;
-        }
-        guestfd_fns[gf->type].flenfn(cs, gf);
+        semihost_sys_flen(cs, common_semi_flen_fstat_cb, common_semi_cb,
+                          arg0, common_semi_flen_buf(cs));
         break;
 
     case TARGET_SYS_TMPNAM:
@@ -806,9 +761,6 @@ void do_common_semihosting(CPUState *cs)
         cpu_dump_state(cs, stderr, 0);
         abort();
 
-    do_badf:
-        common_semi_cb(cs, -1, EBADF);
-        break;
     do_fault:
         common_semi_cb(cs, -1, EFAULT);
         break;
diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index 702541b270..1425156bf6 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -157,6 +157,12 @@ static void gdb_isatty(CPUState *cs, gdb_syscall_complete_cb complete,
     gdb_do_syscall(complete, "isatty,%x", (target_ulong)gf->hostfd);
 }
 
+static void gdb_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
+                      GuestFD *gf, target_ulong addr)
+{
+    gdb_do_syscall(complete, "fstat,%x,%x", (target_ulong)gf->hostfd, addr);
+}
+
 /*
  * Host semihosting syscall implementations.
  */
@@ -289,6 +295,18 @@ static void host_isatty(CPUState *cs, gdb_syscall_complete_cb complete,
     complete(cs, ret, ret ? 0 : errno_for_gdb());
 }
 
+static void host_flen(CPUState *cs, gdb_syscall_complete_cb complete,
+                      GuestFD *gf)
+{
+    struct stat buf;
+
+    if (fstat(gf->hostfd, &buf) < 0) {
+        complete(cs, -1, errno_for_gdb());
+    } else {
+        complete(cs, buf.st_size, 0);
+    }
+}
+
 /*
  * Static file semihosting syscall implementations.
  */
@@ -341,6 +359,12 @@ static void staticfile_lseek(CPUState *cs, gdb_syscall_complete_cb complete,
     }
 }
 
+static void staticfile_flen(CPUState *cs, gdb_syscall_complete_cb complete,
+                            GuestFD *gf)
+{
+    complete(cs, gf->staticfile.len, 0);
+}
+
 /*
  * Syscall entry points.
  */
@@ -503,3 +527,28 @@ void semihost_sys_isatty(CPUState *cs, gdb_syscall_complete_cb complete, int fd)
         g_assert_not_reached();
     }
 }
+
+void semihost_sys_flen(CPUState *cs, gdb_syscall_complete_cb fstat_cb,
+                       gdb_syscall_complete_cb flen_cb, int fd,
+                       target_ulong fstat_addr)
+{
+    GuestFD *gf = get_guestfd(fd);
+
+    if (!gf) {
+        flen_cb(cs, -1, GDB_EBADF);
+        return;
+    }
+    switch (gf->type) {
+    case GuestFDGDB:
+        gdb_fstat(cs, fstat_cb, gf, fstat_addr);
+        break;
+    case GuestFDHost:
+        host_flen(cs, flen_cb, gf);
+        break;
+    case GuestFDStatic:
+        staticfile_flen(cs, flen_cb, gf);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
-- 
2.34.1


