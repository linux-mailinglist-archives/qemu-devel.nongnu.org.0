Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0526888D1
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 22:13:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNgsE-0008Kk-Fq; Thu, 02 Feb 2023 16:12:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1pNgsC-0008KH-43; Thu, 02 Feb 2023 16:12:00 -0500
Received: from mail-bn7nam10on2072b.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::72b]
 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1pNgs7-00089d-CK; Thu, 02 Feb 2023 16:11:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UF2Bu5LEVysjJJ3x4Se7IMwS0jALFCySJlvcv/PX4RY0bGSWxPd16crHOI0d4C3cpgi7K/ts9QTPHFeO021Hs4alajk/B9Ex4i2nBqcC+8PSGRFBbsFef0jxScvFFkiP+QwFHFg3udLDYOWL0cfq5zLvayWwMnYqKjxCVYk0Y0GUSC/ZVhQaQ4ooBAK4OMi4wJTnDrbU423CZlZDwW8cZ65I+QBjFXs7ArGexaHMeSqL0HKLhQ2/z/SCXKjRk43VMF9SoqdmyE8hVUFEP4BWwFnlIXPhdBbWEtbXytHPktKz+DyIFO5dqIimtp40147XHGBrPvHuhij6AeRZHzfOEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=an8pEp2vpzLK6xYyszENUQGGSGgCnVDVCGrWjKty7vs=;
 b=m9KFt3Xj9TOR4A6XVkkrmcpZI4GfMy+leRCjMZpWIT5e0MCseGP49Vole6YMW3SeAmLOa1KrTl3fGP5QNgw6wODAAjvCY6/ntiXI7i/I8qlEab21tUCLChpLxUAkAx1PXTHhGezNpUoLwhcy/HQuLkqizT7Racu5pcPac1hqTMWHmYxsmdKRHki0N3k2aWvQg/68rv+ykHWkl3oFaw41mQQb7vGNy4Kg+i0p9Ptb+QERZ0DMATHCczU7pele/7UQ+gJ9KoN7yeSeOvjsEGyb2QE9r4fJU+fFOulQaQzs53SplQmzRFJ1Jy4rDlrHzvaC6iGC0oNeYsqrN+zvOa9BxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=an8pEp2vpzLK6xYyszENUQGGSGgCnVDVCGrWjKty7vs=;
 b=PNe4OIvG2q11U7tqrmKBkRUiM5BVBfwDLiDbcTOH186z2swJWXAmD7LUw8vBOjxgsTHV0Iwog6YscBVOjp0Ko+Rx8hm7t5wTbd8NkOFAN6O7ELJGgM5wF2H57QQtWGWKixUsvaJ1+OVJrPs6HEPQsmwr+B/aj8GhHEmGL5AYOUI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 BL0PR01MB4801.prod.exchangelabs.com (2603:10b6:208:7c::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.38; Thu, 2 Feb 2023 21:11:44 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::c6ce:a93c:6bfa:2ec8]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::c6ce:a93c:6bfa:2ec8%5]) with mapi id 15.20.6064.027; Thu, 2 Feb 2023
 21:11:44 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Vincent Dehors <vincent.dehors@smile.fr>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: [PATCH 2/7] target/arm: Implement v8.3 QARMA3 PAC cipher
