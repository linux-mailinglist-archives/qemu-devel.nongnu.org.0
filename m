Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4DD2D7EF0
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 19:58:55 +0100 (CET)
Received: from localhost ([::1]:38536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knncz-0003RU-Vq
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 13:58:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knnKz-0006gk-E0; Fri, 11 Dec 2020 13:40:21 -0500
Received: from mail-db8eur05on2131.outbound.protection.outlook.com
 ([40.107.20.131]:25696 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knnKo-0008Cr-1v; Fri, 11 Dec 2020 13:40:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gQY3rtbQ46kBNXCEvhKtz8Tf+xp2RNBhm0Lgfli94vd4TYPMqMuTuMeI1P+VLBHkOpkAR4gZfgRlsFZHPktI4c+rjP/QIEjTxDvDWPxmj1G6KaPpd7DRaBm62NnU7K9OvbKpfveXrCol7vCL2srAN8oYxExA4zsuQSGzBCxfc+LJuDAlFcC6BfrEv8NwA9smoHtXanfzmYwgf94OnF1RjfEjgXrEhJZgUKI0K0IOF6Yf5c3KRitUJRRE/gLuFWZv+z8187GkAMziFBmcJrunCQdTAbWyVS3sYLD33fRoUsmGog+rRdhf+9VOSkd54VpkgqBD06VuTmxKkJfihtFTHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8NMNhlHcsLg681LD8TQ2D8/jEwyj88ki/t33Ev8sSI=;
 b=Qrcy99L73oj5tGw4DVsRG0LkW0bCCR4m0VCNOoy4KMUynJfqnBFTrSrylWz2HS6EJddGI9SltYEZ4pY8tB//9u2cX1z+TIPLTbeMsRsLcwAUc+TLvpkUpDzEovSV1uuG9KKhkcmkaSQSJaTuUWkdE3e2iF2iV+faIJFW81H9Xl6UNV/PP5JaP6wBDnie66qe4IBzu6ebJeopUZv4TZOElA525A1AU6s4m8yzfE8wC7k6XTc01cekYTx6NihOu5kIsg9E9LuQ16Cry/3G8WIPZr2b7qsYdGrEc7FeCw9sNrOoceiuvgjDtG2PgsyC7ksFB+siz5pKc8XmCKxQNnZBjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8NMNhlHcsLg681LD8TQ2D8/jEwyj88ki/t33Ev8sSI=;
 b=msXnl3LLKbVKBbrFynkhgsDwSki4HAww+VDJkmrU82Px2rFAiGw4xtlD4qNuq4hybfE+b3qb4JTJah5orm4wNhomrgXCFP3xjn4E9pNzcoIWL93V5yJwMl2MEfe7OhfNP06YCvsxxGA4yY4XpBwRqVfe27+vqg2OVauPsD7DKiY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1713.eurprd08.prod.outlook.com (2603:10a6:203:34::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.17; Fri, 11 Dec
 2020 18:40:00 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.016; Fri, 11 Dec 2020
 18:40:00 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 15/16] block/io: support int64_t bytes in read/write
 wrappers
Date: Fri, 11 Dec 2020 21:39:33 +0300
Message-Id: <20201211183934.169161-16-vsementsov@virtuozzo.com>
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
 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 18:39:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89250667-24bd-4079-7cbe-08d89e042a72
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1713:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1713D4B35A88539E82F36046C1CA0@AM5PR0801MB1713.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:792;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oEi4GngqOcO7SdXhsCQWVekaOZr9zfru+2htffWQtRqx/5hkd5/w0pE29tztScmjyENLbPsNfCuCXXhl5P6yhPxp8yleE0VY43jJ20kyAZQouPy5PTNAhiYkta3V0CdD378Xu/R9eng7lQyDTLXqSfTh0zefvXB41U3MKHNbpVJEKlVu+V9CuUD9IymOSkuXS+kMbGQjWCcXU1CjlA57Za0Z5mb+tUPGOeqtIUVZrdLbNS4kxYDS5NeaL+U/jVwDZHHkdygz44oWGvFQyPnAGVc8AZNB0BELo4SY3DkbpuROGzy/ta9fRQo7rRM09YIf5H1K1zwlFth3VKiK5zm6Gw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(136003)(376002)(396003)(346002)(366004)(2616005)(86362001)(956004)(107886003)(66946007)(6506007)(66476007)(6666004)(6512007)(66556008)(5660300002)(478600001)(8936002)(6486002)(52116002)(36756003)(8676002)(316002)(1076003)(6916009)(83380400001)(26005)(16526019)(2906002)(186003)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?y0IJPXGqjcTK+jPgkadm/uA+m/gOENvFctkBhvxA9Mo5gXuKyDHY+H5VOxxY?=
 =?us-ascii?Q?w0yq/LmrM46HXRs8s2cq0LRBOzsXDJzKAHLVA9a8tFuhTUQss4dgk2Vp8QHJ?=
 =?us-ascii?Q?gUOyPlu3ziN20byojB4U1L9pkG0W6WNNniVqH+o07zfJpnQymKtMj84inEb9?=
 =?us-ascii?Q?5tihyaoD1go6dNTtYru1qswzLgiT8QQr07/Lcp0Bwt8y7n8HeJ8R8DEKRsoA?=
 =?us-ascii?Q?ZQn2PjwmrbSOWSpOpgHKWkHzhGdPXu+59oNRNwcStZ+f9uJtNqOilBNdLSkC?=
 =?us-ascii?Q?yNTSQeFaLUBSOddmqMs4j27G7Yod4s7ccWtZJbHb7SiihonX4hX7Df7XRkFo?=
 =?us-ascii?Q?hyuUPRVvUrIer/DfQzdDh++I3JXQs9g1ZkClv3oISgWkmr4UgUlv5eHOpYwU?=
 =?us-ascii?Q?Gb138V0wI7hUsSICCkgmRvn8Tumrr/DHZ9wtD7KuPH6+G8Q4EEshg05wukG+?=
 =?us-ascii?Q?zC2oR1rjccsYyjOTOkOZAnLeo9VTiypT50BIaEbm13+SbBxDnBpSFtywzPAZ?=
 =?us-ascii?Q?zQmNOo5Mo9wGzZKNi7VeBR+G01AKFDqXq32fxYbk6nWwpc2zkJDgNiEiQAbq?=
 =?us-ascii?Q?xPRhRCsW+z+NlRTv/P1akSR92ci53GQ+0q+LsfPIlfMYEpqtUY157ACtdRYz?=
 =?us-ascii?Q?eKufu8bGCkPGgC7U0VjsPVFOleOOjk0AfXPs74/vLr00GF47tI44vaNaLyUO?=
 =?us-ascii?Q?hvXff3Ct/wYYhyq68c6e5hbLG+x6M1EI/9IXB3wvGZJLwfusC5owL1uggL5m?=
 =?us-ascii?Q?xjCCg3XFoYvnAk/PJuu0ZzoPg2V4Y2AqZVG6y92PR1M5lsrZd8jWhNFIJtoJ?=
 =?us-ascii?Q?y6MI+B1LcP5ENM2LlVY3c2CRiYcYJYRiCSoSuBYFgTXSWODSqV2JGY7PCXeq?=
 =?us-ascii?Q?EXXHLU8bDPnzY8ZeEvaymzuW7VB34a7Fyog6fbl3T2j5GeRQP+AyysJZg0BM?=
 =?us-ascii?Q?Kt2+yQsRROqVAxFH5OIZQL7EJUunfwCG8ePcbpOnLh0rvUGKqsReLbMK0cb6?=
 =?us-ascii?Q?3dp9?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 18:40:00.0804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 89250667-24bd-4079-7cbe-08d89e042a72
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6F5T0vjf6eqGMUO0Yk1q7N66MkZ8iRvWIiCkxPJVPCP5eykJaxgk811kBGzCBmDZYGSeLPIXxOVcomY4ISKyma9R0mwDlxXEWSGGNrMiUtU=
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

Now, when bdrv_co_preadv_part() and bdrv_co_pwritev_part() updated,
update all their wrappers.

For all of them type of 'bytes' is widening, so callers are safe. We
have update request_fn in blkverify.c simultaneusly. Still it's just a
pointer to on of bdrv_co_pwritev() or bdrv_co_preadv(), and type is
widening for callers of the request_fn anyway.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block.h     | 11 ++++++-----
 include/block/block_int.h |  4 ++--
 block/blkverify.c         |  2 +-
 block/io.c                | 15 ++++++++-------
 block/trace-events        |  2 +-
 5 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index 5b81e33e94..3549125f1d 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -390,12 +390,13 @@ int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
 void bdrv_reopen_commit(BDRVReopenState *reopen_state);
 void bdrv_reopen_abort(BDRVReopenState *reopen_state);
 int bdrv_pwrite_zeroes(BdrvChild *child, int64_t offset,
-                       int bytes, BdrvRequestFlags flags);
+                       int64_t bytes, BdrvRequestFlags flags);
 int bdrv_make_zero(BdrvChild *child, BdrvRequestFlags flags);
-int bdrv_pread(BdrvChild *child, int64_t offset, void *buf, int bytes);
-int bdrv_pwrite(BdrvChild *child, int64_t offset, const void *buf, int bytes);
+int bdrv_pread(BdrvChild *child, int64_t offset, void *buf, int64_t bytes);
+int bdrv_pwrite(BdrvChild *child, int64_t offset, const void *buf,
+                int64_t bytes);
 int bdrv_pwrite_sync(BdrvChild *child, int64_t offset,
-                     const void *buf, int count);
+                     const void *buf, int64_t bytes);
 /*
  * Efficiently zero a region of the disk image.  Note that this is a regular
  * I/O request like read or write and should have a reasonable size.  This
@@ -403,7 +404,7 @@ int bdrv_pwrite_sync(BdrvChild *child, int64_t offset,
  * because it may allocate memory for the entire region.
  */
 int coroutine_fn bdrv_co_pwrite_zeroes(BdrvChild *child, int64_t offset,
-                                       int bytes, BdrvRequestFlags flags);
+                                       int64_t bytes, BdrvRequestFlags flags);
 BlockDriverState *bdrv_find_backing_image(BlockDriverState *bs,
     const char *backing_file);
 void bdrv_refresh_filename(BlockDriverState *bs);
