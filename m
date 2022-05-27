Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 828925366E7
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 20:25:51 +0200 (CEST)
Received: from localhost ([::1]:59888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nueek-0006UN-GQ
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 14:25:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueMK-0003Rh-3D
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:06:48 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:44597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueMB-0001gU-H7
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:06:47 -0400
Received: by mail-pf1-x42c.google.com with SMTP id x143so4930821pfc.11
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pgu2zydUpYMeYK9b3ALqFT5I3UrenI3q9C92LiEKRKg=;
 b=n9QwUk6Us6ZTcZLlifoxpiojn/TjiabJcZM1PH9rD7yvVCnlVVPS0c6u1wGEwo2Vpz
 PyQNgtRObR6WIIoYyE4DxfLnyUY711XON1WtV7IOlqEAMck5jiK555EiYtd0IN+MUZP5
 /WaoJUkIOHCaJGtvuDYcp+vUW6litNMQgQRLkZL1Du0THZqttRV4mda+vmm0lbBLH7Cl
 SS6MczEAoGCEUUXs7rvEtgwzMTXToqdHHJCtfCKPeY4405OCl9om7VN6j2ZqZNqErSqj
 YWIu12NSvw3fc09gXusnD+ex8akNaK62m+iycDiFIUcZ0CoQ1QkFMXLE5cKcz84E4pQe
 hgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pgu2zydUpYMeYK9b3ALqFT5I3UrenI3q9C92LiEKRKg=;
 b=MxpLwmwnVvtAkNnl0XfYVC9hqch52RpIyDh6kUMKcZnTVaMXV8rCOys/7bLmzflFpP
 7GmNNWZZGAFbBAH+vv/eU0nTOIuW9DqEFEuG5Z9VxDzyHoobav2iBLIVQ61BmfKytg2C
 PRv859Q5ir5aHjRdNs19akulIRiyu2wXc+TrGHoIjMka40ndklTniwUpRzmXesKjUGCY
 bS8AHv3ETgH0QLZ3s1qE9Wgh7a0ccwA52CpZMVGnsm+L4/pWeSkQks4SaQ3jgUjma4BU
 9bCh7xw74uTAxJqpV98TYhM7kAX9bPjFqDW/1bCb9E2AmWb9Xz9YIoE1WaaZZx5jvVY2
 RKpQ==
X-Gm-Message-State: AOAM53036mTirSI9dTzQzaH6fXZGc8vlX47Nk6D0IhHypEV9uxE9iywx
 Y2/l0IRBuK/m0FP0JOg/nzIXfTajpIEejA==
X-Google-Smtp-Source: ABdhPJwexAytGUyHGJbXAklecFdun1MdmrypcLpTWys/oPKteQi34a6YJNIHG4FhX1DP3ivs2FLN9Q==
X-Received: by 2002:a05:6a00:c85:b0:518:b4a7:cce1 with SMTP id
 a5-20020a056a000c8500b00518b4a7cce1mr23252296pfv.66.1653674798192; 
 Fri, 27 May 2022 11:06:38 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a170902cf4a00b001618fee3900sm3934492plg.196.2022.05.27.11.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:06:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 15/15] target/arm: Export bfdotadd from vec_helper.c
Date: Fri, 27 May 2022 11:06:23 -0700
Message-Id: <20220527180623.185261-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527180623.185261-1-richard.henderson@linaro.org>
References: <20220527180623.185261-1-richard.henderson@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will need this over in sme_helper.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/vec_internal.h | 2 ++
 target/arm/vec_helper.c   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/vec_internal.h b/target/arm/vec_internal.h
index 43cff5ec7c..5e50c503aa 100644
--- a/target/arm/vec_internal.h
+++ b/target/arm/vec_internal.h
@@ -230,4 +230,6 @@ uint64_t pmull_h(uint64_t op1, uint64_t op2);
  */
 uint64_t pmull_w(uint64_t op1, uint64_t op2);
 
+float32 bfdotadd(float32 sum, uint32_t e1, uint32_t e2);
+
 #endif /* TARGET_ARM_VEC_INTERNAL_H */
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 4db68fbbb3..b3e8039cdb 100644
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


