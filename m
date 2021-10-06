Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2D3423F29
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 15:29:06 +0200 (CEST)
Received: from localhost ([::1]:41114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY6yn-0006R5-37
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 09:29:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mY6o3-00053B-2p; Wed, 06 Oct 2021 09:18:00 -0400
Received: from mail-eopbgr50102.outbound.protection.outlook.com
 ([40.107.5.102]:17182 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mY6nz-0004EY-BG; Wed, 06 Oct 2021 09:17:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gerULXRv/FCWPvTlBYWfavQJ7EFSsZnEn8101HvoQjtT4PR17OlgFABpW98bx8stLjD3ihK2U2RpdnTLJ5n1uEB3QWaGgi75Sn6MhvRbYlCnfmmJWose4gktP0svJd01Yem/QQ0IjIwV4wNhMKkDGNrIZvI1y0Hdl5t2JevfIuKWumiBJoqZGuGSXkgVIlkf0CajVJvbDK7c+tm293uMzYnhVHk1sgYIUi3jSoEpy3hKz5ZwpliDq+D3kwR+WFopATYb4jARfxjjRTCMC2iLODBPNzQ+ZOz2TLHE+dRuOxBARJTXUb0rQJ8oQl0iO+shvql/T+iiQ0YEN7BKlCuBQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQSEtqKUI3OSCkEw9uGEWsVgKq+9/d6HH7FR8F4bKW0=;
 b=DgDEc0V6bhQiDgushxLNb8jY2tL7yg3rrsq3vnOOlid7E7L51hxwUKhgngrt4bKUbOUyDmjmvcPBS+cNrnlI+EP4lB7xR8c2W1hKb2zQorBE9meHRHwOXONjgoQ6wOwn7TFdqx5GYjPqpp1cA/YpB090k94wjj20ApSiWy1yRBkXiSjGDFYpxjjQzhy5QU3hN8i5MUP0IjT4OUKQB8TdAY11A6G3oYcGPdBk2qw20xDsf462aUzyQqm0fYF3ACrIHY2waOu1kDOAyb8hnlu6USl1tRo/7MMS8cAAgki9RqmYfqIHIGsyr+3FwehHsGTjaenRh9w6AgWBRqfxDDCtrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQSEtqKUI3OSCkEw9uGEWsVgKq+9/d6HH7FR8F4bKW0=;
 b=nZfL0xfIwu1nxbGPcezoeXfmXAMB/P4e8boboepJs3L5xMNyVE9CDvFvj/lJKumtn5JOn25YqETLX5cgtnPR1K4YuxpMCJR8LN8jsP9wnZsCnWehu66zOM82gfCc2ccNLaZzrXAlzWNEV+M9dqz66FV01xs5wJn4dFaWV04SqtM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB2981.eurprd08.prod.outlook.com (2603:10a6:209:44::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Wed, 6 Oct
 2021 13:17:35 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%4]) with mapi id 15.20.4566.022; Wed, 6 Oct 2021
 13:17:35 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, eblake@redhat.com,
 vsementsov@virtuozzo.com, stefanha@redhat.com
Subject: [PATCH 05/12] block-backend: rename _do_ helper functions to _co_do_
Date: Wed,  6 Oct 2021 15:17:11 +0200
Message-Id: <20211006131718.214235-6-vsementsov@virtuozzo.com>
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
 Transport; Wed, 6 Oct 2021 13:17:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ab28fbc-ee7a-4021-a710-08d988cba93e
X-MS-TrafficTypeDiagnostic: AM6PR08MB2981:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB2981B6B4E7105DD1AA851DA7C1B09@AM6PR08MB2981.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:336;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l1iQtH50SkQJe++MYVKWA4ZspHaM/TGPuTpwCFW+c+ITT3ywlOqR2J1/cMEmTMVEAcDxnI/N3JXrWf7jrkE/jFGrb7aTzspjzN3VgkbbHDXHQW0OHpZIqawG26maA+8Q1yFzHjY+A5dFrN7TvWrKVvCgnLPuLC+c/Vf6ddD+P3JY6er/dbUFHXn35ES9aVViZXFtULhw5au8VEo4poWj7FdUmpuwGsrDslCJko/OJiKQbTniw2pU8WSqBF4u7wx0Tj9M+d/ey3f5cXclLRCZYaSyVufH/oWF+AA24ZHqEIfcB/yRBZjrx9IuWBYbZKw6UbMwX7/qpSZwZ+UFe6hxJESfJ8Ie4qd0WABry5JBT3nO1UMOyYctRxBuVYRDkicOFPZ1YWzuUbf+7ND46HuQTGevSeke6HKLnSOVJ4+i30b0SbVe04UQQrAgBhwIAhgQzZQlTH12e+xgp/5LA3MQ9wAb16+1q6jxHzCXAlmDS61EQkg5SNj8bRTwVktxrnQ/6FhASAFZS+A6HDAjHrUkGR2co68rFdl/foLk0KVfrfmZH7r+VZEmASWMpqfsLZpIG+K60hSQT76eYHfYClHDqXHmxyQJdiFqVzZLMeNch+LVDyuGuv6frBlyrARn5OWa7rrdD9/1UhTuQfuL54fRjn6yJmNqnjUlBKN6BteoXGhGwe3Yw1YwKR+xONYj3dhhNIri6LcZzV8dcmPoCrfyCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(2906002)(36756003)(6512007)(6666004)(83380400001)(38100700002)(38350700002)(1076003)(6486002)(508600001)(316002)(86362001)(6506007)(6916009)(26005)(52116002)(66556008)(66476007)(66946007)(5660300002)(186003)(8676002)(956004)(8936002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: zVrvo0wiH4uWDb/q3y5YBWEhZWB00i63Aekj3AECsYFgkYjztt0LBc62Dk9YLWa0FJlbapA/KI3J0ovkiBG6zZH8NoKRFqOmtR3x1EK5H19PIMfNL2NMjJG9WcgyFIsT1vEGEMYsXQTYesJ0Z13ev5+iq6302/cg71nF/jV1OGE8xDm6HQlupy7Cb6+FVkk92X6BPZsiJ5ElZ8mZ0ze/m1Xbb4IkDsTdm6orAntdOYEx5u8lbHJfEo5DQ3uI9ExHs7szIpvYl8EHMBLtp8J/zLXbjqc1amqTdjEh/HT5701ML4n1xJmfQUyTb2AvmKHDuXYolbVVAyHr/NxkYWI6PZEb1O/BKQKGONnB+NDQMMvJo4eqWeQfx6wsYe2NxzYFpHwgjKOkoW9gRSO0/jslC+kBOJU6ouHlJn+/vbvH4WC2mPXbricEVebIyl7565SDnC439avPqsldd4QlS3nVc26XUMk9AsIo9XIZRrmEBcYvcjTRRHy4ZvdNneTR6+KswFRxWgh91DnQNDck+o067ZOIvhjukD2gynTf3l+CY3j3F8DTmSMpTv0KIXK1aH58wxBkzt1cbQTf4/bxKrP2AkMkW+38gw9F+rLB4COpDiyqiqsq5hQxIsJN882eF8kA7KsnR5K3Lll2ggk/lc6WgF1AWNydJy3Mky0Is+7Kxf99jQeyphGKhRJuSl/JfyfRmtwVv+9GQGDvfdHgkKvvSeqocdoL0krpqBd8wd6gw2kv0lz5yfTQ+ZCWLsb6DWhU
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ab28fbc-ee7a-4021-a710-08d988cba93e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 13:17:35.2832 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XZAR/MBWJOZjCveDsPZmbH/wpODDtvi8bY6LoEb+FoBe9uFBxi1PNVvI9b8+1ayNPSCJe5qtSJB4Asg5ZeehnJOkeX2eCyAIXThNn95tIrk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2981
Received-SPF: pass client-ip=40.107.5.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

This is a preparation to the following commit, to use automatic
coroutine wrapper generation.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/block-backend.c | 52 +++++++++++++++++++++----------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index e408893985..8100d65b43 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1205,8 +1205,8 @@ static void coroutine_fn blk_wait_while_drained(BlockBackend *blk)
 
 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
 static int coroutine_fn
-blk_do_preadv(BlockBackend *blk, int64_t offset, int64_t bytes,
-              QEMUIOVector *qiov, BdrvRequestFlags flags)
+blk_co_do_preadv(BlockBackend *blk, int64_t offset, int64_t bytes,
+                 QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     int ret;
     BlockDriverState *bs;
@@ -1242,7 +1242,7 @@ int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
     int ret;
 
     blk_inc_in_flight(blk);
-    ret = blk_do_preadv(blk, offset, bytes, qiov, flags);
+    ret = blk_co_do_preadv(blk, offset, bytes, qiov, flags);
     blk_dec_in_flight(blk);
 
     return ret;
@@ -1250,9 +1250,9 @@ int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
 
 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
 static int coroutine_fn
-blk_do_pwritev_part(BlockBackend *blk, int64_t offset, int64_t bytes,
-                    QEMUIOVector *qiov, size_t qiov_offset,
-                    BdrvRequestFlags flags)
+blk_co_do_pwritev_part(BlockBackend *blk, int64_t offset, int64_t bytes,
+                       QEMUIOVector *qiov, size_t qiov_offset,
+                       BdrvRequestFlags flags)
 {
     int ret;
     BlockDriverState *bs;
@@ -1293,7 +1293,7 @@ int coroutine_fn blk_co_pwritev_part(BlockBackend *blk, int64_t offset,
     int ret;
 
     blk_inc_in_flight(blk);
-    ret = blk_do_pwritev_part(blk, offset, bytes, qiov, qiov_offset, flags);
+    ret = blk_co_do_pwritev_part(blk, offset, bytes, qiov, qiov_offset, flags);
     blk_dec_in_flight(blk);
 
     return ret;
@@ -1319,8 +1319,8 @@ static void blk_read_entry(void *opaque)
     BlkRwCo *rwco = opaque;
     QEMUIOVector *qiov = rwco->iobuf;
 
-    rwco->ret = blk_do_preadv(rwco->blk, rwco->offset, qiov->size,
-                              qiov, rwco->flags);
+    rwco->ret = blk_co_do_preadv(rwco->blk, rwco->offset, qiov->size,
+                                 qiov, rwco->flags);
     aio_wait_kick();
 }
 
@@ -1329,8 +1329,8 @@ static void blk_write_entry(void *opaque)
     BlkRwCo *rwco = opaque;
     QEMUIOVector *qiov = rwco->iobuf;
 
-    rwco->ret = blk_do_pwritev_part(rwco->blk, rwco->offset, qiov->size,
-                                    qiov, 0, rwco->flags);
+    rwco->ret = blk_co_do_pwritev_part(rwco->blk, rwco->offset, qiov->size,
+                                       qiov, 0, rwco->flags);
     aio_wait_kick();
 }
 
@@ -1483,8 +1483,8 @@ static void blk_aio_read_entry(void *opaque)
     QEMUIOVector *qiov = rwco->iobuf;
 
     assert(qiov->size == acb->bytes);
-    rwco->ret = blk_do_preadv(rwco->blk, rwco->offset, acb->bytes,
-                              qiov, rwco->flags);
+    rwco->ret = blk_co_do_preadv(rwco->blk, rwco->offset, acb->bytes,
+                                 qiov, rwco->flags);
     blk_aio_complete(acb);
 }
 
@@ -1495,8 +1495,8 @@ static void blk_aio_write_entry(void *opaque)
     QEMUIOVector *qiov = rwco->iobuf;
 
     assert(!qiov || qiov->size == acb->bytes);
-    rwco->ret = blk_do_pwritev_part(rwco->blk, rwco->offset, acb->bytes,
-                                    qiov, 0, rwco->flags);
+    rwco->ret = blk_co_do_pwritev_part(rwco->blk, rwco->offset, acb->bytes,
+                                       qiov, 0, rwco->flags);
     blk_aio_complete(acb);
 }
 
@@ -1583,7 +1583,7 @@ void blk_aio_cancel_async(BlockAIOCB *acb)
 
 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
 static int coroutine_fn
-blk_do_ioctl(BlockBackend *blk, unsigned long int req, void *buf)
+blk_co_do_ioctl(BlockBackend *blk, unsigned long int req, void *buf)
 {
     blk_wait_while_drained(blk);
 
@@ -1599,7 +1599,7 @@ static void blk_ioctl_entry(void *opaque)
     BlkRwCo *rwco = opaque;
     QEMUIOVector *qiov = rwco->iobuf;
 
-    rwco->ret = blk_do_ioctl(rwco->blk, rwco->offset, qiov->iov[0].iov_base);
+    rwco->ret = blk_co_do_ioctl(rwco->blk, rwco->offset, qiov->iov[0].iov_base);
     aio_wait_kick();
 }
 
@@ -1613,7 +1613,7 @@ static void blk_aio_ioctl_entry(void *opaque)
     BlkAioEmAIOCB *acb = opaque;
     BlkRwCo *rwco = &acb->rwco;
 
-    rwco->ret = blk_do_ioctl(rwco->blk, rwco->offset, rwco->iobuf);
+    rwco->ret = blk_co_do_ioctl(rwco->blk, rwco->offset, rwco->iobuf);
 
     blk_aio_complete(acb);
 }
