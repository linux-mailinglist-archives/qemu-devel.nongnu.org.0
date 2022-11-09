Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3609A622B86
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 13:29:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oskCS-00056i-G7; Wed, 09 Nov 2022 07:29:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oskCL-00053w-Qj
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 07:28:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oskCK-0007bO-1i
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 07:28:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667996931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qCuUJa0VPDsqXDx+XzFGqn8Jfj9u/LtQeK0wKkgKolk=;
 b=TQyGY5uViMVeeT1K58ACsoEOIIhtKno+3CvxgfQiebxWiE3yNfxZY0KNVB4SmSvu8nGoaU
 21nA+U+V0jm8gEuZTg1DtHK5p+Rlffa6M08gZwpS609nGrK+qerejdLrgPAXRxPnfCZG11
 9JYKIfVx6zUNw67sqlXXmMM7rgvD41A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-8lgE_64VOPWHsWK7GAKWNg-1; Wed, 09 Nov 2022 07:28:47 -0500
X-MC-Unique: 8lgE_64VOPWHsWK7GAKWNg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 526CE858F13;
 Wed,  9 Nov 2022 12:28:47 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D44F492B17;
 Wed,  9 Nov 2022 12:28:46 +0000 (UTC)
Date: Wed, 9 Nov 2022 13:28:44 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-block@nongnu.org, eesposit@redhat.com, stefanha@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 02/13] test-bdrv-drain: Don't yield in
 .bdrv_co_drained_begin/end()
Message-ID: <Y2uc/Me+wcxoeiC9@redhat.com>
References: <20221108123738.530873-1-kwolf@redhat.com>
 <20221108123738.530873-3-kwolf@redhat.com>
 <7c2df33b-c7a2-6ed6-d198-1e70c1a009d5@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c2df33b-c7a2-6ed6-d198-1e70c1a009d5@yandex-team.ru>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 09.11.2022 um 11:50 hat Vladimir Sementsov-Ogievskiy geschrieben:
> On 11/8/22 15:37, Kevin Wolf wrote:
> > We want to change .bdrv_co_drained_begin/end() back to be non-coroutine
> > callbacks, so in preparation, avoid yielding in their implementation.
> > 
> > This does almost the same as the existing logic in bdrv_drain_invoke(),
> > by creating and entering coroutines internally. However, since the test
> > case is by far the heaviest user of coroutine code in drain callbacks,
> > it is preferable to have the complexity in the test case rather than the
> > drain core, which is already complicated enough without this.
> > 
> > The behaviour for bdrv_drain_begin() is unchanged because we increase
> > bs->in_flight and this is still polled. However, bdrv_drain_end()
> > doesn't wait for the spawned coroutine to complete any more. This is
> > fine, we don't rely on bdrv_drain_end() restarting all operations
> > immediately before the next aio_poll().
> > 
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
> >   tests/unit/test-bdrv-drain.c | 64 ++++++++++++++++++++++++++----------
> >   1 file changed, 46 insertions(+), 18 deletions(-)
> > 
> > diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
> > index 09dc4a4891..24f34e24ad 100644
> > --- a/tests/unit/test-bdrv-drain.c
> > +++ b/tests/unit/test-bdrv-drain.c
> > @@ -38,12 +38,22 @@ typedef struct BDRVTestState {
> >       bool sleep_in_drain_begin;
> >   } BDRVTestState;
> > +static void coroutine_fn sleep_in_drain_begin(void *opaque)
> > +{
> > +    BlockDriverState *bs = opaque;
> > +
> > +    qemu_co_sleep_ns(QEMU_CLOCK_REALTIME, 100000);
> > +    bdrv_dec_in_flight(bs);
> > +}
> > +
> >   static void coroutine_fn bdrv_test_co_drain_begin(BlockDriverState *bs)
> >   {
> >       BDRVTestState *s = bs->opaque;
> >       s->drain_count++;
> >       if (s->sleep_in_drain_begin) {
> > -        qemu_co_sleep_ns(QEMU_CLOCK_REALTIME, 100000);
> > +        Coroutine *co = qemu_coroutine_create(sleep_in_drain_begin, bs);
> > +        bdrv_inc_in_flight(bs);
> > +        aio_co_enter(bdrv_get_aio_context(bs), co);
> >       }
> >   }
> > @@ -1916,6 +1926,21 @@ static int coroutine_fn bdrv_replace_test_co_preadv(BlockDriverState *bs,
> >       return 0;
> >   }
> > +static void coroutine_fn bdrv_replace_test_drain_co(void *opaque)
> > +{
> > +    BlockDriverState *bs = opaque;
> > +    BDRVReplaceTestState *s = bs->opaque;
> > +
> > +    /* Keep waking io_co up until it is done */
> > +    while (s->io_co) {
> > +        aio_co_wake(s->io_co);
> > +        s->io_co = NULL;
> > +        qemu_coroutine_yield();
> > +    }
> > +    s->drain_co = NULL;
> > +    bdrv_dec_in_flight(bs);
> > +}
> 
> Same question, don't we need aio_wait_kick() after decrement in_flight.
> 
> Also, seems we have here extra waiting level: a special coroutine that waits in a loop.
> 
> Could we just do in .drain_begin:
> 
> if (s->io_co) {
>    bdrv_inc_in_flight(bs);
> }
> 
> and in .co_preadv instead of waking s->drain_co simply
> 
> if (s->drain_count == 1) {
>   bdrv_dec_in_flight(bs);
>   aio_wait_kick();
> }
> 
> or even better, do inc in_flight when io_co becomes not NULL.

I just did the minimal transformation of the existing code in the test
case.

These test cases often test specific interactions between coroutines, so
I could imagine that the additional yield is not just some inefficient
code, but coroutines that yield multiple times could actually be the
scenario that is supposed to be tested.

I didn't check it for this one, but making test cases more efficient
isn't automatically a good thing if they then end up not testing certain
code paths any more. So if you intend to make a change here, it would
need a careful analysis of all test cases that use the driver.

Kevin


