Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F0968D3CA
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 11:12:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPKuG-0000pL-TL; Tue, 07 Feb 2023 05:08:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=a43c=6D=kaod.org=clg@ozlabs.org>)
 id 1pPKu1-0000Xt-0a; Tue, 07 Feb 2023 05:08:45 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=a43c=6D=kaod.org=clg@ozlabs.org>)
 id 1pPKty-0002UP-Oa; Tue, 07 Feb 2023 05:08:40 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4P9zNh0Gc4z4wgv;
 Tue,  7 Feb 2023 21:08:36 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4P9zNf0986z4xyf;
 Tue,  7 Feb 2023 21:08:33 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 16/25] hw/watchdog/wdt_aspeed: Extend MMIO range to cover more
 registers
Date: Tue,  7 Feb 2023 11:07:35 +0100
Message-Id: <20230207100744.698694-17-clg@kaod.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207100744.698694-1-clg@kaod.org>
References: <20230207100744.698694-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=a43c=6D=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

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
Signed-off-by: Cédric Le Goater <clg@kaod.org>
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
2.39.1


