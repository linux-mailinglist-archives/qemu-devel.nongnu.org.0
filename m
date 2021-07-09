Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 120B03C1F0B
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 07:43:55 +0200 (CEST)
Received: from localhost ([::1]:47498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1jIo-0005ng-1E
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 01:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1iuG-0002Pe-4Q; Fri, 09 Jul 2021 01:18:32 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:56113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1iu9-00025C-HX; Fri, 09 Jul 2021 01:18:31 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GLhHf5Zgmz9t8j; Fri,  9 Jul 2021 15:17:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625807854;
 bh=FS0CXh5tr8em9jVtL2JvYY6xzmNt7xn81MDXwdvg4jI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bp4CMN9YWO95EDntamYVEB+ptAkX1bf/efkJk9cdYoI9hkkDovkcs81dRYHVSynvf
 I3KcQZCqUpT8Wx1/MffTfeQAMb4/dq8NJwL6xitsnCaV9h305Oi8jkFoTMw9ia8Cg3
 gTtSO6plywaH6OD/Bkpc1TnpoGWt1mef3rCF/qFw=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 28/33] ppc/pegasos2: Fix use of && instead of &
Date: Fri,  9 Jul 2021 15:17:23 +1000
Message-Id: <20210709051728.170203-29-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210709051728.170203-1-david@gibson.dropbear.id.au>
References: <20210709051728.170203-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: aik@ozlabs.ru, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is obviously intended to be a mask, not a logical operation.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/pegasos2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index f1741a4512..cf1dc53c83 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -584,7 +584,7 @@ static void add_pci_device(PCIBus *bus, PCIDevice *d, void *opaque)
                           pci_get_word(&d->config[PCI_SUBSYSTEM_VENDOR_ID]));
     cells[0] = pci_get_long(&d->config[PCI_CLASS_REVISION]);
     qemu_fdt_setprop_cell(fi->fdt, node->str, "class-code", cells[0] >> 8);
-    qemu_fdt_setprop_cell(fi->fdt, node->str, "revision-id", cells[0] && 0xff);
+    qemu_fdt_setprop_cell(fi->fdt, node->str, "revision-id", cells[0] & 0xff);
     qemu_fdt_setprop_cell(fi->fdt, node->str, "device-id",
                           pci_get_word(&d->config[PCI_DEVICE_ID]));
     qemu_fdt_setprop_cell(fi->fdt, node->str, "vendor-id",
-- 
2.31.1


