Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F20924EC28D
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 14:00:01 +0200 (CEST)
Received: from localhost ([::1]:39432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZWzY-0003w8-IP
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 08:00:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nZWvX-0001QF-NQ
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 07:55:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nZWvU-0007TD-9l
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 07:55:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648641347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lJXzbLx2bynKi/s9STd2RzrgGAa+fjJygIe1sWEaYcg=;
 b=FL4FTzgQ0hMry13XQx0gBdgcboy3fUNundA33iHjBHpiEzycKrgyegFj8WZeAaKG8HEoD1
 QRGcn3pAp5v3iOSaFaxLnjCBnIVQXlV0B76gT1ppkKeWmofkClCI5LiGYEzpGSPkfjrZtT
 A9Pm/8vBzfiWLH4y3D3LaIDq1ENYyNE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-z1_tAX7aNr2FCOF_yi83hg-1; Wed, 30 Mar 2022 07:55:46 -0400
X-MC-Unique: z1_tAX7aNr2FCOF_yi83hg-1
Received: by mail-qk1-f200.google.com with SMTP id
 w200-20020a3762d1000000b0067d2149318dso12359658qkb.1
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 04:55:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lJXzbLx2bynKi/s9STd2RzrgGAa+fjJygIe1sWEaYcg=;
 b=UbgI/KdZc1Trblq2xqkOONykvW89Z1RgC97hPTU9VxLp0WIFdO44Q4DgxplFkpWha0
 EC5uItC8OROp80CY6GxnHZtk28Li63+Vhecv1QzSALOVuUNrA+Ib7EyZZYGljvAHZDI8
 JR8s8Hany88QkmfYFklCKKoKP7bfr+uzD2ojmrjid4rbTRVbx6ZP4Nc65XX6G4FdYL1V
 Rjl6SrdqZkDhkiv0y8yMoHsj/r8M5iYp+8iOWtPNpraTbBzaxzEKo6taObTaROp3dqjh
 ISM8WlpPt0nSknD8joEi75PRDmizQfgiOBwEvQW+kgaruZFTMF6miqQ248Zy43vvZmgb
 ht1A==
X-Gm-Message-State: AOAM530g9G3UDiebNn/FhKUZc3mPJ7I/4zEzOSqUIStmT5TH/VsuE46b
 IHmsimZW1/MoocrHo9pKPQuNXFrXNvCCucdCPOLR/kW7AZCvFoaHLEb7cc3sNqg01I593ZQFD/z
 1iTa6mQclqxbbfhY=
X-Received: by 2002:a05:620a:2847:b0:67d:2bad:422f with SMTP id
 h7-20020a05620a284700b0067d2bad422fmr23870127qkp.559.1648641345336; 
 Wed, 30 Mar 2022 04:55:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQzDKlJB+E7YzejqtE7W3v414SgVKPwog7cIzk2Sr8L/V6rXIWnDtA3CuovFuRhF2aGc/VcA==
X-Received: by 2002:a05:620a:2847:b0:67d:2bad:422f with SMTP id
 h7-20020a05620a284700b0067d2bad422fmr23870106qkp.559.1648641344952; 
 Wed, 30 Mar 2022 04:55:44 -0700 (PDT)
Received: from [192.168.149.116]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 bm1-20020a05620a198100b0047bf910892bsm11584069qkb.65.2022.03.30.04.55.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 04:55:44 -0700 (PDT)
Message-ID: <a4d3fc47-0769-7d11-47aa-a1c4ac503406@redhat.com>
Date: Wed, 30 Mar 2022 13:55:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH 0/5] Removal of AioContext lock, bs->parents and
 ->children: proof of concept
To: Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20220301142113.163174-1-eesposit@redhat.com>
 <Yh89L8gT46MbSJCQ@stefanha-x1.localdomain>
 <af53599c-c7de-d2b8-00fa-0e7d28121251@redhat.com>
 <e9eeec7b-d03e-5e8e-cc42-568c670726ca@redhat.com>
 <c8d45cd9-e7de-9acd-3fd6-13de58f5ce48@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <c8d45cd9-e7de-9acd-3fd6-13de58f5ce48@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 30/03/2022 um 12:53 schrieb Hanna Reitz:
