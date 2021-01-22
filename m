Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C9A300A9E
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 19:07:19 +0100 (CET)
Received: from localhost ([::1]:50582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l30q6-000246-Vr
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 13:07:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l30oN-0001Ve-Am
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 13:05:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l30oH-000220-Bf
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 13:05:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611338724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8g3f3Df4yRzEufNs0s9faRXMXyArV6p+C2EqOJt9uXo=;
 b=fe4RukJZLeS3qqSfnTXvMQqwtv+kU/p6rPGGSFEBgs15rpezbzvJgF21lNqUbMXey2pili
 +gGpfm/KOf95o45Dq4MXhmd5cFeL7WbnmeYk12+5A5fyG/2cE5yB0pJMTJGVjGQxheNkqP
 hXNmrZpQ1tPntEn6CruHHGhEOqmkv9U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-LR1apCFyNSyUrDE2Fl57WA-1; Fri, 22 Jan 2021 13:05:22 -0500
X-MC-Unique: LR1apCFyNSyUrDE2Fl57WA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83E1F100C60C
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 18:05:21 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-109.ams2.redhat.com
 [10.36.114.109])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 97AA75D6CF;
 Fri, 22 Jan 2021 18:05:14 +0000 (UTC)
Subject: Re: [PATCH] coroutine-sigaltstack: Keep SIGUSR2 handler up
To: Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org
References: <20210122102041.27031-1-mreitz@redhat.com>
 <d68e5cc9-d6ba-2dac-04ad-49d5509cd836@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <eef8237e-293a-b6e6-20be-fa004509fa05@redhat.com>
