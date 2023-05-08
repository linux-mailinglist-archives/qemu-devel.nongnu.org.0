Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C476FA1C8
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 10:00:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvvmk-00087k-5w; Mon, 08 May 2023 03:59:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5sq4=A5=kaod.org=clg@ozlabs.org>)
 id 1pvvmQ-00082L-HZ; Mon, 08 May 2023 03:59:39 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5sq4=A5=kaod.org=clg@ozlabs.org>)
 id 1pvvmO-00019f-Nh; Mon, 08 May 2023 03:59:34 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4QFDG72VmSz4x4C;
 Mon,  8 May 2023 17:59:27 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4QFDG51Hhkz4x48;
 Mon,  8 May 2023 17:59:24 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 06/12] aspeed/smc: Wire CS lines at reset
Date: Mon,  8 May 2023 09:58:53 +0200
Message-Id: <20230508075859.3326566-7-clg@kaod.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230508075859.3326566-1-clg@kaod.org>
References: <20230508075859.3326566-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=5sq4=A5=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Currently, a set of default flash devices is created at machine init
and drives defined on the QEMU command line are associated to the FMC
and SPI controllers in sequence :

   -drive file<file>,format=raw,if=mtd
   -drive file<file1>,format=raw,if=mtd

The CS lines are wired in the same creation loop. This makes a strong
assumption on the ordering and is not very flexible since only a
limited set of flash devices can be defined : 1 FMC + 1 or 2 SPI,
which is less than what the SoC really supports.

A better alternative would be to define the flash devices on the
command line using a blockdev attached to a CS line of a SSI bus :

    -blockdev node-name=fmc0,driver=file,filename=./flash.img
    -device mx66u51235f,addr=0x0,bus=ssi.0,drive=fmc0

However, user created flash devices are not correctly wired to their
SPI controller and consequently can not be used by the machine. Fix
that and wire the CS lines of all available devices when the SSI bus
is reset.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c     | 5 +----
 hw/ssi/aspeed_smc.c | 8 ++++++++
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index b654513f35..9a15899cbc 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -299,17 +299,14 @@ void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
 
     for (i = 0; i < count; ++i) {
         DriveInfo *dinfo = drive_get(IF_MTD, 0, unit0 + i);
-        qemu_irq cs_line;
         DeviceState *dev;
 
         dev = qdev_new(flashtype);
         if (dinfo) {
             qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
         }
+        qdev_prop_set_uint32(dev, "addr", i);
         qdev_realize_and_unref(dev, BUS(s->spi), &error_fatal);
-
-        cs_line = qdev_get_gpio_in_named(dev, SSI_GPIO_CS, 0);
-        qdev_connect_gpio_out_named(DEVICE(s), "cs", i, cs_line);
     }
 }
 
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 7281169322..2a4001b774 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -692,6 +692,14 @@ static void aspeed_smc_reset(DeviceState *d)
         memset(s->regs, 0, sizeof s->regs);
     }
 
+    for (i = 0; i < asc->cs_num_max; i++) {
+        DeviceState *dev = ssi_get_cs(s->spi, i);
+        if (dev) {
+            qemu_irq cs_line = qdev_get_gpio_in_named(dev, SSI_GPIO_CS, 0);
+            qdev_connect_gpio_out_named(DEVICE(s), "cs", i, cs_line);
+        }
+    }
+
     /* Unselect all peripherals */
     for (i = 0; i < asc->cs_num_max; ++i) {
         s->regs[s->r_ctrl0 + i] |= CTRL_CE_STOP_ACTIVE;
-- 
2.40.0


