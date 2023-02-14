Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F699696254
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 12:23:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRtO8-0007GV-KI; Tue, 14 Feb 2023 06:22:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRtO7-0007Fp-0L
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:22:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRtO5-0002MF-6d
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:22:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676373736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OCs/aOq7sLJyP3C/ti3WseR6tx1jBfr3LPTSus54DHg=;
 b=CrYfUltqmAKRQ80lnp9ULwzh8e6StT75eRTBHJQOLpBL8IIyxyKq7U1BBce/l4TBYj0BB+
 H/UZgekMJZGAb6N81N0pWX8W/ICY6qF087/jb386NCQeShjqen/zSOT7WJkvieAj5h2mHa
 NIMzSO2ZdLaeYYwZWJB/KQeszKVp/So=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-MY0S4qRjNV2ci4NKDrU18A-1; Tue, 14 Feb 2023 06:22:13 -0500
X-MC-Unique: MY0S4qRjNV2ci4NKDrU18A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC7BC857A89;
 Tue, 14 Feb 2023 11:22:12 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AFF85400D927;
 Tue, 14 Feb 2023 11:22:11 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>,
	"Michael S . Tsirkin" <mst@redhat.com>
Subject: [PULL 16/22] tests/qtest: Check for devices in bios-tables-test
Date: Tue, 14 Feb 2023 12:21:42 +0100
Message-Id: <20230214112148.646077-17-thuth@redhat.com>
In-Reply-To: <20230214112148.646077-1-thuth@redhat.com>
References: <20230214112148.646077-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

From: Fabiano Rosas <farosas@suse.de>

Do not include tests that require devices that are not available in
the QEMU build.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20230208194700.11035-10-farosas@suse.de>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/bios-tables-test.c | 75 ++++++++++++++++++++++++++++++++--
 1 file changed, 71 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index d8c8cda58e..d29a4e47af 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1008,6 +1008,12 @@ static void test_acpi_q35_multif_bridge(void)
         .machine = MACHINE_Q35,
         .variant = ".multi-bridge",
     };
+
+    if (!qtest_has_device("pcie-root-port")) {
+        g_test_skip("Device pcie-root-port is not available");
+        goto out;
+    }
+
     test_vm_prepare("-S"
         " -device virtio-balloon,id=balloon0,addr=0x4.0x2"
         " -device pcie-root-port,id=rp0,multifunction=on,"
@@ -1043,6 +1049,7 @@ static void test_acpi_q35_multif_bridge(void)
     /* check that reboot/reset doesn't change any ACPI tables  */
     qtest_qmp_send(data.qts, "{'execute':'system_reset' }");
     process_acpi_tables(&data);
+out:
     free_test_data(&data);
 }
 
@@ -1396,6 +1403,11 @@ static void test_acpi_tcg_dimm_pxm(const char *machine)
 {
     test_data data;
 
+    if (!qtest_has_device("nvdimm")) {
+        g_test_skip("Device nvdimm is not available");
+        return;
+    }
+
     memset(&data, 0, sizeof(data));
     data.machine = machine;
     data.variant = ".dimmpxm";
@@ -1444,6 +1456,11 @@ static void test_acpi_virt_tcg_memhp(void)
         .scan_len = 256ULL * 1024 * 1024,
     };
 
+    if (!qtest_has_device("nvdimm")) {
+        g_test_skip("Device nvdimm is not available");
+        goto out;
+    }
+
     data.variant = ".memhp";
     test_acpi_one(" -machine nvdimm=on"
                   " -cpu cortex-a57"
@@ -1457,7 +1474,7 @@ static void test_acpi_virt_tcg_memhp(void)
                   " -device pc-dimm,id=dimm0,memdev=ram2,node=0"
                   " -device nvdimm,id=dimm1,memdev=nvm0,node=1",
                   &data);
-
+out:
     free_test_data(&data);
 
 }
