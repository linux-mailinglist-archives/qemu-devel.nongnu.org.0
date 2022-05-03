Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0830518FB9
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 23:09:01 +0200 (CEST)
Received: from localhost ([::1]:32946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlzlU-00083I-IW
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 17:09:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZm-0000Xo-6M
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:50 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:41905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZk-0006Mt-Ic
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:49 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 z5-20020a17090a468500b001d2bc2743c4so2917140pjf.0
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0KmR0I9MQL8sMij82tj+TGbywtXC8SOF01Vq62VNOXc=;
 b=bj978LCYcEKh12QBdn3r1wS7KagW1xp0uHsYD9BxBUJLXw83ImhdoDrGcndFTpFRaD
 VLIRHpU5DB9ImBOWN8yjes7VW/fYNDxR/toHvgiPNA79G3U0o9dyilUZTixnY2Ln8KZN
 p/Z9e/drfrwh8YGIbIuQMk4M7NYZVhfgBcCL0pCgcEpaQW5Zwpbt/MMfCdBfTCw6IJuS
 sQS02IjtvUeOGyYO5aBvZd8ygljdQWuERD7KPsvzaAgq9zduBheW7W16Edg0IBpAjB49
 BIEjEegpmzWwiIA1k+/8E75NI3XMRp7wkw0seJY6KU3Dmh71lMO2QoEx1m3c8hALWL6J
 9D7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0KmR0I9MQL8sMij82tj+TGbywtXC8SOF01Vq62VNOXc=;
 b=lBgWhiKwu0OlpmkV0qVSvR5TRYC3+RvnWxgGONAExV90eyir1lgCeb/b0GiytIjy3I
 8/byjARGg7Z1BueBCFUcjNNdeSLOORkUTfcXbImQxe/6y+ms2NftMBh4nQB0QFoQKFCq
 Qg/uTNt9jcHuchXpH4ZzDsaelzLKQGb+AxUT+1REC5xEJFHkmreBo5bWj0i/PMq2Q8XR
 yRD2FzisukcW2PYqhheJsga4t3QLfeWLOYcSjvCeREZbloCEBeGt5AinKGoXiptjLI8H
 UM526Qy/6sp6KBVBTOfKUcDDsOBGg9LlURhzg5mo3dkxhzKQvWyfkqanIaE0KGxEeQnV
 5uMQ==
X-Gm-Message-State: AOAM531m+pft/DquVNw8y0jcG9LD3PFgHILLR55WsOLlcxeH7oyHrkUD
 xYwqISd/5USB6nMc//z7s1HYyVSzdRYq/Q==
X-Google-Smtp-Source: ABdhPJy/Wzp6AEXSxxu8FVJPnEY1iZYZ7NhZns8luyHWofqv73FGrwE0H8eYYEwayNDX5OAGA0GbXA==
X-Received: by 2002:a17:90b:704:b0:1d7:367a:f16b with SMTP id
 s4-20020a17090b070400b001d7367af16bmr6541124pjz.197.1651607567332; 
 Tue, 03 May 2022 12:52:47 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 fz16-20020a17090b025000b001dbe11be891sm1692286pjb.44.2022.05.03.12.52.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:52:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 61/74] target/mips: Use error_report for UHI_assert
Date: Tue,  3 May 2022 12:48:30 -0700
Message-Id: <20220503194843.1379101-62-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
index d8c9be5e9f..df1747aafe 100644
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


