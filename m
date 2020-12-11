Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 426D32D7F26
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 20:09:47 +0100 (CET)
Received: from localhost ([::1]:51548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knnnV-0000oa-U5
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 14:09:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knnL4-0006i6-Fw; Fri, 11 Dec 2020 13:40:22 -0500
Received: from mail-eopbgr70129.outbound.protection.outlook.com
 ([40.107.7.129]:29411 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knnKq-0008CX-G6; Fri, 11 Dec 2020 13:40:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jcuOr7tkEbGAXO60jT1JmwvorVnTXc7dzOsIK20HfJECFLBd06sq2Z86a5JB8hn2++2nLl/kbzHEdR9XzLI0FBsrm2KauITD5LMEuB9pkY8SbW/7q6O5C55eELLXF1r6vNAZeZJJFXmC/9BaPwa9bQvkBYo0Iq0sJXrlfXiabsM3si50O47MVyuZqUj5y6O7vLf7O38I0vhOsKdHnVcyhPOsVsyJQA+Ryk1KJCqY4F57MiRzX0cHlxnqqFsi0i1fAH6se/ip24i/I7bISQVDG/2SHqG3kptv5ieNyYNcCMZW6usjpID9DU4H32OHlEclbRiml9SGh6rvv1Fr+tKySg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8dGZEplD8X0OJSsgYRnDpaI5SaSyTCY8+npF9Wi7AQE=;
 b=hSaCvoT753r8EJf6daNvLXdwfZxDzYiTVqHo+vbzvVU+6HGZeakHJQExqEBEkQKDlpfw3R/yQUwvV79cHLy51X2/i49OxGlT3ppv/eyrkDyjYkHWzE4xfpXXLLDw6D1WYgCsaVVLFao2Gi2/+dAIdncFxEpVyIL6xGg1PK9mtCua4T2Ng/3Mkx6+I0gmn9hXQBcykNPmY+ZBR7cE6PkgtgiPdZTHOdqhDmz6UgY2nPRa2QkRjz6UYu3+kYzFAzvgxJ/O0d/88ikUyRryirAURLNpPL8Au4VHNPSD0TMUXDNfH16UQbQ0sY/b9bA+bwZAvgj4jIQTGbzBRO4trUsucg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8dGZEplD8X0OJSsgYRnDpaI5SaSyTCY8+npF9Wi7AQE=;
 b=Tg/Bpa2PQwdnm4taHPNA+Avs1dwvYMKtRdN4fv00xYu+5Qzr3BMzCZ0H6/JuY+c6OluLfOQvXx999PQoE5owruYdLHunASUlVxJ0dd0BeD0kdKuMbelUQxs7p38zrBgO7AeZjOZdchtup2MAQ8QWQ500uAA+GRLPPqU75nV5suQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4915.eurprd08.prod.outlook.com (2603:10a6:20b:d1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Fri, 11 Dec
 2020 18:39:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.016; Fri, 11 Dec 2020
 18:39:53 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 07/16] block/io: improve bdrv_check_request: check qiov too
Date: Fri, 11 Dec 2020 21:39:25 +0300
Message-Id: <20201211183934.169161-8-vsementsov@virtuozzo.com>
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
 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 18:39:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cdec300-dd75-4c76-cbaf-08d89e042682
X-MS-TrafficTypeDiagnostic: AM6PR08MB4915:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4915847EE1F8BCFC4C5B5736C1CA0@AM6PR08MB4915.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:198;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GdrA1IWAN8NDQezLy6AdCtBLGLmGiKifnapFx50Mw5ImGaJ0WbZKYwmkKQsn23N114cSwfdbqNO7UYS381F36Z5vVCn5YhfqJ6tqSj0ZuDPiPi+Ai49MwxPXsUuXPcHGewTWUMGbyPJBQtoE/WUZG4KZssIWg+rqDyvsJgRRkO/QWlz50+ulqirUlEdI3i02bZJR0gPf+1ZV/e6LDOy01w6tolPSJ5ERkhE0CYWCrWytBwcaVNUYXYuOGRzhgEUe4qoWfXthnSOqxs/kEJj31PjYJPxKQanfVQGEC60oyIb0/zlDmDSnHFy/d0bxgnpoyoav+wH9nCvvybaWaWwViw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39840400004)(136003)(396003)(376002)(66476007)(6506007)(66946007)(956004)(6486002)(86362001)(4326008)(66556008)(6916009)(6512007)(2616005)(6666004)(83380400001)(1076003)(26005)(316002)(16526019)(5660300002)(8676002)(186003)(478600001)(8936002)(2906002)(36756003)(107886003)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?HwhyHEr4QmVYSK/SfawY3L2rNpVmF3NNU7T4R7rGxuXpsalHBglESTCN+ftr?=
 =?us-ascii?Q?zQ+AhVarpKzj4oHaBssKms4x3aP26AZ7/Jlfv1eETry4jlS59KPJ+OfBhARF?=
 =?us-ascii?Q?yP68U68ujh+iFIipl7SPE0qxe1rzVVEY3kIhz2esPPBunOsQxuRsIAzV6Uhd?=
 =?us-ascii?Q?j2eEffawoTghtWVpQ8oZl7dXAj4jjHgGwAT2dz5VNGGGoV4zTqlJlhQ8KLm5?=
 =?us-ascii?Q?TkXYLTME4W+eufaCTMLcahhyZGmiLiCwFaYpazSkr0u6yGuAu6SkJX+JUhff?=
 =?us-ascii?Q?JbGR7fky38agSOWgxegWyvXZKIuDY7TjrpROY6crzDD2oFTql942rd9oUei9?=
 =?us-ascii?Q?NiY+RQeu0TpE/Mx6ZuLCZHPl3LfcBLwUY4mzRh2DaSWHOy5kol6Fm4CGBe/k?=
 =?us-ascii?Q?MD/ULeyLWJbYfBZfH8PU9nFEQa7Dhq96RNZhd416380Ci1gN1pjPcXQ3D3PP?=
 =?us-ascii?Q?yYHk2VJ6su/4K38CivZUgBBLqb/ewY6I8Al2rrpdJxQFy1iK8MyYMuvBzGls?=
 =?us-ascii?Q?k3Hm3DEG4aP3gcq5r7VflPsOAkVDS8VNke18LuPwC5e/E6PS28P+bl7m14ZL?=
 =?us-ascii?Q?rF3ceJvOXu30jwfOTt9FxGT+KvKeApImlAAzu7MwHVvYbkMQKV95+ZMaHISj?=
 =?us-ascii?Q?SYv5aeZB6b+b/YrUGYOq+ZUpIzaa88xFNCGQ96Trw/XiLV6LnWX05w699rTy?=
 =?us-ascii?Q?DOfipvK24fvsbBpI4YmbIfTHksc5NUiu9rszqzQm3PkkRlCTQe9wlZ87OS2p?=
 =?us-ascii?Q?wO1P8HhSWkWdXgBBU9YHt7iItEsMRSdU0awAruOIraeIAy6jG3PUmA9/mhIV?=
 =?us-ascii?Q?hj9KJqa1I6IS4kAq8yfsr5FCAZz+2hQPkfJj2b/GybQ2EKOKhKoeOjH89iZ6?=
 =?us-ascii?Q?YWOca3bEBJ7AbQyG5u9DOP/B7NxcnxLyKKs76d8LSPmK6//cCTQGKsFJbrIs?=
 =?us-ascii?Q?34ii0plP7Ot7O8TsRfq8qEilKCw9Kqve8ZJQ2t9N3RBbC0vIWmOBqGZ9qxSt?=
 =?us-ascii?Q?wp9C?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 18:39:53.5640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cdec300-dd75-4c76-cbaf-08d89e042682
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WZ0u+7viZz1XJ2J/tTMkJIMxGk8EkFVo0WNI1TcfnyyvicH4oRXuX/2yU16aCqRt2JXYcenkv/o+VX45sVImAf2uH+W1KgJhcpC8267q8Bo=
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

Operations with qiov add more restrictions on bytes, let's cover it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/io.c | 46 +++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 39 insertions(+), 7 deletions(-)

diff --git a/block/io.c b/block/io.c
index 4a057660f8..42e687a388 100644
--- a/block/io.c
+++ b/block/io.c
@@ -898,8 +898,14 @@ static bool coroutine_fn bdrv_wait_serialising_requests(BdrvTrackedRequest *self
     return waited;
 }
 
-int bdrv_check_request(int64_t offset, int64_t bytes, Error **errp)
+static int bdrv_check_qiov_request(int64_t offset, int64_t bytes,
+                                   QEMUIOVector *qiov, size_t qiov_offset,
+                                   Error **errp)
 {
+    /*
+     * Check generic offset/bytes correctness
+     */
+
     if (offset < 0) {
         error_setg(errp, "offset is negative: %" PRIi64, offset);
         return -EIO;
@@ -929,12 +935,38 @@ int bdrv_check_request(int64_t offset, int64_t bytes, Error **errp)
         return -EIO;
     }
 
+    if (!qiov) {
+        return 0;
+    }
+
+    /*
+     * Check qiov and qiov_offset
+     */
+
+    if (qiov_offset > qiov->size) {
+        error_setg(errp, "qiov_offset(%zu) overflow io vector size(%zu)",
+                   qiov_offset, qiov->size);
+        return -EIO;
+    }
+
+    if (bytes > qiov->size - qiov_offset) {
+        error_setg(errp, "bytes(%" PRIi64 ") + qiov_offset(%zu) overflow io "
+                   "vector size(%zu)", bytes, qiov_offset, qiov->size);
+        return -EIO;
+    }
+
     return 0;
 }
 
-static int bdrv_check_request32(int64_t offset, int64_t bytes)
+int bdrv_check_request(int64_t offset, int64_t bytes, Error **errp)
+{
+    return bdrv_check_qiov_request(offset, bytes, NULL, 0, errp);
+}
+
+static int bdrv_check_request32(int64_t offset, int64_t bytes,
+                                QEMUIOVector *qiov, size_t qiov_offset)
 {
-    int ret = bdrv_check_request(offset, bytes, NULL);
+    int ret = bdrv_check_qiov_request(offset, bytes, qiov, qiov_offset, NULL);
     if (ret < 0) {
         return ret;
     }
@@ -1708,7 +1740,7 @@ int coroutine_fn bdrv_co_preadv_part(BdrvChild *child,
         return -ENOMEDIUM;
     }
 
-    ret = bdrv_check_request32(offset, bytes);
+    ret = bdrv_check_request32(offset, bytes, qiov, qiov_offset);
     if (ret < 0) {
         return ret;
     }
@@ -2129,7 +2161,7 @@ int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
         return -ENOMEDIUM;
     }
 
-    ret = bdrv_check_request32(offset, bytes);
+    ret = bdrv_check_request32(offset, bytes, qiov, qiov_offset);
     if (ret < 0) {
         return ret;
     }
@@ -3135,7 +3167,7 @@ static int coroutine_fn bdrv_co_copy_range_internal(
     if (!dst || !dst->bs || !bdrv_is_inserted(dst->bs)) {
         return -ENOMEDIUM;
     }
-    ret = bdrv_check_request32(dst_offset, bytes);
+    ret = bdrv_check_request32(dst_offset, bytes, NULL, 0);
     if (ret) {
         return ret;
     }
@@ -3146,7 +3178,7 @@ static int coroutine_fn bdrv_co_copy_range_internal(
     if (!src || !src->bs || !bdrv_is_inserted(src->bs)) {
         return -ENOMEDIUM;
     }
-    ret = bdrv_check_request32(src_offset, bytes);
+    ret = bdrv_check_request32(src_offset, bytes, NULL, 0);
     if (ret) {
         return ret;
     }
-- 
2.25.4


