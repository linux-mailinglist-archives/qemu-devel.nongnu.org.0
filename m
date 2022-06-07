Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CABA541F2C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:44:18 +0200 (CEST)
Received: from localhost ([::1]:59902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyhvt-0007md-Ls
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:44:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5t-0007Tu-Lh
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:29 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:37780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5q-0001Wr-M9
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:29 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 3-20020a17090a174300b001e426a02ac5so18756915pjm.2
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=yudZM/x/b/b005gZSABZ/vgFwSBuZhYdS78za3bDPvA=;
 b=NDBVOkJuBHFkwxiagdql+UGI+g6FmOEnNwWK/76O/XLm733veGmsu3XNGitAcEm7qZ
 r3MJS0NApY1D0gd8HlSX2PljwVpKhf6X4ikgdCF8IqLhfV0s0fAIaCtqfzYHqYgklkrs
 EU8YHff1/8MEl9DoOeG5sd27OmFCJd3LLmIRPa/i4Go+BbME/VHeCFqeacNLAS+JpAo4
 tdjQuHx+40QmeoRUxs4PtyDCJo3nEyAD+/EzEN0+lHEaHJxIqBAZkc4/tzcx5CemFYVS
 TmzP9Ya3Ll7bLVrpyYumIoTZPkFLmeZJSIkTJv2pJCl7jJdfZ+m13fRde7FDk7A5MPQ0
 dk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yudZM/x/b/b005gZSABZ/vgFwSBuZhYdS78za3bDPvA=;
 b=AqiCZrnA88s4T/yl9/jpppPSNZXhHgypGNVpfnEtXXEbmQ0wTaIqOXKmQwwTpssZ9m
 RcmR8rm78IxmbeTrmvMSsRYTy+SFdoPGGG7/jWWCUm1XphO7c/VcEJHFWxanQ7m2Zc6C
 SFpoxcBpy0v9d8rGB9XLYrgKWNVXSjsk9bgzvhpmaIuxtAuqZawxdmRFCZ+0wnGsAr8U
 4nF2dSWPCn9AcCiOGnLB7hUr/TN8nKkJa+K4n96+LkX6bH0/vsQg6PGW54InisoJUxBA
 wJLkC0/TV5uR2kcR/8xoRVQHVcunmttV0ULEbZgLNHQc3ML4r6dLYud1mqhWsiERfU19
 47Dw==
X-Gm-Message-State: AOAM531Idsr+VUVZm7DvT8qvq3tS1ONj09oiVq515q9Qbqm/X+BjD4zW
 K92dIjv65RT25i7ovW3+ZOSnYz3v4ZmkKg==
X-Google-Smtp-Source: ABdhPJxniVTunhMsBLdlDNGSsczLGZN+LH2cmasQsPtMAKuQ7BLXKjXRHCs7Q+5KbDbkcH/sF+0JWg==
X-Received: by 2002:a17:902:f64c:b0:156:7ceb:b579 with SMTP id
 m12-20020a170902f64c00b001567cebb579mr30131985plg.73.1654634785209; 
 Tue, 07 Jun 2022 13:46:25 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a170902be0600b00162037fbacdsm12971279pls.187.2022.06.07.13.46.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:46:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 29/53] semihosting: Split out semihost_sys_read
Date: Tue,  7 Jun 2022 13:45:33 -0700
Message-Id: <20220607204557.658541-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
 semihosting/arm-compat-semi.c  | 85 ++++++++--------------------------
 semihosting/syscalls.c         | 85 ++++++++++++++++++++++++++++++++++
 3 files changed, 113 insertions(+), 65 deletions(-)

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
index a6dddb2aa2..5e11ec307a 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -231,7 +231,6 @@ static void common_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
         target_ulong reg0 = common_semi_arg(cs, 0);
         switch (reg0) {
         case TARGET_SYS_WRITE:
-        case TARGET_SYS_READ:
             ret = common_semi_syscall_len - ret;
             break;
         case TARGET_SYS_SEEK:
@@ -244,6 +243,25 @@ static void common_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
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
+ do_fault:
+        ret = 0; /* error: no bytes transmitted */
+    }
+    common_semi_set_ret(cs, arg2 - ret);
+}
+
 /*
  * Return an address in target memory of 64 bytes where the remote
  * gdb should write its stat struct. (The format of this structure
@@ -278,8 +296,6 @@ common_semi_flen_cb(CPUState *cs, target_ulong ret, target_ulong err)
  */
 typedef void sys_writefn(CPUState *cs, GuestFD *gf,
                          target_ulong buf, uint32_t len);
-typedef void sys_readfn(CPUState *cs, GuestFD *gf,
-                        target_ulong buf, uint32_t len);
 typedef void sys_isattyfn(CPUState *cs, GuestFD *gf);
 typedef void sys_seekfn(CPUState *cs, GuestFD *gf, target_ulong offset);
 typedef void sys_flenfn(CPUState *cs, GuestFD *gf);
@@ -302,26 +318,6 @@ static void host_writefn(CPUState *cs, GuestFD *gf,
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
@@ -351,13 +347,6 @@ static void gdb_writefn(CPUState *cs, GuestFD *gf,
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
@@ -398,30 +387,6 @@ static void staticfile_writefn(CPUState *cs, GuestFD *gf,
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
@@ -440,7 +405,6 @@ static void staticfile_flenfn(CPUState *cs, GuestFD *gf)
 
 typedef struct GuestFDFunctions {
     sys_writefn *writefn;
-    sys_readfn *readfn;
     sys_isattyfn *isattyfn;
     sys_seekfn *seekfn;
     sys_flenfn *flenfn;
@@ -449,21 +413,18 @@ typedef struct GuestFDFunctions {
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
@@ -582,13 +543,7 @@ void do_common_semihosting(CPUState *cs)
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
index 3648b9dd49..d42a190746 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -100,6 +100,13 @@ static void gdb_close(CPUState *cs, gdb_syscall_complete_cb complete,
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
@@ -163,6 +170,54 @@ static void host_close(CPUState *cs, gdb_syscall_complete_cb complete,
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
+        complete(cs, -1, EFAULT);
+        return;
+    }
+    do {
+        ret = read(gf->hostfd, ptr, len);
+    } while (ret == -1 && errno == EINTR);
+    if (ret == -1) {
+        complete(cs, -1, errno);
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
+        complete(cs, -1, EFAULT);
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
@@ -201,3 +256,33 @@ void semihost_sys_close(CPUState *cs, gdb_syscall_complete_cb complete, int fd)
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
+        complete(cs, -1, EBADF);
+    }
+}
-- 
2.34.1


