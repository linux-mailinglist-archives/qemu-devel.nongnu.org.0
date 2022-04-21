Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C650A509F39
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 14:02:16 +0200 (CEST)
Received: from localhost ([::1]:57734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhVVn-0008SI-Rh
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 08:02:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUqX-0003NT-7S
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:19:37 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:44913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUqR-0003ZF-QB
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:19:35 -0400
Received: by mail-wr1-x436.google.com with SMTP id b19so6177557wrh.11
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 04:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=VUeeNu4fbGv2sc/gKkaaAIAzl6d3eREzjCssGM3/Sx0=;
 b=LLRSaHt2MTUvjCW0k5r/i0vM56a2nM8UmXvsN1nlemxtwLbmsTt5LiiiNpsTJSmMGB
 g7rhw9goVmWM9PtBHaZY9fpExD0I6SSsybl+RaPpT/DkO8NmU0b9PslPqIzjeORtTCsW
 qKOWac3VpdhgSeqtcR2FpVsEtY8akNihOl0INLSEOnbPgPCByCuu+YJUuktOXRwb5YpP
 +2pnj3+yfU5X8RgpB3VPEf6gJaHbiCCiaJ4BE0sPWy3ipVRzP90kvcIEtZKYhtDh4z+b
 ycrZXgQRyN7EzPhHn76wFa1Y3ATVkIYD1Ds4/M0gTgWQdufGnbTI5tZsv9PB8Td6fKqg
 HYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VUeeNu4fbGv2sc/gKkaaAIAzl6d3eREzjCssGM3/Sx0=;
 b=beNwGHQwUrWVzlZtnJhL0y6vJUlz5+eVA93t1xN084lQ6DHZXO+N2LfIl+kiZQ2KBG
 Gzc5n5ktxhHBvG98TWW0ibSFQOf/X8V8jMWYeXtTowkhAAh02WxwbAmBf5RSc2NF0tI0
 M3uYqd+gv89FNvwCg1hOZas27j6KvqwM2DjRvX9WOiIEJ746ab/Qmx4Ayb7pdvOuLryl
 Zg6Y7SMggdD7Kcy3M+NO21WfGEIZ9wClDICAeHPwtAs1XUm7Ejihkx81EZuGp9VcZtKl
 Hk1WnXvsvExXQH1ou8NdRhy96Dm/LwoLqQJNE1pQo7xZqYUYFKjwo0cEapAcbBDHOwGw
 sB7g==
X-Gm-Message-State: AOAM531RGeUkQjJGHG/+V92gj1dPWq5g5CMgWy1mekB7lXUYogYpb1SA
 Av/3OGaW7sSwtxUQkF47RAEtOJ4q6ODx2w==
X-Google-Smtp-Source: ABdhPJyXHjGFoNcCTci0yMsONOA5W17mzQj0Luuuqn6pyA/BfYAleMCS5dhIAj7MmdUj/7f0JYpwMw==
X-Received: by 2002:a5d:4a81:0:b0:207:9abe:2908 with SMTP id
 o1-20020a5d4a81000000b002079abe2908mr18820062wrq.341.1650539959284; 
 Thu, 21 Apr 2022 04:19:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a5d6d04000000b0020a8bbbb72bsm2597694wrq.97.2022.04.21.04.19.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 04:19:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/31] hw/arm: Use bit fields for NPCM7XX PWRON STRAPs
Date: Thu, 21 Apr 2022 12:18:46 +0100
Message-Id: <20220421111846.2011565-32-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421111846.2011565-1-peter.maydell@linaro.org>
References: <20220421111846.2011565-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

From: Hao Wu <wuhaotsh@google.com>

This patch uses the defined fields to describe PWRON STRAPs for
better readability.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Patrick Venture <venture@google.com>
Message-id: 20220411165842.3912945-3-wuhaotsh@google.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/npcm7xx_boards.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 0678a56156f..6bc6f5d2fe2 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -30,11 +30,25 @@
 #include "sysemu/sysemu.h"
 #include "sysemu/block-backend.h"
 
-#define NPCM750_EVB_POWER_ON_STRAPS 0x00001ff7
-#define QUANTA_GSJ_POWER_ON_STRAPS 0x00001fff
-#define QUANTA_GBS_POWER_ON_STRAPS 0x000017ff
-#define KUDO_BMC_POWER_ON_STRAPS 0x00001fff
-#define MORI_BMC_POWER_ON_STRAPS 0x00001fff
+#define NPCM7XX_POWER_ON_STRAPS_DEFAULT (           \
+        NPCM7XX_PWRON_STRAP_SPI0F18 |               \
+        NPCM7XX_PWRON_STRAP_SFAB |                  \
+        NPCM7XX_PWRON_STRAP_BSPA |                  \
+        NPCM7XX_PWRON_STRAP_FUP(FUP_NORM_UART2) |   \
+        NPCM7XX_PWRON_STRAP_SECEN |                 \
+        NPCM7XX_PWRON_STRAP_HIZ |                   \
+        NPCM7XX_PWRON_STRAP_ECC |                   \
+        NPCM7XX_PWRON_STRAP_RESERVE1 |              \
+        NPCM7XX_PWRON_STRAP_J2EN |                  \
+        NPCM7XX_PWRON_STRAP_CKFRQ(CKFRQ_DEFAULT))
+
+#define NPCM750_EVB_POWER_ON_STRAPS ( \
+        NPCM7XX_POWER_ON_STRAPS_DEFAULT & ~NPCM7XX_PWRON_STRAP_J2EN)
+#define QUANTA_GSJ_POWER_ON_STRAPS NPCM7XX_POWER_ON_STRAPS_DEFAULT
+#define QUANTA_GBS_POWER_ON_STRAPS ( \
+        NPCM7XX_POWER_ON_STRAPS_DEFAULT & ~NPCM7XX_PWRON_STRAP_SFAB)
+#define KUDO_BMC_POWER_ON_STRAPS NPCM7XX_POWER_ON_STRAPS_DEFAULT
+#define MORI_BMC_POWER_ON_STRAPS NPCM7XX_POWER_ON_STRAPS_DEFAULT
 
 static const char npcm7xx_default_bootrom[] = "npcm7xx_bootrom.bin";
 
-- 
2.25.1


