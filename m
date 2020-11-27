Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D952C6848
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 15:56:31 +0100 (CET)
Received: from localhost ([::1]:38616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kifAk-0004SH-Hi
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 09:56:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif0m-00014W-JI; Fri, 27 Nov 2020 09:46:12 -0500
Received: from mail-am6eur05on2120.outbound.protection.outlook.com
 ([40.107.22.120]:28961 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif0k-0003Ef-ON; Fri, 27 Nov 2020 09:46:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IGDFYKkQNpHuHqKR2oUJugq1UJ3lwPoElDOTsYuoNSNT1deCaVPqEpHjEic7jkectTFXVTGcouqmZtt1qcjSWfj+qcSsqq3FYjlK0gWzg0yTUn6/q8bONYIwf2V+wHV7kfvBEztVniJA/gXDUgtYgh7B9UiTpJShYZB9WgyTxGFFC+Sj8LxTWaQDXoKBzOSIo6eV8EJNPf4Nk9ru+x54otLMwwzAO1NR6SaUi7sR0Q8dMLpNP4KXti0TlyLBLbYVu68YNAPNbNvI+3YBI1s/uF22cDjczo96TVU5rKGGJS18qK6pyOomfxA8GS/2j8na/6FJmSCDUDCqOLBEQzHZCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfkwml83o8pFSQKB+X+jungWMoeHnAJq9jMgsVNPZwE=;
 b=mKusESPHVysS1Sjqk1iruEjRKNAur7XACm2PMabCnX0RypENi6bvvqFOE6qzyN7QYd1oxtR2yzCbBPSapwWYIvywoqNwYOhFAe1ae/cpVOiY1r4t9inTisH8fPlcthbGiXy5q4CUqjKyDsJUTvBvniloyO1QeOI8ToxbbykxKPes9LXZzSqJG2b12Owe3zQkMT5+SMRkrAzJFitB/R9h0UDCUfDm0jGuXnFex9vibYbfl+UVfh+/RyveTQLopAdct40HtGSANLQLacb3PbRLeYZpA9aJJjGJPuT4ZrFNk75Npg9ZU+NClhKNg3aPhOWaUepQwJCuw2/3ObhlyRN5Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfkwml83o8pFSQKB+X+jungWMoeHnAJq9jMgsVNPZwE=;
 b=YmaJrWYhXbGxFupXt5YeDpNLklx0BJvgk/aYQjHHoBD39KyPk132PHNBF3GuSpzpAo2j8isPK/XezdmzjdzbUdne030aZ0oxhjNjYRNjtJi6KysAi/wEjyA3YUiR61X/NQ7Gs6zvHaE/qLqAj001t+H5WoVloLQZVSscEreVNfw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5078.eurprd08.prod.outlook.com (2603:10a6:20b:e7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Fri, 27 Nov
 2020 14:46:03 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Fri, 27 Nov 2020
 14:46:03 +0000
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH v2 08/36] block: make bdrv_reopen_{prepare, commit,
 abort} private
Date: Fri, 27 Nov 2020 17:44:54 +0300
Message-Id: <20201127144522.29991-9-vsementsov@virtuozzo.com>
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
 Transport; Fri, 27 Nov 2020 14:45:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a07e1c0d-6080-49a1-ecea-08d892e31dc5
X-MS-TrafficTypeDiagnostic: AM6PR08MB5078:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB50789D2F79BFE7730DC768D1C1F80@AM6PR08MB5078.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:446;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BLuEoXRoqi8Yqz0vvXH4lVbBVoLoNQZmnVo120pnBulO/fvLEgHBgWdIehNDMgWsTBp7r2fx/RtOaJWw7C3n08PxxJ5QMYLlS/bL55KxijWocv3LrxP8i6TY3fTQv/1Q5uh8EEtcpvbKB7M4bY5EnQjh2YcLWKa2jbgx+iNZV/XhyDhMHsmP4VNT3BKNdIHdV1vJpKbw037G7RtEVsMUH8nM2oiyLzc056z8ASMHAPnuMKt1B9GQvMQe1F4laycpKotlU83wSuJC+EknVLp4eq/cHqWVWDyJzLM2sB0JvZcgn2D8DIrJToHHqg6V+urZMjrNIA+9UZeZGCTzv6nN/kugenOQkFdrAJZWcu+APVap83FejsKnxkQafW7mTUFe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(346002)(136003)(396003)(376002)(86362001)(16526019)(66556008)(66476007)(478600001)(8676002)(186003)(66946007)(26005)(52116002)(83380400001)(6506007)(69590400008)(107886003)(6666004)(316002)(4326008)(36756003)(5660300002)(6486002)(2616005)(956004)(1076003)(6916009)(6512007)(8936002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2mzGdM0wBgIaXfhPrsfSqjn4FDIe/dWfYBLR7XEQiRLxSb8k9kikjKlKXp5v?=
 =?us-ascii?Q?9YeHzBvroluJ8EC91qyeZQzwASp+hRvdydj/pGFZ8+MOhb74TKuAfSM+no7R?=
 =?us-ascii?Q?i1G5vEl4CEHwuZnaNTkHuHbRM39bpCfxKwTdwlEqgOGF61cLKpNFC8mqpx69?=
 =?us-ascii?Q?IjLpRxTS9o1IoWCy5ZZ2i9w0W+fbGGtM+LhHIzoRNVEcjNK9jx/T9DeDIvC3?=
 =?us-ascii?Q?wVmCFb60UNVSXYlBYYFKgizn00fjl/WJ8mfs2MActfGFs/pX+tTwvgKT5xG8?=
 =?us-ascii?Q?oAtG5QzoSSgb9GqIjT//JsudHvgNMWx31WSRtyxkWzYwxDnVIeuQ518blmsl?=
 =?us-ascii?Q?rEg6BCx2X+z/8tmjFmmVATauj3Yw42nGZTWB1XAwuB+U40WjhOi1rhMkVgJl?=
 =?us-ascii?Q?ywHt5T5mBmNTrnQDrTcudnKcTiydk7fo2Vwy2+m64JjXSurYJlZGuF/OiPBj?=
 =?us-ascii?Q?0KDbO78ppU9h8gLF9ox6jsvVOmazG1S2XdZ0vWDZ/IaP02bKXR9VZOTO9yw4?=
 =?us-ascii?Q?zagRzC3EiQiCjrVKrgsEWcUtsXDkLw+he8v0ePAw0QSiUjV+yLS9ys/ApK9Z?=
 =?us-ascii?Q?yh/MQq3d0InMsWOcc6X7Bek+PansJbuTPhr4M+QPTi6HBfqj5zHGiMWd2xP7?=
 =?us-ascii?Q?SxI3IYk38NKRvtdYDRkHcVSJEUNzQAvPgVi12EQyOW9Gpds4QdrqMh8jN0q1?=
 =?us-ascii?Q?COGcsQyr5V1aKZN2GDQxrRSEbdeZNguHpK8mlOmKRmD4ouJ1qlMxYNsGIL+H?=
 =?us-ascii?Q?IIbBHbXUKgXtBVjfEnqBU7wnxGg2XOtvJ5xJVm51iW9xt7MjZw+gUQ5DDXC0?=
 =?us-ascii?Q?o8Gsug62VWEHqNxrbDpUiKhxRhejxSpmXFIskALs7BilLpbvsHaJaqQ/EmwD?=
 =?us-ascii?Q?mDyxLDZNuAIlgxRlIYeV1EWKZgeFfCW8Jv9WYG9PjBQ5VtGW05FffgJLJf2P?=
 =?us-ascii?Q?Md1EwEDJFBXTcfu4BlpIAk1w7jSKbWrKjFYrDnmlu+zEcLa/Gv8T89fCL70q?=
 =?us-ascii?Q?0z0g?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a07e1c0d-6080-49a1-ecea-08d892e31dc5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 14:45:42.9200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t5kqokXct/2XVZPwBRWNRPwOgTf4yh9VjCMqzuso0EbdkAmhzaZh5jwBOsDk6QqBAUQBXGVfjW7Xc7KDfuqyMuiRqqQr6XnPKTGH4PROJv4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5078
Received-SPF: pass client-ip=40.107.22.120;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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
Reply-to: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy via <qemu-devel@nongnu.org>

These functions are called only from bdrv_reopen_multiple() in block.c.
No reason to publish them.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block.h |  4 ----
 block.c               | 13 +++++++++----
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index 6788ccd25b..5d59984ad4 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -373,10 +373,6 @@ BlockReopenQueue *bdrv_reopen_queue(BlockReopenQueue *bs_queue,
 int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp);
 int bdrv_reopen_set_read_only(BlockDriverState *bs, bool read_only,
                               Error **errp);
-int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
-                        BlockReopenQueue *queue, Error **errp);
-void bdrv_reopen_commit(BDRVReopenState *reopen_state);
-void bdrv_reopen_abort(BDRVReopenState *reopen_state);
 int bdrv_pwrite_zeroes(BdrvChild *child, int64_t offset,
                        int bytes, BdrvRequestFlags flags);
 int bdrv_make_zero(BdrvChild *child, BdrvRequestFlags flags);
diff --git a/block.c b/block.c
index 15e6ab666e..3765c7caed 100644
--- a/block.c
+++ b/block.c
@@ -84,6 +84,11 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
 static void bdrv_parent_set_aio_context_ignore(BdrvChild *c, AioContext *ctx,
                                                GSList **ignore);
 
+static int bdrv_reopen_prepare(BDRVReopenState *reopen_state, BlockReopenQueue
+                               *queue, Error **errp);
+static void bdrv_reopen_commit(BDRVReopenState *reopen_state);
+static void bdrv_reopen_abort(BDRVReopenState *reopen_state);
+
 /* If non-zero, use only whitelisted block drivers */
 static int use_bdrv_whitelist;
 
@@ -4082,8 +4087,8 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
  * commit() for any other BDS that have been left in a prepare() state
  *
  */
-int bdrv_reopen_prepare(BDRVReopenState *reopen_state, BlockReopenQueue *queue,
-                        Error **errp)
+static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
+                               BlockReopenQueue *queue, Error **errp)
 {
     int ret = -1;
     int old_flags;
@@ -4298,7 +4303,7 @@ error:
  * makes them final by swapping the staging BlockDriverState contents into
  * the active BlockDriverState contents.
  */
-void bdrv_reopen_commit(BDRVReopenState *reopen_state)
+static void bdrv_reopen_commit(BDRVReopenState *reopen_state)
 {
     BlockDriver *drv;
     BlockDriverState *bs;
@@ -4358,7 +4363,7 @@ void bdrv_reopen_commit(BDRVReopenState *reopen_state)
  * Abort the reopen, and delete and free the staged changes in
  * reopen_state
  */
-void bdrv_reopen_abort(BDRVReopenState *reopen_state)
+static void bdrv_reopen_abort(BDRVReopenState *reopen_state)
 {
     BlockDriver *drv;
 
-- 
2.21.3


