Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F314EBE22
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 11:57:26 +0200 (CEST)
Received: from localhost ([::1]:59180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZV4u-0004ZG-Uz
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 05:57:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZV0k-0002Xc-9p; Wed, 30 Mar 2022 05:53:06 -0400
Received: from smtp34.i.mail.ru ([94.100.177.94]:44696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZV0g-0004NG-Pp; Wed, 30 Mar 2022 05:53:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=SPYYJtAe7O666vsXWRMWt3rAfJctYqxrUCbW2pbR6iI=; 
 t=1648633982;x=1649239382; 
 b=m/9KVgw7nh3Is1nHhTiHsF6tWWV/JPCfZO1xePQHfkMrRoN0xU/tKHSxFCJFeobxBQUEtonycJH4BFYKkXquKHJUUHukyR0wERoxwKqpqQPWMqvsvDbkQLjsvjK2SNMR0m+ywnYEHxM+wBFgtYg5mQ78NBxkDtBjQL8SKTOYGUYRRYwhhZ6dbfmCTLCabb95bR/viuVEcw51uySLMN2aiyrs+GvnFOI3HeyaK4xM6JweJ/Rt5JGr9jeWfC5y9eKpmR8dx4ff/YlqN+Pe1UbeGE/xDkZGXZTP4UwtlouKzzUh8IOIbeCrvpj8LPbp4D2Kwrrcd5y115c+6bgyZTQ4MA==;
Received: by smtp34.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZV0b-0002Zb-G3; Wed, 30 Mar 2022 12:52:58 +0300
Message-ID: <6694cad1-058b-d1bf-3f6c-61879799fa22@mail.ru>
Date: Wed, 30 Mar 2022 12:52:57 +0300
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
 <160b0358-b96b-c1ff-e08f-7488366a1755@mail.ru>
 <dd644d13-720f-c720-83bc-bab291b45d7b@redhat.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <dd644d13-720f-c720-83bc-bab291b45d7b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp34.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD92B0439D57C14BB617BAFEA8A05E639C3B4E0E7AAF66DFFB700894C459B0CD1B9799820C7FBBD188B9EFD46AA05AE35F1068284317B406DF6A8748570D7170BC1
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7B2CE06D3E4B8AFEBEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637CD1DFD3ABA64F6568638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8F061AA7324B08BF4E260B4F0FCD2EB216F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7CBF8B5A8BB70B45E9FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18618001F51B5FD3F9D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BF80095D1E57F4578A471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC3A746B66CB4BBB9E3AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F7900637F0C13814610E20C6D81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F249797B4B1AC144935872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A5A5D9962F192CE20125A6914E45E013A91BF9D9372C307443D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75040BF32255FAA22B410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3454548929AF40B428392E725E7688093A594E0D3AEDB82A6B2C5DCC19874CA90DD93B584DAA9F2D641D7E09C32AA3244CF52A5E6C26D316CA75EA1C98A677A50A6C2483212766842227AC49D2B05FCCD8
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojlgoDDUY05+WR4xe/YMLXAA==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FEBBAFB83A3F5711FD47B8B15330BDD84560AE82301C21C01EE6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.94;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp34.i.mail.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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

30.03.2022 12:09, Emanuele Giuseppe Esposito wrote:
>>
>> Ah seems I understand what you mean.
>>
>> One of my arguments is that "drain" - is not a lock against other
>> clients who want to modify the graph. Because, drained section allows
>> nested drained sections.
>>
>> And you try to solve it, by draining more things, this way, we'll drain
>> also the job, which is a possible client, who may want to modify the
>> graph in parallel.
>>
>> So, in other words, when we want to modify the graph, we drain the whole
>> connectivity component of the graph. And we think that we are safe from
>> other graph modifications because all related jobs are drained.
>> Interesting, is that possible that some not drained job from another
>> connectivity component will want to connect some node from our drained
>> component?
> 
> You mean another job or whathever calling bdrv_find_node() on a random
> graph? Yes that is not protected. But can this happen?
> 
> That's the question. What are the invariants here? Can anything happen?
> 
>>
>> I just still feel that draining is a wrong mechanism to avoid
>> interaction with other clients who want to modify the graph, because:
>>
>> 1. we stop the whole IO on all subgraph which is not necessary
>> 2. draining is not a mutex, it allows nesting and it's ok when two
>> different clients drain same nodes. Draining is just a requirement to do
>> no IO at these nodes.
>>
>> And in your way, it seems that to be absolutely safe we'll need to drain
>> everything..
>>
>> In my feeling it's better to keep draining what it is now: requirement
>> to have no IO requests. And to isolate graph modifications from each
>> other make a new synchronization mechanism, something like a global
>> queue, where clients who want to get an access to graph modifications
>> wait for their turn.
> 
> This is a matter of definitions. Subtree drains can theoretically work,
> I managed to answer to my own doubts in the last email I sent.
> 
> Yes, there is still some completely random case like the one I wrote
> above, but I think it is more a matter of what we want to use and what
> meaning we want to give to drains.
> 
> Global queue is what Kevin proposes, I will try to implement it.
> 
>>
>>
>> As I understand:
>>
>> You want to make drained section to be a kind of lock, so that if we
>> take this lock, we can modify the graph and we are sure that no other
>> client will modify it in parallel.
> 
> Yes
> 
>>
>> But drained sections can be nested. So to solve the problem you try to
>> drain more nodes: include subtree for example, or may be we need to
>> drain the whole graph connectivity component, or (to be more safe) the
>> whole block layer (to be sure that during drained section in one
>> connectivity component some not-drained block-job from another
>> connectivity component will not try to attach some node from our drained
>> connectivity component)..
>>
>> I still feel that draining is wrong tool for isolating graph modifying
>> operations from each other:
>>
>> 1. Drained sections can be nested, and natively that's not a kind of
>> lock. That's just a requirement to have no IO requests. There may be
>> several clients that want this condition on same set of nodes.
>>
>> 2. Blocking IO on the whole connected subgraph or even on the whole
>> block layer graph is not necessary, so that's an extra blocking.
>>
>>
>> Could we instead do the following:
>>
>> 1. Keep draining as is - a mechanism to stop IO on some nodes
>>
>> 2. To isolate graph-modifying operations implement another mechanism:
>> something like a global queue, where clients wait until they gen an
>> access to modify block layer.
>>
>>
>> This way, any graph modifying process would look like this:
>>
>> 1. drained_begin(only where necessary, not the whole subgraph in general)
>>
>> 2. wait in the global queue
>>
>> 3. Ok, now we can do all the modifications
>>
>> 4. Kick the global queue, so that next client will get an access
>>
>> 5. drained_end()
>>
>>
> 
> Please give a look at what Kevin (described by me) proposed. I think
> it's the same as you are suggesting. I am pasting it below.
> I will try to implement this and see if it is doable or not.
> 
> I think the advantage of drains is that it isn't so complicated and
> doesn't add any complication to the existing code.
> But we'll see how it goes with this global queue.
> 
>> His idea is to replicate what blk_wait_while_drained() currently does
>> but on a larger scale. It is something in between this subtree_drains
>> logic and a rwlock.
>>
>> Basically if I understood correctly, we could implement
>> bdrv_wait_while_drained(), and put in all places where we would put a
>> read lock: all the reads to ->parents and ->children.
>> This function detects if the bdrv is under drain, and if so it will stop
>> and wait that the drain finishes (ie the graph modification).
>> On the other side, each write would just need to drain probably both
>> nodes (simple drain), to signal that we are modifying the graph. Once
>> bdrv_drained_begin() finishes, we are sure all coroutines are stopped.
>> Once bdrv_drained_end() finishes, we automatically let all coroutine
>> restart, and continue where they left off.
>>
>> Seems a good compromise between drains and rwlock. What do you think?
>>
>> I am not sure how painful it will be to implement though.
> 

Hm, I don't see, where is global queue here? Or bdrv_wait_while_drained() is global and has no bs arguement?




-- 
Best regards,
Vladimir