> On 17.03.22 17:23, Emanuele Giuseppe Esposito wrote:
>>
>> Am 09/03/2022 um 14:26 schrieb Emanuele Giuseppe Esposito:
>>>>> * Drains allow the caller (either main loop or iothread running
>>>>> the context) to wait all in_flights requests and operations
>>>>> of a BDS: normal drains target a given node and is parents, while
>>>>> subtree ones also include the subgraph of the node. Siblings are
>>>>> not affected by any of these two kind of drains.
>>>> Siblings are drained to the extent required for their parent node to
>>>> reach in_flight == 0.
>>>>
>>>> I haven't checked the code but I guess the case you're alluding to is
>>>> that siblings with multiple parents could have other I/O in flight that
>>>> will not be drained and further I/O can be submitted after the parent
>>>> has drained?
>>> Yes, this in theory can happen. I don't really know if this happens
>>> practically, and how likely is to happen.
>>>
>>> The alternative would be to make a drain that blocks the whole graph,
>>> siblings included, but that would probably be an overkill.
>>>
>> So I have thought about this, and I think maybe this is not a concrete
>> problem.
>> Suppose we have a graph where "parent" has 2 children: "child" and
>> "sibling". "sibling" also has a blockjob.
>>
>> Now, main loop wants to modify parent-child relation and maybe detach
>> child from parent.
>>
>> 1st wrong assumption: the sibling is not drained. Actually my strategy
>> takes into account draining both nodes, also because parent could be in
>> another graph. Therefore sibling is drained.
>>
>> But let's assume "sibling" is the sibling of the parent.
>>
>> Therefore we have
>> "child" -> "parent" -> "grandparent"
>> and
>> "blockjob" -> "sibling" -> "grandparent"
>>
>> The issue is the following: main loop can't drain "sibling", because
>> subtree_drained does not reach it. Therefore blockjob can still run
>> while main loop modifies "child" -> "parent". Blockjob can either:
>> 1) drain, but this won't affect "child" -> "parent"
>> 2) read the graph in other ways different from drain, for example
>> .set_aio_context recursively touches the whole graph.
>> 3) write the graph.
> 
> I don’t really understand the problem here.  If the block job only
> operates on the sibling subgraph, why would it care what’s going on in
> the other subgraph?

We are talking about something that probably does not happen, but what
if it calls a callback similar to .set_aio_context that goes through the
whole graph?

Even though the first question is: is there such callback?

Second even more irrealistic case is when a job randomly looks for a bs
in another connectivity component and for example drains it.
Again probably impossible.

> Block jobs should own all nodes that are associated with them (e.g.
> because they intend to drop or replace them when the job is done), so
> when part of the graph is drained, all jobs that could modify that part
> should be drained, too.

What do you mean with "own"?

> 
>> 3) can be only performed in the main loop, because it's a graph
>> operation. It means that the blockjob runs when the graph modifying
>> coroutine/bh is not running. They never run together.
>> The safety of this operation relies on where the drains are and will be
>> inserted. If you do like in my patch "block.c:
>> bdrv_replace_child_noperm: first call ->attach(), and then add child",
>> then we would have problem, because we drain between two writes, and the
>> blockjob will find an inconsistent graph. If we do it as we seem to do
>> it so far, then we won't really have any problem.
>>
>> 2) is a read, and can theoretically be performed by another thread. But
>> is there a function that does that? .set_aio_context for example is a GS
>> function, so we will fall back to case 3) and nothing bad would happen.
>>
>> Is there a counter example for this?
>>
>> -----------
>>
>> Talking about something else, I discussed with Kevin what *seems* to be
>> an alternative way to do this, instead of adding drains everywhere.
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
> 
> Well, sounds complicated.  So I’m asking myself whether this would be
> noticeably better than just an RwLock for graph modifications, like the
> global lock Vladimir has proposed.

But the point is then: aren't we re-inventing an AioContext lock?
the lock will protect not only ->parents and ->child, but also other
bdrv fields that are concurrently read/written.

I don't know, it seems to me that there is a lot of uncertainty on which
way to take...

Emanuele


