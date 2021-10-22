Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB24437368
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 10:01:46 +0200 (CEST)
Received: from localhost ([::1]:36656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdpUn-0000to-TJ
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 04:01:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mdpQs-0004Kp-4B
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 03:57:43 -0400
Received: from 2.mo548.mail-out.ovh.net ([178.33.255.19]:49581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mdpQm-0002u4-KX
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 03:57:41 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.210])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 0D6C0211E3;
 Fri, 22 Oct 2021 07:57:34 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Fri, 22 Oct
 2021 09:57:32 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R0034c0fc9d5-17eb-4631-a24f-ab34967c2a0d,
 74C1FF3A6B8BFE8186BF38A421BAA83045AEA3E9) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 2/3] aspeed/smc: Use a container for the flash mmio address
 space
Date: Fri, 22 Oct 2021 09:57:29 +0200
Message-ID: <20211022075730.484692-3-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022075730.484692-1-clg@kaod.org>
References: <20211022075730.484692-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b813db52-52ff-4042-b17e-438c42607b89
X-Ovh-Tracer-Id: 7993044915532106604
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvjedguddvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.33.255.19; envelope-from=clg@kaod.org;
 helo=2.mo548.mail-out.ovh.net
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Because AddressSpaces must not be sysbus-mapped, commit e9c568dbc225
("hw/arm/aspeed: Do not sysbus-map mmio flash region directly, use
alias") introduced an alias for the flash mmio region.

Using a container is cleaner.

Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Message-Id: <20211018132609.160008-5-clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ssi/aspeed_smc.h |  2 +-
 hw/ssi/aspeed_smc.c         | 11 +++++++----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 75bc793bd269..e26555581996 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -52,8 +52,8 @@ struct AspeedSMCState {
     SysBusDevice parent_obj;
 
     MemoryRegion mmio;
+    MemoryRegion mmio_flash_container;
     MemoryRegion mmio_flash;
-    MemoryRegion mmio_flash_alias;
 
     qemu_irq irq;
 
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 8a988c167604..ff154eb84f85 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -1151,14 +1151,17 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
      * window in which the flash modules are mapped. The size and
      * address depends on the SoC model and controller type.
      */
+    memory_region_init(&s->mmio_flash_container, OBJECT(s),
+                       TYPE_ASPEED_SMC ".container",
+                       asc->flash_window_size);
+    sysbus_init_mmio(sbd, &s->mmio_flash_container);
+
     memory_region_init_io(&s->mmio_flash, OBJECT(s),
                           &aspeed_smc_flash_default_ops, s,
                           TYPE_ASPEED_SMC ".flash",
                           asc->flash_window_size);
-    memory_region_init_alias(&s->mmio_flash_alias, OBJECT(s),
-                             TYPE_ASPEED_SMC ".flash",
-                             &s->mmio_flash, 0, asc->flash_window_size);
-    sysbus_init_mmio(sbd, &s->mmio_flash_alias);
+    memory_region_add_subregion(&s->mmio_flash_container, 0x0,
+                                &s->mmio_flash);
 
     /*
      * Let's create a sub memory region for each possible peripheral. All
-- 
2.31.1


