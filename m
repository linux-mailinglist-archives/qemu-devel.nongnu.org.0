Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6BB518EB2
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:27:16 +0200 (CEST)
Received: from localhost ([::1]:38678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlz74-0002Gi-Ud
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyWS-0002Ga-0f
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:28 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:34407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyWL-0003bX-Av
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:20 -0400
Received: by mail-pg1-x530.google.com with SMTP id j70so3886772pge.1
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=uAqjsJ8QwShqmS+t+GKK061rZ5AHWSo6sjK9NNVPw50=;
 b=juZGN7mFn3vqsCdraJGpVUUdnc/yY5EMBzJVWcv7QvlxK32oAdcXTSDFgrdzYaGlaO
 WE2m3Kw6dCkfwhdox99EQIcNd7wZfMyD3yUp+7aVckBkmPqceu/hWUlhF220dZMMcN6X
 ChvzDKGYFuR/Xm5BeHFQGZ18l8AEbSDRKyQWu8XsWz5TVSZdofPBPAjCQEMZR7U7xQLH
 jzGkvzXe6BbKA9KO8bVD7T6MLySgXc+/8g0E4EZ0zvzYVfew4jcj0/WwRkJx3IulETcK
 L3QIrxWa/T3Q2RJm/y4VD/rLAcRFgNCM5sAHWRBXseMlEMjLklGjxpXebSjEzY8dOAKj
 NM5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uAqjsJ8QwShqmS+t+GKK061rZ5AHWSo6sjK9NNVPw50=;
 b=4tFZApVgjgher30AdBfE6SUwIAbC3uTffeltN8qMuLrJx/YAZLuJ2FzTaFGpLgeIfg
 O+pXjbtXBDgL+z89pcRVBZzosh+ENQd6SfyJaI4eJAk/SaYUCPGcNLbmfPpM5xvjTeg5
 E4ZSvqwi7mxA/7XtcA0rMNwJaLY7sNBMbJ/eU5AH2sI4vltCJKrb+2BvAufKVMO7OfEa
 Z9XUNEYqANfvdg7AqBjZ8Zu4C1uGR2sNE8A9ZeXc0rlzrrcw3xlRs5931EHeN/7NsVbO
 cnlRRAA08SJN4er8RpkEmcWweA/oTCMOdFr2Hpqy+w36P9Kj391NqOUnEBAeRivK9dXH
 owNA==
X-Gm-Message-State: AOAM530mGsXHSyX3i3XaxfyXflBKy1DYiaaMkL17FFa1q+yqtsaWmNcr
 FEPAbnKGWoOysgvvogBQPHxJ+e53rlTJDg==
X-Google-Smtp-Source: ABdhPJxqZ516478CggpqZJVIMNeSksDvudly9hjonuKAQk2RujmOTrarRNNkX0X532yI3mEFymzi3Q==
X-Received: by 2002:a63:f94d:0:b0:3a9:eea2:9027 with SMTP id
 q13-20020a63f94d000000b003a9eea29027mr14583348pgk.484.1651607351731; 
 Tue, 03 May 2022 12:49:11 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 p11-20020a17090ad30b00b001cd4989fed3sm1712383pju.31.2022.05.03.12.49.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:49:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 26/74] semihosting: Split out semihost_sys_lseek
Date: Tue,  3 May 2022 12:47:55 -0700
Message-Id: <20220503194843.1379101-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/gdbstub.h         |  5 +++
 include/semihosting/syscalls.h |  3 ++
 semihosting/arm-compat-semi.c  | 51 ++++++---------------
 semihosting/syscalls.c         | 81 ++++++++++++++++++++++++++++++++++
 4 files changed, 102 insertions(+), 38 deletions(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 0a6e0d6eeb..056db1a0d0 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -42,6 +42,11 @@
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
index 12b2c2b0f7..6f97977edf 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -226,16 +226,6 @@ static void common_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
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
@@ -258,6 +248,18 @@ static void common_semi_rw_cb(CPUState *cs, target_ulong ret, target_ulong err)
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
@@ -519,12 +499,7 @@ void do_common_semihosting(CPUState *cs)
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
index a5623ebf0f..db8891535b 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -144,6 +144,13 @@ static void gdb_write(CPUState *cs, gdb_syscall_complete_cb complete,
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
@@ -246,6 +253,29 @@ static void host_write(CPUState *cs, gdb_syscall_complete_cb complete,
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
+            err = errno_for_gdb();
+        }
+    } else {
+        ret = -1;
+        err = GDB_EINVAL;
+    }
+    complete(cs, ret, err);
+}
+
 /*
  * Static file semihosting syscall implementations.
  */
@@ -271,6 +301,33 @@ static void staticfile_read(CPUState *cs, gdb_syscall_complete_cb complete,
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
 /*
  * Syscall entry points.
  */
@@ -386,3 +443,27 @@ void semihost_sys_write(CPUState *cs, gdb_syscall_complete_cb complete,
         complete(cs, -1, GDB_EBADF);
     }
 }
+
+void semihost_sys_lseek(CPUState *cs, gdb_syscall_complete_cb complete,
+                        int fd, int64_t off, int gdb_whence)
+{
+    GuestFD *gf = get_guestfd(fd);
+
+    if (!gf) {
+        complete(cs, -1, GDB_EBADF);
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


