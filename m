Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43940702DDB
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 15:18:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyXsL-00072H-5k; Mon, 15 May 2023 09:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pyXqm-0004TM-Qi
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:02:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pyXqi-000105-0T
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:02:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684155767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4oC6DYQAJ/WMunrJ/UoN5sKQd7QsKrd2kF28yVlSAZI=;
 b=YBClCDaOX7vVAjp+Zox+jUOmNq5J2d0UBThD7JeJ6lvQTaMnow7R/U8qszDGLRUfgW7tlK
 jQfmUwhoFc61eTQ2ZO1d16MYDgqKYWpkFHVHXZvX5pmnMcZ2JEe2bT3oQeWC6/iMXop6i8
 PjhMcz3KPVcCD8wgzb0AFgJ0Mwk0CW0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-x9h2COmSNTy7hJJ3mkpQXQ-1; Mon, 15 May 2023 09:02:46 -0400
X-MC-Unique: x9h2COmSNTy7hJJ3mkpQXQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABE193C21BA9;
 Mon, 15 May 2023 13:02:42 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F59740C6EC4;
 Mon, 15 May 2023 13:02:41 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Zhang Chen <chen.zhang@intel.com>
Subject: [PULL 04/21] tests/qtest: replace qmp_discard_response with
 qtest_qmp_assert_success
Date: Mon, 15 May 2023 15:02:16 +0200
Message-Id: <20230515130233.418183-5-thuth@redhat.com>
In-Reply-To: <20230515130233.418183-1-thuth@redhat.com>
References: <20230515130233.418183-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Daniel P. Berrangé <berrange@redhat.com>

The qmp_discard_response method simply ignores the result of the QMP
command, merely unref'ing the object. This is a bad idea for tests
as it leaves no trace if the QMP command unexpectedly failed. The
qtest_qmp_assert_success method will validate that the QMP command
returned without error, and if errors occur, it will print a message
on the console aiding debugging.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20230421171411.566300-2-berrange@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Zhang Chen <chen.zhang@intel.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/ahci-test.c              | 31 ++++++++++++++--------------
 tests/qtest/boot-order-test.c        |  5 +----
 tests/qtest/fdc-test.c               | 15 +++++++-------
 tests/qtest/ide-test.c               |  5 +----
 tests/qtest/migration-test.c         |  5 +----
 tests/qtest/test-filter-mirror.c     |  5 +----
 tests/qtest/test-filter-redirector.c |  7 ++-----
 tests/qtest/virtio-blk-test.c        | 24 ++++++++++-----------
 8 files changed, 40 insertions(+), 57 deletions(-)

diff --git a/tests/qtest/ahci-test.c b/tests/qtest/ahci-test.c
index 1967cd5898..abab761c26 100644
--- a/tests/qtest/ahci-test.c
+++ b/tests/qtest/ahci-test.c
@@ -36,9 +36,6 @@
 #include "hw/pci/pci_ids.h"
 #include "hw/pci/pci_regs.h"
 
-/* TODO actually test the results and get rid of this */
-#define qmp_discard_response(s, ...) qobject_unref(qtest_qmp(s, __VA_ARGS__))
-
 /* Test images sizes in MB */
 #define TEST_IMAGE_SIZE_MB_LARGE (200 * 1024)
 #define TEST_IMAGE_SIZE_MB_SMALL 64
@@ -1595,9 +1592,9 @@ static void test_atapi_tray(void)
     rsp = qtest_qmp_receive(ahci->parent->qts);
     qobject_unref(rsp);
 
-    qmp_discard_response(ahci->parent->qts,
-                         "{'execute': 'blockdev-remove-medium', "
-                         "'arguments': {'id': 'cd0'}}");
+    qtest_qmp_assert_success(ahci->parent->qts,
+                             "{'execute': 'blockdev-remove-medium', "
+                             "'arguments': {'id': 'cd0'}}");
 
     /* Test the tray without a medium */
     ahci_atapi_load(ahci, port);
