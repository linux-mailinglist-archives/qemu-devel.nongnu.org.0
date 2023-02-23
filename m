Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E5E6A1167
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 21:45:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVIRg-0002rm-Um; Thu, 23 Feb 2023 15:44:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVIRf-0002qg-6x
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 15:44:03 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVIRd-0007QW-3n
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 15:44:02 -0500
Received: by mail-pl1-x633.google.com with SMTP id q11so14829922plx.5
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 12:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3vtvNlB4KTNEcDi5rbGBEAocvCMMZzxXPOlMmxtkjOc=;
 b=NSQT5MrpMsF68BQuPoeYqbBBT7RfjJU9ERQAbllouaUrLKqG9rAzQ7BhXeqRebuK+L
 bYxWxzbHD5gOaHTE1TgnKzrTPbyM+k7N7UXxPutqodE6Jza+wSMnJVRkDQVP2DV9xnZq
 66cjzOuYrAl/Yxa0W6/ikb9O3wQna9KwblBZr4Jv2CZlkLm4VsY6tMk9lVJLufGDuZk5
 hstV8G7GnKkK1Jm/WQI+RokDUqDiHGyudnwSG2o11pbuMxpnKyj8DD8BSDK6Q1r21azX
 rf0hDW4BAsbdsgVHULfjcR1GzKn68H2ANdqdsJRVBhZeIcxGRX++8W4/cdy8MdeBNGRT
 1DRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3vtvNlB4KTNEcDi5rbGBEAocvCMMZzxXPOlMmxtkjOc=;
 b=f7BCysPPSMmDDy+5WloeQIbh9uHPDXcl2s8AUaZJTlwacMR46JMIDlMcNsQUKa/z8y
 /9vHcsnUfJFr9a4VAiBs7bxkGk8S7FLlkII9+V+gJBt8XOuHyTs6yfv6L++IUd3LIvf2
 U664FU0Hm+RdAroJeUn9S7P0PB/mwn5gW0UoI2ByJM/2nECJ30ouk6Wn7rhXQ++4L8ky
 Ujieu/MZnhNxKwCKcIQB1JoZi+QypGXFlxIuVB19CaXsxG44kCVVBuZCCFOTzeOpts4u
 CEhTuCn4+iqP4ksXKApbyD5WyZFjQqr0uQP52QqYHCsjDcBqp5LcqkIuPko6GqZcyZNN
 TxXA==
X-Gm-Message-State: AO0yUKUOhjelT0S8V+JgX7CdfTJwscyY3obRbLsaFL9o3Nqqq09ezx2Y
 xE4MrooPJfeq8+MFPYHRD9BdtocqaFQgsv3U3u8=
X-Google-Smtp-Source: AK7set8HYUjgYVHXAsilgr00Xt+daIFSG5riR7Le5Y763WfGTN+WOklFBTwmc1Bj8Ck+luE+AOTILQ==
X-Received: by 2002:a05:6a20:8f05:b0:cb:8d74:1114 with SMTP id
 b5-20020a056a208f0500b000cb8d741114mr11744034pzk.44.1677185040354; 
 Thu, 23 Feb 2023 12:44:00 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 e187-20020a6369c4000000b004b1fef0bf16sm5992850pgc.73.2023.02.23.12.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 12:43:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 08/13] target/arm: Support 32-byte alignment in pow2_align
Date: Thu, 23 Feb 2023 10:43:37 -1000
Message-Id: <20230223204342.1093632-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230223204342.1093632-1-richard.henderson@linaro.org>
References: <20230223204342.1093632-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Now that we have removed TARGET_PAGE_BITS_MIN-6 from
TLB_FLAGS_MASK, we can test for 32-byte alignment.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index c23a3462bf..412fc4aca8 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -940,13 +940,7 @@ static inline void store_reg_from_load(DisasContext *s, int reg, TCGv_i32 var)
 MemOp pow2_align(unsigned i)
 {
     static const MemOp mop_align[] = {
-        0, MO_ALIGN_2, MO_ALIGN_4, MO_ALIGN_8, MO_ALIGN_16,
-        /*
-         * FIXME: TARGET_PAGE_BITS_MIN affects TLB_FLAGS_MASK such
-         * that 256-bit alignment (MO_ALIGN_32) cannot be supported:
-         * see get_alignment_bits(). Enforce only 128-bit alignment for now.
-         */
-        MO_ALIGN_16
+        0, MO_ALIGN_2, MO_ALIGN_4, MO_ALIGN_8, MO_ALIGN_16, MO_ALIGN_32
     };
     g_assert(i < ARRAY_SIZE(mop_align));
     return mop_align[i];
-- 
2.34.1


