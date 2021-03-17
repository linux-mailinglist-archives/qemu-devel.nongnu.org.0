Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DC333F3C2
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 15:58:53 +0100 (CET)
Received: from localhost ([::1]:38232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXdM-0004JW-Lf
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 10:58:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXI3-0004sP-Nx; Wed, 17 Mar 2021 10:36:51 -0400
Received: from mail-db8eur05on2128.outbound.protection.outlook.com
 ([40.107.20.128]:5633 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXHt-00079x-Lp; Wed, 17 Mar 2021 10:36:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QLc/v1zBbePelKq1uBozaALF9W3N0M6c8yS26l4xiNBcb3Qd85S3pM9/ulbeVfp3PcyxEYyeGncOpvY7jqUQKijDXHKnVatovbZtkJH+eOYBy5XQ1F2vxkxiLKIjTCdWGHBcWLXVpN/IChEIFFJT8XjKlZwvg8KIQucMy0/tleYGkJsIOezJ+g85TtjFumaaUxEmrOFr+BWhXYVPz9K4GwjqftMYcqoffNuIWqGDP6bfMtVGrJyBZogzH36HnD7mlYxmMkhaXmenSgD/VZ4oscR0T7HS0BBhEOpfWsBqQcr4gkVxv41jvqdZX1yrnfPX4pfqTid8Zej8Fk/UnmvxnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XORFBJY5zMolbwbZdBmP/EhjYrW7KeOnESZJ8jk6aaw=;
 b=TheCh+u8PDXNqdaKqeFfisg2+VbIgkGAvqv1PdQOuTZnjVfuwJGTtc73ynMS00rWu1Ozc3W6hKqjYdFTNB8nVGQlYd0if/sZTC18Kr2an32Ic7dISbZZljoiGKivBq7JV01Ye4zgwpvYTXeAcmBzYbntkOldU8pKoH7EY6k5BoGiv40BhSzYbcyPUWYTjyM1WufE8DnrJk5UJrTVyrURKZZ2NzfcGMbxBmFF66ONMF6iw04xldeLftI00Riv006IEEVKoDmu74wS7rbQR6cje3jP1QO8OESohiMkhaEhYv+EuaVEoG/NizpwM8TwRT0J+xYYeySXw2ExKf0bUozXGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XORFBJY5zMolbwbZdBmP/EhjYrW7KeOnESZJ8jk6aaw=;
 b=X9HiERN1+otbQ9rviZ9tpbIo5T2V3Kdkv7eIH/DZX85JCMMws9CoP7RI5CfY4Wl08Xzsh259Sobf8o53ZF2L7wB0PFROD6JEXHwIqYKy669xTlXI2O9vEhjCiymxrqzRJOxipjFgnhYq+3s3KbrUOssKUJdNTPx2qtM91exWSB0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6216.eurprd08.prod.outlook.com (2603:10a6:20b:29c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:36:39 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:36:39 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 25/36] block: drop ignore_children for permission update
 functions
Date: Wed, 17 Mar 2021 17:35:18 +0300
Message-Id: <20210317143529.615584-26-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210317143529.615584-1-vsementsov@virtuozzo.com>
References: <20210317143529.615584-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR0401CA0052.eurprd04.prod.outlook.com
 (2603:10a6:3:19::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR0401CA0052.eurprd04.prod.outlook.com (2603:10a6:3:19::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 14:36:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f8a8c35-aaf2-46ac-43d7-08d8e9521342
X-MS-TrafficTypeDiagnostic: AS8PR08MB6216:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6216F5F79FA8D5FA83A80341C16A9@AS8PR08MB6216.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:529;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vGMFwBwi4Wmsm4Yg3jqtRV7f1M6LUNm4R+YCwescTi9yb8MVQco0A/l56/622fnUSehv/OEWpYOY9QCYmSEo7Sf/wq1F4l6B22D7n2Et/KrZ3yQZA0T0qIy78UUdIJZqv5Gb0yEIF7zK0WJdD3zTAMrsXx2K8oEbhcYjpvAII9AHjt7jope4CStNDgGFIEEyk0ir6+Q6Jj9zlCQSCQ+YEaZ5U05OUqjhrIu/2dkmRBMxemQhWHidaI2Up8FwTE7QuTv6tcEG2S0LJGLggixIEyRmzsZskzPZ9lEbFyQIV/q0FaRF6KUmX+qXPIN/0ZmrUOtGKTgcrAe37livitJTNrKNvrky/ROHsZ736iiFaqpgILRpp+VhCGOoMcW1izWsy715J936NvTLo4bww5HEsRLwaH43/7tQ/RgJGMQcUVtzGlmtFs3o4T97WhVa/WEN9/O/cUd5ooBHyLPG/ioXm9LWElDUHhSpwKkUcmVUMlftvpykBClJerBB9cu+h/ceWnAe05+7eu1ceAQyGAMTN3pHGguSFjRvZMtCpnyIiEMQSEoHgc8WTLHPnsA8RpOBWlgUgM1bCysTRNjS5iWmZvsQZPa/r8D+DsLKIDAGGigIPFZHBNGLeNBignryyr6v
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(376002)(39840400004)(136003)(6916009)(83380400001)(316002)(2616005)(66946007)(6512007)(66556008)(8676002)(956004)(26005)(1076003)(16526019)(6486002)(186003)(4326008)(36756003)(8936002)(2906002)(6666004)(5660300002)(478600001)(86362001)(66476007)(6506007)(52116002)(69590400012);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?dREGVIn3v3xEKGuxwp8g06MtiOwhfSVEXZv873Nuqif50bVkUa5JCzjdI/UY?=
 =?us-ascii?Q?XIZPWIRTc1CeQgwc/Mvjop92y57qux4gFzgvGD+x6YS37ibkn+3uLioq8SA/?=
 =?us-ascii?Q?Kwnows0go4RZfxGI7ykTr5LJ8Xw6LFeG4FekxtBy9trhtDEyy9NpxDXE1u2y?=
 =?us-ascii?Q?PHOh0aNFIj36LHkasCYo8QMHMVqPn1Rt39doMgcJfknwZlYNuzv/U3K1QGdI?=
 =?us-ascii?Q?covKjcamX5e5NT2xtDq1nGIjVN7NXNyhGUlSqQdJYNsbTsEJbCg8tvl2XJg3?=
 =?us-ascii?Q?OG4SKUeOm5nPVG+1ntL1G/PkAT4WG6C8g9gfjabNipwJ+duTrGYEAVSjEKF9?=
 =?us-ascii?Q?vyNlyjqc08qdmR6r+iQwUCPzhjLf2Try9kLEA56i+GAG/ezOW3Ez3uPhaay8?=
 =?us-ascii?Q?qFHeOqO+VF7e5sHUPwTUYsDVwp0skr1LHg1HWJ3Y8PBLSv2rXX+1tzKB7D2v?=
 =?us-ascii?Q?W/engXIC0xCQiA7PxTJRtmGQfz7tcj3Y+yqMBlzeFNOssXeJX7S4QnEobBUD?=
 =?us-ascii?Q?hEe+zZEe3mnwT+GaKd+NRfORbim1GftYozSofUsY1YySVrSxCCQMgGGmo4/5?=
 =?us-ascii?Q?eEHjBFje2kHwcUtl7jF0nLXECefGpNqD0uN7cYzH6OPTMZJN1suc5ZACKwMV?=
 =?us-ascii?Q?SKjoUl1hYWX+ofUEO7QJ6bTP+7z4WJoYzi496vo973Kk/zRyp9QAWDkP9PaD?=
 =?us-ascii?Q?DrXPNCgwYt1k2yCXYGR+ayVcxnmZQaLt3ygWIi+ZNKGTTzz1aXyQzHaNVN1x?=
 =?us-ascii?Q?8lC7OvYB9gP7lUubqCyj5/UPBxanMcgKxV8wGqZa/hPvlj+zx+ayL9b7djSm?=
 =?us-ascii?Q?vUyAo0vMMjbUqDBfsBRPo/gvJfFIlwCHZoBF486YpE0tKy6AwY7McOTbPf0k?=
 =?us-ascii?Q?QyxeKl+8L22pwOvqNZoYMNGe9Oa6jpJGBqRM8tYFeWNR3+Z0SGOE+1DCLULJ?=
 =?us-ascii?Q?BYJx8UchVLA2sLoejxbMVsWPVGlGmDtLXE9KqO4+p1XwP7BWR1JmwPLLd9nx?=
 =?us-ascii?Q?lza/tuANobmZQR3S8S0Pi3pYLC2SIbQ/r4Pm3oBIpsDNuawXqytFwnGFhi4Z?=
 =?us-ascii?Q?xtQxVet9zRI0H5Yu92eZkFvG7yg+vaD35uZJPzCyh4cdGoInRawZhtfS6w8r?=
 =?us-ascii?Q?d73P/wRAzeCxJEi9J/AD0pzlpxQnuQtr/Ig+6Ah75x5g3YI/OvpqIN/5+ue/?=
 =?us-ascii?Q?FqrMCQzA7vhAGtIBD7id/20gQwapZl4pbSGqiXoMckyxGvooCIKNgoOl4j6s?=
 =?us-ascii?Q?MNsYYDMifVbNgGeOhwQ79UJ81pf8qvww1A96PmpESchWowF1m1tqALkE1/54?=
 =?us-ascii?Q?DUNrmqryb4ScLO36/cB2OQG+?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f8a8c35-aaf2-46ac-43d7-08d8e9521342
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:36:39.4118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N7vsHOO7eW2Kz6DgYAC/DbQ0jcHPfTZJLma7gobduNkc88PaxqK81//gjYHE8ZE02o/PNv5FP/8GOvDSENl8/3hCXKD2KCp9wDae411LqNQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6216
Received-SPF: pass client-ip=40.107.20.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This argument is always NULL. Drop it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 38 +++++++++++---------------------------
 1 file changed, 11 insertions(+), 27 deletions(-)

diff --git a/block.c b/block.c
index bf60f1ea2c..922df82952 100644
--- a/block.c
+++ b/block.c
@@ -1954,7 +1954,6 @@ static int bdrv_fill_options(QDict **options, const char *filename,
 static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
                                   uint64_t new_used_perm,
                                   uint64_t new_shared_perm,
-                                  GSList *ignore_children,
                                   Error **errp);
 
 typedef struct BlockReopenQueueEntry {
@@ -2031,9 +2030,7 @@ static bool bdrv_a_allow_b(BdrvChild *a, BdrvChild *b, Error **errp)
     return false;
 }
 
-static bool bdrv_parent_perms_conflict(BlockDriverState *bs,
-                                       GSList *ignore_children,
-                                       Error **errp)
+static bool bdrv_parent_perms_conflict(BlockDriverState *bs, Error **errp)
 {
     BdrvChild *a, *b;
 
@@ -2043,12 +2040,8 @@ static bool bdrv_parent_perms_conflict(BlockDriverState *bs,
      * directions.
      */
     QLIST_FOREACH(a, &bs->parents, next_parent) {
-        if (g_slist_find(ignore_children, a)) {
-            continue;
-        }
-
         QLIST_FOREACH(b, &bs->parents, next_parent) {
-            if (a == b || g_slist_find(ignore_children, b)) {
+            if (a == b) {
                 continue;
             }
 
@@ -2276,7 +2269,6 @@ static void bdrv_replace_child_safe(BdrvChild *child, BlockDriverState *new_bs,
 static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
                                 uint64_t cumulative_perms,
                                 uint64_t cumulative_shared_perms,
-                                GSList *ignore_children,
                                 Transaction *tran, Error **errp)
 {
     BlockDriver *drv = bs->drv;
@@ -2359,7 +2351,6 @@ static int bdrv_check_perm_common(GSList *list, BlockReopenQueue *q,
                                   bool use_cumulative_perms,
                                   uint64_t cumulative_perms,
                                   uint64_t cumulative_shared_perms,
-                                  GSList *ignore_children,
                                   Transaction *tran, Error **errp)
 {
     int ret;
@@ -2370,7 +2361,7 @@ static int bdrv_check_perm_common(GSList *list, BlockReopenQueue *q,
 
         ret = bdrv_node_check_perm(bs, q, cumulative_perms,
                                    cumulative_shared_perms,
-                                   ignore_children, tran, errp);
+                                   tran, errp);
         if (ret < 0) {
             return ret;
         }
@@ -2381,7 +2372,7 @@ static int bdrv_check_perm_common(GSList *list, BlockReopenQueue *q,
     for ( ; list; list = list->next) {
         bs = list->data;
 
-        if (bdrv_parent_perms_conflict(bs, ignore_children, errp)) {
+        if (bdrv_parent_perms_conflict(bs, errp)) {
             return -EINVAL;
         }
 
@@ -2390,7 +2381,7 @@ static int bdrv_check_perm_common(GSList *list, BlockReopenQueue *q,
 
         ret = bdrv_node_check_perm(bs, q, cumulative_perms,
                                    cumulative_shared_perms,
-                                   ignore_children, tran, errp);
+                                   tran, errp);
         if (ret < 0) {
             return ret;
         }
@@ -2401,19 +2392,17 @@ static int bdrv_check_perm_common(GSList *list, BlockReopenQueue *q,
 
 static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
                            uint64_t cumulative_perms,
-                           uint64_t cumulative_shared_perms,
-                           GSList *ignore_children, Error **errp)
+                           uint64_t cumulative_shared_perms, Error **errp)
 {
     g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
     return bdrv_check_perm_common(list, q, true, cumulative_perms,
-                                  cumulative_shared_perms, ignore_children,
-                                  NULL, errp);
+                                  cumulative_shared_perms, NULL, errp);
 }
 
 static int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
                                    Transaction *tran, Error **errp)
 {
-    return bdrv_check_perm_common(list, q, false, 0, 0, NULL, tran, errp);
+    return bdrv_check_perm_common(list, q, false, 0, 0, tran, errp);
 }
 
 /*
@@ -2542,7 +2531,6 @@ char *bdrv_perm_names(uint64_t perm)
 static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
                                   uint64_t new_used_perm,
                                   uint64_t new_shared_perm,
-                                  GSList *ignore_children,
                                   Error **errp)
 {
     BdrvChild *c;
@@ -2554,10 +2542,6 @@ static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
     assert(new_shared_perm & BLK_PERM_WRITE_UNCHANGED);
 
     QLIST_FOREACH(c, &bs->parents, next_parent) {
-        if (g_slist_find(ignore_children, c)) {
-            continue;
-        }
-
         if ((new_used_perm & c->shared_perm) != new_used_perm) {
             char *user = bdrv_child_user_desc(c);
             char *perm_names = bdrv_perm_names(new_used_perm & ~c->shared_perm);
@@ -2587,7 +2571,7 @@ static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
     }
 
     return bdrv_check_perm(bs, q, cumulative_perms, cumulative_shared_perms,
-                           ignore_children, errp);
+                           errp);
 }
 
 static int bdrv_refresh_perms(BlockDriverState *bs, Error **errp)
@@ -4209,7 +4193,7 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
     QTAILQ_FOREACH(bs_entry, bs_queue, entry) {
         BDRVReopenState *state = &bs_entry->state;
         ret = bdrv_check_perm(state->bs, bs_queue, state->perm,
-                              state->shared_perm, NULL, errp);
+                              state->shared_perm, errp);
         if (ret < 0) {
             goto cleanup_perm;
         }
@@ -4221,7 +4205,7 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
                             bs_queue, state->perm, state->shared_perm,
                             &nperm, &nshared);
             ret = bdrv_check_update_perm(state->new_backing_bs, NULL,
-                                         nperm, nshared, NULL, errp);
+                                         nperm, nshared, errp);
             if (ret < 0) {
                 goto cleanup_perm;
             }
-- 
2.29.2


