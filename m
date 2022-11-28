Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E0D63A8DE
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 14:01:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozdkJ-0002RL-9t; Mon, 28 Nov 2022 08:00:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ozdk7-0002OY-4s
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 08:00:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ozdjx-0007W7-8E
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 08:00:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669640399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EkPOgBgI/ePIamBS1m+TvO8pMH6IpnVxF4yPphSkRU0=;
 b=D6FI42JyxVscE07dnitnHDdA7649/4FY/ATZ6tbV4kIQwBzaIDBGTlPSM4YehASybYrjVJ
 N2LHktNdQvPxGrVHz9Nw+xc/I5CeCMrV6zZUcLbUaLhMQej+T53RCor17R7GCi+3ABX0AC
 bQuFokzm8UC15Pb5Y5BC5rCSGlqmZY0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-235-LTvAv3I1OCqy6pOdW83xeA-1; Mon, 28 Nov 2022 07:59:50 -0500
X-MC-Unique: LTvAv3I1OCqy6pOdW83xeA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2CEA9185A7A8;
 Mon, 28 Nov 2022 12:59:50 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.100])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C68F935429;
 Mon, 28 Nov 2022 12:59:48 +0000 (UTC)
Date: Mon, 28 Nov 2022 13:59:45 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-block@nongnu.org, eesposit@redhat.com, stefanha@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 14/15] block: Don't poll in bdrv_replace_child_noperm()
Message-ID: <Y4SwwYr54TM4/eLo@redhat.com>
References: <20221118174110.55183-1-kwolf@redhat.com>
 <20221118174110.55183-15-kwolf@redhat.com>
 <cb7e7810-549c-adba-1eaa-184fd67bd71a@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb7e7810-549c-adba-1eaa-184fd67bd71a@yandex-team.ru>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 25.11.2022 um 17:07 hat Vladimir Sementsov-Ogievskiy geschrieben:
> On 11/18/22 20:41, Kevin Wolf wrote:
> > In order to make sure that bdrv_replace_child_noperm() doesn't have to
> > poll any more, get rid of the bdrv_parent_drained_begin_single() call.
> > 
> > This is possible now because we can require that the parent is already
> > drained through the child in question when the function is called and we
> > don't call the parent drain callbacks more than once.
> > 
> > The additional drain calls needed in callers cause the test case to run
> > its code in the drain handler too early (bdrv_attach_child() drains
> > now), so modify it to only enable the code after the test setup has
> > completed.
> > 
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> 
> It's still hard to keep this all in mind, so weak:
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> 
> > ---
> >   include/block/block-io.h     |   8 +++
> >   block.c                      | 103 ++++++++++++++++++++++++++++++-----
> >   block/io.c                   |   2 +-
> >   tests/unit/test-bdrv-drain.c |  10 ++++
> >   4 files changed, 108 insertions(+), 15 deletions(-)
> > 
> > diff --git a/include/block/block-io.h b/include/block/block-io.h
> > index 8f5e75756a..65e6d2569b 100644
> > --- a/include/block/block-io.h
> > +++ b/include/block/block-io.h
> > @@ -292,6 +292,14 @@ bdrv_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
> >    */
> >   void bdrv_parent_drained_begin_single(BdrvChild *c, bool poll);
> > +/**
> > + * bdrv_parent_drained_poll_single:
> > + *
> > + * Returns true if there is any pending activity to cease before @c can be
> > + * called quiesced, false otherwise.
> > + */
> > +bool bdrv_parent_drained_poll_single(BdrvChild *c);
> > +
> >   /**
> >    * bdrv_parent_drained_end_single:
> >    *
> > diff --git a/block.c b/block.c
> > index d18512944d..3f12aba6ce 100644
> > --- a/block.c
> > +++ b/block.c
> 
> [..]
> 
> > @@ -2863,11 +2905,9 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
> >       }
> >       /*
> > -     * If the old child node was drained but the new one is not, allow
> > -     * requests to come in only after the new node has been attached.
> > -     *
> > -     * Update new_bs_quiesce_counter because bdrv_parent_drained_begin_single()
> > -     * polls, which could have changed the value.
> > +     * If the parent was drained through this BdrvChild previously, but new_bs
> > +     * is not drained, allow requests to come in only after the new node has
> > +     * been attached.
> 
> As I understand,the main reason why we MUST do this automatic undrain, is the contract with the user:
> 
> User things that:
> 
> 1. It's enough to drain node X to drain all its parents (thanks to recursion)
> 2. User should undrain exactly same nodes that was drained by hand, everything that was drained automatically would be automatically undrained.
> 
> So here we break the connection between X and its parent, therefore recursion will not help on final undrain. So, we should do the automation here.

Yes, I think that's the idea behind our interface.

> I have an idea how to (probably) make things even more simple.
> 
> 1. drop .quiesced_parent
> 
> 2. consider the Full graph, including non-bds parents, and support having .quiesce_counter for non-bds parents. (probably need some structure to unify bds and non-bds nodes of the Full graph - Generic ndoe, that's not the first time we are saying about that)
> 
> 3. drop any recursion and automatic drain/undrain
> 
> 4. user is responsible to drain all the nodes and their parents as needed to proceed with some block graph modification
> 
> 5. user keeps the list of all nodes that was drained to undrain them in the end
> 
> 6. node may be drained only when all its parents are already drained (add an assertion)
> 
> And of course we need helpers for the user to do 4-6. That should work similar to permissions update. Add a function to produce a topologically sorted list of Generic nodes (starting from some node and include all its parents and their parents and so on), and  simple functions that to drain/undrain of such list in a loop.

I understand your idea and it looks nice at the first sight.

However, on second thought, I'm not sure how easy and nice this would
actually turn out: You will lose the invariant that if a node is
drained, its parent will always be drained, too - it depends on the
caller now. You also can't delete a node that is still drained, you need
to keep it around for undraining. Same thing with graph modifications
in a drained section: You won't automatically get a consistent state
regarding drain in the new graph layout, so you would have to manually
make sure that both old and new children are drained.

It feels like this will lead to new complications that might not be any
easier to manage than the old ones.

Kevin


