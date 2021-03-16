Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD41233E049
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 22:17:44 +0100 (CET)
Received: from localhost ([::1]:40512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMH4R-0007GD-MK
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 17:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMH2W-0005Nk-Bm
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:15:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMH2S-0003TI-E8
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:15:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615929339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MCzAiseVR70Wf4B59DnA32hHCp8wyen0IGUuKqC612k=;
 b=S0elZ8TxbaQSZFC0oaYkN0dAf/Iqi6iKIwZogD1+qTGUMSF2bkcoS+XhGgXfxoq1cJ2p4L
 vK3XshB+LuJtIxiDWuUD40nug7MKbBAqq+u3OgIM90IkXduxX9utJOR0UIKwtt1qXMpqtn
 P8UCLlOCsfGJjk6yE+0aCWHlNPSNKzs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-_EzdpzyoMyWndVhJ3Gb2vw-1; Tue, 16 Mar 2021 17:15:36 -0400
X-MC-Unique: _EzdpzyoMyWndVhJ3Gb2vw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 126EA107ACCD
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 21:15:35 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B43561378D;
 Tue, 16 Mar 2021 21:15:31 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/16] tests/qtest: Only run fuzz-megasas-test if megasas
 device is available
Date: Tue, 16 Mar 2021 17:15:16 -0400
Message-Id: <20210316211531.1649909-2-pbonzini@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

This test fails when QEMU is built without the megasas device,
restrict it to its availability.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 MAINTAINERS                     |  1 +
 tests/qtest/fuzz-megasas-test.c | 49 +++++++++++++++++++++++++++++++++
 tests/qtest/fuzz-test.c         | 25 -----------------
 tests/qtest/meson.build         |  4 ++-
 4 files changed, 53 insertions(+), 26 deletions(-)
 create mode 100644 tests/qtest/fuzz-megasas-test.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 5ca3c9f851..0f560d1b91 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1969,6 +1969,7 @@ S: Supported
 F: hw/scsi/megasas.c
 F: hw/scsi/mfi.h
 F: tests/qtest/megasas-test.c
+F: tests/qtest/fuzz-megasas-test.c
 
 Network packet abstractions
 M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
diff --git a/tests/qtest/fuzz-megasas-test.c b/tests/qtest/fuzz-megasas-test.c
new file mode 100644
index 0000000000..940a76bf25
--- /dev/null
+++ b/tests/qtest/fuzz-megasas-test.c
@@ -0,0 +1,49 @@
+/*
+ * QTest fuzzer-generated testcase for megasas device
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
+ * This used to trigger the assert in scsi_dma_complete
+ * https://bugs.launchpad.net/qemu/+bug/1878263
+ */
+static void test_lp1878263_megasas_zero_iov_cnt(void)
+{
+    QTestState *s;
+
+    s = qtest_init("-nographic -monitor none -serial none "
+                   "-M q35 -device megasas -device scsi-cd,drive=null0 "
+                   "-blockdev driver=null-co,read-zeroes=on,node-name=null0");
+    qtest_outl(s, 0xcf8, 0x80001818);
+    qtest_outl(s, 0xcfc, 0xc101);
+    qtest_outl(s, 0xcf8, 0x8000181c);
+    qtest_outl(s, 0xcf8, 0x80001804);
+    qtest_outw(s, 0xcfc, 0x7);
+    qtest_outl(s, 0xcf8, 0x8000186a);
+    qtest_writeb(s, 0x14, 0xfe);
+    qtest_writeb(s, 0x0, 0x02);
+    qtest_outb(s, 0xc1c0, 0x17);
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
+        qtest_add_func("fuzz/test_lp1878263_megasas_zero_iov_cnt",
+                       test_lp1878263_megasas_zero_iov_cnt);
+    }
+
+    return g_test_run();
+}
diff --git a/tests/qtest/fuzz-test.c b/tests/qtest/fuzz-test.c
index 6f161c93be..631feaf0eb 100644
--- a/tests/qtest/fuzz-test.c
+++ b/tests/qtest/fuzz-test.c
@@ -11,29 +11,6 @@
 
 #include "libqos/libqtest.h"
 
-/*
- * This used to trigger the assert in scsi_dma_complete
- * https://bugs.launchpad.net/qemu/+bug/1878263
- */
-static void test_lp1878263_megasas_zero_iov_cnt(void)
-{
-    QTestState *s;
-
-    s = qtest_init("-nographic -monitor none -serial none "
-                   "-M q35 -device megasas -device scsi-cd,drive=null0 "
-                   "-blockdev driver=null-co,read-zeroes=on,node-name=null0");
-    qtest_outl(s, 0xcf8, 0x80001818);
-    qtest_outl(s, 0xcfc, 0xc101);
-    qtest_outl(s, 0xcf8, 0x8000181c);
-    qtest_outl(s, 0xcf8, 0x80001804);
-    qtest_outw(s, 0xcfc, 0x7);
-    qtest_outl(s, 0xcf8, 0x8000186a);
-    qtest_writeb(s, 0x14, 0xfe);
-    qtest_writeb(s, 0x0, 0x02);
-    qtest_outb(s, 0xc1c0, 0x17);
-    qtest_quit(s);
-}
-
 static void test_lp1878642_pci_bus_get_irq_level_assert(void)
 {
     QTestState *s;
@@ -103,8 +80,6 @@ int main(int argc, char **argv)
     g_test_init(&argc, &argv, NULL);
 
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
-        qtest_add_func("fuzz/test_lp1878263_megasas_zero_iov_cnt",
-                       test_lp1878263_megasas_zero_iov_cnt);
         qtest_add_func("fuzz/test_lp1878642_pci_bus_get_irq_level_assert",
                        test_lp1878642_pci_bus_get_irq_level_assert);
         qtest_add_func("fuzz/test_mmio_oob_from_memory_region_cache",
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 66ee9fbf45..536991cdb8 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -17,7 +17,9 @@ slow_qtests = {
   'test-hmp' : 120,
 }
 
-qtests_generic = [
+qtests_generic = \
+  (config_all_devices.has_key('CONFIG_MEGASAS_SCSI_PCI') ? ['fuzz-megasas-test'] : []) + \
+  [
   'cdrom-test',
   'device-introspect-test',
   'machine-none-test',
-- 
2.26.2



