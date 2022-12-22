Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE0C65401A
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 12:53:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8K7L-0001O1-Tu; Thu, 22 Dec 2022 06:52:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8K71-0001JO-Lk
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 06:51:48 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8K6w-0000dr-UT
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 06:51:47 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 c65-20020a1c3544000000b003cfffd00fc0so3685120wma.1
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 03:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n1zSAKSo4bHQoYmsxWfmPjHlKTV7qR7gSCxumDEW8Hg=;
 b=CqCYXw4rTNP8VdH+BJerJ4YGmJ/b5r+Uspss7Zp0fVPeGG+JgUrNp0YqZaIP9pxq1h
 LsOa+uNQ+bElriFj6BIMpNZMh5NRPQMO206bD0aMWEW8JCa7JrEKjB1eW+scng+9IeBk
 fOZdy2H/CkYFM3/oFqanzm5YJJMcqBd/GLsFmkZIfY3zGiwTkPD00NzcD+mjGKdvM+eH
 uzqq50jjxQclCjYj579D2JqDeBK6mEenRIxl8Br5TIZbzM/lxmoithal1WvGw3J+4kNG
 oSFAIvxxrrb0MKBDe/+EFbKLSpG358ulcNYpYEB0w2DZYdK6qM19l5b66Ibbl1EJ5JiN
 dd8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n1zSAKSo4bHQoYmsxWfmPjHlKTV7qR7gSCxumDEW8Hg=;
 b=vIxObKV5BHN1E5QsLsb5G44ezijBAasdMw8Kre8Xeo5tyke++xrkQEB2Okdu2+vKpC
 OD2i+x/Ib2twdyd0K71MRLdqy3aGXg77whiVKfAEBJkH6RL47DzIYJXH/ORVxcm+opoq
 PNtb6H5OWCfuXDRldJjuU0xKi2mHKJaU+3OZWoJbXfpBjaxERiTPvmfu9JVUMOMCj6FN
 jwXhm3Hg5kuhRM8F21t2n/GBVqZ77WoOM4RFOhOpnoStA+iImSAJvrb658yEKBD2BDlr
 5x89uxogzV70EKYMTw4VE7S4ZsC3ceN5kllWUJJJJ2RtRKwO7bNsIK4CTDmn70mUFo6a
 zhrQ==
X-Gm-Message-State: AFqh2kpkrq1YyiUzCbNCy1ezsDwqXtEZ4lqf/v+MjNwYVKxeCrdGsg/M
 iJzdGRafeM57nNPPZxOEW2Wx2A==
X-Google-Smtp-Source: AMrXdXu0RXo2FRXjW5yTbCBntGVieqmukB2c+eWLyFOL9vlujbJxCqBaDx1mhbZv/iH1h48s81iiaw==
X-Received: by 2002:a05:600c:4e08:b0:3cf:d0b1:8aa1 with SMTP id
 b8-20020a05600c4e0800b003cfd0b18aa1mr4050306wmq.0.1671709900231; 
 Thu, 22 Dec 2022 03:51:40 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l1-20020a05600c4f0100b003cf5ec79bf9sm801541wmq.40.2022.12.22.03.51.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 03:51:39 -0800 (PST)
Message-ID: <d0cefb94-4442-3277-51c2-6a615c766129@linaro.org>
Date: Thu, 22 Dec 2022 12:51:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v2] target/i386: Remove compilation errors when
 -Werror=maybe-uninitialized
Content-Language: en-US
To: eric.auger@redhat.com, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, eric.auger.pro@gmail.com,
 richard.henderson@linaro.org, paul@nowt.org, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, sw@weilnetz.de,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20221221163652.1239362-1-eric.auger@redhat.com>
 <ed6d68f4-81aa-d9a1-3a71-628855e8a376@redhat.com>
 <bafaad8e-f4f7-ddeb-4fbd-cebc7b8c360e@linaro.org>
 <5045cc9a-b383-b1d3-b3fd-a9f84dd74f36@redhat.com>
 <Y6Q636fbFWDnF0w7@redhat.com>
 <a8f5caa6-e0b4-25fb-4eab-ff33dc45fbef@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <a8f5caa6-e0b4-25fb-4eab-ff33dc45fbef@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 22/12/22 12:18, Eric Auger wrote:
