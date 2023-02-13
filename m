Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 285796952C4
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 22:11:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRg5R-0007GZ-Sh; Mon, 13 Feb 2023 16:10:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pRg5N-0007En-JE
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 16:10:06 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pRg5K-000124-2m
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 16:10:04 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DF75F20359;
 Mon, 13 Feb 2023 21:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676322600; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5+dT6k/9zBEP3vrylKQawsuBZi+XloTOrkBFNvETkQI=;
 b=tffZexZC/UO69bgaM9GDms/nBy0wR9GooLwSLz6yKfJFvE5RJsD3mW9wO0jAYiJXTbz0bk
 FpXOyP97O9WsVHGp0WKuutYFPDKxSWcGXwxDRyivIhWWd2KEsNTVribppMfEIZG2DFdxa/
 /R0jxwGl0GLMTNeVxGpkJFxfZZmE/QE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676322600;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5+dT6k/9zBEP3vrylKQawsuBZi+XloTOrkBFNvETkQI=;
 b=DZu/nVzwkpQlapSAZPT4Wtq7GOZ3g8YYm1Q6Pd6ykg2yuMD3lDYSr6W9LDHhqhz+0Zj/wx
 jLnkSCbfLsRhrzDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 42516138E6;
 Mon, 13 Feb 2023 21:09:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qOpvAien6mPoRAAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 13 Feb 2023 21:09:59 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PATCH v3 09/12] tests/qtest: Check for devices in bios-tables-test
Date: Mon, 13 Feb 2023 18:07:35 -0300
Message-Id: <20230213210738.9719-10-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230213210738.9719-1-farosas@suse.de>
References: <20230213210738.9719-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

Do not include tests that require devices that are not available in
the QEMU build.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
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
2.35.3


