Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 216EA461FF4
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 20:13:50 +0100 (CET)
Received: from localhost ([::1]:32844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrm5w-0005D6-Re
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 14:13:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1mrm3G-0003Ks-6w
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 14:10:58 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:36330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1mrm3E-0000Y9-9d
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 14:10:57 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 816EF2171F;
 Mon, 29 Nov 2021 19:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638213054; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T7rlzFFmUlKNJzvWxk6L/I+ZrTYniuVxJqbk6KWeVmQ=;
 b=WdGBr0i0sCZeTkizLgaFz2Tn23OBjLFrbHFbs5wFiNf9FjD9hieYJ58JpRS66ghSJjExaq
 TTHpQubFrlya+pD1fvaNXpvQKnhVWfGAAbLl7CfnMg6/CpPZ2+S52Oi5ATnhOYmuIidlYY
 4Zmgv2lT/cvqwdNVsN7ZJ1N6ysxSn/Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638213054;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T7rlzFFmUlKNJzvWxk6L/I+ZrTYniuVxJqbk6KWeVmQ=;
 b=B/5cGiry3CzfO3JdDfN2zNoNxQngOyxMeqsodfA8MOEtxHDyd3uX76ye4j93+a8QL7QLQk
 UPXeZ1M/wNlFdxAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3901413BB8;
 Mon, 29 Nov 2021 19:10:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id p2pgDL4lpWG+CAAAMHmgww
 (envelope-from <cfontana@suse.de>); Mon, 29 Nov 2021 19:10:54 +0000
Subject: Re: [PATCH for-6.1 v2] i386: do not call cpudef-only models functions
 for max, host, base
To: David Woodhouse <dwmw2@infradead.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
References: <20210723112921.12637-1-cfontana@suse.de>
 <1102c315addf2f2fffc49222ab5be118e7ae9b0f.camel@amazon.co.uk>
 <f5910284-14ca-8796-4e64-38fef246bd19@suse.de>
 <e57e2119df69ac190cdd763b7ac8d5894b110839.camel@infradead.org>
 <b613015e-3285-8d30-292f-6bf9816b1912@suse.de>
 <d579bf46d0babc9eece1dc3e8ec63c43b311b022.camel@infradead.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <483ebe21-2972-90c0-bc9a-ce922518632d@suse.de>
Date: Mon, 29 Nov 2021 20:10:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <d579bf46d0babc9eece1dc3e8ec63c43b311b022.camel@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.317,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "alxndr@bu.edu" <alxndr@bu.edu>, "philmd@redhat.com" <philmd@redhat.com>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>,
 "lovemrd@gmail.com" <lovemrd@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/29/21 6:17 PM, David Woodhouse wrote:
> On Mon, 2021-11-29 at 17:57 +0100, Claudio Fontana wrote:
>> On 11/29/21 4:11 PM, David Woodhouse wrote:
>>> On Mon, 2021-11-29 at 15:14 +0100, Claudio Fontana wrote:
>>>> On 11/29/21 12:39 PM, Woodhouse, David wrote:
>>>>> On Fri, 2021-07-23 at 13:29 +0200, Claudio Fontana wrote:
>>>>>>  static void kvm_cpu_instance_init(CPUState *cs)
>>>>>>  {
>>>>>>      X86CPU *cpu = X86_CPU(cs);
>>>>>> +    X86CPUClass *xcc = X86_CPU_GET_CLASS(cpu);
>>>>>>
>>>>>>      host_cpu_instance_init(cpu);
>>>>>>
>>>>>> -    if (!kvm_irqchip_in_kernel()) {
>>>>>> -        x86_cpu_change_kvm_default("x2apic", "off");
>>>>>> -    } else if (kvm_irqchip_is_split() && kvm_enable_x2apic()) {
>>>>>> -        x86_cpu_change_kvm_default("kvm-msi-ext-dest-id", "on");
>>>>>> -    }
>>>>>> -
>>>>>> -    /* Special cases not set in the X86CPUDefinition structs: */
>>>>>> +    if (xcc->model) {
>>>>>> +        /* only applies to builtin_x86_defs cpus */
>>>>>> +        if (!kvm_irqchip_in_kernel()) {
>>>>>> +            x86_cpu_change_kvm_default("x2apic", "off");
>>>>>> +        } else if (kvm_irqchip_is_split() && kvm_enable_x2apic()) {
>>>>>> +            x86_cpu_change_kvm_default("kvm-msi-ext-dest-id", "on");
>>>>>> +        }
>>>>>>
>>>>>> -    x86_cpu_apply_props(cpu, kvm_default_props);
>>>>>> +        /* Special cases not set in the X86CPUDefinition structs: */
>>>>>> +        x86_cpu_apply_props(cpu, kvm_default_props);
>>>>>> +    }
>>>>>>
>>>>>
>>>>> I think this causes a regression in x2apic and kvm-msi-ext-dest-id
>>>>> support. If you start qemu thus:
>>>>
>>>> If I recall correctly, this change just tries to restore the behavior prior to
>>>> commit f5cc5a5c168674f84bf061cdb307c2d25fba5448 ,
>>>>
>>>> fixing the issue introduced with the refactoring at that time.
>>>>
>>>> Can you try bisecting prior to
>>>> f5cc5a5c168674f84bf061cdb307c2d25fba5448 , to see if the actual
>>>> breakage comes from somewhere else?
>>>
>>> Hm, so it looks like it never worked for '-cpu host' *until* commit
>>> f5cc5a5c16.
>>
>> Right, so here we are talking about properly supporting this for the first time.
>>
>> The fact that it works with f5cc5a5c16 is more an accident than anything else, that commit was clearly broken
>> (exemplified by reports of failed boots).
>>
>> So we need to find the proper solution, ie, exactly which features should be enabled for which cpu classes and models.
>>
>>>
>>> It didn't matter before c1bb5418e3 because you couldn't enable that
>>> many vCPUs without an IOMMU, and the *IOMMU* setup would call
>>> kvm_enable_x2apic().
>>>
>>> But after that, nothing ever called kvm_enable_x2apic() in the '-cpu
>>> host' case until commit f5cc5a5c16, which fixed it... until you
>>> restored the previous behaviour :)
>>>
>>> This "works" to fix this case, but presumably isn't correct:
>>
>> Right, we cannot just enable all this code, or the original refactor would have been right.
>>
>> These kvm default properties have been as far as I know intended for the cpu actual models (builtin_x86_defs),
>> and not for the special cpu classes max, host and base. This is what the revert addresses.
>>
>> I suspect what we actually need here is to review exactly in which specific cases kvm_enable_x2apic() should be called in the end.
>>
>> The code there is mixing changes to the kvm_default_props that are then applied using x86_cpu_apply_props (and that part should be only for xcc->model != NULL),
>> with the actual enablement of the kvm x2apic using kvm_vm_enable_cap(s, KVM_CAP_X2APIC_API, 0, flags) via kvm_enable_x2apic().
>>
>> One way is to ignore this detail and just move out those checks, since changes to kvm_default_props are harmless once we skip the x86_cpu_apply_props call,
>> as such: 
>>
>> ------
>>
>> static void kvm_cpu_instance_init(CPUState *cs)
>> {
>>     X86CPU *cpu = X86_CPU(cs);
>>     X86CPUClass *xcc = X86_CPU_GET_CLASS(cpu);
>>
>>     host_cpu_instance_init(cpu);
>>
>>     /* only applies to builtin_x86_defs cpus */
>>     if (!kvm_irqchip_in_kernel()) {
>>         x86_cpu_change_kvm_default("x2apic", "off");
>>     } else if (kvm_irqchip_is_split() && kvm_enable_x2apic()) {
>>         x86_cpu_change_kvm_default("kvm-msi-ext-dest-id", "on");
>>     }
>>
>>     if (xcc->model) {
>>         /* Special cases not set in the X86CPUDefinition structs: */
>>         x86_cpu_apply_props(cpu, kvm_default_props);
>>     }
>>
> 
> I don't believe that works in the case when kvm_enable_x2apic() fails
> on an older kernel. Although it sets the defaults, it still doesn't
> then *apply* them so it makes no difference.

Hmm I thought what you actually care for, for cpu "host", is just the kvm_enable_x2apic() call, not the kvm_default_props.

Do you also expect the kvm_default_prop "kvm-msi-ext-dest-id" to be switch to "on" and applied?

kvm_default_props were never applied to cpus without an x86 model definition (except for that brief time when I did it by mistake).


> 
> How about this:
> 
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -739,9 +739,9 @@ void pc_machine_done(Notifier *notifier, void *data)
>  
>  
>      if (x86ms->apic_id_limit > 255 && !xen_enabled() &&
> -        !kvm_irqchip_in_kernel()) {
> +        (!kvm_irqchip_in_kernel() || !kvm_enable_x2apic())) {
>          error_report("current -smp configuration requires kernel "
> -                     "irqchip support.");
> +                     "irqchip and X2APIC API support.");
>          exit(EXIT_FAILURE);
>      }
>  }
> 

Interesting. This would leave things like microvm out right? But maybe it's ok?

Ciao,

Claudio

