Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 340005338A7
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 10:39:07 +0200 (CEST)
Received: from localhost ([::1]:50796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntmXq-00023p-0w
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 04:39:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ntmMs-000511-F5
 for qemu-devel@nongnu.org; Wed, 25 May 2022 04:27:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ntmMo-0005ja-Bq
 for qemu-devel@nongnu.org; Wed, 25 May 2022 04:27:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653467261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tSIgtYQ4zIs8B8CpF4hdsCCbDsdbSBIEzuBq3M7402I=;
 b=J6w94NhaMYuhgClKhLQIqkJ/SMgj8xhhQS2A4PZ+ssszd9lX34ColV95ifYSfKC9jlh4fm
 LqZqmYZr5UP81cLKEscUaGya+rnpt4UMvp9M6SWGG8nEkxy9sSgLFsakHPlVcI+dJqptTD
 AtUuarUefrgkfNwjcVwCRG6ykT1klRY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-505-5WS1v9ivMI2Lf8HxiBmV5w-1; Wed, 25 May 2022 04:27:39 -0400
X-MC-Unique: 5WS1v9ivMI2Lf8HxiBmV5w-1
Received: by mail-wr1-f69.google.com with SMTP id
 l14-20020a05600012ce00b0020d06e7152cso5392765wrx.11
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 01:27:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tSIgtYQ4zIs8B8CpF4hdsCCbDsdbSBIEzuBq3M7402I=;
 b=SIyeAcP3UWX2lYe6vTDc0d5gz6uh4l7DqeGmftu0WwE0cpkMoJ/C98v2F8ai5eLNU3
 oBfzfGbdCiPoeka0+hUt4i4C7jLYzOoTbmdW2AKK5oaHjldJflqh+dXuKvhARX+DZRmQ
 0JkZ4L9GPIU/JMhWswh6SEuKo7hi8PXwZe9SfKenuzf9SR2lkD9Oyv3DhMV3DA3p8HBN
 pKHFGW364BCkwp03PBCk4fgRUk2TQAeXYF+/FfU79oS/Nl/SWxAOwNuteLjX7lYL2nBP
 sn6xYW/MG4EC5LHUvRn9kWA/JpPp4mXn7GQJPxMUFcYDN4/a1blgBMiHWOB9zfGGiTab
 453Q==
X-Gm-Message-State: AOAM530ezlBEIZbTX+4mhJ/KDX+88jURZb9cJ663T7tUbc2N3T9I4UiV
 y+jjudh1ws7LS4csqCNQP9flOStPwc2wYZVrabAXENDYaeBBFra9nyl0IFxOM1gsJDlIX4iuKEu
 haY3nTJ1AdlYoI6s=
X-Received: by 2002:a05:600c:4311:b0:397:4c1f:9f54 with SMTP id
 p17-20020a05600c431100b003974c1f9f54mr6996860wme.32.1653467256909; 
 Wed, 25 May 2022 01:27:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyB6AZB+/GlpEd3Av6Z39lo7I5tNKM3l7sOvl8LrNqJXNW7WMdTbRDxY6hdqTJxtnC/MtmPtQ==
X-Received: by 2002:a05:600c:4311:b0:397:4c1f:9f54 with SMTP id
 p17-20020a05600c431100b003974c1f9f54mr6996823wme.32.1653467256361; 
 Wed, 25 May 2022 01:27:36 -0700 (PDT)
Received: from [192.168.149.183]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a1c3b06000000b0039456fb80b3sm479253wma.43.2022.05.25.01.27.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 May 2022 01:27:35 -0700 (PDT)
Message-ID: <98027e36-a8a2-e679-4018-c01e08cf124d@redhat.com>
Date: Wed, 25 May 2022 10:27:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH v2 0/8] Removal of AioContext lock, bs->parents and
 ->children: new rwlock
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220426085114.199647-1-eesposit@redhat.com>
 <YnKB+SP678gNrAb1@stefanha-x1.localdomain>
 <YoN/935E4MfinZFQ@stefanha-x1.localdomain>
 <cc5e12d1-d25f-d338-bff2-0d3f5cc0def7@redhat.com>
 <YozLHPif/jCmOfei@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YozLHPif/jCmOfei@redhat.com>
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
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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



Am 24/05/2022 um 14:10 schrieb Kevin Wolf:
> Am 18.05.2022 um 14:28 hat Emanuele Giuseppe Esposito geschrieben:
>> label: // read till the end to see why I wrote this here
>>
>> I was hoping someone from the "No" party would answer to your question,
>> because as you know we reached this same conclusion together.
>>
>> We thought about dropping the drain for various reasons, the main one
>> (at least as far as I understood) is that we are not sure if something
>> can still happen in between drain_begin/end, and it is a little bit
>> confusing to use the same mechanism to block I/O and protect the graph.
>>
>> We then thought about implementing a rwlock. A rdlock would clarify what
>> we are protecting and who is using the lock. I had a rwlock draft
>> implementation sent in this thread, but this also lead to additional
>> problems.
>> Main problem was that this new lock would introduce nested event loops,
>> that together with such locking would just create deadlocks.
>> If readers are in coroutines and writers are not (because graph
>> operations are not running in coroutines), we have a lot of deadlocks.
>> If a writer has to take the lock, it must wait all other readers to
>> finish. And it does it by internally calling AIO_WAIT_WHILE, creating
>> nested event loop. We don't know what could execute when polling for
>> events, and for example another writer could be resumed.
> 
> Why is this a problem? Your AIO_WAIT_WHILE() condition would be that
> there are neither readers nor writers, so you would just keep waiting
> until the other writer is done.

