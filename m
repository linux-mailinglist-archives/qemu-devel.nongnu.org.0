Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEFD461C78
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 18:08:02 +0100 (CET)
Received: from localhost ([::1]:39620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrk8H-00060i-6p
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 12:08:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1mrk3w-0008Sl-NH
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 12:03:32 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:59832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1mrk3t-0008GH-Sv
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 12:03:32 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AE76D2171F;
 Mon, 29 Nov 2021 17:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638205405; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+J+5WeOHDg3lt1/iRK7Mjg4coQX3VyN0IQVgiA1k6bM=;
 b=uikoFRcya63koJVnbYO0G4xfznI4fzx2prsGYBR+BrzWVtG/cRy3hm2rwfZJAFJFn+Dx04
 yMC3ETQNWQYkbnYCIJxzZhUjuJF+GTQ4K4rI3GS/q9vyO4baD+FTb7s5pvwJoy68vE+f1u
 yeaVOz2VJB8h30Po3GSOcQwFzJpw2Q4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638205405;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+J+5WeOHDg3lt1/iRK7Mjg4coQX3VyN0IQVgiA1k6bM=;
 b=jAE1OvwJ8AzOOgDTDiZ3sZa6l3UVATbFPqwGX6vNjn8IrBqKdZUc07JyDRMh1fZDeyTxXW
 8JXx62p4dQ3y8WCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6956113B7D;
 Mon, 29 Nov 2021 17:03:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9SEZGN0HpWFqUgAAMHmgww
 (envelope-from <cfontana@suse.de>); Mon, 29 Nov 2021 17:03:25 +0000
Subject: Re: [PATCH for-6.1 v2] i386: do not call cpudef-only models functions
 for max, host, base
From: Claudio Fontana <cfontana@suse.de>
To: David Woodhouse <dwmw2@infradead.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
References: <20210723112921.12637-1-cfontana@suse.de>
 <1102c315addf2f2fffc49222ab5be118e7ae9b0f.camel@amazon.co.uk>
 <f5910284-14ca-8796-4e64-38fef246bd19@suse.de>
 <e57e2119df69ac190cdd763b7ac8d5894b110839.camel@infradead.org>
 <b613015e-3285-8d30-292f-6bf9816b1912@suse.de>
Message-ID: <69ba096b-2cec-1928-8ce8-20c1acc14128@suse.de>
Date: Mon, 29 Nov 2021 18:03:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <b613015e-3285-8d30-292f-6bf9816b1912@suse.de>
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

On 11/29/21 5:57 PM, Claudio Fontana wrote:
> On 11/29/21 4:11 PM, David Woodhouse wrote:
>> On Mon, 2021-11-29 at 15:14 +0100, Claudio Fontana wrote:
>>> On 11/29/21 12:39 PM, Woodhouse, David wrote:
>>>> On Fri, 2021-07-23 at 13:29 +0200, Claudio Fontana wrote:
>>>>>  static void kvm_cpu_instance_init(CPUState *cs)
>>>>>  {
>>>>>      X86CPU *cpu = X86_CPU(cs);
>>>>> +    X86CPUClass *xcc = X86_CPU_GET_CLASS(cpu);
>>>>>
>>>>>      host_cpu_instance_init(cpu);
>>>>>
>>>>> -    if (!kvm_irqchip_in_kernel()) {
>>>>> -        x86_cpu_change_kvm_default("x2apic", "off");
>>>>> -    } else if (kvm_irqchip_is_split() && kvm_enable_x2apic()) {
>>>>> -        x86_cpu_change_kvm_default("kvm-msi-ext-dest-id", "on");
>>>>> -    }
>>>>> -
>>>>> -    /* Special cases not set in the X86CPUDefinition structs: */
>>>>> +    if (xcc->model) {
>>>>> +        /* only applies to builtin_x86_defs cpus */
>>>>> +        if (!kvm_irqchip_in_kernel()) {
>>>>> +            x86_cpu_change_kvm_default("x2apic", "off");
>>>>> +        } else if (kvm_irqchip_is_split() && kvm_enable_x2apic()) {
>>>>> +            x86_cpu_change_kvm_default("kvm-msi-ext-dest-id", "on");
>>>>> +        }
>>>>>
>>>>> -    x86_cpu_apply_props(cpu, kvm_default_props);
>>>>> +        /* Special cases not set in the X86CPUDefinition structs: */
>>>>> +        x86_cpu_apply_props(cpu, kvm_default_props);
>>>>> +    }
>>>>>
>>>>
>>>> I think this causes a regression in x2apic and kvm-msi-ext-dest-id
>>>> support. If you start qemu thus:
>>>
>>> If I recall correctly, this change just tries to restore the behavior prior to
>>> commit f5cc5a5c168674f84bf061cdb307c2d25fba5448 ,
>>>
>>> fixing the issue introduced with the refactoring at that time.
>>>
>>> Can you try bisecting prior to
>>> f5cc5a5c168674f84bf061cdb307c2d25fba5448 , to see if the actual
>>> breakage comes from somewhere else?
>>
>> Hm, so it looks like it never worked for '-cpu host' *until* commit
>> f5cc5a5c16.
> 
> Right, so here we are talking about properly supporting this for the first time.
> 
> The fact that it works with f5cc5a5c16 is more an accident than anything else, that commit was clearly broken
> (exemplified by reports of failed boots).
> 
> So we need to find the proper solution, ie, exactly which features should be enabled for which cpu classes and models.
> 
>>
>> It didn't matter before c1bb5418e3 because you couldn't enable that
>> many vCPUs without an IOMMU, and the *IOMMU* setup would call
>> kvm_enable_x2apic().
>>
>> But after that, nothing ever called kvm_enable_x2apic() in the '-cpu
>> host' case until commit f5cc5a5c16, which fixed it... until you
>> restored the previous behaviour :)
>>
>> This "works" to fix this case, but presumably isn't correct:
> 
> Right, we cannot just enable all this code, or the original refactor would have been right.
> 
> These kvm default properties have been as far as I know intended for the cpu actual models (builtin_x86_defs),
> and not for the special cpu classes max, host and base. This is what the revert addresses.
> 
> I suspect what we actually need here is to review exactly in which specific cases kvm_enable_x2apic() should be called in the end.
> 
> The code there is mixing changes to the kvm_default_props that are then applied using x86_cpu_apply_props (and that part should be only for xcc->model != NULL),
> with the actual enablement of the kvm x2apic using kvm_vm_enable_cap(s, KVM_CAP_X2APIC_API, 0, flags) via kvm_enable_x2apic().
> 
> One way is to ignore this detail and just move out those checks, since changes to kvm_default_props are harmless once we skip the x86_cpu_apply_props call,
> as such: 
> 
> ------
> 
> static void kvm_cpu_instance_init(CPUState *cs)
> {
>     X86CPU *cpu = X86_CPU(cs);
>     X86CPUClass *xcc = X86_CPU_GET_CLASS(cpu);
> 
>     host_cpu_instance_init(cpu);
> 
>     /* only applies to builtin_x86_defs cpus */
>     if (!kvm_irqchip_in_kernel()) {
>         x86_cpu_change_kvm_default("x2apic", "off");
>     } else if (kvm_irqchip_is_split() && kvm_enable_x2apic()) {
>         x86_cpu_change_kvm_default("kvm-msi-ext-dest-id", "on");
>     }
> 
>     if (xcc->model) {
>         /* Special cases not set in the X86CPUDefinition structs: */
>         x86_cpu_apply_props(cpu, kvm_default_props);
>     }
> 
>     if (cpu->max_features) {
>         kvm_cpu_max_instance_init(cpu);
>     }
> 
>     kvm_cpu_xsave_init();
> }
> 
> ------
> 
> this might however cause further confusion later on, and I wonder if this is actually correct, should we _always_ enable x2apic when kvm_irqchip_is_split() returns true?

... and only when kvm_irqchip_is_split() ?

> Even for cpu class "base"? I am not too sure.
> 
> Another option that comes to mind is to add a call to enable x2apic for max features cpus only ("host", "max") and not for base.
> 
> Thoughts? Paolo, Edoardo, anything comes to mind from your side?
> 
> Ciao,
> 
> Claudio
> 
> 
>>
>> --- a/target/i386/kvm/kvm-cpu.c
>> +++ b/target/i386/kvm/kvm-cpu.c
>> @@ -161,7 +161,7 @@ static void kvm_cpu_instance_init(CPUState *cs)
>>  
>>      host_cpu_instance_init(cpu);
>>  
>> -    if (xcc->model) {
>> +    if (1 || xcc->model) {
>>          /* only applies to builtin_x86_defs cpus */
>>          if (!kvm_irqchip_in_kernel()) {
>>              x86_cpu_change_kvm_default("x2apic", "off");
>>
>>
>>>> Any image to specifically test out? Would an actual 9 sockets machine be required to reproduce this?
>>
>> No, but the more CPUs you have in the host the less you have to wait
>> for 288 vCPUs to spin up :)
>>
>> My test is:
>>
>> ./qemu-system-x86_64 -machine q35,accel=kvm,usb=off,kernel_irqchip=split -cpu host -m 2G -smp sockets=9,cores=16,threads=2 -drive file=/var/lib/libvirt/images/fedora.qcow2,if=virtio -serial mon:stdio -display none  -kernel ~/git/linux/arch/x86/boot/bzImage  -append "console=ttyS0,115200 root=/dev/vda1" 
>>
>>
>> I then play with the affinity of the AHCI MSI. Pointing it at CPU 255
>> should show the problem. 
>>
>> [root@localhost ~]# cd /proc/irq/313
>> [root@localhost 313]# echo 255 > smp_affinity_list 
>> [root@localhost 313]#
>> [   65.365821] Composed MSI for APIC 255 vector 0x22: 0/feeff000 22
>> [root@localhost 313]# grep ahci /proc/interrupts 
>>
>>
>> I also added some debugging into host and guest kernels to be a little
>> more explicit:
>>
>> diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
>> index b70344bf6600..53191db5145d 100644
>> --- a/arch/x86/kernel/apic/apic.c
>> +++ b/arch/x86/kernel/apic/apic.c
>> @@ -1866,6 +1866,7 @@ static __init void try_to_enable_x2apic(int remap_mode)
>>  		 * used for non-remapped IRQ domains.
>>  		 */
>>  		if (x86_init.hyper.msi_ext_dest_id()) {
>> +			pr_info("x2apic: support extended destination ID\n");
>>  			virt_ext_dest_id = 1;
>>  			apic_limit = 32767;
>>  		}
>> @@ -2539,6 +2540,7 @@ void __irq_msi_compose_msg(struct irq_cfg *cfg, struct msi_msg *msg,
>>  		msg->arch_addr_lo.virt_destid_8_14 = cfg->dest_apicid >> 8;
>>  	else
>>  		WARN_ON_ONCE(cfg->dest_apicid > 0xFF);
>> +	printk("Composed MSI for APIC %d vector 0x%x: %x/%x %x\n", cfg->dest_apicid, cfg->vector, msg->address_hi, msg->address_lo, msg->data);
>>  }
>>  
>>  u32 x86_msi_msg_get_destid(struct msi_msg *msg, bool extid)
>> diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
>> index 59abbdad7729..f0a7715763a2 100644
>> --- a/arch/x86/kernel/kvm.c
>> +++ b/arch/x86/kernel/kvm.c
>> @@ -856,6 +856,8 @@ static void __init kvm_apic_init(void)
>>  
>>  static bool __init kvm_msi_ext_dest_id(void)
>>  {
>> +	printk("dest id? %d (%x)\n", kvm_para_has_feature(KVM_FEATURE_MSI_EXT_DEST_ID),
>> +	       kvm_arch_para_features());
>>  	return kvm_para_has_feature(KVM_FEATURE_MSI_EXT_DEST_ID);
>>  }
>>  
>> diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
>> index 759952dd1222..defe6a843780 100644
>> --- a/arch/x86/kvm/lapic.c
>> +++ b/arch/x86/kvm/lapic.c
>> @@ -894,15 +894,21 @@ static bool kvm_apic_is_broadcast_dest(struct kvm *kvm, struct kvm_lapic **src,
>>  {
>>  	if (kvm->arch.x2apic_broadcast_quirk_disabled) {
>>  		if ((irq->dest_id == APIC_BROADCAST &&
>> -				map->mode != KVM_APIC_MODE_X2APIC))
>> +		     map->mode != KVM_APIC_MODE_X2APIC)) {
>> +			printk("dest %d mode %d makes bcast\n", irq->dest_id, map->mode);
>>  			return true;
>> -		if (irq->dest_id == X2APIC_BROADCAST)
>> +		}
>> +		if (irq->dest_id == X2APIC_BROADCAST)  {
>> +			printk("Sent to X2APIC bcast\n");
>>  			return true;
>> +		}
>>  	} else {
>>  		bool x2apic_ipi = src && *src && apic_x2apic_mode(*src);
>>  		if (irq->dest_id == (x2apic_ipi ?
>> -		                     X2APIC_BROADCAST : APIC_BROADCAST))
>> +		                     X2APIC_BROADCAST : APIC_BROADCAST)) {
>> +			printk("no quirk dest %x\n", irq->dest_id);
>>  			return true;
>> +		}
>>  	}
>>  
>>  	return false;
>> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
>> index d8f1d2169b45..5b0fd6d37a7e 100644
>> --- a/arch/x86/kvm/x86.c
>> +++ b/arch/x86/kvm/x86.c
>> @@ -5714,6 +5714,7 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
>>  		if (cap->args[0] & KVM_X2APIC_API_DISABLE_BROADCAST_QUIRK)
>>  			kvm->arch.x2apic_broadcast_quirk_disabled = true;
>>  
>> +		printk("X2APIC API: %x\n", cap->args[0]);
>>  		r = 0;
>>  		break;
>>  	case KVM_CAP_X86_DISABLE_EXITS:
>>
> 