diff --git a/include/block/block_int.h b/include/block/block_int.h
index 55b1039872..5e482a8f08 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -1028,13 +1028,13 @@ extern BlockDriver bdrv_raw;
 extern BlockDriver bdrv_qcow2;
 
 int coroutine_fn bdrv_co_preadv(BdrvChild *child,
-    int64_t offset, unsigned int bytes, QEMUIOVector *qiov,
+    int64_t offset, int64_t bytes, QEMUIOVector *qiov,
     BdrvRequestFlags flags);
 int coroutine_fn bdrv_co_preadv_part(BdrvChild *child,
     int64_t offset, int64_t bytes,
     QEMUIOVector *qiov, size_t qiov_offset, BdrvRequestFlags flags);
 int coroutine_fn bdrv_co_pwritev(BdrvChild *child,
-    int64_t offset, unsigned int bytes, QEMUIOVector *qiov,
+    int64_t offset, int64_t bytes, QEMUIOVector *qiov,
     BdrvRequestFlags flags);
 int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
     int64_t offset, int64_t bytes,
diff --git a/block/blkverify.c b/block/blkverify.c
index 4aed53ab59..943e62be9c 100644
--- a/block/blkverify.c
+++ b/block/blkverify.c
@@ -31,7 +31,7 @@ typedef struct BlkverifyRequest {
     uint64_t bytes;
     int flags;
 
-    int (*request_fn)(BdrvChild *, int64_t, unsigned int, QEMUIOVector *,
+    int (*request_fn)(BdrvChild *, int64_t, int64_t, QEMUIOVector *,
                       BdrvRequestFlags);
 
     int ret;                    /* test image result */
diff --git a/block/io.c b/block/io.c
index 5200658224..34dae81fa7 100644
--- a/block/io.c
+++ b/block/io.c
@@ -983,7 +983,7 @@ static int bdrv_check_request32(int64_t offset, int64_t bytes,
 }
 
 int bdrv_pwrite_zeroes(BdrvChild *child, int64_t offset,
-                       int bytes, BdrvRequestFlags flags)
+                       int64_t bytes, BdrvRequestFlags flags)
 {
     return bdrv_pwritev(child, offset, bytes, NULL,
                         BDRV_REQ_ZERO_WRITE | flags);
@@ -1031,7 +1031,7 @@ int bdrv_make_zero(BdrvChild *child, BdrvRequestFlags flags)
 }
 
 /* See bdrv_pwrite() for the return codes */
-int bdrv_pread(BdrvChild *child, int64_t offset, void *buf, int bytes)
+int bdrv_pread(BdrvChild *child, int64_t offset, void *buf, int64_t bytes)
 {
     int ret;
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
@@ -1051,7 +1051,8 @@ int bdrv_pread(BdrvChild *child, int64_t offset, void *buf, int bytes)
   -EINVAL      Invalid offset or number of bytes
   -EACCES      Trying to write a read-only device
 */
-int bdrv_pwrite(BdrvChild *child, int64_t offset, const void *buf, int bytes)
+int bdrv_pwrite(BdrvChild *child, int64_t offset, const void *buf,
+                int64_t bytes)
 {
     int ret;
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
@@ -1072,7 +1073,7 @@ int bdrv_pwrite(BdrvChild *child, int64_t offset, const void *buf, int bytes)
  * Returns 0 on success, -errno in error cases.
  */
 int bdrv_pwrite_sync(BdrvChild *child, int64_t offset,
-                     const void *buf, int count)
+                     const void *buf, int64_t count)
 {
     int ret;
 
@@ -1731,7 +1732,7 @@ static int bdrv_pad_request(BlockDriverState *bs,
 }
 
 int coroutine_fn bdrv_co_preadv(BdrvChild *child,
-    int64_t offset, unsigned int bytes, QEMUIOVector *qiov,
+    int64_t offset, int64_t bytes, QEMUIOVector *qiov,
     BdrvRequestFlags flags)
 {
     return bdrv_co_preadv_part(child, offset, bytes, qiov, 0, flags);
@@ -2158,7 +2159,7 @@ out:
  * Handle a write request in coroutine context
  */
 int coroutine_fn bdrv_co_pwritev(BdrvChild *child,
-    int64_t offset, unsigned int bytes, QEMUIOVector *qiov,
+    int64_t offset, int64_t bytes, QEMUIOVector *qiov,
     BdrvRequestFlags flags)
 {
     return bdrv_co_pwritev_part(child, offset, bytes, qiov, 0, flags);
@@ -2251,7 +2252,7 @@ out:
 }
 
 int coroutine_fn bdrv_co_pwrite_zeroes(BdrvChild *child, int64_t offset,
-                                       int bytes, BdrvRequestFlags flags)
+                                       int64_t bytes, BdrvRequestFlags flags)
 {
     trace_bdrv_co_pwrite_zeroes(child->bs, offset, bytes, flags);
 
diff --git a/block/trace-events b/block/trace-events
index 91a0f70575..a95d711ade 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -13,7 +13,7 @@ blk_root_detach(void *child, void *blk, void *bs) "child %p blk %p bs %p"
 # io.c
 bdrv_co_preadv_part(void *bs, int64_t offset, int64_t bytes, unsigned int flags) "bs %p offset %" PRId64 " bytes %" PRId64 " flags 0x%x"
 bdrv_co_pwritev_part(void *bs, int64_t offset, int64_t bytes, unsigned int flags) "bs %p offset %" PRId64 " bytes %" PRId64 " flags 0x%x"
-bdrv_co_pwrite_zeroes(void *bs, int64_t offset, int count, int flags) "bs %p offset %"PRId64" count %d flags 0x%x"
+bdrv_co_pwrite_zeroes(void *bs, int64_t offset, int64_t bytes, int flags) "bs %p offset %" PRId64 " bytes %" PRId64 " flags 0x%x"
 bdrv_co_do_copy_on_readv(void *bs, int64_t offset, int64_t bytes, int64_t cluster_offset, int64_t cluster_bytes) "bs %p offset %" PRId64 " bytes %" PRId64 " cluster_offset %" PRId64 " cluster_bytes %" PRId64
 bdrv_co_copy_range_from(void *src, uint64_t src_offset, void *dst, uint64_t dst_offset, uint64_t bytes, int read_flags, int write_flags) "src %p offset %"PRIu64" dst %p offset %"PRIu64" bytes %"PRIu64" rw flags 0x%x 0x%x"
 bdrv_co_copy_range_to(void *src, uint64_t src_offset, void *dst, uint64_t dst_offset, uint64_t bytes, int read_flags, int write_flags) "src %p offset %"PRIu64" dst %p offset %"PRIu64" bytes %"PRIu64" rw flags 0x%x 0x%x"
-- 
2.25.4


