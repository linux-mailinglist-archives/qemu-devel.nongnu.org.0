Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E52E84FFA07
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 17:24:37 +0200 (CEST)
Received: from localhost ([::1]:38438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neerE-0007GJ-Hd
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 11:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1neehH-0002QS-BG
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 11:14:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1neehE-0004qy-2g
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 11:14:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649862855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mlbb+3NPsf0UrIX8UIxhAwW7IxhNAgaiqh0yQXrf/IQ=;
 b=fA43DA0qmJmRAEzdW2y5xdo7aE+C9pSTQgHZ38BTdjvdw+gzitulwA7Er5USmEXnzWmCzV
 jVrb6vmLvw6FnrZIhDwnqLfzv77txiC4v/F7ErlQVAazOLoGr2iqj37L6T7ljDx0V8jQe4
 VXlE3JYkZVyblKPoSoZCkAdK4GVVbH8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-u8IsXheRMuWPKeWeb5QcYw-1; Wed, 13 Apr 2022 11:14:13 -0400
X-MC-Unique: u8IsXheRMuWPKeWeb5QcYw-1
Received: by mail-qv1-f70.google.com with SMTP id
 jr12-20020a0562142a8c00b0044429017bcbso1969662qvb.20
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 08:14:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mlbb+3NPsf0UrIX8UIxhAwW7IxhNAgaiqh0yQXrf/IQ=;
 b=xZdQsMG2yDyBqYXWSOJVllqVFvPFbf2FuKc3xUN2MY3YxeWdc31AfiaZEFLDR3ltLt
 D6Q6aU6Lqb1PW8eeUSu0GU92vkkhp3kgQ1DV/OMEfAn/yxjXCC0yNd/fPSbqOU3FUTmO
 XWu3XTNfcRUyvOS2aZjpo4FaYHSl/BaJ7myt5QaDBS4+WdhOYdKJ2vONd18HQBJiADma
 EnIwtxT5/D+XwUtVDG9vgvhLHtYRKS0J+weHHIXqZ/+qu6881RYmw3N6hB3scXrv/yVJ
 50nlde2xe5PCkJDx2sX+dRtYbmSdEd4rzMGfqRW8aN5aaJt9V7hhwRJ0Uc93Y3utMpNL
 cm5Q==
X-Gm-Message-State: AOAM533gwkCmPPKXzsxeaDSOeqe/Vd0XR5cg2HL4fyThecClyLJwCt7C
 SEamOL97zvegv0ajMeGo9giPJoQRgt3S0E7geaiXT1WwBja0y+b8boWHo7CtiKbytxKXLx7WAzW
 5puH12bPiNoSsdx8=
X-Received: by 2002:a05:620a:d87:b0:67b:3105:4f7f with SMTP id
 q7-20020a05620a0d8700b0067b31054f7fmr7280380qkl.230.1649862853016; 
 Wed, 13 Apr 2022 08:14:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLIWwAK+YjfqdAtBYa/OZacEm+LAw57yX4RhadceRCP/8jubZ63nW2PMsVt/UUxZChlayy7A==
X-Received: by 2002:a05:620a:d87:b0:67b:3105:4f7f with SMTP id
 q7-20020a05620a0d8700b0067b31054f7fmr7280347qkl.230.1649862852739; 
 Wed, 13 Apr 2022 08:14:12 -0700 (PDT)
Received: from [192.168.149.183]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 w9-20020a05620a444900b00699b2ba4cd1sm23161996qkp.56.2022.04.13.08.14.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 08:14:12 -0700 (PDT)
Message-ID: <5d34e709-fe59-70df-2723-49f252aaed78@redhat.com>
Date: Wed, 13 Apr 2022 17:14:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH 0/5] Removal of AioContext lock, bs->parents and
 ->children: proof of concept
To: Kevin Wolf <kwolf@redhat.com>
References: <af53599c-c7de-d2b8-00fa-0e7d28121251@redhat.com>
 <e9eeec7b-d03e-5e8e-cc42-568c670726ca@redhat.com>
 <c8d45cd9-e7de-9acd-3fd6-13de58f5ce48@redhat.com>
 <c6a12090-b6c3-31d8-fb90-a76c9dd2e949@redhat.com>
 <88f2798b-9327-e54f-5792-e37404b94ef7@redhat.com>
 <8ae70388-ff46-6ec1-7f84-14d41ca9a6dd@redhat.com>
 <311c2e0a-fb2c-241c-cbd1-1162f7e74e18@redhat.com>
 <9d3c36f0-0834-ec9c-8473-d052d64a61dd@redhat.com>
 <69b2ce82-4826-71ed-9c32-d323df69b7c4@redhat.com>
 <6b88890c-f191-7f77-93eb-91f4951e179d@redhat.com>
 <Ylbjd3kzEsBZmgJQ@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <Ylbjd3kzEsBZmgJQ@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 13/04/2022 um 16:51 schrieb Kevin Wolf:
