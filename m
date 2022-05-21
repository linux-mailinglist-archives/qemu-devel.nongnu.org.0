Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E97D152F73F
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 03:04:45 +0200 (CEST)
Received: from localhost ([::1]:47718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsDXx-0007Of-2O
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 21:04:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCc6-0008CE-Cp
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:05:00 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:38536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbl-000421-6Z
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:48 -0400
Received: by mail-pl1-x62d.google.com with SMTP id n18so8566303plg.5
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 17:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iVi2WL9LYbp1NIow410Rcdf8IJcyVNGeWO58E9XwFhI=;
 b=zE6/YyLhILpXCuNNPPxSFbE/JYyKSntu7d2b4IJRa6sj2rFFKqZYX3WCDUWs42GWbe
 CiU4f7uKdfD+8yyLVpgZwtChx82o0cpcBV2CoAxqP6gYdiH0tzdFofcP1+u1F99EHQ2H
 Y3uq6pcb/6eaFe88oH3cN7vtATMz08e4oKR/bi0nkDlPwp6MY+wuecsadhyI/RUkYOn3
 qy4O8Wp4uQJ5BRC0gsFFaDp2jYQ3q8xm+WKe38oFqhz3Jerfp8KcQuqxe1k6kDuZBrFD
 Fnbhhqn+xeHqhH0/cz+oaDEcsWQBqzIAymzjkijCWE7yxBpd7yWOrgxXlVC9oI7R9lcX
 kDkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iVi2WL9LYbp1NIow410Rcdf8IJcyVNGeWO58E9XwFhI=;
 b=1DvVWh5tTQ3VFtoUM+WM4w6iPkqOAEbQhbJE42paNJK3pG3ReR/whgadCkHOKE7omm
 +LD1S4t+TEDq33WbAmN/4vjDgxIPHNinFcrwqi2P3zrN7Mcp3eCWMit65+LaW/kdNvQs
 coQCBYv57vgYmFcdc9cVP8d9wlxI64kOZh/WJfVQ27n9/K7sKkOFVUqtz2HC8qri4eZ7
 6jFFRpg1iqIxlCSvxCKGzcDJruu8Co3W3l54J6j+7VOpoSG/IdXaHyKKUH8X+7MlQ/da
 KO8xRQWZlIA2S2fvpich3kCWak1k7KsVPmaXzDjtsRkPV5PfKZG+JZsLUXwaBTnIx0iy
 RhTA==
X-Gm-Message-State: AOAM531Y+lnpJt3N8c8T85PPc4U9WrORkWAN1RD63jTAzVP1pQZaUpUY
 NNAxNsf1Zn+9ZVzjJyM2N0OMbzVe/oWv0Q==
X-Google-Smtp-Source: ABdhPJwyNbkg3jl3RWzjilnvlhLYYJ6jKP/Sqam1YayCWCTyLxSmSSq/gYulh+jzvxwycqKaYnXLyA==
X-Received: by 2002:a17:90b:4a43:b0:1df:d1e3:6fd4 with SMTP id
 lb3-20020a17090b4a4300b001dfd1e36fd4mr12601515pjb.30.1653091474893; 
 Fri, 20 May 2022 17:04:34 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 h8-20020a654808000000b003f9d1c020cbsm306369pgs.51.2022.05.20.17.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 17:04:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 29/49] semihosting: Split out semihost_sys_isatty
Date: Fri, 20 May 2022 17:03:40 -0700
Message-Id: <20220521000400.454525-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521000400.454525-1-richard.henderson@linaro.org>
References: <20220521000400.454525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

