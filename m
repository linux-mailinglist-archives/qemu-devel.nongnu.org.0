Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 036D93D10D9
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 16:07:49 +0200 (CEST)
Received: from localhost ([::1]:33300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Ct2-0005D1-1x
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 10:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m6Cq8-00020s-6l; Wed, 21 Jul 2021 10:04:48 -0400
Received: from mail-eopbgr80105.outbound.protection.outlook.com
 ([40.107.8.105]:17431 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m6Cq5-0007Ca-8X; Wed, 21 Jul 2021 10:04:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dPyonGcO6M/QUKKpiA/O3HJRYhYo4w85cmIQ58CWvrg5sBpAIfJijqLUCGfip4Zua0CcaJW2ixEE0rLcdyJJEKnselk6ieaLTx/MDD4WxlkXw6nExxOYcYRg99+L39MbakPS9itHAyqTmGiOCt5GTc9B/WuiJmkFUZySZ6skkR/STB9HZgGXKlGtmdgY/W46vnY+AR7M8Rk2pnPO6i8BItOTIptUNSyNW0JAUfparzdifjr9vDyqcm5sr1d9ZKVlYBy3pUoIQbUDsVNA9+1f8wvRMoLQOgt600b4YTbDWbJoxd+M+KcrmWIozW34HQ4cRScR4PLT2JjHwqc8aw81Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qKVGlcs7J41JcZcGNtCz5zh5Fph/2zhGg8FbNDDs8q4=;
 b=XGCK4MTT6WNHVOPen/erIiW9NeIYKrSMi3GewxoJqo9TscGg3+xx42XoJ2saHXxyvFZDSgMxWSsCNwRVFPP4HwTLu9UcFH5iuftkfMEbCRc95WatHKk56s4MtGEdm0v2E7d3kZ533EmDTgOWmEFkdghzLw/J5q1WS1eGaYOZ/YS/aqebITT71ZYusR9XRPcvlcoSB5n+66WIJTeyxGKkH9jl3HaZS0EZ8XiEUGYdOHCpe2QEoTsHuyBoo03Rq9uxDfrgJ0UYfwMJHfpd3OXrJnk4PZyse9wnCajbL9S+l9ysLtqDpyaLLLkMJVXr3jyoexrzFbjCQYAC/XtChldMJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qKVGlcs7J41JcZcGNtCz5zh5Fph/2zhGg8FbNDDs8q4=;
 b=NGkUjo05v/mO2zCH/AmYR0bsWLihf5g6LQdrcDmKFkZ/nAxGTbX9lCBP7YCB0odTsXoYKJTaLS7ybz5apKMZ2QeWJlwzme1BI6r18N+SAPIQkYKhG68ejs0pGAgNYN19J7xHmZafMpFLpIMoWl/DBedZDoPUcPk/H6sj2i3OPwk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6374.eurprd08.prod.outlook.com (2603:10a6:20b:338::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Wed, 21 Jul
 2021 14:04:40 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 14:04:40 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 xiechanglong.d@gmail.com, wencongyang2@huawei.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com
Subject: [PATCH v2 1/6] block/block-copy: use write-unchanged for fleecing
 scheme
Date: Wed, 21 Jul 2021 17:04:19 +0300
Message-Id: <20210721140424.163701-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210721140424.163701-1-vsementsov@virtuozzo.com>
References: <20210721140424.163701-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P195CA0016.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::26)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1P195CA0016.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Wed, 21 Jul 2021 14:04:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc920127-3491-4cd3-6b82-08d94c507ba8
X-MS-TrafficTypeDiagnostic: AS8PR08MB6374:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6374185E925E72317D83FC8AC1E39@AS8PR08MB6374.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P2p19WT5YeH/xJZW8yalm7IBMrUseliM46MqEstXRRGHVN06/L+aVi5Bzm/L40oJRy2XL8i1/zuBrLPzCM+38N/zZ1RTsENdzA3bEyDNU46sDetR1FRv39Jm/ZqsU4Pat7YfqR9fVWSgyz2UFu4QVizYEhXegHP4D+vy4U86xVBvxEOOfSIdwOcu6Q1S+/EQ2rBmySNLfUiWjq1r3XsDsBw1v9jFY/Y1PuZvz05avsmckLS29BCU2WkWm1nHdbVid+N5x+6KW7IE4bctfaDZELOVUH3zYN2lduaWM8v/2Y2kuGGGp5ViSgxKdGkTqLxWwgDMhgXLkXiRl2LmuR/aXGl4Wy4TAARGniPY4nJBn+DDyjaKdmaDnq6LuJ23GV+1JSIAH4sW/Hi/xytTSHaoTRS06+krWFbrgBPyKoAfLglwXvFIE9DjCPjDAdMN3wlKv5h/TbxYCjq86p+4UVsvk4LkwOj4RBaLT4HUgP9hykoAEp3FFTwa8PbkyWHlTAhKe9udwwHaH3YRcHm2pVnHj42j4Dz7NGrmBfvjGpygTYERI8bk2kTU2HysQtqHQpGlF+AehYyZKZ8WqbADlcOnOOmtCKzCB/N/oKydfHl46qYtalyxYFW7J2BPh0yJlIPNjBTNlZp3hB8EljxqGCb6+zsOjX19F6Z+j6Ewoe8USBUn+tppCV30W2rqq8L1s/D9LsvslBN/Vzu2RSgz3LdQrQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(39840400004)(376002)(38100700002)(5660300002)(52116002)(38350700002)(2906002)(83380400001)(956004)(1076003)(6506007)(6916009)(316002)(6666004)(66946007)(66476007)(66556008)(478600001)(186003)(4326008)(36756003)(6512007)(86362001)(26005)(8936002)(8676002)(6486002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/4oxgLbXogkvJm7bgz9DmhkgfVVxEjFsMHPZ0Nix/Y2ahMqSetf1MhIC3S9R?=
 =?us-ascii?Q?gAQoFRm2XRppE6WIu2/rEJQbE7nE2Td5+3flyKQVzKF7NrChb342sgFBJ5BT?=
 =?us-ascii?Q?z2DROxRWKWbSGjXJK9RKtZnuCOSMODK9AabhHXs3OXuYLeXLT1UDeCNqZUCg?=
 =?us-ascii?Q?98tvSwfUVeOAGemko7YBEjwlIiTODyWishgEBSO5bp2RhGiv7PFoEcEZ1KWy?=
 =?us-ascii?Q?TxeWvxrDZmJuxYYnxwX24T/w6r/FIJzvVqOg77NWp2DcxfAhmNkjV/R+a9lB?=
 =?us-ascii?Q?XU8Q/UwxKG0dtDSWSTT41pLmOGTB7z5cZXyEfxExpb07/JatUG6HFdf9VD0z?=
 =?us-ascii?Q?m/NpuhRFoCEAE6CKPLXGNwEpdNH1M7Ys36XOkCDRocw/EbEr+kVer6DGyuAw?=
 =?us-ascii?Q?RL8iilVFnBrFXpZnfwrijDjAkKfWcPDgBZaMStjieFvAxguoaVeY/TJ+8ndC?=
 =?us-ascii?Q?zXeMRn4WTH8MjTqmOgGIPVFclNlGDDgAbT8utBum6I9KJRncC/DRuXIugmO5?=
 =?us-ascii?Q?Btda81mNd47qPL9K4REv4WlChowZY2APFqCdTHXzHtyRnM7rJN9ihI38R66h?=
 =?us-ascii?Q?m/6l5K+yv0ZS/omai0yLCR5QG/JHe6ksTaBPAeCVj8dFHZUc21I1yC1iLo5T?=
 =?us-ascii?Q?20bvyc+X2GAO2XlkxPx6ocyQdJZMfW7DvDNYeXeoAz+59M1Xbpsk4NfHsVWM?=
 =?us-ascii?Q?VuoBRPcKo5BGb70teo2nBBEzLFpWalKtJWHGHKgQLaa720Ec19em9J0flShn?=
 =?us-ascii?Q?GIoc95jN6jU/0L3+qJvyD84UfGqcFNe3G9bEXwTAzE+dW5nC+K3Mlmk3aIgl?=
 =?us-ascii?Q?3mOUkfRAMnSoqlqhJ5yBhdniQ93obPGBXwn9Y+rD4YN/sW++LXuXuC+WRrNh?=
 =?us-ascii?Q?l8gEfQwaA9VtSh7TUZBsqZFKIM5Y1xfI/io44oYwViUGNKC4FlV0NwgrIL5E?=
 =?us-ascii?Q?xRCCaXsp1Gxoq5lcI0S8qFepxHygf+WVWRQB2MmxBPoBFNIs+84WR0LyIRxb?=
 =?us-ascii?Q?U/j5OJInU+q5YS6OTens0fTtkNSQ82tixGt3f4Yv+1m5Y3EtChFvC9mAaq6F?=
 =?us-ascii?Q?x0TJ+BhFRMmynnDIfbWJo2U6s2nZ5KbsqxEg6c+ArZCYrkqk2lwCE0e5O1nY?=
 =?us-ascii?Q?jDtMyalva8WhWpp/nt/aniuAIdtMTrQNJ5mOpGAoG43ZEnBOW3CInge9OU1I?=
 =?us-ascii?Q?HMBq4d+g+BUoAGLhKuMrR3UseVasUEJ0+zAR4Bow/Am7CTAuVrw0M7qqzwU8?=
 =?us-ascii?Q?V9RufdXJ6Upx8zCXyY8lh4THmILo5FkHpMGs5YBde+0Gipb3mC12Xf2/vh25?=
 =?us-ascii?Q?6P2hEY0XUKeCfQ6seVt9Hmyb?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc920127-3491-4cd3-6b82-08d94c507ba8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 14:04:40.6809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zr2zKRq3acDlwFi7XXshB/ge9qkNhcn6Dk5e+diIDBZKEIwErQ5NDAaholeNbHSuDYNsoInmxMAWkFGHS9oPsGHXrAYle3aKnPqlJTWt9RA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6374
Received-SPF: pass client-ip=40.107.8.105;
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

We are going to use fleecing scheme for push-backup, so that
copy-before-write filter does copy before write operations to temporary
image and backup job copies data from (immutable from backup's point of
view) temporary image to actual backup target. For this to work
properly, backup job should unshare writes on immutable source node.
copy-before-write filter should do write-unchanged operations for this
(they are really unchanged, as source is a backing of temporary node).

So, we want to teach block-copy to do WRITE_UNCHANGED operations in
case of fleecing. We can detect fleecing on initialization but that's
not safe enough: block graph may change. We can freeze the backing
chain of target to avoid changes but that's not flexible. We can detect
fleecing before each write but that's an overhead.

Actually, we'll have to detect fleecing in copy-before-write filter
anyway, to chose correct permissions on target node in further patch.
So, we can just add a possibility to control adding
BDRV_REQ_WRITE_UNCHANGED flag in block_copy, like
block_copy_set_write_unchanged(). Block-copy doesn't own source and
target child and relies on correct permission handling by block-copy
user.

Finally, let's go the simplest way: just do WRITE_UNCHANGED if
s->target has only that permission currently.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/block-copy.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index 020c8d7126..a850684ac6 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -114,7 +114,10 @@ typedef struct BlockCopyState {
     /*
      * BdrvChild objects are not owned or managed by block-copy. They are
      * provided by block-copy user and user is responsible for appropriate
-     * permissions on these children.
+     * permissions on these children. Note also that block-copy will
+     * automatically add BDRV_REQ_WRITE_UNCHANGED flag to write operations if
+     * target child has BLK_PERM_WRITE_UNCHANGED permission but doesn't have
+     * BLK_PERM_WRITE permission.
      */
     BdrvChild *source;
     BdrvChild *target;
@@ -508,6 +511,7 @@ static int coroutine_fn block_copy_do_copy(BlockCopyState *s,
     int ret;
     int64_t nbytes = MIN(offset + bytes, s->len) - offset;
     void *bounce_buffer = NULL;
+    BdrvRequestFlags write_flags = s->write_flags;
 
     assert(offset >= 0 && bytes > 0 && INT64_MAX - offset >= bytes);
     assert(QEMU_IS_ALIGNED(offset, s->cluster_size));
@@ -517,9 +521,15 @@ static int coroutine_fn block_copy_do_copy(BlockCopyState *s,
            offset + bytes == QEMU_ALIGN_UP(s->len, s->cluster_size));
     assert(nbytes < INT_MAX);
 
+    if ((s->target->perm & (BLK_PERM_WRITE | BLK_PERM_WRITE_UNCHANGED)) ==
+        BLK_PERM_WRITE_UNCHANGED)
+    {
+        write_flags |= BDRV_REQ_WRITE_UNCHANGED;
+    }
+
     switch (*method) {
     case COPY_WRITE_ZEROES:
-        ret = bdrv_co_pwrite_zeroes(s->target, offset, nbytes, s->write_flags &
+        ret = bdrv_co_pwrite_zeroes(s->target, offset, nbytes, write_flags &
                                     ~BDRV_REQ_WRITE_COMPRESSED);
         if (ret < 0) {
             trace_block_copy_write_zeroes_fail(s, offset, ret);
@@ -530,7 +540,7 @@ static int coroutine_fn block_copy_do_copy(BlockCopyState *s,
     case COPY_RANGE_SMALL:
     case COPY_RANGE_FULL:
         ret = bdrv_co_copy_range(s->source, offset, s->target, offset, nbytes,
-                                 0, s->write_flags);
+                                 0, write_flags);
         if (ret >= 0) {
             /* Successful copy-range, increase chunk size.  */
             *method = COPY_RANGE_FULL;
@@ -563,7 +573,7 @@ static int coroutine_fn block_copy_do_copy(BlockCopyState *s,
         }
 
         ret = bdrv_co_pwrite(s->target, offset, nbytes, bounce_buffer,
-                             s->write_flags);
+                             write_flags);
         if (ret < 0) {
             trace_block_copy_write_fail(s, offset, ret);
             *error_is_read = false;
-- 
2.29.2


