Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A6230E498
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 22:03:16 +0100 (CET)
Received: from localhost ([::1]:45478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7PIx-0007Ct-6G
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 16:03:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l7PH8-0006MV-5r
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 16:01:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l7PH5-0001xK-Ry
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 16:01:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612386078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=puubgs+6+ana526Al4FgAJHs5i9YiTWPILZNmta0dvc=;
 b=F/HJrU9s4L239FBAGogEFdoDjU4T8XzBZhfra4V7AKCuDLkxkX9cbKupq+VAPbfd18SeT6
 CzrX1mTdz2utKqeQ+MsNlNqobadkdF3Xj1VYaEVHm0NHhM5mvTQTjfQVumfWvkjYg8WjdV
 NYyIzw0bQ09Ow0bvpeIEsCy6IezjrZo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-7UFz_0KEM5GqpD6eAhyOzw-1; Wed, 03 Feb 2021 16:01:15 -0500
X-MC-Unique: 7UFz_0KEM5GqpD6eAhyOzw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BE1156C5F;
 Wed,  3 Feb 2021 21:01:07 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-32.ams2.redhat.com [10.36.115.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 78F885886C;
 Wed,  3 Feb 2021 21:01:05 +0000 (UTC)
Date: Wed, 3 Feb 2021 22:01:04 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 20/36] block: add bdrv_attach_child_common()
 transaction action
Message-ID: <20210203210104.GH5507@merkur.fritz.box>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-21-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201127144522.29991-21-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
> Split out no-perm part of bdrv_root_attach_child() into separate
> transaction action. bdrv_root_attach_child() now moves to new
> permission update paradigm: first update graph relations then update
> permissions.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block.c | 162 ++++++++++++++++++++++++++++++++++++++++----------------
>  1 file changed, 117 insertions(+), 45 deletions(-)
> 
> diff --git a/block.c b/block.c
> index f0fcd75555..a7ccbb4fb1 100644
> --- a/block.c
> +++ b/block.c
> @@ -86,6 +86,13 @@ static void bdrv_parent_set_aio_context_ignore(BdrvChild *c, AioContext *ctx,
>                                                 GSList **ignore);
>  static void bdrv_replace_child_noperm(BdrvChild *child,
>                                        BlockDriverState *new_bs);
> +static int bdrv_attach_child_common(BlockDriverState *child_bs,
> +                                    const char *child_name,
> +                                    const BdrvChildClass *child_class,
> +                                    BdrvChildRole child_role,
> +                                    uint64_t perm, uint64_t shared_perm,
> +                                    void *opaque, BdrvChild **child,
> +                                    GSList **tran, Error **errp);

If you added the new code above bdrv_root_attach_child(), we wouldn't
need the forward declaration and the patch would probably be simpler to
read (because it's the first part of bdrv_root_attach_child() that is
factored out).

>  static int bdrv_reopen_prepare(BDRVReopenState *reopen_state, BlockReopenQueue
>                                 *queue, Error **errp);
> @@ -2898,55 +2905,22 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
>                                    uint64_t perm, uint64_t shared_perm,
>                                    void *opaque, Error **errp)
>  {
> -    BdrvChild *child;
> -    Error *local_err = NULL;
>      int ret;
> -    AioContext *ctx;
> +    BdrvChild *child = NULL;
> +    GSList *tran = NULL;
>  
> -    ret = bdrv_check_update_perm(child_bs, NULL, perm, shared_perm, NULL, errp);
> +    ret = bdrv_attach_child_common(child_bs, child_name, child_class,
> +                                   child_role, perm, shared_perm, opaque,
> +                                   &child, &tran, errp);
>      if (ret < 0) {
> -        bdrv_abort_perm_update(child_bs);
>          bdrv_unref(child_bs);
>          return NULL;
>      }
>  
> -    child = g_new(BdrvChild, 1);
> -    *child = (BdrvChild) {
> -        .bs             = NULL,
> -        .name           = g_strdup(child_name),
> -        .klass          = child_class,
> -        .role           = child_role,
> -        .perm           = perm,
> -        .shared_perm    = shared_perm,
> -        .opaque         = opaque,
> -    };
> -
> -    ctx = bdrv_child_get_parent_aio_context(child);
> -
> -    /* If the AioContexts don't match, first try to move the subtree of
> -     * child_bs into the AioContext of the new parent. If this doesn't work,
> -     * try moving the parent into the AioContext of child_bs instead. */
> -    if (bdrv_get_aio_context(child_bs) != ctx) {
> -        ret = bdrv_try_set_aio_context(child_bs, ctx, &local_err);
> -        if (ret < 0) {
> -            if (bdrv_parent_try_set_aio_context(child, ctx, NULL) == 0) {
> -                ret = 0;
> -                error_free(local_err);
> -                local_err = NULL;
> -            }
> -        }
> -        if (ret < 0) {
> -            error_propagate(errp, local_err);
> -            g_free(child);
> -            bdrv_abort_perm_update(child_bs);
> -            bdrv_unref(child_bs);
> -            return NULL;
> -        }
> -    }
> -
> -    /* This performs the matching bdrv_set_perm() for the above check. */
> -    bdrv_replace_child(child, child_bs);
> +    ret = bdrv_refresh_perms(child_bs, errp);
> +    tran_finalize(tran, ret);
>  
> +    bdrv_unref(child_bs);
>      return child;
>  }
>  
> @@ -2988,16 +2962,114 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
>      return child;
>  }
>  
> -static void bdrv_detach_child(BdrvChild *child)
> +static void bdrv_remove_empty_child(BdrvChild *child)
>  {
> +    assert(!child->bs);
>      QLIST_SAFE_REMOVE(child, next);
> -
> -    bdrv_replace_child(child, NULL);
> -
>      g_free(child->name);
>      g_free(child);
>  }
>  
> +typedef struct BdrvAttachChildCommonState {
> +    BdrvChild **child;
> +    AioContext *old_parent_ctx;
> +    AioContext *old_child_ctx;
> +} BdrvAttachChildCommonState;
> +
> +static void bdrv_attach_child_common_abort(void *opaque)
> +{
> +    BdrvAttachChildCommonState *s = opaque;
> +    BdrvChild *child = *s->child;
> +    BlockDriverState *bs = child->bs;
> +
> +    bdrv_replace_child_noperm(child, NULL);
> +
> +    if (bdrv_get_aio_context(bs) != s->old_child_ctx) {
> +        bdrv_try_set_aio_context(bs, s->old_child_ctx, &error_abort);

Would failure actually be fatal? I think we can ignore it, the node is
in an AioContext that works for it.

> +    }
> +
> +    if (bdrv_child_get_parent_aio_context(child) != s->old_parent_ctx) {
> +        bdrv_parent_try_set_aio_context(child, s->old_parent_ctx,
> +                                        &error_abort);

And the same here.

> +    }
> +
> +    bdrv_unref(bs);
> +    bdrv_remove_empty_child(child);
> +    *s->child = NULL;
> +}
> +
> +static TransactionActionDrv bdrv_attach_child_common_drv = {
> +    .abort = bdrv_attach_child_common_abort,
> +};
> +
> +/*
> + * Common part of attoching bdrv child to bs or to blk or to job
> + */
> +static int bdrv_attach_child_common(BlockDriverState *child_bs,
> +                                    const char *child_name,
> +                                    const BdrvChildClass *child_class,
> +                                    BdrvChildRole child_role,
> +                                    uint64_t perm, uint64_t shared_perm,
> +                                    void *opaque, BdrvChild **child,
> +                                    GSList **tran, Error **errp)
> +{
> +    int ret;
> +    BdrvChild *new_child;
> +    AioContext *parent_ctx;
> +    AioContext *child_ctx = bdrv_get_aio_context(child_bs);
> +
> +    assert(child);
> +    assert(*child == NULL);
> +
> +    new_child = g_new(BdrvChild, 1);
> +    *new_child = (BdrvChild) {
> +        .bs             = NULL,
> +        .name           = g_strdup(child_name),
> +        .klass          = child_class,
> +        .role           = child_role,
> +        .perm           = perm,
> +        .shared_perm    = shared_perm,
> +        .opaque         = opaque,
> +    };
> +
> +    parent_ctx = bdrv_child_get_parent_aio_context(new_child);
> +    if (child_ctx != parent_ctx) {
> +        ret = bdrv_try_set_aio_context(child_bs, parent_ctx, NULL);
> +        if (ret < 0) {
> +            /*
> +             * bdrv_try_set_aio_context_tran don't need rollback after failure,
> +             * so we don't care.
> +             */
> +            ret = bdrv_parent_try_set_aio_context(new_child, child_ctx, errp);
> +        }
> +        if (ret < 0) {
> +            bdrv_remove_empty_child(new_child);
> +            return ret;
> +        }
> +    }

Not sure why you decided to rewrite this block while moving it from
bdrv_root_attach_child().

We're losing the comment above it, and a possible error message is now
related to changing the context of the parent node instead of the newly
added node, which I imagine is less obvious in the general case.

> +    bdrv_ref(child_bs);
> +    bdrv_replace_child_noperm(new_child, child_bs);
> +
> +    *child = new_child;
> +
> +    BdrvAttachChildCommonState *s = g_new(BdrvAttachChildCommonState, 1);
> +    *s = (BdrvAttachChildCommonState) {
> +        .child = child,
> +        .old_parent_ctx = parent_ctx,
> +        .old_child_ctx = child_ctx,
> +    };
> +    tran_prepend(tran, &bdrv_attach_child_common_drv, s);
> +
> +    return 0;
> +}

Kevin


