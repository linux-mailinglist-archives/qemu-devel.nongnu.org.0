Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC491518E39
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:09:46 +0200 (CEST)
Received: from localhost ([::1]:58762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlyq9-0007JD-R8
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:09:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyWL-000227-Hu
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:19 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:43598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyWE-0003b8-0E
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:12 -0400
Received: by mail-pl1-x632.google.com with SMTP id i17so6701337pla.10
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=s656QJXJi/K8oez9ZtWy2poWtVIn5Z6Qh6dXSclsx7s=;
 b=Iwf4erPtbCK3zOzEkLa4e+ZXrsNj9iI2H+aI1T5jrfwPig8XP6C5/ovRKGNcGwJXtZ
 IRBYO4Cd6m1HTdhFnwJ7Q3uNWcUMp8/vZdhTc/bY8qSXEhyrhHrqfWvRFs3sJJ8NES1o
 ETFnFUGRY+kXJB8ecx4tgi4+Cm1v5lXR22jGNWnl1K3f89bTM56Af7mtz4KZPv39M9As
 nZ18K5kenGeR6p1QZuh6bi5vD9189EpBdjp8femQFE1NoGHoktD7SXP0j81l1m8xsiQH
 9Tcv4FXYw25CSdgnYeYC4eyqdWBXlxbq4+hSe6qi3KsC7JXEGEAeGXNsQK+1n+epsway
 u58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s656QJXJi/K8oez9ZtWy2poWtVIn5Z6Qh6dXSclsx7s=;
 b=CWe170uy8OhMhOWsM/GY/jCX3DcTWgoSrH0qIaUGnpXtAMNB41wpiCUoKuoi4HdZLE
 psLCgMVWwMJgSgMLkTVec1LIeDXivNpZbT+UP34Ou+Jz2F2fFp2zciOUwqlZkPQk2OtM
 KJz/Xg54LOr3D/CNTjMJJhWzrVUzjXNl9jMgc/Gg5TSaPD5e6Mol8CoYfLmjkAXCtaA5
 3lNh3tBlBd2b21ZiIguuvV92dokh8+8KyWFR7HeoDXiO3pL7Em+50ZQocKYoRaLFwf2L
 eiRj94Vk4zGlWt6H/neJHeCXLb00GbzKVzVLxOnQ/hjbQocJ+qplpHwwBav1vgnIMSW+
 Hlxg==
X-Gm-Message-State: AOAM531orTQSfYRPhb4goppEfcgXyvblXTI58K2+AjMBIi+AcheipVNT
 uKMf10+E33jD+nt1ZCT/0ZkS/qbunRcGKw==
X-Google-Smtp-Source: ABdhPJxGN6BuDASdsNIkccQmO4Ptn6eUNmDtId4rNgxmJE5LSCzCf51PJH1pDB6Os+E+ah+P3e6ang==
X-Received: by 2002:a17:903:240e:b0:158:eab9:2662 with SMTP id
 e14-20020a170903240e00b00158eab92662mr18083377plo.87.1651607348669; 
 Tue, 03 May 2022 12:49:08 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 p11-20020a17090ad30b00b001cd4989fed3sm1712383pju.31.2022.05.03.12.49.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:49:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/74] semihosting: Split out semihost_sys_read
Date: Tue,  3 May 2022 12:47:52 -0700
Message-Id: <20220503194843.1379101-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

Split out the non-ARM specific portions of SYS_READ to a
reusable function.  This handles all GuestFD.  Isolate the
curious ARM-specific return value processing to a new
callback, common_semi_rw_cb.

Note that gdb_do_syscall %x reads target_ulong, not int.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/syscalls.h |  8 ++++
 semihosting/arm-compat-semi.c  | 84 ++++++++-------------------------
 semihosting/syscalls.c         | 85 ++++++++++++++++++++++++++++++++++
 3 files changed, 112 insertions(+), 65 deletions(-)

diff --git a/include/semihosting/syscalls.h b/include/semihosting/syscalls.h
index 00e718f11d..20da8138b0 100644
--- a/include/semihosting/syscalls.h
+++ b/include/semihosting/syscalls.h
@@ -18,6 +18,8 @@
  * or non-zero (where it should include the terminating zero).
  */
 
+typedef struct GuestFD GuestFD;
+
 void semihost_sys_open(CPUState *cs, gdb_syscall_complete_cb complete,
                        target_ulong fname, target_ulong fname_len,
                        int gdb_flags, int mode);
