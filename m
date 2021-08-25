Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 335F53F75F6
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:36:40 +0200 (CEST)
Received: from localhost ([::1]:44202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIt55-0003a8-81
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:36:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mIt2b-0007US-04
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:34:05 -0400
Received: from mail-dm6nam10on2122.outbound.protection.outlook.com
 ([40.107.93.122]:65035 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mIt2W-0005W2-Tj
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:34:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aN/by7zCmeHBh43iY/MssnioLhMQYkQQdbmBwIzKLl6XWvM43/ujnFMFG0WplveYCU6IBRzHNonOO4XbyAkfzt7whipFgAMErD0oMDlLtIdUegpwMy5mQGo7478StKRfb45e9hhhwbK1eyfRUYDF+aNwIjGI9CMRwdnYuVYzq+jqF0WAtCvG8/ZPZlqWzprDIslamWMym9x3wHc/xfXC07S/KN/le+1CX/t7EhhydSziIt+8jQYuBDewarJp/2nlpB0ArxUjCVgd8FKw4FMAFA4FwLEUlxxGZGFyvHAmgaNrxQXFylYOPsdZGcGTrU++RBL0TSzk9eZGwtEkY7acvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ntD0CBll2MvnNR62ARlgC7X4fKZR9uGeVPZG4F+7zU=;
 b=Q2/IDgep7DOCaHE4IBqJ5yoU/CgIe5bAFrwJzOkW2h6RUMNFD80K+C2riyPp+SFmjWUZMIeE+gcV0VVaiUgmFsvGXQJwHR0CXObCZMFbc7pMYsHV3Xgm3N25DqHeZbDPQ1mrM0M6m4J9I5WPhsHqXHAKevDcqnJRm8Cc5KSTWGtzM2bARBOnqIfRfCVxPMFn85OMIBja4CQEEUfUVNbK0i8XLaCikIutPjSJ5Q/o91lAaxSg+dGZsUsNrzR+qgHU7AC1SsdJfgIuvh0T/KRSGh5+Fb/kkvH7E3Pt2jsSBlPbJvEY82e9hKLlTybfb/drzZJtC++Du48E3axeeMCGYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ntD0CBll2MvnNR62ARlgC7X4fKZR9uGeVPZG4F+7zU=;
 b=b29HoifkBm/fdGkcodsj4aD+m7nJcCT3uB5yh5IZ676elhmfcGXjLZpHfoAr3HRp22MpoDHrLXc4iSVKtkiymA0PrMEWgUa8DHl+6nz8zj2TINideamPeI4xODnPtITrOj/GKHQcqLhF/0/oiNkfM0ChdXJT2sn5pdFfe8tpiog=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4447.namprd03.prod.outlook.com (2603:10b6:805:ff::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Wed, 25 Aug
 2021 13:33:49 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139%7]) with mapi id 15.20.4436.025; Wed, 25 Aug 2021
 13:33:49 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 3/8] fuzz: make object-name matching case-insensitive
