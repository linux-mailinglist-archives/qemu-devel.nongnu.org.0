Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE90458A74
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 09:22:57 +0100 (CET)
Received: from localhost ([::1]:43572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp4bI-0000FM-EP
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 03:22:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1mp4Yw-0007F0-11
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 03:20:30 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.219]:55199
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1mp4Yl-0002bW-7E
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 03:20:22 -0500
HMM_SOURCE_IP: 172.18.0.188:56254.1609766066
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.150.57.243 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 35F7F2800F1;
 Mon, 22 Nov 2021 16:19:39 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.188])
 by app0023 with ESMTP id 2e4052e54b9245cb9554a59fcf41e0e8 for
 armbru@redhat.com; Mon, 22 Nov 2021 16:19:59 CST
X-Transaction-ID: 2e4052e54b9245cb9554a59fcf41e0e8
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.188
X-MEDUSA-Status: 0
Message-ID: <1a8f3590-c7be-016e-842c-b4b29df92d2c@chinatelecom.cn>
Date: Mon, 22 Nov 2021 16:19:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 3/3] cpus-common: implement dirty limit on vCPU
To: Markus Armbruster <armbru@redhat.com>
References: <cover.1637403404.git.huangy81@chinatelecom.cn>
 <cover.1637403404.git.huangy81@chinatelecom.cn>
 <99ea5e76926164d60a4ee62d0a1831823bc0d7a9.1637403404.git.huangy81@chinatelecom.cn>
 <87o86cprql.fsf@dusky.pond.sub.org>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <87o86cprql.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.219;
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



在 2021/11/22 15:35, Markus Armbruster 写道:
> huangy81@chinatelecom.cn writes:
> 
>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>
>> implement dirtyrate calculation periodically basing on
>> dirty-ring and throttle vCPU until it reachs the quota
>> dirtyrate given by user.
>>
>> introduce qmp commands set-dirty-limit/cancel-dirty-limit to
>> set/cancel dirty limit on vCPU.
> 
> Please start sentences with a capital letter.
> 
Ok，i'll check the syntax problem next version.
>>
>> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> [...]
> 
>> diff --git a/qapi/misc.json b/qapi/misc.json
>> index 358548a..98e6001 100644
>> --- a/qapi/misc.json
>> +++ b/qapi/misc.json
>> @@ -527,3 +527,42 @@
>>    'data': { '*option': 'str' },
>>    'returns': ['CommandLineOptionInfo'],
>>    'allow-preconfig': true }
>> +
>> +##
>> +# @set-dirty-limit:
>> +#
>> +# This command could be used to cap the vCPU memory load, which is also
>> +# refered as dirtyrate. One should use "calc-dirty-rate" with "dirty-ring"
>> +# and to calculate vCPU dirtyrate and query it with "query-dirty-rate".
>> +# Once getting the vCPU current dirtyrate, "set-dirty-limit" can be used
>> +# to set the upper limit of dirtyrate for the interested vCPU.
> 
> "dirtyrate" is not a word.  Let's spell it "dirty page rate", for
> consistency with the documentation in migration.json.
Ok, sounds good.
> 
> Regarding "One should use ...": sounds like you have to run
> calc-dirty-rate with argument @mode set to @dirty-ring before this
> command.  Correct?  What happens when you don't?  set-dirty-limit fails?
> 
> Do you also have to run query-dirty-rate before this command?
Actually no, i'll clarify the usage next verison.
> 
> Speaking of migration.json: should these commands be defined there, next
> to calc-dirty-rate and query-dirty-rate?
I'm struggling too because these commands will be used in migration but 
it is vCPU they handle.
> 
>> +#
>> +# @idx: vCPU index to set dirtylimit.
>> +#
>> +# @dirtyrate: upper limit of drityrate the specified vCPU could reach (MB/s)
> 
> Typo "drityrate".
> 
> Suggest "upper limit for the specified vCPU's dirty page rate (MB/s)".
Ok.
> 
>> +#
>> +# Since: 6.3
>> +#
>> +# Example:
>> +#   {"execute": "set-dirty-limit"}
>> +#    "arguments": { "idx": 0,
>> +#                   "dirtyrate": 200 } }
>> +#
>> +##
>> +{ 'command': 'set-dirty-limit',
>> +  'data': { 'idx': 'int', 'dirtyrate': 'uint64' } }
>> +
>> +##
>> +# @cancel-dirty-limit:
>> +#
>> +# @idx: vCPU index to canceled the dirtylimit
>> +#
>> +# Since: 6.3
>> +#
>> +# Example:
>> +#   {"execute": "cancel-dirty-limit"}
>> +#    "arguments": { "idx": 0 } }
>> +#
>> +##
>> +{ 'command': 'cancel-dirty-limit',
>> +  'data': { 'idx': 'int' } }
>> diff --git a/softmmu/vl.c b/softmmu/vl.c
>> index 1159a64..170ee23 100644
>> --- a/softmmu/vl.c
>> +++ b/softmmu/vl.c
>> @@ -3776,5 +3776,6 @@ void qemu_init(int argc, char **argv, char **envp)
>>       qemu_init_displays();
>>       accel_setup_post(current_machine);
>>       os_setup_post();
>> +    dirtylimit_setup(current_machine->smp.max_cpus);
>>       resume_mux_open();
>>   }
> 

-- 
Best regard

Hyman Huang(黄勇)