Date: Fri, 22 Jan 2021 19:05:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <d68e5cc9-d6ba-2dac-04ad-49d5509cd836@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.221, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.01.21 18:09, Laszlo Ersek wrote:
> On 01/22/21 11:20, Max Reitz wrote:
>> Modifying signal handlers is a process-global operation.  When two
>> threads run coroutine-sigaltstack's qemu_coroutine_new() concurrently,
>> they may interfere with each other: One of them may revert the SIGUSR2
>> handler back to the default between the other thread setting up
>> coroutine_trampoline() as the handler and raising SIGUSR2.  That SIGUSR2
>> will then lead to the process exiting.
>>
>> Outside of coroutine-sigaltstack, qemu does not use SIGUSR2.  We can
>> thus keep the signal handler installed all the time.
>> CoroutineThreadState.tr_handler tells coroutine_trampoline() whether its
>> stack is set up so a new coroutine is to be launched (i.e., it should
>> invoke sigsetjmp()), or not (i.e., the signal came from an external
>> source and we should just perform the default action, which is to exit
>> the process).
>>
>> Note that in user-mode emulation, the guest can register signal handlers
>> for any signal but SIGSEGV and SIGBUS, so if it registers a SIGUSR2
>> handler, sigaltstack coroutines will break from then on.  However, we do
>> not use coroutines for user-mode emulation, so that is fine.
>>
>> Suggested-by: Laszlo Ersek <lersek@redhat.com>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>>   util/coroutine-sigaltstack.c | 56 +++++++++++++++++++-----------------
>>   1 file changed, 29 insertions(+), 27 deletions(-)
>>
>> diff --git a/util/coroutine-sigaltstack.c b/util/coroutine-sigaltstack.c
>> index aade82afb8..2d32afc322 100644
>> --- a/util/coroutine-sigaltstack.c
>> +++ b/util/coroutine-sigaltstack.c
>> @@ -59,6 +59,8 @@ typedef struct {
>>   
>>   static pthread_key_t thread_state_key;
>>   
>> +static void coroutine_trampoline(int signal);
>> +
>>   static CoroutineThreadState *coroutine_get_thread_state(void)
>>   {
>>       CoroutineThreadState *s = pthread_getspecific(thread_state_key);
>> @@ -80,6 +82,7 @@ static void qemu_coroutine_thread_cleanup(void *opaque)
>>   
>>   static void __attribute__((constructor)) coroutine_init(void)
>>   {
>> +    struct sigaction sa;
>>       int ret;
>>   
>>       ret = pthread_key_create(&thread_state_key, qemu_coroutine_thread_cleanup);
>> @@ -87,6 +90,20 @@ static void __attribute__((constructor)) coroutine_init(void)
>>           fprintf(stderr, "unable to create leader key: %s\n", strerror(errno));
>>           abort();
>>       }
>> +
>> +    /*
>> +     * Establish the SIGUSR2 signal handler.  This is a process-wide
>> +     * operation, and so will apply to all threads from here on.
>> +     */
>> +    sa = (struct sigaction) {
>> +        .sa_handler = coroutine_trampoline,
>> +        .sa_flags   = SA_ONSTACK,
>> +    };
>> +
>> +    if (sigaction(SIGUSR2, &sa, NULL) != 0) {
>> +        perror("Unable to install SIGUSR2 handler");
>> +        abort();
>> +    }
>>   }
>>   
>>   /* "boot" function
>> @@ -121,7 +138,17 @@ static void coroutine_trampoline(int signal)
>>       /* Get the thread specific information */
>>       coTS = coroutine_get_thread_state();
>>       self = coTS->tr_handler;
>> +
>> +    if (!self) {
>> +        /*
>> +         * This SIGUSR2 came from an external source, not from
>> +         * qemu_coroutine_new(), so perform the default action.
>> +         */
>> +        exit(0);
>> +    }
>> +
>>       coTS->tr_called = 1;
>> +    coTS->tr_handler = NULL;
>>       co = &self->base;
>>   
>>       /*
> 
> (8) There's a further complication here, assuming we really want to
> recognize the case when the handler is executing unexpectedly:
> 
> - pthread_getspecific() is not necessarily async-signal-safe, according
> to POSIX, so calling coroutine_get_thread_state() in the "unexpected"
> case (e.g. in response to an asynchronously generated SIGUSR2) is
> problematic in its own right,

That’s a shame.

> - if the SIGUSR2 is delivered to a thread that has never called
> coroutine_get_thread_state() before, then we'll reach g_malloc0() inside
> coroutine_get_thread_state(), in signal handler context, which is very bad.

Could be solved with a coroutine_try_get_thread_state() that will never 
malloc, but return NULL then.

> You'd have to block SIGUSR2 for the entire process (all threads) at all
> times, and only temporarily unblock it for a particular coroutine
> thread, with the sigsuspend(). The above check would suffice, that way.

Yes, that’s what I was originally afraid of.  I feel like that may be 
the complexity drop that pushes this change too far out of my comfort 
zone.  (And as evidenced by your review, it already was pretty much 
outside as it was.)

> Such blocking is possible by calling pthread_sigmask() from the main
> thread, before any other thread is created (the signal mask is inherited
> across pthread_create()). I guess it could be done in coroutine_init() too.
> 
> And *then* the pthread_sigmask() calls should indeed be removed from
> qemu_coroutine_new().

OTOH, that does sound rather simple...

> (Apologies if my feedback is difficult to understand, it's my fault. I
> could propose a patch, if (and only if) you want that.)

I can’t say I wouldn’t be happy with a patch for this code that doesn’t 
bear my S-o-b. ;)

I feel conflicted.  I can send a v2 that addresses this (probably 
consisting of multiple patches then, e.g. I’d split the SIGUSR2 blocking 
off the main patch), but to me, this bug is really more of a nuisance 
that just blocks me from sending a pull request for my block branch... 
So I’d rather not drag it out forever.  OTOH, sending a quick and bad 
fix just because I can’t wait is just bad.

I suppose I’ll have to decide over the weekend.  Though if you’re 
itching to write a patch yourself, I’d definitely be grateful.

Max


