Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F370306372
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 19:42:29 +0100 (CET)
Received: from localhost ([::1]:39632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4plr-0003J7-Uc
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 13:42:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l4phy-0002Du-12
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 13:38:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l4phu-0007KG-Gq
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 13:38:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611772700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VEeEreXJHKtyeSInhdiJDAOWXc4/fpHWrGZlVn6K/lg=;
 b=dVW3esLWDlOJ3agOxM3vHktkm/ZiNsf4TyqpRap3BvtaUQ/UFfdcv2pGiisW0JiihdxF+Q
 D2u6q9ffDKAMxdGCPoSWDOMOnbA9PEpS46KqgRSTtAxrZzNu6a6ofHQDlEIfMaz15sWTNU
 5QWyjzsvTw8GdemIWxa9cHNJNRvc4P0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-B9Cf7GoAN-6KcAMnW2HVoA-1; Wed, 27 Jan 2021 13:38:16 -0500
X-MC-Unique: B9Cf7GoAN-6KcAMnW2HVoA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27D1D59;
 Wed, 27 Jan 2021 18:38:15 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-94.ams2.redhat.com [10.36.115.94])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BFBB5C1D0;
 Wed, 27 Jan 2021 18:38:11 +0000 (UTC)
Date: Wed, 27 Jan 2021 19:38:09 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 15/36] block: use topological sort for permission update
Message-ID: <20210127183809.GD6090@merkur.fritz.box>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-16-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201127144522.29991-16-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
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

Am 27.11.2020 um 15:45 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Rewrite bdrv_check_perm(), bdrv_abort_perm_update() and bdrv_set_perm()
> to update nodes in topological sort order instead of simple DFS. With
> topologically sorted nodes, we update a node only when all its parents
> already updated. With DFS it's not so.
> 
> Consider the following example:
> 
>     A -+
>     |  |
>     |  v
>     |  B
>     |  |
>     v  |
>     C<-+
> 
> A is parent for B and C, B is parent for C.
> 
> Obviously, to update permissions, we should go in order A B C, so, when
> we update C, all parent permissions already updated.

I wondered for a moment why this order is obvious. Taking a permission
on A may mean that we need to take the permisson on C, too.

The answer is (or so I think) that the whole operation is atomic so the
half-updated state will never be visible to a caller, but this is about
calculating the right permissions. Permissions a node needs on its
children may depend on what its parents requested, but parent
permissions never depend on what children request.

Ok, makes sense.