@@ -1475,6 +1492,11 @@ static void test_acpi_microvm_tcg(void)
 {
     test_data data;
 
+    if (!qtest_has_device("virtio-blk-device")) {
+        g_test_skip("Device virtio-blk-device is not available");
+        return;
+    }
+
     test_acpi_microvm_prepare(&data);
     test_acpi_one(" -machine microvm,acpi=on,ioapic2=off,rtc=off",
                   &data);
@@ -1485,6 +1507,11 @@ static void test_acpi_microvm_usb_tcg(void)
 {
     test_data data;
 
+    if (!qtest_has_device("virtio-blk-device")) {
+        g_test_skip("Device virtio-blk-device is not available");
+        return;
+    }
+
     test_acpi_microvm_prepare(&data);
     data.variant = ".usb";
     test_acpi_one(" -machine microvm,acpi=on,ioapic2=off,usb=on,rtc=off",
@@ -1496,6 +1523,11 @@ static void test_acpi_microvm_rtc_tcg(void)
 {
     test_data data;
 
+    if (!qtest_has_device("virtio-blk-device")) {
+        g_test_skip("Device virtio-blk-device is not available");
+        return;
+    }
+
     test_acpi_microvm_prepare(&data);
     data.variant = ".rtc";
     test_acpi_one(" -machine microvm,acpi=on,ioapic2=off,rtc=on",
@@ -1507,6 +1539,11 @@ static void test_acpi_microvm_pcie_tcg(void)
 {
     test_data data;
 
+    if (!qtest_has_device("virtio-blk-device")) {
+        g_test_skip("Device virtio-blk-device is not available");
+        return;
+    }
+
     test_acpi_microvm_prepare(&data);
     data.variant = ".pcie";
     data.tcg_only = true; /* need constant host-phys-bits */
@@ -1519,6 +1556,11 @@ static void test_acpi_microvm_ioapic2_tcg(void)
 {
     test_data data;
 
+    if (!qtest_has_device("virtio-blk-device")) {
+        g_test_skip("Device virtio-blk-device is not available");
+        return;
+    }
+
     test_acpi_microvm_prepare(&data);
     data.variant = ".ioapic2";
     test_acpi_one(" -machine microvm,acpi=on,ioapic2=on,rtc=off",
@@ -1558,6 +1600,12 @@ static void test_acpi_virt_tcg_pxb(void)
         .ram_start = 0x40000000ULL,
         .scan_len = 128ULL * 1024 * 1024,
     };
+
+    if (!qtest_has_device("pcie-root-port")) {
+        g_test_skip("Device pcie-root-port is not available");
+        goto out;
+    }
+
     /*
      * While using -cdrom, the cdrom would auto plugged into pxb-pcie,
      * the reason is the bus of pxb-pcie is also root bus, it would lead
@@ -1576,7 +1624,7 @@ static void test_acpi_virt_tcg_pxb(void)
                   " -cpu cortex-a57"
                   " -device pxb-pcie,bus_nr=128",
                   &data);
-
+out:
     free_test_data(&data);
 }
 
@@ -1764,6 +1812,12 @@ static void test_acpi_microvm_acpi_erst(void)
     gchar *params;
     test_data data;
 
+    if (!qtest_has_device("virtio-blk-device")) {
+        g_test_skip("Device virtio-blk-device is not available");
+        g_free(tmp_path);
+        return;
+    }
+
     test_acpi_microvm_prepare(&data);
     data.variant = ".pcie";
     data.tcg_only = true; /* need constant host-phys-bits */
@@ -1824,6 +1878,11 @@ static void test_acpi_q35_viot(void)
         .variant = ".viot",
     };
 
+    if (!qtest_has_device("virtio-iommu")) {
+        g_test_skip("Device virtio-iommu is not available");
+        goto out;
+    }
+
     /*
      * To keep things interesting, two buses bypass the IOMMU.
      * VIOT should only describes the other two buses.
@@ -1834,6 +1893,7 @@ static void test_acpi_q35_viot(void)
                   "-device pxb-pcie,bus_nr=0x20,id=pcie.200,bus=pcie.0,bypass_iommu=on "
                   "-device pxb-pcie,bus_nr=0x30,id=pcie.300,bus=pcie.0",
                   &data);
+out:
     free_test_data(&data);
 }
 
@@ -1894,8 +1954,10 @@ static void test_acpi_virt_viot(void)
         .scan_len = 128ULL * 1024 * 1024,
     };
 
-    test_acpi_one("-cpu cortex-a57 "
-                  "-device virtio-iommu-pci", &data);
+    if (qtest_has_device("virtio-iommu")) {
+        test_acpi_one("-cpu cortex-a57 "
+                       "-device virtio-iommu-pci", &data);
+    }
     free_test_data(&data);
 }
 
@@ -2004,6 +2066,11 @@ static void test_acpi_microvm_oem_fields(void)
     test_data data;
     char *args;
 
+    if (!qtest_has_device("virtio-blk-device")) {
+        g_test_skip("Device virtio-blk-device is not available");
+        return;
+    }
+
     test_acpi_microvm_prepare(&data);
 
     args = test_acpi_create_args(&data,
-- 
2.31.1


