Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FAA310FD3
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 19:25:51 +0100 (CET)
Received: from localhost ([::1]:50998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l85ni-0007ox-HJ
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 13:25:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l85M9-00040Y-6z
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:57:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l85M2-0002U8-S1
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:57:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612547832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tDFEDRnGk9FQuv0to0J9i+I/mJN7MbcYL8pG0IxqE5E=;
 b=D9VzI6rtQH8GWl7mZIpni5IkFuqkmjSkHA8SqRU17euY1vNY21vb9jX3qnq/E5XlEhCWlw
 DIbZb/dxThXg7q+Cf49nNQePd72F3or+WYhwWn8A4lsIJdEc+zBjm+YaA7w29Mf/bxbdkW
 +KsGM7g319J/NkxpqJi90MSUACQK0cM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-tbYdHvgDN1iveH1soD9E1Q-1; Fri, 05 Feb 2021 12:57:10 -0500
X-MC-Unique: tbYdHvgDN1iveH1soD9E1Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 787F31800D41;
 Fri,  5 Feb 2021 17:57:09 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-240.ams2.redhat.com [10.36.114.240])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C3C6560C43;
 Fri,  5 Feb 2021 17:57:07 +0000 (UTC)
Date: Fri, 5 Feb 2021 18:57:06 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 30/36] block: bdrv_reopen_multiple: refresh
 permissions on updated graph
Message-ID: <20210205175706.GI7072@merkur.fritz.box>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-31-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201127144522.29991-31-vsementsov@virtuozzo.com>
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
> Move bdrv_reopen_multiple to new paradigm of permission update:
> first update graph relations, then do refresh the permissions.
> 
> We have to modify reopen process in file-posix driver: with new scheme
> we don't have prepared permissions in raw_reopen_prepare(), so we
> should reconfigure fd in raw_check_perm(). Still this seems more native
> and simple anyway.

Hm... The diffstat shows that it is simpler because it needs less code.

But relying on the permission change callbacks for getting a new file
descriptor that changes more than just permissions doesn't feel
completely right either. Can we even expect the permission callbacks to
be called when the permissions aren't changed?

But then, reopen and permission updates were already a bit entangled
before. If we can guarantee that the permission functions will always be
called, even if the permissions don't change, I guess it's okay.

> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  include/block/block.h |   2 +-
>  block.c               | 183 +++++++++++-------------------------------
>  block/file-posix.c    |  84 +++++--------------
>  3 files changed, 70 insertions(+), 199 deletions(-)
> 
> diff --git a/include/block/block.h b/include/block/block.h
> index 0f21ef313f..82271d9ccd 100644
> --- a/include/block/block.h
> +++ b/include/block/block.h
> @@ -195,7 +195,7 @@ typedef struct BDRVReopenState {
>      BlockdevDetectZeroesOptions detect_zeroes;
>      bool backing_missing;
>      bool replace_backing_bs;  /* new_backing_bs is ignored if this is false */
> -    BlockDriverState *new_backing_bs; /* If NULL then detach the current bs */
> +    BlockDriverState *old_backing_bs; /* keep pointer for permissions update */
>      uint64_t perm, shared_perm;

perm and shared_perm are unused now and can be removed.

>      QDict *options;
>      QDict *explicit_options;
> diff --git a/block.c b/block.c
> index 617cba9547..474e624152 100644
> --- a/block.c
> +++ b/block.c
> @@ -103,8 +103,9 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
>                                      GSList **tran, Error **errp);
>  static void bdrv_remove_backing(BlockDriverState *bs, GSList **tran);
>  
> -static int bdrv_reopen_prepare(BDRVReopenState *reopen_state, BlockReopenQueue
> -                               *queue, Error **errp);
> +static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
> +                               BlockReopenQueue *queue,
> +                               GSList **set_backings_tran, Error **errp);
>  static void bdrv_reopen_commit(BDRVReopenState *reopen_state);
>  static void bdrv_reopen_abort(BDRVReopenState *reopen_state);
>  
> @@ -2403,6 +2404,7 @@ static void bdrv_list_abort_perm_update(GSList *list)
>      }
>  }
>  
> +__attribute__((unused))
>  static void bdrv_abort_perm_update(BlockDriverState *bs)
>  {
>      g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
> @@ -2498,6 +2500,7 @@ char *bdrv_perm_names(uint64_t perm)
>   *
>   * Needs to be followed by a call to either bdrv_set_perm() or
>   * bdrv_abort_perm_update(). */
> +__attribute__((unused))
>  static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
>                                    uint64_t new_used_perm,
>                                    uint64_t new_shared_perm,
> @@ -4100,10 +4103,6 @@ static BlockReopenQueue *bdrv_reopen_queue_child(BlockReopenQueue *bs_queue,
>      bs_entry->state.explicit_options = explicit_options;
>      bs_entry->state.flags = flags;
>  
> -    /* This needs to be overwritten in bdrv_reopen_prepare() */
> -    bs_entry->state.perm = UINT64_MAX;
> -    bs_entry->state.shared_perm = 0;
> -
>      /*
>       * If keep_old_opts is false then it means that unspecified
>       * options must be reset to their original value. We don't allow
> @@ -4186,40 +4185,37 @@ BlockReopenQueue *bdrv_reopen_queue(BlockReopenQueue *bs_queue,
>   */
>  int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
>  {
> -    int ret = -1;
> +    int ret = 0;

I would prefer to leave this right before the 'goto cleanup'.

Not sure if I fully understand all consequences yet, but overall, apart
from my concerns about file-posix and the potential AioContext locking
problems, this looks like a nice simplification of the process.

Come to think of it, the AioContext handling is probably wrong already
before your series. reopen_commit for one node could move the whole tree
to a different context and then the later nodes would all be processed
while holding the wrong lock.

Kevin


