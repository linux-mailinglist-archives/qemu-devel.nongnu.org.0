Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8881F3227EA
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 10:37:12 +0100 (CET)
Received: from localhost ([::1]:48494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEU7z-0004YD-IX
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 04:37:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lEU6p-0003eD-Vm
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 04:35:59 -0500
Received: from mx2.suse.de ([195.135.220.15]:48652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lEU6o-0005Rb-4E
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 04:35:59 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A12AFAC1D;
 Tue, 23 Feb 2021 09:35:56 +0000 (UTC)
Subject: Re: [RFC v1 06/38] target/arm: split off cpu-softmmu.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210221092449.7545-1-cfontana@suse.de>
 <20210221092449.7545-7-cfontana@suse.de> <87blcc57rj.fsf@linaro.org>
 <e7f21ff9-b2c6-668e-c973-d2949b81327e@suse.de>
 <2765ff1d-8b77-c2c8-c48a-dc2f582d80ff@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <477a7799-cb25-afa7-c280-09d839a2b180@suse.de>
Date: Tue, 23 Feb 2021 10:35:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <2765ff1d-8b77-c2c8-c48a-dc2f582d80ff@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Claudio Fontana <cfontana@centriq4.arch.suse.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/23/21 10:16 AM, Philippe Mathieu-Daudé wrote:
> On 2/23/21 9:55 AM, Claudio Fontana wrote:
>> On 2/22/21 6:29 PM, Alex Bennée wrote:
>>>
>>> Claudio Fontana <cfontana@suse.de> writes:
>>>
>>>> From: Claudio Fontana <cfontana@centriq4.arch.suse.de>
>>>>
>>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>>> ---
>>>>  target/arm/internals.h   |   9 ++-
>>>>  target/arm/cpu-softmmu.c | 134 +++++++++++++++++++++++++++++++++++++++
>>>>  target/arm/cpu.c         |  95 ---------------------------
>>>>  target/arm/meson.build   |   1 +
>>>>  4 files changed, 143 insertions(+), 96 deletions(-)
>>>>  create mode 100644 target/arm/cpu-softmmu.c
>>>>
>>>> diff --git a/target/arm/internals.h b/target/arm/internals.h
>>>> index 6384461177..6589b63ebc 100644
>>>> --- a/target/arm/internals.h
>>>> +++ b/target/arm/internals.h
>>>> @@ -1196,4 +1196,11 @@ static inline uint64_t useronly_maybe_clean_ptr(uint32_t desc, uint64_t ptr)
>>>>      return ptr;
>>>>  }
>>>>  
>>>> -#endif
>>>> +#ifndef CONFIG_USER_ONLY
>>>> +void arm_cpu_set_irq(void *opaque, int irq, int level);
>>>> +void arm_cpu_kvm_set_irq(void *opaque, int irq, int level);
>>>> +bool arm_cpu_virtio_is_big_endian(CPUState *cs);
>>>> +uint64_t a15_l2ctlr_read(CPUARMState *env, const ARMCPRegInfo *ri);
>>>> +#endif /* !CONFIG_USER_ONLY */
>>>> +
>>>> +#endif /* TARGET_ARM_INTERNALS_H */
>>>> diff --git a/target/arm/cpu-softmmu.c b/target/arm/cpu-softmmu.c
>>>> new file mode 100644
>>>> index 0000000000..263d1fc588
>>>> --- /dev/null
>>>> +++ b/target/arm/cpu-softmmu.c
>>>> @@ -0,0 +1,134 @@
>>>> +/*
>>>> + * QEMU ARM CPU
>>>
>>> I guess apropos the discussion earlier it's really cpu-sysemu.c and we
>>> could expand the header comment.
>>>
>>>   QEMU ARM CPU - Helpers for system emulation and KVM only
>>>
>>> <snip>
>>>
>>> Otherwise:
>>>
>>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>>>
>>
>> Should I rename all *softmmu in the series to "sysemu"?
>>
>> I wonder if we should take the issue of sysemu/system/softmmu topic into a separate series.
>> Currently basically starting from the build system already, "softmmu", sysemu and system are treated as a single thing, and the convention from build system and directories seems to be "softmmu",
>> while from the header files we get "sysemu/".
>>
>> I agree that this is not a sufficient model to account for the new feature that Richard wants to develop,
>> I just suggest we could also consider tackling this separately, with a pass through the whole code, gathering more input in the context of a dedicated series.
>>
>> What do you think?
> 
> This is a valid reasoning. However I have my doubts "doing
> that later" will ever be done/finished (not related to you
> Claudio in particular, but with dealing with all subsystems).
> 
> Personally I'd rather see this sorted out with the arm target
> then once done propose it as an example to the other ones.
> You already considered the most complex cases, x86 and arm :)


Ok, if there are no other comments I would go with "sysemu", just because "system" is a bit too much of a loaded word,
and we have the precedent of include/sysemu/ .


> 
>> Also Paolo, any comments, since softmmu is all over meson?
>>

And Peter, any comments, preference?

Ciao,

Claudio

