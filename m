Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9222F9C58
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 11:31:05 +0100 (CET)
Received: from localhost ([::1]:60564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1RoO-0006k7-EI
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 05:31:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l1Rlz-0005Xz-AX; Mon, 18 Jan 2021 05:28:35 -0500
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:45567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l1Rlx-0003aQ-A6; Mon, 18 Jan 2021 05:28:35 -0500
Received: by mail-qt1-x832.google.com with SMTP id d15so5449352qtw.12;
 Mon, 18 Jan 2021 02:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sQl6BbI4RE0/cU41qPaTlmO6I+2T7dSR2T7AVsJHSFI=;
 b=BHgxO1arnYUKpsXt5O390S/jG2ANYb94oQUJ/8j9C6c9efkpCN8Kl2ltaYfKKHs+fj
 5OvRPRVz5XlsmtH2xZvWi6SlW85ex7RLw2QpOJu8UB05Mw20+9HCrcTiHqdD399VXvd6
 6UzxXNq6dqNBajOpj5ZvJXhcqRzJ4FTtPKlBIq9qq0uYArJ+7D3qjwqb9CjqHqoCCCqj
 tWLg1CGalPszXvTfS4ocClyDagdceHzJ5kxtBjX6SCxbXdPpmTuWG67unZ1skYwr349D
 WIY5dMZWfNhCCeXf+zw6ukANGScS1Abo3n9H1Hun2HmH6SPW02C23QjtJnLJ65tMvM5w
 EtVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sQl6BbI4RE0/cU41qPaTlmO6I+2T7dSR2T7AVsJHSFI=;
 b=RNPjlVUfPy5RUk2HQmZRfwN6CblT14Q4+izFEfJ+LesNPq6itlWVe8BQo0gEE+eu28
 0qxOr/e1kStYwBmuIDQlDChOgluANT5VTzDfuEwTIjpnb3BAEuiBbVfeY3nIk8Hde7KA
 9qnTAlFRE4NaDwTcZpGawrrEv9jhwQ5iqQzH9ooy6N1XbrjO+j/pVBVsUUVMO3F2cG4z
 x1pH+X7S/dPQXhL6AHnfKcUzTETOGH+lFAfCqvhfvKDUyki45XZNSO+6yDHk/Yf8Jw0Q
 PGs3ZizmwSMy3hs7hbmDLUVj/YMLMrO0w4OZaURChBQ1lWCvcMxGFZ9hycOqUqQLIVKQ
 RhAQ==
X-Gm-Message-State: AOAM532PFih6Hu5Yf3lgsiXTpgWhA2lyV0Qaldx2r9lVwBVE92NqLOui
 H5lkHTk7CIYR4MXx2JhvMxA=
X-Google-Smtp-Source: ABdhPJyz2dqQAQxZ+/fm48GXnFCLNLnSbd7yrZvSSFodlUR9SVBAIzfv9wE0M0MZDCKM/NKdCEGSdw==
X-Received: by 2002:ac8:4b54:: with SMTP id e20mr22502815qts.236.1610965711461; 
 Mon, 18 Jan 2021 02:28:31 -0800 (PST)
Received: from ?IPv6:2804:431:c7c7:a75a:cb34:ba60:6de6:be1d?
 ([2804:431:c7c7:a75a:cb34:ba60:6de6:be1d])
 by smtp.gmail.com with ESMTPSA id f134sm10322315qke.23.2021.01.18.02.28.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 02:28:30 -0800 (PST)
Subject: Re: [PATCH v1 7/7] spapr.c: consider CPU core online state before
 allowing unplug
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210114180628.1675603-1-danielhb413@gmail.com>
 <20210114180628.1675603-8-danielhb413@gmail.com>
 <20210115182216.6dccadee@bahia.lan>
 <14cfa384-9972-6817-5c5f-f37bc1880043@gmail.com>
 <20210118011848.GD2089552@yekko.fritz.box>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <5a89f311-9c67-fcd0-8b6c-4dcc9be66c2d@gmail.com>
Date: Mon, 18 Jan 2021 07:28:25 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210118011848.GD2089552@yekko.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x832.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.252,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Xujun Ma <xuma@redhat.com>, qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/17/21 10:18 PM, David Gibson wrote:
> On Fri, Jan 15, 2021 at 03:52:56PM -0300, Daniel Henrique Barboza wrote:
>>
>>
>> On 1/15/21 2:22 PM, Greg Kurz wrote:
>>> On Thu, 14 Jan 2021 15:06:28 -0300
>>> Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
>>>
>>>> The only restriction we have when unplugging CPUs is to forbid unplug of
>>>> the boot cpu core. spapr_core_unplug_possible() does not contemplate the
>>
>> I'll look into it.
>>
>>>
>>> I can't remember why this restriction was introduced in the first place...
>>> This should be investigated and documented if the limitation still stands.
>>>
>>>> possibility of some cores being offlined by the guest, meaning that we're
>>>> rolling the dice regarding on whether we're unplugging the last online
>>>> CPU core the guest has.
>>>>
>>>
>>> Trying to unplug the last CPU is obviously something that deserves
>>> special care. LoPAPR is quite explicit on the outcome : this should
>>> terminate the partition.
>>>
>>> 13.7.4.1.1. Isolation of CPUs
>>>
>>> The isolation of a CPU, in all cases, is preceded by the stop-self
>>> RTAS function for all processor threads, and the OS insures that all
>>> the CPU’s threads are in the RTAS stopped state prior to isolating the
>>> CPU. Isolation of a processor that is not stopped produces unpredictable
>>> results. The stopping of the last processor thread of a LPAR partition
>>> effectively kills the partition, and at that point, ownership of all
>>> partition resources reverts to the platform firmware.
>>
>>
>> I was just investigating a reason why we should check for all thread
>> states before unplugging the core, like David suggested in his reply.
>> rtas_stop_self() was setting 'cs->halted = 1' without a thread activity
>> check like ibm,suspend-me() does and I was wondering why. This text you sent
>> explains it, quoting:
>>
>> "> The isolation of a CPU, in all cases, is preceded by the stop-self
>>   RTAS function for all processor threads, and the OS insures that all
>>   the CPU’s threads are in the RTAS stopped state prior to isolating the
>>   CPU."
>>
>>
>> This seems to be corroborated by arch/powerpc/platform/pseries/hotplug-cpu.c:
> 
> Um... this seems like you're overcomplicating this.  The crucial point
> here is that 'start-cpu' and 'stop-self' operate on individual
> threads, where as dynamic reconfiguration hotplug and unplug works on
> whole cores.
> 
>> static void pseries_cpu_offline_self(void)
>> {
>> 	unsigned int hwcpu = hard_smp_processor_id();
>>
>> 	local_irq_disable();
>> 	idle_task_exit();
>> 	if (xive_enabled())
>> 		xive_teardown_cpu();
>> 	else
>> 		xics_teardown_cpu();
>>
>> 	unregister_slb_shadow(hwcpu);
>> 	rtas_stop_self();
>>
>> 	/* Should never get here... */
>> 	BUG();
>> 	for(;;);
>> }
>>
>>
>> IIUC this means that we can rely on cs->halted = 1 since it's coming right
>> after a rtas_stop_self() call. This is still a bit confusing though and I
>> wouldn't mind standardizing the 'CPU core is offline' condition with what
>> ibm,suspend-me is already doing.
> 
> At the moment we have no tracking of whether a core is online.  We
> kinda-sorta track whether a *thread* is online through stop-self /
> start-cpu.
> 
>> David, what do you think?
> 
> I think we can rely on cs->halted = 1 when the thread is offline.
> What I'm much less certain about is whether we can count on the thread
> being offline when cs->halted = 1.

I guess we should just stick with your first suggestion then. I'll check for
both cs->halted and msr to assert whether a whole core if offline, like
ibm,suspend-me is doing:

         if (!cs->halted || (e->msr & (1ULL << MSR_EE))) {
             rtas_st(rets, 0, H_MULTI_THREADS_ACTIVE);
             return;
         }

Another question not necessarily related to this fix: we do a similar check
in the start of do_client_architecture_support(), returning the same
H_MULTI_THREADS_ACTIVE error, but we're not checking e->msr:


     /* CAS is supposed to be called early when only the boot vCPU is active. */
     CPU_FOREACH(cs) {
         if (cs == CPU(cpu)) {
             continue;
         }
         if (!cs->halted) {
             warn_report("guest has multiple active vCPUs at CAS, which is not allowed");
             return H_MULTI_THREADS_ACTIVE;
         }
     }


Should we bother changing this logic to check for e->msr as well? If there is no
possible harm done I'd rather have the same check returning H_MULTI_THREADS_ACTIVE
in both places. If there is a special condition in early boot where this check in
do_client_architecture_support() is enough, I would like to put a comment in there
to make it clear why.



Thanks,


DHB


> 
>>> R1-13.7.4.1.1-1. For the LRDR option: Prior to issuing the RTAS
>>> set-indicator specifying isolate isolation-state of a CPU DR
>>> connector type, all the CPU threads must be in the RTAS stopped
>>> state.
>>>
>>> R1-13.7.4.1.1-2. For the LRDR option: Stopping of the last processor
>>> thread of a LPAR partition with the stop-self RTAS function, must kill
>>> the partition, with ownership of all partition resources reverting to
>>> the platform firmware.
>>>
>>> This is clearly not how things work today : linux doesn't call
>>> "stop-self" on the last vCPU and even if it did, QEMU doesn't
>>> terminate the VM.
>>>
>>> If there's a valid reason to not implement this PAPR behavior, I'd like
>>> it to be documented.
>>
>>
>> I can only speculate. This would create a unorthodox way of shutting down
>> the guest, when the user can just shutdown the whole thing gracefully.
>>
>> Unless we're considering borderline cases, like the security risk mentioned
>> in the kernel docs (Documentation/core-api/cpu_hotplug.rst):
>>
>> "Such advances require CPUs available to a kernel to be removed either for
>> provisioning reasons, or for RAS purposes to keep an offending CPU off
>> system execution path. Hence the need for CPU hotplug support in the
>> Linux kernel."
>>
>> In this extreme scenario I can see a reason to kill the partition/guest
>> by offlining the last online CPU - if it's compromising the host we'd
>> rather terminate immediately instead of waiting for graceful
>> shutdown.
> 
> I'm a bit confused by this comment.  You seem to be conflating
> online/offline operations (start-cpu/stop-self) with hot plug/unplug
> operations - they're obviously related, but they're not the same
> thing.
> 
>>>> If we hit the jackpot, we're going to detach the core DRC and pulse the
>>>> hotplug IRQ, but the guest OS will refuse to release the CPU. Our
>>>> spapr_core_unplug() DRC release callback will never be called and the CPU
>>>> core object will keep existing in QEMU. No error message will be sent
>>>> to the user, but the CPU core wasn't unplugged from the guest.
>>>>
>>>> If the guest OS onlines the CPU core again we won't be able to hotunplug it
>>>> either. 'dmesg' inside the guest will report a failed attempt to offline an
>>>> unknown CPU:
>>>>
>>>> [  923.003994] pseries-hotplug-cpu: Failed to offline CPU <NULL>, rc: -16
>>>>
>>>> This is the result of stopping the DRC state transition in the middle in the
>>>> first failed attempt.
>>>>
>>>
>>> Yes, at this point only a machine reset can fix things up.
>>>
>>> Given this is linux's choice not to call "stop-self" as it should do, I'm not
>>> super fan of hardcoding this logic in QEMU, unless there are really good
>>> reasons to do so.
>>
>> I understand where are you coming from and I sympathize. Not sure about how users
>> would feel about that though. They expect a somewhat compatible behavior of
>> multi-arch features like hotplug/hotunplug, and x86 will neither hotunplug nor offline
>> the last CPU as well.
>>
>> There is a very high chance that, even if we pull this design off, I'll need to go to
>> Libvirt and disable it because we broke compatibility with how vcpu unplug operated
>> earlier.
> 

