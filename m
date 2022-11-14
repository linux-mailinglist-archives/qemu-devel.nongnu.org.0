Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B36628F04
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 02:15:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouioY-0000WL-PL; Mon, 14 Nov 2022 18:24:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ouifU-0001X6-I5
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:15:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ouYdc-0007Vq-4B
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 07:32:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668429151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EAQNMkAPsyccGg8d83zXqTcvCcjnYIorwFpTlexZC/4=;
 b=FZ7ajJbXChQcDqhYT2NgpJ9M/UFyChxY3MsMhijSGGruriVIKPplncuFavrd1mI1ejBxZm
 r21zds2JgYfvAa5NKJJLXv/GRcvpZGZFS9NxWufp9qOikbnd/NDhygGD3fGBtYZhQSLSfm
 tRK7bvmh1IoSS9ioDHm9LLHF6dEEXPY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-PtB5SqkBN4qEe7LizJyIKw-1; Mon, 14 Nov 2022 07:32:28 -0500
X-MC-Unique: PtB5SqkBN4qEe7LizJyIKw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE8D4299E765;
 Mon, 14 Nov 2022 12:32:27 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A7102028DC1;
 Mon, 14 Nov 2022 12:32:26 +0000 (UTC)
Date: Mon, 14 Nov 2022 13:32:23 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-block@nongnu.org, eesposit@redhat.com, stefanha@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 10/13] block: Call drain callbacks only once
Message-ID: <Y3I1Vy5MH5zMhFy6@redhat.com>
References: <20221108123738.530873-1-kwolf@redhat.com>
 <20221108123738.530873-11-kwolf@redhat.com>
 <9fc70d98-24de-0461-cb13-864c7d77e90c@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9fc70d98-24de-0461-cb13-864c7d77e90c@yandex-team.ru>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Am 09.11.2022 um 19:05 hat Vladimir Sementsov-Ogievskiy geschrieben:
