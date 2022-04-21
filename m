Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D9350A949
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 21:35:30 +0200 (CEST)
Received: from localhost ([::1]:37610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhcaP-0005L1-4d
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 15:35:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhcWg-0006Vs-4b
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:31:38 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:33402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhcWV-0005bY-EM
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:31:37 -0400
Received: from [2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhcVa-000Caf-R8; Thu, 21 Apr 2022 20:30:34 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	deller@gmx.de,
	qemu-devel@nongnu.org
Date: Thu, 21 Apr 2022 20:30:15 +0100
Message-Id: <20220421193100.5098-6-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220421193100.5098-1-mark.cave-ayland@ilande.co.uk>
References: <20220421193100.5098-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 05/50] dino: add memory-as property containing a link to the
 memory address space
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
 hw/hppa/dino.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c
index bc27aad5dc..13b2210462 100644
--- a/hw/hppa/dino.c
+++ b/hw/hppa/dino.c
@@ -17,6 +17,7 @@
 #include "hw/irq.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bus.h"
+#include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "hppa_sys.h"
 #include "trace.h"
@@ -124,6 +125,8 @@ struct DinoState {
     MemoryRegion pci_mem;
     MemoryRegion pci_mem_alias[32];
 
+    MemoryRegion *memory_as;
+
     AddressSpace bm_as;
     MemoryRegion bm;
     MemoryRegion bm_ram_alias;
@@ -521,6 +524,8 @@ PCIBus *dino_init(MemoryRegion *addr_space,
     PCIBus *b;
 
     dev = qdev_new(TYPE_DINO_PCI_HOST_BRIDGE);
+    object_property_set_link(OBJECT(dev), "memory-as", OBJECT(addr_space),
+                             &error_fatal);
     s = DINO_PCI_HOST_BRIDGE(dev);
     s->iar0 = s->iar1 = CPU_HPA + 3;
     s->toc_addr = 0xFFFA0030; /* IO_COMMAND of CPU */
@@ -603,10 +608,17 @@ static void dino_pcihost_init(Object *obj)
     sysbus_init_mmio(sbd, &s->this_mem);
 }
 
+static Property dino_pcihost_properties[] = {
+    DEFINE_PROP_LINK("memory-as", DinoState, memory_as, TYPE_MEMORY_REGION,
+                     MemoryRegion *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void dino_pcihost_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
+    device_class_set_props(dc, dino_pcihost_properties);
     dc->vmsd = &vmstate_dino;
 }
 
-- 
2.20.1


