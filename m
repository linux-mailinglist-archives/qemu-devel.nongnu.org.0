Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B605F336BB4
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 06:38:50 +0100 (CET)
Received: from localhost ([::1]:50490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKE25-0007nL-Pg
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 00:38:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lKDzx-0006WT-Ur
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 00:36:37 -0500
Received: from mail-co1nam11on2133.outbound.protection.outlook.com
 ([40.107.220.133]:22657 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lKDzw-0003ph-A5
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 00:36:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lpPAZ7pRztjJsLG/mIH/p/6HoOvJjTJJxlx4oicXNXy0RSSTEhINBJjskeHOUQcSq1yhWW6sHAdQlnbqihZJ2ChEPEDQRYaQinskXvZSGdpGdXDhdOmWRLmoaBB+R7OQDoTk7uA6Ctgtp1jCAGIP0W9tRIEK46AE03d005/kZZ9yo7A03/hrcEy4ljAhrf9CyREEceH3QJXY0eaBL3Mqwgp06GxegBQH2qwprhGhSrQQ9qyHEfVE5/l1gJRb6lCUpqUywroXKnDiFBkJRZSP0op0/RjKbqHSvIHMDxvF2/RvgojRVZa1M0hnfFMIeXBzShbWIf8bR9Q4gsiKwVqjMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BEXLGzeQvFkvV4u60sWY/ak6Fd7+kIvpMEnBdGT2fkg=;
 b=YdiXx1Flx5Na9Rz388xXTieunjWG2NdkJjxfGZhMXzTzvrvWjnkJoj2OucfrVfLB2dzpL8cf4xdL1znyqbv4Juo+7BOXkbsmN+YLFQTdMEPtW49nLc3KpYHIIoyi5mv2OiF9Z4eTOtyvEY9JVPHGPHiM18SrLuUdkA3AaFlRM+G4Pmd+P02hECzcoYNEtgyfUg6a/uGKlUc0qsMSpNqx10eRyvSjS6QUPpFUe0FDA/b79Fl0XsrqPvL1UNjp75vsZ07KUpkbSw3mNG2I3ktChrZwTT5uw4CDl1USNd3QpnxmQtDrVJNlqpEleGd9yso9/Uh9CnQdWtFkJ47CKJd/Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BEXLGzeQvFkvV4u60sWY/ak6Fd7+kIvpMEnBdGT2fkg=;
 b=gUTuoWPN8Q3m99nMJHT60jFWNMbvwIY4kEdZKcww9PH+TjxaojQJaECuDqnzkg3b1UDsjhNbv7UtcKonG2J7QTn14BF2zNwCSx0RZCYz7yfJ0nKZrkctpiTNDETGL4n052sJwLEgog+0nMXt9MtHLMy2A09fZJ0nyPV+mwfBWJ4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB3869.namprd03.prod.outlook.com (2603:10b6:805:68::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.19; Thu, 11 Mar
 2021 05:36:30 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6%6]) with mapi id 15.20.3912.030; Thu, 11 Mar 2021
 05:36:30 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] memory: add tests for the sparse-mem device
