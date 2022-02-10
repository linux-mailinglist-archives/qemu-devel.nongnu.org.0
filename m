Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 630624B1525
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 19:21:04 +0100 (CET)
Received: from localhost ([::1]:57112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIE3y-0002i5-Nq
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 13:21:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nIAp3-0005fc-F6
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 09:53:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nIAp1-00047C-4T
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 09:53:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644504792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fENC+O3UhoRJJhdlv001UiHe5IQNH33OXw44Tup2W2k=;
 b=S6MR26yPBk2hF+8GzwoOjqlsCh4x3rsHCgbZgSHVXoLibRdwNfnBumzSU5ICeKbZNPAG2V
 CyK+mHtxFoqV94ZWiCGJ33GiiWQPDVCFqx2HDs+thGlbnmjIg8INBDOCaix/iLv1XB9itU
 RtZRZ3ioNqfWZFewATFB9lN6rZkG0lk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-s1Q1bC0eNf6dpLga_xCSqA-1; Thu, 10 Feb 2022 09:53:09 -0500
X-MC-Unique: s1Q1bC0eNf6dpLga_xCSqA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AD95593BC;
 Thu, 10 Feb 2022 14:53:07 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.195.249])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B756770D5F;
 Thu, 10 Feb 2022 14:53:04 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, pbonzini@redhat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com,
 david@gibson.dropbear.id.au, clg@kaod.org, eesposit@redhat.com,
 Coiby.Xu@gmail.com, stefanha@redhat.com
Subject: [PATCH v3 2/5] tests/qtest/libqos/pci: Introduce pio_limit
Date: Thu, 10 Feb 2022 15:52:51 +0100
Message-Id: <20220210145254.157790-3-eric.auger@redhat.com>
In-Reply-To: <20220210145254.157790-1-eric.auger@redhat.com>
References: <20220210145254.157790-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: jean-philippe@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At the moment the IO space limit is hardcoded to
QPCI_PIO_LIMIT = 0x10000. When accesses are performed to a bar,
the base address of this latter is compared against the limit
to decide whether we perform an IO or a memory access.

On ARM, we cannot keep this PIO limit as the arm-virt machine
uses [0x3eff0000, 0x3f000000 ] for the IO space map and we
are mandated to allocate at 0x0.

Add a new flag in QPCIBar indicating whether it is an IO bar
or a memory bar. This flag is set on QPCIBar allocation and
provisionned based on the BAR configuration. Then the new flag
is used in access functions and in iomap() function.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/libqos/pci-pc.c    |  1 +
 tests/qtest/libqos/pci-spapr.c |  1 +
 tests/qtest/libqos/pci.c       | 78 ++++++++++++++++++++++------------
 tests/qtest/libqos/pci.h       |  5 +--
 4 files changed, 54 insertions(+), 31 deletions(-)

diff --git a/tests/qtest/libqos/pci-pc.c b/tests/qtest/libqos/pci-pc.c
index f97844289f..8051a0881a 100644
--- a/tests/qtest/libqos/pci-pc.c
+++ b/tests/qtest/libqos/pci-pc.c
@@ -150,6 +150,7 @@ void qpci_init_pc(QPCIBusPC *qpci, QTestState *qts, QGuestAllocator *alloc)
 
     qpci->bus.qts = qts;
     qpci->bus.pio_alloc_ptr = 0xc000;
+    qpci->bus.pio_limit = 0x10000;
     qpci->bus.mmio_alloc_ptr = 0xE0000000;
     qpci->bus.mmio_limit = 0x100000000ULL;
 