> Am 13.04.2022 um 15:43 hat Emanuele Giuseppe Esposito geschrieben:
>> So this is a more concrete and up-to-date header.
>>
>> Few things to notice:
>> - we have a list of AioContext. They are registered once an aiocontext
>> is created, and deleted when it is destroyed.
>> This list is helpful because each aiocontext can only modify its own
>> number of readers, avoiding unnecessary cacheline bouncing
>>
>> - if a coroutine changes aiocontext, it's ok with regards to the
>> per-aiocontext reader counter. As long as the sum is correct, there's no
>> issue. The problem comes only once the original aiocontext is deleted,
>> and at that point we need to move the count it held to a shared global
>> variable, otherwise we risk to lose track of readers.
> 
> So the idea is that we can do bdrv_graph_co_rdlock() in one thread and
> the corresponding bdrv_graph_co_rdunlock() in a different thread?
> 
> Would the unlock somehow remember the original thread, or do you use the
> "sum is correct" argument and allow negative counter values, so you can
> end up having count +1 in A and -1 in B to represent "no active
> readers"? If this happens, it's likely to happen many times, so do we
> have to take integer overflows into account then?
> 
>> - All synchronization between the flags explained in this header is of
>> course handled in the implementation. But for now it would be nice to
>> have a feedback on the idea/API.
>>
>> So in short we need:
>> - per-aiocontext counter
>> - global list of aiocontext
>> - global additional reader counter (in case an aiocontext is deleted)
>> - global CoQueue
>> - global has_writer flag
>> - global QemuMutex to protect the list access
>>
>> Emanuele
>>
>> #ifndef BLOCK_LOCK_H
>> #define BLOCK_LOCK_H
>>
>> #include "qemu/osdep.h"
>>
>> /*
>>  * register_aiocontext:
>>  * Add AioContext @ctx to the list of AioContext.
>>  * This list is used to obtain the total number of readers
>>  * currently running the graph.
>>  */
>> void register_aiocontext(AioContext *ctx);
>>
>> /*
>>  * unregister_aiocontext:
>>  * Removes AioContext @ctx to the list of AioContext.
>>  */
>> void unregister_aiocontext(AioContext *ctx);
>>
>> /*
>>  * bdrv_graph_wrlock:
>>  * Modify the graph. Nobody else is allowed to access the graph.
>>  * Set global has_writer to 1, so that the next readers will wait
>>  * that writer is done in a coroutine queue.
>>  * Then keep track of the running readers by counting what is the total
>>  * amount of readers (sum of all aiocontext readers), and wait until
>>  * they all finish with AIO_WAIT_WHILE.
>>  */
>> void bdrv_graph_wrlock(void);
> 
> Do we need a coroutine version that yields instead of using
> AIO_WAIT_WHILE() or are we sure this will only ever be called from
> non-coroutine contexts?

writes (graph modifications) are always done under BQL in the main loop.
Except an unit test, I don't think a coroutine ever does that.

> 
>> /*
>>  * bdrv_graph_wrunlock:
>>  * Write finished, reset global has_writer to 0 and restart
>>  * all readers that are waiting.
>>  */
>> void bdrv_graph_wrunlock(void);
>>
>> /*
>>  * bdrv_graph_co_rdlock:
>>  * Read the bs graph. Increases the reader counter of the current
>> aiocontext,
>>  * and if has_writer is set, it means that the writer is modifying
>>  * the graph, therefore wait in a coroutine queue.
>>  * The writer will then wake this coroutine once it is done.
>>  *
>>  * This lock cannot be taken recursively.
>>  */
>> void coroutine_fn bdrv_graph_co_rdlock(void);
> 
> What prevents it from being taken recursively when it's just a counter?
> (I do see however, that you can't take a reader lock while you have the
> writer lock or vice versa because it would deadlock.)
> 
I actually didn't add the assertion to prevent it from being recoursive
yet, but I think it simplifies everything if it's not recoursive

> Does this being a coroutine_fn mean that we would have to convert QMP
> command handlers to coroutines so that they can take the rdlock while
> they don't expect the graph to change? Or should we have a non-coroutine
> version, too, that works with AIO_WAIT_WHILE()?

Why convert the QMP command handlers? coroutine_fn was just to signal
that it can also be called from coroutines, like the ones created by the
blk_* API.
A reader does not have to be a coroutine. AIO_WAIT_WHILE is not
mandatory to allow it to finish, it helps to ensure progress in case
some reader is waiting for something, but other than that is not
necessary IMO.

> Or should this only be taken for very small pieces of code directly
> accessing the BdrvChild objects, and high-level users like QMP commands
> shouldn't even consider themselves readers?
> 

No I think if we focus on small pieces of code we end up having a
million lock/unlock pairs.

>> /*
>>  * bdrv_graph_rdunlock:
>>  * Read terminated, decrease the count of readers in the current aiocontext.
>>  * If the writer is waiting for reads to finish (has_writer == 1), signal
>>  * the writer that we are done via aio_wait_kick() to let it continue.
>>  */
>> void coroutine_fn bdrv_graph_co_rdunlock(void);
>>
>> #endif /* BLOCK_LOCK_H */
> 
> I expect that in the final version, we might want to have some sugar
> like a WITH_BDRV_GRAPH_RDLOCK_GUARD() macro, but obviously that doesn't
> affect the fundamental design.

Yeah I will ping you once I get to that point ;)

Emanuele
> 
> Kevin
> 


