Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8E53FD93D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 14:08:07 +0200 (CEST)
Received: from localhost ([::1]:41970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLP2E-0007Y1-8j
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 08:08:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mLOlO-00075E-1f
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 07:50:42 -0400
Received: from mail-bn7nam10on2134.outbound.protection.outlook.com
 ([40.107.92.134]:37985 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mLOlM-0002UE-Df
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 07:50:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WcD0ycgO/VUGOn5KTs0JOc+Un5zwNHY0ExZQYupKKXTQU5vWAU5NwPDuHk5BxSspB7XgTtBcT6peGUkpmg4oggWKdeCA8JQg5uIk4w+5w54uRhb48/fCYVWhB6rkZvcXQUd/YnNg8MMdkBuq8+sSsZSWBH41UwsZsHZ6nnVGdznDT0Rrn+X3JBAAB28AkqQZCqwRKCPy8M+hgm1HIf7k3QIffAH4FNwM7BnlJ4+8hT89UyCVkJJ7dpe48S3t/L5x1DuuO0IVeuEKfp5lq1vnMf6kJy/Yvrq2BmSKY5najBeeIDafEbOVovPC3BarIxg6jowYwI120IFozxc0IlpmPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ntD0CBll2MvnNR62ARlgC7X4fKZR9uGeVPZG4F+7zU=;
 b=NEqi+5K2aPm6VXAR67mu4zLOYcGUJU163Qcuv6if9YstN90z5rS9zVgDDwcbfokSo68Fvpit5UUgsRjQmBvrjUPO0HtabqALPgINvlYTlGXq1F35u8r5GbU+RwVPm8gWTEQqQg6+BKjHqHMPIF9txy4soNmLbPGmxZdUkeJ80VmsdWZk9tc31wkoMNxANqjuD+E2w2149BrspLMpE4oMbxZR2hrVnQhzCj/kBKL/CIfr5lHvDr0vMc6MB9BkxRywqLL3d52590m/51IJOEM7BOXi579/JU8LsRXd7OOpZBdnVcpiF+gm7aJ3XmfidfkxA2tmrwAsVwUCSrHkvdWt2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ntD0CBll2MvnNR62ARlgC7X4fKZR9uGeVPZG4F+7zU=;
 b=MFNYydXpCBqKGJ45gfuHVrvvxNsX5HtQeqEeKbWAm+wd4xcqCUxreEoJ6AvgRvD2UIryFTfEOSjIfX7cNN7dltqiZZFcyKwcrvXAag1H4cTJzOOU7uXxm8G9mAJTnbyOG40T6CYmII+5b+5HYJZ9ls/0SsHu1QLmL+daZcNcN3Q53TKhddqSNfPXx5a9uHVeIFp1/eUSTSaWQLLsL+BYPMSafngNQxLz/P8E0s0rtIB1iU3t3RtYqxFfhTgZr19S9jYknieAR0ABYiVzS+YQrskNj+HJGWetxs9UFNgPB18MimVubAPxQw6x9sa79Ylpwpely6M33cQbd6EniqMJrA==
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4224.namprd03.prod.outlook.com (2603:10b6:805:ba::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Wed, 1 Sep
 2021 11:50:29 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139%7]) with mapi id 15.20.4457.024; Wed, 1 Sep 2021
 11:50:29 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL v3 3/8] fuzz: make object-name matching case-insensitive