@@ -25,4 +27,10 @@ void semihost_sys_open(CPUState *cs, gdb_syscall_complete_cb complete,
 void semihost_sys_close(CPUState *cs, gdb_syscall_complete_cb complete,
                         int fd);
 
+void semihost_sys_read(CPUState *cs, gdb_syscall_complete_cb complete,
+                       int fd, target_ulong buf, target_ulong len);
+
+void semihost_sys_read_gf(CPUState *cs, gdb_syscall_complete_cb complete,
+                          GuestFD *gf, target_ulong buf, target_ulong len);
+
 #endif /* SEMIHOSTING_SYSCALLS_H */
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 8ebe3aad55..7b6df09f35 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -233,7 +233,6 @@ static void common_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
         target_ulong reg0 = common_semi_arg(cs, 0);
         switch (reg0) {
         case TARGET_SYS_WRITE:
-        case TARGET_SYS_READ:
             ret = common_semi_syscall_len - ret;
             break;
         case TARGET_SYS_SEEK:
@@ -246,6 +245,24 @@ static void common_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
     common_semi_set_ret(cs, ret);
 }
 
+/*
+ * SYS_READ and SYS_WRITE always return the number of bytes not read/written.
+ * There is no error condition, other than returning the original length.
+ */
+static void common_semi_rw_cb(CPUState *cs, target_ulong ret, target_ulong err)
+{
+    /* Recover the original length from the third argument. */
+    CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
+    target_ulong args = common_semi_arg(cs, 1);
+    target_ulong arg2;
+    GET_ARG(2);
+
+    if (err) {
+        ret = 0; /* error: no bytes transmitted */
+    }
+    common_semi_set_ret(cs, arg2 - ret);
+}
+
 /*
  * Return an address in target memory of 64 bytes where the remote
  * gdb should write its stat struct. (The format of this structure
@@ -279,8 +296,6 @@ common_semi_flen_cb(CPUState *cs, target_ulong ret, target_ulong err)
  */
 typedef void sys_writefn(CPUState *cs, GuestFD *gf,
                          target_ulong buf, uint32_t len);
-typedef void sys_readfn(CPUState *cs, GuestFD *gf,
-                        target_ulong buf, uint32_t len);
 typedef void sys_isattyfn(CPUState *cs, GuestFD *gf);
 typedef void sys_seekfn(CPUState *cs, GuestFD *gf, target_ulong offset);
 typedef void sys_flenfn(CPUState *cs, GuestFD *gf);
@@ -303,26 +318,6 @@ static void host_writefn(CPUState *cs, GuestFD *gf,
     common_semi_cb(cs, len - ret, 0);
 }
 
-static void host_readfn(CPUState *cs, GuestFD *gf,
-                        target_ulong buf, uint32_t len)
-{
-    CPUArchState *env = cs->env_ptr;
-    uint32_t ret = 0;
-    char *s = lock_user(VERIFY_WRITE, buf, len, 0);
-    (void) env; /* Used in arm softmmu lock_user implicitly */
-    if (s) {
-        do {
-            ret = read(gf->hostfd, s, len);
-        } while (ret == -1 && errno == EINTR);
-        unlock_user(s, buf, len);
-        if (ret == (uint32_t)-1) {
-            ret = 0;
-        }
-    }
-    /* Return bytes not read, on error as well. */
-    common_semi_cb(cs, len - ret, 0);
-}
-
 static void host_isattyfn(CPUState *cs, GuestFD *gf)
 {
     common_semi_cb(cs, isatty(gf->hostfd), 0);
@@ -352,13 +347,6 @@ static void gdb_writefn(CPUState *cs, GuestFD *gf,
     gdb_do_syscall(common_semi_cb, "write,%x,%x,%x", gf->hostfd, buf, len);
 }
 
-static void gdb_readfn(CPUState *cs, GuestFD *gf,
-                       target_ulong buf, uint32_t len)
-{
-    common_semi_syscall_len = len;
-    gdb_do_syscall(common_semi_cb, "read,%x,%x,%x", gf->hostfd, buf, len);
-}
-
 static void gdb_isattyfn(CPUState *cs, GuestFD *gf)
 {
     gdb_do_syscall(common_semi_cb, "isatty,%x", gf->hostfd);
@@ -399,30 +387,6 @@ static void staticfile_writefn(CPUState *cs, GuestFD *gf,
     common_semi_cb(cs, -1, EBADF);
 }
 
-static void staticfile_readfn(CPUState *cs, GuestFD *gf,
-                              target_ulong buf, uint32_t len)
-{
-    CPUArchState *env = cs->env_ptr;
-    uint32_t i = 0;
-    char *s;
-
-    (void) env; /* Used in arm softmmu lock_user implicitly */
-    s = lock_user(VERIFY_WRITE, buf, len, 0);
-    if (s) {
-        for (i = 0; i < len; i++) {
-            if (gf->staticfile.off >= gf->staticfile.len) {
-                break;
-            }
-            s[i] = gf->staticfile.data[gf->staticfile.off];
-            gf->staticfile.off++;
-        }
-        unlock_user(s, buf, len);
-    }
-
-    /* Return number of bytes not read */
-    common_semi_cb(cs, len - i, 0);
-}
-
 static void staticfile_isattyfn(CPUState *cs, GuestFD *gf)
 {
     common_semi_cb(cs, 0, 0);
@@ -441,7 +405,6 @@ static void staticfile_flenfn(CPUState *cs, GuestFD *gf)
 
 typedef struct GuestFDFunctions {
     sys_writefn *writefn;
-    sys_readfn *readfn;
     sys_isattyfn *isattyfn;
     sys_seekfn *seekfn;
     sys_flenfn *flenfn;
@@ -450,21 +413,18 @@ typedef struct GuestFDFunctions {
 static const GuestFDFunctions guestfd_fns[] = {
     [GuestFDHost] = {
         .writefn = host_writefn,
-        .readfn = host_readfn,
         .isattyfn = host_isattyfn,
         .seekfn = host_seekfn,
         .flenfn = host_flenfn,
     },
     [GuestFDGDB] = {
         .writefn = gdb_writefn,
-        .readfn = gdb_readfn,
         .isattyfn = gdb_isattyfn,
         .seekfn = gdb_seekfn,
         .flenfn = gdb_flenfn,
     },
     [GuestFDStatic] = {
         .writefn = staticfile_writefn,
-        .readfn = staticfile_readfn,
         .isattyfn = staticfile_isattyfn,
         .seekfn = staticfile_seekfn,
         .flenfn = staticfile_flenfn,
@@ -583,13 +543,7 @@ void do_common_semihosting(CPUState *cs)
         GET_ARG(0);
         GET_ARG(1);
         GET_ARG(2);
-        len = arg2;
-
-        gf = get_guestfd(arg0);
-        if (!gf) {
-            goto do_badf;
-        }
-        guestfd_fns[gf->type].readfn(cs, gf, arg1, len);
+        semihost_sys_read(cs, common_semi_rw_cb, arg0, arg1, arg2);
         break;
 
     case TARGET_SYS_READC:
diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index 9c4b635317..7c18f77898 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -130,6 +130,13 @@ static void gdb_close(CPUState *cs, gdb_syscall_complete_cb complete,
     gdb_do_syscall(complete, "close,%x", (target_ulong)gf->hostfd);
 }
 
+static void gdb_read(CPUState *cs, gdb_syscall_complete_cb complete,
+                     GuestFD *gf, target_ulong buf, target_ulong len)
+{
+    gdb_do_syscall(complete, "read,%x,%x,%x",
+                   (target_ulong)gf->hostfd, buf, len);
+}
+
 /*
  * Host semihosting syscall implementations.
  */
@@ -193,6 +200,54 @@ static void host_close(CPUState *cs, gdb_syscall_complete_cb complete,
     }
 }
 
+static void host_read(CPUState *cs, gdb_syscall_complete_cb complete,
+                      GuestFD *gf, target_ulong buf, target_ulong len)
+{
+    CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
+    void *ptr = lock_user(VERIFY_WRITE, buf, len, 0);
+    ssize_t ret;
+
+    if (!ptr) {
+        complete(cs, -1, GDB_EFAULT);
+        return;
+    }
+    do {
+        ret = read(gf->hostfd, ptr, len);
+    } while (ret == -1 && errno == EINTR);
+    if (ret == -1) {
+        complete(cs, -1, errno_for_gdb());
+        unlock_user(ptr, buf, 0);
+    } else {
+        complete(cs, ret, 0);
+        unlock_user(ptr, buf, ret);
+    }
+}
+
+/*
+ * Static file semihosting syscall implementations.
+ */
+
+static void staticfile_read(CPUState *cs, gdb_syscall_complete_cb complete,
+                            GuestFD *gf, target_ulong buf, target_ulong len)
+{
+    CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
+    target_ulong rest = gf->staticfile.len - gf->staticfile.off;
+    void *ptr;
+
+    if (len > rest) {
+        len = rest;
+    }
+    ptr = lock_user(VERIFY_WRITE, buf, len, 0);
+    if (!ptr) {
+        complete(cs, -1, GDB_EFAULT);
+        return;
+    }
+    memcpy(ptr, gf->staticfile.data + gf->staticfile.off, len);
+    gf->staticfile.off += len;
+    complete(cs, len, 0);
+    unlock_user(ptr, buf, len);
+}
+
 /*
  * Syscall entry points.
  */
@@ -231,3 +286,33 @@ void semihost_sys_close(CPUState *cs, gdb_syscall_complete_cb complete, int fd)
     }
     dealloc_guestfd(fd);
 }
+
+void semihost_sys_read_gf(CPUState *cs, gdb_syscall_complete_cb complete,
+                          GuestFD *gf, target_ulong buf, target_ulong len)
+{
+    switch (gf->type) {
+    case GuestFDGDB:
+        gdb_read(cs, complete, gf, buf, len);
+        break;
+    case GuestFDHost:
+        host_read(cs, complete, gf, buf, len);
+        break;
+    case GuestFDStatic:
+        staticfile_read(cs, complete, gf, buf, len);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+void semihost_sys_read(CPUState *cs, gdb_syscall_complete_cb complete,
+                       int fd, target_ulong buf, target_ulong len)
+{
+    GuestFD *gf = get_guestfd(fd);
+
+    if (gf) {
+        semihost_sys_read_gf(cs, complete, gf, buf, len);
+    } else {
+        complete(cs, -1, GDB_EBADF);
+    }
+}
-- 
2.34.1


