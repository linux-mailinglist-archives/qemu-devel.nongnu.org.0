Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F9830E050
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 17:58:51 +0100 (CET)
Received: from localhost ([::1]:44820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7LUR-0007Al-0Q
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 11:58:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l7LNh-0000OP-Bs
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:51:53 -0500
Received: from mx2.suse.de ([195.135.220.15]:59506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l7LNc-0007Rf-JQ
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:51:53 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EA676AC45;
 Wed,  3 Feb 2021 16:51:44 +0000 (UTC)
Subject: Re: [PATCH v15 15/23] cpu: tcg_ops: move to tcg-cpu-ops.h, keep a
 pointer in CPUClass
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210201100903.17309-1-cfontana@suse.de>
 <20210201100903.17309-16-cfontana@suse.de> <87im79s05m.fsf@linaro.org>
 <df44fbe2-476b-f26d-0117-15dfa153e343@suse.de>
 <b9e1f2ce-878c-71f8-c259-a8f1c7835a8c@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <06b7c688-3d5f-abc5-64c8-cd5d7792e3e4@suse.de>
Date: Wed, 3 Feb 2021 17:51:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <b9e1f2ce-878c-71f8-c259-a8f1c7835a8c@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.178,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/21 3:48 PM, Philippe Mathieu-Daudé wrote:
> On 2/3/21 3:41 PM, Claudio Fontana wrote:
>> On 2/3/21 2:23 PM, Alex Bennée wrote:
>>> Claudio Fontana <cfontana@suse.de> writes:
> ...
>>>  /*
>>> modified   target/arm/cpu.c
>>> @@ -2248,7 +2248,7 @@ static gchar *arm_gdb_arch_name(CPUState *cs)
>>>   * NB: cannot be const, as some elements are changed for specific
>>>   * arm cpu classes.
>>>   */
>>> -static struct TCGCPUOps arm_tcg_ops = {
>>> +static const struct TCGCPUOps arm_tcg_ops = {
>>>      .initialize = arm_translate_init,
>>>      .synchronize_from_tb = arm_cpu_synchronize_from_tb,
>>>      .cpu_exec_interrupt = arm_cpu_exec_interrupt,
>>> --8<---------------cut here---------------end--------------->8---
>>>
>>> This does later break MIPS jazz:
>>>
>>> p/hw_mips_jazz.c.o -c ../../hw/mips/jazz.c
>>> ../../hw/mips/jazz.c: In function ‘mips_jazz_init’:
>>> ../../hw/mips/jazz.c:216:40: error: assignment of member ‘do_transaction_failed’ in read-only object
>>>      cc->tcg_ops->do_transaction_failed = mips_jazz_do_transaction_failed;
>>>
>>> which...
>>>
>>> <snip>
>>>>  
>>>> +#ifdef CONFIG_TCG
>>>> +#include "hw/core/tcg-cpu-ops.h"
>>>> +/*
>>>> + * NB: cannot be const, as some elements are changed for specific
>>>> + * mips hardware (see hw/mips/jazz.c).
>>>> + */
>>>
>>> does have a valid comment. So guess keep it as static and just don't
>>> claim ARM hacks around with it or find a more elegant solution for the
>>> Jazz hack (I'm not sure there is one).
>>
>> Yep, the ARM claim was true when I started looking at this, but now it's not anymore after the changes.
>>
>> However, I haven't found a way to remove the mips jazz hack.
>>
>> Maybe Philippe knows?
> 
> We need to test the real behavior on real hardware.
> 
> Eventually writing the test and asking on linux-mips@vger.kernel.org
> if someone can run it?
> 

I would not know how to do that tbh, ie which kind of test would capture this on mips/jazz.
Could you or anyone help there?

Or is there another option that we can see, beyond leaving things as they are (and thus not making the pointer const)?

One option I can see would be to define different tcg_ops entirely for jazz machines, just for one function pointer.
Seems a bit overkill, but I want to mention it as a possibility.

Thanks,

Claudio



