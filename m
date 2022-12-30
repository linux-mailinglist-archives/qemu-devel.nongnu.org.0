Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F246597BF
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 12:36:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBDfb-0006FA-Ga; Fri, 30 Dec 2022 06:35:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBDfX-0006Ey-6z
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 06:35:23 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBDfU-0003rD-MX
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 06:35:22 -0500
Received: by mail-wr1-x429.google.com with SMTP id j17so14310378wrr.7
 for <qemu-devel@nongnu.org>; Fri, 30 Dec 2022 03:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5cgaMd8Bs8Se35Vg/9IyfGZxyIX4IGlPHw4/V3um8/Y=;
 b=qfnQ+3qj5R+06jV6SKRtuuysMitctw0HW7gFQNLHFxOSwQ/ZC7o6oxcUfT3ZsXP3Yf
 REHYZbHCuPxSoGpSGsNdYZUnmJCNsqj5BG/ZP6WiWC6esYiYfbHOAywMUmSY9ELgfrdv
 Jzh3z4uMOL8rfRnJmibxK8jBP1pRQILTQJG1oEy10XmIeR8iguohpl7pF+wYJowNc07U
 Bco9XPmuIZNtBHGaxImtPX5y9xwbTRLoJCUXRRMHHr9y9z4UPHOUIRTxPp98J9xYLzaw
 jyoO4c1ljCJygz3hYZ/yZ5Nf+HWW5ovH1aWtqjeQxn+Sx8OG4Maz74gbLNZmINvSoaEG
 RVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5cgaMd8Bs8Se35Vg/9IyfGZxyIX4IGlPHw4/V3um8/Y=;
 b=s4brnUhpcpbjR4vn7g/k3hKbh532NqKEkb0Bd/0Uwi+fnM8uPOmbQLYyy2RafHMcuM
 Cshi3BUpcFqDg/Tomprf9QdKDV7q/3gfQJN4/ELrarq4Jgl6+hhULan57MFx0Mhaw6io
 a+t4REjboK40txFu13GA9dcItD4MFFvrtqf4R1GofzcfdvM+amxRMJXrltgwDT7iD5JH
 XFDVdqkwdM+BwLsp2BXqlGL7SxoEG+BFvTTvkSAAO3yQyNF5+QJaiGc41rR6tvmqwN1K
 R6V9CxaXM6N8rhS+pcCPPkc5ylBUobZQB1NX09woLWPDDMxngoUch6ly/4sFhXmFGcZJ
 yE9A==
X-Gm-Message-State: AFqh2krSXAsIxOiUVHC2OYlaCJUbJGiPdQ5rnfnQo5I9r6a4L7UYAz6z
 XEdbQHxYJKdc7oX8Xe3ezNbM8nNIqPN+JpJg
X-Google-Smtp-Source: AMrXdXstJxlx3wuYu73V5HiHT3lCEwsMZ2i/abATu1qk86ESkKgIp6gY1bd6VXUQU8Y7xSVCWNHKaA==
X-Received: by 2002:adf:e2d2:0:b0:242:4cf5:f385 with SMTP id
 d18-20020adfe2d2000000b002424cf5f385mr19636019wrj.34.1672400118807; 
 Fri, 30 Dec 2022 03:35:18 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p14-20020adfe60e000000b0022584c82c80sm20446740wrm.19.2022.12.30.03.35.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 30 Dec 2022 03:35:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Troy Lee <troy_lee@aspeedtech.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Peter Delevoryas <peter@pjd.dev>, Steven Lee <steven_lee@aspeedtech.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Peter Delevoryas <pdel@fb.com>,
 Peter Delevoryas <pdel@meta.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>
Subject: [PATCH v2 02/11] hw/watchdog/wdt_aspeed: Extend MMIO range to cover
 more registers
Date: Fri, 30 Dec 2022 12:34:55 +0100
Message-Id: <20221230113504.37032-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221230113504.37032-1-philmd@linaro.org>
References: <20221230113504.37032-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

When booting the Zephyr demo in [1] we get:

  aspeed.io: unimplemented device write (size 4, offset 0x185128, value 0x030f1ff1) <--
  aspeed.io: unimplemented device write (size 4, offset 0x18512c, value 0x03fffff1)

This corresponds to this Zephyr code [2]:

  static int aspeed_wdt_init(const struct device *dev)
  {
    const struct aspeed_wdt_config *config = dev->config;
    struct aspeed_wdt_data *const data = dev->data;
    uint32_t reg_val;

    /* disable WDT by default */
    reg_val = sys_read32(config->ctrl_base + WDT_CTRL_REG);
    reg_val &= ~WDT_CTRL_ENABLE;
    sys_write32(reg_val, config->ctrl_base + WDT_CTRL_REG);

    sys_write32(data->rst_mask1,
                config->ctrl_base + WDT_SW_RESET_MASK1_REG);   <------
    sys_write32(data->rst_mask2,
                config->ctrl_base + WDT_SW_RESET_MASK2_REG);

    return 0;
  }

The register definitions are [3]:

  #define WDT_RELOAD_VAL_REG          0x0004
  #define WDT_RESTART_REG             0x0008
  #define WDT_CTRL_REG                0x000C
  #define WDT_TIMEOUT_STATUS_REG      0x0010
  #define WDT_TIMEOUT_STATUS_CLR_REG  0x0014
  #define WDT_RESET_MASK1_REG         0x001C
  #define WDT_RESET_MASK2_REG         0x0020
  #define WDT_SW_RESET_MASK1_REG      0x0028   <------
  #define WDT_SW_RESET_MASK2_REG      0x002C
  #define WDT_SW_RESET_CTRL_REG       0x0024

Currently QEMU only cover a MMIO region of size 0x20:

  #define ASPEED_WDT_REGS_MAX        (0x20 / 4)

Change to map the whole 'iosize' which might be bigger, covering
the other registers. The MemoryRegionOps read/write handlers will
report the accesses as out-of-bounds guest-errors, but the next
commit will report them as unimplemented.

[1] https://github.com/AspeedTech-BMC/zephyr/releases/tag/v00.01.07
[2] https://github.com/AspeedTech-BMC/zephyr/commit/2e99f10ac27b
[3] https://github.com/AspeedTech-BMC/zephyr/blob/v00.01.08/drivers/watchdog/wdt_aspeed.c#L31

Reviewed-by: Peter Delevoryas <peter@pjd.dev>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/watchdog/wdt_aspeed.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index 958725a1b5..eefca31ae4 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -260,6 +260,7 @@ static void aspeed_wdt_realize(DeviceState *dev, Error **errp)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
     AspeedWDTState *s = ASPEED_WDT(dev);
+    AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(dev);
 
     assert(s->scu);
 
@@ -271,7 +272,7 @@ static void aspeed_wdt_realize(DeviceState *dev, Error **errp)
     s->pclk_freq = PCLK_HZ;
 
     memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_wdt_ops, s,
-                          TYPE_ASPEED_WDT, ASPEED_WDT_REGS_MAX * 4);
+                          TYPE_ASPEED_WDT, awc->iosize);
     sysbus_init_mmio(sbd, &s->iomem);
 }
 
-- 
2.38.1


