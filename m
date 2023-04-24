Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A206EC90D
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:34:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsYg-0007i3-UY; Mon, 24 Apr 2023 05:32:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsYW-0007gP-DF; Mon, 24 Apr 2023 05:32:20 -0400
Received: from mail-he1eur04on0731.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::731]
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsYU-0007Rb-TA; Mon, 24 Apr 2023 05:32:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XflpA3NG4jO+8c4ncSpFjJddk+6zpIQ4W6StPCJ87tA7MghKQRkbuLdoAQetBWoLmmjC/fX+ckctGHQ0mad4Jw6OpanZ3YPG8d0cBToc0FOB6/0Jx1umByqp1Xl5vWmILx3eJUGorPABHhxV1ZzVIGas4ErYNTPeB374t4yhHkX3aD7ssxqCCJEXfuqcsjUyiyzEGuepXOkTrr9TbWmNwIkFX9hbrqcSLpr7ougLuns5zuEiqybFZm5XvaZCuZNumqNcFi4Vd8cTeIYENXxrBSNy6+lfzMehIk0UtIu8t8H6p7+MdIhw1ucKV0LqtsGgMs43Yh/wTWdrYNP8BBRq8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M59z86ocTmWdEiULiva7UwJlxeM57dsdQ9CRBOMRxpA=;
 b=Wb3TLOmMgJ1YIPfsbMFladfAX39xqvW+QmMNwwHjA9uXgHTum678hWfd6hHQOwFsdfk1ozms4lNthYeX7OTGPbHKJHs+aiDejomAnM245ubWMzrHGgRJVvS7x6uatpznmzFb+rSQEv0dLpSmNhC3LL6ipnUEH0SVizESc8+aySTzU1pLfQhStwgQSqD+LlPyDmCyrTOTM7mbbTuUHljzrfXDotqmNpD8ygzMkAvhsr7BvMryINDhkmKwM++T/kh8OSwaQ+AYEZegZoqPoa9rvSP7VyxoNv4gSsvFgZI4+Lpxf8CzxC5zO4wq4MGGa1zbVnRl1Goy75en/LFUa3rmQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M59z86ocTmWdEiULiva7UwJlxeM57dsdQ9CRBOMRxpA=;
 b=qYZT9POyTrcUsBfJtUKn0m/weWY7DQ0biEj7OMraTdW6b4wsokCfOXgmINSr+qydXU9RkOT1y6wH+/TCmclwzXUDl/37kuEs/MgPZo3c9eEn1NJz478VwvFUmTpt1SRviQLN7kDsvmcPvY938t3Uk+bK6lSVyxsZCNFRL56Y2HaObOimzJ8ilDs9qLQ4ALf/cuz+EZZcBBH4/SjG+X0QBDDdIyBQVhzsNqkXdIllSnd3tQmIOLuyDvJe2qzliigDE5IX0lt8JOp6u7qSmf2SDnYbEqDmTsO2BXRI4qOMhU4EoeYaDd1y5LVun2anaw0BxAQsW4pij5yuU8vrRIPe1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DU0PR08MB9487.eurprd08.prod.outlook.com (2603:10a6:10:42c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 09:32:07 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 09:32:07 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v11 10/12] parallels: Move statistic collection to a separate
 function
