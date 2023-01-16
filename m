Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE0B66C967
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 17:49:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHSfh-0006XT-N7; Mon, 16 Jan 2023 11:49:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pHSfZ-0006WX-Ha
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 11:49:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pHSfP-0005Eo-TP
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 11:49:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673887743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3nluXjUy3JXBq5Lmw3ToFRLAgSeVAotU6UqMkl36IP4=;
 b=D57raGwJiH2aNWm9QAGseh0tA4armrkF18tYJ1L/azjrPkxJ4ryZor1wHvuiuLq+hd6Kv9
 itC+mHMlCBPJ/Hthg8AvdqKZLM/tIeke54u0l/2PEF0TNrhdK7iqrkDc2J9Z/kVPGbw7Rc
 QtipsavJSops2386JWM/1Gmhuy5Ofkg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-8XZRCDzwOnivKPcISi4NmQ-1; Mon, 16 Jan 2023 11:49:01 -0500
X-MC-Unique: 8XZRCDzwOnivKPcISi4NmQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C253802D36;
 Mon, 16 Jan 2023 16:49:01 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FF092026D4B;
 Mon, 16 Jan 2023 16:49:00 +0000 (UTC)
Date: Mon, 16 Jan 2023 17:48:59 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, eesposit@redhat.com
Subject: Re: [PATCH 10/15] block-backend: always wait for drain before
 starting operation
Message-ID: <Y8V/+zAmvRH/CyXA@redhat.com>
References: <20221212125920.248567-1-pbonzini@redhat.com>
 <20221212125920.248567-11-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221212125920.248567-11-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 12.12.2022 um 13:59 hat Paolo Bonzini geschrieben:
> All I/O operations call blk_wait_while_drained() immediately after
> blk_inc_in_flight(), except for blk_abort_aio_request() where it
> does not hurt to add such a call.  Merge the two functions into one,
> and add a note about a disturbing lack of thread-safety that will
> be fixed shortly.
> 
> While at it, make the quiesce_counter check a loop.  While the check
> does not have to be "perfect", i.e. it only matters that an endless
> stream of I/Os is stopped sooner or later, it is more logical to check
> the counter repeatedly until it is zero.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/block-backend.c | 27 ++++++++-------------------
>  1 file changed, 8 insertions(+), 19 deletions(-)
> 
> diff --git a/block/block-backend.c b/block/block-backend.c
> index fe42d53d655d..627d491d4155 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -1270,18 +1270,6 @@ static int blk_check_byte_request(BlockBackend *blk, int64_t offset,
>      return 0;
>  }
>  
> -/* To be called between exactly one pair of blk_inc/dec_in_flight() */
> -static void coroutine_fn blk_wait_while_drained(BlockBackend *blk)
> -{
> -    assert(blk->in_flight > 0);
> -
> -    if (blk->quiesce_counter && !blk->disable_request_queuing) {
> -        blk_dec_in_flight(blk);
> -        qemu_co_queue_wait(&blk->queued_requests, NULL);
> -        blk_inc_in_flight(blk);
> -    }
> -}
> -
>  /* To be called between exactly one pair of blk_inc/dec_in_flight() */
>  static int coroutine_fn
>  blk_co_do_preadv_part(BlockBackend *blk, int64_t offset, int64_t bytes,
> @@ -1334,7 +1322,6 @@ int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
>      IO_OR_GS_CODE();
>  
>      blk_inc_in_flight(blk);
> -    blk_wait_while_drained(blk);
>      ret = blk_co_do_preadv_part(blk, offset, bytes, qiov, 0, flags);
>      blk_dec_in_flight(blk);
>  
> @@ -1349,7 +1336,6 @@ int coroutine_fn blk_co_preadv_part(BlockBackend *blk, int64_t offset,
>      IO_OR_GS_CODE();
>  
>      blk_inc_in_flight(blk);
> -    blk_wait_while_drained(blk);
>      ret = blk_co_do_preadv_part(blk, offset, bytes, qiov, qiov_offset, flags);
>      blk_dec_in_flight(blk);
>  
> @@ -1401,7 +1387,6 @@ int coroutine_fn blk_co_pwritev_part(BlockBackend *blk, int64_t offset,
>      IO_OR_GS_CODE();
>  
>      blk_inc_in_flight(blk);
> -    blk_wait_while_drained(blk);
>      ret = blk_co_do_pwritev_part(blk, offset, bytes, qiov, qiov_offset, flags);
>      blk_dec_in_flight(blk);
>  
> @@ -1466,6 +1451,14 @@ void blk_inc_in_flight(BlockBackend *blk)
>  {
>      IO_CODE();
>      qatomic_inc(&blk->in_flight);
> +    if (!blk->disable_request_queuing) {
> +        /* TODO: this is not thread-safe! */
> +        while (blk->quiesce_counter) {
> +            qatomic_dec(&blk->in_flight);
> +            qemu_co_queue_wait(&blk->queued_requests, NULL);

blk_inc_in_flight() must be a coroutine_fn now.

blk_abort_aio_request() and blk_aio_prwv() aren't, but still call it.

> +            qatomic_inc(&blk->in_flight);
> +        }
> +    }
>  }

Kevin


