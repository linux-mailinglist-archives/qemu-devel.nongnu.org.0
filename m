Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6481B3B5899
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 07:26:21 +0200 (CEST)
Received: from localhost ([::1]:44486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxjmm-00010O-Ep
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 01:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lxjlE-0007Gz-Bz
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 01:24:44 -0400
Received: from mail-bn8nam11on2137.outbound.protection.outlook.com
 ([40.107.236.137]:14944 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lxjlC-0004bu-Ri
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 01:24:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kQ/zjp3vSfHwF0ipu3HNKpXJMvpJxsQ8HlpmlHYYuM5Rm7l9PxlbG1eehYn8I+Fa8d8ZHRZDRVqSqSrqfCEDapkCOgsqIOz+YmSAtVu9uzx6nHvd2eJi7gQVwTxvf9V1TrKwiZOjheuzeUZQvY9mDfIyZb8SXRPMBSTYBUPQThOmSyXuoLwwI2hI568+QBELOVX9wgyUosf8O21qFRSPh0spiclwpm/7uSVoiWUudrOUAdojlFcClC1C4NgG8VYVd4nDc5vLIhg3RmaQX7b/x4ga9bfjuG+QblcO31cgs2THkisVwuZHHc/xLpigx7g15k8yjt/2/eom1j+zswc73w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TiOOzLqrPAsxZ2ttjbAtHFmmNtZovpYHiTwYJlp3SZA=;
 b=HC+e7q05t1ZVtyc4AGMAcYu90yYibRBHUMaPia9SOUXRmmicPyisz41eEjINFEI8ggxcZDTrYceD3WgvfIa5jgGrM9waEhOZh5YOsvtd9XB1Q5ePl7g+ljhLUgZv1Hb/K5uBd4/S1ElE2oAarYQi7tQIkXdNcAloRAB4JdwGDa9n4OylE9k7ors4o3RyDsNSjfPuqI9/0y8/GUbBprKsueff1l1+5ep3AFC1gZ7X7NJNk/cIkhmfBWT9K62Vrue2PkqCuF1IhLbRUxfYYblb+yT8+acU/wwHYVYFn23cPRyDK1DcKOKP+N1Z7NKAXDZ0YTe/L2q6LjDn2NPzGDoTzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TiOOzLqrPAsxZ2ttjbAtHFmmNtZovpYHiTwYJlp3SZA=;
 b=I/iFrVwBQc85o/kTzfsIn4tWEXPHDrZHxg6nQYVfx0lleCL+nnd89kY2YKNlPu/Z20tm/0fNQTiLKmCOeXcOINy6K69PueQdSTRlBo4ohyIfCHJWINr5FqO2vu3qsRhvVjNUKKibITSuYtPpvEEfbSZWBCGqOhz+2cgGgKN1gqo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4446.namprd03.prod.outlook.com (2603:10b6:805:f6::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Mon, 28 Jun
 2021 05:24:07 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f%3]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 05:24:07 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/3] fuzz: make object-name matching case-insensitive
Date: Mon, 28 Jun 2021 01:23:49 -0400
Message-Id: <20210628052349.113262-4-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210628052349.113262-1-alxndr@bu.edu>
References: <20210628052349.113262-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: BL0PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:208:91::23) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BL0PR05CA0013.namprd05.prod.outlook.com (2603:10b6:208:91::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.12 via Frontend Transport; Mon, 28 Jun 2021 05:24:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63a2265d-4c7f-4f28-9bc4-08d939f4f3af
X-MS-TrafficTypeDiagnostic: SN6PR03MB4446:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB4446ADCA3D40B8DF8E553CDEBA039@SN6PR03MB4446.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:323;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4M7Rp2WfIpWdbrWoqHSE/QIM7F6pfxZqgZAHQq3E1Thp6r9I/3ZKVBKxOxqARNO/+9Ct+CU6Qlv+BkaUtlZYB9r0Un0BRqVJSaHSjGv8RJJPxJ1BC5RBHj4AVuEr1jznlkFXkMPLQfFehHNXcALYtC2ilzyfHYBa0exCETqcKm0b7sWLUWgvL7ZmweAkYBRcti5Q7SxPdoABkt44fW3Z3OxMps7a5m7nTX7bMnERIixkTzcfkKq6yB9IwuO9uD3NN1qL2uETug4Fofhp+TDVug1qbLNHWfUb+Qgg3CH/o/o7s+rFBsLYhSKXbnpcLSfIgF6t1aF55OK0oUTsu8PFUdVNIUL3LMp2p8p7SljSYFJtt+ukITv6riqwuVZ5N7Wk99hMox/GEa5cEHg8u2CWMCIwSygDDbZTsfOFkV5ZqW6NMX6pVOjz/nPC7+zBRhsejmXssRDpT6styirzkC88D0q0MSndL4Lgvrfk0fTlFAINW2PfeGmzUYraPIC3WYnFT+3gyvQgTfBcfPbR8yBOhb5tumQQTNSKOUwloFo/b3KERxHDZzm7K3yJbF8Xj7fol0/tZr7HjXRE1nLwrb+OjidPpqkJcDR68nbtWp0nM1wjk+vNGWNVWLtR7XHraqvjRBYa/IvmJ5r4lZ7jSBW76w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(376002)(136003)(39860400002)(86362001)(16526019)(26005)(6916009)(52116002)(8676002)(786003)(2906002)(186003)(6512007)(4326008)(2616005)(36756003)(83380400001)(38100700002)(1076003)(956004)(316002)(6666004)(478600001)(8936002)(6506007)(38350700002)(6486002)(66556008)(66476007)(5660300002)(75432002)(66946007)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7eNX7R+l3GrSLwyavJDM97QRqEa0Y4K8k7I0muwzBuiliNeZ+CZWSDD29rMR?=
 =?us-ascii?Q?wkoQwzetsdK/7KsrZcb+MZEMomo2T63r19QMwlzc7uSqgQnw/XZGC8Sfapru?=
 =?us-ascii?Q?xrHk+fB6PiiJyXX1sO7z1KkpvCIsCXm3SZXZifbZHuHll1ftjeBTLadLP5r5?=
 =?us-ascii?Q?0jaK5gSdUFkZDkFkjLHtCWTeuHaKaxPENqaq9VPrSiaJKB8x4zVsXnKWXQ6n?=
 =?us-ascii?Q?8aGAjmpGLFkkctnSIteHGYEopVA8z9SodOD2IPz+67TtYH5WvZZbhEvRUSu6?=
 =?us-ascii?Q?irrc5D311SoNQLnBcXGwk4OMtVtaWrTAWn7Fr5+Krhaa9JujK91fG6QELXX0?=
 =?us-ascii?Q?GI8HfyCNmjBcuUVIyYkge+OMxpi9EhDUUcSRFrJsVsGX/Kiw4VqBJj8Yuxl9?=
 =?us-ascii?Q?mSZSd/9H91j3uDY19YfpKtREM1hJTbulDcnsHZb4G/D/Agl8UrThoJuXP4cy?=
 =?us-ascii?Q?r/By0PvOuJjYwysTP5lbc7lfmCF+pnSbfUFjkhLFCL75RwON96yZv3grXCfW?=
 =?us-ascii?Q?iH3l6K2CZoD2lN2eWPdoX+bTnqgBdJV5gu2Sogke55j3hjrmjl2CnEP7vCBp?=
 =?us-ascii?Q?xTWAgjUmhAmPrGL7N+cnR2Z7cL3l0MySzthFd63HC+mKKW1XG9Gvd8+cu5VL?=
 =?us-ascii?Q?pJV337xXXqNziJQR1N+EtFE9SkXHQfqDaVOPslxyTrgFV0V9ohdJQJk29CfO?=
 =?us-ascii?Q?1SpGlFRFGJ6X3khGY8HJkTG51cbI6nlQkoBMeORRJhjA735VbQqWbWBv26E9?=
 =?us-ascii?Q?rTj+Iaizy1Ew5ZT3SwQiImg2aLZEnijxBN9XsA2A/DPQ0Vh+MhnEu7ed/EYs?=
 =?us-ascii?Q?eNRnXn7yOghbCXO4ctolIfG445yJ12ntglB254H9dgQLihjtYQ0djphXxX+j?=
 =?us-ascii?Q?VVb+DYTRo3fc6so547a5KwU2AcMIUwWKIDbFBvk9FUnIaqd0WSkrfjfRjc3g?=
 =?us-ascii?Q?MW5NmwfxLls9k5G+YlLHwV4Pq6QTyjFBqszGR3P0tJEcieFB6ZfW08POFW1j?=
 =?us-ascii?Q?6K7tPIdjBgq0eoTodWLAlSSyN+6Y/A8ywBGWO7fmchS4sM6EzVrC0F1+6Bdb?=
 =?us-ascii?Q?WsPlDUAwm0ak0v7a6nL7av9tc/EJNg3Js90tdw2+PAQWPdUXBhgCk5Lu5KAG?=
 =?us-ascii?Q?YBznPiHRdn2Hx3QwIBEgIh2h5mPVDdVZiBwlSP1N04yB/kItk0armSd9jDHP?=
 =?us-ascii?Q?syE5tizLlaxGlehe4xlgnvTigzvzY/NRwZADb+UlcEl+pw0BdIcPLEIXz/Qn?=
 =?us-ascii?Q?hFuA0kuBip2OELO/C0rpatnUX+5S26nyl3YwttIbGXcRZhYomtIdIvg/2Hlw?=
 =?us-ascii?Q?IVF5CtI1J+8fylv4l1l3OOFl?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 63a2265d-4c7f-4f28-9bc4-08d939f4f3af
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 05:24:07.4340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZlyReebLG/kc7ZAvWC/fkJ/CIe9xsZ7DOndSjfYsidj6cTQpRGbEJyK9tvPffpze
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4446
Received-SPF: pass client-ip=40.107.236.137; envelope-from=alxndr@bu.edu;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.998,
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
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 darren.kenny@oracle.com, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have some configs for devices such as the AC97 and ES1370 that were
not matching memory-regions correctly, because the configs provided
lowercase names. To resolve these problems and prevent them from
occurring again in the future, convert both the pattern and names to
lower-case, prior to checking for a match.

Suggested-by: Darren Kenny <darren.kenny@oracle.com>
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 tests/qtest/fuzz/generic_fuzz.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index 71d36e8f6f..0695a349b2 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -751,8 +751,13 @@ static int locate_fuzz_memory_regions(Object *child, void *opaque)
 
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
 
@@ -769,8 +774,9 @@ static int locate_fuzz_objects(Object *child, void *opaque)
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
@@ -779,7 +785,9 @@ static int locate_fuzz_objects(Object *child, void *opaque)
                 g_hash_table_insert(fuzzable_memoryregions, mr, (gpointer)true);
             }
         }
+        g_string_free(path_name, true);
     }
+    g_string_free(type_name, true);
     return 0;
 }
 
@@ -807,6 +815,7 @@ static void generic_pre_fuzz(QTestState *s)
     MemoryRegion *mr;
     QPCIBus *pcibus;
     char **result;
+    GString *pattern;
 
     if (!getenv("QEMU_FUZZ_OBJECTS")) {
         usage();
@@ -836,10 +845,17 @@ static void generic_pre_fuzz(QTestState *s)
 
     result = g_strsplit(getenv("QEMU_FUZZ_OBJECTS"), " ", -1);
     for (int i = 0; result[i] != NULL; i++) {
+        pattern = g_string_new(result[i]);
+        /*
+         * Make the pattern lowercase. We do the same for all the MemoryRegion
+         * and Type names so the configs are case-insensitive.
+         */
+        g_string_ascii_down(pattern);
         printf("Matching objects by name %s\n", result[i]);
         object_child_foreach_recursive(qdev_get_machine(),
                                     locate_fuzz_objects,
-                                    result[i]);
+                                    pattern->str);
+        g_string_free(pattern, true);
     }
     g_strfreev(result);
     printf("This process will try to fuzz the following MemoryRegions:\n");
-- 
2.28.0


