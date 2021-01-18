Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA852FA42D
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 16:10:56 +0100 (CET)
Received: from localhost ([::1]:49836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1WBD-0000TD-D8
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 10:10:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l1W8u-0007iK-VT
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 10:08:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l1W8p-0006Oi-Us
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 10:08:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610982506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kHw8xGqH/qxCzbuwZHjNnt+uaF6PmhdMTbW2V4q8HYE=;
 b=CZqdetwOt+pKJHPJwx9vdYw0jQQS0XF5dk3FocMtipUX4bCU+9uEnH1OjEt3ApD2JUUZAq
 H4rF8V2H0DpbuA/cjJ8/yTW/R978kJr1u14w7IsteFDSoBI2uhLG3NqGw2xMMOCBXcSRR0
 AM3D3pVK37YkbzroIjcLgvzIDjNtbNA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-Dn06BxAZPnaTjuesFaLGrA-1; Mon, 18 Jan 2021 10:08:25 -0500
X-MC-Unique: Dn06BxAZPnaTjuesFaLGrA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA7E780A5EA;
 Mon, 18 Jan 2021 15:08:22 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-75.ams2.redhat.com [10.36.115.75])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BB8710016FA;
 Mon, 18 Jan 2021 15:08:21 +0000 (UTC)
Date: Mon, 18 Jan 2021 16:08:19 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 05/36] block: add bdrv_parent_try_set_aio_context
Message-ID: <20210118150819.GF11555@merkur.fritz.box>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-6-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201127144522.29991-6-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
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

Am 27.11.2020 um 15:44 hat Vladimir Sementsov-Ogievskiy geschrieben:
> We already have bdrv_parent_can_set_aio_context(). Add corresponding
> bdrv_parent_set_aio_context_ignore() and
> bdrv_parent_try_set_aio_context() and use them instead of open-coding.
> 
> Make bdrv_parent_try_set_aio_context() public, as it will be used in
> further commit.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  include/block/block.h |  2 ++
>  block.c               | 51 +++++++++++++++++++++++++++++++++----------
>  2 files changed, 41 insertions(+), 12 deletions(-)
> 
> diff --git a/include/block/block.h b/include/block/block.h
> index ee3f5a6cca..550c5a7513 100644
> --- a/include/block/block.h
> +++ b/include/block/block.h
> @@ -686,6 +686,8 @@ bool bdrv_child_can_set_aio_context(BdrvChild *c, AioContext *ctx,
>                                      GSList **ignore, Error **errp);
>  bool bdrv_can_set_aio_context(BlockDriverState *bs, AioContext *ctx,
>                                GSList **ignore, Error **errp);
> +int bdrv_parent_try_set_aio_context(BdrvChild *c, AioContext *ctx,
> +                                    Error **errp);
>  int bdrv_probe_blocksizes(BlockDriverState *bs, BlockSizes *bsz);
>  int bdrv_probe_geometry(BlockDriverState *bs, HDGeometry *geo);
>  
> diff --git a/block.c b/block.c
> index 916087ee1a..5d925c208d 100644
> --- a/block.c
> +++ b/block.c
> @@ -81,6 +81,9 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
>                                             BdrvChildRole child_role,
>                                             Error **errp);
>  
> +static void bdrv_parent_set_aio_context_ignore(BdrvChild *c, AioContext *ctx,
> +                                               GSList **ignore);
> +
>  /* If non-zero, use only whitelisted block drivers */
>  static int use_bdrv_whitelist;
>  
> @@ -2655,17 +2658,12 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
>       * try moving the parent into the AioContext of child_bs instead. */
>      if (bdrv_get_aio_context(child_bs) != ctx) {
>          ret = bdrv_try_set_aio_context(child_bs, ctx, &local_err);
> -        if (ret < 0 && child_class->can_set_aio_ctx) {
> -            GSList *ignore = g_slist_prepend(NULL, child);
> -            ctx = bdrv_get_aio_context(child_bs);

You are losing this line...

> -            if (child_class->can_set_aio_ctx(child, ctx, &ignore, NULL)) {
> -                error_free(local_err);
> +        if (ret < 0) {
> +            if (bdrv_parent_try_set_aio_context(child, ctx, NULL) == 0) {

...before this one, so I think the wrong context is passed now. Instead
of trying to move the parent to the AioContext of the child, we'll try
to move it to the AioContext in which it already is (and which doesn't
match the AioContext of the child).

Kevin

>                  ret = 0;
> -                g_slist_free(ignore);
> -                ignore = g_slist_prepend(NULL, child);
> -                child_class->set_aio_ctx(child, ctx, &ignore);
> +                error_free(local_err);
> +                local_err = NULL;
>              }
> -            g_slist_free(ignore);
>          }
>          if (ret < 0) {
>              error_propagate(errp, local_err);
> @@ -6452,9 +6450,7 @@ void bdrv_set_aio_context_ignore(BlockDriverState *bs,
>          if (g_slist_find(*ignore, child)) {
>              continue;
>          }
> -        assert(child->klass->set_aio_ctx);
> -        *ignore = g_slist_prepend(*ignore, child);
> -        child->klass->set_aio_ctx(child, new_context, ignore);
> +        bdrv_parent_set_aio_context_ignore(child, new_context, ignore);
>      }
>  
>      bdrv_detach_aio_context(bs);
> @@ -6511,6 +6507,37 @@ static bool bdrv_parent_can_set_aio_context(BdrvChild *c, AioContext *ctx,
>      return true;
>  }
>  
> +static void bdrv_parent_set_aio_context_ignore(BdrvChild *c, AioContext *ctx,
> +                                               GSList **ignore)
> +{
> +    if (g_slist_find(*ignore, c)) {
> +        return;
> +    }
> +    *ignore = g_slist_prepend(*ignore, c);
> +
> +    assert(c->klass->set_aio_ctx);
> +    c->klass->set_aio_ctx(c, ctx, ignore);
> +}
> +
> +int bdrv_parent_try_set_aio_context(BdrvChild *c, AioContext *ctx,
> +                                    Error **errp)
> +{
> +    GSList *ignore = NULL;
> +
> +    if (!bdrv_parent_can_set_aio_context(c, ctx, &ignore, errp)) {
> +        g_slist_free(ignore);
> +        return -EPERM;
> +    }
> +
> +    g_slist_free(ignore);
> +    ignore = NULL;
> +
> +    bdrv_parent_set_aio_context_ignore(c, ctx, &ignore);
> +    g_slist_free(ignore);
> +
> +    return 0;
> +}
> +
>  bool bdrv_child_can_set_aio_context(BdrvChild *c, AioContext *ctx,
>                                      GSList **ignore, Error **errp)
>  {
> -- 
> 2.21.3
> 


