Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECB762DCBB
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 14:28:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovevd-0008N5-Gn; Thu, 17 Nov 2022 08:27:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ovevb-0008Mg-HC
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 08:27:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ovevZ-0007pd-6w
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 08:27:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668691656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vEBpnDFzChzlGX1gYlquv84qK0teyEUH+BgB/tTD1i0=;
 b=PvT0RGU1W22/iVZEhzhqaOZC+eUKpcHxJvCBP9VjRsMYC9FzPjyI5JsErNvYGAlaLKf5LE
 BOLrGsEZ6MfsuDT7cix3oOdKVJQJTkXLsjAUsJ0ceZ8EIHzs/PaZtZlOlXR6PIy/X9lWdC
 dtQrfARiCKH4LHasQiiB0b9+RJmnMaA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-183-4V1vd2tROKKGmmgOpCtklQ-1; Thu, 17 Nov 2022 08:27:33 -0500
X-MC-Unique: 4V1vd2tROKKGmmgOpCtklQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C50D7801585;
 Thu, 17 Nov 2022 13:27:32 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.140])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A73C239D6A;
 Thu, 17 Nov 2022 13:27:31 +0000 (UTC)
Date: Thu, 17 Nov 2022 14:27:28 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-block@nongnu.org, eesposit@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 12/13] block: Don't poll in bdrv_replace_child_noperm()
Message-ID: <Y3Y2wEtU20JtsJJO@redhat.com>
References: <20221108123738.530873-1-kwolf@redhat.com>
 <20221108123738.530873-13-kwolf@redhat.com>
 <b998dc15-4c83-4f3a-c79e-edd78562ec3f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b998dc15-4c83-4f3a-c79e-edd78562ec3f@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

