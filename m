Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C296369018
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 12:12:14 +0200 (CEST)
Received: from localhost ([::1]:49798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZsnF-0006gF-8W
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 06:12:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lZslU-0005k9-C4; Fri, 23 Apr 2021 06:10:25 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:49920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lZslG-0007y8-C8; Fri, 23 Apr 2021 06:10:20 -0400
Received: from iva8-d077482f1536.qloud-c.yandex.net
 (iva8-d077482f1536.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2f26:0:640:d077:482f])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 748982E1ACA;
 Fri, 23 Apr 2021 13:10:03 +0300 (MSK)
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net [2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by iva8-d077482f1536.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 4xWuigzzGg-A21SqjWS; Fri, 23 Apr 2021 13:10:03 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1619172603; bh=1PGiocvptTmNUqDgyqU5wovxG7+xUkTGUXrbrpBZsKw=;
 h=In-Reply-To:Message-ID:Subject:To:From:Cc:References:Date;
 b=vAgWBX75a7N3FNfv0Dz1jqTtNQgqxAfekmRc0VhZ8/0I3BI5FC5d1DNCSYzsrU9GW
 /HhZxnq/4jUL+3sHkLcrfXh29AZud5pUyyGeYBtkejNyaSzE1bAHMvvswmiONGDvwO
 oHjczOOJs0V5cYomJjTBJmIvEXtjr6CFMj8vF9q0=
Authentication-Results: iva8-d077482f1536.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:219::1:22])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 T1QzYg5AXz-A2pq8b2A; Fri, 23 Apr 2021 13:10:02 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Fri, 23 Apr 2021 13:09:58 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 06/33] util/async: aio_co_schedule(): support
 reschedule in same ctx
Message-ID: <YIKc9pCDmN2FRDV4@rvkaganb>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-7-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210416080911.83197-7-vsementsov@virtuozzo.com>
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=rvkagan@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 16, 2021 at 11:08:44AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> With the following patch we want to call wake coroutine from thread.
> And it doesn't work with aio_co_wake:
> Assume we have no iothreads.
> Assume we have a coroutine A, which waits in the yield point for
> external aio_co_wake(), and no progress can be done until it happen.
> Main thread is in blocking aio_poll() (for example, in blk_read()).
> 
> Now, in a separate thread we do aio_co_wake(). It calls  aio_co_enter(),
> which goes through last "else" branch and do aio_context_acquire(ctx).
> 
> Now we have a deadlock, as aio_poll() will not release the context lock
> until some progress is done, and progress can't be done until
> aio_co_wake() wake the coroutine A. And it can't because it wait for
> aio_context_acquire().
> 
> Still, aio_co_schedule() works well in parallel with blocking
> aio_poll(). So we want use it. Let's add a possibility of rescheduling
> coroutine in same ctx where it was yield'ed.
> 
> Fetch co->ctx in same way as it is done in aio_co_wake().
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  include/block/aio.h | 2 +-
>  util/async.c        | 8 ++++++++
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/include/block/aio.h b/include/block/aio.h
> index 5f342267d5..744b695525 100644
> --- a/include/block/aio.h
> +++ b/include/block/aio.h
> @@ -643,7 +643,7 @@ static inline bool aio_node_check(AioContext *ctx, bool is_external)
>  
>  /**
>   * aio_co_schedule:
> - * @ctx: the aio context
> + * @ctx: the aio context, if NULL, the current ctx of @co will be used.
>   * @co: the coroutine
>   *
>   * Start a coroutine on a remote AioContext.
> diff --git a/util/async.c b/util/async.c
> index 674dbefb7c..750be555c6 100644
> --- a/util/async.c
> +++ b/util/async.c
> @@ -545,6 +545,14 @@ fail:
>  
>  void aio_co_schedule(AioContext *ctx, Coroutine *co)
>  {
> +    if (!ctx) {
> +        /*
> +         * Read coroutine before co->ctx.  Matches smp_wmb in
> +         * qemu_coroutine_enter.
> +         */
> +        smp_read_barrier_depends();
> +        ctx = qatomic_read(&co->ctx);
> +    }

I'd rather not extend this interface, but add a new one on top.  And
document how it's different from aio_co_wake().

Roman.

>      trace_aio_co_schedule(ctx, co);
>      const char *scheduled = qatomic_cmpxchg(&co->scheduled, NULL,
>                                             __func__);
> -- 
> 2.29.2
> 

