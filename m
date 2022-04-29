Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A12D514F17
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 17:19:27 +0200 (CEST)
Received: from localhost ([::1]:58380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkSP0-0000cO-7N
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 11:19:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nkRz2-00021O-F4
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:52:36 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nkRyx-0001Ur-8e
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:52:32 -0400
Received: from fraeml741-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Kqb4K3Np3z67DpL;
 Fri, 29 Apr 2022 22:49:53 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml741-chm.china.huawei.com (10.206.15.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 29 Apr 2022 16:52:29 +0200
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 29 Apr 2022 15:52:28 +0100
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
Subject: [PATCH v10 22/45] qtests/cxl: Add initial root port and CXL type3
 tests
Date: Fri, 29 Apr 2022 15:40:47 +0100
Message-ID: <20220429144110.25167-23-Jonathan.Cameron@huawei.com>
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

At this stage we can boot configurations with host bridges,
root ports and type 3 memory devices, so add appropriate
tests.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/cxl-test.c | 127 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/tests/qtest/cxl-test.c b/tests/qtest/cxl-test.c
index c031049930..5f0794e816 100644
--- a/tests/qtest/cxl-test.c
+++ b/tests/qtest/cxl-test.c
@@ -8,15 +8,142 @@
 #include "qemu/osdep.h"
 #include "libqtest-single.h"
 
+#define QEMU_PXB_CMD "-machine q35,cxl=on " \
+                     "-device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52 "
+
+#define QEMU_2PXB_CMD "-machine q35,cxl=on " \
+                      "-device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52 "  \
+                      "-device pxb-cxl,id=cxl.1,bus=pcie.0,bus_nr=53 "
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
+                 "-object memory-backend-file,id=lsa0,mem-path=%s,size=256M "    \
+                 "-device cxl-type3,bus=rp0,memdev=cxl-mem0,lsa=lsa0,id=cxl-pmem0 "
+
+#define QEMU_2T3D "-object memory-backend-file,id=cxl-mem0,mem-path=%s,size=256M "    \
+                  "-object memory-backend-file,id=lsa0,mem-path=%s,size=256M "    \
+                  "-device cxl-type3,bus=rp0,memdev=cxl-mem0,lsa=lsa0,id=cxl-pmem0 " \
+                  "-object memory-backend-file,id=cxl-mem1,mem-path=%s,size=256M "    \
+                  "-object memory-backend-file,id=lsa1,mem-path=%s,size=256M "    \
+                  "-device cxl-type3,bus=rp1,memdev=cxl-mem1,lsa=lsa1,id=cxl-pmem1 "
+
+#define QEMU_4T3D "-object memory-backend-file,id=cxl-mem0,mem-path=%s,size=256M " \
+                  "-object memory-backend-file,id=lsa0,mem-path=%s,size=256M "    \
+                  "-device cxl-type3,bus=rp0,memdev=cxl-mem0,lsa=lsa0,id=cxl-pmem0 " \
+                  "-object memory-backend-file,id=cxl-mem1,mem-path=%s,size=256M "    \
+                  "-object memory-backend-file,id=lsa1,mem-path=%s,size=256M "    \
+                  "-device cxl-type3,bus=rp1,memdev=cxl-mem1,lsa=lsa1,id=cxl-pmem1 " \
+                  "-object memory-backend-file,id=cxl-mem2,mem-path=%s,size=256M "    \
+                  "-object memory-backend-file,id=lsa2,mem-path=%s,size=256M "    \
+                  "-device cxl-type3,bus=rp2,memdev=cxl-mem2,lsa=lsa2,id=cxl-pmem2 " \
+                  "-object memory-backend-file,id=cxl-mem3,mem-path=%s,size=256M "    \
+                  "-object memory-backend-file,id=lsa3,mem-path=%s,size=256M "    \
+                  "-device cxl-type3,bus=rp3,memdev=cxl-mem3,lsa=lsa3,id=cxl-pmem3 "
+
+static void cxl_basic_hb(void)
+{
+    qtest_start("-machine q35,cxl=on");
+    qtest_end();
+}
+
 static void cxl_basic_pxb(void)
 {
     qtest_start("-machine q35,cxl=on -device pxb-cxl,bus=pcie.0");
     qtest_end();
 }
 
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
+    g_autoptr(GString) cmdline = g_string_new(NULL);
+    char template[] = "/tmp/cxl-test-XXXXXX";
+    const char *tmpfs;
+
+    tmpfs = mkdtemp(template);
+
+    g_string_printf(cmdline, QEMU_PXB_CMD QEMU_RP QEMU_T3D, tmpfs, tmpfs);
+
+    qtest_start(cmdline->str);
+    qtest_end();
+}
+
+static void cxl_1pxb_2rp_2t3d(void)
+{
+    g_autoptr(GString) cmdline = g_string_new(NULL);
+    char template[] = "/tmp/cxl-test-XXXXXX";
+    const char *tmpfs;
+
+    tmpfs = mkdtemp(template);
+
+    g_string_printf(cmdline, QEMU_PXB_CMD QEMU_2RP QEMU_2T3D,
+                    tmpfs, tmpfs, tmpfs, tmpfs);
+
+    qtest_start(cmdline->str);
+    qtest_end();
+}
+
+static void cxl_2pxb_4rp_4t3d(void)
+{
+    g_autoptr(GString) cmdline = g_string_new(NULL);
+    char template[] = "/tmp/cxl-test-XXXXXX";
+    const char *tmpfs;
+
+    tmpfs = mkdtemp(template);
+
+    g_string_printf(cmdline, QEMU_2PXB_CMD QEMU_4RP QEMU_4T3D,
+                    tmpfs, tmpfs, tmpfs, tmpfs, tmpfs, tmpfs,
+                    tmpfs, tmpfs);
+
+    qtest_start(cmdline->str);
+    qtest_end();
+}
+
 int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
+
+    qtest_add_func("/pci/cxl/basic_hostbridge", cxl_basic_hb);
     qtest_add_func("/pci/cxl/basic_pxb", cxl_basic_pxb);
+    qtest_add_func("/pci/cxl/pxb_with_window", cxl_pxb_with_window);
+    qtest_add_func("/pci/cxl/pxb_x2_with_window", cxl_2pxb_with_window);
+    qtest_add_func("/pci/cxl/rp", cxl_root_port);
+    qtest_add_func("/pci/cxl/rp_x2", cxl_2root_port);
+    qtest_add_func("/pci/cxl/type3_device", cxl_t3d);
+    qtest_add_func("/pci/cxl/rp_x2_type3_x2", cxl_1pxb_2rp_2t3d);
+    qtest_add_func("/pci/cxl/pxb_x2_root_port_x4_type3_x4", cxl_2pxb_4rp_4t3d);
     return g_test_run();
 }
-- 
2.32.0


