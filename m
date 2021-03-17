Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E431633F3B4
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 15:51:21 +0100 (CET)
Received: from localhost ([::1]:42568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXW4-0002uT-V8
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 10:51:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXHj-0004kl-Lb; Wed, 17 Mar 2021 10:36:31 -0400
Received: from mail-eopbgr60091.outbound.protection.outlook.com
 ([40.107.6.91]:41454 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXHh-0006rZ-Jd; Wed, 17 Mar 2021 10:36:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NZcBTwkzatDJBZrGTemJVbmiR+4EEaoP5I6I/lKO7WZ8ub9qdutVKKPbMa6Atgw27iAw3RjrGgezGANJCAdgfNLH0NGMLlnHeLD6AED1hzOfDJ8g64pUrgHkypTUrGNML3PO7srSmsTGN/r5OD/4q/scujA3cOvwWyknsilW/PAf+cpUhqI/GonAtz0KvHU0Bs9KG8g/YX4xDYGuQDajEGEewBXGZFtPvLtJWQhi2CDVbBXf4F5CnqrxwvIq6gW1wCAg6ONYpQD+hhwBAmaBZIiy/p034r5IPVBwowy5FSTe5uVZv9hwTEYjbPlSmSv/5l63wyYcA9XNRw7qeLn0yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYcqiy4ihjujf/Jn0LG1ss8aPGVx9JfNETGztUANNPQ=;
 b=CgcJxe23w0fdKmq4WE3/FGJFPS/eV3Zhw28uBeljFGfNwWk22ZeqvIoCxzH83YUnISDyObbQuI2Rc/V1Ms1G08idQmrvglGKZOpINXqpcAOMr8RXf36TidYWYaeuMENgn/2EQF2yMJ1PAWok8OjoqN27ALxNvnIAuq9IqpNOWz8lF+OaWlyfmaaJ5S+J0yhKnkOCm2NBzeM7t5Do7zRO9ZtxGpdViQkOtzSHBkdYzAhAZgh+8p0IzEin4OkX0TFOmoyrm5+4Z8v04CgigtAsnQOY+gWFf8ODXZxTXCTMo6J7P3qjLUtsUB1WD4ZptnO7Uf4uWHh8wxw2uWQdoAf50A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYcqiy4ihjujf/Jn0LG1ss8aPGVx9JfNETGztUANNPQ=;
 b=ETpckUQYlhp/w3idYWOKzex2rfuskGfoHpqxcoOSBSl1wzKVzE5yvemoyqx/tAFaLveGGGDDvDx7JYcgTpRnKzlE6R0X03KfiQ2rCwDLTRCSpOfa10X9GwDBmVzj395/0ZFUNn6rYn7isP6CVLJ0xs3RLzSAHSyaH1yt139ImEw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3544.eurprd08.prod.outlook.com (2603:10a6:20b:4e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:36:27 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:36:27 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 17/36] block: fix bdrv_replace_node_common
Date: Wed, 17 Mar 2021 17:35:10 +0300
Message-Id: <20210317143529.615584-18-vsementsov@virtuozzo.com>
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
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 14:36:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 110ef3fc-be4d-4a0b-7fe9-08d8e9520c55
X-MS-TrafficTypeDiagnostic: AM6PR08MB3544:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3544AB2E23EF6EB51AF914FEC16A9@AM6PR08MB3544.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M0VvXPd2NRNEUpvW0GBK5qZc3UZ/qXWAbKH/KTu6hEWLjqtzVl6nOVwSaLBOBlzl7pnxOZN4/gtnzfvusg5NDMjGjJp0AXfLFNbE0HVUDsSfFXnbUnTvxXYfS7uEdBCTsQQ0hHKMJuYxBeInV0AOprdAsowBMk00KP+72szGFAgSu/ltO86XJUQRfOM2bHcGn79kgQbhLdKlbArWfHgxJl9L3eI3vfkrI00zNQdc3y+vDyUH+Ml6RODeuaEU6bVdPPPucZu5emlU/WffBUpQ1Wv6ez5OGlxD5awdR6u37FZgJxXf6rC626ynd2aIKKQrIeFsY59JIbZef8CmHvSjZgFZ8eJNUFZjYR+aEcGxvkN8vgmMdYdHR0VAeQWH88yQlmGHw8zvMErwxE/hZlToDx25MF3Jc4UwHMycCnsPuw0g8qs6+NmDwDlh2ZPmqB4pVaGP/mP3jMmftJExjz/s7fnUQZM3TEVUkKTyPBnnZ9YjY7qJYzvcPvMpuELtuE6vzVBAPDIfzD57hkZuYWQe/JtAziPnjnMtq7KnqaHo8p4d2sVL/8cZNk0G2ONCHgIEqG8TWY+qrCEtq849njeSdIGOs9yfALo4E7w56388nw7nITFh1wBY5V6wlzeXKa6I
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(39840400004)(136003)(396003)(186003)(8676002)(16526019)(26005)(86362001)(1076003)(52116002)(36756003)(6916009)(66476007)(6506007)(4326008)(6486002)(2616005)(5660300002)(8936002)(66556008)(66946007)(83380400001)(2906002)(478600001)(956004)(6666004)(69590400012)(6512007)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2tX5RKI8vWDGnBQhdiudIziFCsEkrGAhn4D58JZSF5CN9xizn47CISb/zqgm?=
 =?us-ascii?Q?TeF2kHn92Y6HxYFPutWJ13ujTRuzO17+K4Qaby3ViAOWM7LF5SXo4ko5wBzT?=
 =?us-ascii?Q?fmyGL++qD1uo7gGWPCUwZrkGiewK0qYUCluBiZIj4jRkgdgv6hhdrvYOx1wO?=
 =?us-ascii?Q?yHPGtWGR7bgWaAIZ3sZz3wKpezYHChWiiQjQ/6EL6F7QEg9z4YyWvk2IjD6C?=
 =?us-ascii?Q?Km3wQjCk3cVanMU9q14bj7UWPcjBlowDYzEsEXsY9DMBF+RT9zcKDywe38yY?=
 =?us-ascii?Q?3ii6QDhilbwuIavFq+qZi+VZVwiq/ujSrbfs0vr04atP4eS2VNuCnskV0iRi?=
 =?us-ascii?Q?lOnjMK36jTxXi9KcRFHcWTCCDxmCcrpunXYwxY7necwX6K4yoKt2lZr2T6jd?=
 =?us-ascii?Q?8vo7QUWqGiS78OvqpVffBHpl/8IJHLd1TaILKJ+bLosdHWSbExKxs9hNMFBk?=
 =?us-ascii?Q?+xXcbr4ZgHYGTP4wL0YXhoLPmBsZFbnFldaB/ktPAGIFPi57TIijZfC93HKJ?=
 =?us-ascii?Q?93fWXPH3ZrE4dE23sJ/28ZYZENReq6Z8PGosnNnieTqgMFey5ozhABR/TSiy?=
 =?us-ascii?Q?B2d2F55R6XjigrjbtcQaqOVDYF46NtJdiqzNZLgQsvVSs4OaibCcB4U79vUn?=
 =?us-ascii?Q?EhfopoJnxvmkUpguTUiRTpc0SKV7Db199ZiYw0bFNij6V1iVJjqH0AIb3hbP?=
 =?us-ascii?Q?QlqdmrMfs9255HZsfZ7rd6Idj1SvrTjF1l79CWqHv3O1Vuciv+RbtxiCDUiP?=
 =?us-ascii?Q?P0JUrHAGhG409DNq20rayZjkvB2MRz90HDcvjgCsguUsLaIqMd70m31XHLQa?=
 =?us-ascii?Q?XJHISVMuhlC31N60B+IOJQs7SFm5HVN2obLAU1tNuhJJlmQH1qqZRPWzxULX?=
 =?us-ascii?Q?71aYW6LZeOl61UmbcysSiD7DGeqtqV/p0MioE22ZOQ4drRYWawM6PLayBbCJ?=
 =?us-ascii?Q?S1UCMKB355wUKBhuZccbh1cbkZ0j7sM6EHw7YwuHDyCK44Bn8avPQKkYoyX2?=
 =?us-ascii?Q?n5toJmGFb1X5yekGjEDCrUOPLIiSeSPJd9HYKmVUjcD7ihwLj9+Zq+zCLH9w?=
 =?us-ascii?Q?EReBtISILAsoIdeZR063i8K2yoBsjJqJfS33cMFvG/eYo4OlemZkOS89ithq?=
 =?us-ascii?Q?l4G6x85O4kOcV4+dbZUvY0rGwg1DLhDhr9Z7AwyUrGO199z/i9sS1Lm5VQ1p?=
 =?us-ascii?Q?pDddej+pbUoCbJ/nxZaFHhdZy30N7gPUZ1fuQui77397X/yzSIy/dhsO/zWF?=
 =?us-ascii?Q?TMsuRynTZcbbq+C++qJC4KZRrP8dQ6PaEFqjgmSGGpsS/Q1vW/0xVoRQD1O1?=
 =?us-ascii?Q?UKczl65ZdDCfq5+pBDH/Ga4/?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 110ef3fc-be4d-4a0b-7fe9-08d8e9520c55
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:36:27.8048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H+vxiaIgVRFvCdwOlrEoHhVWiWhlmTZbaiLv6t8nggmNFwQ7gEFi11vcuRLrXcdKu3bgcOn9BMiC06Y2b9l7mlmeNQ9ckDsStz+hJ9qyGKQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3544
Received-SPF: pass client-ip=40.107.6.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

inore_children thing doesn't help to track all propagated permissions
of children we want to ignore. The simplest way to correctly update
permissions is update graph first and then do permission update. In
this case we just referesh permissions for the whole subgraph (in
topological-sort defined order) and everything is correctly calculated
automatically without any ignore_children.

So, refactor bdrv_replace_node_common to first do graph update and then
refresh the permissions.

Test test_parallel_exclusive_write() now pass, so move it out of
debugging "if".

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c                          | 43 +++++++++++++-------------------
 tests/unit/test-bdrv-graph-mod.c |  4 +--
 2 files changed, 20 insertions(+), 27 deletions(-)

diff --git a/block.c b/block.c
index 4f9d67a6a2..98ff44dbf7 100644
--- a/block.c
+++ b/block.c
@@ -2239,7 +2239,6 @@ static TransactionActionDrv bdrv_replace_child_drv = {
  *
  * Note: real unref of old_bs is done only on commit.
  */
-__attribute__((unused))
 static void bdrv_replace_child_safe(BdrvChild *child, BlockDriverState *new_bs,
                                     Transaction *tran)
 {
@@ -4843,8 +4842,9 @@ static int bdrv_replace_node_common(BlockDriverState *from,
                                     bool auto_skip, Error **errp)
 {
     BdrvChild *c, *next;
-    GSList *list = NULL, *p;
-    uint64_t perm = 0, shared = BLK_PERM_ALL;
+    Transaction *tran = tran_new();
+    g_autoptr(GHashTable) found = NULL;
+    g_autoptr(GSList) refresh_list = NULL;
     int ret;
 
     /* Make sure that @from doesn't go away until we have successfully attached
@@ -4855,7 +4855,12 @@ static int bdrv_replace_node_common(BlockDriverState *from,
     assert(bdrv_get_aio_context(from) == bdrv_get_aio_context(to));
     bdrv_drained_begin(from);
 
-    /* Put all parents into @list and calculate their cumulative permissions */
+    /*
+     * Do the replacement without permission update.
+     * Replacement may influence the permissions, we should calculate new
+     * permissions based on new graph. If we fail, we'll roll-back the
+     * replacement.
+     */
     QLIST_FOREACH_SAFE(c, &from->parents, next_parent, next) {
         assert(c->bs == from);
         if (!should_update_child(c, to)) {
@@ -4873,36 +4878,24 @@ static int bdrv_replace_node_common(BlockDriverState *from,
                        c->name, from->node_name);
             goto out;
         }
-        list = g_slist_prepend(list, c);
-        perm |= c->perm;
-        shared &= c->shared_perm;
+        bdrv_replace_child_safe(c, to, tran);
     }
 
-    /* Check whether the required permissions can be granted on @to, ignoring
-     * all BdrvChild in @list so that they can't block themselves. */
-    ret = bdrv_check_update_perm(to, NULL, perm, shared, list, errp);
-    if (ret < 0) {
-        bdrv_abort_perm_update(to);
-        goto out;
-    }
+    found = g_hash_table_new(NULL, NULL);
 
-    /* Now actually perform the change. We performed the permission check for
-     * all elements of @list at once, so set the permissions all at once at the
-     * very end. */
-    for (p = list; p != NULL; p = p->next) {
-        c = p->data;
+    refresh_list = bdrv_topological_dfs(refresh_list, found, to);
+    refresh_list = bdrv_topological_dfs(refresh_list, found, from);
 
-        bdrv_ref(to);
-        bdrv_replace_child_noperm(c, to);
-        bdrv_unref(from);
+    ret = bdrv_list_refresh_perms(refresh_list, NULL, tran, errp);
+    if (ret < 0) {
+        goto out;
     }
 
-    bdrv_set_perm(to);
-
     ret = 0;
 
 out:
-    g_slist_free(list);
+    tran_finalize(tran, ret);
+
     bdrv_drained_end(from);
     bdrv_unref(from);
 
diff --git a/tests/unit/test-bdrv-graph-mod.c b/tests/unit/test-bdrv-graph-mod.c
index a98100ddfd..b81787487a 100644
--- a/tests/unit/test-bdrv-graph-mod.c
+++ b/tests/unit/test-bdrv-graph-mod.c
@@ -407,10 +407,10 @@ int main(int argc, char *argv[])
                     test_should_update_child);
     g_test_add_func("/bdrv-graph-mod/parallel-perm-update",
                     test_parallel_perm_update);
+    g_test_add_func("/bdrv-graph-mod/parallel-exclusive-write",
+                    test_parallel_exclusive_write);
 
     if (debug) {
-        g_test_add_func("/bdrv-graph-mod/parallel-exclusive-write",
-                        test_parallel_exclusive_write);
         g_test_add_func("/bdrv-graph-mod/append-greedy-filter",
                         test_append_greedy_filter);
     }
-- 
2.29.2


