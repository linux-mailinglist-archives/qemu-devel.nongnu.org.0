Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2344589572
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 02:50:52 +0200 (CEST)
Received: from localhost ([::1]:41830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJP4d-00012u-Jd
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 20:50:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oJP1K-0005xq-AR
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 20:47:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oJP1F-0005t1-Te
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 20:47:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659574040;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8S57YSyBEEWvVql50DhjQTih2V2QGK4uEoX0dju3YJ0=;
 b=RfHJ55CH4BpU8emVu7p9uNxUYOkCLh4zP2f5mUIrnvJATpZsv3kDmNG0tl+DQm2wA3jqRj
 APkhrO9TQqm7eWKXQMTppGvNejAC2mogQAFHoyc5J8Pnp4ZFNOuikbXHPLViWsGFTlcNW2
 if4xl1gmuWJg9GJZsDDQAVxrp7gQZUc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-TpVFkKj-P6i8-fbZx5W-fw-1; Wed, 03 Aug 2022 20:47:19 -0400
X-MC-Unique: TpVFkKj-P6i8-fbZx5W-fw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0F27811E75;
 Thu,  4 Aug 2022 00:47:18 +0000 (UTC)
Received: from [10.64.54.20] (vpn2-54-20.bne.redhat.com [10.64.54.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 805812026D4C;
 Thu,  4 Aug 2022 00:47:15 +0000 (UTC)
Subject: Re: [PATCH 1/2] hw/arm/virt: Improve address assignment for highmem
 IO regions
To: eric.auger@redhat.com, Marc Zyngier <maz@kernel.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, cohuck@redhat.com, zhenyzha@redhat.com,
 shan.gavin@gmail.com
References: <20220802064529.547361-1-gshan@redhat.com>
 <20220802064529.547361-2-gshan@redhat.com>
 <dcca0792-4f62-2cf0-9080-309d2e78e690@redhat.com>
 <9c8365c6-d27b-df76-371d-bd32ca2a26f7@redhat.com>
 <87tu6tbyk9.wl-maz@kernel.org>
 <0ed2ebc7-8d6e-7555-3af4-31eb071a584b@redhat.com>
 <bf8fd91c-2bac-35b4-1d17-78ba582760f0@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <4c0e49f5-a7cc-9742-d473-e8453ab1c3e6@redhat.com>
Date: Thu, 4 Aug 2022 12:47:55 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <bf8fd91c-2bac-35b4-1d17-78ba582760f0@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/3/22 10:52 PM, Eric Auger wrote:
> On 8/3/22 15:02, Gavin Shan wrote:
>> On 8/3/22 5:01 PM, Marc Zyngier wrote:
>>> On Wed, 03 Aug 2022 04:01:04 +0100,
>>> Gavin Shan <gshan@redhat.com> wrote:
>>>> On 8/2/22 7:41 PM, Eric Auger wrote:
>>>>> On 8/2/22 08:45, Gavin Shan wrote:
>>>>>> There are 3 highmem IO regions as below. They can be disabled in
>>>>>> two situations: (a) The specific region is disabled by user. (b)
>>>>>> The specific region doesn't fit in the PA space. However, the base
>>>>>> address and highest_gpa are still updated no matter if the region
>>>>>> is enabled or disabled. It's incorrectly incurring waste in the PA
>>>>>> space.
>>>>> If I am not wrong highmem_redists and highmem_mmio are not user
>>>>> selectable
>>>>>
>>>>> Only highmem ecam depends on machine type & ACPI setup. But I would
>>>>> say
>>>>> that in server use case it is always set. So is that optimization
>>>>> really
>>>>> needed?
>>>>
>>>> There are two other cases you missed.
>>>>
>>>> - highmem_ecam is enabled after virt-2.12, meaning it stays disabled
>>>>     before that.
>>>
>>> I don't get this. The current behaviour is to disable highmem_ecam if
>>> it doesn't fit in the PA space. I can't see anything that enables it
>>> if it was disabled the first place.
>>>
>>
>> There are several places or conditions where vms->highmem_ecam can be
>> disabled:
>>
>> - virt_instance_init() where vms->highmem_ecam is inherited from
>>    !vmc->no_highmem_ecam. The option is set to true after virt-2.12
>>    in virt_machine_2_12_options().
>>
>> - machvirt_init() where vms->highmem_ecam can be disable if we have
>>    32-bits vCPUs and failure on loading firmware.
>>
>> - Another place is where we're talking about. It's address assignment
>>    to fit the PA space.
>>
>>>>
>>>> - The high memory region can be disabled if user is asking large
>>>>     (normal) memory space through 'maxmem=' option. When the requested
>>>>     memory by 'maxmem=' is large enough, the high memory regions are
>>>>     disabled. It means the normal memory has higher priority than those
>>>>     high memory regions. This is the case I provided in (b) of the
>>>>     commit log.
>>>
>>> Why is that a problem? It matches the expected behaviour, as the
>>> highmem IO region is floating and is pushed up by the memory region.
>>>
>>
>> Eric thought that VIRT_HIGH_GIC_REDIST2 and VIRT_HIGH_PCIE_MMIO regions
>> aren't user selectable. I tended to explain why it's not true. 'maxmem='
>> can affect the outcome. When 'maxmem=' value is big enough, there will be
>> no free area in the PA space to hold those two regions.
>>
>>>>
>>>> In the commit log, I was supposed to say something like below for
>>>> (a):
>>>>
>>>> - The specific high memory region can be disabled through changing
>>>>     the code by user or developer. For example, 'vms->highmem_mmio'
>>>>     is changed from true to false in virt_instance_init().
>>>
>>> Huh. By this principle, the user can change anything. Why is it
>>> important?
>>>
>>
>> Still like above. I was explaining the possible cases where those
>> 3 switches can be turned on/off by users or developers. Our code
>> needs to be consistent and comprehensive.
>>
>>    vms->highmem_redists
>>    vms->highmem_ecam
>>    vms->mmio
>>
>>>>
>>>>>>
>>>>>> Improve address assignment for highmem IO regions to avoid the waste
>>>>>> in the PA space by putting the logic into virt_memmap_fits().
>>>
>>> I guess that this is what I understand the least. What do you mean by
>>> "wasted PA space"? Either the regions fit in the PA space, and
>>> computing their addresses in relevant, or they fall outside of it and
>>> what we stick in memap[index].base is completely irrelevant.
>>>
>>
>> It's possible that we run into the following combination. we should
>> have enough PA space to enable VIRT_HIGH_PCIE_MMIO region. However,
>> the region is disabled in the original implementation because
>> VIRT_HIGH_{GIC_REDIST2, PCIE_ECAM} regions consumed 1GB, which is
>> unecessary and waste in the PA space.
> each region's base is aligned on its size.

Yes.

>>
>>      static MemMapEntry extended_memmap[] = {
>>          [VIRT_HIGH_GIC_REDIST2] =   { 0x0, 64 * MiB },
>>          [VIRT_HIGH_PCIE_ECAM] =     { 0x0, 256 * MiB },
>>          [VIRT_HIGH_PCIE_MMIO] =     { 0x0, 512 * GiB },
> so anyway MMIO is at least at 512GB. Having a 1TB IPA space does not
> imply any amount of RAM. This depends on the address space.
> I    };

Yes. Prior to the start of system memory, there is 1GB used by
various regions either.

>>
>>      IPA_LIMIT           = (1UL << 40)
>>      '-maxmem'           = 511GB              /* Memory starts from 1GB */
>>      '-slots'            = 0
>>      vms->highmem_rdist2 = false
> How can this happen? the only reason for highmem_redists to be reset is
> if it does not fit into map_ipa. So if mmio fits, highmem_redists does
> too. What do I miss?

The example is having "vms->highmem_rdist2 = flase" BEFORE the address
assignment, it's possible that developer changes the code to disable
it intentionally. The point is the original implementation isn't comprehensive
because it has the wrong assumption that vms->highmem_{rdist2, ecam, mmio} all
true before the address assignment. With the wrong assumption, the base address
is always increased, even the previous region is disabled, during the
address assignment in virt_set_memmap().


>>      vms->highmem_ecam   = false
>      vms->highmem_mmio   = true
> I am still skeptic about the relevance of such optim. Isn't it sensible
> to expect the host to support large IPA if you want to use such amount
> of memory.
> I think we should rather better document the memory map from a user
> point of view.
> Besides if you change the memory map, you need to introduce yet another
> option to avoid breaking migration, no?
> 

These 3 high memory regions consumes 513GB with alignment considered when
all of them are enabled. The point is those 3 high memory regions, or part
of them can be squeezed or smashed to accommodate '-maxmem' by design. I
think there are two options I can think of. I personally prefer to keep
the capability. With this, users gain broader range for their '-maxmem'.
Please let me know your preference.

- Revert the capability of squeezing or smashing those high memory regions
   to accommodate '-maxmem'. It means vms->high_{redist2, ecam, mmio} can't
   be disable on conflicts to the PA space.

- Keep the capability, with this optimization applied to make the implementation
   comprehensive.

I think it's worthy to add something about this limitation in doc/system/arm/virt.rst.

I don't think I need introduce another option to avoid migration breakage.
Could you explain why I need the extra option?

>>
>>>>>>
>>>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>>>> ---
>>>>>>     hw/arm/virt.c | 54
>>>>>> +++++++++++++++++++++++++++++----------------------
>>>>>>     1 file changed, 31 insertions(+), 23 deletions(-)
>>>>>>
>>>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>>>> index 9633f822f3..bc0cd218f9 100644
>>>>>> --- a/hw/arm/virt.c
>>>>>> +++ b/hw/arm/virt.c
>>>>>> @@ -1688,6 +1688,34 @@ static uint64_t
>>>>>> virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>>>>>>         return arm_cpu_mp_affinity(idx, clustersz);
>>>>>>     }
>>>>>>     +static void virt_memmap_fits(VirtMachineState *vms, int index,
>>>>>> +                             bool *enabled, hwaddr *base, int
>>>>>> pa_bits)
>>>>>> +{
>>>>>> +    hwaddr size = extended_memmap[index].size;
>>>>>> +
>>>>>> +    /* The region will be disabled if its size isn't given */
>>>>>> +    if (!*enabled || !size) {
>>>>> In which case do you have !size?
>>>>
>>>> Yeah, we don't have !size and the condition should be removed.
>>>>
>>>>>> +        *enabled = false;
>>>>>> +        vms->memmap[index].base = 0;
>>>>>> +        vms->memmap[index].size = 0;
>>>>> It looks dangerous to me to reset the region's base and size like
>>>>> that.
>>>>> for instance fdt_add_gic_node() will add dummy data in the dt.
>>>>
>>>> I would guess you missed that the high memory regions won't be exported
>>>> through device-tree if they have been disabled. We have a check there,
>>>> which is "if (nb_redist_regions == 1)"
>>>>
>>>>>> +        return;
>>>>>> +    }
>>>>>> +
>>>>>> +    /*
>>>>>> +     * Check if the memory region fits in the PA space. The
>>>>>> memory map
>>>>>> +     * and highest_gpa are updated if it fits. Otherwise, it's
>>>>>> disabled.
>>>>>> +     */
>>>>>> +    *enabled = (ROUND_UP(*base, size) + size <= BIT_ULL(pa_bits));
>>>>> using a 'fits' local variable would make the code more obvious I think
>>>>
>>>> Lets confirm if you're suggesting something like below?
>>>>
>>>>           bool fits;
>>>>
>>>>           fits = (ROUND_UP(*base, size) + size <= BIT_ULL(pa_bits));
>>>>
>>>>           if (fits) {
>>>>              /* update *base, memory mapping, highest_gpa */
>>>>           } else {
>>>>              *enabled = false;
>>>>           }
>>>>
>>>> I guess we can simply do
>>>>
>>>>           if (ROUND_UP(*base, size) + size <= BIT_ULL(pa_bits)) {
>>>>              /* update *base, memory mapping, highest_gpa */
>>>>           } else {
>>>>              *enabled = false;
>>>>           }
>>>>
>>>> Please let me know which one looks best to you.
>>>
>>> Why should the 'enabled' flag be updated by this function, instead of
>>> returning the value and keeping it as an assignment in the caller
>>> function? It is purely stylistic though.
>>>
>>
>> The idea to put the logic, address assignment for those 3 high memory
>> regions or updating the flags (vms->high_redist2/ecam/mmio), to the
>> newly introduced function, to make virt_set_memmap() a bit simplified.
>> Eric tends to agree the changes with minor adjustments. So I'm going
>> to keep it as of being, which doesn't mean the stylistic thought is
>> a bad one :)
>>
>> Lastly, I need to rewrite the comit log completely because it seems
>> causing confusions to Eric and you.
>>

Thanks,
Gavin


