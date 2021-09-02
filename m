Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 896B93FECCF
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 13:20:42 +0200 (CEST)
Received: from localhost ([::1]:60930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLklt-0000YO-JH
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 07:20:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mLkVn-0007dC-DQ; Thu, 02 Sep 2021 07:04:03 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mLkVf-0003np-PU; Thu, 02 Sep 2021 07:04:03 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4H0dHH1qztzbfwC;
 Thu,  2 Sep 2021 18:59:55 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 2 Sep 2021 19:03:51 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 2 Sep 2021 19:03:50 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, 
 <qemu-ppc@nongnu.org>, <qemu-s390x@nongnu.org>
Subject: [PATCH v8 14/14] tests/unit: Add a unit test for smp parsing
Date: Thu, 2 Sep 2021 19:03:30 +0800
Message-ID: <20210902110330.18036-15-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210902110330.18036-1-wangyanan55@huawei.com>
References: <20210902110330.18036-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
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
Cc: Peter
 Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>, Pierre
 Morel <pmorel@linux.ibm.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Greg Kurz <groug@kaod.org>,
 Yanan Wang <wangyanan55@huawei.com>, wanghaibin.wang@huawei.com,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a QEMU unit test for the parsing of given SMP configuration.
Since all the parsing logic is in generic function smp_parse(),
this test passes different SMP configurations to the function
and compare the parsing result with what is expected.

In the test, all possible collections of the topology parameters
and the corresponding expected results are listed, including the
valid and invalid ones.

The preference of sockets over cores and the preference of cores
over sockets, and the support of multi-dies are also considered.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 MAINTAINERS                 |   1 +
 tests/unit/meson.build      |   1 +
 tests/unit/test-smp-parse.c | 866 ++++++++++++++++++++++++++++++++++++
 3 files changed, 868 insertions(+)
 create mode 100644 tests/unit/test-smp-parse.c

diff --git a/MAINTAINERS b/MAINTAINERS
index fb0bd4c023..1b4081a9c2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1641,6 +1641,7 @@ F: include/hw/boards.h
 F: include/hw/core/cpu.h
 F: include/hw/cpu/cluster.h
 F: include/sysemu/numa.h
+F: tests/unit/test-smp-parse.c
 T: git https://gitlab.com/ehabkost/qemu.git machine-next
 
 Xtensa Machines
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index 5736d285b2..e208173970 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -45,6 +45,7 @@ tests = {
   'test-uuid': [],
   'ptimer-test': ['ptimer-test-stubs.c', meson.source_root() / 'hw/core/ptimer.c'],
   'test-qapi-util': [],
+  'test-smp-parse': [qom, meson.source_root() / 'hw/core/machine-smp.c'],
 }
 
 if have_system or have_tools
diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
new file mode 100644
index 0000000000..836dfd320f
--- /dev/null
+++ b/tests/unit/test-smp-parse.c
@@ -0,0 +1,866 @@
+/*
+ * SMP parsing unit-tests
+ *
+ * Copyright (c) 2021 Huawei Technologies Co., Ltd
+ *
+ * Authors:
+ *  Yanan Wang <wangyanan55@huawei.com>
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2.1 or later.
+ * See the COPYING.LIB file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qom/object.h"
+#include "qemu/module.h"
+#include "qapi/error.h"
+
+#include "hw/boards.h"
+
+#define T true
+#define F false
+
+#define MIN_CPUS 1
+#define MAX_CPUS 512
+
+/* define a CPU topology hierarchy of sockets/cores/threads */
+#define SMP_CONFIG_GENERIC(ha, a, hb, b, hc, c, hd, d, he, e) \
+        {                                                     \
+            .has_cpus    = ha, .cpus    = a,                  \
+            .has_sockets = hb, .sockets = b,                  \
+            .has_cores   = hc, .cores   = c,                  \
+            .has_threads = hd, .threads = d,                  \
+            .has_maxcpus = he, .maxcpus = e,                  \
+        }
+
+#define CPU_TOPOLOGY_GENERIC(a, b, c, d, e)                   \
+        {                                                     \
+            .cpus     = a,                                    \
+            .sockets  = b,                                    \
+            .cores    = c,                                    \
+            .threads  = d,                                    \
+            .max_cpus = e,                                    \
+        }
+
+/* define a CPU topology hierarchy of sockets/dies/cores/threads */
+#define SMP_CONFIG_WITH_DIES(ha, a, hb, b, hc, c, hd, d, he, e, hf, f) \
+        {                                                     \
+            .has_cpus    = ha, .cpus    = a,                  \
+            .has_sockets = hb, .sockets = b,                  \
+            .has_dies    = hc, .dies    = c,                  \
+            .has_cores   = hd, .cores   = d,                  \
+            .has_threads = he, .threads = e,                  \
+            .has_maxcpus = hf, .maxcpus = f,                  \
+        }
+
+#define CPU_TOPOLOGY_WITH_DIES(a, b, c, d, e, f)              \
+        {                                                     \
+            .cpus     = a,                                    \
+            .sockets  = b,                                    \
+            .dies     = c,                                    \
+            .cores    = d,                                    \
+            .threads  = e,                                    \
+            .max_cpus = f,                                    \
+        }
+
+/**
+ * SMPTestData:
+ * @config - the given SMP configuration
+ * @expect_prefer_sockets - expected topology result for the valid
+ * configuration, when sockets are preferred over cores in parsing
+ * @expect_prefer_cores - expected topology result for the valid
+ * configuration, when cores are preferred over sockets in parsing
+ * @expect_error - expected error report for the invalid configuration
+ */
+typedef struct SMPTestData {
+    SMPConfiguration config;
+    CpuTopology expect_prefer_sockets;
+    CpuTopology expect_prefer_cores;
+    const char *expect_error;
+} SMPTestData;
+
+/* specific machine type info for testing */
+static const TypeInfo smp_machine_info = {
+    .name = TYPE_MACHINE,
+    .parent = TYPE_OBJECT,
+    .class_size = sizeof(MachineClass),
+    .instance_size = sizeof(MachineState),
+};
+
+/*
+ * all possible valid collections of generic topology parameters
+ * and the corresponding expected outputs are listed.
+ */
+static struct SMPTestData data_generic[] = {
+    {
+        /* config: no configuration provided
+         * expect: cpus=1,sockets=1,cores=1,threads=1,maxcpus=1 */
+        .config = SMP_CONFIG_GENERIC(F, 0, F, 0, F, 0, F, 0, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(1, 1, 1, 1, 1),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(1, 1, 1, 1, 1),
+    }, {
+        /* config: -smp 8
+         * prefer_sockets: cpus=8,sockets=8,cores=1,threads=1,maxcpus=8
+         * prefer_cores: cpus=8,sockets=1,cores=8,threads=1,maxcpus=8 */
+        .config = SMP_CONFIG_GENERIC(T, 8, F, 0, F, 0, F, 0, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(8, 8, 1, 1, 8),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(8, 1, 8, 1, 8),
+    }, {
+        /* config: -smp sockets=2
+         * expect: cpus=2,sockets=2,cores=1,threads=1,maxcpus=2 */
+        .config = SMP_CONFIG_GENERIC(F, 0, T, 2, F, 0, F, 0, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(2, 2, 1, 1, 2),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(2, 2, 1, 1, 2),
+    }, {
+        /* config: -smp cores=4
+         * expect: cpus=4,sockets=1,cores=4,threads=1,maxcpus=4 */
+        .config = SMP_CONFIG_GENERIC(F, 0, F, 0, T, 4, F, 0, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(4, 1, 4, 1, 4),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(4, 1, 4, 1, 4),
+    }, {
+        /* config: -smp threads=2
+         * expect: cpus=2,sockets=1,cores=1,threads=2,maxcpus=2 */
+        .config = SMP_CONFIG_GENERIC(F, 0, F, 0, F, 0, T, 2, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(2, 1, 1, 2, 2),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(2, 1, 1, 2, 2),
+    }, {
+        /* config: -smp maxcpus=16
+         * prefer_sockets: cpus=16,sockets=16,cores=1,threads=1,maxcpus=16
+         * prefer_cores: cpus=16,sockets=1,cores=16,threads=1,maxcpus=16 */
+        .config = SMP_CONFIG_GENERIC(F, 0, F, 0, F, 0, F, 0, T, 16),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(16, 16, 1, 1, 16),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(16, 1, 16, 1, 16),
+    }, {
+        /* config: -smp 8,sockets=2
+         * expect: cpus=8,sockets=2,cores=4,threads=1,maxcpus=8 */
+        .config = SMP_CONFIG_GENERIC(T, 8, T, 2, F, 0, F, 0, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(8, 2, 4, 1, 8),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(8, 2, 4, 1, 8),
+    }, {
+        /* config: -smp 8,cores=4
+         * expect: cpus=8,sockets=2,cores=4,threads=1,maxcpus=8 */
+        .config = SMP_CONFIG_GENERIC(T, 8, F, 0, T, 4, F, 0, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(8, 2, 4, 1, 8),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(8, 2, 4, 1, 8),
+    }, {
+        /* config: -smp 8,threads=2
+         * prefer_sockets: cpus=8,sockets=4,cores=1,threads=2,maxcpus=8
+         * prefer_cores: cpus=8,sockets=1,cores=4,threads=2,maxcpus=8 */
+        .config = SMP_CONFIG_GENERIC(T, 8, F, 0, F, 0, T, 2, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(8, 4, 1, 2, 8),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(8, 1, 4, 2, 8),
+    }, {
+        /* config: -smp 8,maxcpus=16
+         * prefer_sockets: cpus=8,sockets=16,cores=1,threads=1,maxcpus=16
+         * prefer_cores: cpus=8,sockets=1,cores=16,threads=1,maxcpus=16 */
+        .config = SMP_CONFIG_GENERIC(T, 8, F, 0, F, 0, F, 0, T, 16),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(8, 16, 1, 1, 16),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(8, 1, 16, 1, 16),
+    }, {
+        /* config: -smp sockets=2,cores=4
+         * expect: cpus=8,sockets=2,cores=4,threads=1,maxcpus=8 */
+        .config = SMP_CONFIG_GENERIC(F, 0, T, 2, T, 4, F, 0, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(8, 2, 4, 1, 8),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(8, 2, 4, 1, 8),
+    }, {
+        /* config: -smp sockets=2,threads=2
+         * expect: cpus=4,sockets=2,cores=1,threads=2,maxcpus=4 */
+        .config = SMP_CONFIG_GENERIC(F, 0, T, 2, F, 0, T, 2, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(4, 2, 1, 2, 4),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(4, 2, 1, 2, 4),
+    }, {
+        /* config: -smp sockets=2,maxcpus=16
+         * expect: cpus=16,sockets=2,cores=8,threads=1,maxcpus=16 */
+        .config = SMP_CONFIG_GENERIC(F, 0, T, 2, F, 0, F, 0, T, 16),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(16, 2, 8, 1, 16),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(16, 2, 8, 1, 16),
+    }, {
+        /* config: -smp cores=4,threads=2
+         * expect: cpus=8,sockets=1,cores=4,threads=2,maxcpus=8 */
+        .config = SMP_CONFIG_GENERIC(F, 0, F, 0, T, 4, T, 2, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(8, 1, 4, 2, 8),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(8, 1, 4, 2, 8),
+    }, {
+        /* config: -smp cores=4,maxcpus=16
+         * expect: cpus=16,sockets=4,cores=4,threads=1,maxcpus=16 */
+        .config = SMP_CONFIG_GENERIC(F, 0, F, 0, T, 4, F, 0, T, 16),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(16, 4, 4, 1, 16),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(16, 4, 4, 1, 16),
+    }, {
+        /* config: -smp threads=2,maxcpus=16
+         * prefer_sockets: cpus=16,sockets=8,cores=1,threads=2,maxcpus=16
+         * prefer_cores: cpus=16,sockets=1,cores=8,threads=2,maxcpus=16 */
+        .config = SMP_CONFIG_GENERIC(F, 0, F, 0, F, 0, T, 2, T, 16),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(16, 8, 1, 2, 16),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(16, 1, 8, 2, 16),
+    }, {
+        /* config: -smp 8,sockets=2,cores=4
+         * expect: cpus=8,sockets=2,cores=4,threads=1,maxcpus=8 */
+        .config = SMP_CONFIG_GENERIC(T, 8, T, 2, T, 4, F, 0, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(8, 2, 4, 1, 8),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(8, 2, 4, 1, 8),
+    }, {
+        /* config: -smp 8,sockets=2,threads=2
+         * expect: cpus=8,sockets=2,cores=2,threads=2,maxcpus=8 */
+        .config = SMP_CONFIG_GENERIC(T, 8, T, 2, F, 0, T, 2, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(8, 2, 2, 2, 8),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(8, 2, 2, 2, 8),
+    }, {
+        /* config: -smp 8,sockets=2,maxcpus=16
+         * expect: cpus=8,sockets=2,cores=8,threads=1,maxcpus=16 */
+        .config = SMP_CONFIG_GENERIC(T, 8, T, 2, F, 0, F, 0, T, 16),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(8, 2, 8, 1, 16),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(8, 2, 8, 1, 16),
+    }, {
+        /* config: -smp 8,cores=4,threads=2
+         * expect: cpus=8,sockets=1,cores=4,threads=2,maxcpus=8 */
+        .config = SMP_CONFIG_GENERIC(T, 8, F, 0, T, 4, T, 2, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(8, 1, 4, 2, 8),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(8, 1, 4, 2, 8),
+    }, {
+        /* config: -smp 8,cores=4,maxcpus=16
+         * expect: cpus=8,sockets=4,cores=4,threads=1,maxcpus=16 */
+        .config = SMP_CONFIG_GENERIC(T, 8, F, 0, T, 4, F, 0, T, 16),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(8, 4, 4, 1, 16),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(8, 4, 4, 1, 16),
+    }, {
+        /* config: -smp 8,threads=2,maxcpus=16
+         * prefer_sockets: cpus=8,sockets=8,cores=1,threads=2,maxcpus=16
+         * prefer_cores: cpus=8,sockets=1,cores=8,threads=2,maxcpus=16 */
+        .config = SMP_CONFIG_GENERIC(T, 8, F, 0, F, 0, T, 2, T, 16),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(8, 8, 1, 2, 16),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(8, 1, 8, 2, 16),
+    }, {
+        /* config: -smp sockets=2,cores=4,threads=2
+         * expect: cpus=16,sockets=2,cores=4,threads=2,maxcpus=16 */
+        .config = SMP_CONFIG_GENERIC(F, 0, T, 2, T, 4, T, 2, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(16, 2, 4, 2, 16),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(16, 2, 4, 2, 16),
+    }, {
+        /* config: -smp sockets=2,cores=4,maxcpus=16
+         * expect: cpus=16,sockets=2,cores=4,threads=2,maxcpus=16 */
+        .config = SMP_CONFIG_GENERIC(F, 0, T, 2, T, 4, F, 0, T, 16),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(16, 2, 4, 2, 16),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(16, 2, 4, 2, 16),
+    }, {
+        /* config: -smp sockets=2,threads=2,maxcpus=16
+         * expect: cpus=16,sockets=2,cores=4,threads=2,maxcpus=16 */
+        .config = SMP_CONFIG_GENERIC(F, 0, T, 2, F, 0, T, 2, T, 16),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(16, 2, 4, 2, 16),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(16, 2, 4, 2, 16),
+    }, {
+        /* config: -smp cores=4,threads=2,maxcpus=16
+         * expect: cpus=16,sockets=2,cores=4,threads=2,maxcpus=16 */
+        .config = SMP_CONFIG_GENERIC(F, 0, F, 0, T, 4, T, 2, T, 16),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(16, 2, 4, 2, 16),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(16, 2, 4, 2, 16),
+    }, {
+        /* config: -smp 8,sockets=2,cores=4,threads=1
+         * expect: cpus=8,sockets=2,cores=4,threads=1,maxcpus=8 */
+        .config = SMP_CONFIG_GENERIC(T, 8, T, 2, T, 4, T, 1, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(8, 2, 4, 1, 8),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(8, 2, 4, 1, 8),
+    }, {
+        /* config: -smp 8,sockets=2,cores=4,maxcpus=16
+         * expect: cpus=8,sockets=2,cores=4,threads=2,maxcpus=16 */
+        .config = SMP_CONFIG_GENERIC(T, 8, T, 2, T, 4, F, 0, T, 16),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(8, 2, 4, 2, 16),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(8, 2, 4, 2, 16),
+    }, {
+        /* config: -smp 8,sockets=2,threads=2,maxcpus=16
+         * expect: cpus=8,sockets=2,cores=4,threads=2,maxcpus=16 */
+        .config = SMP_CONFIG_GENERIC(T, 8, T, 2, F, 0, T, 2, T, 16),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(8, 2, 4, 2, 16),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(8, 2, 4, 2, 16),
+    }, {
+        /* config: -smp 8,cores=4,threads=2,maxcpus=16
+         * expect: cpus=8,sockets=2,cores=4,threads=2,maxcpus=16 */
+        .config = SMP_CONFIG_GENERIC(T, 8, F, 0, T, 4, T, 2, T, 16),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(8, 2, 4, 2, 16),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(8, 2, 4, 2, 16),
+    }, {
+        /* config: -smp sockets=2,cores=4,threads=2,maxcpus=16
+         * expect: cpus=16,sockets=2,cores=4,threads=2,maxcpus=16 */
+        .config = SMP_CONFIG_GENERIC(F, 0, T, 2, T, 4, T, 2, T, 16),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(16, 2, 4, 2, 16),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(16, 2, 4, 2, 16),
+    }, {
+        /* config: -smp 8,sockets=2,cores=4,threads=2,maxcpus=16
+         * expect: cpus=8,sockets=2,cores=4,threads=2,maxcpus=16 */
+        .config = SMP_CONFIG_GENERIC(T, 8, T, 2, T, 4, T, 2, T, 16),
+        .expect_prefer_sockets = CPU_TOPOLOGY_GENERIC(8, 2, 4, 2, 16),
+        .expect_prefer_cores   = CPU_TOPOLOGY_GENERIC(8, 2, 4, 2, 16),
+    },
+};
+
+/*
+ * all possible valid collections of topology parameters (with dies)
+ * and the corresponding expected outputs are listed.
+ */
+static SMPTestData data_with_dies[] = {
+    {
+        /* config: -smp dies=2
+         * expect: cpus=2,sockets=1,dies=2,cores=1,threads=1,maxcpus=2 */
+        .config = SMP_CONFIG_WITH_DIES(F, 0, F, 0, T, 2, F, 0, F, 0, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_WITH_DIES(2, 1, 2, 1, 1, 2),
+        .expect_prefer_cores   = CPU_TOPOLOGY_WITH_DIES(2, 1, 2, 1, 1, 2),
+    }, {
+        /* config: -smp 16,dies=2
+         * prefer_sockets: cpus=16,sockets=8,dies=2,cores=1,threads=1,maxcpus=16
+         * prefer_cores: cpus=16,sockets=1,dies=2,cores=8,threads=1,maxcpus=16 */
+        .config = SMP_CONFIG_WITH_DIES(T, 16, F, 0, T, 2, F, 0, F, 0, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_WITH_DIES(16, 8, 2, 1, 1, 16),
+        .expect_prefer_cores   = CPU_TOPOLOGY_WITH_DIES(16, 1, 2, 8, 1, 16),
+    }, {
+        /* config: -smp sockets=2,dies=2
+         * expect: cpus=4,sockets=2,dies=2,cores=1,threads=1,maxcpus=4 */
+        .config = SMP_CONFIG_WITH_DIES(F, 0, T, 2, T, 2, F, 0, F, 0, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_WITH_DIES(4, 2, 2, 1, 1, 4),
+        .expect_prefer_cores   = CPU_TOPOLOGY_WITH_DIES(4, 2, 2, 1, 1, 4),
+    }, {
+        /* config: -smp dies=2,cores=4
+         * expect: cpus=8,sockets=1,dies=2,cores=4,threads=1,maxcpus=8 */
+        .config = SMP_CONFIG_WITH_DIES(F, 0, F, 0, T, 2, T, 4, F, 0, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_WITH_DIES(8, 1, 2, 4, 1, 8),
+        .expect_prefer_cores   = CPU_TOPOLOGY_WITH_DIES(8, 1, 2, 4, 1, 8),
+    }, {
+        /* config: -smp dies=2,threads=2
+         * expect: cpus=4,sockets=1,dies=2,cores=1,threads=2,maxcpus=4 */
+        .config = SMP_CONFIG_WITH_DIES(F, 0, F, 0, T, 2, F, 0, T, 2, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_WITH_DIES(4, 1, 2, 1, 2, 4),
+        .expect_prefer_cores   = CPU_TOPOLOGY_WITH_DIES(4, 1, 2, 1, 2, 4),
+    }, {
+        /* config: -smp dies=2,maxcpus=32
+         * prefer_sockets: cpus=32,sockets=16,dies=2,cores=1,threads=1,maxcpus=32
+         * prefer_cores: cpus=32,sockets=1,dies=2,cores=16,threads=1,maxcpus=32 */
+        .config = SMP_CONFIG_WITH_DIES(F, 0, F, 0, T, 2, F, 0, F, 0, T, 32),
+        .expect_prefer_sockets = CPU_TOPOLOGY_WITH_DIES(32, 16, 2, 1, 1, 32),
+        .expect_prefer_cores   = CPU_TOPOLOGY_WITH_DIES(32, 1, 2, 16, 1, 32),
+    }, {
+        /* config: -smp 16,sockets=2,dies=2
+         * expect: cpus=16,sockets=2,dies=2,cores=4,threads=1,maxcpus=16 */
+        .config = SMP_CONFIG_WITH_DIES(T, 16, T, 2, T, 2, F, 0, F, 0, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_WITH_DIES(16, 2, 2, 4, 1, 16),
+        .expect_prefer_cores   = CPU_TOPOLOGY_WITH_DIES(16, 2, 2, 4, 1, 16),
+    }, {
+        /* config: -smp 16,dies=2,cores=4
+         * expect: cpus=16,sockets=2,dies=2,cores=4,threads=1,maxcpus=16 */
+        .config = SMP_CONFIG_WITH_DIES(T, 16, F, 0, T, 2, T, 4, F, 0, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_WITH_DIES(16, 2, 2, 4, 1, 16),
+        .expect_prefer_cores   = CPU_TOPOLOGY_WITH_DIES(16, 2, 2, 4, 1, 16),
+    }, {
+        /* config: -smp 16,dies=2,threads=2
+         * prefer_sockets: cpus=16,sockets=4,dies=2,cores=1,threads=2,maxcpus=16
+         * prefer_cores: cpus=16,sockets=1,dies=2,cores=4,threads=2,maxcpus=16 */
+        .config = SMP_CONFIG_WITH_DIES(T, 16, F, 0, T, 2, F, 0, T, 2, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_WITH_DIES(16, 4, 2, 1, 2, 16),
+        .expect_prefer_cores   = CPU_TOPOLOGY_WITH_DIES(16, 1, 2, 4, 2, 16),
+    }, {
+        /* config: -smp 16,dies=2,maxcpus=32
+         * prefer_sockets: cpus=16,sockets=16,dies=2,cores=1,threads=1,maxcpus=32
+         * prefer_cores: cpus=16,sockets=1,dies=2,cores=16,threads=1,maxcpus=32 */
+        .config = SMP_CONFIG_WITH_DIES(T, 16, F, 0, T, 2, F, 0, F, 0, T, 32),
+        .expect_prefer_sockets = CPU_TOPOLOGY_WITH_DIES(16, 16, 2, 1, 1, 32),
+        .expect_prefer_cores   = CPU_TOPOLOGY_WITH_DIES(16, 1, 2, 16, 1, 32),
+    }, {
+        /* config: -smp sockets=2,dies=2,cores=4
+         * expect: cpus=16,sockets=2,dies=2,cores=4,threads=1,maxcpus=16 */
+        .config = SMP_CONFIG_WITH_DIES(F, 0, T, 2, T, 2, T, 4, F, 0, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_WITH_DIES(16, 2, 2, 4, 1, 16),
+        .expect_prefer_cores   = CPU_TOPOLOGY_WITH_DIES(16, 2, 2, 4, 1, 16),
+    }, {
+        /* config: -smp sockets=2,dies=2,threads=2
+         * expect: cpus=8,sockets=2,dies=2,cores=1,threads=2,maxcpus=8 */
+        .config = SMP_CONFIG_WITH_DIES(F, 0, T, 2, T, 2, F, 0, T, 2, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_WITH_DIES(8, 2, 2, 1, 2, 8),
+        .expect_prefer_cores   = CPU_TOPOLOGY_WITH_DIES(8, 2, 2, 1, 2, 8),
+    }, {
+        /* config: -smp sockets=2,dies=2,maxcpus=32
+         * expect: cpus=32,sockets=2,dies=2,cores=8,threads=1,maxcpus=32 */
+        .config = SMP_CONFIG_WITH_DIES(F, 0, T, 2, T, 2, F, 0, F, 0, T, 32),
+        .expect_prefer_sockets = CPU_TOPOLOGY_WITH_DIES(32, 2, 2, 8, 1, 32),
+        .expect_prefer_cores   = CPU_TOPOLOGY_WITH_DIES(32, 2, 2, 8, 1, 32),
+    }, {
+        /* config: -smp dies=2,cores=4,threads=2
+         * expect: cpus=16,sockets=1,dies=2,cores=4,threads=2,maxcpus=16 */
+        .config = SMP_CONFIG_WITH_DIES(F, 0, F, 0, T, 2, T, 4, T, 2, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_WITH_DIES(16, 1, 2, 4, 2, 16),
+        .expect_prefer_cores   = CPU_TOPOLOGY_WITH_DIES(16, 1, 2, 4, 2, 16),
+    }, {
+        /* config: -smp dies=2,cores=4,maxcpus=32
+         * expect: cpus=32,sockets=4,dies=2,cores=4,threads=1,maxcpus=32 */
+        .config = SMP_CONFIG_WITH_DIES(F, 0, F, 0, T, 2, T, 4, F, 0, T, 32),
+        .expect_prefer_sockets = CPU_TOPOLOGY_WITH_DIES(32, 4, 2, 4, 1, 32),
+        .expect_prefer_cores   = CPU_TOPOLOGY_WITH_DIES(32, 4, 2, 4, 1, 32),
+    }, {
+        /* config: -smp dies=2,threads=2,maxcpus=32
+         * prefer_sockets: cpus=32,sockets=8,dies=2,cores=1,threads=2,maxcpus=32
+         * prefer_cores: cpus=32,sockets=1,dies=2,cores=8,threads=2,maxcpus=32 */
+        .config = SMP_CONFIG_WITH_DIES(F, 0, F, 0, T, 2, F, 0, T, 2, T, 32),
+        .expect_prefer_sockets = CPU_TOPOLOGY_WITH_DIES(32, 8, 2, 1, 2, 32),
+        .expect_prefer_cores   = CPU_TOPOLOGY_WITH_DIES(32, 1, 2, 8, 2, 32),
+    }, {
+        /* config: -smp 16,sockets=2,dies=2,cores=4
+         * expect: cpus=16,sockets=2,dies=2,cores=4,threads=1,maxcpus=16 */
+        .config = SMP_CONFIG_WITH_DIES(T, 16, T, 2, T, 2, T, 4, F, 0, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_WITH_DIES(16, 2, 2, 4, 1, 16),
+        .expect_prefer_cores   = CPU_TOPOLOGY_WITH_DIES(16, 2, 2, 4, 1, 16),
+    }, {
+        /* config: -smp 16,sockets=2,dies=2,threads=2
+         * expect: cpus=16,sockets=2,dies=2,cores=2,threads=2,maxcpus=16 */
+        .config = SMP_CONFIG_WITH_DIES(T, 16, T, 2, T, 2, F, 0, T, 2, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_WITH_DIES(16, 2, 2, 2, 2, 16),
+        .expect_prefer_cores   = CPU_TOPOLOGY_WITH_DIES(16, 2, 2, 2, 2, 16),
+    }, {
+        /* config: -smp 16,sockets=2,dies=2,maxcpus=32
+         * expect: cpus=16,sockets=2,dies=2,cores=8,threads=1,maxcpus=32 */
+        .config = SMP_CONFIG_WITH_DIES(T, 16, T, 2, T, 2, F, 0, F, 0, T, 32),
+        .expect_prefer_sockets = CPU_TOPOLOGY_WITH_DIES(16, 2, 2, 8, 1, 32),
+        .expect_prefer_cores   = CPU_TOPOLOGY_WITH_DIES(16, 2, 2, 8, 1, 32),
+    }, {
+        /* config: -smp 16,dies=2,cores=4,threads=2
+         * expect: cpus=16,sockets=1,dies=2,cores=4,threads=2,maxcpus=16 */
+        .config = SMP_CONFIG_WITH_DIES(T, 16, F, 0, T, 2, T, 4, T, 2, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_WITH_DIES(16, 1, 2, 4, 2, 16),
+        .expect_prefer_cores   = CPU_TOPOLOGY_WITH_DIES(16, 1, 2, 4, 2, 16),
+    }, {
+        /* config: -smp 16,dies=2,cores=4,maxcpus=32
+         * expect: cpus=16,sockets=4,dies=2,cores=4,threads=1,maxcpus=32 */
+        .config = SMP_CONFIG_WITH_DIES(T, 16, F, 0, T, 2, T, 4, F, 0, T, 32),
+        .expect_prefer_sockets = CPU_TOPOLOGY_WITH_DIES(16, 4, 2, 4, 1, 32),
+        .expect_prefer_cores   = CPU_TOPOLOGY_WITH_DIES(16, 4, 2, 4, 1, 32),
+    }, {
+        /* config: -smp 16,dies=2,threads=2,maxcpus=32
+         * prefer_sockets: cpus=16,sockets=8,dies=2,cores=1,threads=2,maxcpus=32
+         * prefer_cores: cpus=16,sockets=1,dies=2,cores=8,threads=2,maxcpus=32 */
+        .config = SMP_CONFIG_WITH_DIES(T, 16, F, 0, T, 2, F, 0, T, 2, T, 32),
+        .expect_prefer_sockets = CPU_TOPOLOGY_WITH_DIES(16, 8, 2, 1, 2, 32),
+        .expect_prefer_cores   = CPU_TOPOLOGY_WITH_DIES(16, 1, 2, 8, 2, 32),
+    }, {
+        /* config: -smp sockets=2,dies=2,cores=4,threads=2
+         * expect: cpus=32,sockets=2,dies=2,cores=4,threads=2,maxcpus=32 */
+        .config = SMP_CONFIG_WITH_DIES(F, 0, T, 2, T, 2, T, 4, T, 2, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_WITH_DIES(32, 2, 2, 4, 2, 32),
+        .expect_prefer_cores   = CPU_TOPOLOGY_WITH_DIES(32, 2, 2, 4, 2, 32),
+    }, {
+        /* config: -smp sockets=2,dies=2,cores=4,maxcpus=32
+         * expect: cpus=32,sockets=2,dies=2,cores=4,threads=2,maxcpus=32 */
+        .config = SMP_CONFIG_WITH_DIES(F, 0, T, 2, T, 2, T, 4, F, 0, T, 32),
+        .expect_prefer_sockets = CPU_TOPOLOGY_WITH_DIES(32, 2, 2, 4, 2, 32),
+        .expect_prefer_cores   = CPU_TOPOLOGY_WITH_DIES(32, 2, 2, 4, 2, 32),
+    }, {
+        /* config: -smp sockets=2,dies=2,threads=2,maxcpus=32
+         * expect: cpus=32,sockets=2,dies=2,cores=4,threads=2,maxcpus=32 */
+        .config = SMP_CONFIG_WITH_DIES(F, 0, T, 2, T, 2, F, 0, T, 2, T, 32),
+        .expect_prefer_sockets = CPU_TOPOLOGY_WITH_DIES(32, 2, 2, 4, 2, 32),
+        .expect_prefer_cores   = CPU_TOPOLOGY_WITH_DIES(32, 2, 2, 4, 2, 32),
+    }, {
+        /* config: -smp dies=2,cores=4,threads=2,maxcpus=32
+         * expect: cpus=32,sockets=2,dies=2,cores=4,threads=2,maxcpus=32 */
+        .config = SMP_CONFIG_WITH_DIES(F, 0, F, 0, T, 2, T, 4, T, 2, T, 32),
+        .expect_prefer_sockets = CPU_TOPOLOGY_WITH_DIES(32, 2, 2, 4, 2, 32),
+        .expect_prefer_cores   = CPU_TOPOLOGY_WITH_DIES(32, 2, 2, 4, 2, 32),
+    }, {
+        /* config: -smp 16,sockets=2,dies=2,cores=4,threads=1
+         * expect: cpus=16,sockets=2,dies=2,cores=4,threads=1,maxcpus=16 */
+        .config = SMP_CONFIG_WITH_DIES(T, 16, T, 2, T, 2, T, 4, T, 1, F, 0),
+        .expect_prefer_sockets = CPU_TOPOLOGY_WITH_DIES(16, 2, 2, 4, 1, 16),
+        .expect_prefer_cores   = CPU_TOPOLOGY_WITH_DIES(16, 2, 2, 4, 1, 16),
+    }, {
+        /* config: -smp 16,sockets=2,dies=2,cores=4,maxcpus=32
+         * expect: cpus=16,sockets=2,dies=2,cores=4,threads=2,maxcpus=32 */
+        .config = SMP_CONFIG_WITH_DIES(T, 16, T, 2, T, 2, T, 4, F, 0, T, 32),
+        .expect_prefer_sockets = CPU_TOPOLOGY_WITH_DIES(16, 2, 2, 4, 2, 32),
+        .expect_prefer_cores   = CPU_TOPOLOGY_WITH_DIES(16, 2, 2, 4, 2, 32),
+    }, {
+        /* config: -smp 16,sockets=2,dies=2,threads=2,maxcpus=32
+         * expect: cpus=16,sockets=2,dies=2,cores=4,threads=2,maxcpus=32 */
+        .config = SMP_CONFIG_WITH_DIES(T, 16, T, 2, T, 2, F, 0, T, 2, T, 32),
+        .expect_prefer_sockets = CPU_TOPOLOGY_WITH_DIES(16, 2, 2, 4, 2, 32),
+        .expect_prefer_cores   = CPU_TOPOLOGY_WITH_DIES(16, 2, 2, 4, 2, 32),
+    }, {
+        /* config: -smp 16,dies=2,cores=4,threads=2,maxcpus=32
+         * expect: cpus=16,sockets=2,dies=2,cores=4,threads=2,maxcpus=32 */
+        .config = SMP_CONFIG_WITH_DIES(T, 16, F, 0, T, 2, T, 4, T, 2, T, 32),
+        .expect_prefer_sockets = CPU_TOPOLOGY_WITH_DIES(16, 2, 2, 4, 2, 32),
+        .expect_prefer_cores   = CPU_TOPOLOGY_WITH_DIES(16, 2, 2, 4, 2, 32),
+    }, {
+        /* config: -smp sockets=2,dies=2,cores=4,threads=2,maxcpus=32
+         * expect: cpus=32,sockets=2,dies=2,cores=4,threads=2,maxcpus=32 */
+        .config = SMP_CONFIG_WITH_DIES(F, 0, T, 2, T, 2, T, 4, T, 2, T, 32),
+        .expect_prefer_sockets = CPU_TOPOLOGY_WITH_DIES(32, 2, 2, 4, 2, 32),
+        .expect_prefer_cores   = CPU_TOPOLOGY_WITH_DIES(32, 2, 2, 4, 2, 32),
+    }, {
+        /* config: -smp 16,sockets=2,dies=2,cores=4,threads=2,maxcpus=32
+         * expect: cpus=16,sockets=2,dies=2,cores=4,threads=2,maxcpus=32 */
+        .config = SMP_CONFIG_WITH_DIES(T, 16, T, 2, T, 2, T, 4, T, 2, T, 32),
+        .expect_prefer_sockets = CPU_TOPOLOGY_WITH_DIES(16, 2, 2, 4, 2, 32),
+        .expect_prefer_cores   = CPU_TOPOLOGY_WITH_DIES(16, 2, 2, 4, 2, 32),
+    },
+};
+
+/*
+ * generic invalid configurations
+ * specified smp CPUs can't be less than supported min CPUs.
+ * specified max CPUs can't be more than supported max CPUs.
+ */
+
+static SMPTestData data_generic_invalid[] = {
+    {
+        /* config: -smp MIN_CPUS
+         * reset the machine supported min CPUs to "MIN_CPUS + 1" */
+        .config = SMP_CONFIG_GENERIC(T, MIN_CPUS, F, 0, F, 0, F, 0, F, 0),
+        .expect_error = "Invalid SMP CPUs 1. The min CPUs supported "
+                        "by machine '(null)' is 2",
+    }, {
+        /* config: -smp MAX_CPUS
+         * reset the machine supported max CPUs to "MAX_CPUS - 1" */
+        .config = SMP_CONFIG_GENERIC(T, MAX_CPUS, F, 0, F, 0, F, 0, F, 0),
+        .expect_error = "Invalid SMP CPUs 512. The max CPUs supported "
+                        "by machine '(null)' is 511",
+    },
+};
+
+static char *get_config_info(SMPConfiguration *config)
+{
+    return g_strdup_printf(
+        "(SMPConfiguration) {\n"
+        "    .has_cpus    = %5s, cpus    = %ld,\n"
+        "    .has_sockets = %5s, sockets = %ld,\n"
+        "    .has_dies    = %5s, dies    = %ld,\n"
+        "    .has_cores   = %5s, cores   = %ld,\n"
+        "    .has_threads = %5s, threads = %ld,\n"
+        "    .has_maxcpus = %5s, maxcpus = %ld,\n"
+        "}",
+        config->has_cpus ? "true" : "false", config->cpus,
+        config->has_sockets ? "true" : "false", config->sockets,
+        config->has_dies ? "true" : "false", config->dies,
+        config->has_cores ? "true" : "false", config->cores,
+        config->has_threads ? "true" : "false", config->threads,
+        config->has_maxcpus ? "true" : "false", config->maxcpus);
+}
+
+static char *get_topo_info(CpuTopology *topo)
+{
+    return g_strdup_printf(
+        "(CpuTopology) {\n"
+        "    .cpus     = %u,\n"
+        "    .sockets  = %u,\n"
+        "    .dies     = %u,\n"
+        "    .cores    = %u,\n"
+        "    .threads  = %u,\n"
+        "    .max_cpus = %u,\n"
+        "}",
+        topo->cpus, topo->sockets, topo->dies,
+        topo->cores, topo->threads, topo->max_cpus);
+}
+
+static void check_smp_parse(MachineState *ms, SMPConfiguration *config,
+                            CpuTopology *expect_topo, const char *expect_err,
+                            bool valid)
+{
+    g_autofree char *config_info = NULL;
+    g_autofree char *expect_topo_info = NULL;
+    g_autofree char *result_topo_info = NULL;
+    const char *result_err;
+    Error *err = NULL;
+
+    /* call the generic parser smp_parse() in hw/core/machine-smp.c */
+    smp_parse(ms, config, &err);
+
+    if (valid) {
+        if ((err == NULL) &&
+            (ms->smp.cpus == expect_topo->cpus) &&
+            (ms->smp.sockets == expect_topo->sockets) &&
+            (ms->smp.dies == expect_topo->dies) &&
+            (ms->smp.cores == expect_topo->cores) &&
+            (ms->smp.threads == expect_topo->threads) &&
+            (ms->smp.max_cpus == expect_topo->max_cpus)) {
+            return;
+        }
+
+        config_info = get_config_info(config);
+        expect_topo_info = get_topo_info(expect_topo);
+
+        if (err != NULL) {
+            g_printerr("Check smp_parse failed:\n"
+                       "config: %s\n"
+                       "expect_topo: %s\n"
+                       "should_be_valid: yes\n\n"
+                       "result_is_valid: no\n"
+                       "result_error: %s\n",
+                       config_info, expect_topo_info,
+                       error_get_pretty(err));
+            error_free(err);
+        } else {
+            result_topo_info = get_topo_info(&ms->smp);
+            g_printerr("Check smp_parse failed:\n"
+                       "config: %s\n"
+                       "expect_topo: %s\n"
+                       "should_be_valid: yes\n\n"
+                       "result_is_valid: yes\n"
+                       "result_topo: %s\n",
+                       config_info, expect_topo_info,
+                       result_topo_info);
+        }
+    } else {
+        if (err != NULL) {
+            result_err = error_get_pretty(err);
+
+            if (expect_err == NULL || (expect_err != NULL &&
+                g_str_equal(expect_err, result_err))) {
+                error_free(err);
+                return;
+            }
+
+            config_info = get_config_info(config);
+            g_printerr("Check smp_parse failed:\n"
+                       "config: %s\n"
+                       "expect_error: %s\n"
+                       "should_be_valid: no\n\n"
+                       "result_is_valid: no\n"
+                       "result_error: %s\n",
+                       config_info, expect_err, result_err);
+            error_free(err);
+        } else {
+            config_info = get_config_info(config);
+            result_topo_info = get_topo_info(&ms->smp);
+
+            g_printerr("Check smp_parse failed:\n"
+                       "config: %s\n"
+                       "should_be_valid: no\n\n"
+                       "result_is_valid: yes\n"
+                       "result_topo: %s\n",
+                       config_info, result_topo_info);
+        }
+    }
+
+    abort();
+}
+
+static void smp_test_data_init(SMPTestData *targ, SMPTestData *src)
+{
+    targ->config = src->config;
+    targ->expect_prefer_sockets = src->expect_prefer_sockets;
+    targ->expect_prefer_cores = src->expect_prefer_cores;
+    targ->expect_error = src->expect_error;
+}
+
+static void smp_machine_class_reinit(MachineClass *mc)
+{
+    mc->min_cpus = MIN_CPUS;
+    mc->max_cpus = MAX_CPUS;
+
+    mc->smp_props.prefer_sockets = true;
+    mc->smp_props.dies_supported = false;
+}
+
+static void smp_generic_test(void)
+{
+    Object *obj = object_new(TYPE_MACHINE);
+    MachineState *ms = MACHINE(obj);
+    MachineClass *mc = MACHINE_GET_CLASS(obj);
+    SMPTestData data;
+    int i;
+
+    /* make sure that we have created the object */
+    g_assert_nonnull(ms);
+    g_assert_nonnull(mc);
+
+    /* reinitialize related machine properties before each subtest */
+    smp_machine_class_reinit(mc);
+
+    for (i = 0; i < ARRAY_SIZE(data_generic); i++) {
+        smp_test_data_init(&data, &data_generic[i]);
+
+        /* parsed values of unsupported parameters should be 1 */
+        data.expect_prefer_sockets.dies = 1;
+        data.expect_prefer_cores.dies = 1;
+
+        mc->smp_props.prefer_sockets = true;
+        check_smp_parse(ms, &data.config,
+                        &data.expect_prefer_sockets, NULL, true);
+
+        mc->smp_props.prefer_sockets = false;
+        check_smp_parse(ms, &data.config,
+                        &data.expect_prefer_cores, NULL, true);
+
+        /*
+         * it's now allowed that unsupported dies can be set equal to 1
+         * in the SMP configuration.
+         */
+        data.config.has_dies = true;
+        data.config.dies = 1;
+
+        mc->smp_props.prefer_sockets = true;
+        check_smp_parse(ms, &data.config,
+                        &data.expect_prefer_sockets, NULL, true);
+
+        mc->smp_props.prefer_sockets = false;
+        check_smp_parse(ms, &data.config,
+                        &data.expect_prefer_cores, NULL, true);
+    }
+
+    object_unref(obj);
+}
+
+static void smp_with_dies_test(void)
+{
+    Object *obj = object_new(TYPE_MACHINE);
+    MachineState *ms = MACHINE(obj);
+    MachineClass *mc = MACHINE_GET_CLASS(obj);
+    SMPTestData data;
+    int i;
+
+    /* make sure that we have created the object */
+    g_assert_nonnull(ms);
+    g_assert_nonnull(mc);
+
+    /* reinitialize related machine properties before each subtest */
+    smp_machine_class_reinit(mc);
+
+    mc->smp_props.dies_supported = true;
+
+    for (i = 0; i < ARRAY_SIZE(data_generic); i++) {
+        smp_test_data_init(&data, &data_generic[i]);
+
+        /* omitted arch-specific dies should directly default to 1 */
+        data.expect_prefer_sockets.dies = 1;
+        data.expect_prefer_cores.dies = 1;
+
+        mc->smp_props.prefer_sockets = true;
+        check_smp_parse(ms, &data.config,
+                        &data.expect_prefer_sockets, NULL, true);
+
+        mc->smp_props.prefer_sockets = false;
+        check_smp_parse(ms, &data.config,
+                        &data.expect_prefer_cores, NULL, true);
+    }
+
+    /* when dies is provided in the configuration */
+    for (i = 0; i < ARRAY_SIZE(data_with_dies); i++) {
+        smp_test_data_init(&data, &data_with_dies[i]);
+
+        mc->smp_props.prefer_sockets = true;
+        check_smp_parse(ms, &data.config,
+                        &data.expect_prefer_sockets, NULL, true);
+
+        mc->smp_props.prefer_sockets = false;
+        check_smp_parse(ms, &data.config,
+                        &data.expect_prefer_cores, NULL, true);
+    }
+
+    object_unref(obj);
+}
+
+static void acceptance_generic_test(void)
+{
+    Object *obj = object_new(TYPE_MACHINE);
+    MachineState *ms = MACHINE(obj);
+    MachineClass *mc = MACHINE_GET_CLASS(obj);
+    SMPTestData *datap;
+    int i;
+
+    /* make sure that we have created the object */
+    g_assert_nonnull(ms);
+    g_assert_nonnull(mc);
+
+    /* reinitialize related machine properties before each subtest */
+    smp_machine_class_reinit(mc);
+
+    /* reset the machine supported min CPUs and max CPUs */
+    mc->min_cpus = MIN_CPUS + 1;
+    mc->max_cpus = MAX_CPUS - 1;
+
+    for (i = 0; i < ARRAY_SIZE(data_generic_invalid); i++) {
+        datap = &data_generic_invalid[i];
+        check_smp_parse(ms, &datap->config, NULL, datap->expect_error, false);
+    }
+
+    /* config: -smp 8,sockets=2,cores=4,threads=2,maxcpus=8 */
+    datap = &(SMPTestData){
+        .config = SMP_CONFIG_GENERIC(T, 8, T, 2, T, 4, T, 2, T, 8),
+        .expect_error = "Invalid CPU topology: "
+                        "product of the hierarchy must match maxcpus: "
+                        "sockets (2) * cores (4) * threads (2) "
+                        "!= maxcpus (8)",
+    };
+    check_smp_parse(ms, &datap->config, NULL, datap->expect_error, false);
+
+    /* config: -smp 18,sockets=2,cores=4,threads=2,maxcpus=16 */
+    datap = &(SMPTestData){
+        .config = SMP_CONFIG_GENERIC(T, 18, T, 2, T, 4, T, 2, T, 16),
+        .expect_error = "Invalid CPU topology: "
+                        "maxcpus must be equal to or greater than smp: "
+                        "sockets (2) * cores (4) * threads (2) "
+                        "== maxcpus (16) < smp_cpus (18)",
+    };
+    check_smp_parse(ms, &datap->config, NULL, datap->expect_error, false);
+
+    /* config: -smp 8,dies=2 */
+    datap = &(SMPTestData){
+        .config = SMP_CONFIG_WITH_DIES(T, 8, F, 0, T, 2, F, 0, F, 0, F, 0),
+        .expect_error = "dies not supported by this machine's CPU topology",
+    };
+    check_smp_parse(ms, &datap->config, NULL, datap->expect_error, false);
+
+    object_unref(obj);
+}
+
+static void acceptance_with_dies_test(void)
+{
+    Object *obj = object_new(TYPE_MACHINE);
+    MachineState *ms = MACHINE(obj);
+    MachineClass *mc = MACHINE_GET_CLASS(obj);
+    SMPTestData *datap;
+
+    /* make sure that we have created the object */
+    g_assert_nonnull(ms);
+    g_assert_nonnull(mc);
+
+    /* reinitialize related machine properties before each subtest */
+    smp_machine_class_reinit(mc);
+
+    mc->smp_props.dies_supported = true;
+
+    /* config: -smp 16,sockets=2,dies=2,cores=4,threads=2,maxcpus=16 */
+    datap = &(SMPTestData){
+        .config = SMP_CONFIG_WITH_DIES(T, 16, T, 2, T, 2, T, 4, T, 2, T, 16),
+        .expect_error = "Invalid CPU topology: "
+                        "product of the hierarchy must match maxcpus: "
+                        "sockets (2) * dies (2) * cores (4) * threads (2) "
+                        "!= maxcpus (16)",
+    };
+    check_smp_parse(ms, &datap->config, NULL, datap->expect_error, false);
+
+    /* config: -smp 34,sockets=2,dies=2,cores=4,threads=2,maxcpus=32 */
+    datap = &(SMPTestData){
+        .config = SMP_CONFIG_WITH_DIES(T, 34, T, 2, T, 2, T, 4, T, 2, T, 32),
+        .expect_error = "Invalid CPU topology: "
+                        "maxcpus must be equal to or greater than smp: "
+                        "sockets (2) * dies (2) * cores (4) * threads (2) "
+                        "== maxcpus (32) < smp_cpus (34)",
+    };
+    check_smp_parse(ms, &datap->config, NULL, datap->expect_error, false);
+
+    object_unref(obj);
+}
+
+int main(int argc, char *argv[])
+{
+    g_test_init(&argc, &argv, NULL);
+
+    module_call_init(MODULE_INIT_QOM);
+    type_register_static(&smp_machine_info);
+
+    g_test_add_func("/test-smp-parse/smp-generic", smp_generic_test);
+    g_test_add_func("/test-smp-parse/smp-with-dies", smp_with_dies_test);
+    g_test_add_func("/test-smp-parse/acceptance-generic",
+                    acceptance_generic_test);
+    g_test_add_func("/test-smp-parse/acceptance-with-dies",
+                    acceptance_with_dies_test);
+
+    g_test_run();
+
+    return 0;
+}
-- 
2.19.1


