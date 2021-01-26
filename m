Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FBA303B57
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 12:18:28 +0100 (CET)
Received: from localhost ([::1]:42332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4MMd-0002uc-OE
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 06:18:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4ML8-0001W2-GW
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:16:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4ML6-0008Ew-Ja
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:16:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611659812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pOa+invkTSd9msAOq158KC7sen/JzmgqNE1f7YnfH2U=;
 b=CkIYc/sKsW/JwrrbU6FDbRIF+/zOjKhjWJ92tomaD6I3VvNYbjPFQCWVh0m3ODGrzGNAXX
 kjmXEDT8wvgK7Z3HbMaHqov94sGQzluVwab2Q6WWije0hvCQLOxva66Z58DUf0DEsLe6t7
 juQ3I/i8ETMKxyGFdskXhbocQz/OAMI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-nIzp15VyMVmGHquWMpwWXw-1; Tue, 26 Jan 2021 06:16:49 -0500
X-MC-Unique: nIzp15VyMVmGHquWMpwWXw-1
Received: by mail-ed1-f71.google.com with SMTP id x13so9241776edi.7
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 03:16:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pOa+invkTSd9msAOq158KC7sen/JzmgqNE1f7YnfH2U=;
 b=ql5Vnsq4KTQ5rBZuYYuJJgstsSnhiUHiGQSJXjkaxVjNZNdtUOkKFPK9LLXYPPmn1t
 U2e/Q+c5L6LdHdIaZmLf+byoMd9Pzx31PeNIr1YXCksJOPGp6Wn8qtcQAEf1GtNhs7wo
 ZO5U74jLirYMFeRq2x8Qxqlxj44DqpDgqeqbgCZtXPToZTJKMTeq4h5JhUnqsm0Qr00r
 WktNedoNUkxbPYVk7yhOVwMrLisYGBOE+zmvUJDFkWDslW9dDtN0ja+t/XFvLG+fMN8C
 5IpnjDLgsxbXD2Lv4yeLbKxACgTGVGZRfF7ElyHNun4JT7F8FMfW5R1Suu91FU1m4G73
 epNQ==
X-Gm-Message-State: AOAM5328cddqRUiEQpXntmHULXRfS59Wyyh7dLSn93bPOtNun/UP/Xtq
 uNSdmo4Mvru3LmHuf9qq04OMfmEDpMiVVHHU0UhFIu05a3kBeJU2EW08kmIbV1QMRNBPgsnQ0a/
 LLFJrtufusuN6nk+BHWsH1/THWkzGRaiWeBhF0qKu0tlHFdAPnOcPJzDYK6naxXbv
X-Received: by 2002:a50:fc8c:: with SMTP id f12mr4119201edq.225.1611659807631; 
 Tue, 26 Jan 2021 03:16:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxTDP67weBlp45JOc7dob+dM0iHxeNK7szy/rUJ0V75hf62dePbLWJA+DXrNW5UQ0UoeX1KLA==
X-Received: by 2002:a50:fc8c:: with SMTP id f12mr4119182edq.225.1611659807368; 
 Tue, 26 Jan 2021 03:16:47 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id g14sm9592461ejr.105.2021.01.26.03.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 03:16:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] tests/qtest: Only run fuzz-megasas-test if megasas
 device is available
Date: Tue, 26 Jan 2021 12:16:37 +0100
Message-Id: <20210126111638.3141780-2-philmd@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
 Hannes Reinecke <hare@suse.com>, qemu-block@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
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
index 34359a99b8e..44cd74b03cd 100644
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
index 16d04625b8b..85682d0dfce 100644
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


