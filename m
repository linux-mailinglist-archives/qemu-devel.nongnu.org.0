Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3711446594
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 16:18:00 +0100 (CET)
Received: from localhost ([::1]:60676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj0yd-00054a-LS
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 11:17:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mj0wS-0003dg-Lq
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 11:15:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mj0wN-0002CL-7k
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 11:15:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636125337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6n8fHPw9pmywZmn+OsZpVFH1x9kqYlIzbfmNSMvhrt4=;
 b=DQS61u0akzUdZIOInmFcvEof7ec8PjtXAAndJ0bSLfMr4grNNtwkrEgiZHkP1B6pcmIUyz
 gMp9d6jV6HWCav6ApKhBsUaf6mzwST9/lDsDFQk3Is947eB0/EcYsPnyqGu5r+mc6G7bhE
 pQZz9sKxOcXugf4+Y6YWe600f0Ue/Yg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-x-aB_q9UPsGiDWKP7HFQww-1; Fri, 05 Nov 2021 11:15:33 -0400
X-MC-Unique: x-aB_q9UPsGiDWKP7HFQww-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D2C1801B01;
 Fri,  5 Nov 2021 15:15:32 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.188])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C2628100164A;
 Fri,  5 Nov 2021 15:15:30 +0000 (UTC)
Date: Fri, 5 Nov 2021 16:15:29 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH 5/7] block: Pass BdrvChild ** to replace_child_noperm
Message-ID: <YYVKkd1giB7eZ0k2@redhat.com>
References: <20211104103849.46855-1-hreitz@redhat.com>
 <20211104103849.46855-6-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211104103849.46855-6-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 04.11.2021 um 11:38 hat Hanna Reitz geschrieben:
