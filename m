Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC76F46999A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 15:57:37 +0100 (CET)
Received: from localhost ([::1]:56104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muFQu-0008Ti-H2
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 09:57:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1muFPg-0007DN-CV
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 09:56:20 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:57442
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1muFPd-0007k7-Gc
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 09:56:20 -0500
HMM_SOURCE_IP: 172.18.0.218:44010.1959946064
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.41.245 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id ECD422800EC;
 Mon,  6 Dec 2021 22:55:59 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 5d2137df4136490b8d3696968ff02073 for
 peterx@redhat.com; Mon, 06 Dec 2021 22:56:07 CST
X-Transaction-ID: 5d2137df4136490b8d3696968ff02073
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
Message-ID: <9446cb24-c132-64e7-d696-ac959327d861@chinatelecom.cn>
Date: Mon, 6 Dec 2021 22:56:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v9 3/3] cpus-common: implement dirty page limit on vCPU
To: Peter Xu <peterx@redhat.com>
References: <cover.1638495274.git.huangy81@chinatelecom.cn>
 <cover.1638495274.git.huangy81@chinatelecom.cn>
 <9cc3cc5377e4330cbe0e87e89f452889516a4c09.1638495274.git.huangy81@chinatelecom.cn>
 <87tufpyiij.fsf@dusky.pond.sub.org>
 <65a49c9f-9287-b950-8fde-40fa9a4a28fe@chinatelecom.cn>
 <Ya3Jy1nWVRz12NHv@xz-m1.local>
From: Hyman <huangy81@chinatelecom.cn>
In-Reply-To: <Ya3Jy1nWVRz12NHv@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.228;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.076,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2021/12/6 16:28, Peter Xu 写道:
> On Sat, Dec 04, 2021 at 08:00:19PM +0800, Hyman Huang wrote:
>>
>>
>> 在 2021/12/3 20:34, Markus Armbruster 写道:
>>> huangy81@chinatelecom.cn writes:
>>>
>>>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>>>
>>>> Implement dirtyrate calculation periodically basing on
>>>> dirty-ring and throttle vCPU until it reachs the quota
>>>> dirty page rate given by user.
>>>>
>>>> Introduce qmp commands "vcpu-dirty-limit", "query-vcpu-dirty-limit"
>>>> to enable, disable, query dirty page limit for virtual CPU.
>>>>
>>>> Meanwhile, introduce corresponding hmp commands "vcpu_dirty_limit",
>>>> "info vcpu_dirty_limit" so developers can play with them easier.
>>>>
>>>> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>>
>>> [...]
>>>
>>> I see you replaced the interface.  Back to square one...
>>>
>>>> diff --git a/qapi/migration.json b/qapi/migration.json
>>>> index 3da8fdf..dc15b3f 100644
>>>> --- a/qapi/migration.json
>>>> +++ b/qapi/migration.json
>>>> @@ -1872,6 +1872,54 @@
>>>>                'current-rate': 'int64' } }
>>>>    ##
>>>> +# @vcpu-dirty-limit:
>>>> +#
>>>> +# Set or cancel the upper limit of dirty page rate for a virtual CPU.
>>>> +#
>>>> +# Requires KVM with accelerator property "dirty-ring-size" set.
>>>> +# A virtual CPU's dirty page rate is a measure of its memory load.
>>>> +# To observe dirty page rates, use @calc-dirty-rate.
>>>> +#
>>>> +# @cpu-index: index of virtual CPU.
>>>> +#
>>>> +# @enable: true to enable, false to disable.
>>>> +#
>>>> +# @dirty-rate: upper limit of dirty page rate for virtual CPU.
>>>> +#
>>>> +# Since: 7.0
>>>> +#
>>>> +# Example:
>>>> +#   {"execute": "vcpu-dirty-limit"}
>>>> +#    "arguments": { "cpu-index": 0,
>>>> +#                   "enable": true,
>>>> +#                   "dirty-rate": 200 } }
>>>> +#
>>>> +##
>>>> +{ 'command': 'vcpu-dirty-limit',
>>>> +  'data': { 'cpu-index': 'int',
>>>> +            'enable': 'bool',
>>>> +            'dirty-rate': 'uint64'} }
>>>
>>> When @enable is false, @dirty-rate makes no sense and is not used (I
>>> checked the code), but users have to specify it anyway.  That's bad
>>> design.
>>>
>>> Better: drop @enable, make @dirty-rate optional, present means enable,
>>> absent means disable.
>> Uh, if we drop @enable, enabling dirty limit should be like:
>> vcpu-dirty-limit cpu-index=0 dirty-rate=1000
>>
>> And disabling dirty limit like:
>> vcpu-dirty-limit cpu-index=0
>>
>> For disabling case, there is no hint of disabling in command
>> "vcpu-dirty-limit".
>>
>> How about make @dirty-rate optional, when enable dirty limit, it should
>> present, ignored otherwise?
> 
> Sounds good, I think we can make both "enable" and "dirty-rate" optional.
> 
> To turn it on we either use "enable=true,dirty-rate=XXX" or "dirty-rate=XXX" >
> To turn it off we use "enable=false".
Indeed, this make things more convenient.
>  >>
>>>
>>>> +
>>>> +##
>>>> +# @query-vcpu-dirty-limit:
>>>> +#
>>>> +# Returns information about the virtual CPU dirty limit status.
>>>> +#
>>>> +# @cpu-index: index of the virtual CPU to query, if not specified, all
>>>> +#             virtual CPUs will be queried.
>>>> +#
>>>> +# Since: 7.0
>>>> +#
>>>> +# Example:
>>>> +#   {"execute": "query-vcpu-dirty-limit"}
>>>> +#    "arguments": { "cpu-index": 0 } }
>>>> +#
>>>> +##
>>>> +{ 'command': 'query-vcpu-dirty-limit',
>>>> +  'data': { '*cpu-index': 'int' },
>>>> +  'returns': [ 'DirtyLimitInfo' ] }
>>>
>>> Why would anyone ever want to specify @cpu-index?  Output isn't that
>>> large even if you have a few hundred CPUs.
>>>
>>> Let's keep things simple and drop the parameter.
>> Ok, this make things simple.
> 
> I found that it'll be challenging for any human being to identify "whether
> he/she has turned throttle off for all vcpus"..  I think that could be useful
> when we finally decided to cancel current migration.
That's question, how about adding an optional argument "global" and 
making "cpu-index", "enable", "dirty-rate" all optional in 
"vcpu-dirty-limit", keeping the "cpu-index" and "global" options 
mutually exclusive?
{ 'command': 'vcpu-dirty-limit',
   'data': { '*cpu-index': 'int',
             '*global': 'bool'
             '*enable': 'bool',
             '*dirty-rate': 'uint64'} }
In the case of enabling all vcpu throttle:
Either use "global=true,enable=true,dirty-rate=XXX" or 
"global=true,dirty-rate=XXX"

In the case of disabling all vcpu throttle:
use "global=true,enable=false,dirty-rate=XXX"

In other case, we pass the same option just like what we did for 
specified vcpu throttle before.
> 
> I thought about adding a "global=on/off" flag, but instead can we just return
> the vcpu info for the ones that enabled the per-vcpu throttling?  For anyone
> who wants to read all vcpu dirty information he/she can use calc-dirty-rate.
> 
Ok, I'll pick up this advice next version.
> Thanks,
> 

