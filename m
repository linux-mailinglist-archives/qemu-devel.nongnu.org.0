Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C10541EF3
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:39:26 +0200 (CEST)
Received: from localhost ([::1]:48446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyhrA-0008Ly-Co
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:39:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5q-0007KW-3k
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:26 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:51024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5n-0001TU-WB
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:25 -0400
Received: by mail-pj1-x1033.google.com with SMTP id e24so16726291pjt.0
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q02gLvDTypu1IqXBxqUwd894XkIlOvDDNDcpgAlYDsE=;
 b=HyrAXwgvl/td8bZE2qQppBm95E/JcwLC8mVBvK6VAcGv3c0dkVRccxllD6RkPj2uSp
 a5ykA4bsjyQ6XnA5jm44mOCkoKilaNw6q4AHNGJTiHEkPizTx0SlURmlVicQ8LsMdHC5
 8TXl6xURuerx34Fx7hDXWSz83vg4QSUxra8XKV09Cpr7V/joPX/w/ryW247+5eWBMJga
 7QxF2pI580tDdaqH86StAiZNav4C8UlKq9MTcid5HRI8zvFoTWRLPIJT8ZfjPfs55T5k
 t8+tci+0tmazZMTO8xdZsekI9xS5dVtDND1BnqgYfKuTeXh0J9GsEiFgT+gm32vUxaoF
 CDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q02gLvDTypu1IqXBxqUwd894XkIlOvDDNDcpgAlYDsE=;
 b=H0lOp4cwQK20NiKlWRB2EATRt2sP95Uaoqi09ch4GOzZ1MoLdbopOYHstCzDwSYIeU
 lJYB30LzFllm3XziNl787awfER4lTJhOmldtkl4PMrPPaK2/imrvWsjBFlY7WidjcwtA
 wOd5PdNqfxX046EMpI8fOU7LZ6utsP/o2wT7HVopvMZSJZtWZ2T+cFuRyzWxFb7Q8qlW
 Z57f++ahLdTzCXbhbTGTb7WlLS8rdBdogFY0Pnhrcd4RTjDlQAYmcZ2Pxky+SpJl8b4T
 RYaRTSldtlmZw/hP91auQagZnqFmIeykHwtJe4Y7GtK/0cOcK+8djFemcRhupaF1kFLb
 4Sxw==
X-Gm-Message-State: AOAM531C9sR5yIOV7b03uqox41KiVy2Esv9iEHDVrgUU6fsVaL2vQhZH
 YM5ksA+/CyFTHWZw04ELC8ga1DftOO5+cg==
X-Google-Smtp-Source: ABdhPJzsBGOVpPMqLMq4WjG5PTujrkYMizQkVPmDyxKKUw24cwlzo9NFbmkUOF9yP8N9bWkSl7Nmvg==
X-Received: by 2002:a17:90b:4b90:b0:1e8:48bd:453 with SMTP id
 lr16-20020a17090b4b9000b001e848bd0453mr22799673pjb.86.1654634782702; 
 Tue, 07 Jun 2022 13:46:22 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a170902be0600b00162037fbacdsm12971279pls.187.2022.06.07.13.46.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:46:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 26/53] semihosting: Move GET_ARG/SET_ARG earlier in the file
Date: Tue,  7 Jun 2022 13:45:30 -0700
Message-Id: <20220607204557.658541-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

Moving this to be useful for another function
besides do_common_semihosting.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 48 +++++++++++++++++------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index adb4e5b581..72a1350512 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -181,6 +181,30 @@ static LayoutInfo common_semi_find_bases(CPUState *cs)
 
 #include "common-semi-target.h"
 
+/*
+ * Read the input value from the argument block; fail the semihosting
+ * call if the memory read fails. Eventually we could use a generic
+ * CPUState helper function here.
+ */
+
+#define GET_ARG(n) do {                                 \
+    if (is_64bit_semihosting(env)) {                    \
+        if (get_user_u64(arg ## n, args + (n) * 8)) {   \
+            goto do_fault;                              \
+        }                                               \
+    } else {                                            \
+        if (get_user_u32(arg ## n, args + (n) * 4)) {   \
+            goto do_fault;                              \
+        }                                               \
+    }                                                   \
+} while (0)
+
+#define SET_ARG(n, val)                                 \
+    (is_64bit_semihosting(env) ?                        \
+     put_user_u64(val, args + (n) * 8) :                \
+     put_user_u32(val, args + (n) * 4))
+
+
 /*
  * The semihosting API has no concept of its errno being thread-safe,
  * as the API design predates SMP CPUs and was intended as a simple
@@ -507,30 +531,6 @@ static const GuestFDFunctions guestfd_fns[] = {
     },
 };
 
-/*
- * Read the input value from the argument block; fail the semihosting
- * call if the memory read fails. Eventually we could use a generic
- * CPUState helper function here.
- */
-
-#define GET_ARG(n) do {                                 \
-    if (is_64bit_semihosting(env)) {                    \
-        if (get_user_u64(arg ## n, args + (n) * 8)) {   \
-            goto do_fault;                              \
-        }                                               \
-    } else {                                            \
-        if (get_user_u32(arg ## n, args + (n) * 4)) {   \
-            goto do_fault;                              \
-        }                                               \
-    }                                                   \
-} while (0)
-
-#define SET_ARG(n, val)                                 \
-    (is_64bit_semihosting(env) ?                        \
-     put_user_u64(val, args + (n) * 8) :                \
-     put_user_u32(val, args + (n) * 4))
-
-
 /*
  * Do a semihosting call.
  *
-- 
2.34.1


