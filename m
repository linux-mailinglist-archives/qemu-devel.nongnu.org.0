Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C75462B89D5
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 02:53:12 +0100 (CET)
Received: from localhost ([::1]:35338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfZ8J-00011k-9u
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 20:53:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kfZ6D-0008FS-OS
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 20:51:01 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kfZ6A-0003NT-Ug
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 20:51:01 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Cc2gm3wjSzLlyS;
 Thu, 19 Nov 2020 09:50:28 +0800 (CST)
Received: from localhost (10.174.184.155) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Thu, 19 Nov 2020
 09:50:40 +0800
From: Jiahui Cen <cenjiahui@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v10 6/9] acpi: Align the size to 128k
Date: Thu, 19 Nov 2020 09:48:38 +0800
Message-ID: <20201119014841.7298-7-cenjiahui@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201119014841.7298-1-cenjiahui@huawei.com>
References: <20201119014841.7298-1-cenjiahui@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.184.155]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=cenjiahui@huawei.com;
 helo=szxga05-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 20:50:48
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: xieyingtai@huawei.com, Peter Maydell <peter.maydell@linaro.org>,
 Jiahui Cen <cenjiahui@huawei.com>, berrange@redhat.com,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, miaoyubo@huawei.com,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, philmd@redhat.com, wu.wubin@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yubo Miao <miaoyubo@huawei.com>

If table size is changed between virt_acpi_build and
virt_acpi_build_update, the table size would not be updated to
UEFI, therefore, just align the size to 128kb, which is enough
and same with x86. It would warn if 64k is not enough and the
align size should be updated.

Signed-off-by: Yubo Miao <miaoyubo@huawei.com>
Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
---
 hw/arm/virt-acpi-build.c | 25 ++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index e0bed9037c..711cf2069f 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -57,6 +57,8 @@
 
 #define ARM_SPI_BASE 32
 
+#define ACPI_BUILD_TABLE_SIZE             0x20000
+
 static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus)
 {
     uint16_t i;
@@ -656,6 +658,15 @@ struct AcpiBuildState {
     bool patched;
 } AcpiBuildState;
 
+static void acpi_align_size(GArray *blob, unsigned align)
+{
+    /*
+     * Align size to multiple of given size. This reduces the chance
+     * we need to change size in the future (breaking cross version migration).
+     */
+    g_array_set_size(blob, ROUND_UP(acpi_data_len(blob), align));
+}
+
 static
 void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
 {
@@ -743,6 +754,20 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
         build_rsdp(tables->rsdp, tables->linker, &rsdp_data);
     }
 
+    /*
+     * The align size is 128, warn if 64k is not enough therefore
+     * the align size could be resized.
+     */
+    if (tables_blob->len > ACPI_BUILD_TABLE_SIZE / 2) {
+        warn_report("ACPI table size %u exceeds %d bytes,"
+                    " migration may not work",
+                    tables_blob->len, ACPI_BUILD_TABLE_SIZE / 2);
+        error_printf("Try removing CPUs, NUMA nodes, memory slots"
+                     " or PCI bridges.");
+    }
+    acpi_align_size(tables_blob, ACPI_BUILD_TABLE_SIZE);
+
+
     /* Cleanup memory that's no longer used. */
     g_array_free(table_offsets, true);
 }
-- 
2.28.0


