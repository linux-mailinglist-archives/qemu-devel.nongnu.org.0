Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A01212F7F23
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 16:13:27 +0100 (CET)
Received: from localhost ([::1]:40042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Qn0-0006KU-Mm
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 10:13:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l0Qjr-0004J9-AP
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:10:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l0Qjp-0008Mr-4P
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:10:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610723408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HJ2rym1EGto3bV2T1JhEJ1XWDZjEYMIZIVaj040uhTQ=;
 b=VbG7sDaR99al4GLWwDjbbhJ5X60ZTWGCWbJ1n+XrF7+1Ve6FfkjRyuO93ZBJzGpxPDQAtX
 Jkb3jum/E0p1fL2lz33OBOBxPH5nDIrfYXDFjzK35MuWABTi/UAqHU3FUP1GBKVgXTDct+
 GyhN4TDS4qzBYnVV3CAG9XRn4OnEZWc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-FsCpDegXMcaSMglyaOPpoA-1; Fri, 15 Jan 2021 10:10:06 -0500
X-MC-Unique: FsCpDegXMcaSMglyaOPpoA-1
Received: by mail-ed1-f72.google.com with SMTP id g14so3993680edt.12
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 07:10:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HJ2rym1EGto3bV2T1JhEJ1XWDZjEYMIZIVaj040uhTQ=;
 b=X3GdHkFdaqrJuYwgUMtRXEZ+6scDD2HbCpe3FbtH9+IF422XlQEX+G/slWJw+hHKmu
 jrlDdHMhnb55HSEyv7khhmIAekfQxn7L3xNolzjGQw+iDHooMDKcvEQ9YvbslXtOlai3
 9mSEGXfC/ZppdGBAGv29ZpsGsRzhYpei+3QU+OB3hS9NooNQ4UjRIQGiz48o3+C8YexE
 7ZrYGQJvGQyUXxz32ioaHoqejJvF9u/qlwPOd5W8usyX8Wr42UXmqvuX5nMm1KkaNbev
 p8oWhuyt0WDh/wftmNqfEiiBdEHFs/6YsImA5U+cSV2MhKy9CgpliLjy2xhVRkCaBqZf
 BTfw==
X-Gm-Message-State: AOAM531XRd+aqDq+mr54CnjhegybMVDCoWOKN/CIBlNeb6KErNFOUEka
 XI88gEswnnCQ+QIIWCpzVDoE50c9qDLqCxmURbdFUk6G5ftfGIxYn8+3LiNApwMMbRvwzn6nqS9
 hK34zR4TrC4fRK8d1ZTyfvX/3Jr7D917iwGP4L93hRt5FYHJK223Oy573QpX2hZ9L
X-Received: by 2002:aa7:d2c9:: with SMTP id k9mr9935684edr.74.1610723404429;
 Fri, 15 Jan 2021 07:10:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzS9HcSW/ye/BYS4c6NE910JKgkETEr3jv/sG4sMOuI9zLsvHfRF3VeU1yphcgZ6TBvjveDDQ==
X-Received: by 2002:aa7:d2c9:: with SMTP id k9mr9935648edr.74.1610723404157;
 Fri, 15 Jan 2021 07:10:04 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id e10sm3451718ejx.48.2021.01.15.07.10.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 07:10:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] tests/qtest: Only run fuzz-virtio-scsi when virtio-scsi
 is available
Date: Fri, 15 Jan 2021 16:09:36 +0100
Message-Id: <20210115150936.3333282-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210115150936.3333282-1-philmd@redhat.com>
References: <20210115150936.3333282-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 Hannes Reinecke <hare@suse.com>, Alexander Bulekov <alxndr@bu.edu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This test fails when QEMU is built without the virtio-scsi device,
restrict it to its availability.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: "Michael S. Tsirkin" <mst@redhat.com>

Note when running check-qtest-i386 I still get this failure:

  qemu-system-i386: Cannot map used

it comes from virtio_init_region_cache().
---
 tests/qtest/fuzz-test.c             | 51 --------------------
 tests/qtest/fuzz-virtio-scsi-test.c | 75 +++++++++++++++++++++++++++++
 MAINTAINERS                         |  1 +
 tests/qtest/meson.build             |  1 +
 4 files changed, 77 insertions(+), 51 deletions(-)
 create mode 100644 tests/qtest/fuzz-virtio-scsi-test.c

diff --git a/tests/qtest/fuzz-test.c b/tests/qtest/fuzz-test.c
index 6188fbb8e96..d112798afe3 100644
--- a/tests/qtest/fuzz-test.c
+++ b/tests/qtest/fuzz-test.c
@@ -25,55 +25,6 @@ static void test_lp1878642_pci_bus_get_irq_level_assert(void)
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
@@ -83,8 +34,6 @@ int main(int argc, char **argv)
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
         qtest_add_func("fuzz/test_lp1878642_pci_bus_get_irq_level_assert",
                        test_lp1878642_pci_bus_get_irq_level_assert);
-        qtest_add_func("fuzz/test_mmio_oob_from_memory_region_cache",
-                       test_mmio_oob_from_memory_region_cache);
     }
 
     return g_test_run();
diff --git a/tests/qtest/fuzz-virtio-scsi-test.c b/tests/qtest/fuzz-virtio-scsi-test.c
new file mode 100644
index 00000000000..aaf6d10e189
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
diff --git a/MAINTAINERS b/MAINTAINERS
index b2ef820a9fa..fcbe3ac79a8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1717,6 +1717,7 @@ S: Supported
 F: include/hw/scsi/*
 F: hw/scsi/*
 F: tests/qtest/virtio-scsi-test.c
+F: tests/qtest/fuzz-virtio-scsi-test.c
 T: git https://github.com/bonzini/qemu.git scsi-next
 
 SSI
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index a24e7f1c34a..fedce3ee3c1 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -6,6 +6,7 @@
 
 qtests_generic = \
   (config_all_devices.has_key('CONFIG_MEGASAS_SCSI_PCI') ? ['fuzz-megasas-test'] : []) + \
+  (config_all_devices.has_key('CONFIG_VIRTIO_SCSI') ? ['fuzz-virtio-scsi-test'] : []) + \
   [
   'cdrom-test',
   'device-introspect-test',
-- 
2.26.2