Date: Mon, 24 Apr 2023 11:31:45 +0200
Message-Id: <20230424093147.197643-11-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424093147.197643-1-alexander.ivanov@virtuozzo.com>
References: <20230424093147.197643-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0169.eurprd07.prod.outlook.com
 (2603:10a6:802:3e::17) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DU0PR08MB9487:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bbe4c71-2587-490b-b2ff-08db44a6c5b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OmnMXUx3Z2IlyOA/jsaxgL49gw4ybJlSqGg6YtrLevPMXXbql+MZcaBxKgHNDmbKxHZELlV0bYpE30hwzheFnd9yyVtFUOXI05oF9rw9takOrlbAx7FOeapoLrphc5z1fcgOIbaCmDAar87WMtrKhx+72MZy7Tts6SN1BNEgBHAf/JwaCHDTjIWU0C35PWrxZDuUuMcDn5RfdcMINpq8+qj46Mq69UXQefiP84bpjspaOs0/T1ET3ODIkoeX2tk8+ZdwVewJDYmgeG07PLu1UdVlNn674Y5EP3bgU9a8BgzTWz0FtDBzCU+kGMKVbUU4mHln6bzhUIYzShrVSq+7LxLrv2sDVSnnN3KpM5r2u3UfVJxhVC20MOtGpDHj773bhvXHIWj7f5fQReh4AVhjGi0B1/M3C0IzMdQ6wZKl674Sxt/0OgdygcnaYpA0cWVZSa272c/ep4OohO3ufqmhvqDWubc6GvbcuAdk5w7HBL8aetoywtDNZ+Y2cIrG7yxMS6UhSivepkQEcE3nC7gTd+CKgfD6qXmcGJiPvgd7fNwxVV+Jp0xbb2FpvJBMAbt1CTsadbkMr9IXmMsZJGv74c6DQV0kkUxZKViLNTBfRdzRUC1kQ+zCUZW25v1AeoaZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(346002)(39850400004)(136003)(396003)(451199021)(478600001)(86362001)(36756003)(186003)(6486002)(26005)(52116002)(1076003)(6506007)(6512007)(6666004)(4326008)(6916009)(66476007)(66556008)(316002)(44832011)(83380400001)(66946007)(2906002)(38350700002)(38100700002)(41300700001)(8676002)(8936002)(5660300002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MDgQYGj0jbGp+PCMwPcw2j5Av+48UTwPf37/H8CQRH0HSCSLuiAFcVHb5SJa?=
 =?us-ascii?Q?wHoHpQ5BdjO8Pb+BL8iYcphx9GVDKkd1qRhLbKne1xrgE9OlSeYEUtSzMdV4?=
 =?us-ascii?Q?2RIQ9uBOtrWJxKtDtTnjw/1K+86QmOuGvQKBlX7LECdtvTkn1UVIR9oTd/6P?=
 =?us-ascii?Q?xh3U8l/2ohXMq1/ZtIr5F2HdxiaVXhQm0GeqlYDjaqvpeec4LQl3y7IBWsZX?=
 =?us-ascii?Q?dq4FP7A5pzs9tEo0g5OO/fpRQfdKz9kPqJi3RBEjSEF4dv5AD/0zz5AD2s5u?=
 =?us-ascii?Q?yCEItwZtHtClEcaReM1da0AKtUcmLlx42MH7lkSU3MhafJ1l4r07dojzgHrz?=
 =?us-ascii?Q?zhn5igNCcmQyskVNbv0SYOozP9Z7X2scbGliKo8hPJl8DDcHUlRj6YMf3pQe?=
 =?us-ascii?Q?Rg/PB0AEEppVL+0q67Zm5ditiLDMEYxZRiDgWrGgAIxmNGif1/VQBtJoGTba?=
 =?us-ascii?Q?Jkf3j4YCNxf8NsDnylx3P7zyc1BczDfa1Ob6p/A+ksph3ps0JhmYenwjENUt?=
 =?us-ascii?Q?I6+IcudNLy6qI0Dn0smY6PhLBXsLGBxKxCpHLOvIfrYd4bOMcBcsvRJide8B?=
 =?us-ascii?Q?FIm6wxhP5L0AJeR5fWetHw7AWskbYVes6vvEyn8h/r9P1T6uAvJfE2cuT6av?=
 =?us-ascii?Q?JXSO/erwumVSxDJ/OTNV7LQpa29mlK/2LzJx0HBbtgzGxyuXzHc4yrTa9Upr?=
 =?us-ascii?Q?l6lZ7GPYsn1nRzcHYTUh4JMtovpFslW4AHWGxaoqP3cF2LfLf4owsmE4B1Q9?=
 =?us-ascii?Q?GqAVuDZ0MjGsir757qwfba2WGzE89I35QsAqd0rcJDb8YE6iGq0G8Pr3Bzcp?=
 =?us-ascii?Q?7h/wlPAZYy/zkQqeutDA4YgJSxBIFeBeZMm/6mujrBdAnF4HQ5vUEbJ8460b?=
 =?us-ascii?Q?RDN8aHHBiBu03d8T7Y+eXKvSr22hCu0TjdoyT6IVPFWxqKIc1XovhRv3jdos?=
 =?us-ascii?Q?tcS1ZELCR/3w6b0OEWBl2slUsUcvG2+EN26m0UKRqdxQ6WZQJ3fSUYm1jW4K?=
 =?us-ascii?Q?89my5XK2cb632yGQDGzJKkpU3LcHogBY62B1F/k0ZSApCB02h4UQjdn+mwLR?=
 =?us-ascii?Q?QqP87dhLH1MEGGHUSx+Kej5Pi1nXj+6lFbggrwptzD+jkSWy62Xt7Xl1VpEJ?=
 =?us-ascii?Q?ZdMwfgci2hinplk1GvGeKb2FfbZbqceHTWkk+jtLRLoj8xBJZ0xXBQRrtgpO?=
 =?us-ascii?Q?ez0vhIgLhC+BMybNhWZixYuceiK1PSReIjEd8VsUim8zmzqa68meXotA+eEp?=
 =?us-ascii?Q?Z85IFvRi4DrlVEEtUBBQtKwjllrHMyzmuxNCVAgUggB3pYBpWjUuA2dCsMZq?=
 =?us-ascii?Q?Xzhm4pJ4/bgPQlHbwyXpS494APpFRXnHPWM6QXUUjh8n3X8l7vpwf8LUNFpO?=
 =?us-ascii?Q?Nd04IQ2LcQ/xet14oY8lKipNM6hsSRLgMsSlN8P4s12yrKOA09K8TGf5kNKG?=
 =?us-ascii?Q?Q/9NUKV4fkjrO4roc0M6Qm6N2rhH7jHXV52emBy+oe7CDhF6Bi4CnpkFuLxr?=
 =?us-ascii?Q?a1CtFeVVokeKSL+/EtWBXSciDg1dNUxCF9beul0ixmVbZQlpFI/HVCkkNXGA?=
 =?us-ascii?Q?Nmb+XOZLgOKG1sMiL33vLyTQE4fz8xnHbYGY6LUQEFzE3B6sQhQ7+CRHSn3T?=
 =?us-ascii?Q?IQ=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bbe4c71-2587-490b-b2ff-08db44a6c5b5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 09:32:07.7331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cDCfxmql6C9Edc8Xjk62CSIqjoPesRnGhXijGQ3BQttaWYGMYoFc5yd0V0SjxCD1LxLv50ZbgQHvp9CkdmIjAeBsIy7v8Ubu1n2ARF8Q8CM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9487
Received-SPF: pass client-ip=2a01:111:f400:fe0d::731;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

We will add more and more checks so we need a better code structure
in parallels_co_check. Let each check performs in a separate loop
in a separate helper.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 block/parallels.c | 52 +++++++++++++++++++++++++++--------------------
 1 file changed, 30 insertions(+), 22 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index c3e220b60f..48ee5224c7 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -524,35 +524,20 @@ parallels_check_leak(BlockDriverState *bs, BdrvCheckResult *res,
     return 0;
 }
 
-static int coroutine_fn GRAPH_RDLOCK
-parallels_co_check(BlockDriverState *bs, BdrvCheckResult *res,
-                   BdrvCheckMode fix)
+static void parallels_collect_statistics(BlockDriverState *bs,
+                                         BdrvCheckResult *res,
+                                         BdrvCheckMode fix)
 {
     BDRVParallelsState *s = bs->opaque;
-    int64_t prev_off;
-    int ret;
+    int64_t off, prev_off;
     uint32_t i;
 
-    qemu_co_mutex_lock(&s->lock);
-
-    parallels_check_unclean(bs, res, fix);
-
-    ret = parallels_check_outside_image(bs, res, fix);
-    if (ret < 0) {
-        goto out;
-    }
-
-    ret = parallels_check_leak(bs, res, fix);
-    if (ret < 0) {
-        goto out;
-    }
-
     res->bfi.total_clusters = s->bat_size;
     res->bfi.compressed_clusters = 0; /* compression is not supported */
 
     prev_off = 0;
     for (i = 0; i < s->bat_size; i++) {
-        int64_t off = bat2sect(s, i) << BDRV_SECTOR_BITS;
+        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
         /*
          * If BDRV_FIX_ERRORS is not set, out-of-image BAT entries were not
          * fixed. Skip not allocated and out-of-image BAT entries.
@@ -562,13 +547,36 @@ parallels_co_check(BlockDriverState *bs, BdrvCheckResult *res,
             continue;
         }
 
-        res->bfi.allocated_clusters++;
-
         if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
             res->bfi.fragmented_clusters++;
         }
         prev_off = off;
+        res->bfi.allocated_clusters++;
     }
+}
+
+static int coroutine_fn GRAPH_RDLOCK
+parallels_co_check(BlockDriverState *bs, BdrvCheckResult *res,
+                   BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+    int ret;
+
+    qemu_co_mutex_lock(&s->lock);
+
+    parallels_check_unclean(bs, res, fix);
+
+    ret = parallels_check_outside_image(bs, res, fix);
+    if (ret < 0) {
+        goto out;
+    }
+
+    ret = parallels_check_leak(bs, res, fix);
+    if (ret < 0) {
+        goto out;
+    }
+
+    parallels_collect_statistics(bs, res, fix);
 
 out:
     qemu_co_mutex_unlock(&s->lock);
-- 
2.34.1


