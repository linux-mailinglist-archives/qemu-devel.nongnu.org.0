Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B92C3516BAF
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 10:06:33 +0200 (CEST)
Received: from localhost ([::1]:36020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlR4h-0005Lz-SK
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 04:06:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nlR0h-0004P2-NJ
 for qemu-devel@nongnu.org; Mon, 02 May 2022 04:02:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nlR0d-0001Eq-6f
 for qemu-devel@nongnu.org; Mon, 02 May 2022 04:02:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651478538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hAz2XK2m5be8tg9BewP6hLvspDhSaU/sz3KghT+MvmQ=;
 b=ZRbMEPLmkcmK1P+yxj+6XAwzsqUdo1ZyyQWYCCqpxlzbn5EQooLrQn45cFit1VqCmKu8e9
 LjVo3aRRERrPv9AqOVD8G5NwhlyjSxQUlImHhaSZYTn6AnZwnKlDMHNlQicgWwCY4LEVkF
 Z6BQAkvr3pl3mtQHphuXkYTCzh36wQY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-RvkYgEPdOb2r9kpAfsjUdA-1; Mon, 02 May 2022 04:02:17 -0400
X-MC-Unique: RvkYgEPdOb2r9kpAfsjUdA-1
Received: by mail-wm1-f69.google.com with SMTP id
 v184-20020a1cacc1000000b00393e492a398so9627061wme.5
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 01:02:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hAz2XK2m5be8tg9BewP6hLvspDhSaU/sz3KghT+MvmQ=;
 b=zLihI4jRl/yKEzIKSSyv+uzx2MpJSYL0SETYUGb7Z3DJgX8UN0IZ6ZXEkyYrzXbmAB
 HlmraMu3gl1qUzG+3AOhpspndEax6gPQVwWXzjM9t1iibJgLNSOfvBine+/QaPQislJ3
 dzScoctNf+N4E2UxY3RHCvC0L5sB7Nmho4EXCFfsrmeqxXHKpRaPeimpzz2t0NAhBKkI
 pLTRWTCw6azWI86poOsi2YA4DIW6hUVFJKRREVMZ5cD2xUrsOLDm5fh4Yc4dSZIigCP7
 OrE+/Aau1x4IFQE1VWN3rgQyRrZlOSftRLNMAHhwAy9HNSva0nYO5uRorL0X7VK9WTdK
 FiEw==
X-Gm-Message-State: AOAM533nxuyV4vpZ/0s+vLy/93Cpfi8YIF9Gqh5pVb1E9OTm4m4qC2jZ
 Aby897iWx2LAdqK8IDc4iR25pAsiM6Donp2ukoylvGffPnCa/jX+PXOoYdaUAf0FFxm0dklnc8O
 eHcuqU7xUXKKNQvE=
X-Received: by 2002:a5d:5690:0:b0:20a:d24b:ad12 with SMTP id
 f16-20020a5d5690000000b0020ad24bad12mr8228000wrv.280.1651478536331; 
 Mon, 02 May 2022 01:02:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxB7jt50x4E6M9dCZ6Pwk3iUnRii2l73umg6yYa53RbtRz7i6EGxXBjQuSASdsun46+KFLWPA==
X-Received: by 2002:a5d:5690:0:b0:20a:d24b:ad12 with SMTP id
 f16-20020a5d5690000000b0020ad24bad12mr8227973wrv.280.1651478535998; 
 Mon, 02 May 2022 01:02:15 -0700 (PDT)
Received: from [192.168.149.183]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a1ced05000000b003942a244f3fsm5663264wmh.24.2022.05.02.01.02.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 01:02:15 -0700 (PDT)
Message-ID: <06af1ad7-b069-72f0-d8a2-82f0ae573256@redhat.com>
Date: Mon, 2 May 2022 10:02:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH v2 0/8] Removal of AioContext lock, bs->parents and
 ->children: new rwlock
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20220426085114.199647-1-eesposit@redhat.com>
 <8f01c640-f876-568a-d6ff-bbb112e5154f@redhat.com>
 <YmpwRKUW5e3P/hhd@stefanha-x1.localdomain>
 <3b156b87-11d5-3eb7-f58a-94939f65ea8f@redhat.com>
 <YmzGV8Evmet8RXUh@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YmzGV8Evmet8RXUh@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 30/04/2022 um 07:17 schrieb Stefan Hajnoczi:
