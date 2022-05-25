Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C35A5337B0
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 09:48:34 +0200 (CEST)
Received: from localhost ([::1]:44528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntlkv-0007ig-BX
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 03:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ntldl-0004Yz-QG; Wed, 25 May 2022 03:41:13 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:34494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ntldh-0006ze-TH; Wed, 25 May 2022 03:41:07 -0400
Received: by mail-ed1-x52b.google.com with SMTP id ee42so5302518edb.1;
 Wed, 25 May 2022 00:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rFeXcpImdO64THwvF/joxBAdxRb2Bxa+0ebMg7Nu0FE=;
 b=R+ICu30Y0vF3Qu5N1aqhgDMk3574U1FLIrsU2GT7nHbSo8oAWjZFZiSESPXqh0WA4G
 SwUMqGOytmMWZ4D1maoxlchOPmgaggo+gsKNrbzCTb89uV/+dXsnKUREPQOoD8oXcx4b
 C7UCF2ioFNTl9Jp5DkWlewSsEFX+rQm/le9CeA3r0519ssi9ziJ4TrypsM/vdrIaWml9
 6lMulQC39mvGopeXkHMfq9pGt+CIYkYVuT9rW4WXejmv/vW4hZk4XFgfW4JF46iLVnVz
 oIyIbRG4HlSFDoAbuuELC7jajsDpKTIZwmhQfyJIoKqf2gY72UA6s0z+vzYjeEI/sSGQ
 KXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rFeXcpImdO64THwvF/joxBAdxRb2Bxa+0ebMg7Nu0FE=;
 b=FSRAQIRtwbTRQHL3mR6E0bF82kxKO6bpSkJz4yo02zsa7agwC1wh6pmaHF1qk9MVVx
 bXSDNd90gqsnRqOLypqyxDDAlOunbzkoBSFjq5lYM+5ocwrNo58u3I0g222cJK7FoYOV
 DLaOey5Q54UQuqBXFaNNdYSxWrBTTZhGB2N8xAOivSjBT6fbG3xShdyMl6HX3g2jMzZU
 0CDc6fEwGaNIU4gGM+TcitzevC45fnb4vvWWRC/VaNqtGcbWl857gfJLlma6Cp3rAT6p
 sqhz6PcBRNWRaEIKZZBEJQp6/a+QwN2/0K6civiFKrZMB52P1WL6unUP3KSKqIM3mOLj
 5R6w==
X-Gm-Message-State: AOAM531zNA9h7Cfh9t+3v3Q9g4lTC9DdlLKuC6mRXpzEv8xggZldFkNG
 W2ZK8Kxd76bqN6nkBcxj+pk=
X-Google-Smtp-Source: ABdhPJxvRqkD8B7TGYQvIvesshKhvxClQ0aW+1P0Z4L0lELoeHu/8Dwohyjr9SAzmjc2uTiyxnnyVg==
X-Received: by 2002:a05:6402:35c8:b0:42b:3377:581 with SMTP id
 z8-20020a05640235c800b0042b33770581mr24651643edc.369.1653464463598; 
 Wed, 25 May 2022 00:41:03 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 f10-20020a056402160a00b0042617ba63a7sm10300970edv.49.2022.05.25.00.41.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 May 2022 00:41:02 -0700 (PDT)
Message-ID: <05cc3caa-97ac-e479-de1a-da98fe9a6763@redhat.com>
Date: Wed, 25 May 2022 09:41:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH v2 0/8] Removal of AioContext lock, bs->parents and
 ->children: new rwlock
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220426085114.199647-1-eesposit@redhat.com>
 <YnKB+SP678gNrAb1@stefanha-x1.localdomain>
 <YoN/935E4MfinZFQ@stefanha-x1.localdomain>
 <cc5e12d1-d25f-d338-bff2-0d3f5cc0def7@redhat.com>
 <6fc3e40e-7682-b9dc-f789-3ca95e0430db@redhat.com>
 <Yoy1PJW2Ff6Xb8Ut@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Yoy1PJW2Ff6Xb8Ut@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 5/24/22 12:36, Kevin Wolf wrote:
>> * IO_OR_GS_CODE() functions, when called from coroutine context, expect to
>> be called with the AioContext lock taken (example: bdrv_co_yield_to_drain)
> 
> Am I right to say this is not inherently part of the definition of
> IO_OR_GS_CODE(), but just a property that these functions have in
> practice? In practice, the functions that are IO_OR_GS_CODE()
> are those that call AIO_WAIT_WHILE().

Yes.

> Using a different code path means that the restrictions from
> AIO_WAIT_WHILE() don't really apply any more and these functions become
> effectively IO_CODE() when called in a coroutine. (At least I'm not
> aware of any other piece of code apart from AIO_WAIT_WHILE() that makes
> a function IO_OR_GS_CODE().)

The second point is correct.

