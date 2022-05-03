Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAA5518E73
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:13:15 +0200 (CEST)
Received: from localhost ([::1]:38302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlytW-0005Vl-1S
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:13:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyWN-00023v-H8
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:19 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:44578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyWK-0003bc-Ut
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:18 -0400
Received: by mail-pg1-x533.google.com with SMTP id v10so14780190pgl.11
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=aRj/gsSJXACdFyaGcT2laC3B2huL8t1HBP8Z66LM2pw=;
 b=wfVe2b6BVPS3lrgWnWwTD5DBclT+fgGrVfvQKWMGJmQCvYQCvamoWa5OBgyqKOo2Jg
 xXbOsHPdMtkuUSOTKDwyV+h3f/2RByjYY7SfBBmA6Ve0vSN9l6FeE7e/lMZzA6pLWRvJ
 uAwKgl2GB5NE86kulpDaFwRjBIYsnAmJhTS/wkg1R7OxOWEY3fz90M9mGNBMcGDMQ1Ir
 y5EubGp1PeHARMk5tzOzgWX7s47SOeGmMHsCtlXDALq8hT+JaveYBSEWBzEOS8WzqK7+
 UxycZdavT8CQIsOlk60+/LfdoGv+yIFPbiJzNw7NnMp3R8v3FBpCvwdXU7187vRDPgSy
 HsBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aRj/gsSJXACdFyaGcT2laC3B2huL8t1HBP8Z66LM2pw=;
 b=cYUZEzkNxWFp/sl5Pq65T7bDMjW54nwPBMQgI1Mk5Np/pfoPF3jQ9Mk2cIk0U5Aebx
 T49F6/0dNXkOrHHYXlH2ssndtTWNByNwN7SF2b8Qgzugc8yEIa9Lb98LGJl+5MXdkSLq
 7W+OA6lqYkejEwKO0LF2k5JFIRGs/6jJ4qogP8uFim0dF5TMTd1+0tbgMgVJ35VVn3lU
 LBFmEj2Lw4FE23hfB2P0qFhxYHSpF8lxgpPbSvu55WgT32RVhtG4HCCdyQCOT/GL9B5/
 u+uR8eF2k1kN8ohfdgaY3JP1zBoQ/hN+TESup5SBIC1mBTy16LbrSn3vd1auFLU4Mwl6
 IfcQ==
X-Gm-Message-State: AOAM531pGI03YGqx9xJTfvgoz4mSn2KfGGfJLFDKowkZoym7gdcQs2rx
 lpy/nK+dt72RINgWVLt40+s11P5HKeI6cQ==
X-Google-Smtp-Source: ABdhPJyq10YHqDhRfiOgCDpO/SXGlKckHwsVJdatDLD8cqNeH4DUzlRpMFIDzXr91kwmRQnziTXv0A==
X-Received: by 2002:a65:6e8b:0:b0:3ab:a3fb:e95a with SMTP id
 bm11-20020a656e8b000000b003aba3fbe95amr14988109pgb.433.1651607352813; 
 Tue, 03 May 2022 12:49:12 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 p11-20020a17090ad30b00b001cd4989fed3sm1712383pju.31.2022.05.03.12.49.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:49:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 27/74] semihosting: Split out semihost_sys_isatty
Date: Tue,  3 May 2022 12:47:56 -0700
Message-Id: <20220503194843.1379101-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
index 6f97977edf..8fcef02386 100644
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


