Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C550450A962
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 21:40:33 +0200 (CEST)
Received: from localhost ([::1]:54924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhcfI-0003P3-Rj
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 15:40:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhcWb-0006FR-RQ
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:31:34 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:33424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhcWW-0005bh-Rf
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:31:33 -0400
Received: from [2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhcVf-000Caf-VC; Thu, 21 Apr 2022 20:30:36 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	deller@gmx.de,
	qemu-devel@nongnu.org
Date: Thu, 21 Apr 2022 20:30:18 +0100
Message-Id: <20220421193100.5098-9-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220421193100.5098-1-mark.cave-ayland@ilande.co.uk>
References: <20220421193100.5098-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 08/50] dino: move initial register configuration to new
 dino_pcihost_reset() function
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
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

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/hppa/dino.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c
index ae79ddbf5c..d3cd8578a1 100644
--- a/hw/hppa/dino.c
+++ b/hw/hppa/dino.c
@@ -527,8 +527,6 @@ PCIBus *dino_init(MemoryRegion *addr_space,
     object_property_set_link(OBJECT(dev), "memory-as", OBJECT(addr_space),
                              &error_fatal);
     s = DINO_PCI_HOST_BRIDGE(dev);
-    s->iar0 = s->iar1 = CPU_HPA + 3;
-    s->toc_addr = 0xFFFA0030; /* IO_COMMAND of CPU */
 
     b = s->parent_obj.bus;
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
@@ -542,6 +540,14 @@ PCIBus *dino_init(MemoryRegion *addr_space,
     return b;
 }
 
+static void dino_pcihost_reset(DeviceState *dev)
+{
+    DinoState *s = DINO_PCI_HOST_BRIDGE(dev);
+
+    s->iar0 = s->iar1 = CPU_HPA + 3;
+    s->toc_addr = 0xFFFA0030; /* IO_COMMAND of CPU */
+}
+
 static void dino_pcihost_realize(DeviceState *dev, Error **errp)
 {
     DinoState *s = DINO_PCI_HOST_BRIDGE(dev);
@@ -632,6 +638,7 @@ static void dino_pcihost_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
+    dc->reset = dino_pcihost_reset;
     dc->realize = dino_pcihost_realize;
     dc->unrealize = dino_pcihost_unrealize;
     device_class_set_props(dc, dino_pcihost_properties);
-- 
2.20.1


