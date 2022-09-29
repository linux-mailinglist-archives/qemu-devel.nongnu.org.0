Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B32A45EFB7F
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 19:05:10 +0200 (CEST)
Received: from localhost ([::1]:51144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odwyD-0000gk-Od
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 13:05:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1odutv-0002yt-Gv
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 10:52:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oduts-0000g5-6I
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 10:52:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664463151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5egM5/ZJH5WdM8LwyFd+ZRh/3oHJUwl1OF2RczCSjVg=;
 b=V3G2Ps3PVWWC7O86oL3d9pvhYqVAM6r6RWhxcQPzLiQ8lcR5Nti6rNSlNGdC9NvJZY1HfY
 ra7DaywYiqkfSJC9mvlL8gwbgitdc2fEtd9xpyzQJjKo98v/hotumRiPu1JbUaIBYrWej1
 NMngRtWUnlRwJ/IMjbW2ZYflwenn/ds=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-256-VYCSzPAPO_iA4qgJ9BQ82w-1; Thu, 29 Sep 2022 10:52:26 -0400
X-MC-Unique: VYCSzPAPO_iA4qgJ9BQ82w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D944101E14D;
 Thu, 29 Sep 2022 14:52:25 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 07D35207B34A;
 Thu, 29 Sep 2022 14:52:23 +0000 (UTC)
Date: Thu, 29 Sep 2022 16:52:22 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] linux-aio: use LinuxAioState from the running thread
Message-ID: <YzWxJo0vDiupS0fO@redhat.com>
References: <20220609134452.1146309-1-eesposit@redhat.com>
 <20220609134452.1146309-2-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220609134452.1146309-2-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.06.2022 um 15:44 hat Emanuele Giuseppe Esposito geschrieben:
> From: Paolo Bonzini <pbonzini@redhat.com>
> 
> Remove usage of aio_context_acquire by always submitting asynchronous
> AIO to the current thread's LinuxAioState.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  block/file-posix.c  |  3 ++-
>  block/linux-aio.c   | 13 ++++++-------
>  include/block/aio.h |  4 ----
>  3 files changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 48cd096624..33f92f004a 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -2086,7 +2086,8 @@ static int coroutine_fn raw_co_prw(BlockDriverState *bs, uint64_t offset,
>  #endif
>  #ifdef CONFIG_LINUX_AIO
>      } else if (s->use_linux_aio) {
> -        LinuxAioState *aio = aio_get_linux_aio(bdrv_get_aio_context(bs));
> +        AioContext *ctx = qemu_get_current_aio_context();
> +        LinuxAioState *aio = aio_get_linux_aio(ctx);
>          assert(qiov->size == bytes);
>          return laio_co_submit(bs, aio, s->fd, offset, qiov, type,
>                                s->aio_max_batch);

raw_aio_plug() and raw_aio_unplug() need the same change.

I wonder if we should actually better remove the 'aio' parameter from
the functions that linux-aio.c offers to avoid suggesting that any
LinuxAioState works for any thread. Getting it from the current
AioContext is something it can do by itself. But this would be code
cleanup for a separate patch.

> diff --git a/block/linux-aio.c b/block/linux-aio.c
> index 4c423fcccf..1d3cc767d1 100644
> --- a/block/linux-aio.c
> +++ b/block/linux-aio.c
> @@ -16,6 +16,9 @@
>  #include "qemu/coroutine.h"
>  #include "qapi/error.h"
>  
> +/* Only used for assertions.  */
> +#include "qemu/coroutine_int.h"
> +
>  #include <libaio.h>
>  
>  /*
> @@ -56,10 +59,8 @@ struct LinuxAioState {
>      io_context_t ctx;
>      EventNotifier e;
>  
> -    /* io queue for submit at batch.  Protected by AioContext lock. */
> +    /* All data is only used in one I/O thread.  */
>      LaioQueue io_q;
> -
> -    /* I/O completion processing.  Only runs in I/O thread.  */
>      QEMUBH *completion_bh;
>      int event_idx;
>      int event_max;
> @@ -102,9 +103,8 @@ static void qemu_laio_process_completion(struct qemu_laiocb *laiocb)
>       * later.  Coroutines cannot be entered recursively so avoid doing
>       * that!
>       */
> -    if (!qemu_coroutine_entered(laiocb->co)) {
> -        aio_co_wake(laiocb->co);
> -    }
> +    assert(laiocb->co->ctx == laiocb->ctx->aio_context);
> +    qemu_coroutine_enter_if_inactive(laiocb->co);
>  }
>  
>  /**
> @@ -238,7 +238,6 @@ static void qemu_laio_process_completions_and_submit(LinuxAioState *s)
>      if (!s->io_q.plugged && !QSIMPLEQ_EMPTY(&s->io_q.pending)) {
>          ioq_submit(s);
>      }
> -    aio_context_release(s->aio_context);
>  }

I certainly expected the aio_context_acquire() in the same function to
go away, too! Am I missing something?

Kevin


