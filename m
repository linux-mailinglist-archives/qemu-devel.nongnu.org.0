Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D362C0225
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 10:20:09 +0100 (CET)
Received: from localhost ([::1]:34366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh811-0001cp-Qb
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 04:20:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kh7z7-0000k1-4j
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 04:18:09 -0500
Received: from mx2.suse.de ([195.135.220.15]:34240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kh7z4-0007MK-9K
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 04:18:08 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1D319ABDE;
 Mon, 23 Nov 2020 09:18:01 +0000 (UTC)
Subject: Re: [RFC v4 9/9] i386: split cpu accelerators from cpu.c
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20201120144909.24097-1-cfontana@suse.de>
 <20201120144909.24097-10-cfontana@suse.de>
 <20201120174447.GC2271382@habkost.net>
 <5ac27efa-0766-c5e4-be6c-7ba031997cd3@suse.de>
 <20201120190034.GG2271382@habkost.net>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <82dfb89f-7bd4-df2f-39c8-3f87eb352ecd@suse.de>
Date: Mon, 23 Nov 2020 10:17:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201120190034.GG2271382@habkost.net>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Hi Eduardo,

On 11/20/20 8:00 PM, Eduardo Habkost wrote:
> On Fri, Nov 20, 2020 at 07:47:11PM +0100, Claudio Fontana wrote:
>> On 11/20/20 6:44 PM, Eduardo Habkost wrote:
>>> On Fri, Nov 20, 2020 at 03:49:09PM +0100, Claudio Fontana wrote:
>>>> split cpu.c into:
>>>>
>>>> cpu.c            cpuid and common x86 cpu functionality
>>>> host-cpu.c       host x86 cpu functions and "host" cpu type
>>>> kvm/cpu.c        KVM x86 cpu type
>>>> hvf/cpu.c        HVF x86 cpu type
>>>> tcg/cpu.c        TCG x86 cpu type
>>>>
>>>> The link to the accel class is set in the X86CPUClass classes
>>>> at MODULE_INIT_ACCEL_CPU time, when the accelerator is known.
>>>>
>>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>> [...]
>>>> +static void hvf_cpu_accel_class_init(ObjectClass *oc, void *data)
>>>> +{
>>>> +    X86CPUAccelClass *acc = X86_CPU_ACCEL_CLASS(oc);
>>>> +
>>>> +    acc->cpu_realizefn = host_cpu_realizefn;
>>>> +    acc->cpu_common_class_init = hvf_cpu_common_class_init;
>>>> +    acc->cpu_instance_init = hvf_cpu_instance_init;
>>>> +};
>>>> +static const TypeInfo hvf_cpu_accel_type_info = {
>>>> +    .name = X86_CPU_ACCEL_TYPE_NAME("hvf"),
>>>> +
>>>> +    .parent = TYPE_X86_CPU_ACCEL,
>>>> +    .class_init = hvf_cpu_accel_class_init,
>>>> +};
>>>> +static void hvf_cpu_accel_register_types(void)
>>>> +{
>>>> +    type_register_static(&hvf_cpu_accel_type_info);
>>>> +}
>>>> +type_init(hvf_cpu_accel_register_types);
>>>> +
>>>> +static void hvf_cpu_accel_init(void)
>>>> +{
>>>> +    if (hvf_enabled()) {
>>>> +        x86_cpu_accel_init(X86_CPU_ACCEL_TYPE_NAME("hvf"));
>>>> +    }
>>>> +}
>>>> +
>>>> +accel_cpu_init(hvf_cpu_accel_init);
>>>
>>> The point of my suggestion of using QOM is to not require
>>> separate accel_cpu_init() functions and (hvf|tcg|kvm)_enabled()
>>> checks.
>>>
>>> If we still have separate accel_cpu_init() functions for calling
>>> x86_cpu_accel_init() with the right argument, using a pointer to
>>> static variables like &hvf_cpu_accel (like you did before) was
>>> simpler and required less boilerplate code.
>>
>>
>>
>> Yes I agree.
>>
>>
>>
>>
>>>
>>> However, the difference is that with the X86_CPU_ACCEL_TYPE_NAME
>>> macro + object_class_by_name(), you don't need the separate
>>> accel_cpu_init() functions for each accelerator.
>>>
>>> All you need is a single:
>>>
>>>   x86_cpu_accel_init(X86_CPU_ACCEL_TYPE_NAME(chosen_accel_name));
>>>
>>> call somewhere in the initialization path.
>>
>>
>> Makes sense. The problem is just determining chosen_accel_name.
> 
> Yeah, that was a challenge.  do_configure_accelerator() knows
> what's the chosen accel name, though.
> 
> We can also do it inside accel_init_machine(), if we can
> determine the correct accel name from the AccelState object.



I think that the fact that we cannot answer really simple questions like

"what is the selected cpu model? what is the selected accelerator?"

in a QEMU mode-independent way, easily, with no ifs and buts,
with our current codebase should be giving us a bit of pause.

It is my hope that in the future we will try to draw some synthesis from
all the different frameworks and systems we have in QEMU.

> 
>>
>>
>>>
>>> A good place for the x86_cpu_accel_init() call would be
>>> do_configure_accelerator(), but the function is arch-specific.
>>> That's why I suggested a cpu_accel_arch_init() function at
>>> https://lore.kernel.org/qemu-devel/20201118220750.GP1509407@habkost.net
>>>
>>
>>
>> Fine by me. I'd use a specific init step for this, but that also works.
> 
> A separate module init function has no easy access to the accel
> name, but in this case I'd say it's on purpose: the intended use
> case for module init functions is to unconditionally register
> features provided by a code module.  They shouldn't look at any
> runtime configuration or runtime state.
> 

Ok, I'll take this up as a requirement for the next attempt.

Thank you!

CLaudio


