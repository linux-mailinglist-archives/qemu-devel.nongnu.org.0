Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F70842E283
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 22:15:23 +0200 (CEST)
Received: from localhost ([::1]:43640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb78M-0001zG-9U
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 16:15:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mb75V-0006Ve-EU; Thu, 14 Oct 2021 16:12:25 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:12167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mb75R-0002Qb-Vy; Thu, 14 Oct 2021 16:12:25 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id A944B756072;
 Thu, 14 Oct 2021 22:12:18 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 551BA75604D; Thu, 14 Oct 2021 22:12:18 +0200 (CEST)
Message-Id: <9bd8e84d02d91693b71082a1fadeb86e6bce3025.1634241019.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1634241019.git.balaton@eik.bme.hu>
References: <cover.1634241019.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 5/6] ppc/pegasos2: Add constants for PCI config addresses
Date: Thu, 14 Oct 2021 21:50:19 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Define a constant for PCI config addresses to make it clearer what
these numbers are.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/pegasos2.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index a861bf16b8..39e96d323f 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -54,11 +54,13 @@
 
 #define BUS_FREQ_HZ 133333333
 
+#define PCI0_CFG_ADDR 0xcf8
 #define PCI0_MEM_BASE 0xc0000000
 #define PCI0_MEM_SIZE 0x20000000
 #define PCI0_IO_BASE  0xf8000000
 #define PCI0_IO_SIZE  0x10000
 
+#define PCI1_CFG_ADDR 0xc78
 #define PCI1_MEM_BASE 0x80000000
 #define PCI1_MEM_SIZE 0x40000000
 #define PCI1_IO_BASE  0xfe000000
@@ -226,7 +228,7 @@ static void pegasos2_mv_reg_write(Pegasos2MachineState *pm, uint32_t addr,
 static uint32_t pegasos2_pci_config_read(Pegasos2MachineState *pm, int bus,
                                          uint32_t addr, uint32_t len)
 {
-    hwaddr pcicfg = bus ? 0xc78 : 0xcf8;
+    hwaddr pcicfg = bus ? PCI1_CFG_ADDR : PCI0_CFG_ADDR;
     uint64_t val = 0xffffffffULL;
 
     if (len <= 4) {
@@ -239,7 +241,7 @@ static uint32_t pegasos2_pci_config_read(Pegasos2MachineState *pm, int bus,
 static void pegasos2_pci_config_write(Pegasos2MachineState *pm, int bus,
                                       uint32_t addr, uint32_t len, uint32_t val)
 {
-    hwaddr pcicfg = bus ? 0xc78 : 0xcf8;
+    hwaddr pcicfg = bus ? PCI1_CFG_ADDR : PCI0_CFG_ADDR;
 
     pegasos2_mv_reg_write(pm, pcicfg, 4, addr | BIT(31));
     pegasos2_mv_reg_write(pm, pcicfg + 4, len, val);
-- 
2.21.4


