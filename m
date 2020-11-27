Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B20C42C6885
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 16:14:40 +0100 (CET)
Received: from localhost ([::1]:34640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kifSJ-0001XN-Dz
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 10:14:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif1F-0001TO-H4; Fri, 27 Nov 2020 09:46:41 -0500
Received: from mail-eopbgr60102.outbound.protection.outlook.com
 ([40.107.6.102]:38277 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif1D-0003GS-KW; Fri, 27 Nov 2020 09:46:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KUKeXZIrtNiU4vW21cboE2Ps0rvcxKy7YM6aTf//C+70b2U62BLeNJeLimK232SpKqeABvhEWhDpNMLg3u4j1QQqI1hS9hDWm2/olGkW9kl/Z0ofOaH2dE3rbD6vD6vbssb57DO6Ut8+UQ6FLaaakODW0ofydmnE23lT84739zRvBzB6ASPcxQOr7uKQL+TyQ5j/ILBO3j+UkI28SA37FVWOu93E1tmHNZBfZvzyzWvdNQtkpL94LB88S3yfGuxoMV8ZbPB+NaK6tDb5Ey8Kd7tDBFvTp3bDAFwlpKdBnh7fYrItFpxCB1mF//7Ipxf6MPlY4vtjcvnG+YNpo4tJow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z1cALyComlxfq7PKFLnsGDpc6xfov/LkzuMRyu8hoYA=;
 b=A7mY0Byh4e9TZvZq1CHkj6gYJu12+HD0yHnpJydpaH+Hpf7zRtu/2G0EGFw1nU/ZziEDgEIHl465WPREEjr8gk19PAU8FcGPFPbBgOCub5lSiVtfcN/ntDzIlwNdbHvjxyd++HYVOhCoMU0pMefYkBfRGDBn3y4fas/Kwnm/qOGrZNvFKsD5M7bUUXaBJYcRTc2SF89VUbAzrRV9DI4eqfEYm6U77idSYOlzDTmoqV/3i4jH78QrfL1t0mGP1dY7ppNLUZgb31DHiiSr0TBUonr23aF/8vq8Rm9+4d6HWe00NI8iIqxYw4MDsJSQgWuBo9wdIj3+IFb5lLZa6BfrVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z1cALyComlxfq7PKFLnsGDpc6xfov/LkzuMRyu8hoYA=;
 b=oUmP6oevyOLw85tyj5nQ1wJH2GdZb0kGfLyHWTZJszvhM3rXDKWVzW0ptdKxA178NUY724qpvgVt3tmf1fK324N1x06Bpjh22bc11sVzoeGzv2jsJxShCBE/nqolz0d7JK81bG2Ukcs9cRSuuacVOsNVMRHaOWQcZmrK0+qo4g4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5078.eurprd08.prod.outlook.com (2603:10a6:20b:e7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Fri, 27 Nov
 2020 14:46:11 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Fri, 27 Nov 2020
 14:46:11 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH v2 28/36] block: add bdrv_set_backing_noperm() transaction
 action
Date: Fri, 27 Nov 2020 17:45:14 +0300
Message-Id: <20201127144522.29991-29-vsementsov@virtuozzo.com>
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
 Transport; Fri, 27 Nov 2020 14:45:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5651aaed-6b19-4408-fc5f-08d892e3270d
X-MS-TrafficTypeDiagnostic: AM6PR08MB5078:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB507814118C8B01B54A9DC9B8C1F80@AM6PR08MB5078.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:128;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tUnEJaRjSxdkKsBExmReWLO49+x0YGy6RLTjWJFZE8PyK+WHiL9mJpTVDIwQmMWDJowblesxn3sTFxi4w0EMpaw9d5ahOW0UXgvZMifNgBapCYsr6rdYDrjVhiz6stiUrccO90lKCi7mWxsydTTHgqv4qLi5ZHU4ZtbHNSzOqBNGtjkDYZmvaYeOWq8byuTVNh2GhuFdX2MRjZNKIKyAoJcE8udFpdu8S4iBLiA52AcI4xpBrtHzAD1K/5gzjMhHXHEMcVKVCwSDK6GQoPegn3JPlmdJu8rS21NTsruKGaT25ohg11xrukmcPxiWad6zpmM1xU6f2Vk11TWgQ8oC1Jd6YoAwSR4dzn0zC/VTb+5eGNAgSeqYO2j6MCkcbEzU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(346002)(136003)(396003)(376002)(86362001)(16526019)(66556008)(66476007)(478600001)(8676002)(186003)(66946007)(26005)(52116002)(83380400001)(6506007)(69590400008)(107886003)(6666004)(316002)(4326008)(36756003)(5660300002)(6486002)(2616005)(956004)(1076003)(6916009)(6512007)(8936002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?wUoK7VU/x8fLxIRSdHQcJaudDeBD6LDWslbaz5Neuo4YBfQGduS/QI3KzTG/?=
 =?us-ascii?Q?iVKDvSvfArXoOGLm+/e0tLAsSmVdnFYCVfkQMTsiRiAvt1RMlWov1FwO0tbT?=
 =?us-ascii?Q?PsBH5KghwQSkf8YxKnARdkpAi4rjva6a862QZA2OWMAnDQVKDEYmlYrDd9US?=
 =?us-ascii?Q?x9K87TbxiZVy6E8tAFeyeSMsPG9ai2VWjIOd4e24j4GTH+ink1lJ0Bb8XgSm?=
 =?us-ascii?Q?afWpN91AfRt1Bn1rgJDk+roIgCuLmRF+o0rkuirF0hSpEacro2wwC2nHG9lz?=
 =?us-ascii?Q?uLmK1o5CJaOoPeYyGfzr1GxXXFc54BV2tJPZl6G+iYvX1p0nbWc0Fmy/do4J?=
 =?us-ascii?Q?pErD9gPJOkz8HuV78wYoQyUQpDEaXgcoyHtE0pD/lfilmRhnHedhDji85y/H?=
 =?us-ascii?Q?AmsxvLigNmxUbWQdl2RBFj5m1dYH61wDok+hLtJAQfgANh/+NjjHj0YFKNPe?=
 =?us-ascii?Q?XlaVS/0W3Y0qb5njBtXme6ARaxVxDUB2B4doC9qZhqfDDO4z2CdUJkQLaO0Y?=
 =?us-ascii?Q?Z4npUrgVZDhERlle45yiifH2yLNkJqGgeelqY+wrdSb5OdS2xVDJ7EraGlc9?=
 =?us-ascii?Q?oLDpSldSnJKGP3xfIcFQQl6lhLw1XJRqCMmz1Ty6vdoq6v0fxMbIVPwX1Syh?=
 =?us-ascii?Q?52pU4I5FUEwbLPEUzJlUVt4I+zOGOi6zi5VNIJsfjD5/FI/+RkWVghwHEL3X?=
 =?us-ascii?Q?OdXx1SQTJ0qaK6n0fLrsG8tsrrOnqUZj5gdjm8gKWxqVa1tQ2Bl3yJRw2hRa?=
 =?us-ascii?Q?7E9SDut9NXazpMUl6jU3DI44XIk+a7UhN/SdCBHRv7+yBsVQYjWs/b/Dv+IR?=
 =?us-ascii?Q?7PuVaNCEUS3Ez7CFdbUYS3glyZi9CAYDfiHwesOEUYJolmLyIvMOG/PqRQVk?=
 =?us-ascii?Q?05/fI9HprdWePlR23vxfx+g9NLjorWz9ypiLhMbrAx8qFW8Ia6FTZ2268nxA?=
 =?us-ascii?Q?hfGyUzM713LPeh4isWmUFW6ZXAxh8cIdZ4qr3oNr3swtBrF9cyCbURSKpshV?=
 =?us-ascii?Q?8ioB?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5651aaed-6b19-4408-fc5f-08d892e3270d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 14:45:58.5136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kdtt0DD83YX3hVldzFv3aRnsZWkzaPBrtUnLHuDDEiqiNCLejZW8dMp6Q1q0rEWeYGpJt1v6YdzBNA1qbTn4+9WZmck6D5MYDPsiNRhDiBU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5078
Received-SPF: pass client-ip=40.107.6.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

Split out no-perm part of bdrv_set_backing_hd() as a separate
transaction action. Note the in case of existing BdrvChild we reuse it,
not recreate, just to do less actions.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 111 +++++++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 89 insertions(+), 22 deletions(-)

diff --git a/block.c b/block.c
index 54fb6d24bd..617cba9547 100644
--- a/block.c
+++ b/block.c
@@ -101,6 +101,7 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
                                     uint64_t perm, uint64_t shared_perm,
                                     void *opaque, BdrvChild **child,
                                     GSList **tran, Error **errp);
+static void bdrv_remove_backing(BlockDriverState *bs, GSList **tran);
 
 static int bdrv_reopen_prepare(BDRVReopenState *reopen_state, BlockReopenQueue
                                *queue, Error **errp);
@@ -3194,45 +3195,111 @@ static BdrvChildRole bdrv_backing_role(BlockDriverState *bs)
     }
 }
 