Date: Thu, 11 Mar 2021 00:36:13 -0500
Message-Id: <20210311053614.940352-3-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210311053614.940352-1-alxndr@bu.edu>
References: <20210311053614.940352-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR14CA0021.namprd14.prod.outlook.com
 (2603:10b6:208:23e::26) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR14CA0021.namprd14.prod.outlook.com (2603:10b6:208:23e::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Thu, 11 Mar 2021 05:36:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb8687b0-8ce4-4741-0e99-08d8e44f9f11
X-MS-TrafficTypeDiagnostic: SN6PR03MB3869:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB386994936A52972B053AA5F3BA909@SN6PR03MB3869.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:179;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: thPGpPKMLVXV2jKQetQNSAjY8iPiRz7kHTAv+N207EHOmdLvRa0kEf95D3DFxkMBvWIs5HqEu9+H+UHjgPuJ+JcFBrPRczduON9rnPQAbijeutr8HEv9GemqNaRUw75G+detlVhrN+dpYu1KP2l57v8SF37sEVume84Spgh2Q5v3OQKs6JWmIGVqLs1K0SDN/QjL4WOpRAK7zWEYRG1kEMZT4mgMUyKGP0SluzCrIcnz6uaeOB09+D4TBsOMaSf+7/g/V3mX+8g1DdnNlLia1Zwpa3J9H8guNpkQqO1xTsWb18kIWdGRhlRRvmTWPR/A3rLUdF6Mhe+o3bECzSNRJJpuwInAOwTSeKWmahfH/cjzKRqIzNYA8dFPEIYGh2d+0QvID9owOudu8Olyv5+85+TGUG+4sx8wU6u/JPP6gYlN4jj3jO/6mfqyqdrM4V3vbrwlPGZ5RWiIkoYBOE+jbOJAr+kxh08IL+R03D71YIXAmDjQwXhIlR5BVFoZbCBwFPdUVNbOrhVtZuMKLAkWXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(396003)(136003)(366004)(376002)(2906002)(786003)(6916009)(6512007)(54906003)(83380400001)(36756003)(26005)(86362001)(6486002)(186003)(16526019)(1076003)(66946007)(66556008)(4326008)(66476007)(52116002)(6666004)(5660300002)(8936002)(75432002)(6506007)(8676002)(478600001)(316002)(956004)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?6pwdHKc7BkmV17NfdNLGMPe1SdZGnsrlNiKfoc3aZixHKaCWFEul/o8wT59Z?=
 =?us-ascii?Q?on6D0LRinJCeBZ7pUG2ssfKPDnCtD8ESc2o/XEoLuk3dyn0O3qBrtvQkzWM2?=
 =?us-ascii?Q?NixOJQ6uL3kndE4+79lk4Lfq5UX9nXSZybFd5/0E2l72yXvmmDjoVQpv1yY9?=
 =?us-ascii?Q?Wcp1R9g+LFhSEbj+54VD5KIlg6xamOTIAFGZdainhfYR4Y/e8QrRcBKGUBAM?=
 =?us-ascii?Q?8zYdfCeHunA0QlZHo3mHH9L4LlYNTGMGWkeD87Zhju8FtKAbKdymZgyg5asY?=
 =?us-ascii?Q?pEpwaPdXnaIuH9vAvOmXq+sbSgqT6r0KgQW4hockte1GP4OHTRr/7wOBKzO9?=
 =?us-ascii?Q?0wJ31kMcj9W8dMjOa5Fy0EekR/gMtJGst1Pz/xv0WQm9Jr05tpkRwRPXFtmn?=
 =?us-ascii?Q?Ly/KFtXo5vwuFdohFOnT40NXokenGYv7BxGOZTbMbhDoswcjHhzcjRS1G87t?=
 =?us-ascii?Q?h3X7qJBvcp4nE9d7weFZKz+Hebmy3bO7MmjX9oDphhoXrTs4YsWChlq5BZrZ?=
 =?us-ascii?Q?F580z3nNvWexyndKTqDww3w8avk5AFsgtUOOnyx+uEbNW2vMTCm33ZFUWFC0?=
 =?us-ascii?Q?Qh+iCYwFr41VmJBtYIb+rfysGHKm9lQC2sXN+NqvyY6+F42suUGaRZyNf1sX?=
 =?us-ascii?Q?ERf0cL9BHx7slnSuP2vcOnI5ttBo8FcXgBMH7lh7Iq9QlOIQI42YvB6hWhjH?=
 =?us-ascii?Q?63J+u/U0vjcqug7Oo60BfmI2q2s3uZ2bAFMqBGMwh8IAruFmxU+8mE9JuLeQ?=
 =?us-ascii?Q?hCPMDxlSRrxBG01/zwOd6Ivsl0EWPPNhLRd+iAhLIt3lrM2glFyrUl3FVmov?=
 =?us-ascii?Q?rByEelsauNsrGbhacmw3TiHvQLM0cSxN1aSceHAyUkRnmdPTGB6kL4J0VQLj?=
 =?us-ascii?Q?7fFOgk8aAIhjn7rYfS/IAUNfFET6IvIGwHl255ElOSp8Byp7tkyHcG6YZDTL?=
 =?us-ascii?Q?EJZBFng6MnbPehr0tr6Zenz9isgLx4JetvsW/n9uNlmAqebi1wfm4boW+WuJ?=
 =?us-ascii?Q?O4Y+gZVZEeLVvjNF0u9eIqvwVOg+Y9fCDEY2e8S0NkGkoeIqwEJgrWhOcTkU?=
 =?us-ascii?Q?9jo77NdpmFekK/Cc2GWv5EokBXIA20iYDqxfqs76Xb9pS26md7w4X71YxAWq?=
 =?us-ascii?Q?+2dPZmnh58AIDb6ZafGTXEkCvKLy9TUooR9zu30Qphjn0rr+n2KojGnbcJB1?=
 =?us-ascii?Q?J4RLGvWsNq4voX9YlE4oHqawmqUkPf5xF1RNMe2nx30l0Q3228rlaH+w37Xo?=
 =?us-ascii?Q?YthIPt7RbsL33EJgrVO3U3zHVCrqnID6CPh4F+KajeIdII+csqZb9jrvjXe2?=
 =?us-ascii?Q?SHSdLM4IR1sel0ahE2Zx/Qne?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: eb8687b0-8ce4-4741-0e99-08d8e44f9f11
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 05:36:29.9791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lolFXSX+dcfiRwB59AYBc++Pyov4WWIXf4MDSH2+dSihSeSosSB3ApeW2EBU5p+v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3869
Received-SPF: pass client-ip=40.107.220.133; envelope-from=alxndr@bu.edu;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, f4bug@amsat.org, lidong.chen@oracle.com,
 darren.kenny@oracle.com, bsd@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 MAINTAINERS                   |  1 +
 tests/qtest/meson.build       |  3 +-
 tests/qtest/sparse-mem-test.c | 88 +++++++++++++++++++++++++++++++++++
 3 files changed, 91 insertions(+), 1 deletion(-)
 create mode 100644 tests/qtest/sparse-mem-test.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 9e3d8b1401..88b35c0d23 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2619,6 +2619,7 @@ S: Maintained
 F: tests/qtest/fuzz/
 F: scripts/oss-fuzz/
 F: hw/mem/sparse-mem.c
+F: tests/qtest/sparse-mem-test.c
 F: docs/devel/fuzzing.rst
 
 Register API
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 58efc46144..21e3b55050 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -78,7 +78,8 @@ qtests_i386 = \
    'vmgenid-test',
    'migration-test',
    'test-x86-cpuid-compat',
-   'numa-test']
+   'numa-test',
+   'sparse-mem-test']
 
 dbus_daemon = find_program('dbus-daemon', required: false)
 if dbus_daemon.found() and config_host.has_key('GDBUS_CODEGEN')
