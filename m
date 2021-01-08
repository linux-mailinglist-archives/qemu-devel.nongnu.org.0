Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F7E2EFB05
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 23:20:55 +0100 (CET)
Received: from localhost ([::1]:50814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky07q-0007uN-Od
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 17:20:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ky04T-0005ne-9Y; Fri, 08 Jan 2021 17:17:25 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:60461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ky04Q-0004v7-4s; Fri, 08 Jan 2021 17:17:25 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id BE8217475FB;
 Fri,  8 Jan 2021 23:17:19 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 372427470FA; Fri,  8 Jan 2021 23:17:19 +0100 (CET)
Message-Id: <a4dc55b56eed3ce899b7bf9835b980a114c52598.1610143658.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1610143658.git.balaton@eik.bme.hu>
References: <cover.1610143658.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 3/3] sam460ex: Use type cast macro instead of simple cast
Date: Fri, 08 Jan 2021 23:07:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, f4bug@amsat.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the PCI_BUS type cast macro to convert result of qdev_get_child_bus().
Also remove the check for NULL afterwards which should not be needed
because sysbus_create_simple() uses error_abort and we create the PCI
host object here that's expected to have a PCI bus so this shouldn't
fail. Even if it would fail that would be due to a programmer error so
an error message is not necessary.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/sam460ex.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 45721ad6c7..e459b43065 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -419,11 +419,8 @@ static void sam460ex_init(MachineState *machine)
     /* All PCI irqs are connected to the same UIC pin (cf. UBoot source) */
     dev = sysbus_create_simple("ppc440-pcix-host", 0xc0ec00000,
                                qdev_get_gpio_in(uic[1], 0));
-    pci_bus = (PCIBus *)qdev_get_child_bus(dev, "pci.0");
-    if (!pci_bus) {
-        error_report("couldn't create PCI controller!");
-        exit(1);
-    }
+    pci_bus = PCI_BUS(qdev_get_child_bus(dev, "pci.0"));
+
     memory_region_init_alias(isa, NULL, "isa_mmio", get_system_io(),
                              0, 0x10000);
     memory_region_add_subregion(get_system_memory(), 0xc08000000, isa);
-- 
2.21.3


