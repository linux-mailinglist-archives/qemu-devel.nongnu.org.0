Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FF24D2FE8
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 14:28:55 +0100 (CET)
Received: from localhost ([::1]:36488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRwN4-0006Kh-I2
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 08:28:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nRwL2-0005Gk-0x
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 08:26:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nRwKw-000488-ND
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 08:26:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646832393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fsXlJneTkYE5GhpmWHPtk3Wab7/qKJ1NHgZTAV7D7kc=;
 b=brGaH8VGBD4Lr67gpODMmDBLeybetybsq5BP8DJ+Op5K+12kkqlxy3kmAkwgYACwnRgfu9
 yClWgZdqJdy4ctmrnLXpxHCjYAlf+SqB8kRif7MxuX1AHxkiyg5m3fUchiqDiE5SF28DWg
 AUpEFmi9aIdpevXUlKhYC5WD6xQ7J8I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-277-qlVTVGjaNsyvUYZ0SFopsw-1; Wed, 09 Mar 2022 08:26:32 -0500
X-MC-Unique: qlVTVGjaNsyvUYZ0SFopsw-1
Received: by mail-wr1-f72.google.com with SMTP id
 t15-20020a5d534f000000b001f1e5759cebso765262wrv.7
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 05:26:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fsXlJneTkYE5GhpmWHPtk3Wab7/qKJ1NHgZTAV7D7kc=;
 b=rM80JnjGsEibLHDuIoOCXkgW8ENBPoahQzXV6eoCE+qaSWMra7b1tAWtjoWBCEMios
 5Us2Qg386l+JBAswCxnRAd02wmmGnycUoza3Q70782TGE9V7PH5RsLOHGRNORoPDjee9
 RzfiHnwYwxMlWgr9OUfPB/uNOa/4fTEYar4yhtHohLBdpEz9jrJYrfWDWhH5viqoGMS7
 S3/wMRvYN4ztth9dCdc1YpnbrQ08vRGPXNRAB8MIgcnbYECy1jTL2hA83YMzsHCW03q4
 S2UoeDxFbyqRM8+FJXFoeD//NYCUM+FeRpP5P9OgarpbcCgRjyIBWs9vn2SaDTSS2Dip
 yylQ==
X-Gm-Message-State: AOAM531A2fkn2E7h5XLqLudtpzC4khOV3zZZMiIJdlLGchuivwzl4bKO
 gjwB2Rd6MIzVnZiJY4ctmTnXVvK0nXaLpy14GsUOSppQRT/8xjk477o8HfLOsNTT/JulFezJjGq
 qMsjxjBTN8VkEC3o=
X-Received: by 2002:a5d:4310:0:b0:1ef:fb60:e1d8 with SMTP id
 h16-20020a5d4310000000b001effb60e1d8mr15701701wrq.92.1646832391107; 
 Wed, 09 Mar 2022 05:26:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzZxkNTh/mUsJmSlfv86bGp0TJPt4CXF+/nhE/ewtPp0aLcxF3Yh8KPXC48dgashGA26iELdg==
X-Received: by 2002:a5d:4310:0:b0:1ef:fb60:e1d8 with SMTP id
 h16-20020a5d4310000000b001effb60e1d8mr15701665wrq.92.1646832390645; 
 Wed, 09 Mar 2022 05:26:30 -0800 (PST)
Received: from [192.168.149.119]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 i74-20020adf90d0000000b0020373ba7beesm2624397wri.0.2022.03.09.05.26.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 05:26:30 -0800 (PST)
Message-ID: <af53599c-c7de-d2b8-00fa-0e7d28121251@redhat.com>
Date: Wed, 9 Mar 2022 14:26:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH 0/5] Removal of AioContext lock, bs->parents and
 ->children: proof of concept
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20220301142113.163174-1-eesposit@redhat.com>
 <Yh89L8gT46MbSJCQ@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <Yh89L8gT46MbSJCQ@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 02/03/2022 um 10:47 schrieb Stefan Hajnoczi:
> On Tue, Mar 01, 2022 at 09:21:08AM -0500, Emanuele Giuseppe Esposito wrote:
>> This serie tries to provide a proof of concept and a clear explanation
>> on why we need to use drains (and more precisely subtree_drains)
>> to replace the aiocontext lock, especially to protect BlockDriverState
>> ->children and ->parent lists.
>>
>> Just a small recap on the key concepts:
>> * We split block layer APIs in "global state" (GS), "I/O", and
>> "global state or I/O".
>>   GS are running in the main loop, under BQL, and are the only
>>   one allowed to modify the BlockDriverState graph.
>>
>>   I/O APIs are thread safe and can run in any thread
>>
>>   "global state or I/O" are essentially all APIs that use
>>   BDRV_POLL_WHILE. This is because there can be only 2 threads
>>   that can use BDRV_POLL_WHILE: main loop and the iothread that
>>   runs the aiocontext.
>>
>> * Drains allow the caller (either main loop or iothread running
>> the context) to wait all in_flights requests and operations
>> of a BDS: normal drains target a given node and is parents, while
>> subtree ones also include the subgraph of the node. Siblings are
>> not affected by any of these two kind of drains.
> 
> Siblings are drained to the extent required for their parent node to
> reach in_flight == 0.
> 
> I haven't checked the code but I guess the case you're alluding to is
> that siblings with multiple parents could have other I/O in flight that
> will not be drained and further I/O can be submitted after the parent
> has drained?

