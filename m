Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E53C2C68AE
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 16:25:32 +0100 (CET)
Received: from localhost ([::1]:36842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kifcp-0005tY-8H
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 10:25:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kif3L-000431-Sx
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 09:48:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kif3C-00040b-Pb
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 09:48:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606488519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q3W3O2TpCyo4+u8teoI8VuQd3xZJqjB8PhHrwEvaf1I=;
 b=cnloN1jsU91rtJf1/l2nAezjM7ehGjbGZ23z9DVKbciYkgVI0csFauRXdE7gVV1T3VttzW
 6L8lplWYNRoN1/MdgOwHH1pcCOYV4b42vmsEDk6HCB+Et11GiaWGIOjNri2fXzM3bkNYR7
 lUx4Ve17QJxT+JS6H9oAdmnMI/d2OqQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-5nnGi33zMNCSmhhkgTpOTw-1; Fri, 27 Nov 2020 09:48:37 -0500
X-MC-Unique: 5nnGi33zMNCSmhhkgTpOTw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F54C185E49C;
 Fri, 27 Nov 2020 14:48:36 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-74.ams2.redhat.com
 [10.36.112.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F78D60BF1;
 Fri, 27 Nov 2020 14:48:35 +0000 (UTC)
Subject: Re: [RFC] ich9:cpuhp: add support for cpu hot-unplug with SMI
 broadcast enabled
To: Igor Mammedov <imammedo@redhat.com>
References: <20201124122507.1014839-1-imammedo@redhat.com>
 <bf87cef4-cac9-1c1b-5bd4-c6bc97dff994@redhat.com>
 <20201126213807.3205f5db@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <cae2bede-1177-df14-07a6-dc3be75b7edd@redhat.com>
Date: Fri, 27 Nov 2020 15:48:34 +0100
MIME-Version: 1.0
In-Reply-To: <20201126213807.3205f5db@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, ankur.a.arora@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/26/20 21:38, Igor Mammedov wrote:
> On Thu, 26 Nov 2020 12:17:27 +0100
> Laszlo Ersek <lersek@redhat.com> wrote:
> 
>> On 11/24/20 13:25, Igor Mammedov wrote:

>>> diff --git a/docs/specs/acpi_cpu_hotplug.txt b/docs/specs/acpi_cpu_hotplug.txt
>>> index 9bb22d1270..f68ef6e06c 100644
>>> --- a/docs/specs/acpi_cpu_hotplug.txt
>>> +++ b/docs/specs/acpi_cpu_hotplug.txt
>>> @@ -57,7 +57,11 @@ read access:
>>>                It's valid only when bit 0 is set.
>>>             2: Device remove event, used to distinguish device for which
>>>                no device eject request to OSPM was issued.
>>> -           3-7: reserved and should be ignored by OSPM
>>> +           3: reserved and should be ignored by OSPM
>>> +           4: if set to 1, OSPM requests firmware to perform device eject,
>>> +              firmware shall clear this event by writing 1 into it before  
>>
>> (1) s/clear this event/clear this event bit/
>>
>>> +              performing device eject.  
>>
>> (2) move the second and third lines ("firmware shall clear....") over to
>> the write documentation, below? In particular:
>>
>>> +           5-7: reserved and should be ignored by OSPM
>>>      [0x5-0x7] reserved
>>>      [0x8] Command data: (DWORD access)
>>>            contains 0 unless value last stored in 'Command field' is one of:
>>> @@ -82,7 +86,10 @@ write access:
>>>                 selected CPU device
>>>              3: if set to 1 initiates device eject, set by OSPM when it
>>>                 triggers CPU device removal and calls _EJ0 method
>>> -            4-7: reserved, OSPM must clear them before writing to register
>>> +            4: if set to 1 OSPM hands over device eject to firmware,
>>> +               Firmware shall issue device eject request as described above
>>> +               (bit #3) and OSPM should not touch device eject bit (#3),  
>>
>> (3) it would be clearer if we documented the exact bit writing order
>> here:
>> - clear bit#4, *then* set bit#3 (two write accesses)
>> - versus clear bit#4 *and* set bit#3 (single access)
> 
> I was thinking that FW should not bother with clearing bit #4,
> and QEMU should clear it when handling write to bit #3.
> (it looks like I forgot to actually do that)

That should work fine too, as long as it's clearly documented.


>>> @@ -332,6 +335,7 @@ const VMStateDescription vmstate_cpu_hotplug = {
>>>  #define CPU_INSERT_EVENT  "CINS"
>>>  #define CPU_REMOVE_EVENT  "CRMV"
>>>  #define CPU_EJECT_EVENT   "CEJ0"
>>> +#define CPU_FW_EJECT_EVENT "CEJF"
>>>
>>>  void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>>>                      hwaddr io_base,
>>> @@ -384,7 +388,10 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>>>          aml_append(field, aml_named_field(CPU_REMOVE_EVENT, 1));
>>>          /* initiates device eject, write only */
>>>          aml_append(field, aml_named_field(CPU_EJECT_EVENT, 1));
>>> -        aml_append(field, aml_reserved_field(4));
>>> +        aml_append(field, aml_reserved_field(1));
>>> +        /* tell firmware to do device eject, write only */
>>> +        aml_append(field, aml_named_field(CPU_FW_EJECT_EVENT, 1));
>>> +        aml_append(field, aml_reserved_field(2));
>>>          aml_append(field, aml_named_field(CPU_COMMAND, 8));
>>>          aml_append(cpu_ctrl_dev, field);
>>>
>>> @@ -419,6 +426,7 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>>>          Aml *ins_evt = aml_name("%s.%s", cphp_res_path, CPU_INSERT_EVENT);
>>>          Aml *rm_evt = aml_name("%s.%s", cphp_res_path, CPU_REMOVE_EVENT);
>>>          Aml *ej_evt = aml_name("%s.%s", cphp_res_path, CPU_EJECT_EVENT);
>>> +        Aml *fw_ej_evt = aml_name("%s.%s", cphp_res_path, CPU_FW_EJECT_EVENT);
>>>
>>>          aml_append(cpus_dev, aml_name_decl("_HID", aml_string("ACPI0010")));
>>>          aml_append(cpus_dev, aml_name_decl("_CID", aml_eisaid("PNP0A05")));
>>> @@ -461,7 +469,13 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>>>
>>>              aml_append(method, aml_acquire(ctrl_lock, 0xFFFF));
>>>              aml_append(method, aml_store(idx, cpu_selector));
>>> -            aml_append(method, aml_store(one, ej_evt));
>>> +            if (opts.fw_unplugs_cpu) {
>>> +                aml_append(method, aml_store(one, fw_ej_evt));
>>> +                aml_append(method, aml_store(aml_int(OVMF_CPUHP_SMI_CMD),
>>> +                           aml_name("%s", opts.smi_path)));
>>> +            } else {
>>> +                aml_append(method, aml_store(one, ej_evt));
>>> +            }
>>>              aml_append(method, aml_release(ctrl_lock));
>>>          }
>>>          aml_append(cpus_dev, method);  
>>
>> Hmmm, OK, let me parse this.
>>
>> Assume there is a big bunch of device_del QMP commands, QEMU marks the
>> "remove" event pending on the corresponding set of CPUs, plus also makes
>> the ACPI interrupt pending. The ACPI interrupt handler in the OS runs,
>> and calls CSCN. CSCN runs a loop, and for each CPU where the remove
>> event is pending, notifies the OS one by one. The OS in turn forgets
>> about the subject CPU, and calls the _EJ0 method on the affected CPU
>> ACPI object. The _EJ0 method on the CPU ACPI object calls CEJ0, passing
>> in the affected CPU's identifier.
>>
>> The above hunk modifies the CEJ0 method.
>>
>> (5) Question: pre-patch, both the CSCN method and the CEJ0 method
>> acquire the CPLK lock, but CEJ0 is actually called within CSCN
>> (indirectly, with the OS's cooperation). Is CPLK a recursive lock?
> Theoretically scep supports recursive mutexes but I don't think it's the case here.
> 
> Considering it works currently, I think OS implements Notify event as async.
> hence no clash wrt mutex. If EJ0 were handled within CSCN context,
> EJ0 would mess cpu_selector value that CSCN is also using.

Ah indeed. Yes, making Notify pending at first, and then delivering it
inside the kernel only after the current AML call stack returns -- that
seems to make sense. Otherwise we could get unbounded recursion (the
notify handler calls another AML method, which could contain another
notify ...)


>> Anyway, let's see the CEJ0 modification. After the OS is done forgetting
>> about the CPU, the CEJ0 method no longer unplugs the CPU, instead it
>> sets the new bit#4 in the register block, and raises an SMI.
>>
>> (6) So that's one SMI per CPU being removed. Is that OK?
> 
> I guess it has performance penalty but there is nothing we can do about it,
> OSPM does EJ0 calls asynchronously.

OK. Hot-unplug is not a frequent operation.


>  
>> (7) What if there are asynchronous plugs going on, and the firmware
>> notices them in the register block? ... Hm, I hope that should be OK,
>> because ultimately the CSCN method will learn about those too, and
>> inform the OS. On plug, the firmware doesn't modify the register block.
> shouldn't be issue (modulo bugs, I haven't tried to hot add and hot remove
> the same CPU at the same time)
> 
> i.e. 
> (QEMU) pause
> (QEMU) device_add
> (QEMU) device_del
> (QEMU) cont
> 
>> Ah! OK. I think I understand why bit#4 is important. The firmware may
>> notice pending remove events, but it must not act upon them -- it must
>> simply ignore them -- unless bit#4 is also set. Bit#2 set with bit#4
>> clear means the event is pending (QEMU got a device_del), but the OS has
>> not forgotten about the CPU yet -- so the firmware must not unplug it
>> yet. When the modified CEJ0 method runs, it sets bit#4 in addition to
>> the already set bit#2, advertising that the OS has *already* abandoned
>> the CPU.
> firmware should ignore bit #2, it doesn't mean anything to it, OSPM might
> ignore or nonsupport CPU removal. What firmware must care about is bit #4,
> which tells it that OSPM is done with CPU and asks for to be removed by firmware.

Makes sense, especially in combination with the idea that clearing the
fw_remove bit should clear is_removing too.

The firmware logic needs to be aware of is_removing though, at least
understand the existence of this bit, as the "get pending" command will
report such CPUs too that only have is_removing set. Shouldn't be a
problem, we just have to recognize it.

[...]


Thanks!
Laszlo


