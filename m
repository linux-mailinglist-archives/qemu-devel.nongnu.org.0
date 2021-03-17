Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8D833F3B7
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 15:53:03 +0100 (CET)
Received: from localhost ([::1]:47838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXXi-00057H-84
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 10:53:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXHu-0004pz-Nx; Wed, 17 Mar 2021 10:36:43 -0400
Received: from mail-eopbgr10137.outbound.protection.outlook.com
 ([40.107.1.137]:61154 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXHi-0006nM-Ij; Wed, 17 Mar 2021 10:36:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nO1Udt8apRazAiGbAdcgzdznaXeSHyNRU5R5CkZLnMS0YqRHQeP9FKh1aN2LQTyjURMXwuAntheJgumJq3btBzX/PXzn3XK7Xygw64xFahdqPtiWx1G4BajCiJWfGzzWREjhwo3lt1zBOeJugg4i12wGlI6lOkiya//TkOJPvqw0aWrVFNL+Iag5I7mckEb49+aJbhD8HwS8J5yXwx42vcDzJHUWbMoq/neLOKjFhXQcXQfWbnM9HmZg7JaQVwUYFtqhC+YLd8Hirfn2QFsI6mEN1sB7AgLYYt4tBzoEP1SmeKUzVFBwGMp8rpIJJ5wH34J4S0ZjFCHOHK3fFPma4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HFu7vg3wFCPC5WcQLVUakgFLpsOD5qxuvTUyLoQJ6x4=;
 b=SoFqRZ/2APvF658Q4RkUf9/cm/GpYB2SkoFjYKAPQyuEr0PyEtlmb6Kpz4Ev92LIB2rrg7Wc5v9E3nzF8wrUlDN1eRe+kiyGJTyLG0Gdps7zSxMsFFhWswOi3MIW7U83E5DD9Km8U8zR7E3kLsS2b1NtLpJnKQDgizFdHrmgHNRcmBSl3b49ADLGPQAFRiJcFAkNy8W8pum+ACDoViGRSCfKNWFAwM1972F1kybRA6cBwjZy4QYidXu+fUBRKfzP5LOyUSHCpTP3H2t6OeABd4OylLlm6FComstJoTrYLL2WFvmOWs+ukS+tajBWY84UTrhMTIWVk6VpJ3HdP4ahLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HFu7vg3wFCPC5WcQLVUakgFLpsOD5qxuvTUyLoQJ6x4=;
 b=IWmmZ2o4OENWFSj+2uvoixFx3dmzeoDaanCc/7GVgLsZ9Qb30TOjI+RBeFNlS6YowNh4ijdP7PE0lwkldeAqKYTBJgh2HtAjzXNeJs3B/tnjFocoDoEnZwzTmb6Sl0xcarUJ+IM5BxUL8w+hnjkWIzXbOtHZZZT/6OG+KS/vCLw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1650.eurprd08.prod.outlook.com (2603:10a6:203:2f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:36:22 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:36:22 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 13/36] block: use topological sort for permission update
Date: Wed, 17 Mar 2021 17:35:06 +0300
Message-Id: <20210317143529.615584-14-vsementsov@virtuozzo.com>
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
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 14:36:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff2eec20-09b7-46ec-91f0-08d8e95208cd
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1650:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB16506C88B6B37DEE72A0561FC16A9@AM5PR0801MB1650.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hDFYairwByPldW9UcneN2r2raXhs2PVMFuuEkDE0tcOkZBU6qJTWOjD6C02a4IHBjvwNl0m3aMoodThmThki/FrKbrXh7/nW0QCmmPYj0zteDmHi1TI2h7U9WRp1AziuXyrMNOIpga8opN9rGRq7T89wviVazMMrtJETR0GbhGofpd41LCI0m+RLKYeuLq+BGupsHARqbKpZRbCgw4YStlkRMfzOvG3VLx439VqTVaGXvc5skd2PHeNRL/t08ieI6yQI3uCA7ZAKTAc+rLZH60h9wLfMIoOa3jzxV7rFgk7YOWYYarU8gmRI49dYQF5pXzf1ifu0hw9evgO4lX8/Aog/1iXQQW8lyc9U5VHkWJJXGFDopLlJGtWsXqTxy+PkmIPFrimk1WurE+mhPKHa0MTvie/keUBa8wGDXw1ijPlAhOozvQXA3OJQX+w5WoAak9LSxFZCyMFWoyyM9OcfEHHI1wbg50BdutV8J8esWa/GTFveSe8rSl+/R46WaHoDuPxSLKxLj/ZXveicFwh23XmhZmykE8Jl+5375TSsqWbhqOkSACgceZN66btgX0Mq0Fwb2+1XHjE+WI57ImoqqZGXduil4/PyuNoSYmPrvUlARlg6AmtsA/IrxCmoZC6O
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(396003)(376002)(136003)(366004)(316002)(1076003)(956004)(6916009)(6506007)(69590400012)(66556008)(66476007)(6512007)(26005)(4326008)(5660300002)(83380400001)(8676002)(52116002)(2616005)(66946007)(6486002)(6666004)(186003)(36756003)(16526019)(2906002)(86362001)(8936002)(15650500001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?HlccsdQrVd8OrbBWN6FcocuXhfrTSnmteVw4G6K1e6/O2p304TqDU7MD1/oK?=
 =?us-ascii?Q?wxJGE6qIiBMfIDaM3HqBgFUUKpWtst94OYDHgORznyJhNdp07QrdWcfLbeOn?=
 =?us-ascii?Q?XFK1v+WSatm2RxPyjSslAqTkz1cMWDUFV6gAr8ZW7p3sfXFXT2fPi0wSBRnr?=
 =?us-ascii?Q?4pM12HhdS1pYwXcYcae4++6kYEXzWruqnDOKnc6TK0g7FmAxWqrC7uekOEGv?=
 =?us-ascii?Q?I2mrbGobfCDD85SP74S1feMjWLIZj6tWFzcBQiDAwOeCjVNPqygKY4s8kg2w?=
 =?us-ascii?Q?py6mN0LExoZkNJQ0fM6KUCYYyes1BVtmTd5j3hV/lX+7VTZzSnFu/VEaYIsI?=
 =?us-ascii?Q?QIw1lwgPxFfq39LCuljLztKYI6l0p2LO2dc146SB8K9RQLP6ahcugRWK/Fqd?=
 =?us-ascii?Q?rez+e2yFPJ5Q2zj23nNzTFteS5hmCOvbjb+QqnHaec5EX2TmDMMmIrfNrUfv?=
 =?us-ascii?Q?bKnsL0CKUI6sRJTsLkJczKvvkeI1WQH5nfrkmp/JEOEUf6g5MfGRFf8LTdbI?=
 =?us-ascii?Q?6Uf59Q7nvAzF+3ABF0RBOLaqD0YNV5ahbj2UYP9Wk+cGE9D+dlsMPXUKJIUT?=
 =?us-ascii?Q?gmp6JynZKyufQ+lisaYaWMWDu8A14DtxIRDEOZBs7gkpnPnwZzPZN/n9CSQj?=
 =?us-ascii?Q?er2J1ntbELEuIv3SVjXAnrSS3/yVGT3/dIx35Q3mm17jjDRoI2fqNXzmHn/6?=
 =?us-ascii?Q?ERXkO7pvzxvZtvnpEp1Acn2VceN3b9N2e/N47wgL4XkvHCHpNQLLJCR5lzxr?=
 =?us-ascii?Q?KSx7+rKa3+bFumFcO71NlE07XcVEwFBVREys9mUCPsogXzSEQMWujIYjCKKa?=
 =?us-ascii?Q?Gn8FcW31S4iBNVcXeNeVPM76hVslFyj8uHFT4qxRsR+fBzQXARf3B2E0GXNw?=
 =?us-ascii?Q?18KF+yIoIi79GAuaZY4lQBgCd4r+ncNPk6u+q5KP4YMurqLKTTUClrqRY41H?=
 =?us-ascii?Q?/7PVihJwE7uP1pv08uPSy4kNh0o7aPN/Dq6ldRnIlJHe7Dsuv4gvwi33R4sf?=
 =?us-ascii?Q?vjr/iPXSiGKpIOvx33rKNf7AXASyjJ+Di+SoS3BDxho8tOw3jjWq61O44P8Q?=
 =?us-ascii?Q?ErhepuOF6WtlGQlpHasPa5ssw6PuiaOLLPdg0/gqiqO4yfZ1W8LDEmMOoI8P?=
 =?us-ascii?Q?Fj0r66zqRG7aZ2NHF2Cah5jBqJOKrkk2siPk5kh+JtSrq9pEPttibLZyQA6M?=
 =?us-ascii?Q?HSVVbrbIBuyYzJDB4B5XtfSkavKHIByph5aLQhxbgdvotH61yiP39ClFsbzL?=
 =?us-ascii?Q?NSErK6eB1Qp5NpUp8E1yRsdJ92H/DyEJD1pzQWlgjWWMosocwywywgxrLheh?=
 =?us-ascii?Q?85h4MTfu95hCBxj0dbkuikq7?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff2eec20-09b7-46ec-91f0-08d8e95208cd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:36:21.9654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZupNhdj5CJHtxkebi/iTFn9HG6SSuLa7k1YFucfE1mXEZjnHQTv18VH9SN78GzR9KMvRQmo72slCw1xP0bMD5fh+HVmGYdwUtHK6P+g8dK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1650
Received-SPF: pass client-ip=40.107.1.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

We also need to support ignore_children in
bdrv_parent_perms_conflict()

For test 283 order of conflicting parents check is changed.

Note also that in bdrv_check_perm() we don't check for parents conflict
at root bs, as we may be in the middle of permission update in
bdrv_reopen_multiple(). bdrv_reopen_multiple() will be updated soon.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c                          | 116 +++++++++++++++++++++++++------
 tests/unit/test-bdrv-graph-mod.c |   4 +-
 tests/qemu-iotests/283.out       |   2 +-
 3 files changed, 99 insertions(+), 23 deletions(-)

diff --git a/block.c b/block.c
index 29fec1ffc0..14363dc550 100644
--- a/block.c
+++ b/block.c
@@ -2020,7 +2020,9 @@ static bool bdrv_a_allow_b(BdrvChild *a, BdrvChild *b, Error **errp)
     return false;
 }
 
-static bool bdrv_parent_perms_conflict(BlockDriverState *bs, Error **errp)
+static bool bdrv_parent_perms_conflict(BlockDriverState *bs,
+                                       GSList *ignore_children,
+                                       Error **errp)
 {
     BdrvChild *a, *b;
 
@@ -2030,8 +2032,12 @@ static bool bdrv_parent_perms_conflict(BlockDriverState *bs, Error **errp)
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
 
@@ -2060,6 +2066,40 @@ static void bdrv_child_perm(BlockDriverState *bs, BlockDriverState *child_bs,
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
@@ -2124,10 +2164,10 @@ static void bdrv_child_set_perm_safe(BdrvChild *c, uint64_t perm,
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
@@ -2192,21 +2232,43 @@ static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
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
@@ -2216,10 +2278,8 @@ static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
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
@@ -2234,11 +2294,19 @@ static void bdrv_abort_perm_update(BlockDriverState *bs)
 
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
@@ -2264,7 +2332,15 @@ static void bdrv_set_perm(BlockDriverState *bs)
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
 
@@ -2377,7 +2453,7 @@ static int bdrv_refresh_perms(BlockDriverState *bs, Error **errp)
     int ret;
     uint64_t perm, shared_perm;
 
-    if (bdrv_parent_perms_conflict(bs, errp)) {
+    if (bdrv_parent_perms_conflict(bs, NULL, errp)) {
         return -EPERM;
     }
     bdrv_get_cumulative_perm(bs, &perm, &shared_perm);
diff --git a/tests/unit/test-bdrv-graph-mod.c b/tests/unit/test-bdrv-graph-mod.c
index 8188ddd84c..a98100ddfd 100644
--- a/tests/unit/test-bdrv-graph-mod.c
+++ b/tests/unit/test-bdrv-graph-mod.c
@@ -405,12 +405,12 @@ int main(int argc, char *argv[])
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


