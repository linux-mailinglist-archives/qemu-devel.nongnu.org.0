Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D37AE565240
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 12:28:17 +0200 (CEST)
Received: from localhost ([::1]:35942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8JJR-0006M9-0A
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 06:28:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1o8JGs-0004QU-KK
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 06:25:39 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:38136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1o8JGf-0004Ui-Lg
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 06:25:29 -0400
Received: from vla3-850de775f4df.qloud-c.yandex.net
 (vla3-850de775f4df.qloud-c.yandex.net
 [IPv6:2a02:6b8:c15:341d:0:640:850d:e775])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id C6F9B2E11B3;
 Mon,  4 Jul 2022 13:25:15 +0300 (MSK)
Received: from vla5-d6d5ce7a4718.qloud-c.yandex.net
 (vla5-d6d5ce7a4718.qloud-c.yandex.net [2a02:6b8:c18:341e:0:640:d6d5:ce7a])
 by vla3-850de775f4df.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 YLpcwSQTU2-PFJCDQ8s; Mon, 04 Jul 2022 13:25:15 +0300
X-Yandex-Fwd: 2
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1656930315; bh=jDOj5wB7NWueA28G/45o222UGAg+U1GiVycZHoTVMTs=;
 h=Cc:Message-Id:Date:Subject:To:From;
 b=hR4H6WvuHHxIyGSNa3RHElQQ2oRA6O/t68VcFccvySlQQni66sKJqYm5kEtirAqkG
 drSO3Rj6AKl0QyBV2UB3Z2AVIzAiGIZAA8rn3QiOWKGss46wpBhWdc+6ZQnEVe4w3t
 ysvcQjSCNYb3s0SWX1MeVFhZ6FcVcCxGg4OEbkUY=
Authentication-Results: vla3-850de775f4df.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from rvkaganb.yandex-team.ru (unknown [2a02:6b8:b081:b689::1:26])
 by vla5-d6d5ce7a4718.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 p2UjVvhT27-PFU44qct; Mon, 04 Jul 2022 13:25:15 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Roman Kagan <rvkagan@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, yc-core@yandex-team.ru,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH] hw/pci/pci_bridge: ensure PCIe slots have only one slot
Date: Mon,  4 Jul 2022 13:25:14 +0300
Message-Id: <20220704102514.1284827-1-rvkagan@yandex-team.ru>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=rvkagan@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's possible to create non-working configurations by attaching a device
to a derivative of PCIe slot (pcie-root-port, ioh3420, etc) and
specifying a slot number other that zero, e.g.:

    -device pcie-root-port,id=s0,... \
    -device virtio-blk-pci,bus=s0,addr=4,...

Make QEMU reject such configurations and only allow addr=0 on the
secondary bus of a PCIe slot.

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
---
 hw/pci/pci_bridge.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
index da34c8ebcd..8b38d5ad3d 100644
--- a/hw/pci/pci_bridge.c
+++ b/hw/pci/pci_bridge.c
@@ -33,6 +33,7 @@
 #include "qemu/units.h"
 #include "hw/pci/pci_bridge.h"
 #include "hw/pci/pci_bus.h"
+#include "hw/pci/pcie_port.h"
 #include "qemu/module.h"
 #include "qemu/range.h"
 #include "qapi/error.h"
@@ -386,6 +387,10 @@ void pci_bridge_initfn(PCIDevice *dev, const char *typename)
     br->windows = pci_bridge_region_init(br);
     QLIST_INIT(&sec_bus->child);
     QLIST_INSERT_HEAD(&parent->child, sec_bus, sibling);
+
+    if (PCIE_SLOT(dev)) {
+        sec_bus->slot_reserved_mask = ~1u;
+    }
 }
 
 /* default qdev clean up function for PCI-to-PCI bridge */
-- 
2.36.1


