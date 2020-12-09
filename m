Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 053A82D4BC8
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 21:29:12 +0100 (CET)
Received: from localhost ([::1]:45180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn65H-0004vu-1k
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 15:29:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kn62U-0003Y0-Dl
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 15:26:18 -0500
Received: from mail-bn8nam12on2092.outbound.protection.outlook.com
 ([40.107.237.92]:17889 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kn62S-0003Ai-C9
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 15:26:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UXIhG+ScvSAZKF43K2ORJ/3QeXQ7vtQGMpO/oUva+r4Bb5ET5ZP09NgxgGLw3narUPrNJzm9e9ivsMivkyfKC6QtaTxxf0A5f1VcjnxLO5ct/pt8bnBT53E/f0vIorlMB5EEdiqSB+sH+xYGlaz9DSwOok5Va3vgiKaZL8PkVwiSsMEN4AWH7LeXfzGEAN9Q/4UniS3OrixRVTGm1MxqVogHHDX94FYXw5ACIZCEc7rU43R/xoTLFWdq38cqLdieLpF0Z2Ch6Cgr64BMGUnTcAMHJOgGNQ2GnW6cqqXQ/D+rGv6VmncmAKOnpnFr3k8/M6tsXBK95y67xhempdhYGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TssYVBIryKTtbGh0965WRpeDMdP/L5Su7/bWjlH73bE=;
 b=R5ckIfzl18UqKbcF933tdk1N+jzaoOy+8WG7+T28s62Su8ZzmZ9x0Up8jox6O9JHgjVWHQi1J06w6UyhLCtKCgYiUe1joTXX4YjTHPPoX4Tf+5TiRa40TvE/1WihLGzBOeOKexIkLViiK14mx3FYk+nuVeHRf3/367KOTcGiq+H2mUoGa82ycVIWnLdOUXNfv7zQqrlS0A7kDFzbrJ/2FIrZCPlC0Xz75HDOj/aPEFYabLEoUqA15nqjJ1nlIs0Sw0dLaYSZOkOoAyMWHhTeD9cD+1/rEclpJxaugPJH5dCl/9k7itxC6YSmPr8CuCuUBSJZRvnK2h0ERGgZTlXO/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TssYVBIryKTtbGh0965WRpeDMdP/L5Su7/bWjlH73bE=;
 b=445G8cm/0j36MLuY0XAqVQ1kJTLzI4pSYCda5A4MrxANjS1nsjtg6d50P9eMhcii6/a6oznJgCRBqKh6itho6UiM0LCdevSOWTpaRrM/RYdRSJDe7ftHaA1IYFp8Wl1x5HxOa8C8HQ0Wt+zlvDn8AygXqExLA+dlCo2dIeKT+No=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB3616.namprd03.prod.outlook.com (2603:10b6:805:4b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Wed, 9 Dec
 2020 20:11:12 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::d520:4c19:8ce6:7db2]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::d520:4c19:8ce6:7db2%2]) with mapi id 15.20.3632.021; Wed, 9 Dec 2020
 20:11:12 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH] fuzz: map all BARs and enable PCI devices
