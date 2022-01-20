Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD47494EAD
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 14:12:57 +0100 (CET)
Received: from localhost ([::1]:43754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAXFI-0003E4-C3
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 08:12:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nAVWc-0001VJ-6S
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 06:22:43 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:48838
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nAVWZ-00059F-Ir
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 06:22:41 -0500
HMM_SOURCE_IP: 172.18.0.48:57454.1777942971
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.150.57.243 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id AA4062800C5;
 Thu, 20 Jan 2022 19:22:25 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 135595e857d8487dacfc9a2d4a7c3415 for
 armbru@redhat.com; Thu, 20 Jan 2022 19:22:28 CST
X-Transaction-ID: 135595e857d8487dacfc9a2d4a7c3415
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
Message-ID: <46330d62-e0c5-0780-781a-f2d571a49b27@chinatelecom.cn>
Date: Thu, 20 Jan 2022 19:22:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v11 3/4] softmmu/dirtylimit: implement virtual CPU throttle
To: Markus Armbruster <armbru@redhat.com>
References: <cover.1641315745.git.huangy81@chinatelecom.cn>
 <cover.1641316375.git.huangy81@chinatelecom.cn>
 <0381e32c2cc70613613aaa284b8e8c9760d6932f.1641316375.git.huangy81@chinatelecom.cn>
 <878rvb3opl.fsf@dusky.pond.sub.org>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <878rvb3opl.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.228;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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



在 2022/1/19 20:16, Markus Armbruster 写道:
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
> Lacks a unit.  Is it bytes per second?  pages per second?
> 
> If I understand your code correctly, zero means unlimited.  This is
> undocumented.  Please document it.  Something like "0 means unlimited"
> should do.
> 
Ok.
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
> 
> The next patch uses 'uint64' for set-vcpu-dirty-limit argument
> dirty-rate.  Why signed here?
Yes, this is not consistent with next patch. I left this wrongly after 
some modification, it should be moved in to next patch. I'll do that 
next version :(
> 
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