+typedef struct BdrvSetBackingNoPermState {
+    BlockDriverState *bs;
+    BlockDriverState *backing_bs;
+    BlockDriverState *old_inherits_from;
+    GSList *attach_tran;
+} BdrvSetBackingNoPermState;
+
+static void bdrv_set_backing_noperm_abort(void *opaque)
+{
+    BdrvSetBackingNoPermState *s = opaque;
+
+    if (s->backing_bs) {
+        s->backing_bs->inherits_from = s->old_inherits_from;
+    }
+
+    tran_abort(s->attach_tran);
+
+    bdrv_refresh_limits(s->bs, NULL);
+    if (s->old_inherits_from) {
+        bdrv_refresh_limits(s->old_inherits_from, NULL);
+    }
+}
+
+static void bdrv_set_backing_noperm_commit(void *opaque)
+{
+    BdrvSetBackingNoPermState *s = opaque;
+
+    tran_commit(s->attach_tran);
+}
+
+static TransactionActionDrv bdrv_set_backing_noperm_drv = {
+    .abort = bdrv_set_backing_noperm_abort,
+    .commit = bdrv_set_backing_noperm_commit,
+    .clean = g_free,
+};
+
 /*
  * Sets the bs->backing link of a BDS. A new reference is created; callers
  * which don't need their own reference any more must call bdrv_unref().
  */
