Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B227518DE1
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:07:25 +0200 (CEST)
Received: from localhost ([::1]:51574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlyns-0008MD-Dy
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:07:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyWC-0001jR-Um
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:09 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:46894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyWB-0003aL-4r
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:08 -0400
Received: by mail-pl1-x62f.google.com with SMTP id c11so5631053plg.13
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=KTqJr1ojr+Avm6OwJN9PAVJEmcUCfXozWTlyiMGyM9k=;
 b=odW9mdNF/Ot9avhe8ntqbHxp+eu0osB+bvU1Co8fY6ibEH5dDUmkmzIXdRqLylxpGG
 EWSRmZWY3VdsN/CZ39jX66HOlVKzDdHQV9I52BsfjBJ5nnAHEfDtUBiX1aIyx4lfLowz
 CUMxT3WmF/Qn0LPDc87Q6HMcgekLsnL7eQnI22VnrG5kUBmAd4NNVLvejdH6tyKOJEBV
 l/FCRU9hr1sqF14k4YG8hV1wRyIcAD6KtYm7RvqkeDR681CwmBpMTqAVJaqAe9nA22u7
 BPNSOe/mij4Y6hr7KitrgezFXFJY4cd+eFdGOesJ7/4hXDjG/mylzsy6sdysHcZbHZIG
 ze5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KTqJr1ojr+Avm6OwJN9PAVJEmcUCfXozWTlyiMGyM9k=;
 b=NDUAoF8XlNTq3BGoTIBEuPeXgNe7WUQ3C8wVNvR2U2LomWUIAWov3FlUjsJuVaDVjV
 VZGHYNFVQgVin8fdjfcz5yTl9g82Hq1Ws/7ny4fb05MjrVpk8IxC8LWpy5o0Yi18MmMF
 duzUr9ZkrusKAxXudMOYzvlx5uogRZ93av8NGEOb/RH+9cWVJmbGXpqv5pxRIKlilefU
 0L4D/S+L8Xm3OQjFvhwywJint2ooUSRLKupc/tta/yFUcsq+9mUe5fuTRce0ySCbiOqT
 CZpq5FEEZf+QzATBaZ1wNkxPncPGr/q4XuOJI4ZCSSRLmJ7ZD2VYCJKBRS8V2t8kvQX9
 DT0Q==
X-Gm-Message-State: AOAM5325j9RK6HGrg0g1uU5tITfo273lYZQU+nvuZaFwTMvUNPAYnYJh
 YxGU0bve2V81tMFRSx70LLcWdK+dIBJ0tQ==
X-Google-Smtp-Source: ABdhPJwJPxKYZAKDo+7Bovvb5DhkMBl2T2+J2sbqjZGli2zzmitn1/oHyvlsThYh9jqI0Mohinpciw==
X-Received: by 2002:a17:902:8c8f:b0:15e:ab1c:591b with SMTP id
 t15-20020a1709028c8f00b0015eab1c591bmr9453232plo.171.1651607345699; 
 Tue, 03 May 2022 12:49:05 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 p11-20020a17090ad30b00b001cd4989fed3sm1712383pju.31.2022.05.03.12.49.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:49:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/74] semihosting: Move GET_ARG/SET_ARG earlier in the file
Date: Tue,  3 May 2022 12:47:49 -0700
Message-Id: <20220503194843.1379101-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 52 +++++++++++++++++------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 3a740482f9..49f976cbc5 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -181,6 +181,32 @@ static LayoutInfo common_semi_find_bases(CPUState *cs)
 
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
+            common_semi_cb(cs, -1, EFAULT);             \
+            return;                                     \
+        }                                               \
+    } else {                                            \
+        if (get_user_u32(arg ## n, args + (n) * 4)) {   \
+            common_semi_cb(cs, -1, EFAULT);             \
+            return;                                     \
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
@@ -506,32 +532,6 @@ static const GuestFDFunctions guestfd_fns[] = {
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
-            common_semi_cb(cs, -1, EFAULT);             \
-            return;                                     \
-        }                                               \
-    } else {                                            \
-        if (get_user_u32(arg ## n, args + (n) * 4)) {   \
-            common_semi_cb(cs, -1, EFAULT);             \
-            return;                                     \
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


