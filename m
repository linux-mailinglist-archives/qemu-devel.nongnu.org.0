Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAEE34941F
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 15:33:04 +0100 (CET)
Received: from localhost ([::1]:59002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPR2l-0005aW-H4
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 10:33:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPQzw-00040y-Sz
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 10:30:08 -0400
Received: from mx2.suse.de ([195.135.220.15]:41204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPQzt-0001jO-PM
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 10:30:08 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8F852ADF1;
 Thu, 25 Mar 2021 14:30:04 +0000 (UTC)
Subject: Re: [RFC v11 26/55] target/arm: split a15 cpu model and 32bit class
 functions to cpu32.c
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323154639.23477-19-cfontana@suse.de>
 <49cc1fe8-b990-e11f-8bf9-479ac9e25b57@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <e1c60573-77fd-4c06-25f4-0cd91c08eeff@suse.de>
Date: Thu, 25 Mar 2021 15:30:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <49cc1fe8-b990-e11f-8bf9-479ac9e25b57@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 11:17 PM, Richard Henderson wrote:
> On 3/23/21 9:46 AM, Claudio Fontana wrote:
>> -static void arm_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>> -{
>> -    ARMCPU *cpu = ARM_CPU(cs);
>> -    CPUARMState *env = &cpu->env;
>> -    int i;
>> -
>> -    if (is_a64(env)) {
>> -        aarch64_cpu_dump_state(cs, f, flags);
>> -        return;
>> -    }
> 
> You've lost this bit.
> 
> Somewhere there needs to be a check of the current cpu state, and one of the 
> two functions must be called.


Thanks for the nice catch, I got confused there.

> 
> 
>> @@ -823,6 +951,7 @@ static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
>>      cc->gdb_num_core_regs = 34;
>>      cc->gdb_core_xml_file = "aarch64-core.xml";
>>      cc->gdb_arch_name = aarch64_gdb_arch_name;
>> +    cc->dump_state = aarch64_cpu_dump_state;
> 
> I suggest this continue to set arm_cpu_dump_state, like so,
> 
> static void arm_cpu_dump_state(CPUState *cs, FILE *f, int flags)
> {
>      if (is_a64(env)) {
>          aarch64_cpu_dump_state(cs, f, flags);
>      } else {
>          aarch32_cpu_dump_state(cs, f, flags);
>      }
> }
> 
> 
> r~
> 


