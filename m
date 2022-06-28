Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB7755BF47
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 09:57:45 +0200 (CEST)
Received: from localhost ([::1]:52508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o666S-0004wy-L1
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 03:57:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63G9-0003bi-Jk
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:55:33 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:45990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63G7-0000FM-Ct
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:55:32 -0400
Received: by mail-pf1-x42a.google.com with SMTP id 128so10916483pfv.12
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N4HA6P3LhSfjOwoWfaJXDw0oNNYju2wXfDZ+QMa3+ug=;
 b=cRuIinTNBgorQM6jGfSD1MdnylEjYdekm+RlbjoCDJWnLRCadZmrPC8xSOiVgS8g5Z
 ysnFeHLDxhsxqTNVVShvRvfVNb2nTIUTUikN03d07CsJ4W3BMXHSThNiDjzfqd4bBRuB
 mh+ZAAynGORRIHyF8lTcDtBIsrv9XLA+yChlMWlZlwpb673j+mIttMH1lA/Dl0I0Cmpz
 tLes+ExYT/Y7r875aKUoAFSx6XFSwwXxBAUVvwR5eB5UAzj81WVM2S9UrPaqtIb9T5kt
 pq4f8UVvzhB3TKuuV+VbP/Hl7o+GJMHvCxFwODi1u2TBJOPkzJqW9T8JEhb1twB5+qHD
 5uwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N4HA6P3LhSfjOwoWfaJXDw0oNNYju2wXfDZ+QMa3+ug=;
 b=Z5a40b+hIzzbJVwtR7K9w9xEIFvCZqBRhTdX9O7CN2BlJAqj/P6D3c78rWjCDALbVI
 ixYxdAApVPCliXt6evnuvOJ2YTUTAVBUIQvE80I9sbDYJbAqEtxeYOUn0Gid71wRAkx6
 jm8MQAwxswGxzLpUvWyLaySQwfyXpNq234qSlRlwtinBjpqts9QzTfSswvhursfufJBQ
 lRB9zv9DQPrXsfs5DqX6ZfChNVaCWrVxAb93xZNZCk2mhgqHb5hpVIKF1AnQOD5gFzpl
 9AmNBFmvxABx4pOD9BPcXM79zsgDoR/QboqcuNuABBV0+p82Bop2yopYsFXZbLp9fBYr
 IHtA==
X-Gm-Message-State: AJIora9HqSkjrQSh/mtdn37stMGjz5S935U6qBh4lM30T5dd+ae9vqxH
 qnd4bRwkvhsX/2DqsNQISATvOd/wOmAbmQ==
X-Google-Smtp-Source: AGRyM1sH16FEE1RdmHvmBprC+UFyoPaHPJrOCB242n+cRbUF2E9EdCL29Nu8xJYwE+Z52jSkvadsxA==
X-Received: by 2002:a63:7c3:0:b0:40d:5dc5:f9f0 with SMTP id
 186-20020a6307c3000000b0040d5dc5f9f0mr15529137pgh.524.1656392129985; 
 Mon, 27 Jun 2022 21:55:29 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 w8-20020a1709026f0800b00168c523032fsm8073735plk.269.2022.06.27.21.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:55:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Luc Michel <lmichel@kalray.eu>
Subject: [PULL 33/60] semihosting: Split out semihost_sys_isatty
Date: Tue, 28 Jun 2022 10:23:36 +0530
Message-Id: <20220628045403.508716-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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

Reviewed-by: Luc Michel <lmichel@kalray.eu>
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
index a117d180bc..3cdc2b6efc 100644
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
@@ -489,12 +482,7 @@ void do_common_semihosting(CPUState *cs)
 
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


