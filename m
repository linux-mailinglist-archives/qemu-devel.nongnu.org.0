Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 569552C684D
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 15:57:49 +0100 (CET)
Received: from localhost ([::1]:43524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kifC0-0006bZ-3X
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 09:57:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif10-0001DF-5b; Fri, 27 Nov 2020 09:46:28 -0500
Received: from mail-am6eur05on2121.outbound.protection.outlook.com
 ([40.107.22.121]:11777 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif0u-0003Hm-9Q; Fri, 27 Nov 2020 09:46:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FGEO/PaciF/FMhh4K0mClHIz2f8qDANUrm3oqU9hYmihfC3L6RnSOXWHolNXGKWBfId+SJr06z2o1bpo0mVdnhVpMlPEfAQSJTHJpDaD5JMl7QsXXdTyMMOVYZO+BRDxiiIh6Z1vXlSH0J0K1IyoquSa+AahX7uZNdXkyZp9ag2IpPEn08eIm9eYrOF0h8aAw9J8aWXrCEPf4/7W1Xw0cWOUjqHlS5OdhqT2dKJbY3B+qsBfNTOkl2NwOyYL+RIN3aLh3NNZs7zDsNW+YGTiO6vEPcAtKyU6roCUwWt6glvEqg+WxDsF3p8KG731DH9TFvY1KbBnjQv0ktlLDh7wNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tbpsSlq/vuvTGTEEl3QYSt5yHpOFzKwnxsdJQypCbAI=;
 b=c32Sihu+5vZyC9ykAUMFgTQI3zfgbPLfXJdvf9JnlSqZCCf+WlYyvEPu7baqngglLyTIVhh/P+lT08GfDdIwj9SSDv6ElAeJYf1DhViejh9a2kZYhnxodW2/r/NqHI87eqE5OyUmxeK9AO5KkCdQOTh8JaPOh1NJMAgCPsNYLpO7RBBoDGRV4+wAI2p0eFgufq2VAfaBCImuCqe5Yg0IBCDOKrkIlHd5kQaXVyF1rlu4k4K9bv7+vWRk1KoAdoeBWIzmq2fc6qo9DM4KP/vwmyFFkYzPKAYAabDEygcDe0zSoSthSeRU+0hbFbVDo+zEH9D5jjQS7sLqr4hpis8aIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tbpsSlq/vuvTGTEEl3QYSt5yHpOFzKwnxsdJQypCbAI=;
 b=h70qum+KGQAureBEkq/n8xvVYq501KMXA1UmnA8EM1OU37ERT2MzhLMpAjgI/a3vxRLj3BfHAhYP80hS4J82RCyxrT0dGMxwSR5xlyKgRHgFbj9ZftUNZ2rx8zgjPmQRWMpik0BlxtRLw1hYsqPcneX149cVPLj+6HADuVwBpww=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5078.eurprd08.prod.outlook.com (2603:10a6:20b:e7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Fri, 27 Nov
 2020 14:46:06 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Fri, 27 Nov 2020
 14:46:06 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH v2 15/36] block: use topological sort for permission update
Date: Fri, 27 Nov 2020 17:45:01 +0300
Message-Id: <20201127144522.29991-16-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201127144522.29991-1-vsementsov@virtuozzo.com>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM4PR0501CA0052.eurprd05.prod.outlook.com
 (2603:10a6:200:68::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.91) by
 AM4PR0501CA0052.eurprd05.prod.outlook.com (2603:10a6:200:68::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22 via Frontend
 Transport; Fri, 27 Nov 2020 14:45:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b406005-845b-40f7-9262-08d892e32103
X-MS-TrafficTypeDiagnostic: AM6PR08MB5078:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB507840CA0A91E3ACA251FB0CC1F80@AM6PR08MB5078.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cu9GiE4dFDE3oRn08gsL9HfsBEjeHrvK7zxMk2FCbCdTLq4fjkucLFhdi9BK3x3OdhFDKQS2MQzfpm29v4tKiE7fl611S2W1IeuneqjAHlkc2D3TJL39ohKxdVklkKLKNMMVVycEXjo5449e/KLl4o4sIV1dMmMrX+msbtAsziPZdKPK91DIJqDlz/CLCjh2znyRg4TTULnWzeAg1LgaY9ghqbzx2Nu4+MMNre0M74qsGr7dbcpCv1ao+O/sflK2ZUCQ1IWaxw2GVHTLT64FuatHK3OH7YhLwD3Z1jG5ODFJmGRGX2EXbHLAT24IouWJeIkalMwe9FX52UqjfGEvf0rZuxhJHnyYKpHTB9z9hjd8xeA4LO4wzY4uYqTE5SK+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(346002)(136003)(396003)(376002)(86362001)(16526019)(66556008)(66476007)(478600001)(8676002)(186003)(66946007)(26005)(52116002)(83380400001)(6506007)(69590400008)(107886003)(6666004)(316002)(4326008)(36756003)(15650500001)(5660300002)(6486002)(2616005)(956004)(1076003)(6916009)(6512007)(8936002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?3WIb7PUWMGalyUq6kGtXzcTPuHwyrtTdxyhUGPmPoPjXxPMFEfH5iAQlxmu+?=
 =?us-ascii?Q?aq85RNEZIiSORUea6W6duT8DlCu4mqF0wEhZsgDZIZatSIBOchpu8OxnS65K?=
 =?us-ascii?Q?brvx03Kip7QUVcC6vudy4aCZyaA4AKeFjSpN187d9725OrwmF79TAXz2aYiM?=
 =?us-ascii?Q?jpKUkCh9c3o/RWvC6NPOQnaCT89Oh5Az3dCPsBeLsMtT0u0rXZWX3ymnee00?=
 =?us-ascii?Q?ECVUmJsQONkJLqOVr7K2o6draQUhKd4/iXgv2VHW5wkYNmfcBOszGDsvKutC?=
 =?us-ascii?Q?uzw/HGkIKBoHL4Gc2gs78cVZuJ401VWT4nrHLwoQLDunhOhtTJkGuB5zERT1?=
 =?us-ascii?Q?S55srvh37H9ne8/8eMW2ZvjFd87XULkBsy21s6LEjnIgXK+HLWaWtU7gZiTJ?=
 =?us-ascii?Q?S+LVStszBJqKnaWs6esyPQjQFDpHAhVxnC/a1OMA4CpTXt9QyIte8iKlP8s9?=
 =?us-ascii?Q?RVyEVQF45GAjUgVJjxrc8m1IPm48ktTYhAPQ+3JX38YHRfV+u2vXWK4kTgw9?=
 =?us-ascii?Q?+5nSY/IgGKIy1ZX2skfw1ctK4P4/tQzbDMUOXtPvh87TNXFRQjiLgRY0Uc/E?=
 =?us-ascii?Q?odv+CeMWb0PCQT8ldYQ+5RaJXlwsViOGwY+Fp1xP0N94cWqkknYlF9HKDM06?=
 =?us-ascii?Q?uerpKfnsOXmv2Aji8o6L/bih6XwY8BNW/7xCGyDvpFy7sHNefIMQ9aVE6D07?=
 =?us-ascii?Q?24awfQIv9wzXZ10VmwM1xJuJEAqRxnvZ4BYO4C8BmsyOv6XifcCWbqDJ9ttE?=
 =?us-ascii?Q?F9Zl9eDWUx50ToNOi/zXSW75yUX0KGoEne5tZmTpdw4UciU62o732bqA8ZlG?=
 =?us-ascii?Q?mfVDn/DXi72QmiF/gwvAKWq15HM5l5xgHXgkIkq8ZpgDsezaXizkZYQjBrD7?=
 =?us-ascii?Q?4oIVlM65WnV7EaZcIr69A3DLGowWEO+DLTt+91e6I8Mk02+LodGPtrXtuNLl?=
 =?us-ascii?Q?qftMUUUmtYqDCKEkGK9ta/VBbWtbnCBp6PMzywf2Ts2rXslvZYxdgktRvjN8?=
 =?us-ascii?Q?S7jV?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b406005-845b-40f7-9262-08d892e32103
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 14:45:48.4368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wamZWVTTDPb6sVYr3gq8Y7dHD3svrRrshLlgN2WVauak5EDaWH0PIOCeEOfchFZvw/pD5IJmEijvuuiCClOxGKWwPy3eThKL2/roBPeNjpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5078
Received-SPF: pass client-ip=40.107.22.121;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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
bdrv_check_parents_compliance().

For test 283 order of parents compliance check is changed.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c                     | 103 +++++++++++++++++++++++++++++-------
 tests/test-bdrv-graph-mod.c |   4 +-
 tests/qemu-iotests/283.out  |   2 +-
 3 files changed, 86 insertions(+), 23 deletions(-)

diff --git a/block.c b/block.c
index 92bfcbedc9..81ccf51605 100644
--- a/block.c
+++ b/block.c
@@ -1994,7 +1994,9 @@ static bool bdrv_a_allow_b(BdrvChild *a, BdrvChild *b, Error **errp)
     return false;
 }
 
-static bool bdrv_check_parents_compliance(BlockDriverState *bs, Error **errp)
+static bool bdrv_check_parents_compliance(BlockDriverState *bs,
+                                          GSList *ignore_children,
+                                          Error **errp)
 {
     BdrvChild *a, *b;
 
@@ -2005,7 +2007,9 @@ static bool bdrv_check_parents_compliance(BlockDriverState *bs, Error **errp)
      */
     QLIST_FOREACH(a, &bs->parents, next_parent) {
         QLIST_FOREACH(b, &bs->parents, next_parent) {
-            if (a == b) {
+            if (a == b || g_slist_find(ignore_children, a) ||
+                g_slist_find(ignore_children, b))
+            {
                 continue;
             }
 
@@ -2034,6 +2038,29 @@ static void bdrv_child_perm(BlockDriverState *bs, BlockDriverState *child_bs,
     }
 }
 
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
@@ -2098,10 +2125,10 @@ static void bdrv_child_set_perm_safe(BdrvChild *c, uint64_t perm,
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
@@ -2166,21 +2193,43 @@ static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
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
+
+    for ( ; list; list = list->next) {
+        bs = list->data;
+
+        if (bs != root) {
+            if (!bdrv_check_parents_compliance(bs, ignore_children, errp)) {
+                return -EINVAL;
+            }
+
+            bdrv_get_cumulative_perm(bs, &cumulative_perms,
+                                     &cumulative_shared_perms);
+        }
 
-        cur_ignore_children = g_slist_prepend(g_slist_copy(ignore_children), c);
-        ret = bdrv_check_update_perm(c->bs, q, cur_perm, cur_shared,
-                                     cur_ignore_children, errp);
-        g_slist_free(cur_ignore_children);
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
@@ -2190,10 +2239,8 @@ static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
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
@@ -2208,11 +2255,19 @@ static void bdrv_abort_perm_update(BlockDriverState *bs)
 
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
@@ -2238,7 +2293,15 @@ static void bdrv_set_perm(BlockDriverState *bs)
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
 
@@ -2351,7 +2414,7 @@ static int bdrv_refresh_perms(BlockDriverState *bs, Error **errp)
     int ret;
     uint64_t perm, shared_perm;
 
-    if (!bdrv_check_parents_compliance(bs, errp)) {
+    if (!bdrv_check_parents_compliance(bs, NULL, errp)) {
         return -EPERM;
     }
     bdrv_get_cumulative_perm(bs, &perm, &shared_perm);
diff --git a/tests/test-bdrv-graph-mod.c b/tests/test-bdrv-graph-mod.c
index 74f4a4153b..0d62e05ddb 100644
--- a/tests/test-bdrv-graph-mod.c
+++ b/tests/test-bdrv-graph-mod.c
@@ -316,12 +316,12 @@ int main(int argc, char *argv[])
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
     }
 
     return g_test_run();
diff --git a/tests/qemu-iotests/283.out b/tests/qemu-iotests/283.out
index d8cff22cc1..fbb7d0f619 100644
--- a/tests/qemu-iotests/283.out
+++ b/tests/qemu-iotests/283.out
@@ -5,4 +5,4 @@
 {"execute": "blockdev-add", "arguments": {"driver": "blkdebug", "image": "base", "node-name": "other", "take-child-perms": ["write"]}}
 {"return": {}}
 {"execute": "blockdev-backup", "arguments": {"device": "source", "sync": "full", "target": "target"}}
-{"error": {"class": "GenericError", "desc": "Cannot set permissions for backup-top filter: Conflicts with use by other as 'image', which uses 'write' on base"}}
+{"error": {"class": "GenericError", "desc": "Cannot set permissions for backup-top filter: Conflicts with use by source as 'image', which does not allow 'write' on base"}}
-- 
2.21.3


