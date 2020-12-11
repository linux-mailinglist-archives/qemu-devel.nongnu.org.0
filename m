Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F6B2D7F53
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 20:27:54 +0100 (CET)
Received: from localhost ([::1]:43578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kno53-0001kq-7U
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 14:27:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knnLF-0006tu-Bm; Fri, 11 Dec 2020 13:40:33 -0500
Received: from mail-eopbgr70129.outbound.protection.outlook.com
 ([40.107.7.129]:29411 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knnL5-0008CX-Gn; Fri, 11 Dec 2020 13:40:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ClMUCyax+B3J3LvXylxyI/ywRt+Rx+MCvr8uM7X/O8nHbiog5K3jVeofLfBTbeelyOjYNJpVT/tct7P46MWjGCMBeMU1GHRkfoNzjW4Gb4psbFgDxmQlFnLeEMy9/VuchFpUBPvetX7TaDKQkqFJNr1SJdGKyOnKjIgMWIKO5njJrc2X/jeebKKzHJxJosQFNd5+63f6flWvqvU2Zj1hseeqmecvG9jpOTWKGtda9MR5dw0e1brnp+/DTWhAEu05fFKBbpc2iUhgXb5YQCTM4Nas0UCe/ftK5L/0yK0vMxB+C+pABTkB4saZn1gqg630QYCBkQhSd/dyzE+vPdeAjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=baEz8qBvtoc2Ph8ut100vz5LhgelwDDVy99aj0SsFDU=;
 b=ba9Xnrno/dx+c21YoYxZaxSE1TZyrEF7Cbb3cvin2bXXJ5X8uEUm6bNb/B4mmnepf2+eBC5rDtCG1Hpyac0X5MzAapkx9FlIyxghQkyhyenVm/t1rgHbh7ULI/PQianFao2opThALHkVhA6HfhAvs9jZ+KW8VipJ3g6EeHpgZDRCw8P+BPoT3zuoUtcAc+1Z4SszYDFqlI2kuNE8sLGCAFOAJlzOwH8k+FYgZNJDmGY5u1FRuj+NkzewwoyOarR1ukxHO7dnVOjc0kcWKMK+L1F/ONstFT87W6cIWrloCyxioGevy6T19nYdxmBiILxvHzM6Su+mT2YPeMeZJdHmMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=baEz8qBvtoc2Ph8ut100vz5LhgelwDDVy99aj0SsFDU=;
 b=kTO34n8DBAXApnK1H4Al4c8n8KAaSR7QZbo0PclSbQKHpzytGNKBra1/dXR5ZZkGIrXp129wu/X9btln0DuIIqL26qGyNtyqx0BsOc+vnijkij+DpKma0+GxC9Tib3o/BcZiusHirqsOmQFe4QGkmqojPht59YHnVLxLw271USQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4915.eurprd08.prod.outlook.com (2603:10a6:20b:d1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Fri, 11 Dec
 2020 18:39:56 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.016; Fri, 11 Dec 2020
 18:39:56 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 10/16] block/io: support int64_t bytes in
 bdrv_co_do_pwrite_zeroes()
Date: Fri, 11 Dec 2020 21:39:28 +0300
Message-Id: <20201211183934.169161-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201211183934.169161-1-vsementsov@virtuozzo.com>
References: <20201211183934.169161-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM0PR04CA0050.eurprd04.prod.outlook.com
 (2603:10a6:208:1::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.91) by
 AM0PR04CA0050.eurprd04.prod.outlook.com (2603:10a6:208:1::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 18:39:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af736ae9-98b0-45b0-44ec-08d89e042800
X-MS-TrafficTypeDiagnostic: AM6PR08MB4915:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB491533E8C1873D2417EA8113C1CA0@AM6PR08MB4915.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: btuWU4vmzFJE8+6UwmriNGNomOW6vDVlHlcOxRnOc3sAC8Pi5r1YXU7CjUZyjLNfAA6CHe6eyPH4+xLR+Wvd/n3ogO7RpbgvyypNjs9qpwBySl6Sv/IKulMB8M9ars3xxOqh6HDcOIxhTrcLsHKaKJSqW0jEzrnWvshdHo5+vRwiu1QpAMXb1unmzNURVNRVTT05Ocr3bGlcgv63pNRdyhK1V0QOnE+3tZuOxkyzVpy05hmS9MXrYh0Y9eAz1h5dgcMmeHtDOrnU0wotfCbxBg1LZIm5WvYuHxGcVoMWtAZBOU5mmSpr4a8ZVPzeDRnspgF/O8MyAHXThnZP5MLPjg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39840400004)(136003)(396003)(376002)(66476007)(6506007)(66946007)(956004)(6486002)(86362001)(4326008)(66556008)(6916009)(6512007)(2616005)(6666004)(83380400001)(1076003)(26005)(316002)(16526019)(5660300002)(8676002)(186003)(478600001)(8936002)(2906002)(36756003)(107886003)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Tqp9qsWa0qq0ZC5ngjGs59V+7XqZ6lcsl/t750IiU6b45OWlWPpd8HDSeS5S?=
 =?us-ascii?Q?0HRaaMVCzcnB6ITVHH66TgB0EFRpI6zqvN7gnRiGulKfCHqtuMGq+ohr6jmJ?=
 =?us-ascii?Q?+3anWw9nd8L9Dfu1LzWxkGFPmJ//T7nbWCYm6fKgrajNa25BU9786Hv9a6Jm?=
 =?us-ascii?Q?rhF0UYuFe/CtI/SCQGNutMEgn0sSssM4TWCrfWCwgOEd1LQROWS2pqsAx1qJ?=
 =?us-ascii?Q?RT1xnha9C8/1xwYDnbV08WXvjttn3lYwhEWgWucX8gl7oxcYzZFnn0r2ddTp?=
 =?us-ascii?Q?+rBUWRssARDnAU4d3wQQ9Cj7+MO5lDbUzAalMLLd5d+kO3wVcYIz20PvUIfp?=
 =?us-ascii?Q?gqIRQs3YoxEavtqMXsIOaDPwrqRwUf+ojcO3FActCGqMHPsyod6n+reDaqjD?=
 =?us-ascii?Q?ToSmwLC2mWgFpIex0PI3ojHxdQT9LuS41eG3blafq5i/eaSn7mG5voXwS2Ag?=
 =?us-ascii?Q?vA7FB/ZqxUqISiMEVJqnKPGJw8nVTFwOIKl1XPZ+pgXzIHy05ObqeOxj4Xpd?=
 =?us-ascii?Q?cE4eVZM7t3PPShLwZH5rdVfFFAqiqvwCTONSLf6QHBeBsQi93AVmyn4jRLLO?=
 =?us-ascii?Q?OonPvHZymMmI2+5KmwrTCCVg9uKgAUQdga2c3eEmTp4rHp188lrT+QnBJ5lB?=
 =?us-ascii?Q?w/3vrCSYxnzRAW1ApzD8jgTX0G04biHnJRg5y71NxpQJTJXxbi26WbEg+Ncb?=
 =?us-ascii?Q?5smpDi3zKNMePUqDaAPr8+uPKK57b4ktLf3Ps7EyARBoviQx8mClE1OpkjIa?=
 =?us-ascii?Q?e6tPWJasXFj14PDLSSqYDJsmIqBIoMsKAe6iY/ZmL6gwYqyzEIx3wpbIsgCa?=
 =?us-ascii?Q?1yJNNmpNcXrQiZlJnC2yXP3H5Ots6cdlSwAIy6gCRgG4uRJRG4wKK9QzUtuG?=
 =?us-ascii?Q?kHimmSalH3qhwe1nBNiGUtj7W/xHHCHNAFj4wAVFD7sUoe1z9ZUJ/MOIAuwI?=
 =?us-ascii?Q?65AAOOsKNKQ1pRuXjskKS4Dgs0QMAtR19fkgClkHdx5Qyax8sqNPQ+wDfvyX?=
 =?us-ascii?Q?ayvM?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 18:39:55.9904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: af736ae9-98b0-45b0-44ec-08d89e042800
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XoqmvKa58X0BKntYCBE86ZgRitdxKBdaARn4F2jpXoZxQeJTUHR1zm14qknXySXuvPFSaJxz/VvvYsV5crkhofqDet9DCRLWChbIn+BIkDA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4915
Received-SPF: pass client-ip=40.107.7.129;
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 berto@igalia.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are generally moving to int64_t for both offset and bytes parameters
on all io paths.

Main motivation is realization of 64-bit write_zeroes operation for
fast zeroing large disk chunks, up to the whole disk.

We chose signed type, to be consistent with off_t (which is signed) and
with possibility for signed return type (where negative value means
error).

So, prepare bdrv_co_do_pwrite_zeroes() now.

Callers are safe, as converting int to int64_t is safe. Concentrate on
'bytes' usage in the function (thx to Eric Blake):

    compute 'int tail' via % 'int alignment' - safe
    fragmentation loop 'int num' - still fragments with a cap on
      max_transfer

    use of 'num' within the loop
    MIN(bytes, max_transfer) as well as %alignment - still works, so
         calculations in if (head) {} are safe
    clamp size by 'int max_write_zeroes' - safe
    drv->bdrv_co_pwrite_zeroes(int) - safe because of clamping
    clamp size by 'int max_transfer' - safe
    buf allocation is still clamped to max_transfer
    qemu_iovec_init_buf(size_t) - safe because of clamping
    bdrv_driver_pwritev(uint64_t) - safe

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/io.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/block/io.c b/block/io.c
index b2bf18038b..c6a476559a 100644
--- a/block/io.c
+++ b/block/io.c
@@ -41,7 +41,7 @@
 
 static void bdrv_parent_cb_resize(BlockDriverState *bs);
 static int coroutine_fn bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
-    int64_t offset, int bytes, BdrvRequestFlags flags);
+    int64_t offset, int64_t bytes, BdrvRequestFlags flags);
 
 static void bdrv_parent_drained_begin(BlockDriverState *bs, BdrvChild *ignore,
                                       bool ignore_bds_parents)
@@ -1791,7 +1791,7 @@ int coroutine_fn bdrv_co_preadv_part(BdrvChild *child,
 }
 
 static int coroutine_fn bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
-    int64_t offset, int bytes, BdrvRequestFlags flags)
+    int64_t offset, int64_t bytes, BdrvRequestFlags flags)
 {
     BlockDriver *drv = bs->drv;
     QEMUIOVector qiov;
@@ -1806,6 +1806,8 @@ static int coroutine_fn bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
                         bs->bl.request_alignment);
     int max_transfer = MIN_NON_ZERO(bs->bl.max_transfer, MAX_BOUNCE_BUFFER);
 
+    bdrv_check_request(offset, bytes, &error_abort);
+
     if (!drv) {
         return -ENOMEDIUM;
     }
@@ -1821,7 +1823,7 @@ static int coroutine_fn bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
     assert(max_write_zeroes >= bs->bl.request_alignment);
 
     while (bytes > 0 && !ret) {
-        int num = bytes;
+        int64_t num = bytes;
 
         /* Align request.  Block drivers can expect the "bulk" of the request
          * to be aligned, and that unaligned requests do not cross cluster
-- 
2.25.4


