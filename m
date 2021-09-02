Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 341703FEC59
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 12:44:32 +0200 (CEST)
Received: from localhost ([::1]:36366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLkCt-00045y-9d
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 06:44:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLk7E-0004aW-Bd; Thu, 02 Sep 2021 06:38:40 -0400
Received: from mail-eopbgr30115.outbound.protection.outlook.com
 ([40.107.3.115]:38273 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLk7B-0005xI-9n; Thu, 02 Sep 2021 06:38:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PhBkVhSpzh7HxGHY967Ls/6lZgxKoLR7/iodaStwqhouJLsaiZiABfHLiFx3uadskEMphR1GHdXEU12p6j17jb/iyZD6iAL9IPvTKQB/Zmqy0AC1Vzw508Id5D1d45/LIA2LmEq1mGXT9CNHhJCJEjnID3c4CYgPgaetQxJ0a6FtNGGz/FXQk8xk5H0NHL0CWl27JOQYF6WW7BSgzupP6cjmwkYs5hzJ41PdUfV4aZVSTa6+YcQ2IhDJXnqcXrw0wWEVu2/eRidoe4hzFTo5aKfEMQcEUj2aHBD95dZYL5K/BIWKATnegGIZaCYMwmwrwjWhU+kjhUQ6VYBtsZx9kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=BWOVYrcHRowZ0RnLHErw0HJp4jMaVJkHhzsCDDm6cJc=;
 b=mspe497siIm0TWwmWFTuntIw9BCfA+UxDS9fENY11iH7mbqIg6uyaMmiDwI2frc7h8Mekfleddsu4ebiLXrzxsjv93FhntgGRiKgHL7GXxHaD1z85p7xIwNyNkMkdRkt1nICWNT8b2m5TDjIxTaMPBy/GL3r4pwxrVaO1DD0tM8hh97EPcUzbKZGZgaTG7JpGG4CvnSgavEZHmYKZlhCbvrMQLqcGzHT9WPket7kOKgKjZwXvK0k0RjEQ1F6dinT9SGN4vkYj14lgKL0Cqp3l7UatKvp19x4SXzeROTRG7C128CC4UnKF68+UQwWDR2U7sjrNaYShND8Zz8Fmv6oFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BWOVYrcHRowZ0RnLHErw0HJp4jMaVJkHhzsCDDm6cJc=;
 b=QTb6gS7eQ/ZYrZsS6JfhTU6BECNEUSoilTOQ77hPonZ6jJtyAHUEn6ZYDDZv0iyTri0vz4o/MnV+BP72590pq40pxgRg5G9gE8ZvFUxc2qApsbP4+qNogIGCt/1EfbGqCU94fHys69lyZdNV0aiRiHkr6Z9BunQ7PC+evh2DZrY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4472.eurprd08.prod.outlook.com (2603:10a6:20b:bf::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20; Thu, 2 Sep
 2021 10:38:26 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.019; Thu, 2 Sep 2021
 10:38:26 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, rkagan@virtuozzo.com
Subject: [PATCH v6 4/5] block/nbd: drop connection_co
Date: Thu,  2 Sep 2021 13:38:04 +0300
Message-Id: <20210902103805.25686-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210902103805.25686-1-vsementsov@virtuozzo.com>
References: <20210902103805.25686-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0402CA0037.eurprd04.prod.outlook.com
 (2603:10a6:7:7c::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1PR0402CA0037.eurprd04.prod.outlook.com (2603:10a6:7:7c::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 10:38:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94379e14-0e26-4fea-6bad-08d96dfdcbe2
X-MS-TrafficTypeDiagnostic: AM6PR08MB4472:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4472B40A798D679DAC23331EC1CE9@AM6PR08MB4472.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DNf+0pH/BwRGdM24yV9Nc7iiZf/T/hrphFuJr6SYFYRbgxCoNyqNJD/EVi6ylLEEpGKAqA0y51M1VSs3CnTuRrDGgaU/uBwTFwJHg29ZG9SLEPc4nQ4DUGroT3AMbH11jm8NAC69FxxR2CEbBpscpP/SrPpBnW4tZhxoQHlX7pflxXb+y0pqPHAuQjT/Evj5OM0/uepo/aFhrZQnH2TTuQJbRmKJpbBb6l5YIfxNmekZ9PvEnznXDxpYUObg+3T/Ks35zxI1LAGCXoFTE8z9QDLYNJj5hed1Rc7yN8Dl/vt4yJ9XrObQkJmNehOY0c/2SJq6wMGkkg/+MDwHkKwQdUeqoTXP2s1pbtRHk6ZnjvAVDWSaVUBQo2M4KPL8jiBQ5Xb8tkIkQnpOZhOSiTem+UByClIOOrg94wHo5Do+KoarurXXd49OPIzPqCWLDqs7R/U4DMpRpG3AQIYUBJXYvxseHV8zCPOsTEqD2seGcrVlPywFuO3Ys2Snz0QZiPgHEP5DMuqFBjhORlu3q/2PkT62jqThiFnaV3t4uCEPNsjZUDbzTKm3dGGUJw8hPXxb/o0Uuv0sVIwpfcvleK/upnl/OyjAQdyaRdFapP8evoXaGaD1j01hsETH23JCpIURPQp7dBxudgnOt680XSVVK2ehrVO2V/PRS2UDjSFTdR/bsslov4ar95W4w2HWcjfWs/uHIXlqnwTnOP7jJE0jRA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(396003)(346002)(39840400004)(66476007)(4326008)(26005)(6506007)(66946007)(6666004)(8936002)(1076003)(5660300002)(316002)(83380400001)(186003)(8676002)(6512007)(38100700002)(38350700002)(30864003)(2906002)(107886003)(66556008)(36756003)(6916009)(52116002)(956004)(2616005)(86362001)(478600001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C0sRqXGYD7j9BWaaAse4lUu7BRN+9eB4J4yP3Y9uxuUgdmA2H5P2LHI+6WPB?=
 =?us-ascii?Q?7l5fhP4k7SE4mEOfL/R46mlR9Y4gFdwk8KeUj1r2hsbwzD96Vq4vfuCqXUx5?=
 =?us-ascii?Q?OmLyXafBgiPX8GQx5cpACyaHHRQPi2nwAgUrZLaXxMNk9HqOutQvWjDFxJY0?=
 =?us-ascii?Q?uvCAG7uIUns3uI8/XCR1gWF6y7l5dCdYEAUYoy+dSor7wdfRTCPWvdsZMCeq?=
 =?us-ascii?Q?YGNZBLKptwuzNjarWK5fZAj/8anXrHXltCakAY9jbpe+YvZ8mzKNoF+MEojf?=
 =?us-ascii?Q?y8VRXL1lVbbw1olOzDlwMjQA2OitLQveAa1F8xwR64dS1C+Ll43iNjBGqEnK?=
 =?us-ascii?Q?+43EWJdCWaFAisLNDEAwWVTX9BqgUenhl+d9dDUv7MHJqbXI8QvVveYjlwwy?=
 =?us-ascii?Q?PMpwF13wRWFjwQxL4f4ufU9meuVlZzYfYqtlpfgJ1o/e0YdgqJQXu2lz2/aX?=
 =?us-ascii?Q?vIDrwnu5+fsGC+tV8oa5QD341eNSfUxh9o9gY/JIEJqWvIEtsaMplwCeiFAz?=
 =?us-ascii?Q?OyFMC103D33le4XAdqkKSV2XvWjStoLKzbrVgMYqf+ovCdk9LQQvwIM8ES1N?=
 =?us-ascii?Q?JEjE8PyHtrEI0VzKMV1CJr2O/5EfEEVwdCV39srC4ZjRZHs7EuHtVwxYFpyT?=
 =?us-ascii?Q?ciIQmHHzflKJ9Y0hio5ExOW5bh9aW7peAKrI0k4UWC1xzN4EOsl6NFpWw4BO?=
 =?us-ascii?Q?7EIvXDFb41L2rKQ+/c3Tt7GW8IZmWVABH8Eh515GiwzQ9TnDFCZKtXxNxb0P?=
 =?us-ascii?Q?KT/vmNf727gxiDU/zzV9IwG1v88nllVHAXUGsoQKguXjq53CrUaMXoeBWQIX?=
 =?us-ascii?Q?TiNlEuVMXGEMcNs4CuuaWNu8aJWWB9GfMxwdFzW/I6V0HGPsjJqmKFSSPT5D?=
 =?us-ascii?Q?5Mieja29ScbDRyof0sg+gSTyZ1jX1ua8yBsCR7OcviMleSfOCncEVtJv4Gom?=
 =?us-ascii?Q?lHJihaFDmwXLOsGCybMd8kXwhn97RK5rquuOqVF9as7LiuFJUBQftugjADgk?=
 =?us-ascii?Q?xMCIZbgWDyzBEC2ix+Rgkj9AZRnUCsiMKgh3u1sxAbnsgm5MahpESYUe3CU5?=
 =?us-ascii?Q?wnyeOM4EJCEkOEYcY8PE2WeItj6H8wmy4ru4/lH/s6G0tN1XoMjxlxM2LPv1?=
 =?us-ascii?Q?4G7RNk2oDnnDVYrG2Ym01PslU+OJw/EJhkugURNUsxh0YCche34ok66j2blq?=
 =?us-ascii?Q?piL8b0m3/Ghnu74ce52iA+lO6M415IqUFFsbm1yzCQbgfZUmRJzvn0/d/Wdj?=
 =?us-ascii?Q?OMkIX4DYGDmyl7JHFj6EljQaYJpsZDXPIM3Yt7P2EUpOmwZYYJ0f4lxJmYxy?=
 =?us-ascii?Q?A4ujgtOFR/kuOYP4VFp12Kza?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94379e14-0e26-4fea-6bad-08d96dfdcbe2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 10:38:26.6692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +jmTVJp/XVdQ2FARaSu/o0NgUSs2rqIVO1+1ETOkke8ioU2Jh21CLV2G4H0WA2L0GN2ugQNLnRoCNzvSjpbj9bhWdV2ANrsApUq2c2SLybo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4472
Received-SPF: pass client-ip=40.107.3.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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
begin which is not correct. And this patch fixes that.

Let's finally drop this always running coroutine and go another way:
do both reconnect and receiving in request coroutines.

The detailed list of changes below (in the sequence of diff hunks).

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
index 52b0733684..170a8c8eeb 100644
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
+    nbd_recv_coroutines_wake(s, true);
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
-        nbd_recv_coroutines_wake(s, true);
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
-    nbd_recv_coroutines_wake(s, true);
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
+        nbd_recv_coroutine_wake_one(&s->requests[ind2]);
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
-         * nbd_recv_coroutines_wake(), in this case we should not
-         * wake connection_co here, it will woken by last request.
-         */
-        aio_co_wake(s->connection_co);
-    }
+    nbd_recv_coroutines_wake(s, false);
 
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