Date: Wed, 25 Aug 2021 09:33:27 -0400
Message-Id: <20210825133332.44378-4-alxndr@bu.edu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210825133332.44378-1-alxndr@bu.edu>
References: <20210825133332.44378-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0085.namprd03.prod.outlook.com
 (2603:10b6:208:329::30) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BLAPR03CA0085.namprd03.prod.outlook.com (2603:10b6:208:329::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 25 Aug 2021 13:33:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f377c03-c4c0-432c-2e56-08d967ccf884
X-MS-TrafficTypeDiagnostic: SN6PR03MB4447:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB4447364F0FF1F8A8CEC157DDBAC69@SN6PR03MB4447.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:323;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NeHCG9ua6IYJNw5Byg0u5iAa710GzzOhPAeoc2WA0ZAakLovZdjSfrW51AvwuO9U5VlOx9BhFQ735UWePiAebdwBw+ZYZX5YTskN708Xp3V5KMk5uwYmjt8MQv6RsD+nWeqe4cjth/Tukcp0hswNqy9m2IvGvNFs+iyvgJBCN0cYfMeQIShAf/AZAQTO6GqxhhrmJ0pjnRg4uRIgiZj610DaE161d6YeVKfLYoW8uZdwKxhpYyDgWmrP2THCBskbFMBmEEXAunjDT5xU7sg565HGfx4am/rZOg0ATDfhMXPOLNQLYKT1p+9X4GQ9OfKXkZkEw0YpWw1DgJgi3XkT5H5p74Xb9jHeNy9IIy7fP9vRmnjFmr1cgtp6V88usGoFcmyVXLbCcsK6U4Yay4O3nfffoOCCEZozMrxbAIOpW18wXHLhURqSKcZLnCDWLYXVWCO9t69tdpPt5rk4rqxqQpUn/PxWqp9u5tx/4MBbwsUDR9P83RQZHvs/DzWyplyUPpMkCkcKUE6+2HjoOWJJf/0yPrvXm1hMeZVS0g0fy2HsG91PdzsoKXzTS6JYacPQYclhYcE8Hhxpe63vXgqCVT4q2D3oB7YcJCA28WkUlH4yJlQEEO8+joG/pbAWr8YTPp7UBbjUpVeIyT3BU6nRv6JWfxWgEEVkq3Ndz8bnNj3zI878UZM8q0UV2zP/ssYvzRy1JcTqzaUlzrT8OxoJyQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(346002)(136003)(366004)(83380400001)(75432002)(186003)(1076003)(86362001)(478600001)(8936002)(36756003)(6916009)(52116002)(4326008)(6512007)(6666004)(26005)(6486002)(38100700002)(54906003)(66556008)(38350700002)(5660300002)(2906002)(66476007)(316002)(786003)(2616005)(956004)(8676002)(6506007)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?scQizQnybw16efHEic/FANRwdrsz4Rt6gECKbDrqrjNpX7WUTce8AF28OjHu?=
 =?us-ascii?Q?ZIWHVhrI6E/iIUDrbf964QrMQxN431PTvaeCmrMgqenQQmauQfFkErz9ytco?=
 =?us-ascii?Q?1Ormo9N8D2U/9PCumVztoPMJ1NrHI5iqKIph/lEEEI2CYRyy/sY7bHbFrYCh?=
 =?us-ascii?Q?TgliUa43Iu5HpXFlTAVjPocQh6Je3e8BpQXXupXJh+V55lDX6KHm+DkNQBGZ?=
 =?us-ascii?Q?PTqre+rgSYatioCurBq5g5tcsDyOZj7e+R0sWJRS4bNOydlm0OzhqIKKAiSU?=
 =?us-ascii?Q?GdTrHx2VtlFEE+jq35dGtnXaTnSv6DdAair5I1oUlT4BKBmcRMNXCJy3+FtT?=
 =?us-ascii?Q?qsAMlNOkuxa0RjQWOKV8SPb52qp07dMyMNrQBgMQOko1Nk4l2/F0w787UNfm?=
 =?us-ascii?Q?1IwIOF3ipsXx7x54mbdqu1J0t1cpECfp74SQJyKr/jx1sygcL8Cqb+I6Byir?=
 =?us-ascii?Q?a+fHJ//MxLXENvd6rBqFt82du7t2ziOKEQ/Qq0woiAg5pSzEJoeem2DblOoz?=
 =?us-ascii?Q?tXMoZ0wEd3MMaqDG6E2516ICaqlJyNUtdfAEj6wueVlUrLohXM5SK1tsGc1F?=
 =?us-ascii?Q?rv9Ngt0gVn/J+XA/6hSVCGAF2WATG9Uo1PJEfGeC51ACObqmIWTdTbJEA0i+?=
 =?us-ascii?Q?WzmjdCy6DV2EEd6apw+B165htjMBOkO3r4mftjC96TgUE83VpFHaK9VkX5+P?=
 =?us-ascii?Q?XGU1Kk9C0gw5HKWm/Rnp32R0hp50f+rI+0/cjJhjgotxeJOGp6YtXy1fB7/b?=
 =?us-ascii?Q?vsFS2tnudLs68momSqG5B7u95Yfpn0oPOpUwvi/Q9W9WT2Y39hKzdM2MqgRT?=
 =?us-ascii?Q?W6p5JX67ifMNPWMKrIHV2oHYNkroTFmVxo0IxuaTtv0mgsG7NvAJtZ12NZiT?=
 =?us-ascii?Q?Md+jCsKgZJppdM5o9TmojSEqNq4Zk/owKAv3KCZZK/kDAXp/vHbGZrxs9kNF?=
 =?us-ascii?Q?nku/OL1m6m6Qm6tLFQMzeTrlSqbSi7ISCm3BRl0V4UC3w+2Zy7BRdxpdVKAN?=
 =?us-ascii?Q?FPY9KwcBmFEpEYai+TmQRfVIJU2DQi8R8i3meGY5gJDP25rhi1OX987lmqSp?=
 =?us-ascii?Q?qnqUAdaiI8Xx7ZJhYbl8AXsZBngZiqZGThaCpQnGHUcX5hHPtbruMjC+6kDq?=
 =?us-ascii?Q?/bGTzvVZ53xDQ6xLP9Hx9k2YPCQwiAPZHzdasa4vINH0I1gHOM4w8bmIkENu?=
 =?us-ascii?Q?2yfRum0L50yvKhTgQ+Fo0zxXnTUfFIshcyvPD+wX3UzzRnH9c9r5MZ+LFds2?=
 =?us-ascii?Q?vi9Y3qg+8FkQOO7NiFrSrm9Ry96ZKM7nSF0XSIakzRj+SIm+DcnfD6WRY7ZK?=
 =?us-ascii?Q?CR/mji7iaFL5cQ/jPZqeb/YE?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f377c03-c4c0-432c-2e56-08d967ccf884
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 13:33:49.1416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9oRFp1fiZk+Nj7KZ+oupKK0vKO1TTl2lwO1zV/ij5obUnyvBQk8K9skHhNSc60e2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4447
Received-SPF: pass client-ip=40.107.93.122; envelope-from=alxndr@bu.edu;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.89, HK_RANDOM_FROM=0.999, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have some configs for devices such as the AC97 and ES1370 that were
not matching memory-regions correctly, because the configs provided
lowercase names. To resolve these problems and prevent them from
occurring again in the future, convert both the pattern and names to
lower-case, prior to checking for a match.

Suggested-by: Darren Kenny <darren.kenny@oracle.com>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 tests/qtest/fuzz/generic_fuzz.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index 80eb29bd2d..3e8ce29227 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -758,8 +758,13 @@ static int locate_fuzz_memory_regions(Object *child, void *opaque)
 
 static int locate_fuzz_objects(Object *child, void *opaque)
 {
+    GString *type_name;
+    GString *path_name;
     char *pattern = opaque;
-    if (g_pattern_match_simple(pattern, object_get_typename(child))) {
+
+    type_name = g_string_new(object_get_typename(child));
+    g_string_ascii_down(type_name);
+    if (g_pattern_match_simple(pattern, type_name->str)) {
         /* Find and save ptrs to any child MemoryRegions */
         object_child_foreach_recursive(child, locate_fuzz_memory_regions, NULL);
 
@@ -776,8 +781,9 @@ static int locate_fuzz_objects(Object *child, void *opaque)
             g_ptr_array_add(fuzzable_pci_devices, PCI_DEVICE(child));
         }
     } else if (object_dynamic_cast(OBJECT(child), TYPE_MEMORY_REGION)) {
-        if (g_pattern_match_simple(pattern,
-            object_get_canonical_path_component(child))) {
+        path_name = g_string_new(object_get_canonical_path_component(child));
+        g_string_ascii_down(path_name);
+        if (g_pattern_match_simple(pattern, path_name->str)) {
             MemoryRegion *mr;
             mr = MEMORY_REGION(child);
             if ((memory_region_is_ram(mr) ||
@@ -786,7 +792,9 @@ static int locate_fuzz_objects(Object *child, void *opaque)
                 g_hash_table_insert(fuzzable_memoryregions, mr, (gpointer)true);
             }
         }
+        g_string_free(path_name, true);
     }
+    g_string_free(type_name, true);
     return 0;
 }
 
@@ -814,6 +822,7 @@ static void generic_pre_fuzz(QTestState *s)
     MemoryRegion *mr;
     QPCIBus *pcibus;
     char **result;
+    GString *name_pattern;
 
     if (!getenv("QEMU_FUZZ_OBJECTS")) {
         usage();
@@ -843,10 +852,17 @@ static void generic_pre_fuzz(QTestState *s)
 
     result = g_strsplit(getenv("QEMU_FUZZ_OBJECTS"), " ", -1);
     for (int i = 0; result[i] != NULL; i++) {
+        name_pattern = g_string_new(result[i]);
+        /*
+         * Make the pattern lowercase. We do the same for all the MemoryRegion
+         * and Type names so the configs are case-insensitive.
+         */
+        g_string_ascii_down(name_pattern);
         printf("Matching objects by name %s\n", result[i]);
         object_child_foreach_recursive(qdev_get_machine(),
                                     locate_fuzz_objects,
-                                    result[i]);
+                                    name_pattern->str);
+        g_string_free(name_pattern, true);
     }
     g_strfreev(result);
     printf("This process will try to fuzz the following MemoryRegions:\n");
-- 
2.30.2


