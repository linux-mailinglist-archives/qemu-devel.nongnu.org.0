Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9249736DC1B
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 17:41:50 +0200 (CEST)
Received: from localhost ([::1]:34224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbmJx-0008F9-M6
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 11:41:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblyX-0006Ba-UZ; Wed, 28 Apr 2021 11:19:42 -0400
Received: from mail-eopbgr30098.outbound.protection.outlook.com
 ([40.107.3.98]:58735 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblyV-0001uH-5T; Wed, 28 Apr 2021 11:19:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BRG82TLqhmJf5LCRgCeQlkRamO9h7b4Htx+6k71AXu15WG1UehYEBy3DRd1M5VHCNBwCRqMA8RCsDgTT1xd3KVoEswNhKRMjfpqX2vYTLMsbWBBuKRqNowJHp5lC7KNeZEQ0xlg+0XqoT/jRjxnJ88OV/N1siLZVpmRHVvkljGSSx39ESbSczcPUSbgkLWi1nC/Mo3VerNZKgNzMtcQdjOdTqElWneY/Wdn70YpBzh8c1GvNuXPhJOKbRPJPpznlIF7U9a9B4U3ocnP2t5bP0rUt9ZMEN2C2mx/P0WvSU53Y/VrY+nFvs3SmptPXwIz+2WCY3JVRmXFJm+svg+4Qyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ogdSk0lYpv3bF5RGWn31dSK+rb6SQEJEfobw+evXVmc=;
 b=Rfv/pcMdhVxtcV0Ddm2lBFDGyGY0smS19lLxFqc4R07QdicAyAhU8lmt00/SU/HoXvCRZg97OdyOdM4QUoqvYi1fJdMv6mDVk51ycRzf59a2RMy6wtwAqnGZeqOu23jhqgxrWoawHOSwm1grovNQXd/KkBBxji+KK2oNTkaTVMjY2CqgrONXrqfmESXZLhcTwR18W5h28Vhmqvoh/hiz4axG3SjgtstJrHqXcLyyj27nvISOI85bkc6RW7QUR6FKZXPpcUOW5NmIYTvYHIirLbP119Ix0bGS7gWlgld2TAsCAgEJXCY7w7KUb1uZx3okgsOu4g1xIPfhcLwmLbXA+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ogdSk0lYpv3bF5RGWn31dSK+rb6SQEJEfobw+evXVmc=;
 b=wO0slPEGzH+6A6cvIjlD4OwwwhMNE9FN03X4sIb3YZpq8k9rssZ+smN7jSGvDXEOnEvjeuVkI5uRi2ETvq3ovLZ1ef8Xb+VGCG+rYm8E5K8QIazi1vk3W/Oh/feX4ssbnBBL6zBmwpucVC4YJjhJfmwLfuPYG05FdOQMnzr4TyY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6151.eurprd08.prod.outlook.com (2603:10a6:20b:290::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 28 Apr
 2021 15:18:51 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 15:18:51 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 25/36] block: drop ignore_children for permission update
 functions
Date: Wed, 28 Apr 2021 18:17:53 +0300
Message-Id: <20210428151804.439460-26-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210428151804.439460-1-vsementsov@virtuozzo.com>
References: <20210428151804.439460-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1PR09CA0045.eurprd09.prod.outlook.com
 (2603:10a6:7:3c::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1PR09CA0045.eurprd09.prod.outlook.com (2603:10a6:7:3c::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 15:18:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c38ccf64-3471-41bf-d897-08d90a58ed81
X-MS-TrafficTypeDiagnostic: AS8PR08MB6151:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6151D9BF63E5A9A2C30712C2C1409@AS8PR08MB6151.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:529;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iSAcWpmvk27E4o1eSelkeUrsUhdS2hT4guecayYWMUmOtx/iUQ2OItPexg+Xx1UvwTgqi7zxo6RIQcLXPNicJjVm8SNNxXyZ1h8JQoAA38kbhqqeaH0fNkK5doN6MCsjQJOumrGXVS9X2F6xTvEaPQJDiS8T+H7kNNkgadmmZSQFTZ6G2+OjMO6LF7ZywoMA0BgtIGpPMvDn3B02+qGT0sCiqu1AB//CbODv+m/Wse0RMv2YSW9WtujXvEr7KWyjA4hO0dReroFp/a7VtZCSP8F17OcV8vi3VEo2jdI/ibx9UhsFv9U9jL+URU5595wb8eOCn8hlCgA+VRZI2EvuwP2A2XTzVOXzKq3dgDa8DrH+DPgSEuHwiaPEM6+ffhsntmxsDY3h2q2rtL2jEKaiQS6fwg+goP8S04suWQ8Bjq3+SxqllOuhUrBQ9SS/OQ53rAyltL+qCuO6qn3eZDwjNB5W7Zeyq0ibwgzEsOXpl4Q6YPJ9ZCLhSSwiXfcJ3XcKb+e/HwfYV6FP/nYf4u2xIcKIZHMHfc4t74SQp0LMlsjzSZosmJLdFMOa/rbvqgwIw1zuxMnjPCKMmG6BkCzTLh8hbaualGK3X5f2r/2IE1moqGfbIuCDYLTyaxQYAuAWNKyAT85y6WRpSBbRWLmoJAD/Clr50g4eJ33rhf81M51HEBGFFSg0EEyW/4+3iYIX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(396003)(136003)(366004)(346002)(478600001)(52116002)(36756003)(26005)(956004)(86362001)(6916009)(6666004)(5660300002)(316002)(186003)(6506007)(6512007)(2906002)(83380400001)(16526019)(4326008)(6486002)(66556008)(66476007)(8676002)(66946007)(1076003)(8936002)(2616005)(38350700002)(38100700002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?EOY/wRiRhhv9JEk10aZZMNFunSqTaCwcKqVBH2VBjzq4wptR89aZDRn9g2mX?=
 =?us-ascii?Q?HUJs2iN7juxaDBWJftISZ2i6bwu3aIARPgaRqB0cCzV5fWVaGVJ9cU0Xg2Ro?=
 =?us-ascii?Q?6IXCwv8yVl0jiF88z8ow6AlLjQ05wgX0eoRi0LGRLWmNw32qQ9UtfSc0UKgE?=
 =?us-ascii?Q?STZzXLZbUM7ao+aqF5BBg+GUmogqqiF0pip1rhgCILWE9GuN4poOv4hjvBpi?=
 =?us-ascii?Q?LpwqJfyNyYtVQFS5f1PsToKg32YfEU8VOPeukf/Q9LCAXtOSI4mPK9Or+RRH?=
 =?us-ascii?Q?vmzKq7ejc/ktEFM55YYzFhS/WFaJBFYkaXHHwqC2LsSNlxvPDMKJZEVH4XQP?=
 =?us-ascii?Q?D+Unleahzn+K8WJtTTgtaV6sbX+snOAZ7M18eHMy9Y5zaVi2KTZjBzQmIx/i?=
 =?us-ascii?Q?6tM0Pl3XgA5uOT1S0e3TvcK2jzk9mTsVGN70a+bXAxT0FR8P42u2zqxYFLNJ?=
 =?us-ascii?Q?R3D5oaelPvc7TMb/YbMdxEGoDm5eDql4Sj2+i0B7DhAL5e/ng5sQdSU3Ir/k?=
 =?us-ascii?Q?P90S/XmLVKFbUMFYD13xn/kZqNLq27wVrLaS/ZY+TRts4N3XNIq4ztwbr/l9?=
 =?us-ascii?Q?zDZPqW9z2FveAEF1XjIwexm3edAIA8bam6SGrWCodo8xebquC99URBb9oOz/?=
 =?us-ascii?Q?CBl6+9uwgTvWBiSd1ixcw1lppfh0yh69p7LmpQSoiF3Bj3VocMDTLXHePYLF?=
 =?us-ascii?Q?Iii2DcWcdwMppJ5QcFMyCWrdfVXbgYwEfRcUaFPonksYv/1hluur9V2CN/w6?=
 =?us-ascii?Q?GySyTV5C+7KGWu6oH4/xeR+5vhXOfXoRtUxOrTVWO8IwPqm2c6MK3dISvpKc?=
 =?us-ascii?Q?uZoP69Sp8NW8wKFBufb4c6//wRCdcgHJJDl5P41cfsWUh4NjY2tEQ4gdveke?=
 =?us-ascii?Q?SZprKDJJysvgKXOuWT3X3a6xr7j+H22WwDFhhxUFPUU+oaK3sU5/DHAX9qu0?=
 =?us-ascii?Q?YkYQynK7DH8AmsNxQmPuIJegg6EdO2iqcXmDd+TnDqB8P0K1phJfzT3OI630?=
 =?us-ascii?Q?jUhaDF7aWzBBQv6rl9mjNqWVxKxe9OLduuA/KejOSz+vqnXbOIxH4PGB0E3V?=
 =?us-ascii?Q?lSZPqHEWRoNa4X02T3DzqB/o2bScmYwlgzE9a/FxoH3w3Gk7f1+kiwto1xAs?=
 =?us-ascii?Q?iKSSSgYay91cVhaRTwEodcPIbNUtDbwBQapWIHwoEx7HQP4gu5UsykHcFlA8?=
 =?us-ascii?Q?K5SeLEN9z3OrcVH2vOLhlPjS1Le4mEvE3joCPu426KPP1XXaQtw85BB3NoRc?=
 =?us-ascii?Q?lgZwk/m2vHHrhEc+3o2isz0YzuLr/fF388UFEK0cv+7L8w3f9c7P7DwAY+oM?=
 =?us-ascii?Q?luyUnDtesQwm4uWShB73AiIA?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c38ccf64-3471-41bf-d897-08d90a58ed81
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:18:50.8994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F7XoC5qdCrlsCFPBGRuOgAJL/91K9kJoFYk1i3ySaVLvApWfQ9Ttp8N0XTVQ9EQCX6Mbx0jLeLXkt9jloXiF+NCvk9WNR/43Pav5GYHZtCo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6151
Received-SPF: pass client-ip=40.107.3.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 38 +++++++++++---------------------------
 1 file changed, 11 insertions(+), 27 deletions(-)

diff --git a/block.c b/block.c
index 68dfd822dd..46af5852ab 100644
--- a/block.c
+++ b/block.c
@@ -1988,7 +1988,6 @@ static int bdrv_fill_options(QDict **options, const char *filename,
 static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
                                   uint64_t new_used_perm,
                                   uint64_t new_shared_perm,
-                                  GSList *ignore_children,
                                   Error **errp);
 
 typedef struct BlockReopenQueueEntry {
@@ -2065,9 +2064,7 @@ static bool bdrv_a_allow_b(BdrvChild *a, BdrvChild *b, Error **errp)
     return false;
 }
 
-static bool bdrv_parent_perms_conflict(BlockDriverState *bs,
-                                       GSList *ignore_children,
-                                       Error **errp)
+static bool bdrv_parent_perms_conflict(BlockDriverState *bs, Error **errp)
 {
     BdrvChild *a, *b;
 
@@ -2077,12 +2074,8 @@ static bool bdrv_parent_perms_conflict(BlockDriverState *bs,
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
 
@@ -2310,7 +2303,6 @@ static void bdrv_replace_child_safe(BdrvChild *child, BlockDriverState *new_bs,
 static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
                                 uint64_t cumulative_perms,
                                 uint64_t cumulative_shared_perms,
-                                GSList *ignore_children,
                                 Transaction *tran, Error **errp)
 {
     BlockDriver *drv = bs->drv;
@@ -2393,7 +2385,6 @@ static int bdrv_check_perm_common(GSList *list, BlockReopenQueue *q,
                                   bool use_cumulative_perms,
                                   uint64_t cumulative_perms,
                                   uint64_t cumulative_shared_perms,
-                                  GSList *ignore_children,
                                   Transaction *tran, Error **errp)
 {
     int ret;
@@ -2404,7 +2395,7 @@ static int bdrv_check_perm_common(GSList *list, BlockReopenQueue *q,
 
         ret = bdrv_node_check_perm(bs, q, cumulative_perms,
                                    cumulative_shared_perms,
-                                   ignore_children, tran, errp);
+                                   tran, errp);
         if (ret < 0) {
             return ret;
         }
@@ -2415,7 +2406,7 @@ static int bdrv_check_perm_common(GSList *list, BlockReopenQueue *q,
     for ( ; list; list = list->next) {
         bs = list->data;
 
-        if (bdrv_parent_perms_conflict(bs, ignore_children, errp)) {
+        if (bdrv_parent_perms_conflict(bs, errp)) {
             return -EINVAL;
         }
 
@@ -2424,7 +2415,7 @@ static int bdrv_check_perm_common(GSList *list, BlockReopenQueue *q,
 
         ret = bdrv_node_check_perm(bs, q, cumulative_perms,
                                    cumulative_shared_perms,
-                                   ignore_children, tran, errp);
+                                   tran, errp);
         if (ret < 0) {
             return ret;
         }
@@ -2435,19 +2426,17 @@ static int bdrv_check_perm_common(GSList *list, BlockReopenQueue *q,
 
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
@@ -2576,7 +2565,6 @@ char *bdrv_perm_names(uint64_t perm)
 static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
                                   uint64_t new_used_perm,
                                   uint64_t new_shared_perm,
-                                  GSList *ignore_children,
                                   Error **errp)
 {
     BdrvChild *c;
@@ -2588,10 +2576,6 @@ static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
     assert(new_shared_perm & BLK_PERM_WRITE_UNCHANGED);
 
     QLIST_FOREACH(c, &bs->parents, next_parent) {
-        if (g_slist_find(ignore_children, c)) {
-            continue;
-        }
-
         if ((new_used_perm & c->shared_perm) != new_used_perm) {
             char *user = bdrv_child_user_desc(c);
             char *perm_names = bdrv_perm_names(new_used_perm & ~c->shared_perm);
@@ -2621,7 +2605,7 @@ static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
     }
 
     return bdrv_check_perm(bs, q, cumulative_perms, cumulative_shared_perms,
-                           ignore_children, errp);
+                           errp);
 }
 
 static int bdrv_refresh_perms(BlockDriverState *bs, Error **errp)
@@ -4244,7 +4228,7 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
     QTAILQ_FOREACH(bs_entry, bs_queue, entry) {
         BDRVReopenState *state = &bs_entry->state;
         ret = bdrv_check_perm(state->bs, bs_queue, state->perm,
-                              state->shared_perm, NULL, errp);
+                              state->shared_perm, errp);
         if (ret < 0) {
             goto cleanup_perm;
         }
@@ -4256,7 +4240,7 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
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


