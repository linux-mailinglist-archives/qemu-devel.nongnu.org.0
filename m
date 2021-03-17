Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF32A33F3D1
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:06:51 +0100 (CET)
Received: from localhost ([::1]:54356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXl4-00033b-VV
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:06:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXIG-0005G6-70; Wed, 17 Mar 2021 10:37:04 -0400
Received: from mail-eopbgr40135.outbound.protection.outlook.com
 ([40.107.4.135]:23235 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXIE-0007ET-54; Wed, 17 Mar 2021 10:37:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iqLRV50UiQEx7pzXjvrb7aw7zRanYoiH6zVlrkoTZBFNR+LhTSbAwsyh/A95qDKxPCzWjurxbJOMG/OdrPvY6ZJyw2YNTw9E/23cS1LEkw1LIKvktmKTU/R6TqKxP6u25dlvfa1gan9rwn4nAHTdCXjCSj7znthES3A6TwkbMP5sTzcTiOcq38LMSk/+x+VmLKJQI9EDe0/F78hm2lvuCgK1LiMtEg2EBV01d0qtHA47MqOAnUJus8gdell7QUFl3N8q3osuZa+piTrmSurg2F+OKtKesK+VsvNc98lbdXpEv/CK9S3tpMSkdYe7z/rvzzhldmSHfLk9+cGLzn/ZRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8kwlA703STIj0/64Hf8bLJwwyrGwt1zS3ODrhUbqFmI=;
 b=U2Dco4SUwUzk/voFbarr0FGdEqaFf95AjqXlp2Ws1pcV5xWE9YcCMg7Lm9p6sbgfjNMjGicxV+RfG/avZA4UBHIwe0d6PLBQ+t4KlOrFFb7VJfxh8HIN9LDHOJdhWGIRgQTVsTYcqQkwzCXytBHjhXaurnZDidwyXCpt2CedwCRlmykp/XulxMtIJqO1X6pj7kt3qnbLcRDgjMZ4t7dyxuAR46j5I4XwjS2IVkF4N0f1e3L3PWSpAjtWFOkqvshWvrfoOlm8MgCu9rXJnKmmwGQIyBgz2RjH0dLwvqbHsxSUfhX/Zxnob7SviJlTWj2gCX+Hxpo8jxC/ZD4U/sGySw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8kwlA703STIj0/64Hf8bLJwwyrGwt1zS3ODrhUbqFmI=;
 b=ucgaK9tx/UhuCed2OzWdlxnm9xMRoHL353LHpieQaYiMZYnF5BJj0A5smN4DlJnHu3WkxVy3rgeEGG6bW4neKbIUZMSL5QwsvGTS6iJyQ1z6Q3Gyf+ZwsbEk4FDWjf0uMkNjTx1mcP0myZ+MAqad4u8C/Y3XURSrjpiwymK6FEE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3573.eurprd08.prod.outlook.com (2603:10a6:20b:4b::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:36:50 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:36:50 +0000
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 33/36] block: inline bdrv_replace_child()
Date: Wed, 17 Mar 2021 17:35:26 +0300
Message-Id: <20210317143529.615584-34-vsementsov@virtuozzo.com>
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
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 14:36:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d35fbdb-aa16-48ad-a330-08d8e95219d4
X-MS-TrafficTypeDiagnostic: AM6PR08MB3573:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB357357758CFE4B1FCD913D33C16A9@AM6PR08MB3573.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n9ktkmH3oyw3L8qswCfsvAP3Jjg2IJSIKWbTvTDN/YoJ8dWZ+BV72EUJO3XqGeflrK35glqrzC8LPndQSBnHhW3qrQyawAXPTFxsn2F/ICvkbDPTOjAlaaSQ3uLhKCOlKhL/9Q3IhCtvRoa/3IoAdaMGMLUwlEDva/QqAXevdFw235mnjsGlGd5f1LU/MT1T3in8dcyzhg2vmGw7fdo0hA50z7SfmecRGJTVMpiAISxXaJs5ScH1vgdecYDxI38/EOZl16DxqMU5uutBFsXd+qg8vpAdUWKdaYgZTLTdLvx8WKwjZN9uvv11+EBUxRgq76SNdrNEx8oe2TcSQURdc4UuXR4uap9ukf8CZFIHd2ju67N48D13gWHI0kQI/119kPIXtgErtikgMutWcoMGZBBBnH0v93ZhE2L+fnSAnm30N2jCmkhRfPtS7f1bN/Ciujbwbl9VXwp13BuxatJWowLMkMgZeTtPmnzDK8f2X+bJuRbaMwYZOjZ9TMB1S0vVWviwzNKQkVaEg3XPUIhfTCM67U6DECsCb9vraDgHPszrXvlphFi4B3UexGhVzGAuQdy2UxY7gwomMBIIuKKbmqz5lNwFT8irApY9PoAkc6C6FIv0Uk34JZDbvcpiallP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(366004)(376002)(39840400004)(4326008)(66556008)(26005)(6666004)(66946007)(5660300002)(8936002)(478600001)(83380400001)(8676002)(186003)(52116002)(86362001)(16526019)(6916009)(2616005)(66476007)(6506007)(2906002)(69590400012)(1076003)(6512007)(36756003)(6486002)(316002)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?irY/Me9S6IbEwzBcMjAVQr/S6hIT+QynSxacGw6sShCUfZfxBPhVLjLJao7W?=
 =?us-ascii?Q?yHdLZiz7huGvs6Y/+iB/owH3Ve2GrWnH7mjLMAiATFvaHQDjQKhad4HWX5os?=
 =?us-ascii?Q?PSAWcQNpPNbagolfyTsZ3UnruEIQP6lJtFKjgw5TIteI5CQeT+G7OBe9VqoB?=
 =?us-ascii?Q?Fsp+vpEXcFqE8DHI1t2iYgdiNXFvhep7IPRYq4nMzPXILhGelflq6H0g5Fxw?=
 =?us-ascii?Q?UvSr/nkiDpuslZGVeX7Lrm2XlsX9Ee0ARPktWI1l5vCtYazWJTZuhJ31+mWP?=
 =?us-ascii?Q?Hnw9oKv90DZpDMKQCe5aN5xZlwWRfXW/pmderhVUQEUz2+Q36Fexy/KHovOm?=
 =?us-ascii?Q?3ukfCed4v+ZheP27etGKNOaEYWecwWfUPpbasHg5+dHzlebocL7VdMWsEjGE?=
 =?us-ascii?Q?IkufC/GAfz2aHLXbOFwvc0nNAMDRBUz8vkgg22qfkbq3oO+R+CwVOb4+6rVh?=
 =?us-ascii?Q?KBCWhSMI8UBZEss9N00uIVGuhye/KvMV8lKKQzdUYDu5gzB9yxQsc9PLGOE1?=
 =?us-ascii?Q?xv3xjT3ger4Gr+bCQbHfk6m6ZPmegSw6WKlk9wJfg4YG3fuF5TSNIR/P4Een?=
 =?us-ascii?Q?Ke23hQU7C/oabI/CgB+U1lwB3G77+LWwDMdDgvpBr7/of+ecFIJTcCFDod8H?=
 =?us-ascii?Q?uDGf/1Nhm93zbjE1RIXoQbG3c5UfX0/Wd9ZokvYhILi6aH8QfCPQa7k70FJT?=
 =?us-ascii?Q?2otIeqcBDyN4doQNQGCAsBnji+go8HHNMzcZ7MSesaRGCfw32XRJx4sFUHTn?=
 =?us-ascii?Q?mlk1NQg3JTi2+5TbZ98gvpNuL8GnPa1zwvwvxwVre/Nhtk1bWY31zwvhCLE7?=
 =?us-ascii?Q?IcUlgYa+HX6uEBlxtc51ApcOr9UlzwNEaRgY7oj6wX+uxfGjzqlx8vc16BH1?=
 =?us-ascii?Q?VFTlrDePL7DdwP6QiW5T7ij+J3nXJjjU0AS2aKT+mcNhhGHGl/pvSF7gTf6M?=
 =?us-ascii?Q?HGkyKIK6YUiaS/yKUxfylSlwaTMXiwYP+B2gHzCA4Xa/k3WKKNv2mx+NPZ94?=
 =?us-ascii?Q?EVDCBoKDu9ZeQ/WZFM1C5A02cLBbv3u91b34ueJGlgke30XWXFVeeCJGiRhD?=
 =?us-ascii?Q?WAGczJOnCKcjc11IGcsHcPpSbuGvzkNB1JdFr/2jqQci9OT4Bi3gr4xZ8cyc?=
 =?us-ascii?Q?UgBOGOvQkpMTFPDdlRmF0aUQBEvsR7gJSe1VKuQayyGXveZuikrD2GQXKt/T?=
 =?us-ascii?Q?gvCT0sZ+I98kmvq/RhI98r9VnsgvOCxl7E10BCSlHOuo2u44DkV+32rSmSaw?=
 =?us-ascii?Q?KDr/STbWKhkgeJvy+lOicbFw7IEIgOphTzvBZRPLVou1Iq2vsMaLdy2oalO2?=
 =?us-ascii?Q?8MfAYSXHRuzJCzpZEhAziqly?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d35fbdb-aa16-48ad-a330-08d8e95219d4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:36:50.4573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RzaJVxxzv2g8lEzmK5S1jyvGhQ6eZZCGPjGchV1Yk8pBbwFImSdzSCh5j0h2iGA5hNgIfWygySv8FqnLd2ApP0e/kNS336h6aDsNybrGd3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3573
Received-SPF: pass client-ip=40.107.4.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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
Reply-to:  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
From:  Vladimir Sementsov-Ogievskiy via <qemu-devel@nongnu.org>

bdrv_replace_child() has only one caller, the second argument is
unused. Inline it now. This triggers deletion of some more unused
interfaces.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 101 ++++++++++----------------------------------------------
 1 file changed, 18 insertions(+), 83 deletions(-)

diff --git a/block.c b/block.c
index 29e00c4708..707a8a7f8c 100644
--- a/block.c
+++ b/block.c
@@ -2367,42 +2367,6 @@ static int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
     return 0;
 }
 
-static void bdrv_node_set_perm(BlockDriverState *bs)
-{
-    BlockDriver *drv = bs->drv;
-    BdrvChild *c;
-
-    if (!drv) {
-        return;
-    }
-
-    bdrv_drv_set_perm_commit(bs);
-
-    /* Drivers that never have children can omit .bdrv_child_perm() */
-    if (!drv->bdrv_child_perm) {
-        assert(QLIST_EMPTY(&bs->children));
-        return;
-    }
-
-    /* Update all children */
-    QLIST_FOREACH(c, &bs->children, next) {
-        bdrv_child_set_perm_commit(c);
-    }
-}
-
-static void bdrv_list_set_perm(GSList *list)
-{
-    for ( ; list; list = list->next) {
-        bdrv_node_set_perm((BlockDriverState *)list->data);
-    }
-}
-
-static void bdrv_set_perm(BlockDriverState *bs)
-{
-    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
-    return bdrv_list_set_perm(list);
-}
-
 void bdrv_get_cumulative_perm(BlockDriverState *bs, uint64_t *perm,
                               uint64_t *shared_perm)
 {
@@ -2742,52 +2706,6 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
     }
 }
 
