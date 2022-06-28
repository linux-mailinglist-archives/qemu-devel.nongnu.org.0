Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0878355C0A0
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 13:22:37 +0200 (CEST)
Received: from localhost ([::1]:44448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o69Ii-0001Nd-37
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 07:22:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o69Dj-0003y5-Ah
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:17:27 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:37403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o69Dh-0003Bm-NB
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:17:27 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 w19-20020a17090a8a1300b001ec79064d8dso15537511pjn.2
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 04:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RM42zMRkI421HiARyMb/O/C2Vq6+9jMrjOfzX4mv7Y0=;
 b=cU0PyAXUIoTGSUk7MjTJZ4mp1Q4jyymWRtcVPJXvfmLXnSHpX4oId/WQUjM7C3sRUD
 W3OglN1oNE7/0EPIm+JRVOialsvm3myc3l9zD/bLT0X/NFW3uyN9tSCYpMNptZ/Jd+aP
 OV3HrzGjYSjbhxWbtqQpK9gTDLiNIp3OS2n9oUmlYEhVzCXdroTpzjCWvWIniwDUba4E
 89So3XA1R6cYMkYKcWPYtEl6QuIWM/vWYNyA72qDYviHdgy/uQ+CSU7RivMD0f0nOWOE
 bjqDN/taODhyruZUMeZkbcvufeoKnJmajcyK6GKnvvcFGdP9lPeFuMN9cWrHTzQ0sGJV
 Tqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RM42zMRkI421HiARyMb/O/C2Vq6+9jMrjOfzX4mv7Y0=;
 b=OdJ6Ixs/Y3iPQzgrkGUVg1s6S5sBTbRe8uNrJy2nOSW1wUfg5/5dAbEk2cmghnLzWj
 eQeULa2qPcu6Xs7w6Do4/30lc2bq+0IddvXlzA4LhyjGEmdFqNpTdr82Uu7HL4ldekTt
 IY/8GLFyWwp3siCx64ItWWvimMtueZLtt0/Ywat3kleC34TZbtjts8b5RTT1BE479R7v
 MKHsS0IQiygPEx0df0O7KUy/OcWrCzujVBph5puTe/Prwx0FUgYAE90A4pSVhKECV25q
 BvPnToK7p01+1xDsE5jmfAlzOyidKXOSc6BO/ADAi/vUPge3JVkSQfJH7ra4uUY2qi/m
 hf6A==
X-Gm-Message-State: AJIora9PpdwJaUqS290X+p2stl6ng4IuR1WCg5CDJmNEfrWVbX48lnvk
 UbzIYA7Tz5vU+LlogMmammQtDi0j7t6MZQ==
X-Google-Smtp-Source: AGRyM1ufo+O+kBQNzbrNUvm/Ry+BWkcWjmxsAhOgWZ7LCDKHLFLev4/C4zvioQtofT28MvVfixxSHg==
X-Received: by 2002:a17:902:f34a:b0:16a:e2d:3e9 with SMTP id
 q10-20020a170902f34a00b0016a0e2d03e9mr3251665ple.95.1656415044423; 
 Tue, 28 Jun 2022 04:17:24 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 a8-20020a654188000000b003fd4831e6fesm9079283pgq.70.2022.06.28.04.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 04:17:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, alex.bennee@linaro.org, jiaxun.yang@flygoat.com,
 aleksandar.rikalo@syrmia.com
Subject: [PATCH v5 5/8] target/mips: Use error_report for UHI_assert
Date: Tue, 28 Jun 2022 16:46:58 +0530
Message-Id: <20220628111701.677216-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628111701.677216-1-richard.henderson@linaro.org>
References: <20220628111701.677216-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

Always log the assert locally.  Do not report_fault, but
instead include the fact of the fault in the assertion.
Don't bother freeing allocated strings before the abort().

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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
2.34.1


