Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB032CE1AA
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 23:31:48 +0100 (CET)
Received: from localhost ([::1]:37612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkx8d-0008Pz-5r
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 17:31:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kkx4e-000410-Jz; Thu, 03 Dec 2020 17:27:40 -0500
Received: from mail-eopbgr140112.outbound.protection.outlook.com
 ([40.107.14.112]:63621 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kkx4d-0000Cm-25; Thu, 03 Dec 2020 17:27:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nEuxZV+ooswdo60OHIfQ6128bL3R4+EKHTX44MTTvY+cJp6ebZlcEbQWGcRY4Xsw0aeHkpqQkiIdmbo90WT/6jG3kQwV15OkMRuwEPgE0ge9EdHGwEIKhzb61FK8Ane3VrtILiRGSUF8FXZ117J/mVvsdqOFO1r/NQFpgo8cbVy4zeZW4goXuylPZl/2uOtrlNsznTewsjE0PuPd1RWVPmLL6JfWMYUn9OZNcoVVnIy5FIAMF8cjjMK9sK1dM/o90VUsKXkNTiCI/3LG6iy6TNHSUitIox5/9jTB0KaZ/GuVolac1cxjtQ5YwW+BL2eK4H8gpm/egQhnkvsnN1Fi6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e+RTm6K7rXAajRCYKfSMY43BIZLjV4MHQ7Rysf8gBcY=;
 b=Fqx9HmA4dcX1svHYmo5HYQzsCJ+9sFCzEyIFIxnKPJjdW1ji77RQmHJ7gN+RkQPuMkPlBQcn8Q1dOqHFoW7sDG2EGYeraiigtNFhpVkn9k+hxQMQ6ps1ObPWpanTNC7SxnIUt+lGIgh49jxahsGsONiYFoOqvS8/eO6kmPfwgmuEc+d2kYUP5sckdiMK2o/xi0incdi5xqLQKEGT3e+JHEsGt45BWwUCS+qzIYIEXmSjZVJf5ICM38q+vLMoVghV782jXrjMNrTFaKahpaXDJi/ensSYd7+/GjJiU235IIjNLQtATqEYJxQLu1EO7wULHNJb6z2j5DRtG84ltYskeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e+RTm6K7rXAajRCYKfSMY43BIZLjV4MHQ7Rysf8gBcY=;
 b=XC2fCI8EfcsuOuwMbEPg1AhMAgONOFh1j0+qNErjJCNPzYDS4iYfQEsLP8Ju19V7AObnCZdmqpkflqOcwHtKgaTb8BB0W0Qw+7gyjs96J/HLf0hUL0lP552TojwrKsJQA8vy9bBhIHrmxVNpx06/hSRKGY5r3mFfOeMi8FFjQqM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5446.eurprd08.prod.outlook.com (2603:10a6:20b:107::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.20; Thu, 3 Dec
 2020 22:27:31 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3632.020; Thu, 3 Dec 2020
 22:27:31 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, eblake@redhat.com, berto@igalia.com,
 den@openvz.org, vsementsov@virtuozzo.com
Subject: [PATCH 3/4] block/io: bdrv_check_byte_request(): drop
 bdrv_is_inserted()
Date: Fri,  4 Dec 2020 01:27:12 +0300
Message-Id: <20201203222713.13507-4-vsementsov@virtuozzo.com>
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
 15.20.3654.7 via Frontend Transport; Thu, 3 Dec 2020 22:27:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa10edf1-0cad-40ce-2cab-08d897da9f9a
X-MS-TrafficTypeDiagnostic: AM7PR08MB5446:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB54463618DEA611497B160914C1F20@AM7PR08MB5446.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i3ipCQU0Fqs57RGzAy8oOLx/Mf3CrBV5jYfRX0OneRCm1x6itS38SDJJD0018H/Vxeqj5k0AnATfDQ/OEJML/t8Rim06gWq67pbbLukB3xo6gnay5ZfO+xhB+kgd0nQc4Gk7r0iiVl+uxgh2yrXuJxJkarth5xwx1yW0RXZ0PdKcgXnG1VYvsz6jzBVeW8Z68G1+qGH8uQ3h60PdHvXF3s1Wx38Q6BgIChZwlA5ImvfzvNpYEuCKc+9fXirS15m1NO0HKLKnGIsPbdNrjfDA+vSZHYF9PIsOGrXSrK1CowueWWI3Sb33hVlWGcn7uVjsxCwGPmHmvNTfiJuiMmtDwA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39840400004)(396003)(366004)(136003)(4326008)(2906002)(8936002)(6916009)(2616005)(36756003)(5660300002)(52116002)(6486002)(478600001)(66946007)(66556008)(66476007)(83380400001)(86362001)(1076003)(8676002)(6512007)(316002)(6506007)(6666004)(956004)(26005)(186003)(16526019)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ocMmBuYr9rwhTspPk0bAUZRUZYn/+nlRDTDLHXKmS9khPKzVS0pUSLsUJ+IH?=
 =?us-ascii?Q?9RrNXykrcPkPOrtl7zheUqE3jeJpF3l3ilzfe44eTB080/USbfT0r5v/YHvJ?=
 =?us-ascii?Q?GI1o3M35F5MjM4KbuU0fsttyuTPDVaXr4LcLmYgAUJgG3pMKOFjX2BEYvSH+?=
 =?us-ascii?Q?jYDsB9irVfahfIqVGQ0apWsKrW2DXA6wvodx4qrxnxuwYqfT0M8LXl3RChZg?=
 =?us-ascii?Q?0LWbxYCyixnR2TY+aEguIC+Zuq13WICtGmdjnU3Ow6T0KIN2pO477jg1DbeB?=
 =?us-ascii?Q?m3v8ItOjaTTLOdG1UUYMsTwgb0ocWmAxfC6jqckDxUCryvsZqlCpQlDdzyjy?=
 =?us-ascii?Q?DVCjyQQShUmKfeZC8Bvv1YQWyxHoAzvsw5naib24fZfdUuHhMYVDoortJdst?=
 =?us-ascii?Q?9NBjkjMLClfMqnpnju7m1XY0AyiBfHR5f2shk/944a74oBmbw0QNY3JX9J6f?=
 =?us-ascii?Q?lefGGHvzeoCEPvJBhHaed432mQGrraaUpP4eWsjT+cnjIAXcVU50dvlX9Ep1?=
 =?us-ascii?Q?mqN4Gh1xDgz52KEACI9dxFY8bwQNr2YrjtXsR5w9aOq1rqPci34GXiSwWtJT?=
 =?us-ascii?Q?sFFQw6lEXODCvzflNSlvgBEmidC+mHu6lIDvUcuKCU/YyIL1jRZJEM/Ivy58?=
 =?us-ascii?Q?UGHh7oTxDWDig5d1NajREPWzWb/7ZI1mxnOnGuMf42LHM/c5aAp1k2IHRuqo?=
 =?us-ascii?Q?g1KUaWASjEAzxuOsXy6z8Hr28MRFCm3XHOZNLOZnx6cW4rh2t1slRqqhnYia?=
 =?us-ascii?Q?BA+zRe76qycMLavfj7M9BXOlKYNh/V69FDCvaGCAYb7c8iEZsvLwENeQ/llX?=
 =?us-ascii?Q?m9SCYDErT8Q7+TcHSK3iovQghdY5crLAm4PrXiFVNXNQ2kInCbTYf/7mpDOh?=
 =?us-ascii?Q?fKVNcORk9NLttyudub4y8fX65UHYXUWomDVPeAUlzeoj3fe5bPOakzGVzf+A?=
 =?us-ascii?Q?E1GgsTJGMIH2cflG3Q540xXXEFNi9LuVFCtq5b9Eu1exnbtIXAT/HNn1qV9c?=
 =?us-ascii?Q?PFoG?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa10edf1-0cad-40ce-2cab-08d897da9f9a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 22:27:31.0764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LvGIFioYLEpAHt477VfmfA7JuA2GJl4iB6Ys6wFYKBoNIhGNU/uxb1tMF/oh1tnI4ehr5RTi4eI9Rj03FCN1ei4qO4swFnTyj0SB4Iav1DQ=
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

Move bdrv_is_inserted() calls into callers.

We are going to make bdrv_check_byte_request() a clean thing.
bdrv_is_inserted() is not about checking the request, it's about
checking the bs. So, it should be separate.

With this patch we probably change error path for some failure
scenarios. But depending on the fact that querying too big request on
empty cdrom (or corrupted qcow2 node with no drv) will result in EIO
and not ENOMEDIUM would be very strange. More over, we are going to
move to 64bit requests, so larger requests will be allowed anyway.

More over, keeping in mind that cdrom is the only driver that has
.bdrv_is_inserted() handler it's strange that we should care so much
about it in generic block layer, intuitively we should just do read and
write, and cdrom driver should return correct errors if it is not
inserted. But it's a work for another series.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/io.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/block/io.c b/block/io.c
index 3e91074c9f..ef75a5abb4 100644
--- a/block/io.c
+++ b/block/io.c
@@ -884,17 +884,12 @@ static bool coroutine_fn bdrv_wait_serialising_requests(BdrvTrackedRequest *self
     return waited;
 }
 
-static int bdrv_check_byte_request(BlockDriverState *bs, int64_t offset,
-                                   size_t size)
+static int bdrv_check_byte_request(int64_t offset, size_t size)
 {
     if (size > BDRV_REQUEST_MAX_BYTES) {
         return -EIO;
     }
 
-    if (!bdrv_is_inserted(bs)) {
-        return -ENOMEDIUM;
-    }
-
     if (offset < 0) {
         return -EIO;
     }
@@ -1642,7 +1637,11 @@ int coroutine_fn bdrv_co_preadv_part(BdrvChild *child,
 
     trace_bdrv_co_preadv(bs, offset, bytes, flags);
 
-    ret = bdrv_check_byte_request(bs, offset, bytes);
+    if (!bdrv_is_inserted(bs)) {
+        return -ENOMEDIUM;
+    }
+
+    ret = bdrv_check_byte_request(offset, bytes);
     if (ret < 0) {
         return ret;
     }
@@ -2054,11 +2053,11 @@ int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
 
     trace_bdrv_co_pwritev(child->bs, offset, bytes, flags);
 
-    if (!bs->drv) {
+    if (!bdrv_is_inserted(bs)) {
         return -ENOMEDIUM;
     }
 
-    ret = bdrv_check_byte_request(bs, offset, bytes);
+    ret = bdrv_check_byte_request(offset, bytes);
     if (ret < 0) {
         return ret;
     }
@@ -3045,10 +3044,10 @@ static int coroutine_fn bdrv_co_copy_range_internal(
     assert(!(read_flags & BDRV_REQ_NO_FALLBACK));
     assert(!(write_flags & BDRV_REQ_NO_FALLBACK));
 
-    if (!dst || !dst->bs) {
+    if (!dst || !dst->bs || !bdrv_is_inserted(dst->bs)) {
         return -ENOMEDIUM;
     }
-    ret = bdrv_check_byte_request(dst->bs, dst_offset, bytes);
+    ret = bdrv_check_byte_request(dst_offset, bytes);
     if (ret) {
         return ret;
     }
@@ -3056,10 +3055,10 @@ static int coroutine_fn bdrv_co_copy_range_internal(
         return bdrv_co_pwrite_zeroes(dst, dst_offset, bytes, write_flags);
     }
 
-    if (!src || !src->bs) {
+    if (!src || !src->bs || !bdrv_is_inserted(src->bs)) {
         return -ENOMEDIUM;
     }
-    ret = bdrv_check_byte_request(src->bs, src_offset, bytes);
+    ret = bdrv_check_byte_request(src_offset, bytes);
     if (ret) {
         return ret;
     }
-- 
2.21.3


