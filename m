Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E594E9281
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 12:28:29 +0200 (CEST)
Received: from localhost ([::1]:50502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYmbs-0004bC-BB
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 06:28:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nYmYk-000300-TI; Mon, 28 Mar 2022 06:25:22 -0400
Received: from smtp41.i.mail.ru ([94.100.177.101]:57550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nYmYZ-00016s-Ri; Mon, 28 Mar 2022 06:25:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=4kkGVhTILH6bIs0B/p9ACZDdKfvl5o5TBhDlqCOxsDY=; 
 t=1648463103;x=1649068503; 
 b=cvnbajCd5CvyPhKYbM8X5SMe0yrY5IvkDNL6K1krOMfIX6HC3zNb6wYl0/+Mdm1kCAYF73dSsKieirc3TcVgw7oAWO/7bbSwKat9Q6GKCkevgWwJZ4IMjS45pN9NTry/CTa5Uaf9q80QN9QoQDJU3OAnUONQkcQpeXd/vj4C3hZ6WLc9KdPQELTbcHmJUmHrKJCUBDA3Lpps7A2RODSkbPFzX1Q9XrWxm7hGLTVnT+XdQ5oAHBZt8yVrgye5PMiF5KYomGOQkAXx+WOJG0SoetCOFevqNZxWoByTg3k7xGv8fU9V5z7TuZoOjtESloJ7/Thju6qRbCGS2c5doe5QEg==;
Received: by smtp41.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nYmYT-0008PA-69; Mon, 28 Mar 2022 13:24:57 +0300
Message-ID: <18f101ca-5536-644d-d79e-66f88f0328cc@mail.ru>
Date: Mon, 28 Mar 2022 13:24:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] block/stream: Drain subtree around graph change
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20220324140907.17192-1-hreitz@redhat.com>
 <7da3445c-7417-6329-c9e3-4488ab7a96ec@mail.ru>
 <f4d5e653-9dea-539d-136d-1f36fec597f2@redhat.com>
 <8e173cec-d3a1-f8a0-bc07-12b2cfd39d89@redhat.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <8e173cec-d3a1-f8a0-bc07-12b2cfd39d89@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp41.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD9BF7BFC6A11272BEBB82C8127661B0432E8F74260360353AA00894C459B0CD1B9D098BA2684FAE09F411D655BC4B4037E3F631510FFA10CE1B05ACAA2412A7298
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7B8387EA37EC1BE7DEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637575C0790A70C4B158638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D85B6A5C9ED39BB376FC98F3B8CE51A96B6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE76066D23D6C2663549FA2833FD35BB23D9E625A9149C048EE9ECD01F8117BC8BEA471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F446042972877693876707352033AC447995A7AD1828451B159A507268D2E47CDBA5A96583BA9C0B312567BB2376E601842F6C81A19E625A9149C048EEC8105B04EFE076281AD9CA79AA6DBBDDD8FC6C240DEA7642DBF02ECDB25306B2B78CF848AE20165D0A6AB1C7CE11FEE34E7D9683544204AFAD7EC71F1DB88427C4224003CC836476EA7A3FFF5B025636E2021AF6380DFAD1A18204E546F3947CB11811A4A51E3B096D1867E19FE1407959CC434672EE6371089D37D7C0E48F6C8AA50765F79006371693D85F8934E509EFF80C71ABB335746BA297DBC24807EABDAD6C7F3747799A
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A5332393DA60A266B065257CC13E6E263EDBB9763DCB412621D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA754E2A133C74F7AB4F410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34C6EC1BD9807109D217C477E72EFB895DC672A40F08831B2157AB8E4B2249334D2DA6AF21D770C4001D7E09C32AA3244C752D95B65ECD98157BFA6DE70EE108CF5595C85A795C7BAEDCA3B3C10BC03908
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojP0ngFsg3KoBn0Rdgv9305A==
X-Mailru-Sender: 6C3E74F07C41AE94BE5520CD20DE4F15DA0888E9A8CB5E40EC18CA9396DE2E3748A2D76722F86E2EE6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.101;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp41.i.mail.ru
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

28.03.2022 11:09, Hanna Reitz wrote:
> On 28.03.22 09:44, Hanna Reitz wrote:
>> On 25.03.22 17:37, Vladimir Sementsov-Ogievskiy wrote:
>>> 24.03.2022 17:09, Hanna Reitz wrote:
>>>> When the stream block job cuts out the nodes between top and base in
>>>> stream_prepare(), it does not drain the subtree manually; it fetches the
>>>> base node, and tries to insert it as the top node's backing node with
>>>> bdrv_set_backing_hd().  bdrv_set_backing_hd() however will drain, and so
>>>> the actual base node might change (because the base node is actually not
>>>> part of the stream job) before the old base node passed to
>>>> bdrv_set_backing_hd() is installed.
>>>>
>>>> This has two implications:
>>>>
>>>> First, the stream job does not keep a strong reference to the base node.
>>>> Therefore, if it is deleted in bdrv_set_backing_hd()'s drain (e.g.
>>>> because some other block job is drained to finish), we will get a
>>>> use-after-free.  We should keep a strong reference to that node.
>>>>
>>>> Second, even with such a strong reference, the problem remains that the
>>>> base node might change before bdrv_set_backing_hd() actually runs and as
>>>> a result the wrong base node is installed.
>>>
>>> Hmm.
>>>
>>> So, we don't really need a strong reference, as if it helps to avoid some use-after-free, it means that we'll finish up with wrong block graph..
>>
>> Sure.  But I found it better style to strongly reference a node while it’s used.  I’d rather have an outdated block graph (as in: A node that was supposed to disappear would still be in use) than a use-after-free.
>>
>>> Graph modifying operations must be somehow isolated from each other.
>>>
>>>>
>>>> Both effects can be seen in 030's TestParallelOps.test_overlapping_5()
>>>> case, which has five nodes, and simultaneously streams from the middle
>>>> node to the top node, and commits the middle node down to the base node.
>>>> As it is, this will sometimes crash, namely when we encounter the
>>>> above-described use-after-free.
>>>>
>>>> Taking a strong reference to the base node, we no longer get a crash,
>>>> but the resuling block graph is less than ideal: The expected result is
>>>> obviously that all middle nodes are cut out and the base node is the
>>>> immediate backing child of the top node.  However, if stream_prepare()
>>>> takes a strong reference to its base node (the middle node), and then
>>>> the commit job finishes in bdrv_set_backing_hd(), supposedly dropping
>>>> that middle node, the stream job will just reinstall it again.
>>>>
>>>> Therefore, we need to keep the whole subtree drained in
>>>> stream_prepare(), so that the graph modification it performs is
>>>> effectively atomic, i.e. that the base node it fetches is still the base
>>>> node when bdrv_set_backing_hd() sets it as the top node's backing node.
>>>
>>> Emanuele has similar idea of isolating graph changes from each other by subtree-drain.
>>>
>>> If I understand correctly the idea is that we'll drain all other block jobs, so the wouldn't do their block-graph modification during drained section. So, we can safely modify the graph.
>>>
>>> I don't like this idea:
>>>
>>> 1. drained section = stop IO. But we don't need to stop IO in the whole subtree to do a needed block-graph modification.
>>
>> If you mean to say that draining just the single node should be sufficient, I’ll be happy to change it.
>>
>> Not sure which node, though, because I’d think it would be `base`, but to safely fetch it I’d need to drain it, which seems to bite itself in the tail.  That’s why I went for a subtree drain from `above_base`.
>>
>>> 2. Drained section is not a lock, several clients may drain same set of nodes.. So we exploit the fact that concurrent clients will be paused by drained section and don't proceed to graph-modification code.. But are we sure that block-jobs are (and will be?) the only concurrent block-graph modifying clients? Can qmp commands interleave somehow?
>>
>> They can under very specific circumstances and that’s a bug.  See https://lists.nongnu.org/archive/html/qemu-block/2022-03/msg00582.html .
>>
>>> Can some jobs from other subtree start a block-graph modification that touches our subtree?
>>
>> That would be wrong.  A block job shouldn’t change nodes it doesn’t own; stream doesn’t own the base, but it also doesn’t change it, it only needs to have the top node point to it.
>>
>>> If go this way, that would be more safe to drain the whole block-graph on any block-graph modification..
>>>
>>> I think we'd better have a separate global mechanism for isolating graph modifications. Something like a global co-mutex or queue, where clients waits for their turn in block graph modifications.
>>>
>>> Here is my old proposal on that topic: https://patchew.org/QEMU/20201120161622.1537-1-vsementsov@virtuozzo.com/
>>
>> That would only solve the very specific issue in 030, right?

