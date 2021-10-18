Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC34431B2B
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 15:29:22 +0200 (CEST)
Received: from localhost ([::1]:38790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcShd-00065p-TM
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 09:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mcSee-0002tQ-CH
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 09:26:16 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:60877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mcSec-0006BH-DH
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 09:26:16 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.252])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id E0C04C5612FE;
 Mon, 18 Oct 2021 15:26:11 +0200 (CEST)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 18 Oct
 2021 15:26:11 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0015b787b96-90c0-4ec1-8534-99accbe18c51,
 F07B6F3C357710E32BAB16EB0BBFA04B60198819) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 1/5] aspeed/wdt: Introduce a container for the MMIO region
Date: Mon, 18 Oct 2021 15:26:05 +0200
Message-ID: <20211018132609.160008-2-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211018132609.160008-1-clg@kaod.org>
References: <20211018132609.160008-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 15e880a6-2af7-45d6-975d-588fc0415e69
X-Ovh-Tracer-Id: 8499136925812099945
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvtddgiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

On the AST2600, the 2nd watchdog timer can be controlled through the
FMC controller to disable the alternate boot function. Next changes
will map the WDT2 registers in the AST2600 FMC memory region. Add a
container on top of the register region for this purpose.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/watchdog/wdt_aspeed.h | 1 +
 hw/watchdog/wdt_aspeed.c         | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_aspeed.h
index f945cd6c5833..14e91acb1284 100644
--- a/include/hw/watchdog/wdt_aspeed.h
+++ b/include/hw/watchdog/wdt_aspeed.h
@@ -28,6 +28,7 @@ struct AspeedWDTState {
     QEMUTimer *timer;
 
     /*< public >*/
+    MemoryRegion iomem_container;
     MemoryRegion iomem;
     uint32_t regs[ASPEED_WDT_REGS_MAX];
 
diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index 146ffcd71301..803e861a9c61 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -275,9 +275,13 @@ static void aspeed_wdt_realize(DeviceState *dev, Error **errp)
      */
     s->pclk_freq = PCLK_HZ;
 
+    memory_region_init(&s->iomem_container, OBJECT(s),
+                       TYPE_ASPEED_WDT ".container", ASPEED_WDT_REGS_MAX * 4);
+    sysbus_init_mmio(sbd, &s->iomem_container);
+
     memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_wdt_ops, s,
                           TYPE_ASPEED_WDT, ASPEED_WDT_REGS_MAX * 4);
-    sysbus_init_mmio(sbd, &s->iomem);
+    memory_region_add_subregion(&s->iomem_container, 0x0, &s->iomem);
 }
 
 static Property aspeed_wdt_properties[] = {
-- 
2.31.1


