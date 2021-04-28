Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D24BB36DC53
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 17:48:20 +0200 (CEST)
Received: from localhost ([::1]:47288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbmQE-0005Wl-Ci
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 11:48:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblxy-0005oY-2J; Wed, 28 Apr 2021 11:19:13 -0400
Received: from mail-eopbgr00103.outbound.protection.outlook.com
 ([40.107.0.103]:52805 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblxl-0001yK-6g; Wed, 28 Apr 2021 11:19:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j6BKqWOXC0xqLKBtgw3Ma89STzaeqTClX6rUAAaocXRk/XbwB22K285VhLXfK/XRsIk2QcluNZxV9kxIsKwcQL9pNbZ6wvpvxf3nKNfrtP4nR4j2SNJum3D4IzvltvTnmyb3/X1IRPeP7tZEi+Zy/SQ/HYMbOh7chvtt2MBB5mTF3ht06g6FoZmRFFUYYqM0eWGiJNYwjdPSj8Y3lyT4TI5Skss4mOIBZctgi5mbzl09iVCzlVs0NOXEEBo/F5lMqMHY1ym5XDYQkIE8n1Yp95kFA3fif0sOLch665d9H1otdaBv8Nh9N+yJJlc58RL+PfIVuNtY+Zubv096LWr1bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+x9m+EDn0dnT0qYqjHjJC6p9yPVH0tlnWLSqDYQ4/Y=;
 b=X3Y2ekriu1otONVdC+euHql3J39Cbh5wT4JZi7jeUHOD7GxCkq7gz4cVjWZnCupPJlI6RtvJuUWF1u8+kaJgH9EE1M6hiC+WPnBP/B67C58dAzmOu6taXl83wFz17nXDba4OeD1bbmTV7mxxqOiV76FeWDrLclVR/Y2dElriPZraeYrEJl4q9IFfnLRv4pCMWbmbRRH8nRE8EqUxVI9Ra4Fnb/oBoCIDcqwlwe0DJ45/IM4ysva6j1lKAiODHKgSA7BpPkpQQNko91V0QMEHtPzoEvP38n/nLs+TXzyN1rJFIiL8/L4jYlX2KPA79DmFwngVXSHPfcKhMXO/HshDAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+x9m+EDn0dnT0qYqjHjJC6p9yPVH0tlnWLSqDYQ4/Y=;
 b=d+ln8Wt0gPCR/kjbCX9+QuXB4qlWQjVKNUx3kcx228k2ETpQUmvnQDpLHm1/0vFsRNAEC98YhA680KF+eWiWgkyRk40pfIrUUUWF6402YGb13rCg/KAwfvdWABnxpV+19mK16Hy1AxXs1GpkdT7O1MQTp8dO1Wfd4qPBhqrtUao=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6151.eurprd08.prod.outlook.com (2603:10a6:20b:290::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 28 Apr
 2021 15:18:41 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 15:18:41 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 17/36] block: fix bdrv_replace_node_common
Date: Wed, 28 Apr 2021 18:17:45 +0300
Message-Id: <20210428151804.439460-18-vsementsov@virtuozzo.com>
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
 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 15:18:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37af1231-b0a9-4db4-e870-08d90a58e814
X-MS-TrafficTypeDiagnostic: AS8PR08MB6151:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6151B97DCC0AF406DB634209C1409@AS8PR08MB6151.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n7U0qsR9E57u5NeonG15ZHb0+qQuOq1EheMobsgFClKDH6lMicJ9MlWoh7EkoCi7Ay1aKi9km9xwgucyDzh+a0FuSsJUFzT64+DnCwcVa2UDWWMQoKjKGXjgYQy5ZLqWJjeRVrrCF6pN9RyalqFtQctd1D2yJdTsdyt6Us5vEID3q9k+i4VGrXwkSpFTWc+ya233/aBWfCiZoiAonny+LxmuLhXEsIF1B0z0cOS3jDfqPZIH/71MDhoMQPwx50g88bKGh7/YP0V/Fv0RavDrVZL0fu3eAANf9arcTCijMcruT7ydWuND4ioKzrWu1Qnsc8jkl1uZ/BX6ToxzEcq8bGYJ1mfZbUZMftMtz+na7h4zADuwJSdPu8S66mdJUGyF8nfMqlEla2yPuMbYIaslGL29btH46XxJcVGTKFslRFzs1NOe+3uVEEbe1dvayI/9hVnOohCnbEy/TFr3WGLLEIG/4cOICSqVZpjdgPI0xB1UVsj8XGf8QLY8Tz7TgFNHaa5bFea+TnjY0nRDhkXyXVU1k/62u3HAaEGOxTzFKVV9KouH4P7ttP9LN9M/mitLGiJlaynUZnLfYaZJ+BnXAYV5O0k0t6QZM2EYH95RjZR/jEIMEQxAyLnsl/jTQh8FgkV5OWaCq/frGoqd9uoNDvXdAKC0JXubgOMsDKxzgkZnGF1y69TbZkSEbiLlDt87
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(396003)(136003)(366004)(346002)(478600001)(52116002)(36756003)(26005)(956004)(86362001)(6916009)(5660300002)(316002)(186003)(6506007)(6512007)(2906002)(83380400001)(16526019)(4326008)(6486002)(66556008)(66476007)(8676002)(66946007)(1076003)(8936002)(2616005)(38350700002)(38100700002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?au2rL9dW4MRTtbQw64hLqy//xHEIhfNlhnINCgougPA2xSL4q0u16EsWxo16?=
 =?us-ascii?Q?40wjluwQCXcNiiMBCa/O6On5TGeZmt9dCHbMj+eI2Jp71gYw96eLkOFM1wvd?=
 =?us-ascii?Q?EAlR1gNtblKZTvRHlnG/yKzv9MZAHt3/8G06C0Olb+HPRsDSm1hlaf/sRKzm?=
 =?us-ascii?Q?j2p/OSgaUN7LuKTMbKmCOQamOT7WqLmD5MmBncdBEzf5BZqjyyVZPUTkbV36?=
 =?us-ascii?Q?Z/9D0Pxm2FItbASxWIKxvjYSGnKj1T3XTxR9vVmum8fPk7/ISGZTMSVThGoQ?=
 =?us-ascii?Q?+oIZLRttWJOpC6bN3S9kgf9yvTru3QK+xhV7D3ASmtdJjVN/y0FXHG715c8h?=
 =?us-ascii?Q?fHqlCKhTXDWMmfPiGq8tNzvltdYDPs8PkbQgJ08xmo4RDP/uLUu8+xlqECwM?=
 =?us-ascii?Q?a77P6+e746rxx6/i0reYm3GOF23JhyxdvGm/btTJS2VITZEmmJ0ENfeg0W0M?=
 =?us-ascii?Q?X6zs/knuDwc4vbixZryHC3FDQu7f192m9Nuosas4r9ssnfqCTz+04H4KIvlX?=
 =?us-ascii?Q?qWqLs6+JSkR9Rso1SqpPGnO3x7eLJgZl7GT/9lbacQtymxn5cOPeea8aGk4p?=
 =?us-ascii?Q?6UPUbW+q3KaKwHMiGPsmMlBuLmdSvTAdeijQLhjhnU5kQR3qrHEBIvLsPjUg?=
 =?us-ascii?Q?HRY4ncqA5lwn4naU8Casyx1dXJrBYlriK6SOBvwLSPIzLVrDSaQnGEQ0FUqg?=
 =?us-ascii?Q?gxh6ffeTsIhW+xBob9Sttd0noYaj/5BCj2WLdMH2By/e8vHHrkfayCZZ425h?=
 =?us-ascii?Q?KqzGK+2LApAcd51R1GZ6SdrIQC6niQlBfxZvzuUlED3bpnQlmbdBKDzgDlWY?=
 =?us-ascii?Q?S9QLTR2sr/Jz3oZeO3rBCeJVLF9BAO/0/IhHQZWCHd75u30rjb8zQw91SV0h?=
 =?us-ascii?Q?f3UPJBUF3Kr7hBvrAaRGecJRLjzr2wtzPgLHwxa4ct9vTDyeoQ5asw6BQZCO?=
 =?us-ascii?Q?d9/49T2qbMxlO/Ra2Y5atzXc2+0jyQCZvrTQbQU35RWLDaLTTU0TN/6pgLpP?=
 =?us-ascii?Q?YUJhlBUQ9m6gtEEqR3SyZKkyFsGNgBkc1CFh4AABu8ztMvXdEAhYUZ96nz1V?=
 =?us-ascii?Q?4U9qKLyo0ElZM150HIfv4uEaDObhdv2AlHJH0vHIWke8417I5SdLlYdIphjW?=
 =?us-ascii?Q?wAS2cKbSm918RjNbDN5Hm7hSHPE0MNNGRcSx1mTm02N+XwCbM1KBNxTMh6ry?=
 =?us-ascii?Q?YXFPWDmUAl+2d65eds9n6fKNvpEWJfyyHU1XcRCPY36Y//Ap/9geogvOdsfq?=
 =?us-ascii?Q?SaWuaS43YZLKEYHSax4DbZt1tFBV/cJqj3ZaBS71N1klLRyfLgpyE+wa1u3g?=
 =?us-ascii?Q?FVGQkaXwF+oR4FYTelmJ4Ht4?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37af1231-b0a9-4db4-e870-08d90a58e814
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:18:41.7909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JI7YhoRwyybQwEdqybgslYFcFA2uqZC5qxZlDavFhWIquhSTu05zGC6DgzP6/T0J53Pf2K6urjx/6xO58a/HBKPAzA+VbTUlmJ6UDEDeIwQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6151
Received-SPF: pass client-ip=40.107.0.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c                          | 43 +++++++++++++-------------------
 tests/unit/test-bdrv-graph-mod.c |  4 +--
 2 files changed, 20 insertions(+), 27 deletions(-)

diff --git a/block.c b/block.c
index a5305662dc..6040b9dea0 100644
--- a/block.c
+++ b/block.c
@@ -2273,7 +2273,6 @@ static TransactionActionDrv bdrv_replace_child_drv = {
  *
  * Note: real unref of old_bs is done only on commit.
  */
-__attribute__((unused))
 static void bdrv_replace_child_safe(BdrvChild *child, BlockDriverState *new_bs,
                                     Transaction *tran)
 {
@@ -4877,8 +4876,9 @@ static int bdrv_replace_node_common(BlockDriverState *from,
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
@@ -4889,7 +4889,12 @@ static int bdrv_replace_node_common(BlockDriverState *from,
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
@@ -4907,36 +4912,24 @@ static int bdrv_replace_node_common(BlockDriverState *from,
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
index e64e81a07c..7b3c8b437a 100644
--- a/tests/unit/test-bdrv-graph-mod.c
+++ b/tests/unit/test-bdrv-graph-mod.c
@@ -408,10 +408,10 @@ int main(int argc, char *argv[])
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


