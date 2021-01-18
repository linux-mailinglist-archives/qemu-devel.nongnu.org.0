Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 736612FA2B8
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 15:19:54 +0100 (CET)
Received: from localhost ([::1]:50758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1VNp-0008Dl-23
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 09:19:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l1VMW-0007mD-1h
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 09:18:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l1VMT-00084w-4R
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 09:18:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610979506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ohbPKIRGpZmtdD4Y/d3s7MNOjiVVN03aBC04xwKSra8=;
 b=C3KaYopDnfQGFgushU6npWNDA0MZx2eNtxRxTzlr7oTdK0HA8HiR72Qh1iK8QhaDnkRSnS
 uqDETc0FhkZsI3F2HWmGtZ0RF2ApQsmUFk4tY71yInDVg+Bxws96lGP7in40Jx1WcSfpZu
 xx2tdUfUptkP5eBE8gbquDbYSBxYIfc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-1OtfKgYnPauYPxQqF8b9_Q-1; Mon, 18 Jan 2021 09:18:25 -0500
X-MC-Unique: 1OtfKgYnPauYPxQqF8b9_Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9FF81005513;
 Mon, 18 Jan 2021 14:18:23 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-75.ams2.redhat.com [10.36.115.75])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 470DB5D9CD;
 Mon, 18 Jan 2021 14:18:22 +0000 (UTC)
Date: Mon, 18 Jan 2021 15:18:20 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 03/36] block: bdrv_append(): don't consume reference
Message-ID: <20210118141820.GD11555@merkur.fritz.box>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-4-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201127144522.29991-4-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
> We have too much comments for this feature. It seems better just don't
> do it. Most of real users (tests don't count) have to create additional
> reference.
> 
> Drop also comment in external_snapshot_prepare:
>  - bdrv_append doesn't "remove" old bs in common sense, it sounds
>    strange
>  - the fact that bdrv_append can fail is obvious from the context
>  - the fact that we must rollback all changes in transaction abort is
>    known (it's the direct role of abort)
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block.c                     | 19 +++----------------
>  block/backup-top.c          |  1 -
>  block/commit.c              |  1 +
>  block/mirror.c              |  3 ---
>  blockdev.c                  |  4 ----
>  tests/test-bdrv-drain.c     |  2 +-
>  tests/test-bdrv-graph-mod.c |  2 ++
>  7 files changed, 7 insertions(+), 25 deletions(-)
> 
> diff --git a/block.c b/block.c
> index 0dd28f0902..55efef3c9d 100644
> --- a/block.c
> +++ b/block.c
> @@ -3145,11 +3145,6 @@ static BlockDriverState *bdrv_append_temp_snapshot(BlockDriverState *bs,
>          goto out;
>      }
>  
> -    /* bdrv_append() consumes a strong reference to bs_snapshot
> -     * (i.e. it will call bdrv_unref() on it) even on error, so in
> -     * order to be able to return one, we have to increase
> -     * bs_snapshot's refcount here */
> -    bdrv_ref(bs_snapshot);
>      bdrv_append(bs_snapshot, bs, &local_err);
>      if (local_err) {
>          error_propagate(errp, local_err);
> @@ -4608,10 +4603,8 @@ void bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
>   *
>   * This function does not create any image files.
>   *
> - * bdrv_append() takes ownership of a bs_new reference and unrefs it because
> - * that's what the callers commonly need. bs_new will be referenced by the old
> - * parents of bs_top after bdrv_append() returns. If the caller needs to keep a
> - * reference of its own, it must call bdrv_ref().
> + * Recent update: bdrv_append does NOT eat bs_new reference for now. Drop this
> + * comment several moths later.

A comment like this is unusual. Do you think there is a high risk of
somebody introducing a new bdrv_append() in parallel and that they would
read this comment when rebasing their existing patches?

If we do keep the comment: s/for now/now/ (it has recently changed,
we're not intending to change it later) and s/moths/months/.

>   */
>  void bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
>                   Error **errp)
> @@ -4621,20 +4614,14 @@ void bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
>      bdrv_set_backing_hd(bs_new, bs_top, &local_err);
>      if (local_err) {
>          error_propagate(errp, local_err);
> -        goto out;
> +        return;
>      }
>  
>      bdrv_replace_node(bs_top, bs_new, &local_err);
>      if (local_err) {
>          error_propagate(errp, local_err);
>          bdrv_set_backing_hd(bs_new, NULL, &error_abort);
> -        goto out;

Can we leave a return here just in case that new code will be added at
the end of the function?

>      }
> -
> -    /* bs_new is now referenced by its new parents, we don't need the
> -     * additional reference any more. */
> -out:
> -    bdrv_unref(bs_new);
>  }
>  
>  static void bdrv_delete(BlockDriverState *bs)
> diff --git a/block/backup-top.c b/block/backup-top.c
> index fe6883cc97..650ed6195c 100644
> --- a/block/backup-top.c
> +++ b/block/backup-top.c
> @@ -222,7 +222,6 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
>  
>      bdrv_drained_begin(source);
>  
> -    bdrv_ref(top);
>      bdrv_append(top, source, &local_err);
>      if (local_err) {
>          error_prepend(&local_err, "Cannot append backup-top filter: ");
> diff --git a/block/commit.c b/block/commit.c
> index 71db7ba747..61924bcf66 100644
> --- a/block/commit.c
> +++ b/block/commit.c
> @@ -313,6 +313,7 @@ void commit_start(const char *job_id, BlockDriverState *bs,
>      commit_top_bs->total_sectors = top->total_sectors;
>  
>      bdrv_append(commit_top_bs, top, &local_err);
> +    bdrv_unref(commit_top_bs); /* referenced by new parents or failed */
>      if (local_err) {
>          commit_top_bs = NULL;
>          error_propagate(errp, local_err);
> diff --git a/block/mirror.c b/block/mirror.c
> index 8e1ad6eceb..13f7ecc998 100644
> --- a/block/mirror.c
> +++ b/block/mirror.c
> @@ -1605,9 +1605,6 @@ static BlockJob *mirror_start_job(
>      bs_opaque = g_new0(MirrorBDSOpaque, 1);
>      mirror_top_bs->opaque = bs_opaque;
>  
> -    /* bdrv_append takes ownership of the mirror_top_bs reference, need to keep
> -     * it alive until block_job_create() succeeds even if bs has no parent. */
> -    bdrv_ref(mirror_top_bs);
>      bdrv_drained_begin(bs);
>      bdrv_append(mirror_top_bs, bs, &local_err);
>      bdrv_drained_end(bs);
> diff --git a/blockdev.c b/blockdev.c
> index b5f11c524b..96c96f8ba6 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -1587,10 +1587,6 @@ static void external_snapshot_prepare(BlkActionState *common,
>          goto out;
>      }
>  
> -    /* This removes our old bs and adds the new bs. This is an operation that
> -     * can fail, so we need to do it in .prepare; undoing it for abort is
> -     * always possible. */

This comment is still relevant, it's unrelated to the bdrv_ref().

> -    bdrv_ref(state->new_bs);
>      bdrv_append(state->new_bs, state->old_bs, &local_err);
>      if (local_err) {
>          error_propagate(errp, local_err);

Kevin


