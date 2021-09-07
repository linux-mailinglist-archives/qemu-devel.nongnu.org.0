Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DABD84023CC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 09:08:09 +0200 (CEST)
Received: from localhost ([::1]:44982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNVDE-0006ft-11
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 03:08:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mNV41-0001Sp-G0; Tue, 07 Sep 2021 02:58:37 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:45489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mNV3z-0001J7-9E; Tue, 07 Sep 2021 02:58:37 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.114])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 778EBBCB54E1;
 Tue,  7 Sep 2021 08:58:25 +0200 (CEST)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 7 Sep
 2021 08:58:24 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002152b913f-b4a7-4c63-b6dd-0efa343e6ce8,
 984F41D2D9692A95DAA6D5E609006558D983FB00) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery
 <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
Subject: [PATCH 03/10] aspeed/smc: Stop using the model name for the memory
 regions
Date: Tue, 7 Sep 2021 08:58:15 +0200
Message-ID: <20210907065822.1152443-4-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907065822.1152443-1-clg@kaod.org>
References: <20210907065822.1152443-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 7c00a608-9615-430b-b240-ce39fb9c8630
X-Ovh-Tracer-Id: 977562594908670825
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudefgedgudduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
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
Cc: Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no real reason to use this name. It's simply nice to have in
the monitor output but it's a burden for the following patch which
removes the AspeedSMCController structure describing the controller.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index b4d92d75a694..b6684d6f38d0 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -1391,20 +1391,15 @@ static const MemoryRegionOps aspeed_smc_ops = {
  */
 static void aspeed_smc_dma_setup(AspeedSMCState *s, Error **errp)
 {
-    char *name;
-
     if (!s->dram_mr) {
         error_setg(errp, TYPE_ASPEED_SMC ": 'dram' link not set");
         return;
     }
 
-    name = g_strdup_printf("%s-dma-flash", s->ctrl->name);
-    address_space_init(&s->flash_as, &s->mmio_flash, name);
-    g_free(name);
-
-    name = g_strdup_printf("%s-dma-dram", s->ctrl->name);
-    address_space_init(&s->dram_as, s->dram_mr, name);
-    g_free(name);
+    address_space_init(&s->flash_as, &s->mmio_flash,
+                       TYPE_ASPEED_SMC ".dma-flash");
+    address_space_init(&s->dram_as, s->dram_mr,
+                       TYPE_ASPEED_SMC ".dma-dram");
 }
 
 static void aspeed_smc_realize(DeviceState *dev, Error **errp)
@@ -1445,7 +1440,7 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
 
     /* The memory region for the controller registers */
     memory_region_init_io(&s->mmio, OBJECT(s), &aspeed_smc_ops, s,
-                          s->ctrl->name, s->ctrl->nregs * 4);
+                          TYPE_ASPEED_SMC, s->ctrl->nregs * 4);
     sysbus_init_mmio(sbd, &s->mmio);
 
     /*
@@ -1453,12 +1448,12 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
      * window in which the flash modules are mapped. The size and
      * address depends on the SoC model and controller type.
      */
-    snprintf(name, sizeof(name), "%s.flash", s->ctrl->name);
-
     memory_region_init_io(&s->mmio_flash, OBJECT(s),
-                          &aspeed_smc_flash_default_ops, s, name,
+                          &aspeed_smc_flash_default_ops, s,
+                          TYPE_ASPEED_SMC ".flash",
                           s->ctrl->flash_window_size);
-    memory_region_init_alias(&s->mmio_flash_alias, OBJECT(s), name,
+    memory_region_init_alias(&s->mmio_flash_alias, OBJECT(s),
+                             TYPE_ASPEED_SMC ".flash",
                              &s->mmio_flash, 0, s->ctrl->flash_window_size);
     sysbus_init_mmio(sbd, &s->mmio_flash_alias);
 
@@ -1474,7 +1469,7 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < s->ctrl->max_peripherals; ++i) {
         AspeedSMCFlash *fl = &s->flashes[i];
 
-        snprintf(name, sizeof(name), "%s.%d", s->ctrl->name, i);
+        snprintf(name, sizeof(name), TYPE_ASPEED_SMC ".flash.%d", i);
 
         fl->id = i;
         fl->controller = s;
-- 
2.31.1