-void bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
-                         Error **errp)
+static int bdrv_set_backing_noperm(BlockDriverState *bs,
+                                   BlockDriverState *backing_bs,
+                                   GSList **tran, Error **errp)
 {
-    bool update_inherits_from = bdrv_chain_contains(bs, backing_hd) &&
-        bdrv_inherits_from_recursive(backing_hd, bs);
+    int ret = 0;
+    bool update_inherits_from = bdrv_chain_contains(bs, backing_bs) &&
+        bdrv_inherits_from_recursive(backing_bs, bs);
+    GSList *attach_tran = NULL;
+    BdrvSetBackingNoPermState *s;
 
     if (bdrv_is_backing_chain_frozen(bs, child_bs(bs->backing), errp)) {
-        return;
+        return -EPERM;
     }
 
-    if (backing_hd) {
-        bdrv_ref(backing_hd);
+    if (bs->backing && backing_bs) {
+        bdrv_replace_child_safe(bs->backing, backing_bs, tran);
+    } else if (bs->backing && !backing_bs) {
+        bdrv_remove_backing(bs, tran);
+    } else if (backing_bs) {
+        assert(!bs->backing);
+        ret = bdrv_attach_child_noperm(bs, backing_bs, "backing",
+                                       &child_of_bds, bdrv_backing_role(bs),
+                                       &bs->backing, &attach_tran, errp);
+        if (ret < 0) {
+            tran_abort(attach_tran);
+            return ret;
+        }
     }
 
-    if (bs->backing) {
-        /* Cannot be frozen, we checked that above */
-        bdrv_unref_child(bs, bs->backing);
-        bs->backing = NULL;
-    }
+    s = g_new(BdrvSetBackingNoPermState, 1);
+    *s = (BdrvSetBackingNoPermState) {
+        .bs = bs,
+        .backing_bs = backing_bs,
+        .old_inherits_from = backing_bs ? backing_bs->inherits_from : NULL,
+    };
+    tran_prepend(tran, &bdrv_set_backing_noperm_drv, s);
 
-    if (!backing_hd) {
-        goto out;
+    /*
+     * If backing_bs was already part of bs's backing chain, and
+     * inherits_from pointed recursively to bs then let's update it to
+     * point directly to bs (else it will become NULL).
+     */
+    if (backing_bs && update_inherits_from) {
+        backing_bs->inherits_from = bs;
     }
 
-    bs->backing = bdrv_attach_child(bs, backing_hd, "backing", &child_of_bds,
-                                    bdrv_backing_role(bs), errp);
-    /* If backing_hd was already part of bs's backing chain, and
-     * inherits_from pointed recursively to bs then let's update it to
-     * point directly to bs (else it will become NULL). */
-    if (bs->backing && update_inherits_from) {
-        backing_hd->inherits_from = bs;
+    bdrv_refresh_limits(bs, NULL);
+
+    return 0;
+}
+
+void bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
+                         Error **errp)
+{
+    int ret;
+    GSList *tran = NULL;
+
+    ret = bdrv_set_backing_noperm(bs, backing_hd, &tran, errp);
+    if (ret < 0) {
+        goto out;
     }
 
+    ret = bdrv_refresh_perms(bs, errp);
 out:
-    bdrv_refresh_limits(bs, NULL);
+    tran_finalize(tran, ret);
 }
 
 /*
-- 
2.21.3


