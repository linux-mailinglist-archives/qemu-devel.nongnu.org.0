Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F436A1EAB
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 16:39:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVa9Q-0003n9-PU; Fri, 24 Feb 2023 10:38:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVa9N-0003m5-OX
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:38:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVa9L-0006p4-OL
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:38:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677253098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4ld8lBpIT432/7MrzFztpcfWFq4OSp7oZ7aoNudhbLE=;
 b=YXPwlJW+jHReQcQjAkZhwziUxJYFnVKsXMhZzci1edKAnFuEqA/db+MRtK1GbY/ZfLNYps
 lMCAUZ5AaWNx7btHbIJ3tzr0qqfTK9VmhDOUTCVSSBwaeJxDas27y5XsvSvXPHnTwMT0SE
 pD9y+iEgg2mISKAO/4A78ncUneBWdbM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-21-CaW21L8yPaeExSPSK2CNUQ-1; Fri, 24 Feb 2023 10:38:17 -0500
X-MC-Unique: CaW21L8yPaeExSPSK2CNUQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6CB003C02528;
 Fri, 24 Feb 2023 15:38:16 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C2279492B12;
 Fri, 24 Feb 2023 15:38:15 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	ani@anisinha.ca,
	berrange@redhat.com
Subject: [PATCH 02/33] tests: acpi: add test_acpi_q35_tcg_no_acpi_hotplug test
 and extend test_acpi_piix4_no_acpi_pci_hotplug
Date: Fri, 24 Feb 2023 16:37:41 +0100
Message-Id: <20230224153812.4176226-3-imammedo@redhat.com>
In-Reply-To: <20230224153812.4176226-1-imammedo@redhat.com>
References: <20230224153812.4176226-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

test bridge AML generator with ACPI PCI hotplug disabled
(i.e. with native hotplug enabled/disabled per bridge/root port)

PS:
while at make sure that devices on pci-bridge are starting
from addr=1.0 as slot 0 is not available there and test
passes only because of a bug in ACPI hotplug that will be
fixed by follow up patch

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test.c | 42 +++++++++++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index d29a4e47af..5128b62634 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -949,9 +949,14 @@ static void test_acpi_piix4_no_acpi_pci_hotplug(void)
     data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
     test_acpi_one("-global PIIX4_PM.acpi-root-pci-hotplug=off "
                   "-global PIIX4_PM.acpi-pci-hotplug-with-bridge-support=off "
-                  "-device pci-bridge,chassis_nr=1 "
-                  "-device pci-testdev,bus=pci.0 "
-                  "-device pci-testdev,bus=pci.1", &data);
+                  "-device pci-bridge,chassis_nr=1,addr=4.0 "
+                  "-device pci-testdev,bus=pci.0,addr=5.0 "
+                  "-device pci-testdev,bus=pci.0,addr=6.0,acpi-index=101 "
+                  "-device pci-testdev,bus=pci.1,addr=1.0 "
+                  "-device pci-testdev,bus=pci.1,addr=2.0,acpi-index=201 "
+                  "-device pci-bridge,id=nhpbr,chassis_nr=2,shpc=off,addr=7.0 "
+                  "-device pci-testdev,bus=nhpbr,addr=1.0,acpi-index=301 "
+                  , &data);
     free_test_data(&data);
 }
 
@@ -1002,6 +1007,35 @@ static void test_acpi_q35_tcg_bridge(void)
     free_test_data(&data);
 }
 
+static void test_acpi_q35_tcg_no_acpi_hotplug(void)
+{
+    test_data data;
+
+    memset(&data, 0, sizeof(data));
+    data.machine = MACHINE_Q35;
+    data.variant = ".noacpihp";
+    data.required_struct_types = base_required_struct_types;
+    data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
+    test_acpi_one("-global ICH9-LPC.acpi-pci-hotplug-with-bridge-support=off"
+        " -device pci-testdev,bus=pcie.0,acpi-index=101,addr=3.0"
+        " -device pci-bridge,chassis_nr=1,id=shpcbr,addr=4.0"
+        " -device pci-testdev,bus=shpcbr,addr=1.0,acpi-index=201"
+        " -device pci-bridge,chassis_nr=2,shpc=off,id=noshpcbr,addr=5.0"
+        " -device pci-testdev,bus=noshpcbr,addr=1.0,acpi-index=301"
+        " -device pcie-root-port,id=hprp,port=0x0,chassis=1,addr=6.0"
+        " -device pci-testdev,bus=hprp,acpi-index=401"
+        " -device pcie-root-port,id=nohprp,port=0x0,chassis=2,hotplug=off,"
+                                 "addr=7.0"
+        " -device pci-testdev,bus=nohprp,acpi-index=501"
+        " -device pcie-root-port,id=nohprpint,port=0x0,chassis=3,hotplug=off,"
+                                 "addr=8.0"
+        " -device pcie-root-port,id=hprp2,port=0x0,chassis=4,bus=nohprpint,"
+                                 "addr=9.0"
+        " -device pci-testdev,bus=hprp2,acpi-index=601"
+        , &data);
+    free_test_data(&data);
+}
+
 static void test_acpi_q35_multif_bridge(void)
 {
     test_data data = {
@@ -2161,6 +2195,8 @@ int main(int argc, char *argv[])
                                test_acpi_q35_tcg_tpm12_tis);
             }
             qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
+            qtest_add_func("acpi/q35/no-acpi-hotplug",
+                           test_acpi_q35_tcg_no_acpi_hotplug);
             qtest_add_func("acpi/q35/multif-bridge",
                            test_acpi_q35_multif_bridge);
             qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
-- 
2.39.1


