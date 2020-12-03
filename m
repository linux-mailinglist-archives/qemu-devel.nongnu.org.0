Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1A22CE19B
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 23:30:30 +0100 (CET)
Received: from localhost ([::1]:33964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkx7N-0006p8-Jq
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 17:30:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kkx4i-00045n-Se; Thu, 03 Dec 2020 17:27:46 -0500
Received: from mail-eopbgr140112.outbound.protection.outlook.com
 ([40.107.14.112]:63621 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kkx4f-0000Cm-Bt; Thu, 03 Dec 2020 17:27:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RSTuQeRBQ02VRYs62lQwielaZ+PYRl+j4cShKXd5hpoKpng56fWRCtWjbtbzfr5bgwk0AbBghJpqh3B1a3oz6R+3M2I0q9EZbhowqSSZb0wNrvZaCn8L6+gj5cII33kDZfByfi4AeqpmjeGFB5IyPCZnpcXGb2iIsEUoaTg72vRhdqTE9Wt0k1po9Kt4+KesN8+g1+dUJ29wbhnRtDiE74WXGJ2KWfLAUkc1pD9QX+zP9xccL1aGxMjlwubRlO6H25HA2RBAk+BwPaHQtZfnuUULOk1hUBX+xQNkMMPOMPNQv9miejHwCVh+Z01PRargYALOLMTq5Upc43bNmgxAcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMUeMFUx98CeQ/XOtNJju2iWGw6Y2O/ZNpkQCwzZrak=;
 b=g/P06c0WRZt+Q98XH6XgUpggbBDlHieLMhSfk5Oh09EnjXaHbpN6nFoV6Se4WPGYFtGoXhjlOzXiyQQZ0VH7vtBAxzpgFh32MGvhRWp7/egr/guALQKF0nengJ2haTUS7AONvOAWVPewdNcE2wZ40Ubrg7yXEz6OTreoviVoM1O31VgIlfFXj7bASg1lNmPsv9joIl0QKxplfQ8INZGMt3f0hxKM6thssnKVtkXbHz+ChqhXcQGgqGWP1XZaSfTrRFQjXgC9wNoeQxsgt++oDfLWq1N/G+3Hlu1C0HJ4uwgpslu6mjUCGXklam+TKjw1iNdH29knrgJZNKTAhed1cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMUeMFUx98CeQ/XOtNJju2iWGw6Y2O/ZNpkQCwzZrak=;
 b=gWNSifklvP2fxu8da17NERCc7JDV+WMv6QIHEnReOEHKf4rJWZVI5rsVBi43Ok94sMTrD0dtTTQweLYbAvhrR9s2ByCD4RVz57wDBJ1aO4Sg4CH1d5e5a1+pgRsvV5MmylWNmu8AvsNpDyIPa8Hj5sThFRGDUngfaN7YPoySnMU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5446.eurprd08.prod.outlook.com (2603:10a6:20b:107::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.20; Thu, 3 Dec
 2020 22:27:32 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3632.020; Thu, 3 Dec 2020
 22:27:32 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, eblake@redhat.com, berto@igalia.com,
 den@openvz.org, vsementsov@virtuozzo.com
Subject: [PATCH 4/4] block: introduce BDRV_MAX_LENGTH
Date: Fri,  4 Dec 2020 01:27:13 +0300
Message-Id: <20201203222713.13507-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201203222713.13507-1-vsementsov@virtuozzo.com>
References: <20201203222713.13507-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM4PR07CA0036.eurprd07.prod.outlook.com
 (2603:10a6:205:1::49) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.91) by
 AM4PR07CA0036.eurprd07.prod.outlook.com (2603:10a6:205:1::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.7 via Frontend Transport; Thu, 3 Dec 2020 22:27:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08e31bd6-fcb1-47bf-5222-08d897daa020
X-MS-TrafficTypeDiagnostic: AM7PR08MB5446:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB544620509543A52F74523701C1F20@AM7PR08MB5446.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /9JNbE3SEacQHiHq1qG8U1k9Wkw0EpZpI1yZzUbViiD2I4moe6uMVqlSGqHOZ4xP3/Wtx8GowPOki1CSQXQzqC/+CTTAaV/Tu2hoZX8a0KfO/Fcy/qDTg5nCSEQwJo2rTQv411Vsbvre8n/WSDSX8q3srO/zC7LHywsPXEkUkxdaYEN3t+SZng8NzsevbyEabtMA1n4s5le8a6unIjLISYXdU4bZYs1eJwcw9RwzFgsOxoOIiaQkrg00JmAl5wMJ/ASLGKNyBQy2pn13R7L4rKb8ufoB7QNqgNdzAgHeZcYJz56dlhweWqsLuPKlCfUOnfS+LJc+9arzj3sJo31ONA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39840400004)(396003)(366004)(136003)(4326008)(2906002)(8936002)(6916009)(2616005)(36756003)(5660300002)(52116002)(6486002)(478600001)(66946007)(66556008)(66476007)(83380400001)(86362001)(1076003)(8676002)(6512007)(316002)(6506007)(6666004)(956004)(26005)(186003)(30864003)(16526019)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?EDjB0PiHmYwlLUVuwrJgHeEm6zPNBqd+WFzYb+UFZOkrVGo27qltn0i8jf6f?=
 =?us-ascii?Q?n/EXHoyGyEmFW++We3ka5/pgOF86v2qTycUDrqYvvHQD1Vf1RfX4HlEvMhTG?=
 =?us-ascii?Q?oF2YpjjYXzw8J4YpCy6A1YYVuu4LveWulmD/1USeNPkDys+f0hvA0uCpdVwb?=
 =?us-ascii?Q?AgENsMdh94goSO/yJHffcd81MzQ5zL77ozXeL5fKazOjOdk4JZGPO3EY9VnD?=
 =?us-ascii?Q?H+kCnGvbBNI4OMRED69J5uDBKSQY1tixRRzPr3fXlRhnDyeyuN4AlXvmzIcW?=
 =?us-ascii?Q?mVQ3TLjBOnU5X9uSg6pEDqpXNqnfD9MnifWsB3O/PERYrl9U4z8FYeXZyg1r?=
 =?us-ascii?Q?UKedM26vtc+zH/sxM0HEqymZLMi+7o1OrjD63dKYV1q8Z8aiTLYo4ucHVdV3?=
 =?us-ascii?Q?kRwSwlZQUvs9ok0oLbDTRMPuFE5m0kZdoRDEKB9jfONUWQg40qoPR+GKa7IQ?=
 =?us-ascii?Q?s7xbGt71UUZrU9ZpwoalBiPapg+s/q9wb/9nz9X+K5sU8+ztdhkL+E/BCME6?=
 =?us-ascii?Q?r0sfcmgrwBW74cBHia/mLF1LEynQlCeamUOzYP5uCoKHWLQemCXA6d95jsal?=
 =?us-ascii?Q?gmiKh8ldTOwU6FnG20DV+uKNlKROEvTPS14cxW8ISEzZAT9Q3aCKCJcOVhGN?=
 =?us-ascii?Q?KxwaXFY515dHqAKOs7EA0rMXoYMX0nDBxqmtN07kUMY9XDTZ0PHeZqPOFSft?=
 =?us-ascii?Q?Bk3UzoOYS9QvxiC9GQJMxwZYcdXOXIgTbYq1iSN8MsEjAugo4OScl5OnaMXd?=
 =?us-ascii?Q?243WJMgg72btuUQ+oSLPVDxkSjGvt3oL4pIgjp/XSSaKK6bHwEJC55STTc9l?=
 =?us-ascii?Q?D5+kvbJYyt7OzHmXImIA+nBwCYxyS96PAxp6tu+J4Cu1bQBoceH2qjvRS8to?=
 =?us-ascii?Q?l1Q7ctL9x7bzYpzYGrQsOZbOsHzSJ+c2KYcqzQGhaGkm6s/HlAsro4nRj1rY?=
 =?us-ascii?Q?9ctfGDx45sXZGJI9J1NYmS3zs31OC+XmnRkJ9Ue79LwkSHLJe4Rb1jyhBBJy?=
 =?us-ascii?Q?4fWb?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08e31bd6-fcb1-47bf-5222-08d897daa020
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 22:27:31.9844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JD6eWR1zV1OyCHTpO5XdGJDHPzQl7Yr8XFvMwfGDLJsavDtCew9rWty1tZN+nqDHUF6GDz0Q//gTM/cIfa4eF1igeWNaAozkndobjOMuakc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5446
Received-SPF: pass client-ip=40.107.14.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_SBL_CSS=3.335,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

We are going to modify block layer to work with 64bit requests. And
first step is moving to int64_t type for both offset and bytes
arguments in all block request related functions.

It's mostly safe (when widening signed or unsigned int to int64_t), but
switching from uint64_t is questionable.

So, let's first establish the set of requests we want to work with.
First signed int64_t should be enough, as off_t is signed anyway. Then,
obviously offset + bytes should not overflow.

And most interesting: (offset + bytes) being aligned up should not
overflow as well. Aligned to what alignment? First thing that comes in
mind is bs->bl.request_alignment, as we align up request to this
alignment. But there is another thing: look at
bdrv_mark_request_serialising(). It aligns request up to some given
alignment. And this parameter may be bdrv_get_cluster_size(), which is
often a lot greater than bs->bl.request_alignment.
Note also, that bdrv_mark_request_serialising() uses signed int64_t for
calculations. So, actually, we already depend on some restrictions.

Happily, bdrv_get_cluster_size() returns int and
bs->bl.request_alignment has 32bit unsigned type, but defined to be a
power of 2 less than INT_MAX. So, we may establish, that INT_MAX is
absolute maximum for any kind of alignment that may occur with the
request.

Note, that bdrv_get_cluster_size() is not documented to return power
of 2, still bdrv_mark_request_serialising() behaves like it is.
Also, backup uses bdi.cluster_size and is not prepared to it not being
power of 2.
So, let's establish that Qemu supports only power-of-2 clusters and
alignments.

So, alignment can't be greater than 2^30.

Finally to be safe with calculations, to not calculate different
maximums for different nodes (depending on cluster size and
request_alignment), let's simply set QEMU_ALIGN_DOWN(INT64_MAX, 2^30)
as absolute maximum bytes length for Qemu. Actually, it's not much less
than INT64_MAX.

OK, then, let's apply it to block/io.

Let's consider all block/io entry points of offset/bytes:

4 bytes/offset interface functions: bdrv_co_preadv_part(),
bdrv_co_pwritev_part(), bdrv_co_copy_range_internal() and
bdrv_co_pdiscard() and we check them all with bdrv_check_request().

We also have one entry point with only offset: bdrv_co_truncate().
Check the offset.

And one public structure: BdrvTrackedRequest. Happily, it has only
three external users:

 file-posix.c: adopted by this patch
 write-threshold.c: only read fields
 test-write-threshold.c: sets obviously small constant values

Better is to make the structure private and add corresponding
interfaces.. Still it's not obvious what kind of interface is needed
for file-posix.c. Let's keep it public but add corresponding
assertions.

After this patch we'll convert functions in block/io.c to int64_t bytes
and offset parameters. We can assume that offset/bytes pair always
satisfy new restrictions, and make
corresponding assertions where needed. If we reach some offset/bytes
point in block/io.c missing bdrv_check_request() it is considered a
bug. As well, if block/io.c modifies a offset/bytes request, expanding
it more then aligning up to request_alignment, it's a bug too.

For all io requests except for discard we keep for now old restriction
of 32bit request length.

iotest 206 output error message changed, as now test disk size is
larger than new limit. Add one more test case with new maximum disk
size to cover too-big-L1 case.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block.h        | 10 +++++++
 include/block/block_int.h    |  8 ++++++
 block.c                      | 17 +++++++++++-
 block/file-posix.c           |  6 ++---
 block/io.c                   | 51 +++++++++++++++++++++++++++++-------
 tests/test-write-threshold.c |  4 +++
 tests/qemu-iotests/206       |  2 +-
 tests/qemu-iotests/206.out   |  6 +++++
 8 files changed, 90 insertions(+), 14 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index c9d7c58765..5b81e33e94 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -142,6 +142,16 @@ typedef struct HDGeometry {
                                            INT_MAX >> BDRV_SECTOR_BITS)
 #define BDRV_REQUEST_MAX_BYTES (BDRV_REQUEST_MAX_SECTORS << BDRV_SECTOR_BITS)
 
+/*
+ * We want allow aligning requests and disk length up to any 32bit alignment
+ * and don't afraid of overflow.
+ * To achieve it, and in the same time use some pretty number as maximum disk
+ * size, let's define maximum "length" (a limit for any offset/bytes request and
+ * for disk size) to be the greatest power of 2 less than INT64_MAX.
+ */
+#define BDRV_MAX_ALIGNMENT (1L << 30)
+#define BDRV_MAX_LENGTH (QEMU_ALIGN_DOWN(INT64_MAX, BDRV_MAX_ALIGNMENT))
+
 /*
  * Allocation status flags for bdrv_block_status() and friends.
  *
diff --git a/include/block/block_int.h b/include/block/block_int.h
index 95d9333be1..1eeafc118c 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -70,6 +70,12 @@ enum BdrvTrackedRequestType {
     BDRV_TRACKED_TRUNCATE,
 };
 
+/*
+ * That is not quite good that BdrvTrackedRequest structure is public,
+ * as block/io.c is very careful about incoming offset/bytes being
+ * correct. Be sure to assert bdrv_check_request() succeeded after any
+ * modification of BdrvTrackedRequest object out of block/io.c
+ */
 typedef struct BdrvTrackedRequest {
     BlockDriverState *bs;
     int64_t offset;
@@ -87,6 +93,8 @@ typedef struct BdrvTrackedRequest {
     struct BdrvTrackedRequest *waiting_for;
 } BdrvTrackedRequest;
 
+int bdrv_check_request(int64_t offset, int64_t bytes);
+
 struct BlockDriver {
     const char *format_name;
     int instance_size;
diff --git a/block.c b/block.c
index f1cedac362..1a8494e19c 100644
--- a/block.c
+++ b/block.c
@@ -961,6 +961,11 @@ int refresh_total_sectors(BlockDriverState *bs, int64_t hint)
     }
 
     bs->total_sectors = hint;
+
+    if (bs->total_sectors * BDRV_SECTOR_SIZE > BDRV_MAX_LENGTH) {
+        return -EFBIG;
+    }
+
     return 0;
 }
 
@@ -5534,6 +5539,7 @@ void bdrv_get_backing_filename(BlockDriverState *bs,
 
 int bdrv_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
 {
+    int ret;
     BlockDriver *drv = bs->drv;
     /* if bs->drv == NULL, bs is closed, so there's nothing to do here */
     if (!drv) {
@@ -5547,7 +5553,16 @@ int bdrv_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
         return -ENOTSUP;
     }
     memset(bdi, 0, sizeof(*bdi));
-    return drv->bdrv_get_info(bs, bdi);
+    ret = drv->bdrv_get_info(bs, bdi);
+    if (ret < 0) {
+        return ret;
+    }
+
+    if (bdi->cluster_size > BDRV_MAX_ALIGNMENT) {
+        return -EINVAL;
+    }
+
+    return 0;
 }
 
 ImageInfoSpecific *bdrv_get_specific_info(BlockDriverState *bs,
diff --git a/block/file-posix.c b/block/file-posix.c
index 1b35bd6cfa..fd0a8d0dbf 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2926,7 +2926,6 @@ raw_do_pwrite_zeroes(BlockDriverState *bs, int64_t offset, int bytes,
 #ifdef CONFIG_FALLOCATE
     if (offset + bytes > bs->total_sectors * BDRV_SECTOR_SIZE) {
         BdrvTrackedRequest *req;
-        uint64_t end;
 
         /*
          * This is a workaround for a bug in the Linux XFS driver,
@@ -2950,8 +2949,9 @@ raw_do_pwrite_zeroes(BlockDriverState *bs, int64_t offset, int bytes,
         assert(req->offset <= offset);
         assert(req->offset + req->bytes >= offset + bytes);
 
-        end = INT64_MAX & -(uint64_t)bs->bl.request_alignment;
-        req->bytes = end - req->offset;
+        req->bytes = BDRV_MAX_LENGTH - req->offset;
+
+        assert(bdrv_check_request(req->offset, req->bytes) == 0);
 
         bdrv_mark_request_serialising(req, bs->bl.request_alignment);
     }
diff --git a/block/io.c b/block/io.c
index ef75a5abb4..6343d85476 100644
--- a/block/io.c
+++ b/block/io.c
@@ -176,6 +176,13 @@ void bdrv_refresh_limits(BlockDriverState *bs, Error **errp)
     /* Then let the driver override it */
     if (drv->bdrv_refresh_limits) {
         drv->bdrv_refresh_limits(bs, errp);
+        if (*errp) {
+            return;
+        }
+    }
+
+    if (bs->bl.request_alignment > BDRV_MAX_ALIGNMENT) {
+        error_setg(errp, "Driver requires too large request alignment");
     }
 }
 
@@ -884,13 +891,31 @@ static bool coroutine_fn bdrv_wait_serialising_requests(BdrvTrackedRequest *self
     return waited;
 }
 
-static int bdrv_check_byte_request(int64_t offset, size_t size)
+int bdrv_check_request(int64_t offset, int64_t bytes)
 {
-    if (size > BDRV_REQUEST_MAX_BYTES) {
+    if (offset < 0 || bytes < 0) {
         return -EIO;
     }
 
-    if (offset < 0) {
+    if (bytes > BDRV_MAX_LENGTH) {
+        return -EIO;
+    }
+
+    if (offset > BDRV_MAX_LENGTH - bytes) {
+        return -EIO;
+    }
+
+    return 0;
+}
+
+static int bdrv_check_request32(int64_t offset, int64_t bytes)
+{
+    int ret = bdrv_check_request(offset, bytes);
+    if (ret < 0) {
+        return ret;
+    }
+
+    if (bytes > BDRV_REQUEST_MAX_BYTES) {
         return -EIO;
     }
 
@@ -1641,7 +1666,7 @@ int coroutine_fn bdrv_co_preadv_part(BdrvChild *child,
         return -ENOMEDIUM;
     }
 
-    ret = bdrv_check_byte_request(offset, bytes);
+    ret = bdrv_check_request32(offset, bytes);
     if (ret < 0) {
         return ret;
     }
@@ -2057,7 +2082,7 @@ int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
         return -ENOMEDIUM;
     }
 
-    ret = bdrv_check_byte_request(offset, bytes);
+    ret = bdrv_check_request32(offset, bytes);
     if (ret < 0) {
         return ret;
     }
@@ -2787,8 +2812,9 @@ int coroutine_fn bdrv_co_pdiscard(BdrvChild *child, int64_t offset,
         return -EPERM;
     }
 
-    if (offset < 0 || bytes < 0 || bytes > INT64_MAX - offset) {
-        return -EIO;
+    ret = bdrv_check_request(offset, bytes);
+    if (ret < 0) {
+        return ret;
     }
 
     /* Do nothing if disabled.  */
@@ -3047,7 +3073,7 @@ static int coroutine_fn bdrv_co_copy_range_internal(
     if (!dst || !dst->bs || !bdrv_is_inserted(dst->bs)) {
         return -ENOMEDIUM;
     }
-    ret = bdrv_check_byte_request(dst_offset, bytes);
+    ret = bdrv_check_request32(dst_offset, bytes);
     if (ret) {
         return ret;
     }
@@ -3058,7 +3084,7 @@ static int coroutine_fn bdrv_co_copy_range_internal(
     if (!src || !src->bs || !bdrv_is_inserted(src->bs)) {
         return -ENOMEDIUM;
     }
-    ret = bdrv_check_byte_request(src_offset, bytes);
+    ret = bdrv_check_request32(src_offset, bytes);
     if (ret) {
         return ret;
     }
@@ -3188,6 +3214,13 @@ int coroutine_fn bdrv_co_truncate(BdrvChild *child, int64_t offset, bool exact,
         return -EINVAL;
     }
 
+    ret = bdrv_check_request(offset, 0);
+    if (ret < 0) {
+        error_setg(errp, "Required too big image size, it must be not greater "
+                   "than %" PRId64, BDRV_MAX_LENGTH);
+        return ret;
+    }
+
     old_size = bdrv_getlength(bs);
     if (old_size < 0) {
         error_setg_errno(errp, -old_size, "Failed to get old image size");
diff --git a/tests/test-write-threshold.c b/tests/test-write-threshold.c
index 97ca12f710..4cf032652d 100644
--- a/tests/test-write-threshold.c
+++ b/tests/test-write-threshold.c
@@ -64,6 +64,8 @@ static void test_threshold_not_trigger(void)
     req.offset = 1024;
     req.bytes = 1024;
 
+    assert(bdrv_check_request(req.offset, req.bytes) == 0);
+
     bdrv_write_threshold_set(&bs, threshold);
     amount = bdrv_write_threshold_exceeded(&bs, &req);
     g_assert_cmpuint(amount, ==, 0);
@@ -82,6 +84,8 @@ static void test_threshold_trigger(void)
     req.offset = (4 * 1024 * 1024) - 1024;
     req.bytes = 2 * 1024;
 
+    assert(bdrv_check_request(req.offset, req.bytes) == 0);
+
     bdrv_write_threshold_set(&bs, threshold);
     amount = bdrv_write_threshold_exceeded(&bs, &req);
     g_assert_cmpuint(amount, >=, 1024);
diff --git a/tests/qemu-iotests/206 b/tests/qemu-iotests/206
index 11bc51f256..021d94142e 100755
--- a/tests/qemu-iotests/206
+++ b/tests/qemu-iotests/206
@@ -201,7 +201,7 @@ with iotests.FilePath('t.qcow2') as disk_path, \
 
     vm.launch()
     for size in [ 1234, 18446744073709551104, 9223372036854775808,
-                  9223372036854775296 ]:
+                  9223372036854775296, 9223372035781033984 ]:
         vm.blockdev_create({ 'driver': imgfmt,
                              'file': 'node0',
                              'size': size })
diff --git a/tests/qemu-iotests/206.out b/tests/qemu-iotests/206.out
index a100849fcb..e8a36de00b 100644
--- a/tests/qemu-iotests/206.out
+++ b/tests/qemu-iotests/206.out
@@ -180,6 +180,12 @@ Job failed: Could not resize image: Image size cannot be negative
 
 {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"driver": "qcow2", "file": "node0", "size": 9223372036854775296}}}
 {"return": {}}
+Job failed: Could not resize image: Required too big image size, it must be not greater than 9223372035781033984
+{"execute": "job-dismiss", "arguments": {"id": "job0"}}
+{"return": {}}
+
+{"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"driver": "qcow2", "file": "node0", "size": 9223372035781033984}}}
+{"return": {}}
 Job failed: Could not resize image: Failed to grow the L1 table: File too large
 {"execute": "job-dismiss", "arguments": {"id": "job0"}}
 {"return": {}}
-- 
2.21.3


