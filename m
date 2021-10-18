Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F20A2431C04
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 15:36:46 +0200 (CEST)
Received: from localhost ([::1]:56540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcSon-0001Qi-Oe
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 09:36:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mcSej-0002wl-Ov
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 09:26:23 -0400
Received: from 7.mo548.mail-out.ovh.net ([46.105.33.25]:38857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mcSef-0006Dg-MF
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 09:26:21 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.2])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 4A3032052D;
 Mon, 18 Oct 2021 13:26:14 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 18 Oct
 2021 15:26:12 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001068ba90d-1e75-41cd-920c-601283f517b7,
 F07B6F3C357710E32BAB16EB0BBFA04B60198819) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 4/5] aspeed/smc: Use a container for the flash mmio address
 space
Date: Mon, 18 Oct 2021 15:26:08 +0200
Message-ID: <20211018132609.160008-5-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211018132609.160008-1-clg@kaod.org>
References: <20211018132609.160008-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 62602c3c-167e-46a2-b393-916f0c15173c
X-Ovh-Tracer-Id: 8499699873454525292
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvtddgiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.33.25; envelope-from=clg@kaod.org;
 helo=7.mo548.mail-out.ovh.net
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Because AddressSpaces must not be sysbus-mapped, commit e9c568dbc225
("hw/arm/aspeed: Do not sysbus-map mmio flash region directly, use
alias") introduced an alias for the flash mmio region.

Using a container is cleaner.

Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ssi/aspeed_smc.h |  2 +-
 hw/ssi/aspeed_smc.c         | 11 +++++++----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index ad3c80f2d809..61d23ec1f13e 100644
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
index 1770985230b0..d4f03881ddf5 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -1218,14 +1218,17 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
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


