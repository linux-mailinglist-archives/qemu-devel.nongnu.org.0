Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA0D3C8952
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 19:06:20 +0200 (CEST)
Received: from localhost ([::1]:41006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3iKy-00083G-1L
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 13:06:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m3iEh-00061W-RW; Wed, 14 Jul 2021 12:59:51 -0400
Received: from mail-eopbgr10112.outbound.protection.outlook.com
 ([40.107.1.112]:36877 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m3iEe-0005As-Jg; Wed, 14 Jul 2021 12:59:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TtvFC3I8p4wUulbizgTqL4ITQE3lMEzPWGA1fDbthhmuYsBcMfQf/RXoQc0aJ8z6cY4Ly2T3FUZiP59SNIDabAXmzQS8RsCgipArw5uxzRQGsOOAPOD+I4QqL2OwmtIflSg0UYuqLGAKKwbQ4PkUUYYxktt6Gh51RxoHmCPwkr+pyblCyJcMAJkWSMRIZmV4jcU9NfiLBLTnkJaq2FtVnuaqYX7gVkAw+7aeA5rPgEM5lEW89PkZX7hUdW8fDmHfkyExf9sulYLh2YWcu265vkCtWv9efJiJWECt+Rd/IoGxJJb0FgbNIfNEcAn/NFss581VeT5uyfaCrNWVgZQjEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4R3DNYkNR6/KoQr+XK8TTRrh9SLkYV8MCMLIOtsFJvo=;
 b=goD3/Yv/C26gNXUYQqbQsLVx9t7AQ+ycEQni45z/eZVJ21gIWb2026JpKT4kL69FLyBCG/qfjVVcEHhpj5o4vb/IhHRaGk+MlosZM/q9kNlxJMZClbUVXAv8qWJNv6Br9nDXq2BIINWTvrRQJpkuNNmz6FBI73vkOGsBDTlE6+QKsjJeF/k33P31Kql0gc8rKCbJsu6gT4JJJuFcoZpeA/W6WL4hQ40ovR40ZZyb87hFuq9yET7AI+iF0dZJzgozgyOUvcivoYCW88fQ4OMgW3uihybYN5Oye7j/Keefd6+HxeV+GMMGrCto6M91+dGr1LddUb/H5GEL2FJqBbp7cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4R3DNYkNR6/KoQr+XK8TTRrh9SLkYV8MCMLIOtsFJvo=;
 b=uBW/DpYWlm+ABzaeBxclVfHcaIdRfh6wFsAPWEjMpBCl9SH2xFhFIEzKr5bYyYmwefyArzgwQykx+AQK05qu3zLSc8UD/4ddK5eX6RIPKP12r8zTEqTQ0ym+Ny7dgu4kgY1Nw1Wx1QWRzdc3yy92FOAu158tbjdn4lvlJMLyNH8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5334.eurprd08.prod.outlook.com (2603:10a6:20b:10b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Wed, 14 Jul
 2021 16:59:35 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 16:59:35 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com
Subject: [PATCH v5 4/5] block/nbd: drop connection_co
Date: Wed, 14 Jul 2021 19:59:15 +0300
Message-Id: <20210714165916.102363-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210714165916.102363-1-vsementsov@virtuozzo.com>
References: <20210714165916.102363-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR08CA0077.eurprd08.prod.outlook.com
 (2603:10a6:7:2a::48) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR08CA0077.eurprd08.prod.outlook.com (2603:10a6:7:2a::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.22 via Frontend Transport; Wed, 14 Jul 2021 16:59:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80438516-21f9-442c-edc2-08d946e8c1e7
X-MS-TrafficTypeDiagnostic: AM7PR08MB5334:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5334843C3F50001AD22ACB82C1139@AM7PR08MB5334.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JJ7JOinT4S+qJjzvpcSV4HDrVCY8Denr+8UWYOSIisL+2+0+aLmIeTAGXkBxbcRWKT1ClJjNf2thfk2Ex/PyXd0Ma0z+aYfJdDqhcDiIo14UqYwS4/LAMoTibTApVQfJ7zeS5y/kkhpk+TL8q/W0JRbph9NO55TKNJbAyl1GFCJ6JssSKramMrDajeQuGa72r3F1KvkGeJBzyqHIJy89S42cRkYmzgnCqlgJ7gwy81s+aVTdeciLjNCmOvIfuiuMVtCunb+5mBvgOKDKyjtEDN+/8JO7VCOVM2YdEqVNpkL0xicaDcj7iraLSG1mOSmziHR7qvWJhzDlrCkWtIeINuIMhykAY9W7VyCIQcOIPoLv6pbER4d+9tcvtdpeVFNUWNUL9cE5wrVNp9jLARVekHcpmPwFeKzD3Cv2TQ242YVfnb5D0KUhf0qee0S38NjPqVmR3kJAlC9g3qIwWinbDXu29YDHhnBJAaOEJMOUi5x+4+GflfToVajr+y7hPXvlcSg9UYJczBJWPr0xLN3vH58mAxA2ACr9FQvN3DL3atUvvIuihcwY1RLvHzHfHb0qxXRAo2MVzUZuxEqeBwE2P8Tas9/ExL7xkUSt4vdDJ8UwSaTpbP9sWPgsqflvlaQn/P1/ZNID4GaoHu9+gJoKi3SUin3fnmTFL+iLiqvF1mLB0Dt7tAdro+Sj7JEu5GtEHeqLTo9j9U+8SCBELlV5yQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(136003)(376002)(39830400003)(36756003)(30864003)(6486002)(316002)(478600001)(1076003)(2616005)(8676002)(83380400001)(956004)(2906002)(66476007)(66946007)(26005)(186003)(38350700002)(38100700002)(6512007)(86362001)(52116002)(66556008)(6916009)(5660300002)(4326008)(6506007)(6666004)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?835takQ+gI2jMysjc3nZc1R3oj0MP49sT0IoImPXvKmTMwJOJWGxyebwPsBb?=
 =?us-ascii?Q?zOCJFakLpdvibdKCkawtJz/7zwr3PxydMakQmovB6IT8el+sOniDCgjHFkeF?=
 =?us-ascii?Q?+XA3oe6oMZuu4onSVjPMUxr3uFRuyGkyi+w/4y0o8pwhxaILN7qYKNMumh7i?=
 =?us-ascii?Q?bLmeWumI/xKM+b1ksp1rj0JFI2BYCIkJ3/nYqiha6kxH1vx4O+4domew+7s7?=
 =?us-ascii?Q?n1UIaNFZ5TR8b/eRFXuMrFeeRKbNU+zCLpAyHGNa23GT0Y27TYz6vpEzIlSD?=
 =?us-ascii?Q?WeUFFYWvo3IsuLEa8tMv1rVHz2luV8Q5Y4/UAV9j4zhHe14COlVMMg6N0tDe?=
 =?us-ascii?Q?FNiekA38i5jxF1cGwbHFPHfH6u73Y1tbTQOsft/deGlV8KHdB0EqgYhXQfDO?=
 =?us-ascii?Q?kDFUxWvyKYc37+QSYfsMze8k8e1UCSzermBdFlHDsvf9ceVuvDsK2hgJA4k/?=
 =?us-ascii?Q?/Z+FFnKZ4UtU2Gni3FUypQXYGJCBdqQGypscsWgvjFYSIYqjQLG3V2ouH+lH?=
 =?us-ascii?Q?LsknCjuMuvcOu/vzxHEk5v5CekMKwhioZ+lmh4bTW+OQD/+LMc3yvCyFwFxb?=
 =?us-ascii?Q?H52Oortu4k5gvtRhtPnHVKoqW/D22+1nfmv8c+P2xrQP23aOd6Psh/MyeYzY?=
 =?us-ascii?Q?OO8AHfzv4l1ijXdFMZOXCSR76TQnkf1Zm8mrAQGk1OwKWfIyt2wZk6a7dE3N?=
 =?us-ascii?Q?AhEyII42yWb3Mh+LHFfR3lHG/4IBKSiySzIjgIsb2sRHb/kazRQEkH5tllf2?=
 =?us-ascii?Q?dOghZB2SGYc0hSXe0YxOERdEtxWPuDvT6KnZc7HIDqpwQ2rPn+p9fY0K097X?=
 =?us-ascii?Q?WwUz149JGa8A9y6aQGCgZ5Zzzmn3mi21QUUWYYBMObVch+HjQh1osqCPrptc?=
 =?us-ascii?Q?ZB/poytd/4sm1rWkHde8SvBVN6AhCf1O4vJcQeUQQGsglaEHgprFuUD024Ns?=
 =?us-ascii?Q?lvstTeR8yUesIHphsPbSSWRnkJf6Rs4DquW2I/Gy0qwx5LPsxnItPPuZZ5Pl?=
 =?us-ascii?Q?vsuLCCd3A8FoKirP80Fb2RurC48AUDnF+XwU2KvBg/Ih7TXyPJhcrdSWV0SV?=
 =?us-ascii?Q?XauFCm3dQFwPpA+lfd0E+bVlGYkjGpQT3iBtusKEWt4jyPuxi8VM8mO4+TP9?=
 =?us-ascii?Q?0Vy1wZxfNjKLI9NgK9Dzx1mlfwe2Cx67BBAyVpaLWwV21j+7CUsvlOSySbBR?=
 =?us-ascii?Q?AHqszyp436CAaxOdiwfrjgsUb39ussSgv2/CIa2qEZ2RnOrZ1XvtDnFzpHgi?=
 =?us-ascii?Q?j3/YRdH8HpDAY2jDoC/lRGKQm3a6/yj/eI0kGY2DriGktyku14huUljcH30v?=
 =?us-ascii?Q?WZF71ydI7eyHoNoSgeo2saUM?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80438516-21f9-442c-edc2-08d946e8c1e7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 16:59:35.1744 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mS/Tq10/cxTYcBb8u80TyK1i4I9qEhukDAinacXCKYVi08uu9uHqt4bU3nf3z611+jZKBARNeEnz5dbg3G6odIh9PR3byCNZeAfVD/uk6W8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5334
Received-SPF: pass client-ip=40.107.1.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

OK, that's a big rewrite of the logic.

Pre-patch we have an always running coroutine - connection_co. It does
reply receiving and reconnecting. And it leads to a lot of difficult
and unobvious code around drained sections and context switch. We also
abuse bs->in_flight counter which is increased for connection_co and
temporary decreased in points where we want to allow drained section to
begin. One of these place is in another file: in nbd_read_eof() in
nbd/client.c.

We also cancel reconnect and requests waiting for reconnect on drained
begin which is not correct.

Let's finally drop this always running coroutine and go another way:

1. receiving coroutines are woken directly from nbd_channel_error, when
   we change s->state

2. nbd_co_establish_connection_cancel(): we don't have drain_begin now,
   and in nbd_teardown_connection() all requests should already be
   finished (and reconnect is done from request). So
   nbd_co_establish_connection_cancel() is called from
   nbd_cancel_in_flight() (to cancel the request that is doing
   nbd_co_establish_connection()) and from reconnect_delay_timer_cb()
   (previously we didn't need it, as reconnect delay only should cancel
   active requests not the reconnection itself. But now reconnection
   itself is done in the separate thread (we now call
   nbd_client_connection_enable_retry() in nbd_open()), and we need to
   cancel the requests that waits in nbd_co_establish_connection()
   now).

2. We do receive headers in request coroutine. But we also should
   dispatch replies for another pending requests. So,
   nbd_connection_entry() is turned into nbd_receive_replies(), which
   does reply dispatching until it receive another request headers, and
   returns when it receive the requested header.

3. All old staff around drained sections and context switch is dropped.
   In details:
   - we don't need to move connection_co to new aio context, as we
     don't have connection_co anymore
   - we don't have a fake "request" of connection_co (extra increasing
     in_flight), so don't care with it in drain_begin/end
   - we don't stop reconnection during drained section anymore. This
     means that drain_begin may wait for a long time (up to
     reconnect_delay). But that's an improvement and more correct
     behavior see below[*]

4. In nbd_teardown_connection() we don't have to wait for
   connection_co, as it is dropped. And cleanup for s->ioc and nbd_yank
   is moved here from removed connection_co.

5. In nbd_co_do_establish_connection() we now should handle
   NBD_CLIENT_CONNECTING_NOWAIT: if new request comes when we are in
   NBD_CLIENT_CONNECTING_NOWAIT, it still should call
   nbd_co_establish_connection() (who knows, maybe connection already
   established by thread in background). But we shouldn't wait: if
   nbd_co_establish_connection() can't return new channel immediately
   the request should fail (we are in NBD_CLIENT_CONNECTING_NOWAIT
   state).

6. nbd_reconnect_attempt() is simplified: it's now easier to wait for
   other requests in the caller, so here we just assert that fact.
   Also delay time is now initialized here: we can easily detect first
   attempt and start a timer.

7. nbd_co_reconnect_loop() is dropped, we don't need it. Reconnect
   retries are fully handle by thread (nbd/client-connection.c), delay
   timer we initialize in nbd_reconnect_attempt(), we don't have to
   bother with s->drained and friends. nbd_reconnect_attempt() now
   called from nbd_co_send_request().

8. nbd_connection_entry is dropped: reconnect is now handled by
   nbd_co_send_request(), receiving reply is now handled by
   nbd_receive_replies(): all handled from request coroutines.

9. So, welcome new nbd_receive_replies() called from request coroutine,
   that receives reply header instead of nbd_connection_entry().
   Like with sending requests, only one coroutine may receive in a
   moment. So we introduce receive_mutex, which is locked around
   nbd_receive_reply(). It also protects some related fields. Still,
   full audit of thread-safety in nbd driver is a separate task.
   New function waits for a reply with specified handle being received
   and works rather simple:

   Under mutex:
     - if current handle is 0, do receive by hand. If another handle
       received - switch to other request coroutine, release mutex and
       yield. Otherwise return success
     - if current handle == requested handle, we are done
     - otherwise, release mutex and yield

10: in nbd_co_send_request() we now do nbd_reconnect_attempt() if
    needed. Also waiting in free_sema queue we now wait for one of two
    conditions:
    - connectED, in_flight < MAX_NBD_REQUESTS (so we can start new one)
    - connectING, in_flight == 0, so we can call
      nbd_reconnect_attempt()
    And this logic is protected by s->send_mutex

    Also, on failure we don't have to care of removed s->connection_co

11. nbd_co_do_receive_one_chunk(): now instead of yield() and wait for
    s->connection_co we just call new nbd_receive_replies().

12. nbd_co_receive_one_chunk(): place where s->reply.handle becomes 0,
    which means that handling of the whole reply is finished. Here we
    need to wake one of coroutines sleeping in nbd_receive_replies().
    If now one sleeps - do nothing. That's another behavior change: we
    don't have endless recv() in the idle time. It may be considered as
    a drawback. If so, it may be fixed later.

13. nbd_reply_chunk_iter_receive(): don't care about removed
    connection_co, just ping in_flight waiters.

14. Don't create connection_co, enable retry in the connection thread
    (we don't have own reconnect loop anymore)

15. We need now nbd_co_establish_connection_cancel() call in
    nbd_cancel_in_flight(), to cancel the request that doing connection
    attempt.

[*], ok, now we don't cancel reconnect on drain begin. That's correct:
    reconnect feature leads to possibility of long-running requests (up
    to reconnect delay). Still, drain begin is not a reason to kill
    long requests. We should wait for them.

    This also means, that we can again reproduce a dead-lock, described
    in 8c517de24a8a1dcbeb54e7e12b5b0fda42a90ace.
    Why we are OK with it:
    1. Now this is not absolutely-dead dead-lock: the vm is unfrozen
       after reconnect delay. Actually 8c517de24a8a1dc fixed a bug in
       NBD logic, that was not described in 8c517de24a8a1dc and led to
       forever dead-lock. The problem was that nobody woken free_sema
       queue, but drain_begin can't finish until there is a request in
       free_sema queue. Now we have a reconnect delay timer that works
       well.
    2. It's not a problem of NBD driver, it's a problem of ide code,
       that does drain_begin under global mutex
    3. That doesn't reproduce if chose scsi instead of ide.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c  | 374 ++++++++++++++-------------------------------------
 nbd/client.c |   2 -
 2 files changed, 99 insertions(+), 277 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 3b91954b1f..8313937f0f 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -57,7 +57,7 @@
 typedef struct {
     Coroutine *coroutine;
     uint64_t offset;        /* original offset of the request */
-    bool receiving;         /* waiting for connection_co? */
+    bool receiving;         /* sleeping in the yield in nbd_receive_replies */
 } NBDClientRequest;
 
 typedef enum NBDClientState {
@@ -73,14 +73,10 @@ typedef struct BDRVNBDState {
 
     CoMutex send_mutex;
     CoQueue free_sema;
-    Coroutine *connection_co;
-    Coroutine *teardown_co;
-    QemuCoSleep reconnect_sleep;
-    bool drained;
-    bool wait_drained_end;
+
+    CoMutex receive_mutex;
     int in_flight;
     NBDClientState state;
-    bool wait_in_flight;
 
     QEMUTimer *reconnect_delay_timer;
 
@@ -163,6 +159,8 @@ static void nbd_channel_error(BDRVNBDState *s, int ret)
     } else {
         s->state = NBD_CLIENT_QUIT;
     }
+
+    nbd_recv_coroutines_wake_all(s, false);
 }
 
 static void reconnect_delay_timer_del(BDRVNBDState *s)
@@ -179,6 +177,7 @@ static void reconnect_delay_timer_cb(void *opaque)
 
     if (qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT) {
         s->state = NBD_CLIENT_CONNECTING_NOWAIT;
+        nbd_co_establish_connection_cancel(s->conn);
         while (qemu_co_enter_next(&s->free_sema, NULL)) {
             /* Resume all queued requests */
         }
@@ -201,113 +200,21 @@ static void reconnect_delay_timer_init(BDRVNBDState *s, uint64_t expire_time_ns)
     timer_mod(s->reconnect_delay_timer, expire_time_ns);
 }
 
-static void nbd_client_detach_aio_context(BlockDriverState *bs)
-{
-    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
-
-    /* Timer is deleted in nbd_client_co_drain_begin() */
-    assert(!s->reconnect_delay_timer);
-    /*
-     * If reconnect is in progress we may have no ->ioc.  It will be
-     * re-instantiated in the proper aio context once the connection is
-     * reestablished.
-     */
-    if (s->ioc) {
-        qio_channel_detach_aio_context(QIO_CHANNEL(s->ioc));
-    }
-}
-
-static void nbd_client_attach_aio_context_bh(void *opaque)
-{
-    BlockDriverState *bs = opaque;
-    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
-
-    if (s->connection_co) {
-        /*
-         * The node is still drained, so we know the coroutine has yielded in
-         * nbd_read_eof(), the only place where bs->in_flight can reach 0, or
-         * it is entered for the first time. Both places are safe for entering
-         * the coroutine.
-         */
-        qemu_aio_coroutine_enter(bs->aio_context, s->connection_co);
-    }
-    bdrv_dec_in_flight(bs);
-}
-
-static void nbd_client_attach_aio_context(BlockDriverState *bs,
-                                          AioContext *new_context)
-{
-    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
-
-    /*
-     * s->connection_co is either yielded from nbd_receive_reply or from
-     * nbd_co_reconnect_loop()
-     */
-    if (nbd_client_connected(s)) {
-        qio_channel_attach_aio_context(QIO_CHANNEL(s->ioc), new_context);
-    }
-
-    bdrv_inc_in_flight(bs);
-
-    /*
-     * Need to wait here for the BH to run because the BH must run while the
-     * node is still drained.
-     */
-    aio_wait_bh_oneshot(new_context, nbd_client_attach_aio_context_bh, bs);
-}
-
-static void coroutine_fn nbd_client_co_drain_begin(BlockDriverState *bs)
-{
-    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
-
-    s->drained = true;
-    qemu_co_sleep_wake(&s->reconnect_sleep);
-
-    nbd_co_establish_connection_cancel(s->conn);
-
-    reconnect_delay_timer_del(s);
-
-    if (qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT) {
-        s->state = NBD_CLIENT_CONNECTING_NOWAIT;
-        qemu_co_queue_restart_all(&s->free_sema);
-    }
-}
-
-static void coroutine_fn nbd_client_co_drain_end(BlockDriverState *bs)
-{
-    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
-
-    s->drained = false;
-    if (s->wait_drained_end) {
-        s->wait_drained_end = false;
-        aio_co_wake(s->connection_co);
-    }
-}
-
-
 static void nbd_teardown_connection(BlockDriverState *bs)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
 
+    assert(!s->in_flight);
+
     if (s->ioc) {
-        /* finish any pending coroutines */
         qio_channel_shutdown(s->ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
+        yank_unregister_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name),
+                                 nbd_yank, s->bs);
+        object_unref(OBJECT(s->ioc));
+        s->ioc = NULL;
     }
 
     s->state = NBD_CLIENT_QUIT;
-    if (s->connection_co) {
-        qemu_co_sleep_wake(&s->reconnect_sleep);
-        nbd_co_establish_connection_cancel(s->conn);
-    }
-    if (qemu_in_coroutine()) {
-        s->teardown_co = qemu_coroutine_self();
-        /* connection_co resumes us when it terminates */
-        qemu_coroutine_yield();
-        s->teardown_co = NULL;
-    } else {
-        BDRV_POLL_WHILE(bs, s->connection_co);
-    }
-    assert(!s->connection_co);
 }
 
 static bool nbd_client_connecting(BDRVNBDState *s)
@@ -372,10 +279,11 @@ int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     int ret;
+    bool blocking = nbd_client_connecting_wait(s);
 
     assert(!s->ioc);
 
-    s->ioc = nbd_co_establish_connection(s->conn, &s->info, true, errp);
+    s->ioc = nbd_co_establish_connection(s->conn, &s->info, blocking, errp);
     if (!s->ioc) {
         return -ECONNREFUSED;
     }
@@ -411,29 +319,22 @@ int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,
     return 0;
 }
 
+/* called under s->send_mutex */
 static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
 {
-    if (!nbd_client_connecting(s)) {
-        return;
-    }
+    assert(nbd_client_connecting(s));
+    assert(s->in_flight == 0);
 
-    /* Wait for completion of all in-flight requests */
-
-    qemu_co_mutex_lock(&s->send_mutex);
-
-    while (s->in_flight > 0) {
-        qemu_co_mutex_unlock(&s->send_mutex);
-        nbd_recv_coroutines_wake_all(s, false);
-        s->wait_in_flight = true;
-        qemu_coroutine_yield();
-        s->wait_in_flight = false;
-        qemu_co_mutex_lock(&s->send_mutex);
-    }
-
-    qemu_co_mutex_unlock(&s->send_mutex);
-
-    if (!nbd_client_connecting(s)) {
-        return;
+    if (nbd_client_connecting_wait(s) && s->reconnect_delay &&
+        !s->reconnect_delay_timer)
+    {
+        /*
+         * It's first reconnect attempt after switching to
+         * NBD_CLIENT_CONNECTING_WAIT
+         */
+        reconnect_delay_timer_init(s,
+            qemu_clock_get_ns(QEMU_CLOCK_REALTIME) +
+            s->reconnect_delay * NANOSECONDS_PER_SECOND);
     }
 
     /*
@@ -453,135 +354,79 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
     nbd_co_do_establish_connection(s->bs, NULL);
 }
 
-static coroutine_fn void nbd_co_reconnect_loop(BDRVNBDState *s)
+static coroutine_fn int nbd_receive_replies(BDRVNBDState *s, uint64_t handle)
 {
-    uint64_t timeout = 1 * NANOSECONDS_PER_SECOND;
-    uint64_t max_timeout = 16 * NANOSECONDS_PER_SECOND;
+    int ret;
+    uint64_t ind = HANDLE_TO_INDEX(s, handle), ind2;
+    QEMU_LOCK_GUARD(&s->receive_mutex);
 
-    if (qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT) {
-        reconnect_delay_timer_init(s, qemu_clock_get_ns(QEMU_CLOCK_REALTIME) +
-                                   s->reconnect_delay * NANOSECONDS_PER_SECOND);
-    }
-
-    nbd_reconnect_attempt(s);
-
-    while (nbd_client_connecting(s)) {
-        if (s->drained) {
-            bdrv_dec_in_flight(s->bs);
-            s->wait_drained_end = true;
-            while (s->drained) {
-                /*
-                 * We may be entered once from nbd_client_attach_aio_context_bh
-                 * and then from nbd_client_co_drain_end. So here is a loop.
-                 */
-                qemu_coroutine_yield();
-            }
-            bdrv_inc_in_flight(s->bs);
-        } else {
-            qemu_co_sleep_ns_wakeable(&s->reconnect_sleep,
-                                      QEMU_CLOCK_REALTIME, timeout);
-            if (s->drained) {
-                continue;
-            }
-            if (timeout < max_timeout) {
-                timeout *= 2;
-            }
+    while (true) {
+        if (s->reply.handle == handle) {
+            /* We are done */
+            return 0;
         }
 
-        nbd_reconnect_attempt(s);
-    }
-
-    reconnect_delay_timer_del(s);
-}
+        if (!nbd_client_connected(s)) {
+            return -EIO;
+        }
 
-static coroutine_fn void nbd_connection_entry(void *opaque)
-{
-    BDRVNBDState *s = opaque;
-    uint64_t i;
-    int ret = 0;
-    Error *local_err = NULL;
+        if (s->reply.handle != 0) {
+            /*
+             * Some other request is being handling now. It should already be
+             * woken by thous who set s->reply.handle (or never wait in this
+             * yield). So, we should not wake it here.
+             */
+            ind2 = HANDLE_TO_INDEX(s, s->reply.handle);
+            assert(!s->requests[ind2].receiving);
 
-    while (qatomic_load_acquire(&s->state) != NBD_CLIENT_QUIT) {
-        /*
-         * The NBD client can only really be considered idle when it has
-         * yielded from qio_channel_readv_all_eof(), waiting for data. This is
-         * the point where the additional scheduled coroutine entry happens
-         * after nbd_client_attach_aio_context().
-         *
-         * Therefore we keep an additional in_flight reference all the time and
-         * only drop it temporarily here.
-         */
+            s->requests[ind].receiving = true;
+            qemu_co_mutex_unlock(&s->receive_mutex);
 
-        if (nbd_client_connecting(s)) {
-            nbd_co_reconnect_loop(s);
-        }
+            qemu_coroutine_yield();
+            /*
+             * We may be woken for 3 reasons:
+             * 1. From this function, executing in parallel coroutine, when our
+             *    handle received.
+             * 2. From nbd_channel_error(), when connection is lost.
+             * 3. From nbd_co_receive_one_chunk(), when previous request is
+             *    finished and s->reply.handle set to 0.
+             * Anyway, it's OK to lock the mutex and go to the next iteration.
+             */
 
-        if (!nbd_client_connected(s)) {
+            qemu_co_mutex_lock(&s->receive_mutex);
+            assert(!s->requests[ind].receiving);
             continue;
         }
 
+        /* We are under mutex and handle is 0. We have to do the dirty work. */
         assert(s->reply.handle == 0);
-        ret = nbd_receive_reply(s->bs, s->ioc, &s->reply, &local_err);
-
-        if (local_err) {
-            trace_nbd_read_reply_entry_fail(ret, error_get_pretty(local_err));
-            error_free(local_err);
-            local_err = NULL;
-        }
+        ret = nbd_receive_reply(s->bs, s->ioc, &s->reply, NULL);
         if (ret <= 0) {
-            nbd_channel_error(s, ret ? ret : -EIO);
-            continue;
+            ret = ret ? ret : -EIO;
+            nbd_channel_error(s, ret);
+            return ret;
         }
-
-        /*
-         * There's no need for a mutex on the receive side, because the
-         * handler acts as a synchronization point and ensures that only
-         * one coroutine is called until the reply finishes.
-         */
-        i = HANDLE_TO_INDEX(s, s->reply.handle);
-        if (i >= MAX_NBD_REQUESTS ||
-            !s->requests[i].coroutine ||
-            !s->requests[i].receiving ||
-            (nbd_reply_is_structured(&s->reply) && !s->info.structured_reply))
-        {
+        if (nbd_reply_is_structured(&s->reply) && !s->info.structured_reply) {
             nbd_channel_error(s, -EINVAL);
-            continue;
+            return -EINVAL;
         }
-
-        /*
-         * We're woken up again by the request itself.  Note that there
-         * is no race between yielding and reentering connection_co.  This
-         * is because:
-         *
-         * - if the request runs on the same AioContext, it is only
-         *   entered after we yield
-         *
-         * - if the request runs on a different AioContext, reentering
-         *   connection_co happens through a bottom half, which can only
-         *   run after we yield.
-         */
-        s->requests[i].receiving = false;
-        aio_co_wake(s->requests[i].coroutine);
-        qemu_coroutine_yield();
-    }
-
-    qemu_co_queue_restart_all(&s->free_sema);
-    nbd_recv_coroutines_wake_all(s, false);
-    bdrv_dec_in_flight(s->bs);
-
-    s->connection_co = NULL;
-    if (s->ioc) {
-        qio_channel_detach_aio_context(QIO_CHANNEL(s->ioc));
-        yank_unregister_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name),
-                                 nbd_yank, s->bs);
-        object_unref(OBJECT(s->ioc));
-        s->ioc = NULL;
-    }
-
-    if (s->teardown_co) {
-        aio_co_wake(s->teardown_co);
+        if (s->reply.handle == handle) {
+            /* We are done */
+            return 0;
+        }
+        ind2 = HANDLE_TO_INDEX(s, s->reply.handle);
+        if (ind2 >= MAX_NBD_REQUESTS || !s->requests[ind2].coroutine) {
+            /*
+             * We only check that ind2 request exists. But don't check is it now
+             * waiting for the reply header or not. We can't just check
+             * s->requests[ind2].receiving: ind2 request may wait in trying to
+             * lock receive_mutex. So that's a TODO.
+             */
+            nbd_channel_error(s, -EINVAL);
+            return -EINVAL;
+        }
+        nbd_recv_coroutine_wake(&s->requests[ind2]);
     }
-    aio_wait_kick();
 }
 
 static int nbd_co_send_request(BlockDriverState *bs,
@@ -592,10 +437,17 @@ static int nbd_co_send_request(BlockDriverState *bs,
     int rc, i = -1;
 
     qemu_co_mutex_lock(&s->send_mutex);
-    while (s->in_flight == MAX_NBD_REQUESTS || nbd_client_connecting_wait(s)) {
+
+    while (s->in_flight == MAX_NBD_REQUESTS ||
+           (!nbd_client_connected(s) && s->in_flight > 0))
+    {
         qemu_co_queue_wait(&s->free_sema, &s->send_mutex);
     }
 
+    if (nbd_client_connecting(s)) {
+        nbd_reconnect_attempt(s);
+    }
+
     if (!nbd_client_connected(s)) {
         rc = -EIO;
         goto err;
@@ -642,10 +494,6 @@ err:
         if (i != -1) {
             s->requests[i].coroutine = NULL;
             s->in_flight--;
-        }
-        if (s->in_flight == 0 && s->wait_in_flight) {
-            aio_co_wake(s->connection_co);
-        } else {
             qemu_co_queue_next(&s->free_sema);
         }
     }
@@ -944,10 +792,7 @@ static coroutine_fn int nbd_co_do_receive_one_chunk(
     }
     *request_ret = 0;
 
-    /* Wait until we're woken up by nbd_connection_entry.  */
-    s->requests[i].receiving = true;
-    qemu_coroutine_yield();
-    assert(!s->requests[i].receiving);
+    nbd_receive_replies(s, handle);
     if (!nbd_client_connected(s)) {
         error_setg(errp, "Connection closed");
         return -EIO;
@@ -1040,14 +885,7 @@ static coroutine_fn int nbd_co_receive_one_chunk(
     }
     s->reply.handle = 0;
 
-    if (s->connection_co && !s->wait_in_flight) {
-        /*
-         * We must check s->wait_in_flight, because we may entered by
-         * nbd_recv_coroutines_wake_all(), in this case we should not
-         * wake connection_co here, it will woken by last request.
-         */
-        aio_co_wake(s->connection_co);
-    }
+    nbd_recv_coroutines_wake_all(s, true);
 
     return ret;
 }
@@ -1158,11 +996,7 @@ break_loop:
 
     qemu_co_mutex_lock(&s->send_mutex);
     s->in_flight--;
-    if (s->in_flight == 0 && s->wait_in_flight) {
-        aio_co_wake(s->connection_co);
-    } else {
-        qemu_co_queue_next(&s->free_sema);
-    }
+    qemu_co_queue_next(&s->free_sema);
     qemu_co_mutex_unlock(&s->send_mutex);
 
     return false;
@@ -1978,6 +1812,7 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
     s->bs = bs;
     qemu_co_mutex_init(&s->send_mutex);
     qemu_co_queue_init(&s->free_sema);
+    qemu_co_mutex_init(&s->receive_mutex);
 
     if (!yank_register_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name), errp)) {
         return -EEXIST;
@@ -1992,14 +1827,13 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
                                         s->x_dirty_bitmap, s->tlscreds);
 
     /* TODO: Configurable retry-until-timeout behaviour. */
+    s->state = NBD_CLIENT_CONNECTING_WAIT;
     ret = nbd_do_establish_connection(bs, errp);
     if (ret < 0) {
         goto fail;
     }
 
-    s->connection_co = qemu_coroutine_create(nbd_connection_entry, s);
-    bdrv_inc_in_flight(bs);
-    aio_co_schedule(bdrv_get_aio_context(bs), s->connection_co);
+    nbd_client_connection_enable_retry(s->conn);
 
     return 0;
 
@@ -2153,6 +1987,8 @@ static void nbd_cancel_in_flight(BlockDriverState *bs)
         s->state = NBD_CLIENT_CONNECTING_NOWAIT;
         qemu_co_queue_restart_all(&s->free_sema);
     }
+
+    nbd_co_establish_connection_cancel(s->conn);
 }
 
 static BlockDriver bdrv_nbd = {
@@ -2173,10 +2009,6 @@ static BlockDriver bdrv_nbd = {
     .bdrv_refresh_limits        = nbd_refresh_limits,
     .bdrv_co_truncate           = nbd_co_truncate,
     .bdrv_getlength             = nbd_getlength,
-    .bdrv_detach_aio_context    = nbd_client_detach_aio_context,
-    .bdrv_attach_aio_context    = nbd_client_attach_aio_context,
-    .bdrv_co_drain_begin        = nbd_client_co_drain_begin,
-    .bdrv_co_drain_end          = nbd_client_co_drain_end,
     .bdrv_refresh_filename      = nbd_refresh_filename,
     .bdrv_co_block_status       = nbd_client_co_block_status,
     .bdrv_dirname               = nbd_dirname,
@@ -2202,10 +2034,6 @@ static BlockDriver bdrv_nbd_tcp = {
     .bdrv_refresh_limits        = nbd_refresh_limits,
     .bdrv_co_truncate           = nbd_co_truncate,
     .bdrv_getlength             = nbd_getlength,
-    .bdrv_detach_aio_context    = nbd_client_detach_aio_context,
-    .bdrv_attach_aio_context    = nbd_client_attach_aio_context,
-    .bdrv_co_drain_begin        = nbd_client_co_drain_begin,
-    .bdrv_co_drain_end          = nbd_client_co_drain_end,
     .bdrv_refresh_filename      = nbd_refresh_filename,
     .bdrv_co_block_status       = nbd_client_co_block_status,
     .bdrv_dirname               = nbd_dirname,
@@ -2231,10 +2059,6 @@ static BlockDriver bdrv_nbd_unix = {
     .bdrv_refresh_limits        = nbd_refresh_limits,
     .bdrv_co_truncate           = nbd_co_truncate,
     .bdrv_getlength             = nbd_getlength,
-    .bdrv_detach_aio_context    = nbd_client_detach_aio_context,
-    .bdrv_attach_aio_context    = nbd_client_attach_aio_context,
-    .bdrv_co_drain_begin        = nbd_client_co_drain_begin,
-    .bdrv_co_drain_end          = nbd_client_co_drain_end,
     .bdrv_refresh_filename      = nbd_refresh_filename,
     .bdrv_co_block_status       = nbd_client_co_block_status,
     .bdrv_dirname               = nbd_dirname,
diff --git a/nbd/client.c b/nbd/client.c
index 0c2db4bcba..30d5383cb1 100644
--- a/nbd/client.c
+++ b/nbd/client.c
@@ -1434,9 +1434,7 @@ nbd_read_eof(BlockDriverState *bs, QIOChannel *ioc, void *buffer, size_t size,
 
         len = qio_channel_readv(ioc, &iov, 1, errp);
         if (len == QIO_CHANNEL_ERR_BLOCK) {
-            bdrv_dec_in_flight(bs);
             qio_channel_yield(ioc, G_IO_IN);
-            bdrv_inc_in_flight(bs);
             continue;
         } else if (len < 0) {
             return -EIO;
-- 
2.29.2


