Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5462E2FB21B
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 07:54:21 +0100 (CET)
Received: from localhost ([::1]:46318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1kuC-0007Fe-EG
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 01:54:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l1kRD-000249-JZ; Tue, 19 Jan 2021 01:24:24 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:53051 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l1kRB-0000aQ-7F; Tue, 19 Jan 2021 01:24:23 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DKdrZ5Fnsz9srZ; Tue, 19 Jan 2021 17:23:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1611037406;
 bh=LJ2eQ5x5zz38Rr6VcKg9tAdMi3vH1X07i1g+fXmUXNk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IYKdZpoC1dWWfXqZSzqgPktBKZsfQ2hClnljYtpK94xlsSY33MM/toMHJCo+HtL02
 XIYLYPBgDK4hq000J/6fkGEigkqDHq+e0H88oEYdCJr9Mg2eti/arL5ZIXABmATYPD
 m73Q4SHjDI3mYf+DYRI70QeBwEAKijtoq4QmZpbw=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 08/13] sam460ex: Use type cast macro instead of simple cast
Date: Tue, 19 Jan 2021 17:23:13 +1100
Message-Id: <20210119062318.13857-9-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119062318.13857-1-david@gibson.dropbear.id.au>
References: <20210119062318.13857-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

Use the PCI_BUS type cast macro to convert result of qdev_get_child_bus().
Also remove the check for NULL afterwards which should not be needed
because sysbus_create_simple() uses error_abort and we create the PCI
host object here that's expected to have a PCI bus so this shouldn't
fail. Even if it would fail that would be due to a programmer error so
an error message is not necessary.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <a4dc55b56eed3ce899b7bf9835b980a114c52598.1610143658.git.balaton@eik.bme.hu>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
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
2.29.2


