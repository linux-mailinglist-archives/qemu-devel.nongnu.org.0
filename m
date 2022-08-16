Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D61E5958FC
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 12:52:14 +0200 (CEST)
Received: from localhost ([::1]:33812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNuBA-0002xL-KO
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 06:52:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oNu9Y-0001J0-1K; Tue, 16 Aug 2022 06:50:32 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:43813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oNu9W-0003KQ-98; Tue, 16 Aug 2022 06:50:31 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MjgfT-1nczfv3pCF-00lFUN; Tue, 16 Aug 2022 12:50:25 +0200
Message-ID: <cdf8a0a4-d196-bd84-53fe-5962292636fc@vivier.eu>
Date: Tue, 16 Aug 2022 12:50:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] [PATCH] linux-user/aarch64: Reset target data on
 MADV_DONTNEED
Content-Language: fr
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Vitaly Buka <vitalybuka@google.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <CAPjTjwsb0jAsQq4PHOsFGW7SjpAe=Ug2b_fxhdccEEnzh=cQUA@mail.gmail.com>
 <CAFEAcA-F8rUTH1FimHf+FaV0O6dQ4QGHihaygxdjn9BKYPazBg@mail.gmail.com>
 <CAPjTjwuNwXdemwFYOUDi4Qnc5fA9KWzAEZQ1JaCNu+0x3RUh7Q@mail.gmail.com>
 <8b32824b-4dc1-3d1a-1916-918a3fffab26@linaro.org>
 <67a42d65-8289-b26c-26f6-275ea0bfac98@vivier.eu>
 <CAFEAcA8AXodRV=eG2Ra4Sf9rsap499zDJEu6hC=c+V9gE2KjfA@mail.gmail.com>
 <52225a7c-310f-444f-0b75-0ad2536a30c0@vivier.eu> <87r11miz8i.fsf@linaro.org>
 <531cdb6a-f660-b671-375c-a3819d90c030@vivier.eu> <87zgg4bmwq.fsf@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <87zgg4bmwq.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BLkwoyrF+1S4X3kARX+Z33hSL+OPE3Ch63e7rr+UrGFxCeKaOA2
 Lk9Rwj3r69sY4sf6eTa8Vaf8oPmwQlMSRZ5uvV37th6Z5DoeXV1TbioZimicWk+Crr7N6oo
 DHg/QhjyhPtfYwNKj/xtPMxbIsmhg8wMs//WnRT2AmjkemtBMv1vXb5YJ5bIxAoC4n42Krq
 bcItW0XfgoLFWXyzQBnjA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:b7jjD1o1Fiw=:ySSDdPB3uCKvYkt69cdNUJ
 kUwbM6ySo5N7oHXvfoJRCmb54sxV/DShQQVza0nLsjvkWKVbTLtv3KtEADUBiefNopWl2jtCx
 5N7TsCzsmBFHv3SmHtc1KDSmu+5nXZp0z5Ox81157OOTDB/gniXs5+SmEcSqkL7qnfIIUrPIZ
 s80lnZ3I6LY3V1K4nv+0nPycD4Zb+FWtayBVVJ93YR4LRjCYhagWRl99Xe+hCqsOQVQKX1vQG
 vILExMPcxd2tSexEPIV3R+u5JrqeLN3fTMt+ZQcQwNHvQg4mEEUeErYA5VspNUXLu7ojsCr3K
 7cx3ds0XAi/1iG6VhnpYkw83BE0llgecVEuisjtaS2LKG85/JBcYAF17eLtF20ftib9xnQ5Ce
 /CXJpLCxHkXxEYBVQXcmeSjpoTS36OOJnwwxG8wCvSa7w0h3QFHFUtflqusD+wV07o6NecNta
 ASbDNSB0+W2A9jsc0u4ZcgF+MB1qU/eRoUuSseGYkqevEO+tFnUsrQS7X5D2FZ5F58MhhBQo5
 RfJCQ4WYNgNvAumDnhZrfgNVN/AqOjR+/6RvmyXxVqvpJsQ0mRUu7OJiLCs0PFxU1ciQPmM0e
 hQ6bBS20W2b4cZQInWk3wD9tG3Qiv3BcPCIX+C/gV/zjB2h507QhwbyymWT/ZnL+GFbMKhoFL
 4IR+IeLmT/3crw1sQsqoWkYzN0IJapnhf82gctZOryb6/GhuDIF0kk+HMnFhdYb4gmmkSv0O4
 HizMkhrMku1cTW5gsgriQQSsFheqWX6wL13+UQ==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 16/08/2022 à 10:41, Alex Bennée a écrit :