It should solve the same issue as your patch. You don't add subtree_drain around every graph modification.. Or we already have it?

>>  The stream job isn’t protected from any graph modifications but those coming from mirror.  Might be a solution going forward (I didn’t look closer at it at the time, given I saw you had a discussion with Kevin), if we lock every graph change operation (though a global lock honestly doesn’t sound strictly better than draining subsections of the graph, both have their drawbacks), but that doesn’t look like it’d be something for 7.1.

Same way, with draining solution you should make a subtree-drain for every graph change operation.

> 
> I wonder whether we could have a short-term version of `BdrvChild.frozen` that’s a coroutine mutex.  If `.frozen` is set, you just can’t change the graph, and you also can’t wait, so that’s just an error.  But if `.frozen_lock` is set, you can wait on it. Here, we’d keep `.frozen` set for all links between top and above_base, and then in prepare() take `.frozen_lock` on the link between above_base and base.
> 

Yes that's seems an alternative to global lock, that doesn't block the whole graph. Still, I don't think that is bad to lock the whole graph for graph modificaiton, as modification should be rare and fast.


Another thought: does subtree-drain really drain the whole connectivity component of the graph?

imagine something like this:

[A]  [   C  ]
  |    |    |
  v    v    v
[ B    ]  [ D ]


If we do subtree drain at node A, this will drain B and C, but not D..

