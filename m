Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB0A4EBE17
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 11:52:32 +0200 (CEST)
Received: from localhost ([::1]:52726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZV0B-0008IX-Nz
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 05:52:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nZUpA-0001Qj-Mk
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 05:41:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nZUp6-0005Fr-7e
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 05:41:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648633263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OayStdgbkr2YcoHNAL163GCJq5vVb7KZAeDVKFFhh1I=;
 b=JCmT/hhvHQit9r2LM5FvLkerMM3N/QHpF/yI4JlsiVpXw7DHTxedM4oEtzt+JdlMTNpxv/
 Pzijsz/Hr9Dsfz6X8wuDu/jgKRG5915vvU8foo+6N87dSIGrLSgsVRzssE5L2HX7Wl+HeY
 UDArMA4nPbxTRbiQk956qocKeQ3uE9U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-v_ISObEDMxGs4CihiqG0NQ-1; Wed, 30 Mar 2022 05:40:45 -0400
X-MC-Unique: v_ISObEDMxGs4CihiqG0NQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 o10-20020a1c4d0a000000b0038c6e5fcbaeso2368096wmh.9
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 02:40:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OayStdgbkr2YcoHNAL163GCJq5vVb7KZAeDVKFFhh1I=;
 b=sWPhYQ58J+qsy3AP/lMNfbRu+GA2zmX9QAFJSUKv5jG/lf33thjnjKCpibefLof0VC
 xZkUURyhkExpGWWA70veT5eUVkR8qT61EHNKqvKTpoter/T++SQFjmrxoMSu+VvCVF2G
 L2oeuBUjSNKcc8AVMUYp61ISXYi6a5oNQSE/YZI9LX19opfcReG647/tpS0SoKGENfu0
 t1UtJGuLn0gw+KSjr3iGcGHOYInKbLww4xTRD1/qUXkUtjqFOCDwF7K/C2Bo7j91aTNN
 zhckLb52N2rThIf6ExlZZ0Co9GTKHkMWOxicJLgwO4WlDj5gfmYF1JI4TMB6a0wO+WEv
 z3Iw==
X-Gm-Message-State: AOAM531ay8Zd3PQVd8990r22Gv1ZVxzM1xphQ4YJdVbXNU1KyXCRiWua
 5Ee7oB88ozhorZUkRCZqGnV9jpV/kLQHxUSS8vFF1jGtx33NN5Tt2EklI1Swm6oyGpEcieh3ukP
 vWVmZPezP9Jalq5c=
X-Received: by 2002:a5d:6d8b:0:b0:203:e242:5e38 with SMTP id
 l11-20020a5d6d8b000000b00203e2425e38mr35957428wrs.105.1648633244349; 
 Wed, 30 Mar 2022 02:40:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgOkAuKVkYt3xQskn1Z005ERbqT8v/ZGnw78YZ9BlQECj1pXfzUm33Tqc+Fnf4g2e/mKY14A==
X-Received: by 2002:a5d:6d8b:0:b0:203:e242:5e38 with SMTP id
 l11-20020a5d6d8b000000b00203e2425e38mr35957391wrs.105.1648633243915; 
 Wed, 30 Mar 2022 02:40:43 -0700 (PDT)
Received: from [192.168.149.116]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a7bcbc8000000b0038ca55f9bcasm4305703wmi.42.2022.03.30.02.40.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 02:40:43 -0700 (PDT)
Message-ID: <bb08b5c4-5f17-911a-c8dc-1e0a4ee6ae8a@redhat.com>
Date: Wed, 30 Mar 2022 11:40:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] block/stream: Drain subtree around graph change
To: Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-block@nongnu.org
References: <20220324140907.17192-1-hreitz@redhat.com>
 <7da3445c-7417-6329-c9e3-4488ab7a96ec@mail.ru>
 <f4d5e653-9dea-539d-136d-1f36fec597f2@redhat.com>
 <8e173cec-d3a1-f8a0-bc07-12b2cfd39d89@redhat.com>
 <18f101ca-5536-644d-d79e-66f88f0328cc@mail.ru>
 <3297c6f5-1093-e7cc-9449-dc3abd3511a0@redhat.com>
 <cba4cda5-c70a-e2e3-9a10-a60b418e153a@mail.ru>
 <7c4aa4e1-4809-628b-1a4c-ccd5a8aa89ce@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <7c4aa4e1-4809-628b-1a4c-ccd5a8aa89ce@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 29/03/2022 um 14:15 schrieb Hanna Reitz:
