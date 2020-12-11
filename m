Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE2F2D7F36
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 20:12:47 +0100 (CET)
Received: from localhost ([::1]:55720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knnqQ-0002iq-Nh
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 14:12:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knnL7-0006nE-Nh; Fri, 11 Dec 2020 13:40:25 -0500
Received: from mail-db8eur05on2131.outbound.protection.outlook.com
 ([40.107.20.131]:25696 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knnL2-0008Cr-M1; Fri, 11 Dec 2020 13:40:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oRxhvbImQze31puRz1hiEi762E3p3yyPWRijeQxZnC1JAjsUj0dMZtW3M3uy4nt3YmHNM21nub8J+gVGNwc9zTZO8CvYvIo5aSJPjiOyb8LgOcQ+9s8WzM5hWrkoOHbrabCUg1fLR2qpn/gwnnmuxynuIsqRtIGwdQhgMgPZXl62ubQgOh0MbZt1xtKmnpPCYcNmdxhxd06OAAy4byZXQXHkulQO+GQR/s+b6SBJOcXeDpjsgL3b4CPaqV+qIAxyC+Z406Sxx5KSva8LwsODlkIa/7sZQvTTVxKMw+EBFRxRuhMIKBNshydWf53JNZd3tHx2AJq5V5h2hTOeozmCog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hDrKxPkUyb2l6x5FmPWVFVz3b7HtlrBS0E2CuudV/vU=;
 b=G+pWdTAWTvFjEVwdeKDaEVBut62K8ox8mDt427MJldudvXS8dMgDkKAPwHg96PS2jfxhaYX6CyLWIFQwdzZDXaHZ9TEJ3vF7vDBK7U15Oey41OHwEybfFmCq/5C77kpqpqIHHGN2sPfm7Kal7p/fXyyMMOxw1aVPrRS5UeSSDfpp6uiEbSaA9l8faiB4bJGTO3cRrJS5Fq1h6oyUrMmzYvEdxLtYlzhKtLKuWBaUYJVS2gB1yP4jcDBR1a3GmuvF/xwJbYbMKknxRZsFqRaBfwIlgIv/QtGMjCFEw5CoJMXdPIHdIBl98ztBDutlHLt9JAMO5vMSvT7IUxLPGhxN8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hDrKxPkUyb2l6x5FmPWVFVz3b7HtlrBS0E2CuudV/vU=;
 b=L831Z3qJnRAL47V8jg3LGAqU/B/5gckWNETUkZfa6iagQbL9bJ9HINFTN5Xfyac6QCwztXDSVKBlhIA7v9nd/97xwpUQlZnb85H6hE9MoFYQcPjxpJ9PnMnM296CJJhjElSYRDAD42JnSHWKa3kQodNo4WbDpCEjE/z5gpWol7o=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1713.eurprd08.prod.outlook.com (2603:10a6:203:34::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.17; Fri, 11 Dec
 2020 18:40:01 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.016; Fri, 11 Dec 2020
 18:40:01 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 16/16] block/io: use int64_t bytes in copy_range
Date: Fri, 11 Dec 2020 21:39:34 +0300
Message-Id: <20201211183934.169161-17-vsementsov@virtuozzo.com>
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
 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 18:40:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dae95e73-e32e-401f-f5e8-08d89e042aea
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1713:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB17130568F3ABD06C4B06B015C1CA0@AM5PR0801MB1713.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EuEWYFTPdhXacSnikz+Gv+twd5ZFPXog+7xFwL3ZUFQYpXXu8MACWa2vmboVLNlZumholwg+67UnCO+VFWfCrqJ3RgPdwoNVTjEJW5UNg5CrRWrIGClEdSAck7EYO0CJL9WsaT7/XlnqTZpPwYUTKqDs6B7qRnNRIkPynznY8Fp0ReV7Vxtj60HZPXpqVCA/WBk0LRU/OKfIbgDQUU259RX+ZIngAmtrOpc/33lVyLeQ4p95z9CQSJ9vQ+MbBqg7ZM7d5xEbKBoTDuPjAR2BmHTFKyxfFa7NFLXDY0GCxNBASfE3TY+OAjRYJy80N6NKVVgjdoPlWreiqX84L8Solw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(136003)(376002)(396003)(346002)(366004)(2616005)(86362001)(956004)(107886003)(66946007)(6506007)(66476007)(6666004)(6512007)(66556008)(5660300002)(478600001)(8936002)(6486002)(52116002)(36756003)(8676002)(316002)(1076003)(6916009)(83380400001)(26005)(16526019)(2906002)(186003)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?xkvAlA4+nZt1lfbwTz8u6nC1iXGv6FhGO22ASAvNJWtyq7GYgX267xmFRm98?=
 =?us-ascii?Q?+Wj52g/+Bx/uN9hGmB3EWdr0vrsBMxuflKqjluvromKkfLPOpyQGdhYS6g/L?=
 =?us-ascii?Q?DwJtOlqQkh7Hoh+2xi7jhpOUY/qsJ3adSeyYNv9j/wfQ4LViKDVWZdyA9gvV?=
 =?us-ascii?Q?ectB5rb0cMrM6i3xzWGZYafpSOPeqblOtZzo8RcQmyWI5OsRk0fi0lzyBJTd?=
 =?us-ascii?Q?NG/zFkZ4ETBh8FGhP0nxRIVusnUg3/Hcy89YKItKmpzISf6byg7S13UimYnn?=
 =?us-ascii?Q?nU5msUd6FnLV81H8FFXbWkLxwH8pKv6VssFOBPqtyA6kCv1ixhmbeN4LNXO+?=
 =?us-ascii?Q?ghlpIBDgVNR5Qe1uOuXjkDnQ+tJnKu00PnR3MnjALFIUzNbn3dQXaAJmgPTZ?=
 =?us-ascii?Q?jJSksTQ9rw8ZR8Iimm+Q7M4bIjFrUoKs5kwquNHL1PqK+z9GykIKVHOFfpOU?=
 =?us-ascii?Q?3EjvvRjTeBIdrCvp44+mm7wNZ6Rh38tq/ASqUBSSYBSbBMjrzENrV6V6jspK?=
 =?us-ascii?Q?D7BGYCYe20hYq3+l+vZtAgTN+hjO658cX100/+Onrzvc4oMoMyl9ILg49iRe?=
 =?us-ascii?Q?JzvIlwL/vTzSQbzy4R38s67dcb7IHqEKf/A6Wa+7uZCRg9dTcHoK2FZf9mpD?=
 =?us-ascii?Q?o5grXe/9LakfcbLjMAi1XU6QgV1G3ZmJTOJvg4DVIlz5hrGNPSh4aQtFx7dq?=
 =?us-ascii?Q?12kEplf1o4p1Ebf/8vB1Wh9gOG0wWVfen/tKPLDnNsZXeQJFikB6M+HmSeQX?=
 =?us-ascii?Q?ScMsER6ROYMuGkYzy2EwuIAGin180iD8w87C9F42eot1FZYxarhA+6IcraMB?=
 =?us-ascii?Q?YcvsTWwPQZmmcMt0GutwwI5m5vWSPTuMUSkNn9WkFEYoK38dd6WHinSGmkRw?=
 =?us-ascii?Q?kO+806CMqU55j2VV8qY5J9pkgNuE/YmyUXx48DEx1SqUDWJ2I112Z78KLjHD?=
 =?us-ascii?Q?HZ5P2K6XxHQtrqCjO1ubQ9QGiEJ64OkC1Vc/ZoAQgg2c7wJCgKSbpfmHaK3S?=
 =?us-ascii?Q?9mwV?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 18:40:00.8969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: dae95e73-e32e-401f-f5e8-08d89e042aea
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yAdfo/QmNIGaKDOcHzuNYnswPixqCms0XcLlfIzW/qoXYZTNcwogL3b86i8FSiUTUBzBLwxHJmMhoOon8TzSYzGIMW7zz24RTOxbs5kQn5Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1713
Received-SPF: pass client-ip=40.107.20.131;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

So, convert now copy_range parameters which are already 64bit to signed
type.

It's safe as we don't work with requests overflowing BDRV_MAX_LENGTH
(which is less than INT64_MAX), and do check the requests in
bdrv_co_copy_range_internal() (by bdrv_check_request32(), which calls
bdrv_check_request()).

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block.h     |  6 +++---
 include/block/block_int.h | 12 ++++++------
 block/io.c                | 22 +++++++++++-----------
 block/trace-events        |  4 ++--
 4 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index 3549125f1d..88629eb3a6 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -843,8 +843,8 @@ void bdrv_unregister_buf(BlockDriverState *bs, void *host);
  *
  * Returns: 0 if succeeded; negative error code if failed.
  **/
-int coroutine_fn bdrv_co_copy_range(BdrvChild *src, uint64_t src_offset,
-                                    BdrvChild *dst, uint64_t dst_offset,
-                                    uint64_t bytes, BdrvRequestFlags read_flags,
+int coroutine_fn bdrv_co_copy_range(BdrvChild *src, int64_t src_offset,
+                                    BdrvChild *dst, int64_t dst_offset,
+                                    int64_t bytes, BdrvRequestFlags read_flags,
                                     BdrvRequestFlags write_flags);
 #endif
diff --git a/include/block/block_int.h b/include/block/block_int.h
index 5e482a8f08..cee5cb5f85 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -1343,14 +1343,14 @@ void bdrv_dec_in_flight(BlockDriverState *bs);
 
 void blockdev_close_all_bdrv_states(void);
 
-int coroutine_fn bdrv_co_copy_range_from(BdrvChild *src, uint64_t src_offset,
-                                         BdrvChild *dst, uint64_t dst_offset,
-                                         uint64_t bytes,
+int coroutine_fn bdrv_co_copy_range_from(BdrvChild *src, int64_t src_offset,
+                                         BdrvChild *dst, int64_t dst_offset,
+                                         int64_t bytes,
                                          BdrvRequestFlags read_flags,
                                          BdrvRequestFlags write_flags);
-int coroutine_fn bdrv_co_copy_range_to(BdrvChild *src, uint64_t src_offset,
-                                       BdrvChild *dst, uint64_t dst_offset,
-                                       uint64_t bytes,
+int coroutine_fn bdrv_co_copy_range_to(BdrvChild *src, int64_t src_offset,
+                                       BdrvChild *dst, int64_t dst_offset,
+                                       int64_t bytes,
                                        BdrvRequestFlags read_flags,
                                        BdrvRequestFlags write_flags);
 
diff --git a/block/io.c b/block/io.c
index 34dae81fa7..28680a1f64 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3173,8 +3173,8 @@ void bdrv_unregister_buf(BlockDriverState *bs, void *host)
 }
 
 static int coroutine_fn bdrv_co_copy_range_internal(
-        BdrvChild *src, uint64_t src_offset, BdrvChild *dst,
-        uint64_t dst_offset, uint64_t bytes,
+        BdrvChild *src, int64_t src_offset, BdrvChild *dst,
+        int64_t dst_offset, int64_t bytes,
         BdrvRequestFlags read_flags, BdrvRequestFlags write_flags,
         bool recurse_src)
 {
@@ -3252,9 +3252,9 @@ static int coroutine_fn bdrv_co_copy_range_internal(
  *
  * See the comment of bdrv_co_copy_range for the parameter and return value
  * semantics. */
-int coroutine_fn bdrv_co_copy_range_from(BdrvChild *src, uint64_t src_offset,
-                                         BdrvChild *dst, uint64_t dst_offset,
-                                         uint64_t bytes,
+int coroutine_fn bdrv_co_copy_range_from(BdrvChild *src, int64_t src_offset,
+                                         BdrvChild *dst, int64_t dst_offset,
+                                         int64_t bytes,
                                          BdrvRequestFlags read_flags,
                                          BdrvRequestFlags write_flags)
 {
@@ -3268,9 +3268,9 @@ int coroutine_fn bdrv_co_copy_range_from(BdrvChild *src, uint64_t src_offset,
  *
  * See the comment of bdrv_co_copy_range for the parameter and return value
  * semantics. */
-int coroutine_fn bdrv_co_copy_range_to(BdrvChild *src, uint64_t src_offset,
-                                       BdrvChild *dst, uint64_t dst_offset,
-                                       uint64_t bytes,
+int coroutine_fn bdrv_co_copy_range_to(BdrvChild *src, int64_t src_offset,
+                                       BdrvChild *dst, int64_t dst_offset,
+                                       int64_t bytes,
                                        BdrvRequestFlags read_flags,
                                        BdrvRequestFlags write_flags)
 {
@@ -3280,9 +3280,9 @@ int coroutine_fn bdrv_co_copy_range_to(BdrvChild *src, uint64_t src_offset,
                                        bytes, read_flags, write_flags, false);
 }
 
-int coroutine_fn bdrv_co_copy_range(BdrvChild *src, uint64_t src_offset,
-                                    BdrvChild *dst, uint64_t dst_offset,
-                                    uint64_t bytes, BdrvRequestFlags read_flags,
+int coroutine_fn bdrv_co_copy_range(BdrvChild *src, int64_t src_offset,
+                                    BdrvChild *dst, int64_t dst_offset,
+                                    int64_t bytes, BdrvRequestFlags read_flags,
                                     BdrvRequestFlags write_flags)
 {
     return bdrv_co_copy_range_from(src, src_offset,
diff --git a/block/trace-events b/block/trace-events
index a95d711ade..948df081ba 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -15,8 +15,8 @@ bdrv_co_preadv_part(void *bs, int64_t offset, int64_t bytes, unsigned int flags)
 bdrv_co_pwritev_part(void *bs, int64_t offset, int64_t bytes, unsigned int flags) "bs %p offset %" PRId64 " bytes %" PRId64 " flags 0x%x"
 bdrv_co_pwrite_zeroes(void *bs, int64_t offset, int64_t bytes, int flags) "bs %p offset %" PRId64 " bytes %" PRId64 " flags 0x%x"
 bdrv_co_do_copy_on_readv(void *bs, int64_t offset, int64_t bytes, int64_t cluster_offset, int64_t cluster_bytes) "bs %p offset %" PRId64 " bytes %" PRId64 " cluster_offset %" PRId64 " cluster_bytes %" PRId64
-bdrv_co_copy_range_from(void *src, uint64_t src_offset, void *dst, uint64_t dst_offset, uint64_t bytes, int read_flags, int write_flags) "src %p offset %"PRIu64" dst %p offset %"PRIu64" bytes %"PRIu64" rw flags 0x%x 0x%x"
-bdrv_co_copy_range_to(void *src, uint64_t src_offset, void *dst, uint64_t dst_offset, uint64_t bytes, int read_flags, int write_flags) "src %p offset %"PRIu64" dst %p offset %"PRIu64" bytes %"PRIu64" rw flags 0x%x 0x%x"
+bdrv_co_copy_range_from(void *src, int64_t src_offset, void *dst, int64_t dst_offset, int64_t bytes, int read_flags, int write_flags) "src %p offset %" PRId64 " dst %p offset %" PRId64 " bytes %" PRId64 " rw flags 0x%x 0x%x"
+bdrv_co_copy_range_to(void *src, int64_t src_offset, void *dst, int64_t dst_offset, int64_t bytes, int read_flags, int write_flags) "src %p offset %" PRId64 " dst %p offset %" PRId64 " bytes %" PRId64 " rw flags 0x%x 0x%x"
 
 # stream.c
 stream_one_iteration(void *s, int64_t offset, uint64_t bytes, int is_allocated) "s %p offset %" PRId64 " bytes %" PRIu64 " is_allocated %d"
-- 
2.25.4


