Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1BD514E60
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 16:52:33 +0200 (CEST)
Received: from localhost ([::1]:43154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkRyx-00089u-V0
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 10:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nkRvU-0005Cz-WD
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:48:58 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nkRvS-0000rj-2f
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:48:55 -0400
Received: from fraeml707-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4KqZyL63DLz67fqj;
 Fri, 29 Apr 2022 22:44:42 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml707-chm.china.huawei.com (10.206.15.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 29 Apr 2022 16:48:52 +0200
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 29 Apr 2022 15:48:51 +0100
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
Subject: [PATCH v10 15/45] qtest/cxl: Introduce initial test for pxb-cxl only.
Date: Fri, 29 Apr 2022 15:40:40 +0100
Message-ID: <20220429144110.25167-16-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220429144110.25167-1-Jonathan.Cameron@huawei.com>
References: <20220429144110.25167-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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

Initial test with just pxb-cxl.  Other tests will be added
alongside functionality.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/cxl-test.c  | 22 ++++++++++++++++++++++
 tests/qtest/meson.build |  4 ++++
 2 files changed, 26 insertions(+)

diff --git a/tests/qtest/cxl-test.c b/tests/qtest/cxl-test.c
new file mode 100644
index 0000000000..c031049930
--- /dev/null
+++ b/tests/qtest/cxl-test.c
@@ -0,0 +1,22 @@
+/*
+ * QTest testcase for CXL
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest-single.h"
+
+static void cxl_basic_pxb(void)
+{
+    qtest_start("-machine q35,cxl=on -device pxb-cxl,bus=pcie.0");
+    qtest_end();
+}
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+    qtest_add_func("/pci/cxl/basic_pxb", cxl_basic_pxb);
+    return g_test_run();
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 22e1361210..dedb477890 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -35,6 +35,9 @@ qtests_pci = \
   (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : []) +                  \
   (config_all_devices.has_key('CONFIG_IVSHMEM_DEVICE') ? ['ivshmem-test'] : [])
 
+qtests_cxl = \
+  (config_all_devices.has_key('CONFIG_CXL') ? ['cxl-test'] : [])
+
 qtests_i386 = \
   (slirp.found() ? ['pxe-test', 'test-netfilter'] : []) +             \
   (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) +                     \
@@ -74,6 +77,7 @@ qtests_i386 = \
    slirp.found() ? ['virtio-net-failover'] : []) +                                          \
   (unpack_edk2_blobs ? ['bios-tables-test'] : []) +                                         \
   qtests_pci +                                                                              \
+  qtests_cxl +                                                                              \
   ['fdc-test',
    'ide-test',
    'hd-geo-test',
-- 
2.32.0


