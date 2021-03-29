Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D42D34C468
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 09:00:49 +0200 (CEST)
Received: from localhost ([::1]:41592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQltH-0001xk-Rh
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 03:00:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lQlrL-0001Uq-4u
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 02:58:47 -0400
Received: from mx2.suse.de ([195.135.220.15]:41632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lQlrI-00020E-Tu
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 02:58:46 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DAA55B025;
 Mon, 29 Mar 2021 06:58:40 +0000 (UTC)
Subject: Re: [RFC v12 38/65] target/arm: remove broad "else" statements when
 checking accels
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-39-cfontana@suse.de>
 <00984c12-4861-7234-d62c-3a8a84ad5e31@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <ae3bd40a-4b8e-01d8-244e-6135f7d125ba@suse.de>
Date: Mon, 29 Mar 2021 08:58:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <00984c12-4861-7234-d62c-3a8a84ad5e31@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Julien Grall <jgrall@amazon.com>,
 qemu-devel@nongnu.org, Olaf Hering <OHering@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/21 7:11 PM, Richard Henderson wrote:
> On 3/26/21 1:36 PM, Claudio Fontana wrote:
>> @@ -638,24 +638,21 @@ static int cpu_pre_save(void *opaque)
>>   
>>       if (tcg_enabled()) {
>>           pmu_op_start(&cpu->env);
>> +        if (!write_cpustate_to_list(cpu, false)) {
>> +            /* This should never fail. */
>> +            abort();
>> +        }
>>       }
>> -
>>       if (kvm_enabled()) {
>>           if (!write_kvmstate_to_list(cpu)) {
>>               /* This should never fail */
>>               abort();
>>           }
>> -
>>           /*
>>            * kvm_arm_cpu_pre_save() must be called after
>>            * write_kvmstate_to_list()
>>            */
>>           kvm_arm_cpu_pre_save(cpu);
>> -    } else {
>> -        if (!write_cpustate_to_list(cpu, false)) {
>> -            /* This should never fail. */
>> -            abort();
>> -        }
>>       }
> 
> Hmm.  Not perfect.  I can't decide on
> 
>    if (tcg) {
>       ...
>    } else if (kvm) {
>       ...
>    }
> 

this is fine for me,

> or
> 
>    if (tcg) {
>      pmu
>    }
>    if (kvm || tcg) {
>      write_cpustate_to_list
>    }
>    if (kvm) {
>      rest of kvm stuff
>    }
> 

this is incorrect, so the choice is easy, lets do the first.

Thanks,

Claudio

> 
> r~
> 