> On 29.03.22 11:55, Vladimir Sementsov-Ogievskiy wrote:
>> 29.03.2022 11:54, Hanna Reitz wrote:
>>> On 28.03.22 12:24, Vladimir Sementsov-Ogievskiy wrote:
>>>> 28.03.2022 11:09, Hanna Reitz wrote:
>>>>> On 28.03.22 09:44, Hanna Reitz wrote:
>>>>>> On 25.03.22 17:37, Vladimir Sementsov-Ogievskiy wrote:
>>>>>>> 24.03.2022 17:09, Hanna Reitz wrote:
>>>>>>>> When the stream block job cuts out the nodes between top and
>>>>>>>> base in
>>>>>>>> stream_prepare(), it does not drain the subtree manually; it
>>>>>>>> fetches the
>>>>>>>> base node, and tries to insert it as the top node's backing node
>>>>>>>> with
>>>>>>>> bdrv_set_backing_hd().  bdrv_set_backing_hd() however will
>>>>>>>> drain, and so
>>>>>>>> the actual base node might change (because the base node is
>>>>>>>> actually not
>>>>>>>> part of the stream job) before the old base node passed to
>>>>>>>> bdrv_set_backing_hd() is installed.
>>>>>>>>
>>>>>>>> This has two implications:
>>>>>>>>
>>>>>>>> First, the stream job does not keep a strong reference to the
>>>>>>>> base node.
>>>>>>>> Therefore, if it is deleted in bdrv_set_backing_hd()'s drain (e.g.
>>>>>>>> because some other block job is drained to finish), we will get a
>>>>>>>> use-after-free.  We should keep a strong reference to that node.
>>>>>>>>
>>>>>>>> Second, even with such a strong reference, the problem remains
>>>>>>>> that the
>>>>>>>> base node might change before bdrv_set_backing_hd() actually
>>>>>>>> runs and as
>>>>>>>> a result the wrong base node is installed.
>>>>>>>
>>>>>>> Hmm.
>>>>>>>
>>>>>>> So, we don't really need a strong reference, as if it helps to
>>>>>>> avoid some use-after-free, it means that we'll finish up with
>>>>>>> wrong block graph..
>>>>>>
>>>>>> Sure.  But I found it better style to strongly reference a node
>>>>>> while it’s used.  I’d rather have an outdated block graph (as in:
>>>>>> A node that was supposed to disappear would still be in use) than
>>>>>> a use-after-free.
>>>>>>
>>>>>>> Graph modifying operations must be somehow isolated from each other.
>>>>>>>
>>>>>>>>
>>>>>>>> Both effects can be seen in 030's
>>>>>>>> TestParallelOps.test_overlapping_5()
>>>>>>>> case, which has five nodes, and simultaneously streams from the
>>>>>>>> middle
>>>>>>>> node to the top node, and commits the middle node down to the
>>>>>>>> base node.
>>>>>>>> As it is, this will sometimes crash, namely when we encounter the
>>>>>>>> above-described use-after-free.


Interesting. This test was badly crashing when I was applying the patch
"[PATCH 6/6] jobs: ensure sleep in job_sleep_ns is fully performed"

https://patchew.org/QEMU/20220208153655.1251658-1-eesposit@redhat.com
/20220208153655.1251658-7-eesposit@redhat.com/

