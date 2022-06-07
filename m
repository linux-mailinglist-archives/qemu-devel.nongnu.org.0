Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD67541EE5
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:37:19 +0200 (CEST)
Received: from localhost ([::1]:43020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyhp8-0004jl-Qz
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:37:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5x-0007eg-Ad
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:33 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:34774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5u-0001ZW-EC
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:33 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 mh16-20020a17090b4ad000b001e8313301f1so8479569pjb.1
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=m29THT8oiVBS6TamWun4OZTko5yiLk5msUbdr5P5elM=;
 b=kTYJz4vRwMKrVvMsUDplC7WIab0geERoBwU+IoGEgiwXWsnKGalFZY+nfHqlz9Nbu1
 D3wD4iRoDFTbgmMCyncpl64fx44dp54kKmcYOlmNpSnYgM+YmdHANmbmBhfFc6UXiHMm
 /Orw+X4T2gGzQF4HzC24J0v8OumJFsmueJbYyA/WRTqN6eSUU7BJIrQjmHlkoLGPyZAv
 Sktm4By1oG81HDuX1fZ0uBPIAbcm0Pu9MnJrBXLiwhxGrUqaK+bhUcqseK2zatRBKiEL
 8yO7nu1hmDTo8nNZhRyObF1FMKYXzG7cKhH35CmD76onBfWO1wgR64Ej4p70COadf/Pw
 o+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m29THT8oiVBS6TamWun4OZTko5yiLk5msUbdr5P5elM=;
 b=Fr0jt4OKaVRxMeX+qPviN4xdK01dXfFQvMlvBsztX/voBiUzk9Ll5hsuMuSzTNQrU5
 vEXl+umtlxMYSnTOWbAdZxaJmcce6TBl5KjkgjtUm5UC30QMqxblB01rTm/vY82WQmES
 Ssj4jRN4X3jztNB42aL1lxoRVpmuTBl0zL3i/quXF1Qm5yJEpo/uIVm0QDlzr8fEBhpe
 s8INM8zfZuo28KvwzzzIyMWzBJNZrg1RrdRrh2sEvZE98vAVTea57ml3ibi+iB5mw2k2
 6SFyHW1PdXPFJJuDScNBMfOQd2Mep98Z7ycw4H0QEfJTfAQOjSbHoW6mFPYXZ8O8U7BK
 DYjA==
X-Gm-Message-State: AOAM530Q7tNhlaou00Oh9EVZ1p3o1eSSjcAhEu2xdkZSSA7cwmPfKNre
 g6YXlLH4cMtZqOx0y8c8+XszgxmgNrYLog==
X-Google-Smtp-Source: ABdhPJwWUAZZEx9sh8UHbVEsQajbL51BSC+FSKMotVAiAWIhTLE2iLH7WuzzNIKY1kFl5e1hW1LeXA==
X-Received: by 2002:a17:902:e54c:b0:166:6322:e747 with SMTP id
 n12-20020a170902e54c00b001666322e747mr25117212plf.151.1654634789006; 
 Tue, 07 Jun 2022 13:46:29 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a170902be0600b00162037fbacdsm12971279pls.187.2022.06.07.13.46.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:46:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 33/53] semihosting: Split out semihost_sys_isatty
Date: Tue,  7 Jun 2022 13:45:37 -0700
Message-Id: <20220607204557.658541-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

Add a common_semi_istty_cb helper to translate the Posix
error return, 0+ENOTTY, to the Arm semihosting not-a-file
success result.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/syscalls.h |  3 +++
 semihosting/arm-compat-semi.c  | 40 ++++++++++++----------------------
 semihosting/syscalls.c         | 36 ++++++++++++++++++++++++++++++
 3 files changed, 53 insertions(+), 26 deletions(-)

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
index 8c6c39daf5..4529c9df06 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -247,6 +247,19 @@ static void common_semi_rw_cb(CPUState *cs, target_ulong ret, target_ulong err)
     common_semi_set_ret(cs, arg2 - ret);
 }
 
+/*
+ * Convert from Posix ret+errno to Arm SYS_ISTTY return values.
+ * With gdbstub, err is only ever set for protocol errors to EIO.
+ */
+static void common_semi_istty_cb(CPUState *cs, target_ulong ret,
+                                 target_ulong err)
+{
+    if (err) {
+        ret = (err == ENOTTY ? 0 : -1);
+    }
+    common_semi_cb(cs, ret, err);
+}
+
 /*
  * SYS_SEEK returns 0 on success, not the resulting offset.
  */
@@ -291,14 +304,8 @@ common_semi_flen_cb(CPUState *cs, target_ulong ret, target_ulong err)
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
@@ -310,11 +317,6 @@ static void host_flenfn(CPUState *cs, GuestFD *gf)
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
@@ -338,32 +340,23 @@ static const uint8_t featurefile_data[] = {
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
@@ -488,12 +481,7 @@ void do_common_semihosting(CPUState *cs)
 
     case TARGET_SYS_ISTTY:
         GET_ARG(0);
-
-        gf = get_guestfd(arg0);
-        if (!gf) {
-            goto do_badf;
-        }
-        guestfd_fns[gf->type].isattyfn(cs, gf);
+        semihost_sys_isatty(cs, common_semi_istty_cb, arg0);
         break;
 
     case TARGET_SYS_SEEK:
diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index 9e3eb464b5..1f1baf7e2d 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -121,6 +121,12 @@ static void gdb_lseek(CPUState *cs, gdb_syscall_complete_cb complete,
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
@@ -246,6 +252,13 @@ static void host_lseek(CPUState *cs, gdb_syscall_complete_cb complete,
     complete(cs, ret, err);
 }
 
+static void host_isatty(CPUState *cs, gdb_syscall_complete_cb complete,
+                        GuestFD *gf)
+{
+    int ret = isatty(gf->hostfd);
+    complete(cs, ret, ret ? 0 : errno);
+}
+
 /*
  * Static file semihosting syscall implementations.
  */
@@ -437,3 +450,26 @@ void semihost_sys_lseek(CPUState *cs, gdb_syscall_complete_cb complete,
         g_assert_not_reached();
     }
 }
+
+void semihost_sys_isatty(CPUState *cs, gdb_syscall_complete_cb complete, int fd)
+{
+    GuestFD *gf = get_guestfd(fd);
+
+    if (!gf) {
+        complete(cs, 0, EBADF);
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
+        complete(cs, 0, ENOTTY);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
-- 
2.34.1