> On 11/8/22 15:37, Kevin Wolf wrote:
> > We only need to call both the BlockDriver's callback and the parent
> > callbacks when going from undrained to drained or vice versa. A second
> > drain section doesn't make a difference for the driver or the parent,
> > they weren't supposed to send new requests before and after the second
> > drain.
> > 
> > One thing that gets in the way is the 'ignore_bds_parents' parameter in
> > bdrv_do_drained_begin_quiesce() and bdrv_do_drained_end(): If it is true
> > for the first drain, bs->quiesce_counter will be non-zero, but the
> > parent callbacks still haven't been called, so a second drain where it
> > is false would still have to call them.
> > 
> > Instead of keeping track of this, let's just get rid of the parameter.
> > It was introduced in commit 6cd5c9d7b2d as an optimisation so that
> > during bdrv_drain_all(), we wouldn't recursively drain all parents up to
> > the root for each node, resulting in quadratic complexity. As it happens,
> > calling the callbacks only once solves the same problem, so as of this
> > patch, we'll still have O(n) complexity and ignore_bds_parents is not
> > needed any more.
> > 
> > This patch only ignores the 'ignore_bds_parents' parameter. It will be
> > removed in a separate patch.
> > 
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
> >   block.c                      | 13 ++++++-------
> >   block/io.c                   | 24 +++++++++++++-----------
> >   tests/unit/test-bdrv-drain.c | 16 ++++++++++------
> >   3 files changed, 29 insertions(+), 24 deletions(-)
> > 
> > diff --git a/block.c b/block.c
> > index 9d082631d9..8878586f6e 100644
> > --- a/block.c
> > +++ b/block.c
> > @@ -2816,7 +2816,6 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
> >   {
> >       BlockDriverState *old_bs = child->bs;
> >       int new_bs_quiesce_counter;
> > -    int drain_saldo;
> >       assert(!child->frozen);
> >       assert(old_bs != new_bs);
> > @@ -2827,15 +2826,13 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
> >       }
> >       new_bs_quiesce_counter = (new_bs ? new_bs->quiesce_counter : 0);
> > -    drain_saldo = new_bs_quiesce_counter - child->parent_quiesce_counter;
> >       /*
> >        * If the new child node is drained but the old one was not, flush
> >        * all outstanding requests to the old child node.
> >        */
> > -    while (drain_saldo > 0 && child->klass->drained_begin) {
> > +    if (new_bs_quiesce_counter && !child->parent_quiesce_counter) {
> 
> Looks like checking for child->klass->drained_begin was a wrong thing
> even prepatch?

I'm not sure if it was strictly wrong in practice, but at least
unnecessary. It would have been wrong if a BdrvChildClass implemented
for example .drained_begin, but not .drain_end. But I think we always
implement all three of .drained_begin/poll/end or none of them.

> Also, parent_quiesce_counter actually becomes a boolean variable..
> Should we stress it by new type and name?

Ok, but I would do that in a separate patch. Maybe 'bool drains_parent'.

> >           bdrv_parent_drained_begin_single(child, true);
> > -        drain_saldo--;
> >       }
> >       if (old_bs) {
> > @@ -2859,7 +2856,6 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
> >            * more often.
> >            */
> 
> the comment above ^^^ should be updated, we are not going to call
> drained_end more than once anyway
> 
> >           assert(new_bs->quiesce_counter <= new_bs_quiesce_counter);
> 
> do we still need this assertion and the comment at all?

Patch 12 removes both, but I can do it already here.

> > -        drain_saldo += new_bs->quiesce_counter - new_bs_quiesce_counter;
> >           if (child->klass->attach) {
> >               child->klass->attach(child);
> > @@ -2869,10 +2865,13 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
> >       /*
> >        * If the old child node was drained but the new one is not, allow
> >        * requests to come in only after the new node has been attached.
> > +     *
> > +     * Update new_bs_quiesce_counter because bdrv_parent_drained_begin_single()
> > +     * polls, which could have changed the value.
> >        */
> > -    while (drain_saldo < 0 && child->klass->drained_end) {
> > +    new_bs_quiesce_counter = (new_bs ? new_bs->quiesce_counter : 0);
> > +    if (!new_bs_quiesce_counter && child->parent_quiesce_counter) {
> >           bdrv_parent_drained_end_single(child);
> > -        drain_saldo++;
> >       }
> >   }
> > diff --git a/block/io.c b/block/io.c
> > index 870a25d7a5..87c7a92f15 100644
> > --- a/block/io.c
> > +++ b/block/io.c
> > @@ -62,7 +62,7 @@ void bdrv_parent_drained_end_single(BdrvChild *c)
> >   {
> >       IO_OR_GS_CODE();
> > -    assert(c->parent_quiesce_counter > 0);
> > +    assert(c->parent_quiesce_counter == 1);
> >       c->parent_quiesce_counter--;
> >       if (c->klass->drained_end) {
> >           c->klass->drained_end(c);
> > @@ -109,6 +109,7 @@ static bool bdrv_parent_drained_poll(BlockDriverState *bs, BdrvChild *ignore,
> >   void bdrv_parent_drained_begin_single(BdrvChild *c, bool poll)
> >   {
> >       IO_OR_GS_CODE();
> > +    assert(c->parent_quiesce_counter == 0);
> >       c->parent_quiesce_counter++;
> >       if (c->klass->drained_begin) {
> >           c->klass->drained_begin(c);
> > @@ -352,16 +353,16 @@ void bdrv_do_drained_begin_quiesce(BlockDriverState *bs,
> >                                      BdrvChild *parent, bool ignore_bds_parents)
> >   {
> >       IO_OR_GS_CODE();
> > -    assert(!qemu_in_coroutine());
> 
> why that is dropped? seems unrelated to the commit

I'm sure I added it because I actually got an assertion failure, but I
can't reproduce it on this commit now. At the end of the series tests do
fail without this removed. I'll double check which commit is right one
to remove it.

> >       /* Stop things in parent-to-child order */
> >       if (qatomic_fetch_inc(&bs->quiesce_counter) == 0) {
> >           aio_disable_external(bdrv_get_aio_context(bs));
> > -    }
> > -    bdrv_parent_drained_begin(bs, parent, ignore_bds_parents);
> > -    if (bs->drv && bs->drv->bdrv_drain_begin) {
> > -        bs->drv->bdrv_drain_begin(bs);
> > +        /* TODO Remove ignore_bds_parents, we don't consider it any more */
> > +        bdrv_parent_drained_begin(bs, parent, false);
> > +        if (bs->drv && bs->drv->bdrv_drain_begin) {
> > +            bs->drv->bdrv_drain_begin(bs);
> > +        }
> >       }
> >   }
> > @@ -412,13 +413,14 @@ static void bdrv_do_drained_end(BlockDriverState *bs, BdrvChild *parent,
> >       assert(bs->quiesce_counter > 0);
> >       /* Re-enable things in child-to-parent order */
> 
> the comment should be moved too, I think

It is the same place as in bdrv_do_drained_begin_quiesce().

> > -    if (bs->drv && bs->drv->bdrv_drain_end) {
> > -        bs->drv->bdrv_drain_end(bs);
> > -    }
> > -    bdrv_parent_drained_end(bs, parent, ignore_bds_parents);
> > -
> >       old_quiesce_counter = qatomic_fetch_dec(&bs->quiesce_counter);
> >       if (old_quiesce_counter == 1) {
> > +        if (bs->drv && bs->drv->bdrv_drain_end) {
> > +            bs->drv->bdrv_drain_end(bs);
> > +        }
> > +        /* TODO Remove ignore_bds_parents, we don't consider it any more */
> > +        bdrv_parent_drained_end(bs, parent, false);
> > +
> >           aio_enable_external(bdrv_get_aio_context(bs));
> >       }
> >   }

Kevin


