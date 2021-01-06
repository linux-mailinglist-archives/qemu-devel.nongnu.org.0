Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5052EB8BE
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 04:57:49 +0100 (CET)
Received: from localhost ([::1]:41606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwzxE-0002cG-Bn
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 22:57:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzfJ-0006hd-UY; Tue, 05 Jan 2021 22:39:17 -0500
Received: from ozlabs.org ([203.11.71.1]:48741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzfF-0006P6-Gy; Tue, 05 Jan 2021 22:39:17 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4D9ZpK1lSLz9sWw; Wed,  6 Jan 2021 14:38:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1609904313;
 bh=sMZBqqFmHsG8mSupsT416/UnFT1vcm/ceAyC4b17JaU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J57kGEXKaROUTBCr8I6QuuUDxn4arbrkHPVtbQxUIfRDpDlROiqcTGekMjrf2xaJk
 KA93d8h1tURqbJdpsLCVzznxeCDTRZFGE+Pr9j58+SGwAbxsXsNoXPE9K+hpUPA2K8
 53OSpBn/SfSCXwxLOlhPwZ/T9t2xSJ9kVGGN1RcI=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 22/22] ppc440_pcix: Fix up pci config access
Date: Wed,  6 Jan 2021 14:38:16 +1100
Message-Id: <20210106033816.232598-23-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210106033816.232598-1-david@gibson.dropbear.id.au>
References: <20210106033816.232598-1-david@gibson.dropbear.id.au>
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
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan via <qemu-ppc@nongnu.org>

This fixes a long standing issue with MorphOS booting on sam460ex
which turns out to be because of suspicious values written to PCI
config address that apparently works on real machine but caused wrong
access on this device model. This replaces a previous work around for
this with a better fix that makes it work.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <6fd215ab2bc5f8d4455cd20ed1a2f059e4415fe5.1609636173.git.balaton@eik.bme.hu>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/ppc440_pcix.c | 37 ++++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/hw/ppc/ppc440_pcix.c b/hw/ppc/ppc440_pcix.c
index 7829d3e556..91cbcd0504 100644
--- a/hw/ppc/ppc440_pcix.c
+++ b/hw/ppc/ppc440_pcix.c
@@ -449,28 +449,35 @@ static AddressSpace *ppc440_pcix_set_iommu(PCIBus *b, void *opaque, int devfn)
     return &s->bm_as;
 }
 
-/* The default pci_host_data_{read,write} functions in pci/pci_host.c
- * deny access to registers without bit 31 set but our clients want
- * this to work so we have to override these here */
-static void pci_host_data_write(void *opaque, hwaddr addr,
-                                uint64_t val, unsigned len)
+/*
+ * Some guests on sam460ex write all kinds of garbage here such as
+ * missing enable bit and low bits set and still expect this to work
+ * (apparently it does on real hardware because these boot there) so
+ * we have to override these ops here and fix it up
+ */
+static void pci_host_config_write(void *opaque, hwaddr addr,
+                                  uint64_t val, unsigned len)
 {
     PCIHostState *s = opaque;
-    pci_data_write(s->bus, s->config_reg | (addr & 3), val, len);
+
+    if (addr != 0 || len != 4) {
+        return;
+    }
+    s->config_reg = (val & 0xfffffffcULL) | (1UL << 31);
 }
 
-static uint64_t pci_host_data_read(void *opaque,
-                                   hwaddr addr, unsigned len)
+static uint64_t pci_host_config_read(void *opaque, hwaddr addr,
+                                     unsigned len)
 {
     PCIHostState *s = opaque;
-    uint32_t val;
-    val = pci_data_read(s->bus, s->config_reg | (addr & 3), len);
+    uint32_t val = s->config_reg;
+
     return val;
 }
 
-const MemoryRegionOps ppc440_pcix_host_data_ops = {
-    .read = pci_host_data_read,
-    .write = pci_host_data_write,
+const MemoryRegionOps ppc440_pcix_host_conf_ops = {
+    .read = pci_host_config_read,
+    .write = pci_host_config_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
@@ -497,9 +504,9 @@ static void ppc440_pcix_realize(DeviceState *dev, Error **errp)
     pci_setup_iommu(h->bus, ppc440_pcix_set_iommu, s);
 
     memory_region_init(&s->container, OBJECT(s), "pci-container", PCI_ALL_SIZE);
-    memory_region_init_io(&h->conf_mem, OBJECT(s), &pci_host_conf_le_ops,
+    memory_region_init_io(&h->conf_mem, OBJECT(s), &ppc440_pcix_host_conf_ops,
                           h, "pci-conf-idx", 4);
-    memory_region_init_io(&h->data_mem, OBJECT(s), &ppc440_pcix_host_data_ops,
+    memory_region_init_io(&h->data_mem, OBJECT(s), &pci_host_data_le_ops,
                           h, "pci-conf-data", 4);
     memory_region_init_io(&s->iomem, OBJECT(s), &pci_reg_ops, s,
                           "pci.reg", PPC440_REG_SIZE);
-- 
2.29.2


