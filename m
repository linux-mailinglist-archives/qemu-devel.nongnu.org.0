Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 815822DFFB5
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 19:28:24 +0100 (CET)
Received: from localhost ([::1]:49684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krPux-0006l0-Hf
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 13:28:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1krPu0-0006CS-H1
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 13:27:24 -0500
Received: from mail-eopbgr770103.outbound.protection.outlook.com
 ([40.107.77.103]:42915 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1krPty-0001Ko-Iz
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 13:27:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rjqd6unUBwDj4AhdrS0kq/QPdj8f0mwxt48TzZ+/PDGh99ZsGvJGtJvZGn99JbY/qVzZLulhxczLIgUH8H4cMWQNH32Nixb9mRiLxjsXqOCESxDCqLZwP0D0mI0WppiXILdlcb8KDuVPIXr7YJp/35GZAH2xQMSf/QimtttCXlGLTHeIZ9tZsRwbDhgVwwCPQyS0T0rFLP5ONFlAJwovtO1Ft2EU7szKE6ID5K5SWWHbyyLiVZrH6R0yuVF5kovE5RkSjKVWf3fPtu4MnbVb33r/8JxNgBypZZ43usdQXmh16TrnOdTDCw4kZBHRHL8M1CAn+yb3Rpw69HM2j+5LIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1e5B2wzk1Qv2ftsPQpVQVw0guXdqBEFodRNBeAwBzoU=;
 b=X7dUWziskv2KXEWQJvr59l1FMyGVbcUZyof3gbVh7TB865D/lvAGJRxfz6TLY5EAHD+xZkdPl4nslrbfRWvtfnqfUV2joxeATSPr1VE1AQbenCNsl7uucjSV2PDf5l78Vq4iwNXJCSS/p4N9VIuy+ofptlHBPCbertO+HKHr862GGvjvXxTCAGPdF0Xpef10DI8sRRUI57lwTYqYkvUm6WcGOCT4oDNyzuQeCF2d5rfN1ok/adGwNgutXeSoK6BAzlMM9fEUwsauthKGrguHT6ssHTme3dvojqEgi2rEPo56Ll57nQBVa77c4SS1+Tn47r+wVfwqF27qfM15ADnH6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1e5B2wzk1Qv2ftsPQpVQVw0guXdqBEFodRNBeAwBzoU=;
 b=EvK6KZ+vhZcXlVXSEOMA42+pCm4oUzj2Ca8g/yKnMcBnGeHgtAHxEitdR2MKcVCzfgrH1Rf+DkLoyoGaffRPsThDitn/gUu1Qon1/9OiLb76YP/JSVSwDxpBw5PGnclsuZjUFHegzq4euhcYs4OTURr79uH+HWrzqtKIHv3BAm0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA0PR03MB5563.namprd03.prod.outlook.com (2603:10b6:806:b3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Mon, 21 Dec
 2020 18:12:15 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3676.033; Mon, 21 Dec 2020
 18:12:15 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] fuzz: map all BARs and enable PCI devices
Date: Mon, 21 Dec 2020 13:12:03 -0500
Message-Id: <20201221181203.1853-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.93.72.163]
X-ClientProxiedBy: BL1PR13CA0317.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::22) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fibula.vrmnet (72.93.72.163) by
 BL1PR13CA0317.namprd13.prod.outlook.com (2603:10b6:208:2c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.21 via Frontend
 Transport; Mon, 21 Dec 2020 18:12:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c94b3f95-a58b-467d-d414-08d8a5dbf23e
X-MS-TrafficTypeDiagnostic: SA0PR03MB5563:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR03MB55634B8844F8F265256D3BD2BAC00@SA0PR03MB5563.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:343;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /RvKTHx/mXopfWAkoWTeAKb+9x4J3aSESqSTIpZMvjpLil2ZjTuXrdR3e0ojqU5qpoGDi42njbF3rCJnvcbY8/L/HnVQMWBkleLeWXr9pURRLDwxesL5yM1q+pzjq+HWkEUy37dwex6jTikN/E7u+u3rNk/OvIBoppnsvrWiEF87WTTY1AjeLAPfxR9wrN+v98FEON1MqFROFqzu6UqDxPdV/mRjZlE5BC6DUycTSUxECyG/NDQZZSVqURc/EgZLgD0LyZOwPDAv04+IaSKynN7J7QMngaI5+WgZKwlIdMYuyYVgmOT0+DNtNfy+wMBRJqGuk3JOocom11KouhiU1eaWvl3x1Gp7HfeV2eptgRNoC/FR5cforuarL6Mpkz+cL1Qwj4MFdOdOqta5fVDoFmrkZdHvLHwJDaCGTkXU74yMTMbTRAsxZbpd/G30D/24AuYY1SVGaeAa8JdOCaLMzQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(366004)(396003)(39860400002)(2906002)(66556008)(66946007)(966005)(66476007)(786003)(8676002)(16526019)(6486002)(86362001)(54906003)(316002)(1076003)(52116002)(4326008)(186003)(26005)(956004)(6666004)(2616005)(8936002)(5660300002)(478600001)(6916009)(6506007)(36756003)(6512007)(75432002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?X4bBK2TrzlobF8De7JqZ7X63KO+/3ie4w8890tmPirs1s4MW5kv6J9/oDQhS?=
 =?us-ascii?Q?2Y0EmUZvyyPUUHZdiFJT063J0A82mj2gwIkeSJ1teNXPya/ehT5jAyuUZEmN?=
 =?us-ascii?Q?+rRHZJIJ+ZseKOlii9Yiq6Mn9Io9C4dg5Z8UHcrJDHxouG+z+VKownp+pXBF?=
 =?us-ascii?Q?DwOfo4xLLhPMxI7gzKc+eA4i/ITD9wTcQ2btoRwDArgXqlwdw9RwnQzfwWjv?=
 =?us-ascii?Q?9XFV1y0PL8FxeiZsjHybOXwJRFfgxDDeN8fFrQyYqHZwk1jFZ/3juAczBV+W?=
 =?us-ascii?Q?IUkYMUBprcyWh6axc95ngxdOP7jibhc3vSDdmg1g/dq4LAyCRGbEWjxv6ik6?=
 =?us-ascii?Q?IZyTeThWOGGZ7h1YXFC/p4P/qtuCYK6FqIIw4zt67pD8LbPpTK/Hpcsg7TBt?=
 =?us-ascii?Q?WEXwlFFGiaWljpuPCVYnUrHBAXhlDsfVOfPM5ZUH1u0iMhV1G5rw12HeFEC7?=
 =?us-ascii?Q?MGa+Bl8Bxz43h3CNMuynCIc2WW+rjsy9zzZCAT+1euSftd/X1k0I8LesccDu?=
 =?us-ascii?Q?EjjPw6Cce9a2GUGVIUhpZU2voFb2vcjwZxwrUpJBsNI9KfknpuEfQEYALHD4?=
 =?us-ascii?Q?VOP3+SJIi+O0bCLPgNtU5loSVCYCGICh9AUF8GDWOAZa7snA6PJWThpysY8m?=
 =?us-ascii?Q?8tsPAIuvipK6XEOLxueJdIQSySKaWFICdZ8lLiVlGbtx86/bkqas4/0YRfZC?=
 =?us-ascii?Q?06Ezy6S9D18HdmC9q6FkWhv5YDIjrJuUMWgogeW5maCDmjUDUyB4LGlwzMnS?=
 =?us-ascii?Q?3B9aGBsDUqzBNmOSOeHKc++wF96F29C8R2hhme2GgdQLo9fx4BJg8lD1ZsAe?=
 =?us-ascii?Q?AsaevRo2K79bnAu4gAPzlNwuQ6v5TXrMazJ/n8RlEMq4sr/vlWZjFIkZJxSo?=
 =?us-ascii?Q?XX60GM50D57BxkUL0wqYCZggJjyFpgT42YXox5/j+SAYR+b9Jm/4KxGTQuiA?=
 =?us-ascii?Q?mgS9CtZEHPABBhfmLd2uaMwZP7Q/a5XcWlSK/9Ba+5s=3D?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2020 18:12:15.2420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-Network-Message-Id: c94b3f95-a58b-467d-d414-08d8a5dbf23e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T2N565iNPtSWnq3HuaGtkxUoFDCytFQGREPA/A8qw2m0krdLo+IxFgYDf5fs0SGK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5563
Received-SPF: pass client-ip=40.107.77.103; envelope-from=alxndr@bu.edu;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
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
 Paolo Bonzini <pbonzini@redhat.com>
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

v3: Plug the memory-leak pointed out by Thomas:
    https://gitlab.com/huth/qemu/-/jobs/920543745#L309

 tests/qtest/fuzz/generic_fuzz.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index 07ad690683..be76d47d2d 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -16,6 +16,7 @@
 
 #include "hw/core/cpu.h"
 #include "tests/qtest/libqos/libqtest.h"
+#include "tests/qtest/libqos/pci-pc.h"
 #include "fuzz.h"
 #include "fork_fuzz.h"
 #include "exec/address-spaces.h"
@@ -762,10 +763,29 @@ static int locate_fuzz_objects(Object *child, void *opaque)
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
+    g_free(qdev);
+}
+
 static void generic_pre_fuzz(QTestState *s)
 {
     GHashTableIter iter;
     MemoryRegion *mr;
+    QPCIBus *pcibus;
     char **result;
 
     if (!getenv("QEMU_FUZZ_OBJECTS")) {
@@ -810,6 +830,10 @@ static void generic_pre_fuzz(QTestState *s)
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


