Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3151C475610
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 11:17:56 +0100 (CET)
Received: from localhost ([::1]:45612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxRMB-00017K-1W
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 05:17:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1mxRKe-0008Hj-3o
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:16:20 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:51663
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1mxRKb-0003QN-3a
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:16:19 -0500
HMM_SOURCE_IP: 172.18.0.48:57974.2040850313
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.150.57.243 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 4F52C2800CD;
 Wed, 15 Dec 2021 18:15:58 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id b9ed4fbee18d4075be9c0fac87b7f119 for
 armbru@redhat.com; Wed, 15 Dec 2021 18:16:09 CST
X-Transaction-ID: b9ed4fbee18d4075be9c0fac87b7f119
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
Message-ID: <31436a8c-8167-430d-973c-44b717d11671@chinatelecom.cn>
Date: Wed, 15 Dec 2021 18:16:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v10 3/3] cpus-common: implement dirty page limit on
 virtual CPU
From: Hyman Huang <huangy81@chinatelecom.cn>
To: Markus Armbruster <armbru@redhat.com>
References: <cover.1639479557.git.huangy81@chinatelecom.cn>
 <cover.1639479557.git.huangy81@chinatelecom.cn>
 <d54bfe75d5d64e64a21bda977d40f62579cd0222.1639479557.git.huangy81@chinatelecom.cn>
 <874k7anwtc.fsf@dusky.pond.sub.org>
 <4397f17c-4431-8480-127b-4228271523c8@chinatelecom.cn>
 <Ybmiw59Qh3sHukyh@xz-m1.local>
 <ed815283-6e17-1837-cd9c-085f731b74c9@chinatelecom.cn>
In-Reply-To: <ed815283-6e17-1837-cd9c-085f731b74c9@chinatelecom.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.228;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.64,
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
 qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2021/12/15 16:29, Hyman Huang 写道:
> 
> 
> 在 2021/12/15 16:09, Peter Xu 写道:
>> On Wed, Dec 15, 2021 at 03:56:55PM +0800, Hyman Huang wrote:
>>>>> +{ 'command': 'vcpu-dirty-limit',
>>>>> +  'data': { 'enable': 'bool',
>>>>> +            '*cpu-index': 'uint64',
>>>>> +            '*dirty-rate': 'uint64'} }
>>>>
>>>> Drop @enable, please.
>>>>
>>>> If @dirty-rate is present, set the limit to its value.
>>>>
>>>> If it's absent, cancel the limit.
>>>>
>>> Ok. Indeed, this is the simplest style. :)
>>>
>>> So the final qmp format should be like:
>>>
>>> case 1: setup vcpu 0 dirty page limit 100MB/s
>>> vcpu-dirty-limit  cpu-index=0   dirty-rate=100MB/s
>>>
>>> case 2: cancle vcpu 0 dirty page limit
>>> vcpu-dirty-limit  cpu-index=0
>>
>> I actually agree with what you said... for human beings no one will 
>> read it as
>> "disable vcpu throttling", instead people could consider it enables vcpu
>> throttle with a default dirty rate from a gut feeling.
>>
>> I think what Markus suggested is the simplest solution for computers, 
>> but it
>> can confuse human beings.  So it turns out to be a general question to 
>> QMP
>> scheme design: should we always assume QMP client to be a piece of 
>> software, or
>> should we still consider the feeling of human beings operating on QMP
>> interfaces using qmp-shell.
>>
>> IMHO we should still consider the latter, if we don't lose much, 
>> anyway.  But I
>> don't have a strong opinion.
>>  > Thanks,
>>
> So, how do you think about it, Markus？

I prefer Peter's advice and there is another reason:

In current implementation, we introduced the global on/off switch,
enable dirty page rate limit on specified vcpu only if @cpu-index is 
passed, otherwise, all vcpu will be affected.

If we remove the @enable and use @dirty-rate to indicate the 
enabled/disable switch. The qmp format should be like the following:

case 1: setup vcpu 0 dirty page limit 100MB/s
vcpu-dirty-limit  cpu-index=0   dirty-rate=100MB/s

case 2: setup all vcpu dirty page limit 100MB/s
vcpu-dirty-limit dirty-rate=100MB/s

case 3: cancel vcpu 0 dirty page limit
vcpu-dirty-limit  cpu-index=0

case 4: cancel all vcpu dirty page limit
vcpu-dirty-limit

For case 4, it seems to be weired.

-- 
Best regard

Hyman Huang(黄勇)