> bdrv_replace_child_noperm() modifies BdrvChild.bs, and can potentially
> set it to NULL.  That is dangerous, because BDS parents generally assume
> that their children's .bs pointer is never NULL.  We therefore want to
> let bdrv_replace_child_noperm() set the corresponding BdrvChild pointer
> to NULL, too.
> 
> This patch lays the foundation for it by passing a BdrvChild ** pointer
> to bdrv_replace_child_noperm() so that it can later use it to NULL the
> BdrvChild pointer immediately after setting BdrvChild.bs to NULL.
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  block.c | 59 ++++++++++++++++++++++++++++++++-------------------------
>  1 file changed, 33 insertions(+), 26 deletions(-)
> 
> diff --git a/block.c b/block.c
> index 6d230ad3d1..ff45447686 100644
> --- a/block.c
> +++ b/block.c
> @@ -87,7 +87,7 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
>  static bool bdrv_recurse_has_child(BlockDriverState *bs,
>                                     BlockDriverState *child);
>  
> -static void bdrv_replace_child_noperm(BdrvChild *child,
> +static void bdrv_replace_child_noperm(BdrvChild **child,
>                                        BlockDriverState *new_bs);
>  static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
>                                                BdrvChild *child,
> @@ -2254,6 +2254,7 @@ static int bdrv_drv_set_perm(BlockDriverState *bs, uint64_t perm,
>  
>  typedef struct BdrvReplaceChildState {
>      BdrvChild *child;
> +    BdrvChild **childp;

Would it be clearer to rename child to old_child now that it can be
changed?

I would also consider having childp first because this is really the
object that we're modifying and potentially rolling back now.

>      BlockDriverState *old_bs;
>  } BdrvReplaceChildState;
>  
> @@ -2269,8 +2270,8 @@ static void bdrv_replace_child_abort(void *opaque)
>      BdrvReplaceChildState *s = opaque;
>      BlockDriverState *new_bs = s->child->bs;
>  
> -    /* old_bs reference is transparently moved from @s to @s->child */
> -    bdrv_replace_child_noperm(s->child, s->old_bs);
> +    /* old_bs reference is transparently moved from @s to *s->childp */
> +    bdrv_replace_child_noperm(s->childp, s->old_bs);
>      bdrv_unref(new_bs);
>  }
>  
> @@ -2287,21 +2288,23 @@ static TransactionActionDrv bdrv_replace_child_drv = {
>   *
>   * The function doesn't update permissions, caller is responsible for this.
>   */
> -static void bdrv_replace_child_tran(BdrvChild *child, BlockDriverState *new_bs,
> +static void bdrv_replace_child_tran(BdrvChild **childp,
> +                                    BlockDriverState *new_bs,
>                                      Transaction *tran)
>  {
>      BdrvReplaceChildState *s = g_new(BdrvReplaceChildState, 1);
>      *s = (BdrvReplaceChildState) {
> -        .child = child,
> -        .old_bs = child->bs,
> +        .child = *childp,
> +        .childp = childp,
> +        .old_bs = (*childp)->bs,
>      };
>      tran_add(tran, &bdrv_replace_child_drv, s);
>  
>      if (new_bs) {
>          bdrv_ref(new_bs);
>      }
> -    bdrv_replace_child_noperm(child, new_bs);
> -    /* old_bs reference is transparently moved from @child to @s */
> +    bdrv_replace_child_noperm(childp, new_bs);
> +    /* old_bs reference is transparently moved from *childp to @s */
>  }
>  
>  /*
> @@ -2672,9 +2675,10 @@ uint64_t bdrv_qapi_perm_to_blk_perm(BlockPermission qapi_perm)
>      return permissions[qapi_perm];
>  }
>  
> -static void bdrv_replace_child_noperm(BdrvChild *child,
> +static void bdrv_replace_child_noperm(BdrvChild **childp,
>                                        BlockDriverState *new_bs)
>  {
> +    BdrvChild *child = *childp;
>      BlockDriverState *old_bs = child->bs;
>      int new_bs_quiesce_counter;
>      int drain_saldo;
> @@ -2767,7 +2771,7 @@ static void bdrv_attach_child_common_abort(void *opaque)
>      BdrvChild *child = *s->child;
>      BlockDriverState *bs = child->bs;
>  
> -    bdrv_replace_child_noperm(child, NULL);
> +    bdrv_replace_child_noperm(s->child, NULL);
>  
>      if (bdrv_get_aio_context(bs) != s->old_child_ctx) {
>          bdrv_try_set_aio_context(bs, s->old_child_ctx, &error_abort);
> @@ -2867,7 +2871,7 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
>      }
>  
>      bdrv_ref(child_bs);
> -    bdrv_replace_child_noperm(new_child, child_bs);
> +    bdrv_replace_child_noperm(&new_child, child_bs);
>  
>      *child = new_child;
>  
> @@ -2927,12 +2931,12 @@ static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
>      return 0;
>  }
>  
> -static void bdrv_detach_child(BdrvChild *child)
> +static void bdrv_detach_child(BdrvChild **childp)
>  {
> -    BlockDriverState *old_bs = child->bs;
> +    BlockDriverState *old_bs = (*childp)->bs;
>  
> -    bdrv_replace_child_noperm(child, NULL);
> -    bdrv_child_free(child);
> +    bdrv_replace_child_noperm(childp, NULL);
> +    bdrv_child_free(*childp);
>  
>      if (old_bs) {
>          /*
> @@ -3038,7 +3042,7 @@ void bdrv_root_unref_child(BdrvChild *child)
>      BlockDriverState *child_bs;
>  
>      child_bs = child->bs;
> -    bdrv_detach_child(child);
> +    bdrv_detach_child(&child);
>      bdrv_unref(child_bs);
>  }
>  
> @@ -4891,30 +4895,33 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
>                                                BdrvChild *child,
>                                                Transaction *tran)
>  {
> +    BdrvChild **childp;
>      BdrvRemoveFilterOrCowChild *s;
>  
> -    assert(child == bs->backing || child == bs->file);
> +    if (child == bs->backing) {
> +        childp = &bs->backing;
> +    } else if (child == bs->file) {
> +        childp = &bs->file;
> +    } else {
> +        g_assert_not_reached();
> +    }
>  
>      if (!child) {
>          return;
>      }
>  
>      if (child->bs) {
> -        bdrv_replace_child_tran(child, NULL, tran);
> +        bdrv_replace_child_tran(childp, NULL, tran);
>      }
>  
>      s = g_new(BdrvRemoveFilterOrCowChild, 1);
>      *s = (BdrvRemoveFilterOrCowChild) {
>          .child = child,
> -        .is_backing = (child == bs->backing),
> +        .is_backing = (childp == &bs->backing),
>      };
>      tran_add(tran, &bdrv_remove_filter_or_cow_child_drv, s);
>  
> -    if (s->is_backing) {
> -        bs->backing = NULL;
> -    } else {
> -        bs->file = NULL;
> -    }
> +    *childp = NULL;
>  }

Hmm... This looks a bit dangerous. Is it guaranteed that bs lives until
the end of the transaction? I guess it has to because we want to be able
to roll back, so probably this is okay, though I'm not sure if I would
bet money on it.

But...

> @@ -4950,7 +4957,7 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
>                         c->name, from->node_name);
>              return -EPERM;
>          }
> -        bdrv_replace_child_tran(c, to, tran);
> +        bdrv_replace_child_tran(&c, to, tran);
>      }

...here, c is a local stack variable that is even reused in a loop.
bdrv_replace_child_tran() now keeps a pointer to the same variable in
the transaction state for each BdrvChild in the whole parent list, and
by the time the transaction is finalised, I think they are all dangling
pointers anyway because they pointed to stack variables in a function
that has already returned.

bdrv_replace_child_tran() should probably have a comment like we already
have in bdrv_attach_child_common():

 * @child is saved to a new entry of @tran, so that *@child could be reverted to
 * NULL on abort(). So referenced variable must live at least until transaction
 * end.

>      return 0;
> @@ -5099,7 +5106,7 @@ int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
>      bdrv_drained_begin(old_bs);
>      bdrv_drained_begin(new_bs);
>  
> -    bdrv_replace_child_tran(child, new_bs, tran);
> +    bdrv_replace_child_tran(&child, new_bs, tran);
>  
>      found = g_hash_table_new(NULL, NULL);
>      refresh_list = bdrv_topological_dfs(refresh_list, found, old_bs);

Kevin