Imagine, some another job is attached to node D, and it will start drained section too. So, for example both jobs will share drained section on node C. That doesn't seem save, and draining is not a lock.

So, if we are going to rely on drained section as on lock, that isolates graph modifications from each other, we should drain the whole connectivity component of the graph.


Next, I'm not relly sure that two jobs can simultaneusly enter drained section and do graph modifications. What prevents this? Assume two block-stream jobs reaches their finish simultaneously and go to subtree-drain. That just means that job_pause will be called for both jobs.. But what that means for the block-stream jobs that is in bdrv_subtree_drained_beeing() call in stream_prepare()? Seems nothing? Then both jobs will start graph modification process simultaneously and can interleave on any yield point (for exmaple rewriting backing_file in qcow2 metadata).


Another reason, why I think that subtree drain is a wrong tool, as I said, is extra IO-stop.

Imaging the following graph:

[A]
  |
  v
[B] [C]
  |   |
  v   v
[base]

If we want to rebase A onto base, we actually need only stop IO requests in A and B. Why C should suffer from this graph modification? IO requests produced by C, and that are living in C and in base don't intersect with rebasing A on base process in any way.

====

Actually, I'm not strictly against your patch, and believe that it fixes the problem in most cases. And it's probably OK in short term. The only real doubt on including it now is that drained sections sometimes lead to dead locks, and is it possible that we now fix the bug that happens only in iotest 30 (or is it reported somewhere?) and risking to introduce some dead-lock? Seems that if in some code it's safe to call drained_begin(), it should be safe to call subtree_drained_begin(). And if it trigger some deadlock, it just shows some another bug.. Is it worth fixing now, near to 7.0 release? We live with this bug for years.. Or something changed that I missed?

-- 
Best regards,
Vladimir

