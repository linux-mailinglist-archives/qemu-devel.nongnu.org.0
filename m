Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 198764D2FEE
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 14:31:28 +0100 (CET)
Received: from localhost ([::1]:38644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRwPX-0007pE-7N
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 08:31:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nRwL2-0005HM-2u
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 08:26:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nRwKw-00048X-NP
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 08:26:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646832399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H7HQGpW00rjnp7f2870RDU4xF8k/gEdE9I8CjVvpbBE=;
 b=TNIMGwSp7WHicrW90GXp6i/01K5Ji4L3NGfm4l4yTUG0THu/dWH1m84OtFV7QTHq+X9zLV
 OIrNTOSF8/mgnPceM0Xd6lo2AAneFczwqhDCKjp3QDqdp4LODzzak5lRP/wwGLK88/GlUj
 ZXmReRac9FNQ1fhjLugtL21Q3KHbT4k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-395-sZxROC2rNd-xrtRCy3brzA-1; Wed, 09 Mar 2022 08:26:37 -0500
X-MC-Unique: sZxROC2rNd-xrtRCy3brzA-1
Received: by mail-wr1-f71.google.com with SMTP id
 a11-20020adffb8b000000b001efe754a488so760935wrr.13
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 05:26:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=H7HQGpW00rjnp7f2870RDU4xF8k/gEdE9I8CjVvpbBE=;
 b=gxdYyppSyF7r6BRv8/R5//JlhckaLmCRL6lF+4PLKRFlxw9L7mqovmOUacwCIixlmk
 WH/5j9NWISWXW+d6nQzFzAE/iTPgyuURhxDO5wX3OihvM+JQs+5oCeP67sj5HVASKnIO
 A8quI1QuYH5HTdalB4ZMbvKccELI+gvPovsw1q2nPmow9aYnLubBrryqWSREPAvCh86c
 OZ4RdPi71moUKvO0/K5tmydigoLp5NTX0DL+0nJ8sn1tRJTj6hZNeweq23RKwqzX9m2z
 m3ZmZXb9eLUl8FPJWu8QhhGGkvcgggcy2RYzXN6StbAxBNfhWs2tiKKhVCNILCg9Pqc2
 v3Yg==
X-Gm-Message-State: AOAM533dssJRhJK+qtdtGGuhM5CV2Yud3OzsCXdtVko5lFHsxtdEMpy7
 KTvlN60yKuSDbBtV2FP3ypPXzf2+dxKx2PWK1O0p2U4FJKkanJh1ZMOamB7kH+vMICvFmj4Mb//
 va6oClMZ9GyNVGL8=
X-Received: by 2002:a5d:59ae:0:b0:1f0:474c:d995 with SMTP id
 p14-20020a5d59ae000000b001f0474cd995mr15489862wrr.217.1646832396554; 
 Wed, 09 Mar 2022 05:26:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzaWcMu6HIaoDfUgBUyxWfSbuq3w1u/P16HLZ8fSUnTMssFoNogN5xjPVyRnKtrHmkTOoFBXg==
X-Received: by 2002:a5d:59ae:0:b0:1f0:474c:d995 with SMTP id
 p14-20020a5d59ae000000b001f0474cd995mr15489832wrr.217.1646832396216; 
 Wed, 09 Mar 2022 05:26:36 -0800 (PST)
Received: from [192.168.149.119]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a7bc1ca000000b00389bc87db45sm1733810wmj.7.2022.03.09.05.26.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 05:26:35 -0800 (PST)
Message-ID: <f43e3499-fa70-f0ce-4daa-d62b5bb9819c@redhat.com>
Date: Wed, 9 Mar 2022 14:26:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH 0/5] Removal of AioContext lock, bs->parents and
 ->children: proof of concept
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20220301142113.163174-1-eesposit@redhat.com>
 <516a480e-15a0-896f-6ff8-4303e110210e@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <516a480e-15a0-896f-6ff8-4303e110210e@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 02/03/2022 um 12:07 schrieb Vladimir Sementsov-Ogievskiy:
