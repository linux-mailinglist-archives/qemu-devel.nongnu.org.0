Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2311573E48
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 22:54:28 +0200 (CEST)
Received: from localhost ([::1]:49136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBjNL-0000jV-UZ
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 16:54:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@codethink.co.uk>)
 id 1oBg9t-0003zS-JC; Wed, 13 Jul 2022 13:28:21 -0400
Received: from imap5.colo.codethink.co.uk ([78.40.148.171]:54838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@codethink.co.uk>)
 id 1oBg9o-0006ss-8F; Wed, 13 Jul 2022 13:28:20 -0400
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122] helo=rainbowdash)
 by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1oBfdU-003eoT-Ek; Wed, 13 Jul 2022 17:54:50 +0100
Received: from ben by rainbowdash with local (Exim 4.96)
 (envelope-from <ben@rainbowdash>) id 1oBfdS-0009kh-1a;
 Wed, 13 Jul 2022 17:54:50 +0100
From: Ben Dooks <ben.dooks@sifive.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Jude Onyenegecha <jude.onyenegecha@sifive.com>,
 Sudip Mukherjee <sudip.mukherjee@sifive.com>,
 William Salmon <william.salmon@sifive.com>,
 Adnan Chowdhury <adnan.chowdhury@sifive.com>,
 Ben Dooks <ben.dooks@sifive.com>, Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 1/7] pci: designware: add 64-bit viewport limit
Date: Wed, 13 Jul 2022 17:54:43 +0100
Message-Id: <20220713165449.37433-2-ben.dooks@sifive.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220713165449.37433-1-ben.dooks@sifive.com>
References: <20220713165449.37433-1-ben.dooks@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=78.40.148.171; envelope-from=ben@codethink.co.uk;
 helo=imap5.colo.codethink.co.uk
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 13 Jul 2022 16:45:29 -0400
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

Versions 4 and above add support for 64-bit viewport
limit. Add support for the DESIGNWARE_PCIE_ATU_UPPER_LIMIT
regiser where supported.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 hw/pci-host/designware.c         | 22 +++++++++++++++++-----
 include/hw/pci-host/designware.h |  2 +-
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
index bde3a343a2..296f1b9760 100644
--- a/hw/pci-host/designware.c
+++ b/hw/pci-host/designware.c
@@ -54,6 +54,7 @@
 #define DESIGNWARE_PCIE_ATU_BUS(x)                 (((x) >> 24) & 0xff)
 #define DESIGNWARE_PCIE_ATU_DEVFN(x)               (((x) >> 16) & 0xff)
 #define DESIGNWARE_PCIE_ATU_UPPER_TARGET           0x91C
+#define DESIGNWARE_PCIE_ATU_UPPER_LIMIT            0x924
 
 #define DESIGNWARE_PCIE_IRQ_MSI                    3
 
@@ -196,6 +197,10 @@ designware_pcie_root_config_read(PCIDevice *d, uint32_t address, int len)
         val = viewport->target >> 32;
         break;
 
+    case DESIGNWARE_PCIE_ATU_UPPER_LIMIT:
+        val = viewport->limit >> 32;
+        break;
+
     case DESIGNWARE_PCIE_ATU_LIMIT:
         val = viewport->limit;
         break;
@@ -269,7 +274,7 @@ static void designware_pcie_update_viewport(DesignwarePCIERoot *root,
 {
     const uint64_t target = viewport->target;
     const uint64_t base   = viewport->base;
-    const uint64_t size   = (uint64_t)viewport->limit - base + 1;
+    const uint64_t size   = viewport->limit - base + 1;
     const bool enabled    = viewport->cr[1] & DESIGNWARE_PCIE_ATU_ENABLE;
 
     MemoryRegion *current, *other;
@@ -363,14 +368,21 @@ static void designware_pcie_root_config_write(PCIDevice *d, uint32_t address,
         viewport->target |= val;
         break;
 
+    case DESIGNWARE_PCIE_ATU_UPPER_LIMIT:
+        viewport->limit &= 0x00000000FFFFFFFFUL;
+        viewport->limit |= (uint64_t)val << 32;
+        break;
+
     case DESIGNWARE_PCIE_ATU_LIMIT:
-        viewport->limit = val;
+        viewport->limit = 0xFFFFFFFF00000000ULL;
+        viewport->limit |= val;
         break;
 
     case DESIGNWARE_PCIE_ATU_CR1:
         viewport->cr[0] = val;
         break;
     case DESIGNWARE_PCIE_ATU_CR2:
+        //printf("CR2: value %08x\n", val);
         viewport->cr[1] = val;
         designware_pcie_update_viewport(root, viewport);
         break;
@@ -429,7 +441,7 @@ static void designware_pcie_root_realize(PCIDevice *dev, Error **errp)
         viewport->inbound = true;
         viewport->base    = 0x0000000000000000ULL;
         viewport->target  = 0x0000000000000000ULL;
-        viewport->limit   = UINT32_MAX;
+        viewport->limit   = UINT64_MAX-1;
         viewport->cr[0]   = DESIGNWARE_PCIE_ATU_TYPE_MEM;
 
         source      = &host->pci.address_space_root;
@@ -453,7 +465,7 @@ static void designware_pcie_root_realize(PCIDevice *dev, Error **errp)
         viewport->inbound = false;
         viewport->base    = 0x0000000000000000ULL;
         viewport->target  = 0x0000000000000000ULL;
-        viewport->limit   = UINT32_MAX;
+        viewport->limit   = UINT64_MAX-1;
         viewport->cr[0]   = DESIGNWARE_PCIE_ATU_TYPE_MEM;
 
         destination = &host->pci.memory;
@@ -560,7 +572,7 @@ static const VMStateDescription vmstate_designware_pcie_viewport = {
     .fields = (VMStateField[]) {
         VMSTATE_UINT64(base, DesignwarePCIEViewport),
         VMSTATE_UINT64(target, DesignwarePCIEViewport),
-        VMSTATE_UINT32(limit, DesignwarePCIEViewport),
+        VMSTATE_UINT64(limit, DesignwarePCIEViewport),
         VMSTATE_UINT32_ARRAY(cr, DesignwarePCIEViewport, 2),
         VMSTATE_END_OF_LIST()
     }
diff --git a/include/hw/pci-host/designware.h b/include/hw/pci-host/designware.h
index 6d9b51ae67..bd4dd49aec 100644
--- a/include/hw/pci-host/designware.h
+++ b/include/hw/pci-host/designware.h
@@ -44,7 +44,7 @@ typedef struct DesignwarePCIEViewport {
 
     uint64_t base;
     uint64_t target;
-    uint32_t limit;
+    uint64_t limit;
     uint32_t cr[2];
 
     bool inbound;
-- 
2.35.1


