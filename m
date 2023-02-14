Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2242696B46
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 18:20:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRyxj-0001wL-Ja; Tue, 14 Feb 2023 12:19:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=ZGUx=6K=kaod.org=clg@ozlabs.org>)
 id 1pRyxP-0001lU-C9; Tue, 14 Feb 2023 12:19:08 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=ZGUx=6K=kaod.org=clg@ozlabs.org>)
 id 1pRyxN-0004sX-AP; Tue, 14 Feb 2023 12:19:07 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4PGSc65FNHz4x89;
 Wed, 15 Feb 2023 04:19:02 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PGSc36jKtz4x8B;
 Wed, 15 Feb 2023 04:18:59 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 6/8] aspeed/smc: Wire CS lines at reset
Date: Tue, 14 Feb 2023 18:18:28 +0100
Message-Id: <20230214171830.681594-7-clg@kaod.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214171830.681594-1-clg@kaod.org>
References: <20230214171830.681594-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=ZGUx=6K=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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

It has become difficult to define on the command line the flash
devices of the Aspeed machines and their file backend. Currently, a
set of default flash devices is created at machine init and drives are
associated to the FMC and SPI controller devices in sequence :

   -drive file<file>,format=raw,if=mtd
   -drive file<file1>,format=raw,if=mtd
   ...

The CS lines are wired in the same creation loop.

On real systems, these flash devices are sometime soldered to the
board but the models can be different or a socket is provided to
replace the flash device. So, it is legitimate to not consider them as
always available by default. Some machine options were provided to
specify different models, but this has its limits and the best
approach would be to allow the use of block devices, such as :

    -blockdev node-name=fmc0,driver=file,filename=./flash.img \
    -device mx66u51235f,bus=ssi.0,drive=fmc0 \

The first step in that direction is to wire the CS lines of all
available devices on a bus at reset time. Let's do that and check the
maximum number of devices supported by the bus while at it. The bus
parent can now be explicitly defined but the device order still
depends on the command line definitions.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c     |  4 ----
 hw/ssi/aspeed_smc.c | 24 ++++++++++++++++++++++++
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 7c28546d7f..21184f3ad4 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -283,7 +283,6 @@ void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
 
     for (i = 0; i < count; ++i) {
         DriveInfo *dinfo = drive_get(IF_MTD, 0, unit0 + i);
-        qemu_irq cs_line;
         DeviceState *dev;
 
         dev = qdev_new(flashtype);
@@ -291,9 +290,6 @@ void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
             qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
         }
         qdev_realize_and_unref(dev, BUS(s->spi), &error_fatal);
-
-        cs_line = qdev_get_gpio_in_named(dev, SSI_GPIO_CS, 0);
-        qdev_connect_gpio_out_named(DEVICE(s), "cs", i, cs_line);
     }
 }
 
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 7281169322..412cf125d9 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -680,6 +680,28 @@ static void aspeed_smc_flash_update_ctrl(AspeedSMCFlash *fl, uint32_t value)
     aspeed_smc_flash_do_select(fl, unselect);
 }
 
+/*
+ * TODO: assumption is made on the order of creation of devices, the
+ * ones on the command line or the default devices created at machine
+ * init.
+ */
+static void aspeed_smc_wire_cs_lines(AspeedSMCState *s, int cs_max)
+{
+    BusState *b = BUS(s->spi);
+    BusChild *kid;
+
+    QTAILQ_FOREACH(kid, &b->children, sibling) {
+        qemu_irq cs_line = qdev_get_gpio_in_named(kid->child, SSI_GPIO_CS, 0);
+        if (kid->index < cs_max) {
+            qdev_connect_gpio_out_named(DEVICE(s), "cs", kid->index, cs_line);
+        } else {
+            warn_report("Too many devices for SSI bus %s",
+                        object_class_get_name(object_get_class(OBJECT(s))));
+            return;
+        }
+    }
+}
+
 static void aspeed_smc_reset(DeviceState *d)
 {
     AspeedSMCState *s = ASPEED_SMC(d);
@@ -692,6 +714,8 @@ static void aspeed_smc_reset(DeviceState *d)
         memset(s->regs, 0, sizeof s->regs);
     }
 
+    aspeed_smc_wire_cs_lines(s, asc->cs_num_max);
+
     /* Unselect all peripherals */
     for (i = 0; i < asc->cs_num_max; ++i) {
         s->regs[s->r_ctrl0 + i] |= CTRL_CE_STOP_ACTIVE;
-- 
2.39.1


