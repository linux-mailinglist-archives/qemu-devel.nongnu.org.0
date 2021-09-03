Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 693723FFE47
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 12:38:10 +0200 (CEST)
Received: from localhost ([::1]:52864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM6aH-000064-GW
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 06:38:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mM6RM-0003Up-Iq; Fri, 03 Sep 2021 06:28:57 -0400
Received: from mail-eopbgr60121.outbound.protection.outlook.com
 ([40.107.6.121]:7190 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mM6RJ-0002A7-GZ; Fri, 03 Sep 2021 06:28:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UJr90FQ0ETRgyBKsiirq1r3Z2jIBlkJ7FJhJhXCAGsW8C5qwQ/+uM4ZMh8Fj0OIINoiFU22gW9a1iKn+UzSCqmmd8nvQSqbhmYLh0ZTUqQfEpi6+ame6VeclFj4tWy/VTwYIU+gzDQG4vvi1d3YNwjFZSm8Dj2wMyuN8hDB0OvDqjAcOi0vOc4E5pCdztZ0BOIRC88mAaKaOZSxoug81tHXssaF0GYZzcHSVlLb3lbaZBycu6vz/mDp4WZcIfVNEQoFUs3QG7NogWoseUK5Q97PBH4/uzTcm9yTIeBvPWi/Hy1y+RDJzEFobFgY3bedIc7ADaqKBvfNm+IqIpSxB5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=1g38eaKhUw1NOa/mBH1a35a3Thr5oJh6mtXBn4H2BOU=;
 b=BSVKb7jKHd05PQFZgmKdSFg0t+dleEfrV3XprFZhLz35kvAtgnLbBjHSkA7P5Co55hOoCHdIktkZdcTx/RsiaTLOFtVho0lx5UQPeE6LpKo1LmnId9d3/4Tn7oe5E7Rpu4JsQMdflbDcSOSy4NXGvYJwQAsx1hCKyrCfToryz/GJWD+zL0KTyKi9G2hhKvRcPNqfUUN55TrbUZa6G4Lnb2q0ws3/o216lR8U8dd2Xx8DSX7VpSNI/sTtiPYJYqj462vCgZTQOYmcr3ioSfYk5wmAEcBgoLx9YNFBMZIsbR2nyVysJRBONhQ4s5F/QRgvb6PI2+6wOMduJ7fFwvBvhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1g38eaKhUw1NOa/mBH1a35a3Thr5oJh6mtXBn4H2BOU=;
 b=AJkCFnzzw42cSeMYggYxxvs3wK1y0VfqG9dqgH9Ulq4YSE7AxwUi6yzfg7CTPEVbe0tN22FSMzviwsJIsqmUxeyndUhTX9xo0pX7Gvy2a353VwdYjBgdbmgfV/zzUNfvih84/ANB5hO1RBpE6YibWgTO5hsQtabKvLOHLoMe7YA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6945.eurprd08.prod.outlook.com (2603:10a6:20b:344::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Fri, 3 Sep
 2021 10:28:43 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.022; Fri, 3 Sep 2021
 10:28:43 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, integration@gluster.org, kraxel@redhat.com,
 idryomov@gmail.com, berto@igalia.com, philmd@redhat.com, eblake@redhat.com,
 pl@kamp.de, ronniesahlberg@gmail.com, fam@euphon.net, sw@weilnetz.de,
 vsementsov@virtuozzo.com, jsnow@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, pavel.dovgaluk@ispras.ru, ari@tuxera.com,
 hreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 10/11] block: use int64_t instead of int in driver discard
 handlers
Date: Fri,  3 Sep 2021 13:28:06 +0300
Message-Id: <20210903102807.27127-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210903102807.27127-1-vsementsov@virtuozzo.com>
References: <20210903102807.27127-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0163.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1PR05CA0163.eurprd05.prod.outlook.com (2603:10a6:3:f8::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Fri, 3 Sep 2021 10:28:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5793b9a1-7e8b-4999-38db-08d96ec59a85
X-MS-TrafficTypeDiagnostic: AS8PR08MB6945:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6945CF07F770FE36B58B6CC6C1CF9@AS8PR08MB6945.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KitEoM8ojXsuxmyT2O9z8n7vBNxHSa509XE9gH5a0LVabOJLLxVPtrqHRAWqauSytZTshwxfJWQc+F+wzig429bFGaVUp10kBBPQ0paHT7mrHgsrJQsFCJAQ+XFIVBsXWoIfcG4psDx2bP8pTWH3qB41dc5hhrSegceGyW1xL19JlIZ4Uures9aM0RGHwUGRwxEX+aLpbbNo5NgRJLFi87Tawk3GrPwUwyOEPW/F02WGbIVN6vLxQeORytJhsNEeXiRbe2yXaZ9E635wn1H4Refc/sW5iqfUB5qTVjki5FzwY9NBwuht4rDqAfI9ju0fr7jLw232T0coplBbCK/6vrBc9Sy0R7rrxlckC5CxyFaLe+O0GYB5u9qt93SrpjZiYnrZTCzWL1J+DXdzjKzsXsx0KcnuneiTLAqg4gZ/fM3DPCaXj0tqkMIp+ZEdUBwnbQNuwHpVAwkddGnCqPvQ403dYh/XD+c5JX2z+bRC//puTBlVgjSfzm4OX5w9xdTB69TMWCinxZRjWnnkfVOXaXN1DK3tHLG/KmKbHBR2uHeDeSqU3HqAknX5hYPfx1OAvyPPox6NIH0EZ6BopOdqidxY1n9JmfRefvHbIWr+wcN3NYaDfUsudQNmKla0+KNDO6Gl4L8e5+ND92M9MhnGOAJljHGg/RNoydomTZZ9S2nFN/t2uK5o4aJ+S/Pzby9D9FCLjlSxgSXMXnRbuL9XEg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(39850400004)(396003)(376002)(7416002)(83380400001)(38350700002)(36756003)(6512007)(38100700002)(6486002)(5660300002)(52116002)(6666004)(6916009)(186003)(956004)(66556008)(2906002)(66476007)(66946007)(30864003)(8936002)(6506007)(26005)(86362001)(2616005)(316002)(478600001)(1076003)(8676002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N8/qbbpvIHumQg46dDN25A+KsZKftSDc3aoL9IzTPyp25IEZ3mIZhDM7W5fs?=
 =?us-ascii?Q?HtwoUI15erWiN0rGK1dpMpKDIb91tXljgy5TXaN5rQjDZv7pgyK4OmbogN15?=
 =?us-ascii?Q?LD0jqTWuF0tO/iBAiAN/hrQYUZiFXQbyPhkog9ONhK73jtQo4fy3ENZb+cza?=
 =?us-ascii?Q?qwlQxIM54/ZzN/8NbyBIcdLJGlrNk82ZMTOjS7CPKvPiaqYKVbeSa59YrDza?=
 =?us-ascii?Q?ZndInbXT9Ax7TCsxOoFp28rHPvSSgX5dcX/DgPcr/w7hPUI5hHACgn4g9czp?=
 =?us-ascii?Q?hhJCnuURNAsDz9YDnt+Zmm2kaBysMIsWkZqB9kaz6tF4kFHxBxdg/JDiiFG2?=
 =?us-ascii?Q?IXyfSmBYcv+sO2HyNaSXQW4/aq0UFAtkVwTWLdRpcNtQyCN9+yLF0Y1KKzZd?=
 =?us-ascii?Q?XJrNmVk7XlDb5nv5g33SnpYxYy3TORYmxAAfSRfUg8LGgQMM07BEJKbm+V58?=
 =?us-ascii?Q?LiW9qVHOAnjNYgij1XHrNG48MJcT/4XT/qHqWIr1RHr8mgnWJFNzBrlcYVvW?=
 =?us-ascii?Q?qmjf/hoJ6coxWqTvLg/xV/JXAdzVt0T3pCUHiUdQXKCMJkZYY9CodKgn9oYy?=
 =?us-ascii?Q?+7NSfFu5SVDXyVexa59tCP9eYy80HybjisqNmW94i/caIlWqzHClYLW2Euu/?=
 =?us-ascii?Q?Wlyj3aSjXtIFomn4b7MgwQueQc5uipTP6dKvmWL/p7g/ay7V62s9CskyJ5GZ?=
 =?us-ascii?Q?gHsOMUCSNWv3cd6rX0jnpa6Z0hLgNrpwTEBo/nghLHf/hY69wDzkR4DZhtAa?=
 =?us-ascii?Q?kFXmKakMMrVktrn/ilZ1R7ohKzjyiKr+6YB3iM9CdBiq8zHb+hP1uhZRc3Az?=
 =?us-ascii?Q?mTK6Ef8oa/AkbmLPD3ycyt0IGeAvMXfiHGi7cOSMNA61rxJy4syf580/4qJt?=
 =?us-ascii?Q?4PPH6xwByy4+Fnri9p+DhWrJysolPANaorFbDOO6iZlhA0ka06B8SUulwfre?=
 =?us-ascii?Q?0XeNIpVbqcb02yclaSKJ/i0sD3bbLS1aJ0l54cu5xbkw2KAtLIr7EB4lyujZ?=
 =?us-ascii?Q?PWWsqWyc4iHhNPvfZ8cXV8+kgC/qgoApIpPwESUwGbvBPGQ4aFh4RXc9LiW2?=
 =?us-ascii?Q?aKkpP3boibnSmp8QK1Z+OQfwWtn0YpSiRprRJSjyDcTFk29E2vSpXWMnLAdD?=
 =?us-ascii?Q?/aoXq9BniR+no7E3RMsqjJZ2ScLgLZdx/nbuKhMmQ6KPdb2HYLh8q7pAsYST?=
 =?us-ascii?Q?7hdUVOkaHhf98SxUuj8HpILXJFlD/8+gnplyfg1rbHszsU87SNeDwhBP72Fx?=
 =?us-ascii?Q?/Fi2oZpAMCNcuqslH5WT4Hz+6tiSAMFHmV7waoJNmt9s2JJWtwgP3dGmtz6j?=
 =?us-ascii?Q?yeXJ41Qm4Uml65hRLDjPj5f/?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5793b9a1-7e8b-4999-38db-08d96ec59a85
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2021 10:28:43.1622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wtt5U/FtsbezQqlV7gnQcv5rioqHbnsbo+gjlqcIbhXMi469N/A8jjVOTfm1RLzjBC6ZDFAOMkqeH8uGrvXFE52Pdfqp/d5Vmb14cGW8EAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6945
Received-SPF: pass client-ip=40.107.6.121;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

blkdebug: all calculations are still OK, thanks to
  bdrv_check_qiov_request().
  both rule_check and bdrv_co_pdiscard are 64bit

blklogwrites: pass to blk_loc_writes_co_log which is 64bit

blkreplay, copy-on-read, filter-compress: pass to bdrv_co_pdiscard, OK

copy-before-write: pass to bdrv_co_pdiscard which is 64bit and to
  cbw_do_copy_before_write which is 64bit

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

mirror_top: pass to bdrv_mirror_top_do_write() which is
  64bit

nbd: protocol limitation. max_pdiscard is alredy set strict enough,
  keep it as is for now.

nvme: buf.nlb is uint32_t and we do shift. So, add corresponding limits
  to nvme_refresh_limits().

preallocate: pass to bdrv_co_pdiscard() which is 64bit.

rbd: pass to qemu_rbd_start_co() which is 64bit.

qcow2: calculations are still OK, thanks to bdrv_check_qiov_request(),
  qcow2_cluster_discard() is 64bit.

raw-format: raw_adjust_offset() is 64bit, bdrv_co_pdiscard too.

throttle: pass to bdrv_co_pdiscard() which is 64bit and to
  throttle_group_co_io_limits_intercept() which is 64bit as well.

test-block-iothread: bytes argument is unused

Great! Now all drivers are prepared to handle 64bit discard requests,
or else have explicit max_pdiscard limits.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h        |  2 +-
 block/blkdebug.c                 |  2 +-
 block/blklogwrites.c             |  4 ++--
 block/blkreplay.c                |  2 +-
 block/copy-before-write.c        |  2 +-
 block/copy-on-read.c             |  2 +-
 block/file-posix.c               |  7 ++++---
 block/filter-compress.c          |  2 +-
 block/gluster.c                  |  7 +++++--
 block/iscsi.c                    | 16 +++++++++++-----
 block/mirror.c                   |  2 +-
 block/nbd.c                      |  6 ++++--
 block/nvme.c                     | 14 +++++++++++++-
 block/preallocate.c              |  2 +-
 block/qcow2.c                    |  2 +-
 block/raw-format.c               |  2 +-
 block/rbd.c                      |  4 ++--
 block/throttle.c                 |  2 +-
 tests/unit/test-block-iothread.c |  2 +-
 block/trace-events               |  4 ++--
 20 files changed, 55 insertions(+), 31 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 5977859f80..4e45352268 100644
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
diff --git a/block/blkdebug.c b/block/blkdebug.c
index 742b4a3834..bbf2948703 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -717,7 +717,7 @@ static int coroutine_fn blkdebug_co_pwrite_zeroes(BlockDriverState *bs,
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
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index d210e87a45..c30a5ff8de 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -64,7 +64,7 @@ static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
 }
 
 static int coroutine_fn cbw_co_pdiscard(BlockDriverState *bs,
-                                        int64_t offset, int bytes)
+                                        int64_t offset, int64_t bytes)
 {
     int ret = cbw_do_copy_before_write(bs, offset, bytes, 0);
     if (ret < 0) {
diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index f83dd83f14..1fc7fb3333 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -201,7 +201,7 @@ static int coroutine_fn cor_co_pwrite_zeroes(BlockDriverState *bs,
 
 
 static int coroutine_fn cor_co_pdiscard(BlockDriverState *bs,
-                                        int64_t offset, int bytes)
+                                        int64_t offset, int64_t bytes)
 {
     return bdrv_co_pdiscard(bs->file, offset, bytes);
 }
diff --git a/block/file-posix.c b/block/file-posix.c
index d90a0bd723..f8eae6d881 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2941,7 +2941,8 @@ static void raw_account_discard(BDRVRawState *s, uint64_t nbytes, int ret)
 }
 
 static coroutine_fn int
-raw_do_pdiscard(BlockDriverState *bs, int64_t offset, int bytes, bool blkdev)
+raw_do_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                bool blkdev)
 {
     BDRVRawState *s = bs->opaque;
     RawPosixAIOData acb;
@@ -2965,7 +2966,7 @@ raw_do_pdiscard(BlockDriverState *bs, int64_t offset, int bytes, bool blkdev)
 }
 
 static coroutine_fn int
-raw_co_pdiscard(BlockDriverState *bs, int64_t offset, int bytes)
+raw_co_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes)
 {
     return raw_do_pdiscard(bs, offset, bytes, false);
 }
@@ -3590,7 +3591,7 @@ hdev_co_ioctl(BlockDriverState *bs, unsigned long int req, void *buf)
 #endif /* linux */
 
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
index eaeb93ebc7..f6abe3a4da 100644
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
@@ -1157,6 +1158,12 @@ coroutine_fn iscsi_co_pdiscard(BlockDriverState *bs, int64_t offset, int bytes)
         return 0;
     }
 
