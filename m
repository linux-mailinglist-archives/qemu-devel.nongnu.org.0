Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A8F3B7C2E
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 05:44:38 +0200 (CEST)
Received: from localhost ([::1]:36402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyR9R-0006df-3a
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 23:44:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lyR7D-0002MS-4e
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 23:42:19 -0400
Received: from mail-mw2nam10on2132.outbound.protection.outlook.com
 ([40.107.94.132]:5024 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lyR7B-0007HD-AZ
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 23:42:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GuTTDwcB97Sj7rMeZjdKQTuSqJlZJj2g3OLAfas2EjdShR2PyRPRt42QgLQvocXwDgK3c/f7R6O95/Zwno3J+AQBH+r5nh094VuIE3BaFC6H2ow2DA+LNSUE7STMAz9Fj/a411VIHAfrdkfqm/TtJsoN2M0Q2hjlfXNevdrb4kBXc4IB2b0KkL7iZXWLt+jSiSgNphlmGimGVhlcYYD/PMrKdOc1L/+nQ64v1rwAvLXVph+ojgWomP3ihSZ04Al6Dx0N2HhqMwbbL2GlCVnUJPfeZask3zkL9OQp0J4oAd4jP7prFmsUd6ViF14gBIQjqn4qFNRZvjLsQFWSs9FS8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wqQYQhMm2XGsqZdWKbgj4vRr5Whd8H0devDPtxIuCyQ=;
 b=VvQ0HBXdGY2sDCcO/wrP04RuhMj+qd9jUGL4Kdr9IN8flau1q25CNqhf0egyweczmXIKoz1hvNXAdbewe11RUPLHxjBdrIzUnIwxAkgwfCrM9Ejuh44kqFsmBLOsI6a+iPd7u/4Y5U/xYiu7HHyTxsKKOSdLKoh7q5WuLIpZDWjB3xLwgEXO5+uudZG6whMIheMr02OKyh9UConIUB4i1LdnDiKSB6wcHHhVB1vsUsWKyHWkMrtU1THpqlTnnEWiR0x6jHFy3n0F30Nu8aR7d2DhlSdYKjnRYQGYycye3q2YA+vNv15pQY/MPIv9yGztzmyk+mvUOQzEjPwbsOJAsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wqQYQhMm2XGsqZdWKbgj4vRr5Whd8H0devDPtxIuCyQ=;
 b=maJnehOWmPqfz0VuZepjWv5apxQA38HWIeCtgwcRMZEV38EdxJJcumnVS2FNjeCo9moMyXP0+QKgHBfAv9Zr5xC9NpjYCAX0ZWRwUrisJfxzDkx4ZZrQE6qwuCZq0Q0Nv166bbbNsVw8wkh6yFl3CtW0NsD0DtDDuVHUxTAABvo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5817.namprd03.prod.outlook.com (2603:10b6:806:11d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.21; Wed, 30 Jun
 2021 03:41:38 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f%3]) with mapi id 15.20.4264.027; Wed, 30 Jun 2021
 03:41:38 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 3/3] fuzz: make object-name matching case-insensitive
