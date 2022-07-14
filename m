Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D8D575240
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 17:56:03 +0200 (CEST)
Received: from localhost ([::1]:56300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC1C6-0007fY-BW
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 11:56:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=QWOl=XT=kaod.org=clg@ozlabs.org>)
 id 1oC11k-0005Ft-Kb; Thu, 14 Jul 2022 11:45:21 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:52145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=QWOl=XT=kaod.org=clg@ozlabs.org>)
 id 1oC11i-0000Xe-Bx; Thu, 14 Jul 2022 11:45:20 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LkJj762Jsz4xht;
 Fri, 15 Jul 2022 01:45:15 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LkJj55lV8z4xdJ;
 Fri, 15 Jul 2022 01:45:13 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 05/19] aspeed: Create SRAM name from first CPU index
Date: Thu, 14 Jul 2022 17:44:42 +0200
Message-Id: <20220714154456.2565189-6-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220714154456.2565189-1-clg@kaod.org>
References: <20220714154456.2565189-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=QWOl=XT=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Peter Delevoryas <peter@pjd.dev>

To support multiple SoC's running simultaneously, we need a unique name for
each RAM region. DRAM is created by the machine, but SRAM is created by the
SoC, since in hardware it is part of the SoC's internals.

We need a way to uniquely identify each SRAM region though, for VM
migration. Since each of the SoC's CPU's has an index which identifies it
uniquely from other CPU's in the machine, we can use the index of any of the
CPU's in the SoC to uniquely identify differentiate the SRAM name from other
SoC SRAM's. In this change, I just elected to use the index of the first CPU
in each SoC.

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220705191400.41632-3-peter@pjd.dev>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_ast10x0.c | 5 ++++-
 hw/arm/aspeed_ast2600.c | 5 +++--
 hw/arm/aspeed_soc.c     | 5 +++--
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index 33ef33177199..677699e54c0a 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -159,6 +159,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
     DeviceState *armv7m;
     Error *err = NULL;
     int i;
+    g_autofree char *sram_name = NULL;
 
     if (!clock_has_source(s->sysclk)) {
         error_setg(errp, "sysclk clock must be wired up by the board code");
@@ -183,7 +184,9 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
     sysbus_realize(SYS_BUS_DEVICE(&s->armv7m), &error_abort);
 
     /* Internal SRAM */
-    memory_region_init_ram(&s->sram, NULL, "aspeed.sram", sc->sram_size, &err);
+    sram_name = g_strdup_printf("aspeed.sram.%d",
+                                CPU(s->armv7m.cpu)->cpu_index);
+    memory_region_init_ram(&s->sram, OBJECT(s), sram_name, sc->sram_size, &err);
     if (err != NULL) {
         error_propagate(errp, err);
         return;
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 3f0611ac11cd..64eb5a7b2600 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -276,6 +276,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
     Error *err = NULL;
     qemu_irq irq;
+    g_autofree char *sram_name = NULL;
 
     /* IO space */
     aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->iomem), "aspeed.io",
@@ -335,8 +336,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     }
 
     /* SRAM */
-    memory_region_init_ram(&s->sram, OBJECT(dev), "aspeed.sram",
-                           sc->sram_size, &err);
+    sram_name = g_strdup_printf("aspeed.sram.%d", CPU(&s->cpu[0])->cpu_index);
+    memory_region_init_ram(&s->sram, OBJECT(s), sram_name, sc->sram_size, &err);
     if (err) {
         error_propagate(errp, err);
         return;
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 0f675e7fcdf5..0bb6a2f092c9 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -239,6 +239,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     AspeedSoCState *s = ASPEED_SOC(dev);
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
     Error *err = NULL;
+    g_autofree char *sram_name = NULL;
 
     /* IO space */
     aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->iomem), "aspeed.io",
@@ -259,8 +260,8 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     }
 
     /* SRAM */
-    memory_region_init_ram(&s->sram, OBJECT(dev), "aspeed.sram",
-                           sc->sram_size, &err);
+    sram_name = g_strdup_printf("aspeed.sram.%d", CPU(&s->cpu[0])->cpu_index);
+    memory_region_init_ram(&s->sram, OBJECT(s), sram_name, sc->sram_size, &err);
     if (err) {
         error_propagate(errp, err);
         return;
-- 
2.35.3


