Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1592EA0CA
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 00:29:31 +0100 (CET)
Received: from localhost ([::1]:43848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwZI2-0002Yk-4Q
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 18:29:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kwZCC-00066I-8f; Mon, 04 Jan 2021 18:23:28 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:55669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kwZC7-0007ym-P4; Mon, 04 Jan 2021 18:23:28 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id A4D7B7470F0;
 Tue,  5 Jan 2021 00:23:20 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 1C6257470DF; Tue,  5 Jan 2021 00:23:20 +0100 (CET)
Message-Id: <6a97eaad3faf7fe5c998f6e8953f6b851cf8757e.1609802040.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1609802040.git.balaton@eik.bme.hu>
References: <cover.1609802040.git.balaton@eik.bme.hu>
Subject: [PATCH v4 3/4] ppc440_pcix: Fix up pci config access
Date: Tue, 05 Jan 2021 00:14:00 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, f4bug@amsat.org,
 Guenter Roeck <linux@roeck-us.net>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

This fixes a long standing issue with MorphOS booting on sam460ex
which turns out to be because of suspicious values written to PCI
config address that apparently works on real machine but caused wrong
access on this device model. This replaces a previous work around for
this with a better fix that makes it work.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
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
2.21.3


