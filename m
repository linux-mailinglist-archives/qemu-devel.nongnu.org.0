Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4992F3F763D
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:45:46 +0200 (CEST)
Received: from localhost ([::1]:40706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mItDo-0003Mm-BY
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:45:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mItB8-0005hI-D8
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:42:54 -0400
Received: from mail-bn8nam11on2096.outbound.protection.outlook.com
 ([40.107.236.96]:64735 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mItB6-0000MJ-Lu
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:42:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rmz7RCgJeEmpkEwCZi+5DwM22rY2i/ubcoNG9VxNt+W37tb69MLRNGI24EiM6Ce7sfOmoJm3GHUVLTjfQ9IAhheBsCiS/cS88J8xariON3U5b3hpRpl4unJZMhc4Z/ipslptXIR3gLZrSqFdjxPvW4J7pTxR7V4evVkocOu7qWReuoxgsbrZVt+GRYiiHSspnXsX9JCJOwNDu0aFnuECYgClKiwP+XqpVMAilFiAZMO920xuOXQQXoJLlXTy8BwoC8QK7aGICCHlil0Evg4Q1+udjxG/pQUFUoOim5UM4c8JIe5IR+wNJkY5yim+Cp2WeEqRvBm7bZdqbaTtPMJLQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ntD0CBll2MvnNR62ARlgC7X4fKZR9uGeVPZG4F+7zU=;
 b=KFOAvJaPFVRMrxHGYnhRkYL2z4oUzfzh6jiPZF88ZMDPQtTz5TLgRTH8s4jg/gc9vZn/uIrGmehKv0Um2yoN5FgBNMda5pyxzcNZS0gWMUBX5eXYbsqtNpuJMtywIVTCx5sm6BvZ2CAJPGujt9jwXqpmC1OOv00JqL06uZOjGfFFIleypF85MgSKidJ4TbakN4mj4f7vDv6z6YssCImKq1DndaaJhfQeNDb1jnPjotoNsWSakF1jwWobXwYhB2J2RUoUkHZIFSxmiJaq+m6Nxes3fX28lL+B9kfKkY1U928KsZTBnBq4QY0yzAAoB/K/MlQiLbasjOPFfJTdazinzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ntD0CBll2MvnNR62ARlgC7X4fKZR9uGeVPZG4F+7zU=;
 b=nB/6jWc1othsZtsiFPazYB9SQBJOnKKDX7Klj1HWOrjAviKGRddvAiG7amsgC2zE3IhLHCgy/0hT8TT5kOo/JVrxwaWIbsrf/bSH6e3kX58aQEUv6XI6IrlsXFBP42FTyNC8+OFjCr5ulRZnz5zMv09si90Z0+rb86HJZAkHf44=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4446.namprd03.prod.outlook.com (2603:10b6:805:f6::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Wed, 25 Aug
 2021 13:42:49 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139%7]) with mapi id 15.20.4436.025; Wed, 25 Aug 2021
 13:42:49 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PULL v2 3/8] fuzz: make object-name matching case-insensitive
