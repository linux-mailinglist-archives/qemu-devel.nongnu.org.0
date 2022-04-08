Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBEF4F97E8
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 16:21:53 +0200 (CEST)
Received: from localhost ([::1]:48534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncpUl-0007Kj-V3
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 10:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpP9-0006iZ-HF
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:04 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:38470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpP6-0002ED-RB
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:03 -0400
Received: by mail-wr1-x431.google.com with SMTP id a2so3792370wrh.5
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 07:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aUGTtcuyRkJLND+YR/BochtoXe47TvFlIFGMevyBOhE=;
 b=humxBtPOkxRfVI2XnjAympOGejUjQ2XBP83Bqf6fYQConEhVJZA+MaUZrB5j0pBJN8
 6iqQR0adle8w3e9EiOrevvunmyYrsdoU3Rh0SMZhxEcANW0yJNePGqOS9GLR/6QuIgIp
 LOUlczbjXu6+aE+6WsuAVhznfutBDwmDc2bhEEdemrle7oF2iq+o4NJzW+l1FC+NzpKe
 r0BUgasV0A3xbJ4KMzaFKpQYuOV0Ma40iwq5+sfiGm64sf5eknBDbO4kegGPYMN4QFL7
 MfVV8vnZ8BdDIdTqUXRc1TNy0kWE5Gh00ClLoLqMB72y5rpcQWiievo82T8mcVfpiRb5
 afaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aUGTtcuyRkJLND+YR/BochtoXe47TvFlIFGMevyBOhE=;
 b=O7oX1KBc9KjfHtysbe95NQF8amAcjnVWGO0grPeTaxWFzrbjefhrfXjUV7EieRMt8x
 0MBzMXpGvyG5NgkFOEugeMNP1fnc+94y+GIyXqKne6TKTfaFKw0N4fsFkUX+e2up3ydS
 SyxJRkhyBnWWLmITt9mpVsOj5Zm5wwUvFFf5kyuoB0vc63t7xqujVwJy5IJDqklI53uY
 7GCOPGtTdb5d/3nA9QQHpXHcKKfXY/59X3ZcuqRMF2aEo5T+3e7qPeB7vwSYqp4c9dzf
 7/S4GH/gdvIUMF4U8yJB48QwxeVjf3tgX31jJ2hduO1/MGWVFhmg06NuUc4fCXcuhxc5
 LwjQ==
X-Gm-Message-State: AOAM531tzm7Osejm1vkTu/S8e+kTOBewaj92zD37BIVZR4P/MxnRPupS
 Ia3f1n7jvHsY5vp/mkwF+oTNeg==
X-Google-Smtp-Source: ABdhPJyGBw075g++9hPZ4YPmPtgWaaaFReJgquWEvDtL/yYmN+6m1r/3QvTQj9hyR7bBK9XgSkI0ow==
X-Received: by 2002:adf:eb07:0:b0:207:8534:2ef6 with SMTP id
 s7-20020adfeb07000000b0020785342ef6mr7114524wrn.62.1649427356616; 
 Fri, 08 Apr 2022 07:15:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:15:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 02/41] hw/intc/arm_gicv3: Sanity-check num-cpu property
Date: Fri,  8 Apr 2022 15:15:11 +0100
Message-Id: <20220408141550.1271295-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the GICv3 code we implicitly rely on there being at least one CPU
and thus at least one redistributor and CPU interface.  Sanity-check
that the property the board code sets is not zero.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Doing this would be a board code error, but we might as well
get a clean diagnostic for it and not have to think about
num_cpu == 0 as a special case later.
---
 hw/intc/arm_gicv3_common.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 4ca5ae9bc56..90204be25b6 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -328,6 +328,10 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
                    s->num_irq, GIC_INTERNAL);
         return;
     }
+    if (s->num_cpu == 0) {
+        error_setg(errp, "num-cpu must be at least 1");
+        return;
+    }
 
     /* ITLinesNumber is represented as (N / 32) - 1, so this is an
      * implementation imposed restriction, not an architectural one,
-- 
2.25.1


