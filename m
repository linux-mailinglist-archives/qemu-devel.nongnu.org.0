Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C46C03565BD
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 09:47:23 +0200 (CEST)
Received: from localhost ([::1]:54402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU2uI-0001Fy-R5
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 03:47:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lU2tM-0000kb-CK; Wed, 07 Apr 2021 03:46:24 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:45794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lU2t4-0002dE-Kk; Wed, 07 Apr 2021 03:46:22 -0400
Received: from iva8-d077482f1536.qloud-c.yandex.net
 (iva8-d077482f1536.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2f26:0:640:d077:482f])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id E947F2E1A0B;
 Wed,  7 Apr 2021 10:45:57 +0300 (MSK)
Received: from iva8-5ba4ca89b0c6.qloud-c.yandex.net
 (iva8-5ba4ca89b0c6.qloud-c.yandex.net [2a02:6b8:c0c:a8ae:0:640:5ba4:ca89])
 by iva8-d077482f1536.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 jCyDpGWIma-jv08mvVc; Wed, 07 Apr 2021 10:45:57 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1617781557; bh=IKh223A/uuLNKM3xRU2IOX/VMb5kEscArKeMXsEuA7A=;
 h=In-Reply-To:Message-ID:Subject:To:From:Cc:References:Date;
 b=m5aJCKx26SnOZJk3nCEUrQckKqpkRXN3b6Tp+WDR34SeZ+pMZ5BEQvVLfDjyAt0Ci
 Eoxokcp6YGQNxbardKitcNVWq82JFUCwuLaJt+vCXmAGoGp6NurABkfC4KMRZ/1rM+
 TwYpWOxQd8saKoaOKHI7cqQb2EQp5FpI7PRz2zzc=
Authentication-Results: iva8-d077482f1536.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b080:8216::1:1b])
 by iva8-5ba4ca89b0c6.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 AIn1yn0Bco-jvpS1xQJ; Wed, 07 Apr 2021 10:45:57 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Wed, 7 Apr 2021 10:45:53 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 0/7] block/nbd: decouple reconnect from drain
Message-ID: <YG1jMSzW4uySSOyR@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, yc-core@yandex-team.ru,
 Eric Blake <eblake@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20210315060611.2989049-1-rvkagan@yandex-team.ru>
 <2066b4a5-7a6b-1810-2522-9118540ae4a9@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2066b4a5-7a6b-1810-2522-9118540ae4a9@virtuozzo.com>
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=rvkagan@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, yc-core@yandex-team.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 17, 2021 at 11:35:31AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 15.03.2021 09:06, Roman Kagan wrote:
> > The reconnection logic doesn't need to stop while in a drained section.
> > Moreover it has to be active during the drained section, as the requests
> > that were caught in-flight with the connection to the server broken can
> > only usefully get drained if the connection is restored.  Otherwise such
> > requests can only either stall resulting in a deadlock (before
> > 8c517de24a), or be aborted defeating the purpose of the reconnection
> > machinery (after 8c517de24a).
> > 
> > This series aims to just stop messing with the drained section in the
> > reconnection code.
> > 
> > While doing so it undoes the effect of 5ad81b4946 ("nbd: Restrict
> > connection_co reentrance"); as I've missed the point of that commit I'd
> > appreciate more scrutiny in this area.
> > 
> > Roman Kagan (7):
> >    block/nbd: avoid touching freed connect_thread
> >    block/nbd: use uniformly nbd_client_connecting_wait
> >    block/nbd: assert attach/detach runs in the proper context
> >    block/nbd: transfer reconnection stuff across aio_context switch
> >    block/nbd: better document a case in nbd_co_establish_connection
> >    block/nbd: decouple reconnect from drain
> >    block/nbd: stop manipulating in_flight counter
> > 
> >   block/nbd.c  | 191 +++++++++++++++++++++++----------------------------
> >   nbd/client.c |   2 -
> >   2 files changed, 86 insertions(+), 107 deletions(-)
> > 
> 
> 
> Hmm. The huge source of problems for this series is weird logic around
> drain and aio context switch in NBD driver.
> 
> Why do we have all these too complicated logic with abuse of in_flight
> counter in NBD? The answer is connection_co. NBD differs from other
> drivers, it has a coroutine independent of request coroutines. And we
> have to move this coroutine carefully to new aio context. We can't
> just enter it from the new context, we want to be sure that
> connection_co is in one of yield points that supports reentering.
> 
> I have an idea of how to avoid this thing: drop connection_co at all.
> 
> 1. nbd negotiation goes to connection thread and becomes independent
> of any aio context.
> 
> 2. waiting for server reply goes to request code. So, instead of
> reading the replay from socket always in connection_co, we read in the
> request coroutine, after sending the request. We'll need a CoMutex for
> it (as only one request coroutine should read from socket), and be
> prepared to coming reply is not for _this_ request (in this case we
> should wake another request and continue read from socket).

The problem with this approach is that it would change the reconnect
behavior.

Currently connection_co purpose is three-fold:

1) receive the header of the server response, identify the request it
   pertains to, and wake the resective request coroutine

2) take on the responsibility to reestablish the connection when it's
   lost

3) monitor the idle connection and initiate the reconnect as soon as the
   connection is lost

Points 1 and 2 can be moved to the request coroutines indeed.  However I
don't see how to do 3 without an extra ever-running coroutine.
Sacrificing it would mean that a connection loss wouldn't be noticed and
the recovery wouldn't be attempted until a request arrived.

This change looks to me like a degradation compared to the current
state.

Roman.

