Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E23E434835C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 22:04:06 +0100 (CET)
Received: from localhost ([::1]:36194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPAfd-0001de-Ty
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 17:04:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPAUC-0006rS-IQ; Wed, 24 Mar 2021 16:52:16 -0400
Received: from mail-eopbgr140109.outbound.protection.outlook.com
 ([40.107.14.109]:48878 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPAU9-0005Mt-Ay; Wed, 24 Mar 2021 16:52:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JBHypbiPuk3lsu2JvAV+e2hFGophnOezURIUnST1SEPObp1WWEtM/8fTIj+KANZLJMCIxC9IDYYueCW4vT2PcfAqdjkioLWyj96EFiWfMoc9RFXNcUsbWmWVI4ulLVwqlrBIa6g/erqTu+DRFDHOCJKc/TqWUxeALG4/PgFnCVgZSp5v0oXhMNXDWRm0SvUCjzIjv7aC9AvoDZbIR1pVdu8erETJ0afvZ54eKjk+qVFro3VNMhY+Vze9hxD+4C4OWpHWwqdq9JzwhgLfHRR0xf35cH+u2upK290H2/+4so1ewY4MyzRiio15pBOzgRAvih0Eaq4NM4IVin8OBHqfrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NPPtsSb/Z9pNqmvKnFIp5rqoJZO8E3HrT2ovSK5R5lA=;
 b=av+QtDLCZR1g0o2Q/Qcg1oSnL+iqGkkJUAlPWYfCMVLW1Le3zrsmFPcVTLwz1s3QB163QXJ6qOb7AmDLaMZbkbPLqKcZhXA9V7pqqnJ/kebbnwVRwc/tViNyCzKwXNtd4osOMHOjVC8YktHriqD3HDalfpM+XYk98k2GkAppmV8i6s/sWXCpUZ3mk68kMIC0/AfA7c7ki4gYDdMWAejbabQQFk1/S8otcdAds4A7GPER8UrNBFPv4NNi+z3fC/t7VTv3dzepGEAnsJu2l8elL6X4Q76dTzRgO1ABqZ5IRgqcMgjqCRdhAXdhm8cGdr93u6KYUsaCdxx2DL9IyIiarQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NPPtsSb/Z9pNqmvKnFIp5rqoJZO8E3HrT2ovSK5R5lA=;
 b=ezScg58NKrh8oA0AoLHU1iZ0OA8gVDP0QMhDdS0qN4wbSwx1Nx1WHPJPXBTJcoyZo8qrj33Bba2yqlDAWPwiTkcgGWKO5lWbSPS4UNnFsBYwDZcr8/75U+KOOKiskzNz1K0+YBaETPuBzpPGvO6gkcbs18QiCXL+sxAVpVSN1P0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6904.eurprd08.prod.outlook.com (2603:10a6:20b:394::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Wed, 24 Mar
 2021 20:52:01 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 20:52:01 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, integration@gluster.org, namei.unix@gmail.com,
 dillaman@redhat.com, berto@igalia.com, eblake@redhat.com, pl@kamp.de,
 ronniesahlberg@gmail.com, fam@euphon.net, sw@weilnetz.de,
 stefanha@redhat.com, pbonzini@redhat.com, pavel.dovgaluk@ispras.ru,
 ari@tuxera.com, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v4 10/11] block: use int64_t instead of int in driver discard
 handlers
Date: Wed, 24 Mar 2021 23:51:31 +0300
Message-Id: <20210324205132.464899-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210324205132.464899-1-vsementsov@virtuozzo.com>
References: <20210324205132.464899-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR07CA0022.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::35) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 AM0PR07CA0022.eurprd07.prod.outlook.com (2603:10a6:208:ac::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.9 via Frontend Transport; Wed, 24 Mar 2021 20:51:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 393c9488-c917-4e4f-1abf-08d8ef06ac14
X-MS-TrafficTypeDiagnostic: AS8PR08MB6904:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB690489B45F845DD6B9710EF4C1639@AS8PR08MB6904.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ePrkiLEguv2LV6ULze1zo8Yc6RXAXAFXnk+CFngqc3a4phcffqRvSO5ASS19Yam3EHeWLaKwlEOxnbVSdjtK9Fp1Z9Eq/M68b21UfS8I6n9iH12BYFwXaEJmom+JKk5vZQjTvnjVcLW5YJxU3/a+PcPfmQQ50ASvfFHMbTABIgFoc8xvqwJWkNN69EK2lVpMO36ZqZrxcDUnefIa7iej5iyF+3KPtnT1UeqmpbfUZskzspdwDWNCgyLp+ZAM1u/EQ42Vc472s8C1yEEgoe5Ewg0hBG7YWcmof0Spgr6FQdCRpnEPB9179D0lFNlqbqnB2IhZMchdqpf3BIazKnFiAWhUsQtAOsCFD+gcwmvDZfPpcRVdLiZMWgaBdPxSSaOIUUoMzh/A4o7dldI4jhaVqplPL7yTHjOWOheTX0Q+ZcHIzW4FZxM9rfjQreXB/cFPXK+kVdXp9+PY8DSIeHOZpYNxa1Nw0HMP9EiaLDEBBtUtm8I46ar99Sx4pgjW4fYn5GKBsNMncIf6QoUshja2qUTId0T+Qp7izWPDSEwL0WQ3UFf+ACRpxYJzCscGKv+7etYVmXpkH4KlbWTEq9QGYaKRuQBOChaqTCANI9UZl3H/8uTwyhM7Iga417kVePHVCuUQUiRjB/xwcEsdJhui4+eE8STdm5CNcA0XIq4bTVl34m+YoYzxD4hcJeuuiCiu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(396003)(136003)(39840400004)(38100700001)(16526019)(478600001)(6916009)(8936002)(8676002)(186003)(26005)(52116002)(316002)(36756003)(2616005)(6506007)(30864003)(4326008)(5660300002)(956004)(69590400012)(6486002)(1076003)(6666004)(2906002)(66946007)(6512007)(86362001)(83380400001)(7416002)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?fZUUBT8FMVgZIEcLOO7YDq6OFphBhICSlI39wYzrCQpqo1UEnPdZXAUSe5UJ?=
 =?us-ascii?Q?V0a8fyHA0p24AUh8PEWnY7ClRF/mG4B7cUzeoffewgusJaLlf9Y0wYYkIn3l?=
 =?us-ascii?Q?thPCA/DYEWUgUkZBEQq0DeMYrRQS8Hhe5kWiQGqKXpPNe9cLU6wkiZanhQEh?=
 =?us-ascii?Q?dGfLf+mQHX4DWMpw59Ol+1zCtQNmI8+OqvQuJve/SZ99xekg0bR5MCRhCgv9?=
 =?us-ascii?Q?jk4Wn9VUFt5bH5SKLEeR4hWV4ozAcWZD3kasPaquccbOe4jLTZG0TwRTLg2p?=
 =?us-ascii?Q?pWZjg2WZuBqIDt5VwC6TcMDeBTM22wN7G+g7qta8YneXAARhQyQg8Z+zoQrZ?=
 =?us-ascii?Q?wrSTzkiOlIG9TgHImgH31lVxiJ6XFhr1aGnTI4C9N3tqdEh7rBNDokJ9FPtw?=
 =?us-ascii?Q?GKBIwnNigryy4tG2RBJQ7HT+lt+nbal9A4kA5aoxxnMffYPJuqULHS+kMSe3?=
 =?us-ascii?Q?70pIGWOo4nGeApVPWjFQZRYtbjp0/efTEzB0UtwaE7e3SwP5FQmsqyN63Yi3?=
 =?us-ascii?Q?9HUf7KrouIIV0CmAal11CkkXToFykwY1gPY23Jnfl1NQ/rN4c9aWrQSbV4FC?=
 =?us-ascii?Q?5IEM6u3iem3Qyeh3Q1Cv+x8AHazMRQpxLGxzpAvNW23FJnMiN4UkwNh390iH?=
 =?us-ascii?Q?v6/Wq4NGN9Lt5AwDk3JYNVNfDuromnX8OEZ8dJiM3Wi/I3UV2cfKO2XR7OBK?=
 =?us-ascii?Q?7V/Yzwj++WQCT/zFayKrHjdG+iHxiIkIIA37ligVdoJU6d1Z3TtIqIh0/bB9?=
 =?us-ascii?Q?QiZZezMQ1Rq+G2pKgqsMvQxyY9p0txoYcEph3fJnPyIWVMNooGnEcps3vUd8?=
 =?us-ascii?Q?TrtKLmnW72pADBkniPl6tn9rOPixKUXS4tcJ2Nu27SwOCs1ytJnf9uVfADND?=
 =?us-ascii?Q?jQbZfWJep3skg43/AqThTDLSVNliYAWV00WpfcshMGXBZd5QfU5sCDfhYNBX?=
 =?us-ascii?Q?bVRg8jjzKCEwt8RHRJ86jNI6IfSo5tn7sXW3IX95qNpnZ5SINNRUwg9DBgNf?=
 =?us-ascii?Q?kynH0VELFcNaS8a9OXgq59Lqyu5PFA+y6cd014SCiGrDPodJRocRgOeuCDt1?=
 =?us-ascii?Q?i3pafOrR9cVPoEzDX+I6jVXiSANJENGMyh1Yifxboxx9iG4qSbmftaLjyY4K?=
 =?us-ascii?Q?iqb3q91ZqZAAEg2UU0ULFPjfNFGsknAD4IsCDCiVEbJ4W+nfUgavdrZTZtKk?=
 =?us-ascii?Q?BcUaK7LjhFZOy5PF8Q37DHv5xRrAAnaARmIFFzP+Mgwl57zxlrqcuyWVL9+S?=
 =?us-ascii?Q?NONpdL9AsNg5qPD29u/PKa0H7AbZcecRsJKKws1YwTT2veMuXSW52OY1ZXEa?=
 =?us-ascii?Q?BqRtfQ7wwZaD7Pe6b2vfmbzK?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 393c9488-c917-4e4f-1abf-08d8ef06ac14
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 20:52:01.0179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zoymiq3haQNIlB9PcEBEMEbQt0d8yK0hHK3X6AoeUM7RIsUhi1THt6Ysl35hnNEncwmeMzt7I+sHlVvT9ziJ8NsTMUJTNfPl6BGkN4t+UnQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6904
Received-SPF: pass client-ip=40.107.14.109;
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

We are generally moving to int64_t for both offset and bytes parameters
on all io paths.

Main motivation is realization of 64-bit write_zeroes operation for
fast zeroing large disk chunks, up to the whole disk.

We chose signed type, to be consistent with off_t (which is signed) and
with possibility for signed return type (where negative value means
error).

So, convert driver discard handlers bytes parameter to int64_t.

The only caller of all updated function is bdrv_co_pdiscard in
block/io.c. It is already prepared to work with 64bit requests, but
pass at most max(bs->bl.max_pdiscard, INT_MAX) to the driver.

Let's look at all updated functions:

backup-top: pass to bdrv_co_pdiscard which is 64bit

blkdebug: all calculations are still OK, thanks to
  bdrv_check_qiov_request().
  both rule_check and bdrv_co_pdiscard are 64bit

blklogwrites: pass to blk_loc_writes_co_log which is 64bit

blkreply, copy-on-read, filter-compress: pass to bdrv_co_pdiscard, OK

file-posix: one handler calls raw_account_discard() is 64bit and both
  handlers calls raw_do_pdiscard(). Update raw_do_pdiscard, which pass
  to RawPosixAIOData::aio_nbytes, which is 64bit (and calls
  raw_account_discard())

gluster: somehow, third argument of glfs_discard_async is size_t.
  Let's set max_pdiscard accordingly.

iscsi: iscsi_allocmap_set_invalid is 64bit,
  !is_byte_request_lun_aligned is 64bit.
  list.num is uint32_t. Let's clarify max_pdiscard and
  pdiscard_alignment.

mirror_top, preallocate: pass to bdrv_mirror_top_do_write() which is
  64bit

nbd: protocol limitation. max_pdiscard is alredy set strict enough,
  keep it as is for now.

nvmd: buf.nlb is uint32_t and we do shift. So, add corresponding limits
  to nvme_refresh_limits().

qcow2: calculations are still OK, thanks to bdrv_check_qiov_request(),
  qcow2_cluster_discard() is 64bit.

raw-format: raw_adjust_offset() is 64bit, bdrv_co_pdiscard too.

sheepdog: the format is deprecated. Don't care and just make old
  INT_MAX limit to be explicit

throttle: pass to bdrv_co_pdiscard() which is 64bit and to
  throttle_group_co_io_limits_intercept() which is 64bit as well.

test-block-iothread: bytes argument is unused

Great! Now all drivers are prepared to 64bit discard requests or has
explicit max_pdiscard limit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h        |  2 +-
 block/backup-top.c               |  2 +-
 block/blkdebug.c                 |  2 +-
 block/blklogwrites.c             |  4 ++--
 block/blkreplay.c                |  2 +-
 block/copy-on-read.c             |  2 +-
 block/file-posix.c               |  7 ++++---
 block/filter-compress.c          |  2 +-
 block/gluster.c                  |  7 +++++--
 block/iscsi.c                    | 10 +++++-----
 block/mirror.c                   |  2 +-
 block/nbd.c                      |  6 ++++--
 block/nvme.c                     | 14 +++++++++++++-
 block/preallocate.c              |  2 +-
 block/qcow2.c                    |  2 +-
 block/raw-format.c               |  2 +-
 block/sheepdog.c                 | 15 ++++++++++++++-
 block/throttle.c                 |  2 +-
 tests/unit/test-block-iothread.c |  2 +-
 block/trace-events               |  4 ++--
 20 files changed, 61 insertions(+), 30 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 0245620bf6..735935841e 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -302,7 +302,7 @@ struct BlockDriver {
     int coroutine_fn (*bdrv_co_pwrite_zeroes)(BlockDriverState *bs,
         int64_t offset, int64_t bytes, BdrvRequestFlags flags);
     int coroutine_fn (*bdrv_co_pdiscard)(BlockDriverState *bs,
-        int64_t offset, int bytes);
+        int64_t offset, int64_t bytes);
 
     /* Map [offset, offset + nbytes) range onto a child of @bs to copy from,
      * and invoke bdrv_co_copy_range_from(child, ...), or invoke
diff --git a/block/backup-top.c b/block/backup-top.c
index 838027981b..c5ce84def4 100644
--- a/block/backup-top.c
+++ b/block/backup-top.c
@@ -75,7 +75,7 @@ static coroutine_fn int backup_top_cbw(BlockDriverState *bs, uint64_t offset,
 }
 
 static int coroutine_fn backup_top_co_pdiscard(BlockDriverState *bs,
-                                               int64_t offset, int bytes)
+                                               int64_t offset, int64_t bytes)
 {
     int ret = backup_top_cbw(bs, offset, bytes, 0);
     if (ret < 0) {
diff --git a/block/blkdebug.c b/block/blkdebug.c
index c81cb9cb1a..2d98a33982 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -700,7 +700,7 @@ static int coroutine_fn blkdebug_co_pwrite_zeroes(BlockDriverState *bs,
 }
 
 static int coroutine_fn blkdebug_co_pdiscard(BlockDriverState *bs,
-                                             int64_t offset, int bytes)
+                                             int64_t offset, int64_t bytes)
 {
     uint32_t align = bs->bl.pdiscard_alignment;
     int err;
diff --git a/block/blklogwrites.c b/block/blklogwrites.c
index d7ae64c22d..f7a251e91f 100644
--- a/block/blklogwrites.c
+++ b/block/blklogwrites.c
@@ -484,9 +484,9 @@ static int coroutine_fn blk_log_writes_co_flush_to_disk(BlockDriverState *bs)
 }
 
 static int coroutine_fn
-blk_log_writes_co_pdiscard(BlockDriverState *bs, int64_t offset, int count)
+blk_log_writes_co_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes)
 {
-    return blk_log_writes_co_log(bs, offset, count, NULL, 0,
+    return blk_log_writes_co_log(bs, offset, bytes, NULL, 0,
                                  blk_log_writes_co_do_file_pdiscard,
                                  LOG_DISCARD_FLAG, false);
 }
diff --git a/block/blkreplay.c b/block/blkreplay.c
index 89d74a3cca..dcbe780ddb 100644
--- a/block/blkreplay.c
+++ b/block/blkreplay.c
@@ -105,7 +105,7 @@ static int coroutine_fn blkreplay_co_pwrite_zeroes(BlockDriverState *bs,
 }
 
 static int coroutine_fn blkreplay_co_pdiscard(BlockDriverState *bs,
-                                              int64_t offset, int bytes)
+                                              int64_t offset, int64_t bytes)
 {
     uint64_t reqid = blkreplay_next_id();
     int ret = bdrv_co_pdiscard(bs->file, offset, bytes);
diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index 758a5d44d5..c29cfdd10e 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -214,7 +214,7 @@ static int coroutine_fn cor_co_pwrite_zeroes(BlockDriverState *bs,
 
 
 static int coroutine_fn cor_co_pdiscard(BlockDriverState *bs,
-                                        int64_t offset, int bytes)
+                                        int64_t offset, int64_t bytes)
 {
     return bdrv_co_pdiscard(bs->file, offset, bytes);
 }
diff --git a/block/file-posix.c b/block/file-posix.c
index 03618cc18b..1ea2d0c889 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2899,7 +2899,8 @@ static void raw_account_discard(BDRVRawState *s, uint64_t nbytes, int ret)
 }
 
 static coroutine_fn int
-raw_do_pdiscard(BlockDriverState *bs, int64_t offset, int bytes, bool blkdev)
+raw_do_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                bool blkdev)
 {
     BDRVRawState *s = bs->opaque;
     RawPosixAIOData acb;
@@ -2923,7 +2924,7 @@ raw_do_pdiscard(BlockDriverState *bs, int64_t offset, int bytes, bool blkdev)
 }
 
 static coroutine_fn int
-raw_co_pdiscard(BlockDriverState *bs, int64_t offset, int bytes)
+raw_co_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes)
 {
     return raw_do_pdiscard(bs, offset, bytes, false);
 }
@@ -3563,7 +3564,7 @@ static int fd_open(BlockDriverState *bs)
 }
 
 static coroutine_fn int
-hdev_co_pdiscard(BlockDriverState *bs, int64_t offset, int bytes)
+hdev_co_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes)
 {
     BDRVRawState *s = bs->opaque;
     int ret;
diff --git a/block/filter-compress.c b/block/filter-compress.c
index fb85686b69..d5be538619 100644
--- a/block/filter-compress.c
+++ b/block/filter-compress.c
@@ -94,7 +94,7 @@ static int coroutine_fn compress_co_pwrite_zeroes(BlockDriverState *bs,
 
 
 static int coroutine_fn compress_co_pdiscard(BlockDriverState *bs,
-                                             int64_t offset, int bytes)
+                                             int64_t offset, int64_t bytes)
 {
     return bdrv_co_pdiscard(bs->file, offset, bytes);
 }
diff --git a/block/gluster.c b/block/gluster.c
index 6a17b37c0c..066fdf60fa 100644
--- a/block/gluster.c
+++ b/block/gluster.c
@@ -891,6 +891,7 @@ out:
 static void qemu_gluster_refresh_limits(BlockDriverState *bs, Error **errp)
 {
     bs->bl.max_transfer = GLUSTER_MAX_TRANSFER;
+    bs->bl.max_pdiscard = SIZE_MAX;
 }
 
 static int qemu_gluster_reopen_prepare(BDRVReopenState *state,
@@ -1297,18 +1298,20 @@ error:
 
 #ifdef CONFIG_GLUSTERFS_DISCARD
 static coroutine_fn int qemu_gluster_co_pdiscard(BlockDriverState *bs,
-                                                 int64_t offset, int size)
+                                                 int64_t offset, int64_t bytes)
 {
     int ret;
     GlusterAIOCB acb;
     BDRVGlusterState *s = bs->opaque;
 
+    assert(bytes <= SIZE_MAX); /* rely on max_pdiscard */
+
     acb.size = 0;
     acb.ret = 0;
     acb.coroutine = qemu_coroutine_self();
     acb.aio_context = bdrv_get_aio_context(bs);
 
-    ret = glfs_discard_async(s->fd, offset, size, gluster_finish_aiocb, &acb);
+    ret = glfs_discard_async(s->fd, offset, bytes, gluster_finish_aiocb, &acb);
     if (ret < 0) {
         return -errno;
     }
diff --git a/block/iscsi.c b/block/iscsi.c
index b90ed67377..297919ebc2 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -1141,7 +1141,8 @@ iscsi_getlength(BlockDriverState *bs)
 }
 
 static int
-coroutine_fn iscsi_co_pdiscard(BlockDriverState *bs, int64_t offset, int bytes)
+coroutine_fn iscsi_co_pdiscard(BlockDriverState *bs, int64_t offset,
+                               int64_t bytes)
 {
     IscsiLun *iscsilun = bs->opaque;
     struct IscsiTask iTask;
@@ -2075,10 +2076,9 @@ static void iscsi_refresh_limits(BlockDriverState *bs, Error **errp)
     }
 
     if (iscsilun->lbp.lbpu) {
-        if (iscsilun->bl.max_unmap < 0xffffffff / block_size) {
-            bs->bl.max_pdiscard =
-                iscsilun->bl.max_unmap * iscsilun->block_size;
-        }
+        bs->bl.max_pdiscard =
+            MIN_NON_ZERO(iscsilun->bl.max_unmap * iscsilun->block_size,
+                         (uint64_t)UINT32_MAX * iscsilun->block_size);
         bs->bl.pdiscard_alignment =
             iscsilun->bl.opt_unmap_gran * iscsilun->block_size;
     } else {
diff --git a/block/mirror.c b/block/mirror.c
index e40608b2d3..e2038a06d3 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1487,7 +1487,7 @@ static int coroutine_fn bdrv_mirror_top_pwrite_zeroes(BlockDriverState *bs,
 }
 
 static int coroutine_fn bdrv_mirror_top_pdiscard(BlockDriverState *bs,
-    int64_t offset, int bytes)
+    int64_t offset, int64_t bytes)
 {
     return bdrv_mirror_top_do_write(bs, MIRROR_METHOD_DISCARD, offset, bytes,
                                     NULL, 0);
diff --git a/block/nbd.c b/block/nbd.c
index 9ec822c083..cc522a765c 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -1669,15 +1669,17 @@ static int nbd_client_co_flush(BlockDriverState *bs)
 }
 
 static int nbd_client_co_pdiscard(BlockDriverState *bs, int64_t offset,
-                                  int bytes)
+                                  int64_t bytes)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     NBDRequest request = {
         .type = NBD_CMD_TRIM,
         .from = offset,
-        .len = bytes,
+        .len = bytes, /* len is uint32_t */
     };
 
