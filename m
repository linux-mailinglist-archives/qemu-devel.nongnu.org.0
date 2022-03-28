Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D9B4E8FD4
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 10:13:38 +0200 (CEST)
Received: from localhost ([::1]:43874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYkVM-0004NR-Kr
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 04:13:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nYkRr-0003XU-71
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 04:09:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nYkRm-0005sy-7J
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 04:09:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648454992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tnxoKcFSrFQetLaw4w1p74M3kuJT1noWo00hk9V1MoQ=;
 b=GXP3DVXPMK55WaREtmw2K/GhAyT9hg0WDBApKu43m62zbCR3pMjI2o7BD7M8Icbur2dyew
 8c0MsMJnRYwUsIXEqaEwyaO3PuFE6IqiBId4kLe9pGjIlahuT3IY4W2sM/RzSpFa5rxbbW
 PUFn0tF+AZNg6/8wghth8e0TpGiPrjw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-1eqKz-CbPV6jzeulPx2llA-1; Mon, 28 Mar 2022 04:09:51 -0400
X-MC-Unique: 1eqKz-CbPV6jzeulPx2llA-1
Received: by mail-ed1-f69.google.com with SMTP id
 w8-20020a50d788000000b00418e6810364so8408628edi.13
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 01:09:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=tnxoKcFSrFQetLaw4w1p74M3kuJT1noWo00hk9V1MoQ=;
 b=Jnk12REMJ9XKpsh2hmg5ftndrFxlR+mH9lCsV5q2LFfXJncwKsHxeaqAIbe5NjOoqf
 YrZ/fsDtAiZvsB016TCtAHlb5uOICQ/nd71a+uIaE4mXdi2DzA4+bTJ9RybQYUab5FpS
 BQlOn3vATDOF4wNW8Qoc3w3VgmaFO4pBuDKa0LTiAOmcq2icUBciTcgwYaL0A1OZ7DnN
 lrKYozARFi/tIA2TSbqcJK/6hnKV0V60czl1aXpq1WTb7nBPVABXQQRtdD96MuWqzTgt
 yGMd9oyU9OJbQXoEoX9GsToIj/9qdkQuARD2EH+TmOGy573rvlOa18Yi7Dd4xwHOnuLl
 8VJA==
X-Gm-Message-State: AOAM532GSJyffTRtWhqsHWQG56W43C1ypEd4i5DAocPijZXawGu1D/K9
 lKu4tBjZtxyDIBh1eTHnqV7n+xUscOG8YeEq7sNARwTeXW5kJtLOLdMWfHh6MhLbONtz0UYRFi3
 6C4xvRAeKocwfpNM=
X-Received: by 2002:a17:907:1687:b0:6df:877e:c81d with SMTP id
 hc7-20020a170907168700b006df877ec81dmr25578799ejc.306.1648454989862; 
 Mon, 28 Mar 2022 01:09:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvvZ6zmYDuRJrD6oEyquzqFSy/Up2shGnaC4VGdJLMZCAv10fvEZyeSJDqjYqqNLJrywYazg==
X-Received: by 2002:a17:907:1687:b0:6df:877e:c81d with SMTP id
 hc7-20020a170907168700b006df877ec81dmr25578769ejc.306.1648454989486; 
 Mon, 28 Mar 2022 01:09:49 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a170906608e00b006d1455acc62sm5662126ejj.74.2022.03.28.01.09.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 01:09:49 -0700 (PDT)
Message-ID: <8e173cec-d3a1-f8a0-bc07-12b2cfd39d89@redhat.com>
Date: Mon, 28 Mar 2022 10:09:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] block/stream: Drain subtree around graph change
From: Hanna Reitz <hreitz@redhat.com>
To: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 qemu-block@nongnu.org
References: <20220324140907.17192-1-hreitz@redhat.com>
 <7da3445c-7417-6329-c9e3-4488ab7a96ec@mail.ru>
 <f4d5e653-9dea-539d-136d-1f36fec597f2@redhat.com>