> Hi All,
> 
> On 12/22/22 12:09, Daniel P. Berrangé wrote:
>> On Thu, Dec 22, 2022 at 11:07:31AM +0100, Eric Auger wrote:
>>> Hi Philippe,
>>>
>>> On 12/22/22 10:01, Philippe Mathieu-Daudé wrote:
>>>> On 22/12/22 09:18, Paolo Bonzini wrote:
>>>>> On 12/21/22 17:36, Eric Auger wrote:
>>>>>> To avoid compilation errors when -Werror=maybe-uninitialized is used,
>>>>>> replace 'case 3' by 'default'.
>>>>>>
>>>>>> Otherwise we get:
>>>>>>
>>>>>> ../target/i386/ops_sse.h: In function ‘helper_vpermdq_ymm’:
>>>>>> ../target/i386/ops_sse.h:2495:13: error: ‘r3’ may be used
>>>>>> uninitialized in this function [-Werror=maybe-uninitialized]
>>>>>>      2495 |     d->Q(3) = r3;
>>>>>>           |     ~~~~~~~~^~~~
>>>>>> ../target/i386/ops_sse.h:2494:13: error: ‘r2’ may be used
>>>>>> uninitialized in this function [-Werror=maybe-uninitialized]
>>>>>>      2494 |     d->Q(2) = r2;
>>>>>>           |     ~~~~~~~~^~~~
>>>>>> ../target/i386/ops_sse.h:2493:13: error: ‘r1’ may be used
>>>>>> uninitialized in this function [-Werror=maybe-uninitialized]
>>>>>>      2493 |     d->Q(1) = r1;
>>>>>>           |     ~~~~~~~~^~~~
>>>>>> ../target/i386/ops_sse.h:2492:13: error: ‘r0’ may be used
>>>>>> uninitialized in this function [-Werror=maybe-uninitialized]
>>>>>>      2492 |     d->Q(0) = r0;
>>>>>>           |     ~~~~~~~~^~~~
>>>> With what compiler? Is that a supported one?
>>> https://lore.kernel.org/qemu-devel/3aab489e-9d90-c1ad-0b6b-b2b5d80db723@redhat.com/
>>>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>>> Suggested-by: Stefan Weil <sw@weilnetz.de>
>>>>>> Fixes: 790684776861 ("target/i386: reimplement 0x0f 0x3a, add AVX")
>>>>>> ---
>>>>>>    target/i386/ops_sse.h | 4 ++--
>>>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
>>>>>> index 3cbc36a59d..c442c8c10c 100644
>>>>>> --- a/target/i386/ops_sse.h
>>>>>> +++ b/target/i386/ops_sse.h
>>>>>> @@ -2466,7 +2466,7 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg
>>>>>> *s, uint32_t order)
>>>>>>            r0 = s->Q(0);
>>>>>>            r1 = s->Q(1);
>>>>>>            break;
>>>>>> -    case 3:
>>>>>> +    default:
>>>>>>            r0 = s->Q(2);
>>>>>>            r1 = s->Q(3);
>>>>>>            break;
>>>>>> @@ -2484,7 +2484,7 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg
>>>>>> *s, uint32_t order)
>>>>>>            r2 = s->Q(0);
>>>>>>            r3 = s->Q(1);
>>>>>>            break;
>>>>>> -    case 3:
>>>>>> +    default:
>>>>>>            r2 = s->Q(2);
>>>>>>            r3 = s->Q(3);
>>>>>>            break;
>>>>> Queued, but this compiler sucks. :)
>>>> Can't we simply add a dumb 'default' case? So when reviewing we don't
>>>> have to evaluate 'default' means 3 here.
>>>>
>>>> -- >8 --
>>>> --- a/target/i386/ops_sse.h
>>>> +++ b/target/i386/ops_sse.h
>>>> @@ -2470,6 +2470,8 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg *s,
>>>> uint32_t order)
>>>>           r0 = s->Q(2);
>>>>           r1 = s->Q(3);
>>>>           break;
>>>> +    default:
>>>> +        qemu_build_not_reached();
>>>>       }
>>>>       switch ((order >> 4) & 3) {
>>>>       case 0:
>>>> @@ -2488,6 +2490,8 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg *s,
>>>> uint32_t order)
>>>>           r2 = s->Q(2);
>>>>           r3 = s->Q(3);
>>>>           break;
>>>> +    default:
>>>> +        qemu_build_not_reached();
>>>>       }
>>> I guess this won't fix the fact r0, r1, r2, r3 are not initialized, will it?
>> This ultimately expands to assert() and the compiler should see that it
>> terminates the control flow at this point, so shouldn't have a reason
>> to warn.
> 
> OK so with qemu_build_not_reached(); I get
> 
> /home/augere/UPSTREAM/qemu/include/qemu/osdep.h:184:35: error: call to
> ‘qemu_build_not_reached_always’ declared with attribute error: code path
> is reachable
>    184 | #define qemu_build_not_reached()  qemu_build_not_reached_always()
>        |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> 
> However with g_assert_not_reached(), it does not complain and errors are
> removed. So I will respin with g_assert_not_reached() if nobody advises
> me against that.

Thank you!

