Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8CC33F3CC
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:04:09 +0100 (CET)
Received: from localhost ([::1]:48444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXiS-0000Re-K4
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:04:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXIF-0005D6-0l; Wed, 17 Mar 2021 10:37:03 -0400
Received: from mail-db8eur05on2128.outbound.protection.outlook.com
 ([40.107.20.128]:5633 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXI8-00079x-9p; Wed, 17 Mar 2021 10:37:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mT4n1ihmCpG+pXSEFxIL+VQKmf/OjNGzmM6/Jg6khgOndidJDhEVwKBqpHC1hE9HPwIoe7zt9umEGLqiN8/upa86x46UmPte5r6+vHE7V/ujcZ+hTtq9bUaEjG9iJgEAnMcNmj/Do4Kynlw4ehy9hwjjo56wQw0sCexC4Krryw0ZaEjozojlOjdqmnUtzf33cDtUKUfPEP8i9xA3TM4SI4whYNhaUQxbRGnBOp/vsLuTbdWADEHLPQNqb4R++hvUqcX3k1Cq5+fOexzjuOd1G4Gb5epgItUsksQqJ8m5s80U2oNin7NN1/5rPdUTdRHcuXldsQuatYYgLx7aiwsi5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T04kETF1eMBgpZvBqkFGLzLSnvs2s80XJIwqI4hwbd8=;
 b=N7EK14T2DV44rjy+v61oEY4XrYItBLS5IG83T/uMFfF16bXXudRWhR5Ue6Lc5HYu5GmTG6bk6PElz3Csik9JQiCaABnBSRj8hG2XOKh2A0fZGTDt8QdiQK2tAtoek8Aw7UCxVjVx5NpACprj+LlSIhIDCDv4hmV0Xepmnq+Zd/gyR9XbiUKICW7WppseqPq/kJMA113WjWGBOpsFfQXmzMgK234DALGtYrX/52pQBBSaIjvLw82g3vhOXeCzZd1ybg88Jh5mgU/24ITYmmUULFf5tz/zoCrMk+vEzVmbs6yY3dHHcAVnagD0aZf5kwxWMEAy6dHBajxlOGUGWWmunQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T04kETF1eMBgpZvBqkFGLzLSnvs2s80XJIwqI4hwbd8=;
 b=HW6rbWFMBrfP92gbRj8nn64kujcdteKVYlBv6CmM+rCM3+qabeel8IbaSNljoc3UF2UNJ3+44496ql0x4vIC/x/Zul62mYZV/5kPRnZKaHj5hv/UEu4M7DwTj0GfOiuAK3Xzh1uUCX7nntys/1djycrcs5HgOCd6eIYQJhIyaT0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6216.eurprd08.prod.outlook.com (2603:10a6:20b:29c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:36:43 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:36:43 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 28/36] block: add bdrv_set_backing_noperm() transaction
 action
Date: Wed, 17 Mar 2021 17:35:21 +0300
Message-Id: <20210317143529.615584-29-vsementsov@virtuozzo.com>
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
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 14:36:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c52f32e7-c7aa-4183-51d1-08d8e95215bb
X-MS-TrafficTypeDiagnostic: AS8PR08MB6216:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB621626B71CBC43FEFB89B4A8C16A9@AS8PR08MB6216.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5iITGyIg71U9ao+N8WFr/7lF5sulF/rIh7phmeQ8TBtmSlsaryo02Sor6gtpm9iHAy/F1j+nB7rJ9VhAWJsMsUIOltUFT+vYz0P/4T6Mit1cptUvKDgu96k1W2+9RRXNhT/7Q0mAvaWMemnXJu2e03ZwznpU1/bFEVnELjlyEfZNRpA9gYvq2vM6pR8bZDrKKCh4RCpnyV1XL52RMjZoRbWZSOttN7O3g4988jYEnCkfNV9OBcy6/EwydGsWkUynlwChFWFEPLcUHIFsTDHA9uoAdFbnLqFRnM5ciy0e0CiYM5wdA5/Z5WfHg7LaaRbxyNBKdzgl6PZ4oh+lTkaax7cMpatvunOvfMOAsyzq40v9z0V/uusJ/zAh7OflwDfkv6lwAsZTgl1knDPjotTaaSArfT7WolMz08OIgKiq9IUWBD8KIiGy0vLtBO7cqiZUv889PWj4B6Vpg5d+micc3wpRA/ISnqvBrEWipj07/73wiFsC0a8bKxiclEdqiwERWLt/gWL6RoEWqieEYdWdb0peGbHRmYOqDC8/7JFvfAyGMznfaaIg+SmL0NcMI6nXTKsZjRpA4gE0wHp27BpjDhlGtrQ7ODAm+rGwLP5H8p0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(376002)(39840400004)(136003)(6916009)(83380400001)(316002)(2616005)(66946007)(6512007)(66556008)(8676002)(956004)(26005)(1076003)(16526019)(6486002)(186003)(4326008)(36756003)(8936002)(2906002)(6666004)(5660300002)(478600001)(86362001)(66476007)(6506007)(52116002)(69590400012);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?5hor9ddYVNQdMylB6R3wobCbIMmIvBKyasQ6s0eu1CBhFQC9xKBhL2HC1V2S?=
 =?us-ascii?Q?JhPtxJImmmYiI6AxHCdq6K0hQB7I2X8SMxun0qgW40kuBciD+PtJN8LoriLQ?=
 =?us-ascii?Q?9e14tcBodX5szQmFmq4L4ypECI5ls93bSJTsBPp5YAxxy9qaAgFE7Q9rsylt?=
 =?us-ascii?Q?ENkHl2w84XerHz01B5CdHu62Wga/mBRdmTvp5CejNsGmhwn3l0D/n/ckAG9g?=
 =?us-ascii?Q?dyCpPhABkACbhD8MXtDutAe71pOZeMLu7xHzP2MnzVT9sqlBaGSWdFOOxX0C?=
 =?us-ascii?Q?B7xZ5dnrZuC5MSvF8LZ2jU82RGPjpYDjG840TpRdPg/xvEhCGTriV3Evq3uG?=
 =?us-ascii?Q?5CLoBJTsXWGpXb7+k128pbmQQOya52gYXPZyaSv45fm/MkcjYmrH3Qb3TnLZ?=
 =?us-ascii?Q?v+xX1osxE/TDj7mbDJgFlBeIlw4/aHutXNMtfNpJyvuU1j5uoiEmHPNNdzHx?=
 =?us-ascii?Q?RsPI3ZB8bn9ljG7GlO2+H9WsUH0wmtv32yszgB3q1TK/rRfi8m8SjrFYggA7?=
 =?us-ascii?Q?xMYQqFzLWfF9k+j8AG0kmczkJx1qxJoD4qXLem2Dsxr2RPWO82blMKDZO6HO?=
 =?us-ascii?Q?ar5W1fEFl+rwpjxuyt5IXnk1000ck3AILaQ5YUfuRbx8k6LlMtdB5Qfks7cs?=
 =?us-ascii?Q?4+Ft936Yrllf+B/QV7iNA6lERjkA59FLXHxF+3i4DzSMjoKBPV+GyTmFEVFm?=
 =?us-ascii?Q?DM1g70VB1mqEwTrDv9V+fSgOI0VapkpToE8esRo4EoWeVyHXPDIGBBFZnIuB?=
 =?us-ascii?Q?BbMT1+/R6pUqpG9vNHCWrkF+B+LFafM3IkUt7MQOg326z/3PDUHUMlCFWudZ?=
 =?us-ascii?Q?SmL+WWbD/mtf3Npn3MlKgWTl37wtxAwoU3puZDxuYjxJPxZDLr4mlpjwOY4w?=
 =?us-ascii?Q?vbe0tAzfo5wrH8xlP27WzPEjNvdLXwW3yAHkkGf3E5dBQd6PBYGyFUnVFgtu?=
 =?us-ascii?Q?Vi06dsIuYbb7wyPtD7Dv7tSdYDkN53R0Zlsm0escuWFniWpHMusLfubyPskZ?=
 =?us-ascii?Q?qr0hayVxzMtef+uFCORJLc3si4aj9jF3J+im9C6sUq/+pPc3hU1ZVjiu0zRo?=
 =?us-ascii?Q?rT8T150e7B5QUYxDvcFihC8xfERlR0jtNhySxMxjX4/ZPC/GUvHpIItzOpGq?=
 =?us-ascii?Q?3Z3APQ7UgDk5lsylbJuSxhrQ4AQfJJb53p6KqGrJsse4MdaJyW1jZ+njEWEK?=
 =?us-ascii?Q?E9PivU0bnWr/isaRxIRDCtk+fWHkeZ+ZvEYafC57Tt2WzaUqK9qbtKvXgCj0?=
 =?us-ascii?Q?TxOTN9JLvPKXbfYeD1Di4L/jRVBEMtql6wZfLzmi+BXYFtPs4zQI2hCW0CgW?=
 =?us-ascii?Q?JlREin/41g5UzuFuEW/QWlGO?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c52f32e7-c7aa-4183-51d1-08d8e95215bb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:36:43.5875 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kF7FO0z/JOK4BKGVfXu9m6bG1obX0NYfrpCnuzQ71mR7YJarBm6QJxTT4dGyUO68VDk04C8TQamxHfso9qz6qlnex0gGKko3Oc0Pq6OL5VM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6216
Received-SPF: pass client-ip=40.107.20.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

Split out no-perm part of bdrv_set_backing_hd() as a separate
transaction action. Note the in case of existing BdrvChild we reuse it,
not recreate, just to do less actions.

We don't need to create extra reference to backing_hd as we don't lose
it in bdrv_attach_child().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 54 +++++++++++++++++++++++++++++++++++++-----------------
 1 file changed, 37 insertions(+), 17 deletions(-)

diff --git a/block.c b/block.c
index 03a1f02e5b..b58c8d3e10 100644
--- a/block.c
+++ b/block.c
@@ -92,6 +92,8 @@ static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
                                     BdrvChild **child,
                                     Transaction *tran,
                                     Error **errp);
+static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
+                                            Transaction *tran);
 
 static int bdrv_reopen_prepare(BDRVReopenState *reopen_state, BlockReopenQueue
                                *queue, Error **errp);
