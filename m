Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC9E2DB472
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 20:26:35 +0100 (CET)
Received: from localhost ([::1]:36302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpFxy-000287-Dk
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 14:26:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kpFwV-0001bc-KS
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 14:25:03 -0500
Received: from mail-bn8nam12on2117.outbound.protection.outlook.com
 ([40.107.237.117]:27521 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kpFwT-0004pM-AV
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 14:25:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f3TYlF9pUQOdlKhsXMtuvSCiMurQXLbaI2m152qVsT2U5rWSuZFDvStXkgcoND95lSQ+9jVmCg6W0p7LNA635KfGb528yl3RbUfNpzt1UTGm1Kx4hs2IMujSp4UtOtWN6IQ/XNuf0ZnVz9knT/bTJ4vs7PyaDu6dfTMJvYJZGnKFdjj+vS2Z3ccedbOpQhomaPm5A2F2SVjKtoY0Sa+Yi5vxXSYutrox8iXgJHIZS1iftVagL/HjLdV3ayinP/QyzRdjSnO1/QzVyn7CUeGxO1fYu/6uT5mUYaCmX8R6gR6qEoSKKIWo9xBlQv/XHNCt5nNhYIBqilcyNI2d1IK/OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mK2eO/n0AqE5vHeKUZBaiYXlzmsexZgV8xrOtRflm8A=;
 b=n6tnxz4bD+zM2RRTNGTT25EP9pJJ2h0xBO8j8FKeQgoHHnfym1vOKFa5EhhIXdvPFnXtZF9WJsNnMPd4TXU+/HCXZEP4c5K91h1dtXj/2DmtbLvOshSPX9hyA4qlNJixBoCPkyXFdfeKwGfAn3bdNytg08UU7WaZeIQ7JmOLCNEt1n6tytlC4MD4ZI8ljL4DL1w3HIIkEDAvzJ3W47p/xLss/HG39sk/PAp8hIPgT4tvz75/TE0mRSPu4nCNhMhb/DhijJhe/RmIgQqaJ8Myl48ClGHPi4SpmjACPTbhFoLNlelFRq0Wgti986djKojG0I/TiGsets2rDofytT3Xjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mK2eO/n0AqE5vHeKUZBaiYXlzmsexZgV8xrOtRflm8A=;
 b=ntVxUYNg5xA1Lf6qiIDxQorNJm2k0oH8SGB3pAcDasLQEcUUShShOH7Y6N8s7CYk15Qw91LdtUR0d9yJvhJzgMtJrb7VFaLfJ1xWZ9Hzeg4iaaJdwOaoNV0a9xm+FEDh4aYCER18uC0z0mC2q7c6G8+ScwjZ2Hek0yaZe7fcQtM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA0PR03MB5625.namprd03.prod.outlook.com (2603:10b6:806:b7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Tue, 15 Dec
 2020 19:09:56 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::d520:4c19:8ce6:7db2]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::d520:4c19:8ce6:7db2%2]) with mapi id 15.20.3632.021; Tue, 15 Dec 2020
 19:09:56 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] fuzz: map all BARs and enable PCI devices
