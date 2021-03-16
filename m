Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7216B33E05C
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 22:19:45 +0100 (CET)
Received: from localhost ([::1]:48744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMH6O-0002EZ-Ex
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 17:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMH2c-0005T1-Lq
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:15:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMH2W-0003Ux-6F
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:15:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615929343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jXR1UDOdHdgAjRNgCrwYIvG60Cws8IHe3oGSa2AzoTM=;
 b=BI+gxhgj8B3jk8BOLDLbpLhIle8qrP5zVTk5eNsDzQGCMUPQvqzW3vTZ3xXGmd2LHdFIM8
 Pa8bBOFrRdJkoPN3eYVV52DTI78DfHt1RLZ24vJLV6BDaEswdpuodLX5wj/n2gWCB5jbkj
 8/VKeK0vVKEIZYqgD1jm6XxiCeGV4e8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-X-2xfEjdOZGQwNECaLk6sw-1; Tue, 16 Mar 2021 17:15:39 -0400
X-MC-Unique: X-2xfEjdOZGQwNECaLk6sw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6C6D100C619
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 21:15:38 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2CD9B610AF;
 Tue, 16 Mar 2021 21:15:35 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/16] tests/qtest: Only run fuzz-virtio-scsi when virtio-scsi
 is available
Date: Tue, 16 Mar 2021 17:15:17 -0400
Message-Id: <20210316211531.1649909-3-pbonzini@redhat.com>
In-Reply-To: <20210316211531.1649909-1-pbonzini@redhat.com>
References: <20210316211531.1649909-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

This test fails when QEMU is built without the virtio-scsi device,
restrict it to its availability.

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 MAINTAINERS                         |  1 +
 tests/qtest/fuzz-test.c             | 51 --------------------
 tests/qtest/fuzz-virtio-scsi-test.c | 75 +++++++++++++++++++++++++++++
 tests/qtest/meson.build             |  1 +
 4 files changed, 77 insertions(+), 51 deletions(-)
 create mode 100644 tests/qtest/fuzz-virtio-scsi-test.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 0f560d1b91..71c835bc1d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1759,6 +1759,7 @@ S: Supported
 F: include/hw/scsi/*
 F: hw/scsi/*
 F: tests/qtest/virtio-scsi-test.c
+F: tests/qtest/fuzz-virtio-scsi-test.c
 T: git https://github.com/bonzini/qemu.git scsi-next
 
 SSI
diff --git a/tests/qtest/fuzz-test.c b/tests/qtest/fuzz-test.c
index 631feaf0eb..00149abec7 100644
--- a/tests/qtest/fuzz-test.c
+++ b/tests/qtest/fuzz-test.c
@@ -24,55 +24,6 @@ static void test_lp1878642_pci_bus_get_irq_level_assert(void)
     qtest_quit(s);
 }
 
-/*
- * Here a MemoryRegionCache pointed to an MMIO region but had a
- * larger size than the underlying region.
- */
-static void test_mmio_oob_from_memory_region_cache(void)
-{
-    QTestState *s;
-
-    s = qtest_init("-M pc-q35-5.2 -display none -m 512M "
-		   "-device virtio-scsi,num_queues=8,addr=03.0 ");
-
-    qtest_outl(s, 0xcf8, 0x80001811);
-    qtest_outb(s, 0xcfc, 0x6e);
-    qtest_outl(s, 0xcf8, 0x80001824);
-    qtest_outl(s, 0xcf8, 0x80001813);
-    qtest_outl(s, 0xcfc, 0xa080000);
-    qtest_outl(s, 0xcf8, 0x80001802);
-    qtest_outl(s, 0xcfc, 0x5a175a63);
-    qtest_outb(s, 0x6e08, 0x9e);
-    qtest_writeb(s, 0x9f003, 0xff);
-    qtest_writeb(s, 0x9f004, 0x01);
-    qtest_writeb(s, 0x9e012, 0x0e);
-    qtest_writeb(s, 0x9e01b, 0x0e);
-    qtest_writeb(s, 0x9f006, 0x01);
-    qtest_writeb(s, 0x9f008, 0x01);
-    qtest_writeb(s, 0x9f00a, 0x01);
-    qtest_writeb(s, 0x9f00c, 0x01);
-    qtest_writeb(s, 0x9f00e, 0x01);
-    qtest_writeb(s, 0x9f010, 0x01);
-    qtest_writeb(s, 0x9f012, 0x01);
-    qtest_writeb(s, 0x9f014, 0x01);
-    qtest_writeb(s, 0x9f016, 0x01);
-    qtest_writeb(s, 0x9f018, 0x01);
-    qtest_writeb(s, 0x9f01a, 0x01);
-    qtest_writeb(s, 0x9f01c, 0x01);
-    qtest_writeb(s, 0x9f01e, 0x01);
-    qtest_writeb(s, 0x9f020, 0x01);
-    qtest_writeb(s, 0x9f022, 0x01);
-    qtest_writeb(s, 0x9f024, 0x01);
-    qtest_writeb(s, 0x9f026, 0x01);
-    qtest_writeb(s, 0x9f028, 0x01);
-    qtest_writeb(s, 0x9f02a, 0x01);
-    qtest_writeb(s, 0x9f02c, 0x01);
-    qtest_writeb(s, 0x9f02e, 0x01);
-    qtest_writeb(s, 0x9f030, 0x01);
-    qtest_outb(s, 0x6e10, 0x00);
-    qtest_quit(s);
-}
-
 int main(int argc, char **argv)
 {
     const char *arch = qtest_get_arch();
@@ -82,8 +33,6 @@ int main(int argc, char **argv)
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
         qtest_add_func("fuzz/test_lp1878642_pci_bus_get_irq_level_assert",
                        test_lp1878642_pci_bus_get_irq_level_assert);
-        qtest_add_func("fuzz/test_mmio_oob_from_memory_region_cache",
-                       test_mmio_oob_from_memory_region_cache);
     }
 
     return g_test_run();
