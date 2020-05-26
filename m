Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC3D1DAF13
	for <lists+qemu-devel@lfdr.de>; Wed, 20 May 2020 11:42:32 +0200 (CEST)
Received: from localhost ([::1]:33276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbLF9-0002Cs-D3
	for lists+qemu-devel@lfdr.de; Wed, 20 May 2020 05:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miaoyubo@huawei.com>)
 id 1jbLAs-00040G-Id
 for qemu-devel@nongnu.org; Wed, 20 May 2020 05:38:11 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:43614 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miaoyubo@huawei.com>)
 id 1jbLAq-00009l-T9
 for qemu-devel@nongnu.org; Wed, 20 May 2020 05:38:06 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id B60609ADF91E5186702C;
 Wed, 20 May 2020 17:38:02 +0800 (CST)
Received: from DESKTOP-D7EVK5B.china.huawei.com (10.173.221.29) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Wed, 20 May 2020 17:37:56 +0800
From: Yubo Miao <miaoyubo@huawei.com>
To: <peter.maydell@linaro.org>, <shannon.zhaosl@gmail.com>, <lersek@redhat.com>
Subject: [PATCH v7 7/8] unit-test: Add testcase for pxb
Date: Wed, 20 May 2020 17:36:28 +0800
Message-ID: <20200520093629.1495-8-miaoyubo@huawei.com>
X-Mailer: git-send-email 2.24.1.windows.2
In-Reply-To: <20200520093629.1495-1-miaoyubo@huawei.com>
References: <20200520093629.1495-1-miaoyubo@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.173.221.29]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=miaoyubo@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 05:37:13
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: berrange@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
 xiexiangyou@huawei.com, miaoyubo@huawei.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add testcase for pxb to make sure the ACPI table is correct for guest.

Signed-off-by: Yubo Miao <miaoyubo@huawei.com>
---
 tests/qtest/bios-tables-test.c | 58 ++++++++++++++++++++++++++++++----
 1 file changed, 52 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index c9843829b3..557b7e40ff 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -621,12 +621,21 @@ static void test_acpi_one(const char *params, test_data *data)
          * TODO: convert '-drive if=pflash' to new syntax (see e33763be7cd3)
          * when arm/virt boad starts to support it.
          */
-        args = g_strdup_printf("-machine %s %s -accel tcg -nodefaults -nographic "
-            "-drive if=pflash,format=raw,file=%s,readonly "
-            "-drive if=pflash,format=raw,file=%s,snapshot=on -cdrom %s %s",
-            data->machine, data->tcg_only ? "" : "-accel kvm",
-            data->uefi_fl1, data->uefi_fl2, data->cd, params ? params : "");
-
+        if (data->cd) {
+            args = g_strdup_printf("-machine %s %s -accel tcg "
+                "-nodefaults -nographic "
+                "-drive if=pflash,format=raw,file=%s,readonly "
+                "-drive if=pflash,format=raw,file=%s,snapshot=on -cdrom %s %s",
+                data->machine, data->tcg_only ? "" : "-accel kvm",
+                data->uefi_fl1, data->uefi_fl2, data->cd, params ? params : "");
+        } else {
+            args = g_strdup_printf("-machine %s %s -accel tcg "
+                "-nodefaults -nographic "
+                "-drive if=pflash,format=raw,file=%s,readonly "
+                "-drive if=pflash,format=raw,file=%s,snapshot=on %s",
+                data->machine, data->tcg_only ? "" : "-accel kvm",
+                data->uefi_fl1, data->uefi_fl2, params ? params : "");
+        }
     } else {
         /* Disable kernel irqchip to be able to override apic irq0. */
         args = g_strdup_printf("-machine %s,kernel-irqchip=off %s -accel tcg "
@@ -966,6 +975,40 @@ static void test_acpi_virt_tcg_numamem(void)
 
 }
 
+#ifdef CONFIG_PXB
+static void test_acpi_virt_tcg_pxb(void)
+{
+    test_data data = {
+        .machine = "virt",
+        .tcg_only = true,
+        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
+        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
+        .ram_start = 0x40000000ULL,
+        .scan_len = 128ULL * 1024 * 1024,
+    };
+    /*
+     * While using -cdrom, the cdrom would auto plugged into pxb-pcie,
+     * the reason is the bus of pxb-pcie is also root bus, it would lead
+     * to the error only PCI/PCIE bridge could plug onto pxb.
+     * Therefore,thr cdrom is defined and plugged onto the scsi controller
+     * to solve the conflicts.
+     */
+    data.variant = ".pxb";
+    test_acpi_one(" -device pcie-root-port,chassis=1,id=pci.1"
+                  " -device virtio-scsi-pci,id=scsi0,bus=pci.1"
+                  " -drive file="
+                  "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2,"
+                  "if=none,media=cdrom,id=drive-scsi0-0-0-1,readonly=on"
+                  " -device scsi-cd,bus=scsi0.0,scsi-id=0,"
+                  "drive=drive-scsi0-0-0-1,id=scsi0-0-0-1,bootindex=1"
+                  " -cpu cortex-a57"
+                  " -device pxb-pcie,bus_nr=128",
+                  &data);
+
+    free_test_data(&data);
+}
+#endif
+
 static void test_acpi_tcg_acpi_hmat(const char *machine)
 {
     test_data data;
@@ -1058,6 +1101,9 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/virt", test_acpi_virt_tcg);
         qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
         qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
+#ifdef CONFIG_PXB
+        qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
+#endif
     }
     ret = g_test_run();
     boot_sector_cleanup(disk);
-- 
2.19.1



