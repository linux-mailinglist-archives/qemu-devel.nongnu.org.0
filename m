Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EA06590C2
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 20:10:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAyGr-0006dF-09; Thu, 29 Dec 2022 14:08:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pAyGo-0006bC-NU
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 14:08:50 -0500
Received: from mail-vi1eur03on2137.outbound.protection.outlook.com
 ([40.107.103.137] helo=EUR03-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pAyGl-000721-TH
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 14:08:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QzB5YHhw8LItPdIc2v+lrWiPK8DgbI2rREKUBEIxtS6wZD3xG8caEkAqzyBdCwfDTzNXEIAE/JGvkJ9P9OF4KdGRWjffwgThZekorfbgWeSVHEf1/7aHCg4DD0tZ5nMGLo/hYYRAJKUlFKUbewgI+E5OxBs06xvHsP78r7fZCBGMKAbWeEuj9CeWJxx4hUEXZ3Y5SQNxP9HsLs+7a/Azm8mtqEQeaBbu7uvsXQf7QZrr3XeLPxh3ub2Y0SF7FtVli+Fhd7zGzz67dKsJpeoQCljExDnGYaxnXc+cdwsGQ2Uj7c+apUffyrqFIU8Ly0kYZYksnaUyDYET9cXe23EhDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xoSr1BM08fx1AZCoL0MjjB87AxKO0piXW9Xs4UCennY=;
 b=lHpgEUSRZJ5qIJC/iKSDE3ydml8qOzJPM47fvZDCQahlTTVVW7bOEoOQMFOg+BP27gwyv00EdKFZC14iz7xI5T6YNCTTF2xwdI9vK1F5r+56qKETecxtzqMXC+i3pJK74vFn5D8lxpu1/L7t3T1R+h5ZEBDmUpQaUUa2edwmbQ1dqJiTaHPRhjBu7lnyTXll6eL1e2BW9w5y8DZQQxPToPoCPDMCXu1mmbUKYFj0tt/i5hTh/rnebGARff1NRYGaSZ4N8YECdvun+jfXENgUy22x16/5I5Ljw2sZjMrzOMHH2/hJE3OPuPHNmFK4vz1NbajciAyPVsOmHGRvo0gA0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xoSr1BM08fx1AZCoL0MjjB87AxKO0piXW9Xs4UCennY=;
 b=idzMLr9nrfgPd8sJRYz6HfBms0XgJmsZvipBRYaHqlXrydjiJOcvQM5WrHNMNqzHlnJb56YtCRh5dhk7TVJOnQNCVzejc2lqZq36Y0/KDoy0DfjwA5qHmxxZ/F4MSiTp+1uV/FW/IjyuJz/MQl4XubXccSPf6/CIRpIRNzV9yu8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by AS4P189MB2134.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:519::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.17; Thu, 29 Dec
 2022 19:08:41 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%4]) with mapi id 15.20.5966.017; Thu, 29 Dec 2022
 19:08:41 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: qemu-devel@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v2 6/6] tests/qtest/igb-test: introduce qtest for igb