I could not manage to find what was the root cause of this, but I
remember test_overlapping_5 and test_stream_parallel were sometimes
failing.
I even tried running the tests in the main branch and could not manage
to reproduce the random failure you describe above.


>>>>>>>>
>>>>>>>> Taking a strong reference to the base node, we no longer get a
>>>>>>>> crash,
>>>>>>>> but the resuling block graph is less than ideal: The expected
>>>>>>>> result is
>>>>>>>> obviously that all middle nodes are cut out and the base node is
>>>>>>>> the
>>>>>>>> immediate backing child of the top node.  However, if
>>>>>>>> stream_prepare()
>>>>>>>> takes a strong reference to its base node (the middle node), and
>>>>>>>> then
>>>>>>>> the commit job finishes in bdrv_set_backing_hd(), supposedly
>>>>>>>> dropping
>>>>>>>> that middle node, the stream job will just reinstall it again.
>>>>>>>>
>>>>>>>> Therefore, we need to keep the whole subtree drained in
>>>>>>>> stream_prepare(), so that the graph modification it performs is
>>>>>>>> effectively atomic, i.e. that the base node it fetches is still
>>>>>>>> the base
>>>>>>>> node when bdrv_set_backing_hd() sets it as the top node's
>>>>>>>> backing node.
>>>>>>>
>>>>>>> Emanuele has similar idea of isolating graph changes from each
>>>>>>> other by subtree-drain.
>>>>>>>
>>>>>>> If I understand correctly the idea is that we'll drain all other
>>>>>>> block jobs, so the wouldn't do their block-graph modification
>>>>>>> during drained section. So, we can safely modify the graph.
>>>>>>>
>>>>>>> I don't like this idea:
>>>>>>>
>>>>>>> 1. drained section = stop IO. But we don't need to stop IO in the
>>>>>>> whole subtree to do a needed block-graph modification.
>>>>>>
>>>>>> If you mean to say that draining just the single node should be
>>>>>> sufficient, I’ll be happy to change it.
>>>>>>
>>>>>> Not sure which node, though, because I’d think it would be `base`,
>>>>>> but to safely fetch it I’d need to drain it, which seems to bite
>>>>>> itself in the tail.  That’s why I went for a subtree drain from
>>>>>> `above_base`.
>>>>>>
>>>>>>> 2. Drained section is not a lock, several clients may drain same
>>>>>>> set of nodes.. So we exploit the fact that concurrent clients
>>>>>>> will be paused by drained section and don't proceed to
>>>>>>> graph-modification code.. But are we sure that block-jobs are
>>>>>>> (and will be?) the only concurrent block-graph modifying clients?
>>>>>>> Can qmp commands interleave somehow?
>>>>>>
>>>>>> They can under very specific circumstances and that’s a bug. See
>>>>>> https://lists.nongnu.org/archive/html/qemu-block/2022-03/msg00582.html
>>>>>> .
>>>>>>
>>>>>>> Can some jobs from other subtree start a block-graph modification
>>>>>>> that touches our subtree?
>>>>>>
>>>>>> That would be wrong.  A block job shouldn’t change nodes it
>>>>>> doesn’t own; stream doesn’t own the base, but it also doesn’t
>>>>>> change it, it only needs to have the top node point to it.
>>>>>>
>>>>>>> If go this way, that would be more safe to drain the whole
>>>>>>> block-graph on any block-graph modification..
>>>>>>>
>>>>>>> I think we'd better have a separate global mechanism for
>>>>>>> isolating graph modifications. Something like a global co-mutex
>>>>>>> or queue, where clients waits for their turn in block graph
>>>>>>> modifications.
>>>>>>>
>>>>>>> Here is my old proposal on that topic:
>>>>>>> https://patchew.org/QEMU/20201120161622.1537-1-vsementsov@virtuozzo.com/
>>>>>>>
>>>>>>
>>>>>> That would only solve the very specific issue in 030, right?
>>>>
>>>> It should solve the same issue as your patch. You don't add
>>>> subtree_drain around every graph modification.. Or we already have it?
>>>
>>> Well, I’m not saying it will solve every single bug, but draining in
>>> stream_prepare() will at least mean that that is safe from basically
>>> anything else, because it will prevent concurrent automatic graph
>>> changes (e.g. because of jobs finishing), and QMP commands shouldn’t
>>> be executed in drained sections either (when they do, it’s wrong, but
>>> that seems to occur only extremely rarely).  Draining alone should
>>> make a place safe, it isn’t a lock that all sides need to take.
>>>
>>>>>>   The stream job isn’t protected from any graph modifications but
>>>>>> those coming from mirror.  Might be a solution going forward (I
>>>>>> didn’t look closer at it at the time, given I saw you had a
>>>>>> discussion with Kevin), if we lock every graph change operation
>>>>>> (though a global lock honestly doesn’t sound strictly better than
>>>>>> draining subsections of the graph, both have their drawbacks), but
>>>>>> that doesn’t look like it’d be something for 7.1.
>>>>
>>>> Same way, with draining solution you should make a subtree-drain for
>>>> every graph change operation.
>>>
>>> Since we don’t have any lock yet, draining is the de-facto way we use
>>> to forbid concurrent graph modifications.  I’m not saying we use it
>>> correctly and thoroughly, but it is what we do right now.
>>>
>>>>
>>>>>
>>>>> I wonder whether we could have a short-term version of
>>>>> `BdrvChild.frozen` that’s a coroutine mutex.  If `.frozen` is set,
>>>>> you just can’t change the graph, and you also can’t wait, so that’s
>>>>> just an error.  But if `.frozen_lock` is set, you can wait on it.
>>>>> Here, we’d keep `.frozen` set for all links between top and
>>>>> above_base, and then in prepare() take `.frozen_lock` on the link
>>>>> between above_base and base.
>>>>>
>>>>
>>>> Yes that's seems an alternative to global lock, that doesn't block
>>>> the whole graph. Still, I don't think that is bad to lock the whole
>>>> graph for graph modificaiton, as modification should be rare and fast.
>>>
>>> Fair enough.
>>>
>>>> Another thought: does subtree-drain really drain the whole
>>>> connectivity component of the graph?
>>>>
>>>> imagine something like this:
>>>>
>>>> [A]  [   C  ]
>>>>  |    |    |
>>>>  v    v    v
>>>> [ B    ]  [ D ]
>>>>
>>>>
>>>> If we do subtree drain at node A, this will drain B and C, but not D..
>>>>
>>>> Imagine, some another job is attached to node D, and it will start
>>>> drained section too. So, for example both jobs will share drained
>>>> section on node C. That doesn't seem save, and draining is not a lock.
>>>>
>>>> So, if we are going to rely on drained section as on lock, that
>>>> isolates graph modifications from each other, we should drain the
>>>> whole connectivity component of the graph.
>>>
>>> The drained section is not a lock, but if the other job is only
>>> attached to node D, it won’t change node C.  It might change the link
>>> from C to D, but that doesn’t concern the job that is concerned about
>>> A and B. Overlapping drains are fine.
>>
>> OK. Maybe it works. It's just not obvious to me that subtree_drain
>> works good in all cases. And global graph-modification-lock should
>> obviously work.
>>
>>>
>>>> Next, I'm not relly sure that two jobs can simultaneusly enter
>>>> drained section and do graph modifications. What prevents this?
>>>> Assume two block-stream jobs reaches their finish simultaneously and
>>>> go to subtree-drain. That just means that job_pause will be called
>>>> for both jobs.. But what that means for the block-stream jobs that
>>>> is in bdrv_subtree_drained_beeing() call in stream_prepare()? Seems
>>>> nothing? Then both jobs will start graph modification process
>>>> simultaneously and can interleave on any yield point (for exmaple
>>>> rewriting backing_file in qcow2 metadata).
>>>
>>> So I don’t think that scenario can really happen, because the stream
>>> job freezes the chain between above_base and top, so you can’t really
>>> have two simultaneous stream jobs that cause problems between each
>>> other.
>>
>> They cause problem on the boundary, as base of one stream job may be
>> top of another, and we have also a filter, that should be
>> inserted/removed at some moment. As I remember, that's the problematic
>> case in 030..
>>
>>>
>>> Furthermore, the prepare() functions are run in the main thread, so
>>> the only real danger is actually that draining around the actual
>>> graph modification (bdrv_set_backing_hd()) causes another block job
>>> to finish, modifying the block graph.  But then that job will also
>>> actually finish, because it’s all in the main thread.
>>>
>>> It is true that child_job_drained_poll() says that job that are about
>>> to prepare() are quiesced, but I don’t think that’s a problem, given
>>> that all jobs in that state run in the main thread.
>>>
>>>>
>>>> Another reason, why I think that subtree drain is a wrong tool, as I
>>>> said, is extra IO-stop.
>>>
>>> I know and agree, but that’s an optimization question.
>>>
>>>> Imaging the following graph:
>>>>
>>>> [A]
>>>>  |
>>>>  v
>>>> [B] [C]
>>>>  |   |
>>>>  v   v
>>>> [base]
>>>>
>>>> If we want to rebase A onto base, we actually need only stop IO
>>>> requests in A and B. Why C should suffer from this graph
>>>> modification? IO requests produced by C, and that are living in C
>>>> and in base don't intersect with rebasing A on base process in any way.
>>>>
>>>> ====
>>>>
>>>> Actually, I'm not strictly against your patch, and believe that it
>>>> fixes the problem in most cases. And it's probably OK in short term.
>>>> The only real doubt on including it now is that drained sections
>>>> sometimes lead to dead locks, and is it possible that we now fix the
>>>> bug that happens only in iotest 30 (or is it reported somewhere?)
>>>> and risking to introduce some dead-lock?
>>>
>>> Saying that the example in 030 is contrived would mean we
>>> could/should re-include the base into the list of nodes that belong
>>> to the stream job, which would simply disallow the case in 030 that’s
>>> being tested and fails.
>>>
>>> Then we don’t need a subtree drain, and the plain drain in
>>> bdrv_set_backing_hd() would be fine.
>>>
>>>> Seems that if in some code it's safe to call drained_begin(), it
>>>> should be safe to call subtree_drained_begin(). And if it trigger
>>>> some deadlock, it just shows some another bug.. Is it worth fixing
>>>> now, near to 7.0 release? We live with this bug for years.. Or
>>>> something changed that I missed?
>>>
>>> I mean...  I can understand your concern that adding a subtree drain
>>> has performance implications (when a stream job ends, which shouldn’t
>>> be often).  But I’m not sure whether I should share the deadlock
>>> concern. Sounds like a sad state of affairs if I can’t just drain
>>> something when I need it to be drained.
>>>
>>> I wasn’t aware of this bug, actually.  Now I am, and I feel rather
>>> uncomfortable living with a use-after-free bug, because that’s on the
>>> worse end of the bug spectrum.
>>>
>>
>> OK, I don't know:) And others are silent. Agree that global-lock
>> solution is not for 7.0 anyway. And this one is simple enough. So,
>> take my
>>
>> Acked-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
> 
> Thanks!
> 
> A global lock solution sounds good to me for 7.1+, and it even provides
> a solution to solving the problem with QMP commands being executed while
> other main-thread code is running.  (I mean, the QMP command would still
> be executed, but at least concurrent graph changes would be impossible.)
> 

Discussion about subtree and this "global lock" is here:
https://patchew.org/QEMU/20220301142113.163174-1-eesposit@redhat.com/

@Hanna if you can give it a look and jump into the party as well, that
would be nice.
Maybe what Kevin proposed is what we need instead of subtree drains.

Global lock sounds a little bit wrong naming btw, as it seems that we
are just re-implementing the AioContext lock.

Emanuele


