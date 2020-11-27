Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5FE2C68A8
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 16:24:18 +0100 (CET)
Received: from localhost ([::1]:60218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kifbd-0003vh-L2
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 10:24:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kifGl-0005Jn-Cj
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 10:02:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kifGf-0000TG-Bu
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 10:02:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606489355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L7ufEm+9uLEMRLu9jI3TWjkNWo20DAFX+pw8Xp27/Sk=;
 b=R/Ar9gM1Xbfq/ri+4IvujpHcfd3bC/Cbr1mes43aB8YM5BhjuXrGQ6TiJhbqya3ymQJGE/
 SfHyIBL+ncW01Z4ccu/ngV7/IlVcuIyO9f0OhWADsYjpOjGjcip40oGNkADrjvJRiyWm8V
 Bs+Kw/k7MPqRNatqluAHcJYtmU6OGkQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-T3edpr4DPBaiRcKQJBeirQ-1; Fri, 27 Nov 2020 10:02:31 -0500
X-MC-Unique: T3edpr4DPBaiRcKQJBeirQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E1AE107ACF7;
 Fri, 27 Nov 2020 15:02:30 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-74.ams2.redhat.com
 [10.36.112.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 205F160861;
 Fri, 27 Nov 2020 15:02:28 +0000 (UTC)
Subject: Re: [RFC] ich9:cpuhp: add support for cpu hot-unplug with SMI
 broadcast enabled
To: Igor Mammedov <imammedo@redhat.com>, Ankur Arora <ankur.a.arora@oracle.com>
References: <20201124122507.1014839-1-imammedo@redhat.com>
 <20640581-e37d-8783-451c-22627aabb77f@oracle.com>
 <a5bb1550-6253-87eb-87a0-0532725d5d42@redhat.com>
 <c7f04e3a-e83a-cd23-aa9d-566ee3ca9f03@oracle.com>
 <20201127123356.7b1349d8@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <3bad9b8e-6de1-37d4-8ac4-a8432885eb14@redhat.com>
Date: Fri, 27 Nov 2020 16:02:28 +0100
MIME-Version: 1.0
In-Reply-To: <20201127123356.7b1349d8@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/27/20 12:33, Igor Mammedov wrote:
> On Thu, 26 Nov 2020 19:35:30 -0800
> Ankur Arora <ankur.a.arora@oracle.com> wrote:
> 
>> On 2020-11-26 4:46 a.m., Laszlo Ersek wrote:
>>> On 11/26/20 11:24, Ankur Arora wrote:  
>>>> On 2020-11-24 4:25 a.m., Igor Mammedov wrote:  
>>>>> If firmware negotiates ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT feature,
>>>>> OSPM on CPU eject will set bit #4 in CPU hotplug block for to be
>>>>> ejected CPU to mark it for removal by firmware and trigger SMI
>>>>> upcall to let firmware do actual eject.
>>>>>
>>>>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>>>>> ---
>>>>> PS:
>>>>>     - abuse 5.1 machine type for now to turn off unplug feature
>>>>>       (it will be moved to 5.2 machine type once new merge window is open)
>>>>> ---
>>>>>    include/hw/acpi/cpu.h           |  2 ++
>>>>>    docs/specs/acpi_cpu_hotplug.txt | 11 +++++++++--
>>>>>    hw/acpi/cpu.c                   | 18 ++++++++++++++++--
>>>>>    hw/i386/acpi-build.c            |  5 +++++
>>>>>    hw/i386/pc.c                    |  1 +
>>>>>    hw/isa/lpc_ich9.c               |  2 +-
>>>>>    6 files changed, 34 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
>>>>> index 0eeedaa491..999caaf510 100644
>>>>> --- a/include/hw/acpi/cpu.h
>>>>> +++ b/include/hw/acpi/cpu.h
>>>>> @@ -22,6 +22,7 @@ typedef struct AcpiCpuStatus {
>>>>>        uint64_t arch_id;
>>>>>        bool is_inserting;
>>>>>        bool is_removing;
>>>>> +    bool fw_remove;
>>>>>        uint32_t ost_event;
>>>>>        uint32_t ost_status;
>>>>>    } AcpiCpuStatus;
>>>>> @@ -50,6 +51,7 @@ void cpu_hotplug_hw_init(MemoryRegion *as, Object
>>>>> *owner,
>>>>>    typedef struct CPUHotplugFeatures {
>>>>>        bool acpi_1_compatible;
>>>>>        bool has_legacy_cphp;
>>>>> +    bool fw_unplugs_cpu;
>>>>>        const char *smi_path;
>>>>>    } CPUHotplugFeatures;
>>>>>    diff --git a/docs/specs/acpi_cpu_hotplug.txt
>>>>> b/docs/specs/acpi_cpu_hotplug.txt
>>>>> index 9bb22d1270..f68ef6e06c 100644
>>>>> --- a/docs/specs/acpi_cpu_hotplug.txt
>>>>> +++ b/docs/specs/acpi_cpu_hotplug.txt
>>>>> @@ -57,7 +57,11 @@ read access:
>>>>>                  It's valid only when bit 0 is set.
>>>>>               2: Device remove event, used to distinguish device for which
>>>>>                  no device eject request to OSPM was issued.
>>>>> -           3-7: reserved and should be ignored by OSPM
>>>>> +           3: reserved and should be ignored by OSPM
>>>>> +           4: if set to 1, OSPM requests firmware to perform device
>>>>> eject,
>>>>> +              firmware shall clear this event by writing 1 into it
>>>>> before
>>>>> +              performing device eject> +           5-7: reserved and
>>>>> should be ignored by OSPM
>>>>>        [0x5-0x7] reserved
>>>>>        [0x8] Command data: (DWORD access)
>>>>>              contains 0 unless value last stored in 'Command field' is
>>>>> one of:
>>>>> @@ -82,7 +86,10 @@ write access:
>>>>>                   selected CPU device
>>>>>                3: if set to 1 initiates device eject, set by OSPM when it
>>>>>                   triggers CPU device removal and calls _EJ0 method
>>>>> -            4-7: reserved, OSPM must clear them before writing to
>>>>> register
>>>>> +            4: if set to 1 OSPM hands over device eject to firmware,
>>>>> +               Firmware shall issue device eject request as described
>>>>> above
>>>>> +               (bit #3) and OSPM should not touch device eject bit (#3),
>>>>> +            5-7: reserved, OSPM must clear them before writing to
>>>>> register
>>>>>        [0x5] Command field: (1 byte access)
>>>>>              value:
>>>>>                0: selects a CPU device with inserting/removing events and
>>>>> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
>>>>> index f099b50927..09d2f20dae 100644
>>>>> --- a/hw/acpi/cpu.c
>>>>> +++ b/hw/acpi/cpu.c
>>>>> @@ -71,6 +71,7 @@ static uint64_t cpu_hotplug_rd(void *opaque, hwaddr
>>>>> addr, unsigned size)
>>>>>            val |= cdev->cpu ? 1 : 0;
>>>>>            val |= cdev->is_inserting ? 2 : 0;
>>>>>            val |= cdev->is_removing  ? 4 : 0;
>>>>> +        val |= cdev->fw_remove  ? 16 : 0;  
>>>>
>>>> I might be missing something but I don't see where cdev->fw_remove is being
>>>> set.  
>>>
>>> See just below, in the cpu_hotplug_wr() hunk. When bit#4 is written --
>>> which happens through the ACPI code change --, fw_remove is inverted.  
>> Thanks that makes sense. I was reading the AML building code all wrong.
>>
>>>
>>>   
>>>> We do set cdev->is_removing in acpi_cpu_unplug_request_cb() so AFAICS
>>>> we would always end up setting this bit:  
>>>>>            val |= cdev->is_removing  ? 4 : 0;  
>>>>
>>>> Also, if cdev->fw_remove and cdev->is_removing are both true, val would be
>>>> (4 | 16). I'm guessing that in that case the AML determines which case gets
>>>> handled but it might make sense to set just one of these?  
>>>
>>> "is_removing" is set directly in response to the device_del QMP command.
>>> That QMP command is asynchronous to the execution of the guest OS.
>>> j
>>> "fw_remove" is set (by virtue of inverting) by ACPI CEJ0, which is
>>> executed by the guest OS's ACPI interpreter, after the guest OS has
>>> de-scheduled all processes from the CPU being removed (= basically after
>>> the OS has willfully forgotten about the CPU).
>>>
>>> Therefore, considering the bitmask (is_removing, fw_remove), three
>>> variations make sense:  
>>
>> Just annotating these with the corresponding ACPI code to make sure
>> I have it straight. Please correct if my interpretation is wrong. Also,
>> a few questions inline:
>>
>>>
>>> #1 (is_removing=0, fw_remove=0) -- normal status; no unplug requested
>>>
>>> #2 (is_removing=1, fw_remove=0) -- unplug requested via QMP, guest OS
>>>                                     is processing the request  
>>
>> Guest executes the CSCN method and reads rm_evt (bit 2) (thus noticing
>> the is_removing=1), and then notifies the CPU to be removed via the
>> CTFY method.
>>
>>     ifctx = aml_if(aml_equal(rm_evt, one));
>>     {
>>             aml_append(ifctx,
>>                        aml_call2(CPU_NOTIFY_METHOD, uid, eject_req));
>>             aml_append(ifctx, aml_store(one, rm_evt));
>>             aml_append(ifctx, aml_store(one, has_event));
>>     }
>>
>> Then it does a store to rm_evt (bit 2). That would result in clearing
>> of is_removing. (Igor mentions that in a separate mail.)
>>
>> 1. Do we need to clear is_removing at all? AFAICS, it's only useful as
>> an ack to QEMU and I can't think of why that's useful. OTOH it
>> doesn't serve any useful purpose once the guest OS has seen the request.
> no firmware doesn't need to care about it, it's consumed by OSPM only
>  
>> 2. Would it make sense to clear it first and then call CPU_NOTIFY_METHOD?
>> CPU_NOTIFY_METHOD (or _EJ0, COST) don't depend on is_removing but
>> that might change in the future.
> 
> all methods are protected by be same mutex, so if _EJ0 is called while CSCN
> in progress it will wait till CSCN is finished.
> But clearing bit #2 before Notify should work too.

I'd suggest not reordering existent stuff unless we really have to; the
firmware will have to deal with "is_removing" being the *only* status
flag set anway, as QMP "device_del" command(s) may set that bit for
another CPU (or multiple other CPUs) while the SMI handler is running,
and the "get pending" method will return such CPUs as well.

I wouldn't complicate the patches just in order to "hide" is_removing --
that's not a goal, so let's just keep as much AML untouched as we can.

(BTW I now understand why "is_removing" is clear when the eject method
runs for the same CPU -- because Notify (and so the eject method) is not
entered synchronously, it's only queued asynchronously. So it's actually
dispatched after the is_removing flag has been cleared.)


> 
>  
>> The notify would end up in calling acpi_hotplug_schedule() which would be
>> responsible for queuing work (on CPU0) to detach+unplug the CPU.
>>
>> Once the OS level detach succeeds, the worker evaluates the "_EJ0" method
>> which would do the actual CPU_EJECT_METHOD work.
>>
>> If the detach fails then it evaluates the CPU_OST_METHOD which updates
>> the status for the event and the status.
>>
>> At this point the state is back to:
>>
>> (is_removing=0, fw_remove=0)
> if OSPM fails to release CPU for whatever reasons, it's valid
> state, we just notify user using OST event that requested unplug wasn't successful.
> 
>>
>>> #3 (is_removing=1, fw_remove=1) -- guest OS removed all references from
>>>                                     the CPU, firmware is permitted /
>>>                                     required to forget about the CPU as
>>>                                     well, and then unplug the CPU  
>>
>> CPU_EJECT_METHOD will do a store to bit 4, which would invert (and
>> thus set) fw_remove and then do the SMI.
>>
>> So, this would be
>>> #3 (is_removing=0, fw_remove=1)  
>>
>> At this point the firmware calls QemuCPUhpCollectApicIds() which
>> (after changes) notices CPU(s) with fw_remove set.
>>
>> Collects them and does a store to bit 4, which would clear fw_remove.

I don't think we should clear fw_remove as soon as we collect the CPU,
in the firmware. Status flag modifications should be kept out of
QemuCpuhpCollectApicIds().


> 
> I'd skip this step on firmware side and make QEMU clear it
> when CPU is ejected.
> 
>>
>>>
>>> #4 (is_removing=1, fw_remove=0) -- fimware is about to unplug the CPU
>>>
>>> #5 (is_removing=0, fw_remove=0) -- firmware performing unplug  
>> Firmware does an unplug and writes to bit 3, thus clearing is_removing.
>>
>> On return from the firmware the guest evaluates the COST again.
> it's optional and depends on OSPM implementation (some do not call it on success)
> 
> 
>> And, eventually goes back to the CSCN where it processes more
>> hotplug or unplug events.
> CSCN in case of unplug finishes first, and only after that EJ0 calls
> are processed
> 
>>> The variation (is_removing=0, fw_remove=1) is invalid / unused.  
>>
>> /nods
>>>
>>>
>>> The firmware may be investigating the CPU register block between steps
>>> #2 and #3 -- in other words, the firmware may see a CPU for which
>>> is_remove is set (unplug requested via QMP), but the OS has not vacated
>>> yet (fw_remove=0). In that case, the firmware must just skip the CPU --
>>> once the OS is done, it will set fw_remove too, and raise another SMI.  
>> Yeah, it makes sense for the firmware to only care about a CPU once it
>> sees fw_remove=1. (And as currently situated, the firmware would never
>> see is_removing=1 at all.)

The firmware may well see is_removing=1, as the QMP device_del command
may set that bit on some other CPU, asynchronously to the firmware's
execution. The firmware needs to recognize if the "get pending" command
returns a CPU because of this, and just continue scanning.

Thanks
Laszlo


