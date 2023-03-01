Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C4B6A71AA
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 17:59:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXPlR-0000ob-9J; Wed, 01 Mar 2023 11:57:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=znpK=6Z=kaod.org=clg@ozlabs.org>)
 id 1pXPlP-0000o3-50; Wed, 01 Mar 2023 11:57:11 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=znpK=6Z=kaod.org=clg@ozlabs.org>)
 id 1pXPlM-0007jP-0j; Wed, 01 Mar 2023 11:57:09 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4PRgPq3NLqz4xDh;
 Thu,  2 Mar 2023 03:57:03 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PRgPn1NnVz4x5Y;
 Thu,  2 Mar 2023 03:57:00 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 11/11] aspeed/smc: Replace SysBus IRQs with GPIO lines
Date: Wed,  1 Mar 2023 17:56:19 +0100
Message-Id: <20230301165619.2171090-12-clg@kaod.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301165619.2171090-1-clg@kaod.org>
References: <20230301165619.2171090-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=znpK=6Z=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
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

It's cleaner and removes the curious '+ 1' required to skip the DMA
IRQ line of the controller.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c     | 2 +-
 hw/ssi/aspeed_smc.c | 5 +----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index e2617388ad..86601cb1a5 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -306,7 +306,7 @@ void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
         qdev_realize_and_unref(dev, BUS(s->spi), &error_fatal);
 
         cs_line = qdev_get_gpio_in_named(dev, SSI_GPIO_CS, 0);
-        sysbus_connect_irq(SYS_BUS_DEVICE(s), i + 1, cs_line);
+        qdev_connect_gpio_out_named(DEVICE(s), "cs", i, cs_line);
     }
 }
 
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 22df4be528..7281169322 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -1134,10 +1134,7 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
 
     /* Setup cs_lines for peripherals */
     s->cs_lines = g_new0(qemu_irq, asc->cs_num_max);
-
-    for (i = 0; i < asc->cs_num_max; ++i) {
-        sysbus_init_irq(sbd, &s->cs_lines[i]);
-    }
+    qdev_init_gpio_out_named(DEVICE(s), s->cs_lines, "cs", asc->cs_num_max);
 
     /* The memory region for the controller registers */
     memory_region_init_io(&s->mmio, OBJECT(s), &aspeed_smc_ops, s,
-- 
2.39.2


