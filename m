Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA8F374228
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 18:47:01 +0200 (CEST)
Received: from localhost ([::1]:34580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leKfr-0001Jg-US
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 12:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1leKEs-0003SO-CU
 for qemu-devel@nongnu.org; Wed, 05 May 2021 12:19:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1leKEn-0000sN-HX
 for qemu-devel@nongnu.org; Wed, 05 May 2021 12:19:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620231540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G73NVOGn4a4IH7gNyw5Q/2b4p6uW5VNMl01jo/eGVsE=;
 b=A+HTqIIAQZeLJP4eQUWnRAHP7ci8+fhIbGjGr5aAO1WtDfHu4jti3ksQpcgrSApiHNQebJ
 7RmXujHKIEskyS+MAoUGYzxDnKGBxV2QCGt8kKgG7ECsGCCWtLszttqwjImLY3LhBi7jzG
 p6Aa5xd/v1zJXr4cCpgEQN+FHmQlb+s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-IW1qLxQQOwisbYSgHNlzxw-1; Wed, 05 May 2021 12:18:59 -0400
X-MC-Unique: IW1qLxQQOwisbYSgHNlzxw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A293107ACCA;
 Wed,  5 May 2021 16:18:57 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-138.ams2.redhat.com [10.36.115.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F1EA50AD6;
 Wed,  5 May 2021 16:18:55 +0000 (UTC)
Date: Wed, 5 May 2021 18:18:54 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v4 4/6] block: Support multiple reopening with
 x-blockdev-reopen
Message-ID: <YJLFboRME/eFXetd@merkur.fritz.box>
References: <cover.1616000692.git.berto@igalia.com>
 <ed95ecd1018e45869d02e4525fc65216e7ebd370.1616000692.git.berto@igalia.com>
 <b0f51127-d3c0-7334-6dcf-45f7d66270c2@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <b0f51127-d3c0-7334-6dcf-45f7d66270c2@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 18.03.2021 um 15:45 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 17.03.2021 20:15, Alberto Garcia wrote:
> > Signed-off-by: Alberto Garcia <berto@igalia.com>
> > ---
> >   qapi/block-core.json       | 18 +++++----
> >   blockdev.c                 | 78 +++++++++++++++++++++++---------------
> >   tests/qemu-iotests/155     |  9 +++--
> >   tests/qemu-iotests/165     |  4 +-
> >   tests/qemu-iotests/245     | 27 +++++++------
> >   tests/qemu-iotests/248     |  2 +-
> >   tests/qemu-iotests/248.out |  2 +-
> >   tests/qemu-iotests/296     |  9 +++--
> >   tests/qemu-iotests/298     |  4 +-
> >   9 files changed, 92 insertions(+), 61 deletions(-)
> > 
> > diff --git a/qapi/block-core.json b/qapi/block-core.json
> > index 9f555d5c1d..9150f765da 100644
> > --- a/qapi/block-core.json
> > +++ b/qapi/block-core.json
> > @@ -4181,13 +4181,15 @@
> >   ##
> >   # @x-blockdev-reopen:
> >   #
> > -# Reopens a block device using the given set of options. Any option
> > -# not specified will be reset to its default value regardless of its
> > -# previous status. If an option cannot be changed or a particular
> > +# Reopens one or more block devices using the given set of options.
> > +# Any option not specified will be reset to its default value regardless
> > +# of its previous status. If an option cannot be changed or a particular
> >   # driver does not support reopening then the command will return an
> > -# error.
> > +# error. All devices in the list are reopened in one transaction, so
> > +# if one of them fails then the whole transaction is cancelled.
> >   #
> > -# The top-level @node-name option (from BlockdevOptions) must be
> > +# The command receives a list of block devices to reopen. For each one
> > +# of them, the top-level @node-name option (from BlockdevOptions) must be
> >   # specified and is used to select the block device to be reopened.
> >   # Other @node-name options must be either omitted or set to the
> >   # current name of the appropriate node. This command won't change any
> > @@ -4207,8 +4209,8 @@
> >   #
> >   #  4) NULL: the current child (if any) is detached.
> >   #
> > -# Options (1) and (2) are supported in all cases, but at the moment
> > -# only @backing allows replacing or detaching an existing child.
> > +# Options (1) and (2) are supported in all cases. Option (3) is
> > +# supported for @file and @backing, and option (4) for @backing only.
> 
> A bit of it should be already updated in "[PATCH v4 2/6] block: Allow
> changing bs->file on reopen"
> 
> >   #
> >   # Unlike with blockdev-add, the @backing option must always be present
> >   # unless the node being reopened does not have a backing file and its
> > @@ -4218,7 +4220,7 @@
> >   # Since: 4.0
> >   ##
> >   { 'command': 'x-blockdev-reopen',
> > -  'data': 'BlockdevOptions', 'boxed': true }
> > +  'data': { 'options': ['BlockdevOptions'] } }
> >   ##
> >   # @blockdev-del:
> > diff --git a/blockdev.c b/blockdev.c
> > index 825d40aa11..7019397b05 100644
> > --- a/blockdev.c
> > +++ b/blockdev.c
> > @@ -3580,46 +3580,64 @@ fail:
> >       visit_free(v);
> >   }
> > -void qmp_x_blockdev_reopen(BlockdevOptions *options, Error **errp)
> > +void qmp_x_blockdev_reopen(BlockdevOptionsList *reopen_list, Error **errp)
> >   {
> > -    BlockDriverState *bs;
> > -    AioContext *ctx;
> > -    QObject *obj;
> > -    Visitor *v = qobject_output_visitor_new(&obj);
> > -    BlockReopenQueue *queue;
> > -    QDict *qdict;
> > +    BlockReopenQueue *queue = NULL;
> > +    GSList *aio_ctxs = NULL;
> > +    GSList *visitors = NULL;
> > +    GSList *drained = NULL;
> > -    /* Check for the selected node name */
> > -    if (!options->has_node_name) {
> > -        error_setg(errp, "node-name not specified");
> > -        goto fail;
> > -    }
> > +    /* Add each one of the BDS that we want to reopen to the queue */
> > +    for (; reopen_list != NULL; reopen_list = reopen_list->next) {
> > +        BlockdevOptions *options = reopen_list->value;
> > +        BlockDriverState *bs;
> > +        AioContext *ctx;
> > +        QObject *obj;
> > +        Visitor *v;
> > +        QDict *qdict;
> > -    bs = bdrv_find_node(options->node_name);
> > -    if (!bs) {
> > -        error_setg(errp, "Failed to find node with node-name='%s'",
> > +        /* Check for the selected node name */
> > +        if (!options->has_node_name) {
> > +            error_setg(errp, "node-name not specified");
> > +            goto fail;
> > +        }
> > +
> > +        bs = bdrv_find_node(options->node_name);
> > +        if (!bs) {
> > +            error_setg(errp, "Failed to find node with node-name='%s'",
> >                      options->node_name);
> > -        goto fail;
> > +            goto fail;
> > +        }
> > +
> > +        v = qobject_output_visitor_new(&obj);
> > +        visitors = g_slist_prepend(visitors, v);
> 
> I'd better just call visit_free inside the block instead of putting v
> to list be freed later after the block..

Yes, I had the same thought.

> > +
> > +        /* Put all options in a QDict and flatten it */
> > +        visit_type_BlockdevOptions(v, NULL, &options, &error_abort);
> > +        visit_complete(v, &obj);
> > +        qdict = qobject_to(QDict, obj);
> > +
> > +        qdict_flatten(qdict);
> > +
> > +        ctx = bdrv_get_aio_context(bs);
> > +        if (!g_slist_find(aio_ctxs, ctx)) {
> > +            aio_ctxs = g_slist_prepend(aio_ctxs, ctx);
> > +            aio_context_acquire(ctx);
> > +        }
> > +        bdrv_subtree_drained_begin(bs);
> 
> I expect Kevin will complain that aquiring several context and drain
> them all is a bad idea as it leads to deadlocks..

No need for me to complain when you already complained. :-)

> For more information look at the branches
>   [PATCH v2 29/36] blockdev: qmp_x_blockdev_reopen: acquire all contexts
> amd
>   [PATCH v2 30/36] block: bdrv_reopen_multiple: refresh permissions on updated graph
> 
> So, probably here we should acquire context in a loop to call
> bdrv_reopen_queue() (which I think shoud not require drained section).

I think the aio_context_acquire() is right (it is needed for drain) and
we can even keep it across bdrv_reopen_queue() if we want (though there
is probably no reason to do so), but we need to release it again after
the loop iteration (i.e. after bdrv_reopen_queue) so that we won't cause
deadlocks in the next loop iteration.

> And then, bdrv_reopen_multiple() is called with no aio context
> acquired, and no drained section.. And it shoud be refactored to
> properly operate with acquiring and realeasing the contexts and
> drained sections when needed...

The drained section shouldn't be a problem, we can keep this. In fact,
we need this, it is a documented requirement of bdrv_reopen_multiple().
We just need to drop the AioContext lock after drained_begin.

bdrv_reopen_multiple() should really document its requirements regarding
AioContext locks. It probably doesn't really care, but requires that
it be called from the main thread.

> (note preexisting problem of reopen, that during reopen the whole tree
> may be moved to another aio context, but we continue operations with
> acquired old aio context which is wrong).

Do we even acquire the old AioContext?

> > +        queue = bdrv_reopen_queue(queue, bs, qdict, false);
> > +        drained = g_slist_prepend(drained, bs);
> >       }
> > -    /* Put all options in a QDict and flatten it */
> > -    visit_type_BlockdevOptions(v, NULL, &options, &error_abort);
> > -    visit_complete(v, &obj);
> > -    qdict = qobject_to(QDict, obj);
> > -
> > -    qdict_flatten(qdict);
> > -
> >       /* Perform the reopen operation */
> > -    ctx = bdrv_get_aio_context(bs);
> > -    aio_context_acquire(ctx);
> > -    bdrv_subtree_drained_begin(bs);
> > -    queue = bdrv_reopen_queue(NULL, bs, qdict, false);
> >       bdrv_reopen_multiple(queue, errp);
> > -    bdrv_subtree_drained_end(bs);
> > -    aio_context_release(ctx);
> > +    queue = NULL;
> >   fail:
> > -    visit_free(v);
> > +    bdrv_reopen_queue_free(queue);

This has the same leak that we just fixed in Vladimir's series:

        qobject_unref(bs_entry->state.explicit_options);
        qobject_unref(bs_entry->state.options);

This part from abort in bdrv_reopen_multiple() is required even before
calling prepare, these QDicts are created in bdrv_reopen_queue().

We can't just move it unconditionally to bdrv_reopen_queue_free(),
though, because commit makes use of them and then we can't just unref
them. Either commit needs to take an extra reference or we'd need a bool
parameter in bdrv_reopen_queue_free(). I guess taking the extra
reference is cleanest.

> > +    g_slist_free_full(drained, (GDestroyNotify) bdrv_subtree_drained_end);
> > +    g_slist_free_full(aio_ctxs, (GDestroyNotify) aio_context_release);
> > +    g_slist_free_full(visitors, (GDestroyNotify) visit_free);
> >   }

Kevin