Yes, but when we get to the AIO_WAIT_WHILE() condition the wrlock is
already being taken in the current writer.
I think that's what you also mean below.

> 
>> Ideally, we want writers in coroutines too.
>>
>> Additionally, many readers are running in what we call "mixed"
>> functions: usually implemented automatically with generated_co_wrapper
>> tag, they let a function (usually bdrv callback) run always in a
>> coroutine, creating one if necessary. For example, bdrv_flush() makes
>> sure hat bs->bdrv_co_flush() is always run in a coroutine.
>> Such mixed functions are used in other callbacks too, making it really
>> difficult to understand if we are in a coroutine or not, and mostly
>> important make rwlock usage very difficult.
> 
> How do they make rwlock usage difficult?
> 
> *goes back to old IRC discussions*
> 
> Ah, the problem was not the AIO_WAIT_WHILE() while taking the lock, but
> taking the lock first and then running an AIO_WAIT_WHILE() inside the
> locked section. This is forbidden because the callbacks that run during
> AIO_WAIT_WHILE() may in turn wait for the lock that you own, causing a
> deadlock.
> 

Yes

> This is indeed a problem that running in coroutines would avoid because
> the inner waiter would just yield and the outer one could complete its
> job as soon as it's its turn.
> 
> My conclusion in the IRC discussion was that maybe we need to take the
> graph locks when we're entering coroutine context, i.e. the "mixed"
> functions would rdlock the graph when called from non-coroutine context
> and would assume that it's already locked when called from coroutine
> context.

Yes, and that's what I tried to do.
But the first step was to transform all callbacks as coroutines. I think
you also agree with this, correct?

And therefore the easiest step was to convert all callbacks in
generated_co_wrapper functions, so that afterwards we could split them
between coroutine and not-coroutine logic, as discussed on IRC.
Once split, we add the lock in the way you suggested.

However, I didn't even get to the first step part, because tests were
deadlocking after just transforming 2-3 callbacks.

See Paolo thread for a nice explanation on why they are deadlocking and
converting these callbacks is difficult.

> 
>> Which lead us to stepping back once more and try to convert all
>> BlockDriverState callbacks in coroutines. This would greatly simplify
>> rwlock usage, because we could make the rwlock coroutine-frendly
>> (without any AIO_WAIT_WHILE, allowing a writer to wait for readers by
>> just yielding and queuing itself in coroutine queues).
>>
>> First step was then to convert all callbacks in coroutines, using
>> generated_coroutine_wrapper (g_c_w).
>> A typical g_c_w is implemented in this way:
>> 	if (qemu_in_coroutine()) {
>> 		callback();
>> 	} else { // much simplified
>> 		co = qemu_coroutine_create(callback);
>> 		bdrv_coroutine_enter(bs, co);
>> 		BDRV_POLL_WHILE(bs, coroutine_in_progress);
>> 	}
>> Once all callbacks are implemented using g_c_w, we can start splitting
>> the two sides of the if function to only create a coroutine when we are
>> outside from a bdrv callback.
>>
>> However, we immediately found a problem while starting to convert the
>> first callbacks: the AioContext lock is taken around some non coroutine
>> callbacks! For example, bs->bdrv_open() is always called with the
>> AioContext lock taken. In addition, callbacks like bdrv_open are
>> graph-modifying functions, which is probably why we are taking the
>> Aiocontext lock, and they do not like to run in coroutines.
>> Anyways, the real problem comes when we create a coroutine in such
>> places where the AioContext lock is taken and we have a graph-modifying
>> function.
>>
>> bdrv_coroutine_enter() calls aio_co_enter(), which in turns first checks
>>  if the coroutine is entering another context from the current (which is
>> not the case for open) and if we are already in coroutine (for sure
>> not). Therefore it resorts to the following calls;
>> 	aio_context_acquire(ctx);
>>         qemu_aio_coroutine_enter(ctx, co);
>>         aio_context_release(ctx);
>> Which is clearly a problem, because we are taking the lock twice: once
>> from the original caller of the callback, and once here due to the
>> coroutine. This creates a lot of deadlock situations.
> 
> What are the deadlock situations that are created by locking twice?

Scratch this, and refer to Paolo's thread.

> 
> The only problem I'm aware of is AIO_WAIT_WHILE(), which wants to
> temporarily unlock the AioContext It calls aio_context_release() once to
> achieve this, which obviously isn't enough when the context was locked
> twice.
> 
> But AIO_WAIT_WHILE() isn't allowed in coroutines anyway. So how are we
> running into deadlocks here?
> 
> Note that we're probably already doing this inside the .bdrv_open
> implementations: They will ususally read something from the image file,
> calling bdrv_preadv() which is already a generated_coroutine_wrapper
> today and creates a coroutine internally with the same locking pattern
> applied that you describe as problematic here.
> 
> Making .bdrv_open itself a generated_coroutine_wrapper wouldn't really
> change anything fundamental, it would just pull the existing mechanism
> one function higher in the call stack.
> 
>> For example, all callers of bdrv_open() always take the AioContext lock.
>> Often it is taken very high in the call stack, but it's always taken.
>>
>> Getting rid of the lock around qemu_aio_coroutine_enter() is difficult
>> too, because coroutines expect to have the lock taken. For example, if
>> we want to drain from a coroutine, bdrv_co_yield_to_drain releases the
>> lock for us.
> 
> It's not difficult at all in your case where you know that you're
> already in the right thread and the lock is taken: You can call
> qemu_aio_coroutine_enter() directly instead of bdrv_coroutine_enter() in
> this case.
> 
> But as I said, I'm not sure why we need to get rid of it at all.
> 
> Kevin
> 


