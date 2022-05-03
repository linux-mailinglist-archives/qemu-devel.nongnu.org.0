Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 925DD518ED8
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:31:19 +0200 (CEST)
Received: from localhost ([::1]:46322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlzB0-0002QY-7B
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:31:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyWT-0002Gf-02
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:28 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:46900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyWL-0003bp-B9
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:21 -0400
Received: by mail-pl1-x635.google.com with SMTP id c11so5631334plg.13
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=KiiUe/Rg+SRimDwSRl33F/1OAQaMEIf9kHTB68MrbY4=;
 b=MjQ2wVLQ9s6Co3NFp6uie1QJUG+KJJV/evpWGGRrBDBFqJPp5X6V7wy4VgQca7OQ9w
 pRScgA9Iway+7Y2O12i3JARa4XTY1OmgghOY2/KSHrSaqadZz1zn7xfbhEOEn710ut9S
 JbDBOV3+eE8+GIW/H6ZmIukqHFsRTxrIm6a0IgkTS4W0YLPpX/O8Q6+3rSUj7Tgr1zmm
 YwTZimqY3AYL/D2gmUYaf7jJf1akwPVmm4p8qwGyTeI01+DyNzIDgI5OCnb9Saw3esZS
 g+BnFTVwy4FRZPmxSGH3idRiYwQMVsm4+Eh/QObYJ1hUdmY7DPShwz6ThSuWGzGzNyJG
 UUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KiiUe/Rg+SRimDwSRl33F/1OAQaMEIf9kHTB68MrbY4=;
 b=Vnb4CvmkkZJASsN+17kKfKwh93tC4tcb4MJ/CecD0mW+WI8tC99NhcYziYfs8kfyLz
 9ahkgIGH1HFtxgHpPi3yt9y+2yQ81O/5hrPzk+5NRw20xuAcjnVrH/I4a95HZ13ELzVf
 GUFnrzqNHL1aLgbfbOuxJOJg/Sp9mA58mxSjwL6yXhb2mf3htsIYtCevFNlBNovsHUDy
 g4slIiWRysBL9PiGiohvY4+s9GLxnOXfFBcwZ7kZEbjyakxHSJyZW7DyIFEirVU0uipw
 dWaHkAayMsUJ1k08hC2gaUrSLUw2FP2SFiZNWyg/TkvWcH1kDn6OYi2dh/QJIjSdUKu8
 1cAw==
X-Gm-Message-State: AOAM530ZITOJYzGcbOGEPYoaCpet6jDU6HXfmK+t8LrKRr9KTRpKnDib
 hUZCsj+p+ejCxvB4EuF1PIWL/0rRxnd8Iw==
X-Google-Smtp-Source: ABdhPJxjD1pbGOcWCTWyo3Ap3hI9FTQuzVsxpVJEpm0brSWlPS+Lcs2AeWACYW3dc2JWBs2N7HJUOQ==
X-Received: by 2002:a17:90a:f3c7:b0:1d9:6832:7be0 with SMTP id
 ha7-20020a17090af3c700b001d968327be0mr6423474pjb.209.1651607353736; 
 Tue, 03 May 2022 12:49:13 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 p11-20020a17090ad30b00b001cd4989fed3sm1712383pju.31.2022.05.03.12.49.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:49:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 28/74] semihosting: Split out semihost_sys_flen
Date: Tue,  3 May 2022 12:47:57 -0700
Message-Id: <20220503194843.1379101-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
 semihosting/arm-compat-semi.c  | 83 ++++++++--------------------------
 semihosting/syscalls.c         | 49 ++++++++++++++++++++
 4 files changed, 73 insertions(+), 64 deletions(-)

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
index 8fcef02386..ad43bc8b0d 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -273,41 +273,25 @@ static target_ulong common_semi_flen_buf(CPUState *cs)
 }
 
 static void
-common_semi_flen_cb(CPUState *cs, target_ulong ret, target_ulong err)
+common_semi_flen_fstat_cb(CPUState *cs, target_ulong ret, target_ulong err)
 {
-    /* The size is always stored in big-endian order, extract the value. */
-    uint64_t size;
-    cpu_memory_rw_debug(cs, common_semi_flen_buf(cs) +
-                        offsetof(struct gdb_stat, gdb_st_size),
-                        &size, 8, 0);
-    size = be64_to_cpu(size);
-    common_semi_cb(cs, -1, err);
-    common_semi_set_ret(cs, size);
-}
-
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
+    if (!err) {
+        /* The size is always stored in big-endian order, extract the value. */
+        CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
+        uint64_t size;
+        if (get_user_u64(size, common_semi_flen_buf(cs) +
+                         offsetof(struct gdb_stat, gdb_st_size))) {
+            ret = -1, err = GDB_EFAULT;
+        } else {
+            /* Undo the tswap from get_user_u64, then swap from BE. */
+            size = be64_to_cpu(tswap64(size));
+            ret = size;
+            if (ret != size) {
+                ret = -1, err = GDB_EOVERFLOW;
+            }
+        }
     }
-}
-
-static void gdb_flenfn(CPUState *cs, GuestFD *gf)
-{
-    gdb_do_syscall(common_semi_flen_cb, "fstat,%x,%x",
-                   gf->hostfd, common_semi_flen_buf(cs));
+    common_semi_cb(cs, ret, err);
 }
 
 #define SHFB_MAGIC_0 0x53
@@ -327,27 +311,6 @@ static const uint8_t featurefile_data[] = {
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
@@ -366,7 +329,6 @@ void do_common_semihosting(CPUState *cs)
     char * s;
     int nr;
     uint32_t ret;
-    GuestFD *gf;
     int64_t elapsed;
 
     nr = common_semi_arg(cs, 0) & 0xffffffffU;
@@ -479,12 +441,8 @@ void do_common_semihosting(CPUState *cs)
 
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
@@ -806,9 +764,6 @@ void do_common_semihosting(CPUState *cs)
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


