Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB5455C09D
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 13:19:38 +0200 (CEST)
Received: from localhost ([::1]:38724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o69Fp-0005p2-Ta
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 07:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o69DW-0003bP-Sg
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:17:14 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:34517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o69DV-0003Au-9U
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:17:14 -0400
Received: by mail-pl1-x633.google.com with SMTP id jh14so10789696plb.1
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 04:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zerCkHOdwKIBilTQCtBXa5Y3gI08+JACKBxg6I39kUQ=;
 b=ZlAM4Rw6H4MrIzKVS9yfMRhMGN1jqF4P5Y98hGgPfM0ntYCf7q2h4gHN70n6oWoBp9
 V6Gzm5tfRsNy9ylnEWw28LqLytT9+yHYmNOKkkWY8b8+VxAN0mNqx51tgYSGVubWlZpS
 oVcDLB124aMITc46mHwCwYtVKyjAkmWNJFwS5314TVXthwKAQcJxJanl8kLbjbkY52ab
 34D4TKx0nCw26Pi4Bw6nCUi+lhjF2qagmmGQd2ViMZnECdTg2UzJ5LmWxBOiu49p7Bml
 KV1T6s46Ls1Xro+jNjh3iPbJpYZFsDHTVQd+1JPBkeTFfPagS0460gM6kwiKBgAVdrzQ
 jYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zerCkHOdwKIBilTQCtBXa5Y3gI08+JACKBxg6I39kUQ=;
 b=hCQM7NrPKxF3IcAI048vWH5XUuZxfdgiALXrn3R/HUG8BmNm1ICzBhbWivWF38Squt
 JSNhV9ZiW3uzGrG6QfCd4lnqKmDHwEW/oTR/UA0yCKzQqc1NFWyPciIkJr5SKWn4dyR9
 hQbWuewEqiqQ+LoxpF4YNf3X/DWrVmtY7qUUjzOxaj9rIwwY1FxJNouyGx6ZzoNWAzMS
 /EBKgQnCjQLB+wbSxninjC0rYp3VjTi2NXYIm+1jeci5Jw+xfLVa3T3uzXp+02vxD2aV
 llJEnAIxv8+yCKOlL2O7yiwxJNMxYI+S648Qn79hP87EdVW0XtWHLTgHPN41yRy8kaWH
 iZCA==
X-Gm-Message-State: AJIora9vVkp3HsMdVlrqocjDOspB7UfBd0u5NSt6fx37k8dSWGfogs5K
 PIR+trsyDyF08XiFsBbzxFrOImHqa8y2Ig==
X-Google-Smtp-Source: AGRyM1t9Pi2swKFlRe3wJrGg7n7QvXsDboGCciQ/VIjfvpi/B4ptnjfBqRp8UYY4qb08Xad/vf/93g==
X-Received: by 2002:a17:902:d718:b0:168:d9df:4f1c with SMTP id
 w24-20020a170902d71800b00168d9df4f1cmr4306171ply.41.1656415031792; 
 Tue, 28 Jun 2022 04:17:11 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 a8-20020a654188000000b003fd4831e6fesm9079283pgq.70.2022.06.28.04.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 04:17:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, alex.bennee@linaro.org, jiaxun.yang@flygoat.com,
 aleksandar.rikalo@syrmia.com
Subject: [PATCH v5 1/8] target/mips: Create report_fault for semihosting
Date: Tue, 28 Jun 2022 16:46:54 +0530
Message-Id: <20220628111701.677216-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628111701.677216-1-richard.henderson@linaro.org>
References: <20220628111701.677216-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

The UHI specification does not have an EFAULT value,
and further specifies that "undefined UHI operations
should not return control to the target".

So, log the error and abort.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/sysemu/mips-semi.c | 33 ++++++++++++++----------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
index 67c35fe7f9..153df1fa15 100644
--- a/target/mips/tcg/sysemu/mips-semi.c
+++ b/target/mips/tcg/sysemu/mips-semi.c
@@ -114,6 +114,13 @@ enum UHIErrno {
     UHI_EXDEV           = 18,
 };
 
+static void report_fault(CPUMIPSState *env)
+{
+    int op = env->active_tc.gpr[25];
+    error_report("Fault during UHI operation %d", op);
+    abort();
+}
+
 static int errno_mips(int host_errno)
 {
     /* Errno values taken from asm-mips/errno.h */
@@ -136,8 +143,7 @@ static int copy_stat_to_target(CPUMIPSState *env, const struct stat *src,
     hwaddr len = sizeof(struct UHIStat);
     UHIStat *dst = lock_user(VERIFY_WRITE, vaddr, len, 0);
     if (!dst) {
-        errno = EFAULT;
-        return -1;
+        report_fault(env);
     }
 
     dst->uhi_st_dev = tswap16(src->st_dev);
@@ -188,8 +194,7 @@ static int write_to_file(CPUMIPSState *env, target_ulong fd,
     int num_of_bytes;
     void *dst = lock_user(VERIFY_READ, vaddr, len, 1);
     if (!dst) {
-        errno = EFAULT;
-        return -1;
+        report_fault(env);
     }
 
     num_of_bytes = write(fd, dst, len);
@@ -204,8 +209,7 @@ static int read_from_file(CPUMIPSState *env, target_ulong fd,
     int num_of_bytes;
     void *dst = lock_user(VERIFY_WRITE, vaddr, len, 0);
     if (!dst) {
-        errno = EFAULT;
-        return -1;
+        report_fault(env);
     }
 
     num_of_bytes = read(fd, dst, len);
@@ -220,7 +224,7 @@ static int copy_argn_to_target(CPUMIPSState *env, int arg_num,
     int strsize = strlen(semihosting_get_arg(arg_num)) + 1;
     char *dst = lock_user(VERIFY_WRITE, vaddr, strsize, 0);
     if (!dst) {
-        return -1;
+        report_fault(env);
     }
 
     strcpy(dst, semihosting_get_arg(arg_num));
@@ -233,9 +237,7 @@ static int copy_argn_to_target(CPUMIPSState *env, int arg_num,
     do {                                        \
         p = lock_user_string(addr);             \
         if (!p) {                               \
-            gpr[2] = -1;                        \
-            gpr[3] = EFAULT;                    \
-            return;                             \
+            report_fault(env);                  \
         }                                       \
     } while (0)
 
@@ -243,16 +245,11 @@ static int copy_argn_to_target(CPUMIPSState *env, int arg_num,
     do {                                                \
         p = lock_user_string(addr);                     \
         if (!p) {                                       \
-            gpr[2] = -1;                                \
-            gpr[3] = EFAULT;                            \
-            return;                                     \
+            report_fault(env);                          \
         }                                               \
         p2 = lock_user_string(addr2);                   \
         if (!p2) {                                      \
-            unlock_user(p, addr, 0);                    \
-            gpr[2] = -1;                                \
-            gpr[3] = EFAULT;                            \
-            return;                                     \
+            report_fault(env);                          \
         }                                               \
     } while (0)
 
@@ -375,7 +372,7 @@ void mips_semihosting(CPUMIPSState *env)
         break;
 #endif
     default:
-        fprintf(stderr, "Unknown UHI operation %d\n", op);
+        error_report("Unknown UHI operation %d", op);
         abort();
     }
     return;
-- 
2.34.1


