Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCEE54162A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 22:47:16 +0200 (CEST)
Received: from localhost ([::1]:47384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyg6d-0006pB-Om
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 16:47:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftI-0007iF-A2
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:28 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:33344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftC-0007Gg-LF
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:28 -0400
Received: by mail-pg1-x536.google.com with SMTP id r71so16988908pgr.0
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XuOHiX6D0El6nNEd2Jyo7d9eF8KMwz8jltCon2kVgiU=;
 b=D/XjMCoBvmoi3Y8yz06n6HoI3bvWJu1NyyF0QjauDdgBQR3uwfSMJw/9Ulq0ZdEp1C
 HpliPg+gkS5FW3+G9Jl88e+uB7Tx3QiLznz2qpMJx0VGj5LHmbWIy9E4w++ZBughogo8
 yxtLnkFipApsltpMhw7ztx/P+UH9jXvhp3LCcdkNl0XgNUrHpEFeiMrdjnq4AzYXb+Nq
 ogKRHX04Howl2n+9JabQvohJ73VECvy4RBt+EBeW71vhHlsHsL4SF7jWPA8JZVvLD8rp
 FVhFnqNXIs/rd/TCNBF3JcINj60k0zXQ2uPV3vKZ8HEU1oX5vLGWnb+ffl93DPqlZzYs
 Xy9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XuOHiX6D0El6nNEd2Jyo7d9eF8KMwz8jltCon2kVgiU=;
 b=6QV8KbcoE1oGaei8lPPtxL9NmXfn7oYU4XEAdgHeQPPMKfLrPMqWj8WPAOfvH/pdz/
 7TJ3OHHg7r5DJopUUb6MV8ramjaIS+e/2ag9u77Xn+iHbY2vNb6DqlFfNfkC5nDCtYe2
 mrcaj/SrWjTjIG2GbK9P61wB9FUb9KmEPXvHIoBg6fZaXjtBkTXGJUp4E83p2uuK2pPh
 AbWN2iCR6EoJDzBwlQtOTfsPa43Dn2yBKrYnVFKOxSTdqLsco2AJi5s5BN3OzUFKaE8Q
 f/s95F638J4oc5UnUSGtw71VbK05dCwNctSQiN34h/enYQ0+yO+sLhmYyRqMZOgYLUyy
 rLGA==
X-Gm-Message-State: AOAM5319dOHE1MQbGEOO/7rcRNYquTQpIVTedoRgDpbHeE8f10usP9pb
 PgfbNQg2oqeQ15URHB6sBKmL+guqWVPMCA==
X-Google-Smtp-Source: ABdhPJzci2wjVx7Tqh9qJ4vWB/9julWBRqWI44wLyGH/ajpXPCq+F0hlCzq/wpbzQF1JeJFMlUiP3g==
X-Received: by 2002:a63:2d82:0:b0:3fd:fb59:d086 with SMTP id
 t124-20020a632d82000000b003fdfb59d086mr5019975pgt.334.1654634001343; 
 Tue, 07 Jun 2022 13:33:21 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 15/71] target/arm: Move expand_pred_b to vec_internal.h
Date: Tue,  7 Jun 2022 13:32:10 -0700
Message-Id: <20220607203306.657998-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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