Date: Thu, 29 Dec 2022 20:08:17 +0100
Message-Id: <20221229190817.25500-7-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221229190817.25500-1-sriram.yagnaraman@est.tech>
References: <20221229190817.25500-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0089.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::13) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|AS4P189MB2134:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c9ff5f8-e8a9-4665-9b26-08dae9d01983
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: anZFYOalZiRjbkgL5zsgWLfAnyslLc6bpgN1MO17SWxgDEN6OEFR8wgYcRJA/2zrQrCiuH4CYSQZ+GZkjOk74l5EW4QUS5Hn9cCaQVm8Uvrsdp03PQYzH+p+dMX7CLRmhQOt7qCQa5tnTp9oGXNysJ8Tr+XLchbh3h/uWkwKVIz3Lo8X0ML17j/DS4XBpEZlSaSYgyeEKGaWMb5evg7EZExHyQdZKuFaUn2KshThcjpfGF7wtTMxWQCJAnPSfyV1DWt3FGLT7hD1VKLPpdIG2xoFBQILgWVo/qYb9GbIRSv3tXITiL0F8JcWJXq158uRJD/9HFy2niWMjJ8BKiaDiNMB45VfL7QYjYIT6ork6/MsfLif7BnX+lvpfub/plu8Jwkvl8Yx9rjzbSJCQuyGPrbAO3UroCdruelPNmmHMCRO0s4p/eeMe8xtUwOq4CdUT5Xy0GYEfWV4vWb2cPXyqE0B/whpyyaT+VwRHyiyoFz1FPwQbX9TrQKNBcQ9aodcF31wfu0Pd0qcbZ7HKIPKrgl9FrqIwM6Eg3J/NHZ3qMHWzaks26EF2FDna4zTkmP9d3qp6pxeO3Y7mNwOmC6wFUEQnrSwk8nKcBT6E7tUpl6BQO84V/9B7wzIEqcaKvT03C2UGMzkp7gfMi9MkvSXCLgMipJScAy+mCsUu5dCav/YkQYYmTxeoW94x9BSJpX3rD0BshTed94sYaLs+SUDMBsfoG/e9h/Y1e23Hqn1QKqw+qHUHQopLtnqc9PlXVRD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(346002)(396003)(39830400003)(376002)(451199015)(6666004)(110136005)(44832011)(6506007)(478600001)(6486002)(966005)(6512007)(38100700002)(41300700001)(26005)(86362001)(36756003)(186003)(2906002)(1076003)(83380400001)(8936002)(30864003)(8676002)(5660300002)(4326008)(2616005)(66556008)(66476007)(66946007)(316002)(70586007)(2004002)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cIxjbNhTSOQf2u7d8xgREen1nmlYicBgIW3vME9uAs2xq1/6K+cVH3Ip+/yo?=
 =?us-ascii?Q?pYf6uV4823s8UfhFc969a0ZFe4t+1dsVMtNNK6mRG1FDHQmQVxxT/Jzlmyi8?=
 =?us-ascii?Q?gchQDkFImQ9Sl3akcHlZ/RgyhCGQrNye4xWJvw+i6CycJAJbD4fniAiUhgkS?=
 =?us-ascii?Q?oZdeiOEje5qlcf2EiDNMOsOJQIHfEzDSmZ1IWb1TM/EuCy+bVR/Ng28OgxHJ?=
 =?us-ascii?Q?AuqIEQXT97oBtNJOX33xniZ2CMjxAWk0UYI567S9UOcoIj/G8pUwtpVQx8bm?=
 =?us-ascii?Q?k3bE4hGAU2DazrGQqyaoxPz5fq8Br0eVTkcDwxz4+kvRHDfwncqSzjxht45n?=
 =?us-ascii?Q?dzhjwqFk7CjWghD70+CFpx04irT8/NZQfYH0HcJ/ohALT0OPj+/jknHqi35a?=
 =?us-ascii?Q?ObA2Y7p+T6cJ+u2qgz3J0S8nhbFjhKJjfSBN3pV8LUEiNTrpnRqqYVnDQNSo?=
 =?us-ascii?Q?TvKklBFLRcjR4cDnKo+/DWpyVm1rF1l/KFl0A3BYqeXEF6rf/ADyoKiBEhNS?=
 =?us-ascii?Q?wK5XwON8+Eq/QRb/wVN6yKw9D+8tsQ0dr+Tk0WRw8nvrmsCuTPgfFOFYo5Ga?=
 =?us-ascii?Q?3AfEVXxfTKm+IcLHiCEj7PO7PcDYk2xSzqC+RvTb5Jc2HF1ATvMiD7A5lDD9?=
 =?us-ascii?Q?MmZyXdNWqkdbv5SWm3J+HZYGEh5v1p6VMifON/8pJW7PRC3sPDbhRU6eoz1V?=
 =?us-ascii?Q?yh6F6Z1yhnAfDu253262MHWJCcYNpbnosH+IvWtHoqSB2NM7702CbnkeCAHa?=
 =?us-ascii?Q?HumLYJd3d4J+1ORWLOd6xYmuZQkaJBnpuWEaOiRs+L9QvGyo0gJdnvvfG8PU?=
 =?us-ascii?Q?o0AEUKwDsxqHDcl9pqMEE3yxz/CwCFWP+6XT7o2nK/jgGpLaiOSM2ZaWH2G8?=
 =?us-ascii?Q?Z/atCEA00OLjWEVKrkM4sZn6S+RozUWYK5lA/K3DuPi1+eNT0msao8rrdUcb?=
 =?us-ascii?Q?2bSbY9cji3cfErgE02wrwlFLhASeYH8YnMn3ULZXHpfGovNvmKux4LSsWE7Y?=
 =?us-ascii?Q?0yR/ikJ9MK2MMt3hzDfLdsCeWM+Anwacs/lOn1om/TU3sJtP5IVL3xuowbPD?=
 =?us-ascii?Q?SS3cRnF+por2e064+zX/9HSFpbO1oJ+sQnGFMX2JV/8KzYacbnkxuMRjT2Yu?=
 =?us-ascii?Q?OUgx2dNz1GXdlnMIGf+FmrafwZslM9eqWT7iIzeaISlPoiDPRTkB5oXHV6IC?=
 =?us-ascii?Q?BdsSuTC4nl5PFFOme5Je1UT4WVmMeAK9bI7RO6I1D/EwFcZ5JvTBxVR+grdz?=
 =?us-ascii?Q?iZ9LuJeKJqOYqPdTYXPgGw3DLJcMvRzzE3p72b90q9dZAPw58pOjixnDZFvl?=
 =?us-ascii?Q?/XKbNMdrMVb8pPqqneNqWwlfi5aLJScaSOvROZk7/qmWpzibdRhs8Zzxuk2d?=
 =?us-ascii?Q?FaCATfUTjQ7mqpK9YhWpAWDDaIS7vQaeziydbsNa99n85G1KE/e6V4A4qVO8?=
 =?us-ascii?Q?zgGTaprseRgSao/17LA9kfpdXWKkNeF8XVODouEyyA7Bey1m78CIX7kWqY/k?=
 =?us-ascii?Q?Hf+Tmag/+UDIZhhb0NSDkUV3bZFC6rkPtBmSZOdMie2cpuSTT2i1BnCpfP+I?=
 =?us-ascii?Q?KXxMor4WHfMQGPpOIVkrPU/d8wuVewyVEoiyd2ApnHyOH3JXepLfj0aZO8F0?=
 =?us-ascii?Q?3w=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c9ff5f8-e8a9-4665-9b26-08dae9d01983
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2022 19:08:41.8589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: isF92NpyXdEHUXS2JXgP3mm7Z8dSw8zK4osH530T9Fnzkgnk/u7DgKq0niJrmOBI3zbiXlE6XAUglGG/L1KZKMG1gUdlKDLvacPA9Zceo+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB2134
Received-SPF: pass client-ip=40.107.103.137;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR03-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Only queue 0 is tested for TX/RX, and only PF is tested.
SRIOV/VF tests will come soon.
---
 tests/qtest/igb-test.c         | 222 +++++++++++++++++++++++++++++
 tests/qtest/libqos/igb.c       | 245 +++++++++++++++++++++++++++++++++
 tests/qtest/libqos/igb.h       |  51 +++++++
 tests/qtest/libqos/meson.build |   1 +
 tests/qtest/meson.build        |   1 +
 5 files changed, 520 insertions(+)
 create mode 100644 tests/qtest/igb-test.c
 create mode 100644 tests/qtest/libqos/igb.c
 create mode 100644 tests/qtest/libqos/igb.h

