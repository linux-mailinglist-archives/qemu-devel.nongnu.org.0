Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 560281D9AE6
	for <lists+qemu-devel@lfdr.de>; Tue, 19 May 2020 17:13:26 +0200 (CEST)
Received: from localhost ([::1]:40224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jb3vp-0002Y9-Bw
	for lists+qemu-devel@lfdr.de; Tue, 19 May 2020 11:13:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jb3fB-0001cF-6p
 for qemu-devel@nongnu.org; Tue, 19 May 2020 10:56:13 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:37155
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jb3f3-0003Wr-Ak
 for qemu-devel@nongnu.org; Tue, 19 May 2020 10:56:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589900163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hj6sAUl+pCC8R/obrzbWm80TkXBdX8Ft963mPgCo7eY=;
 b=Z07sAH5R8dm6tmkFP8VhsYhjAEgZoEatAwEUxBQUAZgtlT+JADygSeiPoXqSJ23GYwZqkO
 QXXd7kGmBgH0Z2nbOHItygcof6Rj6YQOjw+LHJrL7ndJk3Mipo7Tu19k/5I3n6+KR+NoEY
 6/I5QjIKAftQp2tfrxZjiUH/lGfMHT8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-9MgMM3FHPOe-iQDIKD3_pA-1; Tue, 19 May 2020 10:56:02 -0400
X-MC-Unique: 9MgMM3FHPOe-iQDIKD3_pA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5E4E1009622
 for <qemu-devel@nongnu.org>; Tue, 19 May 2020 14:55:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38EB65D9C5;
 Tue, 19 May 2020 14:55:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3D2E01135222; Tue, 19 May 2020 16:55:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 37/55] sysbus: Drop useless OBJECT() in
 sysbus_init_child_obj() calls
Date: Tue, 19 May 2020 16:55:33 +0200
Message-Id: <20200519145551.22836-38-armbru@redhat.com>
In-Reply-To: <20200519145551.22836-1-armbru@redhat.com>
References: <20200519145551.22836-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/19 00:34:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: pbonzini@redhat.com, berrange@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

OBJECT(child) expands to ((Object *)(child)).  sysbus_init_child_obj()
parameter @child is void *.  Pass child instead of OBJECT(child).

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/arm/allwinner-a10.c  |  4 ++--
 hw/arm/aspeed_ast2600.c | 40 +++++++++++++++++-----------------------
 hw/arm/aspeed_soc.c     | 35 +++++++++++++++--------------------
 hw/arm/nrf51_soc.c      |  2 +-
 hw/mips/boston.c        |  4 ++--
 hw/mips/mips_malta.c    |  2 +-
 6 files changed, 38 insertions(+), 49 deletions(-)

diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index 49c51463e1..64449416de 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -59,9 +59,9 @@ static void aw_a10_init(Object *obj)
         int i;
 
         for (i = 0; i < AW_A10_NUM_USB; i++) {
-            sysbus_init_child_obj(obj, "ehci[*]", OBJECT(&s->ehci[i]),
+            sysbus_init_child_obj(obj, "ehci[*]", &s->ehci[i],
                                   sizeof(s->ehci[i]), TYPE_PLATFORM_EHCI);
-            sysbus_init_child_obj(obj, "ohci[*]", OBJECT(&s->ohci[i]),
+            sysbus_init_child_obj(obj, "ohci[*]", &s->ohci[i],
                                   sizeof(s->ohci[i]), TYPE_SYSBUS_OHCI);
         }
     }
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index c97a125bab..ec9bde5898 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -131,8 +131,7 @@ static void aspeed_soc_ast2600_init(Object *obj)
     }
 
     snprintf(typename, sizeof(typename), "aspeed.scu-%s", socname);
