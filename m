Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A252C6DCB
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Nov 2020 00:52:12 +0100 (CET)
Received: from localhost ([::1]:40274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kinX9-0003Sq-6F
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 18:52:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ankur.a.arora@oracle.com>)
 id 1kinW0-0002hj-7H
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 18:51:00 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:58700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ankur.a.arora@oracle.com>)
 id 1kinVx-0002pM-Du
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 18:50:59 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0ARNnfPq058093;
 Fri, 27 Nov 2020 23:50:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=dCOzEu/1b+GJa6uOpAfOtqxjchqmpmdMawSxrlePxEc=;
 b=pB8V/Lcx+TWCPPpYfbO3nstjivKMdx2mOxblUVWmwghq7aQMJDc29pGWObsAFAR5uiiK
 FJzeko+jvmNLJy8xuJxcgTOrq81QoNtqB8Er0BfwUrA1YtlgniJ77cC/0BtcY42lIm2E
 HztXm4004n5vUwqPyx56BHxqUrfEkafSa0PcEu3N6aBtPoCmQyhbt3OlLdS6WB98M4PC
 9SUIzEy+HlZe0F9/NvWBFw69Ggqab2LSNlNtyiTlEnKAveQrN6c+5PLzXJqYlWVgUQ1Z
 4TqZJ96bpjJYsPXPKll+miBPMphUrABGAiynUZankV1CeBSGu1oGPDBtM6Hun0LHPuJJ qQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 351kwhjrbc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 27 Nov 2020 23:50:52 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0ARNjqY0063260;
 Fri, 27 Nov 2020 23:48:52 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 351kwgx9dy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Nov 2020 23:48:52 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0ARNmnir022005;
 Fri, 27 Nov 2020 23:48:50 GMT
Received: from [10.159.152.214] (/10.159.152.214)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 27 Nov 2020 15:48:49 -0800
Subject: Re: [RFC] ich9:cpuhp: add support for cpu hot-unplug with SMI
 broadcast enabled
To: Laszlo Ersek <lersek@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20201124122507.1014839-1-imammedo@redhat.com>
 <20640581-e37d-8783-451c-22627aabb77f@oracle.com>
 <a5bb1550-6253-87eb-87a0-0532725d5d42@redhat.com>
 <c7f04e3a-e83a-cd23-aa9d-566ee3ca9f03@oracle.com>
 <20201127123356.7b1349d8@redhat.com>
 <3bad9b8e-6de1-37d4-8ac4-a8432885eb14@redhat.com>
