Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B10C5753B7
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 19:04:28 +0200 (CEST)
Received: from localhost ([::1]:42234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC2GJ-0005gv-Pt
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 13:04:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oC1yT-0005Rf-Fx
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 12:46:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oC1yA-0005UI-MN
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 12:45:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657817138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IpOw71yYlf9qKggeEUx0fXLq4M5UMaf9Wq5E4lBC4mo=;
 b=fBvBN4AiDYchD7jf4SedjyHWeXfue+cczyh7HeZwzSliGJKgFrVutMIgY16KhgJM7EFfBk
 9QA0gg3F8V6AdKCd6p1i7ZooM9aj6nKwyciddwAhLoSDgbyS3MioX0C+20bZiUt7wSpQnS
 GZTAmtqQxXXWXTqmPdujpnGzd5o7BAE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-cEdEE482MOGXu_YafLahsg-1; Thu, 14 Jul 2022 12:45:36 -0400
X-MC-Unique: cEdEE482MOGXu_YafLahsg-1
Received: by mail-ed1-f72.google.com with SMTP id
 t5-20020a056402524500b0043a923324b2so1817247edd.22
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 09:45:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IpOw71yYlf9qKggeEUx0fXLq4M5UMaf9Wq5E4lBC4mo=;
 b=2cVjolrXpIIyM84lcxgo74MSkUBg9M6wEGkgOAbAfd2mi7y1WfDuxT0AonnRzSascD
 /vRtrCAUqEy2YTw2mu+ptKaCWyc7tw8XKptVtp/eaYBzDZMQAJfEONqX8qRxn3t7SaxA
 CgTReW4jdsS/ZKYVuwgkJ0ct6YyvXSnv7/piILKzRengXC9umMJz+VxGhdZrO2TqVtSD
 y/IAjcIC+pGWKn7QSWbHBAgw6h3QSh5rRraBVPAgxJcWcKiPz7YpPH0oaWSJBXgkrUKq
 VBqagO2Q1JuhThxH/Uq9EEq/pC5NMe0hRb/u22W32wXDI0pscJ+bnqroUoiIMTOoHqpW
 hKHQ==
X-Gm-Message-State: AJIora/Zl8RTMNM4m+rHqfqIdCSOYl1InSl/eZ08Ki6P08DZK+tKyv+C
 dnqz0qROnlmCY7L8PZeQnnJnBCMg2Nnn5Vr44yesb1oEojAvHJJNa57n+n2lxYubHrD6Iy/rxAC
 W5LsyDqooW3BWeUU=
X-Received: by 2002:a05:6402:3681:b0:43a:7c29:466a with SMTP id
 ej1-20020a056402368100b0043a7c29466amr13314214edb.367.1657817134798; 
 Thu, 14 Jul 2022 09:45:34 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t+3UfBSuLtfiJ3/G+BNYOyQoiTCgt/gnQEYWWIoQ9gtHgSxxUhEhm/Ezvw00QUTWgGbkQKsg==
X-Received: by 2002:a05:6402:3681:b0:43a:7c29:466a with SMTP id
 ej1-20020a056402368100b0043a7c29466amr13314164edb.367.1657817134279; 
 Thu, 14 Jul 2022 09:45:34 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 r17-20020a056402035100b0043a6a7048absm1331168edw.95.2022.07.14.09.45.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jul 2022 09:45:33 -0700 (PDT)
Message-ID: <5439553d-25b2-fbe4-fabf-6e1179663dc7@redhat.com>
Date: Thu, 14 Jul 2022 18:45:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH 3/8] RFC: block: use transactions as a replacement of
 ->{can_}set_aio_context()
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-block@nongnu.org
References: <20220712211911.1302836-1-eesposit@redhat.com>
 <20220712211911.1302836-4-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220712211911.1302836-4-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12.07.22 23:19, Emanuele Giuseppe Esposito wrote:
> ---------
> RFC because I am not sure about the AioContext locks.
> - Do we need to take the new AioContext lock? what does it protect?
> - Taking the old AioContext lock is required now, because of
>    bdrv_drained_begin calling AIO_WAIT_WHILE that unlocks the
>    aiocontext. If we replace it with AIO_WAIT_WHILE_UNLOCKED,
>    could we get rid of taking every time the old AioContext?
>    drain would be enough to protect the graph modification.

It’s been a while, but as far as I remember (which may be wrong), the 
reason for how the locks are supposed to be taken was mostly that we 
need some defined state so that we know how to invoke 
bdrv_drained_begin() and bdrv_drained_end() (i.e. call the first one 
as-is, and switch the locks around for the latter one).

