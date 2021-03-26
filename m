Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D14E34A2F9
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 09:09:16 +0100 (CET)
Received: from localhost ([::1]:41600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPhWt-00070O-Kw
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 04:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lPhV6-0005nR-W9; Fri, 26 Mar 2021 04:07:25 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:54684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lPhV2-0005Lo-Ps; Fri, 26 Mar 2021 04:07:23 -0400
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 196B22E1A0A;
 Fri, 26 Mar 2021 11:07:14 +0300 (MSK)
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net [2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by myt5-23f0be3aa648.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 P5qKkoxjpD-7D0i6e6B; Fri, 26 Mar 2021 11:07:14 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1616746034; bh=3kJD+t7Yve04VcINiGzv4q3gz/btpGxODsrkIBoVLlc=;
 h=In-Reply-To:Message-ID:Subject:To:From:Cc:References:Date;
 b=Dv3SIqKOqX+cEx9C1zCkvn78TosCAGbLQLVPur88hZNA7ar/l0NkWnMGU1aEx7wwP
 Tl39L2jjgPL+5nlhBUeJb5te+mJXhG0gJlU/6+p8LlBRDk80LpE4ihOey4FHWlkFt+
 +BYtyOgvA032aXU/uDVTCouoqWy6Z2E3Q6c6VsMY=
Authentication-Results: myt5-23f0be3aa648.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b080:8226::1:f])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 j9T4rW8k6v-7DoOFbmM; Fri, 26 Mar 2021 11:07:13 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Fri, 26 Mar 2021 11:07:10 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 0/7] block/nbd: decouple reconnect from drain
Message-ID: <YF2WLresxHnvwSpN@rvkaganb.lan>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> 
> but this may be too much for soft freeze.

This approach does look appealing to me, and I gave it a quick shot but
the amount of changes this involves exceeds the rc tolerance indeed.

> Another idea:
> 
> You want all the requests be completed on drain_begin(), not
> cancelled. Actually, you don't need reconnect runnning during drained
> section for it. It should be enough just wait for all currenct
> requests before disabling the reconnect in drain_begin handler.

So effectively you suggest doing nbd's own drain within
bdrv_co_drain_begin callback.  I'm not totally sure there are no
assumptions this may break, but I'll try to look into this possibility.

Thanks,
Roman.

