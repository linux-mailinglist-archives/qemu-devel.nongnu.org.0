Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 281FC509EF2
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 13:49:48 +0200 (CEST)
Received: from localhost ([::1]:60300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhVJj-0003pU-8d
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 07:49:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUq3-00038e-3N
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:19:07 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUq1-0003VX-IG
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:19:06 -0400
Received: by mail-wr1-x431.google.com with SMTP id k22so6228755wrd.2
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 04:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Iwx4JxobNFjb6CXW4X/ZTu+ghI+lexKYib3ejhFEP0M=;
 b=Kdgkb46swUg7oAnpP59auRbM8I2cxAKaoMOng966/zqzj+G7BIJglFKB99pn7U6zo7
 yZrDCCcIO5KGWGN6T7pAgzPAMHbsr8j6/CbWUqE9wGPnFh/uGBFhafqZ9NokoL+nQyZ7
 f7V6T67mjTMr6UJ+YNj01K1ZgeKjvUGUWHpZ7ewhVKCN5Als+zh63/uZnF8srqV3bgWu
 OLf0CBxYX2D8Jo6tn1O67oDtTTkY+j6GlSEVn5gC57BegI5eG8+2joBS7SE2yDxJwTVC
 ncTjWKAWT0oR/uyZb0RLNXdL9S3S+pQi9Ed7seCTobHhdenZGrKmzLMZzXCv16UvEIRn
 AZcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Iwx4JxobNFjb6CXW4X/ZTu+ghI+lexKYib3ejhFEP0M=;
 b=gQhKRp1vkCZEBL6EgojzsMYomEmAWakzLSyzTP/wAgxrKHea4ZzzgiE9AxjJOdaQhW
 dDu/62EsnmZi+4p6BcctZ5WBtnI6MS8HOGvBxk/B7dmdSQXZ5AZ74EL3mXwbtXbSv6Vr
 GLjHlHwmuiV6aVT7X26GOUvJUYU2WZgT2nKzrHu/A6BJ7gKWXeBnDL4ngHnTiCFIxl9B
 wTn2ZT8qMp8Ff4xopXbZK/HlyVI0Onjxja2UN2O+Lx6SFen3Z2lxkq9VMIzQ4wAYs6Xm
 C2RJIF9whq68Z/YwFPOrrU229sBRzxML5mx+psBXU6CutA1sFL/346d+hGHMcJ8D1h/+
 4Bfg==
X-Gm-Message-State: AOAM532bU9mFIC8cqS+rzaf874Uu/AIICGc+hE3eKkGzGMgmqMCujV/Q
 d2W/oSm5MtClASFmcyGMKPEBaptvvajuaQ==
X-Google-Smtp-Source: ABdhPJzsyupnoXWXZ5VbbiwWhlJU2OuleNH2cZFTD2ySLvDtWIVPCQdRHWSLmh9KDCbLOuly/ixviA==
X-Received: by 2002:a05:6000:156a:b0:20a:9c1b:6b1b with SMTP id
 10-20020a056000156a00b0020a9c1b6b1bmr13221774wrz.683.1650539944279; 
 Thu, 21 Apr 2022 04:19:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a5d6d04000000b0020a8bbbb72bsm2597694wrq.97.2022.04.21.04.19.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 04:19:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/31] hw/arm/exynos4210: Delete unused macro definitions
Date: Thu, 21 Apr 2022 12:18:33 +0100
Message-Id: <20220421111846.2011565-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421111846.2011565-1-peter.maydell@linaro.org>
References: <20220421111846.2011565-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

Delete a couple of #defines which are never used.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220404154658.565020-12-peter.maydell@linaro.org
---
 include/hw/arm/exynos4210.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/hw/arm/exynos4210.h b/include/hw/arm/exynos4210.h
index b564e3582bb..f0769a4045b 100644
--- a/include/hw/arm/exynos4210.h
+++ b/include/hw/arm/exynos4210.h
@@ -67,10 +67,6 @@
 #define EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ   \
     (EXYNOS4210_MAX_EXT_COMBINER_OUT_IRQ * 8)
 
-/* IRQs number for external and internal GIC */
-#define EXYNOS4210_EXT_GIC_NIRQ     (160-32)
-#define EXYNOS4210_INT_GIC_NIRQ     64
-
 #define EXYNOS4210_I2C_NUMBER               9
 
 #define EXYNOS4210_NUM_DMA      3
-- 
2.25.1


