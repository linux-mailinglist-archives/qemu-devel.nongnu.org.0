Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1032474608
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 16:08:10 +0100 (CET)
Received: from localhost ([::1]:58970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx9PV-00022a-K7
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 10:08:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mx9Ha-0007OA-VI
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 09:59:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mx9HZ-00015k-0N
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 09:59:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639493995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rOoT+y37XhAMWSTS76ol8Ujc8USecQx3HLnDfWnxJRs=;
 b=GvPIixrO3IzuXLZ2oHmBtVXKZnZL6SEbc8y46xayhxnxuWqsBQ39mSM0djI4peQDSiE2MZ
 Kqfb5A3ZvMOOa/wLYa5almYUxcM1NqJIEyeWHyifpFe26GBSJhb/6TqGmOIv7YSOWP53Nx
 ocHtCijBhH4B3uuIS4pzFtD4FgWBQTs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-575-QbGaoid_PYGD6RET05h-xg-1; Tue, 14 Dec 2021 09:59:54 -0500
X-MC-Unique: QbGaoid_PYGD6RET05h-xg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FADF2F47;
 Tue, 14 Dec 2021 14:59:53 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 96B5C5ED4F;
 Tue, 14 Dec 2021 14:59:51 +0000 (UTC)
Date: Tue, 14 Dec 2021 15:59:49 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v2] block-backend: prevent dangling BDS pointers across
 aio_poll()
Message-ID: <YbixZeHqqImnPbwL@redhat.com>
References: <20211214143542.14758-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211214143542.14758-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 14.12.2021 um 15:35 hat Stefan Hajnoczi geschrieben:
> The BlockBackend root child can change when aio_poll() is invoked. This
> happens when a temporary filter node is removed upon blockjob
> completion, for example.
> 
> Functions in block/block-backend.c must be aware of this when using a
> blk_bs() pointer across aio_poll() because the BlockDriverState refcnt
> may reach 0, resulting in a stale pointer.
> 
> One example is scsi_device_purge_requests(), which calls blk_drain() to
> wait for in-flight requests to cancel. If the backup blockjob is active,
> then the BlockBackend root child is a temporary filter BDS owned by the
> blockjob. The blockjob can complete during bdrv_drained_begin() and the
> last reference to the BDS is released when the temporary filter node is
> removed. This results in a use-after-free when blk_drain() calls
> bdrv_drained_end(bs) on the dangling pointer.
> 
> Explicitly hold a reference to bs across block APIs that invoke
> aio_poll().
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
> v2:
> - Audit block/block-backend.c and fix additional cases
> ---
>  block/block-backend.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/block/block-backend.c b/block/block-backend.c
> index 12ef80ea17..a40ad7fa92 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -828,10 +828,12 @@ void blk_remove_bs(BlockBackend *blk)
>      notifier_list_notify(&blk->remove_bs_notifiers, blk);
>      if (tgm->throttle_state) {
>          bs = blk_bs(blk);
> +        bdrv_ref(bs);
>          bdrv_drained_begin(bs);
>          throttle_group_detach_aio_context(tgm);
>          throttle_group_attach_aio_context(tgm, qemu_get_aio_context());
>          bdrv_drained_end(bs);
> +        bdrv_unref(bs);
>      }
>  
>      blk_update_root_state(blk);

This hunk is unnecessary, we still hold a reference that is only given
up a few lines down with bdrv_root_unref_child(root).

The rest looks good to me, so without this hunk:

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


