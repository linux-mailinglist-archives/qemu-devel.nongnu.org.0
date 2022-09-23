Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEFB5E7AB4
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 14:26:53 +0200 (CEST)
Received: from localhost ([::1]:50880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obhlb-0001pO-Tl
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 08:26:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1obhZ1-0002Wn-5O
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 08:13:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1obhYx-00030v-Ts
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 08:13:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663935226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JzZttXYhYKdPizML1iD0kze9mnYMQYfYmB7YHYREw3k=;
 b=LkkTEAaSOCMfdVmtCAoAsZjoofd1U3JHTDieAYUyggAt1XH4gvqrBzludiVZkNZmEXWPOK
 PTmCp/07O3ImlxrFHoUt0gIYTNdO04g8wSxIZAi1PEFh15iXYZnneVqwnQKtXB87aUWtWa
 EIwXgxpBCXY5mPBewPsmNeqfUe/Q/g0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-310-eDzx3q4BMvOen_-g0Pg_yg-1; Fri, 23 Sep 2022 08:13:45 -0400
X-MC-Unique: eDzx3q4BMvOen_-g0Pg_yg-1
Received: by mail-wm1-f71.google.com with SMTP id
 y15-20020a1c4b0f000000b003b47578405aso1735762wma.5
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 05:13:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=JzZttXYhYKdPizML1iD0kze9mnYMQYfYmB7YHYREw3k=;
 b=ulfQ0JfADttQFQg62dNWGrMHrWbqM27UJwYXV7VSZ1/3uyvx/E0LyyLiqwA9wP08ro
 SaayhQocTgkTdY+qb/voeVi75yLvLJt/Bbg+uGoyfWDPAocQ/lwba7CIVVDaquU9JUxC
 gc+P/pWZ5P+zKKsX9AOWFcokNOGWGvRGGc8/rGnXvKgXc5UDcUIaMlsw897JwBIwcfAD
 LWP3FFvVvVt41kH6jjo0QJ53QaLqPnhjYDRwN5BPxrzTCuYdEODTwEefiiXq0D/OicQe
 k2NHJGFv6zy2+tI5/VeDgQFDjSbNTBlmhsJ2486JZLpr20NzAT4HC/YwmkE8m9JnSRa1
 6amA==
X-Gm-Message-State: ACrzQf1/pFifQWD9tXVtm6GUlG3drS+XJ8G/TA3BlCQD80YDuRLQhL05
 9Fo4/APouFrmm7XEdoWC5fImrREwNMEsVloOGD1J9sRg/5+lfcEKoTOriAGnMheYzKFFM4iU2d8
 aIMUYty/M0b99QoY=
X-Received: by 2002:a05:6000:54d:b0:225:4d5c:4615 with SMTP id
 b13-20020a056000054d00b002254d5c4615mr4734964wrf.107.1663935223277; 
 Fri, 23 Sep 2022 05:13:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM64qRBu5zr7gexEwVEGPwTldlPFoTSG6MZlWIHRA2yzKix7rDjvzy3i72Ks7f8/Z4aKHYZ7yw==
X-Received: by 2002:a05:6000:54d:b0:225:4d5c:4615 with SMTP id
 b13-20020a056000054d00b002254d5c4615mr4734953wrf.107.1663935222998; 
 Fri, 23 Sep 2022 05:13:42 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:cc00:4585:a83b:64f2:ad21?
 (p200300cbc704cc004585a83b64f2ad21.dip0.t-ipconnect.de.
 [2003:cb:c704:cc00:4585:a83b:64f2:ad21])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a7bce11000000b003b4931eb435sm2619758wmc.26.2022.09.23.05.13.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 05:13:42 -0700 (PDT)
Message-ID: <23b94809-eee4-2970-5b5f-07021af2d236@redhat.com>
Date: Fri, 23 Sep 2022 14:13:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
References: <20220921100729.2942008-1-Jason@zx2c4.com>
 <20220922153820.221811-1-david@redhat.com>
 <abf6fbb6-14f4-8c65-f5ac-a75b9c8931dd@redhat.com>
 <98dcb657-8862-5868-3979-55fc49864904@redhat.com>
 <e8041184-cfdd-d429-0377-db6b46d4d0ef@redhat.com>
 <6bf799d5-18a1-f01c-b227-a7dc98c2c8cf@redhat.com>
 <Yy16Mz7+yLCV5jH8@zx2c4.com>
 <e6fad3bc-66e9-faea-194c-30277c0aa90f@redhat.com>
 <CAHmME9r+s_kBb2vyWe5xqtMd6NCbe=O8sH2=T2r15ZFU=bcKvA@mail.gmail.com>
 <bcd4e3c8-268d-139b-a1a6-0a2e11bd1986@redhat.com>
 <CAHmME9rRa1qXV4tE=vhE0CTryfqYpp_2xgUCKB5bRzmjMhNqZA@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v8.1 1/2] target/s390x: support SHA-512 extensions
