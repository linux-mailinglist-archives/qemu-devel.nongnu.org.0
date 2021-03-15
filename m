Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EEE33B96C
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 15:08:08 +0100 (CET)
Received: from localhost ([::1]:59136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLnt9-0006yP-86
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 10:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLnqj-0005Yb-4x
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 10:05:37 -0400
Received: from mail-bn7nam10on2096.outbound.protection.outlook.com
 ([40.107.92.96]:14270 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLnqg-0001cT-DO
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 10:05:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IwhkRV2zAs9jpWK9lj8Ry3uzMazSSbBhFQRcwJSKB1HbxNQNhc0C2nTclNJYUNpw9gmzxOakyxcIF7HuMaoTDDOvdGG4umAdtlIAAr8/nif5ujKBGliUsi/7Qou32/b8mkru8o/aW1QL3My7o8MaxOrM8lOjbRAfANnNCXMM9rjncRGpo+pOxbyiRVJTBOgkSkXUGDuzJuhpufPBdFHdmElaTHVZ4o8mmMVRGs3wLZBuriE4uBvNcC5xliv6bUcl0glYM0zDQnAbGNuDk9kvti5rcoaI/BoXPYG6+RAk9MhK2VjrXGaRZA/DIJQOzYdmwXhk+q4PJpAfGavkbXfr9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snDcGfcbftby+KgjCZ8E6Rggg9q7PWnFxRz0DWkbFQw=;
 b=na91BwNIvyxkz2JkbUunJyXRQh6nUFvhlP9jMDgi6oyxNfeI1PRp0wJJArYaBs1q/g6VmURaK6QWbeN6XNFVn/OCmRH7KsSD1rCXFwMrOFgBvIaZ5QYCymJ2uEyJmK4mAoNkfgzGdT4bSIxqX6omkECu4LdGJs+3Uq8Z4lH1k5lPlSBXepIlPSPnxxaWQQsCl06VlacFb9PiUsD/hIbH3Gjv73iJEHrE+LCa3g8O3moAI9invbPPF5yE0LkVUaEsfzgTMxf3cwcTeetQbSijWwREdvuQi40Sb8psJNeZRHJqZg7VnoTVmULTZyp15vZO3cxcTZJNUOx/fIno0obCAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snDcGfcbftby+KgjCZ8E6Rggg9q7PWnFxRz0DWkbFQw=;
 b=SaU9Y5PCnIrUaxYVkGubDOMwnSm1amyziGK1AywLu6XEbvnIQflhnTJrtPuLmW6kEQrZ4tzOx/y4MFJL+VxcR3E+MeACv0g6EGc2ZrGSOID/pVt2r/kpBGfJDMxFhtJa23rmsuQ1UPuHfageuaiwhlcCPV1ILaI23+aYd+7qifQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB3933.namprd03.prod.outlook.com (2603:10b6:805:6c::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 14:05:25 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6%6]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 14:05:25 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/3] fuzz: configure a sparse-mem device, by default
Date: Mon, 15 Mar 2021 10:05:11 -0400
Message-Id: <20210315140512.8357-3-alxndr@bu.edu>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210315140512.8357-1-alxndr@bu.edu>
References: <20210315140512.8357-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [128.197.127.33]
X-ClientProxiedBy: BL1PR13CA0336.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::11) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mozz.bu.edu (128.197.127.33) by
 BL1PR13CA0336.namprd13.prod.outlook.com (2603:10b6:208:2c6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.11 via Frontend
 Transport; Mon, 15 Mar 2021 14:05:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7983ce25-3d49-4247-d924-08d8e7bb6139
X-MS-TrafficTypeDiagnostic: SN6PR03MB3933:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB39334E1A43DD061231E6C225BA6C9@SN6PR03MB3933.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:298;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KjX/JOg3wA8v8c0io7Iy8zepf714T0raqi2/4HHQ+bzyv8AxK4kWHlLUuqagw3N3EA4lDTs+fwMSoNjyY73Bc3SZ652XyK051j1CQr+o0wKE6Xbp+oWiWzLaV92S5xlFz4qKsUX9oUSmVyaTZXv5dn6S1zfOapJg/Vbzg8RAaYUlIbdKb+IPWoUmyUG7l37WEzTDdoArcCr2WJ+T+ndL6Crvt1NpZ0cQn2KqhdTmLV52OK5HmC4garBWZBwX+i+YvfRyV1w6X6nfiD4B1Jo+qiNtxwNGBB0G/msSDwCAvpIp/op4IRurmtZp9/xm10YD1cRWKt8zstJ8LGeJnDMVYRysMud+KayYT/a5SLoPObT7PYlqrJdZDck6qR6i4fS8CzbfVxS+SqBN8RIu2We2cmgVti0K+GapeZls4/B5Y/5h1m4TpqU1ey3iLI13vCEhIgd1/zNiGHCbnUOW4Xp7uoMs5IdfLsGKbiDp2B4tOW9IZlnofU+/3BL9+zlJzf/J3cp0TRKuvVPe46HfHrtJXKnXCks7jM9b6REZIpWKEg/d2J78sQXQS//+fpw+6xnQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(366004)(396003)(136003)(66476007)(8676002)(36756003)(66556008)(66946007)(83380400001)(75432002)(8936002)(316002)(86362001)(6666004)(4326008)(7696005)(52116002)(6486002)(54906003)(2906002)(186003)(956004)(786003)(6916009)(26005)(478600001)(1076003)(5660300002)(2616005)(16526019);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?edNIcFNrKuizApV3X2PNwUwQWN9gJzkA1j72/vNZ27OmK3nIQUBjabSWfBn4?=
 =?us-ascii?Q?sW+g4e5JCLhvCrJs1GS9dzrC31Ke4yQ20mSdtH/WGaWEdJCri8lhXI/sx7oo?=
 =?us-ascii?Q?zKWja8ndwzzcfGEVKZ+4LIPjL+dw6YoIxQSqK4wdBRT/DJjVqpL0im8SOZgF?=
 =?us-ascii?Q?88vZlvg25LiGKawj0Pa7jMkil9McyBYhh+961P0tEaaMVK9PxNLIVton8MtF?=
 =?us-ascii?Q?wjgzCcPer5fMWm17wy3SM+VkxXI1SEzEW1E5R33+WH0qEIDhBGf3Iym3FwqZ?=
 =?us-ascii?Q?F04dlzMrAYqQ4fZXER3+QynNbgvTgQVd6a/9eiqiWJWS6lal5DOfTSqEfoxo?=
 =?us-ascii?Q?3Ow/ZoKb8Mg9wA1Uw/LJQlW2dPe4zS388Z7xwsCHrpeKRF7rWVszcUchQNfJ?=
 =?us-ascii?Q?MbOwjKZpKAUSykc1ZLLG+zHpXBYDKgQZ+gwiIpFNh9mcdXToyyR0AmwVVoRf?=
 =?us-ascii?Q?/olYvHsWrcOKSCHqblM+M2bg89ZKJDQJV88sm4vnDmVSzKelZud8xxN4zN5i?=
 =?us-ascii?Q?XiJrPsf9RxqtirJ32bistDLGDm86dyILAneslq2xc7t2L585NZrsL4CbBVGJ?=
 =?us-ascii?Q?WRJsxC+72vmsbT1Inv6NfTpkaPc73R9hY4is+VEka8YCQt0w3wlCMc5LPDh6?=
 =?us-ascii?Q?HC3aSuhssuCGhiY+pndQbUVoCgO2unvntQinijgmpGnfYbH+xYZWKCpyPSQO?=
 =?us-ascii?Q?LmUrhMUkdn4/fexMKF9Ibv1UVvZJyVED7+8zkts5uGq0mEOgAdWhHCidfmZ9?=
 =?us-ascii?Q?3n56wynhhJ5BP/vlcozaZyhmUz761Ac0yz4Bw39LdlUCvzz/VwU/ZkQe2Meb?=
 =?us-ascii?Q?3JitfykyAhRNLfmauq3xxni/2jLdGiZ0v7jspGI/D6x6rdJ34CGSrji9KYqs?=
 =?us-ascii?Q?iT5MMe1fGD+0Z7Kz0WX6jxmyW77IfSn92FnGPfF5isbTAxRo4NoaNSG1ovaG?=
 =?us-ascii?Q?wIhaeB+8dc7bhGY5rG9w0Yr9t/fE2wauW7FfLPdCwwxN/6i5MgMOI3BAt5JB?=
 =?us-ascii?Q?AZ7eM3PA4A6buzH6cVk/OATu54AN1GYSuQ+ynGhGgPMWLG+GPYwezGEWNAq9?=
 =?us-ascii?Q?Z0zQxUgF79nqJmFVVR13KO9NK1kzxBU5z9wr1AURA0jCkYLd6wDss3eF5uxv?=
 =?us-ascii?Q?IForunEjBSfBwZsCRGBsIxWvSlBaEZbsf6qO402kB6UCp0mG6oa9PbsjAAup?=
 =?us-ascii?Q?nBQHOCjMb1BUWwh/yacki/hYL2MAo6y/Y3tPX25N94EfPuFv9kYvjcBwB0TB?=
 =?us-ascii?Q?LK/tj1nGtgqNsTfj4/+aVOqK8yeXmaoCuDVcbcEnrBcWIl2eVY5CtQ20HNkF?=
 =?us-ascii?Q?sX42OAfpQ5E3Z7hrDcfH+6tP?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 7983ce25-3d49-4247-d924-08d8e7bb6139
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 14:05:25.1425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iPQvEUJSyHMFRaKZDKiO0jy687U8vX/xxRrrJz2OiCinniGPWX3zUny8LcpZetnr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3933
Received-SPF: pass client-ip=40.107.92.96; envelope-from=alxndr@bu.edu;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=1,
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
 Alexander Bulekov <alxndr@bu.edu>, f4bug@amsat.org, darren.kenny@oracle.com,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The generic-fuzzer often provides randomized DMA addresses to
virtual-devices. For a 64-bit address-space, the chance of these
randomized addresses coinciding with RAM regions, is fairly small. Even
though the fuzzer's instrumentation eventually finds valid addresses,
this can take some-time, and slows-down fuzzing progress (especially,
when multiple DMA buffers are involved). To work around this, create
"fake" sparse-memory that spans all of the 64-bit address-space. Adjust
the DMA call-back to populate this sparse memory, correspondingly

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
---
 tests/qtest/fuzz/generic_fuzz.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index ee8c17a04c..2418e69371 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -28,6 +28,7 @@
 #include "hw/pci/pci.h"
 #include "hw/boards.h"
 #include "generic_fuzz_configs.h"
+#include "hw/mem/sparse-mem.h"
 
 /*
  * SEPARATOR is used to separate "operations" in the fuzz input
@@ -64,6 +65,8 @@ static useconds_t timeout = DEFAULT_TIMEOUT_US;
 
 static bool qtest_log_enabled;
 
+MemoryRegion *sparse_mem_mr;
+
 /*
  * A pattern used to populate a DMA region or perform a memwrite. This is
  * useful for e.g. populating tables of unique addresses.
@@ -191,8 +194,7 @@ void fuzz_dma_read_cb(size_t addr, size_t len, MemoryRegion *mr)
      */
     if (dma_patterns->len == 0
         || len == 0
-        || mr != current_machine->ram
-        || addr > current_machine->ram_size) {
+        || (mr != current_machine->ram && mr != sparse_mem_mr)) {
         return;
     }
 
@@ -238,7 +240,7 @@ void fuzz_dma_read_cb(size_t addr, size_t len, MemoryRegion *mr)
                                       MEMTXATTRS_UNSPECIFIED);
 
         if (!(memory_region_is_ram(mr1) ||
-              memory_region_is_romd(mr1))) {
+              memory_region_is_romd(mr1)) && mr1 != sparse_mem_mr) {
             l = memory_access_size(mr1, l, addr1);
         } else {
             /* ROM/RAM case */
@@ -799,6 +801,12 @@ static void generic_pre_fuzz(QTestState *s)
     }
     qts_global = s;
 
+    /*
+     * Create a special device that we can use to back DMA buffers at very
+     * high memory addresses
+     */
+    sparse_mem_mr = sparse_mem_init(0, UINT64_MAX);
+
     dma_regions = g_array_new(false, false, sizeof(address_range));
     dma_patterns = g_array_new(false, false, sizeof(pattern));
 
-- 
2.27.0


