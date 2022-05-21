Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2ED52F6FB
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 02:48:05 +0200 (CEST)
Received: from localhost ([::1]:55880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsDHo-0001W8-Ue
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 20:48:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbw-0008Bd-5x
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:56 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:35814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbd-00040g-Mc
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:43 -0400
Received: by mail-pf1-x430.google.com with SMTP id c14so8985529pfn.2
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 17:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Am6ZQ75YNAJ1iQQvd/m4L79xzkPVsPgjLxYKlB9VWSI=;
 b=pM0NEPnqVlRIMiHOsUggQ1EB89PmjqoQXvu4WzrCAGC6zcnef/odKzYWkJCjK5AL4W
 ojr8kXbxsWcAM8NurjLWmDUjW6yGgxsWBY9xySIbc/1lr9HuJOllL5WkI0j/r6vINPoK
 o1H/DFiAjgfCTByDLUKRVc8VlaVu2vF1QRdMqj07tZBMDJEhxBLBygtniT4vVCZ4vQ1j
 NpPjWkiMUbo4n7KzTkUCiRpjBmBhlFAImPj/qh0QslTfrCQgyilcbdxdVj3keUHC6gsJ
 CnNcCs/rpir83PNOuUpIke9L+OcJumi9tKptQxr5YCl82bRGiI3utTzn01caihcKjiBt
 1v7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Am6ZQ75YNAJ1iQQvd/m4L79xzkPVsPgjLxYKlB9VWSI=;
 b=00TR/ysyfHFV80M9CcD8nfvyo728UN47dQt3kskRKbVQB0cSFCEss20HNo5SluE8A0
 ncxoms5KT9blaDQJQYYHztk8HdYK/yDOLmhEXtR4MN2qetK/WNI2O5VUXF/9EVR6EAyp
 0QX/F+hJLRsuun1IZCJLtoYKtXEPg3l9u+HHBVmCqGQyISPgVGIQn208nz9yaERi4mMy
 utGq9RKUjgWXEN7yf1VLYEkdMN0xB2eW5HTSTb334/oeEgb+JgI/4KZvL4Xq2tjL+W8L
 QD2z85QjN7xpG9WxBYh1xqV9yPI7nMq5UgSsI7CAdTP/eFu0XHwH2EenZuGU20e+HUFE
 gBvA==
X-Gm-Message-State: AOAM532jXmgZMv1EeaTj8jdX6CReeBsA0zx/wXTBtKaQegyc11cuUHiL
 4xCvXNjHdOsPebM2KVdRkUHCTJ8acniUeg==
X-Google-Smtp-Source: ABdhPJxDgSItzVY9cJUBB2q8+Os5Kz1ZyfHHcwfxFRhDwLPMdS1WThl0VakhpvQ0ugISMN2GeOFQyw==
X-Received: by 2002:a05:6a00:1501:b0:510:7ab8:71c8 with SMTP id
 q1-20020a056a00150100b005107ab871c8mr12381316pfu.63.1653091467792; 
 Fri, 20 May 2022 17:04:27 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 h8-20020a654808000000b003f9d1c020cbsm306369pgs.51.2022.05.20.17.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 17:04:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 22/49] semihosting: Move GET_ARG/SET_ARG earlier in the file
Date: Fri, 20 May 2022 17:03:33 -0700
Message-Id: <20220521000400.454525-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521000400.454525-1-richard.henderson@linaro.org>
References: <20220521000400.454525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
 semihosting/arm-compat-semi.c | 48 +++++++++++++++++------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 9c6fe7ffd7..7a7468799f 100644
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


