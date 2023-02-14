Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAFB6962E0
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 12:57:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRtv8-0000Be-O9; Tue, 14 Feb 2023 06:56:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pRtv6-0000BO-Be
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:56:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pRtv4-0001pw-N7
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:56:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676375781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1xWl7ctJrkjos8PT4h6KfbPVZq7+qQlz5o2WBl40J2c=;
 b=Umodu1EbUtBgnZG8PzAsPn1vDeCGr1vWn5u7h7teBzYu6Hkihkvt/hJHfF7PrJZoFEfe2z
 MnEehPS+JgYeMBM5NQNWGC4/J8arsdd4U1TZ1LwZHfrYOcDUmbp4x3a1cFge1fYelFlZD7
 b75qsvLOsyhocQahPI0AwPo3HTDaABE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-jkhTG1ZNPiOXiP2EwqS37g-1; Tue, 14 Feb 2023 06:56:20 -0500
X-MC-Unique: jkhTG1ZNPiOXiP2EwqS37g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 604C985A588;
 Tue, 14 Feb 2023 11:56:20 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 87D9F40CE2A7;
 Tue, 14 Feb 2023 11:56:19 +0000 (UTC)
Date: Tue, 14 Feb 2023 12:56:18 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Aihua Liang <aliang@redhat.com>
Subject: Re: [PATCH] block: temporarily hold the new AioContext of bs_top in
 bdrv_append()
Message-ID: <Y+t24h3RrnCg8mYl@redhat.com>
References: <20230214105156.316586-1-sgarzare@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230214105156.316586-1-sgarzare@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Am 14.02.2023 um 11:51 hat Stefano Garzarella geschrieben:
> bdrv_append() is called with bs_top AioContext held, but
> bdrv_attach_child_noperm() could change the AioContext of bs_top.
> 
> bdrv_replace_node_noperm() calls bdrv_drained_begin() starting from
> commit 2398747128 ("block: Don't poll in bdrv_replace_child_noperm()").
> bdrv_drained_begin() can call BDRV_POLL_WHILE that assumes the new lock
> is taken, so let's temporarily hold the new AioContext to prevent QEMU
> from failing in BDRV_POLL_WHILE when it tries to release the wrong
> AioContext.
> 
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2168209
> Reported-by: Aihua Liang <aliang@redhat.com>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
> I'm not sure whether to use the following Fixes tag. That commit added the
> calls to bdrv_drained_begin() in bdrv_replace_node_noperm(), but maybe the
> problem was pre-existing.
> 
> Fixes: 2398747128 ("block: Don't poll in bdrv_replace_child_noperm()")
> 
> Note: a local reproducer is attached in the BZ, it is based on the Aihua Liang
> report and it hits the issue with a 20% ratio.
> ---
>  block.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/block.c b/block.c
> index aa9062f2c1..0e2bc11e0b 100644
> --- a/block.c
> +++ b/block.c
> @@ -5266,6 +5266,8 @@ int bdrv_drop_filter(BlockDriverState *bs, Error **errp)
>   * child.
>   *
>   * This function does not create any image files.
> + *
> + * The caller must hold the AioContext lock for @bs_top.
>   */
>  int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
>                  Error **errp)
> @@ -5273,11 +5275,14 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
>      int ret;
>      BdrvChild *child;
>      Transaction *tran = tran_new();
> +    AioContext *old_context, *new_context;
>  
>      GLOBAL_STATE_CODE();
>  
>      assert(!bs_new->backing);
>  
> +    old_context = bdrv_get_aio_context(bs_top);
> +
>      child = bdrv_attach_child_noperm(bs_new, bs_top, "backing",
>                                       &child_of_bds, bdrv_backing_role(bs_new),
>                                       tran, errp);
> @@ -5286,11 +5291,29 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
>          goto out;
>      }
>  
> +    /*
> +     * bdrv_attach_child_noperm could change the AioContext of bs_top.
> +     * bdrv_replace_node_noperm calls bdrv_drained_begin, so let's temporarily
> +     * hold the new AioContext, since bdrv_drained_begin calls BDRV_POLL_WHILE
> +     * that assumes the new lock is taken.
> +     */
> +    new_context = bdrv_get_aio_context(bs_top);
> +
> +    if (old_context != new_context) {
> +        aio_context_release(old_context);
> +        aio_context_acquire(new_context);
> +    }
> +
>      ret = bdrv_replace_node_noperm(bs_top, bs_new, true, tran, errp);
>      if (ret < 0) {
>          goto out;

If we take the error path, we return with new_context locked instead of
old_context now.

>      }
>  
> +    if (old_context != new_context) {
> +        aio_context_release(new_context);
> +        aio_context_acquire(old_context);
> +    }
> +
>      ret = bdrv_refresh_perms(bs_new, tran, errp);
>  out:
>      tran_finalize(tran, ret);

Strictly speaking, don't we need to hold the lock across
tran_finalize(), too? It completes the bdrv_replace_node_noperm() call
you covered above.

Maybe bdrv_refresh_perms() and bdrv_refresh_limits(), too, in fact. We
never clearly defined which functions need the lock and which don't, so
hard to tell. It's really time to get rid of it.

Kevin


