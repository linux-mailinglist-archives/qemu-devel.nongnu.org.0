Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE2A300B3B
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 19:29:36 +0100 (CET)
Received: from localhost ([::1]:38166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l31Bg-0005tI-2D
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 13:29:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l319h-0003ue-Bt
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 13:27:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l319c-0002Bz-BA
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 13:27:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611340046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XZ+Z9kzlUvYGWZdiHOZRi+diWfv9TBMroS7NQ8VoaQU=;
 b=f+T1CY+gETDy/8PGxSb1S8LV5ErbClJJbYR/97zUnRaLCUQEuys9qvzYx8apILQk9jo3AG
 8AU2c4KwzirdAXeoVrjv79poG5xWdWSeO9gp2O7WXJaHRpxY/KxNj8Io7UHZBk8D4I2OpE
 ZyCz8hMlvZdTKlV75Y+/m02kADhFQ7o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-hUDsRCnMPA2ULxlBkvLUyw-1; Fri, 22 Jan 2021 13:27:23 -0500
X-MC-Unique: hUDsRCnMPA2ULxlBkvLUyw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D38E8107ACE8
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 18:27:22 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-81.ams2.redhat.com
 [10.36.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ADD155DA2D;
 Fri, 22 Jan 2021 18:27:17 +0000 (UTC)
Subject: Re: [PATCH] coroutine-sigaltstack: Keep SIGUSR2 handler up
To: Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
References: <20210122102041.27031-1-mreitz@redhat.com>
 <10be5fcc-5e7a-3e44-3229-8526ad3b4547@redhat.com>
 <3e6b417c-eebb-dc6a-da7d-af2295118c6a@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <52c4f02d-ac8a-0e04-c25f-18e7c27c1980@redhat.com>
Date: Fri, 22 Jan 2021 19:27:15 +0100
MIME-Version: 1.0
In-Reply-To: <3e6b417c-eebb-dc6a-da7d-af2295118c6a@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 01/22/21 18:58, Max Reitz wrote:
> On 22.01.21 17:38, Laszlo Ersek wrote:
>> On 01/22/21 11:20, Max Reitz wrote:
>>> Modifying signal handlers is a process-global operation.  When two
>>> threads run coroutine-sigaltstack's qemu_coroutine_new() concurrently,
>>> they may interfere with each other: One of them may revert the SIGUSR2
>>> handler back to the default between the other thread setting up
>>> coroutine_trampoline() as the handler and raising SIGUSR2.  That SIGUSR2
>>> will then lead to the process exiting.
>>>
>>> Outside of coroutine-sigaltstack, qemu does not use SIGUSR2.  We can
>>> thus keep the signal handler installed all the time.
>>> CoroutineThreadState.tr_handler tells coroutine_trampoline() whether its
>>> stack is set up so a new coroutine is to be launched (i.e., it should
>>> invoke sigsetjmp()), or not (i.e., the signal came from an external
>>> source and we should just perform the default action, which is to exit
>>> the process).
>>>
>>> Note that in user-mode emulation, the guest can register signal handlers
>>> for any signal but SIGSEGV and SIGBUS, so if it registers a SIGUSR2
>>> handler, sigaltstack coroutines will break from then on.  However, we do
>>> not use coroutines for user-mode emulation, so that is fine.
>>>
>>> Suggested-by: Laszlo Ersek <lersek@redhat.com>
>>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>>> ---
>>>   util/coroutine-sigaltstack.c | 56 +++++++++++++++++++-----------------
>>>   1 file changed, 29 insertions(+), 27 deletions(-)
>>
>> (1) With SIGUSR2 permanently dedicated to "coroutine-sigaltstack.c", the
>> comment on the qemu_init_main_loop() declaration, in
>> "include/qemu/main-loop.h", also needs to be updated. SIGUSR2 is no
>> longer a "free for thread-internal usage" signal.
> 
> It’s possible that I haven’t understood that comment, but I haven’t
> adjusted it because I didn’t interpret it to mean that the signals
> listed there were free to use.  For example, SIGUSR1 (aliased to
> SIG_IPI) is generated by cpus_kick_thread() and caught by KVM and HVF,
> so it doesn’t seem like it would be free for thread-internal usage either.
> 
> Instead, I understood it to mean that the signals listed there do not
> have to be blocked by non-main threads, because it is OK for non-main
> threads to catch them.  I can’t think of a reason why SIGUSR2 should be
> blocked by any thread, so I decided not to change the comment.
> 
> But perhaps I just didn’t understand the whole comment.  That’s
> definitely possible, given that I don’t even see a place where non-main
> threads would block the signals not listed there.

OK, then I agree that I don't understand the comment on
qemu_init_main_loop() either. :) If you consciously decided not to
change the comment, then I won't request otherwise.

> 
>>> diff --git a/util/coroutine-sigaltstack.c b/util/coroutine-sigaltstack.c
>>> index aade82afb8..2d32afc322 100644
>>> --- a/util/coroutine-sigaltstack.c
>>> +++ b/util/coroutine-sigaltstack.c
>>> @@ -59,6 +59,8 @@ typedef struct {
>>>
>>>   static pthread_key_t thread_state_key;
>>>
>>> +static void coroutine_trampoline(int signal);
>>> +
>>>   static CoroutineThreadState *coroutine_get_thread_state(void)
>>>   {
>>>       CoroutineThreadState *s = pthread_getspecific(thread_state_key);
>>> @@ -80,6 +82,7 @@ static void qemu_coroutine_thread_cleanup(void
>>> *opaque)
>>>
>>>   static void __attribute__((constructor)) coroutine_init(void)
>>>   {
>>> +    struct sigaction sa;
>>>       int ret;
>>>
>>>       ret = pthread_key_create(&thread_state_key,
>>> qemu_coroutine_thread_cleanup);
>>> @@ -87,6 +90,20 @@ static void __attribute__((constructor))
>>> coroutine_init(void)
>>>           fprintf(stderr, "unable to create leader key: %s\n",
>>> strerror(errno));
>>>           abort();
>>>       }
>>> +
>>> +    /*
>>> +     * Establish the SIGUSR2 signal handler.  This is a process-wide
>>> +     * operation, and so will apply to all threads from here on.
>>> +     */
>>> +    sa = (struct sigaction) {
>>> +        .sa_handler = coroutine_trampoline,
>>> +        .sa_flags   = SA_ONSTACK,
>>> +    };
>>> +
>>> +    if (sigaction(SIGUSR2, &sa, NULL) != 0) {
>>> +        perror("Unable to install SIGUSR2 handler");
>>> +        abort();
>>> +    }
>>>   }
>>>
>>>   /* "boot" function
>>> @@ -121,7 +138,17 @@ static void coroutine_trampoline(int signal)
>>>       /* Get the thread specific information */
>>>       coTS = coroutine_get_thread_state();
>>>       self = coTS->tr_handler;
>>> +
>>> +    if (!self) {
>>> +        /*
>>> +         * This SIGUSR2 came from an external source, not from
>>> +         * qemu_coroutine_new(), so perform the default action.
>>> +         */
>>> +        exit(0);
>>> +    }
>>
>> (2) exit() is generally unsafe to call in signal handlers.
>>
>> We could reason whether or not it is safe in this particular case (POSIX
>> describes the exact conditions --
>> <https://pubs.opengroup.org/onlinepubs/9699919799/functions/V2_chap02.html#tag_15_04_03_03>),
>>
>> but it's much simpler to just call _exit().
>>
>>
>> (3) "Performing the default action" would be slightly different from
>> calling _exit(). When a process is terminated with a signal, the parent
>> can distinguish that, when reaping the child. See waitpid() /
>> WIFSIGNALED() / WTERMSIG(), versus WIFEXITED() / WEXITSTATUS().
>>
>> So for the "default action", we'd have to:
>> - restore the SIGUSR2 handler to SIG_DFL, and
>> - re-raise the signal for the thread, and
>> - because the signal being handled is automatically blocked unless
>>    SA_NODEFER was set: unblock the signal for the thread.
>>
>> The pthread_sigmask() call, made for the last step, would be the one
>> that would not return.
>>
>> *However*, all of this complexity is not really useful here. We don't
>> really want to simulate being "forcefully terminated" by the unexpected
>> (asynchronous) SIGUSR2. We just want to exit.
>>
>> Therefore, _exit() is fine. But, we should use an exit code different
>> from 0, as this is definitely not a pristine exit from QEMU. I'm not
>> sure if a convention exists for nonzero exit codes in QEMU; if not, then
>> just pass EXIT_FAILURE to _exit().
> 
> I’m fine with calling _exit().  I hope, Eric is, too (as long as the
> comment no longer claims this were the default behavior).
> 
> Given that SIGUSR2 is not something that qemu is prepared to receive
> from the outside, EXIT_FAILURE seems right to me.  (Even abort() could
> be justified, but I don’t think generating a core dump does any good here.)
> 
> (As for qemu-specific exit code conventions, the only ones I know of are
> for certain qemu-img subcommands.  I’m sure you grepped, too, but I
> can’t find anything for the system emulator.)
> 
>> (4) Furthermore, please update the comment, because "perform the default
>> action" is not precise.
> 
> Sure, that’s definitely easier than to re-raise SIGUSR2.
> 
>>> +
>>>       coTS->tr_called = 1;
>>> +    coTS->tr_handler = NULL;
>>>       co = &self->base;
>>>
>>>       /*
>>
>> (5) I see that "tr_called" has type "volatile sig_atomic_t", which is
>> great (I think that "sig_atomic_t" is not even necessary here, because
>> of the careful signal masking that we do, and because the signal is
>> raised synchronously).
>>
>> "volatile" is certainly justified though (the compiler may not be able
>> to trace the call through the signal), and that's what I'm missing from
>> "tr_handler" too. IMO, the "tr_handler" field should be decalered as
>> follow:
>>
>>    volatile void * volatile tr_handler;
>>
>> wherein the second "volatile" serves just the same purpose as the
>> "volatile" in "tr_called", and the first "volatile" follows from *that*
>> -- wherever we chase the *chain of pointers* rooted in "tr_handler"
>> should not be optimized out by the compiler.
>>
>> But: my point (5) is orthogonal to this patch. In practice, it may not
>> matter at all. So feel free to ignore now, I guess.
> 
> I suppose signal handlers are indeed preempting functions (i.e., the
> compiler is not aware of them executing).  I overlooked that, given that
> logically, we more or less explicitly invoke the SIGUSR2 handler, but of
> course, technically, we just trigger the signal and the handler is then
> invoked preemptively.
> 
> I suspect the pthread_kill() function is sufficiently complex that the
> compiler can’t prove that it won’t access *coTS (e.g. because perhaps it
> contains a syscall?), but better be safe than sorry.
> 
> But I don’t really like the “volatile void *volatile tr_handler”,
> particularly the “volatile void *” combinations.  I find volatile voids
> weird.
> 
> Why is tr_handler even a void pointer, and not a pointer to
> CoroutineSigAltStack, if all it can point to is such an object?
> “volatile CoroutineSigAltStack *” would make more sense to me.
> 
> Given that perhaps the CoroutineSigAltStack object should be volatile,
> shouldn’t also the CoroutineThreadState object be volatile?  If it were,
> we could drop the volatile from tr_called and wouldn’t need to make the
> pointer value tr_handler volatile.

Good point...

> 
> 
> OTOH, if I look more through the code, making everything volatile seems
> a bit excessive to me.  I understand correctly that
> sigsetjmp()/siglongjmp() act as barriers to the compiler, don’t they?

Hmmm...

https://pubs.opengroup.org/onlinepubs/9699919799/functions/longjmp.html

"I guess so".

> 
> The only value that I can see the in-coroutine code writing that the
> calling code reads (before the next sigsetjmp()) is tr_called.  So
> shouldn’t it be sufficient to insert a barrier() before the
> pthread_kill(), and then it’d be sufficient to keep tr_called volatile,
> but the rest could stay as it is?

Well, I guess one could argue that pthread_kill() itself should work as
a barrier. It's hard to find a reason why it should not be a barrier.

> 
>>> @@ -150,12 +177,9 @@ Coroutine *qemu_coroutine_new(void)
>>>   {
>>>       CoroutineSigAltStack *co;
>>>       CoroutineThreadState *coTS;
>>> -    struct sigaction sa;
>>> -    struct sigaction osa;
>>>       stack_t ss;
>>>       stack_t oss;
>>>       sigset_t sigs;
>>> -    sigset_t osigs;
>>>       sigjmp_buf old_env;
>>>
>>>       /* The way to manipulate stack is with the sigaltstack
>>> function. We
>>> @@ -172,24 +196,6 @@ Coroutine *qemu_coroutine_new(void)
>>>       co->stack = qemu_alloc_stack(&co->stack_size);
>>>       co->base.entry_arg = &old_env; /* stash away our jmp_buf */
>>>
>>> -    coTS = coroutine_get_thread_state();
>>> -    coTS->tr_handler = co;
>>> -
>>> -    /*
>>> -     * Preserve the SIGUSR2 signal state, block SIGUSR2,
>>> -     * and establish our signal handler. The signal will
>>> -     * later transfer control onto the signal stack.
>>> -     */
>>> -    sigemptyset(&sigs);
>>> -    sigaddset(&sigs, SIGUSR2);
>>> -    pthread_sigmask(SIG_BLOCK, &sigs, &osigs);
>>> -    sa.sa_handler = coroutine_trampoline;
>>> -    sigfillset(&sa.sa_mask);
>>> -    sa.sa_flags = SA_ONSTACK;
>>> -    if (sigaction(SIGUSR2, &sa, &osa) != 0) {
>>> -        abort();
>>> -    }
>>> -
>>>       /*
>>>        * Set the new stack.
>>>        */
>>> @@ -207,6 +213,8 @@ Coroutine *qemu_coroutine_new(void)
>>>        * signal can be delivered the first time sigsuspend() is
>>>        * called.
>>>        */
>>> +    coTS = coroutine_get_thread_state();
>>> +    coTS->tr_handler = co;
>>>       coTS->tr_called = 0;
>>>       pthread_kill(pthread_self(), SIGUSR2);
>>>       sigfillset(&sigs);
>>> @@ -230,12 +238,6 @@ Coroutine *qemu_coroutine_new(void)
>>>           sigaltstack(&oss, NULL);
>>>       }
>>>
>>> -    /*
>>> -     * Restore the old SIGUSR2 signal handler and mask
>>> -     */
>>> -    sigaction(SIGUSR2, &osa, NULL);
>>> -    pthread_sigmask(SIG_SETMASK, &osigs, NULL);
>>> -
>>>       /*
>>>        * Now enter the trampoline again, but this time not as a signal
>>>        * handler. Instead we jump into it directly. The functionally
>>>
>>
>> (6) This change, for qemu_coroutine_new(), is too heavy-handed, in my
>> opinion. I suggest (a) removing only the sigaction() calls and their
>> directly needed aux variables, and (b) *not* moving around operations.
>>
>> In particular, you remove the blocking of SIGUSR2 for the thread -- the
>> pthread_sigmask() call. That means the sigsuspend() later on becomes
>> superfluous, as the signal will not be delivered inside sigsuspend(),
>> but inside pthread_kill(). With the signal not blocked, *generation* and
>> *delivery* will coalesce into a single event.
> 
> Are you saying that (a) is a problem because this is too heavy-handed of
> a change for a single patch, or because it would actually be a problem
> to deliver the signal inside pthread_kill()?

The former: all the things together that the patch does to
qemu_coroutine_new() are too heavy-weight for a single patch. They also
render sigsuspend() useless, while keeping sigsuspend() in place.

> 
> (Either way will result in me dropping the change from this patch, so
> it’s just a question out of curiosity.)
> 
> As for (b), just FYI, I deliberately moved around the operation, so that
> tr_handler is only set once the coroutine stack is set up.  Otherwise it
> might be a problem if an external SIGUSR2 comes in before then.
> 
> But if we keep SIGUSR2 blocked, there is no reason for that movement,
> hence the “just FYI”.
> 
>> The general logic should stay the same, only the signal action
>> manipulation should be removed. IOW, for this function, I propose the
>> following change only:
>>
>>> diff --git a/util/coroutine-sigaltstack.c b/util/coroutine-sigaltstack.c
>>> index aade82afb8c0..722fed7b2502 100644
>>> --- a/util/coroutine-sigaltstack.c
>>> +++ b/util/coroutine-sigaltstack.c
>>> @@ -149,107 +149,97 @@ static void coroutine_trampoline(int signal)
>>>   Coroutine *qemu_coroutine_new(void)
>>>   {
>>>       CoroutineSigAltStack *co;
>>>       CoroutineThreadState *coTS;
>>> -    struct sigaction sa;
>>> -    struct sigaction osa;
>>>       stack_t ss;
>>>       stack_t oss;
>>>       sigset_t sigs;
>>>       sigset_t osigs;
>>>       sigjmp_buf old_env;
>>>
>>>       /* The way to manipulate stack is with the sigaltstack
>>> function. We
>>>        * prepare a stack, with it delivering a signal to ourselves
>>> and then
>>>        * put sigsetjmp/siglongjmp where needed.
>>>        * This has been done keeping coroutine-ucontext as a model and
>>> with the
>>>        * pth ideas (GNU Portable Threads). See coroutine-ucontext for
>>> the basics
>>>        * of the coroutines and see pth_mctx.c (from the pth project)
>>> for the
>>>        * sigaltstack way of manipulating stacks.
>>>        */
>>>
>>>       co = g_malloc0(sizeof(*co));
>>>       co->stack_size = COROUTINE_STACK_SIZE;
>>>       co->stack = qemu_alloc_stack(&co->stack_size);
>>>       co->base.entry_arg = &old_env; /* stash away our jmp_buf */
>>>
>>>       coTS = coroutine_get_thread_state();
>>>       coTS->tr_handler = co;
>>>
>>>       /*
>>> -     * Preserve the SIGUSR2 signal state, block SIGUSR2,
>>> -     * and establish our signal handler. The signal will
>>> -     * later transfer control onto the signal stack.
>>> +     * Block SIGUSR2. The signal will later transfer control onto
>>> the signal
>>> +     * stack.
>>>        */
>>>       sigemptyset(&sigs);
>>>       sigaddset(&sigs, SIGUSR2);
>>>       pthread_sigmask(SIG_BLOCK, &sigs, &osigs);
>>> -    sa.sa_handler = coroutine_trampoline;
>>> -    sigfillset(&sa.sa_mask);
>>> -    sa.sa_flags = SA_ONSTACK;
>>> -    if (sigaction(SIGUSR2, &sa, &osa) != 0) {
>>> -        abort();
>>> -    }
>>>
>>>       /*
>>>        * Set the new stack.
>>>        */
>>>       ss.ss_sp = co->stack;
>>>       ss.ss_size = co->stack_size;
>>>       ss.ss_flags = 0;
>>>       if (sigaltstack(&ss, &oss) < 0) {
>>>           abort();
>>>       }
>>>
>>>       /*
>>>        * Now transfer control onto the signal stack and set it up.
>>>        * It will return immediately via "return" after the sigsetjmp()
>>>        * was performed. Be careful here with race conditions.  The
>>>        * signal can be delivered the first time sigsuspend() is
>>>        * called.
>>>        */
>>>       coTS->tr_called = 0;
>>>       pthread_kill(pthread_self(), SIGUSR2);
>>>       sigfillset(&sigs);
>>>       sigdelset(&sigs, SIGUSR2);
>>>       while (!coTS->tr_called) {
>>>           sigsuspend(&sigs);
>>>       }
>>>
>>>       /*
>>>        * Inform the system that we are back off the signal stack by
>>>        * removing the alternative signal stack. Be careful here: It
>>>        * first has to be disabled, before it can be removed.
>>>        */
>>>       sigaltstack(NULL, &ss);
>>>       ss.ss_flags = SS_DISABLE;
>>>       if (sigaltstack(&ss, NULL) < 0) {
>>>           abort();
>>>       }
>>>       sigaltstack(NULL, &ss);
>>>       if (!(oss.ss_flags & SS_DISABLE)) {
>>>           sigaltstack(&oss, NULL);
>>>       }
>>>
>>>       /*
>>> -     * Restore the old SIGUSR2 signal handler and mask
>>> +     * Restore the old mask
>>>        */
>>> -    sigaction(SIGUSR2, &osa, NULL);
>>>       pthread_sigmask(SIG_SETMASK, &osigs, NULL);
>>>
>>>       /*
>>>        * Now enter the trampoline again, but this time not as a signal
>>>        * handler. Instead we jump into it directly. The functionally
>>>        * redundant ping-pong pointer arithmetic is necessary to avoid
>>>        * type-conversion warnings related to the `volatile' qualifier
>>> and
>>>        * the fact that `jmp_buf' usually is an array type.
>>>        */
>>>       if (!sigsetjmp(old_env, 0)) {
>>>           siglongjmp(coTS->tr_reenter, 1);
>>>       }
>>>
>>>       /*
>>>        * Ok, we returned again, so now we're finished
>>>        */
>>>
>>>       return &co->base;
>>>   }
>>
>>
>> (7) The sigaction() call has not been moved entirely correctly from
>> qemu_coroutine_new() to coroutine_init(), in my opinion.
>>
>> Namely, the original call site fills the "sa_mask" member, meaning that,
>> while the signal handler is executing, not only SIGUSR2 itself should be
>> blocked, but *all* signals.
>>
>> This is missing from the new call site, in coroutine_init() -- the
>> "sa_mask" member is left zeroed.
>>
>> Now, in practice, this may not matter a whole lot, because "sa_mask" is
>> additive, and at the only place we allow the signal to be delivered,
>> namely in sigsuspend(), we already have everything blocked, except for
>> SIGUSR2. So when "sa_mask" is ORed with the set of blocked signals, upon
>> delivery of SIGUSR2, there is no actual change to the signal mask.
>>
>> *But*, I feel that such a change would really deserve its own argument,
>> i.e. a separate patch, or at least a separate paragraph in the commit
>> message. And I suggest not doing those; instead please just faithfully
>> transfer the "sa_mask" setting too, to coroutine_init(). (My impression
>> is that the effective removal of the "sa_mask" population was an
>> oversight in this patch, not a conscious decision.)
> 
> Yes, it was totally an oversight.
> 
> Thanks a lot for your detailed review!  I have absolutely no experience
> with coroutine-sigaltstack in particular, and very little experience
> with signal handling in projects where correctness actually matters. I’m
> grateful that you inspect this patch with great scrutiny.
> 
> (Btw, that’s why I was very close to just ending a new version of the
> mutex patch just with the commit message adjusted, because that felt
> like I could do much less wrong than here.  Turns out I was right. O:))

TBH I started liking the mutex version too. :) It's possible we're
working just too hard for solving this issue.

Laszlo


