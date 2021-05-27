Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF603393299
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 17:42:48 +0200 (CEST)
Received: from localhost ([::1]:54142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmI9n-0001C8-Nc
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 11:42:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmI8T-0007pG-6E; Thu, 27 May 2021 11:41:25 -0400
Received: from mail-eopbgr70114.outbound.protection.outlook.com
 ([40.107.7.114]:51616 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmI8Q-0006YN-OD; Thu, 27 May 2021 11:41:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y6XDMizLkYGdUB+tGFzk5oBVi6dRNbiSQUhmQBqFsf+EDQShJUqRwxavfmc/EtG5b1cmMqbn5VookBksurZGwa3W9A3B9OVCxljDzIA2iZZQiWlURZDC9y26nIQw1sn6dMcG9031tE9Ws5thUqW1VgT/akrDpVK8k9GJUolaJcClqCCreWDQBypgtHM2KrcefsKbEut/WJAYSXBYQua7VQJJzr3XS++8dgIHr6xvTxYHmK6T+5EGhNxlQM3HGawFdI6qnrMnBVMY4tPK2nWbi0VBU9832K8I5WugABf0g0et3v9ZfybRbh3omL7nM9xl65a3OMaG5Am5PwFxYRq8ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EinojbAYWeAx9Rn2pOG2d/iRgMa6HpSTacZLaRC3W00=;
 b=CSyiqSegktA50AA+hF5JzrSs6VF/1RhwLkvh3J3Xnu69xca91xoaCXdcVYK3Dv+rA5FdUFaeV6eQaCMYxGz7HTQ5o75gSqbaA+ubiQZkv1dAJt7Y6uvfJYnk1IAV8aMEzdhKYOFiqjLvW1G+ECDeMKteTqNaFVNdwc8gMKRIT2mnkfl0ycbJwm6ks9OWg2BBEs7qplUTbkw1MX5torTnM1Bp/bTHM78jECZRuRLwBA2Xcu2RLDxcXHPC+xVF0SKHQwmGN2/jyy5EHluGbeYhrZugvSeF5Vuh76v6bO9kdrK2okr/ATaQteYXzcZD3rfm032RmlxXm0WGHfI+YV6GiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EinojbAYWeAx9Rn2pOG2d/iRgMa6HpSTacZLaRC3W00=;
 b=oq+ioRa8uG1cSUWmcXPwcp7afew1Y+Cf4ZY9KUbXgNNcNGmFlVpomtquMKFXKQCx5PKE8QRUvSYP16TUzSEpfaZznR1u+hKcNDYh+ThXXCCACdbwPib19U4gRYn9VlZ0kuw09DcijCGXD2KdU72/z+gIeIoeg/vHzMFhKuSJyp8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1780.eurprd08.prod.outlook.com (2603:10a6:203:39::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Thu, 27 May
 2021 15:41:17 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.022; Thu, 27 May 2021
 15:41:17 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, codyprime@gmail.com, armbru@redhat.com,
 fam@euphon.net, stefanha@redhat.com, vsementsov@virtuozzo.com,
 jsnow@redhat.com, mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v2 1/3] block: consistently use bdrv_is_read_only()
Date: Thu, 27 May 2021 18:40:54 +0300
Message-Id: <20210527154056.70294-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210527154056.70294-1-vsementsov@virtuozzo.com>
References: <20210527154056.70294-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.226]
X-ClientProxiedBy: HE1PR0901CA0043.eurprd09.prod.outlook.com
 (2603:10a6:3:45::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.226) by
 HE1PR0901CA0043.eurprd09.prod.outlook.com (2603:10a6:3:45::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Thu, 27 May 2021 15:41:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17a158e8-30fc-48e4-168b-08d92125de4b
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1780:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB17807D698EA045392BDC393CC1239@AM5PR0801MB1780.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:60;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2KtDkXuvo582mwyaQaO22RHWJ3LJWTPAhzm9DK4zkqskMKwpZkmJ//RJAplP2+JfipDql36/QxXK2K2uqLLeZyoXa75nHtfwzeA1aYE54HvvrWeDgjQipGRhgmppka5tuqyUNAuDLyk440Q+IspM2VjlewmMzdQrA7aUslSZ8FLl9YebNG0AMilWTxj3B7ATvwTmDdFxscvp3Oad/lI+XgfLriabHCjVT4BWYEVfbAKjAZrDqRG+S/Ng/++EFpesR1t2SgIRehc8XvrnzSCp03heaD6P4tqX8XcGMiUCZ3z2XIFtvt8fM3wSuhSAeVRMqJWlaGQ7jZfpKDP2TTBFry50Xta+MsQo7OJY7VFK7pSEhfz2C6Z9CsYhnx9KVgJxDLmV5cbt/WoYB17Ph5jM4hxs4sdBV5uOWqRuSz9x9a/pYC/G6pwB5zJruys5Wep3/tz1dsS/1/ceN+VdoCrvAmdO5vaz/nRQJVIoGO+uQq6OTIdkWfo5DB/ogQrFYEl6id4r8W6W/AlirLUT/TLkx6IzZ89Afh7nIEOm8pYgb1JuGUF10bsVE5ZNloe6+9eKNJXMrWdxIRVc8t5+hV+PkiOSclueQ7FE4pO1g8j0iqkCVuK72o2G5OgZOHUM974uCfxA3QdkLBv7af9KKUgQcKUCpLnBhE/4v6mlEiqpTlokIqTgA+WYUXo28kVQ3zYA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(136003)(376002)(396003)(366004)(52116002)(83380400001)(186003)(38350700002)(16526019)(478600001)(4326008)(38100700002)(1076003)(6666004)(316002)(6506007)(86362001)(5660300002)(66476007)(66556008)(956004)(8936002)(2616005)(66946007)(26005)(6486002)(6512007)(2906002)(6916009)(8676002)(36756003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?lymGoZbBvHNTg9bP6i/3psJpg3LRCI9DHpZywqZ3V5cNY0qi1Q3Lmas/NlnJ?=
 =?us-ascii?Q?rh1jU7G7RtpznWLNEx2EIcZ+ieZxxfews0ufIkiBDGlJxE/iZZGMLQpzgNGk?=
 =?us-ascii?Q?8Yqm9pAwfLEPBiH6jr9qU9c6Rd5HiXyXfQ6J1/WwFpFSK+pwaHXX9v7EE7nU?=
 =?us-ascii?Q?VsWegqGKurM3thnmtTWNd0eaLahhPhk0dbTCOlGHlqIsVtVuS3ts70pSFZ+L?=
 =?us-ascii?Q?/FcUZ9cc6kM2IaCjaE7ekruvAmiP61IwFidV5HEyNR2MTdg94dJWTdDxwwPK?=
 =?us-ascii?Q?ne3Gh6b0z91MWv/ZqxYWlkg66LzUWQh1roi7R+9mdBhrcPnZHPGKe8akSPbr?=
 =?us-ascii?Q?tCdwFz0hqEZOBWKHoLknzUujti1F1QyDqXEPRC+Hr6jggdZkhxYpzlgDqoaW?=
 =?us-ascii?Q?X+gkyV4heIRQ2BEQnFBYtmJbmOwXumkL5afpsV5hSUQvaoIXGBRrj0+vZq5V?=
 =?us-ascii?Q?ohZgER5DVzL2A3fF2Gh1J9Ejv24a+eh1WnIEf4JiRc8nmbFzUUT+RRpYVXMg?=
 =?us-ascii?Q?HaGj1gXIpIQ5+haJXSotzhUUm2ddEUcgmxiNR0LRZiA78/1HmaiUr/6tZ29a?=
 =?us-ascii?Q?JxsbBAda1bK9gES+TaM2tbozdL5i863AVJqCIX5P0bEmbofLAnrWjeu6u2Jr?=
 =?us-ascii?Q?4YZnflZx3DDnpRT0lzqVQifrtBZ/JnDfoKJTkVjr3japS3XKkAmm5VbciwaP?=
 =?us-ascii?Q?yO8Kt4nbpsTKVeJQNG6hB0LO8XNRJ2J5x22Pcn10eIBm1H20Sk40/WC1r7iD?=
 =?us-ascii?Q?My0GySL50xMOroDXIgWJLRThNqfaeLMXQGciSFVDau9c7Sco6g9/0qZW0ay9?=
 =?us-ascii?Q?x2vDRNEK/xnbBgnV3HbqnZOUJXnkP5D+X3I1aM8GuGhhAdqDPQ988tTc2WIG?=
 =?us-ascii?Q?Jnf9Dskh59+DSezrYLz+CnLTUKZjEp3c7wHq9IQPwTycUGyPZG7h+V99yWzZ?=
 =?us-ascii?Q?M3g4v3k9C/H+xjooF+ukdDDXUJ+tRS6rbQOBBd+OA8DDx/KzBdgINKllt8Jr?=
 =?us-ascii?Q?9Y8uw5WriOo2hOuwy2naIEuqdmmuBk2R2H2nujelDHQhvNJFw0wnybWd5Ksn?=
 =?us-ascii?Q?Bur/0hRSCCfhLFZ2TAR7XnirfhUtkCT/HW64ljn2cQorVk433TlmHASElCf4?=
 =?us-ascii?Q?1oJS/nWkR0/xohmBNgiHR3SOKTFAXO2TtXf5jdphVD2//uNeuwdmPqXOltEJ?=
 =?us-ascii?Q?5I/caO3lqaYBF1JPKu5Vnct4JUZk5DEH03eijhXmP38K+qg0Q1lK74iTY8pC?=
 =?us-ascii?Q?96qqV1Ui/FG/17aXjOqBbsDrw3SqkXH5wvIj2iKanFX6+eepCHXpr0+jbvIm?=
 =?us-ascii?Q?oWwPriFjs7MwxIo07Mpg68R7?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17a158e8-30fc-48e4-168b-08d92125de4b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2021 15:41:17.7939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VkCCsL+zZpbqFfYyoHtSlGKQM9+YsT65wEcagqWpeCZS2fRBEC8E8P1e7Q9RXe6cWbefnSSlSOhuqbW9Q6cu/ZNX09rkUZD0z6rxYkHMqk4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1780
Received-SPF: pass client-ip=40.107.7.114;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

It's better to use accessor function instead of bs->read_only directly.
In some places use bdrv_is_writable() instead of
checking both BDRV_O_RDWR set and BDRV_O_INACTIVE not set.

In bdrv_open_common() it's a bit strange to add one more variable, but
we are going to drop bs->read_only in the next patch, so new ro local
variable substitutes it here.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c                | 11 +++++++----
 block/block-backend.c  |  2 +-
 block/commit.c         |  2 +-
 block/io.c             |  4 ++--
 block/qapi.c           |  2 +-
 block/qcow2-snapshot.c |  2 +-
 block/qcow2.c          |  5 ++---
 block/snapshot.c       |  2 +-
 block/vhdx-log.c       |  2 +-
 9 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/block.c b/block.c
index 0dc97281dc..0270b609c4 100644
--- a/block.c
+++ b/block.c
@@ -1720,6 +1720,7 @@ static int bdrv_open_common(BlockDriverState *bs, BlockBackend *file,
     QemuOpts *opts;
     BlockDriver *drv;
     Error *local_err = NULL;
+    bool ro;
 
     assert(bs->file == NULL);
     assert(options != NULL && bs->options != options);
@@ -1772,15 +1773,17 @@ static int bdrv_open_common(BlockDriverState *bs, BlockBackend *file,
 
     bs->read_only = !(bs->open_flags & BDRV_O_RDWR);
 
-    if (use_bdrv_whitelist && !bdrv_is_whitelisted(drv, bs->read_only)) {
-        if (!bs->read_only && bdrv_is_whitelisted(drv, true)) {
+    ro = bdrv_is_read_only(bs);
+
+    if (use_bdrv_whitelist && !bdrv_is_whitelisted(drv, ro)) {
+        if (!ro && bdrv_is_whitelisted(drv, true)) {
             ret = bdrv_apply_auto_read_only(bs, NULL, NULL);
         } else {
             ret = -ENOTSUP;
         }
         if (ret < 0) {
             error_setg(errp,
-                       !bs->read_only && bdrv_is_whitelisted(drv, true)
+                       !ro && bdrv_is_whitelisted(drv, true)
                        ? "Driver '%s' can only be used for read-only devices"
                        : "Driver '%s' is not whitelisted",
                        drv->format_name);
@@ -1792,7 +1795,7 @@ static int bdrv_open_common(BlockDriverState *bs, BlockBackend *file,
     assert(qatomic_read(&bs->copy_on_read) == 0);
 
     if (bs->open_flags & BDRV_O_COPY_ON_READ) {
-        if (!bs->read_only) {
+        if (!ro) {
             bdrv_enable_copy_on_read(bs);
         } else {
             error_setg(errp, "Can't use copy-on-read on read-only device");
diff --git a/block/block-backend.c b/block/block-backend.c
index de5496af66..21b834e9df 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2269,7 +2269,7 @@ void blk_update_root_state(BlockBackend *blk)
     assert(blk->root);
 
     blk->root_state.open_flags    = blk->root->bs->open_flags;
-    blk->root_state.read_only     = blk->root->bs->read_only;
+    blk->root_state.read_only     = bdrv_is_read_only(blk->root->bs);
     blk->root_state.detect_zeroes = blk->root->bs->detect_zeroes;
 }
 
diff --git a/block/commit.c b/block/commit.c
index b89bb20b75..b7f0c7c061 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -453,7 +453,7 @@ int bdrv_commit(BlockDriverState *bs)
         return -EBUSY;
     }
 
-    ro = backing_file_bs->read_only;
+    ro = bdrv_is_read_only(backing_file_bs);
 
     if (ro) {
         if (bdrv_reopen_set_read_only(backing_file_bs, false, NULL)) {
diff --git a/block/io.c b/block/io.c
index 1e826ba9e8..323854d063 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1973,7 +1973,7 @@ bdrv_co_write_req_prepare(BdrvChild *child, int64_t offset, int64_t bytes,
 
     bdrv_check_request(offset, bytes, &error_abort);
 
-    if (bs->read_only) {
+    if (bdrv_is_read_only(bs)) {
         return -EPERM;
     }
 
@@ -3406,7 +3406,7 @@ int coroutine_fn bdrv_co_truncate(BdrvChild *child, int64_t offset, bool exact,
     if (new_bytes) {
         bdrv_make_request_serialising(&req, 1);
     }
-    if (bs->read_only) {
+    if (bdrv_is_read_only(bs)) {
         error_setg(errp, "Image is read-only");
         ret = -EACCES;
         goto out;
diff --git a/block/qapi.c b/block/qapi.c
index 943e7b15ad..dc69341bfe 100644
--- a/block/qapi.c
+++ b/block/qapi.c
@@ -59,7 +59,7 @@ BlockDeviceInfo *bdrv_block_device_info(BlockBackend *blk,
 
     info = g_malloc0(sizeof(*info));
     info->file                   = g_strdup(bs->filename);
-    info->ro                     = bs->read_only;
+    info->ro                     = bdrv_is_read_only(bs);
     info->drv                    = g_strdup(bs->drv->format_name);
     info->encrypted              = bs->encrypted;
 
diff --git a/block/qcow2-snapshot.c b/block/qcow2-snapshot.c
index 2e98c7f4b6..71ddb08c21 100644
--- a/block/qcow2-snapshot.c
+++ b/block/qcow2-snapshot.c
@@ -1026,7 +1026,7 @@ int qcow2_snapshot_load_tmp(BlockDriverState *bs,
     int new_l1_bytes;
     int ret;
 
-    assert(bs->read_only);
+    assert(bdrv_is_read_only(bs));
 
     /* Search the snapshot */
     snapshot_index = find_snapshot_by_id_and_name(bs, snapshot_id, name);
diff --git a/block/qcow2.c b/block/qcow2.c
index 39b91ef940..ee4530cdbd 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1723,8 +1723,7 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
 
     /* Clear unknown autoclear feature bits */
     update_header |= s->autoclear_features & ~QCOW2_AUTOCLEAR_MASK;
-    update_header =
-        update_header && !bs->read_only && !(flags & BDRV_O_INACTIVE);
+    update_header = update_header && bdrv_is_writable(bs);
     if (update_header) {
         s->autoclear_features &= QCOW2_AUTOCLEAR_MASK;
     }
@@ -1811,7 +1810,7 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
     bs->supported_truncate_flags = BDRV_REQ_ZERO_WRITE;
 
     /* Repair image if dirty */
-    if (!(flags & (BDRV_O_CHECK | BDRV_O_INACTIVE)) && !bs->read_only &&
+    if (!(flags & BDRV_O_CHECK) && bdrv_is_writable(bs) &&
         (s->incompatible_features & QCOW2_INCOMPAT_DIRTY)) {
         BdrvCheckResult result = {0};
 
diff --git a/block/snapshot.c b/block/snapshot.c
index e8ae9a28c1..6702c75e42 100644
--- a/block/snapshot.c
+++ b/block/snapshot.c
@@ -415,7 +415,7 @@ int bdrv_snapshot_load_tmp(BlockDriverState *bs,
         error_setg(errp, "snapshot_id and name are both NULL");
         return -EINVAL;
     }
-    if (!bs->read_only) {
+    if (!bdrv_is_read_only(bs)) {
         error_setg(errp, "Device is not readonly");
         return -EINVAL;
     }
diff --git a/block/vhdx-log.c b/block/vhdx-log.c
index 404fb5f3cb..7672161d95 100644
--- a/block/vhdx-log.c
+++ b/block/vhdx-log.c
@@ -801,7 +801,7 @@ int vhdx_parse_log(BlockDriverState *bs, BDRVVHDXState *s, bool *flushed,
     }
 
     if (logs.valid) {
-        if (bs->read_only) {
+        if (bdrv_is_read_only(bs)) {
             bdrv_refresh_filename(bs);
             ret = -EPERM;
             error_setg(errp,
-- 
2.29.2


