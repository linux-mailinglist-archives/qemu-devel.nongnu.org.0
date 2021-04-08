Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B038358903
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 17:57:07 +0200 (CEST)
Received: from localhost ([::1]:60766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUX1l-0000ch-Tv
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 11:57:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lUWzl-0008NF-EZ; Thu, 08 Apr 2021 11:55:01 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:34110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lUWzR-0003fC-PW; Thu, 08 Apr 2021 11:54:58 -0400
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 81B402E15A4;
 Thu,  8 Apr 2021 18:54:35 +0300 (MSK)
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net [2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by myt5-23f0be3aa648.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 oSfVRtPUx1-sY00F1Dq; Thu, 08 Apr 2021 18:54:35 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1617897275; bh=YyzuRPOgKn/gDl9ITtUgGDtc6Ai/nVSMH1wg7ximVwY=;
 h=In-Reply-To:Message-ID:Subject:To:From:Cc:References:Date;
 b=xU5sB0zKOcwNRzUrLawo9nAaoY4tw60xGopPzzwCQJNew6+GZ6eymZzLmE2u9wz/b
 z9PylhY1w2QKt23DJhl1XpNXw3DzbPYyUMXjyA3kLbpig5U1dvwjupOTNAKSsc0JG8
 txFBuyMfw0lnvzkRUW/+kmGD+UnTWTVwNQ9baApQ=
Authentication-Results: myt5-23f0be3aa648.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-red3.dhcp.yndx.net (dynamic-red3.dhcp.yndx.net
 [2a02:6b8:0:419:7359:4dc3:71d:4c5a])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 ahvKzJzZZp-sYouNKF5; Thu, 08 Apr 2021 18:54:34 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Thu, 8 Apr 2021 18:54:30 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 03/10] util/async: aio_co_enter(): do aio_co_schedule
 in general case
Message-ID: <YG8nNsQE+AQQj8gZ@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, fam@euphon.net,
 stefanha@redhat.com, mreitz@redhat.com, kwolf@redhat.com,
 eblake@redhat.com
References: <20210408140827.332915-1-vsementsov@virtuozzo.com>
 <20210408140827.332915-4-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408140827.332915-4-vsementsov@virtuozzo.com>
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=rvkagan@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 08, 2021 at 05:08:20PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> With the following patch we want to call aio_co_wake() from thread.
> And it works bad.
> Assume we have no iothreads.
> Assume we have a coroutine A, which waits in the yield point for external
> aio_co_wake(), and no progress can be done until it happen.
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
> aio_poll(). So let's use it in generic case and drop
> aio_context_acquire/aio_context_release branch from aio_co_enter().
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  util/async.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/util/async.c b/util/async.c
> index 674dbefb7c..f05b883a39 100644
> --- a/util/async.c
> +++ b/util/async.c
> @@ -614,19 +614,12 @@ void aio_co_wake(struct Coroutine *co)
>  
>  void aio_co_enter(AioContext *ctx, struct Coroutine *co)
>  {
> -    if (ctx != qemu_get_current_aio_context()) {
> -        aio_co_schedule(ctx, co);
> -        return;
> -    }
> -
> -    if (qemu_in_coroutine()) {
> +    if (ctx == qemu_get_current_aio_context() && qemu_in_coroutine()) {
>          Coroutine *self = qemu_coroutine_self();
>          assert(self != co);
>          QSIMPLEQ_INSERT_TAIL(&self->co_queue_wakeup, co, co_queue_next);
>      } else {
> -        aio_context_acquire(ctx);
> -        qemu_aio_coroutine_enter(ctx, co);
> -        aio_context_release(ctx);
> +        aio_co_schedule(ctx, co);
>      }
>  }

I'm fine with the change, but I find the log message to be a bit
confusing (although correct).  AFAICS the problem is that calling
aio_co_enter from a thread which has no associated aio_context works
differently compared to calling it from a proper iothread: if the target
context was qemu_aio_context, an iothread would just schedule the
coroutine there, while a "dumb" thread would try lock the context
potentially resulting in a deadlock.  This patch makes "dumb" threads
and iothreads behave identically when entering a coroutine on a foreign
context.

You may want to rephrase the log message to that end.

Anyway

Reviewed-by: Roman Kagan <rvkagan@yandex-team.ru>

