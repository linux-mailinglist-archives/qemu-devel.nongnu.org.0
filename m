Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 959544EAADC
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 11:57:53 +0200 (CEST)
Received: from localhost ([::1]:49346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ8bo-0004z6-Mo
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 05:57:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZ8Zf-0003wX-7k; Tue, 29 Mar 2022 05:55:39 -0400
Received: from smtp55.i.mail.ru ([217.69.128.35]:40458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZ8Zb-0002re-TL; Tue, 29 Mar 2022 05:55:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=CjC+NzuUyMgeTwUcLPW3/g/qgzObISHV+Y/9TzuTSys=; 
 t=1648547735;x=1649153135; 
 b=FGH5APd7hWvsJ6Wt9qlhEYdpCS3ajZC0Vz1UCinKSo77gLL3JTEB6jMKjsN5M9VDZq2WcoY5qBuCFJsxvcTEGySJrgBVk8KUZw4XfXewgVWRezDXCOMzdJnJprb9zDIbzX3S+2QLI4y9/wR5CWGAlancDYEhryGyeRqCUH1vN2Ey6iv70UHw3QCcYGcS8bNsLYQ303Gp3JwZTsFC7vQdiKJXPdWyX+l0NNW8DhN86/PBByk/fCUUOqx1XKJm3PfRo7RMMVsbnY1N01m12rX2587tQQCX6pxbBQxnebx+qny79TeX8x+Aiyu1uD/1LPGY0Mpj9A5msR9tNxqE2Xg7mw==;
Received: by smtp55.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZ8ZX-0005Dg-Qe; Tue, 29 Mar 2022 12:55:32 +0300
Message-ID: <cba4cda5-c70a-e2e3-9a10-a60b418e153a@mail.ru>
Date: Tue, 29 Mar 2022 12:55:31 +0300
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
 <18f101ca-5536-644d-d79e-66f88f0328cc@mail.ru>
 <3297c6f5-1093-e7cc-9449-dc3abd3511a0@redhat.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <3297c6f5-1093-e7cc-9449-dc3abd3511a0@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp55.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD99E4E844CD0404D79B9F85D5ED3ED71CC11FF2F23F471849A182A05F5380850404C228DA9ACA6FE27685AE92E82B954BEF9478B8919D58B996A2B13C26C487CC63FD3F93050CCDD9B
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7BF27F4FA2823CCF0EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063725D748B084CAA27D8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8970C43AFC2E13ADB0D4FA25A186A0A636F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE744B19C781AFE7CF19FA2833FD35BB23D9E625A9149C048EE9ECD01F8117BC8BEA471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F446042972877693876707352033AC447995A7AD18F04B652EEC242312D2E47CDBA5A96583BA9C0B312567BB2376E601842F6C81A19E625A9149C048EE652FD71AFB96DC7DD94E105876FE7799D8FC6C240DEA7642DBF02ECDB25306B2B78CF848AE20165D0A6AB1C7CE11FEE34E7D9683544204AF2D242C3BD2E3F4C6C4224003CC836476EA7A3FFF5B025636E2021AF6380DFAD1A18204E546F3947CB11811A4A51E3B096D1867E19FE1407959CC434672EE6371089D37D7C0E48F6C8AA50765F7900637D9F2C517E34CD691EFF80C71ABB335746BA297DBC24807EABDAD6C7F3747799A
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A5D89ED4A7901366DB8A73725CD985BE2B2A83C269AFDE6371D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75040BF32255FAA22B410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D342B94C1DAF75C4D228DCE76AFB0C1EA0B1E957220B96BEF0C35827C3B29EA9C3E54B59C8C3C9C78C91D7E09C32AA3244C1781D5B25DEEAC0FC710FA9A6FB918F6A995755A1445935EDCA3B3C10BC03908
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX92LdC94eGamH334JNKAFw==
X-Mailru-Sender: 6C3E74F07C41AE94BE5520CD20DE4F15C9FBBE67090049A2CA8E41ABDE9CF14B694D2F3C899FAFD5E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=217.69.128.35;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp55.i.mail.ru
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_RPBL=1.31,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

29.03.2022 11:54, Hanna Reitz wrote:
> On 28.03.22 12:24, Vladimir Sementsov-Ogievskiy wrote:
>> 28.03.2022 11:09, Hanna Reitz wrote:
>>> On 28.03.22 09:44, Hanna Reitz wrote:
>>>> On 25.03.22 17:37, Vladimir Sementsov-Ogievskiy wrote:
>>>>> 24.03.2022 17:09, Hanna Reitz wrote:
>>>>>> When the stream block job cuts out the nodes between top and base in
>>>>>> stream_prepare(), it does not drain the subtree manually; it fetches the
>>>>>> base node, and tries to insert it as the top node's backing node with
>>>>>> bdrv_set_backing_hd().  bdrv_set_backing_hd() however will drain, and so
>>>>>> the actual base node might change (because the base node is actually not
>>>>>> part of the stream job) before the old base node passed to
>>>>>> bdrv_set_backing_hd() is installed.
>>>>>>
>>>>>> This has two implications:
>>>>>>
>>>>>> First, the stream job does not keep a strong reference to the base node.
>>>>>> Therefore, if it is deleted in bdrv_set_backing_hd()'s drain (e.g.
>>>>>> because some other block job is drained to finish), we will get a
>>>>>> use-after-free.  We should keep a strong reference to that node.
>>>>>>
>>>>>> Second, even with such a strong reference, the problem remains that the
>>>>>> base node might change before bdrv_set_backing_hd() actually runs and as
>>>>>> a result the wrong base node is installed.
>>>>>
>>>>> Hmm.
>>>>>
>>>>> So, we don't really need a strong reference, as if it helps to avoid some use-after-free, it means that we'll finish up with wrong block graph..
>>>>
>>>> Sure.  But I found it better style to strongly reference a node while it’s used.  I’d rather have an outdated block graph (as in: A node that was supposed to disappear would still be in use) than a use-after-free.
>>>>
>>>>> Graph modifying operations must be somehow isolated from each other.
>>>>>
>>>>>>
>>>>>> Both effects can be seen in 030's TestParallelOps.test_overlapping_5()
>>>>>> case, which has five nodes, and simultaneously streams from the middle
>>>>>> node to the top node, and commits the middle node down to the base node.
>>>>>> As it is, this will sometimes crash, namely when we encounter the
>>>>>> above-described use-after-free.
>>>>>>
>>>>>> Taking a strong reference to the base node, we no longer get a crash,
>>>>>> but the resuling block graph is less than ideal: The expected result is
>>>>>> obviously that all middle nodes are cut out and the base node is the
>>>>>> immediate backing child of the top node.  However, if stream_prepare()
>>>>>> takes a strong reference to its base node (the middle node), and then
>>>>>> the commit job finishes in bdrv_set_backing_hd(), supposedly dropping
>>>>>> that middle node, the stream job will just reinstall it again.
>>>>>>
>>>>>> Therefore, we need to keep the whole subtree drained in
>>>>>> stream_prepare(), so that the graph modification it performs is
>>>>>> effectively atomic, i.e. that the base node it fetches is still the base
>>>>>> node when bdrv_set_backing_hd() sets it as the top node's backing node.
>>>>>
>>>>> Emanuele has similar idea of isolating graph changes from each other by subtree-drain.
>>>>>
>>>>> If I understand correctly the idea is that we'll drain all other block jobs, so the wouldn't do their block-graph modification during drained section. So, we can safely modify the graph.
>>>>>
>>>>> I don't like this idea:
>>>>>
>>>>> 1. drained section = stop IO. But we don't need to stop IO in the whole subtree to do a needed block-graph modification.
>>>>
>>>> If you mean to say that draining just the single node should be sufficient, I’ll be happy to change it.
>>>>
>>>> Not sure which node, though, because I’d think it would be `base`, but to safely fetch it I’d need to drain it, which seems to bite itself in the tail.  That’s why I went for a subtree drain from `above_base`.
>>>>
>>>>> 2. Drained section is not a lock, several clients may drain same set of nodes.. So we exploit the fact that concurrent clients will be paused by drained section and don't proceed to graph-modification code.. But are we sure that block-jobs are (and will be?) the only concurrent block-graph modifying clients? Can qmp commands interleave somehow?
>>>>
>>>> They can under very specific circumstances and that’s a bug. See https://lists.nongnu.org/archive/html/qemu-block/2022-03/msg00582.html .
>>>>
>>>>> Can some jobs from other subtree start a block-graph modification that touches our subtree?
>>>>
>>>> That would be wrong.  A block job shouldn’t change nodes it doesn’t own; stream doesn’t own the base, but it also doesn’t change it, it only needs to have the top node point to it.
>>>>
>>>>> If go this way, that would be more safe to drain the whole block-graph on any block-graph modification..
>>>>>
>>>>> I think we'd better have a separate global mechanism for isolating graph modifications. Something like a global co-mutex or queue, where clients waits for their turn in block graph modifications.
>>>>>
>>>>> Here is my old proposal on that topic: https://patchew.org/QEMU/20201120161622.1537-1-vsementsov@virtuozzo.com/
>>>>
>>>> That would only solve the very specific issue in 030, right?
>>
>> It should solve the same issue as your patch. You don't add subtree_drain around every graph modification.. Or we already have it?
> 
> Well, I’m not saying it will solve every single bug, but draining in stream_prepare() will at least mean that that is safe from basically anything else, because it will prevent concurrent automatic graph changes (e.g. because of jobs finishing), and QMP commands shouldn’t be executed in drained sections either (when they do, it’s wrong, but that seems to occur only extremely rarely).  Draining alone should make a place safe, it isn’t a lock that all sides need to take.
> 
>>>>   The stream job isn’t protected from any graph modifications but those coming from mirror.  Might be a solution going forward (I didn’t look closer at it at the time, given I saw you had a discussion with Kevin), if we lock every graph change operation (though a global lock honestly doesn’t sound strictly better than draining subsections of the graph, both have their drawbacks), but that doesn’t look like it’d be something for 7.1.
>>
>> Same way, with draining solution you should make a subtree-drain for every graph change operation.
> 
> Since we don’t have any lock yet, draining is the de-facto way we use to forbid concurrent graph modifications.  I’m not saying we use it correctly and thoroughly, but it is what we do right now.
> 
>>
>>>
>>> I wonder whether we could have a short-term version of `BdrvChild.frozen` that’s a coroutine mutex.  If `.frozen` is set, you just can’t change the graph, and you also can’t wait, so that’s just an error.  But if `.frozen_lock` is set, you can wait on it. Here, we’d keep `.frozen` set for all links between top and above_base, and then in prepare() take `.frozen_lock` on the link between above_base and base.
>>>
>>
>> Yes that's seems an alternative to global lock, that doesn't block the whole graph. Still, I don't think that is bad to lock the whole graph for graph modificaiton, as modification should be rare and fast.
> 
> Fair enough.
> 
>> Another thought: does subtree-drain really drain the whole connectivity component of the graph?
>>
>> imagine something like this:
>>
>> [A]  [   C  ]
>>  |    |    |
>>  v    v    v
>> [ B    ]  [ D ]
>>
>>
>> If we do subtree drain at node A, this will drain B and C, but not D..
>>
>> Imagine, some another job is attached to node D, and it will start drained section too. So, for example both jobs will share drained section on node C. That doesn't seem save, and draining is not a lock.
>>
>> So, if we are going to rely on drained section as on lock, that isolates graph modifications from each other, we should drain the whole connectivity component of the graph.
> 
> The drained section is not a lock, but if the other job is only attached to node D, it won’t change node C.  It might change the link from C to D, but that doesn’t concern the job that is concerned about A and B. Overlapping drains are fine.

OK. Maybe it works. It's just not obvious to me that subtree_drain works good in all cases. And global graph-modification-lock should obviously work.

> 
>> Next, I'm not relly sure that two jobs can simultaneusly enter drained section and do graph modifications. What prevents this? Assume two block-stream jobs reaches their finish simultaneously and go to subtree-drain. That just means that job_pause will be called for both jobs.. But what that means for the block-stream jobs that is in bdrv_subtree_drained_beeing() call in stream_prepare()? Seems nothing? Then both jobs will start graph modification process simultaneously and can interleave on any yield point (for exmaple rewriting backing_file in qcow2 metadata).
> 
> So I don’t think that scenario can really happen, because the stream job freezes the chain between above_base and top, so you can’t really have two simultaneous stream jobs that cause problems between each other.

They cause problem on the boundary, as base of one stream job may be top of another, and we have also a filter, that should be inserted/removed at some moment. As I remember, that's the problematic case in 030..

> 
> Furthermore, the prepare() functions are run in the main thread, so the only real danger is actually that draining around the actual graph modification (bdrv_set_backing_hd()) causes another block job to finish, modifying the block graph.  But then that job will also actually finish, because it’s all in the main thread.
> 
> It is true that child_job_drained_poll() says that job that are about to prepare() are quiesced, but I don’t think that’s a problem, given that all jobs in that state run in the main thread.
> 
>>
>> Another reason, why I think that subtree drain is a wrong tool, as I said, is extra IO-stop.
> 
> I know and agree, but that’s an optimization question.
> 
>> Imaging the following graph:
>>
>> [A]
>>  |
>>  v
>> [B] [C]
>>  |   |
>>  v   v
>> [base]
>>
>> If we want to rebase A onto base, we actually need only stop IO requests in A and B. Why C should suffer from this graph modification? IO requests produced by C, and that are living in C and in base don't intersect with rebasing A on base process in any way.
>>
>> ====
>>
>> Actually, I'm not strictly against your patch, and believe that it fixes the problem in most cases. And it's probably OK in short term. The only real doubt on including it now is that drained sections sometimes lead to dead locks, and is it possible that we now fix the bug that happens only in iotest 30 (or is it reported somewhere?) and risking to introduce some dead-lock?
> 
> Saying that the example in 030 is contrived would mean we could/should re-include the base into the list of nodes that belong to the stream job, which would simply disallow the case in 030 that’s being tested and fails.
> 
> Then we don’t need a subtree drain, and the plain drain in bdrv_set_backing_hd() would be fine.
> 
>> Seems that if in some code it's safe to call drained_begin(), it should be safe to call subtree_drained_begin(). And if it trigger some deadlock, it just shows some another bug.. Is it worth fixing now, near to 7.0 release? We live with this bug for years.. Or something changed that I missed?
> 
> I mean...  I can understand your concern that adding a subtree drain has performance implications (when a stream job ends, which shouldn’t be often).  But I’m not sure whether I should share the deadlock concern. Sounds like a sad state of affairs if I can’t just drain something when I need it to be drained.
> 
> I wasn’t aware of this bug, actually.  Now I am, and I feel rather uncomfortable living with a use-after-free bug, because that’s on the worse end of the bug spectrum.
> 

OK, I don't know:) And others are silent. Agree that global-lock solution is not for 7.0 anyway. And this one is simple enough. So, take my

Acked-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>

-- 
Best regards,
Vladimir

