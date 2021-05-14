Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AA4380EF4
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 19:29:54 +0200 (CEST)
Received: from localhost ([::1]:43342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhbdJ-0007gk-D0
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 13:29:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lhbb5-0005O7-Gk; Fri, 14 May 2021 13:27:35 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:32940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lhbb1-0005t3-3F; Fri, 14 May 2021 13:27:33 -0400
Received: from iva8-d077482f1536.qloud-c.yandex.net
 (iva8-d077482f1536.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2f26:0:640:d077:482f])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id CEA592E1F23;
 Fri, 14 May 2021 20:27:23 +0300 (MSK)
Received: from iva8-5ba4ca89b0c6.qloud-c.yandex.net
 (iva8-5ba4ca89b0c6.qloud-c.yandex.net [2a02:6b8:c0c:a8ae:0:640:5ba4:ca89])
 by iva8-d077482f1536.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 xsHXR7n30Q-RL1i4qmv; Fri, 14 May 2021 20:27:23 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1621013243; bh=AgZYSJJrqU75Tce2wPi4nZwa1QNanuCAZinCmKqLPRE=;
 h=In-Reply-To:Message-ID:Subject:To:From:Cc:References:Date;
 b=pthciST6UTg1BvwA/GqNcru4p4GPmoWaOrHEfwFKeryax2MhiKdWUsEokJo8DB8yj
 P0gFIIXz1+rHwxoRy/HSwSXJZ4LkmydVyMw6+2pEs2m98/qZCsRGu0tIhqSq2bVu7M
 u/7fXTR8+PwCMWDsIT/KNW24m9/+vimjwNN2ghb8=
Authentication-Results: iva8-d077482f1536.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-iva.dhcp.yndx.net (dynamic-iva.dhcp.yndx.net
 [2a02:6b8:b080:9120::1:9])
 by iva8-5ba4ca89b0c6.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 QAFXlolpeB-RLo0lSKt; Fri, 14 May 2021 20:27:21 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Fri, 14 May 2021 20:27:18 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 06/33] util/async: aio_co_schedule(): support
 reschedule in same ctx
Message-ID: <YJ6y9qeQ4RMs7sXN@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-7-vsementsov@virtuozzo.com>
 <32f2b6f0-2c31-942d-cbe2-81eda2a43fc0@redhat.com>
 <19ff6e67-e548-14df-ac7e-8b0a3bf7a798@virtuozzo.com>
 <ef518e01-4f08-5fe7-b226-e70ab3102ca4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ef518e01-4f08-5fe7-b226-e70ab3102ca4@redhat.com>
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
Cc: kwolf@redhat.com, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 13, 2021 at 11:04:37PM +0200, Paolo Bonzini wrote:
> On 12/05/21 09:15, Vladimir Sementsov-Ogievskiy wrote:
> > > > 
> > > 
> > > I don't understand.  Why doesn't aio_co_enter go through the ctx !=
> > > qemu_get_current_aio_context() branch and just do aio_co_schedule?
> > > That was at least the idea behind aio_co_wake and aio_co_enter.
> > > 
> > 
> > Because ctx is exactly qemu_get_current_aio_context(), as we are not in
> > iothread but in nbd connection thread. So,
> > qemu_get_current_aio_context() returns qemu_aio_context.
> 
> So the problem is that threads other than the main thread and
> the I/O thread should not return qemu_aio_context.  The vCPU thread
> may need to return it when running with BQL taken, though.

I'm not sure this is the only case.

