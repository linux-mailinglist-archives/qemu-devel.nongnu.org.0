Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DB95366D5
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 20:10:03 +0200 (CEST)
Received: from localhost ([::1]:54330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuePS-0000B7-D6
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 14:10:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueMF-0003Hy-K5
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:06:43 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:46686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueM8-0001ff-KJ
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:06:43 -0400
Received: by mail-pl1-x633.google.com with SMTP id w3so4756514plp.13
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=So/GKw6vo4Jrg11seHP+nP50PgmQsoRe22dqeIRJUSw=;
 b=BxjpbEQTCewu95zjxGgX28vFqLd2AJOvgK5aSiYgE5I9tn9JzBiQPfIBu0Rj7VA0fE
 AFHYYOCTGfynoLzUaLvucILcu7zsuT17/Hgq6rS9M1Uku/ULFUuIKXwM5x+6k1C+afKp
 La8D9KkiHypUV9zavqApQTCYAZW72pNt5lm8LUUbuujdpBIfJU27HotTq4UR9hCEbchr
 OyXYp6cCqf3AHF4ymoCorOUgdgebFzOB7ApTFhsGlqK3Ddl9fPCjZG+g79JGkWh1vaFl
 ApSVRtWL7ip4Mdp2+V7rb7vA6RkngY94LGgqFWokhwYU7xu6bGKepqvNqoxJfFm8XDwc
 WxyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=So/GKw6vo4Jrg11seHP+nP50PgmQsoRe22dqeIRJUSw=;
 b=KC+ZJpmRkU+1ihUIB1uSD09sf3dZqvolgOuVJ7gFX4vrIFCaUUhv27Oi5g/d8Yp+c6
 sRxik+gkea1zW6LU1gX1/+k1RuITyUAsDg1WiA1Lp2zOxNx2WOl1WcOwcdPaA220apH7
 uoB4YWcpww/Eq6PNf7Tde2ZbDf9vAKXDFknoZvh4aTjYxX3mKQAihJaTngZp6HCpWavz
 XHZcQYLd4RyYZvEOsWc+lPUKnJSrSMsPg6TToYd1UkG+GiUo0UFEPyUIt5CJ+bKNdc5L
 i+W9skojl4txPGbnZpRJbPdwpw4ZhCOnu4EGqG8DgJDZ85avjsFL21+dGYdkf+Lpv47r
 h3Kg==
X-Gm-Message-State: AOAM531dGSubvk1OahTUZ0pPlL1V4TSn0GyPEEQP4Ujr7DxbObtE35Ci
 joMdX5Xtp1iwERt0wTT4vx+xcOg2ZD8VOQ==
X-Google-Smtp-Source: ABdhPJyy2duVIkmnxcB6EWMjo1qAD9hP2v3RlUvyMxGXD40JV82jl2a9c3w3qXZFp+wA9t/mZRpixQ==
X-Received: by 2002:a17:90b:4f4b:b0:1e0:6356:8a07 with SMTP id
 pj11-20020a17090b4f4b00b001e063568a07mr9644771pjb.9.1653674795197; 
 Fri, 27 May 2022 11:06:35 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a170902cf4a00b001618fee3900sm3934492plg.196.2022.05.27.11.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:06:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 12/15] target/arm: Move expand_pred_b to vec_internal.h
Date: Fri, 27 May 2022 11:06:20 -0700
Message-Id: <20220527180623.185261-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527180623.185261-1-richard.henderson@linaro.org>
References: <20220527180623.185261-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
index 446d7ac5cb..b8a37dd1eb 100644
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


