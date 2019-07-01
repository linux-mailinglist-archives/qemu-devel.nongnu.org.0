Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8854C32E8D
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jun 2019 13:24:14 +0200 (CEST)
Received: from localhost ([127.0.0.1]:33299 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hXl4X-0003fb-Di
	for lists+qemu-devel@lfdr.de; Mon, 03 Jun 2019 07:24:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48953)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hXl2b-0002jQ-Kf
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 07:22:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hXl2A-0000nX-D9
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 07:21:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40864)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1hXl2A-0000lk-5o
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 07:21:46 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6F2C3309266D;
	Mon,  3 Jun 2019 11:21:40 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 815BD67262;
	Mon,  3 Jun 2019 11:21:38 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  3 Jun 2019 13:22:09 +0200
Message-Id: <1559560929-260254-3-git-send-email-imammedo@redhat.com>
In-Reply-To: <1559560929-260254-1-git-send-email-imammedo@redhat.com>
References: <1559560929-260254-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Mon, 03 Jun 2019 11:21:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v6 2/2] tests: acpi: add simple arm/virt
 testcase
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>, Ben Warren <ben@skyportsystems.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>, Gonglei <arei.gonglei@huawei.com>,
	Wei Yang <richardw.yang@linux.intel.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

adds simple arm/virt test case that starts guest with
bios-tables-test.aarch64.iso.qcow2 boot image which
initializes UefiTestSupport* structure in RAM once
guest is booted.

 * see commit: tests: acpi: add acpi_find_rsdp_address_uefi() helper

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
v6:
  * Since aarch64 TCG is broken on 32 bit arm host,
    blacklist it till it's fixed
  * add aarch64 to rebuild script list
v4:
  * force test to use TCG accelerator
v3:
  * use firmware blobs directly from pc-bios directory
  * use bios-tables-test.aarch64.iso.qcow2 as test boot image
  * drop leftover qtest-uefi-images-aarch64 iMakefile rule from
    previos version (Laszlo)
  * add Makefile rule to include bios-tables-test into
    check-qtest-aarch64 target
v2:
  * specify in test_data where board's RAM starts and RAM size

 tests/Makefile.include                  |  4 ++++
 tests/bios-tables-test.c                | 18 ++++++++++++++++++
 tests/data/acpi/rebuild-expected-aml.sh |  2 +-
 3 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 1865f6b..2334969 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -267,6 +267,10 @@ check-qtest-arm-y += tests/hexloader-test$(EXESUF)
 check-qtest-aarch64-y = tests/numa-test$(EXESUF)
 check-qtest-aarch64-y += tests/boot-serial-test$(EXESUF)
 check-qtest-aarch64-y += tests/migration-test$(EXESUF)
+# TODO: once aarch64 TCG is fixed on ARM 32 bit host, make test unconditional
+ifneq ($(ARCH),arm)
+check-qtest-aarch64-y += tests/bios-tables-test$(EXESUF)
+endif
 
 check-qtest-microblazeel-y += $(check-qtest-microblaze-y)
 
diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
index 28d7d42..1242d63 100644
--- a/tests/bios-tables-test.c
+++ b/tests/bios-tables-test.c
@@ -830,6 +830,22 @@ static void test_acpi_piix4_tcg_dimm_pxm(void)
     test_acpi_tcg_dimm_pxm(MACHINE_PC);
 }
 
+static void test_acpi_virt_tcg(void)
+{
+    test_data data = {
+        .machine = "virt",
+        .accel = "tcg",
+        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
+        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
+        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
+        .ram_start = 0x40000000ULL,
+        .scan_len = 128ULL * 1024 * 1024,
+    };
+
+    test_acpi_one("-cpu cortex-a57", &data);
+    free_test_data(&data);
+}
+
 int main(int argc, char *argv[])
 {
     const char *arch = qtest_get_arch();
@@ -858,6 +874,8 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/q35/numamem", test_acpi_q35_tcg_numamem);
         qtest_add_func("acpi/piix4/dimmpxm", test_acpi_piix4_tcg_dimm_pxm);
         qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
+    } else if (strcmp(arch, "aarch64") == 0) {
+        qtest_add_func("acpi/virt", test_acpi_virt_tcg);
     }
     ret = g_test_run();
     boot_sector_cleanup(disk);
diff --git a/tests/data/acpi/rebuild-expected-aml.sh b/tests/data/acpi/rebuild-expected-aml.sh
index ff7e622..d285321 100755
--- a/tests/data/acpi/rebuild-expected-aml.sh
+++ b/tests/data/acpi/rebuild-expected-aml.sh
@@ -12,7 +12,7 @@
 # This work is licensed under the terms of the GNU GPLv2.
 # See the COPYING.LIB file in the top-level directory.
 
-qemu_bins="x86_64-softmmu/qemu-system-x86_64"
+qemu_bins="x86_64-softmmu/qemu-system-x86_64 aarch64-softmmu/qemu-system-aarch64"
 
 if [ ! -e "tests/bios-tables-test" ]; then
     echo "Test: bios-tables-test is required! Run make check before this script."
-- 
2.7.4


