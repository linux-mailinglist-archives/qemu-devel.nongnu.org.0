Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F02994E2CE8
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 16:53:30 +0100 (CET)
Received: from localhost ([::1]:45422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWKLa-00069a-0N
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 11:53:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nWKDN-0003RG-8V; Mon, 21 Mar 2022 11:45:01 -0400
Received: from smtp49.i.mail.ru ([94.100.177.109]:41846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nWKDK-0000DB-23; Mon, 21 Mar 2022 11:45:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=zddYHEulAhT9PQUR0ClatJh7q7lFeWCKA5JNc2F0NbA=; 
 t=1647877498;x=1648482898; 
 b=tiCkUgNlLM9DthVgvNUGUW2nwLo2yDQ5S0jvFshyNoRX9tflnO1mADRqGhGhKjdOiztP3ZagKXCkBYYY7CtpdoK8b4PhlPGtQsNnR05yHe30t333O3a95KqNjWK71C0Gs3YpiqCWFqt3sWefW2lWJX8WGAO7Upre5CeRg+KAxXChMTLAlQQK1QsFqXSP2/mLfITz8zaqelVVDq9FXHg73kIyKfYPUW1t3vs2lIuq8fJMHzx+hKlEEkZTMR+OJu1BJBFbfOMHcuQKZ8IXCnE89gHdY35uPuI4uVFQ/2imC/XTovhNE0YvgTqWOuzErK/j8SvvmsHm0Zyr2PGXJomMwQ==;
Received: by smtp49.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nWKDG-0004Df-Ef; Mon, 21 Mar 2022 18:44:55 +0300
Message-ID: <160b0358-b96b-c1ff-e08f-7488366a1755@mail.ru>
Date: Mon, 21 Mar 2022 18:44:53 +0300
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
Authentication-Results: smtp49.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD95C8DF32398C35CA633AC8158FD68276C79E92F1BB1950288182A05F5380850404C228DA9ACA6FE272D7E85127BA850A31DC205B3E890F6481269A9AC7BF6848BC4CBC1D3D31E90D9
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7364F8074C6DFACE2C2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE79FF7180C05A1FF7CEA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38BEBC5CAB6D411FFA6C14625B4263940811319D635E4A6900B20879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C058C1844A7A85E7B68941B15DA834481FA18204E546F3947C1D471462564A2E19F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637BA939FD1B3BAB99B389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F7900637CE7BC4C43A05C5FFD81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636D81D268191BDAD3D78DA827A17800CE7E86C2BDB4441CAFAEC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3BED49B5C3F21B02335872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A5DBDA34382F97888007826D168554D6B80C6382066505BC3ED59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA7506FE1F977233B9BB410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34F05B761BB9C2AA448842AC4C13CF78FB48609F1BB23A77EB4E09B681E67B9EF1F05AE498DBFC72921D7E09C32AA3244CDCC554683B9700D7D395D6D20D74921C1DD47778AE04E04D27AC49D2B05FCCD8
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojSLL0ldHQslY0QhBPFfNgww==
X-Mailru-Sender: 6C3E74F07C41AE94BE5520CD20DE4F15242852A2257DF4196DA1E31439D6C62A2DD5929CD1FB0736E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.109;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp49.i.mail.ru
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

09.03.2022 16:26, Emanuele Giuseppe Esposito wrote:
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
>> I'm not sure it's ideal. Unfortunately I'm not really good in all that
>> BQL, AioContext locks and drains. So, I can't give good advice. But here
>> are my doubts:
>>
>> Draining is very restrictive measure: even if drained section is very
>> short, at least on bdrv_drained_begin() we have to wait for all current
>> requests, and don't start new ones. That slows down the guest.
> I don't think we are in a critical path where performance is important here.
> 
> In the
>> same time there are operations that don't require to stop guest IO
>> requests. For example manipulation with dirty bitmaps - qmp commands
>> block-dirty-bitmap-add block-dirty-bitmap-remove. Or different query
>> requests..
>>
> Maybe you misunderstood or I was not 100% clear, but I am talking about replacing the AioContext lock for the ->parents and ->children instance. Not everywhere. This is the first step, and then we will see if the additional things that it protects can use drain or something else
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
> That's the use case I am considering.
>> All other operations, for which we want some kind of lock (like
>> AioContext lock or something) we actually don't want to stop guest IO.
> Yes, they have to be analyzed case by case.
>>
>> Next, I have a problem in mind, that in past lead to a lot of iotest 30
>> failures. Next there were different fixes and improvements, but the core
>> problem (as far as I understand) is still here: nothing protects us when
>> we are in some graph modification process (for example block-job
>> finalization) do yield, switch to other coroutine and enter another
>> graph modification process (for example, another block-job finaliztion)..
> That's another point to consider. I don't really have a solution for this.
> 
>> (for details look at my old "[PATCH RFC 0/5] Fix accidental crash in
>> iotest 30"
>> https://lists.nongnu.org/archive/html/qemu-devel/2020-11/msg05290.html  ,
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
>>> Why use_subtree_  instead of normal drain
>>> -----------------------------------------
>>> A simple drain "blocks" a given node and all its parents.
>>> But it doesn't touch the child.
>>> This means that if we use a simple drain, a child can always
>>> keep processing requests, and eventually end up calling itself
>>> bdrv_drained_begin, ending up reading the parents node while the main
>>> loop
>>> is modifying them. Therefore a subtree drain is necessary.
>> I'm not sure I understand.. Could you give a more concrete example of
>> what may happen if we use simple drain?
>> Who will call bdrv_drained_begin() you say about? Some IO path in
>> parallel thread? Do we really have an IO path that calls
>> bdrv_drained_begin()?
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


As I understand:

You want to make drained section to be a kind of lock, so that if we take this lock, we can modify the graph and we are sure that no other client will modify it in parallel.

But drained sections can be nested. So to solve the problem you try to drain more nodes: include subtree for example, or may be we need to drain the whole graph connectivity component, or (to be more safe) the whole block layer (to be sure that during drained section in one connectivity component some not-drained block-job from another connectivity component will not try to attach some node from our drained connectivity component)..

I still feel that draining is wrong tool for isolating graph modifying operations from each other:

1. Drained sections can be nested, and natively that's not a kind of lock. That's just a requirement to have no IO requests. There may be several clients that want this condition on same set of nodes.

2. Blocking IO on the whole connected subgraph or even on the whole block layer graph is not necessary, so that's an extra blocking.


Could we instead do the following:

1. Keep draining as is - a mechanism to stop IO on some nodes

2. To isolate graph-modifying operations implement another mechanism: something like a global queue, where clients wait until they gen an access to modify block layer.


This way, any graph modifying process would look like this:

1. drained_begin(only where necessary, not the whole subgraph in general)

2. wait in the global queue

3. Ok, now we can do all the modifications

4. Kick the global queue, so that next client will get an access

5. drained_end()


-- 
Best regards,
Vladimir

