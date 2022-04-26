Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA677510895
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 21:08:20 +0200 (CEST)
Received: from localhost ([::1]:44444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQXs-0006Ao-1K
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 15:08:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmp-0002so-L3
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:43 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:39674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmo-0004Sy-3V
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:43 -0400
Received: by mail-pg1-x536.google.com with SMTP id i62so4557121pgd.6
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ysJZrdf3qEL6SmyFziC5eyUqxmIxqoso+UNr/N0Gtr8=;
 b=bnfNjY32un9c12FVUl6geh2rs5BDwjv7jU7Iaix8oF8lMVvO6MbzuRmgaFnp/Ij2l7
 tH7ra7bsOLGcdfNhJkXW+KqkTDo5NLQ2hZBkpEOtp/bT5slJll02ZQSFal8uTwIuilS+
 VPjCuBhiF0+9Qf35MNDadXXSt4/m/t0IJXHd5oa8Tjw8egvJFV3+/hiqzCffmPs88r0v
 uWq4EzzIbkg0TaziEamX0Muq1gvylx/aLZosDKx44/zeuC0BFQa2ysJ8/WOjICYxUGhj
 Pngdkys40RY7lKmH30dTbRwDC9vy33yHAshPQzsp5/5LySv90eiyR91trufliyNRran1
 Nhgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ysJZrdf3qEL6SmyFziC5eyUqxmIxqoso+UNr/N0Gtr8=;
 b=2j5AC+E447SxMNcvTbvLM7jom6cwKTaDA2gGdkSWYGYLE1ClrmHGUv2OfnVUAR5dV5
 KYYL5LQQf1vOPtjg2eKdBA8BpTtgqUpMVAYKxccGqgkRYrPT4ijHma3qfx2Eq9LhgzYI
 XEl+Splo36D2GDLni649V7P4mllAR9HgoBiyq/jOCyI99sMb1PqXz2FOUbI6AtaMWmQ2
 0M4sYT6I6ivzekBAjDX9bfDnVheA90EWhjRSActuUaAj1Y7yGQyt0bGfmb9ibEH59QcZ
 zxsdjLO3nlULMZG6OBZHafBb4OHg58b9jsdcDcUClP0zsx1RT0GrwMNAL+fhAiBiCazQ
 7fhg==
X-Gm-Message-State: AOAM5326Ko7MkG3muNThg8IT3547ZcKb3s76qNIkZyTVvFODUmJt3d25
 c2VcVK8GWYWGcKBod2rVHqsV90+q62BziA==
X-Google-Smtp-Source: ABdhPJz2wEyX6v1CbL4R+p/mNlo/3fMx6T1YRZtQQuvXrxvwvITtWYgrV9NP0qQiZzMr8Xkzp1b8NA==
X-Received: by 2002:a62:fb0e:0:b0:505:fd9e:9218 with SMTP id
 x14-20020a62fb0e000000b00505fd9e9218mr26300262pfm.78.1650997180873; 
 Tue, 26 Apr 2022 11:19:40 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a056a00130700b004b9f7cd94a4sm16482827pfu.56.2022.04.26.11.19.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:19:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 35/68] target/nios2: Cleanup set of CR_EXCEPTION for
 do_interrupt
Date: Tue, 26 Apr 2022 11:18:34 -0700
Message-Id: <20220426181907.103691-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The register is entirely read-only for software, and we do not
implement ECC, so we need not deposit the cause into an existing
value; just create a new value from scratch.

Furthermore, exception.CAUSE is not written for break exceptions.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-36-richard.henderson@linaro.org>
---
 target/nios2/helper.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index 25a89724d0..3d9869453b 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -54,9 +54,10 @@ static void do_exception(Nios2CPU *cpu, uint32_t exception_addr, bool is_break)
     new_status &= ~(CR_STATUS_PIE | CR_STATUS_U);
 
     env->ctrl[CR_STATUS] = new_status;
-    env->ctrl[CR_EXCEPTION] = FIELD_DP32(env->ctrl[CR_EXCEPTION],
-                                         CR_EXCEPTION, CAUSE,
-                                         cs->exception_index);
+    if (!is_break) {
+        env->ctrl[CR_EXCEPTION] = FIELD_DP32(0, CR_EXCEPTION, CAUSE,
+                                             cs->exception_index);
+    }
     env->pc = exception_addr;
 }
 
-- 
2.34.1