Date: Tue, 29 Jun 2021 23:41:24 -0400
Message-Id: <20210630034124.222689-4-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210630034124.222689-1-alxndr@bu.edu>
References: <20210630034124.222689-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR16CA0063.namprd16.prod.outlook.com
 (2603:10b6:208:234::32) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR16CA0063.namprd16.prod.outlook.com (2603:10b6:208:234::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.21 via Frontend
 Transport; Wed, 30 Jun 2021 03:41:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0fb3ed12-8051-498a-6f79-08d93b78f796
X-MS-TrafficTypeDiagnostic: SA2PR03MB5817:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB581765B9BBF1021FEAF30638BA019@SA2PR03MB5817.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:323;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ivDXObKJXRXVgIRtiAWGnm8Z6+8LBcY3u+Y4BcQ44a7rEyNMC2oI53HD0VP3Bm/wc7T9nFPrzft4H6rlHSgu8xsyTFa26gHlMJFb6XUBYh0c/+Lqp9wwka7sijdP1zxrQxdr9u28U8aUVNyZLm06Xj6umi76B3UHLl9wDkMImr+XDhq1vVKCHNKgSLOym/zaf3t5IoCb02gBlZpqk0coOVAeQnZZHjC5imXVx7H+6ghcqWYGFqbMz+AgqsBidQm9X1jqOP3bIEs6478lfcqXXVTfQqrdKFFqD7gHKUGnHoyuWSwTZcAYUVTcS+1KT48JuHvzb0KRhVBUJcj4zZGUN/qzuSeXJiAzpsYttli92Q8Ri5Y4QG/l5B+ADnSDup2JVyKJ5tzfPvd+NKj2Q3XQkl79g0zIacs4DANntxRARU+5ybTlvYBU7+8986PLrsjzcB8TW1ZkWP5wJ3KzyZ/sOjZbog8sZzeJv4PCPXk4yLnjSjBEmA2KoQPHKLCIleMRzVk/33UP7T1BF9bBqGXwpbl8zka87S7wgJBgnvdgm8PbI6hfsHH8gxqVrgh5qUlJCd/1N90YQZEfTxGMiMKSHvrPdj1mTVAQael+AlocyOrr+NymH7FltAx/keerA8cyO75l9zGypVg/hLlGc2RgDoCvX7o/Sy3V1hvxSPY2e669ssmx0K2dFuALCZp88OrY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(136003)(396003)(376002)(366004)(956004)(2616005)(66946007)(66476007)(1076003)(66556008)(26005)(478600001)(16526019)(38100700002)(6916009)(38350700002)(6486002)(8936002)(8676002)(6666004)(186003)(6506007)(36756003)(52116002)(83380400001)(4326008)(6512007)(786003)(316002)(54906003)(2906002)(86362001)(5660300002)(75432002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LcF8Y28rL2tOrnJ8MIFlp1Pzg+fsGdASPHtGKqGT2II3AbsX1I1Ru8+ZUb9U?=
 =?us-ascii?Q?7dBW1bY2p/MdxMtZ6Xk3cAirX5nArJmu4ITFKwKCQbIF+a0KfTxxFfUQVtr8?=
 =?us-ascii?Q?kLT9VG50FyWCnEnmeynn0wRfMspinWzqlikpeWuCLNbaQg4jbARHinMIH5bl?=
 =?us-ascii?Q?FNiX1pQ62l3XY4VwWqpcOBAhySE4oBXxLXIok+93cyfpDaWVTwCl1yKE+4Q/?=
 =?us-ascii?Q?q2EBZ8gU8GQwqwcm3+fiP4TP34wVWGqh3KtQ+r8SD3FGrWlCW+660GGQwHDD?=
 =?us-ascii?Q?d2heKw9+Ya47iuekRpjHA999oTDrKb7nVSeDv8g/8OTf18SZrvYA2wv7GxU4?=
 =?us-ascii?Q?r8S8T+HQjfVfpoETcxT/jQr7hfl2TSgt7fHFYnmWoTu8DSGaP1rA46rYph/1?=
 =?us-ascii?Q?Jx+yUh4/ymtk/l14Kyo7be5pQXwqTr89Ry6nLS+oMGDe7sBF5AJBPmvomX/l?=
 =?us-ascii?Q?v83INODIyX0RzlTFqWuAbKeWsyw3q0cYTg9EEnbocNzOgtuEaJoPMWD/rn0F?=
 =?us-ascii?Q?P2f1VaqZSxzP169inFqJwdTJsE6E63mfyhmmRRlgV7fQ7V/r0WfVF5n4Mk3B?=
 =?us-ascii?Q?aFqTEaTVM4nrYi5ZsOqN5V3dh6YCXl/uj6zSsN6USh+WgjpIE+cS+DnCdFyd?=
 =?us-ascii?Q?KLwm7G/rE2EGRl2RyhmboG6F1iggPvBxlgHCgGM37VecgEopsg1/kRe0VgZt?=
 =?us-ascii?Q?JVA2qAC/P61U+6LVasGZZXQP/+VxvrR+Fh75ym8Nf4GGabrKQYv2WevelLC9?=
 =?us-ascii?Q?g28xZiKLSgyxf5W4z3P/86diiFwqjsUAq+aBdEIBueePsbAoDiCkRiwdYJUv?=
 =?us-ascii?Q?sD0Mcmi49GPBauR5zwqcziTHggnb4jQXH7qwigox+kjfgAXsWMSJc6kW9L15?=
 =?us-ascii?Q?cYHXBbq2S9ys1cMScQhWPnmQUtR2n0w5e3CnatBw2o3w27L9pvxuUniqEu8s?=
 =?us-ascii?Q?C2Q9D2E3OXtUPtRA2651Jx5EwFtXNfWY+vMcxxbChJRZIMMumwic9SeydXBk?=
 =?us-ascii?Q?eNIzhXBHixYKt0rE4Yo5Z824Q5V3l6/u/2lyZFB8+9/J6K/FV5x3IHE4yPZY?=
 =?us-ascii?Q?2BMvkIeF60Y6d7kFkgdddUTFkM/OXKh0F1L6/p2nKw0tNJanZrJ1sf1gaiiB?=
 =?us-ascii?Q?JOC3kBBxmkSmlIM28EDQg7Ytgz6xkOQdY+wevqY7+Fs6Rz08bPL28vFLGfM6?=
 =?us-ascii?Q?uSXMeOCZonFQUVjwcuE9b4SPR8t2EXfYlnOQtjjT9A2/BI6df+ZnWmdmNBLc?=
 =?us-ascii?Q?3VWb4zsaoCDwpdaURxhxjrTlDZjIzVWogg4I/IBCaSIFWPaUZZmk5meZWB8s?=
 =?us-ascii?Q?F7GTByqY8FHZk/ssEY4cEA/0?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fb3ed12-8051-498a-6f79-08d93b78f796
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2021 03:41:38.7280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MntL2JhiH6391ciC59fOS12PkUrjfZcmXbX3BNkYtdTJ4l7Y80hsmPNWTtcr8ixg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5817
Received-SPF: pass client-ip=40.107.94.132; envelope-from=alxndr@bu.edu;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
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
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 tests/qtest/fuzz/generic_fuzz.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index 43f9011626..59be7219de 100644
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
+    GString *name_pattern;
 
     if (!getenv("QEMU_FUZZ_OBJECTS")) {
         usage();
@@ -836,10 +845,17 @@ static void generic_pre_fuzz(QTestState *s)
 
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


