Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B38D7515DDA
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 15:50:34 +0200 (CEST)
Received: from localhost ([::1]:38052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nknUX-0000Y8-Gy
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 09:50:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAc-0004nG-Ho
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:30:00 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:43852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAZ-0006H8-Oh
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:29:57 -0400
Received: by mail-pf1-x42c.google.com with SMTP id y14so9047461pfe.10
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 06:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KTqJr1ojr+Avm6OwJN9PAVJEmcUCfXozWTlyiMGyM9k=;
 b=hyrtmvin031FUKrTZeDG3DueHkuGPEWTzfyLAtBztqAUsUF3bMq2YqkJRBZ2iXQhBE
 ALywlPDHnJCy5ROE7AvcmcZVhIVjyxIjiWM2HGAkANVhiV4ZMLvkoyO/Od63zL/Q/KoX
 mNAdQdJqugNT9usARzpghLlO9bmPCEZiasrUSceU/+kjqUIS52yHAhXZZyvHuEoVUKnu
 JvdVDs2X98PKjosvHJZPgRIuXjS3sWep8EGYfsR7N+6ZFe10Yx1W5/0mWONSBaw0tl3B
 FYkulNCcPEMcPbu4eFMfdvdTReJlakG+pesbVGL/pT3non4s9sLphDONDYYVnp8SWWZl
 dV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KTqJr1ojr+Avm6OwJN9PAVJEmcUCfXozWTlyiMGyM9k=;
 b=NrhEO/Sh8GX7SKGWCNFz2nrXw3G/Ns0X8HrLcSSCtleQfjSMzcGJtdm4snUm0pAJLy
 kLjgSRFYt3yb5fVIRYctIAOuKHtFq3XM+Tt9549Yel3HUBRBwiIOQ0kn0sXGVyqHLxfB
 1V79eaALK2Bqq/AIj/JV73R7zyWziQ9Bs/ioQf2u90V4pAwNx6/348G9vEpDEFKbZ/CS
 T9L2iw+nizD1FGJa2md+fmByx7F4jqDTjlbGw5sffkbsX2PMIUWmTH9bwkfaapHloVsn
 rFSxUwleDgo2t/Et2bVaISU92I/Nb1sE+ueDY52MCgVjBDWQxHtIBiDKyta0A+BGbT1Y
 +/nQ==
X-Gm-Message-State: AOAM530WPCe+0+SKpNT8HENvaaHesyj6JCLgOb9Wk1Rqudnx4XNt24wC
 RPlUQtjcdMwBWGfSfZiWG/GDSAiyVo7mvA==
X-Google-Smtp-Source: ABdhPJzqz2fzvWvi9qo7lzi9pZNotkLWzCdVl3j8JF0Ml661kATp3kX+IpNujjEsq1tGyl59LIdTiA==
X-Received: by 2002:a05:6a00:1897:b0:50d:baaf:4163 with SMTP id
 x23-20020a056a00189700b0050dbaaf4163mr3624854pfh.26.1651325393406; 
 Sat, 30 Apr 2022 06:29:53 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 x5-20020aa793a5000000b0050dc7628201sm1522606pff.219.2022.04.30.06.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:29:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/43] semihosting: Move GET_ARG/SET_ARG earlier in the file
Date: Sat, 30 Apr 2022 06:29:08 -0700
Message-Id: <20220430132932.324018-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430132932.324018-1-richard.henderson@linaro.org>
References: <20220430132932.324018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Cc: crwulff@gmail.com, alex.bennee@linaro.org, f4bug@amsat.org,
 laurent@vivier.eu
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


