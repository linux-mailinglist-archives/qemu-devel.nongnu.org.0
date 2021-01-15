Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BF22F7F32
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 16:15:40 +0100 (CET)
Received: from localhost ([::1]:47198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Qp9-0000qQ-Ck
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 10:15:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l0Qjn-0004C6-7R
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:10:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l0Qjk-0008Kh-W1
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:10:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610723404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0/+/AX09CbbEizWPkEMvsyLmancVxaiGyOdttwtAppI=;
 b=MLhA3QDqLkgcfmjRfQKmxxbgjU89y/+5i9xlRYsyv1Za2VEIOA/c/xA7u1TfYwR7TrYm0a
 PirYFUzfkEQ3wslqrW9LBIQ3YqZM9LuoH1SbBQsQnO8Pt/mI7o5CAkRMD5ICagisPGB0Nj
 iScoID7X4jU2/EyW49Is5iSzQvfDPNQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-qpePK4vdMIqeUbemEIHxaQ-1; Fri, 15 Jan 2021 10:10:00 -0500
X-MC-Unique: qpePK4vdMIqeUbemEIHxaQ-1
Received: by mail-ed1-f72.google.com with SMTP id u17so3988705edi.18
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 07:10:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0/+/AX09CbbEizWPkEMvsyLmancVxaiGyOdttwtAppI=;
 b=H9odKxqE/Vs+zB03F9tQOcXqXM0V/XuzkWXxnhT5aJE5+lZh74GAgvOjax/flPL/o7
 zngz5OSxu2ry/ZPgOjRi7ErH013wPAKrcLTjXX1aVjxDUh6e9UdTvyu9PBChrtPkMlt8
 IFWlh1KNYcGV23VjpQk0qLs5q3H1Ww3UK4QoIaHvjtcaXNPn7xsDzq/AQoMw7Kng8jep
 xH1dMuUF7uThs8PGY2XUIxEt9GRFEOl2HbsEIPMKqRLImgE8K0bSUCe9jYd2OcRipeMm
 9UENtBfJjlftu1YnziQlSxlxjIJBvohUGjirckMlmx8fB308SjIADY/u0hHYpaDM4ufh
 Wv2w==
X-Gm-Message-State: AOAM531zbSnZigd6RMczrmpN0AVO06iVoURO+fbqJTwZCQvTqAk62+37
 paT28Ldbg+R9cVREr/034lTHtDeZ8pv3c2wa6z3JXjA6OQ/YY5YFhSIGwpMRnY5D+TH7wg1TzVX
 zqYOjEcqYzOxhBwJ+61LNUR+HMsflZdhWhqe1BxFzkzSPVWFAbs1cBAhI/JMRddBS
X-Received: by 2002:a05:6402:1c0f:: with SMTP id
 ck15mr1048692edb.171.1610723398771; 
 Fri, 15 Jan 2021 07:09:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzRmYcfzEbNzRbED9BztKtmSiCCZaTKca9N4JmFSnyd7nzKI3T6HAWLZwmTzZm+xxAptnmmzw==
X-Received: by 2002:a05:6402:1c0f:: with SMTP id
 ck15mr1048665edb.171.1610723398539; 
 Fri, 15 Jan 2021 07:09:58 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id h12sm3667242eja.113.2021.01.15.07.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 07:09:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] tests/qtest: Only run fuzz-megasas-test if megasas device
 is available
Date: Fri, 15 Jan 2021 16:09:35 +0100
Message-Id: <20210115150936.3333282-4-philmd@redhat.com>
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
 Li Qiang <liq3ea@gmail.com>, Hannes Reinecke <hare@suse.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This test fails when QEMU is built without the megasas device,
restrict it to its availability.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/fuzz-megasas-test.c | 49 +++++++++++++++++++++++++++++++++
 tests/qtest/fuzz-test.c         | 25 -----------------
 MAINTAINERS                     |  1 +
 tests/qtest/meson.build         |  4 ++-
 4 files changed, 53 insertions(+), 26 deletions(-)
 create mode 100644 tests/qtest/fuzz-megasas-test.c

diff --git a/tests/qtest/fuzz-megasas-test.c b/tests/qtest/fuzz-megasas-test.c
new file mode 100644
index 00000000000..940a76bf25a
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
index cdb1100a0b8..6188fbb8e96 100644
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
@@ -104,8 +81,6 @@ int main(int argc, char **argv)
     g_test_init(&argc, &argv, NULL);
 
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
-        qtest_add_func("fuzz/test_lp1878263_megasas_zero_iov_cnt",
-                       test_lp1878263_megasas_zero_iov_cnt);
         qtest_add_func("fuzz/test_lp1878642_pci_bus_get_irq_level_assert",
                        test_lp1878642_pci_bus_get_irq_level_assert);
         qtest_add_func("fuzz/test_mmio_oob_from_memory_region_cache",
diff --git a/MAINTAINERS b/MAINTAINERS
index cb0656aec3d..b2ef820a9fa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1925,6 +1925,7 @@ S: Supported
 F: hw/scsi/megasas.c
 F: hw/scsi/mfi.h
 F: tests/qtest/megasas-test.c
+F: tests/qtest/fuzz-megasas-test.c
 
 Network packet abstractions
 M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 874f5d34674..a24e7f1c34a 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -4,7 +4,9 @@
   subdir_done()
 endif
 
-qtests_generic = [
+qtests_generic = \
+  (config_all_devices.has_key('CONFIG_MEGASAS_SCSI_PCI') ? ['fuzz-megasas-test'] : []) + \
+  [
   'cdrom-test',
   'device-introspect-test',
   'machine-none-test',
-- 
2.26.2


