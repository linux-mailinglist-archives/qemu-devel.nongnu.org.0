Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F4E5F3A16
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 01:53:07 +0200 (CEST)
Received: from localhost ([::1]:38580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofVFB-0006dj-PD
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 19:53:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ofVD9-0004Xu-Ed
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 19:50:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ofVD5-0003w8-HM
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 19:50:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664841054;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j+PCAW68xDSEMXBBqeoLlNERcW/Wvsd+3G73+S4a72U=;
 b=XGtHBvfeBHv5s6fMTPTGWdIvw/MtXNanY972RftWmIsgVVP1iA0NcxIzTves9Vz57WvBDz
 GMdZ9P2hUnQ++4a3NMaeaD/fWDqbBBdkwE1AWXU5arH511/NkaoD+h5YlOhcioACJhsGYD
 RVTTbQ+8IbWUluxEcEncsXZhUiVOY0c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-259-DiRNQuk1PLmoaQfYXpz29Q-1; Mon, 03 Oct 2022 19:50:50 -0400
X-MC-Unique: DiRNQuk1PLmoaQfYXpz29Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FD3285A5A6;
 Mon,  3 Oct 2022 23:50:50 +0000 (UTC)
Received: from [10.64.54.56] (vpn2-54-56.bne.redhat.com [10.64.54.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EF3D1759E;
 Mon,  3 Oct 2022 23:50:46 +0000 (UTC)
Subject: Re: [PATCH v3 5/5] hw/arm/virt: Add 'highmem-compact' property
To: eric.auger@redhat.com, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, cohuck@redhat.com,
 zhenyzha@redhat.com, richard.henderson@linaro.org, peter.maydell@linaro.org,
 shan.gavin@gmail.com
References: <20220921231349.274049-1-gshan@redhat.com>
 <20220921231349.274049-6-gshan@redhat.com>
 <2e8ace49-b900-de7e-2d81-7bb6c081146e@redhat.com>
 <7656c827-58ce-85c2-87fe-e88206d6f022@redhat.com>
 <1d4040fe-fce8-76a5-bebe-1395db887c32@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <1e72f87f-46e0-fb63-b5c4-7da42f91d98e@redhat.com>
Date: Tue, 4 Oct 2022 07:50:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <1d4040fe-fce8-76a5-bebe-1395db887c32@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.467, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Reply-To: Gavin Shan <gshan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eric,

On 10/3/22 4:49 PM, Eric Auger wrote:
> On 9/29/22 01:49, Gavin Shan wrote:
>> On 9/28/22 10:22 PM, Eric Auger wrote:
>>> On 9/22/22 01:13, Gavin Shan wrote:
>>>> After the improvement to high memory region address assignment is
>>>> applied, the memory layout is changed. For example, VIRT_HIGH_PCIE_MMIO
>>> s/the memory layout is changed./the memory layout is changed,
>>> introducing possible migration breakage.
>>
>> Ok, much clearer.
>>
>>>> memory region is enabled when the improvement is applied, but it's
>>>> disabled if the improvement isn't applied.
>>>>
>>>>       pa_bits              = 40;
>>>>       vms->highmem_redists = false;
>>>>       vms->highmem_ecam    = false;
>>>>       vms->highmem_mmio    = true;
>>>>
>>>>       # qemu-system-aarch64 -accel kvm -cpu host \
>>>>         -machine virt-7.2 -m 4G,maxmem=511G      \
>>>>         -monitor stdio
>>>>
>>>> In order to keep backwords compatibility, we need to disable the
>>>> optimization on machines, which is virt-7.1 or ealier than it. It
>>>> means the optimization is enabled by default from virt-7.2. Besides,
>>>> 'highmem-compact' property is added so that the optimization can be
>>> I would rather rename the property into compact-highmem even if the vms
>>> field is name highmem_compact to align with other highmem fields
>>
>> Ok, but I would love to know why. Note that we already have
>> 'highmem=on|off'. 'highmem_compact=on|off' seems consistent
>> to me.
> To me the property name should rather sound 'english' with the adjective
> before the name 'high memory"' but I am not a native english speaker
> either.

Ok. I agree 'compact-highmem' is better. The backup variable name will
be still 'highmem_compact', which is consistent with the existing ones.

>>
>>>> explicitly enabled or disabled on all machine types by users.
>>>>
>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>> ---
>>>>    docs/system/arm/virt.rst |  4 ++++
>>>>    hw/arm/virt.c            | 33 +++++++++++++++++++++++++++++++++
>>>>    include/hw/arm/virt.h    |  2 ++
>>>>    3 files changed, 39 insertions(+)
>>>>
>>>> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
>>>> index 20442ea2c1..f05ec2253b 100644
>>>> --- a/docs/system/arm/virt.rst
>>>> +++ b/docs/system/arm/virt.rst
>>>> @@ -94,6 +94,10 @@ highmem
>>>>      address space above 32 bits. The default is ``on`` for machine
>>>> types
>>>>      later than ``virt-2.12``.
>>>>    +highmem-compact
>>>> +  Set ``on``/``off`` to enable/disable compact space for high
>>>> memory regions.
>>>> +  The default is ``on`` for machine types later than ``virt-7.2``
>>> I think you should document what is compact layout versus legacy one,
>>> both in the commit msg and maybe as a comment in a code along with the
>>> comment in hw/arm/virt.c starting with 'Highmem IO Regions: '
>>
>> Ok, I will add this into the commit log in v4. I don't think it's
>> necessary
>> to add duplicate comment in the code. People can check the commit log for
>> details if needed.
>>
>>>> +
>>>>    gic-version
>>>>      Specify the version of the Generic Interrupt Controller (GIC) to
>>>> provide.
>>>>      Valid values are:
>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>> index b702f8f2b5..a4fbdaef91 100644
>>>> --- a/hw/arm/virt.c
>>>> +++ b/hw/arm/virt.c
>>>> @@ -1734,6 +1734,13 @@ static void
>>>> virt_set_high_memmap(VirtMachineState *vms,
>>>>                base = region_base + region_size;
>>>>            } else {
>>>>                *region_enabled = false;
>>>> +
>>>> +            if (!vms->highmem_compact) {
>>> this snippet should be already present in previous patch otherwise this
>>> will break bisectability.
>>>
>>
>> Hmm, nice catch! I think I need to swap PATCH[4] and PATCH[5] in next
>> revision. In that order, 'compact-highmem' is introduced in PATCH[4],
>> but not used yet. PATCH[5] has the optimization and 'compact-highmem'
>> is used.
> No in general you introduce the property at the very end with the code
> guarded with an unset vms->highmem_compact in the previous patch.
> 

Yeah, what I need is define 'vms->highmem_compact' in PATCH[v3 4/5],
whose value is false. I also need to update @base and @vms->highest_gpa
on !vms->highmem_compact' in PATCH[v3 4/5].

>>
>>>> +                base = region_base + region_size;
>>>> +                if (fits) {
>>>> +                    vms->highest_gpa = region_base + region_size - 1;
>>>> +                }
>>>> +            }
>>>>            }
>>>>        }
>>>>    }
>>>> @@ -2348,6 +2355,20 @@ static void virt_set_highmem(Object *obj,
>>>> bool value, Error **errp)
>>>>        vms->highmem = value;
>>>>    }
>>>>    +static bool virt_get_highmem_compact(Object *obj, Error **errp)
>>>> +{
>>>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
>>>> +
>>>> +    return vms->highmem_compact;
>>>> +}
>>>> +
>>>> +static void virt_set_highmem_compact(Object *obj, bool value, Error
>>>> **errp)
>>>> +{
>>>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
>>>> +
>>>> +    vms->highmem_compact = value;
>>>> +}
>>>> +
>>>>    static bool virt_get_its(Object *obj, Error **errp)
>>>>    {
>>>>        VirtMachineState *vms = VIRT_MACHINE(obj);
>>>> @@ -2966,6 +2987,13 @@ static void
>>>> virt_machine_class_init(ObjectClass *oc, void *data)
>>>>                                              "Set on/off to
>>>> enable/disable using "
>>>>                                              "physical address space
>>>> above 32 bits");
>>>>    +    object_class_property_add_bool(oc, "highmem-compact",
>>>> +                                   virt_get_highmem_compact,
>>>> +                                   virt_set_highmem_compact);
>>>> +    object_class_property_set_description(oc, "highmem-compact",
>>>> +                                          "Set on/off to
>>>> enable/disable compact "
>>>> +                                          "space for high memory
>>>> regions");
>>>> +
>>>>        object_class_property_add_str(oc, "gic-version",
>>>> virt_get_gic_version,
>>>>                                      virt_set_gic_version);
>>>>        object_class_property_set_description(oc, "gic-version",
>>>> @@ -3050,6 +3078,7 @@ static void virt_instance_init(Object *obj)
>>>>          /* High memory is enabled by default */
>>>>        vms->highmem = true;
>>>> +    vms->highmem_compact = !vmc->no_highmem_compact;
>>>>        vms->gic_version = VIRT_GIC_VERSION_NOSEL;
>>>>          vms->highmem_ecam = !vmc->no_highmem_ecam;
>>>> @@ -3119,8 +3148,12 @@ DEFINE_VIRT_MACHINE_AS_LATEST(7, 2)
>>>>      static void virt_machine_7_1_options(MachineClass *mc)
>>>>    {
>>>> +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
>>>> +
>>>>        virt_machine_7_2_options(mc);
>>>>        compat_props_add(mc->compat_props, hw_compat_7_1,
>>>> hw_compat_7_1_len);
>>>> +    /* Compact space for high memory regions was introduced with
>>>> 7.2 */
>>>> +    vmc->no_highmem_compact = true;
>>>>    }
>>>>    DEFINE_VIRT_MACHINE(7, 1)
>>>>    diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>>>> index 6ec479ca2b..c7dd59d7f1 100644
>>>> --- a/include/hw/arm/virt.h
>>>> +++ b/include/hw/arm/virt.h
>>>> @@ -125,6 +125,7 @@ struct VirtMachineClass {
>>>>        bool no_pmu;
>>>>        bool claim_edge_triggered_timers;
>>>>        bool smbios_old_sys_ver;
>>>> +    bool no_highmem_compact;
>>>>        bool no_highmem_ecam;
>>>>        bool no_ged;   /* Machines < 4.2 have no support for ACPI GED
>>>> device */
>>>>        bool kvm_no_adjvtime;
>>>> @@ -144,6 +145,7 @@ struct VirtMachineState {
>>>>        PFlashCFI01 *flash[2];
>>>>        bool secure;
>>>>        bool highmem;
>>>> +    bool highmem_compact;
>>>>        bool highmem_ecam;
>>>>        bool highmem_mmio;
>>>>        bool highmem_redists;
>>>

Thanks,
Gavin