+    /*
+     * We don't want to overflow list.num which is uint32_t.
+     * We rely on our max_pdiscard.
+     */
+    assert(bytes / iscsilun->block_size <= UINT32_MAX);
+
     list.lba = offset / iscsilun->block_size;
     list.num = bytes / iscsilun->block_size;
 
@@ -2074,10 +2081,9 @@ static void iscsi_refresh_limits(BlockDriverState *bs, Error **errp)
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
index 64ef53cdd4..c88b307f85 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1501,7 +1501,7 @@ static int coroutine_fn bdrv_mirror_top_pwrite_zeroes(BlockDriverState *bs,
 }
 
 static int coroutine_fn bdrv_mirror_top_pdiscard(BlockDriverState *bs,
-    int64_t offset, int bytes)
+    int64_t offset, int64_t bytes)
 {
     return bdrv_mirror_top_do_write(bs, MIRROR_METHOD_DISCARD, offset, bytes,
                                     NULL, 0);
diff --git a/block/nbd.c b/block/nbd.c
index 5e1c4f30b1..fd2ab2b5f0 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -1457,15 +1457,17 @@ static int nbd_client_co_flush(BlockDriverState *bs)
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
index 760d7bea73..c1582923b7 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -1352,7 +1352,7 @@ static coroutine_fn int nvme_co_pwrite_zeroes(BlockDriverState *bs,
 
 static int coroutine_fn nvme_co_pdiscard(BlockDriverState *bs,
                                          int64_t offset,
-                                         int bytes)
+                                         int64_t bytes)
 {
     BDRVNVMeState *s = bs->opaque;
     NVMeQueuePair *ioq = s->queues[INDEX_IO(0)];
@@ -1379,6 +1379,14 @@ static int coroutine_fn nvme_co_pdiscard(BlockDriverState *bs,
 
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
@@ -1482,6 +1490,10 @@ static void nvme_refresh_limits(BlockDriverState *bs, Error **errp)
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
index b881cba0d5..d2b034e3a3 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -3996,7 +3996,7 @@ static coroutine_fn int qcow2_co_pwrite_zeroes(BlockDriverState *bs,
 }
 
 static coroutine_fn int qcow2_co_pdiscard(BlockDriverState *bs,
-                                          int64_t offset, int bytes)
+                                          int64_t offset, int64_t bytes)
 {
     int ret;
     BDRVQcow2State *s = bs->opaque;
diff --git a/block/raw-format.c b/block/raw-format.c
index a2485926b8..bda757fd19 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -302,7 +302,7 @@ static int coroutine_fn raw_co_pwrite_zeroes(BlockDriverState *bs,
 }
 
 static int coroutine_fn raw_co_pdiscard(BlockDriverState *bs,
-                                        int64_t offset, int bytes)
+                                        int64_t offset, int64_t bytes)
 {
     int ret;
 
diff --git a/block/rbd.c b/block/rbd.c
index 053eb8e48f..701fbf2b0c 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -1197,9 +1197,9 @@ static int coroutine_fn qemu_rbd_co_flush(BlockDriverState *bs)
 }
 
 static int coroutine_fn qemu_rbd_co_pdiscard(BlockDriverState *bs,
-                                             int64_t offset, int count)
+                                             int64_t offset, int64_t bytes)
 {
-    return qemu_rbd_start_co(bs, offset, count, NULL, 0, RBD_AIO_DISCARD);
+    return qemu_rbd_start_co(bs, offset, bytes, NULL, 0, RBD_AIO_DISCARD);
 }
 
 #ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
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
index c86954c7ba..aea660aeed 100644
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
index 573acd67d5..0819863356 100644
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