+    assert(bytes <= UINT32_MAX); /* rely on max_pdiscard */
+
     assert(!(s->info.flags & NBD_FLAG_READ_ONLY));
     if (!(s->info.flags & NBD_FLAG_SEND_TRIM) || !bytes) {
         return 0;
diff --git a/block/nvme.c b/block/nvme.c
index 1263022e1c..0c6c4031f3 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -1329,7 +1329,7 @@ static coroutine_fn int nvme_co_pwrite_zeroes(BlockDriverState *bs,
 
 static int coroutine_fn nvme_co_pdiscard(BlockDriverState *bs,
                                          int64_t offset,
-                                         int bytes)
+                                         int64_t bytes)
 {
     BDRVNVMeState *s = bs->opaque;
     NVMeQueuePair *ioq = s->queues[INDEX_IO(0)];
@@ -1356,6 +1356,14 @@ static int coroutine_fn nvme_co_pdiscard(BlockDriverState *bs,
 
     assert(s->queue_count > 1);
 
+    /*
+     * Filling the @buf requires @offset and @bytes to satisfy restrictions
+     * defined in nvme_refresh_limits().
+     */
+    assert(QEMU_IS_ALIGNED(bytes, 1UL << s->blkshift));
+    assert(QEMU_IS_ALIGNED(offset, 1UL << s->blkshift));
+    assert((bytes >> s->blkshift) <= UINT32_MAX);
+
     buf = qemu_try_memalign(s->page_size, s->page_size);
     if (!buf) {
         return -ENOMEM;
@@ -1459,6 +1467,10 @@ static void nvme_refresh_limits(BlockDriverState *bs, Error **errp)
     bs->bl.max_pwrite_zeroes = 1ULL << (s->blkshift + 16);
     bs->bl.pwrite_zeroes_alignment = MAX(bs->bl.request_alignment,
                                          1UL << s->blkshift);
+
+    bs->bl.max_pdiscard = (uint64_t)UINT32_MAX << s->blkshift;
+    bs->bl.pdiscard_alignment = MAX(bs->bl.request_alignment,
+                                    1UL << s->blkshift);
 }
 
 static void nvme_detach_aio_context(BlockDriverState *bs)
diff --git a/block/preallocate.c b/block/preallocate.c
index 99e28d9f08..1d4233f730 100644
--- a/block/preallocate.c
+++ b/block/preallocate.c
@@ -235,7 +235,7 @@ static coroutine_fn int preallocate_co_preadv_part(
 }
 
 static int coroutine_fn preallocate_co_pdiscard(BlockDriverState *bs,
-                                               int64_t offset, int bytes)
+                                               int64_t offset, int64_t bytes)
 {
     return bdrv_co_pdiscard(bs->file, offset, bytes);
 }
diff --git a/block/qcow2.c b/block/qcow2.c
index c9bce9711d..955e488046 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -3945,7 +3945,7 @@ static coroutine_fn int qcow2_co_pwrite_zeroes(BlockDriverState *bs,
 }
 
 static coroutine_fn int qcow2_co_pdiscard(BlockDriverState *bs,
-                                          int64_t offset, int bytes)
+                                          int64_t offset, int64_t bytes)
 {
     int ret;
     BDRVQcow2State *s = bs->opaque;
diff --git a/block/raw-format.c b/block/raw-format.c
index 4e9304c63b..45846e42d5 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -302,7 +302,7 @@ static int coroutine_fn raw_co_pwrite_zeroes(BlockDriverState *bs,
 }
 
 static int coroutine_fn raw_co_pdiscard(BlockDriverState *bs,
-                                        int64_t offset, int bytes)
+                                        int64_t offset, int64_t bytes)
 {
     int ret;
 
diff --git a/block/sheepdog.c b/block/sheepdog.c
index a45c73826d..80e04dccfd 100644
--- a/block/sheepdog.c
+++ b/block/sheepdog.c
@@ -3101,7 +3101,7 @@ static int sd_load_vmstate(BlockDriverState *bs, QEMUIOVector *qiov,
 
 
 static coroutine_fn int sd_co_pdiscard(BlockDriverState *bs, int64_t offset,
-                                      int bytes)
+                                       int64_t bytes)
 {
     SheepdogAIOCB acb;
     BDRVSheepdogState *s = bs->opaque;
@@ -3113,6 +3113,8 @@ static coroutine_fn int sd_co_pdiscard(BlockDriverState *bs, int64_t offset,
         return 0;
     }
 
+    assert(bytes <= INT_MAX); /* thanks to max_pdiscard */
+
     memset(&discard_iov, 0, sizeof(discard_iov));
     memset(&iov, 0, sizeof(iov));
     iov.iov_base = &zero;
@@ -3186,6 +3188,11 @@ static int64_t sd_get_allocated_file_size(BlockDriverState *bs)
     return size;
 }
 
+static void sd_refresh_limits(BlockDriverState *bs, Error **errp)
+{
+    bs->bl.max_pdiscard = INT_MAX;
+}
+
 static QemuOptsList sd_create_opts = {
     .name = "sheepdog-create-opts",
     .head = QTAILQ_HEAD_INITIALIZER(sd_create_opts.head),
@@ -3269,6 +3276,8 @@ static BlockDriver bdrv_sheepdog = {
 
     .create_opts                  = &sd_create_opts,
     .strong_runtime_opts          = sd_strong_runtime_opts,
+
+    .bdrv_refresh_limits          = sd_refresh_limits,
 };
 
 static BlockDriver bdrv_sheepdog_tcp = {
@@ -3307,6 +3316,8 @@ static BlockDriver bdrv_sheepdog_tcp = {
 
     .create_opts                  = &sd_create_opts,
     .strong_runtime_opts          = sd_strong_runtime_opts,
+
+    .bdrv_refresh_limits          = sd_refresh_limits,
 };
 
 static BlockDriver bdrv_sheepdog_unix = {
@@ -3345,6 +3356,8 @@ static BlockDriver bdrv_sheepdog_unix = {
 
     .create_opts                  = &sd_create_opts,
     .strong_runtime_opts          = sd_strong_runtime_opts,
+
+    .bdrv_refresh_limits          = sd_refresh_limits,
 };
 
 static void bdrv_sheepdog_init(void)
diff --git a/block/throttle.c b/block/throttle.c
index c13fe9067f..6e8d52fa24 100644
--- a/block/throttle.c
+++ b/block/throttle.c
@@ -145,7 +145,7 @@ static int coroutine_fn throttle_co_pwrite_zeroes(BlockDriverState *bs,
 }
 
 static int coroutine_fn throttle_co_pdiscard(BlockDriverState *bs,
-                                             int64_t offset, int bytes)
+                                             int64_t offset, int64_t bytes)
 {
     ThrottleGroupMember *tgm = bs->opaque;
     throttle_group_co_io_limits_intercept(tgm, bytes, true);
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index 50b8718b2a..9656814814 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -48,7 +48,7 @@ static int coroutine_fn bdrv_test_co_pwritev(BlockDriverState *bs,
 }
 
 static int coroutine_fn bdrv_test_co_pdiscard(BlockDriverState *bs,
-                                              int64_t offset, int bytes)
+                                              int64_t offset, int64_t bytes)
 {
     return 0;
 }
diff --git a/block/trace-events b/block/trace-events
index 3edd2899c2..3b86c03b2f 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -152,8 +152,8 @@ nvme_write_zeroes(void *s, uint64_t offset, uint64_t bytes, int flags) "s %p off
 nvme_qiov_unaligned(const void *qiov, int n, void *base, size_t size, int align) "qiov %p n %d base %p size 0x%zx align 0x%x"
 nvme_prw_buffered(void *s, uint64_t offset, uint64_t bytes, int niov, int is_write) "s %p offset 0x%"PRIx64" bytes %"PRId64" niov %d is_write %d"
 nvme_rw_done(void *s, int is_write, uint64_t offset, uint64_t bytes, int ret) "s %p is_write %d offset 0x%"PRIx64" bytes %"PRId64" ret %d"
-nvme_dsm(void *s, uint64_t offset, uint64_t bytes) "s %p offset 0x%"PRIx64" bytes %"PRId64""
-nvme_dsm_done(void *s, uint64_t offset, uint64_t bytes, int ret) "s %p offset 0x%"PRIx64" bytes %"PRId64" ret %d"
+nvme_dsm(void *s, int64_t offset, int64_t bytes) "s %p offset 0x%"PRIx64" bytes %"PRId64""
+nvme_dsm_done(void *s, int64_t offset, int64_t bytes, int ret) "s %p offset 0x%"PRIx64" bytes %"PRId64" ret %d"
 nvme_dma_map_flush(void *s) "s %p"
 nvme_free_req_queue_wait(void *s, unsigned q_index) "s %p q #%u"
 nvme_create_queue_pair(unsigned q_index, void *q, unsigned size, void *aio_context, int fd) "index %u q %p size %u aioctx %p fd %d"
-- 
2.29.2


