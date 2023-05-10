Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 896296FDD12
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 13:48:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwiII-0004Zm-OO; Wed, 10 May 2023 07:47:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwiI6-0004YU-V1
 for qemu-devel@nongnu.org; Wed, 10 May 2023 07:47:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwiI5-0008VC-9r
 for qemu-devel@nongnu.org; Wed, 10 May 2023 07:47:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683719248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SKFoPu7LJ6+InS7gAKcD/uJxZ1MnEoW9r4fjvO1YqQk=;
 b=WOuSHczDYjhWTCrO796c6JzdMNIJCCSuiarm0VQRCc4gL6sGythSzD8vEqK+W0lfq4byMk
 /UwtCVOgwVjv2AFiW9pp0n+uSo/oa94/GIjg7EEzRbBg1s4BaDLAA2NsmXE5W7B05udAwQ
 AQK54i+VN6lcGwmWrNDyplqGpxkDRdM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-yH0xELtBOKafKs7NeSotng-1; Wed, 10 May 2023 07:47:25 -0400
X-MC-Unique: yH0xELtBOKafKs7NeSotng-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BCA8C80C8CE;
 Wed, 10 May 2023 11:47:24 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ABAE72166B26;
 Wed, 10 May 2023 11:47:23 +0000 (UTC)
Date: Wed, 10 May 2023 13:47:22 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, hreitz@redhat.com,
 den@openvz.org, alexander.ivanov@virtuozzo.com
Subject: Re: [PATCH v8 5/5] blockdev: qmp_transaction: drop extra generic layer
Message-ID: <ZFuESuz8bRcElXaF@redhat.com>
References: <20230421115327.907104-1-vsementsov@yandex-team.ru>
 <20230421115327.907104-6-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230421115327.907104-6-vsementsov@yandex-team.ru>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
> Let's simplify things:
> 
> First, actions generally don't need access to common BlkActionState
> structure. The only exclusion are backup actions that need
> block_job_txn.
> 
> Next, for transaction actions of Transaction API is more native to
> allocated state structure in the action itself.
> 
> So, do the following transformation:
> 
> 1. Let all actions be represented by a function with corresponding
>    structure as arguments.
> 
> 2. Instead of array-map marshaller, let's make a function, that calls
>    corresponding action directly.
> 
> 3. BlkActionOps and BlkActionState structures become unused
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

> @@ -1973,11 +1910,9 @@ static void blockdev_backup_clean(void *opaque)
>  }
>  
>  typedef struct BlockDirtyBitmapState {
> -    BlkActionState common;
>      BdrvDirtyBitmap *bitmap;
>      BlockDriverState *bs;
>      HBitmap *backup;
> -    bool prepared;
>      bool was_enabled;
>  } BlockDirtyBitmapState;
>  
> @@ -1987,17 +1922,14 @@ TransactionActionDrv block_dirty_bitmap_add_drv = {
>      .clean = g_free,
>  };
>  
> -static void block_dirty_bitmap_add_action(BlkActionState *common,
> +static void block_dirty_bitmap_add_action(BlockDirtyBitmapAdd *action,
>                                            Transaction *tran, Error **errp)
>  {
>      Error *local_err = NULL;
> -    BlockDirtyBitmapAdd *action;
> -    BlockDirtyBitmapState *state = DO_UPCAST(BlockDirtyBitmapState,
> -                                             common, common);
> +    BlockDirtyBitmapState *state = g_new0(BlockDirtyBitmapState, 1);
>  
>      tran_add(tran, &block_dirty_bitmap_add_drv, state);
>  
> -    action = common->action->u.block_dirty_bitmap_add.data;
>      /* AIO context taken and released within qmp_block_dirty_bitmap_add */
>      qmp_block_dirty_bitmap_add(action->node, action->name,
>                                 action->has_granularity, action->granularity,
> @@ -2006,7 +1938,8 @@ static void block_dirty_bitmap_add_action(BlkActionState *common,
>                                 &local_err);
>  
>      if (!local_err) {
> -        state->prepared = true;
> +        state->bitmap = block_dirty_bitmap_lookup(action->node, action->name,
> +                                                  NULL, &error_abort);
>      } else {
>          error_propagate(errp, local_err);
>      }
> @@ -2014,15 +1947,10 @@ static void block_dirty_bitmap_add_action(BlkActionState *common,
>  
>  static void block_dirty_bitmap_add_abort(void *opaque)
>  {
> -    BlockDirtyBitmapAdd *action;
>      BlockDirtyBitmapState *state = opaque;
>  
> -    action = state->common.action->u.block_dirty_bitmap_add.data;
> -    /* Should not be able to fail: IF the bitmap was added via .prepare(),
> -     * then the node reference and bitmap name must have been valid.
> -     */
> -    if (state->prepared) {
> -        qmp_block_dirty_bitmap_remove(action->node, action->name, &error_abort);
> +    if (state->bitmap) {
> +        bdrv_release_dirty_bitmap(state->bitmap);
>      }
>  }

So you're moving the lookup of the bitmap from .abort to .prepare (or
*_action now). I'm not entirely sure how this is related to the goal of
this specific patch. So the first question is, should it be separate?

The second question is if it is right. Moving it like this means we must
be sure that the bitmap can't be deleted between the lookup and the
.abort call. How can we guarantee this?

On the other hand, we already used &error_abort before, so the
assumption isn't actually new. Just the failure mode changes from
abort() to accessing a dangling pointer, which could be a bit worse.

The rest of the patch looks good.

Kevin


