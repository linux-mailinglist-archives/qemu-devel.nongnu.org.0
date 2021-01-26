Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D42F304992
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 21:09:05 +0100 (CET)
Received: from localhost ([::1]:46876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Ue7-0005Kv-FG
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 15:09:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l4Ubu-0004kS-Lj
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 15:06:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l4Ubs-00078s-1R
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 15:06:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611691601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6RbiUUUbhHP1bFpPtEUxAMdJPs9B+xPsfxK+82Yb/i4=;
 b=Njrm7RHbMo6sCuLCKleDvQqr1fkLfMzNmwoBOGAlIyPQa8C7fYkeyLWDENImLUqRcbgKsJ
 kXXxaBlJnK4tMBohrGSlbgonnsXO390nKgb7is5zrRdbdrnqE9DlJUEQ6RPSyv9qsdmyfZ
 s26Z0Jov5hOoxTMGbgqVeY5BtJnL1Rs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-C4wEIV_MMtWM2njUAFALGg-1; Tue, 26 Jan 2021 15:06:38 -0500
X-MC-Unique: C4wEIV_MMtWM2njUAFALGg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87C5F8030B4;
 Tue, 26 Jan 2021 20:06:37 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-219.ams2.redhat.com
 [10.36.112.219])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E23D60C67;
 Tue, 26 Jan 2021 20:06:32 +0000 (UTC)
Subject: Re: [PATCH] coroutine-sigaltstack: Add SIGUSR2 mutex
To: Max Reitz <mreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20210125120305.19520-1-mreitz@redhat.com>
 <7dc89925-764b-cdc6-8d25-0bae03d90be4@virtuozzo.com>
 <c4b52eba-aec1-8271-6feb-cce8f1c40ca2@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <41f173e7-cf2e-0e82-6189-a0b275e96393@redhat.com>
