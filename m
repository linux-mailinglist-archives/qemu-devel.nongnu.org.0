Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 510FC66286D
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 15:26:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEskB-0001Sh-Pa; Mon, 09 Jan 2023 09:03:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEsk4-0001Ns-Li
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:03:15 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEsk2-0006LE-PZ
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:03:12 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so4275094wma.1
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 06:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lpu5SKcEKLbf6iXn0npn8iBGzhoC7Iq9AT+jjeNugWM=;
 b=jNmpRDJWrRKW4WLC/ZFdDoOBGr6KYLN0qDZ5cOLQmDiwJrF7tb/atiYdd86JfbPKP4
 1wD1JaX+rNy+KpwUEUroNRPiwhLbxWexBadI/YHfeSt+rzNuO8joJCQsLqp2GxIdKInZ
 3O+iw47rVpI0Z4rIVD7EQ0UPAhMzTfC6wlvUmAHc6ZcnVLiHw2pN/8dBEhIU/5TK5LLw
 L2Gcb0C8XM2PLQPYhP1gDC2LtikkcEibggdOKMKzfbSQ2YmLXbNmrFT0NvI+aKkqI2al
 f16Gq+wOeNDtBNd/OetSmSW/NDgABZz/w4BcxBdtg+rfgTL59Nc9cSvB2DNexgXkWQXW
 dfaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lpu5SKcEKLbf6iXn0npn8iBGzhoC7Iq9AT+jjeNugWM=;
 b=diztRxi8cJTmummMChSVIsGNZMfL5tjj9EQRjMlfC68f/X3/io5FqgFDnQtbxiiUqG
 HZSBb11lRJvGuoXS75PZLBGMeFMc/cizQ8Mipz8qJPPSHZod9FcFzQhElyxDq5ZQ7sBq
 pdh8Szfxeh8UAEQ10t2JWd+9X5baXxsZjVHenp0I/Smcx1Tj4eyQ0NgM4dgFyI/fgc4k
 dK27gxqfMt8Gwy2qZZZmnN9dWX4YDBhdcI1pxSnbqg/hoMJbq9Jare2faVLhYZft9Jzp
 hN+eN35/JqY+ez5PdRESAg4SEblWLpjc6ojWvOZCWuMMLLH3LobiOjhxmYYoXLiFe9WE
 qu4A==
X-Gm-Message-State: AFqh2kr0kk2JJSlZO/mEKEchHpyYWeeKwYUihkWk0YZ3KB50syoS2N86
 utQYUiv6mjUA7NLsFz5Ycoa9qwJ+OhdoPkbh
X-Google-Smtp-Source: AMrXdXsHl8vNCOWN3XMoVcaMwInJ2LmeHPZpoZcAad6oVzwQwoywHCfw7Qm9PS9Rgi7MxCj4uGryjQ==
X-Received: by 2002:a05:600c:35c7:b0:3d3:5d0f:6dfc with SMTP id
 r7-20020a05600c35c700b003d35d0f6dfcmr45837463wmq.30.1673272988854; 
 Mon, 09 Jan 2023 06:03:08 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a05600c00d000b003cf4eac8e80sm13759902wmm.23.2023.01.09.06.03.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 06:03:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Havard Skinnemoen <hskinnemoen@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Tyrone Ting <kfting@nuvoton.com>
Subject: [PATCH 00/14] hw/arm: QOM OBJECT_DECLARE_SIMPLE_TYPE cleanups
Date: Mon,  9 Jan 2023 15:02:52 +0100
Message-Id: <20230109140306.23161-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

These patches certainly look as churn, but they are required to
be able to update the OBJECT_DECLARE_SIMPLE_TYPE() macro...

Except the OMAP related files, the rest seems to have been
merged shortly after automatic script conversion from commit
8063396bf3 ("Use OBJECT_DECLARE_SIMPLE_TYPE when possible")
was run, so missed the QOM cleanup.

So here we go with yet another boring cleanup series.

Philippe Mathieu-Daudé (14):
  hw/arm/pxa: Avoid forward-declaring PXA2xxI2CState
  hw/gpio/omap_gpio: Add local variable to avoid embedded cast
  hw/arm/omap: Drop useless casts from void * to pointer
  hw/gpio/omap_gpio: Use CamelCase for TYPE_OMAP1_GPIO type name
  hw/gpio/omap_gpio: Use CamelCase for TYPE_OMAP2_GPIO type name
  hw/intc/omap_intc: Use CamelCase for TYPE_OMAP_INTC type name
  hw/arm/stellaris: Drop useless casts from void * to pointer
  hw/arm/stellaris: Use CamelCase for STELLARIS_ADC type name
  hw/arm/bcm2836: Remove definitions generated by OBJECT_DECLARE_TYPE()
  hw/arm/npcm7xx: Declare QOM macros using OBJECT_DECLARE_SIMPLE_TYPE()
  hw/misc/sbsa_ec: Rename TYPE_SBSA_EC -> TYPE_SBSA_SECURE_EC
  hw/misc/sbsa_ec: Declare QOM macros using OBJECT_DECLARE_SIMPLE_TYPE()
  hw/intc/xilinx_intc: Use 'XpsIntc' typedef instead of 'struct xlx_pic'
  hw/timer/xilinx_timer: Use XpsTimerState instead of 'struct
    timerblock'

 hw/arm/bcm2836.c               |   9 +--
 hw/arm/omap1.c                 | 115 ++++++++++++++++-----------------
 hw/arm/omap2.c                 |  40 ++++++------
 hw/arm/omap_sx1.c              |   2 +-
 hw/arm/palm.c                  |   2 +-
 hw/arm/stellaris.c             |  73 +++++++++++----------
 hw/char/omap_uart.c            |   7 +-
 hw/display/omap_dss.c          |  15 ++---
 hw/display/omap_lcdc.c         |   9 ++-
 hw/dma/omap_dma.c              |  15 ++---
 hw/gpio/omap_gpio.c            |  48 +++++++-------
 hw/intc/omap_intc.c            |  38 +++++------
 hw/intc/xilinx_intc.c          |  28 ++++----
 hw/misc/omap_gpmc.c            |  12 ++--
 hw/misc/omap_l4.c              |   7 +-
 hw/misc/omap_sdrc.c            |   7 +-
 hw/misc/omap_tap.c             |   5 +-
 hw/misc/sbsa_ec.c              |  12 ++--
 hw/sd/omap_mmc.c               |   9 ++-
 hw/ssi/omap_spi.c              |   7 +-
 hw/timer/omap_gptimer.c        |  22 +++----
 hw/timer/omap_synctimer.c      |   4 +-
 hw/timer/xilinx_timer.c        |  27 ++++----
 include/hw/adc/npcm7xx_adc.h   |   7 +-
 include/hw/arm/npcm7xx.h       |  18 ++----
 include/hw/arm/omap.h          |  24 ++++---
 include/hw/arm/pxa.h           |   6 +-
 include/hw/i2c/npcm7xx_smbus.h |   7 +-
 include/hw/misc/npcm7xx_clk.h  |   2 +-
 include/hw/misc/npcm7xx_gcr.h  |   6 +-
 include/hw/misc/npcm7xx_mft.h  |   7 +-
 include/hw/misc/npcm7xx_pwm.h  |   3 +-
 include/hw/misc/npcm7xx_rng.h  |   6 +-
 include/hw/net/npcm7xx_emc.h   |   5 +-
 include/hw/sd/npcm7xx_sdhci.h  |   4 +-
 35 files changed, 282 insertions(+), 326 deletions(-)

-- 
2.38.1


