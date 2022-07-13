Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D07573E23
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 22:49:39 +0200 (CEST)
Received: from localhost ([::1]:40102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBjId-0002jY-OF
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 16:49:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@codethink.co.uk>)
 id 1oBfwJ-0006ZZ-P1; Wed, 13 Jul 2022 13:14:19 -0400
Received: from imap4.hz.codethink.co.uk ([188.40.203.114]:60716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@codethink.co.uk>)
 id 1oBfwI-0003Aa-6c; Wed, 13 Jul 2022 13:14:19 -0400
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122] helo=rainbowdash)
 by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1oBfdU-003M8r-1K; Wed, 13 Jul 2022 17:54:51 +0100
Received: from ben by rainbowdash with local (Exim 4.96)
 (envelope-from <ben@rainbowdash>) id 1oBfdS-0009l5-22;
 Wed, 13 Jul 2022 17:54:50 +0100
From: Ben Dooks <ben.dooks@sifive.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Jude Onyenegecha <jude.onyenegecha@sifive.com>,
 Sudip Mukherjee <sudip.mukherjee@sifive.com>,
 William Salmon <william.salmon@sifive.com>,
 Adnan Chowdhury <adnan.chowdhury@sifive.com>,
 Ben Dooks <ben.dooks@sifive.com>
Subject: [PATCH 7/7] pci: designware: add initial tracing events
Date: Wed, 13 Jul 2022 17:54:49 +0100
Message-Id: <20220713165449.37433-8-ben.dooks@sifive.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220713165449.37433-1-ben.dooks@sifive.com>
References: <20220713165449.37433-1-ben.dooks@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=188.40.203.114; envelope-from=ben@codethink.co.uk;
 helo=imap4.hz.codethink.co.uk
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 13 Jul 2022 16:45:26 -0400
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

Add a couple of tracing events for internal driver updates

Signed-off-by: Ben Dooks <ben.dooks@sifive.com>
---
 hw/pci-host/designware.c | 4 ++++
 hw/pci-host/trace-events | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
index a47ae48071..489959513f 100644
--- a/hw/pci-host/designware.c
+++ b/hw/pci-host/designware.c
@@ -30,6 +30,7 @@
 #include "migration/vmstate.h"
 #include "hw/irq.h"
 #include "hw/pci-host/designware.h"
+#include "trace.h"
 
 #define DESIGNWARE_PCIE_PORT_LINK_CONTROL          0x710
 #define DESIGNWARE_PCIE_PHY_DEBUG_R1               0x72C
@@ -112,6 +113,7 @@ static void designware_pcie_root_update_msi_mapping(DesignwarePCIERoot *root)
     const uint64_t base = root->msi.base;
     const bool enable   = root->msi.intr[0].enable;
 
+    trace_dw_pcie_msi_update(base, enable);
     memory_region_set_address(mem, base);
     memory_region_set_enabled(mem, enable);
 }
@@ -279,6 +281,8 @@ static void designware_pcie_update_viewport(DesignwarePCIERoot *root,
     uint32_t cr0          = viewport->cr[0];
     MemoryRegion *current, *other;
 
+    trace_dw_pcie_viewport_update(target, base, size, cr0, enabled);
+
     if ((cr0 & 0xFF) == DESIGNWARE_PCIE_ATU_TYPE_MEM) {
         current = &viewport->mem;
         other   = &viewport->cfg;
diff --git a/hw/pci-host/trace-events b/hw/pci-host/trace-events
index 437e66ff50..6b064d3c74 100644
--- a/hw/pci-host/trace-events
+++ b/hw/pci-host/trace-events
@@ -3,6 +3,10 @@
 # bonito.c
 bonito_spciconf_small_access(uint64_t addr, unsigned size) "PCI config address is smaller then 32-bit, addr: 0x%"PRIx64", size: %u"
 
+# designware.c
+dw_pcie_msi_update(uint64_t base, int enable) "base 0x%" PRIx64 " enable %d"
+dw_pcie_viewport_update(uint64_t target, uint64_t base, uint64_t limit, uint32_t cr0, int enabled) "target 0x%" PRIx64 " base 0x%" PRIx64 " limit 0x%" PRIx64 " cr0 0x%" PRIx32 " enabled %d"
+
 # grackle.c
 grackle_set_irq(int irq_num, int level) "set_irq num %d level %d"
 
-- 
2.35.1


