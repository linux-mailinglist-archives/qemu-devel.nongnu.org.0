Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D461333BD9
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 12:56:53 +0100 (CET)
Received: from localhost ([::1]:44290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJxSO-0000jQ-4f
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 06:56:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJxQq-00085a-Vu
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 06:55:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJxQn-0001TE-NW
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 06:55:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615377312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gW2Gto4m4/LHLqaB67AaAl3WHxdSNEbvB6gA13w4JY0=;
 b=E+qR3aS+0Cci+wdff/Iz1pSi3IlwfRuckWjb4K5jeuEPnnhFcG1gIWddsk0Yb6BqYXUk3S
 9GHelA5urx5XAsccIZw809bDAaaCxHbNGLlfMv2QIm8Pq2/5gBNaC4nlF4wKsWIPZSmwXV
 y0I10Ew7LL0wxx1ZM1RVY5YtlOA2irQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-HM2LZjEbNxKdx931-DBuYA-1; Wed, 10 Mar 2021 06:55:11 -0500
X-MC-Unique: HM2LZjEbNxKdx931-DBuYA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC86A108BD07;
 Wed, 10 Mar 2021 11:55:09 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-29.ams2.redhat.com [10.36.114.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C99E60CFA;
 Wed, 10 Mar 2021 11:55:08 +0000 (UTC)
Date: Wed, 10 Mar 2021 12:55:06 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 15/36] block: use topological sort for permission update
Message-ID: <20210310115506.GC6076@merkur.fritz.box>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-16-vsementsov@virtuozzo.com>
 <20210127183809.GD6090@merkur.fritz.box>
 <ef4f43d2-a8b8-932e-78e4-6ffc9d8e7d3e@virtuozzo.com>
 <20210128171356.GE5361@merkur.fritz.box>
 <5e6e28e0-133c-9094-1c48-532090453cb1@virtuozzo.com>
 <20210203183829.GG5507@merkur.fritz.box>
 <61c15d60-6d32-3f18-8f17-1104cb7bf683@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <61c15d60-6d32-3f18-8f17-1104cb7bf683@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-block@nongnu.org, armbru@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 10.03.2021 um 12:08 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 03.02.2021 21:38, Kevin Wolf wrote:
> > Am 28.01.2021 um 19:04 hat Vladimir Sementsov-Ogievskiy geschrieben:
> > > 28.01.2021 20:13, Kevin Wolf wrote:
> > > > Am 28.01.2021 um 10:34 hat Vladimir Sementsov-Ogievskiy geschrieben:
> > > > > 27.01.2021 21:38, Kevin Wolf wrote:
> > > > > > Am 27.11.2020 um 15:45 hat Vladimir Sementsov-Ogievskiy geschrieben:
> > > > > > > -static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
> > > > > > > -                           uint64_t cumulative_perms,
> > > > > > > -                           uint64_t cumulative_shared_perms,
> > > > > > > -                           GSList *ignore_children, Error **errp)
> > > > > > > +static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
> > > > > > > +                                uint64_t cumulative_perms,
> > > > > > > +                                uint64_t cumulative_shared_perms,
> > > > > > > +                                GSList *ignore_children, Error **errp)
> > > > > > >     {
> > > > > > >         BlockDriver *drv = bs->drv;
> > > > > > >         BdrvChild *c;
> > > > > > > @@ -2166,21 +2193,43 @@ static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
> > > > > > >         /* Check all children */
> > > > > > >         QLIST_FOREACH(c, &bs->children, next) {
> > > > > > >             uint64_t cur_perm, cur_shared;
> > > > > > > -        GSList *cur_ignore_children;
> > > > > > >             bdrv_child_perm(bs, c->bs, c, c->role, q,
> > > > > > >                             cumulative_perms, cumulative_shared_perms,
> > > > > > >                             &cur_perm, &cur_shared);
> > > > > > > +        bdrv_child_set_perm_safe(c, cur_perm, cur_shared, NULL);
> > > > > > 
> > > > > > This "added" line is actually old code. What is removed here is the
> > > > > > recursive call of bdrv_check_update_perm(). This is what the code below
> > > > > > will have to replace.
> > > > > 
> > > > > yes, we'll use explicit loop instead of recursion
> > > > > 
> > > > > > 
> > > > > > > +    }
> > > > > > > +
> > > > > > > +    return 0;
> > > > > > > +}
> > > > > > > +
> > > > > > > +static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
> > > > > > > +                           uint64_t cumulative_perms,
> > > > > > > +                           uint64_t cumulative_shared_perms,
> > > > > > > +                           GSList *ignore_children, Error **errp)
> > > > > > > +{
> > > > > > > +    int ret;
> > > > > > > +    BlockDriverState *root = bs;
> > > > > > > +    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, root);
> > > > > > > +
> > > > > > > +    for ( ; list; list = list->next) {
> > > > > > > +        bs = list->data;
> > > > > > > +
> > > > > > > +        if (bs != root) {
> > > > > > > +            if (!bdrv_check_parents_compliance(bs, ignore_children, errp)) {
> > > > > > > +                return -EINVAL;
> > > > > > > +            }
> > > > > > 
> > > > > > At this point bs still had the old permissions, but we don't access
> > > > > > them. As we're going in topological order, the parents have already been
> > > > > > updated if they were a child covered in bdrv_node_check_perm(), so we're
> > > > > > checking the relevant values. Good.
> > > > > > 
> > > > > > What about the root node? If I understand correctly, the parents of the
> > > > > > root nodes wouldn't have been checked in the old code. In the new state,
> > > > > > the parent BdrvChild already has to contain the new permission.
> > > > > > 
> > > > > > In bdrv_refresh_perms(), we already check parent conflicts, so no change
> > > > > > for all callers going through it. Good.
> > > > > > 
> > > > > > bdrv_reopen_multiple() is less obvious. It passes permissions from the
> > > > > > BDRVReopenState, without applying the permissions first.
> > > > > 
> > > > > It will be changed in the series
> > > > > 
> > > > > > Do we check the
> > > > > > old parent permissions instead of the new state here?
> > > > > 
> > > > > We use given (new) cumulative permissions for bs, and recalculate
> > > > > permissions for bs subtree.
> > > > 
> > > > Where do we actually set them? I would expect a
> > > > bdrv_child_set_perm_safe() call somewhere, but I can't see it in the
> > > > call path from bdrv_reopen_multiple().
> > > 
> > > You mean parent BdrvChild objects? Then this question applies as well
> > > to pre-patch code.
> > 
> > I don't think so. The pre-patch code doesn't rely on the permissions
> > already being set in the BdrvChild object, but it gets them passed in
> > parameters. Changing the graph first and relying on the information in
> > BdrvChild is the new approach that you're introducing.
> 
> New code still pass permissions as parameters for root node. And only
> inside subtree we rely on updated parents. But that's correct due to
> topological order of updating.
> 
> 
> OK, that's incorrect for the following case: when one of the parents (X)
> of inner node in bs subtree IS NOT in the bs subtree but IS in reopen queue.
> And we'll use wrong permission of X. Still:
> 
> 1. It's preexisting. bdrv_check_update_perm() doesn't take reopen queue
> in mind when calculate cumulative permissions (and ignore_children doesn't
> help for the described case
> 
> 2. We can hope that on next permission update, started from node X, permissions
> will become more correct
> 
> 3. At the end of series permission calculation in bdrv_reopen_multiple is
> rewritten anyway.

Yes, I think 3. is the strongest argument in favour of the patch.

Kevin