> On Thu, Apr 28, 2022 at 11:56:09PM +0200, Emanuele Giuseppe Esposito wrote:
>>
>>
>> Am 28/04/2022 um 12:45 schrieb Stefan Hajnoczi:
>>> On Wed, Apr 27, 2022 at 08:55:35AM +0200, Emanuele Giuseppe Esposito wrote:
>>>>
>>>>
>>>> Am 26/04/2022 um 10:51 schrieb Emanuele Giuseppe Esposito:
>>>>> Luckly, most of the cases where we recursively go through a graph are
>>>>> the BlockDriverState callback functions in block_int-common.h
>>>>> In order to understand what to protect, I categorized the callbacks in
>>>>> block_int-common.h depending on the type of function that calls them:
>>>>>
>>>>> 1) If the caller is a generated_co_wrapper, this function must be
>>>>>    protected by rdlock. The reason is that generated_co_wrapper create
>>>>>    coroutines that run in the given bs AioContext, so it doesn't matter
>>>>>    if we are running in the main loop or not, the coroutine might run
>>>>>    in an iothread.
>>>>> 2) If the caller calls it directly, and has the GLOBAL_STATE_CODE() macro,
>>>>>    then the function is safe. The main loop is the writer and thus won't
>>>>>    read and write at the same time.
>>>>> 3) If the caller calls it directly, but has not the GLOBAL_STATE_CODE()
>>>>>    macro, then we need to check the callers and see case-by-case if the
>>>>>    caller is in the main loop, if it needs to take the lock, or delegate
>>>>>    this duty to its caller (to reduce the places where to take it).
>>>>>
>>>>> I used the vrc script (https://github.com/bonzini/vrc) to get help finding
>>>>> all the callers of a callback. Using its filter function, I can
>>>>> omit all functions protected by the added lock to avoid having duplicates
>>>>> when querying for new callbacks.
>>>>
>>>> I was wondering, if a function is in category (3) and runs in an
>>>> Iothread but the function itself is not (currently) recursive, meaning
>>>> it doesn't really traverse the graph or calls someone that traverses it,
>>>> should I add the rdlock anyways or not?
>>>>
>>>> Example: bdrv_co_drain_end
>>>>
>>>> Pros:
>>>>    + Covers if in future a new recursive callback for a new/existing
>>>>      BlockDriver is implemented.
>>>>    + Covers also the case where I or someone missed the recursive part.
>>>>
>>>> Cons:
>>>>    - Potentially introducing an unnecessary critical section.
>>>>
>>>> What do you think?
>>>
>>> ->bdrv_co_drain_end() is a callback function. Do you mean whether its
>>> caller, bdrv_drain_invoke_entry(), should take the rdlock around
>>> ->bdrv_co_drain_end()?
>>
>> Yes. The problem is that the coroutine is created in bs AioContext, so
>> it might be in an iothread.
>>
>>>
>>> Going up further in the call chain (and maybe switching threads),
>>> bdrv_do_drained_end() has QLIST_FOREACH(child, &bs->children, next) so
>>> it needs protection. If the caller of bdrv_do_drained_end() holds then
>>> rdlock then I think none of the child functions (including
>>> ->bdrv_co_drain_end()) need to take it explicitly.
>>
>> Regarding bdrv_do_drained_end and similar, they are either running in
>> the main loop (or they will be, if coming from a coroutine) or in the
>> iothread running the AioContext of the bs involved.
>>
>> I think that most of the drains except for mirror.c are coming from main
>> loop. I protected mirror.c in patch 8, even though right now I am not
>> really sure that what I did is necessary, since the bh will be scheduled
>> in the main loop.
>>
>> Therefore we don't really need locks around drains.
> 
> Are you saying rdlock isn't necessary in the main loop because nothing
> can take the wrlock while our code is executing in the main loop?

Yes, that's the idea.
If I am not mistaken (and I hope I am not), only the main loop currently
modifies/is allowed to modify the graph.

The only case where currently we need to take the rdlock in main loop is
when we have the case

simplified_flush_callback(bs) {
	for (child in bs)
		bdrv_flush(child->bs);
}

some_function() {
	GLOBAL_STATE_CODE();
	/* assume bdrv_get_aio_context(bs) != qemu_in_main_thread() */

	bdrv_flush(bs);
		co = coroutine_create(bdrv_get_aio_context(bs))
		qemu_coroutine_enter(co, simplified_flush_callback)
}
> 
> Stefan
> 


