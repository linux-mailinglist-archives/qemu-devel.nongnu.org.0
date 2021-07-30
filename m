Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB563DBBCD
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 17:12:43 +0200 (CEST)
Received: from localhost ([::1]:52696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9UBm-0000KR-5t
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 11:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m9UAc-0006dB-Na
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 11:11:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m9UAZ-0004mR-2I
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 11:11:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627657886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WmZyup9TduHnZ3V6O6pYYM26XijgZzxKMItXdR8SuhM=;
 b=hPmr13RTcJUWE1BshQQfs+UsdoKecYtnURw875+xNgBRxQvYnybK24j5m6Ta22/eiy9NRH
 j1MvseNbIH7670nRwFYlrlCoz2E7+9qwjC0VxdLH0VlBbqOBtuiqyzWUxrbf/j6Hi5aVwA
 GJf9zzJUtXlx1rEgLqqOu43mAYXXEUQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-LH7wFL_RNTiXKA941RSNxw-1; Fri, 30 Jul 2021 11:11:25 -0400
X-MC-Unique: LH7wFL_RNTiXKA941RSNxw-1
Received: by mail-wm1-f72.google.com with SMTP id
 f25-20020a1c6a190000b029024fa863f6b0so3293360wmc.1
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 08:11:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=WmZyup9TduHnZ3V6O6pYYM26XijgZzxKMItXdR8SuhM=;
 b=A9wUSSj759V+6rXc/wtzLK3ABizp301pzst7Rn7lNtoxmjctH4/xVtmu8MMhydjLx4
 TeO/c8O7BVNBIp6tWdACjA6jVHjRcN3ZcYCodOHGJKmAPmniO9BTBRQMS7RaxW4ChmGx
 I+QHqPaRidNQAa2KINN1SGJHLT1/+Xk0rUnveLFrFEUvVnpfbU9jsXn0LiMd4Z3WgWJr
 +BK2x/MSqp32UAkAGxTma8tRR442doxUspRxLAeEns/LpYyvDt5ywP9K0AaWOPZ1kNsL
 AMaEAyZB/y3XkebEceZaZyxe8H9aPeLzmAfEqEhhZYAyfVBn1Ey+vMieLHJ8erwkm8TY
 m56w==
X-Gm-Message-State: AOAM533D4/Czk3tIbS0xn+J3IRGmFpEUGtpTgNKwveNHF5ruR0757N2Q
 YzJEuUEsPvgz+zMmK3pJNkTQlDx5HQG05vU4PmzFr0QMxlYv0sIbEKZGV7vySkEv+U3O2AeKYXt
 TJgkEL9vcfQXqI7k=
X-Received: by 2002:a5d:4a85:: with SMTP id o5mr3571956wrq.67.1627657884546;
 Fri, 30 Jul 2021 08:11:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDHMCuXb9PUx8BEcDYJ87tWryM+rKKnpHeQ7PEmdAtT8YGSCehoIQo797PsGzG7GW6+tjh0Q==
X-Received: by 2002:a5d:4a85:: with SMTP id o5mr3571838wrq.67.1627657883279;
 Fri, 30 Jul 2021 08:11:23 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 9sm1971338wmf.34.2021.07.30.08.11.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 08:11:22 -0700 (PDT)
Subject: Re: [PATCH RFC 0/3] mirror: rework soft-cancelling READY mirror
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210727164754.62895-1-vsementsov@virtuozzo.com>
 <eb6db91e-9b6b-331e-8a8d-ee4fcf60ff2f@redhat.com>
 <19e149dc-ff1a-09b3-2d6c-2d046e9daabb@virtuozzo.com>
 <660d9a7b-beb9-c2a2-33eb-d894aae8b1e0@redhat.com>
 <af37e046-46d3-2791-f91d-bdbaec9ee5e5@virtuozzo.com>
 <a8e6f5d7-2bf8-6214-3689-6350592eab07@redhat.com>
 <a3f7afef-8eb2-80b3-1a9e-9c37a1cf85f9@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <5167ea49-ca2b-5fdf-0a24-bae2add0c084@redhat.com>
Date: Fri, 30 Jul 2021 17:11:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a3f7afef-8eb2-80b3-1a9e-9c37a1cf85f9@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.125, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29.07.21 18:29, Vladimir Sementsov-Ogievskiy wrote:
> 29.07.2021 16:47, Max Reitz wrote:
>> On 29.07.21 13:35, Vladimir Sementsov-Ogievskiy wrote:
>>> 29.07.2021 13:38, Max Reitz wrote:
>>>> On 29.07.21 12:02, Vladimir Sementsov-Ogievskiy wrote:
>>>>> 28.07.2021 10:00, Max Reitz wrote:
>>>>>> On 27.07.21 18:47, Vladimir Sementsov-Ogievskiy wrote:
>>>>>>> Hi all!
>>>>>>>
>>>>>>> That's an alternative to (part of) Max's
>>>>>>> "[PATCH for-6.1? v2 0/7] mirror: Handle errors after READY cancel"
>>>>>>> and shows' my idea of handling soft-cancelling READY mirror case
>>>>>>> directly in qmp_block_job_cancel. And cleanup all other job 
>>>>>>> cancelling
>>>>>>> functions.
>>>>>>>
>>>>>>> That's untested draft, don't take it to heart :)
>>>>>>
>>>>>> Well, I would have preferred it if you’d rebased this on top of 
>>>>>> that series, precisely because it’s an alternative to only part 
>>>>>> of it. And if it’s just an untested draft, that would have been 
>>>>>> even better, because it would’ve given a better idea on what the 
>>>>>> cleanup looks like.
>>>>>>
>>>>>> There are also things like this series making cancel internally 
>>>>>> always a force-cancel, where I’m not sure whether we want that in 
>>>>>> the replication driver or not[1].  With my series, we add an 
>>>>>> explicit parameter, so we’re forced to think about it, and then 
>>>>>> in this series on top we can just drop the parameter for all 
>>>>>> force-cancel invocations again, and for all non-force-cancel 
>>>>>> invocations we would have to think a bit more.
>>>>>
>>>>> I now don't sure that patch 5 of your series is correct (see my 
>>>>> last answer to it), that's why I decided to not base on it.
>>>>
>>>> Well, we can always take patch 5 from v1.  (Where I changed any 
>>>> job_is_cancelled() to job_cancel_requested() when it influenced the 
>>>> external interface.)
>>>>
>>>>> My series has the benefit of handling soft-mirror-cancel case the 
>>>>> other way and handles mirror finalization in case of soft-cancel 
>>>>> properly.
>>>>>
>>>>>>
>>>>>> Specifically as for this series, I don’t like job_complete_ex() 
>>>>>> very much, I think the parameter should be part of job_complete() 
>>>>>> itself.
>>>>>
>>>>> That was my idea. But job_complete is passed as function pointer, 
>>>>> so changing its prototype would be more work.. But I think it's 
>>>>> possible.
>>>>>
>>>>>>   If we think that’s too specific of a mirror parameter to 
>>>>>> include in normal job_complete(), well, then there shouldn’t be a 
>>>>>> job_complete_ex() either, and do_graph_change should be a 
>>>>>> property of the mirror job (perhaps as pivot_on_completion) 
>>>>>> that’s cleared by qmp_block_job_cancel() before invoking 
>>>>>> job_complete().
>>>>>
>>>>> This way users will lose a way to make a decision during job 
>>>>> running..
>>>>
>>>> On the contrary, it would be a precursor to letting the user change 
>>>> this property explicitly with a new QMP command.
>>>>
>>>>> But probably they don't need actually. Moving the option to mirror 
>>>>> job parameter seems a good option to me.
>>>>>
>>>>>>
>>>>>> Max
>>>>>>
>>>>>> [1] Although looking at it again now, it probably wants 
>>>>>> force-cancel.
>>>>>>
>>>>>
>>>>>
>>>>> What do you think of my idea to keep old bugs as is and just 
>>>>> deprecate block-job-cancel and add a new interface for 
>>>>> "no-graph-change mirror" case?
>>>>
>>>> I don’t see a reason for that.  The fix isn’t that complicated.
>>>>
>>>> Also, honestly, I don’t see a good reason for deprecating anything.
>>>>
>>>
>>> Current interface lead to mess in the code, that's bad. Cancellation 
>>> mode that is actually a kind of completion (and having comments in 
>>> many places about that) - that shows for me that interface is not 
>>> good.. It's a question of terminology, what to call "cancel". Also, 
>>> that's not the first time this question arise. Remember my recent 
>>> cancel-in-flight-requests series, when I thought that "cancel is 
>>> cancel" and didn't consider soft-cancel of mirror.. And reviewers 
>>> didn't caught it. I don't think that interface is good, it will 
>>> always confuse new developers and users. But that's just my opinion, 
>>> I don't impose it )
>>>
>>> If not deprecate, i.e. if we consider old interface to be good, than 
>>> no reason for this my series and for introducing new interface :)
>>
>> I’m not against a better interface, I’m against using this current 
>> bug as an excuse to improve the interface.  We’ve known we want to 
>> improve the interface for quite a long time now, we don’t need an 
>> excuse for that.
>>
>> If we use this bug as an excuse, I’m afraid of becoming hung up on 
>> interface discussions instead of just getting the bug fixed. And we 
>> must get the bug fixed, it’s real, it’s kind of bad, and saying “it 
>> won’t appear with the new interface, let’s not worry about the old 
>> one” is not something I like.
>>
>> OTOH, if we use this bug as an excuse, I’m also afraid of trying to 
>> rush the design instead of actually implementing the interface that 
>> we’ve always desired, i.e. where the user gets to choose the 
>> completion mode via yet-to-be-implemented some job property setter 
>> function.
>>
>> As a final note (but this is precisely the interface discussion that 
>> I want to avoid for now), I said I don’t see a good reason for 
>> deprecating anything, because `job-cancel force=false` can just 
>> internally do `set-job-property .pivot_on_completion=false; 
>> job-complete`.  From an implementation perspective, that should be 
>> simple.
>>
>> I understand that for users the existence of the `force` flag may 
>> still be confusing and so we might want to deprecate it for that 
>> reason, but again, this is the interface discussion that I think we 
>> don’t actually need right now.
>>
>> And that’s why I’d prefer for any clean-up to come on top of fixing 
>> the existing bug, so we can have separate discussions and take our 
>> time with the interface without feeling driven by the need to fix a bug.
>>
>
> OK, I see your point. Let's just fix a bug with current interface and 
> anything else is a separate step. Are you going to send v3?

Yep, sure!

(Still want to look into the exact job->ret details, though. Perhaps I 
can do better than just to keep it in the v1 state.)

Max


