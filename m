Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B1C5F7BC3
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 18:45:26 +0200 (CEST)
Received: from localhost ([::1]:36294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogqTV-00058a-Ll
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 12:45:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogpbM-0007EO-Ah
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 11:49:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogpbH-000201-Ul
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 11:49:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665157762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7syOb34eelszocBUaX7V5sO3QxPMu87I6W0jqZ6JyEc=;
 b=Jegt5Zdj68qon20YMnLmBclzQnpGBOTplZipkoU48p/H/ZK2Yh63DCIDsfUGB2OzNvAXno
 quVwewJYUZ6/XxTlPcq/+gpMF31bPHtBF9zApalYXp0hmU3RWLAZmez/+eapF7/9F/oErD
 pMrjiyJ5bF4RJlSwSN/sEw4oZgJZqgw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-dgYR8ipxM9qFexLFzNCGBA-1; Fri, 07 Oct 2022 11:49:19 -0400
X-MC-Unique: dgYR8ipxM9qFexLFzNCGBA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D1F15855308;
 Fri,  7 Oct 2022 15:49:18 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.109])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55B68207B2B0;
 Fri,  7 Oct 2022 15:49:17 +0000 (UTC)
Date: Fri, 7 Oct 2022 17:49:16 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 02/11] block: use transactions as a replacement of
 ->{can_}set_aio_context()
Message-ID: <Y0BKfBCKOr8Rk99f@redhat.com>
References: <20220725122120.309236-1-eesposit@redhat.com>
 <20220725122120.309236-3-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220725122120.309236-3-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Am 25.07.2022 um 14:21 hat Emanuele Giuseppe Esposito geschrieben:
> Simplify the way the aiocontext can be changed in a BDS graph.
> There are currently two problems in bdrv_try_set_aio_context:
> - There is a confusion of AioContext locks taken and released, because
>   we assume that old aiocontext is always taken and new one is
>   taken inside.
> 
> - It doesn't look very safe to call bdrv_drained_begin while some
>   nodes have already switched to the new aiocontext and others haven't.
>   This could be especially dangerous because bdrv_drained_begin polls, so
>   something else could be executed while graph is in an inconsistent
>   state.
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
>   Marks all nodes that are visited using a GList, and checks if
>   they *could* change the aio_context.
> - For each node that passes the above check, drain it and add a new transaction
>   that implements a callback that effectively changes the aiocontext.
> - Once done, the recursive function returns if *all* nodes can change
>   the AioContext. If so, commit the above transactions.
>   Regardless of the outcome, call transaction.clean() to undo all drains
>   done in the recursion.
> - The transaction list is scanned only after all nodes are being drained, so
>   we are sure that they all are in the same context, and then
>   we switch their AioContext, concluding the drain only after all nodes
>   switched to the new AioContext. In this way we make sure that
>   bdrv_drained_begin() is always called under the old AioContext, and
>   bdrv_drained_end() under the new one.
> - Because of the above, we don't need to release and re-acquire the
>   old AioContext every time, as everything is done once (and not
>   per-node drain and aiocontext change).
> 
> Note that the "change" API is not yet invoked anywhere.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

For future work, please change the way you construct your series. It's
not good practice to have many patches that just add dead code (and even
patches that optimise that dead code!) and then a final patch to enable
everything at once.

It's not only hard to review because you never know what to compare it
to, but also any regression will always happen on the final patch and
you can't know which patch actually contains the broken code.

Or looking at it from a slightly different angle, we should also try to
ensure that the code makes sense after each individual commit. Having
lots of duplicated code doesn't necessarily make a lot of sense.