Date: Wed,  1 Sep 2021 07:49:59 -0400
Message-Id: <20210901115004.34768-4-alxndr@bu.edu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210901115004.34768-1-alxndr@bu.edu>
References: <20210901115004.34768-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0328.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::33) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BL1PR13CA0328.namprd13.prod.outlook.com (2603:10b6:208:2c1::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.8 via Frontend
 Transport; Wed, 1 Sep 2021 11:50:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9edaae7-d6b8-4398-6c87-08d96d3eb1cd
X-MS-TrafficTypeDiagnostic: SN6PR03MB4224:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB4224141BD82D122C2D24E78CBACD9@SN6PR03MB4224.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:323;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d+KHe0QRpZKIRlxifFqx694MPx8cLbsd+np2PlOs0cSXs884QaK23UfjmMszVEIQDvPoRthI3YQS9oegDJzOHeEfMUksHPmLg0yBuqqukAa7HSceVmJ2w1IeHDHzDKf7Vh4xECjp0xO66qMxIAfgyFLeGoywYYZRVNj9VDkF7GQD3A+wdS9B7IOALpKqLyRcg1lc4W2KUSs+zq/vGOlSjcf3vNHf70jbHY1ftDSqMApBczAK4mi+kyfBYuUpP9yCtWzWtnerEgnXNQochuORk2Wm2mqrPYAj2WkNA+eo3ELltZfqOg2DXy738rdx8ns+BPqqqXGIKArV3dtlGo31ixUtxio4SFWsbtXdtgFfycMJQYaBkE7m3OexNOPSOXqzJerPZcmLJy9OGtOPAQUDmP2r0SR8WIgvn4fgKhesxSMSg22ueUrArwOMOTtrPVyfYbTJsBborzsyuU7cl5tIpTIdsNHpk9eqO+aLseF9RHEyfh4oCh3EDePv3koQduMnJPhgNccw3wwGT46Ztma5yuM0YCUmNCO0/UFD41R+Fqg4+dDxa3WVP5CBGZHnZp4nCy/Qwai+5/hW/RW8Oe7TkMuXA0d8JiGZhltRU/JmcdHCxyA7OepqGqOTn5IzDRSp1/9pWK/sSVij3mUVycKIztdcASMbtMACT1Rxb/lJp4dPZBwmMORpkVYD465mNja+6G1oDtUrlE9yKA1PFxmmIg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(376002)(366004)(39860400002)(75432002)(8936002)(38100700002)(38350700002)(6486002)(4326008)(52116002)(5660300002)(86362001)(36756003)(956004)(2616005)(2906002)(66476007)(66556008)(54906003)(1076003)(83380400001)(186003)(316002)(6916009)(66946007)(6512007)(6506007)(8676002)(26005)(478600001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v8dsEvEcc/bN1UZhrnRxq13XFl8zhj5IpBzPprCDJUPA0zqn9dyHZOE+yMo4?=
 =?us-ascii?Q?zi1PXbPq6SJzmwyrG8+HAEwgoLrRP9ZgptMnITssebtnEluempzv8LLAyrTf?=
 =?us-ascii?Q?CpIsT+2204dgAaisXgM4D+TF5R+MzK/qx542keUWxYggdY6CGpdls4bfyj3p?=
 =?us-ascii?Q?dOS9pXcUPC07UKQJNpE+WEpZkSQQvXvJ2oEUZmBeneWrWXOJMCToEB57V7+X?=
 =?us-ascii?Q?fD28l09JC+mPUZKRtkKxLcKQaD5GYR8VEsi9V09+HEWrLCuywRtUYjV+YXT3?=
 =?us-ascii?Q?1/5SXLY0FEdEBnK2oFjxo0CzPjwJ7RtY1TNrzM1vrk38L5LYX3Gh5rcAt0Co?=
 =?us-ascii?Q?eu4ALNQMeV6R6e0reWY6p8rv8E6lxeSOeT59tue/rdWaVj8E834c2iUc+OCw?=
 =?us-ascii?Q?O8AxjzczOGaw27SGPqD9ahYO2QZf2k+k/iu9Wnv9bZjrK/MlvNLd7W+sVLMk?=
 =?us-ascii?Q?g2NnJHhbJZv4n/8ZT5D/D3jWiMOHhumVroWTb54DkxCZn9gphptV3utY9zvc?=
 =?us-ascii?Q?3e45oQpifahSTZ/EaztVskOwOEzJMfLOTCM40p0Vt8oWNdCLhf7CHvXfLmfm?=
 =?us-ascii?Q?FTj4t+vmyN5/0tDNB9EfKbZWlhoKa6kQA9nbe+pc7mmkeMkSg+v65Q1Uc/i6?=
 =?us-ascii?Q?5BKR5wVUE7UefWGcs8vC0tcezR9HFXzn0q02cZ1va+RQpu4p8gBRswBpLlUf?=
 =?us-ascii?Q?AZqJc8gkdatQzfonPVk+zqkY9dodBH4LUlhof238sjXTyrfFjzNJ46jjQtpm?=
 =?us-ascii?Q?zZt3nklK1saPkBk7A5gkjN1d47ToYxILCBwsztiEGY5FedtuqcfAenBNFysI?=
 =?us-ascii?Q?fUgOQQxznrVT3gXJRckg0rLYJw/Njw2ORz/GNe55factQnh0rjTKDno8TeEP?=
 =?us-ascii?Q?W94W/rjpz4bhk3xR7hHLUw42m+E1s6QQjsh6njO2FL+cp05t34oaWfLQ3CB5?=
 =?us-ascii?Q?TYmohEn7SiDl4SJWwc2O+wi0oU83qkb9PZTDezsXxXbZW1ogrE2F1VtfQrUb?=
 =?us-ascii?Q?7mZL7inKwzDDGS5GoBiVv9d/Kk2xcrgEWAKf9F3wRPs7pgO6bvigVEn/OPRo?=
 =?us-ascii?Q?lj9oal8ErfjSGySm735JDPZkgkl78gCEtiAgBHoJiMPn8b2L4ZuFez+nqCns?=
 =?us-ascii?Q?Di6IpJeaiQ6fmHo3x6p3k0Ik3pI03N8kEmH7sf526+2vMU4CFNyvB+zH4CKj?=
 =?us-ascii?Q?I/zgDLCKCur7AfMwnnkF7CkggVrOnzqih1SGUrF2wGEwBvybkD3f/YNQnno0?=
 =?us-ascii?Q?sFhMKx3MhGt60EQDoapQmNSxh74WJB197qheIsopc5xtYpf18n96uryfTPJf?=
 =?us-ascii?Q?U3As0xJmAjQXl5tkMQv4Trt2?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: e9edaae7-d6b8-4398-6c87-08d96d3eb1cd
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 11:50:28.9414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p3wcvvw1fzAvNkvseyuTLmZmn0ple8pY0OYUEpnvWXtl3p6l/znjUKc5uo9YDMa/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4224
Received-SPF: pass client-ip=40.107.92.134; envelope-from=alxndr@bu.edu;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.238, HK_RANDOM_FROM=0.999, MSGID_FROM_MTA_HEADER=0.001,
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
Cc: bonzini@redhat.com, peter.maydell@linaro.org,
 Darren Kenny <darren.kenny@oracle.com>, Alexander Bulekov <alxndr@bu.edu>
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


