Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F2B47541D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 09:10:13 +0100 (CET)
Received: from localhost ([::1]:42454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxPMa-0007LM-Gg
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 03:10:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1mxOv6-0002SS-JB
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 02:41:48 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:48310
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1mxOv1-0005ky-Fp
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 02:41:48 -0500
HMM_SOURCE_IP: 172.18.0.218:42234.1293396884
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.150.57.243 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 83B2628013C;
 Wed, 15 Dec 2021 15:40:47 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id d7b616703c334547b5d4620ebf4f3c67 for
 armbru@redhat.com; Wed, 15 Dec 2021 15:41:14 CST
X-Transaction-ID: d7b616703c334547b5d4620ebf4f3c67
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
Message-ID: <aa57e77d-e7f8-9f46-a292-8bb8883b9a20@chinatelecom.cn>
Date: Wed, 15 Dec 2021 15:40:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v10 2/3] cpu-throttle: implement virtual CPU throttle
To: Markus Armbruster <armbru@redhat.com>
References: <cover.1639479557.git.huangy81@chinatelecom.cn>
 <cover.1639479557.git.huangy81@chinatelecom.cn>
 <671e8a25261262085b998a08ef8dafdcdc9e0ae9.1639479557.git.huangy81@chinatelecom.cn>
 <87bl1inxsp.fsf@dusky.pond.sub.org>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <87bl1inxsp.fsf@dusky.pond.sub.org>
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



在 2021/12/15 15:15, Markus Armbruster 写道:
> huangy81@chinatelecom.cn writes:
> 
>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>
>> Setup a negative feedback system when vCPU thread
>> handling KVM_EXIT_DIRTY_RING_FULL exit by introducing
>> throttle_us_per_full field in struct CPUState. Sleep
>> throttle_us_per_full microseconds to throttle vCPU
>> if dirtylimit is enabled.
>>
>> Start a thread to track current dirty page rates and
>> tune the throttle_us_per_full dynamically untill current
>> dirty page rate reach the quota.
>>
>> Introduce the util function in the header for dirtylimit
>> implementation.
>>
>> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> [...]
> 
>> diff --git a/qapi/migration.json b/qapi/migration.json
>> index bbfd48c..ac5fa56 100644
>> --- a/qapi/migration.json
>> +++ b/qapi/migration.json
>> @@ -1850,6 +1850,25 @@
>>   { 'command': 'query-dirty-rate', 'returns': 'DirtyRateInfo' }
>>   
>>   ##
>> +# @DirtyLimitInfo:
>> +#
>> +# Dirty page rate limit information of virtual CPU.
>> +#
>> +# @cpu-index: index of virtual CPU.
>> +#
>> +# @limit-rate: upper limit of dirty page rate for virtual CPU.
> 
> If I understand your code correctly, zero means unlimited.  This is
> undocumented.
> 
Ok
> In review of v9, I asked to "make @dirty-rate optional, present means
> enable, absent means disable."  Any particular reason for not doing it
> that way?
> 
No, :(

Actually, i replied the review advice as the following:

-------------
if we drop @enable, enabling dirty limit should be like:
vcpu-dirty-limit cpu-index=0 dirty-rate=1000

And disabling dirty limit like:
vcpu-dirty-limit cpu-index=0

For disabling case, there is no hint of disabling literally in command
"vcpu-dirty-limit".

How about make @dirty-rate optional, when enable dirty limit, it should
present, ignored otherwise?
-------------

The discussion are still ongoing :)

>> +#
>> +# @current-rate: current dirty page rate for virtual CPU.
>> +#
>> +# Since: 7.0
>> +#
>> +##
>> +{ 'struct': 'DirtyLimitInfo',
>> +  'data': { 'cpu-index': 'int',
>> +            'limit-rate': 'int64',
>> +            'current-rate': 'int64' } }
>> +
>> +##
>>   # @snapshot-save:
>>   #
>>   # Save a VM snapshot
> 
> [...]
> 

-- 
Best regard

Hyman Huang(黄勇)

