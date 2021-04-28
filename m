Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE2736DBBF
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 17:33:57 +0200 (CEST)
Received: from localhost ([::1]:46072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbmCK-0001Bb-3J
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 11:33:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblxf-0005ei-0T; Wed, 28 Apr 2021 11:18:47 -0400
Received: from mail-eopbgr30098.outbound.protection.outlook.com
 ([40.107.3.98]:58735 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblxZ-0001uH-Io; Wed, 28 Apr 2021 11:18:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZdUnDRm1QYvVYKaglQuYF7WYXAUOqjzfyCWStDAemN9Tn1wwNZMXE1FeD8z/MGouVqf/8lBSyaqigj6570aO3WNKLCd/CeLT4pWqWH7IgwfYxplUhy4KcVKNHPLZpLBIpMMteUYEJxlAfhuFsKTPhRHEfVaha8QyFndoENpt0FtVGTAGSa6lMo+LGrcHee9aVgKxn3ytFA19elIAUJQHeSIYfbXaRbsmQiNyPTpSFb7TCuJqQRxzW7jTkTnu4CETwYelDyJxnVPvtJqAKNW0vrtUiKWas+uqYMFeyFX5j6BL14vYq6V466J/b5Lst7PsA6MrYuEle7ZHCyG3xq14DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/kKSNrVyTUeFC37CEzyQXAAvLvTMbIY8j372SnKzG4=;
 b=je91cgcaFhFhbyPCu0UtrSqdPgmxWZyYOYTHkxJHxHuVszMJ81IVXLHXZbT9BXYlVWW/7ekjtg2yb3ZhHvSm7ou/ogtC9rXOaMy3jHJ1pURGxofrciwVeObNzXvMEYPEN6ufvRdagg7gLdMqLIdY9tURUYenGiCQ3yKmaWIVhWzzVhzELa1vrZ0QZ7rH47PNePh5RNZ8n769bhPOtRBi64lvVB1l8AnIYyGYm2oIrpTMRmayjzBJEPi44vFCK+fF/t0nV3VUZlM4Hi4bUfvlKy+Mh5worwDrH82tChCXqmbG+kZy5ECPioLapD5O5fZrBcZQ1iWA5h7WduLZjinHUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/kKSNrVyTUeFC37CEzyQXAAvLvTMbIY8j372SnKzG4=;
 b=Faeyxv64DToVpCNn4msc5zLTaWg4MRK3a0PsjYIDlKgdL+Bx0bc4o1LqZXx0/RncRVFSwBudL/oZjPp4Ut6YKM97n/fnvHvxI0fmQNXVzYjgMLZZ5ZlVfQ75Nox7b2M5yw+ij6R/pjV18QFs3hmA4q9TUV6+MRe23gFb0XV6WAo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6151.eurprd08.prod.outlook.com (2603:10a6:20b:290::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 28 Apr
 2021 15:18:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 15:18:37 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 13/36] block: use topological sort for permission update
Date: Wed, 28 Apr 2021 18:17:41 +0300
Message-Id: <20210428151804.439460-14-vsementsov@virtuozzo.com>
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
 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 15:18:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60423c1c-0223-4bec-5e7b-08d90a58e530
X-MS-TrafficTypeDiagnostic: AS8PR08MB6151:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6151F33122009D8EDB687E08C1409@AS8PR08MB6151.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GIhwlRPWzvwb8AVmQMcFi0yn+WsUWtbkQYyVkz4j6p0G+U13Yx3flwgeYZbLrW8rFf2uJlpYhPTULier8pB895+TQsDzDG0DrWwuriHraLP1b8OogDWGJhj7MsnDsJ2rpXEplgjEo6Mo3RdX+82znG2auAgqsvCrHlsmXOz/ubAwCKx/3njztrhuwJ7alByzS3UqOxcCckpZCUareDhWWKVxAWOLN2FdqAu1YtRdpK2RNwNN7IfOab8zBUm68URKhDjZFmIL3KVmzNaJ8kfZ5QPYP3ig41CsB9zWAIawhYRS81G2Y82wsVTzDTPzpc7eRVgScciwH84rM2lQ93DZhwayxjOXZDvgMkfMfRkRleuc+cBtowaedKuxpJFRHmGWzpUGpnn6GQg3l5+ARWx+SJIRsloM9ZqEUMjGAuuzgWg0ghYrHzXTe6+GOIZ6VK9/74FNmqtyT6/wiV1DVo/vV4nBLOvxP3NSyXFVnmunmwt73TWFnsw9pJhxW/qwunoErY4xlZkHWXT3PlKCy/OFR1nbpgajXQ5aEZBfCpId0Q6iuWvIrcCdLA3QSB5ssq8ezORBQ1br1zeAUgzl92nLzqqSTTOLiBvaGrgAP+LCleFm0ULPztwC5b56y9A1M4fmfFJu/ZTEmAnoQr9KlgU/B0tuhWSZ+kfMnuDs0fFPpHBr9OuL0ijUftbjK6F7vfIz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(396003)(136003)(366004)(346002)(478600001)(52116002)(36756003)(26005)(956004)(86362001)(6916009)(6666004)(5660300002)(316002)(186003)(6506007)(6512007)(2906002)(83380400001)(16526019)(15650500001)(4326008)(6486002)(66556008)(66476007)(8676002)(66946007)(1076003)(8936002)(2616005)(38350700002)(38100700002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?mLj3nwRVdTWPyD1HKiUvErRKlC+KyX52s+7/g00R1Ltj/Vs3lLiNISOQrKhb?=
 =?us-ascii?Q?aOy6L1dQas/G3MQAaLTc7UpS8gwxyGVOoTrv5dFik3ECLBXoQ1SI/DFGzDpI?=
 =?us-ascii?Q?8VWgR1A/m95206Pn3YMNcu9o2cYHq3acZaGj8fb2ahq+ZTR4m6vdlgry3sib?=
 =?us-ascii?Q?aegpymKXnPQCWLCGTwVPI94FGp5EVjmfjJFwOk2eIpM+QBbO8QChYkxQQoM5?=
 =?us-ascii?Q?DxtH2hkAAlVKhHrijwPw3bT6O1ScSkzUqVxlB/iO/kO/BopSGKY9Sgm5Wbzw?=
 =?us-ascii?Q?hs5DGTzL0/T2dtP17T5afuTn1cEPAatMdYXVokUVE868mn7DGDQYgzLsImxR?=
 =?us-ascii?Q?m18q1ivIRJrEYUlXUSVdxBI3z2dO92WmMeIQ5Vg/kWj7qKQkIwyAJiw4X1RM?=
 =?us-ascii?Q?1aN20z/Ppu0yAFFLx3OGaeCHYNlM3MPJENfYjfBG8VrlykSX1p7I0axQfbPb?=
 =?us-ascii?Q?yvjx3OV9EpvNTyXlWKTQv1OvJ1vvpw22qnnt9iKavp0aVcolfZqS/0WjDIb9?=
 =?us-ascii?Q?OY1eGxBSd9riiOhrCKiWdY9sRiO6XvEIQc14REbfEN6CQt8ehOiiEy2LlwBM?=
 =?us-ascii?Q?XnZYKXXaSeesbLW/8CU576oKBN+x00IRmyYJBgpRjVsLj8LMfZEy4i2fjnXn?=
 =?us-ascii?Q?NEuIM0AMW2CrBiOntu2aEahSLsTjzdRKf+KmQAeA9KiK5FF2UEUYeKX8OsAy?=
 =?us-ascii?Q?La+3TtCOs+dn5GQwuPGmS0q3vy3weMNkCraI/tD8Glr0vPtlXLVOaLriLckN?=
 =?us-ascii?Q?KfRYI7VBsQ2+bDjdplWVgba85nDihtGRCi7VBi/66WtJxOIu6QkvRF874Wxy?=
 =?us-ascii?Q?bAg7D17VZqvbQZZWvZRsQ63zI8YnIU+OA9mcHLhXWGntDoclIWWhZdQGhN8T?=
 =?us-ascii?Q?AVeN2vONpvCElNYtIz00hEbWKc3hyCzIIH8N/hroINL8S57tgNuPnM62zTgv?=
 =?us-ascii?Q?Q6kni/07I1clmU9vlOgiMM4x3OEhHafhkog8l2MxxYRK/oscHFVqKNXW1XhA?=
 =?us-ascii?Q?y1Eazh7/y11Uv+s3yONh3oy3EnXdTZ6MTRT4kMZibdfrDsrpc+kxTH3UczrH?=
 =?us-ascii?Q?GJXcsmk3Va5F/NjOsDy/per77CDn75zBnNDZUUTpnfiT2mWFj3pkIkBzWZQt?=
 =?us-ascii?Q?w1KJOO807JZ4smKK+bL5KWGk8FxR2tAgF8EdFcpoO7NbxSBszrZ75xYmxHwg?=
 =?us-ascii?Q?HEINFyKAqPHAy2oVY4v3tW1RynhwNKJ/SCxx7ZbRFexFQr8ltgDC/MZVd7i3?=
 =?us-ascii?Q?AaGOU51CPRXmlEPkaSP1PUddDDW40Gbq9PE0SJMjHfwiFf+IbCIdrp5INuTX?=
 =?us-ascii?Q?oyAXp7hiqQqoVlcpne11aT8n?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60423c1c-0223-4bec-5e7b-08d90a58e530
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:18:37.0428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 07T1HDc8jUOToXzf+vuEDAwWtgdPh8oGhZUbiw2TXmVY8Ykt348yD2BmyMeHLMfHq2wxeT3jvroOEDbcv5lKsKqHWHrU2K4obey74Ey/5rI=
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

Rewrite bdrv_check_perm(), bdrv_abort_perm_update() and bdrv_set_perm()
to update nodes in topological sort order instead of simple DFS. With
topologically sorted nodes, we update a node only when all its parents
already updated. With DFS it's not so.

Consider the following example:

    A -+
    |  |
    |  v
    |  B
    |  |
    v  |
    C<-+

A is parent for B and C, B is parent for C.

Obviously, to update permissions, we should go in order A B C, so, when
we update C, all parent permissions already updated. But with current
approach (simple recursion) we can update in sequence A C B C (C is
updated twice). On first update of C, we consider old B permissions, so
doing wrong thing. If it succeed, all is OK, on second C update we will
finish with correct graph. But if the wrong thing failed, we break the
whole process for no reason (it's possible that updated B permission
will be less strict, but we will never check it).

Also new approach gives a way to simultaneously and correctly update
several nodes, we just need to run bdrv_topological_dfs() several times
to add all nodes and their subtrees into one topologically sorted list
(next patch will update bdrv_replace_node() in this manner).

Test test_parallel_perm_update() is now passing, so move it out of
debugging "if".

We also need to support ignore_children in
bdrv_parent_perms_conflict()

For test 283 order of conflicting parents check is changed.

Note also that in bdrv_check_perm() we don't check for parents conflict
at root bs, as we may be in the middle of permission update in
bdrv_reopen_multiple(). bdrv_reopen_multiple() will be updated soon.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c                          | 116 +++++++++++++++++++++++++------
 tests/unit/test-bdrv-graph-mod.c |   4 +-
 tests/qemu-iotests/283.out       |   2 +-
 3 files changed, 99 insertions(+), 23 deletions(-)

diff --git a/block.c b/block.c
index e5af4cdae9..cbcc4c15a0 100644
--- a/block.c
+++ b/block.c
@@ -2054,7 +2054,9 @@ static bool bdrv_a_allow_b(BdrvChild *a, BdrvChild *b, Error **errp)
     return false;
 }
 
-static bool bdrv_parent_perms_conflict(BlockDriverState *bs, Error **errp)
+static bool bdrv_parent_perms_conflict(BlockDriverState *bs,
+                                       GSList *ignore_children,
+                                       Error **errp)
 {
     BdrvChild *a, *b;
 
@@ -2064,8 +2066,12 @@ static bool bdrv_parent_perms_conflict(BlockDriverState *bs, Error **errp)
      * directions.
      */
     QLIST_FOREACH(a, &bs->parents, next_parent) {
+        if (g_slist_find(ignore_children, a)) {
+            continue;
+        }
+
         QLIST_FOREACH(b, &bs->parents, next_parent) {
-            if (a == b) {
+            if (a == b || g_slist_find(ignore_children, b)) {
                 continue;
             }
 
@@ -2094,6 +2100,40 @@ static void bdrv_child_perm(BlockDriverState *bs, BlockDriverState *child_bs,
     }
 }
 
+/*
+ * Adds the whole subtree of @bs (including @bs itself) to the @list (except for
+ * nodes that are already in the @list, of course) so that final list is
+ * topologically sorted. Return the result (GSList @list object is updated, so
+ * don't use old reference after function call).
+ *
+ * On function start @list must be already topologically sorted and for any node
+ * in the @list the whole subtree of the node must be in the @list as well. The
+ * simplest way to satisfy this criteria: use only result of
+ * bdrv_topological_dfs() or NULL as @list parameter.
+ */
+static GSList *bdrv_topological_dfs(GSList *list, GHashTable *found,
+                                    BlockDriverState *bs)
+{
+    BdrvChild *child;
+    g_autoptr(GHashTable) local_found = NULL;
+
+    if (!found) {
+        assert(!list);
+        found = local_found = g_hash_table_new(NULL, NULL);
+    }
+
+    if (g_hash_table_contains(found, bs)) {
+        return list;
+    }
+    g_hash_table_add(found, bs);
+
+    QLIST_FOREACH(child, &bs->children, next) {
+        list = bdrv_topological_dfs(list, found, child->bs);
+    }
+
+    return g_slist_prepend(list, bs);
+}
+
 static void bdrv_child_set_perm_commit(void *opaque)
 {
     BdrvChild *c = opaque;
@@ -2158,10 +2198,10 @@ static void bdrv_child_set_perm_safe(BdrvChild *c, uint64_t perm,
  * A call to this function must always be followed by a call to bdrv_set_perm()
  * or bdrv_abort_perm_update().
  */
-static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
-                           uint64_t cumulative_perms,
-                           uint64_t cumulative_shared_perms,
-                           GSList *ignore_children, Error **errp)
+static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
+                                uint64_t cumulative_perms,
+                                uint64_t cumulative_shared_perms,
+                                GSList *ignore_children, Error **errp)
 {
     BlockDriver *drv = bs->drv;
     BdrvChild *c;
@@ -2226,21 +2266,43 @@ static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
     /* Check all children */
     QLIST_FOREACH(c, &bs->children, next) {
         uint64_t cur_perm, cur_shared;
-        GSList *cur_ignore_children;
 
         bdrv_child_perm(bs, c->bs, c, c->role, q,
                         cumulative_perms, cumulative_shared_perms,
                         &cur_perm, &cur_shared);
+        bdrv_child_set_perm_safe(c, cur_perm, cur_shared, NULL);
+    }
+
+    return 0;
+}
+
+static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
+                           uint64_t cumulative_perms,
+                           uint64_t cumulative_shared_perms,
+                           GSList *ignore_children, Error **errp)
+{
+    int ret;
+    BlockDriverState *root = bs;
+    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, root);
 
-        cur_ignore_children = g_slist_prepend(g_slist_copy(ignore_children), c);
-        ret = bdrv_check_update_perm(c->bs, q, cur_perm, cur_shared,
-                                     cur_ignore_children, errp);
-        g_slist_free(cur_ignore_children);
+    for ( ; list; list = list->next) {
+        bs = list->data;
+
+        if (bs != root) {
+            if (bdrv_parent_perms_conflict(bs, ignore_children, errp)) {
+                return -EINVAL;
+            }
+
+            bdrv_get_cumulative_perm(bs, &cumulative_perms,
+                                     &cumulative_shared_perms);
+        }
+
+        ret = bdrv_node_check_perm(bs, q, cumulative_perms,
+                                   cumulative_shared_perms,
+                                   ignore_children, errp);
         if (ret < 0) {
             return ret;
         }
-
-        bdrv_child_set_perm_safe(c, cur_perm, cur_shared, NULL);
     }
 
     return 0;
@@ -2250,10 +2312,8 @@ static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
  * Notifies drivers that after a previous bdrv_check_perm() call, the
  * permission update is not performed and any preparations made for it (e.g.
  * taken file locks) need to be undone.
- *
- * This function recursively notifies all child nodes.
  */
-static void bdrv_abort_perm_update(BlockDriverState *bs)
+static void bdrv_node_abort_perm_update(BlockDriverState *bs)
 {
     BlockDriver *drv = bs->drv;
     BdrvChild *c;
@@ -2268,11 +2328,19 @@ static void bdrv_abort_perm_update(BlockDriverState *bs)
 
     QLIST_FOREACH(c, &bs->children, next) {
         bdrv_child_set_perm_abort(c);
-        bdrv_abort_perm_update(c->bs);
     }
 }
 
-static void bdrv_set_perm(BlockDriverState *bs)
+static void bdrv_abort_perm_update(BlockDriverState *bs)
+{
+    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
+
+    for ( ; list; list = list->next) {
+        bdrv_node_abort_perm_update((BlockDriverState *)list->data);
+    }
+}
+
+static void bdrv_node_set_perm(BlockDriverState *bs)
 {
     uint64_t cumulative_perms, cumulative_shared_perms;
     BlockDriver *drv = bs->drv;
@@ -2298,7 +2366,15 @@ static void bdrv_set_perm(BlockDriverState *bs)
     /* Update all children */
     QLIST_FOREACH(c, &bs->children, next) {
         bdrv_child_set_perm_commit(c);
-        bdrv_set_perm(c->bs);
+    }
+}
+
+static void bdrv_set_perm(BlockDriverState *bs)
+{
+    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
+
+    for ( ; list; list = list->next) {
+        bdrv_node_set_perm((BlockDriverState *)list->data);
     }
 }
 
@@ -2411,7 +2487,7 @@ static int bdrv_refresh_perms(BlockDriverState *bs, Error **errp)
     int ret;
     uint64_t perm, shared_perm;
 
-    if (bdrv_parent_perms_conflict(bs, errp)) {
+    if (bdrv_parent_perms_conflict(bs, NULL, errp)) {
         return -EPERM;
     }
     bdrv_get_cumulative_perm(bs, &perm, &shared_perm);
diff --git a/tests/unit/test-bdrv-graph-mod.c b/tests/unit/test-bdrv-graph-mod.c
index a6064b1863..e64e81a07c 100644
--- a/tests/unit/test-bdrv-graph-mod.c
+++ b/tests/unit/test-bdrv-graph-mod.c
@@ -406,12 +406,12 @@ int main(int argc, char *argv[])
     g_test_add_func("/bdrv-graph-mod/update-perm-tree", test_update_perm_tree);
     g_test_add_func("/bdrv-graph-mod/should-update-child",
                     test_should_update_child);
+    g_test_add_func("/bdrv-graph-mod/parallel-perm-update",
+                    test_parallel_perm_update);
 
     if (debug) {
         g_test_add_func("/bdrv-graph-mod/parallel-exclusive-write",
                         test_parallel_exclusive_write);
-        g_test_add_func("/bdrv-graph-mod/parallel-perm-update",
-                        test_parallel_perm_update);
         g_test_add_func("/bdrv-graph-mod/append-greedy-filter",
                         test_append_greedy_filter);
     }
diff --git a/tests/qemu-iotests/283.out b/tests/qemu-iotests/283.out
index 37c35058ae..73eb75102f 100644
--- a/tests/qemu-iotests/283.out
+++ b/tests/qemu-iotests/283.out
@@ -5,7 +5,7 @@
 {"execute": "blockdev-add", "arguments": {"driver": "blkdebug", "image": "base", "node-name": "other", "take-child-perms": ["write"]}}
 {"return": {}}
 {"execute": "blockdev-backup", "arguments": {"device": "source", "sync": "full", "target": "target"}}
-{"error": {"class": "GenericError", "desc": "Cannot set permissions for backup-top filter: Conflicts with use by other as 'image', which uses 'write' on base"}}
+{"error": {"class": "GenericError", "desc": "Cannot set permissions for backup-top filter: Conflicts with use by source as 'image', which does not allow 'write' on base"}}
 
 === backup-top should be gone after job-finalize ===
 
-- 
2.29.2