Date: Wed,  9 Dec 2020 15:10:54 -0500
Message-Id: <20201209201054.391408-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.93.72.163]
X-ClientProxiedBy: BL1PR13CA0192.namprd13.prod.outlook.com
 (2603:10b6:208:2be::17) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.93.72.163) by
 BL1PR13CA0192.namprd13.prod.outlook.com (2603:10b6:208:2be::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.8 via Frontend
 Transport; Wed, 9 Dec 2020 20:11:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f29e3e0a-c3a6-4b6c-8e55-08d89c7e9351
X-MS-TrafficTypeDiagnostic: SN6PR03MB3616:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB36161E6EDA71832E033D95ADBACC0@SN6PR03MB3616.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:343;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vioQZpC5Pcw4QcwVEABRgIV1/vo6CyUTOfJSkYKJn2/o7mqmVQxkXB7oHg2qoeP94/IhTvRYIht56FJ/nWv83JZEajV5Kg0inMfGlOyPgV+i6nqfks2V3qFAkLmeqwmYTljwCavXfVrSQiwNnWG19A6LfnXNdao1yOfH4zKjOHbGUs0YUWPZffh68FBNL+V7wxXrqBNol6a/2GF9hxK4s5y8iLavmq2nHry1QY2rbs2nju/bcOKPE1J/OieuElJKDEbFvnBFb6ar/CMcg0//okQ+kg9yZ1CeYAXDU41dNzofshLF2lJqNorqEzfHkd9bhWF6GAK/iWX/SMXl6rIhCP8pzlHPUptQ7kq1TSCLDB7q+tQi5mAaLIaGwkhK0fao
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(366004)(4326008)(75432002)(86362001)(508600001)(786003)(6512007)(6916009)(16526019)(956004)(36756003)(6506007)(52116002)(2616005)(26005)(186003)(6486002)(66946007)(66556008)(8936002)(2906002)(34490700003)(54906003)(66476007)(5660300002)(6666004)(1076003)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?xiPaSp+/kVVULnnnmafMJ15zRVg2SBZFHrnlac/aTVI0MC2G7isYFddumyX5?=
 =?us-ascii?Q?l695TTkzDxuh1OhnOTlrUz4tr+IJSbU7n5MPbtk9sySTkgFVRmoK1xMGIm8B?=
 =?us-ascii?Q?n+y3SFdKOgSOVnvjDkB1smWjIfKVFcVRqe+2mRgvm3gZEMJr0HEZrYkm6b4f?=
 =?us-ascii?Q?CCqT296G5z8lqtzzqgOtn5fFsa60Ut840Xd8AV/mBeOX+3P1GrqsCrrYY2Wu?=
 =?us-ascii?Q?/hh9xjMr9rxS2QmV6eylNns8OC3shZa2IeLZ4IiyaDxC+6ZyccfxWzcyTLJL?=
 =?us-ascii?Q?Efa19Xs2C2ZZiPvQa3Q+JLmh2E8MWUmAEU/JFrQHz6+r7HGFHaV9ARtO8Ykt?=
 =?us-ascii?Q?4CH4kVdBNQi+t3FMwbC5clbp1WFGsDHIuk3QXzMP3GT1xIaOyKJMAQpSM4bv?=
 =?us-ascii?Q?CEKQCDwSOXtHsngTDAFCz9FU1EBK+lc0+YyUQfJye+AgXtIrjsYTZc4lyI1C?=
 =?us-ascii?Q?nzplpZbKgDsqK3KWbwoEy1B09rm+laOSjlulXTjstkQlyNuOTTq8WJOx/h43?=
 =?us-ascii?Q?yE6V67nO7dIdyoL2WatX2BvKJRqutTaV3Bi4JDkbJOW/ANLm+LcWztusfmlG?=
 =?us-ascii?Q?WtycvP4sZatLhV3a5xYn2uJp9QcOST8d5VaENG+vw5ixM+4pUCWmkzCw100I?=
 =?us-ascii?Q?p0DiB2xFs5jWR6xUo7++b/KzgwylZOKav/eCi5IHv0ppetBLaFgsSOs6NvZ0?=
 =?us-ascii?Q?9HS/778j8Pg7dwb90hnxZsLyKDd0e0gcf/mSz/ZhB1C+7cdCCQWNWbY5W+qs?=
 =?us-ascii?Q?Dt9MsyAoZ5nQG1z4M8x2C6yHkGPsoPn0/R/C408+Vn+9cEBmX+Z19eCmfpnG?=
 =?us-ascii?Q?+m7mI2USygtiEmHtYuvQmnR5klBFS0YnQ2+lMN2Q84r8fCUE9c0MdOfMqZFe?=
 =?us-ascii?Q?Uh7lDZUQcXbebnG0mHXj6Vbzo4TxjspxAvQEFz4NUAyCUJP6SWNkPHsxs91K?=
 =?us-ascii?Q?XrYs6OhHMp46G4bs37nlsX9t/WEH8Uj5aZC69K+W1j0=3D?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 20:11:12.2494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-Network-Message-Id: f29e3e0a-c3a6-4b6c-8e55-08d89c7e9351
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bvPPXlxpnCQpTfBf3FcBL93k1wDb2BeZ0/Qb+cJyQQluoXLxVj/MCgCRiyEiFwrw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3616
Received-SPF: pass client-ip=40.107.237.92; envelope-from=alxndr@bu.edu;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.341,
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
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Prior to this patch, the fuzzer found inputs to map PCI device BARs and
enable the device. While it is nice that the fuzzer can do this, it
added significant overhead, since the fuzzer needs to map all the
BARs (regenerating the memory topology), at the start of each input.
With this patch, we do this once, before fuzzing, mitigating some of
this overhead.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 tests/qtest/fuzz/generic_fuzz.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index 07ad690683..d95093ee53 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -16,6 +16,7 @@
 
 #include "hw/core/cpu.h"
 #include "tests/qtest/libqos/libqtest.h"
+#include "tests/qtest/libqos/pci-pc.h"
 #include "fuzz.h"
 #include "fork_fuzz.h"
 #include "exec/address-spaces.h"
@@ -762,6 +763,22 @@ static int locate_fuzz_objects(Object *child, void *opaque)
     return 0;
 }
 
+
+static void pci_enum(gpointer pcidev, gpointer bus)
+{
+    PCIDevice *dev = pcidev;
+    QPCIDevice *qdev;
+
+    qdev = qpci_device_find(bus, dev->devfn);
+    g_assert(qdev != NULL);
+    for (int i = 0; i < 6; i++) {
+        if (dev->io_regions[i].size) {
+            qpci_iomap(qdev, i, NULL);
+        }
+    }
+    qpci_device_enable(qdev);
+}
+
 static void generic_pre_fuzz(QTestState *s)
 {
     GHashTableIter iter;
@@ -810,6 +827,12 @@ static void generic_pre_fuzz(QTestState *s)
         exit(1);
     }
 
+    QPCIBus *pcibus;
+
+    pcibus = qpci_new_pc(s, NULL);
+    g_ptr_array_foreach(fuzzable_pci_devices, pci_enum, pcibus);
+    qpci_free_pc(pcibus);
+
     counter_shm_init();
 }
 
-- 
2.28.0


