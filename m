Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEA45855F9
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 22:16:08 +0200 (CEST)
Received: from localhost ([::1]:49880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHWOr-0005tr-FA
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 16:15:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHWNI-0004G3-U4
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 16:14:20 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:35518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHWNH-00007Q-Bf
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 16:14:20 -0400
Received: by mail-pf1-x436.google.com with SMTP id c139so5557305pfc.2
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 13:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5FfBgNZsEiZ6EuArh07NVhiDMbZUBp97lGu6eNi5woU=;
 b=u3TgDmz+xisgJcxD1cR088e1uS/Ui5qd4Evf6tAKmRrYXGy31FxuKQZhq6McRkqF1Q
 zcbH3odJtahuCGGEyWAFBiBOAy3FpNPMy37MRJ8zXTplQ7Ax2cnJSbtRN4Wi2jMKeczM
 vfaxvKIFxrKdH12bA64Ek2pyAxUdwVgw1IDGpHxmpLba6m7B+iczwiSPO08u9Rj9lBg1
 P978GQgdpVb+MSpOkxFMWB55KV5e79V7fEduBExY7Xlr0u+hPrpeiI+1tj0XKPmKrySs
 0cmwlF4kFIMFt9kaKnMVhb1ph3MCWLRb9EyAQjYcznLjcY4JhDFOlWwtwSrLlNWZZml1
 y3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5FfBgNZsEiZ6EuArh07NVhiDMbZUBp97lGu6eNi5woU=;
 b=n4lelmCSgnkoNy3OSkcOoP/eAJj029LRLWZmgYlOESjoECU8PSpw2aB6dT9yHp1P4z
 X3MirtGT0SaR1EIwo5NC2W4L14n3PtO03vDcOcLXvfh7upFLByB5Ub1QYnFR5itk2S4Q
 CMQ0X2A3J71Ve1gQnUKXgsAFaGSh7pry772k6QmK+TYV0O6iRjI0ownn8OIWUbYgOZfv
 RzPpXuNf/12fUpJmln8+wEnG7I3XfqB7Q7WdcY3Ad2afjEFOMunCQWLn7woe3F1JbgEr
 E6HAyZQpOJXtwJJ3D76XCTqMisLAqGwXXJtsOXTtiNqCtclRGsSq8xDzeRr0O1be+IAI
 U6BA==
X-Gm-Message-State: AJIora9nl+yk6ZO5RAwxevsUOkRXMCmrc3fMeNZZdvfBckcIF5MpdlKB
 0SHL/JgW07OxDxZ9+QrGchYLkdytJsutDA==
X-Google-Smtp-Source: AGRyM1sKHW5G4zblfjvsy2XynV8L1/EWWDJE3mqQZJ5wtp5VDa+5FpuXQu7xGktyttxK4hgRrzmcAw==
X-Received: by 2002:a63:1f58:0:b0:41a:27e8:d669 with SMTP id
 q24-20020a631f58000000b0041a27e8d669mr4280555pgm.74.1659125657326; 
 Fri, 29 Jul 2022 13:14:17 -0700 (PDT)
Received: from stoup.. ([2602:ae:1549:801:a427:660:88d4:8559])
 by smtp.gmail.com with ESMTPSA id
 d65-20020a621d44000000b00517c84fd24asm3367153pfd.172.2022.07.29.13.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 13:14:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH] linux-user: Implement faccessat2
Date: Fri, 29 Jul 2022 13:14:14 -0700
Message-Id: <20220729201414.29869-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

Split out do_faccessat2 helper, and use it for
accessat and faccessat as well.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Will we ever have a system libc for which __NR_faccessat2 is present,
but faccessat() does not try faccessat2 first?

r~
---
 linux-user/syscall.c | 44 +++++++++++++++++++++++++++++++-------------
 1 file changed, 31 insertions(+), 13 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index b27a6552aa..acd8452048 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8530,6 +8530,30 @@ static int do_getdents64(abi_long dirfd, abi_long arg2, abi_long count)
 _syscall2(int, pivot_root, const char *, new_root, const char *, put_old)
 #endif
 
+static int do_faccessat2(int dirfd, abi_ptr pathname, int mode, int flags)
+{
+    char *p = lock_user_string(pathname);
+    bool nosys = true;
+    int ret;
+
+    if (!p) {
+        return -TARGET_EFAULT;
+    }
+
+    /* Use the raw host syscall if possible, in case we have an old libc. */
+#ifdef __NR_faccessat2
+    ret = syscall(__NR_faccessat2, dirfd, p, mode, flags);
+    nosys = ret < 0 && errno == ENOSYS;
+#endif
+    /* If we don't have the syscall, defer to libc emulation. */
+    if (nosys) {
+        ret = faccessat(dirfd, p, mode, flags);
+    }
+
+    unlock_user(p, pathname, 0);
+    return get_errno(ret);
+}
+
 /* This is an internal helper for do_syscall so that it is easier
  * to have a single return point, so that actions, such as logging
  * of syscall results, can be performed.
@@ -9058,21 +9082,15 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
 #endif
 #ifdef TARGET_NR_access
     case TARGET_NR_access:
-        if (!(p = lock_user_string(arg1))) {
-            return -TARGET_EFAULT;
-        }
-        ret = get_errno(access(path(p), arg2));
-        unlock_user(p, arg1, 0);
-        return ret;
+        return do_faccessat2(AT_FDCWD, arg1, arg2, 0);
 #endif
-#if defined(TARGET_NR_faccessat) && defined(__NR_faccessat)
+#ifdef TARGET_NR_faccessat
     case TARGET_NR_faccessat:
-        if (!(p = lock_user_string(arg2))) {
-            return -TARGET_EFAULT;
-        }
-        ret = get_errno(faccessat(arg1, p, arg3, 0));
-        unlock_user(p, arg2, 0);
-        return ret;
+        return do_faccessat2(arg1, arg2, arg3, 0);
+#endif
+#ifdef TARGET_NR_faccessat2
+    case TARGET_NR_faccessat2:
+        return do_faccessat2(arg1, arg2, arg3, arg4);
 #endif
 #ifdef TARGET_NR_nice /* not on alpha */
     case TARGET_NR_nice:
-- 
2.34.1