@@ -1626,7 +1626,7 @@ BlockAIOCB *blk_aio_ioctl(BlockBackend *blk, unsigned long int req, void *buf,
 
 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
 static int coroutine_fn
-blk_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes)
+blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes)
 {
     int ret;
 
@@ -1645,7 +1645,7 @@ static void blk_aio_pdiscard_entry(void *opaque)
     BlkAioEmAIOCB *acb = opaque;
     BlkRwCo *rwco = &acb->rwco;
 
-    rwco->ret = blk_do_pdiscard(rwco->blk, rwco->offset, acb->bytes);
+    rwco->ret = blk_co_do_pdiscard(rwco->blk, rwco->offset, acb->bytes);
     blk_aio_complete(acb);
 }
 
@@ -1663,7 +1663,7 @@ int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
     int ret;
 
     blk_inc_in_flight(blk);
-    ret = blk_do_pdiscard(blk, offset, bytes);
+    ret = blk_co_do_pdiscard(blk, offset, bytes);
     blk_dec_in_flight(blk);
 
     return ret;
@@ -1674,7 +1674,7 @@ static void blk_pdiscard_entry(void *opaque)
     BlkRwCo *rwco = opaque;
     QEMUIOVector *qiov = rwco->iobuf;
 
-    rwco->ret = blk_do_pdiscard(rwco->blk, rwco->offset, qiov->size);
+    rwco->ret = blk_co_do_pdiscard(rwco->blk, rwco->offset, qiov->size);
     aio_wait_kick();
 }
 
