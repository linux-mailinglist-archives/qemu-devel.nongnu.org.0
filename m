Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD214E2C41
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 16:29:06 +0100 (CET)
Received: from localhost ([::1]:60572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWJxw-00036O-QG
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 11:29:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nWJtR-0001JB-0E; Mon, 21 Mar 2022 11:24:25 -0400
Received: from smtp52.i.mail.ru ([94.100.177.112]:59986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nWJtM-0007xk-GP; Mon, 21 Mar 2022 11:24:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=vUkU3QY2wYxoDbSH6P8OcxYIo0VvisoSkmAofpI+qrM=; 
 t=1647876260;x=1648481660; 
 b=i0Sf1Am/YjdKcGv/O2ZFxR1vavsIH8Vo9xbMDBRUPqziMtDnFH8uoF6LVoNKkVITiBEDf9tCioNEwk9EarzXJUNy2hn8ZedIgDpGZwr6kmEco06R2kQhfNQfAkFPCoYqifkUZvxsPR1YOUMlmK+hB3/6q5CkUYv4m3SnHTQy2aYu4lVbmdl41O0pK5YDZA0dhzRqa9ez7GOERKnLKiBQYOzVXNRrGWxom0S/Dg0fb+RjPIJAltoBWkh6qcMqiwisQ30fN9UWMw1ajPUR1iMhE5rp1UmaZEgzxHx03Fiil+s+keabaCsxOPF8sVGDbI3x7tLRCrEViFHfrHa9aKoGIg==;
Received: by smtp52.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nWJtI-0004lk-J8; Mon, 21 Mar 2022 18:24:17 +0300
Message-ID: <ed62e9f7-051d-0405-f619-2c0f49f8c852@mail.ru>
Date: Mon, 21 Mar 2022 18:24:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 0/5] Removal of AioContext lock, bs->parents and
 ->children: proof of concept
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
References: <20220301142113.163174-1-eesposit@redhat.com>
 <516a480e-15a0-896f-6ff8-4303e110210e@virtuozzo.com>
 <f43e3499-fa70-f0ce-4daa-d62b5bb9819c@redhat.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <f43e3499-fa70-f0ce-4daa-d62b5bb9819c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp52.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD95C8DF32398C35CA640B06EEE757A11FFF4F198476F253530182A05F5380850404C228DA9ACA6FE274EDD8ECE64B9EF8E2686E43F0D6BF6FC13ADEEB4D17BBADF6BE62D0F7F190BFD
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7CF4D16325FBE1EEDEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637A431CDDF496E6E598638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D88352018CB5D16298D651C154DF060BAF6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7ECE82AE7387CF2AD9FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18C26CFBAC0749D213D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BAE9A1BBD95851C5BA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FCF85C6090AC60C6353AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F7900637A127B390D51FD6B1D81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F443EE4078611238157739F23D657EF2BB5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A5DA3E03FE5851049F87157B8BA20606B26C5914BFE9215AA7D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA7506FE1F977233B9BB410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D344F2126FF337FA651C77CF36381D7B17A7FA44EF7C1F93A4910C90D3FE289A1AE71F50A93517BC9C71D7E09C32AA3244C3489CE14267868CA7D94C6D7638CC4693C6EB905E3A8056B27AC49D2B05FCCD8
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojSLL0ldHQslZQ83bBSvsCwQ==
X-Mailru-Sender: 6C3E74F07C41AE94BE5520CD20DE4F15FDF18E5579725CD58CE1E4879A93BC8D758624742D437F80E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.112;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp52.i.mail.ru
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

09.03.2022 16:26, Emanuele Giuseppe Esposito wrote:
> 
> 
> Am 02/03/2022 um 12:07 schrieb Vladimir Sementsov-Ogievskiy:
>> 01.03.2022 17:21, Emanuele Giuseppe Esposito wrote:
>>> This serie tries to provide a proof of concept and a clear explanation
>>> on why we need to use drains (and more precisely subtree_drains)
>>> to replace the aiocontext lock, especially to protect BlockDriverState
>>> ->children and ->parent lists.
>>>
>>> Just a small recap on the key concepts:
>>> * We split block layer APIs in "global state" (GS), "I/O", and
>>> "global state or I/O".
>>>     GS are running in the main loop, under BQL, and are the only
>>>     one allowed to modify the BlockDriverState graph.
>>>
>>>     I/O APIs are thread safe and can run in any thread
>>>
>>>     "global state or I/O" are essentially all APIs that use
>>>     BDRV_POLL_WHILE. This is because there can be only 2 threads
>>>     that can use BDRV_POLL_WHILE: main loop and the iothread that
>>>     runs the aiocontext.
>>>
>>> * Drains allow the caller (either main loop or iothread running
>>> the context) to wait all in_flights requests and operations
>>> of a BDS: normal drains target a given node and is parents, while
>>> subtree ones also include the subgraph of the node. Siblings are
>>> not affected by any of these two kind of drains.
>>> After bdrv_drained_begin, no more request is allowed to come
>>> from the affected nodes. Therefore the only actor left working
>>> on a drained part of the graph should be the main loop.
>>>
>>> What do we intend to do
>>> -----------------------
>>> We want to remove the AioContext lock. It is not 100% clear on how
>>> many things we are protecting with it, and why.
>>> As a starter, we want to protect BlockDriverState ->parents and
>>> ->children lists, since they are read by main loop and I/O but
>>> only written by main loop under BQL. The function that modifies
>>> these lists is bdrv_replace_child_common().
>>>
>>> How do we want to do it
>>> -----------------------
>>> We individuated as ideal subtitute of AioContext lock
>>> the subtree_drain API. The reason is simple: draining prevents the
>>> iothread to read or write the nodes, so once the main loop finishes
>>
>> I'm not sure it's ideal. Unfortunately I'm not really good in all that
>> BQL, AioContext locks and drains. So, I can't give good advice. But here
>> are my doubts:
>>
>> Draining is very restrictive measure: even if drained section is very
>> short, at least on bdrv_drained_begin() we have to wait for all current
>> requests, and don't start new ones. That slows down the guest.
> 
> I don't think we are in a critical path where performance is important here.
> 
> In the
>> same time there are operations that don't require to stop guest IO
>> requests. For example manipulation with dirty bitmaps - qmp commands
>> block-dirty-bitmap-add block-dirty-bitmap-remove. Or different query
>> requests..
>>
> 
> Maybe you misunderstood or I was not 100% clear, but I am talking about replacing the AioContext lock for the ->parents and ->children instance. Not everywhere. This is the first step, and then we will see if the additional things that it protects can use drain or something else

Ok, if we are only about graph modification that's not a critical performance path.

> 
>   
>> I see only two real cases, where we do need drain:
>>
>> 1. When we need a consistent "point-in-time". For example, when we start
>> backup in transaction with some dirty-bitmap manipulation commands.
>>
>> 2. When we need to modify block-graph: if we are going to break relation
>> A -> B, there must not be any in-flight request that want to use this
>> relation.
> 
> That's the use case I am considering.
>>
>> All other operations, for which we want some kind of lock (like
>> AioContext lock or something) we actually don't want to stop guest IO.
> 
> Yes, they have to be analyzed case by case.
>>
>>
>> Next, I have a problem in mind, that in past lead to a lot of iotest 30
>> failures. Next there were different fixes and improvements, but the core
>> problem (as far as I understand) is still here: nothing protects us when
>> we are in some graph modification process (for example block-job
>> finalization) do yield, switch to other coroutine and enter another
>> graph modification process (for example, another block-job finaliztion)..
> 
> That's another point to consider. I don't really have a solution for this.
> 
>> (for details look at my old "[PATCH RFC 0/5] Fix accidental crash in
>> iotest 30"
>> https://lists.nongnu.org/archive/html/qemu-devel/2020-11/msg05290.html ,
>> where I suggested to add a global graph_modify_mutex CoMutex, to be held
>> during graph-modifying process that may yield)..
>> Does your proposal solve this problem?
>>
>>
>>> executing bdrv_drained_begin() on the interested graph, we are sure that
>>> the iothread is not going to look or even interfere with that part of
>>> the graph.
>>> We are also sure that the only two actors that can look at a specific
>>> BlockDriverState in any given context are the main loop and the
>>> iothread running the AioContext (ensured by "global state or IO" logic).
>>>
>>> Why use _subtree_ instead of normal drain
>>> -----------------------------------------
>>> A simple drain "blocks" a given node and all its parents.
>>> But it doesn't touch the child.
>>> This means that if we use a simple drain, a child can always
>>> keep processing requests, and eventually end up calling itself
>>> bdrv_drained_begin, ending up reading the parents node while the main
>>> loop
>>> is modifying them. Therefore a subtree drain is necessary.
>>
>> I'm not sure I understand.. Could you give a more concrete example of
>> what may happen if we use simple drain?
>> Who will call bdrv_drained_begin() you say about? Some IO path in
>> parallel thread? Do we really have an IO path that calls
>> bdrv_drained_begin()?
> 
> It is already being done in mirror, where it drains while running the .run() Job callback.
> 
> I made an unit test for this:
> https://gitlab.com/eesposit/qemu/-/commit/1ffd7193ed441020f51aeeb49c3b07edb6949760
> 
> assume that you have the following graph:
> 
> blk (blk) -> overlay (bs)
> overlay (bs) --- backed by ---> backing (bs)
> job1 (blockjob) --> backing
> 
> Then the main loop calls bdrv_drained_begin(overlay)
> This means overlay and bs are under drain, but backing and most importantly the job are not.
> At this point, the job run() function decides to drain. It should not be
> allowed to read overlay parents list for example, but instead there is nothing
> to prevent it from doing that, and thus we see drains_done >0.
> 
> On the other side, when we subtree_drain, also the job is drained and thus it goes in
> pause.
> 
> Makes sense?

Ah seems I understand what you mean.

One of my arguments is that "drain" - is not a lock against other clients who want to modify the graph. Because, drained section allows nested drained sections.

And you try to solve it, by draining more things, this way, we'll drain also the job, which is a possible client, who may want to modify the graph in parallel.

So, in other words, when we want to modify the graph, we drain the whole connectivity component of the graph. And we think that we are safe from other graph modifications because all related jobs are drained.
Interesting, is that possible that some not drained job from another connectivity component will want to connect some node from our drained component?

I just still feel that draining is a wrong mechanism to avoid interaction with other clients who want to modify the graph, because:

1. we stop the whole IO on all subgraph which is not necessary
2. draining is not a mutex, it allows nesting and it's ok when two different clients drain same nodes. Draining is just a requirement to do no IO at these nodes.

And in your way, it seems that to be absolutely safe we'll need to drain everything..

In my feeling it's better to keep draining what it is now: requirement to have no IO requests. And to isolate graph modifications from each other make a new synchronization mechanism, something like a global queue, where clients who want to get an access to graph modifications wait for their turn.

>>
>>>
>>> Possible scenarios
>>> -------------------
>>> Keeping in mind that we can only have an iothread and the main loop
>>> draining on a certain node, we could have:
>>>
>>> main loop successfully drains and then iothread tries to drain:
>>>     impossible scenario, as iothread is already stopped once main
>>>     successfully drains.
>>>
>>> iothread successfully drains and then main loop drains:
>>>     should not be a problem, as:
>>>     1) the iothread should be already "blocked" by its own drain
>>>     2) main loop would still wait for it to completely block
>>>     There is the issue of mirror overriding such scenario to avoid
>>>     having deadlocks, but that is handled in the next section.
>>>
>>> main loop and iothread try to drain together:
>>>     As above, this case doens't really matter. As long as
>>>     bdrv_drained_begin invariant is respected, the main loop will
>>>     continue only once the iothread is "blocked" on that part of the
>>> graph.
>>>
>>> A note on iothread draining
>>> ---------------------------
>>> Theoretically draining from an iothread should not be possible,
>>> as the iothread would be scheduling a bh in the main loop waiting
>>> for itself to stop, even though it is not yet stopped since it is
>>> waiting for the bh.
>>>
>>> This is what would happen in the tests in patch 5 if .drained_poll
>>> was not implemented.
>>>
>>> Therefore, one solution is to use .drained_poll callback in
>>> BlockJobDriver.
>>> This callback overrides the default job poll() behavior, and
>>> allows the polling condition to stop waiting for the job.
>>> It is actually used only in mirror.
>>> This however breaks bdrv_drained_begin invariant, because the
>>> iothread is not really blocked on that node but continues running.
>>> In order to fix this, patch 4 allows the polling condition to be
>>> used only by the iothread, and not the main loop too, preventing
>>> the drain to return before the iothread is effectively stopped.
>>> This is also shown in the tests in patch 5. If the fix in patch
>>> 4 is removed, then the main loop drain will return earlier and
>>> allow the iothread to run and drain together.
>>>
>>> The other patches in this serie are cherry-picked from the various
>>> series I already sent, and are included here just to allow
>>> subtree_drained_begin/end_unlocked implementation.
>>>
>>> Emanuele Giuseppe Esposito (5):
>>>     aio-wait.h: introduce AIO_WAIT_WHILE_UNLOCKED
>>>     introduce BDRV_POLL_WHILE_UNLOCKED
>>>     block/io.c: introduce bdrv_subtree_drained_{begin/end}_unlocked
>>>     child_job_drained_poll: override polling condition only when in home
>>>       thread
>>>     test-bdrv-drain: ensure draining from main loop stops iothreads
>>>
>>>    block/io.c                   |  48 ++++++--
>>>    blockjob.c                   |   3 +-
>>>    include/block/aio-wait.h     |  15 ++-
>>>    include/block/block.h        |   7 ++
>>>    tests/unit/test-bdrv-drain.c | 218 +++++++++++++++++++++++++++++++++++
>>>    5 files changed, 274 insertions(+), 17 deletions(-)
>>>
>>
>>
> 


-- 
Best regards,
Vladimir