Am 14.11.2022 um 21:22 hat Hanna Reitz geschrieben:
> On 08.11.22 13:37, Kevin Wolf wrote:
> > In order to make sure that bdrv_replace_child_noperm() doesn't have to
> > poll any more, get rid of the bdrv_parent_drained_begin_single() call.
> > 
> > This is possible now because we can require that the child is already
> > drained when the function is called (it better be, having in-flight
> > requests while modifying the graph isn't going to end well!) and we
> > don't call the parent drain callbacks more than once.
> > 
> > The additional drain calls needed in callers cause the test case to run
> > its code in the drain handler too early (bdrv_attach_child() drains
> > now), so modify it to only enable the code after the test setup has
> > completed.
> > 
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
> >   include/block/block-io.h     |  8 ++++
> >   block.c                      | 72 +++++++++++++++++++++++++-----------
> >   block/io.c                   |  2 +-
> >   tests/unit/test-bdrv-drain.c | 10 +++++
> >   4 files changed, 70 insertions(+), 22 deletions(-)
> 
> I find this change complicated.  I understand it’s the point of the series,
> but I find it difficult to grasp.  But I guess there can be no drain series
> without such a patch.
> 
> As usual, I was very skeptical of the code at first, and over time slowly
> realized that I’m mostly confused by the comments, and the code seems fine. 
> Ah, well.

I spent a while thinking about how to do things differently, but I think
my conclusion is that only improving the comments is probably the best.

The real condition in bdrv_replace_child_noperm() is: If you want to
change the BdrvChild to point to a drained node with child->bs, either
child->parent_quiesce_counter must already be non-zero or you must be
able to increase it and keep the parent's quiesce_counter consistent
with that, but without polling or starting new requests.

This patch generalised the condition to non-drained child nodes as well
just because it's easier to verify when it's a condition that applies
always. It also picked the first option, child->parent_quiesce_counter
already being non-zero.

If we wanted to implement the second option, the potential problem is in
the "without starting new requests" condition, because .drained_begin
can start new requests on the child (e.g. restarting throttled requests,
so that we can actually drain the request queue).

Note that we're not even interested in draining the request queue here,
we already assume that the parent doesn't have active requests on the
child (otherwise we would always have gotten crashes). We just want to
get the counters to agree with each other.

Maybe the most reasonable approach for this would be formally requiring
that .drained_begin both in BdrvChildClass and BlockDriver not do
anything if the thing in question is already quiesced (I think this is
true in practice; for BlockDriver probably only after the earlier
patches in this series) and then assert(bdrv_parent_is_drained(child))
in bdrv_replace_child_noperm(), which would require a new BdrvChildClass
callback. Then the bdrv_parent_drained_begin_single() call could stay
around, but wouldn't have to poll any more.

Of course, all of the drains in this patch would have to stay anyway to
make sure that the parent is already drained. So I'm not sure if it's
any simpler or better in any way than requiring that the parent was
already drained through _this_ BdrvChild.

What do you think?

> [...]
> 
> > diff --git a/block.c b/block.c
> > index 5f5f79cd16..12039e9b8a 100644
> > --- a/block.c
> > +++ b/block.c
> 
> [...]
> 
> > @@ -2414,12 +2428,20 @@ static TransactionActionDrv bdrv_replace_child_drv = {
> >    *
> >    * Note: real unref of old_bs is done only on commit.
> >    *
> > + * Both child and new_bs (if non-NULL) must be drained. new_bs must be kept
> > + * drained until the transaction is completed (this automatically implies that
> > + * child remains drained, too).
> 
> I find “child” extremely ambiguous.  The problem is that there generally is
> no way to drain a BdrvChild object, is there?  You can only drain the BDS in
> it, which then drains the parent through the BdrvChild object. 
> Historically, I don’t think there was ever a place where we cared about the
> BdrvChild object between the two to be drained, was there?  I mean, now
> there apparently is, in bdrv_child_attach_common(), but that’s a different
> story.

I think we've always cared about the parent drain happening through the
BdrvChild, though, at least since your commit 804db8ea which introduced
BdrvChild.parent_quiesce_counter.

Whether or not calling the BdrvChild drained in this case is probably
more a question of terminology.

If we want to avoid calling a BdrvChild drained, I guess I could require
child->bs to be drained instead, which implies the condition we're
really interested in.

> So the problem is that “draining a BdrvChild object” generally appears in
> the context of bdrv_parent_drained_*() functions, i.e. actually functions
> draining the parent.  Which makes it a bit confusing to refer to a BdrvChild
> object just as “child”.
> 
> I know that “child” here refers to the variable (or does it not?), but that
> is why I really prefer marking variables that are just plain English words,
> e.g. as @child or `child`, so it’s clear they are a name and not a noun.

That's fair, I should add that @. (Yes, it does.)

> In any case, because the concept is generally to drain the `child->bs`
> instead of the BdrvChild object directly, I understand the comment to mean:
> “Both the old child (`child->bs`) and `new_bs` (if non-NULL) must be
> drained.  `new_bs` must be kept drained until the transaction is completed. 
> This implies that the parent too will be kept drained until the transaction
> is completed by the BdrvChild object `child`.”
> 
> Or am I misunderstanding something, and the distinction between `child` and
> `child->bs` and the parent node is important here? (Would be good to know.
> :))

I'm not sure how a transaction "is completed by the BdrvChild object"
(isn't it the caller that finalises the transaction?), but I think
otherwise that's equivalent to what I was trying to express.

Oh, is it just the word order that confused me, and you really mean
"will be kept drained by the BdrvChild object until the transation is
completed (by the caller)"?

> > + *
> >    * The function doesn't update permissions, caller is responsible for this.
> >    */
> >   static void bdrv_replace_child_tran(BdrvChild *child, BlockDriverState *new_bs,
> >                                       Transaction *tran)
> >   {
> >       BdrvReplaceChildState *s = g_new(BdrvReplaceChildState, 1);
> > +
> > +    assert(child->parent_quiesce_counter);
> > +    assert(!new_bs || new_bs->quiesce_counter);
> > +
> >       *s = (BdrvReplaceChildState) {
> >           .child = child,
> >           .old_bs = child->bs,
> > @@ -2818,6 +2840,12 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
> 
> This function now has its callers fulfill kind of a complicated contract.  I
> would prefer that to be written out in a doc comment, especially because it
> sounds like the assertions can’t cover everything (i.e. callers that remove
> a child are required to have stopped issuing requests to that child, but
> they are free to do that in any way they want, so no assertion will check
> for it here).

Ok, I can add a comment.

I don't think the contract is complicated: The parent has to be drained
through this BdrvChild (because new_bs could already be drained), except
for new_bs == NULL which is obviously not attaching the child to a
drained node.

> >       int new_bs_quiesce_counter;
> >       assert(!child->frozen);
> > +    /*
> > +     * When removing the child, it's the callers responsibility to make sure
> > +     * that no requests are in flight any more. Usually the parent is drained,
> > +     * but not through child->parent_quiesce_counter.
> > +     */
> 
> When I see a comment above an assertion, I immediately assume it is going to
> describe what the assertion checks.  Unless I’m misunderstanding something
> (again?), this comment actually describes what the assertion *does not*
> check.  I find that confusing, especially because the comment leads with
> “it’s the caller’s responsibility”, which to me implies “and that’s why we
> check it here in this assertion”, because assertions are there to verify
> that contracts are met.

The comment is bad, I must have been confused myself while writing it.

The logic here isn't even about request in flights. It's true that there
must be none, but that's a separate requirement. What it is about is
maintaining consistency between child->parent_quiesce_counter and the
parent's own quiesce_counter in case of switching to a drained node,
without having to poll - which is only possible if the parent is already
drained.

That we require the parent to be drained through this specific BdrvChild
is a choice with the intention to keep things simpler, as explained
above.

> The assertion verifies that the parent must be drained (through @child),
> unless the child is removed, which case isn’t covered by the assertion. 
> That “isn’t covered” is then described by the comment, right?
> 
> I’d prefer the comment to lead with describing what the assertion does
> check, and then transitioning to “But in case the child is removed, we
> ignore that, and just note that it’s the caller’s responsibility to...”.
> 
> Also, the comment doesn’t explicitly say why we don’t check it in the
> assertion.  It says “usually” and “child->parent_quiesce_counter”, which
> implies “can’t get any information from child->parent_quiesce_counter, and
> regardless, callers can do what they want do achieve quiescing in regards to
> this child, so there’s nothing we can check”.  It feels like we can just say
> outright that there’s an informal contract that we can’t formally verify
> here, but callers naturally still must adhere to it.  It would be
> interesting to know (and note) why that is, though, i.e. why we can’t have
> parents be drained through the BdrvChild object for the child that is being
> removed.

We could require that, it would just be more complicated for the callers
that pass a constant NULL, for no real benefit.

> I understand the intention behind the assertion to be: “We require the
> parent not to have in-flight requests to the BdrvChild object manipulated
> here.  In most cases, we verify that by requiring the parent be drained
> through this BdrvChild object.  However, when a child is being removed, we
> skip formal verification, because we leave callers free in deciding how to
> ensure that no requests are in flight.  Usually, they will still have the
> parent be drained (even if not through this BdrvChild object), but we don’t
> require that.”
> 
> I may well be wrong, but then it would be good for a comment to correct me.
> :)
> 
> (Interestingly, because bdrv_replace_child_noperm() no longer polls itself,
> it can’t know for sure that `child->parent_quiesce_counter > 0` means that
> there are no requests in flight.)
> 
> > +    assert(!new_bs || child->parent_quiesce_counter);
> >       assert(old_bs != new_bs);
> >       GLOBAL_STATE_CODE();
> 
> [...]
> 
> > @@ -2865,9 +2875,6 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
> >       /*
> >        * If the old child node was drained but the new one is not, allow
> 
> This now also covers the case where there was no old child node, but the
> parent was simply drained via an empty BdrvChild by the caller.

I'm not sure how to express this concisely if we want to avoid calling
the BdrvChild itself drained.

> >        * requests to come in only after the new node has been attached.
> > -     *
> > -     * Update new_bs_quiesce_counter because bdrv_parent_drained_begin_single()
> > -     * polls, which could have changed the value.
> >        */
> >       new_bs_quiesce_counter = (new_bs ? new_bs->quiesce_counter : 0);
> >       if (!new_bs_quiesce_counter && child->parent_quiesce_counter) {
> > @@ -3004,6 +3011,12 @@ static BdrvChild *bdrv_attach_child_common(BlockDriverState *child_bs,
> >       }
> >       bdrv_ref(child_bs);
> > +    /*
> > +     * Let every new BdrvChild start drained, inserting it in the graph with
> > +     * bdrv_replace_child_noperm() will undrain it if the child node is not
> > +     * drained. The child was only just created, so polling is not necessary.
> 
> I feel like this is hiding some complexity.  Unless I missed something,
> draining a BdrvChild always meant draining the parent. But here, it
> absolutely does not mean that, and maybe that deserves a big warning sign?
> 
> Beginning a drain without poll means quiescing.  You assert that there can
> be no requests to the new child, which I agree on[1].  The combination of no
> new requests coming in, and no requests being there at this point is what
> being drained means.  So @new_child is indeed “drained”.
> 
> But the parent isn’t drained, because it isn’t polled.  There may still be
> requests in flight to its other children.  That’s really interesting, and I
> found it extremely confusing until I wrote ten paragraphs in reply here and
> scrapped most of them again.  Whenever I find this to be my reaction to
> something, I really wish for a detailed comment that explains the situation.
> 
> I would like the comment to:
> - Expand on what “only just created” means.  As it’s written, that could
> mean relying on a race condition.  At which point would the parent be able
> to send requests?  (I assume either the .attach() in
> bdrv_replace_child_noperm(), or when this function returns, whichever comes
> first.  (The former always comes first.))

I don't think .attach is supposed to create requests - even less so
while the BdrvChild is drained. It may schedule a BH, but that won't be
executed until this function returns.

This is not documented explicitly, maybe we should document it.

I suppose .drained_end can create requests in general, but it wouldn't
make sense to me if it did that for a new child. It generally just
resumes operations that were stopped because of the drain, but there was
no operation on a new child yet.

> - Say in more detail that calling bdrv_parent_drained_begin_single() without
> polling will quiesce the parent, preventing new requests from appearing.
> - Note that because there are no requests in flight, and because no new
> requests can then appear, the BdrvChild is drained.
> - Note that the parent is only quiesced, not drained, and may still have
> requests in flight to other children, but naturally we don’t care about
> them.

All of this is true, but at the same time not related to what the
bdrv_parent_drained_begin_single() call is meant for - increasing the
parent's quiesce_count from the BdrvChild before calling
bdrv_replace_child_noperm(), so that we don't have to do it inside of
that function where we don't know that we don't have to poll.

That there are no requests in flight when you change child->bs is a
requirement that we already had before this patch.

If it feels better to you, we could even just poll here (and drop patch
13 because it would still be used).

The part that is important in the context of Emanuele's patches that
will follow is that we poll outside of a bdrv_graph_wrlock/wrunlock()
section. This might mean that we'd have to pull the polling further
down into the callers in the long run. Emanuele's current patches only
put the lock in bdrv_replace_child_noperm(), but generally speaking you
wouldn't want the graph to change between two related changes, so I'm
almost sure that the lock will be taken in callers in the future.

> I feel like the comment tries to hide all that complexity simply by avoiding
> the word “parent”.
> 
> [1] As far as I can piece together, no requests to the new child can have
> started yet, because this function creates the BdrvChild object, so before
> it is returned to the caller (or BdrvChildClass.attach() is called in
> bdrv_replace_child_noperm()), the block driver won’t generate requests to
> it.

Kevin


