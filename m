Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 619A455BEDA
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 08:44:31 +0200 (CEST)
Received: from localhost ([::1]:44494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o64xa-0001gk-Dr
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 02:44:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63G7-0003bG-Nn
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:55:33 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:51862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63G5-0000Dc-Po
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:55:31 -0400
Received: by mail-pj1-x1029.google.com with SMTP id l2so10250429pjf.1
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=10Sm3AeWIBieyWVHcZYCqLqccWMHZXhdScLSkrcOWBg=;
 b=fFt/E0Z0g283YMBON7DbCxqJ8v1rcOW8l+QOvGs7Chp6cQeJe9f8wOS5d9Y2Ssv7/0
 dTIVbfUAe+pFxJhJuIJCyyzPUQwDC/zxJQNlq0VYJAk4lnWRni+uYQZdLHU7VtpPZl3i
 Y/C4YtMCpEHrByBzTWeYgjcsBUPvqCnSdPtoCfYogy8zObWPkHP+cTJ742dcxgA78L1h
 fjiKV1ym7UfZHsS67PWs2PScjEmwTjb/frWeQvI8sialWURR5Ta1sJzoea+BcYJUALmX
 2bHJhPk15iqHORP0TpOwynxgvos3M5qjbCbcJg2ca6av3FogQEUP/UDlVoZ2l96ZHe17
 DHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=10Sm3AeWIBieyWVHcZYCqLqccWMHZXhdScLSkrcOWBg=;
 b=BTW5cCzEoDurhYGLmZ7R2o8l5MizezraWJ0fBc73HwBCnJ+gXIWzx+5ol1FY+GJ3TC
 wjcHjxOQu2FYodgeb6/ZcLJzoFAZ98sgCOfoMQ10gm6XU1TyzsrZVEEhZF/XNQA1iEra
 faGDu+iW7bX9+2EqtPIkt/0+hITMfJPVrH0iYe2+1A1szm7sTTGqRszK0KkxoZj4yEWg
 nKSUloKT70KQMeianxByhGTzpj12ilTZe25gmugHUd0R4G++tCk7h3f6tdb6P91Ic42t
 sCdVQPYQpQio1O65IIwgYb+BmwX4Aa9r9VgUbuoBQ2aDIyFb9DTCSwYEeD1zXiX/7+mT
 N67w==
X-Gm-Message-State: AJIora+1Hu99RWeWJ7EManeALy3rB1QvGAm6Z5KRLpant3kzX5gveKOd
 py6C82rEZJWULCFo+krqc3B/1VhaxWkn5w==
X-Google-Smtp-Source: AGRyM1tGb8wrWc2zdyFhDCsglGQcu0xojliu3YsRwZM1B9OwT1gCRBb9pVbjAfu5YjB4D+raGAS/0Q==
X-Received: by 2002:a17:903:11c9:b0:16b:8293:c5a1 with SMTP id
 q9-20020a17090311c900b0016b8293c5a1mr1808341plh.72.1656392125013; 
 Mon, 27 Jun 2022 21:55:25 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 w8-20020a1709026f0800b00168c523032fsm8073735plk.269.2022.06.27.21.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:55:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Luc Michel <lmichel@kalray.eu>
Subject: [PULL 32/60] semihosting: Split out semihost_sys_lseek
Date: Tue, 28 Jun 2022 10:23:35 +0530
Message-Id: <20220628045403.508716-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

Split out the non-ARM specific portions of SYS_SEEK to a
reusable function.  This handles all GuestFD.  Isolate the
curious ARM-specific return value processing to a new
callback, common_semi_seek_cb.

Expand the internal type of the offset to int64_t, and
provide the whence argument, which will be required by
m68k and nios2 semihosting.

Note that gdb_do_syscall %x reads target_ulong, not int.

Reviewed-by: Luc Michel <lmichel@kalray.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/gdbstub.h         |  5 +++
 include/semihosting/syscalls.h |  3 ++
 semihosting/arm-compat-semi.c  | 51 ++++++---------------
 semihosting/syscalls.c         | 81 ++++++++++++++++++++++++++++++++++
 4 files changed, 102 insertions(+), 38 deletions(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 95a8b7b056..b588c306cc 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -41,6 +41,11 @@
 #define GDB_ENAMETOOLONG   91
 #define GDB_EUNKNOWN       9999
 
+/* For gdb file i/o remote protocol lseek whence. */
+#define GDB_SEEK_SET  0
+#define GDB_SEEK_CUR  1
+#define GDB_SEEK_END  2
+
 /* For gdb file i/o stat/fstat. */
 typedef uint32_t gdb_mode_t;
 typedef uint32_t gdb_time_t;
diff --git a/include/semihosting/syscalls.h b/include/semihosting/syscalls.h
index 2464467579..841a93d25b 100644
--- a/include/semihosting/syscalls.h
+++ b/include/semihosting/syscalls.h
@@ -39,4 +39,7 @@ void semihost_sys_write(CPUState *cs, gdb_syscall_complete_cb complete,
 void semihost_sys_write_gf(CPUState *cs, gdb_syscall_complete_cb complete,
                            GuestFD *gf, target_ulong buf, target_ulong len);
 
+void semihost_sys_lseek(CPUState *cs, gdb_syscall_complete_cb complete,
+                        int fd, int64_t off, int gdb_whence);
+
 #endif /* SEMIHOSTING_SYSCALLS_H */
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index d591fcd7c2..a117d180bc 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -224,16 +224,6 @@ static void common_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
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
@@ -290,7 +292,6 @@ common_semi_flen_cb(CPUState *cs, target_ulong ret, target_ulong err)
  * via common_semi_cb.
  */
 typedef void sys_isattyfn(CPUState *cs, GuestFD *gf);
-typedef void sys_seekfn(CPUState *cs, GuestFD *gf, target_ulong offset);
 typedef void sys_flenfn(CPUState *cs, GuestFD *gf);
 
 static void host_isattyfn(CPUState *cs, GuestFD *gf)
@@ -298,12 +299,6 @@ static void host_isattyfn(CPUState *cs, GuestFD *gf)
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
@@ -320,11 +315,6 @@ static void gdb_isattyfn(CPUState *cs, GuestFD *gf)
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
@@ -353,12 +343,6 @@ static void staticfile_isattyfn(CPUState *cs, GuestFD *gf)
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
@@ -366,24 +350,20 @@ static void staticfile_flenfn(CPUState *cs, GuestFD *gf)
 
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
@@ -520,12 +500,7 @@ void do_common_semihosting(CPUState *cs)
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
diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index eefbae74f1..9e3eb464b5 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -114,6 +114,13 @@ static void gdb_write(CPUState *cs, gdb_syscall_complete_cb complete,
                    (target_ulong)gf->hostfd, buf, len);
 }
 
+static void gdb_lseek(CPUState *cs, gdb_syscall_complete_cb complete,
+                      GuestFD *gf, int64_t off, int gdb_whence)
+{
+    gdb_do_syscall(complete, "lseek,%x,%lx,%x",
+                   (target_ulong)gf->hostfd, off, (target_ulong)gdb_whence);
+}
+
 /*
  * Host semihosting syscall implementations.
  */
@@ -216,6 +223,29 @@ static void host_write(CPUState *cs, gdb_syscall_complete_cb complete,
     unlock_user(ptr, buf, 0);
 }
 
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
+        err = EINVAL;
+    }
+    complete(cs, ret, err);
+}
+
 /*
  * Static file semihosting syscall implementations.
  */
@@ -241,6 +271,33 @@ static void staticfile_read(CPUState *cs, gdb_syscall_complete_cb complete,
     unlock_user(ptr, buf, len);
 }
 
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
+        ret = gf->staticfile.len + off;
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
 /*
  * Syscall entry points.
  */
@@ -356,3 +413,27 @@ void semihost_sys_write(CPUState *cs, gdb_syscall_complete_cb complete,
         complete(cs, -1, EBADF);
     }
 }
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


