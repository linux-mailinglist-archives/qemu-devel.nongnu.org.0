Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F8760D1BB
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:42:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onMzh-0007Xb-Bm; Tue, 25 Oct 2022 12:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMz1-0006eO-AW
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:55 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMyf-0001mo-Lc
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:49 -0400
Received: by mail-wr1-x432.google.com with SMTP id bk15so22062367wrb.13
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 09:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YF2gaOVZ8h4GLrNXErHddIokoruQLmVA620L7O1U4TA=;
 b=yrkClq3wbvHIDB2sAwvpOEyJiZkWYXjJOxnRJvaKmvhTiyyOVxzYIVRE2MNy34HmRR
 lmPS4M2Ks0mJ9quG7qlhpOceH2d5FekGHZv/MV1EF2JhrYXcuUOKeeJ5u+nfVzQp9eDt
 bvLaI25If/NYcW8hdH/XlsMeA0dw2s2Y5d+ZXnF6TImFFWSciupDCKfMVu297BbrPUeY
 14Z/wPS3WSz/Hg6BLlto7CyoSfjl/jegVuRws3ZIEwaj+atjhL4k5XYXVrl/tnHzfAds
 oZbMiZ+jOKKtzt8WVxjg/7UO1DJa4jWqluLK++lUjaYx0POMq5nkIqyByZgwtkb5BQS7
 DFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YF2gaOVZ8h4GLrNXErHddIokoruQLmVA620L7O1U4TA=;
 b=NpxBqTuF6k8mOTRJjk3nOF1YdehwC5tboBG43wSghRFMDlHmEr3dxh3mrwTemrb1Eb
 G+0psfQU7PBSYQN8WSnxng4kG6tJ1y/MLeqRZMwge/2bK3peKAK78ghHkLGIGJSRA+aQ
 bxsqo9U2xo/3ZHTFJBsvrOqZb9LwlEgNN8Xwr5y3bnpDhWLjxs4LtbblArWn02Vj8Dcv
 E3R7qNNNNL17pHBS4BsOc58b4iDS7SrdF0YvmO6faaLf6WNDUd2Vlrh/eFifJe8/z2fX
 40Mv98n5+GkVMGk5RSLMruRC1CjPjYa2LZss+OuH0Zo5hxwm6MUli9EhL0VSSdaMBZaM
 jkAA==
X-Gm-Message-State: ACrzQf2TbfAI9T3FqdERjo1HBd0k7549uxTCaDoMuWmMQYYSKIl9x6ts
 L/EIty/27nyPxwP+2T4I+qOBx3s8un8Sjw==
X-Google-Smtp-Source: AMsMyM5ZfO3DqASvra/96L330P4jReb3E3DZyx0coV2gYXTuUyb9EyCs72ibIfB7/s0ZcAaYKWjgTA==
X-Received: by 2002:a05:6000:1548:b0:22e:3469:b726 with SMTP id
 8-20020a056000154800b0022e3469b726mr25788021wry.10.1666716018542; 
 Tue, 25 Oct 2022 09:40:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a05600c220c00b003cd9c26a0basm2971084wml.40.2022.10.25.09.40.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 09:40:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/30] target/arm: Use the max page size in a 2-stage ptw
Date: Tue, 25 Oct 2022 17:39:42 +0100
Message-Id: <20221025163952.4131046-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221025163952.4131046-1-peter.maydell@linaro.org>
References: <20221025163952.4131046-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

We had only been reporting the stage2 page size.  This causes
problems if stage1 is using a larger page size (16k, 2M, etc),
but stage2 is using a smaller page size, because cputlb does
not set large_page_{addr,mask} properly.

Fix by using the max of the two page sizes.

Reported-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221024051851.3074715-15-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 6b8f14fb3cd..23b1f1e6598 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2570,7 +2570,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
                                    ARMMMUFaultInfo *fi)
 {
     hwaddr ipa;
-    int s1_prot;
+    int s1_prot, s1_lgpgsz;
     bool is_secure = ptw->in_secure;
     bool ret, ipa_secure, s2walk_secure;
     ARMCacheAttrs cacheattrs1;
@@ -2606,6 +2606,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
      * Save the stage1 results so that we may merge prot and cacheattrs later.
      */
     s1_prot = result->f.prot;
+    s1_lgpgsz = result->f.lg_page_size;
     cacheattrs1 = result->cacheattrs;
     memset(result, 0, sizeof(*result));
 
@@ -2620,6 +2621,14 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
         return ret;
     }
 
+    /*
+     * Use the maximum of the S1 & S2 page size, so that invalidation
+     * of pages > TARGET_PAGE_SIZE works correctly.
+     */
+    if (result->f.lg_page_size < s1_lgpgsz) {
+        result->f.lg_page_size = s1_lgpgsz;
+    }
+
     /* Combine the S1 and S2 cache attributes. */
     hcr = arm_hcr_el2_eff_secstate(env, is_secure);
     if (hcr & HCR_DC) {
-- 
2.25.1