Date: Wed, 25 Aug 2021 09:42:27 -0400
Message-Id: <20210825134232.45074-4-alxndr@bu.edu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210825134232.45074-1-alxndr@bu.edu>
References: <20210825134232.45074-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR15CA0016.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::29) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR15CA0016.namprd15.prod.outlook.com (2603:10b6:208:1b4::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Wed, 25 Aug 2021 13:42:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0dd78d2-bf06-484f-79b1-08d967ce3a9d
X-MS-TrafficTypeDiagnostic: SN6PR03MB4446:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB4446F245F35AF3CC40238797BAC69@SN6PR03MB4446.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:323;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hBaDzlGNaB9VSfck/78xSXHuyGd5hcqTQc3L+L47aYu3SqstdlNQETYI4DpK5IXoIDeQnl8M2lV0IBNWUoEweMDQMSMQTnkfbm6syKQIMXbF7ZNkzby4afGMnOWa23pEFNxb4JPiwxbbre4s13ls/EpPUnQHYEnZTLFibtcPofZkugid+3qTXK5P95coecVpwddrVjEgldPZs+rRrYl0EM8g5uSTS1pvX53S2+dvNg12Nkp2yrswQ7EfTfwDBcFcJvCwCFUmKd8ypfnyizqL8pYcRf8YTloTm1rMOFGFxWiC6A8oSnA/pdnBwic7yb8sbyJvoqXySBEQFu8JKXqtNfW5O/hUFkieZ92D4+RK+r1TmidQYsPmV7OQcsRhC0e9tnZsbD0XNv1/AbPvEf30YnKg7VkD8jgV19KNvhaTHl0YrLy9pQ9D+DXrhAw/98cvewRuSWo8EWF5IYS1WELWTbfbKGSh1HQhoWE6u9QYYALd1h0fGF4/LjeehmV0pln8U0V/ZzrSGnAIuhj1Ef5PnqKRqGX/6hgJSbdvIA+uOLTfYbWWiyUR7qCdZIj2fWzwKamZCwVf//Qvd5vtH3Wl4hQ1IXFkeR+ZZPAZnS4OYB9XirFGIXst/Zk0+TrqG8CovSDAPZyKmTEz1YEyGfNX773r8DXwVqMRjIrGFjFCsQJBQMBDyWX0GOHC2igTvzwO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(366004)(136003)(396003)(346002)(4326008)(6506007)(86362001)(52116002)(6512007)(6666004)(75432002)(1076003)(2906002)(36756003)(956004)(2616005)(8936002)(38100700002)(316002)(786003)(38350700002)(54906003)(83380400001)(26005)(6486002)(5660300002)(186003)(66946007)(66476007)(66556008)(478600001)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pwHPzT5Trv+SwghWbpYrv1n3OmqLlgtEaByMRkLdfunGM2NEVR6k4JPACIHm?=
 =?us-ascii?Q?cL1X+jYnLrpZ1g6hTYbd0iZFpNoainj/lXZ1WbVTIb/ZFlaSQ+0WVyW2gqcj?=
 =?us-ascii?Q?HTqzHH5Hi4fNEIoHhA9L10/CwCAkunUn+t9jCHGoCjU4ePGOcUK2s11/2kcB?=
 =?us-ascii?Q?oV/n/n+3XJf+23Gda19QGVgQYkedLSTP1ry7GFdik6AAJVr3CQgipwSBX3eM?=
 =?us-ascii?Q?EUgmrjniquZ/XOhoPKdYJYEkGck7iqTA/+I/gyKh9HOVzcBr6ekT35I5GMWZ?=
 =?us-ascii?Q?AZTl/K8t9ncnAfvt/mvWvmM7Ia2AnLG+vQPs5guEsQr9Lo3e89eri4kIQOmG?=
 =?us-ascii?Q?qDWcb9IeXe/bmT1m9yHthxTiHSR/5HYpUOLE6QQeGkY0Q/nw8au04s1mzqdC?=
 =?us-ascii?Q?spCDi5ajI3n/ps5Mbrl3dyatWIFdDG3qs/7uJV21rR62uvzwI/IJx6LY0jeK?=
 =?us-ascii?Q?ogt9ANFBeqEP91O4bINix0535EeeZGqf78tCJIqvZ0pUPV6qANbRZArRJd+f?=
 =?us-ascii?Q?laFBDF3ZhENoFrzxQ7jsRNCBdfHmyjejdAX0L6IZFmEuMHqaOlX3tSEseoMO?=
 =?us-ascii?Q?PpqjSTPJZamScyyY64jVap9O49i8siDiHt1KPcbwHlIOt78jPfR6qCnKiFXB?=
 =?us-ascii?Q?JJWyFbK+X+/rLiBrIVvsd5s8BOiabCYCdBOqxsmKx+FUPs4igQD6cWSEITuP?=
 =?us-ascii?Q?hHAyPI4QhXoGvfbYMIBLB5lgVMw135ncH3wXeGeDGagzJ8F02Wxgme7gnJXT?=
 =?us-ascii?Q?DLxMtFMiMP37HaYFj2v0HYxUFHYgVWpKg87bteQBaumdOltlg4g3+iOIMMEf?=
 =?us-ascii?Q?Z5dg4SJIro6mDETIf/Tot4B1DIaZ8r4TsOzTkZTpAqt8g0TpgYbyWrs4FyLz?=
 =?us-ascii?Q?eEU5RV2BOi0yo0E+DcfQ4JVsfDLZOSdTRcMQxtS7GN5YjuiFZv3RkLrNvToK?=
 =?us-ascii?Q?VuxULf22lSn0xr2Rq4rCEXytJe6s2SAqqKRRJp9szx//hNeqwn9iUo6CZ9+2?=
 =?us-ascii?Q?tZDCZ3vIer5OxAZUF4LPdbTUARlIoxP/w45xnHxVeRMtKumIr4PxnE++J/CC?=
 =?us-ascii?Q?6tl559ZCXYaiU0v2cT2Tjey2g9jlvEBgdWPnG64hiTNu4jLYbkoxp85mNvqm?=
 =?us-ascii?Q?bDrW8Mo5r4h5fyw51lTCbTpVk/GghONnBRxk8zPVOw+g/Tw7wd7dZY2JJZ1K?=
 =?us-ascii?Q?IcL+KwrmDBj46GiAgFOHlgLJtZ2pnrnCx7brMAb+4yrZ7RTruhx3/Nn+AfF0?=
 =?us-ascii?Q?GqWnAEkkhRgWDVy+TRhQUxgX/7ZbF3OmHgyJZa8PI1fkCpdW6W3vHQjynxRK?=
 =?us-ascii?Q?H/aw8ejOYINX9oDEnMfObf8U?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: e0dd78d2-bf06-484f-79b1-08d967ce3a9d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 13:42:49.5337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BFTTzsWvaloWm7ziO/PA8Bm9wKTzvM3kDeqWgi7xgaYyKquHdWtIBAstuic2JcyY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4446
Received-SPF: pass client-ip=40.107.236.96; envelope-from=alxndr@bu.edu;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>
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


