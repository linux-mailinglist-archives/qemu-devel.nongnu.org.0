Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BBE572828
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 23:01:19 +0200 (CEST)
Received: from localhost ([::1]:51476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBN0Q-0007HL-9W
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 17:01:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMth-00060w-K3
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:54:21 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:54935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMtd-0007El-Vg
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:54:19 -0400
Received: by mail-wm1-x32a.google.com with SMTP id n185so5402488wmn.4
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 13:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n9WhOhgr7P/CViF7JEjJoV08CGw0IzkNTtlxYzXL+oY=;
 b=XjvwqA+vRPcQbvZLC6tR4L3UqfSXl4KtVN2tbXKmSTWGpQpv8OrnQa4i/KWtUd5knb
 BTC+bQU+aufhep/Kyia/ZulZCgmprEGPsHkJa5FZzLYgIxeyNmGcSd4rnxxlqdH55HKx
 2k+b+b8ew3SsSSDDMjrb4b3y0nyhKRi3Sew5AgGrJYOVOYwLjNjEhUAiHKbHsemgvATw
 D/iQuc6DOMxN3lXUKr9UnPPZBdghWfSy05iUKnpL5bQSxkYLjj2fVxkDyVqXRdyMluV5
 ZPDMxvfUO0mKYvQbEEeWb4UZV9XWLayGChNCK0Fx2ukRZS+Zp3mbs4JN5ASTYh4ykkm/
 uKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=n9WhOhgr7P/CViF7JEjJoV08CGw0IzkNTtlxYzXL+oY=;
 b=N0Ymy9IenWyz+XYbVXfHC3mt5gkhchnA/omdIZikDhduxIJdeIzLXQB8Svh8n5HR9w
 CD5iQO57/D+AFaHEKiDV2ymxlmrFyzW744zTD38dA9tlnNai6Yo9ubQhITS9pNBKfYeI
 1aCqHFMKy8+KNtWcSNk+PnovwhJz8e7Xage/01vxcA1Jr7+WYEcCCO2CBduD24KNsyqT
 4wQJ/rhtRhDFGYBv+dGYYAmaCUb/E14ijlOovA1HGDURnxPamJ6BiZWEssKmYTPgOKDo
 g3eDhUYj67f+2193Q6Qq/kQnZp/IWDXd9qvi2GkKvNpNbCQUwd+DWCJoOIIUJ5WsTXQR
 d0Kw==
X-Gm-Message-State: AJIora+PQDfgm/71b9JCb61FB3NltBAZCMUOrwcW6rIxhrcsUerqqBD8
 8aw0Zs9aueu069l5LaPnZ9Ks4vJW8R6VO4qT
X-Google-Smtp-Source: AGRyM1u+vFQ+hsLxohiwlm4e9kc8V76PRoQKMBngg0kRHSVusbRY8cYiiurDX0cfvf4gyD/2Kgimew==
X-Received: by 2002:a05:600c:4fd0:b0:3a2:b57b:2200 with SMTP id
 o16-20020a05600c4fd000b003a2b57b2200mr6047815wmq.197.1657659256362; 
 Tue, 12 Jul 2022 13:54:16 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 3-20020a05600c024300b003a1a02c6d7bsm18938wmj.35.2022.07.12.13.54.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Jul 2022 13:54:15 -0700 (PDT)
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 05/12] target/mips: Create report_fault for semihosting
Date: Tue, 12 Jul 2022 22:53:40 +0200
Message-Id: <20220712205347.58372-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712205347.58372-1-f4bug@amsat.org>
References: <20220712205347.58372-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The UHI specification does not have an EFAULT value,
and further specifies that "undefined UHI operations
should not return control to the target".

So, log the error and abort.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220628111701.677216-2-richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
2.36.1


