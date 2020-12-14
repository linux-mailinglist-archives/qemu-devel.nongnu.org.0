Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9917E2D928D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 06:20:38 +0100 (CET)
Received: from localhost ([::1]:53556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kogHl-0001fX-L8
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 00:20:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kofwy-0005wI-7v; Sun, 13 Dec 2020 23:59:08 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:60341 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kofwv-0004uG-Gv; Sun, 13 Dec 2020 23:59:07 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CvTfv5jzwz9sWx; Mon, 14 Dec 2020 15:58:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607921895;
 bh=GANHHFYVShuhZdNxXbeviRaQLeLYW3TTRD3WfP4D4Nw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oYRElc2SGz0sB37kXRp9gqxdVIeedWgOTyiejS7nOIX3+fTEy0ncecumnJ8qgy2By
 GAvXGrGLaAC7uv4LNe4PF1i5e4i+tVNNQKCFrZtpf8zkzKzVsyEWXM/UZbplx9zUDR
 EMK2/uMdyoYQiMvWHfPUban9iGPWdYheasHxNUGc=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 28/30] spapr: Don't use qdev_get_machine() in spapr_msi_write()
Date: Mon, 14 Dec 2020 15:58:05 +1100
Message-Id: <20201214045807.41003-29-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214045807.41003-1-david@gibson.dropbear.id.au>
References: <20201214045807.41003-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
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


