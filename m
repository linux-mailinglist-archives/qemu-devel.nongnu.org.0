Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 903512F87D8
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 22:46:29 +0100 (CET)
Received: from localhost ([::1]:33744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0WvM-0003F9-K7
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 16:46:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l0WsO-0001vX-5U; Fri, 15 Jan 2021 16:43:24 -0500
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:43397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l0WsM-0000kw-6Q; Fri, 15 Jan 2021 16:43:23 -0500
Received: by mail-qt1-x831.google.com with SMTP id 2so7117325qtt.10;
 Fri, 15 Jan 2021 13:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uzbdvQ2BUK1tX7gjgF19Y9Sd64zyqsFOsH2gIOFma6A=;
 b=lrL6EbsdjgFdu6Gcmm49r2ebQwVc+GfgwP9jmyFykIvAmf7cwT4ahq7ZOTU6Oqu+Vn
 0d6eyORhupC9BTh/0Fp1bNZ+TvCwkg07jSAKwedr7SPbNAg18YyC6ImSJXLjOFEi4i43
 lIfRaxTiIQG20UjH/+hg5wpFX30W2/it06de6VFlJQLwoB/0o6iJv/bzjgN5gmmiGvKL
 7kL6uctNad4VxAZsxKLigblNx95SaGJaaYHCVr1g4e0cNTF9p8dBaXnof0a+zs1lDmAS
 hRthRirWPCrbPCE8it287uNciq75m8dJjA4cq+EkmdYCsiVlNapbUAmG4K8VOgwCfKsX
 ZDqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uzbdvQ2BUK1tX7gjgF19Y9Sd64zyqsFOsH2gIOFma6A=;
 b=fs1y3ugLGPLTmMqDLfCSC+MKqpDOXvHWJkDw3glFIaOSoGdkdJDPEAHCTPYn3xP+Fh
 fy/6SxOWl6ZEHSqWtfXT3ykidJWm3piCltBtUvfmQ8iyvu4vX/ZbY6J2eOIQ4im/01db
 C+T2pTDKi0QMDt7RMeV4xBtZN1f4l50hwm+45ZNWrPJnCBnZglLTU0C5FSQuQH13qHCL
 8OhLuBIC7HhtnnEEOT8gWO2exWQq3XyasEfBOyg4Hr3gqV112F9RZqtd6pLblPy7g6kl
 XHQz2I9M37/5ib+sM35/0VzBXFy+f54yc1AefuT2x0ypE5S5LyA7MgE2l5Qw+A+wcj/W
 wNXQ==
X-Gm-Message-State: AOAM530fgimeqtK7p7lYdEyZqrvCsgmTAzuzDul3xJgM/MgHWj6LP9WF
 58X8Z0hqCWu+DcWW+uNISkI=
X-Google-Smtp-Source: ABdhPJxM+cxaeISn6KlFcq15Yr1eIKBmSPenaAt7JbZRX+0HLrnjwWVKjgbU8LxaPzFfnC4aOGCcyg==
X-Received: by 2002:ac8:5909:: with SMTP id 9mr13672030qty.39.1610747000770;
 Fri, 15 Jan 2021 13:43:20 -0800 (PST)
Received: from ?IPv6:2804:431:c7c7:a75a:cb34:ba60:6de6:be1d?
 ([2804:431:c7c7:a75a:cb34:ba60:6de6:be1d])
 by smtp.gmail.com with ESMTPSA id 17sm5994982qtu.23.2021.01.15.13.43.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jan 2021 13:43:20 -0800 (PST)
Subject: Re: [PATCH v1 7/7] spapr.c: consider CPU core online state before
 allowing unplug
To: Greg Kurz <groug@kaod.org>
References: <20210114180628.1675603-1-danielhb413@gmail.com>
 <20210114180628.1675603-8-danielhb413@gmail.com>
 <20210115182216.6dccadee@bahia.lan>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <d9d32724-d76e-4112-b798-59c5ed44f31f@gmail.com>
Date: Fri, 15 Jan 2021 18:43:17 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210115182216.6dccadee@bahia.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x831.google.com
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
> 
> I can't remember why this restriction was introduced in the first place...
> This should be investigated and documented if the limitation still stands.


I looked it up and found out that restriction was added by this commit:

commit 62be8b044adf47327ebefdefb25f28a40316ebd0
Author: Bharata B Rao <bharata@linux.vnet.ibm.com>
Date:   Wed Jul 27 10:44:42 2016 +0530

     spapr: Prevent boot CPU core removal
     
     Boot CPU is assumed to be always present in QEMU code. So
     until that assumptions are gone, deny removal request.
     In another words, QEMU won't support boot CPU core hot-unplug.


I don't think it necessarily has to do with pSeries code though. I was unable to
offline the CPU0 of my x86 notebook:


# lscpu | grep -i 'on-line'
On-line CPU(s) list:             0-7
# echo 0 > /sys/devices/system/cpu/cpu0/online
bash: /sys/devices/system/cpu/cpu0/online: Permission denied
#
# echo 0 > /sys/devices/system/cpu/cpu1/online
#
# lscpu | grep -i 'on-line'
On-line CPU(s) list:             0,2-7
# echo 0 > /sys/devices/system/cpu/cpu0/online
bash: /sys/devices/system/cpu/cpu0/online: Permission denied
#

The pseries kernel does not have this restriction (offlining CPU0).

Maybe we're limiting CPU0 unplug in pseries because it would break common QEMU
code that has this restriction due to x86/ACPI mechanics because, apparently,
x86 can't hotunplug CPU0.


If a good x86 soul reads this and confirm/deny my assumption I appreciate :)



Thanks,


DHB


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

