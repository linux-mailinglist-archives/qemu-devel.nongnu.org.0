Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 296A6461817
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 15:25:09 +0100 (CET)
Received: from localhost ([::1]:41716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrhae-0005LT-89
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 09:25:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1mrhPy-0007y6-R9
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 09:14:06 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:49616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1mrhPw-0007hP-E5
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 09:14:06 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C7EB11FD38;
 Mon, 29 Nov 2021 14:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638195240; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2iXo39bChFl5npJThOyDDIDxAfrgLTITMG1RHc78tVo=;
 b=OhLG1RXs/vev8egmfOt2UHNk6uWo7P07nWpzdCsX2t+WXNKQFmU3Ltph2c8//A0RrZjuUq
 HluovUaI6hHWqYe+iojOy3SRpGMWB+iu/JJcfzrZvY7SYDBfh2tuFxpwtLUSeFjSWiYd+1
 g0YrP0lykNXXMgnVCrfFh7Hi09PDAVc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638195240;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2iXo39bChFl5npJThOyDDIDxAfrgLTITMG1RHc78tVo=;
 b=YpvRkL4yAq/Nao2JUO9rUCKoPDfH3a+XMWRX8LYi+oU4e/mIgUH6qmgF5RgQYpneE2nDZe
 Eih3HtB9tuL0M7BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7DE7A13B15;
 Mon, 29 Nov 2021 14:14:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id v//nHCjgpGGjeAAAMHmgww
 (envelope-from <cfontana@suse.de>); Mon, 29 Nov 2021 14:14:00 +0000
Subject: Re: [PATCH for-6.1 v2] i386: do not call cpudef-only models functions
 for max, host, base
To: "Woodhouse, David" <dwmw@amazon.co.uk>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
References: <20210723112921.12637-1-cfontana@suse.de>
 <1102c315addf2f2fffc49222ab5be118e7ae9b0f.camel@amazon.co.uk>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <f5910284-14ca-8796-4e64-38fef246bd19@suse.de>
Date: Mon, 29 Nov 2021 15:14:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1102c315addf2f2fffc49222ab5be118e7ae9b0f.camel@amazon.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
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

On 11/29/21 12:39 PM, Woodhouse, David wrote:
> On Fri, 2021-07-23 at 13:29 +0200, Claudio Fontana wrote:
>>  static void kvm_cpu_instance_init(CPUState *cs)
>>  {
>>      X86CPU *cpu = X86_CPU(cs);
>> +    X86CPUClass *xcc = X86_CPU_GET_CLASS(cpu);
>>  
>>      host_cpu_instance_init(cpu);
>>  
>> -    if (!kvm_irqchip_in_kernel()) {
>> -        x86_cpu_change_kvm_default("x2apic", "off");
>> -    } else if (kvm_irqchip_is_split() && kvm_enable_x2apic()) {
>> -        x86_cpu_change_kvm_default("kvm-msi-ext-dest-id", "on");
>> -    }
>> -
>> -    /* Special cases not set in the X86CPUDefinition structs: */
>> +    if (xcc->model) {
>> +        /* only applies to builtin_x86_defs cpus */
>> +        if (!kvm_irqchip_in_kernel()) {
>> +            x86_cpu_change_kvm_default("x2apic", "off");
>> +        } else if (kvm_irqchip_is_split() && kvm_enable_x2apic()) {
>> +            x86_cpu_change_kvm_default("kvm-msi-ext-dest-id", "on");
>> +        }
>>  
>> -    x86_cpu_apply_props(cpu, kvm_default_props);
>> +        /* Special cases not set in the X86CPUDefinition structs: */
>> +        x86_cpu_apply_props(cpu, kvm_default_props);
>> +    }
>>  
> 
> I think this causes a regression in x2apic and kvm-msi-ext-dest-id
> support. If you start qemu thus:

If I recall correctly, this change just tries to restore the behavior prior to  
commit f5cc5a5c168674f84bf061cdb307c2d25fba5448 ,

fixing the issue introduced with the refactoring at that time.

Can you try bisecting prior to f5cc5a5c168674f84bf061cdb307c2d25fba5448 , to see if the actual breakage comes from somewhere else?

> 
> qemu-system-x86_64 -machine q35,accel=kvm,usb=off,kernel_irqchip=split -cpu host -smp 288,sockets=9,cores=16,threads=2
> 
> The guest now sees those features, but we don't actually call
> kvm_enable_x2apic() so the APIC broadcast quirk doesn't get disabled,
> and interrupts targeted at APIC ID 255 are interpreted as broadcasts:
> 
> [ 73.198504] __common_interrupt: 0.34 No irq handler for vector
> [ 73.198515] __common_interrupt: 11.34 No irq handler for vector
> [ 73.198517] __common_interrupt: 12.34 No irq handler for vector
> [ 73.198521] __common_interrupt: 15.34 No irq handler for vector
> [ 73.198524] __common_interrupt: 17.34 No irq handler for vector
> [ 73.198528] __common_interrupt: 34.34 No irq handler for vector
> [ 73.198529] __common_interrupt: 20.34 No irq handler for vector
> [ 73.198533] __common_interrupt: 41.34 No irq handler for vector
> [ 73.198539] __common_interrupt: 27.34 No irq handler for vector
> [ 73.198542] __common_interrupt: 28.34 No irq handler for vector
> 
> 

Any image to specifically test out? Would an actual 9 sockets machine be required to reproduce this?

Thanks,

Claudio

