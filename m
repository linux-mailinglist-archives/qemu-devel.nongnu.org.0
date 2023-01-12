Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A30667490
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 15:09:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFyBQ-0002MM-TZ; Thu, 12 Jan 2023 09:03:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyBH-0002Fw-QJ
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyBC-0005yK-1T
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673532221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OxFmAYd2+zXcLOnFuQzyDe+Z10qJZBdfnZtIvf0a/JI=;
 b=gICHTZRbjJdMUz7gp3yYAAOnM3cstKD7hX8LNG2mRk1NSo81ZxIVLtje6TLXOp/5XK52wC
 lyHtnQ7/TirwIXPvdlHJmP61ZGvPUh7ACt+pyExO0HCiiI52ZMIm5KdZDXEruT/DcASIvy
 yGjH746npRn4rZ/NiGq5ONcGJcJrGBg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-45-CsPZQr8oPp6zipOXhH-RFw-1; Thu, 12 Jan 2023 09:03:38 -0500
X-MC-Unique: CsPZQr8oPp6zipOXhH-RFw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 488C51991C4C;
 Thu, 12 Jan 2023 14:03:34 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B61F34085720;
 Thu, 12 Jan 2023 14:03:33 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <ani@anisinha.ca>
Subject: [PATCH 25/40] tests: acpi: add endpoint devices to bridges
Date: Thu, 12 Jan 2023 15:02:57 +0100
Message-Id: <20230112140312.3096331-26-imammedo@redhat.com>
In-Reply-To: <20230112140312.3096331-1-imammedo@redhat.com>
References: <20230112140312.3096331-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

to make sure that they are enumerated or ignored as expected

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test.c | 37 ++++++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index a8c17461c8..22b22c403d 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -875,7 +875,9 @@ static void test_acpi_piix4_tcg_bridge(void)
     data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
     test_vm_prepare("-S"
         " -device pci-bridge,chassis_nr=1"
-        " -device pci-bridge,bus=pci.1,addr=1.0,chassis_nr=2", &data);
+        " -device pci-bridge,bus=pci.1,addr=1.0,chassis_nr=2"
+        " -device pci-testdev,bus=pci.0,addr=5.0"
+        " -device pci-testdev,bus=pci.1", &data);
 
     /* hotplugged bridges section */
     qtest_qmp_device_add(data.qts, "pci-bridge", "hpbr",
@@ -884,6 +886,10 @@ static void test_acpi_piix4_tcg_bridge(void)
         "{'bus': 'pci.1', 'addr': '0xf.1', 'chassis_nr': 4 }");
     qtest_qmp_device_add(data.qts, "pci-bridge", "hpbrhost",
         "{'bus': 'pci.0', 'addr': '4.0', 'chassis_nr': 5 }");
+    qtest_qmp_device_add(data.qts, "pci-testdev", "d1", "{'bus': 'pci.0' }");
+    qtest_qmp_device_add(data.qts, "pci-testdev", "d2", "{'bus': 'pci.1' }");
+    qtest_qmp_device_add(data.qts, "pci-testdev", "d3", "{'bus': 'hpbr', "
+                                   "'addr': '1.0' }");
     qtest_qmp_send(data.qts, "{'execute':'cont' }");
     qtest_qmp_eventwait(data.qts, "RESUME");
 
@@ -907,7 +913,9 @@ static void test_acpi_piix4_no_root_hotplug(void)
     data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
     test_acpi_one("-global PIIX4_PM.acpi-root-pci-hotplug=off "
                   "-device pci-bridge,chassis_nr=1 "
-                  "-device pci-bridge,bus=pci.1,addr=1.0,chassis_nr=2 ", &data);
+                  "-device pci-bridge,bus=pci.1,addr=1.0,chassis_nr=2 "
+                  "-device pci-testdev,bus=pci.0 "
+                  "-device pci-testdev,bus=pci.1", &data);
     free_test_data(&data);
 }
 
@@ -922,7 +930,9 @@ static void test_acpi_piix4_no_bridge_hotplug(void)
     data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
     test_acpi_one("-global PIIX4_PM.acpi-pci-hotplug-with-bridge-support=off "
                   "-device pci-bridge,chassis_nr=1 "
-                  "-device pci-bridge,bus=pci.1,addr=1.0,chassis_nr=2 ", &data);
+                  "-device pci-bridge,bus=pci.1,addr=1.0,chassis_nr=2 "
+                  "-device pci-testdev,bus=pci.0 "
+                  "-device pci-testdev,bus=pci.1,addr=2.0", &data);
     free_test_data(&data);
 }
 
@@ -937,7 +947,9 @@ static void test_acpi_piix4_no_acpi_pci_hotplug(void)
     data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
     test_acpi_one("-global PIIX4_PM.acpi-root-pci-hotplug=off "
                   "-global PIIX4_PM.acpi-pci-hotplug-with-bridge-support=off "
-                  "-device pci-bridge,chassis_nr=1", &data);
+                  "-device pci-bridge,chassis_nr=1 "
+                  "-device pci-testdev,bus=pci.0 "
+                  "-device pci-testdev,bus=pci.1", &data);
     free_test_data(&data);
 }
 
@@ -982,7 +994,9 @@ static void test_acpi_q35_tcg_bridge(void)
     data.variant = ".bridge";
     data.required_struct_types = base_required_struct_types;
     data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
-    test_acpi_one("-device pci-bridge,chassis_nr=1", &data);
+    test_acpi_one("-device pci-bridge,chassis_nr=1,id=br1"
+                  " -device pci-testdev,bus=pcie.0"
+                  " -device pci-testdev,bus=br1", &data);
     free_test_data(&data);
 }
 
@@ -1001,8 +1015,11 @@ static void test_acpi_q35_multif_bridge(void)
         " -device pci-bridge,bus=rp2,chassis_nr=4,id=br1"
         " -device pcie-root-port,id=rphptgt1,port=0x0,chassis=5,addr=2.1"
         " -device pcie-root-port,id=rphptgt2,port=0x0,chassis=6,addr=2.2"
-        " -device pcie-root-port,id=rphptgt3,port=0x0,chassis=7,addr=2.3",
-        &data);
+        " -device pcie-root-port,id=rphptgt3,port=0x0,chassis=7,addr=2.3"
+        " -device pci-testdev,bus=pcie.0,addr=2.4"
+        " -device pci-testdev,bus=pcie.0,addr=5.0"
+        " -device pci-testdev,bus=rp0,addr=0.0"
+        " -device pci-testdev,bus=br1", &data);
 
     /* hotplugged bridges section */
     qtest_qmp_device_add(data.qts, "pci-bridge", "hpbr1",
@@ -1010,7 +1027,11 @@ static void test_acpi_q35_multif_bridge(void)
     qtest_qmp_device_add(data.qts, "pci-bridge", "hpbr2-multiif",
         "{ 'bus': 'br1', 'addr': '2.2', 'chassis_nr': 129 }");
     qtest_qmp_device_add(data.qts, "pcie-pci-bridge", "hpbr3",
-        "{'bus': 'rp0', 'addr': '0.0' }");
+        "{'bus': 'rphptgt1', 'addr': '0.0' }");
+    qtest_qmp_device_add(data.qts, "pcie-root-port", "hprp",
+        "{'bus': 'rphptgt2', 'addr': '0.0' }");
+    qtest_qmp_device_add(data.qts, "pci-testdev", "hpnic",
+        "{'bus': 'rphptgt3', 'addr': '0.0' }");
     qtest_qmp_send(data.qts, "{'execute':'cont' }");
     qtest_qmp_eventwait(data.qts, "RESUME");
 
-- 
2.31.1


