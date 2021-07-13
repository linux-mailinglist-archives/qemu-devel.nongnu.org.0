Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AF73C69EB
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 07:50:58 +0200 (CEST)
Received: from localhost ([::1]:58616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3BJp-0005SJ-6e
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 01:50:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1m3BIV-0003Nz-FX
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 01:49:35 -0400
Received: from mail-bn8nam11on2099.outbound.protection.outlook.com
 ([40.107.236.99]:46657 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1m3BIU-0007xc-01
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 01:49:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4nHsTB9ZHocQJhMD7FirZyFzYixY5io05z58X+xRaJ56WXYuJ6pArzeCHMtpzOo6L+BTro7TTTovz6r0wMEWre6JZ3Md0uieBA7CokzcEhIBwxtiXvYYqliMajKiM0qe1RSMtmiTZrdDkHzjDcbhKUBEnLv0phk8Lo0JhNdPj5FERePRZKWk0lI0e7rtmugOUkTfr0RtO1o6U9fMDTOBUPquK9PAv8BaJl6S1iJ9KtRu/po8GE3AjxvjTt7oOZOhAq+Jl5C5MjM538O4dmpEMu9ANKsyTWZtN3UMFLbM155jKMUbeLbRIr578pzlMLezj1qBH9VfGL+rKJvAQztFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STAop5EeQRWZdjaIIcDmyEZvZ2r6HOsIObiX6/i4yh0=;
 b=DIVoCGoX1Eqzym+L9NR5lRKsudN0Jn2qX4Vs/cgowpP9nApPnq4oOmHYKYqG8/xiowsEgOCEDYjCsaxBvjSS8ZtmiROQ2Z+7IM8HUVmeWkp+eLxIAzzlDfqt6+GU7wnTzlIPGWD/EHg2oZiwISQHhg08mzbxhHKM3dPleVXupI5EOl8iMg0rCzYCsXSt+n+A8bJ8DgnyocxHVdLcniLM7hQuuDF9jvM5KWrood41Jg1IUEif01N+NwGbYg0tBDLAi2GF4BtqLapByixR+TnRETcpaER8IPZzLBd+1+v5baW8SM8PGXdrYYpwEO8ML/GOCVBQnn3I5TamgE2qdgq7jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STAop5EeQRWZdjaIIcDmyEZvZ2r6HOsIObiX6/i4yh0=;
 b=TphIlzrZkqOiNFMxjlNk7TdObevyCDHGiyIsCruR4dIbIZJ3Ac7hIVnBe/1faDkMnkKXUV3M9RQn3U06h2ztrhqgQSNKN31KjsEyTcFPcw9x3R9hezGV55fyhi0/Amq6QvzhFaQfYekFQTmq/NJxAOEpjr2gBBzz9r7khUuBEGk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN2PR03MB2285.namprd03.prod.outlook.com (2603:10b6:804:d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Tue, 13 Jul
 2021 05:48:57 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f%3]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 05:48:57 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL 3/3] fuzz: make object-name matching case-insensitive
Date: Tue, 13 Jul 2021 01:48:36 -0400
Message-Id: <20210713054836.154421-4-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210713054836.154421-1-alxndr@bu.edu>
References: <20210713054836.154421-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:208:23a::33) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR03CA0028.namprd03.prod.outlook.com (2603:10b6:208:23a::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Tue, 13 Jul 2021 05:48:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46c8ccc6-f8a2-4e77-d38b-08d945c1e829
X-MS-TrafficTypeDiagnostic: SN2PR03MB2285:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN2PR03MB2285D87CA88854853535552EBA149@SN2PR03MB2285.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:323;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sYF1Lc342Gma0uYoXcx7WJhofREJdeo+IZjh02+w6LBz62zS1UlFhHZCzj6BmE72d7SYwdSI/goDx3WNhutfIiriU+B1+VfMB0AXQU8LW7GNgcl15PwEydSFkYED4hva7bTB6+Vrro3X/FxkT/m74vyUhaCa+YXI0kxOwDa6Iy8+CJ99M0YH6XRRVwq+uFmGZzYgXGb4kpB2jWdJqAoJLFr4htcP1jAeCz5od7PJPLIwqiivLDzSioYb3Uly6qCLrza82drNcHN/g4gkbXnhwhIOTF3VViRg8ZpFAo8HF2LbajuEsv2XReihSX8CbB74wf2Pk7MHUzXDmdkSCSLxiphTNsFLlbZgvVj73efD6vqUWRc0YjvI0N7zG6QVFhoAeA0lZ6bBpin5jnZhg7pHEuXVK5eV7YiQt1emcO2Negssp2oDM9ZWRfiewZgH5LQaGfrOaenZfp1pdzAwmssYemCGvDRGeD2DlLT4ww7lCveTp8PKV6eFVmK43o/ALXCNZ9Scrl9HK2LEjzCJuwlmUL9kMSCkzbvKmQNDFjN2jNRMARawPYDMW/+KNh0UUbozqkELTrtFf+esSsAU9CP1KahzDJP19gNCdAAEW0F4/QLVczjG1a0U6IVX7FiKxE2guoIm7b/wxSHa04CORANzqKWqOqFQpByLhyEXGdJvGcefUr2GBIz4Or2uchfIyeeaQDtGsrgyzlJf01kszhDTzA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(39860400002)(136003)(376002)(75432002)(26005)(8676002)(36756003)(6506007)(86362001)(52116002)(6512007)(38350700002)(8936002)(316002)(786003)(38100700002)(956004)(6486002)(5660300002)(2616005)(66476007)(66946007)(66556008)(4326008)(478600001)(54906003)(1076003)(6916009)(2906002)(83380400001)(186003)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dMfcf38McKvXZ9Gui/GhltTtNq2X90gpW/spgIgby7LB9EH6QJ668m2tlEeT?=
 =?us-ascii?Q?6jBb4UdvTXH0pIruTr2x+L6wTchn85/7oU1OhSYBK+POwfOytxr+K+GqJ7cv?=
 =?us-ascii?Q?cbNwc2iOyyQ6vMRpCEbIeIipbq0hp/r8LfSlUpYQAuDKG1p3l/xVEz96S28z?=
 =?us-ascii?Q?YTCansH/q00RMEF5LL/C+a9vpVkkuYRBCQXhPBvvB6DZYocRFksCO7QaZlnm?=
 =?us-ascii?Q?a+33IQatUY2KwGzXSyl0/JyVrcraY0PphsDCSIlfGK7O9iaEYoWxm8Q9AGbM?=
 =?us-ascii?Q?kHOpQlveLz05+ZHPugzg6XuA4wRwA4783x19TuegYK+IuLKK+F4l77cWXwVE?=
 =?us-ascii?Q?sRs8y/les51LWvNaXvqXZMRklZZ77y7GaP5IU5SP3nasPqbexpogPpYECdHv?=
 =?us-ascii?Q?y0d0di85Fxr1UNlMdXfm4976MxXRl4MqzJvDZu5SwM0g6nP1wzhJ9T13DZ1H?=
 =?us-ascii?Q?R1EOkLUy4VytPp02paf8G3yDecs8I/BWMmncWWWB6C2V8CORfbqzNZar8F9c?=
 =?us-ascii?Q?rB7NWIT/ZkC6VmIuOIZBJWO69lB76zvA28I3luVAHvJSEe8oCc/Zx23/K0Pl?=
 =?us-ascii?Q?yWoF3tMwAs7mLYe/mf/ucB+OOL9kmN5bgWmHeXIMR55XmLdlsKn5lFDCxOBp?=
 =?us-ascii?Q?6/SmfPBUkaqIfdBGp6TeDztPXoRcmFMYv70OxWz75a0xAI4w07v6mX+K7XpL?=
 =?us-ascii?Q?/lTBPoOii0lyA7SokvIKO01bc0bD/enwQMLpW5FE39cv6PuBS6G2r1hn1N7L?=
 =?us-ascii?Q?CugqT6dc2SV0zYGXsc/iukYF2KKr8EVvo3Ay4muNpjaeBllDJzCnB8UrRXZl?=
 =?us-ascii?Q?3BKlLQFRHTRnqK2Ut6r2l8tVYtR9r4m+mZTTwSEFuMdmX1siydTpEeWLRLnA?=
 =?us-ascii?Q?6GjhArqzeJ/qLn4LrNk4xNr1SHKW19IOjIRBuQG5CEmofzVB5FJxzYsg6H9k?=
 =?us-ascii?Q?akDStd2/ragVcnFTWL2eNNJeKB86g43+i5Z2aVKi1qDX6MrlMeLDsF02M6O+?=
 =?us-ascii?Q?wtPrCirh16nFzc8FiwYpcCcUTJt8TFiXqd0IwtchUfE/tLrnKwNPFdRlExi4?=
 =?us-ascii?Q?fFL9UM9Ps2SHxdbwrWprXj24Naaxn9d4z8E9E38oB1QOKcYiI5FR6rgvj6yp?=
 =?us-ascii?Q?xCWGevdx0A24mncAoCZVgKAtRzi8pNQrvlLJe/1jl3gXgYWPow+5CdT0tEUx?=
 =?us-ascii?Q?wGQlh/AxLld2r5LB1kwYn1APvWmesn0CddlEHtAn/kKfX6eGger4vr51ZYUm?=
 =?us-ascii?Q?dHVTYhddhdox4SuGstUhRJ2BoToGpJb8Pa3kzT/WnQAHfhI2rqKmAQuTK+tr?=
 =?us-ascii?Q?+mDk5w/EVtsiZ/DplBRxKHfP?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 46c8ccc6-f8a2-4e77-d38b-08d945c1e829
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 05:48:57.7144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yUATXIoVFfR8BZ+AP1LSjcyZuIK6r2w2b00sy975q/ZaP1IAmZkEF3AOFdNrHWI8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR03MB2285
Received-SPF: pass client-ip=40.107.236.99; envelope-from=alxndr@bu.edu;
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