> diff --git a/block.c b/block.c
> index 58a9cfc8b7..c80e49009a 100644
> --- a/block.c
> +++ b/block.c
> @@ -108,6 +108,10 @@ static void bdrv_reopen_abort(BDRVReopenState *reopen_state);
>  
>  static bool bdrv_backing_overridden(BlockDriverState *bs);
>  
> +static bool bdrv_change_aio_context(BlockDriverState *bs, AioContext *ctx,
> +                                    GSList **visited, Transaction *tran,
> +                                    Error **errp);
> +
>  /* If non-zero, use only whitelisted block drivers */
>  static int use_bdrv_whitelist;
>  
> @@ -7325,7 +7329,7 @@ static void bdrv_attach_aio_context(BlockDriverState *bs,
>   * must not own the AioContext lock for new_context (unless new_context is the
>   * same as the current context of bs).
>   *
> - * @ignore will accumulate all visited BdrvChild object. The caller is
> + * @ignore will accumulate all visited BdrvChild objects. The caller is
>   * responsible for freeing the list afterwards.
>   */
>  void bdrv_set_aio_context_ignore(BlockDriverState *bs,
> @@ -7434,6 +7438,38 @@ static bool bdrv_parent_can_set_aio_context(BdrvChild *c, AioContext *ctx,
>      return true;
>  }
>  
> +typedef struct BdrvStateSetAioContext {
> +    AioContext *new_ctx;
> +    BlockDriverState *bs;
> +} BdrvStateSetAioContext;
> +
> +static bool bdrv_parent_change_aio_context(BdrvChild *c, AioContext *ctx,
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
> +    return true;
> +}

This is an exact copy of bdrv_parent_can_set_aio_context() except for
renames and adding a tran parameter.

Of course, nobody implements .change_aio_ctx() yet, so this doesn't
actually work yet after this patch.

>  bool bdrv_child_can_set_aio_context(BdrvChild *c, AioContext *ctx,
>                                      GSList **ignore, Error **errp)
>  {
> @@ -7445,6 +7481,18 @@ bool bdrv_child_can_set_aio_context(BdrvChild *c, AioContext *ctx,
>      return bdrv_can_set_aio_context(c->bs, ctx, ignore, errp);
>  }
>  
> +bool bdrv_child_change_aio_context(BdrvChild *c, AioContext *ctx,
> +                                   GSList **visited, Transaction *tran,
> +                                   Error **errp)
> +{
> +    GLOBAL_STATE_CODE();
> +    if (g_slist_find(*visited, c)) {
> +        return true;
> +    }
> +    *visited = g_slist_prepend(*visited, c);
> +    return bdrv_change_aio_context(c->bs, ctx, visited, tran, errp);
> +}

This is an exact copy of bdrv_child_can_set_aio_context() except for
renames and adding a tran parameter.

Same as above, doesn't work yet after this patch.

>  /* @ignore will accumulate all visited BdrvChild object. The caller is
>   * responsible for freeing the list afterwards. */
>  bool bdrv_can_set_aio_context(BlockDriverState *bs, AioContext *ctx,
> @@ -7472,6 +7520,85 @@ bool bdrv_can_set_aio_context(BlockDriverState *bs, AioContext *ctx,
>      return true;
>  }
>  
> +static void bdrv_drained_end_clean(void *opaque)

bdrv_set_aio_context_clean() is a better name for this given that the
transaction is called set_aio_context.

> +{
> +    BdrvStateSetAioContext *state = (BdrvStateSetAioContext *) opaque;
> +    BlockDriverState *bs = (BlockDriverState *) state->bs;
> +
> +    /* Paired with bdrv_drained_begin in bdrv_change_aio_context() */
> +    bdrv_drained_end(bs);
> +
> +    g_free(state);
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

This replaces bdrv_set_aio_context_ignore(), except for draining and
AioContext locking, which is now handled on the top level by
bdrv_child_try_change_aio_context().

Let's see what other differences I can find:

* bdrv_set_aio_context_ignore() has a old_context == new_context check
  and does nothing in this case. bdrv_change_aio_context() wouldn't even
  have put the node into the transaction in this case, so this callback
  won't be called in the first place and we don't need it here. Good.

* Recursion to children and parents: To be covered by the commit action
  of transaction action added by new and not yet implemented callback
  .change_aio_ctx().

* bdrv_detach_aio_context(bs) used to run with the AioContext lock of
  the old context, from which we are detachting. Now it runs with the
  AioContext lock of the new AioContext. Are we sure that this is safe?
  Please explain in the commit message.

> +static TransactionActionDrv set_aio_context = {
> +    .commit = bdrv_set_aio_context_commit,
> +    .clean = bdrv_drained_end_clean,
> +};
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
> + *
> + * @visited will accumulate all visited BdrvChild object. The caller is

s/object/objects/

> + * responsible for freeing the list afterwards.
> + */
> +static bool bdrv_change_aio_context(BlockDriverState *bs, AioContext *ctx,
> +                                    GSList **visited, Transaction *tran,
> +                                    Error **errp)

This is roughly speaking the replacement for bdrv_can_set_aio_context().
Let's see what changes in the details.

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

Assuming that bdrv_child/parent_change_aio_context() still do the same
as their existing counterparts, until here it's the same as before.

> +    state = g_new(BdrvStateSetAioContext, 1);
> +    *state = (BdrvStateSetAioContext) {
> +        .new_ctx = ctx,
> +        .bs = bs,
> +    };
> +
> +    /* Paired with bdrv_drained_end in bdrv_drained_end_clean() */
> +    bdrv_drained_begin(bs);

This one is the new thing.

> +    tran_add(tran, &set_aio_context, state);
> +    return true;
> +}
> +
>  int bdrv_child_try_set_aio_context(BlockDriverState *bs, AioContext *ctx,
>                                     BdrvChild *ignore_child, Error **errp)
>  {
> @@ -7495,6 +7622,80 @@ int bdrv_child_try_set_aio_context(BlockDriverState *bs, AioContext *ctx,
>      return 0;
>  }
>  
> +/*
> + * Change bs's and recursively all of its parents' and children's AioContext
> + * to the given new context, returning an error if that isn't possible.
> + *
> + * There are two phases: recursion check and linear change
> + * Recursion takes care of checking that all nodes support changing AioContext
> + * and drains them, builing a linear list of callbacks to run if it is
> + * successful (the transaction itself).
> + * Linear change consists in running all callbacks collected in the recursion
> + * to switch all nodes AioContext lock (transaction commit).

This sounds more like implementation details that are not relevant for
the caller, and could be documented in the body of the function.

> + * If ignore_child is not NULL, that child (and its subgraph) will not
> + * be touched.
> + *
> + * This function still requires the caller to take the bs current
> + * AioContext lock, otherwise draining will fail since AIO_WAIT_WHILE
> + * assumes the lock is always held if bs is in another AioContext.
> + * For the same reason, it temporarily holds also the new AioContext, since
> + * bdrv_drained_end calls BDRV_POLL_WHILE that assumes the lock is taken too.

So what is the contract regarding the new context? Like in
bdrv_child_try_set_aio_context(), the caller must *not* hold its lock?

> + */
> +int bdrv_child_try_change_aio_context(BlockDriverState *bs, AioContext *ctx,
> +                                      BdrvChild *ignore_child, Error **errp)
> +{
> +    Transaction *tran;
> +    GSList *visited;
> +    int ret;
> +    AioContext *old_context = bdrv_get_aio_context(bs);
> +    GLOBAL_STATE_CODE();
> +
> +    /* Recursion phase: go through all nodes of the graph */
> +    tran = tran_new();
> +    visited = ignore_child ? g_slist_prepend(NULL, ignore_child) : NULL;
> +    ret = bdrv_change_aio_context(bs, ctx, &visited, tran, errp);
> +    g_slist_free(visited);

So the immediate action of bdrv_change_aio_context() replaces
bdrv_can_set_aio_context(). The code here is identical to
bdrv_child_try_set_aio_context() then.

> +    /* Linear phase: go through all callbacks collected in the transaction */
> +
> +    if (!ret) {
> +        /* Just run clean() callbacks. No AioContext changed. */
> +        tran_abort(tran);
> +        return -EPERM;
> +    }
> +
> +    /*
> +     * Release old AioContext, it won't be needed anymore, as all
> +     * bdrv_drained_begin() have been called already.
> +     */
> +    if (qemu_get_aio_context() != old_context) {
> +        aio_context_release(old_context);
> +    }
> +
> +    /*
> +     * Acquire new AioContext since bdrv_drained_end() is going to be called
> +     * after we switched all nodes in the new AioContext, and the function
> +     * assumes that the lock of the bs is always taken.
> +     */
> +    if (qemu_get_aio_context() != ctx) {
> +        aio_context_acquire(ctx);
> +    }

This part is new compared to bdrv_child_try_set_aio_context(). So
essentially the part that was bdrv_set_aio_context_ignore() runs under
the new AioContext's lock instead of the old one.

> +    tran_commit(tran);

This is what replaces bdrv_set_aio_context_ignore(). We don't build the
ignore list a second time because we're still using the list of nodes
that we collected above.

It is also what undrains all nodes again. This is why we now need to
hold the lock of the new AioContext.

> +    if (qemu_get_aio_context() != ctx) {
> +        aio_context_release(ctx);
> +    }
> +
> +    /* Re-acquire the old AioContext, since the caller takes and releases it. */
> +    if (qemu_get_aio_context() != old_context) {
> +        aio_context_acquire(old_context);
> +    }
> +
> +    return 0;
> +}

Trying to summarise the differences in this function compared to the
existing mechanism:

* bdrv_set_aio_context_ignore() run with the old AioContext locked and
  the new one not locked, bdrv_set_aio_context_commit() runs with the
  new one locked and the old one not locked.

* All affected nodes are now drained before calling what was
  bdrv_set_aio_context_ignore() instead of individually inside the
  function. This is the improvement promised in the commit message as it
  avoids polling while the graph is in an inconsistent state.

Everything else is essentially just a copy of the existing code.

>  int bdrv_try_set_aio_context(BlockDriverState *bs, AioContext *ctx,
>                               Error **errp)
>  {

So this looks good under two conditions that I haven't checked yet: That
bdrv_detach_aio_context() is actually safe when called with the "wrong"
AioContext lock held, and that the .change_aio_context() callbacks are
implemented correctly in a later patch.

To reiterate my initial point, reviewing this took me some effort to
match the new functions with the existing ones they duplicate and then
manual diffing of each, which is kind of error prone. I feel the better
approach would have been adding a tran parameter (with empty commit and
abort) to the existing functions in a first patch and then change stuff
in a second patch (in the real code, not dead code to be enabled later),
so that you would actually see the real changes instead of having to
find them between lots of unchanged copied code.

Kevin