@@ -1607,16 +1604,18 @@ static void test_atapi_tray(void)
     atapi_wait_tray(ahci, true);
 
     /* Re-insert media */
-    qmp_discard_response(ahci->parent->qts,
-                         "{'execute': 'blockdev-add', "
-                         "'arguments': {'node-name': 'node0', "
-                                        "'driver': 'raw', "
-                                        "'file': { 'driver': 'file', "
-                                                  "'filename': %s }}}", iso);
-    qmp_discard_response(ahci->parent->qts,
-                         "{'execute': 'blockdev-insert-medium',"
-                         "'arguments': { 'id': 'cd0', "
-                                         "'node-name': 'node0' }}");
+    qtest_qmp_assert_success(
+        ahci->parent->qts,
+        "{'execute': 'blockdev-add', "
+        "'arguments': {'node-name': 'node0', "
+                      "'driver': 'raw', "
+                      "'file': { 'driver': 'file', "
+                                "'filename': %s }}}", iso);
+    qtest_qmp_assert_success(
+        ahci->parent->qts,
+        "{'execute': 'blockdev-insert-medium',"
+        "'arguments': { 'id': 'cd0', "
+                       "'node-name': 'node0' }}");
 
     /* Again, the event shows up first */
     qtest_qmp_send(ahci->parent->qts, "{'execute': 'blockdev-close-tray', "
diff --git a/tests/qtest/boot-order-test.c b/tests/qtest/boot-order-test.c
index 0680d79d6d..8f2b6ef05a 100644
--- a/tests/qtest/boot-order-test.c
+++ b/tests/qtest/boot-order-test.c
@@ -16,9 +16,6 @@
 #include "qapi/qmp/qdict.h"
 #include "standard-headers/linux/qemu_fw_cfg.h"
 
-/* TODO actually test the results and get rid of this */
-#define qmp_discard_response(qs, ...) qobject_unref(qtest_qmp(qs, __VA_ARGS__))
-
 typedef struct {
     const char *args;
     uint64_t expected_boot;
@@ -43,7 +40,7 @@ static void test_a_boot_order(const char *machine,
                       machine ?: "", test_args);
     actual = read_boot_order(qts);
     g_assert_cmphex(actual, ==, expected_boot);
-    qmp_discard_response(qts, "{ 'execute': 'system_reset' }");
+    qtest_qmp_assert_success(qts, "{ 'execute': 'system_reset' }");
     /*
      * system_reset only requests reset.  We get a RESET event after
      * the actual reset completes.  Need to wait for that.
diff --git a/tests/qtest/fdc-test.c b/tests/qtest/fdc-test.c
index 1f9b99ad6d..5e8fbda9df 100644
--- a/tests/qtest/fdc-test.c
+++ b/tests/qtest/fdc-test.c
@@ -28,9 +28,6 @@
 #include "libqtest-single.h"
 #include "qapi/qmp/qdict.h"
 
-/* TODO actually test the results and get rid of this */
-#define qmp_discard_response(...) qobject_unref(qmp(__VA_ARGS__))
-
 #define DRIVE_FLOPPY_BLANK \
     "-drive if=floppy,file=null-co://,file.read-zeroes=on,format=raw,size=1440k"
 
@@ -304,9 +301,10 @@ static void test_media_insert(void)
 
     /* Insert media in drive. DSKCHK should not be reset until a step pulse
      * is sent. */
-    qmp_discard_response("{'execute':'blockdev-change-medium', 'arguments':{"
-                         " 'id':'floppy0', 'filename': %s, 'format': 'raw' }}",
-                         test_image);
+    qtest_qmp_assert_success(global_qtest,
+                             "{'execute':'blockdev-change-medium', 'arguments':{"
+                             " 'id':'floppy0', 'filename': %s, 'format': 'raw' }}",
+                             test_image);
 
     dir = inb(FLOPPY_BASE + reg_dir);
     assert_bit_set(dir, DSKCHG);
@@ -335,8 +333,9 @@ static void test_media_change(void)
 
     /* Eject the floppy and check that DSKCHG is set. Reading it out doesn't
      * reset the bit. */
-    qmp_discard_response("{'execute':'eject', 'arguments':{"
-                         " 'id':'floppy0' }}");
+    qtest_qmp_assert_success(global_qtest,
+                             "{'execute':'eject', 'arguments':{"
+                             " 'id':'floppy0' }}");
 
     dir = inb(FLOPPY_BASE + reg_dir);
     assert_bit_set(dir, DSKCHG);
diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c
index dcb050bf9b..d6b4f6e36a 100644
--- a/tests/qtest/ide-test.c
+++ b/tests/qtest/ide-test.c
@@ -34,9 +34,6 @@
 #include "hw/pci/pci_ids.h"
 #include "hw/pci/pci_regs.h"
 
-/* TODO actually test the results and get rid of this */
-#define qmp_discard_response(q, ...) qobject_unref(qtest_qmp(q, __VA_ARGS__))
-
 #define TEST_IMAGE_SIZE 64 * 1024 * 1024
 
 #define IDE_PCI_DEV     1
@@ -766,7 +763,7 @@ static void test_pci_retry_flush(void)
     qtest_qmp_eventwait(qts, "STOP");
 
     /* Complete the command */
-    qmp_discard_response(qts, "{'execute':'cont' }");
+    qtest_qmp_assert_success(qts, "{'execute':'cont' }");
 
     /* Check registers */
     data = qpci_io_readb(dev, ide_bar, reg_device);
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 8a5df84624..b99b49a314 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -40,9 +40,6 @@
 #include "linux/kvm.h"
 #endif
 
-/* TODO actually test the results and get rid of this */
-#define qtest_qmp_discard_response(...) qobject_unref(qtest_qmp(__VA_ARGS__))
-
 unsigned start_address;
 unsigned end_address;
 static bool uffd_feature_thread_id;
@@ -766,7 +763,7 @@ static void test_migrate_end(QTestState *from, QTestState *to, bool test_dest)
             usleep(1000 * 10);
         } while (dest_byte_a == dest_byte_b);
 
-        qtest_qmp_discard_response(to, "{ 'execute' : 'stop'}");
+        qtest_qmp_assert_success(to, "{ 'execute' : 'stop'}");
 
         /* With it stopped, check nothing changes */
         qtest_memread(to, start_address, &dest_byte_c, 1);
diff --git a/tests/qtest/test-filter-mirror.c b/tests/qtest/test-filter-mirror.c
index 248fc88699..adeada3eb8 100644
--- a/tests/qtest/test-filter-mirror.c
+++ b/tests/qtest/test-filter-mirror.c
@@ -16,9 +16,6 @@
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 
-/* TODO actually test the results and get rid of this */
-#define qmp_discard_response(qs, ...) qobject_unref(qtest_qmp(qs, __VA_ARGS__))
-
 static void test_mirror(void)
 {
     int send_sock[2], recv_sock[2];
@@ -52,7 +49,7 @@ static void test_mirror(void)
     };
 
     /* send a qmp command to guarantee that 'connected' is setting to true. */
-    qmp_discard_response(qts, "{ 'execute' : 'query-status'}");
+    qtest_qmp_assert_success(qts, "{ 'execute' : 'query-status'}");
     ret = iov_send(send_sock[0], iov, 2, 0, sizeof(size) + sizeof(send_buf));
     g_assert_cmpint(ret, ==, sizeof(send_buf) + sizeof(size));
     close(send_sock[0]);
diff --git a/tests/qtest/test-filter-redirector.c b/tests/qtest/test-filter-redirector.c
index 24ca9280f8..e72e3b7873 100644
--- a/tests/qtest/test-filter-redirector.c
+++ b/tests/qtest/test-filter-redirector.c
@@ -58,9 +58,6 @@
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 
-/* TODO actually test the results and get rid of this */
-#define qmp_discard_response(qs, ...) qobject_unref(qtest_qmp(qs, __VA_ARGS__))
-
 static void test_redirector_tx(void)
 {
     int backend_sock[2], recv_sock;
@@ -98,7 +95,7 @@ static void test_redirector_tx(void)
     g_assert_cmpint(recv_sock, !=, -1);
 
     /* send a qmp command to guarantee that 'connected' is setting to true. */
-    qmp_discard_response(qts, "{ 'execute' : 'query-status'}");
+    qtest_qmp_assert_success(qts, "{ 'execute' : 'query-status'}");
 
     struct iovec iov[] = {
         {
@@ -176,7 +173,7 @@ static void test_redirector_rx(void)
     send_sock = unix_connect(sock_path1, NULL);
     g_assert_cmpint(send_sock, !=, -1);
     /* send a qmp command to guarantee that 'connected' is setting to true. */
-    qmp_discard_response(qts, "{ 'execute' : 'query-status'}");
+    qtest_qmp_assert_success(qts, "{ 'execute' : 'query-status'}");
 
     ret = iov_send(send_sock, iov, 2, 0, sizeof(size) + sizeof(send_buf));
     g_assert_cmpint(ret, ==, sizeof(send_buf) + sizeof(size));
diff --git a/tests/qtest/virtio-blk-test.c b/tests/qtest/virtio-blk-test.c
index 19c01f808b..98c906ebb4 100644
--- a/tests/qtest/virtio-blk-test.c
+++ b/tests/qtest/virtio-blk-test.c
@@ -17,9 +17,6 @@
 #include "libqos/qgraph.h"
 #include "libqos/virtio-blk.h"
 
-/* TODO actually test the results and get rid of this */
-#define qmp_discard_response(...) qobject_unref(qmp(__VA_ARGS__))
-
 #define TEST_IMAGE_SIZE         (64 * 1024 * 1024)
 #define QVIRTIO_BLK_TIMEOUT_US  (30 * 1000 * 1000)
 #define PCI_SLOT_HP             0x06
@@ -453,9 +450,10 @@ static void config(void *obj, void *data, QGuestAllocator *t_alloc)
 
     qvirtio_set_driver_ok(dev);
 
-    qmp_discard_response("{ 'execute': 'block_resize', "
-                         " 'arguments': { 'device': 'drive0', "
-                         " 'size': %d } }", n_size);
+    qtest_qmp_assert_success(global_qtest,
+                             "{ 'execute': 'block_resize', "
+                             " 'arguments': { 'device': 'drive0', "
+                             " 'size': %d } }", n_size);
     qvirtio_wait_config_isr(dev, QVIRTIO_BLK_TIMEOUT_US);
 
     capacity = qvirtio_config_readq(dev, 0);
@@ -502,9 +500,10 @@ static void msix(void *obj, void *u_data, QGuestAllocator *t_alloc)
 
     qvirtio_set_driver_ok(dev);
 
-    qmp_discard_response("{ 'execute': 'block_resize', "
-                         " 'arguments': { 'device': 'drive0', "
-                         " 'size': %d } }", n_size);
+    qtest_qmp_assert_success(global_qtest,
+                             "{ 'execute': 'block_resize', "
+                             " 'arguments': { 'device': 'drive0', "
+                             " 'size': %d } }", n_size);
 
     qvirtio_wait_config_isr(dev, QVIRTIO_BLK_TIMEOUT_US);
 
@@ -758,9 +757,10 @@ static void resize(void *obj, void *data, QGuestAllocator *t_alloc)
 
     vq = test_basic(dev, t_alloc);
 
-    qmp_discard_response("{ 'execute': 'block_resize', "
-                         " 'arguments': { 'device': 'drive0', "
-                         " 'size': %d } }", n_size);
+    qtest_qmp_assert_success(global_qtest,
+                             "{ 'execute': 'block_resize', "
+                             " 'arguments': { 'device': 'drive0', "
+                             " 'size': %d } }", n_size);
 
     qvirtio_wait_queue_isr(qts, dev, vq, QVIRTIO_BLK_TIMEOUT_US);
 
-- 
2.31.1