> 01.03.2022 17:21, Emanuele Giuseppe Esposito wrote:
>> This serie tries to provide a proof of concept and a clear explanation
>> on why we need to use drains (and more precisely subtree_drains)
>> to replace the aiocontext lock, especially to protect BlockDriverState
>> ->children and ->parent lists.
>>
>> Just a small recap on the key concepts:
>> * We split block layer APIs in "global state" (GS), "I/O", and
>> "global state or I/O".
>>    GS are running in the main loop, under BQL, and are the only
>>    one allowed to modify the BlockDriverState graph.
>>
>>    I/O APIs are thread safe and can run in any thread
>>
>>    "global state or I/O" are essentially all APIs that use
>>    BDRV_POLL_WHILE. This is because there can be only 2 threads
>>    that can use BDRV_POLL_WHILE: main loop and the iothread that
>>    runs the aiocontext.
>>
>> * Drains allow the caller (either main loop or iothread running
>> the context) to wait all in_flights requests and operations
>> of a BDS: normal drains target a given node and is parents, while
>> subtree ones also include the subgraph of the node. Siblings are
>> not affected by any of these two kind of drains.
>> After bdrv_drained_begin, no more request is allowed to come
>> from the affected nodes. Therefore the only actor left working
>> on a drained part of the graph should be the main loop.
>>
>> What do we intend to do
>> -----------------------
>> We want to remove the AioContext lock. It is not 100% clear on how
>> many things we are protecting with it, and why.
>> As a starter, we want to protect BlockDriverState ->parents and
>> ->children lists, since they are read by main loop and I/O but
>> only written by main loop under BQL. The function that modifies
>> these lists is bdrv_replace_child_common().
>>
>> How do we want to do it
>> -----------------------
>> We individuated as ideal subtitute of AioContext lock
>> the subtree_drain API. The reason is simple: draining prevents the
>> iothread to read or write the nodes, so once the main loop finishes
> 
> I'm not sure it's ideal. Unfortunately I'm not really good in all that
> BQL, AioContext locks and drains. So, I can't give good advice. But here
> are my doubts:
> 
> Draining is very restrictive measure: even if drained section is very
> short, at least on bdrv_drained_begin() we have to wait for all current
> requests, and don't start new ones. That slows down the guest. 

I don't think we are in a critical path where performance is important here.

In the
> same time there are operations that don't require to stop guest IO
> requests. For example manipulation with dirty bitmaps - qmp commands
> block-dirty-bitmap-add block-dirty-bitmap-remove. Or different query
> requests..
>

Maybe you misunderstood or I was not 100% clear, but I am talking about replacing the AioContext lock for the ->parents and ->children instance. Not everywhere. This is the first step, and then we will see if the additional things that it protects can use drain or something else

 
> I see only two real cases, where we do need drain:
> 
> 1. When we need a consistent "point-in-time". For example, when we start
> backup in transaction with some dirty-bitmap manipulation commands.
> 
> 2. When we need to modify block-graph: if we are going to break relation
> A -> B, there must not be any in-flight request that want to use this
> relation.

That's the use case I am considering.
> 
> All other operations, for which we want some kind of lock (like
> AioContext lock or something) we actually don't want to stop guest IO.

Yes, they have to be analyzed case by case.
> 
> 
> Next, I have a problem in mind, that in past lead to a lot of iotest 30
> failures. Next there were different fixes and improvements, but the core
> problem (as far as I understand) is still here: nothing protects us when
> we are in some graph modification process (for example block-job
> finalization) do yield, switch to other coroutine and enter another
> graph modification process (for example, another block-job finaliztion)..

That's another point to consider. I don't really have a solution for this.

> (for details look at my old "[PATCH RFC 0/5] Fix accidental crash in
> iotest 30" 
> https://lists.nongnu.org/archive/html/qemu-devel/2020-11/msg05290.html ,
> where I suggested to add a global graph_modify_mutex CoMutex, to be held
> during graph-modifying process that may yield)..
> Does your proposal solve this problem?
> 
> 
>> executing bdrv_drained_begin() on the interested graph, we are sure that
>> the iothread is not going to look or even interfere with that part of
>> the graph.
>> We are also sure that the only two actors that can look at a specific
>> BlockDriverState in any given context are the main loop and the
>> iothread running the AioContext (ensured by "global state or IO" logic).
>>
>> Why use _subtree_ instead of normal drain
>> -----------------------------------------
>> A simple drain "blocks" a given node and all its parents.
>> But it doesn't touch the child.
>> This means that if we use a simple drain, a child can always
>> keep processing requests, and eventually end up calling itself
>> bdrv_drained_begin, ending up reading the parents node while the main
>> loop
>> is modifying them. Therefore a subtree drain is necessary.
> 
> I'm not sure I understand.. Could you give a more concrete example of
> what may happen if we use simple drain?
> Who will call bdrv_drained_begin() you say about? Some IO path in
> parallel thread? Do we really have an IO path that calls
> bdrv_drained_begin()?

