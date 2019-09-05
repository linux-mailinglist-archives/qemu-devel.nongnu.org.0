Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84413A9D1E
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Sep 2019 10:36:06 +0200 (CEST)
Received: from localhost ([::1]:43242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5nFN-0002sA-5i
	for lists+qemu-devel@lfdr.de; Thu, 05 Sep 2019 04:36:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33075)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1i5nAR-0007n6-Rj
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 04:31:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1i5nAQ-0005oh-5b
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 04:30:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43594)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1i5nAP-0005nc-ST
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 04:30:58 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 274A980038D;
 Thu,  5 Sep 2019 08:30:57 +0000 (UTC)
Received: from thuth.com (ovpn-116-96.ams2.redhat.com [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D7445D704;
 Thu,  5 Sep 2019 08:30:56 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu,  5 Sep 2019 10:30:44 +0200
Message-Id: <20190905083049.11645-4-thuth@redhat.com>
In-Reply-To: <20190905083049.11645-1-thuth@redhat.com>
References: <20190905083049.11645-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Thu, 05 Sep 2019 08:30:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 3/8] tests/libqos: Replace clock_step with
 qtest_clock_step in virtio code
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Library functions should not rely on functions that require global_qtest
(since they might get used in tests that deal with multiple states).
Commit 1999a70a05ad603d ("Make generic virtio code independent from
global_qtest") already tried to clean the libqos virtio code, but I
missed to replace the clock_step() function. Thus change it now to
qtest_clock_step() instead.
The logic of the qvirtio_wait_config_isr() function is now pushed
to the virtio-mmio.c and virtio-pci.c files instead, since we can
get the QTestState here easily.

Message-Id: <20190904130047.25808-4-thuth@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/libqos/virtio-mmio.c | 14 +++++++++++++-
 tests/libqos/virtio-pci.c  | 14 +++++++++++++-
 tests/libqos/virtio.c      | 20 ++++++--------------
 tests/libqos/virtio.h      |  6 +++---
 tests/virtio-blk-test.c    |  3 ++-
 5 files changed, 37 insertions(+), 20 deletions(-)

diff --git a/tests/libqos/virtio-mmio.c b/tests/libqos/virtio-mmio.c
index 5f37b51129..d0047876a8 100644
--- a/tests/libqos/virtio-mmio.c
+++ b/tests/libqos/virtio-mmio.c
@@ -101,6 +101,18 @@ static bool qvirtio_mmio_get_config_isr_status(QVirtioDevice *d)
     return false;
 }
 
+static void qvirtio_mmio_wait_config_isr_status(QVirtioDevice *d,
+                                                gint64 timeout_us)
+{
+    QVirtioMMIODevice *dev = container_of(d, QVirtioMMIODevice, vdev);
+    gint64 start_time = g_get_monotonic_time();
+
+    do {
+        g_assert(g_get_monotonic_time() - start_time <= timeout_us);
+        qtest_clock_step(dev->qts, 100);
+    } while (!qvirtio_mmio_get_config_isr_status(d));
+}
+
 static void qvirtio_mmio_queue_select(QVirtioDevice *d, uint16_t index)
 {
     QVirtioMMIODevice *dev = container_of(d, QVirtioMMIODevice, vdev);
@@ -179,7 +191,7 @@ const QVirtioBus qvirtio_mmio = {
     .get_status = qvirtio_mmio_get_status,
     .set_status = qvirtio_mmio_set_status,
     .get_queue_isr_status = qvirtio_mmio_get_queue_isr_status,
-    .get_config_isr_status = qvirtio_mmio_get_config_isr_status,
+    .wait_config_isr_status = qvirtio_mmio_wait_config_isr_status,
     .queue_select = qvirtio_mmio_queue_select,
     .get_queue_size = qvirtio_mmio_get_queue_size,
     .set_queue_address = qvirtio_mmio_set_queue_address,
diff --git a/tests/libqos/virtio-pci.c b/tests/libqos/virtio-pci.c
index 3f55c047a0..50499e75ef 100644
--- a/tests/libqos/virtio-pci.c
+++ b/tests/libqos/virtio-pci.c
@@ -175,6 +175,18 @@ static bool qvirtio_pci_get_config_isr_status(QVirtioDevice *d)
     }
 }
 
+static void qvirtio_pci_wait_config_isr_status(QVirtioDevice *d,
+                                               gint64 timeout_us)
+{
+    QVirtioPCIDevice *dev = container_of(d, QVirtioPCIDevice, vdev);
+    gint64 start_time = g_get_monotonic_time();
+
+    do {
+        g_assert(g_get_monotonic_time() - start_time <= timeout_us);
+        qtest_clock_step(dev->pdev->bus->qts, 100);
+    } while (!qvirtio_pci_get_config_isr_status(d));
+}
+
 static void qvirtio_pci_queue_select(QVirtioDevice *d, uint16_t index)
 {
     QVirtioPCIDevice *dev = container_of(d, QVirtioPCIDevice, vdev);
@@ -257,7 +269,7 @@ const QVirtioBus qvirtio_pci = {
     .get_status = qvirtio_pci_get_status,
     .set_status = qvirtio_pci_set_status,
     .get_queue_isr_status = qvirtio_pci_get_queue_isr_status,
-    .get_config_isr_status = qvirtio_pci_get_config_isr_status,
+    .wait_config_isr_status = qvirtio_pci_wait_config_isr_status,
     .queue_select = qvirtio_pci_queue_select,
     .get_queue_size = qvirtio_pci_get_queue_size,
     .set_queue_address = qvirtio_pci_set_queue_address,
diff --git a/tests/libqos/virtio.c b/tests/libqos/virtio.c
index 91ce06954b..0ae9956fc8 100644
--- a/tests/libqos/virtio.c
+++ b/tests/libqos/virtio.c
@@ -82,13 +82,13 @@ void qvirtio_set_driver_ok(QVirtioDevice *d)
                     VIRTIO_CONFIG_S_DRIVER | VIRTIO_CONFIG_S_ACKNOWLEDGE);
 }
 
-void qvirtio_wait_queue_isr(QVirtioDevice *d,
+void qvirtio_wait_queue_isr(QTestState *qts, QVirtioDevice *d,
                             QVirtQueue *vq, gint64 timeout_us)
 {
     gint64 start_time = g_get_monotonic_time();
 
     for (;;) {
-        clock_step(100);
+        qtest_clock_step(qts, 100);
         if (d->bus->get_queue_isr_status(d, vq)) {
             return;
         }
@@ -109,8 +109,8 @@ uint8_t qvirtio_wait_status_byte_no_isr(QTestState *qts, QVirtioDevice *d,
     gint64 start_time = g_get_monotonic_time();
     uint8_t val;
 
-    while ((val = readb(addr)) == 0xff) {
-        clock_step(100);
+    while ((val = qtest_readb(qts, addr)) == 0xff) {
+        qtest_clock_step(qts, 100);
         g_assert(!d->bus->get_queue_isr_status(d, vq));
         g_assert(g_get_monotonic_time() - start_time <= timeout_us);
     }
@@ -137,7 +137,7 @@ void qvirtio_wait_used_elem(QTestState *qts, QVirtioDevice *d,
     for (;;) {
         uint32_t got_desc_idx;
 
-        clock_step(100);
+        qtest_clock_step(qts, 100);
 
         if (d->bus->get_queue_isr_status(d, vq) &&
             qvirtqueue_get_buf(qts, vq, &got_desc_idx, len)) {
@@ -151,15 +151,7 @@ void qvirtio_wait_used_elem(QTestState *qts, QVirtioDevice *d,
 
 void qvirtio_wait_config_isr(QVirtioDevice *d, gint64 timeout_us)
 {
-    gint64 start_time = g_get_monotonic_time();
-
-    for (;;) {
-        clock_step(100);
-        if (d->bus->get_config_isr_status(d)) {
-            return;
-        }
-        g_assert(g_get_monotonic_time() - start_time <= timeout_us);
-    }
+    d->bus->wait_config_isr_status(d, timeout_us);
 }
 
 void qvring_init(QTestState *qts, const QGuestAllocator *alloc, QVirtQueue *vq,
diff --git a/tests/libqos/virtio.h b/tests/libqos/virtio.h
index 037176dbd8..2cb2448f46 100644
--- a/tests/libqos/virtio.h
+++ b/tests/libqos/virtio.h
@@ -69,8 +69,8 @@ struct QVirtioBus {
     /* Get the queue ISR status of the device */
     bool (*get_queue_isr_status)(QVirtioDevice *d, QVirtQueue *vq);
 
-    /* Get the configuration ISR status of the device */
-    bool (*get_config_isr_status)(QVirtioDevice *d);
+    /* Wait for the configuration ISR status of the device */
+    void (*wait_config_isr_status)(QVirtioDevice *d, gint64 timeout_us);
 
     /* Select a queue to work on */
     void (*queue_select)(QVirtioDevice *d, uint16_t index);
@@ -112,7 +112,7 @@ void qvirtio_set_acknowledge(QVirtioDevice *d);
 void qvirtio_set_driver(QVirtioDevice *d);
 void qvirtio_set_driver_ok(QVirtioDevice *d);
 
-void qvirtio_wait_queue_isr(QVirtioDevice *d,
+void qvirtio_wait_queue_isr(QTestState *qts, QVirtioDevice *d,
                             QVirtQueue *vq, gint64 timeout_us);
 uint8_t qvirtio_wait_status_byte_no_isr(QTestState *qts, QVirtioDevice *d,
                                         QVirtQueue *vq,
diff --git a/tests/virtio-blk-test.c b/tests/virtio-blk-test.c
index 982ff1538c..45375dc4ff 100644
--- a/tests/virtio-blk-test.c
+++ b/tests/virtio-blk-test.c
@@ -737,6 +737,7 @@ static void resize(void *obj, void *data, QGuestAllocator *t_alloc)
     int n_size = TEST_IMAGE_SIZE / 2;
     uint64_t capacity;
     QVirtQueue *vq;
+    QTestState *qts = global_qtest;
 
     vq = qvirtqueue_setup(dev, t_alloc, 0);
 
@@ -746,7 +747,7 @@ static void resize(void *obj, void *data, QGuestAllocator *t_alloc)
                          " 'arguments': { 'device': 'drive0', "
                          " 'size': %d } }", n_size);
 
-    qvirtio_wait_queue_isr(dev, vq, QVIRTIO_BLK_TIMEOUT_US);
+    qvirtio_wait_queue_isr(qts, dev, vq, QVIRTIO_BLK_TIMEOUT_US);
 
     capacity = qvirtio_config_readq(dev, 0);
     g_assert_cmpint(capacity, ==, n_size / 512);
-- 
2.18.1