Date: Thu,  2 Feb 2023 16:11:24 -0500
Message-Id: <20230202211129.984060-3-aaron@os.amperecomputing.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230202211129.984060-1-aaron@os.amperecomputing.com>
References: <20230202211129.984060-1-aaron@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR20CA0027.namprd20.prod.outlook.com
 (2603:10b6:610:58::37) To CH0PR01MB7124.prod.exchangelabs.com
 (2603:10b6:610:f3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB7124:EE_|BL0PR01MB4801:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bf00309-5b60-4ca9-d3bc-08db05621644
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b6KSQeUAs9RV14MxOYqDzvsMRHJu+yx/GESk1toP3+tsYxKIq5NC645qIKaDWRJYoe7n6kvtAeG7YgTedFmtKixH79olV6l+qQjJiqBxZgxiyii4VkVTNCy4WtWz3168koJxoT3hxkeJvJgA7448QGdALhrEGBY6EZzJK5kQd4zfae1Pqbv5yfG4SMdoO5iDYcp6NAMlJRS1pyE7vyvvL89oc/klfhWMdONzaMcrabmjFSnoHRDPrqZa1zwMpyRwmWo8/aO0vdWEbvFxTkZ/9q8hCqOurHiM/H3SRdkvo2lfAmyY18OyFcqRUeljwM/od1ZQkcvjA6qxiIRwr0y0yOpB2R68onzv9bwOMskxkoiGVptw9YVphYL8q+7GUbVJ55LKJQ2DNuORfhDMwVONYTBFofCbJEN2hOQtOfLn6L/VnUMR0F9F3EaS2sBH5oCE8bT7U+AovPnytReDCrQMsiR6RlcM4NRSTOIkc7IB5ZFtvzZfxIYE45iJ2AARzYgOnI34Y7Xf+OV9j2cPJqfMkUBpiYaYjrPNIbMHUZzo5olje+GLxolLzgmIYWCQVyWro1W9+sG4vfqJFryf7p8/9o75MzQrazrfnns52aZpeqNGn/ot8oY72oExCoHkUgAKXh/5QYoN65pw/z3RZtXPQMbz+kojyeKwkBqF9Ivt7sBq49Ykkf+XfOe4kaV5fECTfBdpRdil1xmMSCln5VbAfw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR01MB7124.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(366004)(39850400004)(396003)(136003)(376002)(451199018)(186003)(4326008)(6512007)(26005)(1076003)(107886003)(6506007)(41300700001)(8936002)(5660300002)(110136005)(6666004)(316002)(52116002)(66946007)(86362001)(38100700002)(83380400001)(38350700002)(2616005)(2906002)(8676002)(66556008)(66476007)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9wAvj12D/cM/AhVEr1IxKSh7NmVz1KNv1/PlyEuUf89GCzzsrGybDa6054G2?=
 =?us-ascii?Q?R5LN5Kwq3QC7ZgLkBpkR3dbl6MGxbFt0Dp5QrPeANI3+bjInTZJGLuCEhvXY?=
 =?us-ascii?Q?RPSrz7KwFPwI/wKO75U+HfjjfLnvdompc2dRV6/k8CHIXXoNUBmnZhMV1FxM?=
 =?us-ascii?Q?wTPVpLhQoCqvV/Ecgxwlirh3gvr2RgVUfpkxuDclY40qVIiTP2fLq3oH4EHN?=
 =?us-ascii?Q?Fj9ymTyeaG71ymrrtnQfJG6IFf0Agg/2OUOYmAufmDyiqx+/3z0VxUgWi+hr?=
 =?us-ascii?Q?t9SjTg+Ap7AKB8xpprR8jRJmY6g6mItjHVaFi1MGe79Q/D/IbLD7Sob2LlDw?=
 =?us-ascii?Q?xFoHr1B5iLf0gl/P8VE8Vm3VCXsOtN8ubuapBBq5YXvqs8N25muJI47kvMjf?=
 =?us-ascii?Q?kYhtb8UHvF5y9OO2U6+ehWgPrWUUiSYywGgsPVeKB/zMIGRqAC2Vxkurhmfj?=
 =?us-ascii?Q?EBqvvkmSBuBXNZGbXeCBsctJzXaRO9O36zCnLVihtGLwI7NHv3Vr7Z0ehJX0?=
 =?us-ascii?Q?EdRp4YlERArega5uIvG6fqU7LjPuOn5YzSZekSAoyJ/TUCDJfw1Yc/itrNKr?=
 =?us-ascii?Q?1LoKCLDr1nni/W03Q8zLcCQ1ovcY2yU6sj88ji5F2p0wvpsYawNm+1qNZJ5+?=
 =?us-ascii?Q?K/eTqOOXXeclNaZee6d/RihrrgfY68MqSV5FW8l7veY/zCPjx6vlitUz2xNc?=
 =?us-ascii?Q?fjQUuafrEFXEG2VDtn1bdqA4AUxlTLSQCziWl3EjU7paS2u67o+zxnkPkQ0V?=
 =?us-ascii?Q?vKpiOIBLUQxBIexex8EY0z731By9Y7Ht8KWLdyNaRMUeX+C/YNpUunx9VgjY?=
 =?us-ascii?Q?gyklCfjZ/bt/RomdTfzwXU1UyC/W85clay74ZZcaGO/2osZefCPQgjLAz8Om?=
 =?us-ascii?Q?sSIfP43wHJZ9QxSuZ2JOcFPOsFcE+UfomjcpykjJ5zwMZd0SgcNXXA89QIrZ?=
 =?us-ascii?Q?84GUbLOPdPNGlRrVEz8NPLYfdNUU4yv8loCc5exOqM1YFcZguJVWH9bBTxPR?=
 =?us-ascii?Q?dSLUAY7tS4ODjC0W9ApN5avAVThUog1FIQczNlg0FI3R5TZHmyqZNAJhHUav?=
 =?us-ascii?Q?5GsfgJRf5Jz4QT8aePW5ZyXC9/nf3wpgwHRf8tsa2KjdGaMjQ8gPfJQqHlKU?=
 =?us-ascii?Q?dExuXjJRbDd6oscn+3zh6AV5OJiev0/qX/23bbHmAIWZNiCPSogfJSTC6rjf?=
 =?us-ascii?Q?bsy1I/W328yPPJMJJeWgx5E992RTSsujAEtv9yrhK1v3b4wKUNSdWchm0HFu?=
 =?us-ascii?Q?FvIzOdBcQk7HLglhcuBVCEZbpTwh1Y9J9zWcn9KDvDulr8HQiErL4Khu+KqN?=
 =?us-ascii?Q?+wvdlFva9algkKiouquH3DtreSa62oChx7zIo4nbQIVBYurdHk0xnbuXlbkL?=
 =?us-ascii?Q?c6RZIvcgfZ3cKhKPxBb4SaM2c4I3pSkJ3DnXFxEEawTdPpGXKtPFfsSePlKV?=
 =?us-ascii?Q?NY0pui4AwFkN7Z950kzUIXtIA//RJGwpGC5GzktvwaN9g1jKNOgVqo36RDts?=
 =?us-ascii?Q?Yn7998SnaxR0uAIK1sP3bf5LKQjvMZ4N6ubsguWEPENhWm0OGmNZmQrOx2ZG?=
 =?us-ascii?Q?pzEA3H44kOoc761hmLlMCP9bUzgIBOFqPDuYu6QibINJPzEQtBxgc4li8pp5?=
 =?us-ascii?Q?aPItIQUYTMmf2nWeMVO/8+U=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bf00309-5b60-4ca9-d3bc-08db05621644
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 21:11:44.3162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TTdN9pu+WPmLRhaumw12OmH/ZIGQeErcyUnbIWPQ+MB8DmN/xWYmHGNPSJSCBZMITNWIzFyE4d/5SnFSb+yCAW6GbNrNve0dmaNvtaiVgVMkgwLg/6XIxw11H6Yn9mSW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB4801
Received-SPF: pass client-ip=2a01:111:f400:7e8a::72b;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
---
 target/arm/pauth_helper.c | 48 +++++++++++++++++++++++++++++++--------
 1 file changed, 39 insertions(+), 9 deletions(-)

diff --git a/target/arm/pauth_helper.c b/target/arm/pauth_helper.c
index a0c9bea06b..f525ef7fad 100644
--- a/target/arm/pauth_helper.c
+++ b/target/arm/pauth_helper.c
@@ -96,6 +96,21 @@ static uint64_t pac_sub(uint64_t i)
     return o;
 }
 
