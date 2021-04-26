Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E8436B691
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 18:15:30 +0200 (CEST)
Received: from localhost ([::1]:44470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb3tQ-0001Xe-Ss
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 12:15:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lb3sK-0000zO-3u
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 12:14:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lb3sD-0006T2-Un
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 12:14:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619453652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GxN5eAkcCdp0DEr57CTqHaMHb2pRhWYNQ/gKg5VXhL8=;
 b=VAjqqgNUMIIfsLkh6Zj0JOEsa/UO3GLijnjLPmGxI5Bv64fBauPg2n2ED002N0QyzoB/lR
 wG7jHtVkbO83I66bajr/cHx2GDLB3AAstUNEDgFLzjlhRyrUvqw08Ehwi4IrKOpn1fhzJI
 WOdQwyF5mQhWsd6SvZDjlfrxxJn8Zc8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-tIisiJGgOUiWPt0Pv-v6Sg-1; Mon, 26 Apr 2021 12:14:09 -0400
X-MC-Unique: tIisiJGgOUiWPt0Pv-v6Sg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AAB01008060;
 Mon, 26 Apr 2021 16:14:08 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-177.ams2.redhat.com [10.36.114.177])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 297AA19719;
 Mon, 26 Apr 2021 16:14:01 +0000 (UTC)
Date: Mon, 26 Apr 2021 18:14:00 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 18/36] block: add bdrv_attach_child_common()
 transaction action
