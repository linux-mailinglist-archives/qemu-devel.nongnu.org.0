Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B352D7EEF
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 19:58:26 +0100 (CET)
Received: from localhost ([::1]:37462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knncX-0002xb-Az
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 13:58:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knnKr-0006et-Jb; Fri, 11 Dec 2020 13:40:10 -0500
Received: from mail-eopbgr70090.outbound.protection.outlook.com
 ([40.107.7.90]:11267 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knnKm-00089o-J2; Fri, 11 Dec 2020 13:40:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tr+cvDGktYIaXcpk/z5+kQZkhsQvEjtD7CD/h/25nUY68A62aeJ7xp/P+vYZHKBNuQpaTmjC5g7zZ+i6fPR39ytQTVXAPnXap+Y1CARgddT1cigkt49ZwND/31nkB9qURSRVNnuwObA3g8q+LVn60vk2TQcx3w4pzc74bWl/RNA8RKdQPEvKsvHhAYIvEO+sQtdGKnRLTE6/AaMlfo/SWDx2XzxgI0LavyWp18D61E+vUiu9WKRdDzI+lmAg1dQxOd5/THSbMTT3UkTRAcwa2ROZNRE5Op24MzabqolEqU8xrd7I7bfoXgtB9KyZxkXIFVrRMIfb+YOeVCGqyFYqUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYIKvYClPzzTjHvGHqDFEVsB8VPTGFGjCi4+tLeaSow=;
 b=KeVEiqt8Fg3wGm/OTXQS0fOpVS1GWEHw71joK2E9+85pvVPrJJtQWa4g+136Kgs40sxB4fPsyyzOVlRr37C5VKyC4+AzijqeYAas4cQyCgnkzKUzGgbHSilTChRIdpwLL5isbriq7yiW+tETU1XF7uNcgef5Q4lj8ownWSK+UAuD8YdNZ45jE5tW+OIRo2aQxOuG5vGnW05uj8vHTYKZvR5DdhxsPO08yDdn6DfYVF89Tn7i6A1BIhEsixMo2deUCyGkDtx5Mz09/QX5CkLUsdB9wiBaRddU3eeUr9o0oB9Ck5NpoZ2FP5zYxAwfV5qWdtZfgpUfRFw45U/mlI82zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYIKvYClPzzTjHvGHqDFEVsB8VPTGFGjCi4+tLeaSow=;
 b=nNRovmscqD9UFFADBUQDU5fVUxN3J2zMLPJcXbR8aiVP1z20E3LBWJNuXCJPmSUhHw2iZQmn0ThtVDZvNjIDPzBrVEWDODXNkz98/j3d3fF42c6aH51dygHcvNfBxeeS20Sk5iLgwzGW+4jNqXMIIZNXiVCldwafgRJTGQTDWMU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4915.eurprd08.prod.outlook.com (2603:10a6:20b:d1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Fri, 11 Dec
 2020 18:39:52 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.016; Fri, 11 Dec 2020
 18:39:52 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 05/16] block/io: bdrv_pad_request(): support
 qemu_iovec_init_extended failure
Date: Fri, 11 Dec 2020 21:39:23 +0300
Message-Id: <20201211183934.169161-6-vsementsov@virtuozzo.com>
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
 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 18:39:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 225f46be-aec6-470e-e99d-08d89e042592
X-MS-TrafficTypeDiagnostic: AM6PR08MB4915:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB491589932C22E29095F25671C1CA0@AM6PR08MB4915.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +KfCGpM5jlDEXgRSwhk2NevL5staETsYFSpdlyXNglGPp3091siIOubMtYldAuE+AC1vuV9b/QA2ixKq63NVQ5kfIbFtO39EZW6D5wVqdY9F2Gyo+BgwL0WDMkZopLtBGdl295kTQ9tgGF9wyLM6RVCY0ALVzx/8hB3jTe2CV3vAatcXMMKFhQq81VQq2dRv8GkbfhYzzL5Iem1mQca6t0ibNluRq+EpA0JeXtf0LkSSOvlBFjDh6czXLR8k3J7Lv2ZkR6bzrM94bWAo2AtkG7NhA2HIiIujCsY4D9vFwATtT8/Ix0EjDKPYCvSqH2gbSOiE4xuwWaqOY5NZOogSHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39840400004)(136003)(396003)(376002)(66476007)(6506007)(66946007)(956004)(6486002)(86362001)(4326008)(66556008)(6916009)(6512007)(2616005)(6666004)(83380400001)(1076003)(26005)(316002)(16526019)(5660300002)(8676002)(186003)(478600001)(8936002)(2906002)(36756003)(107886003)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?G1XyYGKK5ke3jzyMwLhyaeBmuYLTMIXnvn82zCVegwHrRdF54LJPJxecSw5q?=
 =?us-ascii?Q?35Y+IZ47o2vIovyw8dkLm8TQlva+etKpHkTISa9SIpJMtIHED8JoCYxUhhjl?=
 =?us-ascii?Q?vn4C48BKZAuq0IeFGzy5DCX4JVETIiECAyktRv0IgPF1j6RhIfSRFmhE0r40?=
 =?us-ascii?Q?BfzbcBAa+aedH2J1k1RrAvKkE/L61FqhEGzs5BDhB8vJCUTqDqddps2zwSBd?=
 =?us-ascii?Q?+PBc2KE4vD3F8hfwHGsM1s9w5PJEYNvRjIWV4DVlfBum8KY4BUa0/jDeznZS?=
 =?us-ascii?Q?g2Rn3tLjHv8UPA8FoMG2uSCxJ3pgkvd7Jav4CYL9dUQ3F+geys5zAhabo/ft?=
 =?us-ascii?Q?Lrc80h3OfGF4/xW2cTN2t03KLIU11nZttZo0TghonHgECuAG/NveZmW7/7r/?=
 =?us-ascii?Q?9sNo8FTgon3mvnblBzbWCuMSe/I+ceyCUJjLzfFMIqHLEfxcqqZLRqawd9QC?=
 =?us-ascii?Q?ppndSuz8BcAXJwqgJvr7BnI0c5jRRzwvmfPg4kHBzEOzCKj+mVoO+jt29wSV?=
 =?us-ascii?Q?OA2IJYQyWZrWrHOx5seeYXlF8aeo3zqmYNM+B9Q5GjlGtT5d684Y6d3f098k?=
 =?us-ascii?Q?Sopu0iSB9ioxLiV/g4b+Vc8NSxrNuYPTmGoVj9pIiFud66htQG5zXfIo6HQy?=
 =?us-ascii?Q?ASnW4stTPDmKqqsJGdfWoeGRtUecCQergOgDkW5LiWkY3vLOnRIypvw+lgz6?=
 =?us-ascii?Q?F9OloEgAbU7n5YktQkUqyApFb5Gu/Dt9Ge3wmGugPImYJUSWkOkN5S9WRMyl?=
 =?us-ascii?Q?hj/A8H+8QcBueXAsyNAzxkDf1CpiAIAC0d5WRO0G2poRRdXnrj4LaLrpstUa?=
 =?us-ascii?Q?UeBQ46YNVZJf4ssGUMZcWXRQGjkWT/Ufd4MXvjgJobKcLZKIVaccdrEakL/U?=
 =?us-ascii?Q?K4PhNL6pFau+aGmx8bMODKUC771VU0k1cP1ZF2iU9/+NXTpqb3vYcnwEendO?=
 =?us-ascii?Q?vpbcJJuemOwOET4q0BZeqFfHLexTXm+lNwK46+VsWX7wfWgc7XoiVG1Sow48?=
 =?us-ascii?Q?m/9c?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 18:39:51.9830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 225f46be-aec6-470e-e99d-08d89e042592
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tF2VOBJy8F/14G16pr+OnjvU/Ckf/Zu7QeMdFhvcVAhF55O6ac0HNv2yGgAs5iK4ZYAR8TWGTj+WpiLVQWoNq1dzFdn59XATxbnzDGoOf6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4915
Received-SPF: pass client-ip=40.107.7.90;
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

Make bdrv_pad_request() honest: return error if
qemu_iovec_init_extended() failed.

Update also bdrv_padding_destroy() to clean the structure for safety.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/io.c | 45 +++++++++++++++++++++++++++++++--------------
 1 file changed, 31 insertions(+), 14 deletions(-)

diff --git a/block/io.c b/block/io.c
index dcfab267f8..4a057660f8 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1637,6 +1637,7 @@ static void bdrv_padding_destroy(BdrvRequestPadding *pad)
         qemu_vfree(pad->buf);
         qemu_iovec_destroy(&pad->local_qiov);
     }
