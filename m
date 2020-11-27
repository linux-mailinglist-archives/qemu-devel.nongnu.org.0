Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C512C685F
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 16:02:27 +0100 (CET)
Received: from localhost ([::1]:55920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kifGU-0003Yo-QP
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 10:02:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif19-0001Fm-Mk; Fri, 27 Nov 2020 09:46:35 -0500
Received: from mail-am6eur05on2121.outbound.protection.outlook.com
 ([40.107.22.121]:11777 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif11-0003Hm-7k; Fri, 27 Nov 2020 09:46:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UeCArWYO2Z26XVqxgExS5DukZJlbCprUU4Jit1RzDHtjnstbFmhf81Cko2bMVVHvsBLG6RFyC9ys195KVoQ/FXZhE0m8KH5tPhbuPJ6zMS02rK5j8gzIFLcNddMJgTL1ba9GvJh4x0+CtvbRSqGmI4EUIAAoaHXhjsZV4UcKrZVwZpqu0VgUAENSQ7keAMQpVUuaOaZwXwGbseD4wsBV3wVQE32q1uMSKiFUmSlZurp6CD6+HP+xK2cU9/ks5MUhM6kv8cC+9CESy6hM7ucxJQxqKXNjLXEaqTlVxSsRvs/Ooufex+90wp2Ix7zC2Lea7E797Ulurq5F2iqkE+eoUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7eoSHCwTxml1J3sbAA7EbVhYYbQ/5Yr10EI0EA7CedM=;
 b=I/6skLZmv19TVPRUspaHIxR4Zo4SPLshqTBK9aS5d8LvgzLHaQisqKUepOtRljzs1r6ze+CnPsxcnd3FLfQ7XeTLJgrNyesDW1MOEazJYkfdn3w0ok0a5dIwpg042DN0yCYNUvW+4EEXMdCNYolXX94YLAd5f+I/mM4xrR5U0qgnOhmu4lirjKvjoudc0+P1WSO1EX9lvpLgFFKSvFvnx5lBTyLUQTWktTRGQOnvd2IDORHh38NufhMOxiUB30oDfNWFrj5RRByKqlv2CZ3la5oisEHbjCBi7z1yOF9iOEZ43siaP+6SNZRHCEmOQjfLJdpoxvD80TGyvo2wBzpIUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7eoSHCwTxml1J3sbAA7EbVhYYbQ/5Yr10EI0EA7CedM=;
 b=lUz95O0Xl+zKN5ynVcno1I5+sjQCsf9Hib9KwzgJma1HyGKTVrsBFY9cshiQGaHqC++tOnwhMYtx2jw63OJc7vQqUF5aOpT3tpNuGhDtKsXHn+MmvArSkhamYyktF0jOK1s9qc2/XaDoWEkJ/1pOiAyIzwawSUpX20o8Hfdmoqw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5078.eurprd08.prod.outlook.com (2603:10a6:20b:e7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Fri, 27 Nov
 2020 14:46:08 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Fri, 27 Nov 2020
 14:46:08 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH v2 19/36] block: fix bdrv_replace_node_common
Date: Fri, 27 Nov 2020 17:45:05 +0300
Message-Id: <20201127144522.29991-20-vsementsov@virtuozzo.com>
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
 Transport; Fri, 27 Nov 2020 14:45:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 740ce3dd-eea9-4c35-af14-08d892e322e6
X-MS-TrafficTypeDiagnostic: AM6PR08MB5078:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5078C276E59ED1194249656EC1F80@AM6PR08MB5078.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lAvojkqKWFzU3Qc4eo9VFV4U07HTNMCCYLvEVIpBWb9/CNNnxHxWiV/M6K1WIJx+ZMm2FCVZtUeaY27EAFJcExGVrhckOyiIl3gnbs2Tl/Lu0Vfdofa79wrGUvHLw2uMnQKRdhGFcWk90Uy/xXPzxrKK06Iv6zjdC0lLlnBKPMoAOsjQp+uzzrkrkQvd9W6T77Fih3TmF6LmC67bNzVM6QWxLXKiaLy9THEyBr7V8cZ9JrY2Qh9fcynywPCUFa796Mcpu+Wg71XkdUNQjH5Cmai5A8xp/58LBtIoSrvY2wnJ5pO51PwUy6M4dTtmSZED6K0fdrbXllZOykxo49AzJkaXRgraXPqr6Nry8jJrXUu75NFjtyb6vBuu4BFooHwR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(346002)(136003)(396003)(376002)(86362001)(16526019)(66556008)(66476007)(478600001)(8676002)(186003)(66946007)(26005)(52116002)(83380400001)(6506007)(69590400008)(107886003)(6666004)(316002)(4326008)(36756003)(5660300002)(6486002)(2616005)(956004)(1076003)(6916009)(6512007)(8936002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?NMRziywCa8E/jVM2WslFZgqwS2jCuxStP2myZynnGpqF0nigIyEbISBHFVUL?=
 =?us-ascii?Q?85r41IsCfkHUJSSHTYhqQYdl3l4cIwRjVpz74M35QGWFEAG+tw1cdLxq3gxR?=
 =?us-ascii?Q?jPDoQ/c76G+rUVaRLkasGaY4VLfgWGV60cHIoVgYJZxJybaQHgMYzBm6/I+V?=
 =?us-ascii?Q?vajHK6Wi5ESvhDcc5gmF0szBV1HTBofEzFfNBrflJmzhgykRtsWAyCOPXs2L?=
 =?us-ascii?Q?faDB0QD7Jp/0V6HbgTQ3b3pPrT5VqjdTSGGeIVdOvB8PWs2P1E8r8FjuL2xe?=
 =?us-ascii?Q?Z6jdNmsCMsex4soJCw/a4KuaihWBFlBxTx8sjZ/jcJMkguOZZ9/icdom/KNB?=
 =?us-ascii?Q?sdxpL0XbqxAbM0vByXehWQmlAm9pOm9ME/x0GbahbwTkWs7AjIZUcO8RBE7l?=
 =?us-ascii?Q?VM+F2J53iOPp1X1qWxbDS0N8KTIe6RbE3dP3nulATIljt6bFIk+ypS0rXkSP?=
 =?us-ascii?Q?CC23jetwB+kC0dhASyjZdSU4CBf94zpzC4fx7gLXldqaIsJbcDqDd5ihFMxx?=
 =?us-ascii?Q?WWCzGdI8Lq6JtPOfTwToYb4+m0/WvcTdeUmOgzmQQ5uVXpxSPo2oCcB/6nA1?=
 =?us-ascii?Q?yS44nEPXL5yE8j0YiKOAtDc9guUZS/JpZ593KM5vBNGSizBoDuoKZA5aLilz?=
 =?us-ascii?Q?zXR9eiJrluKYv/WAEnqw7AgXxU2OZaaa4MKkZJd83QGwJJh9LU1jwlORryeu?=
 =?us-ascii?Q?SnF7MRPtd/jHg/l5e2tbj7qC6Odi5Qm8/IPoxaqbRDIrbq9WgJLcb1ZAZZxm?=
 =?us-ascii?Q?t1J9skvAqfN2bOpxdSuN3eB7GHTX/9Z6aJSF+Dm2FwPzD5wPxTjRnZhLl/d/?=
 =?us-ascii?Q?bt5yK9LJ/TLlhnIKJWGgfXATeemCEAc1KKG4XTlhJzsHTVIV/LaAJZbeARVg?=
 =?us-ascii?Q?Vdx5SWvdkclifeA4xdZXdJyZFmaeHzjnppB7h/pm1XG6erTvXc5uRkMXrxDb?=
 =?us-ascii?Q?LPt9PMJeuOjmPsr4BTi5gslCp88ROxxSWfybrAiO/J874wwhIMsQN4TWxPov?=
 =?us-ascii?Q?Fcrj?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 740ce3dd-eea9-4c35-af14-08d892e322e6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 14:45:51.5402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2OuGTPKI1dgS/1PUXGeCPcgAiSUXoBeKVGXUIPcq8pvly68SbWuHvw3m1rLzSSiI6ZynjxEgMkoOJtaNw0V6nBQfEkmkCu6GcdU1XdXqBCU=
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
index f24bd60c2f..f0fcd75555 100644
--- a/block.c
+++ b/block.c
@@ -2199,7 +2199,6 @@ static TransactionActionDrv bdrv_replace_child_drv = {
  *
  * Note: real unref of old_bs is done only on commit.
  */
-__attribute__((unused))
 static void bdrv_replace_child_safe(BdrvChild *child, BlockDriverState *new_bs,
                                     GSList **tran)
 {
@@ -4794,8 +4793,9 @@ static int bdrv_replace_node_common(BlockDriverState *from,
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
@@ -4805,7 +4805,12 @@ static int bdrv_replace_node_common(BlockDriverState *from,
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
@@ -4821,34 +4826,19 @@ static int bdrv_replace_node_common(BlockDriverState *from,
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
+    ret = bdrv_list_refresh_perms(refresh_list, NULL, &tran, errp);
 
 out:
-    g_slist_free(list);
+    tran_finalize(tran, ret);
+
     bdrv_drained_end(from);
     bdrv_unref(from);
 
diff --git a/tests/test-bdrv-graph-mod.c b/tests/test-bdrv-graph-mod.c
index 0d62e05ddb..93a5941a9b 100644
--- a/tests/test-bdrv-graph-mod.c
+++ b/tests/test-bdrv-graph-mod.c
@@ -294,20 +294,11 @@ static void test_parallel_perm_update(void)
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
 
@@ -318,11 +309,8 @@ int main(int argc, char *argv[])
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


