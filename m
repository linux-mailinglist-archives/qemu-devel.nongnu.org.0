Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5569515DD7
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 15:49:46 +0200 (CEST)
Received: from localhost ([::1]:37408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nknTl-0008NS-SI
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 09:49:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAf-0004sn-Kn
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:30:02 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:40843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAc-0006Hi-EM
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:30:01 -0400
Received: by mail-pg1-x534.google.com with SMTP id x12so8499074pgj.7
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 06:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D+i1/p52cnWoq/UdGJsdummOLTJVfBA8piubLoll8HQ=;
 b=xAg3Zu0Y+C4SL4aPl/a9Eih/E7n2FcE9x1xMfbD++QUS78VDIoEByFbl7IfDVi9QNd
 nJILhGR0ejxwR5ADwJPJeLcza4FtPmWfDbPNUZUyuT/rUlSZIBbczw59Tk4UxpUZfADr
 7vhlYGFejUPzdH8ul5Wz5bFiM9+TQhGE9P/gXUUPmdTsZPkCLlSKBcSDKIfHHOWPzHQT
 DJtEz6svdv1WdB8/zom/B0LUk1iMwbwg8F7kaqgMqNYPxxiBzoq2snc/V4NxuNu1oOx0
 4hlbSVwZrOj6btOwKAS6bs49F83PFxBb0rlYEH56mH6ZEe/W8AwaU3/1AhMdLibSl0KE
 ooVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D+i1/p52cnWoq/UdGJsdummOLTJVfBA8piubLoll8HQ=;
 b=4toK753E2i73Wb8of35Sn1ldUfBoLhuYPnNOltddqRXn81888vnVTybHJsg305eX9h
 O+Bs1Jdt8V/0zoC4lJ3cbqBejp5ofXqPgsIvj9U27BGfPauQaQucmn2PlQ6JCCYhGDAO
 ulDoMAijWz1+s+v9VHXYhbUsFtTUnFD0gHZMDtzXiBahE9VH1LdorS5prV7BWkn9tFwt
 u4tSlBU/vMfEe8IDgUxvK9w4vr/qAFQbf3h6U76Pn+8uhJ0vaSRrIyPhV9mvicyIkkXT
 2dU1++yJJ04Kdixkv1VSgXcO0U8rDq4Js8o9QJ+SGwKzSTknO4mwJfO2cz6ITxGJPGLa
 UYig==
X-Gm-Message-State: AOAM5326/ErK1Fxs2K3mE/+F7YIFU+ye4+l3QHGcxeUcMh8Qqgj3PQLm
 Ec051XZjsLMOZkDCQg5ReCDtUHdy9qKAXA==
X-Google-Smtp-Source: ABdhPJzcGaQa2Ej+5oNulaOI5aLk1SILHN21NOksgO1wDaV91etVi5wtWl/dZhes2eLEt4imWV5uFw==
X-Received: by 2002:a05:6a00:16cd:b0:4e1:366:7ee8 with SMTP id
 l13-20020a056a0016cd00b004e103667ee8mr3449824pfc.9.1651325397098; 
 Sat, 30 Apr 2022 06:29:57 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 x5-20020aa793a5000000b0050dc7628201sm1522606pff.219.2022.04.30.06.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:29:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 23/43] semihosting: Split out semihost_sys_write
Date: Sat, 30 Apr 2022 06:29:12 -0700
Message-Id: <20220430132932.324018-24-richard.henderson@linaro.org>
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

Split out the non-ARM specific portions of SYS_WRITE to a
reusable function.  This handles all GuestFD.  This removes
the last use of common_semi_syscall_len.

Note that gdb_do_syscall %x reads target_ulong, not int.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/guestfd.h |  3 ++
 semihosting/arm-compat-semi.c | 52 +----------------------------------
 semihosting/guestfd.c         | 48 ++++++++++++++++++++++++++++++++
 3 files changed, 52 insertions(+), 51 deletions(-)