It is already being done in mirror, where it drains while running the .run() Job callback.

I made an unit test for this:
https://gitlab.com/eesposit/qemu/-/commit/1ffd7193ed441020f51aeeb49c3b07edb6949760

assume that you have the following graph:

blk (blk) -> overlay (bs)
overlay (bs) --- backed by ---> backing (bs) 
job1 (blockjob) --> backing

Then the main loop calls bdrv_drained_begin(overlay)
This means overlay and bs are under drain, but backing and most importantly the job are not.
At this point, the job run() function decides to drain. It should not be
allowed to read overlay parents list for example, but instead there is nothing
to prevent it from doing that, and thus we see drains_done >0.

On the other side, when we subtree_drain, also the job is drained and thus it goes in
pause.

Makes sense?
> 
>>
>> Possible scenarios
>> -------------------
>> Keeping in mind that we can only have an iothread and the main loop
>> draining on a certain node, we could have:
>>
>> main loop successfully drains and then iothread tries to drain:
>>    impossible scenario, as iothread is already stopped once main
>>    successfully drains.
>>
>> iothread successfully drains and then main loop drains:
>>    should not be a problem, as:
>>    1) the iothread should be already "blocked" by its own drain
>>    2) main loop would still wait for it to completely block
>>    There is the issue of mirror overriding such scenario to avoid
>>    having deadlocks, but that is handled in the next section.
>>
>> main loop and iothread try to drain together:
>>    As above, this case doens't really matter. As long as
>>    bdrv_drained_begin invariant is respected, the main loop will
>>    continue only once the iothread is "blocked" on that part of the
>> graph.
>>
>> A note on iothread draining
>> ---------------------------
>> Theoretically draining from an iothread should not be possible,
>> as the iothread would be scheduling a bh in the main loop waiting
>> for itself to stop, even though it is not yet stopped since it is
>> waiting for the bh.
>>
>> This is what would happen in the tests in patch 5 if .drained_poll
>> was not implemented.
>>
>> Therefore, one solution is to use .drained_poll callback in
>> BlockJobDriver.
>> This callback overrides the default job poll() behavior, and
>> allows the polling condition to stop waiting for the job.
>> It is actually used only in mirror.
>> This however breaks bdrv_drained_begin invariant, because the
>> iothread is not really blocked on that node but continues running.
>> In order to fix this, patch 4 allows the polling condition to be
>> used only by the iothread, and not the main loop too, preventing
>> the drain to return before the iothread is effectively stopped.
>> This is also shown in the tests in patch 5. If the fix in patch
>> 4 is removed, then the main loop drain will return earlier and
>> allow the iothread to run and drain together.
>>
>> The other patches in this serie are cherry-picked from the various
>> series I already sent, and are included here just to allow
>> subtree_drained_begin/end_unlocked implementation.
>>
>> Emanuele Giuseppe Esposito (5):
>>    aio-wait.h: introduce AIO_WAIT_WHILE_UNLOCKED
>>    introduce BDRV_POLL_WHILE_UNLOCKED
>>    block/io.c: introduce bdrv_subtree_drained_{begin/end}_unlocked
>>    child_job_drained_poll: override polling condition only when in home
>>      thread
>>    test-bdrv-drain: ensure draining from main loop stops iothreads
>>
>>   block/io.c                   |  48 ++++++--
>>   blockjob.c                   |   3 +-
>>   include/block/aio-wait.h     |  15 ++-
>>   include/block/block.h        |   7 ++
>>   tests/unit/test-bdrv-drain.c | 218 +++++++++++++++++++++++++++++++++++
>>   5 files changed, 274 insertions(+), 17 deletions(-)
>>
> 
> 


