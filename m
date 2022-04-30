Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D83515DBB
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 15:40:14 +0200 (CEST)
Received: from localhost ([::1]:41374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nknKX-0008VE-H7
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 09:40:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAe-0004rG-JB
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:30:00 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:41975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAc-0006Hd-87
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:30:00 -0400
Received: by mail-pg1-x534.google.com with SMTP id t13so8493338pgn.8
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 06:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mPei3RSwc5/UahcC23WarvGjq8ZHMU2cCnmAH40UDUM=;
 b=XfhKaZh9QAF+6HdJBQM4FARMfB5R8DZmaJwdyFeUnUz5TS8H47WZ+UuHfOd2FCEnZd
 x4flW2e7Sz+UbTsFr6AS5EEwSFdQlNvvrd0xLoBlnPjKTkJUw9scS5VOoOzMsEOrq1BM
 uxQogz+bhCQ0rIOCKtnf232bKzHtoL/mTBm0yCfPby9/rTppMkih6dsWlodyU+0XWOoz
 gfViThqaBJKbewKmNVzCAjRFWHJfZp0yvQDLlZP0qMIjD7F8oPDiIbKVTd2+zBFobn1V
 aWLY8um9O6HeMrzJh5y+8f9DluDgPpa214o1OEd5nG5m0Ft6YP7z1WRTdTtfHcZEURVC
 B7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mPei3RSwc5/UahcC23WarvGjq8ZHMU2cCnmAH40UDUM=;
 b=bL3dOOVEDtmNoEpNgRZIVV3rA5ycsELKBHv0YxOz/Lp8rrBByPedJOEvilSIf6DgNG
 EbSL2Fi5fyi/S2rViUYDP4VC6maPiAsB2RxfO2x1lKhTf8NIjfsu11TC7KUwAh8DXkE5
 rRTl8T5bBBYZJV+m7f+nhOqw2rlqfDpSo1EzKG4MX3CWRvzU5w/Rr15XbEfvETMXEMB0
 ypG3F4MFnOsXm0a39gXvbQigpUgy+LoAt3EPBJB5LCe3RUo0HoDhbFtahVlLOCyuJjsq
 OxzYgYOzO0bZ3wJ7JHxGyLlilZp8MNSAWL7BIG3YQ8yWI71WS/UOJmLzt+EQQ0i/AiMk
 s0Aw==
X-Gm-Message-State: AOAM532WDaXncML/f/BpVv1aQkmOeWP5lKbDAre0VxQW2CIzemA+8vpS
 wLDmVRpZRmIh9snwuyr3xkvVOsV2Jeq5ZA==
X-Google-Smtp-Source: ABdhPJxPKAwCqJ2w3crz7P/4s43N+gST9atswpwrY/G1O5RuT7S/ADDAkhXmNgJnE8iempQOHt5c2Q==
X-Received: by 2002:a05:6a00:2295:b0:50d:d290:338c with SMTP id
 f21-20020a056a00229500b0050dd290338cmr1745333pfe.30.1651325396337; 
 Sat, 30 Apr 2022 06:29:56 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 x5-20020aa793a5000000b0050dc7628201sm1522606pff.219.2022.04.30.06.29.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:29:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 22/43] semihosting: Split out semihost_sys_read
Date: Sat, 30 Apr 2022 06:29:11 -0700
Message-Id: <20220430132932.324018-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430132932.324018-1-richard.henderson@linaro.org>
References: <20220430132932.324018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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

Split out the non-ARM specific portions of SYS_READ to a
reusable function.  This handles all GuestFD.  Isolate the
curious ARM-specific return value processing to a new
callback, common_semi_rw_cb.

Note that gdb_do_syscall %x reads target_ulong, not int.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/guestfd.h |  3 ++
 semihosting/arm-compat-semi.c | 84 ++++++++---------------------------
 semihosting/guestfd.c         | 75 +++++++++++++++++++++++++++++++
 3 files changed, 97 insertions(+), 65 deletions(-)

diff --git a/include/semihosting/guestfd.h b/include/semihosting/guestfd.h
index c38b1d3657..568d55fd32 100644
--- a/include/semihosting/guestfd.h
+++ b/include/semihosting/guestfd.h
@@ -56,4 +56,7 @@ void semihost_sys_open(CPUState *cs, gdb_syscall_complete_cb complete,
 
 void semihost_sys_close(CPUState *cs, gdb_syscall_complete_cb complete, int fd);
 
+void semihost_sys_read(CPUState *cs, gdb_syscall_complete_cb complete,
+                       int fd, target_ulong buf, target_ulong len);
+
 #endif /* SEMIHOSTING_GUESTFD_H */
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index f20e84c4f0..2c6c2dd0d0 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -232,7 +232,6 @@ static void common_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
         target_ulong reg0 = common_semi_arg(cs, 0);
         switch (reg0) {
         case TARGET_SYS_WRITE:
-        case TARGET_SYS_READ:
             ret = common_semi_syscall_len - ret;
             break;
         case TARGET_SYS_SEEK:
@@ -245,6 +244,24 @@ static void common_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
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
@@ -278,8 +295,6 @@ common_semi_flen_cb(CPUState *cs, target_ulong ret, target_ulong err)
  */
 typedef void sys_writefn(CPUState *cs, GuestFD *gf,
                          target_ulong buf, uint32_t len);
-typedef void sys_readfn(CPUState *cs, GuestFD *gf,
-                        target_ulong buf, uint32_t len);
 typedef void sys_isattyfn(CPUState *cs, GuestFD *gf);
 typedef void sys_seekfn(CPUState *cs, GuestFD *gf, target_ulong offset);
 typedef void sys_flenfn(CPUState *cs, GuestFD *gf);
@@ -302,26 +317,6 @@ static void host_writefn(CPUState *cs, GuestFD *gf,
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
@@ -351,13 +346,6 @@ static void gdb_writefn(CPUState *cs, GuestFD *gf,
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
@@ -398,30 +386,6 @@ static void staticfile_writefn(CPUState *cs, GuestFD *gf,
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
@@ -440,7 +404,6 @@ static void staticfile_flenfn(CPUState *cs, GuestFD *gf)
 
 typedef struct GuestFDFunctions {
     sys_writefn *writefn;
-    sys_readfn *readfn;
     sys_isattyfn *isattyfn;
     sys_seekfn *seekfn;
     sys_flenfn *flenfn;
@@ -449,21 +412,18 @@ typedef struct GuestFDFunctions {
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
@@ -582,13 +542,7 @@ void do_common_semihosting(CPUState *cs)
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
diff --git a/semihosting/guestfd.c b/semihosting/guestfd.c
index c26b1c677e..057e384d65 100644
--- a/semihosting/guestfd.c
+++ b/semihosting/guestfd.c
@@ -303,3 +303,78 @@ void semihost_sys_close(CPUState *cs, gdb_syscall_complete_cb complete, int fd)
     }
     do_dealloc_guestfd(gf);
 }
+
+static void gdb_read(CPUState *cs, gdb_syscall_complete_cb complete,
+                     GuestFD *gf, target_ulong buf, target_ulong len)
+{
+    gdb_do_syscall(complete, "read,%x,%x,%x",
+                   (target_ulong)gf->hostfd, buf, len);
+}
+
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
+void semihost_sys_read(CPUState *cs, gdb_syscall_complete_cb complete,
+                       int fd, target_ulong buf, target_ulong len)
+{
+    GuestFD *gf = get_guestfd(fd);
+
+    if (!gf) {
+        complete(cs, -1, EBADF);
+        return;
+    }
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
-- 
2.34.1


