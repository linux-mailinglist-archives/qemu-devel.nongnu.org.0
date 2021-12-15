Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A477475430
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 09:22:08 +0100 (CET)
Received: from localhost ([::1]:40414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxPY6-0008Jn-RR
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 03:22:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1mxPA4-0001iV-9P
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 02:57:17 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.219]:48303
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1mxPA1-00034p-9Q
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 02:57:15 -0500
HMM_SOURCE_IP: 172.18.0.188:57256.998043257
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.150.57.243 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id EBE0D28011D;
 Wed, 15 Dec 2021 15:56:58 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.188])
 by app0023 with ESMTP id 76a95cfa08ca441fa90521784352649b for
 armbru@redhat.com; Wed, 15 Dec 2021 15:57:07 CST
X-Transaction-ID: 76a95cfa08ca441fa90521784352649b
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.188
X-MEDUSA-Status: 0
Message-ID: <4397f17c-4431-8480-127b-4228271523c8@chinatelecom.cn>
Date: Wed, 15 Dec 2021 15:56:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v10 3/3] cpus-common: implement dirty page limit on
 virtual CPU
To: Markus Armbruster <armbru@redhat.com>
References: <cover.1639479557.git.huangy81@chinatelecom.cn>
 <cover.1639479557.git.huangy81@chinatelecom.cn>
 <d54bfe75d5d64e64a21bda977d40f62579cd0222.1639479557.git.huangy81@chinatelecom.cn>
 <874k7anwtc.fsf@dusky.pond.sub.org>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <874k7anwtc.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.219;
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



在 2021/12/15 15:37, Markus Armbruster 写道:
> huangy81@chinatelecom.cn writes:
> 
>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>
>> Implement dirtyrate calculation periodically basing on
>> dirty-ring and throttle virtual CPU until it reachs the quota
>> dirty page rate given by user.
>>
>> Introduce qmp commands "vcpu-dirty-limit", "query-vcpu-dirty-limit"
>> to enable, disable, query dirty page limit for virtual CPU.
>>
>> Meanwhile, introduce corresponding hmp commands "vcpu_dirty_limit",
>> "info vcpu_dirty_limit" so developers can play with them easier.
>>
>> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> [...]
> 
>> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
>> index 96d0148..04879a2 100644
>> --- a/include/monitor/hmp.h
>> +++ b/include/monitor/hmp.h
>> @@ -131,6 +131,8 @@ void hmp_replay_delete_break(Monitor *mon, const QDict *qdict);
>>   void hmp_replay_seek(Monitor *mon, const QDict *qdict);
>>   void hmp_info_dirty_rate(Monitor *mon, const QDict *qdict);
>>   void hmp_calc_dirty_rate(Monitor *mon, const QDict *qdict);
>> +void hmp_info_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
>> +void hmp_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
>>   void hmp_human_readable_text_helper(Monitor *mon,
>>                                       HumanReadableText *(*qmp_handler)(Error **));
>>   
>> diff --git a/qapi/migration.json b/qapi/migration.json
>> index ac5fa56..7d8da4f 100644
>> --- a/qapi/migration.json
>> +++ b/qapi/migration.json
>> @@ -1869,6 +1869,50 @@
>>               'current-rate': 'int64' } }
>>   
>>   ##
>> +# @vcpu-dirty-limit:
>> +#
>> +# Set or cancel the upper limit of dirty page rate for a virtual CPU.
>> +#
>> +# Requires KVM with accelerator property "dirty-ring-size" set.
>> +# A virtual CPU's dirty page rate is a measure of its memory load.
>> +# To observe dirty page rates, use @calc-dirty-rate.
>> +#
>> +# @enable: true to enable, false to disable.
>> +#
>> +# @cpu-index: index of virtual CPU, default is all.
> 
> Suggest
> 
>      # @cpu-index: The vCPU to act upon (all by default).
> 
> (I'm stealing this from trace.json)
> 
>> +#
>> +# @dirty-rate: upper limit of dirty page rate for virtual CPU, to
>> +#              cancel dirty limit, this field will be ignored.
>> +#
>> +# Since: 7.0
>> +#
>> +# Example:
>> +#   {"execute": "vcpu-dirty-limit"}
>> +#    "arguments": { "enable": true,
>> +#                   "cpu-index": 1,
>> +#                   "dirty-rate": 200 } }
>> +#
>> +##
>> +{ 'command': 'vcpu-dirty-limit',
>> +  'data': { 'enable': 'bool',
>> +            '*cpu-index': 'uint64',
>> +            '*dirty-rate': 'uint64'} }
> 
> Drop @enable, please.
> 
> If @dirty-rate is present, set the limit to its value.
> 
> If it's absent, cancel the limit.
> 
Ok. Indeed, this is the simplest style. :)

So the final qmp format should be like:

case 1: setup vcpu 0 dirty page limit 100MB/s
vcpu-dirty-limit  cpu-index=0   dirty-rate=100MB/s

case 2: cancle vcpu 0 dirty page limit
vcpu-dirty-limit  cpu-index=0

I'll do that next version.

Thanks Markus very much

>> +
>> +##
>> +# @query-vcpu-dirty-limit:
>> +#
>> +# Returns information about all virtual CPU dirty limit if enabled.
>> +#
>> +# Since: 7.0
>> +#
>> +# Example:
>> +#   {"execute": "query-vcpu-dirty-limit"}
>> +#
>> +##
>> +{ 'command': 'query-vcpu-dirty-limit',
>> +  'returns': [ 'DirtyLimitInfo' ] }
>> +
>> +##
>>   # @snapshot-save:
>>   #
>>   # Save a VM snapshot
> 

-- 
Best regard

Hyman Huang(黄勇)

