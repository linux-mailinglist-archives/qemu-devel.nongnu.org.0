Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7849396E60
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 09:57:16 +0200 (CEST)
Received: from localhost ([::1]:39154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnzH1-0006zP-Ti
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 03:57:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lnzCh-0001Zy-2N; Tue, 01 Jun 2021 03:52:47 -0400
Received: from mail-eopbgr140133.outbound.protection.outlook.com
 ([40.107.14.133]:29384 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lnzCc-0005x4-3W; Tue, 01 Jun 2021 03:52:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TxqTzez6ypIJgbiedrVLQK+ojYwWpr3O77q4xJXy0ss1ajlUg3RYvI1JiQ2lROwpk+wMaL3G76hLIOUxBB+yMz50ePRfmEsKCm1rBVUDLdGoPThDJjeYaYoHoo9uc/xbFRg3yzqj7Ooz2RXdEcQWVmfHoYQX/vmBRDVz2PvKxOaZ1QHZs1AJNnBk1NuWXudLpL+G15fUj0prum+03eU/zxtSgWMigyvnD6w04B3SRyO+5RjnVaH65ItmCiYU6wCO8ehTgCyLWUyrApq5vzMtrGiCNgRDczMgN2MIvyia2F2tOS+kjj/MEBGWjGqgk6N+sQaIx4yyx4xEE7D4zxTZEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lI4hsxBjsWD5ITo5g5aEy17UMxJb7LFGHn73bBiEXQE=;
 b=iLLXJcpFjNXF3WgDgUKqCESg39L4b4nR4Krvu+GlOKCQheaM+Ki8yt1IiPI8t6ziMqmM5rExKWflYhZ7sPfZ64r7Gg78qcgDjF71BAPpA+/uC75iUuyx/kPyzzq4grnsA5MTRIe4EDGhfcYT09zeYsw/YHMlxInYvdj0wPEiXfPs/I0ccWEdPWcHtWK/I4HRwwez3dYfbmp5i6jLqTblfyzH/2t7L5ZEk9zE1uoAWCB6zWexm3jknrsZuDyeyYi4oDELZ10OUYPBo+4CitNlyYGZuwC7ldFNPNeF1tiWph2B6aoO3xicUQAlTxyMJAb//S53qG4kLKjjkni1lyTjMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lI4hsxBjsWD5ITo5g5aEy17UMxJb7LFGHn73bBiEXQE=;
 b=ODBsvlDNOy3sESnfIZLtOUc/bOXxUoLwxTCKkflJvYiSY0VLLcvFCHTnk+q4kRaovKtwMBupwMzS02HZvFR3ZazmoORnJKiHcOp5wBmJ+zBF4u8FdztvO5lP/mjisbXbwMU/q3U5xap7rnPWFhwHLhfgAcF8D6NKLN/FRHlS2rk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2099.eurprd08.prod.outlook.com (2603:10a6:203:4d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Tue, 1 Jun
 2021 07:52:36 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 07:52:36 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com
Subject: [PATCH v3 1/6] block: document child argument of
 bdrv_attach_child_common()
Date: Tue,  1 Jun 2021 10:52:13 +0300
Message-Id: <20210601075218.79249-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210601075218.79249-1-vsementsov@virtuozzo.com>
References: <20210601075218.79249-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.210]
X-ClientProxiedBy: HE1PR0802CA0018.eurprd08.prod.outlook.com
 (2603:10a6:3:bd::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.210) by
 HE1PR0802CA0018.eurprd08.prod.outlook.com (2603:10a6:3:bd::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 07:52:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0d13918-5a05-487b-1888-08d924d23859
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2099:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB20991305280E392FABAC64FFC13E9@AM5PR0801MB2099.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pZD8L/zcSNraUfNkU2Qfi+ujeF5aa0NrAPkntHO9iY5T1wLPZhgcnB0xBaXfi9E7KvXHOmbJFQxpVi5JsO6wDCKquxaWEe4CjGEWaIZzw8qk+Rt5UVNLl7tVj5CsAxz01Mo3exBLImFWKD8yzcLtovXvdfwwz3QMUeQJdwQmB4sZUGZonJ/vOP7MrfWDJvIwu5xG/BcYterKUyxxPFM5hvxrk9pPEyvXozVdo55jzmMIhDCvXP1u8HLyUN5YEGbpwnA+6RmpsgEvSx+PSJT2jpVbPk751FbdT+FmIsRuCERTHQ2fRqmsy/fBtq4HuDKaCXckkLkCI6M8rrQkN0/P5Jcy3FoFg5+6SOCtv0pXZ6rOxBLhusJuq1pGm6vZwU8jYL5EXg6Q1aDxD7Y4RTyLmZ8d1yDGOvXpJKkJCi2zTOz1MCvhVVmtyAsC8eqBoQ9HRHSBnafURj/O+RANTgqWwsKK2sLK4SfRu4K5dUXOidcXcO8yjf26hEFjbbHv2ghHiBCcPr6KMbpg356KPZbbC/TRi+CDHE24Hz5/AmeKRElLNhsGV889aBP5xVZU2X9V1jkRbXUxaA6bQfTzWEYpJpQtukMftPPzVbXdVWW2vvfBTniBMHc7tFsjoyVURd0Ta40w+tvlEqDt4W1Hyu3MF5tjY9I9jzcCxoMMo8xTnMXUe80+iGbPPYYNTgXwQLy/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(136003)(39840400004)(396003)(2616005)(6512007)(8676002)(8936002)(2906002)(956004)(36756003)(4326008)(316002)(83380400001)(6506007)(86362001)(107886003)(16526019)(66476007)(66556008)(38350700002)(38100700002)(6916009)(478600001)(6666004)(1076003)(186003)(6486002)(5660300002)(26005)(52116002)(66946007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?IYiZQqqVONP3JRvTK7qd26+D8hWWCpI4plm3sk7pM4hmeY2RGogS7Ayoqnd7?=
 =?us-ascii?Q?oFEVGmc6khXc3zs6exLZ/BdFxhhhYDDZFB6zYE405Ri07JM+OOsWJ0gj0v6v?=
 =?us-ascii?Q?CRBBlvEkill5EISaKka/KryT1ge4kMpFpbZ1L67bExogK5rJF1XHVxDypc5J?=
 =?us-ascii?Q?mRid8Q1juBiLoqm161PI68QPjy632/91XSVr4G5YzCEjlcaslKu4EtpA76vv?=
 =?us-ascii?Q?ZJRAryFzouF3SrDVJKN/OXoCGrigvbexuKb/ozllkqal3osZXpw91oIbBuhR?=
 =?us-ascii?Q?rjrOBrvJR09ILkTBMJqdKfgpXQijMkyvpEK7eva7KTY91zBhGY0LeoXq0LSl?=
 =?us-ascii?Q?UP2+sob39nQY6hd9uvT5WWjKnyTMnK4T7JJtLo6V1z9LR2nRFU9wOmtmpxtZ?=
 =?us-ascii?Q?oqwgrXTmX6Ej4LsDwNHJ/ukg1UmLpPmB91EGLibHnJz/N4JjRKUYZVASmQld?=
 =?us-ascii?Q?ocreWxcAXCYB6mIvVrn79nyQSxnH9g3HFnZLCiICU5dIQbHZFF03wXFyUKDi?=
 =?us-ascii?Q?WGiwS1RgmCLUDnQcuuOOWD02+lttd/eUctudavzJ0P10YBHrt7kZtZE15sId?=
 =?us-ascii?Q?u6eMtMrbxtyEUV9AgsCg4tIz9RfGbSoo6y2Xrn3zbJu0uyyG56DZoxX9eH57?=
 =?us-ascii?Q?IXGNFyc+JPmJqCcv3jE8jXhABLpzoRDO2azH4re2PtvOrHM0k+7pzgSnXwpS?=
 =?us-ascii?Q?qyF3LGG20uwcb2n72yWlhwxlzV6g8pRZc3GctSjcIL6lyz6FnZ1b9WPe7KaK?=
 =?us-ascii?Q?cVPSCxwMN7oTqEyiN3IIG0Fw8DNIUoz+dQulgHA/ZhqdX097lVJ3lm9+7OiM?=
 =?us-ascii?Q?oM9MvF5UQ2pYqpdr6iN3VTjGIT40Lril8pDr/7DRsFW3aGhAGGsc+ln02IfW?=
 =?us-ascii?Q?B737LkkhFvDvqxzAboyZjeA8ErgiQwn/cZ+LhGurIEL7r+gPTFn2q8jzDFFJ?=
 =?us-ascii?Q?a5f1yUKUqUnhgfs0I106ZioVyvBVUgn/tKGS+Ng5nNgu35NlA2osQd89MHNv?=
 =?us-ascii?Q?aYG+K0FxUgSaPQtjLxbt+4+V9+0y7PxWGRiwzH3DzoYISZ1mW5dwlkFlFb6U?=
 =?us-ascii?Q?3oswxP9jrfcnOfAkBfaReHAlf2LnO3qy28BfbmAZ7m35BIvoFgytkrtpC1d3?=
 =?us-ascii?Q?DMkToQ7WVcow2R5IeTJCWeEMXoyxEi+chtnprTCSEA8UJizOY5NtF/QTzbUO?=
 =?us-ascii?Q?PyhwOR396Bi/HdP1mbph6blgPtTSaYDn5bbB/V58z+My+a8b1qJRcEbNAtqb?=
 =?us-ascii?Q?Qjz9B3ds3apaDpA1ZDnhQpyivNeKlO50qbv42dpuwc7tRfYhEjn+ytrOgvaS?=
 =?us-ascii?Q?SRO3DhwgulbxLaFZAupCmdqm?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0d13918-5a05-487b-1888-08d924d23859
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 07:52:35.8961 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t5WhQQ5d+tc8N4+s867/vf3kAn1yq4Chiziel+11J5HHg1kZ0ycULdPv19DvuG+4/jOpzKJPEDMMfXMoS0C1kRFJf7Nen+fO9MR0id5hGCE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2099
Received-SPF: pass client-ip=40.107.14.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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

The logic around **child is not obvious: this reference is used not
only to return resulting child, but also to rollback NULL value on
transaction abort.

So, let's add documentation and some assertions.

While being here, drop extra declaration of bdrv_attach_child_noperm().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/block.c b/block.c
index 84cb7212f7..c0fd363605 100644
--- a/block.c
+++ b/block.c
@@ -84,14 +84,6 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
 
 static void bdrv_replace_child_noperm(BdrvChild *child,
                                       BlockDriverState *new_bs);
-static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
-                                    BlockDriverState *child_bs,
-                                    const char *child_name,
-                                    const BdrvChildClass *child_class,
-                                    BdrvChildRole child_role,
-                                    BdrvChild **child,
-                                    Transaction *tran,
-                                    Error **errp);
 static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
                                             Transaction *tran);
 
@@ -2759,6 +2751,12 @@ static TransactionActionDrv bdrv_attach_child_common_drv = {
 
 /*
  * Common part of attaching bdrv child to bs or to blk or to job
+ *
+ * Resulting new child is returned through @child.
+ * At start *@child must be NULL.
+ * @child is saved to a new entry of @tran, so that *@child could be reverted to
+ * NULL on abort(). So referenced variable must live at least until transaction
+ * end.
  */
 static int bdrv_attach_child_common(BlockDriverState *child_bs,
                                     const char *child_name,
@@ -2833,6 +2831,10 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
     return 0;
 }
 
+/*
+ * Variable referenced by @child must live at least until transaction end.
+ * (see bdrv_attach_child_common() doc for details)
+ */
 static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
                                     BlockDriverState *child_bs,
                                     const char *child_name,
@@ -2915,7 +2917,6 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
                                    child_role, perm, shared_perm, opaque,
                                    &child, tran, errp);
     if (ret < 0) {
-        assert(child == NULL);
         goto out;
     }
 
@@ -2923,6 +2924,9 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
 
 out:
     tran_finalize(tran, ret);
+    /* child is unset on failure by bdrv_attach_child_common_abort() */
+    assert((ret < 0) == !child);
+
     bdrv_unref(child_bs);
     return child;
 }
@@ -2962,6 +2966,8 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
 
 out:
     tran_finalize(tran, ret);
+    /* child is unset on failure by bdrv_attach_child_common_abort() */
+    assert((ret < 0) == !child);
 
     bdrv_unref(child_bs);
 
-- 
2.29.2