AFAICS your patch has basically the same effect as Vladimir's
patch "util/async: aio_co_enter(): do aio_co_schedule in general case"
(https://lore.kernel.org/qemu-devel/20210408140827.332915-4-vsementsov@virtuozzo.com/).
That one was found to break e.g. aio=threads cases.  I guessed it
implicitly relied upon aio_co_enter() acquiring the aio_context but we
didn't dig further to pinpoint the exact scenario.

Roman.

> Something like this (untested):
> 
> diff --git a/include/block/aio.h b/include/block/aio.h
> index 5f342267d5..10fcae1515 100644
> --- a/include/block/aio.h
> +++ b/include/block/aio.h
> @@ -691,10 +691,13 @@ void aio_co_enter(AioContext *ctx, struct Coroutine *co);
>   * Return the AioContext whose event loop runs in the current thread.
>   *
>   * If called from an IOThread this will be the IOThread's AioContext.  If
> - * called from another thread it will be the main loop AioContext.
> + * called from the main thread or with the "big QEMU lock" taken it
> + * will be the main loop AioContext.
>   */
>  AioContext *qemu_get_current_aio_context(void);
> +void qemu_set_current_aio_context(AioContext *ctx);
> +
>  /**
>   * aio_context_setup:
>   * @ctx: the aio context
> diff --git a/iothread.c b/iothread.c
> index 7f086387be..22b967e77c 100644
> --- a/iothread.c
> +++ b/iothread.c
> @@ -39,11 +39,23 @@ DECLARE_CLASS_CHECKERS(IOThreadClass, IOTHREAD,
>  #define IOTHREAD_POLL_MAX_NS_DEFAULT 0ULL
>  #endif
> -static __thread IOThread *my_iothread;
> +static __thread AioContext *my_aiocontext;
> +
> +void qemu_set_current_aio_context(AioContext *ctx)
> +{
> +    assert(!my_aiocontext);
> +    my_aiocontext = ctx;
> +}
>  AioContext *qemu_get_current_aio_context(void)
>  {
> -    return my_iothread ? my_iothread->ctx : qemu_get_aio_context();
> +    if (my_aiocontext) {
> +        return my_aiocontext;
> +    }
> +    if (qemu_mutex_iothread_locked()) {
> +        return qemu_get_aio_context();
> +    }
> +    return NULL;
>  }
>  static void *iothread_run(void *opaque)
> @@ -56,7 +68,7 @@ static void *iothread_run(void *opaque)
>       * in this new thread uses glib.
>       */
>      g_main_context_push_thread_default(iothread->worker_context);
> -    my_iothread = iothread;
> +    qemu_set_current_aio_context(iothread->ctx);
>      iothread->thread_id = qemu_get_thread_id();
>      qemu_sem_post(&iothread->init_done_sem);
> diff --git a/stubs/iothread.c b/stubs/iothread.c
> index 8cc9e28c55..25ff398894 100644
> --- a/stubs/iothread.c
> +++ b/stubs/iothread.c
> @@ -6,3 +6,7 @@ AioContext *qemu_get_current_aio_context(void)
>  {
>      return qemu_get_aio_context();
>  }
> +
> +void qemu_set_current_aio_context(AioContext *ctx)
> +{
> +}
> diff --git a/tests/unit/iothread.c b/tests/unit/iothread.c
> index afde12b4ef..cab38b3da8 100644
> --- a/tests/unit/iothread.c
> +++ b/tests/unit/iothread.c
> @@ -30,13 +30,26 @@ struct IOThread {
>      bool stopping;
>  };
> -static __thread IOThread *my_iothread;
> +static __thread AioContext *my_aiocontext;
> +
> +void qemu_set_current_aio_context(AioContext *ctx)
> +{
> +    assert(!my_aiocontext);
> +    my_aiocontext = ctx;
> +}
>  AioContext *qemu_get_current_aio_context(void)
>  {
> -    return my_iothread ? my_iothread->ctx : qemu_get_aio_context();
> +    if (my_aiocontext) {
> +        return my_aiocontext;
> +    }
> +    if (qemu_mutex_iothread_locked()) {
> +        return qemu_get_aio_context();
> +    }
> +    return NULL;
>  }
> +
>  static void iothread_init_gcontext(IOThread *iothread)
>  {
>      GSource *source;
> @@ -54,7 +67,7 @@ static void *iothread_run(void *opaque)
>      rcu_register_thread();
> -    my_iothread = iothread;
> +    qemu_set_current_aio_context(iothread->ctx);
>      qemu_mutex_lock(&iothread->init_done_lock);
>      iothread->ctx = aio_context_new(&error_abort);
> diff --git a/util/main-loop.c b/util/main-loop.c
> index d9c55df6f5..4ae5b23e99 100644
> --- a/util/main-loop.c
> +++ b/util/main-loop.c
> @@ -170,6 +170,7 @@ int qemu_init_main_loop(Error **errp)
>      if (!qemu_aio_context) {
>          return -EMFILE;
>      }
> +    qemu_set_current_aio_context(qemu_aio_context);
>      qemu_notify_bh = qemu_bh_new(notify_event_cb, NULL);
>      gpollfds = g_array_new(FALSE, FALSE, sizeof(GPollFD));
>      src = aio_get_g_source(qemu_aio_context);
> 
> If it works for you, I can post it as a formal patch.
> 
> Paolo
> 

