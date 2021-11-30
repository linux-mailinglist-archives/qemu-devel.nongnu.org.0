Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87640462F27
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 10:01:54 +0100 (CET)
Received: from localhost ([::1]:46292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrz1N-0006Hj-Df
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 04:01:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1mryzx-00052M-VB
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 04:00:27 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:58918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1mryzs-0005VC-96
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 04:00:25 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A29E31FD2F;
 Tue, 30 Nov 2021 09:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638262818; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7YYmui0fVM8YrgM53fD8wEeDFGODF3K+FAEA3+2MLJs=;
 b=bce7kmUC/IOUeNS3qNUgvYy3Ud16YPaDk4Mi53XYV3GKy8yaBNXy1jFUfCLs7EUtokXxAa
 00qG4DB3pcE/8AvVHSfKdVffJY8GdT6UwLHdTVaGuVZiUlyXxg7spiIgG7vJrkTnJIJYbt
 sOAe1n7TEkmA9ki37dgvFWjtfr0/zTI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638262818;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7YYmui0fVM8YrgM53fD8wEeDFGODF3K+FAEA3+2MLJs=;
 b=J3EM8M9ur2jI1j5v7ZbB66NyLnKP0iKe5ibo0QNMCiYODp9AG9kapDX1DZxnm1NpaRLbVc
 0YtSS/NztnCEyaDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5643513C3D;
 Tue, 30 Nov 2021 09:00:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5WS+EiLopWHyCwAAMHmgww
 (envelope-from <cfontana@suse.de>); Tue, 30 Nov 2021 09:00:18 +0000
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
 <483ebe21-2972-90c0-bc9a-ce922518632d@suse.de>
 <bdd861f68aa1533b2ea752c6509c03ca7b9f0279.camel@infradead.org>
 <93efa230-fb6b-fdc7-a696-c555676da2b4@suse.de>
 <d437972602decfeb392b08563589952358bdd510.camel@infradead.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <9990ade1-ccfa-a712-94c0-1667f5b3094f@suse.de>
Date: Tue, 30 Nov 2021 10:00:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <d437972602decfeb392b08563589952358bdd510.camel@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.211,
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
Cc: "lovemrd@gmail.com" <lovemrd@gmail.com>, "alxndr@bu.edu" <alxndr@bu.edu>,
 "philmd@redhat.com" <philmd@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/29/21 9:29 PM, David Woodhouse wrote:
> On Mon, 2021-11-29 at 20:55 +0100, Claudio Fontana wrote:
>> On 11/29/21 8:19 PM, David Woodhouse wrote:
>>> On Mon, 2021-11-29 at 20:10 +0100, Claudio Fontana wrote:
>>>>
>>>> Hmm I thought what you actually care for, for cpu "host", is just the kvm_enable_x2apic() call, not the kvm_default_props.
>>>>
>>>>
>>>>
>>>> Do you also expect the kvm_default_prop "kvm-msi-ext-dest-id" to be switch to "on" and applied?
>>>
>>> It's already on today. It just isn't *true* because QEMU never called
>>> kvm_enable_x2apic().
>>
>>
>> property should be on, but not by setting in kvm_default_prop / applied via kvm_default_prop, that mechanism is for the versioned cpu models,
>> which use X86CPUModel / X86CPUDefinition , and "host" isn't one of them.
>>
>> Out of curiosity, does my previous snippet actually work? Not that I am sure it is the best solution,
>> just for my understanding. It would be surprising to me that the need to actually manually apply "kvm-msi-ext-dest-id" to "on" there.
>>
> 
> This one?
> 
> --- a/target/i386/kvm/kvm-cpu.c
> +++ b/target/i386/kvm/kvm-cpu.c
> @@ -161,14 +161,14 @@ static void kvm_cpu_instance_init(CPUState *cs)
>  
>      host_cpu_instance_init(cpu);
>  
> -    if (xcc->model) {
>          /* only applies to builtin_x86_defs cpus */
>          if (!kvm_irqchip_in_kernel()) {
>              x86_cpu_change_kvm_default("x2apic", "off");
>          } else if (kvm_irqchip_is_split() && kvm_enable_x2apic()) {
> -            x86_cpu_change_kvm_default("kvm-msi-ext-dest-id", "on");
> +               x86_cpu_change_kvm_default("kvm-msi-ext-dest-id", "on");
>          }
>  
> +    if (xcc->model) {
>          /* Special cases not set in the X86CPUDefinition structs: */
>          x86_cpu_apply_props(cpu, kvm_default_props);
>      }
> 
> Note that in today's HEAD we already advertise X2APIC and ext-dest-id
> to the '-cpu host' guest; it's just not *true* because we never call
> kvm_enable_x2apic().

This is clear to me. The move of the code there is simply to:

1) make sure that, for non-host, versioned cpu models, we continue to set the kvm_default_props and apply them in the same way.

2) for the host cpu, make sure that kvm_enable_x2apic() is called. x86_cpu_change_kvm_default is completely irrelevant for host cpu, as you have noted.

