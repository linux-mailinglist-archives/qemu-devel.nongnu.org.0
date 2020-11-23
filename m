Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE8C2C168E
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 21:32:32 +0100 (CET)
Received: from localhost ([::1]:59814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khIVj-0004s3-9K
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 15:32:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khID2-0004Fm-1H; Mon, 23 Nov 2020 15:13:12 -0500
Received: from mail-am6eur05on2106.outbound.protection.outlook.com
 ([40.107.22.106]:21121 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khICz-0007NS-Fg; Mon, 23 Nov 2020 15:13:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EYLXk/jrV5FuP64NCtaNCJsEK9cEH8wUhmmDIFKCConn5/AzXPnO4aU78kax8EpjYEyrzna9MttvRdyM0mVHUXdD7DOq11lCLlF8ZDfEPDaadlBY3FEsrOWuljsmva8XE69Vm6yXkhYQYIPLGKav8/uDaIAKdeo7KqN/AwjgfYfZZjgNB9fpEtC3tladi9W6NpoLfMNHJGImqInJMdH4AL05K0nHevvYIQubEOHs9FSoWy+SLMeAolvAHtZajUE+FwmZsMySeFN1WBQC6x10DA3QTPAdRpV5b6E9aN5NzFb4wfigd5n71LpcDJwCSQ00g6wGorwqL2WYQ8Kmy9K6Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/6mHFxXzwcxhTMvjU3/1HWt8z3O5G6pz+WouTb1CKo=;
 b=gSkcfaeQT0TMHELrfTo/BMfjJclCeHSJdQkFSm+ntN9nOhrztdbWptuVLxmp/mDhALTbWhttw2glDfDneEtJZderEdjocsXgi26r3HJe5eJ2Of9a6XFrjh0R08LDyeX+Qc7MrLKMQx9oNvydDtxSbuzipqeuvnqFCGQC0XdJkTjZg2mb2CJY5vZwLr8fbifBShT00v4ac2moiLpl6TSJKtRHur/bJ0Eftpx85l773MkN1l7hjLnvvEnyiDVXir4INmdDP6D9qDoHbIgfXjH/NhnXXkT6jAGlE/r2p+h5PLvB3UbOPcmru+Ai5s+CQ21BHOUMKJuitiCjZYVcawWKfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/6mHFxXzwcxhTMvjU3/1HWt8z3O5G6pz+WouTb1CKo=;
 b=LShF/VVcSCb2jnNbZaZqTuJUVmibWceSDf9qld+TwcPH10Ta9LBP400b+25zBTzIjRqvAHigYzmmEFBluL7oVavkfXr702xAFKqiGTpe22uPmof73Ep3IJE3e+vSc4+ReoibO6uhxXB/uXqO1miHTYv417jsJZakrdeRaGdgaUk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4690.eurprd08.prod.outlook.com (2603:10a6:20b:cd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 20:12:59 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 20:12:59 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH 08/21] block: use topological sort for permission update
Date: Mon, 23 Nov 2020 23:12:20 +0300
Message-Id: <20201123201233.9534-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201123201233.9534-1-vsementsov@virtuozzo.com>
References: <20201123201233.9534-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.115]
X-ClientProxiedBy: AM0PR10CA0117.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.115) by
 AM0PR10CA0117.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.21 via Frontend Transport; Mon, 23 Nov 2020 20:12:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 058873d1-89f1-40cb-8886-08d88fec2b8d