+    memset(pad, 0, sizeof(*pad));
 }
 
 /*
@@ -1646,33 +1647,42 @@ static void bdrv_padding_destroy(BdrvRequestPadding *pad)
  * read of padding, bdrv_padding_rmw_read() should be called separately if
  * needed.
  *
- * All parameters except @bs are in-out: they represent original request at
- * function call and padded (if padding needed) at function finish.
- *
- * Function always succeeds.
+ * Request parameters (@qiov, &qiov_offset, &offset, &bytes) are in-out:
+ *  - on function start they represent original request
+ *  - on failure or when padding is not needed they are unchanged
+ *  - on success when padding is needed they represent padded request
  */
-static bool bdrv_pad_request(BlockDriverState *bs,
-                             QEMUIOVector **qiov, size_t *qiov_offset,
-                             int64_t *offset, unsigned int *bytes,
-                             BdrvRequestPadding *pad)
+static int bdrv_pad_request(BlockDriverState *bs,
+                            QEMUIOVector **qiov, size_t *qiov_offset,
+                            int64_t *offset, unsigned int *bytes,
+                            BdrvRequestPadding *pad, bool *padded)
 {
     int ret;
 
     if (!bdrv_init_padding(bs, *offset, *bytes, pad)) {
-        return false;
+        if (padded) {
+            *padded = false;
+        }
+        return 0;
     }
 
     ret = qemu_iovec_init_extended(&pad->local_qiov, pad->buf, pad->head,
                                    *qiov, *qiov_offset, *bytes,
                                    pad->buf + pad->buf_len - pad->tail,
                                    pad->tail);
-    assert(ret == 0);
+    if (ret < 0) {
+        bdrv_padding_destroy(pad);
+        return ret;
+    }
     *bytes += pad->head + pad->tail;
     *offset -= pad->head;
     *qiov = &pad->local_qiov;
     *qiov_offset = 0;
+    if (padded) {
+        *padded = true;
+    }
 
-    return true;
+    return 0;
 }
 
 int coroutine_fn bdrv_co_preadv(BdrvChild *child,
@@ -1722,7 +1732,11 @@ int coroutine_fn bdrv_co_preadv_part(BdrvChild *child,
         flags |= BDRV_REQ_COPY_ON_READ;
     }
 
-    bdrv_pad_request(bs, &qiov, &qiov_offset, &offset, &bytes, &pad);
+    ret = bdrv_pad_request(bs, &qiov, &qiov_offset, &offset, &bytes, &pad,
+                           NULL);
+    if (ret < 0) {
+        return ret;
+    }
 
     tracked_request_begin(&req, bs, offset, bytes, BDRV_TRACKED_READ);
     ret = bdrv_aligned_preadv(child, &req, offset, bytes,
@@ -2145,8 +2159,11 @@ int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
          * bdrv_co_do_zero_pwritev() does aligning by itself, so, we do
          * alignment only if there is no ZERO flag.
          */
-        padded = bdrv_pad_request(bs, &qiov, &qiov_offset, &offset, &bytes,
-                                  &pad);
+        ret = bdrv_pad_request(bs, &qiov, &qiov_offset, &offset, &bytes, &pad,
+                               &padded);
+        if (ret < 0) {
+            return ret;
+        }
     }
 
     bdrv_inc_in_flight(bs);
-- 
2.25.4