Yes, this in theory can happen. I don't really know if this happens
practically, and how likely is to happen.

The alternative would be to make a drain that blocks the whole graph,
siblings included, but that would probably be an overkill.

> 
>> After bdrv_drained_begin, no more request is allowed to come
>> from the affected nodes. Therefore the only actor left working
>> on a drained part of the graph should be the main loop.
> 
> It's worth remembering that this invariant is not enforced. Draining is
> a cooperative scheme. Everything *should* be notified and stop
> submitting I/O, but there is no assertion or return -EBUSY if a request
> is submitted while the BDS is drained.

Yes, it is a cooperative scheme and all except from mirror (fixed in the
last patch) seem to follow the invariant.
> 
> If the thread that drained the BDS wants, I think it can (legally)
> submit I/O within the drained section.
> 

Yes but at some point the main loop drains too before changing the
graph. Then the thread must be stopped, according with the invariant
above. So it doesn't matter if the thread has already drained or not.

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
>> the subtree_drain API. The reason is simple: draining prevents the iothread to read or write the nodes, so once the main loop finishes
>> executing bdrv_drained_begin() on the interested graph, we are sure that
>> the iothread is not going to look or even interfere with that part of the graph.
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
>> bdrv_drained_begin, ending up reading the parents node while the main loop
>> is modifying them. Therefore a subtree drain is necessary.
>>
>> Possible scenarios
>> -------------------
>> Keeping in mind that we can only have an iothread and the main loop
>> draining on a certain node, we could have:
>>
>> main loop successfully drains and then iothread tries to drain:
>>   impossible scenario, as iothread is already stopped once main
>>   successfully drains.
>>
>> iothread successfully drains and then main loop drains:
>>   should not be a problem, as:
>>   1) the iothread should be already "blocked" by its own drain
> 
> Once drained_begin() returns in the IOThread, the IOThread can do
> anything it wants, including more submitting I/O. I don't consider that
> "blocked", so I'm not sure what this sentence means?
> 
> The way the main loop thread protects itself against the IOThread is via
> the aio "external" handler concept and block job drain callbacks, which
> are activated by drained_begin(). They ensure that the IOThread will not
> perform further processing that submits I/O, but the IOThread code that
> invoked drained_begin() can still do anything it wants.

As above I think that regardless on what the iothread is doing, once the
main loop has finished executing bdrv_drained_begin the iothread should
not be doing anything related to the nodes that have been drained.

> 
>>   2) main loop would still wait for it to completely block
>>   There is the issue of mirror overriding such scenario to avoid
>>   having deadlocks, but that is handled in the next section.
>>
>> main loop and iothread try to drain together:
>>   As above, this case doens't really matter. As long as
>>   bdrv_drained_begin invariant is respected, the main loop will
>>   continue only once the iothread is "blocked" on that part of the graph.
> 
> I'm not sure about this, see above.
> 
>>
>> A note on iothread draining
>> ---------------------------
>> Theoretically draining from an iothread should not be possible,
>> as the iothread would be scheduling a bh in the main loop waiting
>> for itself to stop, even though it is not yet stopped since it is waiting for the bh.
> 
> I'm not sure what you mean. Which function schedules this BH?
bdrv_drained_begin and _end schedule a bh to run the draining code in
the main loop, if they are in a coroutine. That's what I meant here :)
> 
>>
>> This is what would happen in the tests in patch 5 if .drained_poll
>> was not implemented.
>>
>> Therefore, one solution is to use .drained_poll callback in BlockJobDriver.
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
>>   aio-wait.h: introduce AIO_WAIT_WHILE_UNLOCKED
>>   introduce BDRV_POLL_WHILE_UNLOCKED
>>   block/io.c: introduce bdrv_subtree_drained_{begin/end}_unlocked
>>   child_job_drained_poll: override polling condition only when in home
>>     thread
>>   test-bdrv-drain: ensure draining from main loop stops iothreads
>>
>>  block/io.c                   |  48 ++++++--
>>  blockjob.c                   |   3 +-
>>  include/block/aio-wait.h     |  15 ++-
>>  include/block/block.h        |   7 ++
>>  tests/unit/test-bdrv-drain.c | 218 +++++++++++++++++++++++++++++++++++
>>  5 files changed, 274 insertions(+), 17 deletions(-)
>>
>> -- 
>> 2.31.1
>>