Date: Tue, 15 Dec 2020 14:08:11 -0500
Message-Id: <20201215190811.398331-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.93.72.163]
X-ClientProxiedBy: BL1PR13CA0159.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::14) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fibula.vrmnet (72.93.72.163) by
 BL1PR13CA0159.namprd13.prod.outlook.com (2603:10b6:208:2bd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.9 via Frontend
 Transport; Tue, 15 Dec 2020 19:09:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b82b2d2-bf5c-4b38-792a-08d8a12d02bf
X-MS-TrafficTypeDiagnostic: SA0PR03MB5625:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR03MB5625C24E614F6990E2994181BAC60@SA0PR03MB5625.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:390;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bh3weCXVeklxO3eEr3dBOD8No0wgJ0/WerygPKV53vEEcxXwBIJL9KuM9UNMIZDuwEEyyGNupA3PRUzcEx+KbsmqkzGB7mxeHJpDNiVn7WL5YaV/EHLh/4t2zrl3V/G7VCHZ52Ilh176aT1aUr0ChdPosMSPCHTGbs3MDsxu4EnqWe7YNHYaS4HOD54eBqpau2cXpoPW6CJc/iIr/NDtk219byXGIMiFJz7rziUhvA+E+xJTWP0mnQFm8bIh7AgwA0AN+G9BWg9/gnlbR3EIEhIehOgmHbicF2PyjhxhRSElLg8OtfhvPhycbU9NSZ5J
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(396003)(346002)(366004)(376002)(136003)(8676002)(6506007)(6916009)(66476007)(478600001)(2616005)(66556008)(8936002)(6486002)(956004)(16526019)(6512007)(26005)(52116002)(5660300002)(316002)(6666004)(186003)(1076003)(786003)(75432002)(2906002)(66946007)(4326008)(54906003)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?K5mfav/Wm0p8kq0PliV+qEEAbwe8VPZF6F2ZpTGVoQwu5UJkAyEyywFdwS4n?=
 =?us-ascii?Q?nf8/37t526D5f/P4C+SC6WCvoqwA5d4dnsGDvGB2TiTSyJhlJ/yOtsgHP638?=
 =?us-ascii?Q?YAWnOd/gudEd9xyfYtK0oOg+yOzIEOYZRv+axhzjg5Jyf+ic/T/h41ufWdEW?=
 =?us-ascii?Q?4ASC9PinK0mAQW8EjvgOW3/ZiMn2KmtIyZRxBDbN7Hw5xThvEZwumfW8gyuP?=
 =?us-ascii?Q?mcBudVFxvu7f1GGN2j1UJJVFvmGJPnwN2RyzvvqgAElXizdeGp4e4qXRoPFo?=
 =?us-ascii?Q?AzBiB2GopjWAaVTT03OIiyhLqbzoxNglwHHp/CafN2BIGroKOLYJ32q6fNvn?=
 =?us-ascii?Q?tiCheARxecF9HdBnB5Xxbw4nabYRw+cXEUTVde0FR4uyXfNrZL15fDudkSyf?=
 =?us-ascii?Q?XQdyOrnK/X3W8lnoRcDfpqUDcvIsoNTcDFL0uND19kKlvM/RN8Ow7DLbDfCP?=
 =?us-ascii?Q?YPvjzwWvsLlIndJAZmIODx33ope1mkl/5L8TBgGelJzNgwqwmUh4eWrjxbb8?=
 =?us-ascii?Q?eDAVKFm1BHIIVujf9a60q0GbJWyiLZkqNi1vQathBycGlGqxlTjPsaZWzwl3?=
 =?us-ascii?Q?37zN7y73VAVKbtHgXHUELGLJqQZSIW5oD2Y8kacB7aSVFr0+UFM7PFCG4ccN?=
 =?us-ascii?Q?24+GouZtzs8rggXecX3Q1OdMUoe9r3vKvDyvCg8PhBdH12gdmyxjYMEiw71T?=
 =?us-ascii?Q?zwdweoeUk8mK/FzcOwLPMdUiFQV+BYoeFwwpz9e3E4HMcd6LW7NIupPl1rVP?=
 =?us-ascii?Q?oBZFaFqKuIWopM1uRvkVKbinPwe6Epx3uDZk1Rcb+7THhChKGdWY2Dzc4a+h?=
 =?us-ascii?Q?dAWtMEqF82Lm0suIbRqoSpW68frcOLon11mHtKjkE24/7cDdYnOGa7K+pxoT?=
 =?us-ascii?Q?fuoDga75UU+IPwkbQF2mBOO/TS9kvV0kGStzoc+HsHW11GlANj9vYmVuZZZd?=
 =?us-ascii?Q?07ThCWM0kHhQgexqdGjoosQjv7NENQpfZ26rVP2LaC4=3D?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2020 19:09:56.2449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b82b2d2-bf5c-4b38-792a-08d8a12d02bf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NVS994oWSxMAGHS3iERW9gmhZhwTLv7pVIyc2yNYSXVS9xFOD+yJ2q6lS/7qnw+2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5625
Received-SPF: pass client-ip=40.107.237.117; envelope-from=alxndr@bu.edu;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.001,
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
 Darren Kenny <darren.kenny@oracle.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Prior to this patch, the fuzzer found inputs to map PCI device BARs and
enable the device. While it is nice that the fuzzer can do this, it
added significant overhead, since the fuzzer needs to map all the
BARs (regenerating the memory topology), at the start of each input.
With this patch, we do this once, before fuzzing, mitigating some of
this overhead.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
---

v2: do not mix statements and declarations

 tests/qtest/fuzz/generic_fuzz.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index 07ad690683..92b598dea8 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -16,6 +16,7 @@
 
 #include "hw/core/cpu.h"
 #include "tests/qtest/libqos/libqtest.h"
+#include "tests/qtest/libqos/pci-pc.h"
 #include "fuzz.h"
 #include "fork_fuzz.h"
 #include "exec/address-spaces.h"
@@ -762,10 +763,28 @@ static int locate_fuzz_objects(Object *child, void *opaque)
     return 0;
 }
 
+
+static void pci_enum(gpointer pcidev, gpointer bus)
+{
+    PCIDevice *dev = pcidev;
+    QPCIDevice *qdev;
+    int i;
+
+    qdev = qpci_device_find(bus, dev->devfn);
+    g_assert(qdev != NULL);
+    for (i = 0; i < 6; i++) {
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
     MemoryRegion *mr;
+    QPCIBus *pcibus;
     char **result;
 
     if (!getenv("QEMU_FUZZ_OBJECTS")) {
@@ -810,6 +829,10 @@ static void generic_pre_fuzz(QTestState *s)
         exit(1);
     }
 
+    pcibus = qpci_new_pc(s, NULL);
+    g_ptr_array_foreach(fuzzable_pci_devices, pci_enum, pcibus);
+    qpci_free_pc(pcibus);
+
     counter_shm_init();
 }
 
-- 
2.29.2