diff --git a/tests/qtest/fuzz-virtio-scsi-test.c b/tests/qtest/fuzz-virtio-scsi-test.c
new file mode 100644
index 0000000000..aaf6d10e18
--- /dev/null
+++ b/tests/qtest/fuzz-virtio-scsi-test.c
@@ -0,0 +1,75 @@
+/*
+ * QTest fuzzer-generated testcase for virtio-scsi device
+ *
+ * Copyright (c) 2020 Li Qiang <liq3ea@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+
+#include "libqos/libqtest.h"
+
+/*
+ * Here a MemoryRegionCache pointed to an MMIO region but had a
+ * larger size than the underlying region.
+ */
+static void test_mmio_oob_from_memory_region_cache(void)
+{
+    QTestState *s;
+
+    s = qtest_init("-M pc-q35-5.2 -display none -m 512M "
+                   "-device virtio-scsi,num_queues=8,addr=03.0 ");
+
+    qtest_outl(s, 0xcf8, 0x80001811);
+    qtest_outb(s, 0xcfc, 0x6e);
+    qtest_outl(s, 0xcf8, 0x80001824);
+    qtest_outl(s, 0xcf8, 0x80001813);
+    qtest_outl(s, 0xcfc, 0xa080000);
+    qtest_outl(s, 0xcf8, 0x80001802);
+    qtest_outl(s, 0xcfc, 0x5a175a63);
+    qtest_outb(s, 0x6e08, 0x9e);
+    qtest_writeb(s, 0x9f003, 0xff);
+    qtest_writeb(s, 0x9f004, 0x01);
+    qtest_writeb(s, 0x9e012, 0x0e);
+    qtest_writeb(s, 0x9e01b, 0x0e);
+    qtest_writeb(s, 0x9f006, 0x01);
+    qtest_writeb(s, 0x9f008, 0x01);
+    qtest_writeb(s, 0x9f00a, 0x01);
+    qtest_writeb(s, 0x9f00c, 0x01);
+    qtest_writeb(s, 0x9f00e, 0x01);
+    qtest_writeb(s, 0x9f010, 0x01);
+    qtest_writeb(s, 0x9f012, 0x01);
+    qtest_writeb(s, 0x9f014, 0x01);
+    qtest_writeb(s, 0x9f016, 0x01);
+    qtest_writeb(s, 0x9f018, 0x01);
+    qtest_writeb(s, 0x9f01a, 0x01);
+    qtest_writeb(s, 0x9f01c, 0x01);
+    qtest_writeb(s, 0x9f01e, 0x01);
+    qtest_writeb(s, 0x9f020, 0x01);
+    qtest_writeb(s, 0x9f022, 0x01);
+    qtest_writeb(s, 0x9f024, 0x01);
+    qtest_writeb(s, 0x9f026, 0x01);
+    qtest_writeb(s, 0x9f028, 0x01);
+    qtest_writeb(s, 0x9f02a, 0x01);
+    qtest_writeb(s, 0x9f02c, 0x01);
+    qtest_writeb(s, 0x9f02e, 0x01);
+    qtest_writeb(s, 0x9f030, 0x01);
+    qtest_outb(s, 0x6e10, 0x00);
+    qtest_quit(s);
+}
+
+int main(int argc, char **argv)
+{
+    const char *arch = qtest_get_arch();
+
+    g_test_init(&argc, &argv, NULL);
+
+    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
+        qtest_add_func("fuzz/test_mmio_oob_from_memory_region_cache",
+                       test_mmio_oob_from_memory_region_cache);
+    }
+
+    return g_test_run();
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 536991cdb8..6e871077c1 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -19,6 +19,7 @@ slow_qtests = {
 
 qtests_generic = \
   (config_all_devices.has_key('CONFIG_MEGASAS_SCSI_PCI') ? ['fuzz-megasas-test'] : []) + \
+  (config_all_devices.has_key('CONFIG_VIRTIO_SCSI') ? ['fuzz-virtio-scsi-test'] : []) + \
   [
   'cdrom-test',
   'device-introspect-test',
-- 
2.26.2