From: Ankur Arora <ankur.a.arora@oracle.com>
Message-ID: <8cc8c873-5057-29af-5c6e-ee43e5fa035c@oracle.com>
Date: Fri, 27 Nov 2020 15:48:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <3bad9b8e-6de1-37d4-8ac4-a8432885eb14@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9815
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 suspectscore=0
 phishscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011270145
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9818
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011270145
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=ankur.a.arora@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020-11-27 7:02 a.m., Laszlo Ersek wrote:
> On 11/27/20 12:33, Igor Mammedov wrote:
>> On Thu, 26 Nov 2020 19:35:30 -0800
>> Ankur Arora <ankur.a.arora@oracle.com> wrote:
>>
>>> On 2020-11-26 4:46 a.m., Laszlo Ersek wrote:
>>>> On 11/26/20 11:24, Ankur Arora wrote:
>>>>> On 2020-11-24 4:25 a.m., Igor Mammedov wrote:
>>>>>> If firmware negotiates ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT feature,
>>>>>> OSPM on CPU eject will set bit #4 in CPU hotplug block for to be
>>>>>> ejected CPU to mark it for removal by firmware and trigger SMI
>>>>>> upcall to let firmware do actual eject.
>>>>>>
>>>>>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>>>>>> ---
>>>>>> PS:
>>>>>>      - abuse 5.1 machine type for now to turn off unplug feature
>>>>>>        (it will be moved to 5.2 machine type once new merge window is open)
>>>>>> ---
>>>>>>     include/hw/acpi/cpu.h           |  2 ++
>>>>>>     docs/specs/acpi_cpu_hotplug.txt | 11 +++++++++--
>>>>>>     hw/acpi/cpu.c                   | 18 ++++++++++++++++--
>>>>>>     hw/i386/acpi-build.c            |  5 +++++
>>>>>>     hw/i386/pc.c                    |  1 +
>>>>>>     hw/isa/lpc_ich9.c               |  2 +-
>>>>>>     6 files changed, 34 insertions(+), 5 deletions(-)
>>>>>>
>>>>>> diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
>>>>>> index 0eeedaa491..999caaf510 100644
>>>>>> --- a/include/hw/acpi/cpu.h
>>>>>> +++ b/include/hw/acpi/cpu.h
>>>>>> @@ -22,6 +22,7 @@ typedef struct AcpiCpuStatus {
>>>>>>         uint64_t arch_id;
>>>>>>         bool is_inserting;
>>>>>>         bool is_removing;
>>>>>> +    bool fw_remove;
>>>>>>         uint32_t ost_event;
>>>>>>         uint32_t ost_status;
>>>>>>     } AcpiCpuStatus;
>>>>>> @@ -50,6 +51,7 @@ void cpu_hotplug_hw_init(MemoryRegion *as, Object
>>>>>> *owner,
>>>>>>     typedef struct CPUHotplugFeatures {
>>>>>>         bool acpi_1_compatible;
>>>>>>         bool has_legacy_cphp;
>>>>>> +    bool fw_unplugs_cpu;
>>>>>>         const char *smi_path;
>>>>>>     } CPUHotplugFeatures;
>>>>>>     diff --git a/docs/specs/acpi_cpu_hotplug.txt
>>>>>> b/docs/specs/acpi_cpu_hotplug.txt
>>>>>> index 9bb22d1270..f68ef6e06c 100644
>>>>>> --- a/docs/specs/acpi_cpu_hotplug.txt
>>>>>> +++ b/docs/specs/acpi_cpu_hotplug.txt
>>>>>> @@ -57,7 +57,11 @@ read access:
>>>>>>                   It's valid only when bit 0 is set.
>>>>>>                2: Device remove event, used to distinguish device for which
>>>>>>                   no device eject request to OSPM was issued.
>>>>>> -           3-7: reserved and should be ignored by OSPM
>>>>>> +           3: reserved and should be ignored by OSPM
>>>>>> +           4: if set to 1, OSPM requests firmware to perform device
>>>>>> eject,
>>>>>> +              firmware shall clear this event by writing 1 into it
>>>>>> before
>>>>>> +              performing device eject> +           5-7: reserved and
>>>>>> should be ignored by OSPM
>>>>>>         [0x5-0x7] reserved
>>>>>>         [0x8] Command data: (DWORD access)
>>>>>>               contains 0 unless value last stored in 'Command field' is
>>>>>> one of:
>>>>>> @@ -82,7 +86,10 @@ write access:
>>>>>>                    selected CPU device
>>>>>>                 3: if set to 1 initiates device eject, set by OSPM when it
>>>>>>                    triggers CPU device removal and calls _EJ0 method
>>>>>> -            4-7: reserved, OSPM must clear them before writing to
>>>>>> register
>>>>>> +            4: if set to 1 OSPM hands over device eject to firmware,
>>>>>> +               Firmware shall issue device eject request as described
>>>>>> above
>>>>>> +               (bit #3) and OSPM should not touch device eject bit (#3),
>>>>>> +            5-7: reserved, OSPM must clear them before writing to
>>>>>> register
>>>>>>         [0x5] Command field: (1 byte access)
>>>>>>               value:
>>>>>>                 0: selects a CPU device with inserting/removing events and
>>>>>> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
>>>>>> index f099b50927..09d2f20dae 100644
>>>>>> --- a/hw/acpi/cpu.c
>>>>>> +++ b/hw/acpi/cpu.c
>>>>>> @@ -71,6 +71,7 @@ static uint64_t cpu_hotplug_rd(void *opaque, hwaddr
>>>>>> addr, unsigned size)
>>>>>>             val |= cdev->cpu ? 1 : 0;
>>>>>>             val |= cdev->is_inserting ? 2 : 0;
>>>>>>             val |= cdev->is_removing  ? 4 : 0;
>>>>>> +        val |= cdev->fw_remove  ? 16 : 0;
>>>>>
>>>>> I might be missing something but I don't see where cdev->fw_remove is being
>>>>> set.
>>>>
>>>> See just below, in the cpu_hotplug_wr() hunk. When bit#4 is written --
>>>> which happens through the ACPI code change --, fw_remove is inverted.
>>> Thanks that makes sense. I was reading the AML building code all wrong.
>>>
>>>>
>>>>    
>>>>> We do set cdev->is_removing in acpi_cpu_unplug_request_cb() so AFAICS
>>>>> we would always end up setting this bit:
>>>>>>             val |= cdev->is_removing  ? 4 : 0;
>>>>>
>>>>> Also, if cdev->fw_remove and cdev->is_removing are both true, val would be
>>>>> (4 | 16). I'm guessing that in that case the AML determines which case gets
>>>>> handled but it might make sense to set just one of these?
>>>>
>>>> "is_removing" is set directly in response to the device_del QMP command.
>>>> That QMP command is asynchronous to the execution of the guest OS.
>>>> j
>>>> "fw_remove" is set (by virtue of inverting) by ACPI CEJ0, which is
>>>> executed by the guest OS's ACPI interpreter, after the guest OS has
>>>> de-scheduled all processes from the CPU being removed (= basically after
>>>> the OS has willfully forgotten about the CPU).
>>>>
>>>> Therefore, considering the bitmask (is_removing, fw_remove), three
>>>> variations make sense:
>>>
>>> Just annotating these with the corresponding ACPI code to make sure
>>> I have it straight. Please correct if my interpretation is wrong. Also,
>>> a few questions inline:
>>>
>>>>
>>>> #1 (is_removing=0, fw_remove=0) -- normal status; no unplug requested
>>>>
>>>> #2 (is_removing=1, fw_remove=0) -- unplug requested via QMP, guest OS
>>>>                                      is processing the request
>>>
>>> Guest executes the CSCN method and reads rm_evt (bit 2) (thus noticing
>>> the is_removing=1), and then notifies the CPU to be removed via the
>>> CTFY method.
>>>
>>>      ifctx = aml_if(aml_equal(rm_evt, one));
>>>      {
>>>              aml_append(ifctx,
>>>                         aml_call2(CPU_NOTIFY_METHOD, uid, eject_req));
>>>              aml_append(ifctx, aml_store(one, rm_evt));
>>>              aml_append(ifctx, aml_store(one, has_event));
>>>      }
>>>
>>> Then it does a store to rm_evt (bit 2). That would result in clearing
>>> of is_removing. (Igor mentions that in a separate mail.)
>>>
>>> 1. Do we need to clear is_removing at all? AFAICS, it's only useful as
>>> an ack to QEMU and I can't think of why that's useful. OTOH it
>>> doesn't serve any useful purpose once the guest OS has seen the request.
>> no firmware doesn't need to care about it, it's consumed by OSPM only
>>   
>>> 2. Would it make sense to clear it first and then call CPU_NOTIFY_METHOD?
>>> CPU_NOTIFY_METHOD (or _EJ0, COST) don't depend on is_removing but
>>> that might change in the future.
>>
>> all methods are protected by be same mutex, so if _EJ0 is called while CSCN
>> in progress it will wait till CSCN is finished.
>> But clearing bit #2 before Notify should work too.
> 
> I'd suggest not reordering existent stuff unless we really have to; the
> firmware will have to deal with "is_removing" being the *only* status
> flag set anway, as QMP "device_del" command(s) may set that bit for
> another CPU (or multiple other CPUs) while the SMI handler is running,
> and the "get pending" method will return such CPUs as well.

Yeah I was must making sure my understanding of these related pieces of
code was correct. And anyway, as Igor mentioned, that bit of AML is protected
by the mutex so the ordering doesn't even matter.

> 
> I wouldn't complicate the patches just in order to "hide" is_removing --
> that's not a goal, so let's just keep as much AML untouched as we can.
> 
> (BTW I now understand why "is_removing" is clear when the eject method
> runs for the same CPU -- because Notify (and so the eject method) is not
> entered synchronously, it's only queued asynchronously. So it's actually
> dispatched after the is_removing flag has been cleared.)
> 
> 
>>
>>   
>>> The notify would end up in calling acpi_hotplug_schedule() which would be
>>> responsible for queuing work (on CPU0) to detach+unplug the CPU.
>>>
>>> Once the OS level detach succeeds, the worker evaluates the "_EJ0" method
>>> which would do the actual CPU_EJECT_METHOD work.
>>>
>>> If the detach fails then it evaluates the CPU_OST_METHOD which updates
>>> the status for the event and the status.
>>>
>>> At this point the state is back to:
>>>
>>> (is_removing=0, fw_remove=0)
>> if OSPM fails to release CPU for whatever reasons, it's valid
>> state, we just notify user using OST event that requested unplug wasn't successful.
>>
>>>
>>>> #3 (is_removing=1, fw_remove=1) -- guest OS removed all references from
>>>>                                      the CPU, firmware is permitted /
>>>>                                      required to forget about the CPU as
>>>>                                      well, and then unplug the CPU
>>>
>>> CPU_EJECT_METHOD will do a store to bit 4, which would invert (and
>>> thus set) fw_remove and then do the SMI.
>>>
>>> So, this would be
>>>> #3 (is_removing=0, fw_remove=1)
>>>
>>> At this point the firmware calls QemuCPUhpCollectApicIds() which
>>> (after changes) notices CPU(s) with fw_remove set.
>>>
>>> Collects them and does a store to bit 4, which would clear fw_remove.
> 
> I don't think we should clear fw_remove as soon as we collect the CPU,
> in the firmware. Status flag modifications should be kept out of
> QemuCpuhpCollectApicIds().
> 
>>
>> I'd skip this step on firmware side and make QEMU clear it
>> when CPU is ejected.

Makes sense.

>>
>>>
>>>>
>>>> #4 (is_removing=1, fw_remove=0) -- fimware is about to unplug the CPU
>>>>
>>>> #5 (is_removing=0, fw_remove=0) -- firmware performing unplug
>>> Firmware does an unplug and writes to bit 3, thus clearing is_removing.
>>>
>>> On return from the firmware the guest evaluates the COST again.
>> it's optional and depends on OSPM implementation (some do not call it on success)
>>
>>
>>> And, eventually goes back to the CSCN where it processes more
>>> hotplug or unplug events.
>> CSCN in case of unplug finishes first, and only after that EJ0 calls
>> are processed
>>
>>>> The variation (is_removing=0, fw_remove=1) is invalid / unused.
>>>
>>> /nods
>>>>
>>>>
>>>> The firmware may be investigating the CPU register block between steps
>>>> #2 and #3 -- in other words, the firmware may see a CPU for which
>>>> is_remove is set (unplug requested via QMP), but the OS has not vacated
>>>> yet (fw_remove=0). In that case, the firmware must just skip the CPU --
>>>> once the OS is done, it will set fw_remove too, and raise another SMI.
>>> Yeah, it makes sense for the firmware to only care about a CPU once it
>>> sees fw_remove=1. (And as currently situated, the firmware would never
>>> see is_removing=1 at all.)
> 
> The firmware may well see is_removing=1, as the QMP device_del command
> may set that bit on some other CPU, asynchronously to the firmware's
> execution. The firmware needs to recognize if the "get pending" command
> returns a CPU because of this, and just continue scanning.
Right. Processing (for unplug) any pending CPUs which are not OSPM sanctioned
(so do not have fw_remove set) could be catastrophic for the guest and so
the unplug path should ignore them.

It is possible that there are CPUs with bits for both is_inserting and
is_removing. In that case QemuCpuhpCollectApicIds() would put them in the
PluggedApicIds array and the unplug eventually happens in the next
firmware invocation.

If a CPU has both is_inserting and fw_remove set, the firmware processes the
hotplug in that invocation and the unplug happens whenever the OSPM triggers
the firmware next.

Thanks
Ankur

> 
> Thanks
> Laszlo
> 

