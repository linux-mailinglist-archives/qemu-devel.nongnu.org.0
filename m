Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 672DF9E6BD
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 13:27:56 +0200 (CEST)
Received: from localhost ([::1]:49788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2Zdj-0000Oy-G6
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 07:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41060)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1i2ZcG-0008Fl-TI
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 07:26:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1i2ZcF-00050O-Rv
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 07:26:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33296)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1i2ZcF-000502-Mu
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 07:26:23 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 07C5E59465;
 Tue, 27 Aug 2019 11:26:23 +0000 (UTC)
Received: from thuth.com (ovpn-116-79.ams2.redhat.com [10.36.116.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD18E5D713;
 Tue, 27 Aug 2019 11:26:21 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 27 Aug 2019 13:26:17 +0200
Message-Id: <20190827112617.600-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Tue, 27 Aug 2019 11:26:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] tests/libqos/e1000e: Make e1000e libqos
 functions independent from global_qtest
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

libqos library functions should never depend on functions (like memread(),
memwrite() or clock_step()) that require global_qtest to be set, since
library functions might get used in qtests that track multiple states, too.
Thus let's replace the global_qtest-related functions with their independent
counterparts.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/libqos/e1000e.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/tests/libqos/e1000e.c b/tests/libqos/e1000e.c
index 1d0592974e..560e7a2bb2 100644
--- a/tests/libqos/e1000e.c
+++ b/tests/libqos/e1000e.c
@@ -85,26 +85,32 @@ static uint32_t e1000e_macreg_read(QE1000E *d, uint32_t reg)
 
 void e1000e_tx_ring_push(QE1000E *d, void *descr)
 {
+    QE1000E_PCI *d_pci = container_of(d, QE1000E_PCI, e1000e);
     uint32_t tail = e1000e_macreg_read(d, E1000E_TDT);
     uint32_t len = e1000e_macreg_read(d, E1000E_TDLEN) / E1000E_TXD_LEN;
 
-    memwrite(d->tx_ring + tail * E1000E_TXD_LEN, descr, E1000E_TXD_LEN);
+    qtest_memwrite(d_pci->pci_dev.bus->qts, d->tx_ring + tail * E1000E_TXD_LEN,
+                   descr, E1000E_TXD_LEN);
     e1000e_macreg_write(d, E1000E_TDT, (tail + 1) % len);
 
     /* Read WB data for the packet transmitted */
-    memread(d->tx_ring + tail * E1000E_TXD_LEN, descr, E1000E_TXD_LEN);
+    qtest_memread(d_pci->pci_dev.bus->qts, d->tx_ring + tail * E1000E_TXD_LEN,
+                  descr, E1000E_TXD_LEN);
 }
 
 void e1000e_rx_ring_push(QE1000E *d, void *descr)
 {
+    QE1000E_PCI *d_pci = container_of(d, QE1000E_PCI, e1000e);
     uint32_t tail = e1000e_macreg_read(d, E1000E_RDT);
     uint32_t len = e1000e_macreg_read(d, E1000E_RDLEN) / E1000E_RXD_LEN;
 
-    memwrite(d->rx_ring + tail * E1000E_RXD_LEN, descr, E1000E_RXD_LEN);
+    qtest_memwrite(d_pci->pci_dev.bus->qts, d->rx_ring + tail * E1000E_RXD_LEN,
+                   descr, E1000E_RXD_LEN);
     e1000e_macreg_write(d, E1000E_RDT, (tail + 1) % len);
 
     /* Read WB data for the packet received */
-    memread(d->rx_ring + tail * E1000E_RXD_LEN, descr, E1000E_RXD_LEN);
+    qtest_memread(d_pci->pci_dev.bus->qts, d->rx_ring + tail * E1000E_RXD_LEN,
+                  descr, E1000E_RXD_LEN);
 }
 
 static void e1000e_foreach_callback(QPCIDevice *dev, int devfn, void *data)
@@ -123,7 +129,7 @@ void e1000e_wait_isr(QE1000E *d, uint16_t msg_id)
         if (qpci_msix_pending(&d_pci->pci_dev, msg_id)) {
             return;
         }
-        clock_step(10000);
+        qtest_clock_step(d_pci->pci_dev.bus->qts, 10000);
     } while (g_get_monotonic_time() < end_time);
 
     g_error("Timeout expired");
-- 
2.18.1


