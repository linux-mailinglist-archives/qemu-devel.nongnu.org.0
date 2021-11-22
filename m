Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72600459404
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 18:32:51 +0100 (CET)
Received: from localhost ([::1]:57670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpDBS-0003OH-6D
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 12:32:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1mpDA8-0002gq-2P
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 12:31:28 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.220]:56833
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1mpDA4-0007ll-CW
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 12:31:27 -0500
HMM_SOURCE_IP: 172.18.0.48:60290.533500425
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.138.181.165 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id C2C82280094;
 Tue, 23 Nov 2021 01:31:06 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 2246daec76f241c8a6300adf0149f5f0 for
 armbru@redhat.com; Tue, 23 Nov 2021 01:31:13 CST
X-Transaction-ID: 2246daec76f241c8a6300adf0149f5f0
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
Message-ID: <94bdb4e6-7ccc-2dd8-bc70-28f944d55438@chinatelecom.cn>
Date: Tue, 23 Nov 2021 01:31:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v3 3/3] cpus-common: implement dirty limit on vCPU
To: Markus Armbruster <armbru@redhat.com>
References: <cover.1637403404.git.huangy81@chinatelecom.cn>
 <cover.1637403404.git.huangy81@chinatelecom.cn>
 <99ea5e76926164d60a4ee62d0a1831823bc0d7a9.1637403404.git.huangy81@chinatelecom.cn>
 <87o86cprql.fsf@dusky.pond.sub.org>
 <1a8f3590-c7be-016e-842c-b4b29df92d2c@chinatelecom.cn>
 <874k84o8t2.fsf@dusky.pond.sub.org>
 <6a71b1a4-547a-aaef-2666-deabe4b7b410@chinatelecom.cn>
 <87wnl0l9c7.fsf@dusky.pond.sub.org>
From: Hyman <huangy81@chinatelecom.cn>
In-Reply-To: <87wnl0l9c7.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.220;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.097,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2021/11/22 19:26, Markus Armbruster 写道:
> Hyman Huang <huangy81@chinatelecom.cn> writes:
> 
>> 在 2021/11/22 17:10, Markus Armbruster 写道:
>>> Hyman Huang <huangy81@chinatelecom.cn> writes:
>>>
>>>> =E5=9C=A8 2021/11/22 15:35, Markus Armbruster =E5=86=99=E9=81=93:
>>>>> huangy81@chinatelecom.cn writes:
>>>>>
>>>>>> From: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
>>>>>>
>>>>>> implement dirtyrate calculation periodically basing on
>>>>>> dirty-ring and throttle vCPU until it reachs the quota
>>>>>> dirtyrate given by user.
>>>>>>
>>>>>> introduce qmp commands set-dirty-limit/cancel-dirty-limit to
>>>>>> set/cancel dirty limit on vCPU.
>>>>>
>>>>> Please start sentences with a capital letter.
>>>>>
>>>> Ok，i'll check the syntax problem next version.
>>>>>>
>>>>>> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>>>>
>>>>>
>>>>> [...]
>>>>>
>>>>>> diff --git a/qapi/misc.json b/qapi/misc.json
>>>>>> index 358548a..98e6001 100644
>>>>>> --- a/qapi/misc.json
>>>>>> +++ b/qapi/misc.json
>>>>>> @@ -527,3 +527,42 @@
>>>>>>      'data': { '*option': 'str' },
>>>>>>      'returns': ['CommandLineOptionInfo'],
>>>>>>      'allow-preconfig': true }
>>>>>> +
>>>>>> +##
>>>>>> +# @set-dirty-limit:
>>>>>> +#
>>>>>> +# This command could be used to cap the vCPU memory load, which is also
>>>>>> +# refered as dirtyrate. One should use "calc-dirty-rate" with "dirty-ring"
>>>>>> +# and to calculate vCPU dirtyrate and query it with "query-dirty-rate".
>>>>>> +# Once getting the vCPU current dirtyrate, "set-dirty-limit" can be used
>>>>>> +# to set the upper limit of dirtyrate for the interested vCPU.
>>>>>
>>>>> "dirtyrate" is not a word.  Let's spell it "dirty page rate", for
>>>>> consistency with the documentation in migration.json.
>>>> Ok, sounds good.
>>>>>
>>>>> Regarding "One should use ...": sounds like you have to run
>>>>> calc-dirty-rate with argument @mode set to @dirty-ring before this
>>>>> command.  Correct?  What happens when you don't?  set-dirty-limit fails?
>>> You didn't answer this question.
>> set-dirty-limit doesn't do any pre-check about if calc-dirty-rate has
>> executed, so it doesn't fail.
> 
> Peeking at qmp_set_dirty_limit()... it fails when
> !kvm_dirty_ring_enabled().  kvm_dirty_ring_enabled() returns true when
> kvm_state->kvm_dirty_ring_size is non-zero.  How can it become non-zero?
If we enable dirty-ring with qemu commandline "-accel 
kvm,dirty-ring-size=xxx",qemu will parse the dirty-ring-size and set it. 
So we check if
dirty-ring is enabled by the kvm_dirty_ring_size.
> 
>> Since only executing calc-dirty-rate with dirty-ring mode can we get
>> the vCPU dirty page rate currently(while the dirty-bitmap only get the
>> vm dirty page rate), "One should use ..." maybe misleading, what i
>> actually want to say is "One should use the dirty-ring mode to
>> calculate the vCPU dirty page rate".
> 
> I'm still confused on what exactly users must do for the page dirty rate
> limiting to work as intended, and at least as importantly, what happens
> when they get it wrong.
User can set-dirty-limit unconditionally and the dirtylimit will work.

"One should use ..." just emphasize if users want to know which vCPU is 
in high memory load and want to limit it's dirty page rate, they can use 
calc-dirty-rate but it is not prerequisite for set-dirty-limit.

Umm, I think "One should use ..." explanation make things complicated.
I'll reconsider the comment next version.
> 
> [...]
> 