+static uint64_t pac_sub1(uint64_t i)
+{
+    static const uint8_t sub1[16] = {
+        0xa, 0xd, 0xe, 0x6, 0xf, 0x7, 0x3, 0x5,
+        0x9, 0x8, 0x0, 0xc, 0xb, 0x1, 0x2, 0x4,
+    };
+    uint64_t o = 0;
+    int b;
+
+    for (b = 0; b < 64; b += 4) {
+        o |= (uint64_t)sub1[(i >> b) & 0xf] << b;
+    }
+    return o;
+}
+
 static uint64_t pac_inv_sub(uint64_t i)
 {
     static const uint8_t inv_sub[16] = {
@@ -209,7 +224,7 @@ static uint64_t tweak_inv_shuffle(uint64_t i)
 }
 
 static uint64_t pauth_computepac_architected(uint64_t data, uint64_t modifier,
-                                             ARMPACKey key)
+                                             ARMPACKey key, bool isqarma3)
 {
     static const uint64_t RC[5] = {
         0x0000000000000000ull,
@@ -219,6 +234,7 @@ static uint64_t pauth_computepac_architected(uint64_t data, uint64_t modifier,
         0x452821E638D01377ull,
     };
     const uint64_t alpha = 0xC0AC29B7C97C50DDull;
+    int iterations = isqarma3 ? 2 : 4;
     /*
      * Note that in the ARM pseudocode, key0 contains bits <127:64>
      * and key1 contains bits <63:0> of the 128-bit key.
@@ -231,7 +247,7 @@ static uint64_t pauth_computepac_architected(uint64_t data, uint64_t modifier,
     runningmod = modifier;
     workingval = data ^ key0;
 
-    for (i = 0; i <= 4; ++i) {
+    for (i = 0; i <= iterations; ++i) {
         roundkey = key1 ^ runningmod;
         workingval ^= roundkey;
         workingval ^= RC[i];
@@ -239,32 +255,44 @@ static uint64_t pauth_computepac_architected(uint64_t data, uint64_t modifier,
             workingval = pac_cell_shuffle(workingval);
             workingval = pac_mult(workingval);
         }
-        workingval = pac_sub(workingval);
+        if (isqarma3)
+            workingval = pac_sub1(workingval);
+        else
+            workingval = pac_sub(workingval);
         runningmod = tweak_shuffle(runningmod);
     }
     roundkey = modk0 ^ runningmod;
     workingval ^= roundkey;
     workingval = pac_cell_shuffle(workingval);
     workingval = pac_mult(workingval);
-    workingval = pac_sub(workingval);
+    if (isqarma3)
+        workingval = pac_sub1(workingval);
+    else
+        workingval = pac_sub(workingval);
     workingval = pac_cell_shuffle(workingval);
     workingval = pac_mult(workingval);
     workingval ^= key1;
     workingval = pac_cell_inv_shuffle(workingval);
-    workingval = pac_inv_sub(workingval);
+    if (isqarma3)
+        workingval = pac_sub1(workingval);
+    else
+        workingval = pac_inv_sub(workingval);
     workingval = pac_mult(workingval);
     workingval = pac_cell_inv_shuffle(workingval);
     workingval ^= key0;
     workingval ^= runningmod;
-    for (i = 0; i <= 4; ++i) {
-        workingval = pac_inv_sub(workingval);
-        if (i < 4) {
+    for (i = 0; i <= iterations; ++i) {
+        if (isqarma3)
+            workingval = pac_sub1(workingval);
+        else
+            workingval = pac_inv_sub(workingval);
+        if (i < iterations) {
             workingval = pac_mult(workingval);
             workingval = pac_cell_inv_shuffle(workingval);
         }
         runningmod = tweak_inv_shuffle(runningmod);
         roundkey = key1 ^ runningmod;
-        workingval ^= RC[4 - i];
+        workingval ^= RC[iterations - i];
         workingval ^= roundkey;
         workingval ^= alpha;
     }
@@ -284,6 +312,8 @@ static uint64_t pauth_computepac(CPUARMState *env, uint64_t data,
 {
     if (cpu_isar_feature(aa64_pauth_arch_qarma5, env_archcpu(env))) {
         return pauth_computepac_architected(data, modifier, key, false);
+    } else if (cpu_isar_feature(aa64_pauth_arch_qarma3, env_archcpu(env))) {
+        return pauth_computepac_architected(data, modifier, key, true);
     } else {
         return pauth_computepac_impdef(data, modifier, key);
     }
-- 
2.25.1


