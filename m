Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B28E872B5
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Aug 2019 09:09:10 +0200 (CEST)
Received: from localhost ([::1]:56974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvz1R-0006pL-Qu
	for lists+qemu-devel@lfdr.de; Fri, 09 Aug 2019 03:09:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50944)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tao3.xu@intel.com>) id 1hvyqh-000491-53
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 02:58:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1hvyqg-0008Bk-0O
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 02:58:03 -0400
Received: from mga05.intel.com ([192.55.52.43]:16871)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1hvyqf-0007xE-Oh
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 02:58:01 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Aug 2019 23:58:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,364,1559545200"; d="scan'208";a="326549066"
Received: from tao-optiplex-7060.sh.intel.com ([10.239.159.37])
 by orsmga004.jf.intel.com with ESMTP; 08 Aug 2019 23:57:59 -0700
From: Tao <tao3.xu@intel.com>
To: imammedo@redhat.com,
	eblake@redhat.com,
	ehabkost@redhat.com
Date: Fri,  9 Aug 2019 14:57:31 +0800
Message-Id: <20190809065731.9097-12-tao3.xu@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190809065731.9097-1-tao3.xu@intel.com>
References: <20190809065731.9097-1-tao3.xu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.43
Subject: [Qemu-devel] [PATCH v9 11/11] tests/bios-tables-test: add test
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
Cc: Jingqi Liu <Jingqi.liu@intel.com>, tao3.xu@intel.com, fan.du@intel.com,
 qemu-devel@nongnu.org, daniel@linux.ibm.com, jonathan.cameron@huawei.com,
 dan.j.williams@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Tao Xu <tao3.xu@intel.com>

ACPI table HMAT has been introduced, QEMU now builds HMAT tables for
Heterogeneous Memory with boot option '-numa node'.

Add test cases on PC and Q35 machines with 2 numa nodes.
Because HMAT is generated when system enable numa, the
following tables need to be added for this test:
  tests/acpi-test-data/pc/*.acpihmat
  tests/acpi-test-data/pc/HMAT.*
  tests/acpi-test-data/q35/*.acpihmat
  tests/acpi-test-data/q35/HMAT.*

Reviewed-by: Jingqi Liu <Jingqi.liu@intel.com>
Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Tao Xu <tao3.xu@intel.com>
---

Changes in v9:
    - update the test case
---
 tests/bios-tables-test.c | 43 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
index a356ac3489..294f097e52 100644
--- a/tests/bios-tables-test.c
+++ b/tests/bios-tables-test.c
@@ -871,6 +871,47 @@ static void test_acpi_piix4_tcg_dimm_pxm(void)
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
+                  "data-type=access-latency,latency=5ns"
+                  " -numa hmat-lb,initiator=0,target=0,hierarchy=memory,"
+                  "data-type=access-bandwidth,bandwidth=500M"
+                  " -numa hmat-lb,initiator=0,target=1,hierarchy=memory,"
+                  "data-type=access-latency,latency=10ns"
+                  " -numa hmat-lb,initiator=0,target=1,hierarchy=memory,"
+                  "data-type=access-bandwidth,bandwidth=100M"
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
@@ -915,6 +956,8 @@ int main(int argc, char *argv[])
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