-/*
- * Updates @child to change its reference to point to @new_bs, including
- * checking and applying the necessary permission updates both to the old node
- * and to @new_bs.
- *
- * NULL is passed as @new_bs for removing the reference before freeing @child.
- *
- * If @new_bs is not NULL, bdrv_check_perm() must be called beforehand, as this
- * function uses bdrv_set_perm() to update the permissions according to the new
- * reference that @new_bs gets.
- *
- * Callers must ensure that child->frozen is false.
- */
-static void bdrv_replace_child(BdrvChild *child, BlockDriverState *new_bs)
-{
-    BlockDriverState *old_bs = child->bs;
-
-    /* Asserts that child->frozen == false */
-    bdrv_replace_child_noperm(child, new_bs);
-
-    /*
-     * Start with the new node's permissions.  If @new_bs is a (direct
-     * or indirect) child of @old_bs, we must complete the permission
-     * update on @new_bs before we loosen the restrictions on @old_bs.
-     * Otherwise, bdrv_check_perm() on @old_bs would re-initiate
-     * updating the permissions of @new_bs, and thus not purely loosen
-     * restrictions.
-     */
-    if (new_bs) {
-        bdrv_set_perm(new_bs);
-    }
-
-    if (old_bs) {
-        /*
-         * Update permissions for old node. We're just taking a parent away, so
-         * we're loosening restrictions. Errors of permission update are not
-         * fatal in this case, ignore them.
-         */
-        bdrv_refresh_perms(old_bs, NULL);
-
-        /* When the parent requiring a non-default AioContext is removed, the
-         * node moves back to the main AioContext */
-        bdrv_try_set_aio_context(old_bs, qemu_get_aio_context(), NULL);
-    }
-}
-
 static void bdrv_child_free(void *opaque)
 {
     BdrvChild *c = opaque;
@@ -2954,8 +2872,25 @@ static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
 
 static void bdrv_detach_child(BdrvChild *child)
 {
-    bdrv_replace_child(child, NULL);
+    BlockDriverState *old_bs = child->bs;
+
+    bdrv_replace_child_noperm(child, NULL);
     bdrv_remove_empty_child(child);
+
+    if (old_bs) {
+        /*
+         * Update permissions for old node. We're just taking a parent away, so
+         * we're loosening restrictions. Errors of permission update are not
+         * fatal in this case, ignore them.
+         */
+        bdrv_refresh_perms(old_bs, NULL);
+
+        /*
+         * When the parent requiring a non-default AioContext is removed, the
+         * node moves back to the main AioContext
+         */
+        bdrv_try_set_aio_context(old_bs, qemu_get_aio_context(), NULL);
+    }
 }
 
 /*
-- 
2.29.2


