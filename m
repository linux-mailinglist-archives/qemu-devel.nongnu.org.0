Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D919476D46
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 10:21:06 +0100 (CET)
Received: from localhost ([::1]:53786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxmwj-0006jl-Cr
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 04:21:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1mxmt2-0001hl-18
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 04:17:16 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.221]:37155
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1mxmsz-0001tZ-09
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 04:17:15 -0500
HMM_SOURCE_IP: 172.18.0.188:59972.1360648331
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.150.57.243 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id EF0142800B6;
 Thu, 16 Dec 2021 17:16:52 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.188])
 by app0023 with ESMTP id 1ed9122d40414286ac1bc2318c40b003 for
 peterx@redhat.com; Thu, 16 Dec 2021 17:17:00 CST
X-Transaction-ID: 1ed9122d40414286ac1bc2318c40b003
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.188
X-MEDUSA-Status: 0
Message-ID: <a6dc86b7-29c2-fa08-ad16-017d8b1301d9@chinatelecom.cn>
Date: Thu, 16 Dec 2021 17:16:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v10 3/3] cpus-common: implement dirty page limit on
 virtual CPU
To: Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <cover.1639479557.git.huangy81@chinatelecom.cn>
 <cover.1639479557.git.huangy81@chinatelecom.cn>
 <d54bfe75d5d64e64a21bda977d40f62579cd0222.1639479557.git.huangy81@chinatelecom.cn>
 <874k7anwtc.fsf@dusky.pond.sub.org>
 <4397f17c-4431-8480-127b-4228271523c8@chinatelecom.cn>
 <Ybmiw59Qh3sHukyh@xz-m1.local> <87y24m2df7.fsf@dusky.pond.sub.org>
 <YbrbQYiEMGz864aB@xz-m1.local>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <YbrbQYiEMGz864aB@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.221;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.034,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2021/12/16 14:22, Peter Xu 写道:
> On Wed, Dec 15, 2021 at 02:41:32PM +0100, Markus Armbruster wrote:
>> Peter Xu <peterx@redhat.com> writes:
>>
>>> On Wed, Dec 15, 2021 at 03:56:55PM +0800, Hyman Huang wrote:
>>>>>> +{ 'command': 'vcpu-dirty-limit',
>>>>>> +  'data': { 'enable': 'bool',
>>>>>> +            '*cpu-index': 'uint64',
>>>>>> +            '*dirty-rate': 'uint64'} }
>>>>>
>>>>> Drop @enable, please.
>>>>>
>>>>> If @dirty-rate is present, set the limit to its value.
>>>>>
>>>>> If it's absent, cancel the limit.
>>>>>
>>>> Ok. Indeed, this is the simplest style. :)
>>>>
>>>> So the final qmp format should be like:
>>>>
>>>> case 1: setup vcpu 0 dirty page limit 100MB/s
>>>> vcpu-dirty-limit  cpu-index=0   dirty-rate=100MB/s
>>>>
>>>> case 2: cancle vcpu 0 dirty page limit
>>>> vcpu-dirty-limit  cpu-index=0
>>>
>>> I actually agree with what you said... for human beings no one will read it as
>>> "disable vcpu throttling", instead people could consider it enables vcpu
>>> throttle with a default dirty rate from a gut feeling.
>>>
>>> I think what Markus suggested is the simplest solution for computers, but it
>>> can confuse human beings.  So it turns out to be a general question to QMP
>>> scheme design: should we always assume QMP client to be a piece of software, or
>>> should we still consider the feeling of human beings operating on QMP
>>> interfaces using qmp-shell.
>>>
>>> IMHO we should still consider the latter, if we don't lose much, anyway.  But I
>>> don't have a strong opinion.
>>
>> If you want a more explicit interface, then I'd recommend to go right
>> back to v7:
>>
>>      {"execute": "set-vcpu-dirty-limit",
>>       "arguments": {"cpu-index": 0, "dirtyrate": 200}}
>>
>>      {"execute": "cancel-vcpu-dirty-limit",
>>       "arguments": {"cpu-index": 0}}
>>
>> Bonus: it already has my Acked-by.
> 
> Fair enough. :)  That looks good to me too.
> 
> Yong, please hold-off a bit on reposting (if there's a plan) - I'll read the
> other parts soon..
> 
Ok, i'm not going to repost the next version untill the consensus is 
achieved.

So the final format of qmp we conclude are:

case 1: setup vcpu 0 dirty page limit 100MB/s
set-vcpu-dirty-limit cpu-index=0 dirty-rate=100

case 2: setup all vcpu dirty page limit 100MB/s
set-vcpu-dirty-limit dirty-rate=100

case 3: cancel vcpu 0 dirty page limit
cancel-vcpu-dirty-limit cpu-index=0

case 4: cancel all vcpu dirty page limit
cancel-vcpu-dirty-limit

case 5: query limit infomatioin of all vcpu enabled
query-vcpu-dirty-limit

And the corresponding hmp format keep the same style:

Is there any advice? :)

> Thanks,
> 

-- 
Best regard

Hyman Huang(黄勇)

