Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD196A85FB
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:16:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlbS-0006OW-6O; Thu, 02 Mar 2023 11:16:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXlbC-0006Br-FK
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:16:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXlb8-0000JD-FT
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:16:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677773750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tAw1FQC35jWDqUSGnEo2DTIbor+weXrEDhNKaJxw1/I=;
 b=QF+kaghZWtlFwiO35x50j7hVU/70azQbp668B6nK3D5EZYeT+hWfzmp8BKSKZ3Vv4GoN0+
 LeDPUQofHneOGDwj/t6j61UfWc83gsOsa8mcndECQG1e4cNhekWhRWh161CmIFVJDeZ280
 8LbkAdQn3PsCuirMCBJVMbnLQxg+e7k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-eyRYz_K7MT-LY8M1wIqi6w-1; Thu, 02 Mar 2023 11:15:47 -0500
X-MC-Unique: eyRYz_K7MT-LY8M1wIqi6w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E51B73C0E469;
 Thu,  2 Mar 2023 16:15:46 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4624C140EBF6;
 Thu,  2 Mar 2023 16:15:46 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	berrange@redhat.com,
	Fabiano Rosas <farosas@suse.de>
Subject: [PATCH v2 01/34] Revert "tests/qtest: Check for devices in
 bios-tables-test"
Date: Thu,  2 Mar 2023 17:15:10 +0100
Message-Id: <20230302161543.286002-2-imammedo@redhat.com>
In-Reply-To: <20230302161543.286002-1-imammedo@redhat.com>
References: <20230302161543.286002-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

This reverts commit c471eb4f40445908c1be7bb11a37ac676a0edae7.

which broke acpi tables test and rebuild due to skipping some tests
even thought none of devices tests depend on weren't disabled.

As result it leads to some expected tables not being updated,
merge conflicts and tests failure.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: Fabiano Rosas <farosas@suse.de>

 tests/qtest/bios-tables-test.c | 75 ++--------------------------------
 1 file changed, 4 insertions(+), 71 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index d29a4e47af..d8c8cda58e 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1008,12 +1008,6 @@ static void test_acpi_q35_multif_bridge(void)
         .machine = MACHINE_Q35,
         .variant = ".multi-bridge",
     };
-
-    if (!qtest_has_device("pcie-root-port")) {
-        g_test_skip("Device pcie-root-port is not available");
-        goto out;
-    }
-
     test_vm_prepare("-S"
         " -device virtio-balloon,id=balloon0,addr=0x4.0x2"
         " -device pcie-root-port,id=rp0,multifunction=on,"
@@ -1049,7 +1043,6 @@ static void test_acpi_q35_multif_bridge(void)
     /* check that reboot/reset doesn't change any ACPI tables  */
     qtest_qmp_send(data.qts, "{'execute':'system_reset' }");
     process_acpi_tables(&data);
-out:
     free_test_data(&data);
 }
 
@@ -1403,11 +1396,6 @@ static void test_acpi_tcg_dimm_pxm(const char *machine)
 {
     test_data data;
 
-    if (!qtest_has_device("nvdimm")) {
-        g_test_skip("Device nvdimm is not available");
-        return;
-    }
-
     memset(&data, 0, sizeof(data));
     data.machine = machine;
     data.variant = ".dimmpxm";
@@ -1456,11 +1444,6 @@ static void test_acpi_virt_tcg_memhp(void)
         .scan_len = 256ULL * 1024 * 1024,
     };
 
-    if (!qtest_has_device("nvdimm")) {
-        g_test_skip("Device nvdimm is not available");
-        goto out;
-    }
-
     data.variant = ".memhp";
     test_acpi_one(" -machine nvdimm=on"
                   " -cpu cortex-a57"
@@ -1474,7 +1457,7 @@ static void test_acpi_virt_tcg_memhp(void)
                   " -device pc-dimm,id=dimm0,memdev=ram2,node=0"
                   " -device nvdimm,id=dimm1,memdev=nvm0,node=1",
                   &data);
-out:
+
     free_test_data(&data);
 
 }