X-MS-TrafficTypeDiagnostic: AM6PR08MB4690:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB469066928E90AF9E57220BDEC1FC0@AM6PR08MB4690.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l7AXEE6bygGNLHAtV8PNWbYRD2KwsDZTPMWJFfVcurM0kF1OdysSIBMvNhWAra1aGQv2gFDFtxJAjh1QgVVA/JkzI546O8OLB4LVb3I94wugjXkJrbyB1CFseP54vpIZMlTd2HoOjeIgYbsBSmvOeJraulZZhMy6kiQJ32cQFAVadll8mgxHxOXCg67ZJn88o0mjP9XoTPuyJ25mLNf1qTo1Q3Y94X9LFW81k96k4SaGxF1vJhyJHfkIV2syVOm5bwpjBQCJv0d2JrB8b49vgopqrsx0PyPS9n197q+B6CZZLx4AcE8n/q/ckab8Vrq7Sp1p1eM+cmt49DPLvxNuUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39830400003)(376002)(366004)(5660300002)(6512007)(6666004)(1076003)(52116002)(6486002)(16526019)(26005)(83380400001)(186003)(6506007)(86362001)(2906002)(6916009)(4326008)(8936002)(66946007)(15650500001)(478600001)(107886003)(66556008)(8676002)(956004)(2616005)(316002)(36756003)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: GU/BpfPmE+7Yduq5sTEImvNz47LQgZ+WvsFwBa/EX3zcUTEgCFaN8Osp+p5mnG6YMq1+lKshjDIDlYv4yFOeW03w3U/OxmCKZcObMFPqT/MfUAC6Itpsv3MZnF4f6n2TYQp2JnedrkMCE+RfcqwKoe7kZcj0PcDosDKihpKPE9q53mFRYpzzAR/GbRqCVGdL3fjoL/6x1IxC3RRRuQGkwBgBP3Rsz9x3oZMLxY+PCvsEtrKDbFc2hq2c6oqyD6kiPGViNieM9oA4vuv9mYfH7P5K33gxajTzujbZxQeOeg1wzqjZ9b0hpauSxCI4tfG9J/DcDYW5sU27Ga1rbBembTTW0P80mqWm5Culg3qNwzA5ymrVdULU+VryJQwXi8KDKbcdQVHStpOFP3+h5rCjZqw4c+sBUpA9KQbdaEz8WHJV/zoIRw2ao5xbBzdJgsUSbSFYH+Jt+GGnrNnd9Nifv4+rsFVz+Q/tHNwnlwvKc5OeG5enbPW3Y6+ZoK6Y7ie6PcYKX1U7bAl491Piyd1+qETlkLJMe8CVvBd+hPGpQbGAI+a9zQGsvGALk0xs/jfxy5tnBE5SY5NgjPQcQVGQvEPpDpMXf2LfVqPTyg94zAFmu24dYH6aohZ8VEXWh8lhrwxngPe2CPfpY/EsRG+Rmpd0MQ1FOBFngmXwJMzoT5thRM3L0bVbbSeixlv4rgqTh7cfMhGFNSf/4fVPhcuQbtvICoB6ISqVWTFi/vP5iHezR6r+mDk2TcbjrFfRJFwZVbE7yO80wLz+EZN/qvVAYWi5+pGHZxyPNqVwKP7Cs/DDD3gP3PN8FLEhbp7MchwWNAEaESTIMmzfnxGQCZckb6QKqbLv7VuQKZ6BQgQdBVqSeEfM9sBuJBepqwyan2HduXe3byLmoKsKbRV5dGtlWQ==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 058873d1-89f1-40cb-8886-08d88fec2b8d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 20:12:58.2020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nnl7OOtAuDc3A8oXe76I3bxI9m4LK4Idj/tUCG0OlRYamCnDYurWP6iD3pU57CJD+nqbxk0tVF1FCYX792gFeKdm7B76xDSXTM3+wAK5xKs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4690
Received-SPF: pass client-ip=40.107.22.106;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c                     | 108 ++++++++++++++++++++++++++++--------
 tests/test-bdrv-graph-mod.c |   4 +-
 tests/qemu-iotests/283.out  |   2 +-
 3 files changed, 88 insertions(+), 26 deletions(-)

diff --git a/block.c b/block.c
index 22498b5288..56263407e8 100644
--- a/block.c
+++ b/block.c
@@ -1973,13 +1973,17 @@ static bool bdrv_a_allow_b(BdrvChild *a, BdrvChild *b, Error **errp)
     return false;
 }
 
-static bool bdrv_check_parents_compliance(BlockDriverState *bs, Error **errp)
+static bool bdrv_check_parents_compliance(BlockDriverState *bs,
+                                          GSList *ignore_children,
+                                          Error **errp)
 {
     BdrvChild *a, *b;
 
     QLIST_FOREACH(a, &bs->parents, next_parent) {
         QLIST_FOREACH(b, &bs->parents, next_parent) {
-            if (a == b) {
+            if (a == b || g_slist_find(ignore_children, a) ||
+                g_slist_find(ignore_children, b))
+            {
                 continue;
             }
 
@@ -2012,6 +2016,29 @@ static void bdrv_child_perm(BlockDriverState *bs, BlockDriverState *child_bs,
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
@@ -2076,14 +2103,13 @@ static void bdrv_child_set_perm_safe(BdrvChild *c, uint64_t perm,
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
-    int ret;
 
     /* Write permissions never work with read-only images */
     if ((cumulative_perms & (BLK_PERM_WRITE | BLK_PERM_WRITE_UNCHANGED)) &&
@@ -2128,8 +2154,8 @@ static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
     }
 
     if (drv->bdrv_check_perm) {
-        ret = drv->bdrv_check_perm(bs, cumulative_perms,
-                                   cumulative_shared_perms, errp);
+        int ret = drv->bdrv_check_perm(bs, cumulative_perms,
+                                       cumulative_shared_perms, errp);
         if (ret < 0) {
             return ret;
         }
@@ -2144,21 +2170,43 @@ static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
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
 
-        cur_ignore_children = g_slist_prepend(g_slist_copy(ignore_children), c);
-        ret = bdrv_check_update_perm(c->bs, q, cur_perm, cur_shared,
-                                     cur_ignore_children, errp);
-        g_slist_free(cur_ignore_children);
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
@@ -2168,10 +2216,8 @@ static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
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
@@ -2186,11 +2232,19 @@ static void bdrv_abort_perm_update(BlockDriverState *bs)
 
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
@@ -2216,7 +2270,15 @@ static void bdrv_set_perm(BlockDriverState *bs)
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
 
@@ -2329,7 +2391,7 @@ static int bdrv_refresh_perms(BlockDriverState *bs, Error **errp)
     int ret;
     uint64_t perm, shared_perm;
 
-    if (!bdrv_check_parents_compliance(bs, errp)) {
+    if (!bdrv_check_parents_compliance(bs, NULL, errp)) {
         return -EPERM;
     }
     bdrv_get_cumulative_perm(bs, &perm, &shared_perm);
diff --git a/tests/test-bdrv-graph-mod.c b/tests/test-bdrv-graph-mod.c
index 27e3361a60..594a1df58b 100644
--- a/tests/test-bdrv-graph-mod.c
+++ b/tests/test-bdrv-graph-mod.c
@@ -314,12 +314,12 @@ int main(int argc, char *argv[])
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


