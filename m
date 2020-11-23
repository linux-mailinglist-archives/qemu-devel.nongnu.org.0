Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85ADB2C16AB
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 21:43:35 +0100 (CET)
Received: from localhost ([::1]:53158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khIgQ-000627-KJ
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 15:43:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khID6-0004Qt-KL; Mon, 23 Nov 2020 15:13:16 -0500
Received: from mail-am6eur05on2112.outbound.protection.outlook.com
 ([40.107.22.112]:43328 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khID4-0007SQ-OM; Mon, 23 Nov 2020 15:13:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d8sQs99gfCn04x/0rmfabXyFZfdC/dLEE9LWrktsQeiD0VHar3l67AC67H/d1KfTwdl1RF47/rhTGa9RXNVvXWPqVEKMjc7glGMju5zazL6crLvKj6S3sdJcN49RKiwUgzytFJ5aGPm5SH+acovy+7bR24j+syH3h95sBe3IPKLpM1jpaH1N360gC9DkMFUXFm9sKAkChV2MHgFAdb/3RToB6an61XbdFXbtc2BUNJfSYH4hw2cEJynyVGShP2fMESCJ20nnotWZRtvQ/ZR1ZyGKIAa0glMZ58YK+Cz1ZV/cTGMmw4jVaJIqWQtnNXk4k5X/oHDEjzvbjgLhNONTLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LKvv3D2eLXNrYTw8OiSQmbhM9Pm/snzN9QMbHasbeE=;
 b=ZgUsx5ZA+9YjYzMP3khbtHKTvwhFAe/SZKyaxrw/AuSWJZ8qWjrtbMD9v2Ay6nA/oBSClaz0oLHLz/jNebLjHQMsxhghNi4ySnfqpYNQz6NZJ+RjSpK65fA9XO0uDjG3MOKqsZUx3WpnoC1ejqaXRaT0nhH1Ee/JAtaglJFhaA7F64Y98K7P14hpZ/xJEFAdXSWcqvEe2Jz5V4xygwtH2r9FYIMDXxuzRXbzeALFzZjx94H63j+HjN/lVC32vvK2CA9XtJ4Hp3hyCnTtUkfgPgB8fl/ghVflZtVoBhwjAZXJMKztmfHediyMA318KHGQyVw6kQ91lRGmW4FeizcJ4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LKvv3D2eLXNrYTw8OiSQmbhM9Pm/snzN9QMbHasbeE=;
 b=OBgkW5gdK7TnvzyKsW0f2sKvSGQKInobFERY4Sy0e0i8DiS8eLglHmCeugOZd/6/Dlc4Of4iIlkpFj0o1znvJL/3HIndK+mL+gbdS/Fnl9z2l//FIwnvFP7K2olk3Jys1LfWE4UIXqkrFGCOQz8F/e8EqkPlY57x7WjCW/9syKo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4690.eurprd08.prod.outlook.com (2603:10a6:20b:cd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 20:13:02 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 20:13:02 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH 13/21] block: fix bdrv_replace_node_common
Date: Mon, 23 Nov 2020 23:12:25 +0300
Message-Id: <20201123201233.9534-16-vsementsov@virtuozzo.com>
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
 15.20.3589.21 via Frontend Transport; Mon, 23 Nov 2020 20:13:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1e3459e-3d77-4f26-0e52-08d88fec2e4a
X-MS-TrafficTypeDiagnostic: AM6PR08MB4690:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4690C01501985B72832FF64BC1FC0@AM6PR08MB4690.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N+XXMZhjyts4SAi+JSkS/T1/XRu0H0uR3Zq2uEzaZxS0K+hnq3cVDGCFHvVReKrFD0gPr8j8Uyd76q3l0u9yG9mPBPcdA0E/YwDpYmbVKYsF/RK6FMMUaVmSHfxEd/gZ99Q0k5zL4PMbNGEhx/TQjKKotGcJiElEWjAunYBCsdr0WSqsmDdXn0kQhvq97UXspdk6GQQ+zr7FAfyreoPl2bkcqxnfVYYzULgzsQGSuODDd2Ose6wWI708D+mX+cFBj36KPe/JrCheY+ahfUeK3VGmR6nO52mOR9vy6a/OYw7uwEyOYAqxuU6nE0APiBb134APJMp9rX5MGRHOa6ogdg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39830400003)(376002)(366004)(5660300002)(6512007)(6666004)(1076003)(52116002)(6486002)(16526019)(26005)(83380400001)(186003)(6506007)(86362001)(2906002)(6916009)(4326008)(8936002)(66946007)(478600001)(107886003)(66556008)(8676002)(956004)(2616005)(316002)(36756003)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: JJ1kUQ8MAiP0Da84I90U0VukLnC5FuviXg1mb9Ima7MFm6UTbjtR8Swh+kRda8veXr4sI/oXzAZRLVCrrtJ2eO7GM8Tp+BzUSFlURz9AUBO5b37i88ZsClMaC4QfAhc6BUCbYTjw7pnHlO96yJJJ5djLyy4xA5sTNuRQC/hv6ylhX/hTJ6EiVIdKla2GF7EyXbByXalb9KzG6UtrZxbpjkG22jQmk2u1kD27PiWF58YiqGliONwyCYgHRWyRqkEDK+gWUWcBYgk6Zw+s1Fg3bOLft9UqA4CBntiMQNNjNRBjHL38vR5R9UbPp7cullZMUo8h883KqJOYH7mRmhkwq+0nmOA4wyag3RxWPHLZn7cyO5Dy8pllrBiFFS5lHKMs+QhciVbRF25z6RqRN5hTHVpunswWdnW06KbD7Sa1yCHzerrwgbfbuswz4Yo5AnalOH/no6Nh8BF317Iwr9F2Y8cm21AaAgmH3iwiWNZ1eFsiZPQg+8G1jA9gEFl5uoLXB4cKCW0GBRYqJsKTBuT9rKkQkcaMaljA7nWww+1EPTWaShVColczG5ccTu1Vv9+Peddot/LqIUA40A590OkeBSKvodQNGdwXb8Cm7HHF4nlcoJSwcdKLWsQZkn0AdPbCshh1EqL1ji2s5iTtJqkt8UO64IcTqbLXvWwKmebGTeBVQ2fgkaVDjO1FBK4yP1f3L1tZy/LUwjdiOWrEQ4wtN2U7VyTdfkcjkr7j1t+/WsSLJ2TBnzwG2TgbXAaKFPsD5ScSIFa32s/XVt60I3gh2C1sO+fgus0Zu9WyVYyTf50aXtV/WcnHpsnescipUvhGg/ZGdXeUx/2ZWdeS4YxfwJ11FKQdiIu2ckcfLc2ZWn2llUusPmQtL2QWYWnYYZATXob0eU4ITYvMCtKE7EvXUw==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1e3459e-3d77-4f26-0e52-08d88fec2e4a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 20:13:02.6734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ETGvWafUkQxEWldeg8K8L+vtdJMLYwKIdtmaxr+0WnKomFv6YMVw4Vjm8chPyEDw3hffPYdRuAiLlQmndPt8nWzfDMYAXrVFnEVq8vzMxIY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4690
Received-SPF: pass client-ip=40.107.22.112;
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
 block.c                     | 42 ++++++++++++++-----------------------
 tests/test-bdrv-graph-mod.c | 18 +++-------------
 2 files changed, 19 insertions(+), 41 deletions(-)

diff --git a/block.c b/block.c
index 5c94f5a428..08501350b7 100644
--- a/block.c
+++ b/block.c
@@ -2178,7 +2178,6 @@ static BdrvActionDrv bdrv_replace_child_drv = {
  *
  * Note: real unref of old_bs is done only on commit.
  */
-__attribute__((unused))
 static void bdrv_replace_child_safe(BdrvChild *child, BlockDriverState *new_bs,
                                     GSList **tran)
 {
@@ -4787,8 +4786,9 @@ static int bdrv_replace_node_common(BlockDriverState *from,
 {
     int ret = -EPERM;
     BdrvChild *c, *next;
-    GSList *list = NULL, *p;
-    uint64_t perm = 0, shared = BLK_PERM_ALL;
+    GSList *tran = NULL;
+    g_autoptr(GHashTable) found = NULL;
+    g_autoptr(GSList) refresh_list = NULL;
 
     /* Make sure that @from doesn't go away until we have successfully attached
      * all of its parents to @to. */
@@ -4798,7 +4798,12 @@ static int bdrv_replace_node_common(BlockDriverState *from,
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
@@ -4814,34 +4819,19 @@ static int bdrv_replace_node_common(BlockDriverState *from,
                        c->name, from->node_name);
             goto out;
         }
-        list = g_slist_prepend(list, c);
-        perm |= c->perm;
-        shared &= c->shared_perm;
-    }
-
-    /* Check whether the required permissions can be granted on @to, ignoring
-     * all BdrvChild in @list so that they can't block themselves. */
-    ret = bdrv_check_update_perm(to, NULL, perm, shared, list, errp);
-    if (ret < 0) {
-        bdrv_abort_perm_update(to);
-        goto out;
+        bdrv_replace_child_safe(c, to, &tran);
     }
 
-    /* Now actually perform the change. We performed the permission check for
-     * all elements of @list at once, so set the permissions all at once at the
-     * very end. */
-    for (p = list; p != NULL; p = p->next) {
-        c = p->data;
+    found = g_hash_table_new(NULL, NULL);
 
-        bdrv_ref(to);
-        bdrv_replace_child_noperm(c, to);
-        bdrv_unref(from);
-    }
+    refresh_list = bdrv_topological_dfs(refresh_list, found, to);
+    refresh_list = bdrv_topological_dfs(refresh_list, found, from);
 
-    bdrv_set_perm(to);
+    ret = bdrv_list_refresh_perms(refresh_list, errp);
 
 out:
-    g_slist_free(list);
+    tran_finalize(tran, ret);
+
     bdrv_drained_end(from);
     bdrv_unref(from);
 
diff --git a/tests/test-bdrv-graph-mod.c b/tests/test-bdrv-graph-mod.c
index 594a1df58b..d0e0f56ec3 100644
--- a/tests/test-bdrv-graph-mod.c
+++ b/tests/test-bdrv-graph-mod.c
@@ -292,20 +292,11 @@ static void test_parallel_perm_update(void)
     bdrv_child_refresh_perms(top, top->children.lh_first, &error_abort);
 
     assert(c_fl1->perm & BLK_PERM_WRITE);
+    bdrv_unref(top);
 }
 
 int main(int argc, char *argv[])
 {
-    int i;
-    bool debug = false;
-
-    for (i = 1; i < argc; i++) {
-        if (!strcmp(argv[i], "-d")) {
-            debug = true;
-            break;
-        }
-    }
-
     bdrv_init();
     qemu_init_main_loop(&error_abort);
 
@@ -316,11 +307,8 @@ int main(int argc, char *argv[])
                     test_should_update_child);
     g_test_add_func("/bdrv-graph-mod/parallel-perm-update",
                     test_parallel_perm_update);
-
-    if (debug) {
-        g_test_add_func("/bdrv-graph-mod/parallel-exclusive-write",
-                        test_parallel_exclusive_write);
-    }
+    g_test_add_func("/bdrv-graph-mod/parallel-exclusive-write",
+                    test_parallel_exclusive_write);
 
     return g_test_run();
 }
-- 
2.21.3


