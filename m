Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7509C667834
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 15:54:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFyBS-0002Om-R9; Thu, 12 Jan 2023 09:03:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyB9-00027K-Ph
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyB2-0005tS-Sf
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673532210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ned3Y83Tpb+x6d2IOOb4JL2MT1vgFSygrjY7rXYPS9g=;
 b=eY4Pke3X7eSXtPB5OPPOJKwNXytGHUpjeIjnXypvHmuhot5ap62WddqBt1xxFMoFCVRn7t
 pZWB+lecUMjEfYRx+E/2+Nwfq/V9GR5hNxPor1f3QygKzeqdNscRoBXcMMIRXnL76dOwEu
 1Ti6Rik7QFWBC/H1yl73jI5P1oy+72Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-ReU688PHOyev2VqMRjMmZw-1; Thu, 12 Jan 2023 09:03:26 -0500
X-MC-Unique: ReU688PHOyev2VqMRjMmZw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C49BD8030D0;
 Thu, 12 Jan 2023 14:03:25 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3ED8C4085720;
 Thu, 12 Jan 2023 14:03:25 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <ani@anisinha.ca>
Subject: [PATCH 14/40] tests: acpi: extend bridge tests with hotplugged bridges
Date: Thu, 12 Jan 2023 15:02:46 +0100
Message-Id: <20230112140312.3096331-15-imammedo@redhat.com>
In-Reply-To: <20230112140312.3096331-1-imammedo@redhat.com>
References: <20230112140312.3096331-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

with previous commit fixing malformed PCNT calls to hotplugged
bridges, it should be possible add coldplug/hotplug test when
describing PCI topology in DSDT without breeaking CI.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
PS:
no need to update expected blobs as hotplugged bridges
shouldn't be visible (i.e. have its own slots described)
---
 tests/qtest/bios-tables-test.c | 48 ++++++++++++++++++++++++++++------
 1 file changed, 40 insertions(+), 8 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index cb95f687fe..b65e864a9c 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -805,12 +805,15 @@ static char *test_acpi_create_args(test_data *data, const char *params)
     return args;
 }
 
-static void test_acpi_one(const char *params, test_data *data)
+static void test_vm_prepare(const char *params, test_data *data)
 {
-    char *args;
-
-    args = test_acpi_create_args(data, params);
+    char *args = test_acpi_create_args(data, params);
     data->qts = qtest_init(args);
+    g_free(args);
+}
+
+static void process_acpi_tables(test_data *data)
+{
     test_acpi_load_tables(data);
 
     if (getenv(ACPI_REBUILD_EXPECTED_AML)) {
@@ -830,7 +833,12 @@ static void test_acpi_one(const char *params, test_data *data)
     }
 
     qtest_quit(data->qts);
-    g_free(args);
+}
+
+static void test_acpi_one(const char *params, test_data *data)
+{
+    test_vm_prepare(params, data);
+    process_acpi_tables(data);
 }
 
 static uint8_t base_required_struct_types[] = {
@@ -861,8 +869,21 @@ static void test_acpi_piix4_tcg_bridge(void)
     data.variant = ".bridge";
     data.required_struct_types = base_required_struct_types;
     data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
-    test_acpi_one("-device pci-bridge,chassis_nr=1 "
-                  "-device pci-bridge,bus=pci.1,addr=1.0,chassis_nr=2 ", &data);
+    test_vm_prepare("-S"
+        " -device pci-bridge,chassis_nr=1"
+        " -device pci-bridge,bus=pci.1,addr=1.0,chassis_nr=2", &data);
+
+    /* hotplugged bridges section */
+    qtest_qmp_device_add(data.qts, "pci-bridge", "hpbr",
+        "{'bus': 'pci.1', 'addr': '2.0', 'chassis_nr': 3 }");
+    qtest_qmp_device_add(data.qts, "pci-bridge", "hpbr_multifunc",
+        "{'bus': 'pci.1', 'addr': '0xf.1', 'chassis_nr': 4 }");
+    qtest_qmp_device_add(data.qts, "pci-bridge", "hpbrhost",
+        "{'bus': 'pci.0', 'addr': '4.0', 'chassis_nr': 5 }");
+    qtest_qmp_send(data.qts, "{'execute':'cont' }");
+    qtest_qmp_eventwait(data.qts, "RESUME");
+
+    process_acpi_tables(&data);
     free_test_data(&data);
 }
 
@@ -962,7 +983,7 @@ static void test_acpi_q35_multif_bridge(void)
         .machine = MACHINE_Q35,
         .variant = ".multi-bridge",
     };
-    test_acpi_one(
+    test_vm_prepare("-S"
         " -device virtio-balloon,id=balloon0,addr=0x4.0x2"
         " -device pcie-root-port,id=rp0,multifunction=on,"
                   "port=0x0,chassis=1,addr=0x2"
@@ -974,6 +995,17 @@ static void test_acpi_q35_multif_bridge(void)
         " -device pcie-root-port,id=rphptgt3,port=0x0,chassis=7,addr=2.3",
         &data);
 
+    /* hotplugged bridges section */
+    qtest_qmp_device_add(data.qts, "pci-bridge", "hpbr1",
+        "{'bus': 'br1', 'addr': '6.0', 'chassis_nr': 128 }");
+    qtest_qmp_device_add(data.qts, "pci-bridge", "hpbr2-multiif",
+        "{ 'bus': 'br1', 'addr': '2.2', 'chassis_nr': 129 }");
+    qtest_qmp_device_add(data.qts, "pcie-pci-bridge", "hpbr3",
+        "{'bus': 'rp0', 'addr': '0.0' }");
+    qtest_qmp_send(data.qts, "{'execute':'cont' }");
+    qtest_qmp_eventwait(data.qts, "RESUME");
+
+    process_acpi_tables(&data);
     free_test_data(&data);
 }
 
-- 
2.31.1


