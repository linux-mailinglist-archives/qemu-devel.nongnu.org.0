Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E9E572837
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 23:04:02 +0200 (CEST)
Received: from localhost ([::1]:56128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBN33-00025y-4o
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 17:04:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMu1-0006Jm-VL
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:54:41 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:41521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMu0-0007H5-FS
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:54:41 -0400
Received: by mail-wr1-x432.google.com with SMTP id q9so12826830wrd.8
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 13:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a+TbjQCV2xLA3zQIhvHGy53Lrzpawukh7l0Zf+LYs0I=;
 b=gEXAqPV+06vVfeG/juMBKje9J+k35r1OB9tC1z7sREhxx9HQKAjoZqHWLRFDBuWZr5
 OnubCaL/sO06d7jJHipwGHKD5ydXU+0s/4f1OS+nA3jDOzmxdrdgJbBYXDl5gDXPFjaa
 VDr3tbSIwQqUVoGJ1DiN6jeVEnvHM0sbSd+hwCnCb4H+THBmkA5uka9sgz/KSm3w0ogO
 F4JBcP15kWR48HnBuKCNJrOYtT0H62m7kmuUrVBVAuDScS7jL551xxYsEo73JnBkz3Cd
 lkpOcAcm533Lm8HwKqMnIy5vbDqhJuO4xdPM/+fHg5Q1/YJTOJ9okvjORZ6lz6CV3Ho2
 6nxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=a+TbjQCV2xLA3zQIhvHGy53Lrzpawukh7l0Zf+LYs0I=;
 b=WnuEvJYNeMNJd9G2mP64qTrYk2LRDC473+RZcnprJiW6W+HaOjzbcCOJuAvXEvtMfh
 6x5aGJhOG3M15c6f0uXdW0VIwwx3WLCs6OXJQSyWLBEF8LARPoqeP2IMoBB9bBlNOlSh
 /2LbzDymfHAdqn1bjHDGZ7RzRlqQ/GZSc7PO6CpI8EIT2PzkUIQURxZ4IIAghmTd4I2A
 shmB1fGYUTeo6KAH+COhJxsGu11DT9AEZea2LFjeM+Gmn8N8puFAt/IsbYdviQmiwgyD
 fzFiyYV7K9RW9H1CCTWA2C87vBuP9j/eAk4cQBdBmcKIOTO37S+PutL1YnQTHMyZTEgy
 qfsw==
X-Gm-Message-State: AJIora8qJuKeVhZAzusf+L18WPLsgN9K1vxZ3vuBB6pvDUguUY4FbAMe
 G6rolF2YwIBuT22QZNrMhye3y7533OLL64wP
X-Google-Smtp-Source: AGRyM1uzxbLxO9Go3aMytro/+xo0MmP+6UjIqTQzTSjin4QrdIzW03yAjNbguVzxOBWyXDAdaOPjlQ==
X-Received: by 2002:a5d:64ce:0:b0:21d:a952:31d5 with SMTP id
 f14-20020a5d64ce000000b0021da95231d5mr10013137wri.667.1657659278779; 
 Tue, 12 Jul 2022 13:54:38 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n31-20020a05600c501f00b003a2c7bf0497sm82801wmr.16.2022.07.12.13.54.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Jul 2022 13:54:38 -0700 (PDT)
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 09/12] target/mips: Use error_report for UHI_assert
Date: Tue, 12 Jul 2022 22:53:44 +0200
Message-Id: <20220712205347.58372-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712205347.58372-1-f4bug@amsat.org>
References: <20220712205347.58372-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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

Always log the assert locally.  Do not report_fault, but
instead include the fact of the fault in the assertion.
Don't bother freeing allocated strings before the abort().

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220628111701.677216-6-richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/sysemu/mips-semi.c | 39 ++++++++++++++----------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
index ad11a46820..ae4b8849b1 100644
--- a/target/mips/tcg/sysemu/mips-semi.c
+++ b/target/mips/tcg/sysemu/mips-semi.c
@@ -221,18 +221,6 @@ static int copy_argn_to_target(CPUMIPSState *env, int arg_num,
         }                                       \
     } while (0)
 
-#define GET_TARGET_STRINGS_2(p, addr, p2, addr2)        \
-    do {                                                \
-        p = lock_user_string(addr);                     \
-        if (!p) {                                       \
-            report_fault(env);                          \
-        }                                               \
-        p2 = lock_user_string(addr2);                   \
-        if (!p2) {                                      \
-            report_fault(env);                          \
-        }                                               \
-    } while (0)
-
 #define FREE_TARGET_STRING(p, gpr)              \
     do {                                        \
         unlock_user(p, gpr, 0);                 \
@@ -243,7 +231,7 @@ void mips_semihosting(CPUMIPSState *env)
     CPUState *cs = env_cpu(env);
     target_ulong *gpr = env->active_tc.gpr;
     const UHIOp op = gpr[25];
-    char *p, *p2;
+    char *p;
 
     switch (op) {
     case UHI_exit:
@@ -355,14 +343,23 @@ void mips_semihosting(CPUMIPSState *env)
         break;
 
     case UHI_assert:
-        GET_TARGET_STRINGS_2(p, gpr[4], p2, gpr[5]);
-        printf("assertion '");
-        printf("\"%s\"", p);
-        printf("': file \"%s\", line %d\n", p2, (int)gpr[6]);
-        FREE_TARGET_STRING(p2, gpr[5]);
-        FREE_TARGET_STRING(p, gpr[4]);
-        abort();
-        break;
+        {
+            const char *msg, *file;
+
+            msg = lock_user_string(gpr[4]);
+            if (!msg) {
+                msg = "<EFAULT>";
+            }
+            file = lock_user_string(gpr[5]);
+            if (!file) {
+                file = "<EFAULT>";
+            }
+
+            error_report("UHI assertion \"%s\": file \"%s\", line %d",
+                         msg, file, (int)gpr[6]);
+            abort();
+        }
+
     default:
         error_report("Unknown UHI operation %d", op);
         abort();
-- 
2.36.1


