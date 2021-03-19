Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7C83417D8
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 09:59:44 +0100 (CET)
Received: from localhost ([::1]:59284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNAyp-0001dT-3u
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 04:59:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNAwA-0000lI-0l
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 04:56:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNAw6-0004xq-47
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 04:56:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616144208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Q48qegkcKEI5XfF58CApS5VUgLsly5FkYipIGNLKris=;
 b=c3yD/GCGzMEPqmeeBIPWgTR/nRZE6Jaw3tF/wHy8C3S9748TpSElU7VSSCF5PEWWibwj7X
 5ob4Nca8nGWnF20+6Rbrg8QMphA+EWRLh5unEnd5amjKsdSygWQRCtGcY6ZLUNzuoEKySX
 V6/CwG/JEBFHJZCKb87BpLMll6Zip30=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-SyuQq2NeMdi1krsvWm6hbw-1; Fri, 19 Mar 2021 04:56:46 -0400
X-MC-Unique: SyuQq2NeMdi1krsvWm6hbw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80D2187A83C
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 08:56:45 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3EF4F60BF1;
 Fri, 19 Mar 2021 08:56:45 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/qtest: cleanup the testcase for bug 1878642
Date: Fri, 19 Mar 2021 04:56:44 -0400
Message-Id: <20210319085644.2082315-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Clean up the writes to the configuration space and the PM region, and
rename the test to lpc-ich9-test.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qtest/{fuzz-test.c => lpc-ich9-test.c} | 12 +++++++-----
 tests/qtest/meson.build                      |  2 +-
 2 files changed, 8 insertions(+), 6 deletions(-)
 rename tests/qtest/{fuzz-test.c => lpc-ich9-test.c} (71%)

diff --git a/tests/qtest/fuzz-test.c b/tests/qtest/lpc-ich9-test.c
similarity index 71%
rename from tests/qtest/fuzz-test.c
rename to tests/qtest/lpc-ich9-test.c
index 00149abec7..fe0bef9980 100644
--- a/tests/qtest/fuzz-test.c
+++ b/tests/qtest/lpc-ich9-test.c
@@ -1,5 +1,5 @@
 /*
- * QTest testcase for fuzz case
+ * QTest testcases for ich9 case
  *
  * Copyright (c) 2020 Li Qiang <liq3ea@gmail.com>
  *
@@ -18,9 +18,11 @@ static void test_lp1878642_pci_bus_get_irq_level_assert(void)
     s = qtest_init("-M pc-q35-5.0 "
                    "-nographic -monitor none -serial none");
 
-    qtest_outl(s, 0xcf8, 0x8400f841);
-    qtest_outl(s, 0xcfc, 0xebed205d);
-    qtest_outl(s, 0x5d02, 0xebed205d);
+    qtest_outl(s, 0xcf8, 0x8000f840); /* PMBASE */
+    qtest_outl(s, 0xcfc, 0x5d00);
+    qtest_outl(s, 0xcf8, 0x8000f844); /* ACPI_CTRL */
+    qtest_outl(s, 0xcfc, 0xeb);
+    qtest_outw(s, 0x5d02, 0x205d);
     qtest_quit(s);
 }
 
@@ -31,7 +33,7 @@ int main(int argc, char **argv)
     g_test_init(&argc, &argv, NULL);
 
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
-        qtest_add_func("fuzz/test_lp1878642_pci_bus_get_irq_level_assert",
+        qtest_add_func("ich9/test_lp1878642_pci_bus_get_irq_level_assert",
                        test_lp1878642_pci_bus_get_irq_level_assert);
     }
 
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 5bee1acd51..72d0f83592 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -57,6 +57,7 @@ qtests_i386 = \
   (config_all_devices.has_key('CONFIG_HDA') ? ['intel-hda-test'] : []) +                    \
   (config_all_devices.has_key('CONFIG_I82801B11') ? ['i82801b11-test'] : []) +             \
   (config_all_devices.has_key('CONFIG_IOH3420') ? ['ioh3420-test'] : []) +                  \
+  (config_all_devices.has_key('CONFIG_LPC_ICH9') ? ['lpc-ich9-test'] : []) +              \
   (config_all_devices.has_key('CONFIG_USB_UHCI') ? ['usb-hcd-uhci-test'] : []) +            \
   (config_all_devices.has_key('CONFIG_USB_UHCI') and                                        \
    config_all_devices.has_key('CONFIG_USB_EHCI') ? ['usb-hcd-ehci-test'] : []) +            \
@@ -74,7 +75,6 @@ qtests_i386 = \
    'bios-tables-test',
    'rtc-test',
    'i440fx-test',
-   'fuzz-test',
    'fw_cfg-test',
    'device-plug-test',
    'drive_del-test',
-- 
2.26.2