Split out the non-ARM specific portions of SYS_ISTTY to a
reusable function.  This handles all GuestFD.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/gdbstub.h         |  1 +
 include/semihosting/syscalls.h |  3 +++
 semihosting/arm-compat-semi.c  | 27 +------------------------
 semihosting/syscalls.c         | 36 ++++++++++++++++++++++++++++++++++
 4 files changed, 41 insertions(+), 26 deletions(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 056db1a0d0..fd4bc4e937 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -41,6 +41,7 @@
 #define GDB_EROFS          30
 #define GDB_ENAMETOOLONG   91
 #define GDB_EUNKNOWN       9999
+#define GDB_ENOTTY         GDB_EUNKNOWN
 
 /* For gdb file i/o remote protocol lseek whence. */
 #define GDB_SEEK_SET  0
diff --git a/include/semihosting/syscalls.h b/include/semihosting/syscalls.h
index 841a93d25b..c60ebafb85 100644
--- a/include/semihosting/syscalls.h
+++ b/include/semihosting/syscalls.h
@@ -42,4 +42,7 @@ void semihost_sys_write_gf(CPUState *cs, gdb_syscall_complete_cb complete,
 void semihost_sys_lseek(CPUState *cs, gdb_syscall_complete_cb complete,
                         int fd, int64_t off, int gdb_whence);
 
+void semihost_sys_isatty(CPUState *cs, gdb_syscall_complete_cb complete,
+                         int fd);
+
 #endif /* SEMIHOSTING_SYSCALLS_H */
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index e7e568a77e..973b0a68ab 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -291,14 +291,8 @@ common_semi_flen_cb(CPUState *cs, target_ulong ret, target_ulong err)
  * do the work and return the required return value to the guest
  * via common_semi_cb.
  */
-typedef void sys_isattyfn(CPUState *cs, GuestFD *gf);
 typedef void sys_flenfn(CPUState *cs, GuestFD *gf);
 
-static void host_isattyfn(CPUState *cs, GuestFD *gf)
-{
-    common_semi_cb(cs, isatty(gf->hostfd), 0);
-}
-
 static void host_flenfn(CPUState *cs, GuestFD *gf)
 {
     struct stat buf;
@@ -310,11 +304,6 @@ static void host_flenfn(CPUState *cs, GuestFD *gf)
     }
 }
 
-static void gdb_isattyfn(CPUState *cs, GuestFD *gf)
-{
-    gdb_do_syscall(common_semi_cb, "isatty,%x", gf->hostfd);
-}
-
 static void gdb_flenfn(CPUState *cs, GuestFD *gf)
 {
     gdb_do_syscall(common_semi_flen_cb, "fstat,%x,%x",
@@ -338,32 +327,23 @@ static const uint8_t featurefile_data[] = {
     SH_EXT_EXIT_EXTENDED | SH_EXT_STDOUT_STDERR, /* Feature byte 0 */
 };
 
-static void staticfile_isattyfn(CPUState *cs, GuestFD *gf)
-{
-    common_semi_cb(cs, 0, 0);
-}
-
 static void staticfile_flenfn(CPUState *cs, GuestFD *gf)
 {
     common_semi_cb(cs, gf->staticfile.len, 0);
 }
 
 typedef struct GuestFDFunctions {
-    sys_isattyfn *isattyfn;
     sys_flenfn *flenfn;
 } GuestFDFunctions;
 
 static const GuestFDFunctions guestfd_fns[] = {
     [GuestFDHost] = {
-        .isattyfn = host_isattyfn,
         .flenfn = host_flenfn,
     },
     [GuestFDGDB] = {
-        .isattyfn = gdb_isattyfn,
         .flenfn = gdb_flenfn,
     },
     [GuestFDStatic] = {
-        .isattyfn = staticfile_isattyfn,
         .flenfn = staticfile_flenfn,
     },
 };
@@ -488,12 +468,7 @@ void do_common_semihosting(CPUState *cs)
 
     case TARGET_SYS_ISTTY:
         GET_ARG(0);
-
-        gf = get_guestfd(arg0);
-        if (!gf) {
-            goto do_badf;
-        }
-        guestfd_fns[gf->type].isattyfn(cs, gf);
+        semihost_sys_isatty(cs, common_semi_cb, arg0);
         break;
 
     case TARGET_SYS_SEEK:
diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index db8891535b..702541b270 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -151,6 +151,12 @@ static void gdb_lseek(CPUState *cs, gdb_syscall_complete_cb complete,
                    (target_ulong)gf->hostfd, off, (target_ulong)gdb_whence);
 }
 
+static void gdb_isatty(CPUState *cs, gdb_syscall_complete_cb complete,
+                       GuestFD *gf)
+{
+    gdb_do_syscall(complete, "isatty,%x", (target_ulong)gf->hostfd);
+}
+
 /*
  * Host semihosting syscall implementations.
  */
@@ -276,6 +282,13 @@ static void host_lseek(CPUState *cs, gdb_syscall_complete_cb complete,
     complete(cs, ret, err);
 }
 
+static void host_isatty(CPUState *cs, gdb_syscall_complete_cb complete,
+                        GuestFD *gf)
+{
+    int ret = isatty(gf->hostfd);
+    complete(cs, ret, ret ? 0 : errno_for_gdb());
+}
+
 /*
  * Static file semihosting syscall implementations.
  */
@@ -467,3 +480,26 @@ void semihost_sys_lseek(CPUState *cs, gdb_syscall_complete_cb complete,
         g_assert_not_reached();
     }
 }
+
+void semihost_sys_isatty(CPUState *cs, gdb_syscall_complete_cb complete, int fd)
+{
+    GuestFD *gf = get_guestfd(fd);
+
+    if (!gf) {
+        complete(cs, 0, GDB_EBADF);
+        return;
+    }
+    switch (gf->type) {
+    case GuestFDGDB:
+        gdb_isatty(cs, complete, gf);
+        break;
+    case GuestFDHost:
+        host_isatty(cs, complete, gf);
+        break;
+    case GuestFDStatic:
+        complete(cs, 0, GDB_ENOTTY);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
-- 
2.34.1


