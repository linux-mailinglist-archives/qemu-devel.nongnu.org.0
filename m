Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 844E0515DE8
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 15:53:50 +0200 (CEST)
Received: from localhost ([::1]:46784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nknXh-0006uh-HM
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 09:53:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAg-0004u5-G1
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:30:02 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:44545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAe-0006IA-E6
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:30:02 -0400
Received: by mail-pl1-x62e.google.com with SMTP id j8so9281569pll.11
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 06:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=daJgBRI1f4WcTuGoTO5bJfZcH8leBw7G8vdt6nAxSJg=;
 b=LrdmpaK2moDb/Z866j92nppfoDe+v9CCgXynFMAZ7/MAADx7F0jVlsWqntDnos2Aj2
 Qgf2LSvPrhg4T8V3D1eBuEi8YMC+/CViOBdxJezFoT+3CemKvf8miZQv0a25fC+iTdVO
 yMg7bgaTKqZMk/JaqdcXp20W9YM8T3FjUD1CGGRKfvsFcYmbjU9TFhDINThi3YlLstAj
 e8GXGjKXAM326mznikmdF3U3Bv2Bqlgxlulj0otg0ZLp/7fKhixCJCjX4XPrRGyt4/XT
 QN+n/7mNunzlyWh5ogPRoHJSUhdgkjF5uwHQI31v1jIhsbSMnAjnk0XzSVhupXyBZ8P/
 KVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=daJgBRI1f4WcTuGoTO5bJfZcH8leBw7G8vdt6nAxSJg=;
 b=w2uiNxHLpDOgsHbjsODwADZkkNjVRAAvVt1zyuP2HbfyXXWUJr1CLMWgyORpF82O0i
 5YWAGH5Vme1JA7HsW/NSUvYCDuVYw9o+FcBT6xIfXWMQ2LGS4KJlFj/5p/9apfQsZrv1
 Q71i4FyPY+C34GgBx3PuNyUzn4eJaK2+R++ggZFzl0U7oClDLlzkPU8e0v3xvaM/SdBs
 ZoCWy1YWgHvy2i4YjMtr2l7tzFmF5cYWQNPaGCn6q3dtffXlNpxPtbyPUR3RIUelYg9n
 bzN7dBkiSw3xi9F/VgqcZ9f9Ql5oW0BPZdKL6UZVDqWJOfh+LoG8NrcYGuUEV9wUb6C2
 r4zw==
X-Gm-Message-State: AOAM530ZAE/9TOtldCM6JkU4qzCt/pggv6lKNMG1RpK74A6HH16ckpAT
 6UNh8Ur6MYITTwqLByHeW6j3mzleJlwtBg==
X-Google-Smtp-Source: ABdhPJwI6nqLJqsuL4uA+s+x2Sii3goSwz1bK7Bv5nEGHsoVGp30cgMGHZPZXqpcjFyaRYvzb//Zsg==
X-Received: by 2002:a17:903:300b:b0:15c:b49b:6647 with SMTP id
 o11-20020a170903300b00b0015cb49b6647mr3749724pla.90.1651325399154; 
 Sat, 30 Apr 2022 06:29:59 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 x5-20020aa793a5000000b0050dc7628201sm1522606pff.219.2022.04.30.06.29.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:29:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 25/43] semihosting: Split out semihost_sys_lseek
Date: Sat, 30 Apr 2022 06:29:14 -0700
Message-Id: <20220430132932.324018-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430132932.324018-1-richard.henderson@linaro.org>
References: <20220430132932.324018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: crwulff@gmail.com, alex.bennee@linaro.org, f4bug@amsat.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split out the non-ARM specific portions of SYS_SEEK to a
reusable function.  This handles all GuestFD.  Isolate the
curious ARM-specific return value processing to a new
callback, common_semi_seek_cb.

Expand the internal type of the offset to int64_t, and
provide the whence argument, which will be required by m68k
and nios2 semihosting.

