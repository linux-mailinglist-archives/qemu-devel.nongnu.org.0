Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3A0431BC8
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 15:33:03 +0200 (CEST)
Received: from localhost ([::1]:46630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcSlD-00038D-01
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 09:33:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mcSeh-0002ul-1H
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 09:26:19 -0400
Received: from 10.mo548.mail-out.ovh.net ([46.105.77.235]:54537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mcSee-0006DL-Bn
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 09:26:18 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.2])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id B52D1204C4;
 Mon, 18 Oct 2021 13:26:12 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 18 Oct
 2021 15:26:11 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0019c4d4946-db25-46d9-8d6d-fbd749b81368,
 F07B6F3C357710E32BAB16EB0BBFA04B60198819) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 2/5] aspeed: Initialize the watchdog device models before
 the FMC models
Date: Mon, 18 Oct 2021 15:26:06 +0200
Message-ID: <20211018132609.160008-3-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211018132609.160008-1-clg@kaod.org>
References: <20211018132609.160008-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8c6912f3-dfdb-4361-834d-e8e8145ecdf7
X-Ovh-Tracer-Id: 8499418400517884777
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvtddgiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.77.235; envelope-from=clg@kaod.org;
 helo=10.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Next changes will map the WDT2 registers in the AST2600 FMC memory
region. Make sure the MemoryRegion pointers are correctly initialized
before setting the object links.

Do the same in the Aspeed AST2400 and AST2500 SoC models for
consistency.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_ast2600.c | 36 ++++++++++++++++++------------------
 hw/arm/aspeed_soc.c     | 36 ++++++++++++++++++------------------
 2 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 0384357a9510..3a7aa910b157 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -148,6 +148,11 @@ static void aspeed_soc_ast2600_init(Object *obj)
     snprintf(typename, sizeof(typename), "aspeed.timer-%s", socname);
     object_initialize_child(obj, "timerctrl", &s->timerctrl, typename);
 
+    for (i = 0; i < sc->wdts_num; i++) {
+        snprintf(typename, sizeof(typename), "aspeed.wdt-%s", socname);
+        object_initialize_child(obj, "wdt[*]", &s->wdt[i], typename);
+    }
+
     snprintf(typename, sizeof(typename), "aspeed.adc-%s", socname);
     object_initialize_child(obj, "adc", &s->adc, typename);
 
@@ -175,11 +180,6 @@ static void aspeed_soc_ast2600_init(Object *obj)
     object_property_add_alias(obj, "max-ram-size", OBJECT(&s->sdmc),
                               "max-ram-size");
 
-    for (i = 0; i < sc->wdts_num; i++) {
-        snprintf(typename, sizeof(typename), "aspeed.wdt-%s", socname);
-        object_initialize_child(obj, "wdt[*]", &s->wdt[i], typename);
-    }
-
     for (i = 0; i < sc->macs_num; i++) {
         object_initialize_child(obj, "ftgmac100[*]", &s->ftgmac100[i],
                                 TYPE_FTGMAC100);
@@ -325,6 +325,19 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
     }
 
+    /* Watch dog */
+    for (i = 0; i < sc->wdts_num; i++) {
+        AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(&s->wdt[i]);
+
+        object_property_set_link(OBJECT(&s->wdt[i]), "scu", OBJECT(&s->scu),
+                                 &error_abort);
+        if (!sysbus_realize(SYS_BUS_DEVICE(&s->wdt[i]), errp)) {
+            return;
+        }
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt[i]), 0,
+                        sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
+    }
+
     /* ADC */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->adc), errp)) {
         return;
@@ -395,19 +408,6 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdmc), 0, sc->memmap[ASPEED_DEV_SDMC]);
 
-    /* Watch dog */
-    for (i = 0; i < sc->wdts_num; i++) {
-        AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(&s->wdt[i]);
-
-        object_property_set_link(OBJECT(&s->wdt[i]), "scu", OBJECT(&s->scu),
-                                 &error_abort);
-        if (!sysbus_realize(SYS_BUS_DEVICE(&s->wdt[i]), errp)) {
-            return;
-        }
-        sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt[i]), 0,
-                        sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
-    }
-
     /* Net */
     for (i = 0; i < sc->macs_num; i++) {
         object_property_set_bool(OBJECT(&s->ftgmac100[i]), "aspeed", true,
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 7d53cf2f5133..2eb30d14cf94 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -162,6 +162,11 @@ static void aspeed_soc_init(Object *obj)
     snprintf(typename, sizeof(typename), "aspeed.timer-%s", socname);
     object_initialize_child(obj, "timerctrl", &s->timerctrl, typename);
 
+    for (i = 0; i < sc->wdts_num; i++) {
+        snprintf(typename, sizeof(typename), "aspeed.wdt-%s", socname);
+        object_initialize_child(obj, "wdt[*]", &s->wdt[i], typename);
+    }
+
     snprintf(typename, sizeof(typename), "aspeed.adc-%s", socname);
     object_initialize_child(obj, "adc", &s->adc, typename);
 
@@ -189,11 +194,6 @@ static void aspeed_soc_init(Object *obj)
     object_property_add_alias(obj, "max-ram-size", OBJECT(&s->sdmc),
                               "max-ram-size");
 
-    for (i = 0; i < sc->wdts_num; i++) {
-        snprintf(typename, sizeof(typename), "aspeed.wdt-%s", socname);
-        object_initialize_child(obj, "wdt[*]", &s->wdt[i], typename);
-    }
-
     for (i = 0; i < sc->macs_num; i++) {
         object_initialize_child(obj, "ftgmac100[*]", &s->ftgmac100[i],
                                 TYPE_FTGMAC100);
@@ -290,6 +290,19 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
     }
 
+    /* Watch dog */
+    for (i = 0; i < sc->wdts_num; i++) {
+        AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(&s->wdt[i]);
+
+        object_property_set_link(OBJECT(&s->wdt[i]), "scu", OBJECT(&s->scu),
+                                 &error_abort);
+        if (!sysbus_realize(SYS_BUS_DEVICE(&s->wdt[i]), errp)) {
+            return;
+        }
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt[i]), 0,
+                        sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
+    }
+
     /* ADC */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->adc), errp)) {
         return;
@@ -354,19 +367,6 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdmc), 0, sc->memmap[ASPEED_DEV_SDMC]);
 
-    /* Watch dog */
-    for (i = 0; i < sc->wdts_num; i++) {
-        AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(&s->wdt[i]);
-
-        object_property_set_link(OBJECT(&s->wdt[i]), "scu", OBJECT(&s->scu),
-                                 &error_abort);
-        if (!sysbus_realize(SYS_BUS_DEVICE(&s->wdt[i]), errp)) {
-            return;
-        }
-        sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt[i]), 0,
-                        sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
-    }
-
     /* Net */
     for (i = 0; i < sc->macs_num; i++) {
         object_property_set_bool(OBJECT(&s->ftgmac100[i]), "aspeed", true,
-- 
2.31.1