The idea of using _UNLOCKED sounds interesting, almost too obvious. I 
can’t see why that wouldn’t work, actually.

> ----------
>
> Simplify the way the aiocontext can be changed in a BDS graph.
> There are currently two problems in bdrv_try_set_aio_context:
> - There is a confusion of AioContext locks taken and released, because
>    we assume that old aiocontext is always taken and new one is
>    taken inside.

Yep, and that assumption is just broken in some cases, which is the main 
pain point I’m feeling with it right now.

For example, look at bdrv_attach_child_common(): Here, we attach a child 
to a parent, so we need to get them into a common AioContext. So first 
we try to put the child into the parent’s context, and if that fails, 
we’ll try the other way, putting the parent into the child’s context.

The problem is clear: The bdrv_try_set_aio_context() call requires us to 
hold the child’s current context but not the parent’s, and the 
child_class->set_aio_ctx() call requires the exact opposite.  But we 
never switch the context we have acquired, so this can’t both work.  
Better yet, nowhere is it defined what context a caller to 
bdrv_attach_child_common() will hold.

In practice, what happens here most of the time is that something will 
be moved from the main context to some other context, and since we’re in 
the main context already, that’ll just work.  But you can construct 
cases where something is attempted to be moved from an I/O thread into a 
different thread and then you’ll get a crash.

I’d be happy if we could do away with the requirement of having to hold 
any lock for changing a node’s AioContext.

> - It doesn't look very safe to call bdrv_drained_begin while some
>    nodes have already switched to the new aiocontext and others haven't.
>    This could be especially dangerous because bdrv_drained_begin polls, so
>    something else could be executed while graph is in an inconsistent
>    state.
>
> Additional minor nitpick: can_set and set_ callbacks both traverse the
> graph, both using the ignored list of visited nodes in a different way.
>
> Therefore, get rid of all of this and introduce a new callback,
> change_aio_context, that uses transactions to efficiently, cleanly
> and most importantly safely change the aiocontext of a graph.
>
> This new callback is a "merge" of the two previous ones:
> - Just like can_set_aio_context, recursively traverses the graph.
>    Marks all nodes that are visited using a GList, and checks if
>    they *could* change the aio_context.
> - For each node that passes the above check, add a new transaction
>    that implements a callback that effectively changes the aiocontext.
> - If a node is a BDS, add two transactions: one taking care of draining
>    the node at the beginning of the list (so that will be executed first)
>    and one at the end taking care of changing the AioContext.
> - Once done, the recursive function returns if *all* nodes can change
>    the AioContext. If so, commit the above transactions. Otherwise don't
>    do anything.
> - The transaction list contains first all "drain" transactions, so
>    we are sure we are draining all nodes in the same context, and then
>    all the other switch the AioContext. In this way we make sure that
>    bdrv_drained_begin() is always called under the old AioContext, and
>    bdrv_drained_end() under the new one.
> - Because of the above, we don't need to release and re-acquire the
>    old AioContext every time, as everything is done once (and not
>    per-node drain and aiocontext change).
>
> Note that the "change" API is not yet invoked anywhere.

So the idea is that we introduce a completely new transaction-based API 
to change BDSs’ AioContext, and then drop the old one, right?

> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block.c                            | 197 +++++++++++++++++++++++++++++
>   include/block/block-global-state.h |   9 ++
>   include/block/block_int-common.h   |   3 +
>   3 files changed, 209 insertions(+)
>
> diff --git a/block.c b/block.c
> index 267a39c0de..bda4e1bcef 100644
> --- a/block.c
> +++ b/block.c
> @@ -7437,6 +7437,51 @@ static bool bdrv_parent_can_set_aio_context(BdrvChild *c, AioContext *ctx,
>       return true;
>   }
>   
> +typedef struct BdrvStateSetAioContext {
> +    AioContext *new_ctx;
> +    BlockDriverState *bs;
> +} BdrvStateSetAioContext;
> +
> +/*
> + * Changes the AioContext used for fd handlers, timers, and BHs by this
> + * BlockDriverState and all its children and parents.
> + *
> + * Must be called from the main AioContext.
> + *
> + * The caller must own the AioContext lock for the old AioContext of bs, but it
> + * must not own the AioContext lock for new_context (unless new_context is the
> + * same as the current context of bs).

:(  Too bad.

> + *
> + * @visited will accumulate all visited BdrvChild object. The caller is

*objects

> + * responsible for freeing the list afterwards.
> + */
> +static bool bdrv_parent_change_aio_context(BdrvChild *c, AioContext *ctx,

The comment says “this BlockDriverState”, but then this function is 
called “_parent_” and takes a BdrvChild object.  Not quite clear what is 
meant.

You could argue it doesn’t matter because the function acts on all 
parents and children recursively anyway, so it’s doesn’t matter whether 
this is about c->bs or c’s parent, which is true, but still, the wording 
doesn’t seem quite as clear to me as it could be.

I also wonder why this function is so syntactically focused on BdrvChild 
object when I would have thought that those objects aren’t really 
associated with any AioContext, only the BDS is.  A BdrvChild just gives 
you a way to change a BDS’s parents’ AioContext.  Is it because of 
bdrv_child_try_change_aio_context()’s ignore_child parameter?

> +                                           GSList **visited, Transaction *tran,
> +                                           Error **errp)
> +{
> +    GLOBAL_STATE_CODE();
> +    if (g_slist_find(*visited, c)) {
> +        return true;
> +    }
> +    *visited = g_slist_prepend(*visited, c);
> +
> +    /*
> +     * A BdrvChildClass that doesn't handle AioContext changes cannot
> +     * tolerate any AioContext changes
> +     */
> +    if (!c->klass->change_aio_ctx) {
> +        char *user = bdrv_child_user_desc(c);
> +        error_setg(errp, "Changing iothreads is not supported by %s", user);
> +        g_free(user);
> +        return false;
> +    }
> +    if (!c->klass->change_aio_ctx(c, ctx, visited, tran, errp)) {
> +        assert(!errp || *errp);
> +        return false;
> +    }

This makes me wonder how this is supposed to change the children’s 
AioContext, because traditionally, BdrvChildClass contains only 
callbacks that affect the parent.

> +    return true;
> +}
> +
>   bool bdrv_child_can_set_aio_context(BdrvChild *c, AioContext *ctx,
>                                       GSList **ignore, Error **errp)
>   {
> @@ -7448,6 +7493,18 @@ bool bdrv_child_can_set_aio_context(BdrvChild *c, AioContext *ctx,
>       return bdrv_can_set_aio_context(c->bs, ctx, ignore, errp);
>   }
>   
> +bool bdrv_child_change_aio_context(BdrvChild *c, AioContext *ctx,
> +                                   GSList **visited, Transaction *tran,
> +                                   Error **errp)
> +{
> +    GLOBAL_STATE_CODE();
> +    if (g_slist_find(*visited, c)) {

Not the first time that we’re using linear lookup for such a thing, but 
it really irks me badly.  I think in any language that would provide 
collections by default, we’d be using a hash map here.

> +        return true;
> +    }
> +    *visited = g_slist_prepend(*visited, c);
> +    return bdrv_change_aio_context(c->bs, ctx, visited, tran, errp);
> +}
> +

OK, so this looks like the function that will change the children’s 
AioContext, and now I guess we’ll have a function that invokes both 
bdrv_{child,parent}_change_aio_context()...  And yes, we do, that is 
bdrv_change_aio_context().  So now it looks to me like the comment 
that’s above bdrv_parent_change_aio_context() actually belongs to 
bdrv_change_aio_context().

>   /* @ignore will accumulate all visited BdrvChild object. The caller is
>    * responsible for freeing the list afterwards. */
>   bool bdrv_can_set_aio_context(BlockDriverState *bs, AioContext *ctx,
> @@ -7475,6 +7532,99 @@ bool bdrv_can_set_aio_context(BlockDriverState *bs, AioContext *ctx,
>       return true;
>   }
>   
> +static void bdrv_drained_begin_commit(void *opaque)
> +{
> +    BdrvStateSetAioContext *state = (BdrvStateSetAioContext *) opaque;
> +
> +    /* Paired with bdrv_drained_end in bdrv_drained_end_clean() */
> +    bdrv_drained_begin(state->bs);
> +}
> +
> +static void bdrv_drained_end_clean(void *opaque)
> +{
> +    BdrvStateSetAioContext *state = (BdrvStateSetAioContext *) opaque;
> +    BlockDriverState *bs = (BlockDriverState *) state->bs;
> +    AioContext *new_context = state->new_ctx;
> +
> +    /*
> +     * drain only if bdrv_drained_begin_commit() and
> +     * bdrv_set_aio_context_commit() executed
> +     */
> +    if (bdrv_get_aio_context(bs) == new_context) {
> +        /* Paired with bdrv_drained_begin in bdrv_drained_begin_commit() */
> +        bdrv_drained_end(bs);
> +    }

So as far as I understood, in bdrv_set_aio_context_ignore(), we switch 
around the currently held context because this will poll bs’s context, 
and so because bs’s context changed, we now need to hold the new 
context.  I don’t know off the top of my head whether there’s a problem 
with holding both contexts simultaneously.

> +
> +    /* state is freed by set_aio_context->clean() */
> +}
> +
> +static void bdrv_set_aio_context_commit(void *opaque)
> +{
> +    BdrvStateSetAioContext *state = (BdrvStateSetAioContext *) opaque;
> +    BlockDriverState *bs = (BlockDriverState *) state->bs;
> +    AioContext *new_context = state->new_ctx;
> +    assert_bdrv_graph_writable(bs);
> +
> +    bdrv_detach_aio_context(bs);
> +    bdrv_attach_aio_context(bs, new_context);
> +}
> +
> +static TransactionActionDrv set_aio_context = {
> +    .commit = bdrv_set_aio_context_commit,
> +    .clean = g_free,
> +};
> +
> +static TransactionActionDrv drained_begin_end = {
> +    .commit = bdrv_drained_begin_commit,
> +    .clean = bdrv_drained_end_clean,
> +};
> +
> +/*
> + * @visited will accumulate all visited BdrvChild object. The caller is
> + * responsible for freeing the list afterwards.
> + */
> +bool bdrv_change_aio_context(BlockDriverState *bs, AioContext *ctx,
> +                             GSList **visited, Transaction *tran,
> +                             Error **errp)
> +{
> +    BdrvChild *c;
> +    BdrvStateSetAioContext *state;
> +
> +    GLOBAL_STATE_CODE();
> +
> +    if (bdrv_get_aio_context(bs) == ctx) {
> +        return true;
> +    }
> +
> +    QLIST_FOREACH(c, &bs->parents, next_parent) {
> +        if (!bdrv_parent_change_aio_context(c, ctx, visited, tran, errp)) {
> +            return false;
> +        }
> +    }
> +
> +    QLIST_FOREACH(c, &bs->children, next) {
> +        if (!bdrv_child_change_aio_context(c, ctx, visited, tran, errp)) {
> +            return false;
> +        }
> +    }
> +
> +    state = g_new(BdrvStateSetAioContext, 1);
> +    *state = (BdrvStateSetAioContext) {
> +        .new_ctx = ctx,
> +        .bs = bs,
> +    };
> +
> +    /* First half of transactions are drains */
> +    tran_add(tran, &drained_begin_end, state);
> +    /*
> +     * Second half of transactions takes care of setting the
> +     * AioContext and free the state
> +     */
> +    tran_add_tail(tran, &set_aio_context, state);

Completely subjective and I struggle to explain my feelings:

I don’t quite like the “first half, second half” explanation.  This 
makes it sound like these should be separate phases in the transaction, 
and if so, we should have an interface that allows you to put 
transaction handlers into an arbitrary number of phases.

We don’t have that interface, though, all we have are functions that 
carry the connotation of “execute as soon as possible” and “execute as 
late as possible”, so that if you use both in conjunction like here, you 
can be certain that drained_begin_end is executed before the respective 
set_aio_context.

The comments also struggle to convey how much black magic this is.

(Note that this is just my POV; also note that I’m not judging, black 
magic is cool, just difficult to grasp)

So what’s going on is (AFAIU) that we have this black magic 
drained_begin_end transaction which is added such that its commit 
handler will be run before the set_aio_context’s commit handler, but its 
clean handler will be run after set_aio_context’s commit handler.  So 
that’s why I call it black magic, because drained_begin_end can do both, 
it’ll first begin the drain, and then end it, all around some normal 
other transaction, such that this other one can operate on a completely 
drained graph.

I don’t hate this, it’s just that the comments don’t convey it.  I think 
there should be a big comment above drained_begin_end describing how 
it’s supposed to be used (i.e. you can wrap some other transaction in 
it, if you take care to add that other transaction with tran_add_tail(), 
and then its commit handlers will run on a drained graph); and then here 
we just describe that we’re doing exactly that, adding both transactions 
such that set_aio_context’s commit handler will run on a drained graph.


What I don’t like is that a BdrvChildClass.change_aio_ctx implementation 
must know this.  If it adds handlers to the transaction, it must be 
aware that if it does so with tran_add(), the commit handler won’t 
necessarily run on a fully drained graph; it must use tran_add_tail() 
for this, which isn’t obvious (and might be called a layering violation).

Perhaps that doesn’t matter because none of those .change_aio_ctx commit 
handlers will care, but, well.

The point is that the drained_begin_end transaction kind of abuses the 
system and adds new non-obvious semantics.

I can’t think of something better off the top of my head, though, and as 
long as this will remain the only place to call tran_add_tail(), I 
probably shouldn’t care.

...Ah, I can see patch 4 and 6 add exactly what I had feared.  Well, 
that isn’t great. :/

> +
> +    return true;
> +}
> +
>   int bdrv_child_try_set_aio_context(BlockDriverState *bs, AioContext *ctx,
>                                      BdrvChild *ignore_child, Error **errp)
>   {
> @@ -7498,6 +7648,53 @@ int bdrv_child_try_set_aio_context(BlockDriverState *bs, AioContext *ctx,
>       return 0;
>   }
>   
> +/*
> + * First, go recursively through all nodes in the graph, and see if they
> + * can change their AioContext.
> + * If so, add for each node a new transaction with a callback to change the
> + * AioContext with the new one.
> + * Once recursion is completed, if all nodes are allowed to change their
> + * AioContext then commit the transaction, running all callbacks in order.
> + * Otherwise don't do anything.

Nice explanation, but I’d start with something more simple to describe 
the external interface, like “Change bs's and recursively all of its 
parents' and children's AioContext to the given new context, returning 
an error if that isn't possible.  If ignore_child is not NULL, that 
child (and its subgraph) will not be touched.”

> + *
> + * This function still requires the caller to take the bs current
> + * AioContext lock, otherwise draining could fail since AIO_WAIT_WHILE

Well, let’s just say “will” instead of “could”.  Callers don’t need to 
know they can get lucky when they ignore the rules.

> + * assumes the lock is always held if bs is in another AioContext.
> + */
> +int bdrv_child_try_change_aio_context(BlockDriverState *bs, AioContext *ctx,
> +                                      BdrvChild *ignore_child, Error **errp)

Do the other functions need to be public?  Outside of this file, this 
one seems sufficient to me, but I may well be overlooking something.

Also, why is this function called bdrv_child_*, and not just 
bdrv_try_change_aio_context()?  (Or maybe have a 
bdrv_try_change_aio_context() variant without the ignore_child 
parameter, just like bdrv_try_set_aio_context()?)

Actually, wouldn’t just bdrv_change_aio_context() be sufficient?  I 
mean, it isn’t called bdrv_try_co_pwritev().  Most functions try to do 
something and return errors if they can’t.  Not sure if we need to make 
that clear in the name.

(I may be wrong, but I suspect bdrv_try_set_aio_context() is only named 
such that the compiler will check that the bdrv_set_aio_context() 
interface is completely unused; 
42a65f02f9b380bd8074882d5844d4ea033389cc’s commit message does seem to 
confirm that.)

> +{
> +    Transaction *tran;
> +    GSList *visited;
> +    int ret;
> +    GLOBAL_STATE_CODE();
> +
> +    tran = tran_new();
> +    visited = ignore_child ? g_slist_prepend(NULL, ignore_child) : NULL;
> +    ret = bdrv_change_aio_context(bs, ctx, &visited, tran, errp);
> +    g_slist_free(visited);
> +
> +    if (!ret) {
> +        /* just run clean() callbacks */
> +        tran_abort(tran);
> +        return -EPERM;
> +    }
> +
> +    /* Acquire the new context, if necessary */
> +    /* TODO: why do we need to take this AioContext lock? */

As I’ve said somewhere above, I think it’s because we need it for 
bdrv_drained_end().  I don’t know if there’s a problem with holding both 
contexts simultaneously.  (I would’ve just assumed that there must be a 
reason for bdrv_set_aio_context_ignore() to release old_context, but 
maybe there is actually no reason to it?)

> +    if (qemu_get_aio_context() != ctx) {
> +        aio_context_acquire(ctx);
> +    }
> +
> +    tran_commit(tran);
> +
> +    if (qemu_get_aio_context() != ctx) {
> +        aio_context_release(ctx);
> +    }
> +
> +    return 0;
> +}

Might be nice to have a version that has @tran in its interface so 
callers can incorporate it; Vladimir wanted transactionable 
context-setting.  Then again, doesn’t seem to hard to introduce that 
when needed.

> +
>   int bdrv_try_set_aio_context(BlockDriverState *bs, AioContext *ctx,
>                                Error **errp)
>   {

I like the idea of reimplementing it all on top of transactions!  I 
think it needs some tuning, but it definitely looks doable.

Hanna


