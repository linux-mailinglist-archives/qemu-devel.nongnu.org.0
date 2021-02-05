Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFF4310C6A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 15:03:42 +0100 (CET)
Received: from localhost ([::1]:60556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l81i1-0003nk-Vk
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 09:03:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l81f8-0001yz-Bu
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 09:00:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l81f3-0008H2-G0
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 09:00:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612533634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SXifmunM6AO/NnYy9JaS0UxZRhg6wsJRNbRfd1+3iOA=;
 b=KwGPf5hvVs2WnFsf/9t97L9qDb146FITN+WtIdAKn3ZYrK1yx6V41pEXO3u5CZ6Tl6vIPj
 ord0Q5wQdyx0aTMu4CPXpn1CIPrJkZEMrIe1Dk1R4t1VY9RV4ZXx+7HjYHFbiGMdd0cZ/D
 EM0t/A9b7mRK+7H7kjdITFAxvfiIrEU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-jx4UsYiCPT2VQwiw2RQWCw-1; Fri, 05 Feb 2021 09:00:32 -0500
X-MC-Unique: jx4UsYiCPT2VQwiw2RQWCw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C200107ACC7;
 Fri,  5 Feb 2021 14:00:31 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-240.ams2.redhat.com [10.36.114.240])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D951060C43;
 Fri,  5 Feb 2021 14:00:29 +0000 (UTC)
Date: Fri, 5 Feb 2021 15:00:28 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 28/36] block: add bdrv_set_backing_noperm()
 transaction action
Message-ID: <20210205140028.GC7072@merkur.fritz.box>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-29-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201127144522.29991-29-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
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

Am 27.11.2020 um 15:45 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Split out no-perm part of bdrv_set_backing_hd() as a separate
> transaction action. Note the in case of existing BdrvChild we reuse it,
> not recreate, just to do less actions.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block.c | 111 +++++++++++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 89 insertions(+), 22 deletions(-)
> 
> diff --git a/block.c b/block.c
> index 54fb6d24bd..617cba9547 100644
> --- a/block.c
> +++ b/block.c
> @@ -101,6 +101,7 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
>                                      uint64_t perm, uint64_t shared_perm,
>                                      void *opaque, BdrvChild **child,
>                                      GSList **tran, Error **errp);
> +static void bdrv_remove_backing(BlockDriverState *bs, GSList **tran);
>  
>  static int bdrv_reopen_prepare(BDRVReopenState *reopen_state, BlockReopenQueue
>                                 *queue, Error **errp);
> @@ -3194,45 +3195,111 @@ static BdrvChildRole bdrv_backing_role(BlockDriverState *bs)
>      }
>  }
>  
> +typedef struct BdrvSetBackingNoPermState {
> +    BlockDriverState *bs;
> +    BlockDriverState *backing_bs;
> +    BlockDriverState *old_inherits_from;
> +    GSList *attach_tran;
> +} BdrvSetBackingNoPermState;

Why do we need the nested attach_tran instead of just including these
actions in the outer transaction?

