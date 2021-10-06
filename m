Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B3B423E92
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 15:21:10 +0200 (CEST)
Received: from localhost ([::1]:47410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY6r7-0008UH-UF
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 09:21:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mY6nq-0004ly-Nb; Wed, 06 Oct 2021 09:17:46 -0400
Received: from mail-eopbgr60121.outbound.protection.outlook.com
 ([40.107.6.121]:24830 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mY6nk-0004Ha-SA; Wed, 06 Oct 2021 09:17:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YYu35/Hqo/faSDY7UYDaF6JVPeIphZeCb3LAPLeSASY+BP/oUCb43Zsy/fmxwijrcomis19W03qbKmRPmuoFvI8sSgA22td5gkN+uCRgpPoYn29vKQ8N2OaMcODq1X49s1MOAjouPaMg8cEoTbVK9c8Zr63CZMnQiD7C/X9YCOD2WUx4AN3tv1NB5tMgbpqwzFTt+OyHiQEuUyrQHLp7XaAh9qEuulNsDPjUCjwvZKlOG8HG1QLxoflqCBaMFJP0Qh7yMvb5AYkgzuU8wkLC1UbX6ccgzYkEKFwRQdWO9wpo8iflU4H9JyA7rX3w37qLMdyXoNxEQPM3A191Zu+aow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JCKDMLMiq1PHozvTEh8SH7fYDdLdGiMH2om60/QDFsA=;
 b=DbQHlVTRJJpKo3mJPKVSGwt/JwzaguiO/qz0ukjtdmAoHAmOqbCH/jtk/AfVmRMqcuSWk2vSIjF3z+DXHfkWNGYyFEL+u6y6WgJErjrxyFThl1P/hLVMec1FrhFk338LfWE1A0egPv5egZX6mo/GxqKi10g/loWTR7g1slEHq6FrHLAeG7RxdFFP4WSLvO7E/WOGCOnCQEdyAqO+CQ5qiiwSKKyss0VnaXQDuKWRWDS6BB6BPvjTTGE5Ge2kQLAXO0hDZjOCA/j4Uxo+HjLBD6nUmrmeqIGssMGD5/Ljk3NvyEnY2fSD9pq+8CSJNb1NIpWxEtp0jQUBtHUoQpVdWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JCKDMLMiq1PHozvTEh8SH7fYDdLdGiMH2om60/QDFsA=;
 b=pKT07FR2CB9lCCbNs2iphHzG08XkpNSZZq688kczca6Eqr0vJC3I+PQfHx5ts5Sgi23RyKY13+/Po/aI/A0K8/j/iGoUf7smhuM4hOFQ1GSfPZKC77oQW3IKKWImhDvoR+/xtHm3fj24k2PuYbVWwrH6+dksHNfhJcHjie/FJOk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5910.eurprd08.prod.outlook.com (2603:10a6:20b:296::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Wed, 6 Oct
 2021 13:17:38 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%4]) with mapi id 15.20.4566.022; Wed, 6 Oct 2021
 13:17:38 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, eblake@redhat.com,
 vsementsov@virtuozzo.com, stefanha@redhat.com
Subject: [PATCH 10/12] block-backend: convert blk_aio_ functions to int64_t
 bytes paramter
Date: Wed,  6 Oct 2021 15:17:16 +0200
Message-Id: <20211006131718.214235-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211006131718.214235-1-vsementsov@virtuozzo.com>
References: <20211006131718.214235-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0296.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AS9PR06CA0296.eurprd06.prod.outlook.com (2603:10a6:20b:45a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Wed, 6 Oct 2021 13:17:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6d0c40d-c97b-4193-b5b2-08d988cbab19
X-MS-TrafficTypeDiagnostic: AS8PR08MB5910:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB591096EB4DC564DAAFE1563EC1B09@AS8PR08MB5910.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:186;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cL48iFEiuiATjJJMdBdNoMQb+qAsvzsbl+EFYH1bYwaDVnSX2tG7K0/AeBOPyXUAHqvHNPQw+0EuFsd2W2BoypmlGp1s+/U+7aQ1eEuFUj8HqvYOlE+EQksa6B8zkXx7m1LotdPL3s3RPi0GalnLCec5qfUlV/+EiW50ZMt3nWqhQ7luPpMBOqD73tcRxXQ3sZcfFKWUutWS3YLabb9HzBqxNe742+kh5CsS8t0QYPZrsNnWhUGlyBYvKPqGcgef07uM+0PIc1gF2bXLFmXzyCDPUWbogeqp3Y3UaRcJZCO7Mzo0u1+//JtNEUDfxbRP5DTP5kq5PG3vx3dLeS+Vvpwt+Wb+WC4hw32HqZzAUma9OeHUfdsz0Z9hnYD/69E5jpKCReNQpLLJL0BqzkEPA1VyynI858u2x3ARw2mRv2V6upUrxdKWoCnXjG+5mJ/r7pZKkJSMixfO5bub5wszoQsp6ITq02rlgKGLvSDWnk0WoiJe1Z3PeXYf4uvlMGnMknpv2d5LDTkafInLRacLJlcIzKxHvFUR5mS7lWtWpg9F+bYCwPCiQbkXW0hJhbx76u7PTFT8DIgdsvYdvdmmyXc3ch9rboPOoo7rkfA/OhX944vb9IFym0XXeOtQ+vb7nT6imAMTGdmaIMSEh0UGhd3fGY5hRPoDwSKF5FaFS2SjHYrokjRqfKRb+jjUNnQCJ1mHymuGiCWBWZbQeKwQ0w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(8936002)(83380400001)(86362001)(508600001)(52116002)(2616005)(956004)(66946007)(1076003)(316002)(8676002)(6486002)(36756003)(6506007)(186003)(6916009)(4326008)(6512007)(6666004)(66556008)(5660300002)(66476007)(38350700002)(38100700002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8MU+slasVADKza5LyShGF0Mvr7aGM0ISrve9j/ZVBFa9zJAxeEaVyzo0k080J4z4othtfEwp7SUKS9TYJMCaPzDYj5NQ0EZ6QEg2XygvYqSnL6sj5rSxcmCQMqToaJNcefRc2/nISmmOv3tjq+HL9T4cIjlA8cEkTGEpolCQ2f3dyDTp2N/8iufAk9nkXZ1XN0D8LIjR1V7K5U0JBO0in1go2jdXOWklw4QI0BDvBYKRq+98weENCIjiOL0b9KAY2ckc7B1va5h7ffv6yEQyky7+/3zBV22UIdHlhyB/oQY2RTBjxlC/VejitdbOVjwHJAWs5AUhm13bZD25C3awIbiDOpfL9PNcBCDE8d4+a4Qzb39ZlN6eWOxV/bIOeo17Vq8rqpGqG9a6nsigE254RnH976WiwneX339dewoeQESvvndOTx59zUKugtjlZW6KWwNFmdf91Ksh0rIr5KhSrgB6/pjU8QaOBza18bfjBir3Mw+FfnzCGm8JmEzuf8UlAbDs5dkBUUSh7HMbvGJtVKwlxisl/VSV0k7HiRsGZe25lbhlpxC8iBh8HouI3OLog/FRRPdowaAbgnUZ2GfFQaw6CR4CJOSJYLubQgJPr+OLROs+UNAyD+3FWHGXF+ptQs20oyyRCbtJMVHhMzpb84J3JC6qjUxKupDXRue7pe4Sc0fw3RnrxcuK/0ZetBAa1GNwpqfkKF9zUSxz81eaprDdBfVXY/Gc2vl/JvlTg3xzPg8Zcowr4qMJKyS0TYRJ
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6d0c40d-c97b-4193-b5b2-08d988cbab19
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 13:17:38.2482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zIBgjeCBgxuCl9yhJAsEQ53vihAtdwiTCrOzi3clUyWMEKoK3MHiLjTiHFZlwK9dxPxUW7a3U4T0NOY1ryWaTbAEXbwmYnIOZmbBf/FCF7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5910
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

1. Convert bytes in BlkAioEmAIOCB:
  aio->bytes is only passed to already int64_t interfaces, and set in
  blk_aio_prwv, which is updated here.

2. For all updated functions parameter type becomes wider so callers
   are safe.

3. In blk_aio_prwv we only store bytes to BlkAioEmAIOCB, which is
   updated here.

4. Other updated functions are wrappers on blk_aio_prwv.

Note that blk_aio_preadv and blk_aio_pwritev become safer: before this
commit, it's theoretically possible to pass qiov with size exceeding
INT_MAX, which than converted to int argument of blk_aio_prwv. Now it's
converted to int64_t which is a lot better. Still add assertions.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/sysemu/block-backend.h |  4 ++--
 block/block-backend.c          | 13 ++++++++-----
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index 134c442754..979829b325 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -157,7 +157,7 @@ static inline int coroutine_fn blk_co_pwrite(BlockBackend *blk, int64_t offset,
 int blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                       int64_t bytes, BdrvRequestFlags flags);
 BlockAIOCB *blk_aio_pwrite_zeroes(BlockBackend *blk, int64_t offset,
-                                  int bytes, BdrvRequestFlags flags,
+                                  int64_t bytes, BdrvRequestFlags flags,
                                   BlockCompletionFunc *cb, void *opaque);
 int blk_make_zero(BlockBackend *blk, BdrvRequestFlags flags);
 int blk_pread(BlockBackend *blk, int64_t offset, void *buf, int bytes);
@@ -174,7 +174,7 @@ BlockAIOCB *blk_aio_pwritev(BlockBackend *blk, int64_t offset,
                             BlockCompletionFunc *cb, void *opaque);
 BlockAIOCB *blk_aio_flush(BlockBackend *blk,
                           BlockCompletionFunc *cb, void *opaque);
-BlockAIOCB *blk_aio_pdiscard(BlockBackend *blk, int64_t offset, int bytes,
+BlockAIOCB *blk_aio_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes,
                              BlockCompletionFunc *cb, void *opaque);
 void blk_aio_cancel(BlockAIOCB *acb);
 void blk_aio_cancel_async(BlockAIOCB *acb);
diff --git a/block/block-backend.c b/block/block-backend.c
index f051ea00e9..ef0f65be4b 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1380,7 +1380,7 @@ BlockAIOCB *blk_abort_aio_request(BlockBackend *blk,
 typedef struct BlkAioEmAIOCB {
     BlockAIOCB common;
     BlkRwCo rwco;
-    int bytes;
+    int64_t bytes;
     bool has_returned;
 } BlkAioEmAIOCB;
 
@@ -1412,7 +1412,8 @@ static void blk_aio_complete_bh(void *opaque)
     blk_aio_complete(acb);
 }
 
-static BlockAIOCB *blk_aio_prwv(BlockBackend *blk, int64_t offset, int bytes,
+static BlockAIOCB *blk_aio_prwv(BlockBackend *blk, int64_t offset,
+                                int64_t bytes,
                                 void *iobuf, CoroutineEntry co_entry,
                                 BdrvRequestFlags flags,
                                 BlockCompletionFunc *cb, void *opaque)
@@ -1469,10 +1470,10 @@ static void blk_aio_write_entry(void *opaque)
 }
 
 BlockAIOCB *blk_aio_pwrite_zeroes(BlockBackend *blk, int64_t offset,
-                                  int count, BdrvRequestFlags flags,
+                                  int64_t bytes, BdrvRequestFlags flags,
                                   BlockCompletionFunc *cb, void *opaque)
 {
-    return blk_aio_prwv(blk, offset, count, NULL, blk_aio_write_entry,
+    return blk_aio_prwv(blk, offset, bytes, NULL, blk_aio_write_entry,
                         flags | BDRV_REQ_ZERO_WRITE, cb, opaque);
 }
 
@@ -1530,6 +1531,7 @@ BlockAIOCB *blk_aio_preadv(BlockBackend *blk, int64_t offset,
                            QEMUIOVector *qiov, BdrvRequestFlags flags,
                            BlockCompletionFunc *cb, void *opaque)
 {
+    assert(qiov->size <= INT64_MAX);
     return blk_aio_prwv(blk, offset, qiov->size, qiov,
                         blk_aio_read_entry, flags, cb, opaque);
 }
@@ -1538,6 +1540,7 @@ BlockAIOCB *blk_aio_pwritev(BlockBackend *blk, int64_t offset,
                             QEMUIOVector *qiov, BdrvRequestFlags flags,
                             BlockCompletionFunc *cb, void *opaque)
 {
+    assert(qiov->size <= INT64_MAX);
     return blk_aio_prwv(blk, offset, qiov->size, qiov,
                         blk_aio_write_entry, flags, cb, opaque);
 }
@@ -1618,7 +1621,7 @@ static void blk_aio_pdiscard_entry(void *opaque)
 }
 
 BlockAIOCB *blk_aio_pdiscard(BlockBackend *blk,
-                             int64_t offset, int bytes,
+                             int64_t offset, int64_t bytes,
                              BlockCompletionFunc *cb, void *opaque)
 {
     return blk_aio_prwv(blk, offset, bytes, NULL, blk_aio_pdiscard_entry, 0,
-- 
2.31.1


