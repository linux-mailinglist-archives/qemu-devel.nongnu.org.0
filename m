Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D88B3C72C2
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 17:03:46 +0200 (CEST)
Received: from localhost ([::1]:54244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Jwn-0000cD-KG
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 11:03:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1m3Ju7-0005a5-5J
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:00:59 -0400
Received: from mail-dm6nam11on2096.outbound.protection.outlook.com
 ([40.107.223.96]:35521 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1m3Ju5-0002ks-HG
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:00:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KBgGaKb3JoNSHeNPBZs8XQhmqP5Sn6t5r72n85t4Q8GYLWDyC/kiyFq2KEWHVHHekLvFxNqDiktT3rtIte5XNhPAxoGoXILcHUZ0Ew2YCDT7a9M1A31a0ALTV22vOnWU9N5KvwIqD/TEdKtIUmSRGTOic7etnVre/+wFlczDf7tm4K7Ma1sQ4pHRtB5TUuKBrc/JDpx+aYhcpcvqSBxU5Uj/aWbDBm99e7E/DA0kY1wTXKkIj8Q5r/LO+65kuzrvsR6GLWEE07f/yihjXPBR54GgoJLUgIPZMPoVk/0pak/4mIupQc76EaYjGYsOgTuqAZ8J784ZyhUFL40l/BOVqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STAop5EeQRWZdjaIIcDmyEZvZ2r6HOsIObiX6/i4yh0=;
 b=EHHmnDxRT8a3FvJ/Ctq7jSJvF6bk0jsqVHXeozBRSPlIYHEFss9QxAg3afpR8BYwKwSYUMYyzlZH7G0M0Y/YAHDMGE9F0rdQmaB3HfQ/8Q6WG1Fjhrhb8cO11SwBbxYkVrNfY+3JD0/A4h0EiNYuwkLWwkgkuP2awSFZnonucEKREDdSg0kKlcYFMsWcBqk+d4TX4ByEynvE2XhNoGKsrE0JvcK/EOz+3JC5Fd8bSeP58BMPTbVx9M4J7ULpeOwMAPf8JGgCzwASoVp0CwDwLr5eeQcyee7orsZE1Kl1ZaXMOJCGta28vM+0bg2IEV+qCjO7PVEh/rN/h0PtIAWh0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STAop5EeQRWZdjaIIcDmyEZvZ2r6HOsIObiX6/i4yh0=;
 b=ukJ+By0V69CnSa9y0s9Mn5837eAOPUZXXjLtaAvADEMc/ZLeuC7Ws8RTmYV1ivLQ1EMlIM26dhonU/1fJChXJy2Aot3nf3oAnsNz2pMsmMEXFgZnwgppQO/Y4h4oGTzKnSn/8HnLCYrBcBkO6y5qMpr6cM5A464goX/45V6+v2A=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5722.namprd03.prod.outlook.com (2603:10b6:806:110::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Tue, 13 Jul
 2021 15:00:50 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f%3]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 15:00:50 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL v2 3/4] fuzz: make object-name matching case-insensitive
Date: Tue, 13 Jul 2021 11:00:36 -0400
Message-Id: <20210713150037.9297-4-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210713150037.9297-1-alxndr@bu.edu>
References: <20210713150037.9297-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR11CA0002.namprd11.prod.outlook.com
 (2603:10b6:208:23b::7) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR11CA0002.namprd11.prod.outlook.com (2603:10b6:208:23b::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Tue, 13 Jul 2021 15:00:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae5de95c-c49f-48f7-ad90-08d9460f00d8
X-MS-TrafficTypeDiagnostic: SA2PR03MB5722:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB5722DDEF3524B753126049E3BA149@SA2PR03MB5722.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:323;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u0u3gRQFruExlteKbQIR4sHJs72yA/le2w1fAZ9hA8IfObbvgA3wAiKmadb/cDv1XzOa5h7LzCm4/gfndqn3g/kfN+Naibz8roJlU/cqRD9hFKZU+hPH2ml9/jfgnVXtUftojQsobms7Bol6IFfws3ElMAalWMhIhiamiNnlZ13EDxt2hpmpulOcCJJc69+FPf3mjYshXDb9Jg2RBR7Yh1g7Pg86DgmZCJAh/zZYovMxc4E1mFCQCAuL7mYnypIknzG2wTYdAKUjwSYGQlL95YJn+BWR3Uv+2QuW1V4pGUbqBeVfr/qd6gGmNAwe+R8+3w2sOcnGtoPa7B8sue5jb01T2GlcDLVd1/fVtlwd+e5YimUf0VIz+r4k3EzrWn61lem/41TWgQrfDwOR2R2SxTnX8SxActY10pDSVQKktOtjVtY99DYm6w6eR9d4oJiVC3tEjXzpBXG02MQDAuCwEDV4M45BAwD/oy78+8zUj6HFiI44GKD30bnTmz5hLcnS/cUr4Odj6CtRzGgaoLQlxKoAS3Oc+kHxGHMTlcqgnrDTATNLBIid5YCExl8dvdCYW/gHn2zq8RL8O8dUdTG688+Lv/auRqcDUT3+Z9pQwjpYQD6AG/BHWEKXebWWYaf59isv5PXNcLBf0CPw2XaWfozIcIKwW2pu9cfrLoidrDp/CSQaVvu0tzQjhpLdIBJY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(366004)(136003)(396003)(346002)(6916009)(2906002)(1076003)(66946007)(186003)(83380400001)(6666004)(52116002)(86362001)(66476007)(75432002)(26005)(8936002)(36756003)(8676002)(478600001)(66556008)(2616005)(5660300002)(4326008)(6486002)(54906003)(6506007)(38100700002)(316002)(38350700002)(956004)(786003)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A56MoeZnQ8JtmyY4QfibqAUWevyDpIYLHanMHslXfjCt6N0eoQG2VhS2YSRl?=
 =?us-ascii?Q?Kjj5ngn/hIlOi4SGkw/bWnldskVP/nQNGNYfml7jK0kmcJeMb96pEt8OmhVS?=
 =?us-ascii?Q?b/P/uyvqFKUY/azmDTP7+JfLZRDPQclc6fT6mAvt1EDQoNFOOkId0z6S4mrj?=
 =?us-ascii?Q?+Ah+Xu05KLsGXqFH3vXtnTrGAX8EUQGP6hAJPnJR3mYmiIz/Vv4kGuKOTjlK?=
 =?us-ascii?Q?0+EdvWJgLE/qlHWycle8va70xAFysYPx+skXJmv7HIbHuS9weLbSmsEsxMMc?=
 =?us-ascii?Q?+3VIAembNAIVBJaXroKi1eIrtIiAr8bTdv8tIzMcN4txunR/i42LRRCvHxIO?=
 =?us-ascii?Q?vj4clIevegDZyCmRNbJBBfwJcRpsoOPIGYy0EOGXLRj8rKNqdBTUqKgRMJzI?=
 =?us-ascii?Q?kxsSsGKsWuAm5uRUgrDU498xWtzTDHqF1qWUWcFJqyZ7Gsy5N3bpcGHINj/Y?=
 =?us-ascii?Q?NEI+nED63JJ25RFQFgEDG2AMhsWJUUeDDVfw9eeqgJg+8vi+GK5GCSrh8zUE?=
 =?us-ascii?Q?hWjJ+WHM642izYoDSflqyyVDec5DxAKe5VdcPfNAQOX8pYA9GDJuBWYwRyAK?=
 =?us-ascii?Q?v4WKO8w0LORRw2krHciuvSWm/nUm1hB56mQEed6OiL3LmDq07gRCc+uFvM9z?=
 =?us-ascii?Q?V72JXlWwh5iHD4akxzHQV2AJ1JOaBq4n43uBXBPAqcitjih+08ZvCrCd6fHk?=
 =?us-ascii?Q?4diQeRHbS94zajHAClspOIStvpK59e6ti89QCHnxA4GqXr++rT/ZJ5YWRRyL?=
 =?us-ascii?Q?HHtyeUJf/Kc1FSybvuWSiyvEKRueoi3rPFkgCS3xnOVH7+YRTYzvjNdk8PAw?=
 =?us-ascii?Q?dMDl/z9LuKztlej1XP8XG3fZSmgycNRAkf+xhcYHii8yl19kdsHYFMysugKp?=
 =?us-ascii?Q?MOk/37lJm1ODtwvUJE621N/DXnxsQHIgE0jIVHNZATSdEu91/yJoPBnma7oi?=
 =?us-ascii?Q?pqqqStNBrpSGI/8KPvRLQBhXQEyF56yAuWU5mYoKYgjAB4NgBCr+X3TZ+Wtz?=
 =?us-ascii?Q?5S8+dJd7quUA/xQJmgh0Xo3pmKneal742kAGYaJEmbXG0IfdvRaoOMG16D/D?=
 =?us-ascii?Q?JMKlJXp8EsiZMyPBSbYIJx9EO9ANaEb/Pt1ZUg3YMM+bGGE/94dzQIB+0aNX?=
 =?us-ascii?Q?1EMtOgjYhkXI4rBfZIfttsffu8uH/8U7ofD19GUs5DZabC8wtr+w+EFzlNvf?=
 =?us-ascii?Q?koQdDwAEqy6jw66gy1je/BbBlTwqsMgasFMY+HCz3afidXYxUZhETFPnIv2l?=
 =?us-ascii?Q?BKKG4DXCegCIGpO9LQzVAVzxxXe15mQwkPNMuhWnLy+5xfRHXdec1zuBYTwU?=
 =?us-ascii?Q?Z6j5oW5rakceakmNBwgeb5e8?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: ae5de95c-c49f-48f7-ad90-08d9460f00d8
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 15:00:50.4718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zUhao0a1TEFfgtH7Ss1IugeAFqwktOwJhyhaIn46dDyShFYJ622b5KNK/FoGqAEK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5722
Received-SPF: pass client-ip=40.107.223.96; envelope-from=alxndr@bu.edu;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Alexander Bulekov <alxndr@bu.edu>
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
2.28.0


