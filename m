Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3853653C0A4
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 00:10:59 +0200 (CEST)
Received: from localhost ([::1]:33130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwt1u-0002G2-AE
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 18:10:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgs-0004lU-IO
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:15 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:42510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgp-00008E-Iv
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:14 -0400
Received: by mail-pg1-x534.google.com with SMTP id d129so5786601pgc.9
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gapMUzbWXEa1xXFszg2jbZqJLMbZQGkHBtGV0RlKTO8=;
 b=aknP+xaE3VnJiWAP98x59yW/zCR2tdQTtsmsSZCjiGVVxRGYADAk7ADq6BXE+eSWoP
 o4Fw7heXiEWSTz+rRAjSLzd6FCAU8kMsFgJs2Mkh1OG5kNZApnphwvcmoXg4wV9hx3c2
 afNyFW3Ga9VOpYmEcpfKRaaB0sptYT6N/QrY3vLUTH0T6sM5VS7VVk+DU/LCF+jC35m9
 pa8758VRpTSnxzu23ceXXr7mylhbSA01EzDLHNAQxCk5bLHz1QCWRW91eUoPLXxfJyPt
 oheU3m/P7qIAsGR2DtymLb+EppSmSmMJ1siyp68tiMJtMjxcLxM/PWEca4TsMmpUvWiB
 uJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gapMUzbWXEa1xXFszg2jbZqJLMbZQGkHBtGV0RlKTO8=;
 b=5JnAzDTRCyLUdrDNOjxdzBWM2n6O+t3bzJBWPqA0w+I669KEgJ8IVmQUPxMgpCf8Je
 m0kodJuTBcoLlYjqjqIfaekHxGE+mqAROZm63dpviuEB5X2Ru5WZ9DRcdoCzEwHrbUi7
 2gXx4OIsBDWAQqMoxMULpRdVEPxjnix/X7235zRm40l18Bi1qi1UHk3/O790VfQC26Mu
 FJJ5e6QGPixb3evULO9rW7SNeJ9FriY1f1wdK4UU8BeZnnIC2KQP8j5TiUxpnBeFioUg
 soervJz9qDMNRmGFI6PiG7XGxZRNP5olSpCKCf3ABLy5sg51H9eqEywwfRHkGGqR62Wv
 9tpg==
X-Gm-Message-State: AOAM531M/2E1Dh/VQwGWMaEVcgx7aFa3gquWgy9SJF7Ef4hQnpxFm1Zm
 JvWQqlN4t6lk2To238/hiOUGV1Rrp3/0sQ==
X-Google-Smtp-Source: ABdhPJwXmnimFytrSLtgQhq0z9C0SeudfLzhYQK3ZG5TZjfdmz5P2OOGyZpCiGaJ3+LplYn2UPJLkw==
X-Received: by 2002:a62:820a:0:b0:51b:d1f9:b45f with SMTP id
 w10-20020a62820a000000b0051bd1f9b45fmr3544959pfd.63.1654206550275; 
 Thu, 02 Jun 2022 14:49:10 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.49.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:49:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 18/71] target/arm: Export bfdotadd from vec_helper.c
Date: Thu,  2 Jun 2022 14:48:00 -0700
Message-Id: <20220602214853.496211-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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


