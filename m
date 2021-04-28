Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BED4436DBA3
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 17:28:33 +0200 (CEST)
Received: from localhost ([::1]:35142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbm76-0004xV-RV
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 11:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblxi-0005lS-IJ; Wed, 28 Apr 2021 11:18:50 -0400
Received: from mail-eopbgr30098.outbound.protection.outlook.com
 ([40.107.3.98]:58735 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblxf-0001uH-Jy; Wed, 28 Apr 2021 11:18:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y4wXxFuItarID0qckwmkBIj1g9e3JEKmo0FkYSna2r/g0NTYATzydCvIdh7TlvrDk2aEUk4UKqIJ7SzD/tJJxh020jjn9K6iiaCdGk8+YoujsXXZf4I2dOjZ0BdZeJch7jtqN1Qtw9PYid1OWek/Exs9d0BBIIKQBXvmhQqwGyZ8Hbzt1qt3tV3qWJ9HNhWyTcHyxXkK0WUsJu4hW76hpDAUP8l6fV0l8JPnGK9VckfgfKUQtJHkMeDBEavZAOljcn5oNIpTC5Jl+/IWfmRdeB+bSFk0Qot1XXYFxiWQmRPE7Qk0/yHGzsS+drzsD4/fO9xmGZyd5kK6yINR13c02A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7QXKGVpfRYcqNcIy6bSc75QNsedk461mvwoGSuttgi8=;
 b=Znjn8UlfC3vg2hU4ZHxrmH180zkJpNBQwSn8eU3akdYUml3pESqVQ+ThbLrOTCp7jVlBZeR1ambQN+nR9RZ7/bB4Z6FKbhFhYnvbiF6L/pe0wf4pjAD6MzHoQuQnz1OCWWn2CNFW1+2HEEF2BEV4SUQVbesN27pgUVYKIKYGm18HifvEY64AKYnVCEbSc/TTcDrfDLzRLkSg5uALJKlJze5u21b3hkE2D8W9gDedXWnvlX65VLlrV+T8Zj+kgonekdEC9yNQldCU8mdTcvzs+nswD+Bvx9wFu8/dl9Jrx0JXFnWUDXnp4WtryM+LP0QZtOOIwtLhGl1fR61eqNAldQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7QXKGVpfRYcqNcIy6bSc75QNsedk461mvwoGSuttgi8=;
 b=G8L596Z/mSfvfAJoQAmVrZ9+mCAF7fmJdBxpmr6RefjGHEutuA//xIck98uT09sgu2TFJ8xQ+Hg/XXuxi2euOkaBhjfutQseXqPezjvvaggi9bCgPJSZwCsRruky2N6aS5CRW/V2lsY7Aj8LKUH7BOyq5AU0FkvsutlWrmqKbsc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6151.eurprd08.prod.outlook.com (2603:10a6:20b:290::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 28 Apr
 2021 15:18:38 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 15:18:38 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 14/36] block: add bdrv_drv_set_perm transaction action
Date: Wed, 28 Apr 2021 18:17:42 +0300
Message-Id: <20210428151804.439460-15-vsementsov@virtuozzo.com>
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
 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 15:18:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bfa1331a-63fb-41da-17af-08d90a58e5ea
X-MS-TrafficTypeDiagnostic: AS8PR08MB6151:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB615156CF5DF3DF53A10C6D48C1409@AS8PR08MB6151.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:175;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zz0AEXEeBSYPOEiPChNMcPiCr6qymlazrKd9g6t78K2RR2MqLxRuXG0cF3r+u4VEhVR2N/xGLX8X5uQpQwk1oXHktkw1j/tTZH7W55v+TdlsKGdHBSaCFRJsDtFnTape+JUdqw+IA8/IcNIgfiTIk7r41M267u1864Hw3+Yh86Xop/COP5zR+vpAF3+SnM8Ht2grQOGhRLR1XhPRYm1Nu3FjBOI2GSyN7Tih9tn/iTRwBXUtNbUWRU1e4qyVTglGjmKbJM+xnk29ieHZzzYsAhL8hIfBibgZ+PVO+H9mKziZ6UwXfAJYR2E8a1yihXc2uLULGM8JhhPReczVXLRD8v4vHqTmCDlA+k9brvAMgZMgzOsBqPPwwoxkwhARH7htdqMX0KHEVk23YdvhrIelpeiqqL95K9uYBjvnzEzIpnaNMpIbFf4OaCqJn3xx8LPUbQo2qG+KQAODd1d8NcdPLmB1pNwHu+KRHz83O5JlN09mt088wEoOt8jZ5tIKXZAfE9/ic2QUVa49DgM85sWZ2QFkVzX0SkZg/KliozBcmNSBkt2twSXnNgYWHqs2v/AhHDG1W+IegJs3D/G4mIyw996mlMWhMSLsbDbpwBBmu5YHBstcKb4jeJ50mxRhpKM9yTDZ+68BQ1ftgssjr3LWabIp0B6qJZj8iB70fEaUFZGRZYPiQU1Cdwg5rEwIHCes
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(396003)(136003)(366004)(346002)(478600001)(52116002)(36756003)(26005)(956004)(86362001)(6916009)(6666004)(5660300002)(316002)(186003)(6506007)(6512007)(2906002)(83380400001)(16526019)(4326008)(6486002)(66556008)(66476007)(8676002)(66946007)(1076003)(8936002)(2616005)(38350700002)(38100700002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?LOoTXKalzX0pCfa1L/XByTtSA36BBc8+dhKUO9lhd2vz/T6E4m1HJx3sc0p3?=
 =?us-ascii?Q?kcJMrtdtxUWA1i00rOVcbBTLGELOj63oOFLGoQqFqaJBzsvaeirmo7HlA6l4?=
 =?us-ascii?Q?s6jKD6Hh0d3orbyuVJLspNAAayZFdsEqn+xn0BdUI3icWYHdTWnRWS3Z+F9U?=
 =?us-ascii?Q?X5zPxkmnL5GYw6MqnRVFLcFL2qPQUkbfTCzIHAG+c7ti5pdJoiEfZ2f9r1sF?=
 =?us-ascii?Q?R73Kee86+oKuI5CWo1SZPg00E5dyW/NaNZimf3oiSK0j2a9JrxduYeygdnhZ?=
 =?us-ascii?Q?qn9l3GShvQJ1NA3jjxbIet6oqcUgFoqYVtBBlWiNVmwc4wXk+0xOLeNRr7vA?=
 =?us-ascii?Q?wV70PkCo/YoOKdGYJtO9Y0tsZmhC1W3GoGRMs44tcvIHjpMiPXXG8xwEgnoM?=
 =?us-ascii?Q?O7iSWu7Xz1+aQkx7O4RZ/uNvsSOVhd2VsCQx3q1mqAbo0H3DUxwZKI6VyVu5?=
 =?us-ascii?Q?y8H7itd0snBOClZhpijPBsdZLDwn0gGMhw45JHnpH+4j5UDPiv3Iy7Ho3AD1?=
 =?us-ascii?Q?8Ipiy6iD6lbrtN4q91aWY/DhHLloK/FIU5XkAnb68dVzNtCJj4vf8a49D+KQ?=
 =?us-ascii?Q?XPnqmVzJ1u95dJABFO2rQyVhRhJcndwRq8Yd92sZVEcLZRlvq8BxDNCqyT9x?=
 =?us-ascii?Q?bjETIn8vDJfP5bR8lfxk5uzFdZDLy+iejAGOx5rzVDKOJ1yK7K7cnpxaEM7L?=
 =?us-ascii?Q?lir7THdn8W/yaEmJ5DvcM3p0LjHd3+jAB5cptu39jOr4VpcSFFWWmWbponGf?=
 =?us-ascii?Q?rWEdRAQgxHvPqg5SwqibMZbo7sDx6sRpsfKb6UEty4LMlksxOEOUmDeX15Z+?=
 =?us-ascii?Q?6URlLAbk2jR8Xd6iR3fqzumUQEqMnuQdIbwDsg6FABB7w7qTQ9sELGNBvEBb?=
 =?us-ascii?Q?7F6UwfF2BIQx6H/ZMj6IoLgMlEowVfZ5JahBygeZFraERUlJf2RUkbkdEpCA?=
 =?us-ascii?Q?aytIar0obE1I8eGTc/i4mwDCKG0QiKIiR6FeldkGuvxQuT5HmdPMEnTMPWCv?=
 =?us-ascii?Q?A4z43i5+iQNCmyiZQXpKmRcNnzV8ORImorfhilyMns30U9wvkExwMhROIVhJ?=
 =?us-ascii?Q?SBh/BwBV/unD2DoxXUIpmVb4GpKFs1ddLwFhQPFFUWNh8HBmp20o+BGIeX/H?=
 =?us-ascii?Q?/3eCDJLHx65jFfypJojbDfW8vLCWnkKxLy+WkUE+miOdadFL10yHwPvXumeJ?=
 =?us-ascii?Q?e7e2IzMPK1cmOw5r8kjyh82BXY9hDTv+TdyMEtNq6o4NUNDKbYLwuZTf1TUu?=
 =?us-ascii?Q?brGWMbsxAVu0BmL/7xB/5fTvuGtNwQfcxtR/56GRkzU/arI2AB2qzmZAUiiR?=
 =?us-ascii?Q?irWCsldNw+Tgu3z8MOr3SwZc?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfa1331a-63fb-41da-17af-08d90a58e5ea
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:18:38.4844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TBMz4LvzfB5LdOn9n0f4/bQVdlCBqPvL05CReD4mNx4qJaGX0Jz9cjDr1e1t5izwRX3wZCw3QhyuY8vrNHqsvv1XVQOP8+qkK6aSE6sn92o=
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

Refactor calling driver callbacks to a separate transaction action to
be used later.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 70 ++++++++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 54 insertions(+), 16 deletions(-)

diff --git a/block.c b/block.c
index cbcc4c15a0..ab7a4d13d8 100644
--- a/block.c
+++ b/block.c
@@ -2189,6 +2189,54 @@ static void bdrv_child_set_perm_safe(BdrvChild *c, uint64_t perm,
     }
 }
 
+static void bdrv_drv_set_perm_commit(void *opaque)
+{
+    BlockDriverState *bs = opaque;
+    uint64_t cumulative_perms, cumulative_shared_perms;
+
+    if (bs->drv->bdrv_set_perm) {
+        bdrv_get_cumulative_perm(bs, &cumulative_perms,
+                                 &cumulative_shared_perms);
+        bs->drv->bdrv_set_perm(bs, cumulative_perms, cumulative_shared_perms);
+    }
+}
+
+static void bdrv_drv_set_perm_abort(void *opaque)
+{
+    BlockDriverState *bs = opaque;
+
+    if (bs->drv->bdrv_abort_perm_update) {
+        bs->drv->bdrv_abort_perm_update(bs);
+    }
+}
+
+TransactionActionDrv bdrv_drv_set_perm_drv = {
+    .abort = bdrv_drv_set_perm_abort,
+    .commit = bdrv_drv_set_perm_commit,
+};
+
+static int bdrv_drv_set_perm(BlockDriverState *bs, uint64_t perm,
+                             uint64_t shared_perm, Transaction *tran,
+                             Error **errp)
+{
+    if (!bs->drv) {
+        return 0;
+    }
+
+    if (bs->drv->bdrv_check_perm) {
+        int ret = bs->drv->bdrv_check_perm(bs, perm, shared_perm, errp);
+        if (ret < 0) {
+            return ret;
+        }
+    }
+
+    if (tran) {
+        tran_add(tran, &bdrv_drv_set_perm_drv, bs);
+    }
+
+    return 0;
+}
+
 /*
  * Check whether permissions on this node can be changed in a way that
  * @cumulative_perms and @cumulative_shared_perms are the new cumulative
@@ -2249,12 +2297,10 @@ static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
         return 0;
     }
 
-    if (drv->bdrv_check_perm) {
-        ret = drv->bdrv_check_perm(bs, cumulative_perms,
-                                   cumulative_shared_perms, errp);
-        if (ret < 0) {
-            return ret;
-        }
+    ret = bdrv_drv_set_perm(bs, cumulative_perms, cumulative_shared_perms, NULL,
+                            errp);
+    if (ret < 0) {
+        return ret;
     }
 
     /* Drivers that never have children can omit .bdrv_child_perm() */
@@ -2322,9 +2368,7 @@ static void bdrv_node_abort_perm_update(BlockDriverState *bs)
         return;
     }
 
-    if (drv->bdrv_abort_perm_update) {
-        drv->bdrv_abort_perm_update(bs);
-    }
+    bdrv_drv_set_perm_abort(bs);
 
     QLIST_FOREACH(c, &bs->children, next) {
         bdrv_child_set_perm_abort(c);
@@ -2342,7 +2386,6 @@ static void bdrv_abort_perm_update(BlockDriverState *bs)
 
 static void bdrv_node_set_perm(BlockDriverState *bs)
 {
-    uint64_t cumulative_perms, cumulative_shared_perms;
     BlockDriver *drv = bs->drv;
     BdrvChild *c;
 
@@ -2350,12 +2393,7 @@ static void bdrv_node_set_perm(BlockDriverState *bs)
         return;
     }
 
-    bdrv_get_cumulative_perm(bs, &cumulative_perms, &cumulative_shared_perms);
-
-    /* Update this node */
-    if (drv->bdrv_set_perm) {
-        drv->bdrv_set_perm(bs, cumulative_perms, cumulative_shared_perms);
-    }
+    bdrv_drv_set_perm_commit(bs);
 
     /* Drivers that never have children can omit .bdrv_child_perm() */
     if (!drv->bdrv_child_perm) {
-- 
2.29.2


