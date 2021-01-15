Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68ADF2F84D3
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 19:54:55 +0100 (CET)
Received: from localhost ([::1]:32880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0UFK-00082A-8W
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 13:54:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l0UDa-00076u-6S; Fri, 15 Jan 2021 13:53:07 -0500
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:42881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l0UDV-00005r-Do; Fri, 15 Jan 2021 13:53:05 -0500
Received: by mail-qt1-x829.google.com with SMTP id e15so6758509qte.9;
 Fri, 15 Jan 2021 10:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aahvtFhezSr8HTHXpiGCk6TGIeE4EZX1WN9iVKdvwM8=;
 b=I/Ow6VJsje0dy1hTOUI2eg++R+xQZCPoBY3V/tG12lSP7lEuuRysaE2/HErXMlk+jB
 7Kk+6BhP0e+RglrqHX0KMVBmC8inL0KJVR2OjhlaoET3tRcgzvjwlvrvprANjL3fZ1M7
 QCXOW9RV+8YEwyOcVRYYZlULQSm6J0O+VSutRhzGyl14224AND4qnNx0GcZG1hvN13W0
 nUDN9bFbNkWKUi/kbCxQu8UNS9qzx3q5LHcf9qp+ruuoaINaxk30FFr7fPqUQ284I4lq
 0pKiyoU6MF1Nfl3YSoQDlkCH1KY1HFnsjfdls1KYUuR8Q43hZQwIkv3kmJSIGy+XBJCW
 /nMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aahvtFhezSr8HTHXpiGCk6TGIeE4EZX1WN9iVKdvwM8=;
 b=ril3rfLBvsRO5NM5+Dwf+lpUexYdlguFdKsyD7ZMgbIPZU7o2wdNzu9svhzQ+Odwy+
 vp/ZR6hWc6HP3yUi4wtzNBvv59fnjCNrz4pG4VMGfTxMYs9nciPNcN0XE3Isagl/5OiS
 opeJxAr8wlm4yio6TLbg66jekg8+kwLmbtKlF5a1HVGq8G5vf1wmK1tgIEAQjQ4b+Pyl
 gMH0nvjYOh3LYHVNDWsfGBM5SDZrU/NCsfGiGidVK8/iLoJfkywjRKHyRuojwoNxHfnk
 u5Ui6L8uD4ZdpfH131+WJewhzK3TMjQ5lnlT6r3ADLDWREcmvoV1OSnnQo+HK65Pf7vs
 mIaw==
X-Gm-Message-State: AOAM530np/S2HSqi6OwTGvmrwOZ8nvjSE5fiHbDv0cq8nviPSatooYfA
 1ddyjCrYgTRWkiut0QPQ9LI=
X-Google-Smtp-Source: ABdhPJzK8LP49wFj6Yfn0IMLrUi5keE8McwuRtxFrsjtXWWHg463sbzljtpkJ1e8cQEhUtmIAlL4SA==
X-Received: by 2002:ac8:344c:: with SMTP id v12mr13033553qtb.58.1610736779689; 
 Fri, 15 Jan 2021 10:52:59 -0800 (PST)
Received: from ?IPv6:2804:431:c7c7:a75a:cb34:ba60:6de6:be1d?
 ([2804:431:c7c7:a75a:cb34:ba60:6de6:be1d])
 by smtp.gmail.com with ESMTPSA id n66sm5467256qkn.136.2021.01.15.10.52.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jan 2021 10:52:59 -0800 (PST)
Subject: Re: [PATCH v1 7/7] spapr.c: consider CPU core online state before
 allowing unplug
To: Greg Kurz <groug@kaod.org>
References: <20210114180628.1675603-1-danielhb413@gmail.com>
 <20210114180628.1675603-8-danielhb413@gmail.com>
 <20210115182216.6dccadee@bahia.lan>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <14cfa384-9972-6817-5c5f-f37bc1880043@gmail.com>
Date: Fri, 15 Jan 2021 15:52:56 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210115182216.6dccadee@bahia.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x829.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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
Cc: Xujun Ma <xuma@redhat.com>, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/15/21 2:22 PM, Greg Kurz wrote:
> On Thu, 14 Jan 2021 15:06:28 -0300
> Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
> 
>> The only restriction we have when unplugging CPUs is to forbid unplug of
>> the boot cpu core. spapr_core_unplug_possible() does not contemplate the

I'll look into it.

> 
> I can't remember why this restriction was introduced in the first place...
> This should be investigated and documented if the limitation still stands.
> 
>> possibility of some cores being offlined by the guest, meaning that we're
>> rolling the dice regarding on whether we're unplugging the last online
>> CPU core the guest has.
>>
> 
> Trying to unplug the last CPU is obviously something that deserves
> special care. LoPAPR is quite explicit on the outcome : this should
> terminate the partition.
> 
> 13.7.4.1.1. Isolation of CPUs
> 
> The isolation of a CPU, in all cases, is preceded by the stop-self
> RTAS function for all processor threads, and the OS insures that all
> the CPU’s threads are in the RTAS stopped state prior to isolating the
> CPU. Isolation of a processor that is not stopped produces unpredictable
> results. The stopping of the last processor thread of a LPAR partition
> effectively kills the partition, and at that point, ownership of all
> partition resources reverts to the platform firmware.


I was just investigating a reason why we should check for all thread
states before unplugging the core, like David suggested in his reply.
rtas_stop_self() was setting 'cs->halted = 1' without a thread activity
check like ibm,suspend-me() does and I was wondering why. This text you sent
explains it, quoting:

"> The isolation of a CPU, in all cases, is preceded by the stop-self
  RTAS function for all processor threads, and the OS insures that all
  the CPU’s threads are in the RTAS stopped state prior to isolating the
  CPU."


This seems to be corroborated by arch/powerpc/platform/pseries/hotplug-cpu.c:


static void pseries_cpu_offline_self(void)
{
	unsigned int hwcpu = hard_smp_processor_id();

	local_irq_disable();
	idle_task_exit();
	if (xive_enabled())
		xive_teardown_cpu();
	else
		xics_teardown_cpu();

	unregister_slb_shadow(hwcpu);
	rtas_stop_self();

	/* Should never get here... */
	BUG();
	for(;;);
}


IIUC this means that we can rely on cs->halted = 1 since it's coming right
after a rtas_stop_self() call. This is still a bit confusing though and I
wouldn't mind standardizing the 'CPU core is offline' condition with what
ibm,suspend-me is already doing.

David, what do you think?



> 
> R1-13.7.4.1.1-1. For the LRDR option: Prior to issuing the RTAS
> set-indicator specifying isolate isolation-state of a CPU DR
> connector type, all the CPU threads must be in the RTAS stopped
> state.
> 
> R1-13.7.4.1.1-2. For the LRDR option: Stopping of the last processor
> thread of a LPAR partition with the stop-self RTAS function, must kill
> the partition, with ownership of all partition resources reverting to
> the platform firmware.
> 
> This is clearly not how things work today : linux doesn't call
> "stop-self" on the last vCPU and even if it did, QEMU doesn't
> terminate the VM.
> 
> If there's a valid reason to not implement this PAPR behavior, I'd like
> it to be documented.


I can only speculate. This would create a unorthodox way of shutting down
the guest, when the user can just shutdown the whole thing gracefully.

Unless we're considering borderline cases, like the security risk mentioned
in the kernel docs (Documentation/core-api/cpu_hotplug.rst):

"Such advances require CPUs available to a kernel to be removed either for
provisioning reasons, or for RAS purposes to keep an offending CPU off
system execution path. Hence the need for CPU hotplug support in the
Linux kernel."

In this extreme scenario I can see a reason to kill the partition/guest
by offlining the last online CPU - if it's compromising the host we'd
rather terminate immediately instead of waiting for graceful shutdown.

> 
>> If we hit the jackpot, we're going to detach the core DRC and pulse the
>> hotplug IRQ, but the guest OS will refuse to release the CPU. Our
>> spapr_core_unplug() DRC release callback will never be called and the CPU
>> core object will keep existing in QEMU. No error message will be sent
>> to the user, but the CPU core wasn't unplugged from the guest.
>>
>> If the guest OS onlines the CPU core again we won't be able to hotunplug it
>> either. 'dmesg' inside the guest will report a failed attempt to offline an
>> unknown CPU:
>>
>> [  923.003994] pseries-hotplug-cpu: Failed to offline CPU <NULL>, rc: -16
>>
>> This is the result of stopping the DRC state transition in the middle in the
>> first failed attempt.
>>
> 
> Yes, at this point only a machine reset can fix things up.
> 
> Given this is linux's choice not to call "stop-self" as it should do, I'm not
> super fan of hardcoding this logic in QEMU, unless there are really good
> reasons to do so.

I understand where are you coming from and I sympathize. Not sure about how users
would feel about that though. They expect a somewhat compatible behavior of
multi-arch features like hotplug/hotunplug, and x86 will neither hotunplug nor offline
the last CPU as well.

There is a very high chance that, even if we pull this design off, I'll need to go to
Libvirt and disable it because we broke compatibility with how vcpu unplug operated
earlier.


Thanks,


DHB


> 
>> We can avoid this, and potentially other bad things from happening, if we
>> avoid to attempt the unplug altogether in this scenario. Let's check for
>> the online/offline state of the CPU cores in the guest before allowing
>> the hotunplug, and forbid removing a CPU core if it's the last one online
>> in the guest.
>>
>> Reported-by: Xujun Ma <xuma@redhat.com>
>> Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1911414
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hw/ppc/spapr.c | 39 ++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 38 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>> index a2f01c21aa..d269dcd102 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -3709,9 +3709,16 @@ static void spapr_core_unplug(HotplugHandler *hotplug_dev, DeviceState *dev)
>>   static int spapr_core_unplug_possible(HotplugHandler *hotplug_dev, CPUCore *cc,
>>                                         Error **errp)
>>   {
>> +    CPUArchId *core_slot;
>> +    SpaprCpuCore *core;
>> +    PowerPCCPU *cpu;
>> +    CPUState *cs;
>> +    bool last_cpu_online = true;
>>       int index;
>>   
>> -    if (!spapr_find_cpu_slot(MACHINE(hotplug_dev), cc->core_id, &index)) {
>> +    core_slot = spapr_find_cpu_slot(MACHINE(hotplug_dev), cc->core_id,
>> +                                    &index);
>> +    if (!core_slot) {
>>           error_setg(errp, "Unable to find CPU core with core-id: %d",
>>                      cc->core_id);
>>           return -1;
>> @@ -3722,6 +3729,36 @@ static int spapr_core_unplug_possible(HotplugHandler *hotplug_dev, CPUCore *cc,
>>           return -1;
>>       }
>>   
>> +    /* Allow for any non-boot CPU core to be unplugged if already offline */
>> +    core = SPAPR_CPU_CORE(core_slot->cpu);
>> +    cs = CPU(core->threads[0]);
>> +    if (cs->halted) {
>> +        return 0;
>> +    }
>> +
>> +    /*
>> +     * Do not allow core unplug if it's the last core online.
>> +     */
>> +    cpu = POWERPC_CPU(cs);
>> +    CPU_FOREACH(cs) {
>> +        PowerPCCPU *c = POWERPC_CPU(cs);
>> +
>> +        if (c == cpu) {
>> +            continue;
>> +        }
>> +
>> +        if (!cs->halted) {
>> +            last_cpu_online = false;
>> +            break;
>> +        }
>> +    }
>> +
>> +    if (last_cpu_online) {
>> +        error_setg(errp, "Unable to unplug CPU core with core-id %d: it is "
>> +                   "the only CPU core online in the guest", cc->core_id);
>> +        return -1;
>> +    }
>> +
>>       return 0;
>>   }
>>   
> 