> 
> Laurent Vivier <laurent@vivier.eu> writes:
> 
>> Le 11/08/2022 à 17:18, Alex Bennée a écrit :
>>> Laurent Vivier <laurent@vivier.eu> writes:
>>>
>>>> Le 11/08/2022 à 13:54, Peter Maydell a écrit :
>>>>> On Thu, 11 Aug 2022 at 09:29, Laurent Vivier <laurent@vivier.eu> wrote:
>>>>>>
>>>>>> Le 10/08/2022 à 22:47, Richard Henderson a écrit :
>>>>>>> On 8/10/22 13:32, Vitaly Buka wrote:
>>>>>>>> Sorry, I only noticed today that it's not submitted.
>>>>>>>> Version is not critical for us, as we build from masters anyway.
>>>>>>>> Richard, do you know a reason to consider this critical?
>>>>>>>>
>>>>>>>> On Wed, 10 Aug 2022 at 13:04, Peter Maydell <peter.maydell@linaro.org
>>>>>>>> <mailto:peter.maydell@linaro.org>> wrote:
>>>>>>>>
>>>>>>>>        On Wed, 10 Aug 2022 at 21:00, Vitaly Buka <vitalybuka@google.com
>>>>>>>>        <mailto:vitalybuka@google.com>> wrote:
>>>>>>>>         >
>>>>>>>>         > How can we land this one?
>>>>>>>>
>>>>>>>>        Pinging it a week ago rather than now would have been a good start :-(
>>>>>>>>        I think it got missed because you didn't cc the linux-user maintainer.
>>>>>>>>
>>>>>>>>        Is this a critical fix for 7.1 or can we let it slip to 7.2 ?
>>>>>>>
>>>>>>> It's unfortunate that it got missed.  It's not critical, but it would be nice, because support for
>>>>>>> MADV_DONTNEED is new in 7.1 (previously, we ignored all madvise).
>>>>>>>
>>>>>>> I'll note there are missing braces for coding style on an IF.
>>>>>>>
>>>>>>> Laurent, do you have an objection to merging this for rc3?
>>>>>>>
>>>>>>
>>>>>> No objection.
>>>>>>
>>>>>> Do you want it goes via the arm branch or via the linux-user branch?
>>>>>>
>>>>>> If it goes via linux-user I can run the LTP testsuite but it takes 1 day.
>>>>> I think we should definitely run the LTP testsuite on it, so
>>>>> taking it via linux-user probably makes more sense.
>>>>
>>>> ok, applied to my linux-user-for-7.1 branch.
>>>>
>>>> Running tests.
>>> Any chance you could pick up:
>>>     Subject: [PATCH v2] linux-user: un-parent OBJECT(cpu) when
>>> closing thread
>>>     Date: Wed,  3 Aug 2022 14:05:37 +0100
>>>     Message-Id: <20220803130537.763666-1-alex.bennee@linaro.org>
>>> before you run the tests?
>>>
>>
>> I've tested it, it works fine.
>>
>> Do you plan to do a PR including it or do you want I do (there will be
>> only this one in mine)?
> 
> I'm going to a roll a PR today so I can include it. Shall I add a
> Tested-by for you?
> 

OK. No need to add the Tested-by, I've run generic tests, not targeted to this problem.

Thanks,
Laurent