-    sysbus_init_child_obj(obj, "scu", OBJECT(&s->scu), sizeof(s->scu),
-                          typename);
+    sysbus_init_child_obj(obj, "scu", &s->scu, sizeof(s->scu), typename);
     qdev_prop_set_uint32(DEVICE(&s->scu), "silicon-rev",
                          sc->silicon_rev);
     object_property_add_alias(obj, "hw-strap1", OBJECT(&s->scu),
@@ -145,36 +144,33 @@ static void aspeed_soc_ast2600_init(Object *obj)
     sysbus_init_child_obj(obj, "a7mpcore", &s->a7mpcore,
                           sizeof(s->a7mpcore), TYPE_A15MPCORE_PRIV);
 
-    sysbus_init_child_obj(obj, "rtc", OBJECT(&s->rtc), sizeof(s->rtc),
+    sysbus_init_child_obj(obj, "rtc", &s->rtc, sizeof(s->rtc),
                           TYPE_ASPEED_RTC);
 
     snprintf(typename, sizeof(typename), "aspeed.timer-%s", socname);
-    sysbus_init_child_obj(obj, "timerctrl", OBJECT(&s->timerctrl),
+    sysbus_init_child_obj(obj, "timerctrl", &s->timerctrl,
                           sizeof(s->timerctrl), typename);
 
     snprintf(typename, sizeof(typename), "aspeed.i2c-%s", socname);
-    sysbus_init_child_obj(obj, "i2c", OBJECT(&s->i2c), sizeof(s->i2c),
-                          typename);
+    sysbus_init_child_obj(obj, "i2c", &s->i2c, sizeof(s->i2c), typename);
 
     snprintf(typename, sizeof(typename), "aspeed.fmc-%s", socname);
-    sysbus_init_child_obj(obj, "fmc", OBJECT(&s->fmc), sizeof(s->fmc),
-                          typename);
+    sysbus_init_child_obj(obj, "fmc", &s->fmc, sizeof(s->fmc), typename);
     object_property_add_alias(obj, "num-cs", OBJECT(&s->fmc), "num-cs");
 
     for (i = 0; i < sc->spis_num; i++) {
         snprintf(typename, sizeof(typename), "aspeed.spi%d-%s", i + 1, socname);
-        sysbus_init_child_obj(obj, "spi[*]", OBJECT(&s->spi[i]),
+        sysbus_init_child_obj(obj, "spi[*]", &s->spi[i],
                               sizeof(s->spi[i]), typename);
     }
 
     for (i = 0; i < sc->ehcis_num; i++) {
-        sysbus_init_child_obj(obj, "ehci[*]", OBJECT(&s->ehci[i]),
+        sysbus_init_child_obj(obj, "ehci[*]", &s->ehci[i],
                               sizeof(s->ehci[i]), TYPE_PLATFORM_EHCI);
     }
 
     snprintf(typename, sizeof(typename), "aspeed.sdmc-%s", socname);
-    sysbus_init_child_obj(obj, "sdmc", OBJECT(&s->sdmc), sizeof(s->sdmc),
-                          typename);
+    sysbus_init_child_obj(obj, "sdmc", &s->sdmc, sizeof(s->sdmc), typename);
     object_property_add_alias(obj, "ram-size", OBJECT(&s->sdmc),
                               "ram-size");
     object_property_add_alias(obj, "max-ram-size", OBJECT(&s->sdmc),
@@ -182,30 +178,29 @@ static void aspeed_soc_ast2600_init(Object *obj)
 
     for (i = 0; i < sc->wdts_num; i++) {
         snprintf(typename, sizeof(typename), "aspeed.wdt-%s", socname);
-        sysbus_init_child_obj(obj, "wdt[*]", OBJECT(&s->wdt[i]),
+        sysbus_init_child_obj(obj, "wdt[*]", &s->wdt[i],
                               sizeof(s->wdt[i]), typename);
     }
 
     for (i = 0; i < nb_nics && i < sc->macs_num; i++) {
-        sysbus_init_child_obj(obj, "ftgmac100[*]", OBJECT(&s->ftgmac100[i]),
+        sysbus_init_child_obj(obj, "ftgmac100[*]", &s->ftgmac100[i],
                               sizeof(s->ftgmac100[i]), TYPE_FTGMAC100);
 
         sysbus_init_child_obj(obj, "mii[*]", &s->mii[i], sizeof(s->mii[i]),
                               TYPE_ASPEED_MII);
     }
 
-    sysbus_init_child_obj(obj, "xdma", OBJECT(&s->xdma), sizeof(s->xdma),
+    sysbus_init_child_obj(obj, "xdma", &s->xdma, sizeof(s->xdma),
                           TYPE_ASPEED_XDMA);
 
     snprintf(typename, sizeof(typename), "aspeed.gpio-%s", socname);
-    sysbus_init_child_obj(obj, "gpio", OBJECT(&s->gpio), sizeof(s->gpio),
-                          typename);
+    sysbus_init_child_obj(obj, "gpio", &s->gpio, sizeof(s->gpio), typename);
 
     snprintf(typename, sizeof(typename), "aspeed.gpio-%s-1_8v", socname);
-    sysbus_init_child_obj(obj, "gpio_1_8v", OBJECT(&s->gpio_1_8v),
+    sysbus_init_child_obj(obj, "gpio_1_8v", &s->gpio_1_8v,
                           sizeof(s->gpio_1_8v), typename);
 
-    sysbus_init_child_obj(obj, "sd-controller", OBJECT(&s->sdhci),
+    sysbus_init_child_obj(obj, "sd-controller", &s->sdhci,
                           sizeof(s->sdhci), TYPE_ASPEED_SDHCI);
 
     object_property_set_int(OBJECT(&s->sdhci), 2, "num-slots", &error_abort);
@@ -213,18 +208,17 @@ static void aspeed_soc_ast2600_init(Object *obj)
     /* Init sd card slot class here so that they're under the correct parent */
     for (i = 0; i < ASPEED_SDHCI_NUM_SLOTS; ++i) {
         sysbus_init_child_obj(obj, "sd-controller.sdhci[*]",
-                              OBJECT(&s->sdhci.slots[i]),
+                              &s->sdhci.slots[i],
                               sizeof(s->sdhci.slots[i]), TYPE_SYSBUS_SDHCI);
     }
 
-    sysbus_init_child_obj(obj, "emmc-controller", OBJECT(&s->emmc),
+    sysbus_init_child_obj(obj, "emmc-controller", &s->emmc,
                           sizeof(s->emmc), TYPE_ASPEED_SDHCI);
 
     object_property_set_int(OBJECT(&s->emmc), 1, "num-slots", &error_abort);
 
     sysbus_init_child_obj(obj, "emmc-controller.sdhci",
-                          OBJECT(&s->emmc.slots[0]), sizeof(s->emmc.slots[0]),
-                          TYPE_SYSBUS_SDHCI);
+                          &s->emmc.slots[0], sizeof(s->emmc.slots[0]), TYPE_SYSBUS_SDHCI);
 }
 
 /*
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index bc241c567c..1e434a10ea 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -146,8 +146,7 @@ static void aspeed_soc_init(Object *obj)
     }
 
     snprintf(typename, sizeof(typename), "aspeed.scu-%s", socname);
-    sysbus_init_child_obj(obj, "scu", OBJECT(&s->scu), sizeof(s->scu),
-                          typename);
+    sysbus_init_child_obj(obj, "scu", &s->scu, sizeof(s->scu), typename);
     qdev_prop_set_uint32(DEVICE(&s->scu), "silicon-rev",
                          sc->silicon_rev);
     object_property_add_alias(obj, "hw-strap1", OBJECT(&s->scu),
@@ -157,39 +156,36 @@ static void aspeed_soc_init(Object *obj)
     object_property_add_alias(obj, "hw-prot-key", OBJECT(&s->scu),
                               "hw-prot-key");
 
-    sysbus_init_child_obj(obj, "vic", OBJECT(&s->vic), sizeof(s->vic),
+    sysbus_init_child_obj(obj, "vic", &s->vic, sizeof(s->vic),
                           TYPE_ASPEED_VIC);
 
-    sysbus_init_child_obj(obj, "rtc", OBJECT(&s->rtc), sizeof(s->rtc),
+    sysbus_init_child_obj(obj, "rtc", &s->rtc, sizeof(s->rtc),
                           TYPE_ASPEED_RTC);
 
     snprintf(typename, sizeof(typename), "aspeed.timer-%s", socname);
-    sysbus_init_child_obj(obj, "timerctrl", OBJECT(&s->timerctrl),
+    sysbus_init_child_obj(obj, "timerctrl", &s->timerctrl,
                           sizeof(s->timerctrl), typename);
 
     snprintf(typename, sizeof(typename), "aspeed.i2c-%s", socname);
-    sysbus_init_child_obj(obj, "i2c", OBJECT(&s->i2c), sizeof(s->i2c),
-                          typename);
+    sysbus_init_child_obj(obj, "i2c", &s->i2c, sizeof(s->i2c), typename);
 
     snprintf(typename, sizeof(typename), "aspeed.fmc-%s", socname);
-    sysbus_init_child_obj(obj, "fmc", OBJECT(&s->fmc), sizeof(s->fmc),
-                          typename);
+    sysbus_init_child_obj(obj, "fmc", &s->fmc, sizeof(s->fmc), typename);
     object_property_add_alias(obj, "num-cs", OBJECT(&s->fmc), "num-cs");
 
     for (i = 0; i < sc->spis_num; i++) {
         snprintf(typename, sizeof(typename), "aspeed.spi%d-%s", i + 1, socname);
-        sysbus_init_child_obj(obj, "spi[*]", OBJECT(&s->spi[i]),
+        sysbus_init_child_obj(obj, "spi[*]", &s->spi[i],
                               sizeof(s->spi[i]), typename);
     }
 
     for (i = 0; i < sc->ehcis_num; i++) {
-        sysbus_init_child_obj(obj, "ehci[*]", OBJECT(&s->ehci[i]),
+        sysbus_init_child_obj(obj, "ehci[*]", &s->ehci[i],
                               sizeof(s->ehci[i]), TYPE_PLATFORM_EHCI);
     }
 
     snprintf(typename, sizeof(typename), "aspeed.sdmc-%s", socname);
-    sysbus_init_child_obj(obj, "sdmc", OBJECT(&s->sdmc), sizeof(s->sdmc),
-                          typename);
+    sysbus_init_child_obj(obj, "sdmc", &s->sdmc, sizeof(s->sdmc), typename);
     object_property_add_alias(obj, "ram-size", OBJECT(&s->sdmc),
                               "ram-size");
     object_property_add_alias(obj, "max-ram-size", OBJECT(&s->sdmc),
@@ -197,30 +193,29 @@ static void aspeed_soc_init(Object *obj)
 
     for (i = 0; i < sc->wdts_num; i++) {
         snprintf(typename, sizeof(typename), "aspeed.wdt-%s", socname);
-        sysbus_init_child_obj(obj, "wdt[*]", OBJECT(&s->wdt[i]),
+        sysbus_init_child_obj(obj, "wdt[*]", &s->wdt[i],
                               sizeof(s->wdt[i]), typename);
     }
 
     for (i = 0; i < nb_nics && i < sc->macs_num; i++) {
-        sysbus_init_child_obj(obj, "ftgmac100[*]", OBJECT(&s->ftgmac100[i]),
+        sysbus_init_child_obj(obj, "ftgmac100[*]", &s->ftgmac100[i],
                               sizeof(s->ftgmac100[i]), TYPE_FTGMAC100);
     }
 
-    sysbus_init_child_obj(obj, "xdma", OBJECT(&s->xdma), sizeof(s->xdma),
+    sysbus_init_child_obj(obj, "xdma", &s->xdma, sizeof(s->xdma),
                           TYPE_ASPEED_XDMA);
 
     snprintf(typename, sizeof(typename), "aspeed.gpio-%s", socname);
-    sysbus_init_child_obj(obj, "gpio", OBJECT(&s->gpio), sizeof(s->gpio),
-                          typename);
+    sysbus_init_child_obj(obj, "gpio", &s->gpio, sizeof(s->gpio), typename);
 
-    sysbus_init_child_obj(obj, "sdc", OBJECT(&s->sdhci), sizeof(s->sdhci),
+    sysbus_init_child_obj(obj, "sdc", &s->sdhci, sizeof(s->sdhci),
                           TYPE_ASPEED_SDHCI);
 
     object_property_set_int(OBJECT(&s->sdhci), 2, "num-slots", &error_abort);
 
     /* Init sd card slot class here so that they're under the correct parent */
     for (i = 0; i < ASPEED_SDHCI_NUM_SLOTS; ++i) {
-        sysbus_init_child_obj(obj, "sdhci[*]", OBJECT(&s->sdhci.slots[i]),
+        sysbus_init_child_obj(obj, "sdhci[*]", &s->sdhci.slots[i],
                               sizeof(s->sdhci.slots[i]), TYPE_SYSBUS_SDHCI);
     }
 }
diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
index fe126581e4..c278827b09 100644
--- a/hw/arm/nrf51_soc.c
+++ b/hw/arm/nrf51_soc.c
@@ -189,7 +189,7 @@ static void nrf51_soc_init(Object *obj)
 
     memory_region_init(&s->container, obj, "nrf51-container", UINT64_MAX);
 
-    sysbus_init_child_obj(OBJECT(s), "armv6m", OBJECT(&s->cpu), sizeof(s->cpu),
+    sysbus_init_child_obj(OBJECT(s), "armv6m", &s->cpu, sizeof(s->cpu),
                           TYPE_ARMV7M);
     qdev_prop_set_string(DEVICE(&s->cpu), "cpu-type",
                          ARM_CPU_TYPE_NAME("cortex-m0"));
diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index c534efe2b5..8172b769a1 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -455,8 +455,8 @@ static void boston_mach_init(MachineState *machine)
 
     is_64b = cpu_supports_isa(machine->cpu_type, ISA_MIPS64);
 
-    sysbus_init_child_obj(OBJECT(machine), "cps", OBJECT(&s->cps),
-                          sizeof(s->cps), TYPE_MIPS_CPS);
+    sysbus_init_child_obj(OBJECT(machine), "cps", &s->cps, sizeof(s->cps),
+                          TYPE_MIPS_CPS);
     object_property_set_str(OBJECT(&s->cps), machine->cpu_type, "cpu-type",
                             &err);
     object_property_set_int(OBJECT(&s->cps), machine->smp.cpus, "num-vp", &err);
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
index 1355d22c01..4bef3bd768 100644
--- a/hw/mips/mips_malta.c
+++ b/hw/mips/mips_malta.c
@@ -1187,7 +1187,7 @@ static void create_cps(MachineState *ms, MaltaState *s,
 {
     Error *err = NULL;
 
-    sysbus_init_child_obj(OBJECT(s), "cps", OBJECT(&s->cps), sizeof(s->cps),
+    sysbus_init_child_obj(OBJECT(s), "cps", &s->cps, sizeof(s->cps),
                           TYPE_MIPS_CPS);
     object_property_set_str(OBJECT(&s->cps), ms->cpu_type, "cpu-type", &err);
     object_property_set_int(OBJECT(&s->cps), ms->smp.cpus, "num-vp", &err);
-- 
2.21.1