diff --git a/tests/qtest/igb-test.c b/tests/qtest/igb-test.c
new file mode 100644
index 0000000000..2a6cea083e
--- /dev/null
+++ b/tests/qtest/igb-test.c
@@ -0,0 +1,222 @@
+ /*
+ * QTest testcase for igb NIC
+ *
+ * Software developer's manuals:
+ * https://www.intel.com/content/dam/www/public/us/en/documents/datasheets/82576eg-gbe-datasheet.pdf
+ *
+ * Authors:
+ * Sriram Yagnaraman <sriram.yagnaraman@est.tech>
+ *
+ * Based on work done by:
+ * Knut Omang.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest-single.h"
+#include "libqos/pci-pc.h"
+#include "qemu/sockets.h"
+#include "qemu/iov.h"
+#include "qemu/module.h"
+#include "qemu/bitops.h"
+#include "libqos/libqos-malloc.h"
+#include "libqos/igb.h"
+#include "hw/net/e1000_regs.h"
+
+static void igb_send_verify(QIGB *d, int *test_sockets, QGuestAllocator *alloc)
+{
+    static const char test[] = "TEST";
+    union e1000_adv_tx_desc descr;
+    char buffer[64];
+    int ret;
+    uint32_t recv_len;
+
+    /* Prepare test data buffer */
+    uint64_t data = guest_alloc(alloc, sizeof(buffer));
+    memwrite(data, test, sizeof(test));
+
+    /* Prepare TX descriptor */
+    memset(&descr, 0, sizeof(descr));
+    descr.read.buffer_addr = cpu_to_le64(data);
+    descr.read.cmd_type_len = cpu_to_le32(E1000_ADVTXD_DCMD_RS   |
+                                          E1000_ADVTXD_DCMD_EOP  |
+                                          E1000_ADVTXD_DCMD_DEXT |
+                                          E1000_ADVTXD_DTYP_DATA   |
+                                          sizeof(buffer));
+
+    /* Put descriptor to the ring */
+    igb_tx_ring_push(d, &descr, 0);
+
+    /* Wait for TX WB interrupt */
+    igb_wait_isr(d, IGB_TX0_MSIX_VEC);
+
+    /* Check DD bit */
+    g_assert_cmphex(le32_to_cpu(descr.wb.status) & E1000_ADVTXD_STA_DD, ==,
+                    E1000_ADVTXD_STA_DD);
+
+    /* Check data sent to the backend */
+    ret = recv(test_sockets[0], &recv_len, sizeof(recv_len), 0);
+    g_assert_cmpint(ret, == , sizeof(recv_len));
+    ret = recv(test_sockets[0], buffer, sizeof(buffer), 0);
+    g_assert_cmpint(ret, ==, sizeof(buffer));
+    g_assert_cmpstr(buffer, == , test);
+
+    /* Free test data buffer */
+    guest_free(alloc, data);
+}
+
+static void igb_receive_verify(QIGB *d, int *test_sockets, QGuestAllocator *alloc)
+{
+    union e1000_adv_rx_desc descr;
+
+    char test[] = "TEST";
+    int len = htonl(sizeof(test));
+    struct iovec iov[] = {
+        {
+            .iov_base = &len,
+            .iov_len = sizeof(len),
+        },{
+            .iov_base = test,
+            .iov_len = sizeof(test),
+        },
+    };
+
+    char buffer[64];
+    int ret;
+
+    /* Send a dummy packet to device's socket*/
+    ret = iov_send(test_sockets[0], iov, 2, 0, sizeof(len) + sizeof(test));
+    g_assert_cmpint(ret, == , sizeof(test) + sizeof(len));
+
+    /* Prepare test data buffer */
+    uint64_t data = guest_alloc(alloc, sizeof(buffer));
+
+    /* Prepare RX descriptor */
+    memset(&descr, 0, sizeof(descr));
+    descr.read.pkt_addr = cpu_to_le64(data);
+
+    /* Put descriptor to the ring */
+    igb_rx_ring_push(d, &descr, 0);
+
+    /* Wait for RX WB interrupt */
+    igb_wait_isr(d, IGB_RX0_MSIX_VEC);
+
+    /* Check DD bit */
+    g_assert_cmphex(le32_to_cpu(descr.wb.upper.status_error) &
+        E1000_RXD_STAT_DD, ==, E1000_RXD_STAT_DD);
+
+    /* Check data sent to the backend */
+    memread(data, buffer, sizeof(buffer));
+    g_assert_cmpstr(buffer, == , test);
+
+    /* Free test data buffer */
+    guest_free(alloc, data);
+}
+
+static void test_igb_init(void *obj, void *data, QGuestAllocator * alloc)
+{
+    /* init does nothing */
+}
+
+static void test_igb_tx(void *obj, void *data, QGuestAllocator * alloc)
+{
+    QIGB_PCI *igb = obj;
+    QIGB *d = &igb->igb;
+    QOSGraphObject *e_object = obj;
+    QPCIDevice *dev = e_object->get_driver(e_object, "pci-device");
+
+    /* FIXME: add spapr support */
+    if (qpci_check_buggy_msi(dev)) {
+        return;
+    }
+
+    igb_send_verify(d, data, alloc);
+}
+
+static void test_igb_rx(void *obj, void *data, QGuestAllocator * alloc)
+{
+    QIGB_PCI *igb = obj;
+    QIGB *d = &igb->igb;
+    QOSGraphObject *e_object = obj;
+    QPCIDevice *dev = e_object->get_driver(e_object, "pci-device");
+
+    /* FIXME: add spapr support */
+    if (qpci_check_buggy_msi(dev)) {
+        return;
+    }
+
+    igb_receive_verify(d, data, alloc);
+}
+
+static void test_igb_multiple_transfers(void *obj, void *data,
+                                           QGuestAllocator *alloc)
+{
+    static const long iterations = 4 * 1024;
+    long i;
+
+    QIGB_PCI *igb = obj;
+    QIGB *d = &igb->igb;
+    QOSGraphObject *e_object = obj;
+    QPCIDevice *dev = e_object->get_driver(e_object, "pci-device");
+
+    /* FIXME: add spapr support */
+    if (qpci_check_buggy_msi(dev)) {
+        return;
+    }
+
+    for (i = 0; i < iterations; i++) {
+        igb_send_verify(d, data, alloc);
+        igb_receive_verify(d, data, alloc);
+    }
+
+}
+
+static void data_test_clear(void *sockets)
+{
+    int *test_sockets = sockets;
+
+    close(test_sockets[0]);
+    qos_invalidate_command_line();
+    close(test_sockets[1]);
+    g_free(test_sockets);
+}
+
+static void *data_test_init(GString *cmd_line, void *arg)
+{
+    int *test_sockets = g_new(int, 2);
+    int ret = socketpair(PF_UNIX, SOCK_STREAM, 0, test_sockets);
+    g_assert_cmpint(ret, != , -1);
+
+    g_string_append_printf(cmd_line, " -netdev socket,fd=%d,id=hs0 ",
+                           test_sockets[1]);
+
+    g_test_queue_destroy(data_test_clear, test_sockets);
+    return test_sockets;
+}
+
+static void register_igb_test(void)
+{
+    QOSGraphTestOptions opts = {
+        .before = data_test_init,
+    };
+
+    qos_add_test("init", "igb", test_igb_init, &opts);
+    qos_add_test("tx", "igb", test_igb_tx, &opts);
+    qos_add_test("rx", "igb", test_igb_rx, &opts);
+    qos_add_test("multiple_transfers", "igb",
+                    test_igb_multiple_transfers, &opts);
+}
+
+libqos_init(register_igb_test);
diff --git a/tests/qtest/libqos/igb.c b/tests/qtest/libqos/igb.c
new file mode 100644
index 0000000000..674fb2e018
--- /dev/null
+++ b/tests/qtest/libqos/igb.c
@@ -0,0 +1,245 @@
+/*
+ * libqos driver framework
+ *
+ * Copyright (c) 2018 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License version 2.1 as published by the Free Software Foundation.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>
+ */
+
+#include "qemu/osdep.h"
+#include "hw/net/e1000_regs.h"
+#include "hw/pci/pci_ids.h"
+#include "../libqtest.h"
+#include "pci-pc.h"
+#include "qemu/sockets.h"
+#include "qemu/iov.h"
+#include "qemu/module.h"
+#include "qemu/bitops.h"
+#include "libqos-malloc.h"
+#include "qgraph.h"
+#include "igb.h"
+
+#define IGB_IVAR_TEST_CFG0 \
+    (((IGB_RX0_MSIX_VEC | 0x80)) << 0) | \
+    (((IGB_TX0_MSIX_VEC | 0x80)) << 8)
+#define IGB_IVAR_TEST_CFG1 \
+    (((IGB_RX1_MSIX_VEC | 0x80)) << 0) | \
+    (((IGB_TX1_MSIX_VEC | 0x80)) << 8)
+
+#define IGB_RING_LEN (0x1000)
+
+static void igb_macreg_write(QIGB *d, uint32_t reg, uint32_t val)
+{
+    QIGB_PCI *d_pci = container_of(d, QIGB_PCI, igb);
+    qpci_io_writel(&d_pci->pci_dev, d_pci->mac_regs, reg, val);
+}
+
+static uint32_t igb_macreg_read(QIGB *d, uint32_t reg)
+{
+    QIGB_PCI *d_pci = container_of(d, QIGB_PCI, igb);
+    return qpci_io_readl(&d_pci->pci_dev, d_pci->mac_regs, reg);
+}
+
+void igb_tx_ring_push(QIGB *d, void *descr, uint8_t queue_index)
+{
+    QIGB_PCI *d_pci = container_of(d, QIGB_PCI, igb);
+    uint32_t tail = igb_macreg_read(d, E1000_TDT_REG(queue_index));
+    uint32_t len = igb_macreg_read(d, E1000_TDLEN_REG(queue_index)) / E1000_RING_DESC_LEN;
+
+    qtest_memwrite(d_pci->pci_dev.bus->qts,
+                   d->tx_ring[queue_index] + tail * E1000_RING_DESC_LEN,
+                   descr, E1000_RING_DESC_LEN);
+    igb_macreg_write(d, E1000_TDT_REG(queue_index), (tail + 1) % len);
+
+    /* Read WB data for the packet transmitted */
+    qtest_memread(d_pci->pci_dev.bus->qts,
+                  d->tx_ring[queue_index] + tail * E1000_RING_DESC_LEN,
+                  descr, E1000_RING_DESC_LEN);
+}
+
+void igb_rx_ring_push(QIGB *d, void *descr, uint8_t queue_index)
+{
+    QIGB_PCI *d_pci = container_of(d, QIGB_PCI, igb);
+    uint32_t tail = igb_macreg_read(d, E1000_RDT_REG(queue_index));
+    uint32_t len = igb_macreg_read(d, E1000_RDLEN_REG(queue_index)) / E1000_RING_DESC_LEN;
+
+    qtest_memwrite(d_pci->pci_dev.bus->qts,
+                   d->rx_ring[queue_index] + tail * E1000_RING_DESC_LEN,
+                   descr, E1000_RING_DESC_LEN);
+    igb_macreg_write(d, E1000_RDT_REG(queue_index), (tail + 1) % len);
+
+    /* Read WB data for the packet received */
+    qtest_memread(d_pci->pci_dev.bus->qts,
+                  d->rx_ring[queue_index] + tail * E1000_RING_DESC_LEN,
+                  descr, E1000_RING_DESC_LEN);
+}
+
+void igb_wait_isr(QIGB *d, uint16_t msg_id)
+{
+    QIGB_PCI *d_pci = container_of(d, QIGB_PCI, igb);
+    guint64 end_time = g_get_monotonic_time() + 5 * G_TIME_SPAN_SECOND;
+
+    do {
+        if (qpci_msix_pending(&d_pci->pci_dev, msg_id)) {
+            return;
+        }
+        qtest_clock_step(d_pci->pci_dev.bus->qts, 10000);
+    } while (g_get_monotonic_time() < end_time);
+
+    g_error("Timeout expired");
+}
+
+static void igb_pci_destructor(QOSGraphObject *obj)
+{
+    QIGB_PCI *epci = (QIGB_PCI *) obj;
+    qpci_iounmap(&epci->pci_dev, epci->mac_regs);
+    qpci_msix_disable(&epci->pci_dev);
+}
+
+static void igb_pci_start_hw(QOSGraphObject *obj)
+{
+    QIGB_PCI *d = (QIGB_PCI *) obj;
+    uint32_t val;
+
+    /* Enable the device */
+    qpci_device_enable(&d->pci_dev);
+
+    /* Reset the device */
+    val = igb_macreg_read(&d->igb, E1000_CTRL);
+    igb_macreg_write(&d->igb, E1000_CTRL, val | E1000_CTRL_RST | E1000_CTRL_SLU);
+
+    /* Enable and configure MSI-X */
+    qpci_msix_enable(&d->pci_dev);
+    igb_macreg_write(&d->igb, E1000_IVAR_IGB, IGB_IVAR_TEST_CFG0);
+    igb_macreg_write(&d->igb, E1000_IVAR_IGB + 4, IGB_IVAR_TEST_CFG1);
+
+    /* Check the device status - link and speed */
+    val = igb_macreg_read(&d->igb, E1000_STATUS);
+    g_assert_cmphex(val & (E1000_STATUS_LU | E1000_STATUS_ASDV_1000),
+        ==, E1000_STATUS_LU | E1000_STATUS_ASDV_1000);
+
+    /* Initialize TX/RX logic */
+    igb_macreg_write(&d->igb, E1000_RCTL, 0);
+    igb_macreg_write(&d->igb, E1000_TCTL, 0);
+
+    /* Notify the device that the driver is ready */
+    val = igb_macreg_read(&d->igb, E1000_CTRL_EXT);
+    igb_macreg_write(&d->igb, E1000_CTRL_EXT,
+        val | E1000_CTRL_EXT_DRV_LOAD);
+
+    for (int i = 0; i < IGB_NUM_QUEUES; i++) {
+        igb_macreg_write(&d->igb, E1000_TDBAL_REG(i),
+                            (uint32_t) d->igb.tx_ring[i]);
+        igb_macreg_write(&d->igb, E1000_TDBAH_REG(0),
+                            (uint32_t) (d->igb.tx_ring[i] >> 32));
+        igb_macreg_write(&d->igb, E1000_TDLEN_REG(i), IGB_RING_LEN);
+        igb_macreg_write(&d->igb, E1000_TDT_REG(i), 0);
+        igb_macreg_write(&d->igb, E1000_TDH_REG(i), 0);
+        igb_macreg_write(&d->igb, E1000_TXDCTL_REG(i), E1000_TXDCTL_QUEUE_ENABLE);
+    }
+
+    /* Enable transmit */
+    igb_macreg_write(&d->igb, E1000_TCTL, E1000_TCTL_EN);
+
+    for (int i = 0; i < IGB_NUM_QUEUES; i++) {
+        igb_macreg_write(&d->igb, E1000_RDBAL_REG(i),
+                            (uint32_t) d->igb.rx_ring[i]);
+        igb_macreg_write(&d->igb, E1000_RDBAH_REG(0),
+                            (uint32_t) (d->igb.rx_ring[i] >> 32));
+        igb_macreg_write(&d->igb, E1000_RDLEN_REG(i), IGB_RING_LEN);
+        igb_macreg_write(&d->igb, E1000_RDT_REG(i), 0);
+        igb_macreg_write(&d->igb, E1000_RDH_REG(i), 0);
+        igb_macreg_write(&d->igb, E1000_RXDCTL_REG(i), E1000_RXDCTL_QUEUE_ENABLE);
+    }
+
+    /* Enable receive */
+    igb_macreg_write(&d->igb, E1000_RCTL, E1000_RCTL_EN  |
+                                        E1000_RCTL_UPE |
+                                        E1000_RCTL_MPE);
+
+    /* Enable all interrupts */
+    igb_macreg_write(&d->igb, E1000_IMS, 0xFFFFFFFF);
+    igb_macreg_write(&d->igb, E1000_EIMS, 0xFFFFFFFF);
+}
+
+static void *igb_pci_get_driver(void *obj, const char *interface)
+{
+    QIGB_PCI *epci = obj;
+    if (!g_strcmp0(interface, "igb-if")) {
+        return &epci->igb;
+    }
+
+    /* implicit contains */
+    if (!g_strcmp0(interface, "pci-device")) {
+        return &epci->pci_dev;
+    }
+
+    fprintf(stderr, "%s not present in igb\n", interface);
+    g_assert_not_reached();
+}
+
+static void igb_foreach_callback(QPCIDevice *dev, int devfn, void *data)
+{
+    QPCIDevice *res = data;
+    memcpy(res, dev, sizeof(QPCIDevice));
+    g_free(dev);
+}
+
+static void *igb_pci_create(void *pci_bus, QGuestAllocator *alloc,
+                               void *addr)
+{
+    QIGB_PCI *d = g_new0(QIGB_PCI, 1);
+    QPCIBus *bus = pci_bus;
+    QPCIAddress *address = addr;
+
+    qpci_device_foreach(bus, address->vendor_id, address->device_id,
+                        igb_foreach_callback, &d->pci_dev);
+
+    /* Map BAR0 (mac registers) */
+    d->mac_regs = qpci_iomap(&d->pci_dev, 0, NULL);
+
+    for (int i = 0; i < IGB_NUM_QUEUES; i++) {
+        /* Allocate and setup TX ring */
+        d->igb.tx_ring[i] = guest_alloc(alloc, IGB_RING_LEN);
+        g_assert(d->igb.tx_ring[i] != 0);
+        /* Allocate and setup RX ring */
+        d->igb.rx_ring[i] = guest_alloc(alloc, IGB_RING_LEN);
+        g_assert(d->igb.rx_ring[i] != 0);
+    }
+
+    d->obj.get_driver = igb_pci_get_driver;
+    d->obj.start_hw = igb_pci_start_hw;
+    d->obj.destructor = igb_pci_destructor;
+
+    return &d->obj;
+}
+
+static void igb_register_nodes(void)
+{
+    QPCIAddress addr = {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .device_id = E1000_DEV_ID_82576,
+    };
+
+    /* FIXME: every test using this node needs to setup a -netdev socket,id=hs0
+     * otherwise QEMU is not going to start */
+    QOSGraphEdgeOptions opts = {
+        .extra_device_opts = "netdev=hs0",
+    };
+    add_qpci_address(&opts, &addr);
+
+    qos_node_create_driver("igb", igb_pci_create);
+    qos_node_consumes("igb", "pci-bus", &opts);
+}
+
+libqos_init(igb_register_nodes);
diff --git a/tests/qtest/libqos/igb.h b/tests/qtest/libqos/igb.h
new file mode 100644
index 0000000000..0bd0c624be
--- /dev/null
+++ b/tests/qtest/libqos/igb.h
@@ -0,0 +1,51 @@
+/*
+ * libqos driver framework
+ *
+ * Copyright (c) 2018 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License version 2.1 as published by the Free Software Foundation.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>
+ */
+
+#ifndef QGRAPH_IGB_H
+#define QGRAPH_IGB_H
+
+#include "qgraph.h"
+#include "pci.h"
+
+#define IGB_NUM_QUEUES            (8)
+#define IGB_RX0_MSIX_VEC          (0)
+#define IGB_TX0_MSIX_VEC          (0)
+#define IGB_RX1_MSIX_VEC          (1)
+#define IGB_TX1_MSIX_VEC          (1)
+#define IGB_IVAR_ENTRY_VALID(x) ((x) & 0x80)
+
+typedef struct QIGB QIGB;
+typedef struct QIGB_PCI QIGB_PCI;
+
+struct QIGB {
+    uint64_t tx_ring[IGB_NUM_QUEUES];
+    uint64_t rx_ring[IGB_NUM_QUEUES];
+};
+
+struct QIGB_PCI {
+    QOSGraphObject obj;
+    QPCIDevice pci_dev;
+    QPCIBar mac_regs;
+    QIGB igb;
+};
+
+void igb_wait_isr(QIGB *d, uint16_t msg_id);
+void igb_tx_ring_push(QIGB *d, void *descr, uint8_t queue_index);
+void igb_rx_ring_push(QIGB *d, void *descr, uint8_t queue_index);
+
+#endif
diff --git a/tests/qtest/libqos/meson.build b/tests/qtest/libqos/meson.build
index 32f028872c..cc209a8de5 100644
--- a/tests/qtest/libqos/meson.build
+++ b/tests/qtest/libqos/meson.build
@@ -30,6 +30,7 @@ libqos_srcs = files(
         'i2c.c',
         'i2c-imx.c',
         'i2c-omap.c',
+        'igb.c',
         'sdhci.c',
         'tpci200.c',
         'virtio.c',
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index f0ebb5fac6..10279ed3bf 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -256,6 +256,7 @@ qos_test_ss.add(
   'virtio-serial-test.c',
   'virtio-iommu-test.c',
   'vmxnet3-test.c',
+  'igb-test.c',
 )
 if config_host.has_key('CONFIG_POSIX')
   qos_test_ss.add(files('e1000e-test.c'))
-- 
2.34.1


