Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08325654144
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 13:47:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8KwT-0002jr-AH; Thu, 22 Dec 2022 07:44:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8KwP-0002jd-8N
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 07:44:53 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8KwM-0002oH-Nv
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 07:44:52 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 f13-20020a1cc90d000000b003d08c4cf679so1165123wmb.5
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 04:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NJAW1bcTxKTZO1JbAMRC+YKl31a1jEWZqnhJyMYy4Qo=;
 b=AyyacWo8sLf6o5R7rFfZaE1OqVQnpIlQLQUv5V38QWtadu8e+JvhLPUqpaMFTBdPjE
 wGAitbiI93KZ/pFS9mRcQXRJcRM1r6fN61wYJawNLPlHbTbbEZHPiOwCP/vZR9RJWk+e
 zeD8Rz4NbDsRlBuPeo6GyGmMW8BnPzrMBJGThsyRRu9uImEMoIzg8mr14b9yyiCR+rKx
 4ilaMUOdq/dnLZIFVMw0RRHvbHmDCYSDtgsYUoJpC/ll3Jaj4xqxosf5e6Bdb5K3vryl
 9WKGB6ei+074ZuabtBZLmtSAYdRAgaIXm8DnhL5QSap2wblwft9klixQdTMMPN39lcwQ
 SpMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NJAW1bcTxKTZO1JbAMRC+YKl31a1jEWZqnhJyMYy4Qo=;
 b=PRvdF/cUg7GmEEZmmRF+5MITAVd995mY4nX9Wr77mnfGCLLnhAFlY3MQLg1f1QmY3v
 nqtXNM3eZn7LVBcbIMCijfCVhmxbox6T5Uc0Jlj7i8q/Ru3QkAfw7z2Dh3frCbycHX/8
 7nLrC6NCGLZbReU29xye7ouSRK35mOxkzwg7Kov6KQnGQIW/f7g3xCzlwaWhqFeq1Wsj
 KAHKEl1frGmRJfX+6ljxVxfz56n0KOSzZbum/1rzoqyrBqR35UDUy4b3wK64NMYYM6oU
 GNwAYpKV0HY3aYRH7Iwe7PR0jiNapvTjmTUS6eAP0Jdyc2p6NNPaPH1vuclwdCU++BWe
 t06Q==
X-Gm-Message-State: AFqh2kpXB804bTSGPvp1dRekjISps+aXmZw0iWFL6lQ+9zPEhHNO1nED
 zQ9Prf0LVGGxtFYmCRUNsCX0gw==
X-Google-Smtp-Source: AMrXdXuIIvgFPcXicgibjTmDH7LggY2vmn7vB9kwURa/No/dglXybh4sunKhfjdCMNyteb+NGux26Q==
X-Received: by 2002:a05:600c:3596:b0:3d2:3b8d:21e5 with SMTP id
 p22-20020a05600c359600b003d23b8d21e5mr4160109wmq.14.1671713088666; 
 Thu, 22 Dec 2022 04:44:48 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c10-20020a05600c0a4a00b003c6b70a4d69sm878503wmq.42.2022.12.22.04.44.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 04:44:48 -0800 (PST)
Message-ID: <8b4f6a71-6992-8348-2b21-71ae8e2b5215@linaro.org>
Date: Thu, 22 Dec 2022 13:44:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v2] target/i386: Remove compilation errors when
 -Werror=maybe-uninitialized
Content-Language: en-US
To: Stefan Weil <sw@weilnetz.de>, eric.auger@redhat.com,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, eric.auger.pro@gmail.com,
 richard.henderson@linaro.org, paul@nowt.org, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, Stefan Hajnoczi <stefanha@redhat.com>
References: <20221221163652.1239362-1-eric.auger@redhat.com>
 <ed6d68f4-81aa-d9a1-3a71-628855e8a376@redhat.com>
 <bafaad8e-f4f7-ddeb-4fbd-cebc7b8c360e@linaro.org>
 <5045cc9a-b383-b1d3-b3fd-a9f84dd74f36@redhat.com>
 <Y6Q636fbFWDnF0w7@redhat.com>
 <a8f5caa6-e0b4-25fb-4eab-ff33dc45fbef@redhat.com>
 <d0cefb94-4442-3277-51c2-6a615c766129@linaro.org>
 <557dcec6-7800-b93c-708e-e06793cb9e38@weilnetz.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <557dcec6-7800-b93c-708e-e06793cb9e38@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

