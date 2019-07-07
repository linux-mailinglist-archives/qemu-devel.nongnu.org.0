Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 803496154B
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Jul 2019 16:42:41 +0200 (CEST)
Received: from localhost ([::1]:35712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hk8NE-0003bJ-NZ
	for lists+qemu-devel@lfdr.de; Sun, 07 Jul 2019 10:42:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49700)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tao3.xu@intel.com>) id 1hk8EP-0000Cb-QT
 for qemu-devel@nongnu.org; Sun, 07 Jul 2019 10:33:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1hk8EO-0003oB-PR
 for qemu-devel@nongnu.org; Sun, 07 Jul 2019 10:33:33 -0400
Received: from mga03.intel.com ([134.134.136.65]:31569)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1hk8EO-00037I-HR
 for qemu-devel@nongnu.org; Sun, 07 Jul 2019 10:33:32 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Jul 2019 07:33:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,462,1557212400"; d="scan'208";a="185497877"
Received: from tao-optiplex-7060.sh.intel.com ([10.239.13.104])
 by fmsmga001.fm.intel.com with ESMTP; 07 Jul 2019 07:33:04 -0700
From: Tao Xu <tao3.xu@intel.com>
To: imammedo@redhat.com,
	eblake@redhat.com,
	ehabkost@redhat.com
Date: Sun,  7 Jul 2019 22:29:58 +0800
Message-Id: <20190707142958.31316-15-tao3.xu@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190707142958.31316-1-tao3.xu@intel.com>
References: <20190707142958.31316-1-tao3.xu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.65
Subject: [Qemu-devel] [PATCH v6 14/14] tests/bios-tables-test: add test
 cases for ACPI HMAT
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
Cc: jingqi.liu@intel.com, tao3.xu@intel.com, fan.du@intel.com,
 qemu-devel@nongnu.org, jonathan.cameron@huawei.com, dan.j.williams@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ACPI table HMAT has been introduced, QEMU now builds HMAT tables for
Heterogeneous Memory with boot option '-numa node'.

Add test cases on PC and Q35 machines with 2 numa nodes.
Because HMAT is generated when system enable numa, the
following tables need to be added for this test:
  tests/acpi-test-data/pc/*.acpihmat
  tests/acpi-test-data/pc/HMAT.*
  tests/acpi-test-data/q35/*.acpihmat
  tests/acpi-test-data/q35/HMAT.*

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Tao Xu <tao3.xu@intel.com>
---
 tests/bios-tables-test.c | 43 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
index 0ce55182f2..a4f0dbb751 100644
--- a/tests/bios-tables-test.c
+++ b/tests/bios-tables-test.c
@@ -844,6 +844,47 @@ static void test_acpi_piix4_tcg_dimm_pxm(void)
     test_acpi_tcg_dimm_pxm(MACHINE_PC);
 }
 
+static void test_acpi_tcg_acpi_hmat(const char *machine)
+{
+    test_data data;
+
+    memset(&data, 0, sizeof(data));
+    data.machine = machine;
+    data.variant = ".acpihmat";
+    test_acpi_one(" -smp 2,sockets=2"
+                  " -m 128M,slots=2,maxmem=1G"
+                  " -object memory-backend-ram,size=64M,id=m0"
+                  " -object memory-backend-ram,size=64M,id=m1"
+                  " -numa node,nodeid=0,memdev=m0"
+                  " -numa node,nodeid=1,memdev=m1,initiator=0"
+                  " -numa cpu,node-id=0,socket-id=0"
+                  " -numa cpu,node-id=0,socket-id=1"
+                  " -numa hmat-lb,initiator=0,target=0,hierarchy=memory,"
+                  "data-type=access-latency,base-lat=10,latency=5"
+                  " -numa hmat-lb,initiator=0,target=0,hierarchy=memory,"
+                  "data-type=access-bandwidth,base-bw=20,bandwidth=5"
+                  " -numa hmat-lb,initiator=0,target=1,hierarchy=memory,"
+                  "data-type=access-latency,base-lat=10,latency=10"
+                  " -numa hmat-lb,initiator=0,target=1,hierarchy=memory,"
+                  "data-type=access-bandwidth,base-bw=20,bandwidth=10"
+                  " -numa hmat-cache,node-id=0,size=0x20000,total=1,level=1"
+                  ",assoc=direct,policy=write-back,line=8"
+                  " -numa hmat-cache,node-id=1,size=0x20000,total=1,level=1"
+                  ",assoc=direct,policy=write-back,line=8",
+                  &data);
+    free_test_data(&data);
+}
+
+static void test_acpi_q35_tcg_acpi_hmat(void)
+{
+    test_acpi_tcg_acpi_hmat(MACHINE_Q35);
+}
+
+static void test_acpi_piix4_tcg_acpi_hmat(void)
+{
+    test_acpi_tcg_acpi_hmat(MACHINE_PC);
+}
+
 static void test_acpi_virt_tcg(void)
 {
     test_data data = {
@@ -888,6 +929,8 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/q35/numamem", test_acpi_q35_tcg_numamem);
         qtest_add_func("acpi/piix4/dimmpxm", test_acpi_piix4_tcg_dimm_pxm);
         qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
+        qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_hmat);
+        qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_hmat);
     } else if (strcmp(arch, "aarch64") == 0) {
         qtest_add_func("acpi/virt", test_acpi_virt_tcg);
     }
-- 
2.20.1


