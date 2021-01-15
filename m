Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C61672F855A
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 20:26:21 +0100 (CET)
Received: from localhost ([::1]:47282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Ujk-0007WY-RY
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 14:26:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l0Ugm-0005tw-1q
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 14:23:16 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:44610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l0Ugh-0002pX-5D
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 14:23:15 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10FJE7up005643;
 Fri, 15 Jan 2021 19:23:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=MExvka13xMaO0SwGFNkha+7iM89S1A16w8rQFvjAxyc=;
 b=NZdFGB3qqOnRpCN+uQ3YnfsnDEchOietQp8MtJI9E+ypfC+ii/ydRcNGEzJijBJWMHU1
 tGaRuN/pkd5iRn2/RAHSMQOzguojCjreKXoe1xOiZ6Zm5Qveke0JZc2qWEFXb5WbIHHj
 oMmlosKMYMr3L1yMGqon5m60b4kH3pWElL/b/4Z8RS/mr8792jzYQGGDp55kIux122ky
 sfFsEWDpz54geITp5aom1atxQWZADg7eUQN9Tc36bkZTiHi3LcWN5Fsc02e2vaDFik1T
 bjdB1wJLf2T5tZMo8VouvM3AVVulR9L53UK8KS/pRVm99jUKDOdvJ+oc33vJG8meWZU8 DQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 360kd06dvv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jan 2021 19:23:09 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10FJL4NY051945;
 Fri, 15 Jan 2021 19:21:08 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 360keqayrp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jan 2021 19:21:08 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 10FJL7Lm000934;
 Fri, 15 Jan 2021 19:21:07 GMT
Received: from mihai.localdomain (/10.153.73.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 15 Jan 2021 11:21:07 -0800
From: Mihai Carabas <mihai.carabas@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] tests/qtest: add a test case for pvpanic-pci
Date: Fri, 15 Jan 2021 20:34:06 +0200
Message-Id: <1610735646-13313-5-git-send-email-mihai.carabas@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1610735646-13313-1-git-send-email-mihai.carabas@oracle.com>
References: <1610735646-13313-1-git-send-email-mihai.carabas@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9865
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 spamscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101150117
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9865
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101150116
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=mihai.carabas@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Mihai Carabas <mihai.carabas@oracle.com>, peter.maydell@linaro.org,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a test case for pvpanic-pci device. The scenario is the same as pvpapnic
ISA device, but is using the PCI bus.

Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
---
 tests/qtest/meson.build        |  1 +
 tests/qtest/pvpanic-pci-test.c | 62 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)
 create mode 100644 tests/qtest/pvpanic-pci-test.c

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index b050289..f689cad 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -20,6 +20,7 @@ endif
 
 qtests_pci = \
   (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : []) +                  \
+  (config_all_devices.has_key('CONFIG_PVPANIC_PCI') ? ['pvpanic-pci-test'] : []) +          \
   (config_all_devices.has_key('CONFIG_IVSHMEM_DEVICE') ? ['ivshmem-test'] : [])
 
 qtests_i386 = \
diff --git a/tests/qtest/pvpanic-pci-test.c b/tests/qtest/pvpanic-pci-test.c
new file mode 100644
index 0000000..79b8065
--- /dev/null
+++ b/tests/qtest/pvpanic-pci-test.c
@@ -0,0 +1,62 @@
+/*
+ * QTest testcase for PV Panic PCI device
+ *
+ * Copyright (C) 2020 Oracle
+ *
+ * Authors:
+ *     Mihai Carabas <mihai.carabas@oracle.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "libqos/libqtest.h"
+#include "qapi/qmp/qdict.h"
+#include "libqos/pci.h"
+#include "libqos/pci-pc.h"
+#include "hw/pci/pci_regs.h"
+
+static void test_panic(void)
+{
+    uint8_t val;
+    QDict *response, *data;
+    QTestState *qts;
+    QPCIBus *pcibus;
+    QPCIDevice *dev;
+    QPCIBar bar;
+
+    qts = qtest_init("-device pvpanic-pci");
+    pcibus = qpci_new_pc(qts, NULL);
+    dev = qpci_device_find(pcibus, QPCI_DEVFN(0x4, 0x0));
+    qpci_device_enable(dev);
+    bar = qpci_iomap(dev, 0, NULL);
+
+    qpci_memread(dev, bar, 0, &val, sizeof(val));
+    g_assert_cmpuint(val, ==, 3);
+
+    val = 1;
+    qpci_memwrite(dev, bar, 0, &val, sizeof(val));
+
+    response = qtest_qmp_eventwait_ref(qts, "GUEST_PANICKED");
+    g_assert(qdict_haskey(response, "data"));
+    data = qdict_get_qdict(response, "data");
+    g_assert(qdict_haskey(data, "action"));
+    g_assert_cmpstr(qdict_get_str(data, "action"), ==, "pause");
+    qobject_unref(response);
+
+    qtest_quit(qts);
+}
+
+int main(int argc, char **argv)
+{
+    int ret;
+
+    g_test_init(&argc, &argv, NULL);
+    qtest_add_func("/pvpanic-pci/panic", test_panic);
+
+    ret = g_test_run();
+
+    return ret;
+}
-- 
1.8.3.1


