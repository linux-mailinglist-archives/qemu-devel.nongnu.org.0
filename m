Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DDE513E40
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 23:58:37 +0200 (CEST)
Received: from localhost ([::1]:45414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkC9j-0003cA-HI
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 17:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nkC7V-0002cJ-Tn
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 17:56:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nkC7S-0003qz-Nv
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 17:56:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651182973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pfMBBG6KhUJlmrnwxOFWBt4tjHxB0UxoI8nHEU3taI0=;
 b=YaGdf/MN0KugMOlffTitqGf16s1d1YVWqJ+ysnc9JN+ZPMSrIg/P1I7C9r+B9T7/Hf7Jzs
 q07QBzUzi1JVIyeNh8M8XrOm+Rj/zMLAhUJ+qUJFjrOsf39h1C5L9DJQxqf6ANsisJen6l
 zbWRb1OzlO94RLJayrRzY1JtPXoAgGM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-MBve0QUhOKyRtkCIWvMKxg-1; Thu, 28 Apr 2022 17:56:12 -0400
X-MC-Unique: MBve0QUhOKyRtkCIWvMKxg-1
Received: by mail-wm1-f72.google.com with SMTP id
 c62-20020a1c3541000000b0038ec265155fso4906728wma.6
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 14:56:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pfMBBG6KhUJlmrnwxOFWBt4tjHxB0UxoI8nHEU3taI0=;
 b=s3HLLY6bh/Icox9H/C6bpuk14Hwb0ZvM/I33pZkllpbQX3bakPOvsWcLzA5alZbpel
 5of53YFZAHZZk33CF1yTzXNobYOcrrUjPmC7/kVNNPVDgCaqB32DAmpkrJRZ7ahK1ZqI
 nSckLg5dvAp7E5wuyU4HwF2J6ctQ0GyBOZC/QFLjtofoBnh1IAzhW4uxpsMQTGJHiaXi
 sDvF00j+mGRsuUfzYvcSgXaYyyHrNJSib68QD1I9XAvFT/WE1VB7ymqstpHkYCjuLFcB
 Rxr9mmpiPCyJfKJP4TDD1uOYwDx5KI0yt2g0H+Ej27TQhW7wFIG9Vy3S5u1NCr90JW0G
 FOcw==
X-Gm-Message-State: AOAM530kG7rrap0PdY12d3QU4pWxTDeGydxj+Opje5h0lyE9EJT23w75
 5bKYfwE/4kQFKtR/OcBWDkURxxEyj2QRQLHgDkXRh/dFya12dMcILTYgAKAzaXY6CzcG4eQ3fAD
 XNLGuE1dKOnGQBR4=
X-Received: by 2002:a05:600c:1d0b:b0:394:1e75:1fef with SMTP id
 l11-20020a05600c1d0b00b003941e751fefmr239439wms.5.1651182971412; 
 Thu, 28 Apr 2022 14:56:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxt/u6CVfdDuY7OeAXr5pu5Tujfz6X/zU8DUD0f13oqOaBuyuHInU7FipQzPJOUYwcCwHlZsQ==
X-Received: by 2002:a05:600c:1d0b:b0:394:1e75:1fef with SMTP id
 l11-20020a05600c1d0b00b003941e751fefmr239416wms.5.1651182971079; 
 Thu, 28 Apr 2022 14:56:11 -0700 (PDT)
Received: from ?IPV6:2a02:1206:4552:34c0:71ab:1dfe:eb3b:43f9?
 ([2a02:1206:4552:34c0:71ab:1dfe:eb3b:43f9])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a5d47ca000000b0020a992ce354sm1029381wrc.76.2022.04.28.14.56.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 14:56:10 -0700 (PDT)
Message-ID: <3b156b87-11d5-3eb7-f58a-94939f65ea8f@redhat.com>
Date: Thu, 28 Apr 2022 23:56:09 +0200
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
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YmpwRKUW5e3P/hhd@stefanha-x1.localdomain>
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



Am 28/04/2022 um 12:45 schrieb Stefan Hajnoczi:
> On Wed, Apr 27, 2022 at 08:55:35AM +0200, Emanuele Giuseppe Esposito wrote:
>>
>>
>> Am 26/04/2022 um 10:51 schrieb Emanuele Giuseppe Esposito:
>>> Luckly, most of the cases where we recursively go through a graph are
>>> the BlockDriverState callback functions in block_int-common.h
>>> In order to understand what to protect, I categorized the callbacks in
>>> block_int-common.h depending on the type of function that calls them:
>>>
>>> 1) If the caller is a generated_co_wrapper, this function must be
>>>    protected by rdlock. The reason is that generated_co_wrapper create
>>>    coroutines that run in the given bs AioContext, so it doesn't matter
>>>    if we are running in the main loop or not, the coroutine might run
>>>    in an iothread.
>>> 2) If the caller calls it directly, and has the GLOBAL_STATE_CODE() macro,
>>>    then the function is safe. The main loop is the writer and thus won't
>>>    read and write at the same time.
>>> 3) If the caller calls it directly, but has not the GLOBAL_STATE_CODE()
>>>    macro, then we need to check the callers and see case-by-case if the
>>>    caller is in the main loop, if it needs to take the lock, or delegate
>>>    this duty to its caller (to reduce the places where to take it).
>>>
>>> I used the vrc script (https://github.com/bonzini/vrc) to get help finding
>>> all the callers of a callback. Using its filter function, I can
>>> omit all functions protected by the added lock to avoid having duplicates
>>> when querying for new callbacks.
>>
>> I was wondering, if a function is in category (3) and runs in an
>> Iothread but the function itself is not (currently) recursive, meaning
>> it doesn't really traverse the graph or calls someone that traverses it,
>> should I add the rdlock anyways or not?
>>
>> Example: bdrv_co_drain_end
>>
>> Pros:
>>    + Covers if in future a new recursive callback for a new/existing
>>      BlockDriver is implemented.
>>    + Covers also the case where I or someone missed the recursive part.
>>
>> Cons:
>>    - Potentially introducing an unnecessary critical section.
>>
>> What do you think?
> 
> ->bdrv_co_drain_end() is a callback function. Do you mean whether its
> caller, bdrv_drain_invoke_entry(), should take the rdlock around
> ->bdrv_co_drain_end()?

Yes. The problem is that the coroutine is created in bs AioContext, so
it might be in an iothread.

> 
> Going up further in the call chain (and maybe switching threads),
> bdrv_do_drained_end() has QLIST_FOREACH(child, &bs->children, next) so
> it needs protection. If the caller of bdrv_do_drained_end() holds then
> rdlock then I think none of the child functions (including
> ->bdrv_co_drain_end()) need to take it explicitly.

Regarding bdrv_do_drained_end and similar, they are either running in
the main loop (or they will be, if coming from a coroutine) or in the
iothread running the AioContext of the bs involved.

I think that most of the drains except for mirror.c are coming from main
loop. I protected mirror.c in patch 8, even though right now I am not
really sure that what I did is necessary, since the bh will be scheduled
in the main loop.

Therefore we don't really need locks around drains.

Emanuele
> 
> Stefan
> 


