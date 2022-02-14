Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8890D4B4D92
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 12:16:05 +0100 (CET)
Received: from localhost ([::1]:36404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJZKu-0000wE-Mf
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 06:16:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nJZHI-000785-NC
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 06:12:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nJZH4-0006BN-Ay
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 06:12:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644837124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2X5B3PQmCR7xAYCbogoJsDybAYmZVBqgMfdfwdVr09M=;
 b=M34umTA1pmKoTsRtih9Ng8E4foR59h6BuoRwpQGBZ23ZT/0mSfoDDeXcPGXK/itxQth1pI
 XhMSxlhQhgrMXCHEuqUh38q1CAO7GQLPyUFqQ0bvHFr4Zf3TaBCYh8CYzFCNpI4VdN5Ptw
 irwr17B29i5wR/pBO5+teRQvbVEvw68=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-R87SPlO2Nrieg-Keo8573A-1; Mon, 14 Feb 2022 06:11:58 -0500
X-MC-Unique: R87SPlO2Nrieg-Keo8573A-1
Received: by mail-wr1-f69.google.com with SMTP id
 h29-20020adfa4dd000000b001e498f51244so6664218wrb.14
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 03:11:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2X5B3PQmCR7xAYCbogoJsDybAYmZVBqgMfdfwdVr09M=;
 b=Mj1MO+GnftLN4v30D1YM4igiO0Dpus45Rr7QVdnrnlM56oHIeFU/fK9ckblDaGOusH
 Sw5z0qHxJX4ZCcrCHNYgt0jf0Z4FhkgLHT3XUk0p4t9nwptzNUlce2rw3RzzWiybJ0SQ
 9qhf7HdHLsKpJ4k5vcY5YVN24OvXmE8SskQ8q9yh9GAw2nG4kaCz1z0eQBdDT9s7OtLG
 /Z1aDTmJLCg5zUa2pCKPgnnAr648Mt3ZdRJ+X9ksayyFcGiw1LUxE1MsV8OYqG+PVsnf
 PHBI4GK2w49OKqkIR3TAaJaCh5K+W0a0LaVNSXzW0lFHamXDGGkPZZoiM3KgUFn6AuHW
 vYBw==
X-Gm-Message-State: AOAM533Mk2QEmxoroY6pIDeTdkSgebNYQrBwa6ZX+X02Zubp39D9cVDz
 a+XioMM/Ta/1APU4hre+I7YRnn4WAeNLdVVi4OUPu9kNJcahEo4GgQWbh8fLGFkXwVLhbALG9O/
 oZYGLkTGC0p/luxg=
X-Received: by 2002:adf:fecc:: with SMTP id q12mr2540996wrs.201.1644837116823; 
 Mon, 14 Feb 2022 03:11:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyqAuHNQlqh/nTJY7UiPhofyL6l8+tEUlZvvUgC+oEeaKaCpzcHDaJQhH1Kzi1pI2vBiEiTDw==
X-Received: by 2002:adf:fecc:: with SMTP id q12mr2540973wrs.201.1644837116521; 
 Mon, 14 Feb 2022 03:11:56 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id c8sm14086131wmq.39.2022.02.14.03.11.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 03:11:56 -0800 (PST)
Message-ID: <1bbfea98-584d-ed5a-568e-bc7b43122456@redhat.com>
Date: Mon, 14 Feb 2022 12:11:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 5/6] test-bdrv-drain.c: remove test_detach_by_parent_cb()
To: Kevin Wolf <kwolf@redhat.com>
References: <20220208153655.1251658-1-eesposit@redhat.com>
 <20220208153655.1251658-6-eesposit@redhat.com> <YgaDBkblIA6wu82p@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YgaDBkblIA6wu82p@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/02/2022 16:38, Kevin Wolf wrote:
> Am 08.02.2022 um 16:36 hat Emanuele Giuseppe Esposito geschrieben:
>> This test uses a callback of an I/O function (blk_aio_preadv)
>> to modify the graph, using bdrv_attach_child.
>> This is simply not allowed anymore. I/O cannot change the graph.
> 
> The callback of an I/O function isn't I/O, though. It is code _after_
> the I/O has completed. If this doesn't work any more, it feels like this
> is a bug.
> 
> I think it becomes a bit more obvious when you translate the AIO into
> the equivalent coroutine function:
> 
>     void coroutine_fn foo(...)
>     {
>         GLOBAL_STATE_CODE();
> 
>         blk_co_preadv(...);
>         detach_by_parent_aio_cb(...);
>     }
> 
> This is obviously correct code that must work. Calling an I/O function
> from a GS function is allowed, and of course the GS function may
> continue to do GS stuff after the I/O function returned.
> 
> (Actually, I'm not sure if it really works when blk is not in the main
> AioContext, but your API split patches claim that it does, so let's
> assume for the moment that this is already true :-))

