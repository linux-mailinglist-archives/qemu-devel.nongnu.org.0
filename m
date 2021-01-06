Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D46B2EC070
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 16:34:49 +0100 (CET)
Received: from localhost ([::1]:56384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxApk-0000bX-HW
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 10:34:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kxAkS-0003vF-Jd; Wed, 06 Jan 2021 10:29:25 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:13308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kxAkM-00032k-9q; Wed, 06 Jan 2021 10:29:20 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 8A2977470E2;
 Wed,  6 Jan 2021 16:29:11 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 063457470E9; Wed,  6 Jan 2021 16:29:11 +0100 (CET)
Message-Id: <8bc87f574759a3e9e9e8707b1e0947c1ee21fa8c.1609946641.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1609946641.git.balaton@eik.bme.hu>
References: <cover.1609946641.git.balaton@eik.bme.hu>
Subject: [PATCH 3/3] sam460ex: Use type cast macro instead of simple cast
Date: Wed, 06 Jan 2021 16:24:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

Use the PCI_BUS type cast macro to convert result of
qdev_get_child_bus(). Also remove the check for NULL afterwards which
should not be needed because sysbus_create_simple() uses error_abort
and PCI_BUS macro also checks its argument by default so this
shouldn't fail here.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/sam460ex.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 14e6583eb0..cc67e9c39b 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -384,11 +384,8 @@ static void sam460ex_init(MachineState *machine)
     ppc460ex_pcie_init(env);
     /* All PCI irqs are connected to the same UIC pin (cf. UBoot source) */
     dev = sysbus_create_simple("ppc440-pcix-host", 0xc0ec00000, uic[1][0]);
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