Date: Tue, 26 Jan 2021 21:06:31 +0100
MIME-Version: 1.0
In-Reply-To: <c4b52eba-aec1-8271-6feb-cce8f1c40ca2@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/26/21 14:16, Max Reitz wrote:
> On 26.01.21 13:44, Vladimir Sementsov-Ogievskiy wrote:
>> 25.01.2021 15:03, Max Reitz wrote:
>>> Disposition (action) for any given signal is global for the process.
>>> When two threads run coroutine-sigaltstack's qemu_coroutine_new()
>>> concurrently, they may interfere with each other: One of them may revert
>>> the SIGUSR2 handler to SIG_DFL, between the other thread (a) setting up
>>> coroutine_trampoline() as the handler and (b) raising SIGUSR2.  That
>>> SIGUSR2 will then terminate the QEMU process abnormally.
>>>
>>> We have to ensure that only one thread at a time can modify the
>>> process-global SIGUSR2 handler.  To do so, wrap the whole section where
>>> that is done in a mutex.
>>>
>>> Alternatively, we could for example have the SIGUSR2 handler always be
>>> coroutine_trampoline(), so there would be no need to invoke sigaction()
>>> in qemu_coroutine_new().  Laszlo has posted a patch to do so here:
>>>
>>>   
>>> https://lists.nongnu.org/archive/html/qemu-devel/2021-01/msg05962.html
>>>
>>> However, given that coroutine-sigaltstack is more of a fallback
>>> implementation for platforms that do not support ucontext, that change
>>> may be a bit too invasive to be comfortable with it.  The mutex proposed
>>> here may negatively impact performance, but the change is much simpler.
>>>
>>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>>> ---
>>>   util/coroutine-sigaltstack.c | 9 +++++++++
>>>   1 file changed, 9 insertions(+)
>>>
>>> diff --git a/util/coroutine-sigaltstack.c b/util/coroutine-sigaltstack.c
>>> index aade82afb8..e99b8a4f9c 100644
>>> --- a/util/coroutine-sigaltstack.c
>>> +++ b/util/coroutine-sigaltstack.c
>>> @@ -157,6 +157,7 @@ Coroutine *qemu_coroutine_new(void)
>>>       sigset_t sigs;
>>>       sigset_t osigs;
>>>       sigjmp_buf old_env;
>>> +    static pthread_mutex_t sigusr2_mutex = PTHREAD_MUTEX_INITIALIZER;
>>>       /* The way to manipulate stack is with the sigaltstack
>>> function. We
>>>        * prepare a stack, with it delivering a signal to ourselves
>>> and then
>>> @@ -186,6 +187,12 @@ Coroutine *qemu_coroutine_new(void)
>>>       sa.sa_handler = coroutine_trampoline;
>>>       sigfillset(&sa.sa_mask);
>>>       sa.sa_flags = SA_ONSTACK;
>>> +
>>> +    /*
>>> +     * sigaction() is a process-global operation.  We must not run
>>> +     * this code in multiple threads at once.
>>> +     */
>>> +    pthread_mutex_lock(&sigusr2_mutex);
>>>       if (sigaction(SIGUSR2, &sa, &osa) != 0) {
>>>           abort();
>>>       }
>>> @@ -234,6 +241,8 @@ Coroutine *qemu_coroutine_new(void)
>>>        * Restore the old SIGUSR2 signal handler and mask
>>>        */
>>>       sigaction(SIGUSR2, &osa, NULL);
>>> +    pthread_mutex_unlock(&sigusr2_mutex);
>>> +
>>>       pthread_sigmask(SIG_SETMASK, &osigs, NULL);
>>>       /*
>>>
>>
>> weak:
>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>
>> Side thought: so, sigaltstack coroutine implementation is not
>> thread-safe. Is that the only bug?
> 
> It would be great if I could tell you for sure whether there’s no bug in
> some piece of code. :)
> 
>> Or actually, the whole implementation should be revisited to check,
>> could it be used with iothreads or not?
> 
> Judging from the discussion I had with Laszlo, I’m definitely not the
> right person to do so, because for example I don’t know the ins and outs
> of signal handling.
> 
> I can only tell you it’s the only issue I’ve seen, and that there’s just
> not much more code in coroutine-sigaltstack.c than the code around
> qemu_coroutine_new().
> 
>> Shouldn't we just state that sigaltstack coroutine implementation
>> doesn't support iothreads? And do error out on iothread creation if
>> sigaltstack coroutines is in use?
> 
> I’m not sure whether that would be better than potentially having a bug
> in it.  What you’re proposing is effectively breaking all iothreads
> usage on MacOS.  If I were a MacOS user, I’d rather risk encountering
> bugs than that.
> 
> (And it isn’t like we know it’s unstable with iothreads; I haven’t seen
> it breaking with this patch applied yet, and I don’t think there’s
> reason to believe it would be.  qemu_coroutine_new() together with
> coroutine_trampoline() sets up a coroutine environment, and the rest of
> the code just consists of sigsetjmp() and siglongjmp().  I believe
> Laszlo hat some open questions about signal masking done by those
> functions, but I don’t think that has anything to do with multithreading.)

I've no open questions regarding the signal masking done by sigsetjmp()
and siglongjmp(). I was briefly confused by sigsetjmp() potentially
saving the signal mask into the "env" buffer even if "savemask" were
zero (POSIX allows this behavior), but then I re-learned that
siglongjmp() is *required to ignore* that potentially-saved mask in
"env" if "savemask" was 0 in the first place.

So the end result is as expected, it's just that the distribution of
responsibilities is potentially non-intuitive (i.e., why permit the
"save" function to stash some crap, under some circumstances, if the
"load" function is required to ignore said crap under the same
circumstances?) Of course the answer is that POSIX codifies existent
practice, and some system does this. I guess I would have appreciated a
hint right in sigsetjmp().

Anyway: no open questions on my end.

Thanks
Laszlo


