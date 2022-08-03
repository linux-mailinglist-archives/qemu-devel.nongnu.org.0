Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9740588B14
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 13:24:45 +0200 (CEST)
Received: from localhost ([::1]:49742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJCUW-0002jL-AK
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 07:24:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oJCGm-0006OX-3P
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 07:10:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oJCGj-0004r7-Fj
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 07:10:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659525027;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e+jf4jFL2KAIa5FicXPrUIqYLG6AC8YKfm7CsOGYz7o=;
 b=AXFo1xwAD/t7SnEJx/HyMkiMwdztO9BQ706ZD5hezMfBocvQB+ILadyZ5zSSgLhLfZl23A
 jpA+CIJnTtzNy0CbKVNPSz/jXhkZP10aMkw6x7wag9uupYdPdKk66Q8hA+CFyK1VbQhQYR
 n8Ww0I9u++r8vHt0hn7E/TsmJckb2Iw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-350-7jpukTUOP9u6R2UVbFKIow-1; Wed, 03 Aug 2022 07:10:24 -0400
X-MC-Unique: 7jpukTUOP9u6R2UVbFKIow-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C6B28032F1;
 Wed,  3 Aug 2022 11:10:24 +0000 (UTC)
Received: from [10.64.54.20] (vpn2-54-20.bne.redhat.com [10.64.54.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F19A040C1288;
 Wed,  3 Aug 2022 11:10:20 +0000 (UTC)
Subject: Re: [PATCH 1/2] hw/arm/virt: Improve address assignment for highmem
 IO regions
To: eric.auger@redhat.com, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, cohuck@redhat.com, zhenyzha@redhat.com,
 shan.gavin@gmail.com, Marc Zyngier <maz@kernel.org>
References: <20220802064529.547361-1-gshan@redhat.com>
 <20220802064529.547361-2-gshan@redhat.com>
 <dcca0792-4f62-2cf0-9080-309d2e78e690@redhat.com>
 <9c8365c6-d27b-df76-371d-bd32ca2a26f7@redhat.com>
 <3db8b274-dfe6-7b68-0ef3-d72c3597dd10@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <5f0a1911-6802-8aa6-2a1d-83efef19aeb0@redhat.com>
Date: Wed, 3 Aug 2022 23:11:01 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <3db8b274-dfe6-7b68-0ef3-d72c3597dd10@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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

On 8/3/22 6:44 PM, Eric Auger wrote:
> On 8/3/22 05:01, Gavin Shan wrote:
>> On 8/2/22 7:41 PM, Eric Auger wrote:
>>> On 8/2/22 08:45, Gavin Shan wrote:
>>>> There are 3 highmem IO regions as below. They can be disabled in
>>>> two situations: (a) The specific region is disabled by user. (b)
>>>> The specific region doesn't fit in the PA space. However, the base
>>>> address and highest_gpa are still updated no matter if the region
>>>> is enabled or disabled. It's incorrectly incurring waste in the PA
>>>> space.
>>> If I am not wrong highmem_redists and highmem_mmio are not user
>>> selectable
>>>
>>> Only highmem ecam depends on machine type & ACPI setup. But I would say
>>> that in server use case it is always set. So is that optimization really
>>> needed?
>>
>> There are two other cases you missed.
>>
>> - highmem_ecam is enabled after virt-2.12, meaning it stays disabled
>>    before that.
> Yes that's what I meant above by 'depends on machine type'

Ok.

>>
>> - The high memory region can be disabled if user is asking large
>>    (normal) memory space through 'maxmem=' option. When the requested
>>    memory by 'maxmem=' is large enough, the high memory regions are
>>    disabled. It means the normal memory has higher priority than those
>>    high memory regions. This is the case I provided in (b) of the
>>    commit log.
> yes but in such a case you don't "waste" IPA as you mention in the
> commit log because you only ask for a VM dimensionned for the highest_gpa.
> The only case where you would "waste" IPA is for high ecam which can
> disabled by option combination but it is marginal.
> 

Ok, I've explain this to Marc in another reply. In short, we possibly
have below combination. the 'highmem_mmio' region isn't enabled as
we expect. The reason is 'highmem_rdist2' and 'highmem_ecam' consumes
1GB, which is unnecessary because both regions are disabled in advance.

Note: system memory starts from 1GB.

    qemu -m 4096M -maxmem=511G

    IPA_LIMIT  = (1UL << 40)
    vms->highmem_rdist2 = false              /* 64MB  */
    vms->highmem_ecam   = false              /* 256MB */
    vms->highmem_mmio   = true               /* 512GB */

>>
>> In the commit log, I was supposed to say something like below for
>> (a):
>>
>> - The specific high memory region can be disabled through changing
>>    the code by user or developer. For example, 'vms->highmem_mmio'
>>    is changed from true to false in virt_instance_init().
>>
>>>>
>>>> Improve address assignment for highmem IO regions to avoid the waste
>>>> in the PA space by putting the logic into virt_memmap_fits().
>>>>
>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>> ---
>>>>    hw/arm/virt.c | 54
>>>> +++++++++++++++++++++++++++++----------------------
>>>>    1 file changed, 31 insertions(+), 23 deletions(-)
>>>>
>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>> index 9633f822f3..bc0cd218f9 100644
>>>> --- a/hw/arm/virt.c
>>>> +++ b/hw/arm/virt.c
>>>> @@ -1688,6 +1688,34 @@ static uint64_t
>>>> virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>>>>        return arm_cpu_mp_affinity(idx, clustersz);
>>>>    }
>>>>    +static void virt_memmap_fits(VirtMachineState *vms, int index,
>>>> +                             bool *enabled, hwaddr *base, int pa_bits)
>>>> +{
>>>> +    hwaddr size = extended_memmap[index].size;
>>>> +
>>>> +    /* The region will be disabled if its size isn't given */
>>>> +    if (!*enabled || !size) {
>>> In which case do you have !size?
>>
>> Yeah, we don't have !size and the condition should be removed.
>>
>>>> +        *enabled = false;
>>>> +        vms->memmap[index].base = 0;
>>>> +        vms->memmap[index].size = 0;
>>> It looks dangerous to me to reset the region's base and size like that.
>>> for instance fdt_add_gic_node() will add dummy data in the dt.
>>
>> I would guess you missed that the high memory regions won't be exported
>> through device-tree if they have been disabled. We have a check there,
>> which is "if (nb_redist_regions == 1)"
> OK I missed a check was added in virt_gicv3_redist_region_count.
> Nevertheless, your comment "The region will be disabled if its size
> isn't given */ is not obvious to me. To me the region is disabled if the
> corresponding flag is not set. From your comment I have the impression
> the size is checked to see if the region is exposed, it does not look
> obvious.

Ok :)

>>
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    /*
>>>> +     * Check if the memory region fits in the PA space. The memory map
>>>> +     * and highest_gpa are updated if it fits. Otherwise, it's
>>>> disabled.
>>>> +     */
>>>> +    *enabled = (ROUND_UP(*base, size) + size <= BIT_ULL(pa_bits));
>>> using a 'fits' local variable would make the code more obvious I think
>>
>> Lets confirm if you're suggesting something like below?
>>
>>          bool fits;
>>
>>          fits = (ROUND_UP(*base, size) + size <= BIT_ULL(pa_bits));
>>
>>          if (fits) {
>>             /* update *base, memory mapping, highest_gpa */
>>          } else {
>>             *enabled = false;
>>          }
> yes that's what I suggested.

Yeah, it's more obvious. I would hold to post v2 to see if Marc will
have more comments.

>>
>> I guess we can simply do
>>
>>          if (ROUND_UP(*base, size) + size <= BIT_ULL(pa_bits)) {
>>             /* update *base, memory mapping, highest_gpa */
>>          } else {
>>             *enabled = false;
>>          }
>>
>> Please let me know which one looks best to you.
>>
>>>> +    if (*enabled) {
>>>> +        *base = ROUND_UP(*base, size);
>>>> +        vms->memmap[index].base = *base;
>>>> +        vms->memmap[index].size = size;
>>>> +        vms->highest_gpa = *base + size - 1;
>>>> +
>>>> +    *base = *base + size;
>>>> +    }
>>>> +}
>>>> +
>>>>    static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
>>>>    {
>>>>        MachineState *ms = MACHINE(vms);
>>>> @@ -1744,37 +1772,17 @@ static void virt_set_memmap(VirtMachineState
>>>> *vms, int pa_bits)
>>>>        vms->highest_gpa = memtop - 1;
>>>>          for (i = VIRT_LOWMEMMAP_LAST; i <
>>>> ARRAY_SIZE(extended_memmap); i++) {
>>>> -        hwaddr size = extended_memmap[i].size;
>>>> -        bool fits;
>>>> -
>>>> -        base = ROUND_UP(base, size);
>>>> -        vms->memmap[i].base = base;
>>>> -        vms->memmap[i].size = size;
>>>> -
>>>> -        /*
>>>> -         * Check each device to see if they fit in the PA space,
>>>> -         * moving highest_gpa as we go.
>>>> -         *
>>>> -         * For each device that doesn't fit, disable it.
>>>> -         */
>>>> -        fits = (base + size) <= BIT_ULL(pa_bits);
>>>> -        if (fits) {
>>>> -            vms->highest_gpa = base + size - 1;
>>>> -        }
>>>> -
>>>
>>> we could avoid running the code below in case highmem is not set. We
>>> would need to reset that flags though.
>>>
>>
>> Yeah, I think it's not a big deal. My though is to update the flag in
>> virt_memmap_fits().
>>
>>>>            switch (i) {
>>>>            case VIRT_HIGH_GIC_REDIST2:
>>>> -            vms->highmem_redists &= fits;
>>>> +            virt_memmap_fits(vms, i, &vms->highmem_redists, &base,
>>>> pa_bits);
>>>>                break;
>>>>            case VIRT_HIGH_PCIE_ECAM:
>>>> -            vms->highmem_ecam &= fits;
>>>> +            virt_memmap_fits(vms, i, &vms->highmem_ecam, &base,
>>>> pa_bits);
>>>>                break;
>>>>            case VIRT_HIGH_PCIE_MMIO:
>>>> -            vms->highmem_mmio &= fits;
>>>> +            virt_memmap_fits(vms, i, &vms->highmem_mmio, &base,
>>>> pa_bits);
>>>>                break;
>>>>            }
>>>> -
>>>> -        base += size;
>>>>        }
>>>>          if (device_memory_size > 0) {

Thanks,
Gavin


