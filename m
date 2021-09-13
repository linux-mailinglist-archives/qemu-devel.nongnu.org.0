Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1354088F1
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 12:24:04 +0200 (CEST)
Received: from localhost ([::1]:47728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPj87-0003qb-8d
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 06:24:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mPir5-0007mi-PP; Mon, 13 Sep 2021 06:06:32 -0400
Received: from mail.csgraf.de ([85.25.223.15]:43850 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mPir3-0003EU-Ll; Mon, 13 Sep 2021 06:06:27 -0400
Received: from MacBook-Air.alex.local
 (dynamic-095-118-088-150.95.118.pool.telefonica.de [95.118.88.150])
 by csgraf.de (Postfix) with ESMTPSA id E2807608037D;
 Mon, 13 Sep 2021 12:06:22 +0200 (CEST)
Subject: Re: [PATCH v8 16/19] hvf: arm: Implement PSCI handling
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-17-agraf@csgraf.de>
 <CAFEAcA_VJa_vJtJx6PtQS=WTy2y9ZJg8pcgu4Pkzp=CbuH85qw@mail.gmail.com>
 <a9ac1625-1cb0-bd44-da27-67f9a003ec54@csgraf.de>
 <11281306-a11a-5b8c-6b2b-202be8e2655a@linaro.org>
 <f05467cb-aae6-e943-3d4a-9894d9c72ef8@csgraf.de>
 <8e0879b6-23c0-8f14-fd96-4d72f1d640c1@linaro.org>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <6fe284da-6989-f837-adda-1aa722f0d345@csgraf.de>
Date: Mon, 13 Sep 2021 12:06:20 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <8e0879b6-23c0-8f14-fd96-4d72f1d640c1@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.584,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 12.09.21 23:40, Richard Henderson wrote:
> On 9/12/21 2:37 PM, Alexander Graf wrote:
>>
>> On 12.09.21 23:20, Richard Henderson wrote:
>>> On 9/12/21 1:36 PM, Alexander Graf wrote:
>>>>> I think the callsites would be clearer if you made the function
>>>>> return true for "PSCI call handled", false for "not recognised,
>>>>> give the guest an UNDEF". Code like
>>>>>            if (hvf_handle_psci_call(cpu)) {
>>>>>                stuff;
>>>>>            }
>>>>>
>>>>> looks like the 'stuff' is for the "psci call handled" case,
>>>>> which at the moment it isn't.
>>>>
>>>>
>>>> This function merely follows standard C semantics along the lines
>>>> of "0
>>>> means success, !0 is error". Isn't that what you would usually expect?
>>>
>>> No, not really.  I expect stuff that returns error codes to return
>>> negative integers on failure.  I expect stuff that returns a boolean
>>> success/failure to return true on success.
>>
>>
>> Fair, I'll change it to return -1 then. Thanks!
>
> Not quite the point I was making.  If the only two return values are
> -1/0, then bool false/true is in fact more appropriate.


If the whole code base adheres to it, maybe. The big problem with using
true/false as return values for functions that don't make it very
explicit (have an is in their name or use gerund for example). QEMU uses
a lot of 0 == success internally.

If you now add bools to the a code base that already uses int returns a
lot, you always need to look up what a function actually returns if the
caller treats it as bool (if, ?, assert, etc), making code review and
reasoning about code flows extremely hard. I've had one too many
occasions where I called an innocently looking API and put the assert()
the wrong way around for example.

I don't think we can solve this problem here, but IMHO the only sensible
way to get to good readability would be to have functions that return
success/failure return a libc defined struct that indicates the error.
Then check for success explicitly on every caller site. Overloading bool
or int for success/failure return is just bad :).


Alex


