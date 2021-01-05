Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8BA2EB125
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:13:27 +0100 (CET)
Received: from localhost ([::1]:59272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwpte-0007tH-0x
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:13:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kwpbF-00007d-NC
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:54:25 -0500
Received: from mga18.intel.com ([134.134.136.126]:10374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kwpb8-00016I-9k
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:54:25 -0500
IronPort-SDR: juQ0oZcSkcVoHgn678ne9Kkp3nbQkFtidSgxwCgfnVSoycHWOtMv5LNMhMK5vGVth8pNQ/WJBY
 yIaLGpT9AxIA==
X-IronPort-AV: E=McAfee;i="6000,8403,9855"; a="164841153"
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="164841153"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 08:54:12 -0800
IronPort-SDR: +gO12oiaYGaQsoESvR0OtVzPkOSh5p19tV0GfExwLy9qarhQmVOZ3em0pxd89d25CfqXQpQ1lJ
 oUkdjEJtWF2w==
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="346338105"
Received: from tgeddam-mobl.amr.corp.intel.com (HELO bwidawsk-mobl5.local)
 ([10.252.140.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 08:54:08 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 32/32] qtest/cxl: Add very basic sanity tests
Date: Tue,  5 Jan 2021 08:53:23 -0800
Message-Id: <20210105165323.783725-33-ben.widawsky@intel.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210105165323.783725-1-ben.widawsky@intel.com>
References: <20210105165323.783725-1-ben.widawsky@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=ben.widawsky@intel.com; helo=mga18.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Ben Widawsky <ben.widawsky@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Vishal Verma <vishal.l.verma@intel.com>,
 Chris Browy <cbrowy@avery-design.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Prashant V Agarwal <agpr123@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
---
 tests/qtest/cxl-test.c  | 93 +++++++++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build |  4 ++
 2 files changed, 97 insertions(+)
 create mode 100644 tests/qtest/cxl-test.c

diff --git a/tests/qtest/cxl-test.c b/tests/qtest/cxl-test.c
new file mode 100644
index 0000000000..00eca14faa
--- /dev/null
+++ b/tests/qtest/cxl-test.c
@@ -0,0 +1,93 @@
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
+#define QEMU_PXB_CMD "-machine q35 -object memory-backend-file,id=cxl-mem1," \
+                     "share,mem-path=%s,size=512M "                          \
+                     "-device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52,uid=0,"  \
+                     "len-window-base=1,window-base[0]=0x4c0000000,memdev[0]=cxl-mem1"
+#define QEMU_RP "-device cxl-rp,id=rp0,bus=cxl.0,addr=0.0,chassis=0,slot=0"
+
+#define QEMU_T3D "-device cxl-type3,bus=rp0,memdev=cxl-mem1,id=cxl-pmem0,size=256M"
+
+static void cxl_basic_hb(void)
+{
+    qtest_start("-machine q35,cxl");
+    qtest_end();
+}
+
+static void cxl_basic_pxb(void)
+{
+    qtest_start("-machine q35 -device pxb-cxl,bus=pcie.0,uid=0");
+    qtest_end();
+}
+
+static void cxl_pxb_with_window(void)
+{
+    GString *cmdline;
+    char template[] = "/tmp/cxl-test-XXXXXX";
+    const char *tmpfs;
+
+    tmpfs = mkdtemp(template);
+
+    cmdline = g_string_new(NULL);
+    g_string_printf(cmdline, QEMU_PXB_CMD, tmpfs);
+
+    qtest_start(cmdline->str);
+    qtest_end();
+
+    g_string_free(cmdline, TRUE);
+}
+
+static void cxl_root_port(void)
+{
+    GString *cmdline;
+    char template[] = "/tmp/cxl-test-XXXXXX";
+    const char *tmpfs;
+
+    tmpfs = mkdtemp(template);
+
+    cmdline = g_string_new(NULL);
+    g_string_printf(cmdline, QEMU_PXB_CMD " %s", tmpfs, QEMU_RP);
+
+    qtest_start(cmdline->str);
+    qtest_end();
+
+    g_string_free(cmdline, TRUE);
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
+    g_string_printf(cmdline, QEMU_PXB_CMD " %s %s", tmpfs, QEMU_RP, QEMU_T3D);
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
+    qtest_add_func("/pci/cxl/root_port", cxl_root_port);
+    qtest_add_func("/pci/cxl/type3_device", cxl_t3d);
+
+    return g_test_run();
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 6a67c538be..6ab14fc79a 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -22,6 +22,9 @@ qtests_pci = \
   (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : []) +                  \
   (config_all_devices.has_key('CONFIG_IVSHMEM_DEVICE') ? ['ivshmem-test'] : [])
 
+qtests_cxl = \
+  (config_all_devices.has_key('CONFIG_CXL') ? ['cxl-test'] : [])
+
 qtests_i386 = \
   (slirp.found() ? ['pxe-test', 'test-netfilter'] : []) +             \
   (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) +                     \
@@ -47,6 +50,7 @@ qtests_i386 = \
   (config_all_devices.has_key('CONFIG_TPM_TIS_ISA') ? ['tpm-tis-swtpm-test'] : []) +        \
   (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['rtl8139-test'] : []) +              \
   qtests_pci +                                                                              \
+  qtests_cxl +                                                                              \
   ['fdc-test',
    'ide-test',
    'hd-geo-test',
-- 
2.30.0