@@ -1492,11 +1475,6 @@ static void test_acpi_microvm_tcg(void)
 {
     test_data data;
 
-    if (!qtest_has_device("virtio-blk-device")) {
-        g_test_skip("Device virtio-blk-device is not available");
-        return;
-    }
-
     test_acpi_microvm_prepare(&data);
     test_acpi_one(" -machine microvm,acpi=on,ioapic2=off,rtc=off",
                   &data);
@@ -1507,11 +1485,6 @@ static void test_acpi_microvm_usb_tcg(void)
 {
     test_data data;
 
-    if (!qtest_has_device("virtio-blk-device")) {
-        g_test_skip("Device virtio-blk-device is not available");
-        return;
-    }
-
     test_acpi_microvm_prepare(&data);
     data.variant = ".usb";
     test_acpi_one(" -machine microvm,acpi=on,ioapic2=off,usb=on,rtc=off",
@@ -1523,11 +1496,6 @@ static void test_acpi_microvm_rtc_tcg(void)
 {
     test_data data;
 
-    if (!qtest_has_device("virtio-blk-device")) {
-        g_test_skip("Device virtio-blk-device is not available");
-        return;
-    }
-
     test_acpi_microvm_prepare(&data);
     data.variant = ".rtc";
     test_acpi_one(" -machine microvm,acpi=on,ioapic2=off,rtc=on",
@@ -1539,11 +1507,6 @@ static void test_acpi_microvm_pcie_tcg(void)
 {
     test_data data;
 
-    if (!qtest_has_device("virtio-blk-device")) {
-        g_test_skip("Device virtio-blk-device is not available");
-        return;
-    }
-
     test_acpi_microvm_prepare(&data);
     data.variant = ".pcie";
     data.tcg_only = true; /* need constant host-phys-bits */
@@ -1556,11 +1519,6 @@ static void test_acpi_microvm_ioapic2_tcg(void)
 {
     test_data data;
 
-    if (!qtest_has_device("virtio-blk-device")) {
-        g_test_skip("Device virtio-blk-device is not available");
-        return;
-    }
-
     test_acpi_microvm_prepare(&data);
     data.variant = ".ioapic2";
     test_acpi_one(" -machine microvm,acpi=on,ioapic2=on,rtc=off",
@@ -1600,12 +1558,6 @@ static void test_acpi_virt_tcg_pxb(void)
         .ram_start = 0x40000000ULL,
         .scan_len = 128ULL * 1024 * 1024,
     };
-
-    if (!qtest_has_device("pcie-root-port")) {
-        g_test_skip("Device pcie-root-port is not available");
-        goto out;
-    }
-
     /*
      * While using -cdrom, the cdrom would auto plugged into pxb-pcie,
      * the reason is the bus of pxb-pcie is also root bus, it would lead
@@ -1624,7 +1576,7 @@ static void test_acpi_virt_tcg_pxb(void)
                   " -cpu cortex-a57"
                   " -device pxb-pcie,bus_nr=128",
                   &data);
-out:
+
     free_test_data(&data);
 }
 
@@ -1812,12 +1764,6 @@ static void test_acpi_microvm_acpi_erst(void)
     gchar *params;
     test_data data;
 
-    if (!qtest_has_device("virtio-blk-device")) {
-        g_test_skip("Device virtio-blk-device is not available");
-        g_free(tmp_path);
-        return;
-    }
-
     test_acpi_microvm_prepare(&data);
     data.variant = ".pcie";
     data.tcg_only = true; /* need constant host-phys-bits */
@@ -1878,11 +1824,6 @@ static void test_acpi_q35_viot(void)
         .variant = ".viot",
     };
 
-    if (!qtest_has_device("virtio-iommu")) {
-        g_test_skip("Device virtio-iommu is not available");
-        goto out;
-    }
-
     /*
      * To keep things interesting, two buses bypass the IOMMU.
      * VIOT should only describes the other two buses.
@@ -1893,7 +1834,6 @@ static void test_acpi_q35_viot(void)
                   "-device pxb-pcie,bus_nr=0x20,id=pcie.200,bus=pcie.0,bypass_iommu=on "
                   "-device pxb-pcie,bus_nr=0x30,id=pcie.300,bus=pcie.0",
                   &data);
-out:
     free_test_data(&data);
 }
 
@@ -1954,10 +1894,8 @@ static void test_acpi_virt_viot(void)
         .scan_len = 128ULL * 1024 * 1024,
     };
 
-    if (qtest_has_device("virtio-iommu")) {
-        test_acpi_one("-cpu cortex-a57 "
-                       "-device virtio-iommu-pci", &data);
-    }
+    test_acpi_one("-cpu cortex-a57 "
+                  "-device virtio-iommu-pci", &data);
     free_test_data(&data);
 }
 
@@ -2066,11 +2004,6 @@ static void test_acpi_microvm_oem_fields(void)
     test_data data;
     char *args;
 
-    if (!qtest_has_device("virtio-blk-device")) {
-        g_test_skip("Device virtio-blk-device is not available");
-        return;
-    }
-
     test_acpi_microvm_prepare(&data);
 
     args = test_acpi_create_args(&data,
-- 
2.39.1


