Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D282446618
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 16:44:50 +0100 (CET)
Received: from localhost ([::1]:58986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj1Ob-0007Hm-En
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 11:44:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mj1Lv-0004YH-CO
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 11:42:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mj1Lr-00009T-7Q
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 11:42:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636126917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LbuTeYUk4pFIlcaBLId7NhdIVcB/sDDyMuLV0cMaVcA=;
 b=QrhGHrNLcJMGZf/x2uWloqsENc1yT/unSL8lNwXH30m9FGSupNIEnQhYh2McPdPEgwCA6D
 TqUCK4AoZN7OZA6bCL8SjI31vQJSda1kodOm6+92F6jxjzZ3vAkMoWRPZm52HcfuYC5N/G
 xiqyvtN2+5+RfBNqGPJ4RlM2lWbnGIM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-vw9HStWrN9Gh7N-TUsgc9w-1; Fri, 05 Nov 2021 11:41:54 -0400
X-MC-Unique: vw9HStWrN9Gh7N-TUsgc9w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89F681006AA6;
 Fri,  5 Nov 2021 15:41:53 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.188])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 56E2E197FC;
 Fri,  5 Nov 2021 15:41:52 +0000 (UTC)
Date: Fri, 5 Nov 2021 16:41:50 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH 6/7] block: Let replace_child_noperm free children
Message-ID: <YYVQvkRFekBcJL1R@redhat.com>
References: <20211104103849.46855-1-hreitz@redhat.com>
 <20211104103849.46855-7-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211104103849.46855-7-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
> In most of the block layer, especially when traversing down from other
> BlockDriverStates, we assume that BdrvChild.bs can never be NULL.  When
> it becomes NULL, it is expected that the corresponding BdrvChild pointer
> also becomes NULL and the BdrvChild object is freed.
> 
> Therefore, once bdrv_replace_child_noperm() sets the BdrvChild.bs
> pointer to NULL, it should also immediately set the corresponding
> BdrvChild pointer (like bs->file or bs->backing) to NULL.
> 
> In that context, it also makes sense for this function to free the
> child.  Sometimes we cannot do so, though, because it is called in a
> transactional context where the caller might still want to reinstate the
> child in the abort branch (and free it only on commit), so this behavior
> has to remain optional.
> 
> In bdrv_replace_child_tran()'s abort handler, we now rely on the fact
> that the BdrvChild passed to bdrv_replace_child_tran() must have had a
> non-NULL .bs pointer initially.  Make a note of that and assert it.
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  block.c | 102 +++++++++++++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 86 insertions(+), 16 deletions(-)
> 
> diff --git a/block.c b/block.c
> index ff45447686..0a85ede8dc 100644
> --- a/block.c
> +++ b/block.c
> @@ -87,8 +87,10 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
>  static bool bdrv_recurse_has_child(BlockDriverState *bs,
>                                     BlockDriverState *child);
>  
> +static void bdrv_child_free(BdrvChild *child);
>  static void bdrv_replace_child_noperm(BdrvChild **child,
> -                                      BlockDriverState *new_bs);
> +                                      BlockDriverState *new_bs,
> +                                      bool free_empty_child);
>  static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
>                                                BdrvChild *child,
>                                                Transaction *tran);
> @@ -2256,12 +2258,16 @@ typedef struct BdrvReplaceChildState {
>      BdrvChild *child;
>      BdrvChild **childp;
>      BlockDriverState *old_bs;
> +    bool free_empty_child;
>  } BdrvReplaceChildState;
>  
>  static void bdrv_replace_child_commit(void *opaque)
>  {
>      BdrvReplaceChildState *s = opaque;
>  
> +    if (s->free_empty_child && !s->child->bs) {
> +        bdrv_child_free(s->child);
> +    }
>      bdrv_unref(s->old_bs);
>  }
>  
> @@ -2270,8 +2276,23 @@ static void bdrv_replace_child_abort(void *opaque)
>      BdrvReplaceChildState *s = opaque;
>      BlockDriverState *new_bs = s->child->bs;
>  
> -    /* old_bs reference is transparently moved from @s to *s->childp */
> -    bdrv_replace_child_noperm(s->childp, s->old_bs);
> +    /*
> +     * old_bs reference is transparently moved from @s to s->child;
> +     * pass &s->child here instead of s->childp, because *s->childp
> +     * will have been cleared by bdrv_replace_child_tran()'s
> +     * bdrv_replace_child_noperm() call if new_bs is NULL, and we must
> +     * not pass a NULL *s->childp here.
> +     */
> +    bdrv_replace_child_noperm(&s->child, s->old_bs, true);

Passing free_empty_child=true with a non-NULL new_bs looks a bit
confusing because the child isn't supposed to become empty anyway.

> +    /*
> +     * The child was pre-existing, so s->old_bs must be non-NULL, and
> +     * s->child thus must not have been freed
> +     */
> +    assert(s->child != NULL);
> +    if (!new_bs) {
> +        /* As described above, *s->childp was cleared, so restore it */
> +        *s->childp = s->child;
> +    }

If it wasn't cleared, doesn't it still contain s->child, so this could
just be an unconditional rollback?

>      bdrv_unref(new_bs);
>  }

Kevin


