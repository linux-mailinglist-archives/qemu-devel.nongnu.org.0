Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AB653C0A2
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 00:10:10 +0200 (CEST)
Received: from localhost ([::1]:58932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwt17-0000eD-F1
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 18:10:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgp-0004hy-Q7
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:11 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:53061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgm-0008U5-HP
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:11 -0400
Received: by mail-pj1-x1033.google.com with SMTP id gd1so6024314pjb.2
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XuOHiX6D0El6nNEd2Jyo7d9eF8KMwz8jltCon2kVgiU=;
 b=MwxX3pufgmoBkSuklsbXMX4fKzczM0WS5VRsi27d15kggwaf9opVpHVEkLUoI2AeW2
 LhX7WOd9KoTHsD9JTXYVtCFL/YS9ntRAMcsrxNoV/2L36eRONV7lSG2kR9x5fPdJ3PAo
 frizYBhAcOMG1JU4ruXGd4e14Htbpg1ddLS2kuzQbAhKYCZ6sS+y395UTv7Ll7XE3hH2
 lPevEGg+0R494Y0FrlPANnxz1hCyuwzuVVekTGtMP/WNNhD2XMTKyLaSjiULzonzl9hi
 w6BDok25WjPLKDhETbOHiQ1mEA0VH30kC+AOS/2JKaoSU3ylQVaLrjXAVJoR6clqh2xm
 dSuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XuOHiX6D0El6nNEd2Jyo7d9eF8KMwz8jltCon2kVgiU=;
 b=2YrlzG4+ptjZi/R+4Hd+vdZJ0Izt82nOEnLocUH7PsyHx0r3J6LzXobehB03HIkP5L
 P7NAGl6XnNg86kfFipZ7LVDVHrug1yARIeTelCg8mq+C1L1aRlJU/+0Yo4+bEV58tYqW
 RnSJQxvPIWKHE10zJ2zc1vvKYY6TTEli4KMqqMzTgT/qgfm9wKgSS/jQ3Wi/ytf6oaUP
 el3Wsr4YSM1vzzXuESdlRLvj9Ci8MjyG6tb/bFZNIse1LVEt+xU4jUXGYBRDABLk4ip1
 lPAmBCw/F0IcwrYTE8eI/fak7RsG12ZnH3rC7RmYKQOBwEFY1oE5OtyK6wX9uGRUQ+Xx
 yshA==
X-Gm-Message-State: AOAM533TA+55UR93ZLW6XpQzjnuGVZQ3atWA/AQorzONOXEp70ymeRA6
 hITgWZkQ/kRCaRa+nkUfE09TR5JtyNvx/Q==
X-Google-Smtp-Source: ABdhPJzO2hhmoaxuW6Dnk8BHU6M2G/C/uhj/3o/2sFJpqxHSZ8d2YkUN3pZ2pCEa3K1AIHLTlbuhMg==
X-Received: by 2002:a17:90a:10f:b0:1e3:3f45:796a with SMTP id
 b15-20020a17090a010f00b001e33f45796amr7406799pjb.136.1654206547562; 
 Thu, 02 Jun 2022 14:49:07 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:49:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 15/71] target/arm: Move expand_pred_b to vec_internal.h
Date: Thu,  2 Jun 2022 14:47:57 -0700
Message-Id: <20220602214853.496211-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
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

Put the inline function near the array declaration.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/vec_internal.h | 8 +++++++-
 target/arm/sve_helper.c   | 9 ---------
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/target/arm/vec_internal.h b/target/arm/vec_internal.h
index 1d63402042..d1a1ea4a66 100644
--- a/target/arm/vec_internal.h
+++ b/target/arm/vec_internal.h
@@ -50,8 +50,14 @@
 #define H8(x)   (x)
 #define H1_8(x) (x)
 
-/* Data for expanding active predicate bits to bytes, for byte elements. */
+/*
+ * Expand active predicate bits to bytes, for byte elements.
+ */
 extern const uint64_t expand_pred_b_data[256];
+static inline uint64_t expand_pred_b(uint8_t byte)
+{
+    return expand_pred_b_data[byte];
+}
 
 static inline void clear_tail(void *vd, uintptr_t opr_sz, uintptr_t max_sz)
 {
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 8cd371e3e3..e865c12527 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -103,15 +103,6 @@ uint32_t HELPER(sve_predtest)(void *vd, void *vg, uint32_t words)
     return flags;
 }
 
-/*
- * Expand active predicate bits to bytes, for byte elements.
- * (The data table itself is in vec_helper.c as MVE also needs it.)
- */
-static inline uint64_t expand_pred_b(uint8_t byte)
-{
-    return expand_pred_b_data[byte];
-}
-
 /* Similarly for half-word elements.
  *  for (i = 0; i < 256; ++i) {
  *      unsigned long m = 0;
-- 
2.34.1