diff --git a/tests/qtest/libqos/pci-spapr.c b/tests/qtest/libqos/pci-spapr.c
index 262226985f..870ffdd8b5 100644
--- a/tests/qtest/libqos/pci-spapr.c
+++ b/tests/qtest/libqos/pci-spapr.c
@@ -197,6 +197,7 @@ void qpci_init_spapr(QPCIBusSPAPR *qpci, QTestState *qts,
 
     qpci->bus.qts = qts;
     qpci->bus.pio_alloc_ptr = 0xc000;
+    qpci->bus.pio_limit = 0x10000;
     qpci->bus.mmio_alloc_ptr = qpci->mmio32.pci_base;
     qpci->bus.mmio_limit = qpci->mmio32.pci_base + qpci->mmio32.size;
 
diff --git a/tests/qtest/libqos/pci.c b/tests/qtest/libqos/pci.c
index 3a9076ae58..b23d72346b 100644
--- a/tests/qtest/libqos/pci.c
+++ b/tests/qtest/libqos/pci.c
@@ -398,44 +398,56 @@ void qpci_config_writel(QPCIDevice *dev, uint8_t offset, uint32_t value)
 
 uint8_t qpci_io_readb(QPCIDevice *dev, QPCIBar token, uint64_t off)
 {
-    if (token.addr < QPCI_PIO_LIMIT) {
-        return dev->bus->pio_readb(dev->bus, token.addr + off);
+    QPCIBus *bus = dev->bus;
+
+    if (token.is_io) {
+        return bus->pio_readb(bus, token.addr + off);
     } else {
         uint8_t val;
-        dev->bus->memread(dev->bus, token.addr + off, &val, sizeof(val));
+
+        bus->memread(dev->bus, token.addr + off, &val, sizeof(val));
         return val;
     }
 }
 
 uint16_t qpci_io_readw(QPCIDevice *dev, QPCIBar token, uint64_t off)
 {
-    if (token.addr < QPCI_PIO_LIMIT) {
-        return dev->bus->pio_readw(dev->bus, token.addr + off);
+    QPCIBus *bus = dev->bus;
+
+    if (token.is_io) {
+        return bus->pio_readw(bus, token.addr + off);
     } else {
         uint16_t val;
-        dev->bus->memread(dev->bus, token.addr + off, &val, sizeof(val));
+
+        bus->memread(bus, token.addr + off, &val, sizeof(val));
         return le16_to_cpu(val);
     }
 }
 
 uint32_t qpci_io_readl(QPCIDevice *dev, QPCIBar token, uint64_t off)
 {
-    if (token.addr < QPCI_PIO_LIMIT) {
-        return dev->bus->pio_readl(dev->bus, token.addr + off);
+    QPCIBus *bus = dev->bus;
+
+    if (token.is_io) {
+        return bus->pio_readl(bus, token.addr + off);
     } else {
         uint32_t val;
-        dev->bus->memread(dev->bus, token.addr + off, &val, sizeof(val));
+
+        bus->memread(dev->bus, token.addr + off, &val, sizeof(val));
         return le32_to_cpu(val);
     }
 }
 
 uint64_t qpci_io_readq(QPCIDevice *dev, QPCIBar token, uint64_t off)
 {
-    if (token.addr < QPCI_PIO_LIMIT) {
-        return dev->bus->pio_readq(dev->bus, token.addr + off);
+    QPCIBus *bus = dev->bus;
+
+    if (token.is_io) {
+        return bus->pio_readq(bus, token.addr + off);
     } else {
         uint64_t val;
-        dev->bus->memread(dev->bus, token.addr + off, &val, sizeof(val));
+
+        bus->memread(bus, token.addr + off, &val, sizeof(val));
         return le64_to_cpu(val);
     }
 }
@@ -443,57 +455,65 @@ uint64_t qpci_io_readq(QPCIDevice *dev, QPCIBar token, uint64_t off)
 void qpci_io_writeb(QPCIDevice *dev, QPCIBar token, uint64_t off,
                     uint8_t value)
 {
-    if (token.addr < QPCI_PIO_LIMIT) {
-        dev->bus->pio_writeb(dev->bus, token.addr + off, value);
+    QPCIBus *bus = dev->bus;
+
+    if (token.is_io) {
+        bus->pio_writeb(bus, token.addr + off, value);
     } else {
-        dev->bus->memwrite(dev->bus, token.addr + off, &value, sizeof(value));
+        bus->memwrite(bus, token.addr + off, &value, sizeof(value));
     }
 }
 
 void qpci_io_writew(QPCIDevice *dev, QPCIBar token, uint64_t off,
                     uint16_t value)
 {
-    if (token.addr < QPCI_PIO_LIMIT) {
-        dev->bus->pio_writew(dev->bus, token.addr + off, value);
+    QPCIBus *bus = dev->bus;
+
+    if (token.is_io) {
+        bus->pio_writew(bus, token.addr + off, value);
     } else {
         value = cpu_to_le16(value);
-        dev->bus->memwrite(dev->bus, token.addr + off, &value, sizeof(value));
+        bus->memwrite(bus, token.addr + off, &value, sizeof(value));
     }
 }
 
 void qpci_io_writel(QPCIDevice *dev, QPCIBar token, uint64_t off,
                     uint32_t value)
 {
-    if (token.addr < QPCI_PIO_LIMIT) {
-        dev->bus->pio_writel(dev->bus, token.addr + off, value);
+    QPCIBus *bus = dev->bus;
+
+    if (token.is_io) {
+        bus->pio_writel(bus, token.addr + off, value);
     } else {
         value = cpu_to_le32(value);
-        dev->bus->memwrite(dev->bus, token.addr + off, &value, sizeof(value));
+        bus->memwrite(bus, token.addr + off, &value, sizeof(value));
     }
 }
 
 void qpci_io_writeq(QPCIDevice *dev, QPCIBar token, uint64_t off,
                     uint64_t value)
 {
-    if (token.addr < QPCI_PIO_LIMIT) {
-        dev->bus->pio_writeq(dev->bus, token.addr + off, value);
+    QPCIBus *bus = dev->bus;
+
+    if (token.is_io) {
+        bus->pio_writeq(bus, token.addr + off, value);
     } else {
         value = cpu_to_le64(value);
-        dev->bus->memwrite(dev->bus, token.addr + off, &value, sizeof(value));
+        bus->memwrite(bus, token.addr + off, &value, sizeof(value));
     }
 }
 
 void qpci_memread(QPCIDevice *dev, QPCIBar token, uint64_t off,
                   void *buf, size_t len)
 {
-    g_assert(token.addr >= QPCI_PIO_LIMIT);
+    g_assert(!token.is_io);
     dev->bus->memread(dev->bus, token.addr + off, buf, len);
 }
 
 void qpci_memwrite(QPCIDevice *dev, QPCIBar token, uint64_t off,
                    const void *buf, size_t len)
 {
-    g_assert(token.addr >= QPCI_PIO_LIMIT);
+    g_assert(!token.is_io);
     dev->bus->memwrite(dev->bus, token.addr + off, buf, len);
 }
 
@@ -534,9 +554,10 @@ QPCIBar qpci_iomap(QPCIDevice *dev, int barno, uint64_t *sizeptr)
         loc = QEMU_ALIGN_UP(bus->pio_alloc_ptr, size);
 
         g_assert(loc >= bus->pio_alloc_ptr);
-        g_assert(loc + size <= QPCI_PIO_LIMIT); /* Keep PIO below 64kiB */
+        g_assert(loc + size <= bus->pio_limit);
 
         bus->pio_alloc_ptr = loc + size;
+        bar.is_io = true;
 
         qpci_config_writel(dev, bar_reg, loc | PCI_BASE_ADDRESS_SPACE_IO);
     } else {
@@ -547,6 +568,7 @@ QPCIBar qpci_iomap(QPCIDevice *dev, int barno, uint64_t *sizeptr)
         g_assert(loc + size <= bus->mmio_limit);
 
         bus->mmio_alloc_ptr = loc + size;
+        bar.is_io = false;
 
         qpci_config_writel(dev, bar_reg, loc);
     }
@@ -562,7 +584,7 @@ void qpci_iounmap(QPCIDevice *dev, QPCIBar bar)
 
 QPCIBar qpci_legacy_iomap(QPCIDevice *dev, uint16_t addr)
 {
-    QPCIBar bar = { .addr = addr };
+    QPCIBar bar = { .addr = addr, .is_io = true };
     return bar;
 }
 
diff --git a/tests/qtest/libqos/pci.h b/tests/qtest/libqos/pci.h
index becb800f9e..44f6806fe4 100644
--- a/tests/qtest/libqos/pci.h
+++ b/tests/qtest/libqos/pci.h
@@ -16,8 +16,6 @@
 #include "libqtest.h"
 #include "qgraph.h"
 
-#define QPCI_PIO_LIMIT    0x10000
-
 #define QPCI_DEVFN(dev, fn) (((dev) << 3) | (fn))
 
 typedef struct QPCIDevice QPCIDevice;
@@ -51,7 +49,7 @@ struct QPCIBus {
                           uint8_t offset, uint32_t value);
 
     QTestState *qts;
-    uint16_t pio_alloc_ptr;
+    uint64_t pio_alloc_ptr, pio_limit;
     uint64_t mmio_alloc_ptr, mmio_limit;
     bool has_buggy_msi; /* TRUE for spapr, FALSE for pci */
 
@@ -59,6 +57,7 @@ struct QPCIBus {
 
 struct QPCIBar {
     uint64_t addr;
+    bool is_io;
 };
 
 struct QPCIDevice
-- 
2.26.3


