Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8A1463A03
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 16:27:06 +0100 (CET)
Received: from localhost ([::1]:45374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms528-0007zu-KA
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 10:27:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1ms50V-0006Y9-HL
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 10:25:24 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.222]:53329
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1ms50R-0002Kn-Ig
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 10:25:23 -0500
HMM_SOURCE_IP: 172.18.0.48:53176.1422368689
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-118.116.19.33 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 8281F2800B1;
 Tue, 30 Nov 2021 23:25:05 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 47ddbf9112324645a0ceac08bd5f9147 for
 peterx@redhat.com; Tue, 30 Nov 2021 23:25:11 CST
X-Transaction-ID: 47ddbf9112324645a0ceac08bd5f9147
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
Message-ID: <269159ed-569b-4b73-8cc0-e944dc75cd11@chinatelecom.cn>
Date: Tue, 30 Nov 2021 23:25:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v7 3/3] cpus-common: implement dirty page limit on vCPU
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>
References: <cover.1638267948.git.huangy81@chinatelecom.cn>
 <692eeb1960338ff0ae027a42192e264d55342e7b.1638267948.git.huangy81@chinatelecom.cn>
 <YaYldsdDa6ENmSF1@xz-m1.local>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <YaYldsdDa6ENmSF1@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.222;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.211,
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
 Markus ArmBruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/30/21 21:21, Peter Xu wrote:
> On Tue, Nov 30, 2021 at 06:28:13PM +0800, huangy81@chinatelecom.cn wrote:
>>   ##
>> +# @set-dirty-limit:
>> +#
>> +# Set the upper limit of dirty page rate for a virtual CPU.
>> +#
>> +# Requires KVM with accelerator property "dirty-ring-size" set.
>> +# A virtual CPU's dirty page rate is a measure of its memory load.
>> +# To observe dirty page rates, use @calc-dirty-rate.
>> +#
>> +# @cpu-index: index of the virtual CPU.
>> +#
>> +# @dirty-rate: upper limit for the specified vCPU's dirty page rate (MB/s)
>> +#
>> +# Since: 7.0
>> +#
>> +# Example:
>> +#   {"execute": "set-dirty-limit"}
>> +#    "arguments": { "cpu-index": 0,
>> +#                   "dirty-rate": 200 } }
>> +#
>> +##
>> +{ 'command': 'set-dirty-limit',
>> +  'data': { 'cpu-index': 'int', 'dirty-rate': 'uint64' } }
>> +
>> +##
>> +# @cancel-dirty-limit:
>> +#
>> +# Cancel the dirty page limit for the vCPU which has been set with
>> +# set-dirty-limit command. Note that this command requires support from
>> +# dirty ring, same as the "set-dirty-limit" command.
>> +#
>> +# @cpu-index: index of the virtual CPU to cancel the dirty page limit
>> +#
>> +# Since: 7.0
>> +#
>> +# Example:
>> +#   {"execute": "cancel-dirty-limit"}
>> +#    "arguments": { "cpu-index": 0 } }
>> +#
>> +##
>> +{ 'command': 'cancel-dirty-limit',
>> +  'data': { 'cpu-index': 'int' } }
> 
> This seems to be overloaded to be a standalone cmd..
> 
> How about:
> 
>    { "cmd": "vcpu-dirty-limit",
>      "arguments": {
>        "cpu": $cpu,
>        "enable": true/false,
>        "dirty-rate": 100,
>      }
>    }
> 
> If "enable"==false, then "dirty-rate" can be ignored and it'll shut down the
> throttling on vcpu N.  Then this command will literally merge the two you
> proposed.
> 
> It'll be nice if we provide yet another command:
> 
>    { "cmd": "query-vcpu-dirty-limit",
>      "arguments": {
>        "*cpu": $cpu,
>      }
>    }
> 
> When $cpu is specified, we return (cpu=$cpu, real_dirty_rate,
> target_dirty_rate) for this vcpu.  When $cpu is not specified, we return an
> array of that containing all the vcpus.
> 
> It'll be nicer to enhance the output of the query command to e.g. have a global
> "enabled"=true/false as long as any vcpu has throttle enabled then the global
> throttle is enabled.  I didn't think more than that, but how's that sound so
> far?
Soud good, it makes the command easier for programmers to use and 
understand, i'll try this out next version.
> 
> Thanks,
> 

-- 
Best Regards
Hyman Huang(黄勇)