In-Reply-To: <CAHmME9rRa1qXV4tE=vhE0CTryfqYpp_2xgUCKB5bRzmjMhNqZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 23.09.22 13:46, Jason A. Donenfeld wrote:
> Hi David,
> 
> On Fri, Sep 23, 2022 at 1:35 PM David Hildenbrand <david@redhat.com> wrote:
>>
>> On 23.09.22 13:19, Jason A. Donenfeld wrote:
>>> On Fri, Sep 23, 2022 at 12:47 PM David Hildenbrand <david@redhat.com> wrote:
>>>> You must be fortunate if "one afternoon" is not a significant time
>>>> investment. For me it is a significant investment.
>>>
>>> For me too, to say the least of the multiple afternoons I've spent on
>>> this patch set. Getting back to technical content:
>>>
>>>> and sort out the remaining issues. I thought we (Thomas included) had an
>>>> agreement that that's the way we are going to do it. Apparently I was wrong.
>>>> Most probably I lived in the kernel space too long such that we don't
>>>> rush something upstream. For that reason *I* sent out a patch with
>>>> Here I am, getting told by Thomas that we now do it differently now.
>>>> What I really tried to express here is: if Thomas wants to commit things
>>>> differently now, maybe he can just separate the cleanup parts. I really
>>>> *don't want* to send out a multi-patch series to cleanup individual
>>>> parts -- that takes significantly more time. Especially not if something
>>>> is not committed yet.
>>>
>>> To recap what's been fixed in your v8.1, versus what's been refactored
>>> out of style preference:
>>>
>>> 1) It handles the machine versioning.
>>> 2) It throws an exception on length alignment in KIMD mode:
>>> +    /* KIMD: length has to be properly aligned. */
>>> +    if (type == S390_FEAT_TYPE_KIMD && !QEMU_IS_ALIGNED(len, 128)) {
>>> +        tcg_s390_program_interrupt(env, PGM_SPECIFICATION, ra);
>>> +    }
>>> 3) It asserts if type is neither KIMD vs KLMD, with:
>>> +    g_assert(type == S390_FEAT_TYPE_KIMD || type == S390_FEAT_TYPE_KLMD);
>>>
>>
>> One important part is
>>
>> 4) No memory modifications before all inputs were read
> 
> Ahhh, which v8's klmd doesn't do, since it updates the parameter block
> before doing the last block. Is this a requirement of the spec? If

Right, and not only the parameter block, but also registers IIRC.


It depend on the instruction and exception. IIRC, exceptions can be 
nullifying, terminating, suppressing, and partially-completing ...

Suppression: no state modification. PSW updated. Exception triggered. 
"The contents of any result fields, including the condition code, are 
not changed."

Nullification: no state modification. PSW not incremented. Exception 
triggered.

Termination: state partially changed. Bad (e.g., machine check). 
Exception triggered.

Partial completion only applies to "Interruptible Instructions". Instead 
of triggering an exception, the instruction exits (with CC=3 or so) and 
modified the state accordingly. There are only a handful of such 
instructions.



There is a chapter called "Types of Instruction Ending" in the PoP 
that's an interesting read.


So in case of Suppression/Nullification, the expectation is that no 
state (memory, register content) was updated when the exception triggers.


Depending on the way the instruction is used and how exceptions are 
handled, that can be a real issue, for example, if the program assumes 
that registers were not updated, or that memory wasn't updated -- but 
they actually were.

> not, then it doesn't matter. But if so, v8's approach is truly
> hopeless, and we'd be remiss to not go with your refactoring that
> accomplishes this.
I wouldn't call it hopeless, but that was the real reason why a 
restructured your code at all and why I had to play with the code myself 
to see if it can be done any better. All the moving stuff into other 
functions were just attempts to keep the code readable when unifying 
both functions :)

As I said, handling state update is non-trivial, and that instruction is 
especially hard to implement.

I *assume* that we never fail that way in the Linux kernel use case, 
because we don't rely on exceptions at all. So one might argue that v8 
is "good enough" for that.

-- 
Thanks,

David / dhildenb