Uhmm why does my split claims that it is? all blk_aio_* are IO_CODE.
Also, as you said, if blk is not in the main loop, the callback is not
GS either.

> 
>> Before "block/io.c: make bdrv_do_drained_begin_quiesce static
>> and introduce bdrv_drained_begin_no_poll", the test would simply
>> be at risk of failure, because if bdrv_replace_child_noperm()
>> (called to modify the graph) would call a drain,
>> then one callback of .drained_begin() is bdrv_do_drained_begin_quiesce,
>> that specifically asserts that we are not in a coroutine.
>>
>> Now that we fixed the behavior, the drain will invoke a bh in the
>> main loop, so we don't have such problem. However, this test is still
>> illegal and fails because we forbid graph changes from I/O paths.
>>
>> Once we add the required subtree_drains to protect
>> bdrv_replace_child_noperm(), the key problem in this test is in:
> 
> Probably a question for a different patch, but why is a subtree drain
> required instead of just a normal node drain? It feels like a bigger
> hammer than what is needed for replacing a single child.
> 
>> acb = blk_aio_preadv(blk, 0, &qiov, 0, detach_by_parent_aio_cb, NULL);
>> /* Drain and check the expected result */
>> bdrv_subtree_drained_begin(parent_b);
>>
>> because the detach_by_parent_aio_cb calls detach_indirect_bh(), that
>> modifies the graph and is invoked during bdrv_subtree_drained_begin().
>> The call stack is the following:
>> 1. blk_aio_preadv() creates a coroutine, increments in_flight counter
>> and enters the coroutine running blk_aio_read_entry()
>> 2. blk_aio_read_entry() performs the read and then schedules a bh to
>>    complete (blk_aio_complete)
>> 3. at this point, subtree_drained_begin() kicks in and waits for all
>>    in_flight requests, polling
>> 4. polling allows the bh to be scheduled, so blk_aio_complete runs
>> 5. blk_aio_complete *first* invokes the callback
>>    (detach_by_parent_aio_cb) and then decrements the in_flight counter
>> 6. Here we have the problem: detach_by_parent_aio_cb modifies the graph,
>>    so both bdrv_unref_child() and bdrv_attach_child() will have
>>    subtree_drains inside. And this causes a deadlock, because the
>>    nested drain will wait for in_flight counter to go to zero, which
>>    is only happening once the drain itself finishes.
> 
> So the problem has nothing to do with detach_by_parent_aio_cb() being
> an I/O function in the sense of locking rules (which it isn't), but with
> calling a drain operation while having the in_flight counter increased.
> 
> In other words, an AIO callback like detach_by_parent_aio_cb() must
> never call drain - and it doesn't before your changes to
> bdrv_replace_child_noperm() break it. How confident are we that this
> only breaks tests and not real code?
I am not sure. From a quick look, the AIO callback is really used pretty
much everywhere. Maybe we should really find a way to asseert
GLOBAL_STATE_CODE and friends?

> 
> Part of the problem is probably that drain is serving two slightly
> different purposes inside the block layer (just make sure that nothing
> touches the node any more) and callers outside of the block layer (make
> sure that everything has completed and no more callbacks will be
> called). This bug sits exactly in the difference between those two
> concepts - we're waiting for more than we would have to wait for, and it
> causes a deadlock in this combination.
> 
> I guess it could be fixed if BlockBackend accounted for requests that
> are already completed, but their callback hasn't yet. blk_drain() would
> then have to wait for those requests, but blk_root_drained_poll()
> wouldn't because these requests don't affect the root node any more.
> 
>> Different story is test_detach_by_driver_cb(): in this case,
>> detach_by_parent_aio_cb() does not call detach_indirect_bh(),
>> but it is instead called as a bh running in the main loop by
>> detach_by_driver_cb_drained_begin(), the callback for
>> .drained_begin().
>>
>> This test was added in 231281ab42 and part of the series
>> "Drain fixes and cleanups, part 3"
>> https://lists.nongnu.org/archive/html/qemu-block/2018-05/msg01132.html
>> but as explained above I believe that it is not valid anymore, and
>> can be discarded.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> 
> I feel throwing tests away just because they don't pass any more is a
> bit too simple. :-)

Well if the test is doing something it is not supposed to do, why not :)

And anyways this was obviously discussed in IRC with Paolo and somebody
else, can't remember who.

Emanuele
> 
> Kevin
> 