The first depends on the definition of the coroutine path.  For example, 
bdrv_co_yield_to_drain() expects to run with bdrv_get_aio_context(bs)'s 
lock taken.  An iothread cannot take another iothread's AioContext lock 
to avoid AB-BA deadlocks; therefore, bdrv_co_yield_to_drain() can only 
run in the main thread or in bs's home iothread.

>> * to call these functions with the lock taken, the code has to run in the
>> BDS's home iothread.  Attempts to do otherwise results in deadlocks (the
>> main loop's AIO_WAIT_WHILEs expect progress from the iothread, that cannot
>> happen without releasing the aiocontext lock)
> 
> This problem can't happen in the main thread itself, AIO_WAIT_WHILE() is
> safe both in the home thread and the main thread (at least as long as
> you lock only once) because it temporarily drops the lock. It has also
> become the definition of IO_OR_GS_CODE(): This code has to run in the
> home thread or the main thread.

It doesn't work to run bdrv_open_driver() in the home iothread because 
bdrv_open_driver can change the AioContext of a BDS (causing extreme 
confusion on what runs where and what AioContext locks have to be taken 
and released).

So in order to have bdrv_open_driver() run in the main thread, Emanuele 
added a variant of generated_co_wrapper that waits on the main thread. 
But it didn't work either, because then AIO_WAIT_WHILE() does not 
release the BDS's AioContext lock.

When ->bdrv_open() calls bdrv_replace_child_noperm() and it tries to 
drain, bdrv_co_yield_to_drain() schedules a bottom half on the iothread 
and yields; the bottom half can never run, because the AioContext lock 
is already taken elsewhere.

	main thread				ctx home thread
	aio_context_acquire(ctx)
	bdrv_open()
	  drv->bdrv_co_open()
	    bdrv_replace_child_noperm()
	      bdrv_co_yield_to_drain()
	        aio_context_release(ctx)
		aio_schedule_bh_oneshot()

So, bdrv_open_driver() and bdrv_close() are un-coroutin-izable.  I guess 
we could split the callback in two parts, one doing I/O and one doing 
graph manipulation (it may even be a good idea---the ->bdrv_inactivate() 
callback even exists already in the case of bdrv_close()---but I'm not 
sure it's always applicable).

> Come to think of it, I believe that many of the functions we declared
> IO_CODE() are actually just IO_OR_GS_CODE() (at best; for iothreads,
> they certainly require running in the home thread, but the main thread
> allowed by IO_OR_GS_CODE() might not work). We have all the coroutine
> machinery so that the AioContext lock of the current thread is
> automatically released and reacquired across yield. However, this is the
> wrong AioContext when called from a different thread, so we need an
> additional lock - which should be dropped during yield, too, but it
> doesn't happen.

There's no need for additional locks.  Drivers have to be protected by 
individual locks, which are either QemuMutex and dropped during yield, 
or CoMutex.  A QemuMutex used to protect a CoQueue is also dropped 
safely during yield.

The IO_CODE() distinction is indeed mostly theoretical until the file 
I/O BlockDriver protocols are protected by the AioContext lock and 
therefore are actually IO_OR_GS_CODE().  But that's the least of our 
worries; if file-posix AIO is done on qemu_get_current_aio_context() 
instead of bdrv_get_aio_context(bs), the AioContext lock is not needed 
anymore for I/O.

Apart from file I/O, all drivers were thread-safe at some point (now it 
seems blklogwrites.c is not, but the code also seems not safe against 
power loss and I wonder if it should be just deleted).

> Switching to drain for locking doesn't solve the problem, but only
> possibly defer it. In order to complete the multiqueue work, we need
> to make IO_CODE() functions actually conform to the definition of
> IO_CODE(). Do we have a plan what this should look like in the final
> state when all the multiqueue work is completed? Or will we only have
> coroutine locks which don't have this problem?

The latter apart from the occasional QemuMutex, which is used only when 
it does not cause the problem.

>> * running the code in the BDS's home iothread is not possible for
>> GLOBAL_STATE_CODE() functions (unless the BDS home iothread is the main
>> thread, but that cannot be guaranteed in general)
> 
> There is nothing that stops GLOBAL_STATE_CODE() from scheduling work in
> the home iothread of a BDS and then waiting for it - or if it is a
> coroutine, even to reschedule itself into the BDS home thread
> temporarily.

There are still things that I/O thread cannot do, for example 
bdrv_set_aio_context().  Even if it worked, I don't think it would be a 
good idea.  It basically would mean a "movable" main thread.  It's even 
harder to reason on it.

So that's how I got to the point where I don't think it's possible to 
proceed with the idea of coroutin-izing more code (a prerequisite for a 
coroutine-based graph rwlock) without first removing the AioContext 
lock.  But removing the AioContext lock requires a way to make the graph 
operations thread-safe, and then we go back to draining.

Paolo