Message-ID: <YIbmyOnhszPltzfA@merkur.fritz.box>
References: <20210317143529.615584-1-vsementsov@virtuozzo.com>
 <20210317143529.615584-19-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210317143529.615584-19-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
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
Cc: fam@euphon.net, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 armbru@redhat.com, stefanha@redhat.com, mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17.03.2021 um 15:35 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Split out no-perm part of bdrv_root_attach_child() into separate
> transaction action. bdrv_root_attach_child() now moves to new
> permission update paradigm: first update graph relations then update
> permissions.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block.c | 189 ++++++++++++++++++++++++++++++++++++++++----------------
>  1 file changed, 135 insertions(+), 54 deletions(-)
> 
> diff --git a/block.c b/block.c
> index 98ff44dbf7..b6bdc534d2 100644
> --- a/block.c
> +++ b/block.c
> @@ -2921,37 +2921,73 @@ static void bdrv_replace_child(BdrvChild *child, BlockDriverState *new_bs)
>      }
>  }
>  
> -/*
> - * This function steals the reference to child_bs from the caller.
> - * That reference is later dropped by bdrv_root_unref_child().
> - *
> - * On failure NULL is returned, errp is set and the reference to
> - * child_bs is also dropped.
> - *
> - * The caller must hold the AioContext lock @child_bs, but not that of @ctx
> - * (unless @child_bs is already in @ctx).
> - */
> -BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
> -                                  const char *child_name,
> -                                  const BdrvChildClass *child_class,
> -                                  BdrvChildRole child_role,
> -                                  uint64_t perm, uint64_t shared_perm,
> -                                  void *opaque, Error **errp)
> +static void bdrv_remove_empty_child(BdrvChild *child)
>  {
> -    BdrvChild *child;
> -    Error *local_err = NULL;
> -    int ret;
> -    AioContext *ctx;
> +    assert(!child->bs);
> +    QLIST_SAFE_REMOVE(child, next);
> +    g_free(child->name);
> +    g_free(child);
> +}
>  
> -    ret = bdrv_check_update_perm(child_bs, NULL, perm, shared_perm, NULL, errp);
> -    if (ret < 0) {
> -        bdrv_abort_perm_update(child_bs);
> -        bdrv_unref(child_bs);
> -        return NULL;
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
>      }
>  
> -    child = g_new(BdrvChild, 1);
> -    *child = (BdrvChild) {
> +    if (bdrv_child_get_parent_aio_context(child) != s->old_parent_ctx) {
> +        GSList *ignore = g_slist_prepend(NULL, child);
> +
> +        child->klass->can_set_aio_ctx(child, s->old_parent_ctx, &ignore,
> +                                      &error_abort);
> +        g_slist_free(ignore);
> +        ignore = g_slist_prepend(NULL, child);
> +        child->klass->set_aio_ctx(child, s->old_parent_ctx, &ignore);
> +
> +        g_slist_free(ignore);
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
> +                                    Transaction *tran, Error **errp)
> +{
> +    BdrvChild *new_child;
> +    AioContext *parent_ctx;
> +    AioContext *child_ctx = bdrv_get_aio_context(child_bs);
> +
> +    assert(child);
> +    assert(*child == NULL);
> +
> +    new_child = g_new(BdrvChild, 1);
> +    *new_child = (BdrvChild) {
>          .bs             = NULL,
>          .name           = g_strdup(child_name),
>          .klass          = child_class,
> @@ -2961,37 +2997,92 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
>          .opaque         = opaque,
>      };
>  
> -    ctx = bdrv_child_get_parent_aio_context(child);
> -
> -    /* If the AioContexts don't match, first try to move the subtree of
> +    /*
> +     * If the AioContexts don't match, first try to move the subtree of
>       * child_bs into the AioContext of the new parent. If this doesn't work,
> -     * try moving the parent into the AioContext of child_bs instead. */
> -    if (bdrv_get_aio_context(child_bs) != ctx) {
> -        ret = bdrv_try_set_aio_context(child_bs, ctx, &local_err);
> +     * try moving the parent into the AioContext of child_bs instead.
> +     */
> +    parent_ctx = bdrv_child_get_parent_aio_context(new_child);
> +    if (child_ctx != parent_ctx) {
> +        Error *local_err = NULL;
> +        int ret = bdrv_try_set_aio_context(child_bs, parent_ctx, &local_err);
> +
>          if (ret < 0 && child_class->can_set_aio_ctx) {
> -            GSList *ignore = g_slist_prepend(NULL, child);
> -            ctx = bdrv_get_aio_context(child_bs);
> -            if (child_class->can_set_aio_ctx(child, ctx, &ignore, NULL)) {
> +            GSList *ignore = g_slist_prepend(NULL, new_child);
> +            if (child_class->can_set_aio_ctx(new_child, child_ctx, &ignore,
> +                                             NULL))
> +            {
>                  error_free(local_err);
>                  ret = 0;
>                  g_slist_free(ignore);
> -                ignore = g_slist_prepend(NULL, child);
> -                child_class->set_aio_ctx(child, ctx, &ignore);
> +                ignore = g_slist_prepend(NULL, new_child);
> +                child_class->set_aio_ctx(new_child, child_ctx, &ignore);
>              }
>              g_slist_free(ignore);
>          }
> +
>          if (ret < 0) {
>              error_propagate(errp, local_err);
> -            g_free(child);
> -            bdrv_abort_perm_update(child_bs);
> -            bdrv_unref(child_bs);
> -            return NULL;
> +            bdrv_remove_empty_child(new_child);
> +            return ret;
>          }
>      }
>  
> -    /* This performs the matching bdrv_set_perm() for the above check. */
> -    bdrv_replace_child(child, child_bs);
> +    bdrv_ref(child_bs);
> +    bdrv_replace_child_noperm(new_child, child_bs);
> +
> +    *child = new_child;
>  
> +    BdrvAttachChildCommonState *s = g_new(BdrvAttachChildCommonState, 1);
> +    *s = (BdrvAttachChildCommonState) {
> +        .child = child,
> +        .old_parent_ctx = parent_ctx,
> +        .old_child_ctx = child_ctx,
> +    };
> +    tran_add(tran, &bdrv_attach_child_common_drv, s);

Who frees s? Should bdrv_attach_child_common_drv have a .clean?

> +
> +    return 0;
> +}

Kevin


