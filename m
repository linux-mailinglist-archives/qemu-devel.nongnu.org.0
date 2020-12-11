Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 145272D6F65
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 05:42:45 +0100 (CET)
Received: from localhost ([::1]:55646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knaGS-00088Y-2L
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 23:42:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knZqi-0005ym-Ay; Thu, 10 Dec 2020 23:16:09 -0500
Received: from ozlabs.org ([203.11.71.1]:57039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knZqc-0000un-Vl; Thu, 10 Dec 2020 23:16:06 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Cscrg3PwYz9sXY; Fri, 11 Dec 2020 15:15:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607660115;
 bh=GANHHFYVShuhZdNxXbeviRaQLeLYW3TTRD3WfP4D4Nw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bGGxhjJTtZg7p9cCtQoUGZIQ0CmKFI6kEOjPdqYPygUVqkuaKemVgAeJ4sswVShmM
 oS4zC1dmK06hdU1hMaXRIZ+gksGzIw757wDgrGCKX7pDaNzhn8iVTe//jUcr3DNycw
 SOJNV5Mu7IspqcfGwnnySHzVQFDAcqIiaYd2f6ro=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 28/30] spapr: Don't use qdev_get_machine() in spapr_msi_write()
Date: Fri, 11 Dec 2020 15:15:05 +1100
Message-Id: <20201211041507.425378-29-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201211041507.425378-1-david@gibson.dropbear.id.au>
References: <20201211041507.425378-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

spapr_phb_realize() passes the sPAPR machine state as opaque data
for the I/O callbacks:

memory_region_init_io(&sphb->msiwindow, OBJECT(sphb), &spapr_msi_ops, spapr,
                                                                      ^^^^^
                      "msi", msi_window_size);

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20201209170052.1431440-5-groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index cff76479c7..76d7c91e9c 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -747,7 +747,7 @@ static PCIINTxRoute spapr_route_intx_pin_to_irq(void *opaque, int pin)
 static void spapr_msi_write(void *opaque, hwaddr addr,
                             uint64_t data, unsigned size)
 {
-    SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
+    SpaprMachineState *spapr = opaque;
     uint32_t irq = data;
 
     trace_spapr_pci_msi_write(addr, data, irq);
-- 
2.29.2