diff --git a/tests/qtest/sparse-mem-test.c b/tests/qtest/sparse-mem-test.c
new file mode 100644
index 0000000000..cb73976889
--- /dev/null
+++ b/tests/qtest/sparse-mem-test.c
@@ -0,0 +1,88 @@
+/*
+ * QTest testcases for the sparse memory device
+ *
+ * Copyright Red Hat Inc., 2021
+ *
+ * Authors:
+ *  Alexander Bulekov   <alxndr@bu.edu>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+
+#include "libqos/libqtest.h"
+
+static void test_sparse_memwrite(void)
+{
+    QTestState *s;
+    uint8_t *buf;
+    const int bufsize = 0x10000;
+
+    s = qtest_init("-device sparse-mem");
+
+    buf = malloc(bufsize);
+
+    for (int i = 0; i < bufsize; i++) {
+        buf[i] = (uint8_t)i;
+    }
+    qtest_memwrite(s, 0x100000000, buf, bufsize);
+    memset(buf, 0, bufsize);
+    qtest_memread(s, 0x100000000, buf, bufsize);
+
+    for (int i = 0; i < bufsize; i++) {
+        assert(buf[i] == (uint8_t)i);
+    }
+
+    free(buf);
+    qtest_quit(s);
+}
+
+static void test_sparse_int_writes(void)
+{
+    QTestState *s;
+    const int num_writes = 0x1000;
+
+    s = qtest_init("-device sparse-mem");
+
+    size_t addr = 0x10000000;
+    for (uint64_t i = 0; i < num_writes; i++) {
+        qtest_writeq(s, addr, i);
+        addr += sizeof(uint64_t);
+    }
+
+    addr = 0x10000000;
+    for (uint64_t i = 0; i < num_writes; i++) {
+        assert(qtest_readq(s, addr) == i);
+        addr += sizeof(uint64_t);
+    }
+
+    addr = 0x10000002;
+    for (uint64_t i = 0; i < num_writes; i++) {
+        qtest_writeq(s, addr, i);
+        addr += sizeof(uint64_t);
+    }
+
+    addr = 0x10000002;
+    for (uint64_t i = 0; i < num_writes; i++) {
+        assert(qtest_readq(s, addr) == i);
+        addr += sizeof(uint64_t);
+    }
+
+    qtest_quit(s);
+}
+
+int main(int argc, char **argv)
+{
+    const char *arch = qtest_get_arch();
+
+    g_test_init(&argc, &argv, NULL);
+
+    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
+        qtest_add_func("sparse-mem/memwrite", test_sparse_memwrite);
+        qtest_add_func("sparse-mem/ints", test_sparse_int_writes);
+    }
+
+    return g_test_run();
+}
-- 
2.28.0


