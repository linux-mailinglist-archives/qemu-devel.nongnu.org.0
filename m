Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1191300B41
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 19:30:58 +0100 (CET)
Received: from localhost ([::1]:40600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l31Cz-0006vL-Ps
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 13:30:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l31BU-00066Z-Ru
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 13:29:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l31BT-00033G-0k
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 13:29:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611340162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1gSp9ERj017FwLzn2f4Lfm+OB75dLSyLAQitiJsd1fk=;
 b=fZhH1Zm6sJIZ/uWz3AbJ2p8uASTcuee43N2y31/zwTPgTlYfTpBjX3hTC0Y16Wp3ga48H1
 Jedn7zWqGggZK1Cl6XXDG0+TExabohXzPwdLh46w4om9VdoVIU5RtvL1u7I9TTyenSvnQ2
 bCQ2y2m/R+am+UTmrtqT+Wuo43JE+KY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-598-gMRlrrOCMs6eRVBJbgvwqw-1; Fri, 22 Jan 2021 13:29:20 -0500
X-MC-Unique: gMRlrrOCMs6eRVBJbgvwqw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE2E7A0CA2
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 18:29:19 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-81.ams2.redhat.com
 [10.36.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B05B6EF57;
 Fri, 22 Jan 2021 18:29:15 +0000 (UTC)
Subject: Re: [PATCH] coroutine-sigaltstack: Keep SIGUSR2 handler up
To: Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
References: <20210122102041.27031-1-mreitz@redhat.com>
 <d68e5cc9-d6ba-2dac-04ad-49d5509cd836@redhat.com>
 <eef8237e-293a-b6e6-20be-fa004509fa05@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <1121a803-98e7-6d41-119c-3d82717976ec@redhat.com>
Date: Fri, 22 Jan 2021 19:29:14 +0100
MIME-Version: 1.0
In-Reply-To: <eef8237e-293a-b6e6-20be-fa004509fa05@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On 01/22/21 19:05, Max Reitz wrote:
> On 22.01.21 18:09, Laszlo Ersek wrote:
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
>>>
>>> diff --git a/util/coroutine-sigaltstack.c b/util/coroutine-sigaltstack.c
>>> index aade82afb8..2d32afc322 100644
>>> --- a/util/coroutine-sigaltstack.c
>>> +++ b/util/coroutine-sigaltstack.c
>>> @@ -59,6 +59,8 @@ typedef struct {
>>>     static pthread_key_t thread_state_key;
>>>   +static void coroutine_trampoline(int signal);
>>> +
>>>   static CoroutineThreadState *coroutine_get_thread_state(void)
>>>   {
>>>       CoroutineThreadState *s = pthread_getspecific(thread_state_key);
>>> @@ -80,6 +82,7 @@ static void qemu_coroutine_thread_cleanup(void
>>> *opaque)
>>>     static void __attribute__((constructor)) coroutine_init(void)
>>>   {
>>> +    struct sigaction sa;
>>>       int ret;
>>>         ret = pthread_key_create(&thread_state_key,
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
>>>     /* "boot" function
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
>>> +
>>>       coTS->tr_called = 1;
>>> +    coTS->tr_handler = NULL;
>>>       co = &self->base;
>>>         /*
>>
>> (8) There's a further complication here, assuming we really want to
>> recognize the case when the handler is executing unexpectedly:
>>
>> - pthread_getspecific() is not necessarily async-signal-safe, according
>> to POSIX, so calling coroutine_get_thread_state() in the "unexpected"
>> case (e.g. in response to an asynchronously generated SIGUSR2) is
>> problematic in its own right,
> 
> That’s a shame.
> 
>> - if the SIGUSR2 is delivered to a thread that has never called
>> coroutine_get_thread_state() before, then we'll reach g_malloc0() inside
>> coroutine_get_thread_state(), in signal handler context, which is very
>> bad.
> 
> Could be solved with a coroutine_try_get_thread_state() that will never
> malloc, but return NULL then.
> 
>> You'd have to block SIGUSR2 for the entire process (all threads) at all
>> times, and only temporarily unblock it for a particular coroutine
>> thread, with the sigsuspend(). The above check would suffice, that way.
> 
> Yes, that’s what I was originally afraid of.  I feel like that may be
> the complexity drop that pushes this change too far out of my comfort
> zone.  (And as evidenced by your review, it already was pretty much
> outside as it was.)
> 
>> Such blocking is possible by calling pthread_sigmask() from the main
>> thread, before any other thread is created (the signal mask is inherited
>> across pthread_create()). I guess it could be done in coroutine_init()
>> too.
>>
>> And *then* the pthread_sigmask() calls should indeed be removed from
>> qemu_coroutine_new().
> 
> OTOH, that does sound rather simple...
> 
>> (Apologies if my feedback is difficult to understand, it's my fault. I
>> could propose a patch, if (and only if) you want that.)
> 
> I can’t say I wouldn’t be happy with a patch for this code that doesn’t
> bear my S-o-b. ;)
> 
> I feel conflicted.  I can send a v2 that addresses this (probably
> consisting of multiple patches then, e.g. I’d split the SIGUSR2 blocking
> off the main patch), but to me, this bug is really more of a nuisance
> that just blocks me from sending a pull request for my block branch...
> So I’d rather not drag it out forever.  OTOH, sending a quick and bad
> fix just because I can’t wait is just bad.
> 
> I suppose I’ll have to decide over the weekend.  Though if you’re
> itching to write a patch yourself, I’d definitely be grateful.

OK, I'll try my hand at it; I hope I won't be eating my words.

Laszlo


