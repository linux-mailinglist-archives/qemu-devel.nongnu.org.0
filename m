Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AED6F5104A1
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 18:52:27 +0200 (CEST)
Received: from localhost ([::1]:57264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njOQM-0002Ue-QE
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 12:52:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5z-00039O-PP
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:27 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:47076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5u-0003wM-TD
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:21 -0400
Received: by mail-pl1-x636.google.com with SMTP id u7so15374783plg.13
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fsC1JB/EB4F9x89YRYFuXT3L+skbijf1weu2wToVj8c=;
 b=eCwWzpvv/B3fxSGIJ0R5K46fZLWQpFGtYtTtEjo0Fp/k5tht3LIyOWtpCVPTo+08O7
 nXB4d0Jq7EQToBM5ra9S3MfPw7jom/dPjd4EhmV//jsZpsa7jBit6T6VQHaYHkOFIgP/
 c+ZBfjCdYJNlFjy6cU9eCWxjHf1kahO+9Eb4dAzOWrzZ+uz3Bqk6hQGPcVp+fUVFjHjD
 An9xcSEDEkXcVWfOotvULLnLZz9qwqDrwRVilF9Yu9kEGjssxmlQE1FT8hsnzVNx6a4u
 P6cdT2hKI40pbnDnA4NLYf0NkfvnnvK7ARrfdFqaTYEg5S1iAixiu7YfwnK71IfVhx3B
 FgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fsC1JB/EB4F9x89YRYFuXT3L+skbijf1weu2wToVj8c=;
 b=XxqRrposKxNvTizej7iYoEByNq1ZRaK1zUQMHj7P33Rbw4gL6bVDpcng0L8gmmW71Q
 3ZxSkYqZ8WPyk80938Se+NZHV4UMWhV/o7KGZ9n2qhvRdaGHrBiIfOEPE6FBkipgjrLJ
 7czREMGTq9odfXb4XhdctOpaDI1Gc0WY6TQoDYdQlDIqxpVtOXEXxH7diHgAttmgjEQZ
 /IAb1n7ueUPHfuyF2oP3Jt9dzFGsWwfwPtzijiLgO+jIsKDrbqBEPjuudlKYdTDGJGtn
 kiDyTKRD3Viyyd+TouiKMLh0RxLPSfBJ+HXfvnnpQIgSiUD5inf16/mLYQGdROlrsxN6
 qGww==
X-Gm-Message-State: AOAM530OACXNVgnVLZUJTxQYgLwjtGLzQWYD0Lv5pQZ2c9+PHI0ucVs4
 MtN9/yY8NY6scxIZczkDQfXPdtGzipj1PA==
X-Google-Smtp-Source: ABdhPJxCGwWmc1s7idYin4a9wbPgi5AkbGWC6zW45f4rIiRSpOVQZHEGC0q8dJhJDoyRh9JPg/jLcA==
X-Received: by 2002:a17:90b:1e10:b0:1d9:a68a:144f with SMTP id
 pg16-20020a17090b1e1000b001d9a68a144fmr5834890pjb.17.1650990677440; 
 Tue, 26 Apr 2022 09:31:17 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.31.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:31:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 35/47] target/arm: Use tcg_constant in trans_CSEL
Date: Tue, 26 Apr 2022 09:30:31 -0700
Message-Id: <20220426163043.100432-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 5ce23947a1..37fb17cdaa 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8982,13 +8982,14 @@ static bool trans_CSEL(DisasContext *s, arg_CSEL *a)
     }
 
     /* In this insn input reg fields of 0b1111 mean "zero", not "PC" */
+    zero = tcg_constant_i32(0);
     if (a->rn == 15) {
-        rn = tcg_const_i32(0);
+        rn = zero;
     } else {
         rn = load_reg(s, a->rn);
     }
     if (a->rm == 15) {
-        rm = tcg_const_i32(0);
+        rm = zero;
     } else {
         rm = load_reg(s, a->rm);
     }
@@ -9010,10 +9011,8 @@ static bool trans_CSEL(DisasContext *s, arg_CSEL *a)
     }
 
     arm_test_cc(&c, a->fcond);
-    zero = tcg_const_i32(0);
     tcg_gen_movcond_i32(c.cond, rn, c.value, zero, rn, rm);
     arm_free_cc(&c);
-    tcg_temp_free_i32(zero);
 
     store_reg(s, a->rd, rn);
     tcg_temp_free_i32(rm);
-- 
2.34.1