You are right that we continue to not handle the error path correctly on kvm_enable_x2apic failure, for both smp > 255 and <= 255.  

> 
> So yes, the above works on a modern kernel where kvm_enable_x2apic()
> succeeds. But that's the easy case.
> 
> Where your snippet *won't* work is in the case of running on an old
> kernel where kvm_enable_x2apic() fails.


I tend to agree that what we want if kvm_enable_x2apic fails is to abort QEMU if we have been requesting smp > 255,
and if we did not request smp > 255 cpus, we want to not advertise the feature.

This is not accomplished, neither by my snippet above, not by the existing code at any point in git history, and not by yours in itself.

Your change seems to accomplish the call to kvm_enable_x2apic, and abort if requested smp > 255,
but it does not stop advertising X2APIC and ext-dest-id on kvm_enable_x2apic failure for the case < 255, so we'd need to add that.

Do I understand it right? Do we need to wrap all of this logic in a if (kvm_enabled()) ?

> 
> In that case it needs to turn x2apic support *off*. But simply calling
> (or not calling) x86_cpu_change_kvm_default() makes absolutely no
> difference unless those defaults are *applied* by calling
> x86_cpu_apply_props()

right, it makes absolutely no difference, and we cannot use kvm_default_props, as they are for something else entirely.

> or making the same change by some other means.

right, we need to change it by other means.

It is still unclear to me for which cpu classes and versioned models we should behave like this. Thoughts?

"max"? "base"? versioned models: depending on the model features?

> 
> 
>>> So what I care about (in case ∃ APIC IDs >= 255) is two things:
>>>
>>>  1. Qemu needs to call kvm_enable_x2apic().
>>>  2. If that *fails* qemu needs to *stop* advertising X2APIC and ext-dest-id.

Understand. We also need though:

3. Not call kvm_enable_x2apic() when it should not be called (non-KVM accelerator, which cpu classes and models)
4. Not stop advertising X2APIC and ext-dest-id when we shouldn't stop advertising it.

>>>
>>>
>>> That last patch snippet in pc_machine_done() should suffice to achieve
>>> that, I think. Because if kvm_enable_x2apic() fails and qemu has been
>>> asked for that many CPUs, it aborts completely. Which seems right.

see comments above, and should we limit that code to when kvm is enabled?

>>>
>>
>> seems right to abort if requesting > 255 APIC IDs cannot be satisfied, I agree.
>>
>> So I think in the end, we want to:
>>
>> 1) make sure that when accel=kvm and smp > 255 for i386, using cpu "host", kvm_enable_x2apic() is called and successful.
>>
>> 2) in addressing requirement 1), we do not break something else (other machines, other cpu classes/models, TCG, ...).
>>
>> 3) as a plus we might want to cleanup and determine once and for all where kvm_enable_x2apic() should be called:
>>    we have calls in intel_iommu.c and in the kvm cpu class instance initialization here in kvm-cpu.c today:
>>    before adding a third call we should really ask ourselves where the proper initialization of this should happen.
>>
> 
> I think the existing two calls to kvm_enable_x2apic() become mostly
> redundant. Because in fact the vtd_decide_config() and
> kvm_cpu_instance_init() callers would both by perfectly OK without
> kvm_enable_x2apic() if there isn't a CPU with an APIC ID >= 255
> anyway. 
> 
> And that means that with my patch, pc_machine_done() will have
> *aborted* if their conditions aren't met.

I think it is good to abort early if we figure out that the user request of APIC ID >= 255 cannot be satisfied. 

> 
> But then again, if since kvm_enable_x2apic() is both the initial
> initialisation *and* a cached sanity check that it has indeed been
> enabled successfully, there perhaps isn't any *harm* in having them do
> the check for themselves?
> 

Well the harm in my mind is, do we need to handle the error condition correctly at each single place? 
Do we risk slightly different behavior and advertised features depending on where the call happens?

Seems that we can reduce the complexity and long term risk by handling things in one single place, if we definitely find what that place should be.

Thanks,

Claudio


