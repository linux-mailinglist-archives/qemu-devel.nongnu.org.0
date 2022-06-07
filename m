Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C89C45416C0
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 22:56:12 +0200 (CEST)
Received: from localhost ([::1]:36950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nygFH-00033Z-Sp
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 16:56:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftM-0007tf-PD
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:32 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:41593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftF-0007Iy-67
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:32 -0400
Received: by mail-pg1-x532.google.com with SMTP id e66so16931344pgc.8
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gapMUzbWXEa1xXFszg2jbZqJLMbZQGkHBtGV0RlKTO8=;
 b=ydQEcJ8kR/nWHdKxUHvA1eS0cLEJux68nK0R87iL0PFiG7n7QFk9S9l0itLuX2T1/2
 AWMm0ytL0I8Y5KtokC03ywP3To38aHqkgrRA92Rl94cgpiGybaB1WsjwTW1eoQh3R8zf
 5Az2plQ5GnFHO8USy3h/zxtM9mzSTT1JeJ5iyz7WwGtZx4xB0HLQCRh38RlEblTRCIQ7
 VC51k9yiw5Vy1kD3MovaTsZ6obeuBqhBHh2XmkFOiHqd3WYDrZx1Ayw8tUVtKFmcGJWS
 GcWTlcB3vHCG/sdLUv00mIc6TDgRGoCfVV60R5F4ICK3ibY29GP3DbYWq0xO5TJEg0th
 5PDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gapMUzbWXEa1xXFszg2jbZqJLMbZQGkHBtGV0RlKTO8=;
 b=EDtKc8lY+/oAG3EOAgfwnq/hqJ9YI21iQwAdmYKHrBy47ZnztwoSe9Skc+vlrcaVSn
 W3sTyS3YATWETGeusTeOGROnjxZzC+9MAwTyCIqMfN3xXhVB1bhbTcpr4vr33+E6R/oK
 Wd01j7wzdTt4x69eSiu2MQSUXTCqVtRrTePIhQm72C+vurzvHY2O0elLQ3RTQh74Pudt
 l+31+U9TYPrZXeItrOgSHot9rQgMGv7VGDlMBvmefROemQOatM7GO1pQM+TQYksk7I4n
 A/UQDlYWxFqO3W4pGSj6U3kG7jm0BD/PjoGj9NS1ZkS2vCQEuWJSEdWHCBNY2KI6nOHI
 CwqA==
X-Gm-Message-State: AOAM5338rIIOzN/Rg7I6GtYYaP2q5JaRbscmcLM2t9nd2AX6mxItTN5z
 gG+/WvkSqMj7+DEvEcoSXa9HO1qezJ2cpg==
X-Google-Smtp-Source: ABdhPJwGmmd01dUbPx2ynmuFmiy69PW5ZaYT51kNaRkQYf90OWs5myFbBaYU9WYEwTPKvGKdDH0N0g==
X-Received: by 2002:a63:6c81:0:b0:3fd:4be3:8ee9 with SMTP id
 h123-20020a636c81000000b003fd4be38ee9mr17866421pgc.188.1654634003931; 
 Tue, 07 Jun 2022 13:33:23 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 18/71] target/arm: Export bfdotadd from vec_helper.c
Date: Tue,  7 Jun 2022 13:32:13 -0700
Message-Id: <20220607203306.657998-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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

We will need this over in sme_helper.c.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/vec_internal.h | 13 +++++++++++++
 target/arm/vec_helper.c   |  2 +-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/target/arm/vec_internal.h b/target/arm/vec_internal.h
index 1d527fadac..1f4ed80ff7 100644
--- a/target/arm/vec_internal.h
+++ b/target/arm/vec_internal.h
@@ -230,4 +230,17 @@ uint64_t pmull_h(uint64_t op1, uint64_t op2);
  */
 uint64_t pmull_w(uint64_t op1, uint64_t op2);
 
+/**
+ * bfdotadd:
+ * @sum: addend
+ * @e1, @e2: multiplicand vectors
+ *
+ * BFloat16 2-way dot product of @e1 & @e2, accumulating with @sum.
+ * The @e1 and @e2 operands correspond to the 32-bit source vector
+ * slots and contain two Bfloat16 values each.
+ *
+ * Corresponds to the ARM pseudocode function BFDotAdd.
+ */
+float32 bfdotadd(float32 sum, uint32_t e1, uint32_t e2);
+
 #endif /* TARGET_ARM_VEC_INTERNAL_H */
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 26c373e522..9a9c034e36 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -2557,7 +2557,7 @@ DO_MMLA_B(gvec_usmmla_b, do_usmmla_b)
  * BFloat16 Dot Product
  */
 
-static float32 bfdotadd(float32 sum, uint32_t e1, uint32_t e2)
+float32 bfdotadd(float32 sum, uint32_t e1, uint32_t e2)
 {
     /* FPCR is ignored for BFDOT and BFMMLA. */
     float_status bf_status = {
-- 
2.34.1


