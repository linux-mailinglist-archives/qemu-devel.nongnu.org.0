Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA112D0CA7
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 10:09:43 +0100 (CET)
Received: from localhost ([::1]:57308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmCWc-0005KU-Ig
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 04:09:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kmCUZ-0004av-7n
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 04:07:35 -0500
Received: from mx2.suse.de ([195.135.220.15]:44610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kmCUW-0002g1-2V
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 04:07:35 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6673EAD20;
 Mon,  7 Dec 2020 09:07:30 +0000 (UTC)
Subject: Re: [RFC PATCH 18/19] target/mips: Restrict some TCG specific
 CPUClass handlers
From: Claudio Fontana <cfontana@suse.de>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20201206233949.3783184-1-f4bug@amsat.org>
 <20201206233949.3783184-19-f4bug@amsat.org>
 <88161f99-aae5-3b80-e8c6-a57d122a28c4@suse.de>
 <61618998-f854-a7df-301f-f860d9725f1d@suse.de>
Message-ID: <3956df0d-a42e-f3af-d5e1-cf396ddcb795@suse.de>
Date: Mon, 7 Dec 2020 10:07:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <61618998-f854-a7df-301f-f860d9725f1d@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/20 9:53 AM, Claudio Fontana wrote:
> On 12/7/20 8:59 AM, Claudio Fontana wrote:
>> On 12/7/20 12:39 AM, Philippe Mathieu-Daudé wrote:
>>> Restrict the following CPUClass handlers to TCG:
>>> - do_interrupt
>>
>> In this patch it seems do_interrupt is changed to be CONFIG_USER_ONLY, it is not restricted to TCG.
> 
> Of course it _is_ as only TCG can do -user- , but would it be better to wrap everything around CONFIG_TCG for what is tcg-only, and then add a subsection in there for CONFIG_USER_ONLY?


Need coffee, sorry. I think you can see the issue there, sorry for the confusion.

Thanks,

Claudio


> 
>> Was this desired, should be commented as such?
>>
>> Also, should the whole function then be #ifdefed out in helpers.c?
>> I guess I am vouching for moving the ifndef CONFIG_USER_ONLY one line up in helpers.c.
>>
>> But you wanted this CONFIG_TCG-only?
>>
>>
>>> - do_transaction_failed
>>> - do_unaligned_access
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>> Cc: Claudio Fontana <cfontana@suse.de>
>>>
>>>  target/mips/cpu.c | 8 +++++---
>>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/target/mips/cpu.c b/target/mips/cpu.c
>>> index 8a4486e3ea1..03bd35b7903 100644
>>> --- a/target/mips/cpu.c
>>> +++ b/target/mips/cpu.c
>>> @@ -483,7 +483,6 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
>>>  
>>>      cc->class_by_name = mips_cpu_class_by_name;
>>>      cc->has_work = mips_cpu_has_work;
>>> -    cc->do_interrupt = mips_cpu_do_interrupt;
>>>      cc->cpu_exec_interrupt = mips_cpu_exec_interrupt;
>>>      cc->dump_state = mips_cpu_dump_state;
>>>      cc->set_pc = mips_cpu_set_pc;
>>> @@ -491,8 +490,7 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
>>>      cc->gdb_read_register = mips_cpu_gdb_read_register;
>>>      cc->gdb_write_register = mips_cpu_gdb_write_register;
>>>  #ifndef CONFIG_USER_ONLY
>>> -    cc->do_transaction_failed = mips_cpu_do_transaction_failed;
>>> -    cc->do_unaligned_access = mips_cpu_do_unaligned_access;
>>> +    cc->do_interrupt = mips_cpu_do_interrupt;
>>>      cc->get_phys_page_debug = mips_cpu_get_phys_page_debug;
>>>      cc->vmsd = &vmstate_mips_cpu;
>>>  #endif
>>> @@ -500,6 +498,10 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
>>>  #ifdef CONFIG_TCG
>>>      cc->tcg_initialize = mips_tcg_init;
>>>      cc->tlb_fill = mips_cpu_tlb_fill;
>>> +#if !defined(CONFIG_USER_ONLY)
>>> +    cc->do_unaligned_access = mips_cpu_do_unaligned_access;
>>> +    cc->do_transaction_failed = mips_cpu_do_transaction_failed;
>>> +#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
>>>  #endif
>>>  
>>>      cc->gdb_num_core_regs = 73;
>>>
>>
> 