> But with current
> approach (simple recursion) we can update in sequence A C B C (C is
> updated twice). On first update of C, we consider old B permissions, so
> doing wrong thing. If it succeed, all is OK, on second C update we will
> finish with correct graph. But if the wrong thing failed, we break the
> whole process for no reason (it's possible that updated B permission
> will be less strict, but we will never check it).
> 
> Also new approach gives a way to simultaneously and correctly update
> several nodes, we just need to run bdrv_topological_dfs() several times
> to add all nodes and their subtrees into one topologically sorted list
> (next patch will update bdrv_replace_node() in this manner).
> 
> Test test_parallel_perm_update() is now passing, so move it out of
> debugging "if".
> 
> We also need to support ignore_children in
> bdrv_check_parents_compliance().
> 
> For test 283 order of parents compliance check is changed.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block.c                     | 103 +++++++++++++++++++++++++++++-------
>  tests/test-bdrv-graph-mod.c |   4 +-
>  tests/qemu-iotests/283.out  |   2 +-
>  3 files changed, 86 insertions(+), 23 deletions(-)
> 
> diff --git a/block.c b/block.c
> index 92bfcbedc9..81ccf51605 100644
> --- a/block.c
> +++ b/block.c
> @@ -1994,7 +1994,9 @@ static bool bdrv_a_allow_b(BdrvChild *a, BdrvChild *b, Error **errp)
>      return false;
>  }
>  
> -static bool bdrv_check_parents_compliance(BlockDriverState *bs, Error **errp)
> +static bool bdrv_check_parents_compliance(BlockDriverState *bs,
> +                                          GSList *ignore_children,
> +                                          Error **errp)
>  {
>      BdrvChild *a, *b;
>  
> @@ -2005,7 +2007,9 @@ static bool bdrv_check_parents_compliance(BlockDriverState *bs, Error **errp)
>       */
>      QLIST_FOREACH(a, &bs->parents, next_parent) {
>          QLIST_FOREACH(b, &bs->parents, next_parent) {
> -            if (a == b) {
> +            if (a == b || g_slist_find(ignore_children, a) ||
> +                g_slist_find(ignore_children, b))

'a' should be checked in the outer loop, no reason to repeat the same
check all the time in the inner loop.

> +            {
>                  continue;
>              }
>  
> @@ -2034,6 +2038,29 @@ static void bdrv_child_perm(BlockDriverState *bs, BlockDriverState *child_bs,
>      }
>  }
>  
> +static GSList *bdrv_topological_dfs(GSList *list, GHashTable *found,
> +                                    BlockDriverState *bs)

It would be good to have a comment that explains the details of the
contract.

In particular, this seems to require that @list is already topologically
sorted, and it's complete in the sense that if a node is in the list,
all of its children are in the list, too.

> +{
> +    BdrvChild *child;
> +    g_autoptr(GHashTable) local_found = NULL;
> +
> +    if (!found) {
> +        assert(!list);
> +        found = local_found = g_hash_table_new(NULL, NULL);
> +    }
> +
> +    if (g_hash_table_contains(found, bs)) {
> +        return list;
> +    }
> +    g_hash_table_add(found, bs);
> +
> +    QLIST_FOREACH(child, &bs->children, next) {
> +        list = bdrv_topological_dfs(list, found, child->bs);
> +    }
> +
> +    return g_slist_prepend(list, bs);
> +}
> +
>  static void bdrv_child_set_perm_commit(void *opaque)
>  {
>      BdrvChild *c = opaque;
> @@ -2098,10 +2125,10 @@ static void bdrv_child_set_perm_safe(BdrvChild *c, uint64_t perm,
>   * A call to this function must always be followed by a call to bdrv_set_perm()
>   * or bdrv_abort_perm_update().
>   */

One big source of confusion for me when trying to understand this was
that bdrv_check_perm() is a misnomer since commit f962e96150e and the
above comment isn't really accurate any more.

The function doesn't only check the validity of the new permissions in
advance to actually making the change, but it already updates the
permissions of all child nodes (however not of its root node).

So we have gone from the original check/set/abort model (which the
function names still suggest) to a prepare/commit/rollback model.

I think some comment updates are in order, and possibly we should rename
some functions, too.

> -static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
> -                           uint64_t cumulative_perms,
> -                           uint64_t cumulative_shared_perms,
> -                           GSList *ignore_children, Error **errp)
> +static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
> +                                uint64_t cumulative_perms,
> +                                uint64_t cumulative_shared_perms,
> +                                GSList *ignore_children, Error **errp)
>  {
>      BlockDriver *drv = bs->drv;
>      BdrvChild *c;
> @@ -2166,21 +2193,43 @@ static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
>      /* Check all children */
>      QLIST_FOREACH(c, &bs->children, next) {
>          uint64_t cur_perm, cur_shared;
> -        GSList *cur_ignore_children;
>  
>          bdrv_child_perm(bs, c->bs, c, c->role, q,
>                          cumulative_perms, cumulative_shared_perms,
>                          &cur_perm, &cur_shared);
> +        bdrv_child_set_perm_safe(c, cur_perm, cur_shared, NULL);

This "added" line is actually old code. What is removed here is the
recursive call of bdrv_check_update_perm(). This is what the code below
will have to replace.

> +    }
> +
> +    return 0;
> +}
> +
> +static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
> +                           uint64_t cumulative_perms,
> +                           uint64_t cumulative_shared_perms,
> +                           GSList *ignore_children, Error **errp)
> +{
> +    int ret;
> +    BlockDriverState *root = bs;
> +    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, root);
> +
> +    for ( ; list; list = list->next) {
> +        bs = list->data;
> +
> +        if (bs != root) {
> +            if (!bdrv_check_parents_compliance(bs, ignore_children, errp)) {
> +                return -EINVAL;
> +            }

At this point bs still had the old permissions, but we don't access
them. As we're going in topological order, the parents have already been
updated if they were a child covered in bdrv_node_check_perm(), so we're
checking the relevant values. Good.

What about the root node? If I understand correctly, the parents of the
root nodes wouldn't have been checked in the old code. In the new state,
the parent BdrvChild already has to contain the new permission.

In bdrv_refresh_perms(), we already check parent conflicts, so no change
for all callers going through it. Good.

bdrv_reopen_multiple() is less obvious. It passes permissions from the
BDRVReopenState, without applying the permissions first. Do we check the
old parent permissions instead of the new state here?

> +            bdrv_get_cumulative_perm(bs, &cumulative_perms,
> +                                     &cumulative_shared_perms);
> +        }
>  
> -        cur_ignore_children = g_slist_prepend(g_slist_copy(ignore_children), c);
> -        ret = bdrv_check_update_perm(c->bs, q, cur_perm, cur_shared,
> -                                     cur_ignore_children, errp);
> -        g_slist_free(cur_ignore_children);
> +        ret = bdrv_node_check_perm(bs, q, cumulative_perms,
> +                                   cumulative_shared_perms,
> +                                   ignore_children, errp);

We use the original ignore_children for every node in the sorted list.
The old code extends it with all nodes in the path to each node.

For the bdrv_check_update_perm() call that is now replaced with
bdrv_check_parents_compliance(), I think this was necessary because
bdrv_check_update_perm() always assumes adding a new edge, so if you
update one instead of adding it, you have to ignore it so that it can't
conflict with itself. This isn't necessary any more now because we just
update and then check for consistency.

For passing to bdrv_node_check_perm() it doesn't make a difference
anyway because the parameter is now unused (and should probably be
removed).

>          if (ret < 0) {
>              return ret;
>          }
> -
> -        bdrv_child_set_perm_safe(c, cur_perm, cur_shared, NULL);
>      }
>  
>      return 0;

A tricky patch to understand, but I think it's right for the most part.

Kevin


