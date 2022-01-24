Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D96094989C0
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 19:59:05 +0100 (CET)
Received: from localhost ([::1]:38948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC4YS-0001nf-VS
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 13:59:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nC3Id-0000Ei-04
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 12:38:39 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nC3Ia-0002Yx-Qv
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 12:38:38 -0500
Received: from fraeml734-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4JjHDw0HwGz67KsG;
 Tue, 25 Jan 2022 01:35:12 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml734-chm.china.huawei.com (10.206.15.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 24 Jan 2022 18:38:34 +0100
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 24 Jan 2022 17:38:34 +0000
To: <qemu-devel@nongnu.org>, Marcel Apfelbaum <marcel@redhat.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
CC: <linux-cxl@vger.kernel.org>, Ben Widawsky <ben.widawsky@intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>, <linuxarm@huawei.com>, Shameerali Kolothum Thodi
 <shameerali.kolothum.thodi@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Saransh Gupta1
 <saransh@ibm.com>, Shreyas Shah <shreyas.shah@elastics.cloud>, Chris Browy
 <cbrowy@avery-design.com>, Samarth Saxena <samarths@cadence.com>, "Dan
 Williams" <dan.j.williams@intel.com>
Subject: [PATCH v4 42/42] qtest/cxl: Add very basic sanity tests
Date: Mon, 24 Jan 2022 17:17:05 +0000
Message-ID: <20220124171705.10432-43-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
References: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml740-chm.china.huawei.com (10.201.108.190) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

From: Ben Widawsky <ben.widawsky@intel.com>

Simple 'does it boot tests' with up to
2x PXB host bridge, each with 2x CXL RP and each of those with
a Type 3 memory device.  Single CFMWS to interleave across the
two HBs and ultimate the 4 devices.

More complete tests may be possible but CXL interleave setup
is complex so a lot of steps will be needed.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Co-developed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 tests/qtest/cxl-test.c  | 151 ++++++++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build |   4 ++
 2 files changed, 155 insertions(+)

diff --git a/tests/qtest/cxl-test.c b/tests/qtest/cxl-test.c
new file mode 100644
index 0000000000..bbefbaa870
--- /dev/null
+++ b/tests/qtest/cxl-test.c
@@ -0,0 +1,151 @@
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
+#define QEMU_PXB_CMD "-machine q35,cxl=on " \
+                     "-device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52,uid=22 "  \
+                     "-cxl-fixed-memory-window targets=cxl.0,size=4G "
+
+#define QEMU_2PXB_CMD "-machine q35,cxl=on " \
+                      "-device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52,uid=22 "  \
+                      "-device pxb-cxl,id=cxl.1,bus=pcie.0,bus_nr=53,uid=122 " \
+                      "-cxl-fixed-memory-window targets=cxl.0,targets=cxl.1,size=4G "
+
+#define QEMU_RP "-device cxl-rp,id=rp0,bus=cxl.0,chassis=0,slot=0 "
+
+/* Dual ports on first pxb */
+#define QEMU_2RP "-device cxl-rp,id=rp0,bus=cxl.0,chassis=0,slot=0 " \
+                 "-device cxl-rp,id=rp1,bus=cxl.0,chassis=0,slot=1 "
+
+/* Dual ports on each of the pxb instances */
+#define QEMU_4RP "-device cxl-rp,id=rp0,bus=cxl.0,chassis=0,slot=0 " \
+                 "-device cxl-rp,id=rp1,bus=cxl.0,chassis=0,slot=1 " \
+                 "-device cxl-rp,id=rp2,bus=cxl.1,chassis=0,slot=2 " \
+                 "-device cxl-rp,id=rp3,bus=cxl.1,chassis=0,slot=3 "
+
+#define QEMU_T3D "-object memory-backend-file,id=cxl-mem0,mem-path=%s,size=256M " \
+                 "-device cxl-type3,bus=rp0,memdev=cxl-mem0,id=cxl-pmem0,size=256M "
+
+#define QEMU_2T3D "-object memory-backend-file,id=cxl-mem0,mem-path=%s,size=256M "    \
+                  "-device cxl-type3,bus=rp0,memdev=cxl-mem0,id=cxl-pmem0,size=256M " \
+                  "-object memory-backend-file,id=cxl-mem1,mem-path=%s,size=256M "    \
+                  "-device cxl-type3,bus=rp1,memdev=cxl-mem1,id=cxl-pmem1,size=256M "
+
+#define QEMU_4T3D "-object memory-backend-file,id=cxl-mem0,mem-path=%s,size=256M "    \
+                  "-device cxl-type3,bus=rp0,memdev=cxl-mem0,id=cxl-pmem0,size=256M " \
+                  "-object memory-backend-file,id=cxl-mem1,mem-path=%s,size=256M "    \
+                  "-device cxl-type3,bus=rp1,memdev=cxl-mem1,id=cxl-pmem1,size=256M " \
+                  "-object memory-backend-file,id=cxl-mem2,mem-path=%s,size=256M "    \
+                  "-device cxl-type3,bus=rp2,memdev=cxl-mem2,id=cxl-pmem2,size=256M " \
+                  "-object memory-backend-file,id=cxl-mem3,mem-path=%s,size=256M "    \
+                  "-device cxl-type3,bus=rp3,memdev=cxl-mem3,id=cxl-pmem3,size=256M "
+
+static void cxl_basic_hb(void)
+{
+    qtest_start("-machine q35,cxl=on");
+    qtest_end();
+}
+
+static void cxl_basic_pxb(void)
+{
+    qtest_start("-machine q35,cxl=on -device pxb-cxl,bus=pcie.0,uid=22");
+    qtest_end();
+}
+
+static void cxl_pxb_with_window(void)
+{
+    qtest_start(QEMU_PXB_CMD);
+    qtest_end();
+}
+
+static void cxl_2pxb_with_window(void)
+{
+    qtest_start(QEMU_2PXB_CMD);
+    qtest_end();
+}
+
+static void cxl_root_port(void)
+{
+    qtest_start(QEMU_PXB_CMD QEMU_RP);
+    qtest_end();
+}
+
+static void cxl_2root_port(void)
+{
+    qtest_start(QEMU_PXB_CMD QEMU_2RP);
+    qtest_end();
+}
+
+static void cxl_t3d(void)
+{
+    GString *cmdline;
+    char template[] = "/tmp/cxl-test-XXXXXX";
+    const char *tmpfs;
+
+    tmpfs = mkdtemp(template);
+
+    cmdline = g_string_new(NULL);
+    g_string_printf(cmdline, QEMU_PXB_CMD QEMU_RP QEMU_T3D, tmpfs);
+
+    qtest_start(cmdline->str);
+    qtest_end();
+
+    g_string_free(cmdline, TRUE);
+}
+
+static void cxl_1pxb_2rp_2t3d(void)
+{
+    GString *cmdline;
+    char template[] = "/tmp/cxl-test-XXXXXX";
+    const char *tmpfs;
+
+    tmpfs = mkdtemp(template);
+
+    cmdline = g_string_new(NULL);
+    g_string_printf(cmdline, QEMU_PXB_CMD QEMU_2RP QEMU_2T3D, tmpfs, tmpfs);
+
+    qtest_start(cmdline->str);
+    qtest_end();
+
+    g_string_free(cmdline, TRUE);
+}
+
+static void cxl_2pxb_4rp_4t3d(void)
+{
+    GString *cmdline;
+    char template[] = "/tmp/cxl-test-XXXXXX";
+    const char *tmpfs;
+
+    tmpfs = mkdtemp(template);
+
+    cmdline = g_string_new(NULL);
+    g_string_printf(cmdline, QEMU_2PXB_CMD QEMU_4RP QEMU_4T3D,
+                    tmpfs, tmpfs, tmpfs, tmpfs);
+
+    qtest_start(cmdline->str);
+    qtest_end();
+
+    g_string_free(cmdline, TRUE);
+}
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_add_func("/pci/cxl/basic_hostbridge", cxl_basic_hb);
+    qtest_add_func("/pci/cxl/basic_pxb", cxl_basic_pxb);
+    qtest_add_func("/pci/cxl/pxb_with_window", cxl_pxb_with_window);
+    qtest_add_func("/pci/cxl/pxb_x2_with_window", cxl_2pxb_with_window);
+    qtest_add_func("/pci/cxl/rp", cxl_root_port);
+    qtest_add_func("/pci/cxl/rp_x2", cxl_2root_port);
+    qtest_add_func("/pci/cxl/type3_device", cxl_t3d);
+    qtest_add_func("/pci/cxl/rp_x2_type3_x2", cxl_1pxb_2rp_2t3d);
+    qtest_add_func("/pci/cxl/pxb_x2_root_port_x4_type3_x4", cxl_2pxb_4rp_4t3d);
+    return g_test_run();
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 26937deb6d..a016449657 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -41,6 +41,9 @@ qtests_pci = \
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


