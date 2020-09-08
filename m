Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B2D260A21
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 07:34:58 +0200 (CEST)
Received: from localhost ([::1]:43952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFWHR-0001kW-37
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 01:34:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kFW3q-0006py-0K; Tue, 08 Sep 2020 01:20:54 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:55565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kFW3o-00063c-84; Tue, 08 Sep 2020 01:20:53 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Bltkt3MfTz9sVt; Tue,  8 Sep 2020 15:20:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1599542406;
 bh=xuFY3bXkzkBea1Tgmyi1BGotOMR2WR1yFAUIQhfgKzk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HkGPu1clMi1DpcpIuOs9JvdH6C9C6X8YYGFUnmn5dr9mvOqYYelSUYapyFFe02uSH
 eVrB71UGawGzemgpcmsUW6git8LDMyIyvMzEVqKX2pnlchzrJLk7qyiqMpkACrPAU3
 gux6CXCLHkcj4Dx1KE8v08hXsoXFhj3l7sviFQPE=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 23/33] hw/ppc/ppc4xx_pci: Use ARRAY_SIZE() instead of magic
 value
Date: Tue,  8 Sep 2020 15:19:43 +1000
Message-Id: <20200908051953.1616885-24-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200908051953.1616885-1-david@gibson.dropbear.id.au>
References: <20200908051953.1616885-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: danielhb413@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, bauerman@linux.ibm.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Replace the magic '4' by ARRAY_SIZE(s->irq) which is more explicit.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20200901104043.91383-4-f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/ppc4xx_pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
index 3ea47df71f..cd3f192a13 100644
--- a/hw/ppc/ppc4xx_pci.c
+++ b/hw/ppc/ppc4xx_pci.c
@@ -320,7 +320,8 @@ static void ppc4xx_pcihost_realize(DeviceState *dev, Error **errp)
 
     b = pci_register_root_bus(dev, NULL, ppc4xx_pci_set_irq,
                               ppc4xx_pci_map_irq, s->irq, get_system_memory(),
-                              get_system_io(), 0, 4, TYPE_PCI_BUS);
+                              get_system_io(), 0, ARRAY_SIZE(s->irq),
+                              TYPE_PCI_BUS);
     h->bus = b;
 
     pci_create_simple(b, 0, "ppc4xx-host-bridge");
-- 
2.26.2


