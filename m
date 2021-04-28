Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 071BA36DC8D
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 17:59:01 +0200 (CEST)
Received: from localhost ([::1]:41752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbmaa-0006n4-2E
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 11:59:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblyb-0006Kf-UR; Wed, 28 Apr 2021 11:19:46 -0400
Received: from mail-eopbgr80094.outbound.protection.outlook.com
 ([40.107.8.94]:21824 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblyZ-00028Z-Op; Wed, 28 Apr 2021 11:19:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H9soIYySrMofi9RRK1vkqS5oi9Qni11pK5YsslcHsVAGyxEuZNoDLvGx1EdsuT1KbVd6eOw53hSug+pQoiZboFo0CGQcvD4QdZCOva4XY+ALeZagX1hAtgpBYf0ioGgvoMgNsRQB+QJpMk+UGo6HFn6stLU6Zmw9lkwlTNOq1PhMsdo6q2llErDs8dEkOYZmWPTGvVst4pK4wsXM2gAL8+tL75vNBkxXBJth9A4Pxh9QSo2eK1qeV6OIvXrg23OteBBnd4mqI3wWrsAhATWfBDTsrGxzGb7hrDzMzLFML8686+bcay0cIwfrYMA5OOLwrHnJmDVgZjwDJWxbcr9VgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ikeu1RPC46mmvepVCDkeSXzp2sllV6kQEIdiZdFgk0c=;
 b=HO0S5Xwr/iKvPinBZjEvHQCK070a4sJ77JJeSvxXOcPx02Kv/7klMhaNYJAV3HqeCwWy1iq3pXG6gshiz+4qGrEFZZOn3I1UGn75cg4+j7kv89RQnJ/deCXiQoGeV1f+13K2fEr2k/AtTBagTSaoOG/FNnXkXrGwA+MMbY72CHmwwCQvZ5YlKmBxrdCGXX8Wtavn1AcVZ2j946ORdIphq5Yd8i5CtSt8tyWl0/1V/12fk6fH+14g+uXgVDwo08UYo1jWkWBXJ+x2SCDQDelwNpbhIpte/njSBykJ2aW1BcOtamrBhcM1eBMGYUeD9ocqE5Qp1rF7zm5w1L1YZsfyYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ikeu1RPC46mmvepVCDkeSXzp2sllV6kQEIdiZdFgk0c=;
 b=UyWy2sEr9Q6LwjwUBNE8K+oJhGX1pVUuODKlKn0zOcl5tav21L189Zn8cJwCJvo49BYGn9xRcutyrWsR0aitmyFj7XvGFEVst4zTG/GHi5FbY/vzFtJFn1fYy1gbe0lLF07pC9GJbv2mMPBdqN5gziZbfaCXHMkiWcnMDGahADQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2419.eurprd08.prod.outlook.com (2603:10a6:203:a1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.26; Wed, 28 Apr
 2021 15:19:28 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 15:19:27 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 33/36] block: inline bdrv_replace_child()
Date: Wed, 28 Apr 2021 18:18:01 +0300
Message-Id: <20210428151804.439460-34-vsementsov@virtuozzo.com>
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
 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 15:18:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ebdaa74-ef78-4545-57b1-08d90a58f2f9
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2419:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB241977488617904D824D5146C1409@AM5PR0802MB2419.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xefSDYSGiTwjynTo+8Fcvngm4CPahcvX00J/6Kvli72fajGwHb/22ZT7ZRS5yamgwKLN9wE6y7kWy53RC2j84NsiCBJe1A3oTw2tmg1FZd2+vdYYbTSaVthqZdswBLw3gZ0S02s1N3q/MhNkrigIoXlFQ92poV1dEOOPLJQb+d6MEDlfwEy/eCoZoZM5p9pqr04L2evRwy1gplobpWJAgjiuXcTXQLoTkN1Xac1QA3g1UK61SOFMDiMTfoP3/DTju66E5ZFQ7U3ZA+RL0uAuigqH6dd1sBfzERw3aOngjolT1m+lIxSU/ya3UdodMvOrsW24FKhHKbbw6dphw74/KNeUF4SmfbT/DaKBiUd9tV3lJ7SRlX1l79xGGPGIgEQpZljSk73ZKoD6XSR5EQVXct7qqelGsDMASq6KLeEnmWXu2ZsIFv45UWg0bfklD1tiq/NXIerr1I6PMkBTEfD+7Qn5/CIqXqn8J3NWEuNL4p/eYnyhL+Ze8EKBYNYaPJONOnc8M+KzBOofccq8zIgPmET78OYbZNwJH5e66OovqKlLc2pCmYHQyjMdo4srRvqsv/KATsd0EySc38QVW2l3AWLsZYZggYj0nG8YUEjcsn/FzRR2HrS141cN685p9PnXged7L2sfd7sheJHdIM1XgsVIVfgZlEpuGcEUVWHYGLpfL0wDm3V/uHubm/21eKya
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(136003)(376002)(346002)(366004)(6666004)(66476007)(83380400001)(8936002)(186003)(66946007)(16526019)(8676002)(956004)(36756003)(38100700002)(66556008)(4326008)(2616005)(6512007)(478600001)(52116002)(26005)(86362001)(6486002)(6916009)(1076003)(2906002)(6506007)(5660300002)(316002)(38350700002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?IkqxqXCuH1JJxJX5fOElhey9m82NBBi3e2WlHdbE8VpOW3WHhtBQ9pprfjEe?=
 =?us-ascii?Q?qGawEEb3aHiKoMsHV2Ww1z/KVjoSGuvMYcqr+S7FPapbUIC8c+1k/RDrQimL?=
 =?us-ascii?Q?oMuaNgReq3cUaS1dxE5xci2UDYkk6Hpqbe0uw9JGSzZe5uteiZQltP+snYPM?=
 =?us-ascii?Q?D8sO/ABbJ1YM28fIsopSLiL6YxUCTaDuKprluhx4VOrhUf5dypEd8os7Hzwo?=
 =?us-ascii?Q?gMofmURtoOVrM9GmxWsGVdtrVCBOC03r5B2jlRzu4NVzORHDdWX9B1uSeycF?=
 =?us-ascii?Q?ar8wadHWFY7E3dTtM/e+88o7ihiEWEhDCCKTRsBojqH1tbWy413ZmJmIKULl?=
 =?us-ascii?Q?N96grpKFDpypxgqiV6iiWUVMfoqzBED3Q7p9ReCoMyh+0V/8dBLLgPQH3z7B?=
 =?us-ascii?Q?71zO6xL6AGNVHD0NNE4vpa+tBwE+WOIfm/HDiXiS/tlsAhj1YH1CjBSxcUeM?=
 =?us-ascii?Q?ew2mOEPCvA14CyfbartkPPhRYj8HJTvxlE15epUR8aLTyCD2gG1lws62Ym6Z?=
 =?us-ascii?Q?g6/n9Jv1tmNjjp4iYdYR+REXmClCj9aGN1IFB48yGmPCQ6QZScNlBxVx4tmT?=
 =?us-ascii?Q?lIhRKEPX55RT7+8Dfwx5RQTm/R32UzRiOlbgbuZe1N/2mBJVcAbuyc77wCGY?=
 =?us-ascii?Q?qh9ENGLZXaAzg1J0X+8VzXDkl7fk4WHRY1LJ7lpym4rf8hQcV6DCzxlqHEde?=
 =?us-ascii?Q?qhWCzB69uv43k0iN0DBfZMjZRqPk9bHoV9J6wO+/C8KG1OWOGmHxB48Aem9f?=
 =?us-ascii?Q?Bnzsl9L/LjZMBK9EPifad1xNAWBi/0gVPXRuHjbU1RHRq7wV3o4f7S4OP3KQ?=
 =?us-ascii?Q?3Bm+OkeVpjUDdXnjiLK7rhVXnjjecS3aFMdLI5x9r2cCZIetU4AE3zzg0omY?=
 =?us-ascii?Q?2uxw5u5YFw6dIoZi1culZLYVTKgjYmhHjpSC+b+iq+2PXkTTndeU+uRPplSn?=
 =?us-ascii?Q?ChIWYET5NqVkSWYJbyLzIEl6uovHa/B+9XyhZw9EY4UtBlqmoioB9QcWP3Gr?=
 =?us-ascii?Q?9XACKMImHBdjNNNA7qR/G3Nz8mWIX8hCb0inD4iYjNugon3e51vrNxJFf9Ix?=
 =?us-ascii?Q?3l9uaCelYzRz79ohDtSuYVaym+vUiZLFzJxm3uW2csf+/1x7CIHvy/8SRw4O?=
 =?us-ascii?Q?3yCAR9nuAPD/pbYc/EdDss62GEYK6SO/fw5tRGMu+AP8VJXkgi2hQpYYZlOc?=
 =?us-ascii?Q?43AeatCseJxM63J4ImfHlgfiPVGICzeHs3IAmmy/6mj5XfC2siNyzW83o8ge?=
 =?us-ascii?Q?grBkwXlLDMM5Ght+o7LxjIaDNUdHPiXMt3RuWzY1Hw9gckV731jSSZq+oGSF?=
 =?us-ascii?Q?WYltvhluXGQrvBbAE5POowp3?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ebdaa74-ef78-4545-57b1-08d90a58f2f9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:19:00.1369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tfhWLgkX/RLBx5FIOIygTQQHhbWj72EiYGtojwST8wE7Ezngtt6aELJ/Q1qYGzH5yLvOq1p6+bUwXGiyU8g+PLfIaGXX9lUTaisr5MkTkuA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2419
Received-SPF: pass client-ip=40.107.8.94;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

bdrv_replace_child() has only one caller, the second argument is
unused. Inline it now. This triggers deletion of some more unused
interfaces.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 101 ++++++++++----------------------------------------------
 1 file changed, 18 insertions(+), 83 deletions(-)

diff --git a/block.c b/block.c
index 38bd2ea32e..2362c934a4 100644
--- a/block.c
+++ b/block.c
@@ -2401,42 +2401,6 @@ static int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
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
@@ -2776,52 +2740,6 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
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
@@ -2989,8 +2907,25 @@ static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
 
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