@@ -1684,7 +1684,7 @@ int blk_pdiscard(BlockBackend *blk, int64_t offset, int bytes)
 }
 
 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
-static int coroutine_fn blk_do_flush(BlockBackend *blk)
+static int coroutine_fn blk_co_do_flush(BlockBackend *blk)
 {
     blk_wait_while_drained(blk);
 
@@ -1700,7 +1700,7 @@ static void blk_aio_flush_entry(void *opaque)
     BlkAioEmAIOCB *acb = opaque;
     BlkRwCo *rwco = &acb->rwco;
 
-    rwco->ret = blk_do_flush(rwco->blk);
+    rwco->ret = blk_co_do_flush(rwco->blk);
     blk_aio_complete(acb);
 }
 
@@ -1715,7 +1715,7 @@ int coroutine_fn blk_co_flush(BlockBackend *blk)
     int ret;
 
     blk_inc_in_flight(blk);
-    ret = blk_do_flush(blk);
+    ret = blk_co_do_flush(blk);
     blk_dec_in_flight(blk);
 
     return ret;
@@ -1724,7 +1724,7 @@ int coroutine_fn blk_co_flush(BlockBackend *blk)
 static void blk_flush_entry(void *opaque)
 {
     BlkRwCo *rwco = opaque;
-    rwco->ret = blk_do_flush(rwco->blk);
+    rwco->ret = blk_co_do_flush(rwco->blk);
     aio_wait_kick();
 }
 
-- 
2.31.1


