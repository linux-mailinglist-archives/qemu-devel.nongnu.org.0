Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 465744119D6
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 18:33:11 +0200 (CEST)
Received: from localhost ([::1]:40700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSMEA-0004Zl-8S
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 12:33:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mSM4h-0005qF-Ve
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:23:23 -0400
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137]:36131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mSM4Y-0004B3-Sa
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:23:22 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.59])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 5FD722090D;
 Mon, 20 Sep 2021 16:23:12 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 20 Sep
 2021 18:23:11 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00528233694-7470-4f32-b11a-305535cef115,
 C584E5EC745A9DFF7B561FC81DF43D5934FDEC9F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 03/12] aspeed/smc: Stop using the model name for the memory
 regions
Date: Mon, 20 Sep 2021 18:23:00 +0200
Message-ID: <20210920162309.1091711-4-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920162309.1091711-1-clg@kaod.org>
References: <20210920162309.1091711-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e8c2023c-d6d4-4809-9084-0729c4bde326
X-Ovh-Tracer-Id: 13073949721913887526
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudeivddgleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
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
index def1cb4c74c0..612040493cf1 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -1392,20 +1392,15 @@ static const MemoryRegionOps aspeed_smc_ops = {
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
@@ -1446,7 +1441,7 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
 
     /* The memory region for the controller registers */
     memory_region_init_io(&s->mmio, OBJECT(s), &aspeed_smc_ops, s,
-                          s->ctrl->name, s->ctrl->nregs * 4);
+                          TYPE_ASPEED_SMC, s->ctrl->nregs * 4);
     sysbus_init_mmio(sbd, &s->mmio);
 
     /*
@@ -1454,12 +1449,12 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
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
 
@@ -1475,7 +1470,7 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < s->ctrl->max_peripherals; ++i) {
         AspeedSMCFlash *fl = &s->flashes[i];
 
-        snprintf(name, sizeof(name), "%s.%d", s->ctrl->name, i);
+        snprintf(name, sizeof(name), TYPE_ASPEED_SMC ".flash.%d", i);
 
         fl->id = i;
         fl->controller = s;
-- 
2.31.1


