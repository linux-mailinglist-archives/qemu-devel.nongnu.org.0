Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED289514F70
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 17:28:53 +0200 (CEST)
Received: from localhost ([::1]:53344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkSY9-0008Ap-2r
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 11:28:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nkS6S-0000dB-Ut
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:00:16 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nkS6R-0002pe-1y
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:00:16 -0400
Received: from fraeml702-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4KqbCR5DzKz67bDD;
 Fri, 29 Apr 2022 22:56:03 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml702-chm.china.huawei.com (10.206.15.51) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.24; Fri, 29 Apr 2022 17:00:12 +0200
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 29 Apr 2022 16:00:12 +0100
To: <linuxarm@huawei.com>, <qemu-devel@nongnu.org>, <alex.bennee@linaro.org>, 
 Marcel Apfelbaum <marcel@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Adam Manzanares
 <a.manzanares@samsung.com>, Tong Zhang <ztong0001@gmail.com>
CC: <linux-cxl@vger.kernel.org>, Ben Widawsky <ben.widawsky@intel.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, Shameerali Kolothum Thodi
 <shameerali.kolothum.thodi@huawei.com>, <f4bug@amsat.org>, Peter Xu
 <peterx@redhat.com>, David Hildenbrand <david@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Saransh Gupta1 <saransh@ibm.com>, Shreyas Shah
 <shreyas.shah@elastics.cloud>, Chris Browy <cbrowy@avery-design.com>,
 "Samarth Saxena" <samarths@cadence.com>, Dan Williams
 <dan.j.williams@intel.com>, <k.jensen@samsung.com>, <dave@stgolabs.net>,
 Alison Schofield <alison.schofield@intel.com>
Subject: [PATCH v10 37/45] qtests/bios-tables-test: Add a test for CXL
 emulation.
Date: Fri, 29 Apr 2022 15:41:02 +0100
Message-ID: <20220429144110.25167-38-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220429144110.25167-1-Jonathan.Cameron@huawei.com>
References: <20220429144110.25167-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml727-chm.china.huawei.com (10.201.108.78) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

The DSDT includes several CXL specific elements and the CEDT
table is only present if we enable CXL.

The test exercises all current functionality with several
CFMWS, CHBS structures in CEDT and ACPI0016/ACPI00017 and _OSC
entries in DSDT.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 tests/qtest/bios-tables-test.c | 44 ++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 5dddedabcd..a4a46e97f0 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1536,6 +1536,49 @@ static void test_acpi_q35_viot(void)
     free_test_data(&data);
 }
 
+static void test_acpi_q35_cxl(void)
+{
+    gchar *tmp_path = g_dir_make_tmp("qemu-test-cxl.XXXXXX", NULL);
+    gchar *params;
+
+    test_data data = {
+        .machine = MACHINE_Q35,
+        .variant = ".cxl",
+    };
+    /*
+     * A complex CXL setup.
+     */
+    params = g_strdup_printf(" -machine cxl=on"
+                             " -object memory-backend-file,id=cxl-mem1,mem-path=%s,size=256M"
+                             " -object memory-backend-file,id=cxl-mem2,mem-path=%s,size=256M"
+                             " -object memory-backend-file,id=cxl-mem3,mem-path=%s,size=256M"
+                             " -object memory-backend-file,id=cxl-mem4,mem-path=%s,size=256M"
+                             " -object memory-backend-file,id=lsa1,mem-path=%s,size=256M"
+                             " -object memory-backend-file,id=lsa2,mem-path=%s,size=256M"
+                             " -object memory-backend-file,id=lsa3,mem-path=%s,size=256M"
+                             " -object memory-backend-file,id=lsa4,mem-path=%s,size=256M"
+                             " -device pxb-cxl,bus_nr=12,bus=pcie.0,id=cxl.1"
+                             " -device pxb-cxl,bus_nr=222,bus=pcie.0,id=cxl.2"
+                             " -device cxl-rp,port=0,bus=cxl.1,id=rp1,chassis=0,slot=2"
+                             " -device cxl-type3,bus=rp1,memdev=cxl-mem1,lsa=lsa1"
+                             " -device cxl-rp,port=1,bus=cxl.1,id=rp2,chassis=0,slot=3"
+                             " -device cxl-type3,bus=rp2,memdev=cxl-mem2,lsa=lsa2"
+                             " -device cxl-rp,port=0,bus=cxl.2,id=rp3,chassis=0,slot=5"
+                             " -device cxl-type3,bus=rp3,memdev=cxl-mem3,lsa=lsa3"
+                             " -device cxl-rp,port=1,bus=cxl.2,id=rp4,chassis=0,slot=6"
+                             " -device cxl-type3,bus=rp4,memdev=cxl-mem4,lsa=lsa4"
+                             " -cxl-fixed-memory-window targets.0=cxl.1,size=4G,interleave-granularity=8k"
+                             " -cxl-fixed-memory-window targets.0=cxl.1,targets.1=cxl.2,size=4G,interleave-granularity=8k",
+                             tmp_path, tmp_path, tmp_path, tmp_path,
+                             tmp_path, tmp_path, tmp_path, tmp_path);
+    test_acpi_one(params, &data);
+
+    g_free(params);
+    g_assert(g_rmdir(tmp_path) == 0);
+    g_free(tmp_path);
+    free_test_data(&data);
+}
+
 static void test_acpi_virt_viot(void)
 {
     test_data data = {
@@ -1741,6 +1784,7 @@ int main(int argc, char *argv[])
             qtest_add_func("acpi/q35/kvm/dmar", test_acpi_q35_kvm_dmar);
         }
         qtest_add_func("acpi/q35/viot", test_acpi_q35_viot);
+        qtest_add_func("acpi/q35/cxl", test_acpi_q35_cxl);
         qtest_add_func("acpi/q35/slic", test_acpi_q35_slic);
     } else if (strcmp(arch, "aarch64") == 0) {
         if (has_tcg) {
-- 
2.32.0


