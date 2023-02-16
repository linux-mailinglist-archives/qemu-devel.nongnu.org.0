Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4776998DE
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 16:29:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSgAx-0007Yq-Qg; Thu, 16 Feb 2023 10:27:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pSgAr-0007XI-Sa
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 10:27:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pSgAn-0005gE-LJ
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 10:27:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676561267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=glhCSpMsb2Gh3pS2tGWlh61TVwYNIjUugwY83lH5sQw=;
 b=agMHev1L0vzIWdxCvxv24Ppdx0/Phvf6ym2bi+v9HdsbMPH/PYiE9scWTUTOIf5Tgiwg0V
 4cxxehugdfifhH6EufOq42T6qJe155DWbvaNy1XSbx/BRRpDIWCpc6M1D8kMiGS9uYHf8t
 lC+lUO7U/SrDwxws6vFVgzx+qxq4vtM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-1cXL0_igOiG7cL-MUO-qeg-1; Thu, 16 Feb 2023 10:27:45 -0500
X-MC-Unique: 1cXL0_igOiG7cL-MUO-qeg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F2F1802314;
 Thu, 16 Feb 2023 15:27:45 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2699B492B15;
 Thu, 16 Feb 2023 15:27:44 +0000 (UTC)
Date: Thu, 16 Feb 2023 16:27:42 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH v2 2/3] dma-helpers: prevent dma_blk_cb() vs
 dma_aio_cancel() race
Message-ID: <Y+5LblriH/1jmHcB@redhat.com>
References: <20230210143238.524357-1-stefanha@redhat.com>
 <20230210143238.524357-3-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230210143238.524357-3-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

Am 10.02.2023 um 15:32 hat Stefan Hajnoczi geschrieben:
> dma_blk_cb() only takes the AioContext lock around ->io_func(). That
> means the rest of dma_blk_cb() is not protected. In particular, the
> DMAAIOCB field accesses happen outside the lock.
> 
> There is a race when the main loop thread holds the AioContext lock and
> invokes scsi_device_purge_requests() -> bdrv_aio_cancel() ->
> dma_aio_cancel() while an IOThread executes dma_blk_cb(). The dbs->acb
> field determines how cancellation proceeds. If dma_aio_cancel() see
> dbs->acb == NULL while dma_blk_cb() is still running, the request can be
> completed twice (-ECANCELED and the actual return value).
> 
> The following assertion can occur with virtio-scsi when an IOThread is
> used:
> 
>   ../hw/scsi/scsi-disk.c:368: scsi_dma_complete: Assertion `r->req.aiocb != NULL' failed.
> 
> Fix the race by holding the AioContext across dma_blk_cb(). Now
> dma_aio_cancel() under the AioContext lock will not see
> inconsistent/intermediate states.
> 
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Two things that seem to need attention in the review:

> diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
> index 7820fec54c..2463964805 100644
> --- a/softmmu/dma-helpers.c
> +++ b/softmmu/dma-helpers.c
> @@ -113,17 +113,19 @@ static void dma_complete(DMAAIOCB *dbs, int ret)
>  static void dma_blk_cb(void *opaque, int ret)
>  {
>      DMAAIOCB *dbs = (DMAAIOCB *)opaque;
> +    AioContext *ctx = dbs->ctx;
>      dma_addr_t cur_addr, cur_len;
>      void *mem;
>  
>      trace_dma_blk_cb(dbs, ret);
>  
> +    aio_context_acquire(ctx);

During the first iteration, the caller may already hold the AioContext
lock. In the case of scsi-disk, it does. Locking a second time is fine
in principle because it's a recursive lock, but we have to be careful
not to call AIO_WAIT_WHILE() indirectly then because it could deadlock.

Except for the dbs->common.cb (see below) I don't see any functions that
would be problematic in this respect. In fact, the one I would be most
worried about is dbs->io_func, but it was already locked before.

>      dbs->acb = NULL;
>      dbs->offset += dbs->iov.size;
>  
>      if (dbs->sg_cur_index == dbs->sg->nsg || ret < 0) {
>          dma_complete(dbs, ret);

All request callbacks hold the AioContext lock now when they didn't
before. I wonder if it's worth documenting the locking rules for
dma_blk_io() in a comment. Could be a separate patch, though.

You remove the locking in scsi_dma_complete() to compensate. All the
other callers come from IDE and nvme, which don't take the lock
internally. Taking the main AioContext lock once is fine, so this looks
good.

If it is possible that we already complete on the first iteration, this
could however also be affected by the case above so that the AioContext
is locked twice. In this case, the invoked callback must not call
AIO_WAIT_WHILE() and we would need to audit IDE and nvme.

Is it possible? In other words, can dbs->sg->nsg be 0? If not, can we
assert and document it?

> -        return;
> +        goto out;
>      }
>      dma_blk_unmap(dbs);
>  
> @@ -164,9 +166,9 @@ static void dma_blk_cb(void *opaque, int ret)
>  
>      if (dbs->iov.size == 0) {
>          trace_dma_map_wait(dbs);
> -        dbs->bh = aio_bh_new(dbs->ctx, reschedule_dma, dbs);
> +        dbs->bh = aio_bh_new(ctx, reschedule_dma, dbs);

Does copying dbs->ctx to a local variable imply that it may change
during the function? I didn't think so, but if it may, then why is
calling aio_bh_new() with the old value right?

>          cpu_register_map_client(dbs->bh);
> -        return;
> +        goto out;
>      }
>  
>      if (!QEMU_IS_ALIGNED(dbs->iov.size, dbs->align)) {
> @@ -174,11 +176,11 @@ static void dma_blk_cb(void *opaque, int ret)
>                                  QEMU_ALIGN_DOWN(dbs->iov.size, dbs->align));
>      }
>  
> -    aio_context_acquire(dbs->ctx);
>      dbs->acb = dbs->io_func(dbs->offset, &dbs->iov,
>                              dma_blk_cb, dbs, dbs->io_func_opaque);
> -    aio_context_release(dbs->ctx);
>      assert(dbs->acb);
> +out:
> +    aio_context_release(ctx);
>  }

Kevin


