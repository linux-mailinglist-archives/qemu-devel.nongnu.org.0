Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1094D3A5ECE
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 11:05:36 +0200 (CEST)
Received: from localhost ([::1]:51040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsiXH-0007El-3j
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 05:05:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6y-0002XF-Ms
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:24 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:36355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6p-0003cx-Ai
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:24 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 s17-20020a17090a8811b029016e89654f93so4435554pjn.1
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 01:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0M95dsVn9R89EVHrqMHORQgU6sVSBYjtS/DenInu1AA=;
 b=ABFC97TeYrSNLzDWhf9F4JZITwr7a0xO9nEMFujV6cGxJB6iPvvjxUkGkuvWa8CbLT
 yfMOZgiA7S2DFBa3hBudDkja/CopWUBHN4nU0uPAXmyz384let5+XHj/Z+ZjKu7Fu9Ze
 1pPi/s5+iaMeywiNSF3A3dWHsP/AoOtECu1S07Doug78bb/udN5B4TACjZceYhbURYYE
 h7inVr+LT2kz31YsWDetZM4WGnnMbbAPi0KHS+yhqzdBMrNq9wicprSjGOEMRxnZ6C8y
 ByXZ4DqJf7Hjhq2KJJH2EEiD6Alcqa2DoWVXF+brfo1w/kakuM7kxDKTEORyu75yYwVo
 0Vdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0M95dsVn9R89EVHrqMHORQgU6sVSBYjtS/DenInu1AA=;
 b=CUb/lqI0pMDnC1T+w8vL9RLQBjJaWEVQkNI1ESrbWoi8hzYOSfMDgD0OqAKdCFJFSi
 ZpFDmCn4fqp/Ij5YMo6saw8VNj/MzhraTaJceSxTZCTYpVjVHQXo1CoJnATNaIWwY1Az
 fBq5sStA17onL6e83mdmAzKG2n0NqZ6Hd5XCoV97rcOXQpEeSsaFUnAeq/I8lewvjsLE
 iGPgMGadsK7d5UvyyQLg9D/s/8jRy7dmBqfYVviBtGqBf2WfoIRM6ZZm1Rn0l/zVH7Iu
 BAHDN8ikR9h169mEA2PoinJ+a1O7LvJW10iLXHJcP22BnlH2jofYiKsXLAoS2dh4oVfb
 hjVQ==
X-Gm-Message-State: AOAM531bce/3JLkJ2PzTFnoEo7Phyt3vWWVEkRS7b0QwqF0lUOmXntI3
 sEWMzerGsg4aPK2xA7TulpISqB55jIvl5A==
X-Google-Smtp-Source: ABdhPJzFcc6pSE6q1T0GEEXpR568q1Wz1Ui5xl42HZVKpYAeG8OfhbeGsjBjwmbSydjpl43G7ysWbg==
X-Received: by 2002:a17:90b:789:: with SMTP id
 l9mr21719415pjz.25.1623659894063; 
 Mon, 14 Jun 2021 01:38:14 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id h20sm2242022pfh.24.2021.06.14.01.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 01:38:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/28] target/arm: Improve vector REV
Date: Mon, 14 Jun 2021 01:37:53 -0700
Message-Id: <20210614083800.1166166-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614083800.1166166-1-richard.henderson@linaro.org>
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

We can eliminate the requirement for a zero-extended output,
because the following store will ignore any garbage high bits.

Cc: Peter Maydell <peter.maydell@linaro.org> 
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index ea9d2d4647..e12387e19c 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -12427,12 +12427,10 @@ static void handle_rev(DisasContext *s, int opcode, bool u,
             read_vec_element(s, tcg_tmp, rn, i, grp_size);
             switch (grp_size) {
             case MO_16:
-                tcg_gen_bswap16_i64(tcg_tmp, tcg_tmp,
-                                    TCG_BSWAP_IZ | TCG_BSWAP_OZ);
+                tcg_gen_bswap16_i64(tcg_tmp, tcg_tmp, TCG_BSWAP_IZ);
                 break;
             case MO_32:
-                tcg_gen_bswap32_i64(tcg_tmp, tcg_tmp,
-                                    TCG_BSWAP_IZ | TCG_BSWAP_OZ);
+                tcg_gen_bswap32_i64(tcg_tmp, tcg_tmp, TCG_BSWAP_IZ);
                 break;
             case MO_64:
                 tcg_gen_bswap64_i64(tcg_tmp, tcg_tmp);
-- 
2.25.1


