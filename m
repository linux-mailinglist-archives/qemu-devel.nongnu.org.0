Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8110303B7E
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 12:23:46 +0100 (CET)
Received: from localhost ([::1]:56100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4MRl-0000Tf-Rv
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 06:23:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4MLF-0001mo-Nb
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:17:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4MLC-0008HY-LN
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:17:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611659818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6y59I937hE7WeSby5lmZT2/B3vYVu6vqOt5kug2kSA0=;
 b=edHrtA7d+At2Nr+0TVN51xzpBAgfjaXQV+adQd7kGSeouZzGwqIHY9gb4xisyTSDN9/0BU
 jMZxoGcsx36z9A9d9jEUkR1MyzBdWvszEan16ybS+pSPQObwLOv90sBWf29wm7URaREYCs
 1Tta3WdxISkiVnejl+qEobwRQs+N+dc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-2o_o5H4TMvSUshGTqYNSqg-1; Tue, 26 Jan 2021 06:16:54 -0500
X-MC-Unique: 2o_o5H4TMvSUshGTqYNSqg-1
Received: by mail-ed1-f70.google.com with SMTP id ck25so9165519edb.16
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 03:16:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6y59I937hE7WeSby5lmZT2/B3vYVu6vqOt5kug2kSA0=;
 b=GgFcjUPrQCX4nq6Er70ZVKTi/LsP31qvsAcPJjUz/tmnZ43yMW8p767GZw338AY2+X
 oATG+86bkOBeS73N6Vuj5JMIPn0HDjBwQn3XfpBytytWKbNSF3156BgeBLYQLDEp+9nN
 U616UGa5tIsnwv8sRTmMaoj72V6xBdcprM3BIoNkZy+ZGpqgtuxl1BvzBEo7WGnOrFn9
 svoOmbe210uxdKY8ld8Yh2clxHelVImEqZKgebwZpcHZiacguZCUAPACm18wDV/KI5N4
 Hl4Sg8hkpaJ5XL9DCBmh3n53/PDcnhBIFINnF5pMhPi+NdP4IbB0Z6wI4vbZ2zUbNNvG
 FtJA==
X-Gm-Message-State: AOAM533HUMjtkLKCbJz+Oih914Nv45TUh3yhkqbC8K3osG0gnKXUuZR0
 bTXyUQwv1xOaJqN9AKfrlCqgAruU8XuIW2ksol70wPFEO157JFdmX9uyDGQpY9J0VBz9A1Q4XUY
 xKcs1Oc3yBqOM4Azc761P/Rq8s6OjD0qUygVVlXp67+Inqy7cBkh6jruOe4hWTZtR
X-Received: by 2002:aa7:c94c:: with SMTP id h12mr4289317edt.40.1611659813269; 
 Tue, 26 Jan 2021 03:16:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzDvIaPKBSY/eFQQGpooa/E16Z3DVFP19bgRXi8IkuWJUM+xxHhANFujGPpl3Ph8jGhIqx8Kg==
X-Received: by 2002:aa7:c94c:: with SMTP id h12mr4289297edt.40.1611659813031; 
 Tue, 26 Jan 2021 03:16:53 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id x21sm526060eje.118.2021.01.26.03.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 03:16:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] tests/qtest: Only run fuzz-virtio-scsi when
 virtio-scsi is available
Date: Tue, 26 Jan 2021 12:16:38 +0100
Message-Id: <20210126111638.3141780-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210126111638.3141780-1-philmd@redhat.com>
References: <20210126111638.3141780-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Hannes Reinecke <hare@suse.com>, qemu-block@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This test fails when QEMU is built without the virtio-scsi device,
restrict it to its availability.

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
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
index 44cd74b03cd..48c0ec41e93 100644
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
index 85682d0dfce..f2090296597 100644
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


