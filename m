Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 033A85E7B3D
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 15:00:48 +0200 (CEST)
Received: from localhost ([::1]:33944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obiIQ-0001km-SU
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 09:00:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1obi3q-0007xZ-7X
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 08:45:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1obi3Z-0002xz-7W
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 08:45:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663937124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9x0ZSPBeGYQ/NSIxFRW7O1C+Wwp/r+LkGuka//jPgG0=;
 b=irTVV0mn67svnkMJNOx604TM4L0bujwqZ5t0oNALwli0Z4CqlUDx++jR0CVXvSoVGAonai
 IbeEJIYHbPobe+ous1ArCnUnJkNR2lKTOvCpy0EsllPcLIPQdBRjo39Bw/x011CIlTEdgc
 jm6Vz0XwM0bjyfdbx/FszDMArk5UgV0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-144-eq9E8LpWNEiwLXh--WK8CA-1; Fri, 23 Sep 2022 08:45:22 -0400
X-MC-Unique: eq9E8LpWNEiwLXh--WK8CA-1
Received: by mail-wr1-f71.google.com with SMTP id
 r23-20020adfb1d7000000b002286358a916so3920377wra.3
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 05:45:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=9x0ZSPBeGYQ/NSIxFRW7O1C+Wwp/r+LkGuka//jPgG0=;
 b=7JTZTIxZpeNaUXVJCzwKETV5Vhr5M9FtvxW2FOgI1wABfB9BVSdjFd9He/5WFNc2yq
 do9XrHN4zOsgHOha7z6AilREOWHH9WhjCvEYZZOdOjMRQLleWl/+ZmQ9WC0lxpEwb8W7
 0beGHNgPTdkagFJwjfk2U02qxtqc0sYXpDGWM8PH/rGTXbRMIOUyB162Vthmyx97jrRX
 PxR87IGU/ybgtgxcf9BaFW7+Y1ayPpCfcXOV3z3iFLRpbUNC4lrGz3XvneKWtj83iCkm
 mzgzrk8yJ1ax82yKUAlhpdytJiVri0iJLt2WNR4OoRags1vFIoSspXo5hfg4hAs5aB8w
 k93A==
X-Gm-Message-State: ACrzQf3Lg4Rw679IO/7jgjkSEi/U40WEo6d7m4Mki6LmOWAuL6ENS18A
 dhpDwgJxsKqk0la/voJ0T33m3at4rT0u5uH8YIZ7CZVi522CrMeHaF9+yQ7uXaCcIyxMlFf24dz
 I5puY33PzEYJPROs=
X-Received: by 2002:a5d:68c6:0:b0:228:74b6:2b07 with SMTP id
 p6-20020a5d68c6000000b0022874b62b07mr5035519wrw.60.1663937121894; 
 Fri, 23 Sep 2022 05:45:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7rpYZiNkPxO7mpLqxXTncOx4Y7vPiNcjhYYhMLQRqZuFgf/GXBXcKgW9LMhjaYIdP1HZ/CHg==
X-Received: by 2002:a5d:68c6:0:b0:228:74b6:2b07 with SMTP id
 p6-20020a5d68c6000000b0022874b62b07mr5035493wrw.60.1663937121586; 
 Fri, 23 Sep 2022 05:45:21 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-179-37.web.vodafone.de.
 [109.43.179.37]) by smtp.gmail.com with ESMTPSA id
 l18-20020a05600c27d200b003b4868eb6bbsm2857781wmb.23.2022.09.23.05.45.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 05:45:21 -0700 (PDT)
Message-ID: <192a3481-ac5e-f5e5-9377-3512ec8cf644@redhat.com>
Date: Fri, 23 Sep 2022 14:45:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v8.1 1/2] target/s390x: support SHA-512 extensions
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
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
 <c2116731-be09-f4c9-2ccc-8d0d6095e880@redhat.com>
 <CAHmME9prcv8jo4vUH2yu8WidqexmXKZ9VKucoTecirsBX=mw+w@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAHmME9prcv8jo4vUH2yu8WidqexmXKZ9VKucoTecirsBX=mw+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 23/09/2022 14.07, Jason A. Donenfeld wrote:
> On Fri, Sep 23, 2022 at 2:05 PM Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 23/09/2022 13.46, Jason A. Donenfeld wrote:
>>> Hi David,
>>>
>>> On Fri, Sep 23, 2022 at 1:35 PM David Hildenbrand <david@redhat.com> wrote:
>>>>
>>>> On 23.09.22 13:19, Jason A. Donenfeld wrote:
>>>>> On Fri, Sep 23, 2022 at 12:47 PM David Hildenbrand <david@redhat.com> wrote:
>>>>>> You must be fortunate if "one afternoon" is not a significant time
>>>>>> investment. For me it is a significant investment.
>>>>>
>>>>> For me too, to say the least of the multiple afternoons I've spent on
>>>>> this patch set. Getting back to technical content:
>>>>>
>>>>>> and sort out the remaining issues. I thought we (Thomas included) had an
>>>>>> agreement that that's the way we are going to do it. Apparently I was wrong.
>>>>>> Most probably I lived in the kernel space too long such that we don't
>>>>>> rush something upstream. For that reason *I* sent out a patch with
>>>>>> Here I am, getting told by Thomas that we now do it differently now.
>>>>>> What I really tried to express here is: if Thomas wants to commit things
>>>>>> differently now, maybe he can just separate the cleanup parts. I really
>>>>>> *don't want* to send out a multi-patch series to cleanup individual
>>>>>> parts -- that takes significantly more time. Especially not if something
>>>>>> is not committed yet.
>>>>>
>>>>> To recap what's been fixed in your v8.1, versus what's been refactored
>>>>> out of style preference:
>>>>>
>>>>> 1) It handles the machine versioning.
>>>>> 2) It throws an exception on length alignment in KIMD mode:
>>>>> +    /* KIMD: length has to be properly aligned. */
>>>>> +    if (type == S390_FEAT_TYPE_KIMD && !QEMU_IS_ALIGNED(len, 128)) {
>>>>> +        tcg_s390_program_interrupt(env, PGM_SPECIFICATION, ra);
>>>>> +    }
>>>>> 3) It asserts if type is neither KIMD vs KLMD, with:
>>>>> +    g_assert(type == S390_FEAT_TYPE_KIMD || type == S390_FEAT_TYPE_KLMD);
>>>>>
>>>>
>>>> One important part is
>>>>
>>>> 4) No memory modifications before all inputs were read
>>>
>>> Ahhh, which v8's klmd doesn't do, since it updates the parameter block
>>> before doing the last block. Is this a requirement of the spec? If
>>> not, then it doesn't matter. But if so, v8's approach is truly
>>> hopeless, and we'd be remiss to not go with your refactoring that
>>> accomplishes this.
>>
>> Ok, great, if you're fine with the rework, I'll go with David's v8.1
>> instead. (keeping an entry on my TODO list to rework that ugly generic "msa"
>> helper function one day - this really kept me being confused for much of my
>> patch review time)
> 
> Okay, sure. Can one of you just look to see if that g_assert() is
> going to be a DoS vector, though, or if it'll never be reached if the
> prior code goes well? That's the one remaining thing I'm not sure
> about.
> 
> Do you want me to rebase 2/2 on top of v8.1?

Thanks, but I think it's a trivial contextual conflict only - I can fix that 
up when picking up the patches.

  Thomas