Note that gdb_do_syscall %x reads target_ulong, not int.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/gdbstub.h        |  5 +++
 include/semihosting/guestfd.h |  3 ++
 semihosting/arm-compat-semi.c | 51 ++++++----------------
 semihosting/guestfd.c         | 81 +++++++++++++++++++++++++++++++++++
 4 files changed, 102 insertions(+), 38 deletions(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 33a262a5a3..a7d3bfd5d4 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -20,6 +20,11 @@
 #define GDB_O_TRUNC   0x400
 #define GDB_O_EXCL    0x800
 
+/* For gdb file i/o remote protocol lseek whence. */
+#define GDB_SEEK_SET  0
+#define GDB_SEEK_CUR  1
+#define GDB_SEEK_END  2
+
 /* For gdb file i/o stat/fstat. */
 typedef uint32_t gdb_mode_t;
 typedef uint32_t gdb_time_t;
diff --git a/include/semihosting/guestfd.h b/include/semihosting/guestfd.h
index 5780ea2f13..9c6967ac53 100644
--- a/include/semihosting/guestfd.h
+++ b/include/semihosting/guestfd.h
@@ -62,4 +62,7 @@ void semihost_sys_read(CPUState *cs, gdb_syscall_complete_cb complete,
 void semihost_sys_write(CPUState *cs, gdb_syscall_complete_cb complete,
                         int fd, target_ulong buf, target_ulong len);
 
+void semihost_sys_lseek(CPUState *cs, gdb_syscall_complete_cb complete,
+                        int fd, int64_t off, int gdb_whence);
+
 #endif /* SEMIHOSTING_GUESTFD_H */
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 6568d205eb..0cab721a50 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -225,16 +225,6 @@ static void common_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
 #else
         syscall_err = err;
 #endif
-    } else {
-        /* Fixup syscalls that use nonstardard return conventions.  */
-        target_ulong reg0 = common_semi_arg(cs, 0);
-        switch (reg0) {
-        case TARGET_SYS_SEEK:
-            ret = 0;
-            break;
-        default:
-            break;
-        }
     }
     common_semi_set_ret(cs, ret);
 }
@@ -257,6 +247,18 @@ static void common_semi_rw_cb(CPUState *cs, target_ulong ret, target_ulong err)
     common_semi_set_ret(cs, arg2 - ret);
 }
 
+/*
+ * SYS_SEEK returns 0 on success, not the resulting offset.
+ */
+static void common_semi_seek_cb(CPUState *cs, target_ulong ret,
+                                target_ulong err)
+{
+    if (!err) {
+        ret = 0;
+    }
+    common_semi_cb(cs, ret, err);
+}
+
 /*
  * Return an address in target memory of 64 bytes where the remote
  * gdb should write its stat struct. (The format of this structure
@@ -289,7 +291,6 @@ common_semi_flen_cb(CPUState *cs, target_ulong ret, target_ulong err)
  * via common_semi_cb.
  */
 typedef void sys_isattyfn(CPUState *cs, GuestFD *gf);
-typedef void sys_seekfn(CPUState *cs, GuestFD *gf, target_ulong offset);
 typedef void sys_flenfn(CPUState *cs, GuestFD *gf);
 
 static void host_isattyfn(CPUState *cs, GuestFD *gf)
@@ -297,12 +298,6 @@ static void host_isattyfn(CPUState *cs, GuestFD *gf)
     common_semi_cb(cs, isatty(gf->hostfd), 0);
 }
 
-static void host_seekfn(CPUState *cs, GuestFD *gf, target_ulong offset)
-{
-    off_t ret = lseek(gf->hostfd, offset, SEEK_SET);
-    common_semi_cb(cs, ret, ret == -1 ? errno : 0);
-}
-
 static void host_flenfn(CPUState *cs, GuestFD *gf)
 {
     struct stat buf;
@@ -319,11 +314,6 @@ static void gdb_isattyfn(CPUState *cs, GuestFD *gf)
     gdb_do_syscall(common_semi_cb, "isatty,%x", gf->hostfd);
 }
 