In-Reply-To: <f4d5e653-9dea-539d-136d-1f36fec597f2@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28.03.22 09:44, Hanna Reitz wrote:
> On 25.03.22 17:37, Vladimir Sementsov-Ogievskiy wrote:
>> 24.03.2022 17:09, Hanna Reitz wrote:
>>> When the stream block job cuts out the nodes between top and base in
>>> stream_prepare(), it does not drain the subtree manually; it fetches 
>>> the
>>> base node, and tries to insert it as the top node's backing node with
>>> bdrv_set_backing_hd().  bdrv_set_backing_hd() however will drain, 
>>> and so
>>> the actual base node might change (because the base node is actually 
>>> not
>>> part of the stream job) before the old base node passed to
>>> bdrv_set_backing_hd() is installed.
>>>
>>> This has two implications:
>>>
>>> First, the stream job does not keep a strong reference to the base 
>>> node.
>>> Therefore, if it is deleted in bdrv_set_backing_hd()'s drain (e.g.
>>> because some other block job is drained to finish), we will get a
>>> use-after-free.  We should keep a strong reference to that node.
>>>
>>> Second, even with such a strong reference, the problem remains that the
>>> base node might change before bdrv_set_backing_hd() actually runs 
>>> and as
>>> a result the wrong base node is installed.
>>
>> Hmm.
>>
>> So, we don't really need a strong reference, as if it helps to avoid 
>> some use-after-free, it means that we'll finish up with wrong block 
>> graph..
>
> Sure.  But I found it better style to strongly reference a node while 
> it’s used.  I’d rather have an outdated block graph (as in: A node 
> that was supposed to disappear would still be in use) than a 
> use-after-free.
>
>> Graph modifying operations must be somehow isolated from each other.
>>
>>>
>>> Both effects can be seen in 030's TestParallelOps.test_overlapping_5()
>>> case, which has five nodes, and simultaneously streams from the middle
>>> node to the top node, and commits the middle node down to the base 
>>> node.
>>> As it is, this will sometimes crash, namely when we encounter the
>>> above-described use-after-free.
>>>
>>> Taking a strong reference to the base node, we no longer get a crash,
>>> but the resuling block graph is less than ideal: The expected result is
>>> obviously that all middle nodes are cut out and the base node is the
>>> immediate backing child of the top node.  However, if stream_prepare()
>>> takes a strong reference to its base node (the middle node), and then
>>> the commit job finishes in bdrv_set_backing_hd(), supposedly dropping
>>> that middle node, the stream job will just reinstall it again.
>>>
>>> Therefore, we need to keep the whole subtree drained in
>>> stream_prepare(), so that the graph modification it performs is
>>> effectively atomic, i.e. that the base node it fetches is still the 
>>> base
>>> node when bdrv_set_backing_hd() sets it as the top node's backing node.
>>
>> Emanuele has similar idea of isolating graph changes from each other 
>> by subtree-drain.
>>
>> If I understand correctly the idea is that we'll drain all other 
>> block jobs, so the wouldn't do their block-graph modification during 
>> drained section. So, we can safely modify the graph.
>>
>> I don't like this idea:
>>
>> 1. drained section = stop IO. But we don't need to stop IO in the 
>> whole subtree to do a needed block-graph modification.
>
> If you mean to say that draining just the single node should be 
> sufficient, I’ll be happy to change it.
>
> Not sure which node, though, because I’d think it would be `base`, but 
> to safely fetch it I’d need to drain it, which seems to bite itself in 
> the tail.  That’s why I went for a subtree drain from `above_base`.
>
>> 2. Drained section is not a lock, several clients may drain same set 
>> of nodes.. So we exploit the fact that concurrent clients will be 
>> paused by drained section and don't proceed to graph-modification 
>> code.. But are we sure that block-jobs are (and will be?) the only 
>> concurrent block-graph modifying clients? Can qmp commands interleave 
>> somehow?
>
> They can under very specific circumstances and that’s a bug.  See 
> https://lists.nongnu.org/archive/html/qemu-block/2022-03/msg00582.html .
>
>> Can some jobs from other subtree start a block-graph modification 
>> that touches our subtree?
>
> That would be wrong.  A block job shouldn’t change nodes it doesn’t 
> own; stream doesn’t own the base, but it also doesn’t change it, it 
> only needs to have the top node point to it.
>
>> If go this way, that would be more safe to drain the whole 
>> block-graph on any block-graph modification..
>>
>> I think we'd better have a separate global mechanism for isolating 
>> graph modifications. Something like a global co-mutex or queue, where 
>> clients waits for their turn in block graph modifications.
>>
>> Here is my old proposal on that topic: 
>> https://patchew.org/QEMU/20201120161622.1537-1-vsementsov@virtuozzo.com/
>
> That would only solve the very specific issue in 030, right?  The 
> stream job isn’t protected from any graph modifications but those 
> coming from mirror.  Might be a solution going forward (I didn’t look 
> closer at it at the time, given I saw you had a discussion with 
> Kevin), if we lock every graph change operation (though a global lock 
> honestly doesn’t sound strictly better than draining subsections of 
> the graph, both have their drawbacks), but that doesn’t look like it’d 
> be something for 7.1.

I wonder whether we could have a short-term version of 
`BdrvChild.frozen` that’s a coroutine mutex.  If `.frozen` is set, you 
just can’t change the graph, and you also can’t wait, so that’s just an 
error.  But if `.frozen_lock` is set, you can wait on it. Here, we’d 
keep `.frozen` set for all links between top and above_base, and then in 
prepare() take `.frozen_lock` on the link between above_base and base.


