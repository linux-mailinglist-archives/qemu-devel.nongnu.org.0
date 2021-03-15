Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E33D33C74F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 21:02:08 +0100 (CET)
Received: from localhost ([::1]:56200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLtPi-0003qY-Oc
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 16:02:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lLtLK-0007VY-OD; Mon, 15 Mar 2021 15:57:34 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:41670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lLtLG-0007UF-6H; Mon, 15 Mar 2021 15:57:32 -0400
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 66D2C2E12B2;
 Mon, 15 Mar 2021 22:57:25 +0300 (MSK)
Received: from vla5-d6d5ce7a4718.qloud-c.yandex.net
 (vla5-d6d5ce7a4718.qloud-c.yandex.net [2a02:6b8:c18:341e:0:640:d6d5:ce7a])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 ZMsHEhBefK-vO00gjPI; Mon, 15 Mar 2021 22:57:25 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1615838245; bh=F4d3ikk3RyNP7iw/hh7WTRlKTeIaHX5grOdr69i4MJM=;
 h=In-Reply-To:Message-ID:Subject:To:From:Cc:References:Date;
 b=tbZDysaPXjUDzkDvuXtYNoOBGYuL6xwYoLEOPT4HFZ5/bm8wNnrf/0KLxaR6FXaSP
 0ZGZ/l5deCql9vGdaGvBz/UYyIxEg5Qp+XgtQ2Pquy71ktp4Z2TSWTU0ZMVINfgd2Y
 bOWTnTjm8iBG3dc3ET689jqm9nF+ZWRFNQ07ukmw=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:23::1:15])
 by vla5-d6d5ce7a4718.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 HlPBXrFkK9-vOoKsSPM; Mon, 15 Mar 2021 22:57:24 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Mon, 15 Mar 2021 22:57:18 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 3/7] block/nbd: assert attach/detach runs in the proper
 context
Message-ID: <YE+8HqhzyQcXRjHB@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, yc-core@yandex-team.ru,
 Eric Blake <eblake@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20210315060611.2989049-1-rvkagan@yandex-team.ru>
 <20210315060611.2989049-4-rvkagan@yandex-team.ru>
 <6bc8bb0e-c22b-ccc1-4f19-5a7076f348ef@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6bc8bb0e-c22b-ccc1-4f19-5a7076f348ef@virtuozzo.com>
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=rvkagan@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On Mon, Mar 15, 2021 at 07:41:32PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 15.03.2021 09:06, Roman Kagan wrote:
> > Document (via a comment and an assert) that
> > nbd_client_detach_aio_context and nbd_client_attach_aio_context_bh run
> > in the desired aio_context
> > 
> > Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
> > ---
> >   block/nbd.c | 12 ++++++++++++
> >   1 file changed, 12 insertions(+)
> > 
> > diff --git a/block/nbd.c b/block/nbd.c
> > index 1d8edb5b21..658b827d24 100644
> > --- a/block/nbd.c
> > +++ b/block/nbd.c
> > @@ -241,6 +241,12 @@ static void nbd_client_detach_aio_context(BlockDriverState *bs)
> >   {
> >       BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
> > +    /*
> > +     * This runs in the (old, about to be detached) aio context of the @bs so
> > +     * accessing the stuff on @s is concurrency-free.
> > +     */
> > +    assert(qemu_get_current_aio_context() == bdrv_get_aio_context(bs));
> 
> Hmm. I don't think so. The handler is called from bdrv_set_aio_context_ignore(), which have the assertion g_assert(qemu_get_current_aio_context() == qemu_get_aio_context());. There is also a comment above bdrv_set_aio_context_ignore() "The caller must own the AioContext lock for the old AioContext of bs".
> 
> So, we are not in the home context of bs here. We are in the main aio context and we hold AioContext lock of old bs context.

You're absolutely right.  I'm wondering where I got the idea of this
assertion from...

> 
> > +
> >       /* Timer is deleted in nbd_client_co_drain_begin() */
> >       assert(!s->reconnect_delay_timer);
> >       /*
> > @@ -258,6 +264,12 @@ static void nbd_client_attach_aio_context_bh(void *opaque)
> >       BlockDriverState *bs = opaque;
> >       BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
> > +    /*
> > +     * This runs in the (new, just attached) aio context of the @bs so
> > +     * accessing the stuff on @s is concurrency-free.
> > +     */
> > +    assert(qemu_get_current_aio_context() == bdrv_get_aio_context(bs));
> 
> This is correct just because we are in a BH, scheduled for this
> context (I hope we can't reattach some third context prior to entering
> the BH in the second:). So, I don't think this assertion really adds
> something.

Indeed.

> > +
> >       if (s->connection_co) {
> >           /*
> >            * The node is still drained, so we know the coroutine has yielded in
> > 
> 
> I'm not sure that the asserted fact gives us "concurrency-free". For
> this we also need to ensure that all other things in the driver are
> always called in same aio context.. Still, it's a general assumption
> we have when writing block drivers "everything in one aio context, so
> don't care".. Sometime it leads to bugs, as some things are still
> called even from non-coroutine context. Also, Paolo said
> (https://lists.gnu.org/archive/html/qemu-devel/2020-08/msg03814.html)
> that many iothreads will send requests to bs, and the code in driver
> should be thread safe. I don't have good understanding of all these
> things, and what I have is:
> 
> For now (at least we don't have problems in Rhel based downstream) it
> maybe OK to think that in block-driver everything is protected by
> AioContext lock and all concurrency we have inside block driver is
> switching between coroutines but never real parallelism. But in
> general it's not so, and with multiqueue it's not so.. So, I'd not put
> such a comment :)

So the patch is bogus in every respect; let's just drop it.

I hope it doesn't invalidate completely the rest of the series though.

Meanwhile I certainly need to update my idea of concurrency assumptions
in the block layer.

Thanks,
Roman.

