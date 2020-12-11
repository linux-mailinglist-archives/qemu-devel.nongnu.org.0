Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D372D7E7F
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 19:49:55 +0100 (CET)
Received: from localhost ([::1]:50944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knnUI-0004yW-8z
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 13:49:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knnKi-0006ZX-7P; Fri, 11 Dec 2020 13:40:00 -0500
Received: from mail-eopbgr70097.outbound.protection.outlook.com
 ([40.107.7.97]:21414 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knnKg-0008BO-52; Fri, 11 Dec 2020 13:39:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I9/XDbyRGvBWyN7jszWJpW1JvGrYxTNv21rVRFTn5RBr5Bhw+yKJW/Th+dmHmUm1CVMTBYKTMAbegxTvkG0P7kYS02bShgeJgD29YeZ0Ngh4eb1K5J3MF/ibyTCeYJiYq1YIdRTlJkULvl9V6ZOxT6qEa27P0CkfWczu26nZPAfdlM75E3CWEQmmzGkwHLHxs4Lk8DiKgTA+qfqe+EQJgPJjUZsEkyMsEV0YAtOCJf/DnVU7/naKnLiwr6b4j57YsOltFz1MWIR81gy6nX1WFynSsyiD+oouhMTn3e+gqb8PiX8JVNm9EN7irLBOcpwkev16/5I7xy11mPelRQWIZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2JpdCHTK3bZRWATwoEg6jCckd+CehiaAAyYNYOyVKMs=;
 b=YwdVl2iOC5L0tpD8YGDW8MfBZJ293gO0/32BDvA3YXHO+mXguYTsWzJ2BUH0K+hPiV/Lu/e2izAwtNpBt2p19UVWp+wMCx8KgJDane4R0jnjnSStSbCrggiXf1pNgsAqS4NDjAC5WJ37gUbhocR6ebmmQcUkVBs239/3u89de4iPDoNTdYeWvkm4YAxrWqzLxEkpaa8jgsJRVQ4VBVpIEY/G0jUJcbM7tlJ4rq2Z/RMcWDIzVCXHD3qOd0ruyxci+sazYF7P4h3/9izxHtWr75mxQnbYtL3d3HaHZw+IENB/gQ6dgY5FexSaiHeZYBwpq8d2cS619vbQb7p/9M8fXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2JpdCHTK3bZRWATwoEg6jCckd+CehiaAAyYNYOyVKMs=;
 b=TGxPy2qH4nC+LDn1XaVzJyx2SbUQRG3a0dsVCbM1zt+d53NjxtQz568auGfp+z25kCmI9i3xPIotxVXIV+c1TBY7S/G/CS8sShQJRYzSiSdJAh4NuB4BR8hoRuN0NB9IaeErljCpigOMzGx/EONOXJdKHxvwM7E+VcclHEHjRzw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4915.eurprd08.prod.outlook.com (2603:10a6:20b:d1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Fri, 11 Dec
 2020 18:39:48 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.016; Fri, 11 Dec 2020
 18:39:48 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 01/16] block: refactor bdrv_check_request: add errp
Date: Fri, 11 Dec 2020 21:39:19 +0300
Message-Id: <20201211183934.169161-2-vsementsov@virtuozzo.com>
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
 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 18:39:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4754144b-06b3-4320-9b42-08d89e04237c
X-MS-TrafficTypeDiagnostic: AM6PR08MB4915:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB49151B008325A9B628E27322C1CA0@AM6PR08MB4915.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /KZX3owjgHLX0lnv25eVYcAD5NTFbh+wz32gdcIDrHjgJ0RqrjYMq2o5AGNo8nWGQOHtInlxESSuEDJEiM5nAuE+zKVfGKyfE0UnabafRizvqAccQsrbPjdv5Tty4IiC46yCoJzNfsvwCEq5Ud1ImOm22xJuAVnpUkvpwTvIUHJUbNBd9VTFaF1vCkdG0jx34TK673p2W4tAaHCVvI2NJUVHUCUrWjBirRz0Tk8uacpmJJbSNyBSE9ts98uO5W0l9b+ZEaM0dWJRMENaT4kz3enVBB6UhFpiDf8yG1bDkpzhaJcPHKt34wZn0Pc1l+R3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39840400004)(136003)(396003)(376002)(66476007)(6506007)(66946007)(956004)(6486002)(86362001)(4326008)(66556008)(6916009)(6512007)(2616005)(6666004)(83380400001)(1076003)(26005)(316002)(16526019)(5660300002)(8676002)(186003)(478600001)(8936002)(2906002)(36756003)(107886003)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?F2UZex2+/icDGQCu19ZtpZmapg8pue8/rKdgSlf3M52IGn4XrYbJB+zwv2b8?=
 =?us-ascii?Q?Gg6YaJ3fKAD0Yb06c7MzYGG8UP/BsnCy6uM2IPPs0dYmOX2TU/4LHy4hSRxx?=
 =?us-ascii?Q?SnPXGfFB8PTepx/TnokZiZrxc72CJJ7hazpYuc2ofYCx8l9j00ekgwvkql6G?=
 =?us-ascii?Q?Q6n394lwwI4+mZ+CYsNEwDzYuakhilX24FA2pYVc8CVj3X+F7zBDjLmuiHXA?=
 =?us-ascii?Q?+ankjg5e/pMPIcIbyjlbltaDQbxVrzE2EfeXP9i9bbI5b3pQn2xH/QBhXUME?=
 =?us-ascii?Q?DR1kNRNs+Z1aORTnDI2VL7t1RrQyHn9lx9z+3NdboNp0ZPWUgNX5yvvoOTnm?=
 =?us-ascii?Q?IRYjQAaBw3aFc3KrtNycBDiJUgk9LgQcE7ZknoT3Wbnt6QGWVwdBb4XVDocQ?=
 =?us-ascii?Q?deGyWfF5cGmfaS+TpFuMaSg1Jd+jNIi3kDxh/Y+y0R8GdSjiFoJuyoxG71XC?=
 =?us-ascii?Q?9Mn5KmlZdu/OAw5EmNXpTVgSQlaPYWz09nV6oaDVfBNyVQpSviFFlHpnR6hL?=
 =?us-ascii?Q?Vx2xa4+FZ3Ahtm0RGDqAyIUJuZ1ksnRDzvPrpEmSAt2JwFPrS/62J4r7pzyR?=
 =?us-ascii?Q?rz1kRV9SwbMKimYVWQWBuyFVkGlh01XKWUt9qzYNbF5MGbo+Nz9MWPauL67s?=
 =?us-ascii?Q?PBJ/v2FFkG9zW9GR/j7H1kdP4V/vwRdSxCHqATKqENfjGsj/95UdNuGpprLB?=
 =?us-ascii?Q?v+BA+C0dRz3G3v1O9Pbpo0wulcj6dDpy32H8P+OHpVDt6lZRewzhWTLG0DGe?=
 =?us-ascii?Q?OZcEFF5RI3kIWq5S9XLXVFk3+yyUN+rGfEIL1J3kbiUx116/FKe5SaZdY8mp?=
 =?us-ascii?Q?ahGNO56WfqkT+WZtTaIv49/FSDZHdbtaW4zkY4B/lHdJwpFK2U6lt3wiTzYA?=
 =?us-ascii?Q?h8QtXe3AO9HTdjzqTi/U6PLMhcKVTBoYLBR78vxa1iqFwmqfkneZVQjXVYZQ?=
 =?us-ascii?Q?m4XPoB/DrFFXAF5/x66KvjvIfVrO/YA2gaNLH4qZy0G0rLwTXOkPQTLmJCXt?=
 =?us-ascii?Q?NUUr?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 18:39:48.3898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 4754144b-06b3-4320-9b42-08d89e04237c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FihgZj9kXTqsFr14ztEhBNpJ4gI1zbx4mB4vjodZylhHg6INfK8NqwSxCSdbkrI7XDpBr7iKetuBA/wbpl931PVfeLJjNSdbhmyPQz0fcxA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4915
Received-SPF: pass client-ip=40.107.7.97;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 berto@igalia.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's better to pass &error_abort than just assert that result is 0: on
crash, we'll immediately see the reason in the backtrace.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h    |  2 +-
 block/file-posix.c           |  2 +-
 block/io.c                   | 29 ++++++++++++++++++++++-------
 tests/test-write-threshold.c |  5 +++--
 4 files changed, 27 insertions(+), 11 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 1eeafc118c..ff29f31451 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -93,7 +93,7 @@ typedef struct BdrvTrackedRequest {
     struct BdrvTrackedRequest *waiting_for;
 } BdrvTrackedRequest;
 
-int bdrv_check_request(int64_t offset, int64_t bytes);
+int bdrv_check_request(int64_t offset, int64_t bytes, Error **errp);
 
 struct BlockDriver {
     const char *format_name;
diff --git a/block/file-posix.c b/block/file-posix.c
index 83e2cc5530..fc35a47832 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2951,7 +2951,7 @@ raw_do_pwrite_zeroes(BlockDriverState *bs, int64_t offset, int bytes,
 
         req->bytes = BDRV_MAX_LENGTH - req->offset;
 
-        assert(bdrv_check_request(req->offset, req->bytes) == 0);
+        bdrv_check_request(req->offset, req->bytes, &error_abort);
 
         bdrv_mark_request_serialising(req, bs->bl.request_alignment);
     }
diff --git a/block/io.c b/block/io.c
index 24205f5168..e076236db2 100644
--- a/block/io.c
+++ b/block/io.c
@@ -898,17 +898,34 @@ static bool coroutine_fn bdrv_wait_serialising_requests(BdrvTrackedRequest *self
     return waited;
 }
 
-int bdrv_check_request(int64_t offset, int64_t bytes)
+int bdrv_check_request(int64_t offset, int64_t bytes, Error **errp)
 {
-    if (offset < 0 || bytes < 0) {
+    if (offset < 0) {
+        error_setg(errp, "offset is negative: %" PRIi64, offset);
+        return -EIO;
+    }
+
+    if (bytes < 0) {
+        error_setg(errp, "bytes is negative: %" PRIi64, bytes);
         return -EIO;
     }
 
     if (bytes > BDRV_MAX_LENGTH) {
+        error_setg(errp, "bytes(%" PRIi64 ") exceeds maximum(%" PRIi64 ")",
+                   bytes, BDRV_MAX_LENGTH);
+        return -EIO;
+    }
+
+    if (offset > BDRV_MAX_LENGTH) {
+        error_setg(errp, "offset(%" PRIi64 ") exceeds maximum(%" PRIi64 ")",
+                   offset, BDRV_MAX_LENGTH);
         return -EIO;
     }
 
     if (offset > BDRV_MAX_LENGTH - bytes) {
+        error_setg(errp, "sum of offset(%" PRIi64 ") and bytes(%" PRIi64 ") "
+                   "exceeds maximum(%" PRIi64 ")", offset, bytes,
+                   BDRV_MAX_LENGTH);
         return -EIO;
     }
 
@@ -917,7 +934,7 @@ int bdrv_check_request(int64_t offset, int64_t bytes)
 
 static int bdrv_check_request32(int64_t offset, int64_t bytes)
 {
-    int ret = bdrv_check_request(offset, bytes);
+    int ret = bdrv_check_request(offset, bytes, NULL);
     if (ret < 0) {
         return ret;
     }
@@ -2819,7 +2836,7 @@ int coroutine_fn bdrv_co_pdiscard(BdrvChild *child, int64_t offset,
         return -EPERM;
     }
 
-    ret = bdrv_check_request(offset, bytes);
+    ret = bdrv_check_request(offset, bytes, NULL);
     if (ret < 0) {
         return ret;
     }
@@ -3221,10 +3238,8 @@ int coroutine_fn bdrv_co_truncate(BdrvChild *child, int64_t offset, bool exact,
         return -EINVAL;
     }
 
-    ret = bdrv_check_request(offset, 0);
+    ret = bdrv_check_request(offset, 0, errp);
     if (ret < 0) {
-        error_setg(errp, "Required too big image size, it must be not greater "
-                   "than %" PRId64, BDRV_MAX_LENGTH);
         return ret;
     }
 
diff --git a/tests/test-write-threshold.c b/tests/test-write-threshold.c
index 4cf032652d..fc1c45a2eb 100644
--- a/tests/test-write-threshold.c
+++ b/tests/test-write-threshold.c
@@ -7,6 +7,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/error.h"
 #include "block/block_int.h"
 #include "block/write-threshold.h"
 
@@ -64,7 +65,7 @@ static void test_threshold_not_trigger(void)
     req.offset = 1024;
     req.bytes = 1024;
 
-    assert(bdrv_check_request(req.offset, req.bytes) == 0);
+    bdrv_check_request(req.offset, req.bytes, &error_abort);
 
     bdrv_write_threshold_set(&bs, threshold);
     amount = bdrv_write_threshold_exceeded(&bs, &req);
@@ -84,7 +85,7 @@ static void test_threshold_trigger(void)
     req.offset = (4 * 1024 * 1024) - 1024;
     req.bytes = 2 * 1024;
 
-    assert(bdrv_check_request(req.offset, req.bytes) == 0);
+    bdrv_check_request(req.offset, req.bytes, &error_abort);
 
     bdrv_write_threshold_set(&bs, threshold);
     amount = bdrv_write_threshold_exceeded(&bs, &req);
-- 
2.25.4