diff --git a/include/semihosting/guestfd.h b/include/semihosting/guestfd.h
index 568d55fd32..5780ea2f13 100644
--- a/include/semihosting/guestfd.h
+++ b/include/semihosting/guestfd.h
@@ -59,4 +59,7 @@ void semihost_sys_close(CPUState *cs, gdb_syscall_complete_cb complete, int fd);
 void semihost_sys_read(CPUState *cs, gdb_syscall_complete_cb complete,
                        int fd, target_ulong buf, target_ulong len);
 
+void semihost_sys_write(CPUState *cs, gdb_syscall_complete_cb complete,
+                        int fd, target_ulong buf, target_ulong len);
+
 #endif /* SEMIHOSTING_GUESTFD_H */
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 2c6c2dd0d0..6568d205eb 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -216,8 +216,6 @@ static inline uint32_t get_swi_errno(CPUState *cs)
 #endif
 }
 
-static target_ulong common_semi_syscall_len;
-
 static void common_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
 {
     if (err) {
@@ -231,9 +229,6 @@ static void common_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
         /* Fixup syscalls that use nonstardard return conventions.  */
         target_ulong reg0 = common_semi_arg(cs, 0);
         switch (reg0) {
-        case TARGET_SYS_WRITE:
-            ret = common_semi_syscall_len - ret;
-            break;
         case TARGET_SYS_SEEK:
             ret = 0;
             break;
@@ -293,30 +288,10 @@ common_semi_flen_cb(CPUState *cs, target_ulong ret, target_ulong err)
  * do the work and return the required return value to the guest
  * via common_semi_cb.
  */
-typedef void sys_writefn(CPUState *cs, GuestFD *gf,
-                         target_ulong buf, uint32_t len);
 typedef void sys_isattyfn(CPUState *cs, GuestFD *gf);
 typedef void sys_seekfn(CPUState *cs, GuestFD *gf, target_ulong offset);
 typedef void sys_flenfn(CPUState *cs, GuestFD *gf);
 
-static void host_writefn(CPUState *cs, GuestFD *gf,
-                         target_ulong buf, uint32_t len)
-{
-    CPUArchState *env = cs->env_ptr;
-    uint32_t ret = 0;
-    char *s = lock_user(VERIFY_READ, buf, len, 1);
-    (void) env; /* Used in arm softmmu lock_user implicitly */
-    if (s) {
-        ret = write(gf->hostfd, s, len);
-        unlock_user(s, buf, 0);
-        if (ret == (uint32_t)-1) {
-            ret = 0;
-        }
-    }
-    /* Return bytes not written, on error as well. */
-    common_semi_cb(cs, len - ret, 0);
-}
-
 static void host_isattyfn(CPUState *cs, GuestFD *gf)
 {
     common_semi_cb(cs, isatty(gf->hostfd), 0);
@@ -339,13 +314,6 @@ static void host_flenfn(CPUState *cs, GuestFD *gf)
     }
 }
 
-static void gdb_writefn(CPUState *cs, GuestFD *gf,
-                        target_ulong buf, uint32_t len)
-{
-    common_semi_syscall_len = len;
-    gdb_do_syscall(common_semi_cb, "write,%x,%x,%x", gf->hostfd, buf, len);
-}
-
 static void gdb_isattyfn(CPUState *cs, GuestFD *gf)
 {
     gdb_do_syscall(common_semi_cb, "isatty,%x", gf->hostfd);
@@ -379,13 +347,6 @@ static const uint8_t featurefile_data[] = {
     SH_EXT_EXIT_EXTENDED | SH_EXT_STDOUT_STDERR, /* Feature byte 0 */
 };
 
-static void staticfile_writefn(CPUState *cs, GuestFD *gf,
-                               target_ulong buf, uint32_t len)
-{
-    /* This fd can never be open for writing */
-    common_semi_cb(cs, -1, EBADF);
-}
-
 static void staticfile_isattyfn(CPUState *cs, GuestFD *gf)
 {
     common_semi_cb(cs, 0, 0);
@@ -403,7 +364,6 @@ static void staticfile_flenfn(CPUState *cs, GuestFD *gf)
 }
 
 typedef struct GuestFDFunctions {
-    sys_writefn *writefn;
     sys_isattyfn *isattyfn;
     sys_seekfn *seekfn;
     sys_flenfn *flenfn;
@@ -411,19 +371,16 @@ typedef struct GuestFDFunctions {
 
 static const GuestFDFunctions guestfd_fns[] = {
     [GuestFDHost] = {
-        .writefn = host_writefn,
         .isattyfn = host_isattyfn,
         .seekfn = host_seekfn,
         .flenfn = host_flenfn,
     },
     [GuestFDGDB] = {
-        .writefn = gdb_writefn,
         .isattyfn = gdb_isattyfn,
         .seekfn = gdb_seekfn,
         .flenfn = gdb_flenfn,
     },
     [GuestFDStatic] = {
-        .writefn = staticfile_writefn,
         .isattyfn = staticfile_isattyfn,
         .seekfn = staticfile_seekfn,
         .flenfn = staticfile_flenfn,
@@ -448,7 +405,6 @@ void do_common_semihosting(CPUState *cs)
     char * s;
     int nr;
     uint32_t ret;
-    uint32_t len;
     GuestFD *gf;
     int64_t elapsed;
 
@@ -529,13 +485,7 @@ void do_common_semihosting(CPUState *cs)
         GET_ARG(0);
         GET_ARG(1);
         GET_ARG(2);
-        len = arg2;
-
-        gf = get_guestfd(arg0);
-        if (!gf) {
-            goto do_badf;
-        }
-        guestfd_fns[gf->type].writefn(cs, gf, arg1, len);
+        semihost_sys_write(cs, common_semi_rw_cb, arg0, arg1, arg2);
         break;
 
     case TARGET_SYS_READ:
diff --git a/semihosting/guestfd.c b/semihosting/guestfd.c
index 057e384d65..42efd2c558 100644
--- a/semihosting/guestfd.c
+++ b/semihosting/guestfd.c
@@ -378,3 +378,51 @@ void semihost_sys_read(CPUState *cs, gdb_syscall_complete_cb complete,
         g_assert_not_reached();
     }
 }
+
+static void gdb_write(CPUState *cs, gdb_syscall_complete_cb complete,
+                      GuestFD *gf, target_ulong buf, target_ulong len)
+{
+    gdb_do_syscall(complete, "write,%x,%x,%x",
+                   (target_ulong)gf->hostfd, buf, len);
+}
+
+static void host_write(CPUState *cs, gdb_syscall_complete_cb complete,
+                       GuestFD *gf, target_ulong buf, target_ulong len)
+{
+    CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
+    void *ptr = lock_user(VERIFY_READ, buf, len, 1);
+    ssize_t ret;
+
+    if (!ptr) {
+        complete(cs, -1, EFAULT);
+        return;
+    }
+    ret = write(gf->hostfd, ptr, len);
+    complete(cs, ret, ret == -1 ? errno : 0);
+    unlock_user(ptr, buf, 0);
+}
+
+void semihost_sys_write(CPUState *cs, gdb_syscall_complete_cb complete,
+                        int fd, target_ulong buf, target_ulong len)
+{
+    GuestFD *gf = get_guestfd(fd);
+
+    if (!gf) {
+        goto ebadf;
+    }
+    switch (gf->type) {
+    case GuestFDGDB:
+        gdb_write(cs, complete, gf, buf, len);
+        break;
+    case GuestFDHost:
+        host_write(cs, complete, gf, buf, len);
+        break;
+    case GuestFDStatic:
+    ebadf:
+        /* Static files are never open for writing: EBADF. */
+        complete(cs, -1, EBADF);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
-- 
2.34.1


