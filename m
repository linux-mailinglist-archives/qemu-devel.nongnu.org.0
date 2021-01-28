Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 037AD307C19
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 18:21:34 +0100 (CET)
Received: from localhost ([::1]:44520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Az7-0005SM-0A
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 12:21:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l5Aru-0008QZ-9g
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 12:14:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l5Ars-00062r-1x
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 12:14:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611854043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EuSgo8Iwlzytakv9NRvoMkKVs0rhgYyBcVBZzlBdHaQ=;
 b=Ek42wZYoY3kvGFp/OGyJCmpYhHzb73KGHsg97msDAirCn7TkQ2p8CUXKTHL7HXNAfK1eGy
 WmZs6YPITdGzKq6t+YEMc+v2O7x2REtrJSZZNrf84KfzwMBnRhJxeNgXDYMy/nz4e1H0Fg
 +z77+gT/7R1pEjZw+aexOpA1M/eWhFU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-yjGJRBRKNF-lqXN36KXVgA-1; Thu, 28 Jan 2021 12:14:01 -0500
X-MC-Unique: yjGJRBRKNF-lqXN36KXVgA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28D20107ACE3;
 Thu, 28 Jan 2021 17:14:00 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-102.ams2.redhat.com [10.36.115.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AD54060C13;
 Thu, 28 Jan 2021 17:13:58 +0000 (UTC)
Date: Thu, 28 Jan 2021 18:13:56 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 15/36] block: use topological sort for permission update
Message-ID: <20210128171356.GE5361@merkur.fritz.box>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-16-vsementsov@virtuozzo.com>
 <20210127183809.GD6090@merkur.fritz.box>
 <ef4f43d2-a8b8-932e-78e4-6ffc9d8e7d3e@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <ef4f43d2-a8b8-932e-78e4-6ffc9d8e7d3e@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-block@nongnu.org, armbru@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 28.01.2021 um 10:34 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 27.01.2021 21:38, Kevin Wolf wrote:
> > Am 27.11.2020 um 15:45 hat Vladimir Sementsov-Ogievskiy geschrieben:
> > > -static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
> > > -                           uint64_t cumulative_perms,
> > > -                           uint64_t cumulative_shared_perms,
> > > -                           GSList *ignore_children, Error **errp)
> > > +static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
> > > +                                uint64_t cumulative_perms,
> > > +                                uint64_t cumulative_shared_perms,
> > > +                                GSList *ignore_children, Error **errp)
> > >   {
> > >       BlockDriver *drv = bs->drv;
> > >       BdrvChild *c;
> > > @@ -2166,21 +2193,43 @@ static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
> > >       /* Check all children */
> > >       QLIST_FOREACH(c, &bs->children, next) {
> > >           uint64_t cur_perm, cur_shared;
> > > -        GSList *cur_ignore_children;
> > >           bdrv_child_perm(bs, c->bs, c, c->role, q,
> > >                           cumulative_perms, cumulative_shared_perms,
> > >                           &cur_perm, &cur_shared);
> > > +        bdrv_child_set_perm_safe(c, cur_perm, cur_shared, NULL);
> > 
> > This "added" line is actually old code. What is removed here is the
> > recursive call of bdrv_check_update_perm(). This is what the code below
> > will have to replace.
> 
> yes, we'll use explicit loop instead of recursion
> 
> > 
> > > +    }
> > > +
> > > +    return 0;
> > > +}
> > > +
> > > +static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
> > > +                           uint64_t cumulative_perms,
> > > +                           uint64_t cumulative_shared_perms,
> > > +                           GSList *ignore_children, Error **errp)
> > > +{
> > > +    int ret;
> > > +    BlockDriverState *root = bs;
> > > +    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, root);
> > > +
> > > +    for ( ; list; list = list->next) {
> > > +        bs = list->data;
> > > +
> > > +        if (bs != root) {
> > > +            if (!bdrv_check_parents_compliance(bs, ignore_children, errp)) {
> > > +                return -EINVAL;
> > > +            }
> > 
> > At this point bs still had the old permissions, but we don't access
> > them. As we're going in topological order, the parents have already been
> > updated if they were a child covered in bdrv_node_check_perm(), so we're
> > checking the relevant values. Good.
> > 
> > What about the root node? If I understand correctly, the parents of the
> > root nodes wouldn't have been checked in the old code. In the new state,
> > the parent BdrvChild already has to contain the new permission.
> > 
> > In bdrv_refresh_perms(), we already check parent conflicts, so no change
> > for all callers going through it. Good.
> > 
> > bdrv_reopen_multiple() is less obvious. It passes permissions from the
> > BDRVReopenState, without applying the permissions first.
> 
> It will be changed in the series
> 
> > Do we check the
> > old parent permissions instead of the new state here?
> 
> We use given (new) cumulative permissions for bs, and recalculate
> permissions for bs subtree.

Where do we actually set them? I would expect a
bdrv_child_set_perm_safe() call somewhere, but I can't see it in the
call path from bdrv_reopen_multiple().

> It follows old behavior. The only thing is changed that pre-patch we
> do DFS recursion starting from bs (and probably visit some nodes
> several times), after-patch we first do topological sort of bs subtree
> and go through the list. The order of nodes is better and we visit
> each node once.

It's not the only thing that changes. Maybe this is what makes the patch
hard to understand, because it seems to do two steps at once:

1. Change the order in which nodes are processed

2. Replace bdrv_check_update_perm() with bdrv_check_parents_compliance()

In step 2, the point I mentioned above is important (new permissions
must already be set in the BdrvChild objects).

The switch to bdrv_check_parents_compliance() also means that error
messages become a bit worse because we don't know any more which of the
conflicting nodes is the new one, so we can't provide two different
messages any more. This is probably unavoidable, though.

> > 
> > > +            bdrv_get_cumulative_perm(bs, &cumulative_perms,
> > > +                                     &cumulative_shared_perms);
> > > +        }
> > > -        cur_ignore_children = g_slist_prepend(g_slist_copy(ignore_children), c);
> > > -        ret = bdrv_check_update_perm(c->bs, q, cur_perm, cur_shared,
> > > -                                     cur_ignore_children, errp);
> > > -        g_slist_free(cur_ignore_children);
> > > +        ret = bdrv_node_check_perm(bs, q, cumulative_perms,
> > > +                                   cumulative_shared_perms,
> > > +                                   ignore_children, errp);
> > 
> > We use the original ignore_children for every node in the sorted list.
> > The old code extends it with all nodes in the path to each node.
> > 
> > For the bdrv_check_update_perm() call that is now replaced with
> > bdrv_check_parents_compliance(), I think this was necessary because
> > bdrv_check_update_perm() always assumes adding a new edge, so if you
> > update one instead of adding it, you have to ignore it so that it can't
> > conflict with itself. This isn't necessary any more now because we just
> > update and then check for consistency.
> > 
> > For passing to bdrv_node_check_perm() it doesn't make a difference
> > anyway because the parameter is now unused (and should probably be
> > removed).
> 
> ignore_children will be dropped in [27]. For now it is still needed
> for bdrv_replace_node_common

In bdrv_node_check_perm(), it's already unused after this patch. But
fair enough.

Kevin