-static void gdb_seekfn(CPUState *cs, GuestFD *gf, target_ulong offset)
-{
-    gdb_do_syscall(common_semi_cb, "lseek,%x,%x,0", gf->hostfd, offset);
-}
-
 static void gdb_flenfn(CPUState *cs, GuestFD *gf)
 {
     gdb_do_syscall(common_semi_flen_cb, "fstat,%x,%x",
@@ -352,12 +342,6 @@ static void staticfile_isattyfn(CPUState *cs, GuestFD *gf)
     common_semi_cb(cs, 0, 0);
 }
 
-static void staticfile_seekfn(CPUState *cs, GuestFD *gf, target_ulong offset)
-{
-    gf->staticfile.off = offset;
-    common_semi_cb(cs, 0, 0);
-}
-
 static void staticfile_flenfn(CPUState *cs, GuestFD *gf)
 {
     common_semi_cb(cs, gf->staticfile.len, 0);
@@ -365,24 +349,20 @@ static void staticfile_flenfn(CPUState *cs, GuestFD *gf)
 
 typedef struct GuestFDFunctions {
     sys_isattyfn *isattyfn;
-    sys_seekfn *seekfn;
     sys_flenfn *flenfn;
 } GuestFDFunctions;
 
 static const GuestFDFunctions guestfd_fns[] = {
     [GuestFDHost] = {
         .isattyfn = host_isattyfn,
-        .seekfn = host_seekfn,
         .flenfn = host_flenfn,
     },
     [GuestFDGDB] = {
         .isattyfn = gdb_isattyfn,
-        .seekfn = gdb_seekfn,
         .flenfn = gdb_flenfn,
     },
     [GuestFDStatic] = {
         .isattyfn = staticfile_isattyfn,
-        .seekfn = staticfile_seekfn,
         .flenfn = staticfile_flenfn,
     },
 };
@@ -518,12 +498,7 @@ void do_common_semihosting(CPUState *cs)
     case TARGET_SYS_SEEK:
         GET_ARG(0);
         GET_ARG(1);
-
-        gf = get_guestfd(arg0);
-        if (!gf) {
-            goto do_badf;
-        }
-        guestfd_fns[gf->type].seekfn(cs, gf, arg1);
+        semihost_sys_lseek(cs, common_semi_seek_cb, arg0, arg1, GDB_SEEK_SET);
         break;
 
     case TARGET_SYS_FLEN:
diff --git a/semihosting/guestfd.c b/semihosting/guestfd.c
index 356b87453c..e33d226534 100644
--- a/semihosting/guestfd.c
+++ b/semihosting/guestfd.c
@@ -442,3 +442,84 @@ void semihost_sys_write(CPUState *cs, gdb_syscall_complete_cb complete,
         g_assert_not_reached();
     }
 }
+
+static void gdb_lseek(CPUState *cs, gdb_syscall_complete_cb complete,
+                      GuestFD *gf, int64_t off, int gdb_whence)
+{
+    gdb_do_syscall(complete, "lseek,%x,%lx,%x",
+                   (target_ulong)gf->hostfd, off, (target_ulong)gdb_whence);
+}
+
+static void host_lseek(CPUState *cs, gdb_syscall_complete_cb complete,
+                       GuestFD *gf, int64_t off, int whence)
+{
+    /* So far, all hosts use the same values. */
+    QEMU_BUILD_BUG_ON(GDB_SEEK_SET != SEEK_SET);
+    QEMU_BUILD_BUG_ON(GDB_SEEK_CUR != SEEK_CUR);
+    QEMU_BUILD_BUG_ON(GDB_SEEK_END != SEEK_END);
+
+    off_t ret = off;
+    int err = 0;
+
+    if (ret == off) {
+        ret = lseek(gf->hostfd, ret, whence);
+        if (ret == -1) {
+            err = errno;
+        }
+    } else {
+        ret = -1;
+        err = EOVERFLOW;
+    }
+    complete(cs, ret, err);
+}
+
+static void staticfile_lseek(CPUState *cs, gdb_syscall_complete_cb complete,
+                             GuestFD *gf, int64_t off, int gdb_whence)
+{
+    int64_t ret;
+
+    switch (gdb_whence) {
+    case GDB_SEEK_SET:
+        ret = off;
+        break;
+    case GDB_SEEK_CUR:
+        ret = gf->staticfile.off + off;
+        break;
+    case GDB_SEEK_END:
+        ret = gf->staticfile.len - off;
+        break;
+    default:
+        ret = -1;
+        break;
+    }
+    if (ret >= 0 && ret <= gf->staticfile.len) {
+        gf->staticfile.off = ret;
+        complete(cs, ret, 0);
+    } else {
+        complete(cs, -1, EINVAL);
+    }
+}
+
+void semihost_sys_lseek(CPUState *cs, gdb_syscall_complete_cb complete,
+                        int fd, int64_t off, int gdb_whence)
+{
+    GuestFD *gf = get_guestfd(fd);
+
+    if (!gf) {
+        complete(cs, -1, EBADF);
+        return;
+    }
+    switch (gf->type) {
+    case GuestFDGDB:
+        gdb_lseek(cs, complete, gf, off, gdb_whence);
+        return;
+    case GuestFDHost:
+        host_lseek(cs, complete, gf, off, gdb_whence);
+        break;
+    case GuestFDStatic:
+        staticfile_lseek(cs, complete, gf, off, gdb_whence);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
-- 
2.34.1