> +static void bdrv_set_backing_noperm_abort(void *opaque)
> +{
> +    BdrvSetBackingNoPermState *s = opaque;
> +
> +    if (s->backing_bs) {
> +        s->backing_bs->inherits_from = s->old_inherits_from;
> +    }
> +
> +    tran_abort(s->attach_tran);
> +
> +    bdrv_refresh_limits(s->bs, NULL);
> +    if (s->old_inherits_from) {
> +        bdrv_refresh_limits(s->old_inherits_from, NULL);
> +    }

How is bs->inherits_from related to limits? I don't see a
bdrv_refresh_limits() call in bdrv_set_backing_noperm() that this would
undo.

> +}
> +
> +static void bdrv_set_backing_noperm_commit(void *opaque)
> +{
> +    BdrvSetBackingNoPermState *s = opaque;
> +
> +    tran_commit(s->attach_tran);
> +}
> +
> +static TransactionActionDrv bdrv_set_backing_noperm_drv = {
> +    .abort = bdrv_set_backing_noperm_abort,
> +    .commit = bdrv_set_backing_noperm_commit,
> +    .clean = g_free,
> +};
> +
>  /*
>   * Sets the bs->backing link of a BDS. A new reference is created; callers
>   * which don't need their own reference any more must call bdrv_unref().
>   */
> -void bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
> -                         Error **errp)
> +static int bdrv_set_backing_noperm(BlockDriverState *bs,
> +                                   BlockDriverState *backing_bs,
> +                                   GSList **tran, Error **errp)
>  {
> -    bool update_inherits_from = bdrv_chain_contains(bs, backing_hd) &&
> -        bdrv_inherits_from_recursive(backing_hd, bs);
> +    int ret = 0;
> +    bool update_inherits_from = bdrv_chain_contains(bs, backing_bs) &&
> +        bdrv_inherits_from_recursive(backing_bs, bs);
> +    GSList *attach_tran = NULL;
> +    BdrvSetBackingNoPermState *s;
>  
>      if (bdrv_is_backing_chain_frozen(bs, child_bs(bs->backing), errp)) {
> -        return;
> +        return -EPERM;
>      }
>  
> -    if (backing_hd) {
> -        bdrv_ref(backing_hd);
> +    if (bs->backing && backing_bs) {
> +        bdrv_replace_child_safe(bs->backing, backing_bs, tran);
> +    } else if (bs->backing && !backing_bs) {
> +        bdrv_remove_backing(bs, tran);
> +    } else if (backing_bs) {
> +        assert(!bs->backing);
> +        ret = bdrv_attach_child_noperm(bs, backing_bs, "backing",
> +                                       &child_of_bds, bdrv_backing_role(bs),
> +                                       &bs->backing, &attach_tran, errp);
> +        if (ret < 0) {
> +            tran_abort(attach_tran);

This looks wrong to me, we'll call tran_abort() a second time through
bdrv_set_backing_noperm_abort() when the outer transaction aborts.

I also notice that the other two if branches do just add things to the
outer 'tran', it's just this branch that gets a nested one.

> +            return ret;
> +        }
>      }
>  
> -    if (bs->backing) {
> -        /* Cannot be frozen, we checked that above */
> -        bdrv_unref_child(bs, bs->backing);
> -        bs->backing = NULL;
> -    }
> +    s = g_new(BdrvSetBackingNoPermState, 1);
> +    *s = (BdrvSetBackingNoPermState) {
> +        .bs = bs,
> +        .backing_bs = backing_bs,
> +        .old_inherits_from = backing_bs ? backing_bs->inherits_from : NULL,
> +    };
> +    tran_prepend(tran, &bdrv_set_backing_noperm_drv, s);
>  
> -    if (!backing_hd) {
> -        goto out;
> +    /*
> +     * If backing_bs was already part of bs's backing chain, and
> +     * inherits_from pointed recursively to bs then let's update it to
> +     * point directly to bs (else it will become NULL).

Setting it to NULL was previously done by bdrv_unref_child().

bdrv_replace_child_safe() and bdrv_remove_backing() don't seem to do
this any more.

> +     */
> +    if (backing_bs && update_inherits_from) {
> +        backing_bs->inherits_from = bs;
>      }
>  
> -    bs->backing = bdrv_attach_child(bs, backing_hd, "backing", &child_of_bds,
> -                                    bdrv_backing_role(bs), errp);
> -    /* If backing_hd was already part of bs's backing chain, and
> -     * inherits_from pointed recursively to bs then let's update it to
> -     * point directly to bs (else it will become NULL). */
> -    if (bs->backing && update_inherits_from) {
> -        backing_hd->inherits_from = bs;
> +    bdrv_refresh_limits(bs, NULL);
> +
> +    return 0;
> +}

Kevin


