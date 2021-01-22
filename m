Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8346A30094E
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 18:11:08 +0100 (CET)
Received: from localhost ([::1]:42796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2zxj-000389-FK
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 12:11:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l2zwO-0002EE-LD
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 12:09:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l2zwL-00073h-Aw
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 12:09:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611335380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EGfeueoRMxA+d4oljBtQNMbbxwhdnwiPt+ZL6+4aeDY=;
 b=hb+1XAh3HvD37Tdhm2gFtSgzTP/eWD0BJ1B9eOcBrb0Fg5Fmq1dvJZoZ31I4ZiXxnKg5dE
 /4OMvePiaGkIqp7tXv4XCNAfmT6ZaUDMOLDcK+FVyn4ngBmRKrj8ZG8UUtej8pNO9hrvK6
 c/VETmQSnqpVNhurqSZxU/RTsECA9TM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-6z-9YnSKO6enyuDLe3HjVA-1; Fri, 22 Jan 2021 12:09:38 -0500
X-MC-Unique: 6z-9YnSKO6enyuDLe3HjVA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 795C09CC03
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 17:09:37 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-81.ams2.redhat.com
 [10.36.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6A5F60CE7;
 Fri, 22 Jan 2021 17:09:31 +0000 (UTC)
Subject: Re: [PATCH] coroutine-sigaltstack: Keep SIGUSR2 handler up
To: Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
References: <20210122102041.27031-1-mreitz@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <d68e5cc9-d6ba-2dac-04ad-49d5509cd836@redhat.com>
Date: Fri, 22 Jan 2021 18:09:30 +0100
MIME-Version: 1.0
In-Reply-To: <20210122102041.27031-1-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/22/21 11:20, Max Reitz wrote:
> Modifying signal handlers is a process-global operation.  When two
> threads run coroutine-sigaltstack's qemu_coroutine_new() concurrently,
> they may interfere with each other: One of them may revert the SIGUSR2
> handler back to the default between the other thread setting up
> coroutine_trampoline() as the handler and raising SIGUSR2.  That SIGUSR2
> will then lead to the process exiting.
> 
> Outside of coroutine-sigaltstack, qemu does not use SIGUSR2.  We can
> thus keep the signal handler installed all the time.
> CoroutineThreadState.tr_handler tells coroutine_trampoline() whether its
> stack is set up so a new coroutine is to be launched (i.e., it should
> invoke sigsetjmp()), or not (i.e., the signal came from an external
> source and we should just perform the default action, which is to exit
> the process).
> 
> Note that in user-mode emulation, the guest can register signal handlers
> for any signal but SIGSEGV and SIGBUS, so if it registers a SIGUSR2
> handler, sigaltstack coroutines will break from then on.  However, we do
> not use coroutines for user-mode emulation, so that is fine.
> 
> Suggested-by: Laszlo Ersek <lersek@redhat.com>
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  util/coroutine-sigaltstack.c | 56 +++++++++++++++++++-----------------
>  1 file changed, 29 insertions(+), 27 deletions(-)
> 
> diff --git a/util/coroutine-sigaltstack.c b/util/coroutine-sigaltstack.c
> index aade82afb8..2d32afc322 100644
> --- a/util/coroutine-sigaltstack.c
> +++ b/util/coroutine-sigaltstack.c
> @@ -59,6 +59,8 @@ typedef struct {
>  
>  static pthread_key_t thread_state_key;
>  
> +static void coroutine_trampoline(int signal);
> +
>  static CoroutineThreadState *coroutine_get_thread_state(void)
>  {
>      CoroutineThreadState *s = pthread_getspecific(thread_state_key);
> @@ -80,6 +82,7 @@ static void qemu_coroutine_thread_cleanup(void *opaque)
>  
>  static void __attribute__((constructor)) coroutine_init(void)
>  {
> +    struct sigaction sa;
>      int ret;
>  
>      ret = pthread_key_create(&thread_state_key, qemu_coroutine_thread_cleanup);
> @@ -87,6 +90,20 @@ static void __attribute__((constructor)) coroutine_init(void)
>          fprintf(stderr, "unable to create leader key: %s\n", strerror(errno));
>          abort();
>      }
> +
> +    /*
> +     * Establish the SIGUSR2 signal handler.  This is a process-wide
> +     * operation, and so will apply to all threads from here on.
> +     */
> +    sa = (struct sigaction) {
> +        .sa_handler = coroutine_trampoline,
> +        .sa_flags   = SA_ONSTACK,
> +    };
> +
> +    if (sigaction(SIGUSR2, &sa, NULL) != 0) {
> +        perror("Unable to install SIGUSR2 handler");
> +        abort();
> +    }
>  }
>  
>  /* "boot" function
> @@ -121,7 +138,17 @@ static void coroutine_trampoline(int signal)
>      /* Get the thread specific information */
>      coTS = coroutine_get_thread_state();
>      self = coTS->tr_handler;
> +
> +    if (!self) {
> +        /*
> +         * This SIGUSR2 came from an external source, not from
> +         * qemu_coroutine_new(), so perform the default action.
> +         */
> +        exit(0);
> +    }
> +
>      coTS->tr_called = 1;
> +    coTS->tr_handler = NULL;
>      co = &self->base;
>  
>      /*

(8) There's a further complication here, assuming we really want to
recognize the case when the handler is executing unexpectedly:

- pthread_getspecific() is not necessarily async-signal-safe, according
to POSIX, so calling coroutine_get_thread_state() in the "unexpected"
case (e.g. in response to an asynchronously generated SIGUSR2) is
problematic in its own right,

- if the SIGUSR2 is delivered to a thread that has never called
coroutine_get_thread_state() before, then we'll reach g_malloc0() inside
coroutine_get_thread_state(), in signal handler context, which is very bad.

You'd have to block SIGUSR2 for the entire process (all threads) at all
times, and only temporarily unblock it for a particular coroutine
thread, with the sigsuspend(). The above check would suffice, that way.

Such blocking is possible by calling pthread_sigmask() from the main
thread, before any other thread is created (the signal mask is inherited
across pthread_create()). I guess it could be done in coroutine_init() too.

And *then* the pthread_sigmask() calls should indeed be removed from
qemu_coroutine_new().

(Apologies if my feedback is difficult to understand, it's my fault. I
could propose a patch, if (and only if) you want that.)

Thanks
Laszlo

> @@ -150,12 +177,9 @@ Coroutine *qemu_coroutine_new(void)
>  {
>      CoroutineSigAltStack *co;
>      CoroutineThreadState *coTS;
> -    struct sigaction sa;
> -    struct sigaction osa;
>      stack_t ss;
>      stack_t oss;
>      sigset_t sigs;
> -    sigset_t osigs;
>      sigjmp_buf old_env;
>  
>      /* The way to manipulate stack is with the sigaltstack function. We
> @@ -172,24 +196,6 @@ Coroutine *qemu_coroutine_new(void)
>      co->stack = qemu_alloc_stack(&co->stack_size);
>      co->base.entry_arg = &old_env; /* stash away our jmp_buf */
>  
> -    coTS = coroutine_get_thread_state();
> -    coTS->tr_handler = co;
> -
> -    /*
> -     * Preserve the SIGUSR2 signal state, block SIGUSR2,
> -     * and establish our signal handler. The signal will
> -     * later transfer control onto the signal stack.
> -     */
> -    sigemptyset(&sigs);
> -    sigaddset(&sigs, SIGUSR2);
> -    pthread_sigmask(SIG_BLOCK, &sigs, &osigs);
> -    sa.sa_handler = coroutine_trampoline;
> -    sigfillset(&sa.sa_mask);
> -    sa.sa_flags = SA_ONSTACK;
> -    if (sigaction(SIGUSR2, &sa, &osa) != 0) {
> -        abort();
> -    }
> -
>      /*
>       * Set the new stack.
>       */
> @@ -207,6 +213,8 @@ Coroutine *qemu_coroutine_new(void)
>       * signal can be delivered the first time sigsuspend() is
>       * called.
>       */
> +    coTS = coroutine_get_thread_state();
> +    coTS->tr_handler = co;
>      coTS->tr_called = 0;
>      pthread_kill(pthread_self(), SIGUSR2);
>      sigfillset(&sigs);
> @@ -230,12 +238,6 @@ Coroutine *qemu_coroutine_new(void)
>          sigaltstack(&oss, NULL);
>      }
>  
> -    /*
> -     * Restore the old SIGUSR2 signal handler and mask
> -     */
> -    sigaction(SIGUSR2, &osa, NULL);
> -    pthread_sigmask(SIG_SETMASK, &osigs, NULL);
> -
>      /*
>       * Now enter the trampoline again, but this time not as a signal
>       * handler. Instead we jump into it directly. The functionally
> 


