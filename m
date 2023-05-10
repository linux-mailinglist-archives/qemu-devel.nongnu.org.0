Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E8F6FDC5B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 13:11:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwhis-0001T0-1Z; Wed, 10 May 2023 07:11:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwhip-0001Rp-8p
 for qemu-devel@nongnu.org; Wed, 10 May 2023 07:11:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwhin-0000hQ-PS
 for qemu-devel@nongnu.org; Wed, 10 May 2023 07:11:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683717061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kJmelcfiUk6XfOzkiefCUTq6gfCUdd3MpvT74U5iysM=;
 b=aaMUgOcDVlOMmf8LqRvTHHxC61aFqvYKiVZBvuo5a3egvLmfDgpZSMBLVJCbwSIQQ6nxXa
 BhHlCZJ/yKuv8cCiJjS2Dc09aQ0UKgbZkNLaWuojPnKh8iggpZ0qN7g7l//Hn/BAhN+wHR
 +ksVvGvJwsMJUnqDEo0xsXCJTJITApo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-4iwdBb5vNJKTYxyx_fDW4g-1; Wed, 10 May 2023 07:10:57 -0400
X-MC-Unique: 4iwdBb5vNJKTYxyx_fDW4g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B337381459F;
 Wed, 10 May 2023 11:10:57 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 61F0D4078906;
 Wed, 10 May 2023 11:10:56 +0000 (UTC)
Date: Wed, 10 May 2023 13:10:54 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, hreitz@redhat.com,
 den@openvz.org, alexander.ivanov@virtuozzo.com
Subject: Re: [PATCH v8 1/5] blockdev: refactor transaction to use Transaction
 API
Message-ID: <ZFt7vgF/JTmbwZoK@redhat.com>
References: <20230421115327.907104-1-vsementsov@yandex-team.ru>
 <20230421115327.907104-2-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230421115327.907104-2-vsementsov@yandex-team.ru>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Am 21.04.2023 um 13:53 hat Vladimir Sementsov-Ogievskiy geschrieben:
> We are going to add more block-graph modifying transaction actions,
> and block-graph modifying functions are already based on Transaction
> API.
> 
> Next, we'll need to separately update permissions after several
> graph-modifying actions, and this would be simple with help of
> Transaction API.
> 
> So, now let's just transform what we have into new-style transaction
> actions.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>  blockdev.c | 317 +++++++++++++++++++++++++++++++----------------------
>  1 file changed, 186 insertions(+), 131 deletions(-)

> diff --git a/blockdev.c b/blockdev.c
> index d7b5c18f0a..293f6a958e 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -1380,10 +1384,9 @@ static void internal_snapshot_abort(BlkActionState *common)
>      aio_context_release(aio_context);
>  }
>  
> -static void internal_snapshot_clean(BlkActionState *common)
> +static void internal_snapshot_clean(void *opaque)
>  {
> -    InternalSnapshotState *state = DO_UPCAST(InternalSnapshotState,
> -                                             common, common);
> +    InternalSnapshotState *state = opaque;
>      AioContext *aio_context;
>  
>      if (!state->bs) {
> @@ -1396,6 +1399,8 @@ static void internal_snapshot_clean(BlkActionState *common)
>      bdrv_drained_end(state->bs);
>  
>      aio_context_release(aio_context);
> +
> +    g_free(state);
>  }

state is leaked if we take the early return a few lines above:

    if (!state->bs) {
        return;
    }

>  /* external snapshot private data */
> @@ -1657,6 +1670,8 @@ static void external_snapshot_clean(BlkActionState *common)
>      bdrv_unref(state->new_bs);
>  
>      aio_context_release(aio_context);
> +
> +    g_free(state);
>  }

Same potential leak of state.

>  typedef struct DriveBackupState {
> @@ -1856,6 +1883,8 @@ static void drive_backup_clean(BlkActionState *common)
>      bdrv_drained_end(state->bs);
>  
>      aio_context_release(aio_context);
> +
> +    g_free(state);
>  }

Here as well.

>  typedef struct BlockdevBackupState {
> @@ -1950,6 +1991,8 @@ static void blockdev_backup_clean(BlkActionState *common)
>      bdrv_drained_end(state->bs);
>  
>      aio_context_release(aio_context);
> +
> +    g_free(state);
>  }

And here.

Other than that, the patch looks good to me.

Kevin