@@ -3287,8 +3289,9 @@ static BdrvChildRole bdrv_backing_role(BlockDriverState *bs)
  * Sets the bs->backing link of a BDS. A new reference is created; callers
  * which don't need their own reference any more must call bdrv_unref().
  */
-int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
-                        Error **errp)
+static int bdrv_set_backing_noperm(BlockDriverState *bs,
+                                   BlockDriverState *backing_hd,
+                                   Transaction *tran, Error **errp)
 {
     int ret = 0;
     bool update_inherits_from = bdrv_chain_contains(bs, backing_hd) &&
@@ -3298,36 +3301,53 @@ int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
         return -EPERM;
     }
 
-    if (backing_hd) {
-        bdrv_ref(backing_hd);
-    }
-
     if (bs->backing) {
         /* Cannot be frozen, we checked that above */
-        bdrv_unref_child(bs, bs->backing);
-        bs->backing = NULL;
+        bdrv_unset_inherits_from(bs, bs->backing, tran);
+        bdrv_remove_filter_or_cow_child(bs, tran);
     }
 
     if (!backing_hd) {
         goto out;
     }
 
-    bs->backing = bdrv_attach_child(bs, backing_hd, "backing", &child_of_bds,
-                                    bdrv_backing_role(bs), errp);
-    if (!bs->backing) {
-        ret = -EPERM;
-        goto out;
+    ret = bdrv_attach_child_noperm(bs, backing_hd, "backing",
+                                   &child_of_bds, bdrv_backing_role(bs),
+                                   &bs->backing, tran, errp);
+    if (ret < 0) {
+        return ret;
     }
 
-    /* If backing_hd was already part of bs's backing chain, and
+
+    /*
+     * If backing_hd was already part of bs's backing chain, and
      * inherits_from pointed recursively to bs then let's update it to
-     * point directly to bs (else it will become NULL). */
+     * point directly to bs (else it will become NULL).
+     */
     if (update_inherits_from) {
-        backing_hd->inherits_from = bs;
+        bdrv_set_inherits_from(backing_hd, bs, tran);
     }
 
 out:
-    bdrv_refresh_limits(bs, NULL, NULL);
+    bdrv_refresh_limits(bs, tran, NULL);
+
+    return 0;
+}
+
+int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
+                        Error **errp)
+{
+    int ret;
+    Transaction *tran = tran_new();
+
+    ret = bdrv_set_backing_noperm(bs, backing_hd, tran, errp);
+    if (ret < 0) {
+        goto out;
+    }
+
+    ret = bdrv_refresh_perms(bs, errp);
+out:
+    tran_finalize(tran, ret);
 
     return ret;
 }
-- 
2.29.2