On 22/12/22 13:32, Stefan Weil wrote:
> Am 22.12.22 um 12:51 schrieb Philippe Mathieu-Daudé:
> 
>> On 22/12/22 12:18, Eric Auger wrote:
>>> Hi All,
>>>
>>> On 12/22/22 12:09, Daniel P. Berrangé wrote:
>>>> On Thu, Dec 22, 2022 at 11:07:31AM +0100, Eric Auger wrote:
>>>>> Hi Philippe,
>>>>>
>>>>> On 12/22/22 10:01, Philippe Mathieu-Daudé wrote:
>>>>>> On 22/12/22 09:18, Paolo Bonzini wrote:
>>>>>>> On 12/21/22 17:36, Eric Auger wrote:
>>>>>>>> To avoid compilation errors when -Werror=maybe-uninitialized is 
>>>>>>>> used,
>>>>>>>> replace 'case 3' by 'default'.
>>>>>>>>
>>>>>>>> Otherwise we get:
>>>>>>>>
>>>>>>>> ../target/i386/ops_sse.h: In function ‘helper_vpermdq_ymm’:
>>>>>>>> ../target/i386/ops_sse.h:2495:13: error: ‘r3’ may be used
>>>>>>>> uninitialized in this function [-Werror=maybe-uninitialized]
>>>>>>>>      2495 |     d->Q(3) = r3;
>>>>>>>>           |     ~~~~~~~~^~~~
>>>>>>>> ../target/i386/ops_sse.h:2494:13: error: ‘r2’ may be used
>>>>>>>> uninitialized in this function [-Werror=maybe-uninitialized]
>>>>>>>>      2494 |     d->Q(2) = r2;
>>>>>>>>           |     ~~~~~~~~^~~~
>>>>>>>> ../target/i386/ops_sse.h:2493:13: error: ‘r1’ may be used
>>>>>>>> uninitialized in this function [-Werror=maybe-uninitialized]
>>>>>>>>      2493 |     d->Q(1) = r1;
>>>>>>>>           |     ~~~~~~~~^~~~
>>>>>>>> ../target/i386/ops_sse.h:2492:13: error: ‘r0’ may be used
>>>>>>>> uninitialized in this function [-Werror=maybe-uninitialized]
>>>>>>>>      2492 |     d->Q(0) = r0;
>>>>>>>>           |     ~~~~~~~~^~~~
>>>>>> With what compiler? Is that a supported one?
>>>>> https://lore.kernel.org/qemu-devel/3aab489e-9d90-c1ad-0b6b-b2b5d80db723@redhat.com/
>>>>>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>>>>> Suggested-by: Stefan Weil <sw@weilnetz.de>
>>>>>>>> Fixes: 790684776861 ("target/i386: reimplement 0x0f 0x3a, add AVX")
>>>>>>>> ---
>>>>>>>>    target/i386/ops_sse.h | 4 ++--
>>>>>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
>>>>>>>> index 3cbc36a59d..c442c8c10c 100644
>>>>>>>> --- a/target/i386/ops_sse.h
>>>>>>>> +++ b/target/i386/ops_sse.h
>>>>>>>> @@ -2466,7 +2466,7 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg
>>>>>>>> *s, uint32_t order)
>>>>>>>>            r0 = s->Q(0);
>>>>>>>>            r1 = s->Q(1);
>>>>>>>>            break;
>>>>>>>> -    case 3:
>>>>>>>> +    default:
>>>>>>>>            r0 = s->Q(2);
>>>>>>>>            r1 = s->Q(3);
>>>>>>>>            break;
>>>>>>>> @@ -2484,7 +2484,7 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg
>>>>>>>> *s, uint32_t order)
>>>>>>>>            r2 = s->Q(0);
>>>>>>>>            r3 = s->Q(1);
>>>>>>>>            break;
>>>>>>>> -    case 3:
>>>>>>>> +    default:
>>>>>>>>            r2 = s->Q(2);
>>>>>>>>            r3 = s->Q(3);
>>>>>>>>            break;
>>>>>>> Queued, but this compiler sucks. :)
>>>>>> Can't we simply add a dumb 'default' case? So when reviewing we don't
>>>>>> have to evaluate 'default' means 3 here.
>>>>>>
>>>>>> -- >8 --
>>>>>> --- a/target/i386/ops_sse.h
>>>>>> +++ b/target/i386/ops_sse.h
>>>>>> @@ -2470,6 +2470,8 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg *s,
>>>>>> uint32_t order)
>>>>>>           r0 = s->Q(2);
>>>>>>           r1 = s->Q(3);
>>>>>>           break;
>>>>>> +    default:
>>>>>> +        qemu_build_not_reached();
>>>>>>       }
>>>>>>       switch ((order >> 4) & 3) {
>>>>>>       case 0:
>>>>>> @@ -2488,6 +2490,8 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg *s,
>>>>>> uint32_t order)
>>>>>>           r2 = s->Q(2);
>>>>>>           r3 = s->Q(3);
>>>>>>           break;
>>>>>> +    default:
>>>>>> +        qemu_build_not_reached();
>>>>>>       }
>>>>> I guess this won't fix the fact r0, r1, r2, r3 are not initialized, 
>>>>> will it?
>>>> This ultimately expands to assert() and the compiler should see that it
>>>> terminates the control flow at this point, so shouldn't have a reason
>>>> to warn.
>>>
>>> OK so with qemu_build_not_reached(); I get
>>>
>>> /home/augere/UPSTREAM/qemu/include/qemu/osdep.h:184:35: error: call to
>>> ‘qemu_build_not_reached_always’ declared with attribute error: code path
>>> is reachable
>>>    184 | #define qemu_build_not_reached() 
>>> qemu_build_not_reached_always()
>>>        | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>
>>>
>>> However with g_assert_not_reached(), it does not complain and errors are
>>> removed. So I will respin with g_assert_not_reached() if nobody advises
>>> me against that.
>>
>> Thank you!
> 
> 
> As noted by Paolo a better compiler could know that 0, 1, 2 and 3 are 
> the only possible cases. Such a better compiler might complain that an 
> additional default case is never reached. Therefore the proposed code 
> might cause future compiler warnings.
> 
> But we could use this code pattern to make the intention of the code 
> clearer:
> 
> case 3:
> default: /* default case added to help the compiler to avoid warnings */
>      ...

I'm fine with that, as long as we don't obfuscate the code for clever
compiler's sake. QEMU code base is already complex enough (the devil 😈
is in the details).

